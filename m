Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A9FC61DA4
	for <git@archiver.kernel.org>; Thu, 16 Mar 2023 00:12:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233245AbjCPAMF (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 15 Mar 2023 20:12:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233150AbjCPAL4 (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 15 Mar 2023 20:11:56 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD10457C6
        for <git@vger.kernel.org>; Wed, 15 Mar 2023 17:11:54 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id p13-20020a05600c358d00b003ed346d4522so2145118wmq.2
        for <git@vger.kernel.org>; Wed, 15 Mar 2023 17:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678925513;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdzRS1XS33PEiHhPq4gVOpp+2WFYweajk7oVe8gNc/0=;
        b=baHii8b/A54tlym9ECWOSmmjz/yrje3HYIdtXHXei/Nl/kQrmPPh96l7wQ2BIQDhw6
         U7vj0xpnpmHpz7YTPjTBFJuKNTsYlPO7e4CUoC50SI4pwruurjPQbz0y2s3Lrl62Qycy
         tO8mvJAGzQ0oTpjZiGeuztufjMOj+7lwsIuYWqWcE6wbBQLJ5f7JYPpN5QiMeBs0gewO
         4Odpur87+jZkF6Dnbw/SCyCsX+C5eLTPyPur6x4dm08d+bRRjxOuZr8zhwy2CtfEd+9y
         BVw+LliTqx/cnHpk8oOBH1xEkGLNRmCHnVCYOZ3nUdddACkerecYfmaIe9vHL0hvT9mx
         uVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678925513;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdzRS1XS33PEiHhPq4gVOpp+2WFYweajk7oVe8gNc/0=;
        b=WTv3l2T9bYuSk6sLr9ezsUvkJQxI9DKPdW3CpSa1Xygew/kv0PFJr3amAv/7pEJPrv
         BSbcPoMxf5U2RAPgLjTuch+cqgM+iAYOO2ptW6Jjq6p//bvWnyklBVV0qsBrVBOWYKsp
         QDcQBo586mvZ9QZfH8U5uFfHeBfYcfV/yfB/ISrQdODyw/4Sq7466nZU0tqJ2ybWSPtm
         s1uX6p4sTvFkYTMXrQ7rX81yR5VRqoQ66Y96WNOtbun3M19J//1ZAkzCaee7LMQHwRuD
         Ln9xF4gsq2JumfL2uiE/YzyQ3vla04WVerXn7ZmDuYBJUaQv6qDe/DO9/kKkB4Y73erd
         5oYQ==
X-Gm-Message-State: AO0yUKVNMY66aTAEOfFxCbwkXZu7hdyZe90fOcsGrJh56mbd5+pjr+ua
        BiLqgRnOkQddBhi5bZb7vjUGSCOpLzg=
X-Google-Smtp-Source: AK7set/uNIN1xdQnIES6uoIkMe4DMDw54JbHiBDISJ+6pykZse19F8iIvDO/jyLwQzyn0owEqRdvmQ==
X-Received: by 2002:a05:600c:458f:b0:3eb:38e6:f650 with SMTP id r15-20020a05600c458f00b003eb38e6f650mr18352122wmo.41.1678925512741;
        Wed, 15 Mar 2023 17:11:52 -0700 (PDT)
Received: from [127.0.0.1] ([13.74.141.28])
        by smtp.gmail.com with ESMTPSA id d22-20020a05600c34d600b003e20970175dsm3260146wmq.32.2023.03.15.17.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 17:11:52 -0700 (PDT)
Message-Id: <a57e35163ae68e81a7983fc766be79992c3f4b60.1678925506.git.gitgitgadget@gmail.com>
In-Reply-To: <pull.1463.v2.git.git.1678925506.gitgitgadget@gmail.com>
References: <pull.1463.git.git.1677631097.gitgitgadget@gmail.com>
        <pull.1463.v2.git.git.1678925506.gitgitgadget@gmail.com>
From:   "Glen Choo via GitGitGadget" <gitgitgadget@gmail.com>
Date:   Thu, 16 Mar 2023 00:11:44 +0000
Subject: [PATCH v2 6/8] config.c: remove current_parsing_scope
Fcc:    Sent
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
To:     git@vger.kernel.org
Cc:     Jonathan Tan <jonathantanmy@google.com>,
        Emily Shaffer <nasamuffin@google.com>,
        Jeff King <peff@peff.net>,
        Derrick Stolee <derrickstolee@github.com>,
        Calvin Wan <calvinwan@google.com>,
        =?UTF-8?Q?=C3=86var_Arnfj=C3=B6r=C3=B0?= Bjarmason 
        <avarab@gmail.com>, Glen Choo <chooglen@google.com>,
        Glen Choo <chooglen@google.com>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

From: Glen Choo <chooglen@google.com>

Add ".parsing_scope" to "struct config_reader" and replace
"current_parsing_scope" with "the_reader.parsing_scope. Adjust the
comment slightly to make it clearer that the scope applies to the config
source (not the current value), and should only be set when parsing a
config source.

As such, ".parsing_scope" (only set when parsing config sources) and
".config_kvi" (only set when iterating a config set) should not be
set together, so enforce this with a setter function.

Unlike previous commits, "populate_remote_urls()" still needs to store
and restore the 'scope' value because it could have touched
"current_parsing_scope" ("config_with_options()" can set the scope).

Signed-off-by: Glen Choo <chooglen@google.com>
---
 config.c | 63 +++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 37 insertions(+), 26 deletions(-)

diff --git a/config.c b/config.c
index ba9b488c40d..460326ae21e 100644
--- a/config.c
+++ b/config.c
@@ -70,6 +70,16 @@ struct config_reader {
 	 */
 	struct config_source *source;
 	struct key_value_info *config_kvi;
+	/*
+	 * The "scope" of the current config source being parsed (repo, global,
+	 * etc). Like "source", this is only set when parsing a config source.
+	 * It's not part of "source" because it transcends a single file (i.e.,
+	 * a file included from .git/config is still in "repo" scope).
+	 *
+	 * When iterating through a configset, the equivalent value is
+	 * "config_kvi.scope" (see above).
+	 */
+	enum config_scope parsing_scope;
 };
 /*
  * Where possible, prefer to accept "struct config_reader" as an arg than to use
@@ -78,16 +88,6 @@ struct config_reader {
  */
 static struct config_reader the_reader;
 
-/*
- * Similar to the variables above, this gives access to the "scope" of the
- * current value (repo, global, etc). For cached values, it can be found via
- * the current_config_kvi as above. During parsing, the current value can be
- * found in this variable. It's not part of "cf_global" because it transcends a
- * single file (i.e., a file included from .git/config is still in "repo"
- * scope).
- */
-static enum config_scope current_parsing_scope;
-
 static inline void config_reader_push_source(struct config_reader *reader,
 					     struct config_source *top)
 {
@@ -111,11 +111,19 @@ static inline struct config_source *config_reader_pop_source(struct config_reade
 static inline void config_reader_set_kvi(struct config_reader *reader,
 					 struct key_value_info *kvi)
 {
-	if (kvi && reader->source)
+	if (kvi && (reader->source || reader->parsing_scope))
 		BUG("kvi should not be set while parsing a config source");
 	reader->config_kvi = kvi;
 }
 
+static inline void config_reader_set_scope(struct config_reader *reader,
+					   enum config_scope scope)
+{
+	if (scope && reader->config_kvi)
+		BUG("scope should only be set when iterating through a config source");
+	reader->parsing_scope = scope;
+}
+
 static int pack_compression_seen;
 static int zlib_compression_seen;
 
@@ -384,18 +392,18 @@ static void populate_remote_urls(struct config_include_data *inc)
 {
 	struct config_options opts;
 
-	enum config_scope store_scope = current_parsing_scope;
+	enum config_scope store_scope = inc->config_reader->parsing_scope;
 
 	opts = *inc->opts;
 	opts.unconditional_remote_url = 1;
 
-	current_parsing_scope = 0;
+	config_reader_set_scope(inc->config_reader, 0);
 
 	inc->remote_urls = xmalloc(sizeof(*inc->remote_urls));
 	string_list_init_dup(inc->remote_urls);
 	config_with_options(add_remote_url, inc->remote_urls, inc->config_source, &opts);
 
-	current_parsing_scope = store_scope;
+	config_reader_set_scope(inc->config_reader, store_scope);
 }
 
 static int forbid_remote_url(const char *var, const char *value UNUSED,
@@ -2160,7 +2168,8 @@ int git_config_system(void)
 	return !git_env_bool("GIT_CONFIG_NOSYSTEM", 0);
 }
 
-static int do_git_config_sequence(const struct config_options *opts,
+static int do_git_config_sequence(struct config_reader *reader,
+				  const struct config_options *opts,
 				  config_fn_t fn, void *data)
 {
 	int ret = 0;
@@ -2168,7 +2177,7 @@ static int do_git_config_sequence(const struct config_options *opts,
 	char *xdg_config = NULL;
 	char *user_config = NULL;
 	char *repo_config;
-	enum config_scope prev_parsing_scope = current_parsing_scope;
+	enum config_scope prev_parsing_scope = reader->parsing_scope;
 
 	if (opts->commondir)
 		repo_config = mkpathdup("%s/config", opts->commondir);
@@ -2177,13 +2186,13 @@ static int do_git_config_sequence(const struct config_options *opts,
 	else
 		repo_config = NULL;
 
-	current_parsing_scope = CONFIG_SCOPE_SYSTEM;
+	config_reader_set_scope(reader, CONFIG_SCOPE_SYSTEM);
 	if (git_config_system() && system_config &&
 	    !access_or_die(system_config, R_OK,
 			   opts->system_gently ? ACCESS_EACCES_OK : 0))
 		ret += git_config_from_file(fn, system_config, data);
 
-	current_parsing_scope = CONFIG_SCOPE_GLOBAL;
+	config_reader_set_scope(reader, CONFIG_SCOPE_GLOBAL);
 	git_global_config(&user_config, &xdg_config);
 
 	if (xdg_config && !access_or_die(xdg_config, R_OK, ACCESS_EACCES_OK))
@@ -2192,12 +2201,12 @@ static int do_git_config_sequence(const struct config_options *opts,
 	if (user_config && !access_or_die(user_config, R_OK, ACCESS_EACCES_OK))
 		ret += git_config_from_file(fn, user_config, data);
 
-	current_parsing_scope = CONFIG_SCOPE_LOCAL;
+	config_reader_set_scope(reader, CONFIG_SCOPE_LOCAL);
 	if (!opts->ignore_repo && repo_config &&
 	    !access_or_die(repo_config, R_OK, 0))
 		ret += git_config_from_file(fn, repo_config, data);
 
-	current_parsing_scope = CONFIG_SCOPE_WORKTREE;
+	config_reader_set_scope(reader, CONFIG_SCOPE_WORKTREE);
 	if (!opts->ignore_worktree && repository_format_worktree_config) {
 		char *path = git_pathdup("config.worktree");
 		if (!access_or_die(path, R_OK, 0))
@@ -2205,11 +2214,11 @@ static int do_git_config_sequence(const struct config_options *opts,
 		free(path);
 	}
 
-	current_parsing_scope = CONFIG_SCOPE_COMMAND;
+	config_reader_set_scope(reader, CONFIG_SCOPE_COMMAND);
 	if (!opts->ignore_cmdline && git_config_from_parameters(fn, data) < 0)
 		die(_("unable to parse command-line config"));
 
-	current_parsing_scope = prev_parsing_scope;
+	config_reader_set_scope(reader, prev_parsing_scope);
 	free(system_config);
 	free(xdg_config);
 	free(user_config);
@@ -2222,6 +2231,7 @@ int config_with_options(config_fn_t fn, void *data,
 			const struct config_options *opts)
 {
 	struct config_include_data inc = CONFIG_INCLUDE_INIT;
+	enum config_scope prev_scope = the_reader.parsing_scope;
 	int ret;
 
 	if (opts->respect_includes) {
@@ -2235,7 +2245,7 @@ int config_with_options(config_fn_t fn, void *data,
 	}
 
 	if (config_source)
-		current_parsing_scope = config_source->scope;
+		config_reader_set_scope(&the_reader, config_source->scope);
 
 	/*
 	 * If we have a specific filename, use it. Otherwise, follow the
@@ -2251,13 +2261,14 @@ int config_with_options(config_fn_t fn, void *data,
 		ret = git_config_from_blob_ref(fn, repo, config_source->blob,
 						data);
 	} else {
-		ret = do_git_config_sequence(opts, fn, data);
+		ret = do_git_config_sequence(&the_reader, opts, fn, data);
 	}
 
 	if (inc.remote_urls) {
 		string_list_clear(inc.remote_urls, 0);
 		FREE_AND_NULL(inc.remote_urls);
 	}
+	config_reader_set_scope(&the_reader, prev_scope);
 	return ret;
 }
 
@@ -2391,7 +2402,7 @@ static int configset_add_value(struct config_reader *reader,
 		kv_info->linenr = -1;
 		kv_info->origin_type = CONFIG_ORIGIN_CMDLINE;
 	}
-	kv_info->scope = current_parsing_scope;
+	kv_info->scope = reader->parsing_scope;
 	si->util = kv_info;
 
 	return 0;
@@ -3892,7 +3903,7 @@ enum config_scope current_config_scope(void)
 	if (the_reader.config_kvi)
 		return the_reader.config_kvi->scope;
 	else
-		return current_parsing_scope;
+		return the_reader.parsing_scope;
 }
 
 int current_config_line(void)
-- 
gitgitgadget

