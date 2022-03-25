Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04525C433EF
	for <git@archiver.kernel.org>; Fri, 25 Mar 2022 17:28:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbiCYRaQ (ORCPT <rfc822;git@archiver.kernel.org>);
        Fri, 25 Mar 2022 13:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243083AbiCYR3M (ORCPT <rfc822;git@vger.kernel.org>);
        Fri, 25 Mar 2022 13:29:12 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F107AEDF08
        for <git@vger.kernel.org>; Fri, 25 Mar 2022 10:27:37 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id u3so11242041ljd.0
        for <git@vger.kernel.org>; Fri, 25 Mar 2022 10:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6VkWZUa0jW2bJXXe27kb3YIFqN0zYPcWGqAsEkjXX5U=;
        b=pIBkrIFrRiIWQcTOyNi0fdXsK8KVgDXgfCj+ZQP+5lSc4h5BNwnnqk9IyJa3BOT+a8
         TkRqo3aBNLTPMFpApJLL5959SKJ3JODeLQCuJRBr5wGxb7ljwXlqXsLwG8msMqAov+F+
         eJCyTQNy6qmeHHH9yD0tlDkQOPZdp22lrcq6KaSlz8DfRh5PaC2X7JMorRn3AT6vtWkM
         lNTxleSuIHhiLJ1m8Dpc+sMIw392g5IB9sfyE4lCwRUvkuWzbFfxQolqReCNn0XKjPcB
         6TqUJ2Xx1Scj3AHyqu1sVF/RUHkouY3ZW3vqejxkOYP8Z4GxhoXCxnkOSV+Ybtk5Kr3a
         iSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6VkWZUa0jW2bJXXe27kb3YIFqN0zYPcWGqAsEkjXX5U=;
        b=RusgQn+G/7ljJodZ3IeAl062z/QJMGoWtFl7ljgTBLHMXosICipKd4xleMV9Ws5kJ8
         hF/FfFXKPXvGBID/8X853S8Tz5fn69/ZVNn42so1h4n7puSOVO8RAlWFWnRseeDJMYyV
         3zb5ODoZSu4aQk+attkn5KEkUirYvRztfUpe1pFrToh7r6hM4MZWkj8FGOPLxI2truzI
         nhgDiPNSOaWBu7jD3Rn67NxjiZZzNF2W6rExQHEb1go7iNA1t2f6cLVX7XU+KCgfU4IW
         +5tdfjezFHcIEcU7Wl0XOas1qCKfV+5j/RY5+KPRz55Jht/N6WHaWrI5zxRoY+75pNTu
         BmcQ==
X-Gm-Message-State: AOAM531BeSFH7KNcNJpq6APoApoOqwmvWHmJicgWHSUG2VjYzW7lqd+E
        08afUGXEcv1nr1NDtJwVTxpH/hHfkNanxg==
X-Google-Smtp-Source: ABdhPJy6i5927bY7mKgoMK+RpC2XNKwQIMVuC4uvqifagXFhQ2QafWHb/QvftEglVIM8jCwSZ3Bxmw==
X-Received: by 2002:adf:f951:0:b0:205:8472:e279 with SMTP id q17-20020adff951000000b002058472e279mr10365837wrr.622.1648228784062;
        Fri, 25 Mar 2022 10:19:44 -0700 (PDT)
Received: from vm.nix.is (vm.nix.is. [2a01:4f8:120:2468::2])
        by smtp.gmail.com with ESMTPSA id p16-20020a5d6390000000b00203ffebddf3sm7554165wru.99.2022.03.25.10.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 10:19:43 -0700 (PDT)
From:   =?UTF-8?q?=C3=86var=20Arnfj=C3=B6r=C3=B0=20Bjarmason?= 
        <avarab@gmail.com>
To:     git@vger.kernel.org
Cc:     Junio C Hamano <gitster@pobox.com>,
        =?UTF-8?q?Martin=20=C3=85gren?= <martin.agren@gmail.com>,
        Elijah Newren <newren@gmail.com>,
        Derrick Stolee <derrickstolee@github.com>,
        "brian m . carlson" <sandals@crustytoothpaste.net>,
        =?UTF-8?q?=C3=86var=20Arnfj=C3=B6r=C3=B0=20Bjarmason?= 
        <avarab@gmail.com>
Subject: [PATCH v3 13/27] revisions API users: use release_revisions() in builtin/log.c
Date:   Fri, 25 Mar 2022 18:18:37 +0100
Message-Id: <patch-v3-13.27-2eae0e809e5-20220325T171340Z-avarab@gmail.com>
X-Mailer: git-send-email 2.35.1.1509.ge4eeb5bd39e
In-Reply-To: <cover-v3-00.27-00000000000-20220325T171340Z-avarab@gmail.com>
References: <cover-v2-00.27-00000000000-20220323T203149Z-avarab@gmail.com> <cover-v3-00.27-00000000000-20220325T171340Z-avarab@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

In preparation for having the "log" family of functions make wider use
of release_revisions() let's have them call it just before
exiting. This changes the "log", "whatchanged", "show",
"format-patch", etc. commands, all of which live in this file.

The release_revisions() API still only frees the "pending" member, but
will learn to release more members of "struct rev_info" in subsequent
commits.

In the case of "format-patch" revert the addition of UNLEAK() in
dee839a2633 (format-patch: mark rev_info with UNLEAK, 2021-12-16),
which will cause several tests that previously passed under
"TEST_PASSES_SANITIZE_LEAK=true" to start failing.

In subsequent commits we'll now be able to use those tests to check
whether that part of the API is really leaking memory, and will fix
all of those memory leaks. Removing the UNLEAK() allows us to make
incremental progress in that direction. See [1] for further details
about this approach.

Note that the release_revisions() will not be sufficient to deal with
the code in cmd_show() added in 5d7eeee2ac6 (git-show: grok blobs,
trees and tags, too, 2006-12-14) which clobbers the "pending" array in
the case of "OBJ_COMMIT". That will need to be dealt with by some
future follow-up work.

1. https://lore.kernel.org/git/220218.861r00ib86.gmgdl@evledraar.gmail.com/

Signed-off-by: Ævar Arnfjörð Bjarmason <avarab@gmail.com>
---
 builtin/log.c          | 20 ++++++++++++--------
 t/t4126-apply-empty.sh |  2 --
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/builtin/log.c b/builtin/log.c
index 6f9928fabfe..c40ebe1c3f4 100644
--- a/builtin/log.c
+++ b/builtin/log.c
@@ -295,6 +295,12 @@ static void cmd_log_init(int argc, const char **argv, const char *prefix,
 	cmd_log_init_finish(argc, argv, prefix, rev, opt);
 }
 
+static int cmd_log_deinit(int ret, struct rev_info *rev)
+{
+	release_revisions(rev);
+	return ret;
+}
+
 /*
  * This gives a rough estimate for how many commits we
  * will print out in the list.
@@ -558,7 +564,7 @@ int cmd_whatchanged(int argc, const char **argv, const char *prefix)
 	cmd_log_init(argc, argv, prefix, &rev, &opt);
 	if (!rev.diffopt.output_format)
 		rev.diffopt.output_format = DIFF_FORMAT_RAW;
-	return cmd_log_walk(&rev);
+	return cmd_log_deinit(cmd_log_walk(&rev), &rev);
 }
 
 static void show_tagger(const char *buf, struct rev_info *rev)
@@ -677,7 +683,7 @@ int cmd_show(int argc, const char **argv, const char *prefix)
 	cmd_log_init(argc, argv, prefix, &rev, &opt);
 
 	if (!rev.no_walk)
-		return cmd_log_walk(&rev);
+		return cmd_log_deinit(cmd_log_walk(&rev), &rev);
 
 	count = rev.pending.nr;
 	objects = rev.pending.objects;
@@ -732,8 +738,7 @@ int cmd_show(int argc, const char **argv, const char *prefix)
 			ret = error(_("unknown type: %d"), o->type);
 		}
 	}
-	free(objects);
-	return ret;
+	return cmd_log_deinit(ret, &rev);
 }
 
 /*
@@ -761,7 +766,7 @@ int cmd_log_reflog(int argc, const char **argv, const char *prefix)
 	rev.always_show_header = 1;
 	cmd_log_init_finish(argc, argv, prefix, &rev, &opt);
 
-	return cmd_log_walk(&rev);
+	return cmd_log_deinit(cmd_log_walk(&rev), &rev);
 }
 
 static void log_setup_revisions_tweak(struct rev_info *rev,
@@ -792,7 +797,7 @@ int cmd_log(int argc, const char **argv, const char *prefix)
 	opt.revarg_opt = REVARG_COMMITTISH;
 	opt.tweak = log_setup_revisions_tweak;
 	cmd_log_init(argc, argv, prefix, &rev, &opt);
-	return cmd_log_walk(&rev);
+	return cmd_log_deinit(cmd_log_walk(&rev), &rev);
 }
 
 /* format-patch */
@@ -2289,8 +2294,7 @@ int cmd_format_patch(int argc, const char **argv, const char *prefix)
 	if (rev.ref_message_ids)
 		string_list_clear(rev.ref_message_ids, 0);
 	free(rev.ref_message_ids);
-	UNLEAK(rev);
-	return 0;
+	return cmd_log_deinit(0, &rev);
 }
 
 static int add_pending_commit(const char *arg, struct rev_info *revs, int flags)
diff --git a/t/t4126-apply-empty.sh b/t/t4126-apply-empty.sh
index 33860d38290..66a7ba8ab8f 100755
--- a/t/t4126-apply-empty.sh
+++ b/t/t4126-apply-empty.sh
@@ -2,8 +2,6 @@
 
 test_description='apply empty'
 
-
-TEST_PASSES_SANITIZE_LEAK=true
 . ./test-lib.sh
 
 test_expect_success setup '
-- 
2.35.1.1509.ge4eeb5bd39e

