Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A71DC4332F
	for <git@archiver.kernel.org>; Fri, 14 Oct 2022 21:46:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbiJNVqM (ORCPT <rfc822;git@archiver.kernel.org>);
        Fri, 14 Oct 2022 17:46:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbiJNVp4 (ORCPT <rfc822;git@vger.kernel.org>);
        Fri, 14 Oct 2022 17:45:56 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CB8363877
        for <git@vger.kernel.org>; Fri, 14 Oct 2022 14:45:53 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id bv10so9550443wrb.4
        for <git@vger.kernel.org>; Fri, 14 Oct 2022 14:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ninSLfwK4PhPZWmT6P0TqP/TyJJ9jFipnqovDaaACaQ=;
        b=NVLSSxEsQqeOQ5+eDBL62xZzYEhjmsQ1tx5qdBYhznu7QsHb7NUC6sxVeBcywW31yN
         PBtlUaZVwG57U+zQIrj7AiPiJDhbJU504DHDZ3iAPIsclL8sZR4KG1CPc9vn7VWQe9FA
         imKkRPqJ4UASyxvQhAxRY/te4bPSMwPmol1HmuPpmh0fsaCOGf54g/PXdKdtG+pvV42A
         oku3F5uB+M0buZPfh8qEVsNDlSlmy9h6jDG5Di3MlrMbla8Lk4JPcCCb4dlp2PKEW6B/
         aAfdhQCS0dgEUYHgm87KpH8SzNuvnvcvyNDoByKNFT/c+DAP5Slr0sX0YLEl5e7/Jzhe
         J8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ninSLfwK4PhPZWmT6P0TqP/TyJJ9jFipnqovDaaACaQ=;
        b=stUtr0cb5KGOdzetJJtln92UzSq61XMJyYVS7PKwjXQjKMkyYlW25WzjVu+YPhKVx/
         uRAhA1OBABxkKVij4bfBINlra/K8uOZCK/zc+rS0Gvpb7va4KM8CyfybldDloDUtjBeZ
         o0tPu3K97Tn0/nXfeQVJxo1Y2Lar5lWXUOVuHmw2F3sM3PfONJ+2quaPuWvAJF6LA6MJ
         iWV1w82DcKoNT4Jo+NxfRG7PgMRprp+HM/mk+lexJqV9MEsbfLePOKY5WmwRu3JSLf68
         yFpfLkpAUcv42/YjEZRnTy/vOrWltC7t09xE5vJViltBx65Uu588NMtV83nAK2pHjYwj
         qwaA==
X-Gm-Message-State: ACrzQf2bTatxjZNgy/UO4lRkKZfK3hYwWOvxqfIUNy5C5H8Z9kopwd96
        bLSg9r/Bz0K6Gm/3ucvtWnSFYNLq+Ic=
X-Google-Smtp-Source: AMsMyM6mO2iMFHzoRRQXdHEmO6etiohJ5JAPmG5VrNcC1y+Psffa7DxYT7V8DR1yWIvZXE3ua8sryg==
X-Received: by 2002:a05:6000:2cd:b0:22e:5cef:4332 with SMTP id o13-20020a05600002cd00b0022e5cef4332mr4533721wry.540.1665783950951;
        Fri, 14 Oct 2022 14:45:50 -0700 (PDT)
Received: from [127.0.0.1] ([13.74.141.28])
        by smtp.gmail.com with ESMTPSA id e9-20020adffc49000000b002206203ed3dsm2727027wrs.29.2022.10.14.14.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 14:45:50 -0700 (PDT)
Message-Id: <d8f20032d6b9e64ecd7e8cdd191cbbc516287dc8.1665783944.git.gitgitgadget@gmail.com>
In-Reply-To: <pull.1352.v2.git.git.1665783944.gitgitgadget@gmail.com>
References: <pull.1352.git.git.1665326258.gitgitgadget@gmail.com>
        <pull.1352.v2.git.git.1665783944.gitgitgadget@gmail.com>
From:   "Eric DeCosta via GitGitGadget" <gitgitgadget@gmail.com>
Date:   Fri, 14 Oct 2022 21:45:36 +0000
Subject: [PATCH v2 04/12] fsmonitor: deal with synthetic firmlinks on macOS
Fcc:    Sent
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
To:     git@vger.kernel.org
Cc:     Eric Sunshine <sunshine@sunshineco.com>,
        =?UTF-8?Q?=C3=86var_Arnfj=C3=B6r=C3=B0?= Bjarmason 
        <avarab@gmail.com>, Eric DeCosta <edecosta@mathworks.com>,
        Eric DeCosta <edecosta@mathworks.com>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

From: Eric DeCosta <edecosta@mathworks.com>

Starting with macOS 10.15 (Catalina), Apple introduced a new feature
called 'firmlinks' in order to separate the boot volume into two
volumes, one read-only and one writable but still present them to the
user as a single volume. Along with this change, Apple removed the
ability to create symlinks in the root directory and replaced them with
'synthetic firmlinks'. See 'man synthetic.conf'

When FSEevents reports the path of changed files, if the path involves
a synthetic firmlink, the path is reported from the point of the
synthetic firmlink and not the real path. For example:

Real path:
/System/Volumes/Data/network/working/directory/foo.txt

Synthetic firmlink:
/network -> /System/Volumes/Data/network

FSEvents path:
/network/working/directory/foo.txt

This causes the FSEvents path to not match against the worktree
directory.

There are several ways in which synthetic firmlinks can be created:
they can be defined in /etc/synthetic.conf, the automounter can create
them, and there may be other means. Simply reading /etc/synthetic.conf
is insufficient. No matter what process creates synthetic firmlinks,
they all get created in the root directory.

Therefore, in order to deal with synthetic firmlinks, the root directory
is scanned and the first possible synthetic firmink that, when resolved,
is a prefix of the worktree is used to map FSEvents paths to worktree
paths.

Signed-off-by: Eric DeCosta <edecosta@mathworks.com>
---
 builtin/fsmonitor--daemon.c              |  8 +++
 compat/fsmonitor/fsm-listen-darwin.c     | 14 +++-
 compat/fsmonitor/fsm-path-utils-darwin.c | 92 ++++++++++++++++++++++++
 compat/fsmonitor/fsm-path-utils-win32.c  | 17 +++++
 fsmonitor--daemon.h                      |  3 +
 fsmonitor-path-utils.h                   | 36 +++++++++-
 6 files changed, 167 insertions(+), 3 deletions(-)

diff --git a/builtin/fsmonitor--daemon.c b/builtin/fsmonitor--daemon.c
index 6e417846d8b..6f30a4f93a7 100644
--- a/builtin/fsmonitor--daemon.c
+++ b/builtin/fsmonitor--daemon.c
@@ -3,6 +3,7 @@
 #include "parse-options.h"
 #include "fsmonitor.h"
 #include "fsmonitor-ipc.h"
+#include "fsmonitor-path-utils.h"
 #include "compat/fsmonitor/fsm-health.h"
 #include "compat/fsmonitor/fsm-listen.h"
 #include "fsmonitor--daemon.h"
@@ -1282,6 +1283,11 @@ static int fsmonitor_run_daemon(void)
 	strbuf_addstr(&state.path_worktree_watch, absolute_path(get_git_work_tree()));
 	state.nr_paths_watching = 1;
 
+	strbuf_init(&state.alias.alias, 0);
+	strbuf_init(&state.alias.points_to, 0);
+	if ((err = fsmonitor__get_alias(state.path_worktree_watch.buf, &state.alias)))
+		goto done;
+
 	/*
 	 * We create and delete cookie files somewhere inside the .git
 	 * directory to help us keep sync with the file system.  If
@@ -1391,6 +1397,8 @@ done:
 	strbuf_release(&state.path_gitdir_watch);
 	strbuf_release(&state.path_cookie_prefix);
 	strbuf_release(&state.path_ipc);
+	strbuf_release(&state.alias.alias);
+	strbuf_release(&state.alias.points_to);
 
 	return err;
 }
diff --git a/compat/fsmonitor/fsm-listen-darwin.c b/compat/fsmonitor/fsm-listen-darwin.c
index 8e208e8289e..daeee4e465c 100644
--- a/compat/fsmonitor/fsm-listen-darwin.c
+++ b/compat/fsmonitor/fsm-listen-darwin.c
@@ -26,6 +26,7 @@
 #include "fsmonitor.h"
 #include "fsm-listen.h"
 #include "fsmonitor--daemon.h"
+#include "fsmonitor-path-utils.h"
 
 struct fsm_listen_data
 {
@@ -198,8 +199,9 @@ static void fsevent_callback(ConstFSEventStreamRef streamRef,
 	struct string_list cookie_list = STRING_LIST_INIT_DUP;
 	const char *path_k;
 	const char *slash;
-	int k;
+	char *resolved = NULL;
 	struct strbuf tmp = STRBUF_INIT;
+	int k;
 
 	/*
 	 * Build a list of all filesystem changes into a private/local
@@ -209,7 +211,12 @@ static void fsevent_callback(ConstFSEventStreamRef streamRef,
 		/*
 		 * On Mac, we receive an array of absolute paths.
 		 */
-		path_k = paths[k];
+		free(resolved);
+		resolved = fsmonitor__resolve_alias(paths[k], &state->alias);
+		if (resolved)
+			path_k = resolved;
+		else
+			path_k = paths[k];
 
 		/*
 		 * If you want to debug FSEvents, log them to GIT_TRACE_FSMONITOR.
@@ -238,6 +245,7 @@ static void fsevent_callback(ConstFSEventStreamRef streamRef,
 			fsmonitor_force_resync(state);
 			fsmonitor_batch__free_list(batch);
 			string_list_clear(&cookie_list, 0);
+			batch = NULL;
 
 			/*
 			 * We assume that any events that we received
@@ -360,12 +368,14 @@ static void fsevent_callback(ConstFSEventStreamRef streamRef,
 		}
 	}
 
+	free(resolved);
 	fsmonitor_publish(state, batch, &cookie_list);
 	string_list_clear(&cookie_list, 0);
 	strbuf_release(&tmp);
 	return;
 
 force_shutdown:
+	free(resolved);
 	fsmonitor_batch__free_list(batch);
 	string_list_clear(&cookie_list, 0);
 
diff --git a/compat/fsmonitor/fsm-path-utils-darwin.c b/compat/fsmonitor/fsm-path-utils-darwin.c
index d46d7f13538..ce5a8febe09 100644
--- a/compat/fsmonitor/fsm-path-utils-darwin.c
+++ b/compat/fsmonitor/fsm-path-utils-darwin.c
@@ -1,5 +1,8 @@
 #include "fsmonitor.h"
 #include "fsmonitor-path-utils.h"
+#include <dirent.h>
+#include <errno.h>
+#include <fcntl.h>
 #include <sys/param.h>
 #include <sys/mount.h>
 
@@ -41,3 +44,92 @@ int fsmonitor__is_fs_remote(const char *path)
 
 	return fs.is_remote;
 }
+
+/*
+ * Scan the root directory for synthetic firmlinks that when resolved
+ * are a prefix of the path, stopping at the first one found.
+ *
+ * Some information about firmlinks and synthetic firmlinks:
+ * https://eclecticlight.co/2020/01/23/catalina-boot-volumes/
+ *
+ * macOS no longer allows symlinks in the root directory; any link found
+ * there is therefore a synthetic firmlink.
+ *
+ * If this function gets called often, will want to cache all the firmlink
+ * information, but for now there is only one caller of this function.
+ *
+ * If there is more than one alias for the path, that is another
+ * matter altogether.
+ */
+int fsmonitor__get_alias(const char *path, struct alias_info *info)
+{
+	DIR *dir;
+	int retval = -1;
+	const char *const root = "/";
+	struct stat st;
+	struct dirent *de;
+	struct strbuf alias;
+	struct strbuf points_to = STRBUF_INIT;
+
+	dir = opendir(root);
+	if (!dir)
+		return error_errno(_("opendir('%s') failed"), root);
+
+	strbuf_init(&alias, 256);
+
+	while ((de = readdir(dir)) != NULL) {
+		strbuf_reset(&alias);
+		strbuf_addf(&alias, "%s%s", root, de->d_name);
+
+		if (lstat(alias.buf, &st) < 0) {
+			error_errno(_("lstat('%s') failed"), alias.buf);
+			goto done;
+		}
+
+		if (!S_ISLNK(st.st_mode))
+			continue;
+
+		if (strbuf_readlink(&points_to, alias.buf, st.st_size) < 0) {
+			error_errno(_("strbuf_readlink('%s') failed"), alias.buf);
+			goto done;
+		}
+
+		if (!strncmp(points_to.buf, path, points_to.len) &&
+			(path[points_to.len] == '/')) {
+			strbuf_addbuf(&info->alias, &alias);
+			strbuf_addbuf(&info->points_to, &points_to);
+			trace_printf_key(&trace_fsmonitor,
+				"Found alias for '%s' : '%s' -> '%s'",
+				path, info->alias.buf, info->points_to.buf);
+			retval = 0;
+			goto done;
+		}
+	}
+	retval = 0; /* no alias */
+
+done:
+	strbuf_release(&alias);
+	strbuf_release(&points_to);
+	if (closedir(dir) < 0)
+		return error_errno(_("closedir('%s') failed"), root);
+	return retval;
+}
+
+char *fsmonitor__resolve_alias(const char *path,
+	const struct alias_info *info)
+{
+	if (!info->alias.len)
+		return NULL;
+
+	if ((!strncmp(info->alias.buf, path, info->alias.len))
+		&& path[info->alias.len] == '/') {
+		struct strbuf tmp = STRBUF_INIT;
+		const char *remainder = path + info->alias.len;
+
+		strbuf_addbuf(&tmp, &info->points_to);
+		strbuf_add(&tmp, remainder, strlen(remainder));
+		return strbuf_detach(&tmp, NULL);
+	}
+
+	return NULL;
+}
diff --git a/compat/fsmonitor/fsm-path-utils-win32.c b/compat/fsmonitor/fsm-path-utils-win32.c
index a90b8f7925b..0d95bbb416f 100644
--- a/compat/fsmonitor/fsm-path-utils-win32.c
+++ b/compat/fsmonitor/fsm-path-utils-win32.c
@@ -126,3 +126,20 @@ int fsmonitor__is_fs_remote(const char *path)
 		return -1;
 	return fs.is_remote;
 }
+
+/*
+ * No-op for now.
+ */
+int fsmonitor__get_alias(const char *path, struct alias_info *info)
+{
+	return 0;
+}
+
+/*
+ * No-op for now.
+ */
+char *fsmonitor__resolve_alias(const char *path,
+	const struct alias_info *info)
+{
+	return NULL;
+}
diff --git a/fsmonitor--daemon.h b/fsmonitor--daemon.h
index 2102a5c9ff5..e24838f9a86 100644
--- a/fsmonitor--daemon.h
+++ b/fsmonitor--daemon.h
@@ -8,6 +8,7 @@
 #include "run-command.h"
 #include "simple-ipc.h"
 #include "thread-utils.h"
+#include "fsmonitor-path-utils.h"
 
 struct fsmonitor_batch;
 struct fsmonitor_token_data;
@@ -43,6 +44,7 @@ struct fsmonitor_daemon_state {
 
 	struct strbuf path_worktree_watch;
 	struct strbuf path_gitdir_watch;
+	struct alias_info alias;
 	int nr_paths_watching;
 
 	struct fsmonitor_token_data *current_token_data;
@@ -59,6 +61,7 @@ struct fsmonitor_daemon_state {
 
 	struct ipc_server_data *ipc_server_data;
 	struct strbuf path_ipc;
+
 };
 
 /*
diff --git a/fsmonitor-path-utils.h b/fsmonitor-path-utils.h
index 41edf5b934f..5bfdfb81c14 100644
--- a/fsmonitor-path-utils.h
+++ b/fsmonitor-path-utils.h
@@ -1,13 +1,21 @@
 #ifndef FSM_PATH_UTILS_H
 #define FSM_PATH_UTILS_H
 
+#include "strbuf.h"
+
+struct alias_info
+{
+	struct strbuf alias;
+	struct strbuf points_to;
+};
+
 struct fs_info {
 	int is_remote;
 	char *typename;
 };
 
 /*
- * Get some basic filesystem informtion for the given path
+ * Get some basic filesystem information for the given path
  *
  * The caller owns the storage that is occupied by fs_info and
  * is responsible for releasing it.
@@ -23,4 +31,30 @@ int fsmonitor__get_fs_info(const char *path, struct fs_info *fs_info);
  */
 int fsmonitor__is_fs_remote(const char *path);
 
+/*
+ * Get the alias in given path, if any.
+ *
+ * Sets alias to the first alias that matches any part of the path.
+ *
+ * If an alias is found, info.alias and info.points_to are set to the
+ * found mapping.
+ *
+ * Returns -1 on error, 0 otherwise.
+ *
+ * The caller owns the storage that is occupied by info.alias and
+ * info.points_to and is responsible for releasing it.
+ */
+int fsmonitor__get_alias(const char *path, struct alias_info *info);
+
+/*
+ * Resolve the path against the given alias.
+ *
+ * Returns the resolved path if there is one, NULL otherwise.
+ *
+ * The caller owns the storage that the returned string occupies and
+ * is responsible for releasing it.
+ */
+char *fsmonitor__resolve_alias(const char *path,
+	const struct alias_info *info);
+
 #endif
-- 
gitgitgadget

