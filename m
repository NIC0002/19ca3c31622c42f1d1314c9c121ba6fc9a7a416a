Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004F7C4332F
	for <git@archiver.kernel.org>; Thu, 15 Dec 2022 09:59:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbiLOJ71 (ORCPT <rfc822;git@archiver.kernel.org>);
        Thu, 15 Dec 2022 04:59:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbiLOJ7P (ORCPT <rfc822;git@vger.kernel.org>);
        Thu, 15 Dec 2022 04:59:15 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A851A818
        for <git@vger.kernel.org>; Thu, 15 Dec 2022 01:59:14 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id h7so2474196wrs.6
        for <git@vger.kernel.org>; Thu, 15 Dec 2022 01:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97J33TpXZ86EbbZiJ5gp7zqhHnQEL1Z75hIZgJKmU0Q=;
        b=RldsHXdXlSLBgWXF+DMbFO61Br7MlInLr0wvcMpbPcvhQ4a6ZShfV+JSgnzi53X2uK
         ZTDAOKPbSlHGDfSyixpjr856BrlOPeUkYQQcWLZwpQUT4CAs3hq/KltNd1+sblan/CB3
         uEUV29QQD5jcGVhn6ZJalqKv9WGtA6kOyBoOClladlSUsTz0Nckyfb5vhwJWTsIAS0n+
         qUmOFRZz8veMSaUnA29X7iZGLa1jX1hqtEQjRKwxO+tfLZPKHC3KCEvBgeZJxKMFAt1p
         tnDXr9HtWoyGbif+Kz1stQcVsDfI7wKy4wQfn/IW8bcxS075yBEeM4kILcSfiwSLJmpu
         9AIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97J33TpXZ86EbbZiJ5gp7zqhHnQEL1Z75hIZgJKmU0Q=;
        b=LtkHvqG7yidgDlwvWDKcMZfP5DHeE1HKDKW/mojlBA71/qRmIRYslL5qbIQC85ayp3
         4tjPRRMxg1/evJK/7wO4K2J8QuxhFVOVStHXfjk0SwFNeH30gZ2+pUMJFPFso1HcPjQa
         la7dWhM4rLykBqNW/9C9UOEw5K1oQdcXYLjZCHqoAAtUgydOXNVw3EM73M+5UwO/JJHI
         eC71fFjHuaLZwwiQVZEpSvQycPeLEGP8jaq0LwaTiUnLTXTlYtTsa9TwvMswLxcYkhv5
         Dpg2lT/A2iDIfDDY0XXqZASABJTrYGgYgcxKhJOemsrw01Vk9+CQCTPeAnsyJTPBeVOc
         jJ1g==
X-Gm-Message-State: ANoB5pmJfuAVjr4MW8LCJszT4gyJbLDkMlyhliIim4K/Bf5G8PFJJ18P
        QYhzt3jawdXL3aE4+7wo/9pDllaVf3YpCw==
X-Google-Smtp-Source: AA0mqf5ChW/lwFmEFXHLEmfsgoDJv/o23V5nqNIuTix7F1WmLwJZAmsidb7nPdjRIC6ojk9XQH8h+A==
X-Received: by 2002:adf:d4c1:0:b0:242:6485:4cd7 with SMTP id w1-20020adfd4c1000000b0024264854cd7mr17576724wrk.1.1671098352376;
        Thu, 15 Dec 2022 01:59:12 -0800 (PST)
Received: from vm.nix.is (vm.nix.is. [2a01:4f8:120:2468::2])
        by smtp.gmail.com with ESMTPSA id a13-20020adfe5cd000000b00228cbac7a25sm5495948wrn.64.2022.12.15.01.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 01:59:11 -0800 (PST)
From:   =?UTF-8?q?=C3=86var=20Arnfj=C3=B6r=C3=B0=20Bjarmason?= 
        <avarab@gmail.com>
To:     git@vger.kernel.org
Cc:     Taylor Blau <me@ttaylorr.com>, Junio C Hamano <gitster@pobox.com>,
        Phillip Wood <phillip.wood123@gmail.com>,
        =?UTF-8?q?=C3=86var=20Arnfj=C3=B6r=C3=B0=20Bjarmason?= 
        <avarab@gmail.com>
Subject: [PATCH 4/6] cocci & cache-tree.h: migrate "write_cache_as_tree" to "*_index_*"
Date:   Thu, 15 Dec 2022 10:59:03 +0100
Message-Id: <patch-4.6-679ddc857c1-20221215T095335Z-avarab@gmail.com>
X-Mailer: git-send-email 2.39.0.rc2.1048.g0e5493b8d5b
In-Reply-To: <cover-0.6-00000000000-20221215T095335Z-avarab@gmail.com>
References: <cover-0.6-00000000000-20221215T095335Z-avarab@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Add a trivial rule for "write_cache_as_tree" to
"index-compatibility.cocci", and apply it. This was left out of the
rules added in 0e6550a2c63 (cocci: add a
index-compatibility.pending.cocci, 2022-11-19) because this
compatibility wrapper lived in "cache-tree.h", not "cache.h"

But it's like the other "USE_THE_INDEX_COMPATIBILITY_MACROS", so let's
migrate it too.

The replacement of "USE_THE_INDEX_COMPATIBILITY_MACROS" here with
"USE_THE_INDEX_VARIABLE" is a manual change on top, now that these
files only use "&the_index", and don't need any compatibility
macros (or functions).

The wrapping of some argument lists is likewise manual, as coccinelle
would otherwise give us overly long argument lists.

The reason for putting the "O" in the cocci rule on the "-" and "+"
lines is because I couldn't get correct whitespacing otherwise,
i.e. I'd end up with "oid,&the_index", not "oid, &the_index".

Signed-off-by: Ævar Arnfjörð Bjarmason <avarab@gmail.com>
---
 builtin/am.c                                 |  6 +++---
 builtin/merge.c                              |  2 +-
 builtin/stash.c                              | 11 +++++++----
 builtin/write-tree.c                         |  5 +++--
 cache-tree.h                                 |  5 -----
 contrib/coccinelle/index-compatibility.cocci | 11 +++++++++++
 6 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/builtin/am.c b/builtin/am.c
index 30c9b3a9cd7..0e2e86fe3d1 100644
--- a/builtin/am.c
+++ b/builtin/am.c
@@ -3,7 +3,7 @@
  *
  * Based on git-am.sh by Junio C Hamano.
  */
-#define USE_THE_INDEX_COMPATIBILITY_MACROS
+#define USE_THE_INDEX_VARIABLE
 #include "cache.h"
 #include "config.h"
 #include "builtin.h"
@@ -1643,7 +1643,7 @@ static void do_commit(const struct am_state *state)
 	if (run_hooks("pre-applypatch"))
 		exit(1);
 
-	if (write_cache_as_tree(&tree, 0, NULL))
+	if (write_index_as_tree(&tree, &the_index, get_index_file(), 0, NULL))
 		die(_("git write-tree failed to write a tree"));
 
 	if (!get_oid_commit("HEAD", &parent)) {
@@ -2051,7 +2051,7 @@ static int clean_index(const struct object_id *head, const struct object_id *rem
 	if (fast_forward_to(head_tree, head_tree, 1))
 		return -1;
 
-	if (write_cache_as_tree(&index, 0, NULL))
+	if (write_index_as_tree(&index, &the_index, get_index_file(), 0, NULL))
 		return -1;
 
 	index_tree = parse_tree_indirect(&index);
diff --git a/builtin/merge.c b/builtin/merge.c
index ecccd5e9119..ad2e4114617 100644
--- a/builtin/merge.c
+++ b/builtin/merge.c
@@ -706,7 +706,7 @@ static int read_tree_trivial(struct object_id *common, struct object_id *head,
 
 static void write_tree_trivial(struct object_id *oid)
 {
-	if (write_cache_as_tree(oid, 0, NULL))
+	if (write_index_as_tree(oid, &the_index, get_index_file(), 0, NULL))
 		die(_("git write-tree failed to write a tree"));
 }
 
diff --git a/builtin/stash.c b/builtin/stash.c
index bb0fd861434..ba5d4c6c516 100644
--- a/builtin/stash.c
+++ b/builtin/stash.c
@@ -1,4 +1,4 @@
-#define USE_THE_INDEX_COMPATIBILITY_MACROS
+#define USE_THE_INDEX_VARIABLE
 #include "builtin.h"
 #include "config.h"
 #include "parse-options.h"
@@ -528,7 +528,8 @@ static int do_apply_stash(const char *prefix, struct stash_info *info,
 					 NULL, NULL, NULL))
 		return -1;
 
-	if (write_cache_as_tree(&c_tree, 0, NULL))
+	if (write_index_as_tree(&c_tree, &the_index, get_index_file(), 0,
+				NULL))
 		return error(_("cannot apply a stash in the middle of a merge"));
 
 	if (index) {
@@ -552,7 +553,8 @@ static int do_apply_stash(const char *prefix, struct stash_info *info,
 
 			discard_index(&the_index);
 			repo_read_index(the_repository);
-			if (write_cache_as_tree(&index_tree, 0, NULL))
+			if (write_index_as_tree(&index_tree, &the_index,
+						get_index_file(), 0, NULL))
 				return error(_("could not save index tree"));
 
 			reset_head();
@@ -1377,7 +1379,8 @@ static int do_create_stash(const struct pathspec *ps, struct strbuf *stash_msg_b
 
 	strbuf_addf(&commit_tree_label, "index on %s\n", msg.buf);
 	commit_list_insert(head_commit, &parents);
-	if (write_cache_as_tree(&info->i_tree, 0, NULL) ||
+	if (write_index_as_tree(&info->i_tree, &the_index, get_index_file(), 0,
+				NULL) ||
 	    commit_tree(commit_tree_label.buf, commit_tree_label.len,
 			&info->i_tree, parents, &info->i_commit, NULL, NULL)) {
 		if (!quiet)
diff --git a/builtin/write-tree.c b/builtin/write-tree.c
index 45d61707e7d..078010315f0 100644
--- a/builtin/write-tree.c
+++ b/builtin/write-tree.c
@@ -3,7 +3,7 @@
  *
  * Copyright (C) Linus Torvalds, 2005
  */
-#define USE_THE_INDEX_COMPATIBILITY_MACROS
+#define USE_THE_INDEX_VARIABLE
 #include "builtin.h"
 #include "cache.h"
 #include "config.h"
@@ -38,7 +38,8 @@ int cmd_write_tree(int argc, const char **argv, const char *cmd_prefix)
 	argc = parse_options(argc, argv, cmd_prefix, write_tree_options,
 			     write_tree_usage, 0);
 
-	ret = write_cache_as_tree(&oid, flags, tree_prefix);
+	ret = write_index_as_tree(&oid, &the_index, get_index_file(), flags,
+				  tree_prefix);
 	switch (ret) {
 	case 0:
 		printf("%s\n", oid_to_hex(&oid));
diff --git a/cache-tree.h b/cache-tree.h
index 8efeccebfc9..84890c9ff32 100644
--- a/cache-tree.h
+++ b/cache-tree.h
@@ -55,11 +55,6 @@ void prime_cache_tree(struct repository *, struct index_state *, struct tree *);
 int cache_tree_matches_traversal(struct cache_tree *, struct name_entry *ent, struct traverse_info *info);
 
 #ifdef USE_THE_INDEX_COMPATIBILITY_MACROS
-static inline int write_cache_as_tree(struct object_id *oid, int flags, const char *prefix)
-{
-	return write_index_as_tree(oid, &the_index, get_index_file(), flags, prefix);
-}
-
 static inline int update_main_cache_tree(int flags)
 {
 	if (!the_index.cache_tree)
diff --git a/contrib/coccinelle/index-compatibility.cocci b/contrib/coccinelle/index-compatibility.cocci
index 1d37546fdbd..e245d805dcd 100644
--- a/contrib/coccinelle/index-compatibility.cocci
+++ b/contrib/coccinelle/index-compatibility.cocci
@@ -135,3 +135,14 @@ identifier ACT = active_cache_tree;
   ...
 + , NULL, NULL, NULL
   )
+
+@@
+expression O;
+@@
+- write_cache_as_tree
++ write_index_as_tree
+  (
+- O,
++ O, &the_index, get_index_file(),
+  ...
+  )
-- 
2.39.0.rc2.1048.g0e5493b8d5b

