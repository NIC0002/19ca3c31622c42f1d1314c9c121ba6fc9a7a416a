Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC813C46467
	for <git@archiver.kernel.org>; Tue, 17 Jan 2023 03:04:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235236AbjAQDEm (ORCPT <rfc822;git@archiver.kernel.org>);
        Mon, 16 Jan 2023 22:04:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235245AbjAQDEk (ORCPT <rfc822;git@vger.kernel.org>);
        Mon, 16 Jan 2023 22:04:40 -0500
Received: from cloud.peff.net (cloud.peff.net [104.130.231.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80CEC65A0
        for <git@vger.kernel.org>; Mon, 16 Jan 2023 19:04:39 -0800 (PST)
Received: (qmail 19225 invoked by uid 109); 17 Jan 2023 03:04:39 -0000
Received: from Unknown (HELO peff.net) (10.0.1.2)
 by cloud.peff.net (qpsmtpd/0.94) with ESMTP; Tue, 17 Jan 2023 03:04:39 +0000
Authentication-Results: cloud.peff.net; auth=none
Received: (qmail 3854 invoked by uid 111); 17 Jan 2023 03:04:41 -0000
Received: from coredump.intra.peff.net (HELO sigill.intra.peff.net) (10.0.0.2)
 by peff.net (qpsmtpd/0.94) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPS; Mon, 16 Jan 2023 22:04:41 -0500
Authentication-Results: peff.net; auth=none
Date:   Mon, 16 Jan 2023 22:04:38 -0500
From:   Jeff King <peff@peff.net>
To:     Junio C Hamano <gitster@pobox.com>
Cc:     =?utf-8?B?w4Z2YXIgQXJuZmrDtnLDsA==?= Bjarmason <avarab@gmail.com>,
        git@vger.kernel.org, Ramsay Jones <ramsay@ramsayjones.plus.com>
Subject: [PATCH v2 1/3] http-push: prefer CURLOPT_UPLOAD to CURLOPT_PUT
Message-ID: <Y8YQRst89JywLbL4@coredump.intra.peff.net>
References: <Y8YP+R/hyNr6sEFA@coredump.intra.peff.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y8YP+R/hyNr6sEFA@coredump.intra.peff.net>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

The two options do exactly the same thing, but the latter has been
deprecated and in recent versions of curl may produce a compiler
warning. Since the UPLOAD form is available everywhere (it was
introduced in the year 2000 by curl 7.1), we can just switch to it.

Signed-off-by: Jeff King <peff@peff.net>
---
 http-push.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/http-push.c b/http-push.c
index 5f4340a36e..1b18e775d0 100644
--- a/http-push.c
+++ b/http-push.c
@@ -198,7 +198,7 @@ static void curl_setup_http(CURL *curl, const char *url,
 		const char *custom_req, struct buffer *buffer,
 		curl_write_callback write_fn)
 {
-	curl_easy_setopt(curl, CURLOPT_PUT, 1);
+	curl_easy_setopt(curl, CURLOPT_UPLOAD, 1);
 	curl_easy_setopt(curl, CURLOPT_URL, url);
 	curl_easy_setopt(curl, CURLOPT_INFILE, buffer);
 	curl_easy_setopt(curl, CURLOPT_INFILESIZE, buffer->buf.len);
-- 
2.39.0.513.g00e40dbe01

