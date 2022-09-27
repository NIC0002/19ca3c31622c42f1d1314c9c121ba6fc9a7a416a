Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02751C07E9D
	for <git@archiver.kernel.org>; Tue, 27 Sep 2022 18:40:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbiI0Sk1 (ORCPT <rfc822;git@archiver.kernel.org>);
        Tue, 27 Sep 2022 14:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiI0SkY (ORCPT <rfc822;git@vger.kernel.org>);
        Tue, 27 Sep 2022 14:40:24 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F7E091D0F
        for <git@vger.kernel.org>; Tue, 27 Sep 2022 11:40:23 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id jm5so9829298plb.13
        for <git@vger.kernel.org>; Tue, 27 Sep 2022 11:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=kHgSYwOsgsQ2BDnmnKKHpFlijUeZsduLBd9ycVhSNIA=;
        b=jLqGPntJVu0u9Ti5u44aAptD32BE5VB8+AHF7JQzAV5czNnLK+xS4sQZWWNLC3c3Z5
         zd/FzOfxda1v3WCqRDDy3RpA0FEpO5Qn7B0WAqOC5afzUqLIFxSIjoBsckZST3Sd9omJ
         TZVPMq44L22XXRZYmq+z4tqJL2vuww0Q4mNsyXidGvXWKW0LXExb8fds97SVsO91dJ7K
         SN53buwIh61OpNQLHbLPyvGsZ5sp3+Ajhxuofg/bicsqvTu7HzIsuJqkIXb3R4HDbnsd
         ZD/l1d/YiiGHrj5evDmG1Vyh/mRm6UXXx57OzqcZKqNyDUchZXTg5xN2ajasCn/VRuhW
         9lLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=kHgSYwOsgsQ2BDnmnKKHpFlijUeZsduLBd9ycVhSNIA=;
        b=VSYpSBALj5Ojhlc07R9vL6mUUxtbCp05rBAfKzUlxKmRGDKebNM/4iExJGyikyZ8//
         2jS17vkBRTbSKqdNA/DuUw4u9eUxK2elcXP7Gw9WrGdUkT8pisSbbwmCRNmsBiCsy0mE
         ukWQyY1X888NpvIMi9fuJZuaZUIdsLeATiprV3E94Y/xQQ/z6KVS4SAKaOpsv0NjmTjy
         lXN863FTU/6WMb8Mdfmo+bCDeUM6OLAqa3Zwc7WWh9jaUyY3wFtSq81CyH5Za89DKBxH
         SHz/TmUa0IhrXKwoocPTtGnbbP5dXKwmvAswW2HWJII/heJsuB4ZtBE/iQ9yPwZD6VEq
         iOGw==
X-Gm-Message-State: ACrzQf2s2Pr6akWqFoJRQQ1DXbJkyoHD1GjLX4fQ3muPxEhGgvTTQwh3
        c1Qx4UZUP9LFeBr01v0ZU3plOOjZVDSKOw==
X-Google-Smtp-Source: AMsMyM4jyn1f38L+Nq2BtqjYfG+QAC/33lxDVuhp3yqZuqnnX3ZJNPqwPV/vwD2x4IuaG7UbGkCoLg==
X-Received: by 2002:a17:902:ce81:b0:178:8e0a:5615 with SMTP id f1-20020a170902ce8100b001788e0a5615mr28851215plg.109.1664304022310;
        Tue, 27 Sep 2022 11:40:22 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:200:caa6:ba5:33ca:fbd6])
        by smtp.gmail.com with ESMTPSA id o2-20020aa79782000000b00537d60286c9sm2094380pfp.113.2022.09.27.11.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 11:40:21 -0700 (PDT)
Date:   Tue, 27 Sep 2022 11:40:15 -0700
From:   Emily Shaffer <emilyshaffer@google.com>
To:     Calvin Wan <calvinwan@google.com>
Cc:     git@vger.kernel.org
Subject: Re: [PATCH 4/4] diff-lib: parallelize run_diff_files for submodules
Message-ID: <YzNDj54cylRzu2Fj@google.com>
References: <20220922232947.631309-1-calvinwan@google.com>
 <20220922232947.631309-5-calvinwan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922232947.631309-5-calvinwan@google.com>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

On Thu, Sep 22, 2022 at 11:29:47PM +0000, Calvin Wan wrote:
> diff --git a/builtin/commit.c b/builtin/commit.c
> index fcf9c85947..c5147a7952 100644
> --- a/builtin/commit.c
> +++ b/builtin/commit.c
> @@ -1468,6 +1468,12 @@ static int git_status_config(const char *k, const char *v, void *cb)
>  		s->detect_rename = git_config_rename(k, v);
>  		return 0;
>  	}
> +	if (!strcmp(k, "status.parallelsubmodules")) {
> +		s->parallel_jobs_submodules = git_config_int(k, v);
> +		if (s->parallel_jobs_submodules < 0)
> +			die(_("status.parallelsubmodules cannot be negative"));

Seems odd to have this check when all through the rest of the code
you're happily setting parallel_jobs=-1.

Although I don't think I disagree with the check ;) rather, I disagree
with the semantics used elsewhere for this magic -1 value.

> +		return 0;
> +	}
>  	return git_diff_ui_config(k, v, NULL);
>  }
>  
> diff --git a/diff-lib.c b/diff-lib.c
> index 2e148b79e6..ec745755fc 100644
> --- a/diff-lib.c
> +++ b/diff-lib.c
> @@ -65,14 +65,19 @@ static int check_removed(const struct index_state *istate, const struct cache_en
>   * Return 1 when changes are detected, 0 otherwise. If the DIRTY_SUBMODULES
>   * option is set, the caller does not only want to know if a submodule is
>   * modified at all but wants to know all the conditions that are met (new
> - * commits, untracked content and/or modified content).
> + * commits, untracked content and/or modified content). If
> + * defer_submodule_status bit is set, dirty_submodule will be left to the
> + * caller to set. defer_submodule_status can also be set to 0 in this
> + * function if there is no need to check if the submodule is modified.
>   */

Should the defer optimization be moved to its own pack? I think it is
somewhat orthogonal to deciding whether to parallelize or not, yes?

>  static int match_stat_with_submodule(struct diff_options *diffopt,
>  				     const struct cache_entry *ce,
>  				     struct stat *st, unsigned ce_option,
> -				     unsigned *dirty_submodule)
> +				     unsigned *dirty_submodule, int *defer_submodule_status,
> +					 int *ignore_untracked_in_submodules)
>  {
>  	int changed = ie_match_stat(diffopt->repo->index, ce, st, ce_option);
> +	int defer = 0;
>  	struct diff_flags orig_flags = diffopt->flags;
>  	if (!S_ISGITLINK(ce->ce_mode))
>  		goto cleanup;
> @@ -83,11 +88,20 @@ static int match_stat_with_submodule(struct diff_options *diffopt,
>  		goto cleanup;
>  	}
>  	if (!diffopt->flags.ignore_dirty_submodules &&
> -		(!changed || diffopt->flags.dirty_submodules))
> +		(!changed || diffopt->flags.dirty_submodules)) {
> +		if (defer_submodule_status && *defer_submodule_status) {
> +			defer = 1;
> +			*ignore_untracked_in_submodules =
> +							diffopt->flags.ignore_untracked_in_submodules;
> +		} else {
>  			*dirty_submodule = is_submodule_modified(ce->name,
>  							diffopt->flags.ignore_untracked_in_submodules);
> +		}
> +	}
>  cleanup:
>  	diffopt->flags = orig_flags;
> +	if (defer_submodule_status)
> +		*defer_submodule_status = defer;
>  	return changed;
>  }
>  
> @@ -117,7 +131,7 @@ static void finish_run_diff_files(struct rev_info *revs,
>  			    ce->name, 0, dirty_submodule);
>  }
>  
> -int run_diff_files(struct rev_info *revs, unsigned int option)
> +int run_diff_files(struct rev_info *revs, unsigned int option, int parallel_jobs)

The meaning of 'parallel_jobs' isn't documented anywhere in this patch
that I can see, but all over we're setting it to some magic -1 value,
right? What's that about?

>  {
>  	int entries, i;
>  	int diff_unmerged_stage = revs->max_count;
> @@ -125,6 +139,7 @@ int run_diff_files(struct rev_info *revs, unsigned int option)
>  			      ? CE_MATCH_RACY_IS_DIRTY : 0);
>  	uint64_t start = getnanotime();
>  	struct index_state *istate = revs->diffopt.repo->index;
> +	struct string_list submodules = STRING_LIST_INIT_NODUP;
>  
>  	diff_set_mnemonic_prefix(&revs->diffopt, "i/", "w/");
>  
> @@ -138,6 +153,9 @@ int run_diff_files(struct rev_info *revs, unsigned int option)
>  		struct cache_entry *ce = istate->cache[i];
>  		int changed;
>  		unsigned dirty_submodule = 0;
> +		int defer_submodule_status = revs && revs->repo &&
> +							!strcmp(revs->repo->gitdir, ".git");
> +		int ignore_untracked_in_submodules;

Does this actually compile with -Wall? I thought it is no good to do an
inline function call in the middle of the allocation block?

>  
>  		if (diff_can_quit_early(&revs->diffopt))
>  			break;
> @@ -269,11 +287,36 @@ int run_diff_files(struct rev_info *revs, unsigned int option)
>  			}
>  
>  			changed = match_stat_with_submodule(&revs->diffopt, ce, &st,
> -							    ce_option, &dirty_submodule);
> +							ce_option, &dirty_submodule,
> +							&defer_submodule_status,
> +							&ignore_untracked_in_submodules);
>  			newmode = ce_mode_from_stat(ce, st.st_mode);
> +			if (defer_submodule_status) {
> +				struct string_list_item *item =
> +								string_list_append(&submodules, ce->name);
> +				struct submodule_status_util *util = xmalloc(sizeof(*util));
> +				util->changed = changed;
> +				util->dirty_submodule = 0;
> +				util->ignore_untracked = ignore_untracked_in_submodules;
> +				util->newmode = newmode;
> +				util->ce = ce;
> +				item->util = util;
> +				continue;
> +			}
>  		}
>  		finish_run_diff_files(revs, ce, istate, changed, dirty_submodule, newmode);
>  	}
> +	if (submodules.nr > 0) {
> +		if (get_submodules_status(revs->repo, &submodules,
> +						parallel_jobs > 0 ? parallel_jobs : 1))

We're not doing a lookup in case of parallel_jobs<0, right? So why even
bother having this special meaning for -1? It's undocumented in the
header for run_diff_files anyway. In fact, I'd expect parallel_jobs=-1
to mean "as many jobs as possible" - but here you're using it just to
mean 1.

Why not let parallel_jobs be unsigned, do special casing for 0 if you
want to use that to mean "recommended # of jobs", and otherwise take it
at face value? Am I missing something in my skim over the patch?

> +			BUG("Submodule status failed");
> +		for (int i = 0; i < submodules.nr; i++) {
> +			struct submodule_status_util *util = submodules.items[i].util;
> +
> +			finish_run_diff_files(revs, util->ce, NULL, util->changed,
> +							util->dirty_submodule, util->newmode);
> +		}
> +	}
>  	diffcore_std(&revs->diffopt);
>  	diff_flush(&revs->diffopt);
>  	trace_performance_since(start, "diff-files");
> @@ -321,7 +364,7 @@ static int get_stat_data(const struct index_state *istate,
>  			return -1;
>  		}
>  		changed = match_stat_with_submodule(diffopt, ce, &st,
> -						    0, dirty_submodule);
> +						    0, dirty_submodule, NULL, NULL);
>  		if (changed) {
>  			mode = ce_mode_from_stat(ce, st.st_mode);
>  			oid = null_oid();
> diff --git a/diff.h b/diff.h
> index 8ae18e5ab1..5a6a615381 100644
> --- a/diff.h
> +++ b/diff.h
> @@ -627,7 +627,7 @@ void diff_get_merge_base(const struct rev_info *revs, struct object_id *mb);
>  #define DIFF_SILENT_ON_REMOVED 01
>  /* report racily-clean paths as modified */
>  #define DIFF_RACY_IS_MODIFIED 02
> -int run_diff_files(struct rev_info *revs, unsigned int option);
> +int run_diff_files(struct rev_info *revs, unsigned int option, int parallel_jobs);

See above; probably documenting parallel_jobs should happen here.

>  
>  #define DIFF_INDEX_CACHED 01
>  #define DIFF_INDEX_MERGE_BASE 02
> diff --git a/submodule.c b/submodule.c
> index 91213ba83c..15729bb327 100644
> --- a/submodule.c
> +++ b/submodule.c
> @@ -1362,6 +1362,20 @@ int submodule_touches_in_range(struct repository *r,
>  	return ret;
>  }
>  

I actually might like to see the conversion to using
run_processes_parallel happen in an earlier patch, with jobs=1. Might
make the review load easier.

That said, in previous series which took that approach, because it
worked correctly with jobs=1 we missed a bug in the writing of the new
*_task_finished() callback.... Maybe that doesn't apply here as the
jobs=N patch would follow on in the same series, so you'd test it right
away?

> +struct submodule_parallel_status {
> +	int index_count;
> +	int result;
> +
> +	struct string_list *submodule_names;
> +	struct repository *r;
> +
> +	/* Pending statuses by OIDs */
> +	struct status_task **oid_status_tasks;
> +	int oid_status_tasks_nr, oid_status_tasks_alloc;
> +};
> +
> +#define SPS_INIT { 0 }
> +
>  struct submodule_parallel_fetch {
>  	/*
>  	 * The index of the last index entry processed by
> @@ -1444,6 +1458,12 @@ struct fetch_task {
>  	struct oid_array *commits; /* Ensure these commits are fetched */
>  };
>  
> +struct status_task {
> +	struct repository *repo;
> +	const char *path;
> +	int ignore_untracked;
> +};
> +
>  /**
>   * When a submodule is not defined in .gitmodules, we cannot access it
>   * via the regular submodule-config. Create a fake submodule, which we can
> @@ -1547,6 +1567,41 @@ static struct fetch_task *fetch_task_create(struct submodule_parallel_fetch *spf
>  	return NULL;
>  }
>  
> +static struct status_task *
> +get_status_task_from_index(struct submodule_parallel_status *sps,
> +			  struct strbuf *err)
The spacing of these long function signatures feels odd; I'd much rather
see something like:

static struct status_task* get_status_task_from_index(
  (args)

Plus, as this get_status_task_from_index() exists only to be called by
get_next_submodule_status(), I'd find it easier to read if this function
was closer to that one. But that's a pretty tiny nit ;)

> +{
> +	for (; sps->index_count < sps->submodule_names->nr; sps->index_count++) {
> +		struct submodule_status_util *util = sps->submodule_names->items[sps->index_count].util;
> +		const struct cache_entry *ce = util->ce;
> +		struct status_task *task;
> +		struct strbuf buf = STRBUF_INIT;
> +		const char *git_dir;
> +
> +		strbuf_addf(&buf, "%s/.git", ce->name);
> +		git_dir = read_gitfile(buf.buf);
> +		if (!git_dir)
> +			git_dir = buf.buf;
> +		if (!is_git_directory(git_dir)) {
> +			if (is_directory(git_dir))
> +				die(_("'%s' not recognized as a git repository"), git_dir);
> +			strbuf_release(&buf);
> +			/* The submodule is not checked out, so it is not modified */
> +			util->dirty_submodule = 0;
> +			continue;
> +		}
> +		strbuf_release(&buf);
> +
> +		task = xmalloc(sizeof(*task));
> +		memset(task, 0, sizeof(*task));
> +		task->path = ce->name;
> +		task->ignore_untracked = util->ignore_untracked;
> +		sps->index_count++;
> +		return task;
> +	}
> +	return NULL;
> +}
> +
>  static struct fetch_task *
>  get_fetch_task_from_index(struct submodule_parallel_fetch *spf,
>  			  struct strbuf *err)
> @@ -1744,6 +1799,16 @@ static int fetch_start_failure(struct strbuf *err,
>  	return 0;
>  }
>  
> +static int status_start_failure(struct strbuf *err,
> +			       void *cb, void *task_cb)
> +{
> +	struct submodule_parallel_status *sps = cb;
> +
> +	sps->result = 1;
> +	return 0;
> +}
> +
> +
>  static int commit_missing_in_sub(const struct object_id *oid, void *data)
>  {
>  	struct repository *subrepo = data;
> @@ -1790,6 +1855,30 @@ static int parse_status_porcelain(char *buf, unsigned *dirty_submodule, int igno
>  	return 0;
>  }
>  
> +static int status_finish(int retvalue, struct strbuf *err,
> +			void *cb, void *task_cb)
> +{
> +	struct submodule_parallel_status *sps = cb;
> +	struct status_task *task = task_cb;
> +	struct string_list list = STRING_LIST_INIT_DUP;
> +	struct string_list_item *it = string_list_lookup(sps->submodule_names,
> +											task->path);
> +	struct submodule_status_util *util = it->util;
> +
> +	int i;
> +
> +	string_list_split(&list, err->buf, '\n', -1);
> +
> +	for (i = 0; i < list.nr; i++) {
> +		if (parse_status_porcelain(list.items[i].string,
> +							&util->dirty_submodule, util->ignore_untracked))
> +			break;
> +	}
> +	strbuf_reset(err);
> +
> +	return 0;
> +}
> +
>  static int fetch_finish(int retvalue, struct strbuf *err,
>  			void *cb, void *task_cb)
>  {
> @@ -1943,6 +2032,59 @@ unsigned is_submodule_modified(const char *path, int ignore_untracked)
>  	return dirty_submodule;
>  }
>  
> +static int get_next_submodule_status(struct child_process *cp,
> +						struct strbuf *err, void *data, void **task_cb)
> +{
> +	struct submodule_parallel_status *sps = data;
> +	struct status_task *task = get_status_task_from_index(sps, err);
> +
> +	int ignore_untracked;
> +
> +	if (!task) {
> +		return 0;
> +	}
> +
> +	ignore_untracked = task->ignore_untracked;
> +
> +	child_process_init(cp);
> +	prepare_submodule_repo_env_in_gitdir(&cp->env);
> +
> +	strvec_init(&cp->args);
> +	strvec_pushl(&cp->args, "status", "--porcelain=2", NULL);
> +	if (ignore_untracked)
> +		strvec_push(&cp->args, "-uno");
> +
> +	prepare_submodule_repo_env(&cp->env);
> +	cp->git_cmd = 1;
> +	cp->no_stdin = 1;
> +	cp->dir = task->path;
> +	*task_cb = task;
> +	return 1;
> +}
> +
> +int get_submodules_status(struct repository *r,
> +			struct string_list *submodules,
> +		    int max_parallel_jobs)
> +{
> +	struct submodule_parallel_status sps = SPS_INIT;
> +
> +	sps.r = r;
> +
> +	if (repo_read_index(r) < 0)
> +		die(_("index file corrupt"));
> +
> +	sps.submodule_names = submodules;
> +	string_list_sort(sps.submodule_names);
> +	run_processes_parallel_pipe_output = 1;
> +	run_processes_parallel_tr2(max_parallel_jobs,
> +				get_next_submodule_status,
> +				status_start_failure,
> +				status_finish,
> +				&sps,
> +				"submodule", "parallel/status");
> +	return sps.result;
> +}
> +
>  int submodule_uses_gitfile(const char *path)
>  {
>  	struct child_process cp = CHILD_PROCESS_INIT;
> diff --git a/submodule.h b/submodule.h
> index bfaa9da186..18a42c64ce 100644
> --- a/submodule.h
> +++ b/submodule.h
> @@ -41,6 +41,12 @@ struct submodule_update_strategy {
>  	.type = SM_UPDATE_UNSPECIFIED, \
>  }
>  
> +struct submodule_status_util {
> +	int changed, ignore_untracked;
> +	unsigned dirty_submodule, newmode;
> +	struct cache_entry *ce;
> +};
> +
>  int is_gitmodules_unmerged(struct index_state *istate);
>  int is_writing_gitmodules_ok(void);
>  int is_staging_gitmodules_ok(struct index_state *istate);
> @@ -94,6 +100,9 @@ int fetch_submodules(struct repository *r,
>  		     int command_line_option,
>  		     int default_option,
>  		     int quiet, int max_parallel_jobs);
> +int get_submodules_status(struct repository *r,
> +			 struct string_list *submodules,
> +		     int max_parallel_jobs);
>  unsigned is_submodule_modified(const char *path, int ignore_untracked);
>  int submodule_uses_gitfile(const char *path);
>  
> diff --git a/wt-status.c b/wt-status.c
> index 867e3e417e..9864484f81 100644
> --- a/wt-status.c
> +++ b/wt-status.c
> @@ -615,7 +615,7 @@ static void wt_status_collect_changes_worktree(struct wt_status *s)
>  	rev.diffopt.rename_limit = s->rename_limit >= 0 ? s->rename_limit : rev.diffopt.rename_limit;
>  	rev.diffopt.rename_score = s->rename_score >= 0 ? s->rename_score : rev.diffopt.rename_score;
>  	copy_pathspec(&rev.prune_data, &s->pathspec);
> -	run_diff_files(&rev, 0);
> +	run_diff_files(&rev, 0, s->parallel_jobs_submodules);
>  	release_revisions(&rev);
>  }
>  
> @@ -1149,7 +1149,7 @@ static void wt_longstatus_print_verbose(struct wt_status *s)
>  		setup_work_tree();
>  		rev.diffopt.a_prefix = "i/";
>  		rev.diffopt.b_prefix = "w/";
> -		run_diff_files(&rev, 0);
> +		run_diff_files(&rev, 0, -1);
>  	}
>  	release_revisions(&rev);
>  }
> @@ -2544,7 +2544,7 @@ int has_unstaged_changes(struct repository *r, int ignore_submodules)
>  	}
>  	rev_info.diffopt.flags.quick = 1;
>  	diff_setup_done(&rev_info.diffopt);
> -	result = run_diff_files(&rev_info, 0);
> +	result = run_diff_files(&rev_info, 0, -1);
>  	result = diff_result_code(&rev_info.diffopt, result);
>  	release_revisions(&rev_info);
>  	return result;
> diff --git a/wt-status.h b/wt-status.h
> index ab9cc9d8f0..2ea2317715 100644
> --- a/wt-status.h
> +++ b/wt-status.h
> @@ -131,6 +131,7 @@ struct wt_status {
>  	enum wt_status_format status_format;
>  	struct wt_status_state state;
>  	struct object_id oid_commit; /* when not Initial */
> +	int parallel_jobs_submodules;
>  
>  	/* These are computed during processing of the individual sections */
>  	int committable;
> -- 
> 2.37.3.998.g577e59143f-goog
> 

I feel like we're missing tests exercising status.parallelSubmodules=N?

 - Emily
