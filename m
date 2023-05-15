Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FA6C77B7D
	for <git@archiver.kernel.org>; Mon, 15 May 2023 19:24:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245091AbjEOTYh (ORCPT <rfc822;git@archiver.kernel.org>);
        Mon, 15 May 2023 15:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245175AbjEOTYO (ORCPT <rfc822;git@vger.kernel.org>);
        Mon, 15 May 2023 15:24:14 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6131B16405
        for <git@vger.kernel.org>; Mon, 15 May 2023 12:23:47 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-56186035b61so842557b3.3
        for <git@vger.kernel.org>; Mon, 15 May 2023 12:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ttaylorr-com.20221208.gappssmtp.com; s=20221208; t=1684178626; x=1686770626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ffUDsnLL4vECbx2kK2WEeblCLG55QfI/7WjKVedyswM=;
        b=m5uqAwR0BBKhSd0LXNnh0Onl4AdKVegx+/uPPQ0v5ATu0MdUKPn/PalmgRsq9A/WRS
         3jGxrvHuYYTcWKVPci41CXBfWDsAv0z+S3ipe1xP52vEe02+Dgk9g26p0eY+9d1fONh3
         wDJdZ4098izb029h+Pa5RaMtabPdfRpJuQzwkPhBTelgqMVRFNJIaAJuaxRy0e92itPQ
         LKcH364NQFMCw6V4gDr53WhTLocMDCSBTRfjUvvRs0dN0+WLi4FXd+ZvuPnSjxuIt8oP
         zlTde9g/LUT5+kqmV+lnIg25nUqPCCGaa9Ll9N1855q4HSjQNNwSQzJsym8UpJ6iLMDV
         zQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684178626; x=1686770626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffUDsnLL4vECbx2kK2WEeblCLG55QfI/7WjKVedyswM=;
        b=FoyOahIWs1K23TZTjROUkHR8Sj9JwuO8v+QBupMVnFTB5GUK3DfGe4m4tMLTBNUZI6
         aUEnCejeTwQ4Pu2zMaUw0dTnVxivl1HYlZoc7UAV9kTBk9VEmktd57TOg7AMxPMNP6yw
         3tfVZK6qU/+iKa48dgT7E1nt2IMyq4tOCT0NUvwntmP0dIImNhYy9GHHFiDG58/WdwdG
         5BU8Nc2rtknHw2yn9/evmhRkxTi1SdZdk6Y+/IEHfmgAPt+pgn6nnro4fDWrbz3qFvoB
         1o5r9yIZCprHOJdZxNocrxaKq/5WYOrtpUUwuJWbXx4slku/OtzoLVFzCSKcdmLOnXAr
         GfKA==
X-Gm-Message-State: AC+VfDzloP+IE7OGo/yRrWd7WO2CevarslwV2CFzUGAX/QxWSTet++GY
        PlDOKOsZEu18GFzQUENuCuIxDB/7CneyPseSNAj6tA==
X-Google-Smtp-Source: ACHHUZ7xFpcSrfv3q/5H9HQUolcgloqJhsuSt+KcYRPhrmDKdqxNnDTpnjsljWP0SYdkO8dtN5H64Q==
X-Received: by 2002:a0d:d9c7:0:b0:55b:4942:c86b with SMTP id b190-20020a0dd9c7000000b0055b4942c86bmr31746215ywe.42.1684178626416;
        Mon, 15 May 2023 12:23:46 -0700 (PDT)
Received: from localhost (104-178-186-189.lightspeed.milwwi.sbcglobal.net. [104.178.186.189])
        by smtp.gmail.com with ESMTPSA id p205-20020a8174d6000000b0055ddea0db57sm3460ywc.146.2023.05.15.12.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 12:23:46 -0700 (PDT)
Date:   Mon, 15 May 2023 15:23:45 -0400
From:   Taylor Blau <me@ttaylorr.com>
To:     git@vger.kernel.org
Cc:     Chris Torek <chris.torek@gmail.com>,
        Derrick Stolee <derrickstolee@github.com>,
        Jeff King <peff@peff.net>, Junio C Hamano <gitster@pobox.com>,
        Patrick Steinhardt <ps@pks.im>
Subject: [PATCH v2 13/16] refs.h: let `for_each_namespaced_ref()` take
 excluded patterns
Message-ID: <50e7df7dc0932a53682664a6334791d8f1ff31bb.1684178576.git.me@ttaylorr.com>
References: <cover.1683581621.git.me@ttaylorr.com>
 <cover.1684178576.git.me@ttaylorr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1684178576.git.me@ttaylorr.com>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

The following commit will want to call `for_each_namespaced_ref()` with
a list of excluded patterns.

We could introduce a variant of that function, say,
`for_each_namespaced_ref_exclude()` which takes the extra parameter, and
reimplement the original function in terms of that. But all but one
caller (in `http-backend.c`) will supply the new parameter, so add the
new parameter to `for_each_namespaced_ref()` itself instead of
introducing a new function.

For now, supply NULL for the list of excluded patterns at all callers to
avoid changing behavior, which we will do in the subsequent commit.

Signed-off-by: Taylor Blau <me@ttaylorr.com>
---
 http-backend.c | 2 +-
 refs.c         | 5 +++--
 refs.h         | 3 ++-
 upload-pack.c  | 6 +++---
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/http-backend.c b/http-backend.c
index ac146d85c5..ad500683c8 100644
--- a/http-backend.c
+++ b/http-backend.c
@@ -559,7 +559,7 @@ static void get_info_refs(struct strbuf *hdr, char *arg UNUSED)
 
 	} else {
 		select_getanyfile(hdr);
-		for_each_namespaced_ref(show_text_ref, &buf);
+		for_each_namespaced_ref(NULL, show_text_ref, &buf);
 		send_strbuf(hdr, "text/plain", &buf);
 	}
 	strbuf_release(&buf);
diff --git a/refs.c b/refs.c
index ec4d5b9101..95a7db9563 100644
--- a/refs.c
+++ b/refs.c
@@ -1660,13 +1660,14 @@ int for_each_replace_ref(struct repository *r, each_repo_ref_fn fn, void *cb_dat
 				    DO_FOR_EACH_INCLUDE_BROKEN, cb_data);
 }
 
-int for_each_namespaced_ref(each_ref_fn fn, void *cb_data)
+int for_each_namespaced_ref(const char **exclude_patterns,
+			    each_ref_fn fn, void *cb_data)
 {
 	struct strbuf buf = STRBUF_INIT;
 	int ret;
 	strbuf_addf(&buf, "%srefs/", get_git_namespace());
 	ret = do_for_each_ref(get_main_ref_store(the_repository),
-			      buf.buf, NULL, fn, 0, 0, cb_data);
+			      buf.buf, exclude_patterns, fn, 0, 0, cb_data);
 	strbuf_release(&buf);
 	return ret;
 }
diff --git a/refs.h b/refs.h
index a7751a1fc9..f23626beca 100644
--- a/refs.h
+++ b/refs.h
@@ -372,7 +372,8 @@ int for_each_glob_ref_in(each_ref_fn fn, const char *pattern,
 			 const char *prefix, void *cb_data);
 
 int head_ref_namespaced(each_ref_fn fn, void *cb_data);
-int for_each_namespaced_ref(each_ref_fn fn, void *cb_data);
+int for_each_namespaced_ref(const char **exclude_patterns,
+			    each_ref_fn fn, void *cb_data);
 
 /* can be used to learn about broken ref and symref */
 int refs_for_each_rawref(struct ref_store *refs, each_ref_fn fn, void *cb_data);
diff --git a/upload-pack.c b/upload-pack.c
index d77d58bdde..7c646ea5bd 100644
--- a/upload-pack.c
+++ b/upload-pack.c
@@ -854,7 +854,7 @@ static void deepen(struct upload_pack_data *data, int depth)
 		 * marked with OUR_REF.
 		 */
 		head_ref_namespaced(check_ref, data);
-		for_each_namespaced_ref(check_ref, data);
+		for_each_namespaced_ref(NULL, check_ref, data);
 
 		get_reachable_list(data, &reachable_shallows);
 		result = get_shallow_commits(&reachable_shallows,
@@ -1378,7 +1378,7 @@ void upload_pack(const int advertise_refs, const int stateless_rpc,
 		if (advertise_refs)
 			data.no_done = 1;
 		head_ref_namespaced(send_ref, &data);
-		for_each_namespaced_ref(send_ref, &data);
+		for_each_namespaced_ref(NULL, send_ref, &data);
 		/*
 		 * fflush stdout before calling advertise_shallow_grafts because send_ref
 		 * uses stdio.
@@ -1388,7 +1388,7 @@ void upload_pack(const int advertise_refs, const int stateless_rpc,
 		packet_flush(1);
 	} else {
 		head_ref_namespaced(check_ref, &data);
-		for_each_namespaced_ref(check_ref, &data);
+		for_each_namespaced_ref(NULL, check_ref, &data);
 	}
 
 	if (!advertise_refs) {
-- 
2.40.1.572.g5c4ab523ef

