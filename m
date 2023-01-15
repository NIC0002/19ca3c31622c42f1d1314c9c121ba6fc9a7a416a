Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA6DC3DA78
	for <git@archiver.kernel.org>; Sun, 15 Jan 2023 20:12:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231487AbjAOUMR (ORCPT <rfc822;git@archiver.kernel.org>);
        Sun, 15 Jan 2023 15:12:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbjAOUMP (ORCPT <rfc822;git@vger.kernel.org>);
        Sun, 15 Jan 2023 15:12:15 -0500
Received: from cloud.peff.net (cloud.peff.net [104.130.231.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0626F8A57
        for <git@vger.kernel.org>; Sun, 15 Jan 2023 12:12:14 -0800 (PST)
Received: (qmail 8594 invoked by uid 109); 15 Jan 2023 20:12:14 -0000
Received: from Unknown (HELO peff.net) (10.0.1.2)
 by cloud.peff.net (qpsmtpd/0.94) with ESMTP; Sun, 15 Jan 2023 20:12:14 +0000
Authentication-Results: cloud.peff.net; auth=none
Received: (qmail 23531 invoked by uid 111); 15 Jan 2023 20:12:15 -0000
Received: from coredump.intra.peff.net (HELO sigill.intra.peff.net) (10.0.0.2)
 by peff.net (qpsmtpd/0.94) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPS; Sun, 15 Jan 2023 15:12:15 -0500
Authentication-Results: peff.net; auth=none
Date:   Sun, 15 Jan 2023 15:12:13 -0500
From:   Jeff King <peff@peff.net>
To:     Junio C Hamano <gitster@pobox.com>
Cc:     git@vger.kernel.org, Ramsay Jones <ramsay@ramsayjones.plus.com>
Subject: [PATCH 3/3] http: support CURLOPT_PROTOCOLS_STR
Message-ID: <Y8ReHbGWetJHQcI1@coredump.intra.peff.net>
References: <Y8RddcM9Vr71ljp4@coredump.intra.peff.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y8RddcM9Vr71ljp4@coredump.intra.peff.net>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

The CURLOPT_PROTOCOLS (and matching CURLOPT_REDIR_PROTOCOLS) flag was
deprecated in curl 7.85.0, and using it generate compiler warnings as of
curl 7.87.0. The path forward is to use CURLOPT_PROTOCOLS_STR, but we
can't just do so unilaterally, as it was only introduced less than a
year ago in 7.85.0.

Until that version becomes ubiquitous, we have to either disable the
deprecation warning or conditionally use the "STR" variant on newer
versions of libcurl. This patch switches to the new variant, which is
nice for two reasons:

  - we don't have to worry that silencing curl's deprecation warnings
    might cause us to miss other more useful ones

  - we'd eventually want to move to the new variant anyway, so this gets
    us set up (albeit with some extra ugly boilerplate for the
    conditional)

There are a lot of ways to split up the two cases. One way would be to
abstract the storage type (strbuf versus a long), how to append
(strbuf_addstr vs bitwise OR), how to initialize, which CURLOPT to use,
and so on. But the resulting code looks pretty magical:

  GIT_CURL_PROTOCOL_TYPE allowed = GIT_CURL_PROTOCOL_TYPE_INIT;
  if (...http is allowed...)
	GIT_CURL_PROTOCOL_APPEND(&allowed, "http", CURLOPT_HTTP);

and you end up with more "#define GIT_CURL_PROTOCOL_TYPE" macros than
actual code.

On the other end of the spectrum, we could just implement two separate
functions, one that handles a string list and one that handles bits. But
then we end up repeating our list of protocols (http, https, ftp, ftp).

This patch takes the middle ground. The run-time code is always there to
handle both types, and we just choose which one to feed to curl.

Signed-off-by: Jeff King <peff@peff.net>
---
 git-curl-compat.h |  8 ++++++++
 http.c            | 41 ++++++++++++++++++++++++++++++++++-------
 2 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/git-curl-compat.h b/git-curl-compat.h
index 56a83b6bbd..fd96b3cdff 100644
--- a/git-curl-compat.h
+++ b/git-curl-compat.h
@@ -126,4 +126,12 @@
 #define GIT_CURL_HAVE_CURLSSLSET_NO_BACKENDS
 #endif
 
+/**
+ * CURLOPT_PROTOCOLS_STR and CURLOPT_REDIR_PROTOCOLS_STR were added in 7.85.0,
+ * released in August 2022.
+ */
+#if LIBCURL_VERSION_NUM >= 0x075500
+#define GIT_CURL_HAVE_CURLOPT_PROTOCOLS_STR 1
+#endif
+
 #endif
diff --git a/http.c b/http.c
index ca0fe80ddb..e529ebc993 100644
--- a/http.c
+++ b/http.c
@@ -764,18 +764,29 @@ void setup_curl_trace(CURL *handle)
 	curl_easy_setopt(handle, CURLOPT_DEBUGDATA, NULL);
 }
 
-static long get_curl_allowed_protocols(int from_user)
+static void proto_list_append(struct strbuf *list_str, const char *proto_str,
+			      long *list_bits, long proto_bits)
+{
+	*list_bits |= proto_bits;
+	if (list_str) {
+		if (list_str->len)
+			strbuf_addch(list_str, ',');
+		strbuf_addstr(list_str, proto_str);
+	}
+}
+
+static long get_curl_allowed_protocols(int from_user, struct strbuf *list)
 {
 	long allowed_protocols = 0;
 
 	if (is_transport_allowed("http", from_user))
-		allowed_protocols |= CURLPROTO_HTTP;
+		proto_list_append(list, "http", &allowed_protocols, CURLPROTO_HTTP);
 	if (is_transport_allowed("https", from_user))
-		allowed_protocols |= CURLPROTO_HTTPS;
+		proto_list_append(list, "https", &allowed_protocols, CURLPROTO_HTTPS);
 	if (is_transport_allowed("ftp", from_user))
-		allowed_protocols |= CURLPROTO_FTP;
+		proto_list_append(list, "ftp", &allowed_protocols, CURLPROTO_FTP);
 	if (is_transport_allowed("ftps", from_user))
-		allowed_protocols |= CURLPROTO_FTPS;
+		proto_list_append(list, "ftps", &allowed_protocols, CURLPROTO_FTPS);
 
 	return allowed_protocols;
 }
@@ -921,10 +932,26 @@ static CURL *get_curl_handle(void)
 
 	curl_easy_setopt(result, CURLOPT_MAXREDIRS, 20);
 	curl_easy_setopt(result, CURLOPT_POSTREDIR, CURL_REDIR_POST_ALL);
+
+#ifdef GIT_CURL_HAVE_CURLOPT_PROTOCOLS_STR
+	{
+		struct strbuf buf = STRBUF_INIT;
+
+		get_curl_allowed_protocols(0, &buf);
+		curl_easy_setopt(result, CURLOPT_REDIR_PROTOCOLS_STR, buf.buf);
+		strbuf_reset(&buf);
+
+		get_curl_allowed_protocols(-1, &buf);
+		curl_easy_setopt(result, CURLOPT_PROTOCOLS_STR, buf.buf);
+		strbuf_release(&buf);
+	}
+#else
 	curl_easy_setopt(result, CURLOPT_REDIR_PROTOCOLS,
-			 get_curl_allowed_protocols(0));
+			 get_curl_allowed_protocols(0, NULL));
 	curl_easy_setopt(result, CURLOPT_PROTOCOLS,
-			 get_curl_allowed_protocols(-1));
+			 get_curl_allowed_protocols(-1, NULL));
+#endif
+
 	if (getenv("GIT_CURL_VERBOSE"))
 		http_trace_curl_no_data();
 	setup_curl_trace(result);
-- 
2.39.0.513.g00e40dbe01
