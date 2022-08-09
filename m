Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33905C3F6B0
	for <git@archiver.kernel.org>; Tue,  9 Aug 2022 19:09:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345832AbiHITJt (ORCPT <rfc822;git@archiver.kernel.org>);
        Tue, 9 Aug 2022 15:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345721AbiHITJI (ORCPT <rfc822;git@vger.kernel.org>);
        Tue, 9 Aug 2022 15:09:08 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E89BE22510
        for <git@vger.kernel.org>; Tue,  9 Aug 2022 11:55:31 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id n4so13535485wrp.10
        for <git@vger.kernel.org>; Tue, 09 Aug 2022 11:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=v4O8So/flSbWMAld2f6/XrXeOJdFqXo/wD/5BCK4Ra4=;
        b=Q4eaaqSXlGVR/lMz3sqpTSLR7s3HqObPncfbEMcmLdEE8Paj21meLTTC8nbbGXuvwu
         m1tLq3haX9JgIfmWly4Uz12CtNfH+BdX/58phH//gL+DC6QGJzOlSq2V2f8v1g9EtjHd
         oLwhs7RDwaeDFuUyKsPGBGK/O57iED/IacHm9jszljrSD0JFun9oZvwRqi3fLkHwwXrv
         02BAPMaqhQEE9iuMX74dhHqci+XlqtGvFzaLgGRMCJ0oxI8BcTOnUARSaRc12Go4SaV8
         mhTwYQHFO3oSERaAnb4s/u5/nzqy/k3X6uzTcjbcQOjMqTNgzBKQt+VNvKQpM9kzWcWr
         QEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=v4O8So/flSbWMAld2f6/XrXeOJdFqXo/wD/5BCK4Ra4=;
        b=cT5RdzBCrN1SITmVgdmNl0pd92rsFTWrPqwAiaerP3M1VPLV71ZMcv43r8VY5jmPW7
         fv0J9MGGy0D3V8pXxc6BTBxdudObmSGwznlSqLskuCk7753qupEZxhcdR3aJzYyy/oXz
         bqKIzLmZikz8aO+kN/sd1bHx8WKGI9rlLQC9vH4eRwYGhdC1NN4+MFK4H+6vtGbqkaZC
         r3777s913RYd16QeYM7OISDHJ+ZvJpHOR/Be71AfPAWjnbvW4G7PD0oXeGNNLim0J31m
         IUROTouCCwewvo9a0T8+PqHSgB897LUd+SMXxdEogk1t1aK7C0lENKmo9CL+R2DgyCS3
         Fa5w==
X-Gm-Message-State: ACgBeo2OuC909XHJcgPdXUcB3cgq5L91OE1k5rEBzO3NOKC4Vmh2CZ6q
        E9VYIiKFFl37a6ldjea27PSyE6Mkwbk=
X-Google-Smtp-Source: AA6agR5ZUr28h+jODCkdGdXh1OHI0iJDEM/uj//EMtMXDy/kP+yWFrTp+iRaoXI2OvZAilD0blPDvQ==
X-Received: by 2002:a05:6000:1f0e:b0:221:6dd6:a2a3 with SMTP id bv14-20020a0560001f0e00b002216dd6a2a3mr13138172wrb.574.1660071330309;
        Tue, 09 Aug 2022 11:55:30 -0700 (PDT)
Received: from ylate.lan (89-81-181-244.abo.bbox.fr. [89.81.181.244])
        by smtp.googlemail.com with ESMTPSA id j9-20020a05600c1c0900b003a529b7bc27sm13237414wms.9.2022.08.09.11.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 11:55:30 -0700 (PDT)
From:   Alban Gruin <alban.gruin@gmail.com>
To:     git@vger.kernel.org
Cc:     Junio C Hamano <gitster@pobox.com>,
        Phillip Wood <phillip.wood123@gmail.com>,
        Johannes Schindelin <Johannes.Schindelin@gmx.de>,
        Alban Gruin <alban.gruin@gmail.com>
Subject: [PATCH v8 07/14] merge-one-file: rewrite in C
Date:   Tue,  9 Aug 2022 20:54:22 +0200
Message-Id: <20220809185429.20098-8-alban.gruin@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220809185429.20098-1-alban.gruin@gmail.com>
References: <20210317204939.17890-1-alban.gruin@gmail.com>
 <20220809185429.20098-1-alban.gruin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

This rewrites `git merge-one-file' from shell to C.  This port is not
completely straightforward: to save precious cycles by avoiding reading
and flushing the index repeatedly, write temporary files when an
operation can be performed in-memory, or allow other function to use the
rewrite without forking nor worrying about the index, the calls to
external processes are replaced by calls to functions in libgit.a:

 - calls to `update-index --add --cacheinfo' are replaced by calls to
   add_to_index_cacheinfo();

 - calls to `update-index --remove' are replaced by calls to
   remove_file_from_index();

 - calls to `checkout-index -u -f' are replaced by calls to
   checkout_entry();

 - calls to `unpack-file' and `merge-files' are replaced by calls to
   read_mmblob() and xdl_merge(), respectively, to merge files
   in-memory;

 - calls to `checkout-index -f --stage=2' are removed, as this is needed
   to have the correct permission bits on the merged file from the
   script, but not in the C version;

 - calls to `update-index' are replaced by calls to add_file_to_index().

The bulk of the rewrite is done in a new file in libgit.a,
merge-strategies.c.  This will enable the resolve and octopus strategies
to directly call it instead of forking.

This also fixes a bug present in the original script: instead of
checking if a _regular_ file exists when a file exists in the branch to
merge, but not in our branch, the rewritten version checks if a file of
any kind (ie. a directory, ...) exists.  This fixes the tests t6035.14,
where the branch to merge had a new file, `a/b', but our branch had a
directory there; it should have failed because a directory exists, but
it did not because there was no regular file called `a/b'.  This test is
now marked as successful.

This also teaches `merge-index' to call merge_three_way() (when invoked
with `--use=merge-one-file') without forking using a new callback,
merge_one_file_func().

To avoid any issue with a shrinking index because of the merge function
used (directly in the process or by forking), as described earlier, the
iterator of the loop of merge_all_index() is increased by the number of
entries with the same name, minus the difference between the number of
entries in the index before and after the merge.

This should handle a shrinking index correctly, but could lead to issues
with a growing index.  However, this case is not treated, as there is no
callback that can produce such a case.

Signed-off-by: Alban Gruin <alban.gruin@gmail.com>
---
 Makefile                        |   2 +-
 builtin.h                       |   1 +
 builtin/merge-index.c           |   4 +-
 builtin/merge-one-file.c        |  92 ++++++++++++++
 git-merge-one-file.sh           | 167 -------------------------
 git.c                           |   1 +
 merge-strategies.c              | 208 +++++++++++++++++++++++++++++++-
 merge-strategies.h              |  13 ++
 t/t6060-merge-index.sh          |   2 +-
 t/t6415-merge-dir-to-symlink.sh |   2 +-
 10 files changed, 317 insertions(+), 175 deletions(-)
 create mode 100644 builtin/merge-one-file.c
 delete mode 100755 git-merge-one-file.sh

diff --git a/Makefile b/Makefile
index 40d1be4e5e..e2e6cbbb41 100644
--- a/Makefile
+++ b/Makefile
@@ -631,7 +631,6 @@ SCRIPT_SH += git-bisect.sh
 SCRIPT_SH += git-difftool--helper.sh
 SCRIPT_SH += git-filter-branch.sh
 SCRIPT_SH += git-merge-octopus.sh
-SCRIPT_SH += git-merge-one-file.sh
 SCRIPT_SH += git-merge-resolve.sh
 SCRIPT_SH += git-mergetool.sh
 SCRIPT_SH += git-quiltimport.sh
@@ -1186,6 +1185,7 @@ BUILTIN_OBJS += builtin/mailsplit.o
 BUILTIN_OBJS += builtin/merge-base.o
 BUILTIN_OBJS += builtin/merge-file.o
 BUILTIN_OBJS += builtin/merge-index.o
+BUILTIN_OBJS += builtin/merge-one-file.o
 BUILTIN_OBJS += builtin/merge-ours.o
 BUILTIN_OBJS += builtin/merge-recursive.o
 BUILTIN_OBJS += builtin/merge-tree.o
diff --git a/builtin.h b/builtin.h
index 40e9ecc848..cdbe91bbe8 100644
--- a/builtin.h
+++ b/builtin.h
@@ -182,6 +182,7 @@ int cmd_merge_base(int argc, const char **argv, const char *prefix);
 int cmd_merge_index(int argc, const char **argv, const char *prefix);
 int cmd_merge_ours(int argc, const char **argv, const char *prefix);
 int cmd_merge_file(int argc, const char **argv, const char *prefix);
+int cmd_merge_one_file(int argc, const char **argv, const char *prefix);
 int cmd_merge_recursive(int argc, const char **argv, const char *prefix);
 int cmd_merge_tree(int argc, const char **argv, const char *prefix);
 int cmd_mktag(int argc, const char **argv, const char *prefix);
diff --git a/builtin/merge-index.c b/builtin/merge-index.c
index aba3ba5694..a242b357f8 100644
--- a/builtin/merge-index.c
+++ b/builtin/merge-index.c
@@ -72,9 +72,11 @@ int cmd_merge_index(int argc, const char **argv, const char *prefix)
 
 	if (skip_prefix(pgm, "--use=", &use_internal)) {
 		if (!strcmp(use_internal, "merge-one-file"))
-			pgm = "git-merge-one-file";
+			merge_action = merge_one_file_func;
 		else
 			die(_("git merge-index: unknown internal program %s"), use_internal);
+
+		repo_hold_locked_index(r, &lock, LOCK_DIE_ON_ERROR);
 	}
 
 	for (; i < argc; i++) {
diff --git a/builtin/merge-one-file.c b/builtin/merge-one-file.c
new file mode 100644
index 0000000000..ec718cc1c9
--- /dev/null
+++ b/builtin/merge-one-file.c
@@ -0,0 +1,92 @@
+/*
+ * Builtin "git merge-one-file"
+ *
+ * Copyright (c) 2020 Alban Gruin
+ *
+ * Based on git-merge-one-file.sh, written by Linus Torvalds.
+ *
+ * This is the git per-file merge utility, called with
+ *
+ *   argv[1] - original file object name (or empty)
+ *   argv[2] - file in branch1 object name (or empty)
+ *   argv[3] - file in branch2 object name (or empty)
+ *   argv[4] - pathname in repository
+ *   argv[5] - original file mode (or empty)
+ *   argv[6] - file in branch1 mode (or empty)
+ *   argv[7] - file in branch2 mode (or empty)
+ *
+ * Handle some trivial cases. The _really_ trivial cases have been
+ * handled already by git read-tree, but that one doesn't do any merges
+ * that might change the tree layout.
+ */
+
+#include "cache.h"
+#include "builtin.h"
+#include "lockfile.h"
+#include "merge-strategies.h"
+
+static const char builtin_merge_one_file_usage[] =
+	"git merge-one-file <orig blob> <our blob> <their blob> <path> "
+	"<orig mode> <our mode> <their mode>\n\n"
+	"Blob ids and modes should be empty for missing files.";
+
+static int read_param(const char *name, const char *arg_blob, const char *arg_mode,
+		      struct object_id *blob, struct object_id **p_blob, unsigned int *mode)
+{
+	if (*arg_blob && !get_oid_hex(arg_blob, blob)) {
+		char *last;
+
+		*p_blob = blob;
+		*mode = strtol(arg_mode, &last, 8);
+
+		if (*last)
+			return error(_("invalid '%s' mode: expected nothing, got '%c'"), name, *last);
+		else if (!(S_ISREG(*mode) || S_ISDIR(*mode) || S_ISLNK(*mode)))
+			return error(_("invalid '%s' mode: %o"), name, *mode);
+	} else if (!*arg_blob && *arg_mode)
+		return error(_("no '%s' object id given, but a mode was still given."), name);
+
+	return 0;
+}
+
+int cmd_merge_one_file(int argc, const char **argv, const char *prefix)
+{
+	struct object_id orig_blob, our_blob, their_blob,
+		*p_orig_blob = NULL, *p_our_blob = NULL, *p_their_blob = NULL;
+	unsigned int orig_mode = 0, our_mode = 0, their_mode = 0, ret = 0;
+	struct lock_file lock = LOCK_INIT;
+	struct repository *r = the_repository;
+
+	if (argc != 8)
+		usage(builtin_merge_one_file_usage);
+
+	if (repo_read_index(r) < 0)
+		die("invalid index");
+
+	repo_hold_locked_index(r, &lock, LOCK_DIE_ON_ERROR);
+
+	if (read_param("orig", argv[1], argv[5], &orig_blob,
+		       &p_orig_blob, &orig_mode))
+		ret = -1;
+
+	if (read_param("our", argv[2], argv[6], &our_blob,
+		       &p_our_blob, &our_mode))
+		ret = -1;
+
+	if (read_param("their", argv[3], argv[7], &their_blob,
+		       &p_their_blob, &their_mode))
+		ret = -1;
+
+	if (ret)
+		return ret;
+
+	ret = merge_three_way(r->index, p_orig_blob, p_our_blob, p_their_blob,
+			      argv[4], orig_mode, our_mode, their_mode);
+
+	if (ret) {
+		rollback_lock_file(&lock);
+		return !!ret;
+	}
+
+	return write_locked_index(r->index, &lock, COMMIT_LOCK);
+}
diff --git a/git-merge-one-file.sh b/git-merge-one-file.sh
deleted file mode 100755
index f6d9852d2f..0000000000
--- a/git-merge-one-file.sh
+++ /dev/null
@@ -1,167 +0,0 @@
-#!/bin/sh
-#
-# Copyright (c) Linus Torvalds, 2005
-#
-# This is the git per-file merge script, called with
-#
-#   $1 - original file SHA1 (or empty)
-#   $2 - file in branch1 SHA1 (or empty)
-#   $3 - file in branch2 SHA1 (or empty)
-#   $4 - pathname in repository
-#   $5 - original file mode (or empty)
-#   $6 - file in branch1 mode (or empty)
-#   $7 - file in branch2 mode (or empty)
-#
-# Handle some trivial cases.. The _really_ trivial cases have
-# been handled already by git read-tree, but that one doesn't
-# do any merges that might change the tree layout.
-
-USAGE='<orig blob> <our blob> <their blob> <path>'
-USAGE="$USAGE <orig mode> <our mode> <their mode>"
-LONG_USAGE="usage: git merge-one-file $USAGE
-
-Blob ids and modes should be empty for missing files."
-
-SUBDIRECTORY_OK=Yes
-. git-sh-setup
-cd_to_toplevel
-require_work_tree
-
-if test $# != 7
-then
-	echo "$LONG_USAGE"
-	exit 1
-fi
-
-case "${1:-.}${2:-.}${3:-.}" in
-#
-# Deleted in both or deleted in one and unchanged in the other
-#
-"$1.." | "$1.$1" | "$1$1.")
-	if { test -z "$6" && test "$5" != "$7"; } ||
-	   { test -z "$7" && test "$5" != "$6"; }
-	then
-		echo "ERROR: File $4 deleted on one branch but had its" >&2
-		echo "ERROR: permissions changed on the other." >&2
-		exit 1
-	fi
-
-	if test -n "$2"
-	then
-		echo "Removing $4"
-	else
-		# read-tree checked that index matches HEAD already,
-		# so we know we do not have this path tracked.
-		# there may be an unrelated working tree file here,
-		# which we should just leave unmolested.  Make sure
-		# we do not have it in the index, though.
-		exec git update-index --remove -- "$4"
-	fi
-	if test -f "$4"
-	then
-		rm -f -- "$4" &&
-		rmdir -p "$(expr "z$4" : 'z\(.*\)/')" 2>/dev/null || :
-	fi &&
-		exec git update-index --remove -- "$4"
-	;;
-
-#
-# Added in one.
-#
-".$2.")
-	# the other side did not add and we added so there is nothing
-	# to be done, except making the path merged.
-	exec git update-index --add --cacheinfo "$6" "$2" "$4"
-	;;
-"..$3")
-	echo "Adding $4"
-	if test -f "$4"
-	then
-		echo "ERROR: untracked $4 is overwritten by the merge." >&2
-		exit 1
-	fi
-	git update-index --add --cacheinfo "$7" "$3" "$4" &&
-		exec git checkout-index -u -f -- "$4"
-	;;
-
-#
-# Added in both, identically (check for same permissions).
-#
-".$3$2")
-	if test "$6" != "$7"
-	then
-		echo "ERROR: File $4 added identically in both branches," >&2
-		echo "ERROR: but permissions conflict $6->$7." >&2
-		exit 1
-	fi
-	echo "Adding $4"
-	git update-index --add --cacheinfo "$6" "$2" "$4" &&
-		exec git checkout-index -u -f -- "$4"
-	;;
-
-#
-# Modified in both, but differently.
-#
-"$1$2$3" | ".$2$3")
-
-	case ",$6,$7," in
-	*,120000,*)
-		echo "ERROR: $4: Not merging symbolic link changes." >&2
-		exit 1
-		;;
-	*,160000,*)
-		echo "ERROR: $4: Not merging conflicting submodule changes." >&2
-		exit 1
-		;;
-	esac
-
-	src1=$(git unpack-file $2)
-	src2=$(git unpack-file $3)
-	case "$1" in
-	'')
-		echo "Added $4 in both, but differently."
-		orig=$(git unpack-file $(git hash-object /dev/null))
-		;;
-	*)
-		echo "Auto-merging $4"
-		orig=$(git unpack-file $1)
-		;;
-	esac
-
-	git merge-file "$src1" "$orig" "$src2"
-	ret=$?
-	msg=
-	if test $ret != 0 || test -z "$1"
-	then
-		msg='content conflict'
-		ret=1
-	fi
-
-	# Create the working tree file, using "our tree" version from the
-	# index, and then store the result of the merge.
-	git checkout-index -f --stage=2 -- "$4" && cat "$src1" >"$4" || exit 1
-	rm -f -- "$orig" "$src1" "$src2"
-
-	if test "$6" != "$7"
-	then
-		if test -n "$msg"
-		then
-			msg="$msg, "
-		fi
-		msg="${msg}permissions conflict: $5->$6,$7"
-		ret=1
-	fi
-
-	if test $ret != 0
-	then
-		echo "ERROR: $msg in $4" >&2
-		exit 1
-	fi
-	exec git update-index -- "$4"
-	;;
-
-*)
-	echo "ERROR: $4: Not handling case $1 -> $2 -> $3" >&2
-	;;
-esac
-exit 1
diff --git a/git.c b/git.c
index e5d62fa5a9..f5d3c6cb39 100644
--- a/git.c
+++ b/git.c
@@ -561,6 +561,7 @@ static struct cmd_struct commands[] = {
 	{ "merge-file", cmd_merge_file, RUN_SETUP_GENTLY },
 	{ "merge-index", cmd_merge_index, RUN_SETUP | NO_PARSEOPT },
 	{ "merge-ours", cmd_merge_ours, RUN_SETUP | NO_PARSEOPT },
+	{ "merge-one-file", cmd_merge_one_file, RUN_SETUP | NEED_WORK_TREE | NO_PARSEOPT },
 	{ "merge-recursive", cmd_merge_recursive, RUN_SETUP | NEED_WORK_TREE | NO_PARSEOPT },
 	{ "merge-recursive-ours", cmd_merge_recursive, RUN_SETUP | NEED_WORK_TREE | NO_PARSEOPT },
 	{ "merge-recursive-theirs", cmd_merge_recursive, RUN_SETUP | NEED_WORK_TREE | NO_PARSEOPT },
diff --git a/merge-strategies.c b/merge-strategies.c
index 418c9dd710..373b69c10b 100644
--- a/merge-strategies.c
+++ b/merge-strategies.c
@@ -1,5 +1,198 @@
 #include "cache.h"
+#include "dir.h"
+#include "entry.h"
 #include "merge-strategies.h"
+#include "xdiff-interface.h"
+
+static int add_merge_result_to_index(struct index_state *istate, unsigned int mode,
+				     const struct object_id *oid, const char *path,
+				     int checkout)
+{
+	struct cache_entry *ce;
+	int res;
+
+	res = add_to_index_cacheinfo(istate, mode, oid, path, 0, 1, 1, &ce);
+	if (res == -1)
+		return error(_("Invalid path '%s'"), path);
+	else if (res == -2)
+		return -1;
+
+	if (checkout) {
+		struct checkout state = CHECKOUT_INIT;
+
+		state.istate = istate;
+		state.force = 1;
+		state.base_dir = "";
+		state.base_dir_len = 0;
+
+		if (checkout_entry(ce, &state, NULL, NULL) < 0)
+			return error(_("%s: cannot checkout file"), path);
+	}
+
+	return 0;
+}
+
+static int merge_one_file_deleted(struct index_state *istate,
+				  const struct object_id *our_blob,
+				  const struct object_id *their_blob, const char *path,
+				  unsigned int orig_mode, unsigned int our_mode, unsigned int their_mode)
+{
+	if ((!our_blob && orig_mode != their_mode) ||
+	    (!their_blob && orig_mode != our_mode))
+		return error(_("File %s deleted on one branch but had its "
+			       "permissions changed on the other."), path);
+
+	if (our_blob) {
+		printf(_("Removing %s\n"), path);
+
+		if (file_exists(path))
+			remove_path(path);
+	}
+
+	if (remove_file_from_index(istate, path))
+		return error("%s: cannot remove from the index", path);
+	return 0;
+}
+
+static int do_merge_one_file(struct index_state *istate,
+			     const struct object_id *orig_blob,
+			     const struct object_id *our_blob,
+			     const struct object_id *their_blob, const char *path,
+			     unsigned int orig_mode, unsigned int our_mode, unsigned int their_mode)
+{
+	int ret, i, dest;
+	ssize_t written;
+	mmbuffer_t result = {NULL, 0};
+	mmfile_t mmfs[3];
+	xmparam_t xmp = {{0}};
+
+	if (our_mode == S_IFLNK || their_mode == S_IFLNK)
+		return error(_("%s: Not merging symbolic link changes."), path);
+	else if (our_mode == S_IFGITLINK || their_mode == S_IFGITLINK)
+		return error(_("%s: Not merging conflicting submodule changes."), path);
+
+	if (orig_blob) {
+		printf(_("Auto-merging %s\n"), path);
+		read_mmblob(mmfs + 0, orig_blob);
+	} else {
+		printf(_("Added %s in both, but differently.\n"), path);
+		read_mmblob(mmfs + 0, null_oid());
+	}
+
+	read_mmblob(mmfs + 1, our_blob);
+	read_mmblob(mmfs + 2, their_blob);
+
+	xmp.level = XDL_MERGE_ZEALOUS_ALNUM;
+	xmp.style = 0;
+	xmp.favor = 0;
+
+	ret = xdl_merge(mmfs + 0, mmfs + 1, mmfs + 2, &xmp, &result);
+
+	for (i = 0; i < 3; i++)
+		free(mmfs[i].ptr);
+
+	if (ret < 0) {
+		free(result.ptr);
+		return error(_("Failed to execute internal merge"));
+	}
+
+	if (ret > 0 || !orig_blob)
+		ret = error(_("content conflict in %s"), path);
+	if (our_mode != their_mode)
+		ret = error(_("permission conflict: %o->%o,%o in %s"),
+			    orig_mode, our_mode, their_mode, path);
+
+	unlink(path);
+	if ((dest = open(path, O_WRONLY | O_CREAT, our_mode)) < 0) {
+		free(result.ptr);
+		return error_errno(_("failed to open file '%s'"), path);
+	}
+
+	written = write_in_full(dest, result.ptr, result.size);
+	close(dest);
+
+	free(result.ptr);
+
+	if (written < 0)
+		return error_errno(_("failed to write to '%s'"), path);
+	if (ret)
+		return ret;
+
+	return add_file_to_index(istate, path, 0);
+}
+
+int merge_three_way(struct index_state *istate,
+		    const struct object_id *orig_blob,
+		    const struct object_id *our_blob,
+		    const struct object_id *their_blob, const char *path,
+		    unsigned int orig_mode, unsigned int our_mode, unsigned int their_mode)
+{
+	if (orig_blob &&
+	    ((!our_blob && !their_blob) ||
+	     (!their_blob && our_blob && oideq(orig_blob, our_blob)) ||
+	     (!our_blob && their_blob && oideq(orig_blob, their_blob)))) {
+		/* Deleted in both or deleted in one and unchanged in the other. */
+		return merge_one_file_deleted(istate, our_blob, their_blob, path,
+					      orig_mode, our_mode, their_mode);
+	} else if (!orig_blob && our_blob && !their_blob) {
+		/*
+		 * Added in ours.  The other side did not add and we
+		 * added so there is nothing to be done, except making
+		 * the path merged.
+		 */
+		return add_merge_result_to_index(istate, our_mode, our_blob, path, 0);
+	} else if (!orig_blob && !our_blob && their_blob) {
+		printf(_("Adding %s\n"), path);
+
+		if (file_exists(path))
+			return error(_("untracked %s is overwritten by the merge."), path);
+
+		return add_merge_result_to_index(istate, their_mode, their_blob, path, 1);
+	} else if (!orig_blob && our_blob && their_blob &&
+		   oideq(our_blob, their_blob)) {
+		/* Added in both, identically (check for same permissions). */
+		if (our_mode != their_mode)
+			return error(_("File %s added identically in both branches, "
+				       "but permissions conflict %o->%o."),
+				     path, our_mode, their_mode);
+
+		printf(_("Adding %s\n"), path);
+
+		return add_merge_result_to_index(istate, our_mode, our_blob, path, 1);
+	} else if (our_blob && their_blob) {
+		/* Modified in both, but differently. */
+		return do_merge_one_file(istate,
+					 orig_blob, our_blob, their_blob, path,
+					 orig_mode, our_mode, their_mode);
+	} else {
+		char orig_hex[GIT_MAX_HEXSZ] = {0}, our_hex[GIT_MAX_HEXSZ] = {0},
+			their_hex[GIT_MAX_HEXSZ] = {0};
+
+		if (orig_blob)
+			oid_to_hex_r(orig_hex, orig_blob);
+		if (our_blob)
+			oid_to_hex_r(our_hex, our_blob);
+		if (their_blob)
+			oid_to_hex_r(their_hex, their_blob);
+
+		return error(_("%s: Not handling case %s -> %s -> %s"),
+			     path, orig_hex, our_hex, their_hex);
+	}
+
+	return 0;
+}
+
+int merge_one_file_func(struct index_state *istate,
+			const struct object_id *orig_blob,
+			const struct object_id *our_blob,
+			const struct object_id *their_blob, const char *path,
+			unsigned int orig_mode, unsigned int our_mode, unsigned int their_mode,
+			void *data)
+{
+	return merge_three_way(istate,
+			       orig_blob, our_blob, their_blob, path,
+			       orig_mode, our_mode, their_mode);
+}
 
 static int merge_entry(struct index_state *istate, unsigned int pos,
 		       const char *path, int *err, merge_fn fn, void *data)
@@ -54,7 +247,7 @@ int merge_all_index(struct index_state *istate, int oneshot, int quiet,
 		    merge_fn fn, void *data)
 {
 	int err = 0, ret;
-	unsigned int i;
+	unsigned int i, prev_nr;
 
 	/* TODO: audit for interaction with sparse-index. */
 	ensure_full_index(istate);
@@ -63,10 +256,17 @@ int merge_all_index(struct index_state *istate, int oneshot, int quiet,
 		if (!ce_stage(ce))
 			continue;
 
+		prev_nr = istate->cache_nr;
 		ret = merge_entry(istate, i, ce->name, &err, fn, data);
-		if (ret > 0)
-			i += ret - 1;
-		else if (ret == -1)
+		if (ret > 0) {
+			/*
+			 * Don't bother handling an index that has
+			 * grown, since merge_one_file_func() can't grow
+			 * it, and merge_one_file_spawn() can't change
+			 * it.
+			 */
+			i += ret - (prev_nr - istate->cache_nr) - 1;
+		} else if (ret == -1)
 			return -1;
 
 		if (err && !oneshot) {
diff --git a/merge-strategies.h b/merge-strategies.h
index 88f476f170..8705a550ca 100644
--- a/merge-strategies.h
+++ b/merge-strategies.h
@@ -3,6 +3,12 @@
 
 #include "object.h"
 
+int merge_three_way(struct index_state *istate,
+		    const struct object_id *orig_blob,
+		    const struct object_id *our_blob,
+		    const struct object_id *their_blob, const char *path,
+		    unsigned int orig_mode, unsigned int our_mode, unsigned int their_mode);
+
 typedef int (*merge_fn)(struct index_state *istate,
 			const struct object_id *orig_blob,
 			const struct object_id *our_blob,
@@ -10,6 +16,13 @@ typedef int (*merge_fn)(struct index_state *istate,
 			unsigned int orig_mode, unsigned int our_mode, unsigned int their_mode,
 			void *data);
 
+int merge_one_file_func(struct index_state *istate,
+			const struct object_id *orig_blob,
+			const struct object_id *our_blob,
+			const struct object_id *their_blob, const char *path,
+			unsigned int orig_mode, unsigned int our_mode, unsigned int their_mode,
+			void *data);
+
 int merge_index_path(struct index_state *istate, int oneshot, int quiet,
 		     const char *path, merge_fn fn, void *data);
 int merge_all_index(struct index_state *istate, int oneshot, int quiet,
diff --git a/t/t6060-merge-index.sh b/t/t6060-merge-index.sh
index 3845a9d3cc..9976996c80 100755
--- a/t/t6060-merge-index.sh
+++ b/t/t6060-merge-index.sh
@@ -70,7 +70,7 @@ test_expect_success 'merge-one-file fails without a work tree' '
 	(cd bare.git &&
 	 GIT_INDEX_FILE=$PWD/merge.index &&
 	 export GIT_INDEX_FILE &&
-	 test_must_fail git merge-index git-merge-one-file -a
+	 test_must_fail git merge-index --use=merge-one-file -a
 	)
 '
 
diff --git a/t/t6415-merge-dir-to-symlink.sh b/t/t6415-merge-dir-to-symlink.sh
index 2655e295f5..10bc5eb8c4 100755
--- a/t/t6415-merge-dir-to-symlink.sh
+++ b/t/t6415-merge-dir-to-symlink.sh
@@ -99,7 +99,7 @@ test_expect_success SYMLINKS 'a/b was resolved as symlink' '
 	test -h a/b
 '
 
-test_expect_failure 'do not lose untracked in merge (resolve)' '
+test_expect_success 'do not lose untracked in merge (resolve)' '
 	git reset --hard &&
 	git checkout baseline^0 &&
 	>a/b/c/e &&
-- 
2.37.1.412.gcfdce49ffd

