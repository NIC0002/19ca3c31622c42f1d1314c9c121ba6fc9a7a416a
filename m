Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EA8C6FD1D
	for <git@archiver.kernel.org>; Tue, 21 Mar 2023 06:26:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbjCUG0l (ORCPT <rfc822;git@archiver.kernel.org>);
        Tue, 21 Mar 2023 02:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbjCUG02 (ORCPT <rfc822;git@vger.kernel.org>);
        Tue, 21 Mar 2023 02:26:28 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57A4431E18
        for <git@vger.kernel.org>; Mon, 20 Mar 2023 23:26:24 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id ip21-20020a05600ca69500b003ed56690948so8361418wmb.1
        for <git@vger.kernel.org>; Mon, 20 Mar 2023 23:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679379982;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GmdTmeHsOmsp+Z+z8mlIU79EbdAGrZlPgw8+nqfckA=;
        b=dFbrYaZb68GtabWZca5YcYvD6WNL+ig5jemjm50Dy4TyqrNyLZ6yiR3pg14uNIyUjj
         Ma9nlDbZWdPDLVLVk6zXlcEOgkHmv8CopPlJQGYzsjn/BZImHmFTYNojX9EO6QMPvfa/
         +jI369nc6jEtt7Pi2XW8h54n7Xqium0m+9xBy8k9iG/8VqsSrCDlXciJfkGjwc6nNcZm
         gD6xlFz8E+I1txZe7B1nWuPpBkV0PaOFDfuAGTAdiak3U36D/imY6bSMT8AyaoRx/TaQ
         eIK9ERwIapQ4XBLu/EWwZKPIS49GM8bCJJ6MOdBtDUO9/GDPNA5DrxacaOBtKuG8+Vgq
         iepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679379982;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GmdTmeHsOmsp+Z+z8mlIU79EbdAGrZlPgw8+nqfckA=;
        b=XuBsRiPFlj4EF7qVv+9gI2VHGk/kyaHuvh1EB5LQYQwfDvEW1lfAFwpZTdztQiHBuo
         ao5GlxZxEGFhoLAMcuUusuvxF5Zzok00cgO8+djfKz6DcTFWA4vyxGIM+8weg4ZjpLvv
         cNGuyMFZEAc71U5sWayF1ZZcf69khnjRR9f4s5VQSxbly3qGgSlISk9W5ScNPtl2ca/q
         DHb/4AWlkpq98oArrX8aYRBfMLSS3XVSCV1B79Zh3BH3VC+uOdjrRrT4hkV/Cnx6XWgN
         zX/SNMGEQoZa6rHsjXWCWbjGBhRGkJru539cpvMYgHOVaf/ZWcUq6LhdJ4JDq3z76OKK
         6ZvQ==
X-Gm-Message-State: AO0yUKVxkHpNObeAqHF3tX1Q5JkpJjeAQk1mFFUZfHthuRxEyYbcdvPT
        nXxhUUU+aqVW5nj3AAiK/PkcyBuYJWc=
X-Google-Smtp-Source: AK7set/duAUXJVcw+O6w4eGWtM0etqPyFn3klK1GEh/B3sppHqFS5r61XRKn3oOgY/p7dRprYGvYdg==
X-Received: by 2002:a7b:cd13:0:b0:3ee:3df6:e411 with SMTP id f19-20020a7bcd13000000b003ee3df6e411mr226479wmj.28.1679379982470;
        Mon, 20 Mar 2023 23:26:22 -0700 (PDT)
Received: from [127.0.0.1] ([13.74.141.28])
        by smtp.gmail.com with ESMTPSA id n23-20020a7bcbd7000000b003ed243222adsm12358036wmi.42.2023.03.20.23.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 23:26:21 -0700 (PDT)
Message-Id: <1fbd957047d96e5efde6a472b872b400d8a94cdb.1679379971.git.gitgitgadget@gmail.com>
In-Reply-To: <pull.1493.v2.git.1679379968.gitgitgadget@gmail.com>
References: <pull.1493.git.1679207282.gitgitgadget@gmail.com>
        <pull.1493.v2.git.1679379968.gitgitgadget@gmail.com>
From:   "Elijah Newren via GitGitGadget" <gitgitgadget@gmail.com>
Date:   Tue, 21 Mar 2023 06:25:58 +0000
Subject: [PATCH v2 06/16] abspath.h: move absolute path functions from cache.h
Fcc:    Sent
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
To:     git@vger.kernel.org
Cc:     =?UTF-8?Q?=C3=86var_Arnfj=C3=B6r=C3=B0?= Bjarmason 
        <avarab@gmail.com>, Elijah Newren <newren@gmail.com>,
        Elijah Newren <newren@gmail.com>,
        Elijah Newren <newren@gmail.com>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

From: Elijah Newren <newren@gmail.com>

This is another step towards letting us remove the include of cache.h in
strbuf.c.  It does mean that we also need to add includes of abspath.h
in a number of C files.

Signed-off-by: Elijah Newren <newren@gmail.com>
---
 abspath.c                          |  4 +++-
 abspath.h                          | 33 ++++++++++++++++++++++++++++++
 apply.c                            |  1 +
 archive.c                          |  1 +
 builtin/am.c                       |  1 +
 builtin/bugreport.c                |  1 +
 builtin/bundle.c                   |  1 +
 builtin/clean.c                    |  1 +
 builtin/clone.c                    |  1 +
 builtin/config.c                   |  1 +
 builtin/credential-cache--daemon.c |  1 +
 builtin/diagnose.c                 |  1 +
 builtin/difftool.c                 |  1 +
 builtin/fast-import.c              |  1 +
 builtin/fsmonitor--daemon.c        |  1 +
 builtin/gc.c                       |  1 +
 builtin/hash-object.c              |  1 +
 builtin/init-db.c                  |  1 +
 builtin/log.c                      |  1 +
 builtin/mailinfo.c                 |  1 +
 builtin/merge-file.c               |  1 +
 builtin/merge.c                    |  1 +
 builtin/multi-pack-index.c         |  1 +
 builtin/mv.c                       |  1 +
 builtin/rebase.c                   |  1 +
 builtin/receive-pack.c             |  1 +
 builtin/rev-parse.c                |  1 +
 builtin/stash.c                    |  1 +
 builtin/submodule--helper.c        |  1 +
 builtin/worktree.c                 |  1 +
 cache.h                            | 27 ------------------------
 chdir-notify.c                     |  1 +
 compat/disk.h                      |  1 +
 compat/mingw.c                     |  1 +
 compat/simple-ipc/ipc-win32.c      |  1 +
 config.c                           |  1 +
 credential.c                       |  1 +
 daemon.c                           |  1 +
 diff-no-index.c                    |  1 +
 diff.c                             |  1 +
 dir.c                              |  1 +
 editor.c                           |  1 +
 environment.c                      |  1 +
 exec-cmd.c                         |  1 +
 gettext.c                          |  1 +
 lockfile.c                         |  1 +
 midx.c                             |  1 +
 object-file.c                      |  1 +
 parse-options.c                    |  1 +
 path.c                             |  1 +
 pathspec.c                         |  1 +
 remote.c                           |  1 +
 repository.c                       |  1 +
 rerere.c                           |  1 +
 scalar.c                           |  1 +
 sequencer.c                        |  1 +
 setup.c                            |  1 +
 strbuf.c                           |  1 +
 submodule.c                        |  1 +
 t/helper/test-path-utils.c         |  1 +
 tmp-objdir.c                       |  1 +
 trace.c                            |  1 +
 trace2/tr2_dst.c                   |  1 +
 worktree.c                         |  1 +
 wrapper.c                          |  1 +
 65 files changed, 98 insertions(+), 28 deletions(-)
 create mode 100644 abspath.h

diff --git a/abspath.c b/abspath.c
index 9a81c5525be..d032f5dce51 100644
--- a/abspath.c
+++ b/abspath.c
@@ -1,4 +1,6 @@
-#include "cache.h"
+#include "git-compat-util.h"
+#include "abspath.h"
+#include "strbuf.h"
 
 /*
  * Do not use this for inspecting *tracked* content.  When path is a
diff --git a/abspath.h b/abspath.h
new file mode 100644
index 00000000000..7cd3de5e9de
--- /dev/null
+++ b/abspath.h
@@ -0,0 +1,33 @@
+#ifndef ABSPATH_H
+#define ABSPATH_H
+
+int is_directory(const char *);
+char *strbuf_realpath(struct strbuf *resolved, const char *path,
+		      int die_on_error);
+char *strbuf_realpath_forgiving(struct strbuf *resolved, const char *path,
+				int die_on_error);
+char *real_pathdup(const char *path, int die_on_error);
+const char *absolute_path(const char *path);
+char *absolute_pathdup(const char *path);
+
+/*
+ * Concatenate "prefix" (if len is non-zero) and "path", with no
+ * connecting characters (so "prefix" should end with a "/").
+ * Unlike prefix_path, this should be used if the named file does
+ * not have to interact with index entry; i.e. name of a random file
+ * on the filesystem.
+ *
+ * The return value is always a newly allocated string (even if the
+ * prefix was empty).
+ */
+char *prefix_filename(const char *prefix, const char *path);
+
+/* Likewise, but path=="-" always yields "-" */
+char *prefix_filename_except_for_dash(const char *prefix, const char *path);
+
+static inline int is_absolute_path(const char *path)
+{
+	return is_dir_sep(path[0]) || has_dos_drive_prefix(path);
+}
+
+#endif /* ABSPATH_H */
diff --git a/apply.c b/apply.c
index e0bdd43a68e..e5e11b85793 100644
--- a/apply.c
+++ b/apply.c
@@ -8,6 +8,7 @@
  */
 
 #include "cache.h"
+#include "abspath.h"
 #include "alloc.h"
 #include "config.h"
 #include "object-store.h"
diff --git a/archive.c b/archive.c
index 2c3da1cff30..c3c45a5ebe9 100644
--- a/archive.c
+++ b/archive.c
@@ -1,4 +1,5 @@
 #include "git-compat-util.h"
+#include "abspath.h"
 #include "alloc.h"
 #include "config.h"
 #include "gettext.h"
diff --git a/builtin/am.c b/builtin/am.c
index cc1fdf4f75d..14347ecf9aa 100644
--- a/builtin/am.c
+++ b/builtin/am.c
@@ -5,6 +5,7 @@
  */
 #define USE_THE_INDEX_VARIABLE
 #include "cache.h"
+#include "abspath.h"
 #include "config.h"
 #include "builtin.h"
 #include "exec-cmd.h"
diff --git a/builtin/bugreport.c b/builtin/bugreport.c
index b61cfa9464f..b5dfad4e12a 100644
--- a/builtin/bugreport.c
+++ b/builtin/bugreport.c
@@ -1,4 +1,5 @@
 #include "builtin.h"
+#include "abspath.h"
 #include "gettext.h"
 #include "parse-options.h"
 #include "strbuf.h"
diff --git a/builtin/bundle.c b/builtin/bundle.c
index de3898ffa41..9e2aecadf7d 100644
--- a/builtin/bundle.c
+++ b/builtin/bundle.c
@@ -1,4 +1,5 @@
 #include "builtin.h"
+#include "abspath.h"
 #include "gettext.h"
 #include "strvec.h"
 #include "parse-options.h"
diff --git a/builtin/clean.c b/builtin/clean.c
index 46c51029ab4..fdcf62c5dfe 100644
--- a/builtin/clean.c
+++ b/builtin/clean.c
@@ -8,6 +8,7 @@
 
 #define USE_THE_INDEX_VARIABLE
 #include "builtin.h"
+#include "abspath.h"
 #include "cache.h"
 #include "config.h"
 #include "dir.h"
diff --git a/builtin/clone.c b/builtin/clone.c
index d605fcafa0f..b94324ea02c 100644
--- a/builtin/clone.c
+++ b/builtin/clone.c
@@ -10,6 +10,7 @@
 
 #define USE_THE_INDEX_VARIABLE
 #include "builtin.h"
+#include "abspath.h"
 #include "config.h"
 #include "gettext.h"
 #include "hex.h"
diff --git a/builtin/config.c b/builtin/config.c
index 33b17b40b41..42e6b8d3481 100644
--- a/builtin/config.c
+++ b/builtin/config.c
@@ -1,4 +1,5 @@
 #include "builtin.h"
+#include "abspath.h"
 #include "alloc.h"
 #include "config.h"
 #include "color.h"
diff --git a/builtin/credential-cache--daemon.c b/builtin/credential-cache--daemon.c
index 0f00ba4d741..62c09a271d6 100644
--- a/builtin/credential-cache--daemon.c
+++ b/builtin/credential-cache--daemon.c
@@ -1,4 +1,5 @@
 #include "builtin.h"
+#include "abspath.h"
 #include "alloc.h"
 #include "gettext.h"
 #include "parse-options.h"
diff --git a/builtin/diagnose.c b/builtin/diagnose.c
index 5b12d1fb963..0f8b64994c4 100644
--- a/builtin/diagnose.c
+++ b/builtin/diagnose.c
@@ -1,4 +1,5 @@
 #include "builtin.h"
+#include "abspath.h"
 #include "gettext.h"
 #include "parse-options.h"
 #include "diagnose.h"
diff --git a/builtin/difftool.c b/builtin/difftool.c
index f7380dd1cc7..ed06db12085 100644
--- a/builtin/difftool.c
+++ b/builtin/difftool.c
@@ -13,6 +13,7 @@
  */
 #define USE_THE_INDEX_VARIABLE
 #include "cache.h"
+#include "abspath.h"
 #include "config.h"
 #include "builtin.h"
 #include "run-command.h"
diff --git a/builtin/fast-import.c b/builtin/fast-import.c
index f3635c7aefd..7307c4657f2 100644
--- a/builtin/fast-import.c
+++ b/builtin/fast-import.c
@@ -1,4 +1,5 @@
 #include "builtin.h"
+#include "abspath.h"
 #include "cache.h"
 #include "gettext.h"
 #include "hex.h"
diff --git a/builtin/fsmonitor--daemon.c b/builtin/fsmonitor--daemon.c
index 215e3813d7d..4efb1417344 100644
--- a/builtin/fsmonitor--daemon.c
+++ b/builtin/fsmonitor--daemon.c
@@ -1,4 +1,5 @@
 #include "builtin.h"
+#include "abspath.h"
 #include "alloc.h"
 #include "config.h"
 #include "gettext.h"
diff --git a/builtin/gc.c b/builtin/gc.c
index 32cabad7cf6..ef063fc828c 100644
--- a/builtin/gc.c
+++ b/builtin/gc.c
@@ -11,6 +11,7 @@
  */
 
 #include "builtin.h"
+#include "abspath.h"
 #include "hex.h"
 #include "repository.h"
 #include "config.h"
diff --git a/builtin/hash-object.c b/builtin/hash-object.c
index f233eda7590..7651a7a5f56 100644
--- a/builtin/hash-object.c
+++ b/builtin/hash-object.c
@@ -5,6 +5,7 @@
  * Copyright (C) Junio C Hamano, 2005
  */
 #include "builtin.h"
+#include "abspath.h"
 #include "config.h"
 #include "gettext.h"
 #include "hex.h"
diff --git a/builtin/init-db.c b/builtin/init-db.c
index e182bc7e839..6f724f694f4 100644
--- a/builtin/init-db.c
+++ b/builtin/init-db.c
@@ -4,6 +4,7 @@
  * Copyright (C) Linus Torvalds, 2005
  */
 #include "cache.h"
+#include "abspath.h"
 #include "config.h"
 #include "gettext.h"
 #include "refs.h"
diff --git a/builtin/log.c b/builtin/log.c
index e702cf126e5..b7333b34cce 100644
--- a/builtin/log.c
+++ b/builtin/log.c
@@ -5,6 +5,7 @@
  *		 2006 Junio Hamano
  */
 #include "git-compat-util.h"
+#include "abspath.h"
 #include "alloc.h"
 #include "config.h"
 #include "gettext.h"
diff --git a/builtin/mailinfo.c b/builtin/mailinfo.c
index e8bb011cfb4..e14f7c0abce 100644
--- a/builtin/mailinfo.c
+++ b/builtin/mailinfo.c
@@ -3,6 +3,7 @@
  * email to figure out authorship and subject
  */
 #include "cache.h"
+#include "abspath.h"
 #include "builtin.h"
 #include "gettext.h"
 #include "utf8.h"
diff --git a/builtin/merge-file.c b/builtin/merge-file.c
index ae45f523b95..c0096ee0810 100644
--- a/builtin/merge-file.c
+++ b/builtin/merge-file.c
@@ -1,4 +1,5 @@
 #include "builtin.h"
+#include "abspath.h"
 #include "cache.h"
 #include "config.h"
 #include "gettext.h"
diff --git a/builtin/merge.c b/builtin/merge.c
index 2c9da4b23d1..38243e55c5f 100644
--- a/builtin/merge.c
+++ b/builtin/merge.c
@@ -8,6 +8,7 @@
 
 #define USE_THE_INDEX_VARIABLE
 #include "cache.h"
+#include "abspath.h"
 #include "alloc.h"
 #include "config.h"
 #include "environment.h"
diff --git a/builtin/multi-pack-index.c b/builtin/multi-pack-index.c
index e6757a44470..579bc2cac0c 100644
--- a/builtin/multi-pack-index.c
+++ b/builtin/multi-pack-index.c
@@ -1,4 +1,5 @@
 #include "builtin.h"
+#include "abspath.h"
 #include "cache.h"
 #include "config.h"
 #include "gettext.h"
diff --git a/builtin/mv.c b/builtin/mv.c
index c02dddb72b5..0a49bf21b0f 100644
--- a/builtin/mv.c
+++ b/builtin/mv.c
@@ -5,6 +5,7 @@
  */
 #define USE_THE_INDEX_VARIABLE
 #include "builtin.h"
+#include "abspath.h"
 #include "alloc.h"
 #include "config.h"
 #include "gettext.h"
diff --git a/builtin/rebase.c b/builtin/rebase.c
index a2c68b8ff7b..a3f8be88882 100644
--- a/builtin/rebase.c
+++ b/builtin/rebase.c
@@ -6,6 +6,7 @@
 
 #define USE_THE_INDEX_VARIABLE
 #include "builtin.h"
+#include "abspath.h"
 #include "gettext.h"
 #include "hex.h"
 #include "run-command.h"
diff --git a/builtin/receive-pack.c b/builtin/receive-pack.c
index 006565f8513..aec5ee930b2 100644
--- a/builtin/receive-pack.c
+++ b/builtin/receive-pack.c
@@ -1,4 +1,5 @@
 #include "builtin.h"
+#include "abspath.h"
 #include "repository.h"
 #include "config.h"
 #include "gettext.h"
diff --git a/builtin/rev-parse.c b/builtin/rev-parse.c
index 5a932a861b4..a4c0878bc91 100644
--- a/builtin/rev-parse.c
+++ b/builtin/rev-parse.c
@@ -5,6 +5,7 @@
  */
 #define USE_THE_INDEX_VARIABLE
 #include "cache.h"
+#include "abspath.h"
 #include "alloc.h"
 #include "config.h"
 #include "commit.h"
diff --git a/builtin/stash.c b/builtin/stash.c
index 65817d0b763..52fa892f7eb 100644
--- a/builtin/stash.c
+++ b/builtin/stash.c
@@ -1,5 +1,6 @@
 #define USE_THE_INDEX_VARIABLE
 #include "builtin.h"
+#include "abspath.h"
 #include "config.h"
 #include "gettext.h"
 #include "hex.h"
diff --git a/builtin/submodule--helper.c b/builtin/submodule--helper.c
index a4bdd44daa3..ff1fd8c87ab 100644
--- a/builtin/submodule--helper.c
+++ b/builtin/submodule--helper.c
@@ -1,5 +1,6 @@
 #define USE_THE_INDEX_VARIABLE
 #include "builtin.h"
+#include "abspath.h"
 #include "alloc.h"
 #include "gettext.h"
 #include "hex.h"
diff --git a/builtin/worktree.c b/builtin/worktree.c
index ed89b7e9725..ed614ffddcb 100644
--- a/builtin/worktree.c
+++ b/builtin/worktree.c
@@ -1,4 +1,5 @@
 #include "cache.h"
+#include "abspath.h"
 #include "checkout.h"
 #include "config.h"
 #include "builtin.h"
diff --git a/cache.h b/cache.h
index e122de6f930..260203c7a62 100644
--- a/cache.h
+++ b/cache.h
@@ -598,21 +598,6 @@ const char *setup_git_directory(void);
 char *prefix_path(const char *prefix, int len, const char *path);
 char *prefix_path_gently(const char *prefix, int len, int *remaining, const char *path);
 
-/*
- * Concatenate "prefix" (if len is non-zero) and "path", with no
- * connecting characters (so "prefix" should end with a "/").
- * Unlike prefix_path, this should be used if the named file does
- * not have to interact with index entry; i.e. name of a random file
- * on the filesystem.
- *
- * The return value is always a newly allocated string (even if the
- * prefix was empty).
- */
-char *prefix_filename(const char *prefix, const char *path);
-
-/* Likewise, but path=="-" always yields "-" */
-char *prefix_filename_except_for_dash(const char *prefix, const char *path);
-
 int check_filename(const char *prefix, const char *name);
 void verify_filename(const char *prefix,
 		     const char *name,
@@ -1160,18 +1145,6 @@ char *interpolate_path(const char *path, int real_home);
 /* NEEDSWORK: remove this synonym once in-flight topics have migrated */
 #define expand_user_path interpolate_path
 const char *enter_repo(const char *path, int strict);
-static inline int is_absolute_path(const char *path)
-{
-	return is_dir_sep(path[0]) || has_dos_drive_prefix(path);
-}
-int is_directory(const char *);
-char *strbuf_realpath(struct strbuf *resolved, const char *path,
-		      int die_on_error);
-char *strbuf_realpath_forgiving(struct strbuf *resolved, const char *path,
-				int die_on_error);
-char *real_pathdup(const char *path, int die_on_error);
-const char *absolute_path(const char *path);
-char *absolute_pathdup(const char *path);
 const char *remove_leading_path(const char *in, const char *prefix);
 const char *relative_path(const char *in, const char *prefix, struct strbuf *sb);
 int normalize_path_copy_len(char *dst, const char *src, int *prefix_len);
diff --git a/chdir-notify.c b/chdir-notify.c
index 5f7f2c2ac23..929ec01b3a2 100644
--- a/chdir-notify.c
+++ b/chdir-notify.c
@@ -1,4 +1,5 @@
 #include "cache.h"
+#include "abspath.h"
 #include "chdir-notify.h"
 #include "list.h"
 #include "strbuf.h"
diff --git a/compat/disk.h b/compat/disk.h
index a04a8d294af..6c979c27d89 100644
--- a/compat/disk.h
+++ b/compat/disk.h
@@ -2,6 +2,7 @@
 #define COMPAT_DISK_H
 
 #include "git-compat-util.h"
+#include "abspath.h"
 #include "gettext.h"
 
 static int get_disk_info(struct strbuf *out)
diff --git a/compat/mingw.c b/compat/mingw.c
index a9e5570288c..cbcd03aea9b 100644
--- a/compat/mingw.c
+++ b/compat/mingw.c
@@ -7,6 +7,7 @@
 #include "../strbuf.h"
 #include "../run-command.h"
 #include "../cache.h"
+#include "../abspath.h"
 #include "../alloc.h"
 #include "win32/lazyload.h"
 #include "../config.h"
diff --git a/compat/simple-ipc/ipc-win32.c b/compat/simple-ipc/ipc-win32.c
index f011e5cead8..997f6144344 100644
--- a/compat/simple-ipc/ipc-win32.c
+++ b/compat/simple-ipc/ipc-win32.c
@@ -1,4 +1,5 @@
 #include "cache.h"
+#include "abspath.h"
 #include "gettext.h"
 #include "simple-ipc.h"
 #include "strbuf.h"
diff --git a/config.c b/config.c
index f30a6d8e686..6815919ec30 100644
--- a/config.c
+++ b/config.c
@@ -6,6 +6,7 @@
  *
  */
 #include "cache.h"
+#include "abspath.h"
 #include "alloc.h"
 #include "date.h"
 #include "branch.h"
diff --git a/credential.c b/credential.c
index 5244f3c12c0..e6417bf8804 100644
--- a/credential.c
+++ b/credential.c
@@ -1,4 +1,5 @@
 #include "cache.h"
+#include "abspath.h"
 #include "config.h"
 #include "credential.h"
 #include "gettext.h"
diff --git a/daemon.c b/daemon.c
index 8908e7f8d2a..bb795ca3ca9 100644
--- a/daemon.c
+++ b/daemon.c
@@ -1,4 +1,5 @@
 #include "cache.h"
+#include "abspath.h"
 #include "alloc.h"
 #include "config.h"
 #include "pkt-line.h"
diff --git a/diff-no-index.c b/diff-no-index.c
index 287a113badd..934a24bee58 100644
--- a/diff-no-index.c
+++ b/diff-no-index.c
@@ -5,6 +5,7 @@
  */
 
 #include "cache.h"
+#include "abspath.h"
 #include "color.h"
 #include "commit.h"
 #include "blob.h"
diff --git a/diff.c b/diff.c
index 00746f2f86e..1b0be99c065 100644
--- a/diff.c
+++ b/diff.c
@@ -2,6 +2,7 @@
  * Copyright (C) 2005 Junio C Hamano
  */
 #include "cache.h"
+#include "abspath.h"
 #include "alloc.h"
 #include "config.h"
 #include "gettext.h"
diff --git a/dir.c b/dir.c
index 46f1bb6e5b7..c72481c60ee 100644
--- a/dir.c
+++ b/dir.c
@@ -6,6 +6,7 @@
  *		 Junio Hamano, 2005-2006
  */
 #include "git-compat-util.h"
+#include "abspath.h"
 #include "alloc.h"
 #include "config.h"
 #include "dir.h"
diff --git a/editor.c b/editor.c
index 58e790548d2..2d3e6be64e4 100644
--- a/editor.c
+++ b/editor.c
@@ -1,4 +1,5 @@
 #include "cache.h"
+#include "abspath.h"
 #include "config.h"
 #include "gettext.h"
 #include "strbuf.h"
diff --git a/environment.c b/environment.c
index 82a1fc17d0b..c69571f0b29 100644
--- a/environment.c
+++ b/environment.c
@@ -8,6 +8,7 @@
  * are.
  */
 #include "cache.h"
+#include "abspath.h"
 #include "branch.h"
 #include "environment.h"
 #include "gettext.h"
diff --git a/exec-cmd.c b/exec-cmd.c
index 282d95af081..042d9247a5b 100644
--- a/exec-cmd.c
+++ b/exec-cmd.c
@@ -1,4 +1,5 @@
 #include "cache.h"
+#include "abspath.h"
 #include "exec-cmd.h"
 #include "gettext.h"
 #include "quote.h"
diff --git a/gettext.c b/gettext.c
index f139008d0a3..3e7b3baabc6 100644
--- a/gettext.c
+++ b/gettext.c
@@ -3,6 +3,7 @@
  */
 
 #include "cache.h"
+#include "abspath.h"
 #include "exec-cmd.h"
 #include "gettext.h"
 #include "strbuf.h"
diff --git a/lockfile.c b/lockfile.c
index ab6490a391d..673c21d17a9 100644
--- a/lockfile.c
+++ b/lockfile.c
@@ -3,6 +3,7 @@
  */
 
 #include "cache.h"
+#include "abspath.h"
 #include "gettext.h"
 #include "lockfile.h"
 
diff --git a/midx.c b/midx.c
index e132ef250e4..b111665dcab 100644
--- a/midx.c
+++ b/midx.c
@@ -1,4 +1,5 @@
 #include "git-compat-util.h"
+#include "abspath.h"
 #include "alloc.h"
 #include "config.h"
 #include "csum-file.h"
diff --git a/object-file.c b/object-file.c
index 39660d49dbc..bee41b30474 100644
--- a/object-file.c
+++ b/object-file.c
@@ -7,6 +7,7 @@
  * creation etc.
  */
 #include "git-compat-util.h"
+#include "abspath.h"
 #include "alloc.h"
 #include "config.h"
 #include "gettext.h"
diff --git a/parse-options.c b/parse-options.c
index 084b4f10621..a577cc85f67 100644
--- a/parse-options.c
+++ b/parse-options.c
@@ -1,5 +1,6 @@
 #include "git-compat-util.h"
 #include "parse-options.h"
+#include "abspath.h"
 #include "cache.h"
 #include "config.h"
 #include "commit.h"
diff --git a/path.c b/path.c
index 3f2702cbe49..3976c0d7ace 100644
--- a/path.c
+++ b/path.c
@@ -2,6 +2,7 @@
  * Utilities for paths and pathnames
  */
 #include "cache.h"
+#include "abspath.h"
 #include "gettext.h"
 #include "hex.h"
 #include "repository.h"
diff --git a/pathspec.c b/pathspec.c
index 868b4d280ca..53763e272f5 100644
--- a/pathspec.c
+++ b/pathspec.c
@@ -1,4 +1,5 @@
 #include "cache.h"
+#include "abspath.h"
 #include "config.h"
 #include "dir.h"
 #include "gettext.h"
diff --git a/remote.c b/remote.c
index edb1e07497c..2bae247a0a4 100644
--- a/remote.c
+++ b/remote.c
@@ -1,4 +1,5 @@
 #include "cache.h"
+#include "abspath.h"
 #include "alloc.h"
 #include "config.h"
 #include "gettext.h"
diff --git a/repository.c b/repository.c
index 937fa974b38..4412f633224 100644
--- a/repository.c
+++ b/repository.c
@@ -4,6 +4,7 @@
  */
 #define USE_THE_INDEX_VARIABLE
 #include "cache.h"
+#include "abspath.h"
 #include "repository.h"
 #include "object-store.h"
 #include "config.h"
diff --git a/rerere.c b/rerere.c
index 9428cbca7b2..c3258e13902 100644
--- a/rerere.c
+++ b/rerere.c
@@ -1,4 +1,5 @@
 #include "git-compat-util.h"
+#include "abspath.h"
 #include "alloc.h"
 #include "config.h"
 #include "gettext.h"
diff --git a/scalar.c b/scalar.c
index ca19b95ce46..fe61a3ebdd7 100644
--- a/scalar.c
+++ b/scalar.c
@@ -3,6 +3,7 @@
  */
 
 #include "cache.h"
+#include "abspath.h"
 #include "gettext.h"
 #include "parse-options.h"
 #include "config.h"
diff --git a/sequencer.c b/sequencer.c
index 7fa776b0615..c61c1fc4d87 100644
--- a/sequencer.c
+++ b/sequencer.c
@@ -1,4 +1,5 @@
 #include "cache.h"
+#include "abspath.h"
 #include "alloc.h"
 #include "config.h"
 #include "environment.h"
diff --git a/setup.c b/setup.c
index 8a4ccee4c2c..8f385d9f29b 100644
--- a/setup.c
+++ b/setup.c
@@ -1,4 +1,5 @@
 #include "cache.h"
+#include "abspath.h"
 #include "gettext.h"
 #include "repository.h"
 #include "config.h"
diff --git a/strbuf.c b/strbuf.c
index b9cd593b147..9633e37b62f 100644
--- a/strbuf.c
+++ b/strbuf.c
@@ -1,4 +1,5 @@
 #include "cache.h"
+#include "abspath.h"
 #include "alloc.h"
 #include "environment.h"
 #include "gettext.h"
diff --git a/submodule.c b/submodule.c
index 8b551e53274..13ff333f68c 100644
--- a/submodule.c
+++ b/submodule.c
@@ -1,4 +1,5 @@
 #include "cache.h"
+#include "abspath.h"
 #include "alloc.h"
 #include "repository.h"
 #include "config.h"
diff --git a/t/helper/test-path-utils.c b/t/helper/test-path-utils.c
index f69709d674f..d3d00dc34fa 100644
--- a/t/helper/test-path-utils.c
+++ b/t/helper/test-path-utils.c
@@ -1,5 +1,6 @@
 #include "test-tool.h"
 #include "cache.h"
+#include "abspath.h"
 #include "string-list.h"
 #include "utf8.h"
 
diff --git a/tmp-objdir.c b/tmp-objdir.c
index 2a2012eb6d0..fff15cb6b5c 100644
--- a/tmp-objdir.c
+++ b/tmp-objdir.c
@@ -1,5 +1,6 @@
 #include "cache.h"
 #include "tmp-objdir.h"
+#include "abspath.h"
 #include "chdir-notify.h"
 #include "dir.h"
 #include "sigchain.h"
diff --git a/trace.c b/trace.c
index efa4e2d8e08..2b41c683fc8 100644
--- a/trace.c
+++ b/trace.c
@@ -22,6 +22,7 @@
  */
 
 #include "cache.h"
+#include "abspath.h"
 #include "quote.h"
 
 struct trace_key trace_default_key = { "GIT_TRACE", 0, 0, 0 };
diff --git a/trace2/tr2_dst.c b/trace2/tr2_dst.c
index 8a21dd29725..273260e1f18 100644
--- a/trace2/tr2_dst.c
+++ b/trace2/tr2_dst.c
@@ -1,4 +1,5 @@
 #include "cache.h"
+#include "abspath.h"
 #include "sigchain.h"
 #include "trace2/tr2_dst.h"
 #include "trace2/tr2_sid.h"
diff --git a/worktree.c b/worktree.c
index 09eb522e5a9..b7bc4c7bb7a 100644
--- a/worktree.c
+++ b/worktree.c
@@ -1,4 +1,5 @@
 #include "cache.h"
+#include "abspath.h"
 #include "alloc.h"
 #include "gettext.h"
 #include "repository.h"
diff --git a/wrapper.c b/wrapper.c
index 0d4ceba6fc5..df1fa6286d0 100644
--- a/wrapper.c
+++ b/wrapper.c
@@ -2,6 +2,7 @@
  * Various trivial helper wrappers around standard functions
  */
 #include "cache.h"
+#include "abspath.h"
 #include "config.h"
 #include "gettext.h"
 
-- 
gitgitgadget

