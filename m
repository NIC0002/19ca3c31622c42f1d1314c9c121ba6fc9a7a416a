Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE426EB64DC
	for <git@archiver.kernel.org>; Mon, 26 Jun 2023 18:11:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbjFZSL5 (ORCPT <rfc822;git@archiver.kernel.org>);
        Mon, 26 Jun 2023 14:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231290AbjFZSLi (ORCPT <rfc822;git@vger.kernel.org>);
        Mon, 26 Jun 2023 14:11:38 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A971E10CB
        for <git@vger.kernel.org>; Mon, 26 Jun 2023 11:11:36 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fa70ec8d17so41527525e9.1
        for <git@vger.kernel.org>; Mon, 26 Jun 2023 11:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687803095; x=1690395095;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDTocaPvhZLeLVmBBYtxOakN6VnRTQgdcT3t4+MDRUQ=;
        b=NMqi+1lB99GMvr5OGVSriwpLSYbxey7NRIgp+UVxc1xmEAhsX/NmLY7uSp4fl90Sl6
         Y1X6Hxt4QsyouDKcBp3TwmzJmK68kmnefgjtDDGlN4oWyztqbDNrWT7lVIocIDpYZLdJ
         GSJSVkrD+EzHYlJNfKPnuKtic+YmtcPTYmIOnkLnn6yog2owlOcmdC17HlraClbCU/zI
         MBjjhIpNvunJosOuZ+7rts82YcC5o9wSdhaox6GByg+mEeDaLxcf0QPE1mEP6srnGb9q
         XVLJLJZ/xko/YMK9TE08VwcLti7lrW7BQpyaBkliOjMSJkYrz+o/+XI16WxLSbf6oUuK
         nQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687803095; x=1690395095;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eDTocaPvhZLeLVmBBYtxOakN6VnRTQgdcT3t4+MDRUQ=;
        b=Bzuck3pyoE0kXGwunShm/bPSm7daIP/SE2CgxbvFD+T1bCpWDFmW1hKEzMFWUe4rS1
         wBhSq1vMvnSstGg5McntP6GHYtC/a+y15+wyCf12Oe7hTd9aUydbX3TCrW6+CISrtdUO
         B5xE3ow+8+8hcvgd5VfJz7PUBAi6kHraMnWEmzYQDHc1v6cCAMc4s2x+HOgTbOqw/DC3
         YB3fUc+mm43BMiDIXWGB+yMFM6g371dPxZiHhUBDr3FQG70QTBxLm0A1IdnjRmQ9XWa7
         1d+3Qdm1EnRTpygtU6m1iJGgHrctbfCTGqTjbbmoX3Ya7f0bDz7wC2wus4P7RAeB41SQ
         zYhQ==
X-Gm-Message-State: AC+VfDxcUlStzR4O9OyavODIzJV1i8NlUF8PGZfiaG9ksmsZoRofnwWV
        VspOrcjFvLIriCZvOAK9uZxDIb3lWbs=
X-Google-Smtp-Source: ACHHUZ70HcR5F6adppZBRhDhem99dbUO8RiJ5TsrAwdnKWWvRR/HFENwa/kfEaTpK1ieEgSkMg84ow==
X-Received: by 2002:a05:600c:3657:b0:3f6:8ba:6ea2 with SMTP id y23-20020a05600c365700b003f608ba6ea2mr27376712wmq.15.1687803094599;
        Mon, 26 Jun 2023 11:11:34 -0700 (PDT)
Received: from [127.0.0.1] ([13.74.141.28])
        by smtp.gmail.com with ESMTPSA id f4-20020a0560001b0400b00307a86a4bcesm8093247wrz.35.2023.06.26.11.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 11:11:34 -0700 (PDT)
Message-Id: <9bd5f60282c5308e9f8575adca717019617341db.1687803086.git.gitgitgadget@gmail.com>
In-Reply-To: <pull.1497.v4.git.git.1687803083.gitgitgadget@gmail.com>
References: <pull.1497.v3.git.git.1687290231.gitgitgadget@gmail.com>
        <pull.1497.v4.git.git.1687803083.gitgitgadget@gmail.com>
From:   "Glen Choo via GitGitGadget" <gitgitgadget@gmail.com>
Date:   Mon, 26 Jun 2023 18:11:19 +0000
Subject: [PATCH v4 08/12] trace2: plumb config kvi
Fcc:    Sent
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
To:     git@vger.kernel.org
Cc:     Jonathan Tan <jonathantanmy@google.com>,
        =?UTF-8?Q?=C3=86var_Arnfj=C3=B6r=C3=B0?= Bjarmason 
        <avarab@gmail.com>, Emily Shaffer <nasamuffin@google.com>,
        Phillip Wood <phillip.wood123@gmail.com>,
        Jeff King <peff@peff.net>, Glen Choo <chooglen@google.com>,
        Glen Choo <chooglen@google.com>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

From: Glen Choo <chooglen@google.com>

There is a code path starting from trace2_def_param_fl() that eventually
calls current_config_scope(), and thus it needs to have "kvi" plumbed
through it. Additional plumbing is also needed to get "kvi" to
trace2_def_param_fl(), which gets called by two code paths:

- Through tr2_cfg_cb(), which is a config callback, so it trivially
  receives "kvi" via the "struct config_context ctx" parameter.

- Through tr2_list_env_vars_fl(), which is a high level function that
  lists environment variables for tracing. This has been secretly
  behaving like git_config_from_parameters() (in that it parses config
  from environment variables/the CLI), but does not set config source
  information.

  Teach tr2_list_env_vars_fl() to be well-behaved by using
  kvi_from_param(), which is used elsewhere for CLI/environment
  variable-based config.

As a result, current_config_scope() has no more callers, so remove it.

Signed-off-by: Glen Choo <chooglen@google.com>
---
 config.c                | 46 -----------------------------------------
 config.h                |  1 -
 trace2.c                |  4 ++--
 trace2.h                |  3 ++-
 trace2/tr2_cfg.c        |  9 +++++---
 trace2/tr2_tgt.h        |  4 +++-
 trace2/tr2_tgt_event.c  |  4 ++--
 trace2/tr2_tgt_normal.c |  4 ++--
 trace2/tr2_tgt_perf.c   |  4 ++--
 9 files changed, 19 insertions(+), 60 deletions(-)

diff --git a/config.c b/config.c
index 2e24e6ea515..8546fea370e 100644
--- a/config.c
+++ b/config.c
@@ -85,16 +85,6 @@ struct config_reader {
 	 */
 	struct config_source *source;
 	struct key_value_info *config_kvi;
-	/*
-	 * The "scope" of the current config source being parsed (repo, global,
-	 * etc). Like "source", this is only set when parsing a config source.
-	 * It's not part of "source" because it transcends a single file (i.e.,
-	 * a file included from .git/config is still in "repo" scope).
-	 *
-	 * When iterating through a configset, the equivalent value is
-	 * "config_kvi.scope" (see above).
-	 */
-	enum config_scope parsing_scope;
 };
 /*
  * Where possible, prefer to accept "struct config_reader" as an arg than to use
@@ -125,19 +115,9 @@ static inline struct config_source *config_reader_pop_source(struct config_reade
 static inline void config_reader_set_kvi(struct config_reader *reader,
 					 struct key_value_info *kvi)
 {
-	if (kvi && (reader->source || reader->parsing_scope))
-		BUG("kvi should not be set while parsing a config source");
 	reader->config_kvi = kvi;
 }
 
-static inline void config_reader_set_scope(struct config_reader *reader,
-					   enum config_scope scope)
-{
-	if (scope && reader->config_kvi)
-		BUG("scope should only be set when iterating through a config source");
-	reader->parsing_scope = scope;
-}
-
 static int pack_compression_seen;
 static int zlib_compression_seen;
 
@@ -412,19 +392,13 @@ static void populate_remote_urls(struct config_include_data *inc)
 {
 	struct config_options opts;
 
-	enum config_scope store_scope = inc->config_reader->parsing_scope;
-
 	opts = *inc->opts;
 	opts.unconditional_remote_url = 1;
 
-	config_reader_set_scope(inc->config_reader, 0);
-
 	inc->remote_urls = xmalloc(sizeof(*inc->remote_urls));
 	string_list_init_dup(inc->remote_urls);
 	config_with_options(add_remote_url, inc->remote_urls,
 			    inc->config_source, inc->repo, &opts);
-
-	config_reader_set_scope(inc->config_reader, store_scope);
 }
 
 static int forbid_remote_url(const char *var, const char *value UNUSED,
@@ -2255,7 +2229,6 @@ static int do_git_config_sequence(struct config_reader *reader,
 	char *user_config = NULL;
 	char *repo_config;
 	char *worktree_config;
-	enum config_scope prev_parsing_scope = reader->parsing_scope;
 
 	/*
 	 * Ensure that either:
@@ -2273,7 +2246,6 @@ static int do_git_config_sequence(struct config_reader *reader,
 		worktree_config = NULL;
 	}
 
-	config_reader_set_scope(reader, CONFIG_SCOPE_SYSTEM);
 	if (git_config_system() && system_config &&
 	    !access_or_die(system_config, R_OK,
 			   opts->system_gently ? ACCESS_EACCES_OK : 0))
@@ -2281,7 +2253,6 @@ static int do_git_config_sequence(struct config_reader *reader,
 							 data, CONFIG_SCOPE_SYSTEM,
 							 NULL);
 
-	config_reader_set_scope(reader, CONFIG_SCOPE_GLOBAL);
 	git_global_config(&user_config, &xdg_config);
 
 	if (xdg_config && !access_or_die(xdg_config, R_OK, ACCESS_EACCES_OK))
@@ -2292,13 +2263,11 @@ static int do_git_config_sequence(struct config_reader *reader,
 		ret += git_config_from_file_with_options(fn, user_config, data,
 							 CONFIG_SCOPE_GLOBAL, NULL);
 
-	config_reader_set_scope(reader, CONFIG_SCOPE_LOCAL);
 	if (!opts->ignore_repo && repo_config &&
 	    !access_or_die(repo_config, R_OK, 0))
 		ret += git_config_from_file_with_options(fn, repo_config, data,
 							 CONFIG_SCOPE_LOCAL, NULL);
 
-	config_reader_set_scope(reader, CONFIG_SCOPE_WORKTREE);
 	if (!opts->ignore_worktree && worktree_config &&
 	    repo && repo->repository_format_worktree_config &&
 	    !access_or_die(worktree_config, R_OK, 0)) {
@@ -2307,11 +2276,9 @@ static int do_git_config_sequence(struct config_reader *reader,
 								 NULL);
 	}
 
-	config_reader_set_scope(reader, CONFIG_SCOPE_COMMAND);
 	if (!opts->ignore_cmdline && git_config_from_parameters(fn, data) < 0)
 		die(_("unable to parse command-line config"));
 
-	config_reader_set_scope(reader, prev_parsing_scope);
 	free(system_config);
 	free(xdg_config);
 	free(user_config);
@@ -2326,7 +2293,6 @@ int config_with_options(config_fn_t fn, void *data,
 			const struct config_options *opts)
 {
 	struct config_include_data inc = CONFIG_INCLUDE_INIT;
-	enum config_scope prev_scope = the_reader.parsing_scope;
 	int ret;
 
 	if (opts->respect_includes) {
@@ -2340,9 +2306,6 @@ int config_with_options(config_fn_t fn, void *data,
 		data = &inc;
 	}
 
-	if (config_source)
-		config_reader_set_scope(&the_reader, config_source->scope);
-
 	/*
 	 * If we have a specific filename, use it. Otherwise, follow the
 	 * regular lookup sequence.
@@ -2364,7 +2327,6 @@ int config_with_options(config_fn_t fn, void *data,
 		string_list_clear(inc.remote_urls, 0);
 		FREE_AND_NULL(inc.remote_urls);
 	}
-	config_reader_set_scope(&the_reader, prev_scope);
 	return ret;
 }
 
@@ -4086,14 +4048,6 @@ static int reader_config_name(struct config_reader *reader, const char **out)
 	return 0;
 }
 
-enum config_scope current_config_scope(void)
-{
-	if (the_reader.config_kvi)
-		return the_reader.config_kvi->scope;
-	else
-		return the_reader.parsing_scope;
-}
-
 int lookup_config(const char **mapping, int nr_mapping, const char *var)
 {
 	int i;
diff --git a/config.h b/config.h
index ea92392400e..82eeba94e71 100644
--- a/config.h
+++ b/config.h
@@ -386,7 +386,6 @@ void git_global_config(char **user, char **xdg);
 
 int git_config_parse_parameter(const char *, config_fn_t fn, void *data);
 
-enum config_scope current_config_scope(void);
 const char *config_origin_type_name(enum config_origin_type type);
 void kvi_from_param(struct key_value_info *out);
 
diff --git a/trace2.c b/trace2.c
index 0efc4e7b958..49c23bfd05a 100644
--- a/trace2.c
+++ b/trace2.c
@@ -634,7 +634,7 @@ void trace2_thread_exit_fl(const char *file, int line)
 }
 
 void trace2_def_param_fl(const char *file, int line, const char *param,
-			 const char *value)
+			 const char *value, const struct key_value_info *kvi)
 {
 	struct tr2_tgt *tgt_j;
 	int j;
@@ -644,7 +644,7 @@ void trace2_def_param_fl(const char *file, int line, const char *param,
 
 	for_each_wanted_builtin (j, tgt_j)
 		if (tgt_j->pfn_param_fl)
-			tgt_j->pfn_param_fl(file, line, param, value);
+			tgt_j->pfn_param_fl(file, line, param, value, kvi);
 }
 
 void trace2_def_repo_fl(const char *file, int line, struct repository *repo)
diff --git a/trace2.h b/trace2.h
index 4ced30c0db3..f5c5a9e6bac 100644
--- a/trace2.h
+++ b/trace2.h
@@ -325,6 +325,7 @@ void trace2_thread_exit_fl(const char *file, int line);
 
 #define trace2_thread_exit() trace2_thread_exit_fl(__FILE__, __LINE__)
 
+struct key_value_info;
 /*
  * Emits a "def_param" message containing a key/value pair.
  *
@@ -334,7 +335,7 @@ void trace2_thread_exit_fl(const char *file, int line);
  * `core.abbrev`, `status.showUntrackedFiles`, or `--no-ahead-behind`.
  */
 void trace2_def_param_fl(const char *file, int line, const char *param,
-			 const char *value);
+			 const char *value, const struct key_value_info *kvi);
 
 #define trace2_def_param(param, value) \
 	trace2_def_param_fl(__FILE__, __LINE__, (param), (value))
diff --git a/trace2/tr2_cfg.c b/trace2/tr2_cfg.c
index 83bc4fd109c..733d9d2872a 100644
--- a/trace2/tr2_cfg.c
+++ b/trace2/tr2_cfg.c
@@ -100,7 +100,7 @@ struct tr2_cfg_data {
  * See if the given config key matches any of our patterns of interest.
  */
 static int tr2_cfg_cb(const char *key, const char *value,
-		      const struct config_context *ctx UNUSED, void *d)
+		      const struct config_context *ctx, void *d)
 {
 	struct strbuf **s;
 	struct tr2_cfg_data *data = (struct tr2_cfg_data *)d;
@@ -109,7 +109,8 @@ static int tr2_cfg_cb(const char *key, const char *value,
 		struct strbuf *buf = *s;
 		int wm = wildmatch(buf->buf, key, WM_CASEFOLD);
 		if (wm == WM_MATCH) {
-			trace2_def_param_fl(data->file, data->line, key, value);
+			trace2_def_param_fl(data->file, data->line, key, value,
+					    ctx->kvi);
 			return 0;
 		}
 	}
@@ -127,8 +128,10 @@ void tr2_cfg_list_config_fl(const char *file, int line)
 
 void tr2_list_env_vars_fl(const char *file, int line)
 {
+	struct key_value_info kvi = KVI_INIT;
 	struct strbuf **s;
 
+	kvi_from_param(&kvi);
 	if (tr2_load_env_vars() <= 0)
 		return;
 
@@ -136,7 +139,7 @@ void tr2_list_env_vars_fl(const char *file, int line)
 		struct strbuf *buf = *s;
 		const char *val = getenv(buf->buf);
 		if (val && *val)
-			trace2_def_param_fl(file, line, buf->buf, val);
+			trace2_def_param_fl(file, line, buf->buf, val, &kvi);
 	}
 }
 
diff --git a/trace2/tr2_tgt.h b/trace2/tr2_tgt.h
index bf8745c4f05..1f626cffea0 100644
--- a/trace2/tr2_tgt.h
+++ b/trace2/tr2_tgt.h
@@ -69,8 +69,10 @@ typedef void(tr2_tgt_evt_exec_result_fl_t)(const char *file, int line,
 					   uint64_t us_elapsed_absolute,
 					   int exec_id, int code);
 
+struct key_value_info;
 typedef void(tr2_tgt_evt_param_fl_t)(const char *file, int line,
-				     const char *param, const char *value);
+				     const char *param, const char *value,
+				     const struct key_value_info *kvi);
 
 typedef void(tr2_tgt_evt_repo_fl_t)(const char *file, int line,
 				    const struct repository *repo);
diff --git a/trace2/tr2_tgt_event.c b/trace2/tr2_tgt_event.c
index 2af53e5d4de..53091781eca 100644
--- a/trace2/tr2_tgt_event.c
+++ b/trace2/tr2_tgt_event.c
@@ -477,11 +477,11 @@ static void fn_exec_result_fl(const char *file, int line,
 }
 
 static void fn_param_fl(const char *file, int line, const char *param,
-			const char *value)
+			const char *value, const struct key_value_info *kvi)
 {
 	const char *event_name = "def_param";
 	struct json_writer jw = JSON_WRITER_INIT;
-	enum config_scope scope = current_config_scope();
+	enum config_scope scope = kvi->scope;
 	const char *scope_name = config_scope_name(scope);
 
 	jw_object_begin(&jw, 0);
diff --git a/trace2/tr2_tgt_normal.c b/trace2/tr2_tgt_normal.c
index 1ebfb464d54..d25ea131643 100644
--- a/trace2/tr2_tgt_normal.c
+++ b/trace2/tr2_tgt_normal.c
@@ -297,10 +297,10 @@ static void fn_exec_result_fl(const char *file, int line,
 }
 
 static void fn_param_fl(const char *file, int line, const char *param,
-			const char *value)
+			const char *value, const struct key_value_info *kvi)
 {
 	struct strbuf buf_payload = STRBUF_INIT;
-	enum config_scope scope = current_config_scope();
+	enum config_scope scope = kvi->scope;
 	const char *scope_name = config_scope_name(scope);
 
 	strbuf_addf(&buf_payload, "def_param scope:%s %s=%s", scope_name, param,
diff --git a/trace2/tr2_tgt_perf.c b/trace2/tr2_tgt_perf.c
index 328e483a05e..a6f9a8a193e 100644
--- a/trace2/tr2_tgt_perf.c
+++ b/trace2/tr2_tgt_perf.c
@@ -439,12 +439,12 @@ static void fn_exec_result_fl(const char *file, int line,
 }
 
 static void fn_param_fl(const char *file, int line, const char *param,
-			const char *value)
+			const char *value, const struct key_value_info *kvi)
 {
 	const char *event_name = "def_param";
 	struct strbuf buf_payload = STRBUF_INIT;
 	struct strbuf scope_payload = STRBUF_INIT;
-	enum config_scope scope = current_config_scope();
+	enum config_scope scope = kvi->scope;
 	const char *scope_name = config_scope_name(scope);
 
 	strbuf_addf(&buf_payload, "%s:%s", param, value);
-- 
gitgitgadget

