Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A589EC4332F
	for <git@archiver.kernel.org>; Thu, 20 Oct 2022 23:17:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbiJTXRK (ORCPT <rfc822;git@archiver.kernel.org>);
        Thu, 20 Oct 2022 19:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbiJTXRC (ORCPT <rfc822;git@vger.kernel.org>);
        Thu, 20 Oct 2022 19:17:02 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7830422EE19
        for <git@vger.kernel.org>; Thu, 20 Oct 2022 16:17:01 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id bg9-20020a05600c3c8900b003bf249616b0so866039wmb.3
        for <git@vger.kernel.org>; Thu, 20 Oct 2022 16:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVeQ/mWty2Tpibi+Iyhp7FnN8iq0Jx9ktGkbazpbcxU=;
        b=hdC8L0ZR7M2WWnYp6yBypXBkdmcx2bMVED3OdtCEfBB/2l+gh5g0CTBgK+JUMKhW4M
         +EZlN/5AMau0/ZZBXasQSASjqdOnVueXkA6iLqcsPWNsUp5HkVdJKG/4grqxozHFjyQh
         ESZjYJltVnCnmHlwVXV4tSpAawIPYyqKl7jnrFriBf5JHjDIVNQ2PM4XIpYvki/sIELI
         jy+fUMm2P6XSIbXvUKS1hZjqK5mguSX0nceA8HSsmevvlzJAkKCwyJeshb5UbBDIcsN9
         gz/u4CnHpEB38oHqNy0TZFNC9fu5J+ah/0Fef1zD+2XKQHmzk08yOjZndqTeuC0S/vFk
         8BkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVeQ/mWty2Tpibi+Iyhp7FnN8iq0Jx9ktGkbazpbcxU=;
        b=fK4RyJagJ2BLxmT2Rn7L/iVx7IO2/vmgnUKLFMbOJaPkF2zt+IiuvgMwDz+jaPAXj1
         uahb3AlVOTyxOBoAVA5DuJ88XKNTKLtGdLeLUy0PzpCKiLwvJDTudYlDW71R7ffpdnsm
         D41c4Jm872gNxNOFYV7igYeRYWP3aHZXzEt+WD2dmd+p27BktsEc8aVOt9ZGsqgjd/Q7
         fKXLZJBZ7srUup1LRHrOw4jZyVIcVxTpCMxzzZ+c4tkkTrQ1cJiHK9M37ZCmKtzkqjDG
         nUmjB9F62+Tf7Q1sKjlvpgDZW5s/Q4nAFSGsSWMFKjUL8RpTmPTX2O3nUgu9R8pXd3gh
         srgw==
X-Gm-Message-State: ACrzQf1sLjDBkPMn3l6KPoHsrlH7iN393//XnetBTThEIti9FodvXcpD
        XosgSFZoaq8R3Fhqaiqm2br4S0QWTdo=
X-Google-Smtp-Source: AMsMyM6ATHHiFgTb65FxxMUDn981clm4crHKPV+/OZOQ4zrGNjLk0m16zU9cwO8ixFB0cgdMGZ4w/Q==
X-Received: by 2002:a05:600c:654f:b0:3c3:b5b7:43a9 with SMTP id dn15-20020a05600c654f00b003c3b5b743a9mr32652767wmb.201.1666307819868;
        Thu, 20 Oct 2022 16:16:59 -0700 (PDT)
Received: from [127.0.0.1] ([13.74.141.28])
        by smtp.gmail.com with ESMTPSA id s3-20020a7bc383000000b003a5f3f5883dsm974842wmj.17.2022.10.20.16.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 16:16:59 -0700 (PDT)
Message-Id: <ec4a2422d5b65efcbe8722f7f25f4b6ef6911302.1666307815.git.gitgitgadget@gmail.com>
In-Reply-To: <pull.1359.v4.git.1666307815.gitgitgadget@gmail.com>
References: <pull.1359.v3.git.1665737804.gitgitgadget@gmail.com>
        <pull.1359.v4.git.1666307815.gitgitgadget@gmail.com>
From:   "Jerry Zhang via GitGitGadget" <gitgitgadget@gmail.com>
Date:   Thu, 20 Oct 2022 23:16:51 +0000
Subject: [PATCH v4 2/6] patch-id: use stable patch-id for rebases
Fcc:    Sent
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
To:     git@vger.kernel.org
Cc:     Jerry Zhang <jerry@skydio.com>, Jerry Zhang <jerry@skydio.com>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

From: Jerry Zhang <jerry@skydio.com>

Git doesn't persist patch-ids during the rebase process, so there is
no need to specifically invoke the unstable variant. Use the stable
logic for all internal patch-id calculations to minimize the number of
code paths and improve test coverage.

Signed-off-by: Jerry Zhang <jerry@skydio.com>
---
 builtin/log.c |  2 +-
 diff.c        | 12 ++++--------
 diff.h        |  2 +-
 patch-ids.c   | 10 +++++-----
 patch-ids.h   |  2 +-
 5 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/builtin/log.c b/builtin/log.c
index ee19dc5d450..e72869afb36 100644
--- a/builtin/log.c
+++ b/builtin/log.c
@@ -1763,7 +1763,7 @@ static void prepare_bases(struct base_tree_info *bases,
 		struct object_id *patch_id;
 		if (*commit_base_at(&commit_base, commit))
 			continue;
-		if (commit_patch_id(commit, &diffopt, &oid, 0, 1))
+		if (commit_patch_id(commit, &diffopt, &oid, 0))
 			die(_("cannot get patch id"));
 		ALLOC_GROW(bases->patch_id, bases->nr_patch_id + 1, bases->alloc_patch_id);
 		patch_id = bases->patch_id + bases->nr_patch_id;
diff --git a/diff.c b/diff.c
index c15169e4b06..199b63dbcc3 100644
--- a/diff.c
+++ b/diff.c
@@ -6206,7 +6206,7 @@ static void patch_id_add_mode(git_hash_ctx *ctx, unsigned mode)
 }
 
 /* returns 0 upon success, and writes result into oid */
-static int diff_get_patch_id(struct diff_options *options, struct object_id *oid, int diff_header_only, int stable)
+static int diff_get_patch_id(struct diff_options *options, struct object_id *oid, int diff_header_only)
 {
 	struct diff_queue_struct *q = &diff_queued_diff;
 	int i;
@@ -6293,21 +6293,17 @@ static int diff_get_patch_id(struct diff_options *options, struct object_id *oid
 				return error("unable to generate patch-id diff for %s",
 					     p->one->path);
 		}
-		if (stable)
-			flush_one_hunk(oid, &ctx);
+		flush_one_hunk(oid, &ctx);
 	}
 
-	if (!stable)
-		the_hash_algo->final_oid_fn(oid, &ctx);
-
 	return 0;
 }
 
-int diff_flush_patch_id(struct diff_options *options, struct object_id *oid, int diff_header_only, int stable)
+int diff_flush_patch_id(struct diff_options *options, struct object_id *oid, int diff_header_only)
 {
 	struct diff_queue_struct *q = &diff_queued_diff;
 	int i;
-	int result = diff_get_patch_id(options, oid, diff_header_only, stable);
+	int result = diff_get_patch_id(options, oid, diff_header_only);
 
 	for (i = 0; i < q->nr; i++)
 		diff_free_filepair(q->queue[i]);
diff --git a/diff.h b/diff.h
index 8ae18e5ab1e..fd33caeb25d 100644
--- a/diff.h
+++ b/diff.h
@@ -634,7 +634,7 @@ int run_diff_files(struct rev_info *revs, unsigned int option);
 int run_diff_index(struct rev_info *revs, unsigned int option);
 
 int do_diff_cache(const struct object_id *, struct diff_options *);
-int diff_flush_patch_id(struct diff_options *, struct object_id *, int, int);
+int diff_flush_patch_id(struct diff_options *, struct object_id *, int);
 void flush_one_hunk(struct object_id *result, git_hash_ctx *ctx);
 
 int diff_result_code(struct diff_options *, int);
diff --git a/patch-ids.c b/patch-ids.c
index 46c6a8f3eab..31534466266 100644
--- a/patch-ids.c
+++ b/patch-ids.c
@@ -11,7 +11,7 @@ static int patch_id_defined(struct commit *commit)
 }
 
 int commit_patch_id(struct commit *commit, struct diff_options *options,
-		    struct object_id *oid, int diff_header_only, int stable)
+		    struct object_id *oid, int diff_header_only)
 {
 	if (!patch_id_defined(commit))
 		return -1;
@@ -22,7 +22,7 @@ int commit_patch_id(struct commit *commit, struct diff_options *options,
 	else
 		diff_root_tree_oid(&commit->object.oid, "", options);
 	diffcore_std(options);
-	return diff_flush_patch_id(options, oid, diff_header_only, stable);
+	return diff_flush_patch_id(options, oid, diff_header_only);
 }
 
 /*
@@ -48,11 +48,11 @@ static int patch_id_neq(const void *cmpfn_data,
 	b = container_of(entry_or_key, struct patch_id, ent);
 
 	if (is_null_oid(&a->patch_id) &&
-	    commit_patch_id(a->commit, opt, &a->patch_id, 0, 0))
+	    commit_patch_id(a->commit, opt, &a->patch_id, 0))
 		return error("Could not get patch ID for %s",
 			oid_to_hex(&a->commit->object.oid));
 	if (is_null_oid(&b->patch_id) &&
-	    commit_patch_id(b->commit, opt, &b->patch_id, 0, 0))
+	    commit_patch_id(b->commit, opt, &b->patch_id, 0))
 		return error("Could not get patch ID for %s",
 			oid_to_hex(&b->commit->object.oid));
 	return !oideq(&a->patch_id, &b->patch_id);
@@ -82,7 +82,7 @@ static int init_patch_id_entry(struct patch_id *patch,
 	struct object_id header_only_patch_id;
 
 	patch->commit = commit;
-	if (commit_patch_id(commit, &ids->diffopts, &header_only_patch_id, 1, 0))
+	if (commit_patch_id(commit, &ids->diffopts, &header_only_patch_id, 1))
 		return -1;
 
 	hashmap_entry_init(&patch->ent, oidhash(&header_only_patch_id));
diff --git a/patch-ids.h b/patch-ids.h
index ab6c6a68047..490d7393716 100644
--- a/patch-ids.h
+++ b/patch-ids.h
@@ -20,7 +20,7 @@ struct patch_ids {
 };
 
 int commit_patch_id(struct commit *commit, struct diff_options *options,
-		    struct object_id *oid, int, int);
+		    struct object_id *oid, int);
 int init_patch_ids(struct repository *, struct patch_ids *);
 int free_patch_ids(struct patch_ids *);
 
-- 
gitgitgadget

