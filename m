Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63484C433EF
	for <git@archiver.kernel.org>; Fri, 11 Feb 2022 20:56:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353468AbiBKU4a (ORCPT <rfc822;git@archiver.kernel.org>);
        Fri, 11 Feb 2022 15:56:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353485AbiBKU42 (ORCPT <rfc822;git@vger.kernel.org>);
        Fri, 11 Feb 2022 15:56:28 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F8DB5
        for <git@vger.kernel.org>; Fri, 11 Feb 2022 12:56:25 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id bg19-20020a05600c3c9300b0034565e837b6so3383058wmb.1
        for <git@vger.kernel.org>; Fri, 11 Feb 2022 12:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:in-reply-to:references:from:date:subject:fcc
         :content-transfer-encoding:mime-version:to:cc;
        bh=oEGA0a2gDFIAEk2eRXqw2qpuR/bPIoxB/WKSvgoH9nw=;
        b=DW3m0G88ElifIuszcDJTJt3AflpKZBZJJNwj2Eo6BtBl9/fGLsbjdG8qo3gBJuuDOJ
         GYBiuiOJxPnwzKLxc3gPlmNg5NGHkZiSfl6s63t8a0b4UeP0IkhXHhhbijw25e5G1OOH
         +/OZ45/CQ2ItkLHvYlfmJoF1wbpjwCr4hEm5Vtvvgfi3T6QTguOC1J0KgI67uSXZMfPo
         z4owX0COFgHdl9d7JVdgfV+1a7OSuJ1LbT0pvKIDqJA70HUy4QSNJszvuHqB0ooDfDzH
         aqdtlVt1MxLKfVZSzkr+Bhruy+dDhY56wXcja6kc7Ba6b7hPWCA4MHzy+/8OcGKv1Jmj
         5z2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:in-reply-to:references:from:date
         :subject:fcc:content-transfer-encoding:mime-version:to:cc;
        bh=oEGA0a2gDFIAEk2eRXqw2qpuR/bPIoxB/WKSvgoH9nw=;
        b=rGftfHOKbUPhQ6NEuhwR7LJegrHVIDsOLoSpOLYUAI/kmGCMoirwNJeOs8ELi2ANGg
         l73EcKdR/vIf5cS24qoKHS9QiR7KCupoq2iLVUtfBrZUV68LWaMYtqaxHzPDX3FBzxiv
         /kMmNBJBm+UVB0PGTrxhAgUzWwQ5nHqcmMS0kN189KmaPCkb7koc/yAYlDCgYwrvYMFr
         WtBeHyjENdXN824HEgT+CJbEEDAS9dFfGXy5AC+65a0J4oSungf+/b/yHmQ/wLu4iywU
         33a7+y0hWiuZCXXa09rjPJ24nfMqTg6TiLvKoMgvx0Fk3CIEaD3MzKaCPxTcgCJtpu5X
         WdaA==
X-Gm-Message-State: AOAM533eSI7u4polbdpoYKcApwEeDFFZi31KLzwYr+CXGZUALl7AsZB5
        7Ie4ixwjvx7/pK7ozRVHknbr/hKzv4s=
X-Google-Smtp-Source: ABdhPJxIG4+mphdG4KpCu10/OS3Jjkjnjyyo31c3mjq22VhUCAfGCcsQiulq8/dA3jJuwjTM+qEfJg==
X-Received: by 2002:a7b:c954:: with SMTP id i20mr1746050wml.83.1644612983505;
        Fri, 11 Feb 2022 12:56:23 -0800 (PST)
Received: from [127.0.0.1] ([13.74.141.28])
        by smtp.gmail.com with ESMTPSA id bg26sm5412497wmb.48.2022.02.11.12.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 12:56:23 -0800 (PST)
Message-Id: <384516ce1a190d836324b2c2262d611090207357.1644612979.git.gitgitgadget@gmail.com>
In-Reply-To: <pull.1041.v5.git.1644612979.gitgitgadget@gmail.com>
References: <pull.1041.v4.git.1634826309.gitgitgadget@gmail.com>
        <pull.1041.v5.git.1644612979.gitgitgadget@gmail.com>
From:   "Jeff Hostetler via GitGitGadget" <gitgitgadget@gmail.com>
Date:   Fri, 11 Feb 2022 20:55:52 +0000
Subject: [PATCH v5 03/30] fsmonitor: config settings are repository-specific
Fcc:    Sent
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
To:     git@vger.kernel.org
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>,
        =?UTF-8?Q?=C3=86var_Arnfj=C3=B6r=C3=B0?= Bjarmason 
        <avarab@gmail.com>, Jeff Hostetler <git@jeffhostetler.com>,
        Eric Sunshine <sunshine@sunshineco.com>,
        Jeff Hostetler <jeffhost@microsoft.com>,
        Jeff Hostetler <jeffhost@microsoft.com>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

From: Jeff Hostetler <jeffhost@microsoft.com>

Move fsmonitor config settings to a new and opaque
`struct fsmonitor_settings` structure.  Add a lazily-loaded pointer
to this into `struct repo_settings`

Create an `enum fsmonitor_mode` type in `struct fsmonitor_settings` to
represent the state of fsmonitor.  This lets us represent which, if
any, fsmonitor provider (hook or IPC) is enabled.

Create `fsm_settings__get_*()` getters to lazily look up fsmonitor-
related config settings.

Get rid of the `core_fsmonitor` global variable.  Move the code to
lookup the existing `core.fsmonitor` config value into the fsmonitor
settings.

Create a hook pathname variable in `struct fsmonitor-settings` and
only set it when in hook mode.

Extend the definition of `core.fsmonitor` to be either a boolean
or a hook pathname.  When true, the builtin FSMonitor is used.
When false or unset, no FSMonitor (neither builtin nor hook) is
used.

The existing `core_fsmonitor` global variable was used to store the
pathname to the fsmonitor hook *and* it was used as a boolean to see
if fsmonitor was enabled.  This dual usage and global visibility leads
to confusion when we add the IPC-based provider.  So lets hide the
details in fsmonitor-settings.c and let it decide which provider to
use in the case of multiple settings.  This avoids cluttering up
repo-settings.c with these private details.

A future commit in builtin-fsmonitor series will add the ability to
disqualify worktrees for various reasons, such as being mounted from a
remote volume, where fsmonitor should not be started.  Having the
config settings hidden in fsmonitor-settings.c allows such worktree
restrictions to override the config values used.

Signed-off-by: Jeff Hostetler <jeffhost@microsoft.com>
---
 Makefile               |   1 +
 builtin/update-index.c |   7 ++-
 cache.h                |   1 -
 config.c               |  14 ------
 config.h               |   1 -
 environment.c          |   1 -
 fsmonitor-settings.c   | 100 +++++++++++++++++++++++++++++++++++++++++
 fsmonitor-settings.h   |  21 +++++++++
 fsmonitor.c            |  63 +++++++++++++++-----------
 fsmonitor.h            |  18 ++++++--
 repository.h           |   3 ++
 t/README               |   4 +-
 12 files changed, 185 insertions(+), 49 deletions(-)
 create mode 100644 fsmonitor-settings.c
 create mode 100644 fsmonitor-settings.h

diff --git a/Makefile b/Makefile
index dee3ba4a0b1..9943f0f7c11 100644
--- a/Makefile
+++ b/Makefile
@@ -900,6 +900,7 @@ LIB_OBJS += fmt-merge-msg.o
 LIB_OBJS += fsck.o
 LIB_OBJS += fsmonitor.o
 LIB_OBJS += fsmonitor-ipc.o
+LIB_OBJS += fsmonitor-settings.o
 LIB_OBJS += gettext.o
 LIB_OBJS += gpg-interface.o
 LIB_OBJS += graph.o
diff --git a/builtin/update-index.c b/builtin/update-index.c
index 7e0a0d9bf80..fed24ea1fb6 100644
--- a/builtin/update-index.c
+++ b/builtin/update-index.c
@@ -1225,14 +1225,17 @@ int cmd_update_index(int argc, const char **argv, const char *prefix)
 	}
 
 	if (fsmonitor > 0) {
-		if (git_config_get_fsmonitor() == 0)
+		enum fsmonitor_mode fsm_mode = fsm_settings__get_mode(r);
+		if (fsm_mode == FSMONITOR_MODE_DISABLED) {
 			warning(_("core.fsmonitor is unset; "
 				"set it if you really want to "
 				"enable fsmonitor"));
+		}
 		add_fsmonitor(&the_index);
 		report(_("fsmonitor enabled"));
 	} else if (!fsmonitor) {
-		if (git_config_get_fsmonitor() == 1)
+		enum fsmonitor_mode fsm_mode = fsm_settings__get_mode(r);
+		if (fsm_mode > FSMONITOR_MODE_DISABLED)
 			warning(_("core.fsmonitor is set; "
 				"remove it if you really want to "
 				"disable fsmonitor"));
diff --git a/cache.h b/cache.h
index 4148b6322d5..c67c426a9dd 100644
--- a/cache.h
+++ b/cache.h
@@ -1000,7 +1000,6 @@ extern int core_preload_index;
 extern int precomposed_unicode;
 extern int protect_hfs;
 extern int protect_ntfs;
-extern const char *core_fsmonitor;
 
 extern int core_apply_sparse_checkout;
 extern int core_sparse_checkout_cone;
diff --git a/config.c b/config.c
index e0c03d154c9..0494d8256d0 100644
--- a/config.c
+++ b/config.c
@@ -2624,20 +2624,6 @@ int git_config_get_max_percent_split_change(void)
 	return -1; /* default value */
 }
 
-int git_config_get_fsmonitor(void)
-{
-	if (git_config_get_pathname("core.fsmonitor", &core_fsmonitor))
-		core_fsmonitor = getenv("GIT_TEST_FSMONITOR");
-
-	if (core_fsmonitor && !*core_fsmonitor)
-		core_fsmonitor = NULL;
-
-	if (core_fsmonitor)
-		return 1;
-
-	return 0;
-}
-
 int git_config_get_index_threads(int *dest)
 {
 	int is_bool, val;
diff --git a/config.h b/config.h
index ab0106d2875..03294d340d1 100644
--- a/config.h
+++ b/config.h
@@ -590,7 +590,6 @@ int git_config_get_pathname(const char *key, const char **dest);
 int git_config_get_index_threads(int *dest);
 int git_config_get_split_index(void);
 int git_config_get_max_percent_split_change(void);
-int git_config_get_fsmonitor(void);
 
 /* This dies if the configured or default date is in the future */
 int git_config_get_expiry(const char *key, const char **output);
diff --git a/environment.c b/environment.c
index fd0501e77a5..00682e638d7 100644
--- a/environment.c
+++ b/environment.c
@@ -84,7 +84,6 @@ int protect_hfs = PROTECT_HFS_DEFAULT;
 #define PROTECT_NTFS_DEFAULT 1
 #endif
 int protect_ntfs = PROTECT_NTFS_DEFAULT;
-const char *core_fsmonitor;
 
 /*
  * The character that begins a commented line in user-editable file
diff --git a/fsmonitor-settings.c b/fsmonitor-settings.c
new file mode 100644
index 00000000000..eb4d661c81e
--- /dev/null
+++ b/fsmonitor-settings.c
@@ -0,0 +1,100 @@
+#include "cache.h"
+#include "config.h"
+#include "repository.h"
+#include "fsmonitor-settings.h"
+
+/*
+ * We keep this structure defintion private and have getters
+ * for all fields so that we can lazy load it as needed.
+ */
+struct fsmonitor_settings {
+	enum fsmonitor_mode mode;
+	char *hook_path;
+};
+
+static void lookup_fsmonitor_settings(struct repository *r)
+{
+	struct fsmonitor_settings *s;
+	const char *const_str;
+	int bool_value;
+
+	if (r->settings.fsmonitor)
+		return;
+
+	CALLOC_ARRAY(s, 1);
+
+	r->settings.fsmonitor = s;
+
+	fsm_settings__set_disabled(r);
+
+	/*
+	 * Overload the existing "core.fsmonitor" config setting (which
+	 * has historically been either unset or a hook pathname) to
+	 * now allow a boolean value to enable the builtin FSMonitor
+	 * or to turn everything off.  (This does imply that you can't
+	 * use a hook script named "true" or "false", but that's OK.)
+	 */
+	switch (repo_config_get_maybe_bool(r, "core.fsmonitor", &bool_value)) {
+
+	case 0: /* config value was set to <bool> */
+		if (bool_value)
+			fsm_settings__set_ipc(r);
+		return;
+
+	case 1: /* config value was unset */
+		const_str = getenv("GIT_TEST_FSMONITOR");
+		break;
+
+	case -1: /* config value set to an arbitrary string */
+		if (repo_config_get_pathname(r, "core.fsmonitor", &const_str))
+			return; /* should not happen */
+		break;
+
+	default: /* should not happen */
+		return;
+	}
+
+	if (!const_str || !*const_str)
+		return;
+
+	fsm_settings__set_hook(r, const_str);
+}
+
+enum fsmonitor_mode fsm_settings__get_mode(struct repository *r)
+{
+	lookup_fsmonitor_settings(r);
+
+	return r->settings.fsmonitor->mode;
+}
+
+const char *fsm_settings__get_hook_path(struct repository *r)
+{
+	lookup_fsmonitor_settings(r);
+
+	return r->settings.fsmonitor->hook_path;
+}
+
+void fsm_settings__set_ipc(struct repository *r)
+{
+	lookup_fsmonitor_settings(r);
+
+	r->settings.fsmonitor->mode = FSMONITOR_MODE_IPC;
+	FREE_AND_NULL(r->settings.fsmonitor->hook_path);
+}
+
+void fsm_settings__set_hook(struct repository *r, const char *path)
+{
+	lookup_fsmonitor_settings(r);
+
+	r->settings.fsmonitor->mode = FSMONITOR_MODE_HOOK;
+	FREE_AND_NULL(r->settings.fsmonitor->hook_path);
+	r->settings.fsmonitor->hook_path = strdup(path);
+}
+
+void fsm_settings__set_disabled(struct repository *r)
+{
+	lookup_fsmonitor_settings(r);
+
+	r->settings.fsmonitor->mode = FSMONITOR_MODE_DISABLED;
+	FREE_AND_NULL(r->settings.fsmonitor->hook_path);
+}
diff --git a/fsmonitor-settings.h b/fsmonitor-settings.h
new file mode 100644
index 00000000000..a4c5d7b4889
--- /dev/null
+++ b/fsmonitor-settings.h
@@ -0,0 +1,21 @@
+#ifndef FSMONITOR_SETTINGS_H
+#define FSMONITOR_SETTINGS_H
+
+struct repository;
+
+enum fsmonitor_mode {
+	FSMONITOR_MODE_DISABLED = 0,
+	FSMONITOR_MODE_HOOK = 1, /* core.fsmonitor=<hook_path> */
+	FSMONITOR_MODE_IPC = 2,  /* core.fsmonitor=<true> */
+};
+
+void fsm_settings__set_ipc(struct repository *r);
+void fsm_settings__set_hook(struct repository *r, const char *path);
+void fsm_settings__set_disabled(struct repository *r);
+
+enum fsmonitor_mode fsm_settings__get_mode(struct repository *r);
+const char *fsm_settings__get_hook_path(struct repository *r);
+
+struct fsmonitor_settings;
+
+#endif /* FSMONITOR_SETTINGS_H */
diff --git a/fsmonitor.c b/fsmonitor.c
index 448d0ee33f5..17cba68235a 100644
--- a/fsmonitor.c
+++ b/fsmonitor.c
@@ -3,6 +3,7 @@
 #include "dir.h"
 #include "ewah/ewok.h"
 #include "fsmonitor.h"
+#include "fsmonitor-ipc.h"
 #include "run-command.h"
 #include "strbuf.h"
 
@@ -148,15 +149,18 @@ void write_fsmonitor_extension(struct strbuf *sb, struct index_state *istate)
 /*
  * Call the query-fsmonitor hook passing the last update token of the saved results.
  */
-static int query_fsmonitor(int version, const char *last_update, struct strbuf *query_result)
+static int query_fsmonitor_hook(struct repository *r,
+				int version,
+				const char *last_update,
+				struct strbuf *query_result)
 {
 	struct child_process cp = CHILD_PROCESS_INIT;
 	int result;
 
-	if (!core_fsmonitor)
+	if (fsm_settings__get_mode(r) != FSMONITOR_MODE_HOOK)
 		return -1;
 
-	strvec_push(&cp.args, core_fsmonitor);
+	strvec_push(&cp.args, fsm_settings__get_hook_path(r));
 	strvec_pushf(&cp.args, "%d", version);
 	strvec_pushf(&cp.args, "%s", last_update);
 	cp.use_shell = 1;
@@ -225,17 +229,28 @@ void refresh_fsmonitor(struct index_state *istate)
 	char *buf;
 	unsigned int i;
 	int is_trivial = 0;
+	struct repository *r = istate->repo ? istate->repo : the_repository;
+	enum fsmonitor_mode fsm_mode = fsm_settings__get_mode(r);
 
-	if (!core_fsmonitor || istate->fsmonitor_has_run_once)
+	if (fsm_mode <= FSMONITOR_MODE_DISABLED ||
+	    istate->fsmonitor_has_run_once)
 		return;
 
-	hook_version = fsmonitor_hook_version();
-
 	istate->fsmonitor_has_run_once = 1;
 
 	trace_printf_key(&trace_fsmonitor, "refresh fsmonitor");
+
+	if (fsm_mode == FSMONITOR_MODE_IPC) {
+		/* TODO */
+		return;
+	}
+
+	assert(fsm_mode == FSMONITOR_MODE_HOOK);
+
+	hook_version = fsmonitor_hook_version();
+
 	/*
-	 * This could be racy so save the date/time now and query_fsmonitor
+	 * This could be racy so save the date/time now and query_fsmonitor_hook
 	 * should be inclusive to ensure we don't miss potential changes.
 	 */
 	last_update = getnanotime();
@@ -243,13 +258,14 @@ void refresh_fsmonitor(struct index_state *istate)
 		strbuf_addf(&last_update_token, "%"PRIu64"", last_update);
 
 	/*
-	 * If we have a last update token, call query_fsmonitor for the set of
+	 * If we have a last update token, call query_fsmonitor_hook for the set of
 	 * changes since that token, else assume everything is possibly dirty
 	 * and check it all.
 	 */
 	if (istate->fsmonitor_last_update) {
 		if (hook_version == -1 || hook_version == HOOK_INTERFACE_VERSION2) {
-			query_success = !query_fsmonitor(HOOK_INTERFACE_VERSION2,
+			query_success = !query_fsmonitor_hook(
+				r, HOOK_INTERFACE_VERSION2,
 				istate->fsmonitor_last_update, &query_result);
 
 			if (query_success) {
@@ -280,7 +296,8 @@ void refresh_fsmonitor(struct index_state *istate)
 		}
 
 		if (hook_version == HOOK_INTERFACE_VERSION1) {
-			query_success = !query_fsmonitor(HOOK_INTERFACE_VERSION1,
+			query_success = !query_fsmonitor_hook(
+				r, HOOK_INTERFACE_VERSION1,
 				istate->fsmonitor_last_update, &query_result);
 			if (query_success)
 				is_trivial = query_result.buf[0] == '/';
@@ -290,9 +307,12 @@ void refresh_fsmonitor(struct index_state *istate)
 			trace2_data_intmax("fsm_hook", NULL,
 					   "query/trivial-response", 1);
 
-		trace_performance_since(last_update, "fsmonitor process '%s'", core_fsmonitor);
-		trace_printf_key(&trace_fsmonitor, "fsmonitor process '%s' returned %s",
-			core_fsmonitor, query_success ? "success" : "failure");
+		trace_performance_since(last_update, "fsmonitor process '%s'",
+					fsm_settings__get_hook_path(r));
+		trace_printf_key(&trace_fsmonitor,
+				 "fsmonitor process '%s' returned %s",
+				 fsm_settings__get_hook_path(r),
+				 query_success ? "success" : "failure");
 	}
 
 	/*
@@ -429,7 +449,8 @@ void remove_fsmonitor(struct index_state *istate)
 void tweak_fsmonitor(struct index_state *istate)
 {
 	unsigned int i;
-	int fsmonitor_enabled = git_config_get_fsmonitor();
+	struct repository *r = istate->repo ? istate->repo : the_repository;
+	int fsmonitor_enabled = (fsm_settings__get_mode(r) > FSMONITOR_MODE_DISABLED);
 
 	if (istate->fsmonitor_dirty) {
 		if (fsmonitor_enabled) {
@@ -449,16 +470,8 @@ void tweak_fsmonitor(struct index_state *istate)
 		istate->fsmonitor_dirty = NULL;
 	}
 
-	switch (fsmonitor_enabled) {
-	case -1: /* keep: do nothing */
-		break;
-	case 0: /* false */
-		remove_fsmonitor(istate);
-		break;
-	case 1: /* true */
+	if (fsmonitor_enabled)
 		add_fsmonitor(istate);
-		break;
-	default: /* unknown value: do nothing */
-		break;
-	}
+	else
+		remove_fsmonitor(istate);
 }
diff --git a/fsmonitor.h b/fsmonitor.h
index f20d72631d7..f9201411aa7 100644
--- a/fsmonitor.h
+++ b/fsmonitor.h
@@ -3,6 +3,7 @@
 
 #include "cache.h"
 #include "dir.h"
+#include "fsmonitor-settings.h"
 
 extern struct trace_key trace_fsmonitor;
 
@@ -57,7 +58,11 @@ int fsmonitor_is_trivial_response(const struct strbuf *query_result);
  */
 static inline int is_fsmonitor_refreshed(const struct index_state *istate)
 {
-	return !core_fsmonitor || istate->fsmonitor_has_run_once;
+	struct repository *r = istate->repo ? istate->repo : the_repository;
+	enum fsmonitor_mode fsm_mode = fsm_settings__get_mode(r);
+
+	return fsm_mode <= FSMONITOR_MODE_DISABLED ||
+		istate->fsmonitor_has_run_once;
 }
 
 /*
@@ -67,7 +72,11 @@ static inline int is_fsmonitor_refreshed(const struct index_state *istate)
  */
 static inline void mark_fsmonitor_valid(struct index_state *istate, struct cache_entry *ce)
 {
-	if (core_fsmonitor && !(ce->ce_flags & CE_FSMONITOR_VALID)) {
+	struct repository *r = istate->repo ? istate->repo : the_repository;
+	enum fsmonitor_mode fsm_mode = fsm_settings__get_mode(r);
+
+	if (fsm_mode > FSMONITOR_MODE_DISABLED &&
+	    !(ce->ce_flags & CE_FSMONITOR_VALID)) {
 		istate->cache_changed = 1;
 		ce->ce_flags |= CE_FSMONITOR_VALID;
 		trace_printf_key(&trace_fsmonitor, "mark_fsmonitor_clean '%s'", ce->name);
@@ -83,7 +92,10 @@ static inline void mark_fsmonitor_valid(struct index_state *istate, struct cache
  */
 static inline void mark_fsmonitor_invalid(struct index_state *istate, struct cache_entry *ce)
 {
-	if (core_fsmonitor) {
+	struct repository *r = istate->repo ? istate->repo : the_repository;
+	enum fsmonitor_mode fsm_mode = fsm_settings__get_mode(r);
+
+	if (fsm_mode > FSMONITOR_MODE_DISABLED) {
 		ce->ce_flags &= ~CE_FSMONITOR_VALID;
 		untracked_cache_invalidate_path(istate, ce->name, 1);
 		trace_printf_key(&trace_fsmonitor, "mark_fsmonitor_invalid '%s'", ce->name);
diff --git a/repository.h b/repository.h
index 2b5cf97f31e..6708207cd4c 100644
--- a/repository.h
+++ b/repository.h
@@ -4,6 +4,7 @@
 #include "path.h"
 
 struct config_set;
+struct fsmonitor_settings;
 struct git_hash_algo;
 struct index_state;
 struct lock_file;
@@ -35,6 +36,8 @@ struct repo_settings {
 	int command_requires_full_index;
 	int sparse_index;
 
+	struct fsmonitor_settings *fsmonitor; /* lazily loaded */
+
 	int index_version;
 	enum untracked_cache_setting core_untracked_cache;
 
diff --git a/t/README b/t/README
index f48e0542cdc..9ffea1d3147 100644
--- a/t/README
+++ b/t/README
@@ -405,8 +405,8 @@ every 'git commit-graph write', as if the `--changed-paths` option was
 passed in.
 
 GIT_TEST_FSMONITOR=$PWD/t7519/fsmonitor-all exercises the fsmonitor
-code path for utilizing a file system monitor to speed up detecting
-new or changed files.
+code paths for utilizing a (hook based) file system monitor to speed up
+detecting new or changed files.
 
 GIT_TEST_INDEX_VERSION=<n> exercises the index read/write code path
 for the index version specified.  Can be set to any valid version
-- 
gitgitgadget

