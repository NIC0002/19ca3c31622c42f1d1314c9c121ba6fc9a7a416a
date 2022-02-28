Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A792C433F5
	for <git@archiver.kernel.org>; Mon, 28 Feb 2022 12:38:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234027AbiB1MjE (ORCPT <rfc822;git@archiver.kernel.org>);
        Mon, 28 Feb 2022 07:39:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235322AbiB1MjC (ORCPT <rfc822;git@vger.kernel.org>);
        Mon, 28 Feb 2022 07:39:02 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D20F2C112
        for <git@vger.kernel.org>; Mon, 28 Feb 2022 04:38:19 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id bq11so17408567edb.2
        for <git@vger.kernel.org>; Mon, 28 Feb 2022 04:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=klerks-biz.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P+b4kZtcSrmKTKz0Q8VhOzkZdhYgjowF7LtS2N6XEas=;
        b=apHVMvwLQNyGTW0jnpGrlIfHRq7lInd9D1tABu4kppCbzihcyooM7Pwaj112D3Foi0
         GZcyLzvuRYE2YNoX2U5dSwmT705oEEavDfcro9RIpQP7hkKpEFtIP7sCt56Wsd+EeAYA
         5ppVxSFxex9yvX90uCQhJ2eWB+EgP2p5HtN4rFPabnBdVCxwwMHSe0CgjrcQ/a8SGCKI
         /8kMs6Y2OVjClmGE1jZwy8oXpEA9OG4YM1FkShS+MMIdGcdKtv/L56B5aI7gySrUO1TZ
         6xyg+ekZuqkt5dI6Kpr+sDYc6/fdR1p1HiSFd/8XsEajs0Om/irKbiHmBQUZoIL2USxL
         xhlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P+b4kZtcSrmKTKz0Q8VhOzkZdhYgjowF7LtS2N6XEas=;
        b=Oee8D7djWkR1ltXXO6lcg6HbAvCi+ZHBJxgGThogSwvisg3s+nV3x7npcSTp+UjEG3
         sFdtElFBng55Pyl3HmgI6Bc5pwxpboJ5S4YqS5uEmIP4B1BbfQFwmJx3Ny15rjS+IKDJ
         wT5cEKeADfswaVp1CdvoFgroMM1oIYERRg5q80cG0nWmGXZ9hznnvvevsHmzmApjZPw3
         dpohEBkQdr2ie4PTCgMRTysqHjGCF/BzBVqnS9lnu4JRA3z22LoV2Rn8JKORleDCkjxL
         /4DsrM5i99Sj73yAGpg53Hb67CfeHSUhWDWKGcI9BMMWEpwmOkXdgjLiDKDuncbYNkMm
         S3dg==
X-Gm-Message-State: AOAM532dNvOuKC28mO8f4FrnOQ44B70amE2T/82JzWMUzVxerNlZH8Ve
        Qh3Tge3R2a/hh0i8YAc/lV7jijMlU5rIfGdk0manEMDfMa8=
X-Google-Smtp-Source: ABdhPJxOtI603f+EqW8M0ILYoGtDsPyHsNm/r/5ovmM4UFczWua3wO03swAxt7pY48gUT0DIigI485XzSSHZ3Dg8nvE=
X-Received: by 2002:a50:f118:0:b0:413:2c9e:d519 with SMTP id
 w24-20020a50f118000000b004132c9ed519mr19173345edl.387.1646051897447; Mon, 28
 Feb 2022 04:38:17 -0800 (PST)
MIME-Version: 1.0
References: <xmqqee3q73e1.fsf@gitster.g>
In-Reply-To: <xmqqee3q73e1.fsf@gitster.g>
From:   Tao Klerks <tao@klerks.biz>
Date:   Mon, 28 Feb 2022 13:38:06 +0100
Message-ID: <CAPMMpojgTcp7qGmpK0vm8_WTOaSJ6r=NBa3sEO0EC7XRBF_dXg@mail.gmail.com>
Subject: Re: What's cooking in git.git (Feb 2022, #07; Fri, 25)
To:     Junio C Hamano <gitster@pobox.com>
Cc:     git@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

My apologies if this is not the right forum for commenting on these summaries;

for tk/untracked-cache-with-uall, I believe the current description is
misleading:

> The untracked cache system does not work well when the setting of
> status.showuntrackedfiles is 'normal' and not 'all', which has been
> updated.

It's almost exactly backwards, in that the case where untracked cache
gets bypassed is when you specify "all". The "what we do" section is
also slightly overambitious as the fix is limited to improving
performance / supporting the cache when runtime flags are consistent
with configuration, which will improve a couple cases, worsen one
specific and (I believe) rare case, and not change most.

If I could reword, it would look something like this:

 The untracked cache system is bypassed when a command runs
 with the "showuntrackedfiles" flag set to "all" via config or arguments,
 because untracked cache content of "normal" is incompatible with
 "all" and vice versa.
 Instead use it whenever runtime flags are consistent with
 configuration, so that frequent users of "-uall" can get consistent
 performance by setting status.showuntrackedfiles config to "all".

This is quite verbose, but I can't figure out how to condense the concept
further.

(thanks again for considering this improvement, which will/would
enable dramatically better performance for large-repo users of GUI
tooling that insists on -uall, such as Git Extensions or Intellij IDEA)


On Sat, Feb 26, 2022 at 3:44 AM Junio C Hamano <gitster@pobox.com> wrote:
>
> Here are the topics that have been cooking in my tree.  Commits
> prefixed with '+' are in 'next' (being in 'next' is a sign that a
> topic is stable enough to be used and are candidate to be in a
> future release).  Commits prefixed with '-' are only in 'seen',
> which means nothing more than that I have found them of interest for
> some reason (like "it may have hard-to-resolve conflicts with
> another topic already in flight" or "this may turn out to be
> useful").  Do not read too much into a topic being in (or not in)
> 'seen'.  The ones marked with '.' do not appear in any of the
> integration branches, but I am still holding onto them.
>
> Copies of the source code to Git live in many repositories, and the
> following is a list of the ones I push into or their mirrors.  Some
> repositories have only a subset of branches.
>
> With maint, master, next, seen, todo:
>
>         git://git.kernel.org/pub/scm/git/git.git/
>         git://repo.or.cz/alt-git.git/
>         https://kernel.googlesource.com/pub/scm/git/git/
>         https://github.com/git/git/
>         https://gitlab.com/git-vcs/git/
>
> With all the integration branches and topics broken out:
>
>         https://github.com/gitster/git/
>
> Even though the preformatted documentation in HTML and man format
> are not sources, they are published in these repositories for
> convenience (replace "htmldocs" with "manpages" for the manual
> pages):
>
>         git://git.kernel.org/pub/scm/git/git-htmldocs.git/
>         https://github.com/gitster/git-htmldocs.git/
>
> Release tarballs are available at:
>
>         https://www.kernel.org/pub/software/scm/git/
>
> --------------------------------------------------
> [Graduated to 'master']
>
> * ab/ambiguous-object-name (2022-01-27) 7 commits
>   (merged to 'next' on 2022-02-15 at 6028098cfe)
>  + object-name: re-use "struct strbuf" in show_ambiguous_object()
>  + object-name: iterate ambiguous objects before showing header
>  + object-name: show date for ambiguous tag objects
>  + object-name: make ambiguous object output translatable
>  + object-name: explicitly handle bad tags in show_ambiguous_object()
>  + object-name: explicitly handle OBJ_BAD in show_ambiguous_object()
>  + object-name tests: add tests for ambiguous object blind spots
>
>  Error output given in response to an ambiguous object name has been
>  improved.
>  source: <cover-v8-0.7-00000000000-20220127T052116Z-avarab@gmail.com>
>
>
> * ab/date-mode-release (2022-02-16) 5 commits
>   (merged to 'next' on 2022-02-17 at 62f1cf68ae)
>  + date API: add and use a date_mode_release()
>  + date API: add basic API docs
>  + date API: provide and use a DATE_MODE_INIT
>  + date API: create a date.h, split from cache.h
>  + cache.h: remove always unused show_date_human() declaration
>
>  Plug (some) memory leaks around parse_date_format().
>  source: <cover-v3-0.5-00000000000-20220216T081203Z-avarab@gmail.com>
>
>
> * ab/diff-free-more (2022-02-16) 2 commits
>   (merged to 'next' on 2022-02-17 at be8ae78a2d)
>  + diff.[ch]: have diff_free() free options->parseopts
>  + diff.[ch]: have diff_free() call clear_pathspec(opts.pathspec)
>
>  Leakfixes.
>  source: <cover-0.2-00000000000-20220216T105250Z-avarab@gmail.com>
>
>
> * ab/grep-patterntype (2022-02-15) 10 commits
>   (merged to 'next' on 2022-02-16 at 64222759a2)
>  + grep: simplify config parsing and option parsing
>  + grep.c: do "if (bool && memchr())" not "if (memchr() && bool)"
>  + grep.h: make "grep_opt.pattern_type_option" use its enum
>  + grep API: call grep_config() after grep_init()
>  + grep.c: don't pass along NULL callback value
>  + built-ins: trust the "prefix" from run_builtin()
>  + grep tests: add missing "grep.patternType" config tests
>  + grep tests: create a helper function for "BRE" or "ERE"
>  + log tests: check if grep_config() is called by "log"-like cmds
>  + grep.h: remove unused "regex_t regexp" from grep_opt
>
>  Some code clean-up in the "git grep" machinery.
>  source: <cover-v11-00.10-00000000000-20220216T000006Z-avarab@gmail.com>
>
>
> * ab/only-single-progress-at-once (2022-02-03) 9 commits
>   (merged to 'next' on 2022-02-15 at 97ac92e662)
>  + pack-bitmap-write.c: don't return without stop_progress()
>  + progress API: unify stop_progress{,_msg}(), fix trace2 bug
>  + progress.c: refactor stop_progress{,_msg}() to use helpers
>  + progress.c: use dereferenced "progress" variable, not "(*p_progress)"
>  + progress.h: format and be consistent with progress.c naming
>  + progress.c tests: test some invalid usage
>  + progress.c tests: make start/stop commands on stdin
>  + progress.c test helper: add missing braces
>  + leak tests: fix a memory leak in "test-progress" helper
>
>  Further tweaks on progress API.
>  source: <cover-v9-0.9-00000000000-20220203T213350Z-avarab@gmail.com>
>
>
> * ds/core-untracked-cache-config (2022-02-17) 1 commit
>   (merged to 'next' on 2022-02-18 at 0c426fdec1)
>  + dir: force untracked cache with core.untrackedCache
>
>  Setting core.untrackedCache to true failed to add the untracked
>  cache extension to the index.
>  source: <pull.1058.v2.git.1645131630140.gitgitgadget@gmail.com>
>
>
> * ds/sparse-checkout-requires-per-worktree-config (2022-02-08) 6 commits
>   (merged to 'next' on 2022-02-15 at f86bec6da9)
>  + config: make git_configset_get_string_tmp() private
>  + worktree: copy sparse-checkout patterns and config on add
>  + sparse-checkout: set worktree-config correctly
>  + config: add repo_config_set_worktree_gently()
>  + worktree: create init_worktree_config()
>  + Documentation: add extensions.worktreeConfig details
>  (this branch is used by ds/worktree-docs.)
>
>  "git sparse-checkout" wants to work with per-worktree configuration,
>  but did not work well in a worktree attached to a bare repository.
>  source: <pull.1101.v6.git.1644269583.gitgitgadget@gmail.com>
>
>
> * en/ort-inner-merge-conflict-report (2022-02-17) 1 commit
>   (merged to 'next' on 2022-02-18 at 367dd32e74)
>  + merge-ort: make informational messages from recursive merges clearer
>
>  Messages "ort" merge backend prepares while dealing with conflicted
>  paths were unnecessarily confusing since it did not differentiate
>  inner merges and outer merges.
>  source: <pull.1121.git.1645079923090.gitgitgadget@gmail.com>
>
>
> * ja/i18n-common-messages (2022-02-04) 4 commits
>   (merged to 'next' on 2022-02-15 at 23d56641fc)
>  + i18n: fix some misformated placeholders in command synopsis
>  + i18n: remove from i18n strings that do not hold translatable parts
>  + i18n: factorize "invalid value" messages
>  + i18n: factorize more 'incompatible options' messages
>
>  Unify more messages to help l10n.
>  source: <pull.1123.v4.git.1643666870.gitgitgadget@gmail.com>
>
>
> * jc/name-rev-stdin (2022-02-15) 1 commit
>   (merged to 'next' on 2022-02-16 at ee993590a4)
>  + name-rev: replace --stdin with --annotate-stdin in synopsis
>
>  Finishing touches to an earlier "name-rev --annotate-stdin" series.
>  source: <pull.1216.git.git.1644958327302.gitgitgadget@gmail.com>
>
>
> * js/apply-partial-clone-filters-recursively (2022-02-09) 1 commit
>   (merged to 'next' on 2022-02-16 at 4b3852bd52)
>  + clone, submodule: pass partial clone filters to submodules
>
>  "git clone --filter=... --recurse-submodules" only makes the
>  top-level a partial clone, while submodules are fully cloned.  This
>  behaviour is changed to pass the same filter down to the submodules.
>  source: <690d2316ad518ea4551821b2b3aa652996858475.1644034886.git.steadmon@google.com>
>
>
> * rs/pcre-invalid-utf8-fix-fix (2022-02-17) 1 commit
>   (merged to 'next' on 2022-02-18 at 9e47d58bda)
>  + grep: fix triggering PCRE2_NO_START_OPTIMIZE workaround
>
>  Workaround we have for versions of PCRE2 before their version 10.36
>  were in effect only for their versions newer than 10.36 by mistake,
>  which has been corrected.
>  source: <4e391e2e-6561-3c2e-0306-c860a37356bc@web.de>
>
>
> * tb/coc-plc-update (2022-02-18) 1 commit
>   (merged to 'next' on 2022-02-23 at 9d45e42c9a)
>  + CODE_OF_CONDUCT.md: update PLC members list
>
>  Document Taylor as a new member of Git PLC at SFC.  Welcome.
>  source: <f5daef58bc0bededd46bc9686c586ba5ae9a453c.1645211253.git.me@ttaylorr.com>
>
> --------------------------------------------------
> [New Topics]
>
> * et/xdiff-indirection (2022-02-17) 1 commit
>  - xdiff: provide indirection to git functions
>
>  Insert a layer of preprocessor macros for common functions in xdiff
>  codebase.
>
>  Expecting a (hopefully final) reroll.
>  cf. <xmqqbkyudb8n.fsf@gitster.g>
>  source: <20220217225408.GB7@edef91d97c94>
>
>
> * jt/ls-files-stage-recurse (2022-02-23) 1 commit
>  - ls-files: support --recurse-submodules --stage
>
>  Many output modes of "ls-files" does not work with its
>  "--recurse-submodules" option, but the "-s" mode has taught to work
>  with it.
>  source: <20220224002303.2363189-1-jonathantanmy@google.com>
>
>
> * ab/c99 (2022-02-21) 2 commits
>  - C99: remove hardcoded-out !HAVE_VARIADIC_MACROS code
>  - git-compat-util.h: clarify GCC v.s. C99-specific in comment
>
>  Remove the escape hatch we added when we introduced the weather
>  balloon to use variadic macros unconditionally, to make it official
>  that we now have a hard dependency on the feature.
>
>  Will merge to 'next'.
>  source: <cover-v4-0.2-00000000000-20220221T160440Z-avarab@gmail.com>
>
>
> * ab/hook-tests (2022-02-19) 2 commits
>  - hook tests: use a modern style for "pre-push" tests
>  - hook tests: test for exact "pre-push" hook input
>
>  Test modernization.
>
>  Will merge to 'next'.
>  source: <cover-0.2-00000000000-20220218T204719Z-avarab@gmail.com>
>
>
> * ab/test-lib-tweaks (2022-02-21) 4 commits
>  - test-lib: add "fast_unwind_on_malloc=0" to LSAN_OPTIONS
>  - test-lib: make $GIT_BUILD_DIR an absolute path
>  - test-lib: correct commentary on TEST_DIRECTORY overriding
>  - test-lib: add GIT_SAN_OPTIONS, inherit [AL]SAN_OPTIONS
>
>  Random test-framework clean-up.
>
>  Will merge to 'next'?
>  source: <cover-v3-0.4-00000000000-20220221T155656Z-avarab@gmail.com>
>
>
> * ds/worktree-docs (2022-02-23) 11 commits
>  - worktree: use 'worktree' over 'working tree'
>  - worktree: use 'worktree' over 'working tree'
>  - worktree: use 'worktree' over 'working tree'
>  - worktree: use 'worktree' over 'working tree'
>  - worktree: use 'worktree' over 'working tree'
>  - worktree: use 'worktree' over 'working tree'
>  - worktree: use 'worktree' over 'working tree'
>  - worktree: extract checkout_worktree()
>  - worktree: extract copy_sparse_checkout()
>  - worktree: extract copy_filtered_worktree_config()
>  - worktree: combine two translatable messages
>
>  Tighten the language around "working tree" and "worktree" in the
>  docs.
>
>  Will merge to 'next'.
>  source: <pull.1154.v3.git.1645626559.gitgitgadget@gmail.com>
>
>
> * en/merge-ort-plug-leaks (2022-02-20) 2 commits
>  - merge-ort: fix small memory leak in unique_path()
>  - merge-ort: fix small memory leak in detect_and_process_renames()
>
>  Leakfix.
>
>  Will merge to 'next'.
>  source: <pull.1152.v2.git.1645320591.gitgitgadget@gmail.com>
>
>
> * jc/rerere-train-modernise (2022-02-20) 1 commit
>  - rerere-train: modernise a bit
>
>  Small modernisation of the rerere-train script (in contrib/).
>
>  Will merge to 'next'.
>  source: <xmqqsfsjuw8m.fsf@gitster.g>
>
>
> * ab/help-fixes (2022-02-23) 9 commits
>  - help: don't print "\n" before single-section output
>  - help: add --no-[external-commands|aliases] for use with --all
>  - help: error if [-a|-g|-c] and [-i|-m|-w] are combined
>  - help: correct usage & behavior of "git help --all"
>  - help: note the option name on option incompatibility
>  - help.c: split up list_all_cmds_help() function
>  - help tests: test "git" and "git help [-a|-g] spacing
>  - help.c: use puts() instead of printf{,_ln}() for consistency
>  - help doc: add missing "]" to "[-a|--all]"
>
>  Updates to how command line options to "git help" are handled.
>
>  Will merge to 'next'?
>  source: <cover-v2-0.9-00000000000-20220221T193708Z-avarab@gmail.com>
>
>
> * ac/usage-string-fixups (2022-02-23) 2 commits
>  - parse-options.c: add style checks for usage-strings
>  - amend remaining usage strings according to style guide
>
>  Usage-string normalization, plus runtime enforcement.
>
>  Will merge to 'next'?
>  source: <pull.1147.v3.git.1645626455.gitgitgadget@gmail.com>
>
>
> * mc/index-pack-report-max-size (2022-02-23) 1 commit
>  - index-pack: clarify the breached limit
>
>  When "index-pack" dies due to incoming data exceeding the maximum
>  allowed input size, include the value of the limit in the error
>  message.
>
>  Will merge to 'next'?
>  source: <pull.1158.v2.git.1645661240356.gitgitgadget@gmail.com>
>
>
> * sm/no-git-in-upstream-of-pipe-in-tests (2022-02-23) 1 commit
>  - t0003: avoid pipes with Git on LHS
>
>  Test fixes.
>
>  Will merge to 'next'.
>  source: <20220223115347.3083-3-shivam828787@gmail.com>
>
>
> * ab/c99-designated-initializers (2022-02-24) 9 commits
>  - fast-import.c: use designated initializers for "partial" struct assignments
>  - refspec.c: use designated initializers for "struct refspec_item"
>  - convert.c: use designated initializers for "struct stream_filter*"
>  - userdiff.c: use designated initializers for "struct userdiff_driver"
>  - archive-*.c: use designated initializers for "struct archiver"
>  - object-file: use designated initializers for "struct git_hash_algo"
>  - trace2: use designated initializers for "struct tr2_dst"
>  - trace2: use designated initializers for "struct tr2_tgt"
>  - imap-send.c: use designated initializers for "struct imap_server_conf"
>
>  Use designated initializers we started using in mid 2017 in more
>  parts of the codebase that are relatively quiescent.
>
>  Will merge to 'next' and then to 'master'.
>  source: <cover-00.12-00000000000-20220224T092805Z-avarab@gmail.com>
>
>
> * ab/http-gcc-12-workaround (2022-02-25) 1 commit
>  - http API: fix dangling pointer issue noted by GCC 12.0
>
>  Work around false warning pre-release of GCC 12.
>  source: <patch-v2-1.1-777838267a5-20220225T090816Z-avarab@gmail.com>
>
>
> * ab/make-optim-noop (2022-02-25) 9 commits
>  - Makefiles: add and use wildcard "mkdir -p" template
>  - Makefile: use $(wspfx) for $(QUIET...) in shared.mak
>  - Makefile: add "$(QUIET)" boilerplate to shared.mak
>  - Makefile: move $(comma), $(empty) and $(space) to shared.mak
>  - Makefile: move ".SUFFIXES" rule to shared.mak
>  - Makefile: define $(LIB_H) in terms of $(FIND_SOURCE_FILES)
>  - Makefile: disable GNU make built-in wildcard rules
>  - Makefiles: add "shared.mak", move ".DELETE_ON_ERROR" to it
>  - scalar Makefile: set the default target after the includes
>
>  Makefile refactoring with a bit of suffixes rule stripping to
>  optimize the runtime overhead.
>
>  Expecting a reroll.
>  cf. <220226.861qzq7d2r.gmgdl@evledraar.gmail.com>
>  source: <cover-v3-0.9-00000000000-20220225T090127Z-avarab@gmail.com>
>
>
> * ah/advice-switch-requires-detach-to-detach (2022-02-24) 1 commit
>  - switch: mention the --detach option when dying due to lack of a branch
>
>  The error message given by "git switch HEAD~4" has been clarified
>  to suggest the "--detach" option that is required.
>
>  Will merge to 'next'?
>  source: <20220224064710.2252637-1-alexhenrie24@gmail.com>
>
>
> * ds/commit-graph-gen-v2-fixes (2022-02-24) 7 commits
>  - commit-graph: write file format v2
>  - commit-graph: parse file format v2
>  - commit-graph: document file format v2
>  - commit-graph: fix generation number v2 overflow values
>  - commit-graph: start parsing generation v2 (again)
>  - commit-graph: fix ordering bug in generation numbers
>  - test-read-graph: include extra post-parse info
>
>  Fixes to the way generation number v2 in the commit-graph files are
>  (not) handled, and introduce a newer file format to store the same
>  information in a way that is more efficient to access.
>
>  Expecting a reroll.
>  source: <pull.1163.git.1645735117.gitgitgadget@gmail.com>
>
>
> * ds/partial-bundles (2022-02-24) 11 commits
>  - bundle: unbundle promisor packs
>  - bundle: create filtered bundles
>  - rev-list: move --filter parsing into revision.c
>  - bundle: parse filter capability
>  - bundle: safely handle --objects option
>  - MyFirstObjectWalk: update recommended usage
>  - list-objects: consolidate traverse_commit_list[_filtered]
>  - pack-bitmap: drop filter in prepare_bitmap_walk()
>  - pack-objects: use rev.filter when possible
>  - revision: put object filter into struct rev_info
>  - index-pack: document and test the --promisor option
>  (this branch is used by ds/bundle-uri.)
>
>  Bundle file format gets extended to allow a partial bundle,
>  filtered by similar criteria you would give when making a
>  partial/lazy clone.
>  source: <pull.1159.git.1645638911.gitgitgadget@gmail.com>
>
>
> * fs/gpgsm-update (2022-02-24) 3 commits
>  - t/lib-gpg: kill all gpg components, not just gpg-agent
>  - t/lib-gpg: reload gpg components after updating trustlist
>  - gpg-interface/gpgsm: fix for v2.3
>
>  Newer version of GPGSM changed its output in a backward
>  incompatible way to break our code that parses its output.  It also
>  added more processes our tests need to kill when cleaning up.
>  Adjustments have been made to accomodate these changes.
>
>  Will merge to 'next'.
>  source: <20220203123724.47529-1-fs@gigacodes.de>
>
>
> * gc/stash-on-branch-with-multi-level-name (2022-02-24) 1 commit
>  - stash: strip "refs/heads/" with skip_prefix
>
>  "git checkout -b branch/with/multi/level/name && git stash" only
>  recorded the last level component of the branch name, which has
>  been corrected.
>
>  Will merge to 'next'.
>  source: <20220124205342.41450-1-chooglen@google.com>
>
>
> * jd/prompt-upstream-mark (2022-02-25) 4 commits
>  - git-prompt: put upstream comments together
>  - git-prompt: make long upstream state indicator consistent
>  - git-prompt: make upstream state indicator location consistent
>  - git-prompt: rename `upstream` to `upstream_type`
>
>  Tweaks in the command line prompt (in contrib/) code around its
>  GIT_PS1_SHOWUPSTREAM feature.
>
>  Needs reviews.
>  source: <pull.1162.git.1645789446.gitgitgadget@gmail.com>
>
>
> * pw/worktree-list-with-z (2022-02-25) 1 commit
>  - worktree: add -z option for list subcommand
>
>  "git worktree list --porcelain" did not c-quote pathnames and lock
>  reasons with unsafe bytes correctly, which is worked around by
>  introducing NUL terminated output format with "-z".
>
>  Iffy.
>  source: <pull.1164.git.1645801727732.gitgitgadget@gmail.com>
>
>
> * rc/fetch-repair (2022-02-24) 8 commits
>  - doc/partial-clone: mention --repair fetch option
>  - fetch: after repair, encourage auto gc repacking
>  - maintenance: add ability to pass config options
>  - t5615-partial-clone: add test for fetch --repair
>  - fetch: add --repair option
>  - builtin/fetch-pack: add --repair option
>  - fetch-pack: add repairing
>  - fetch-negotiator: add specific noop initializor
>
>  "git fetch --repair" learned to fetch everything without telling
>  the other side what we already have, which is useful when you
>  cannot trust what you have in the local object store.
>
>  Iffy.  It may be cleaner to make a fresh clone and salvage bits
>  out of the suspicious repository being "repair"ed.
>  source: <pull.1138.v2.git.1645719218.gitgitgadget@gmail.com>
>
>
> * tk/empty-untracked-cache (2022-02-25) 3 commits
>  - untracked-cache: write index when populating empty untracked cache
>  - t7519: populate untracked cache before test
>  - t7519: avoid file to index mtime race for untracked cache
>
>  The untracked cache newly computed weren't written back to the
>  on-disk index file when there is no other change to the index,
>  which has been corrected.
>
>  Will merge to 'next'.
>  source: <pull.986.v2.git.1645809015.gitgitgadget@gmail.com>
>
>
> * tk/simple-autosetupmerge (2022-02-25) 2 commits
>  - t3200: tests for new branch.autosetupmerge option "simple"
>  - merge: new autosetupmerge option 'simple' for matching branches
>
>  "git -c branch.autosetupmerge=simple branch $A $B" will set the $B
>  as $A's upstream only when $A and $B shares the same name, and "git
>  -c push.default=simple" on branch $A would push to update the
>  branch $A at the remote $B came from.
>
>  Needs review.
>  source: <pull.1161.v2.git.1645815142.gitgitgadget@gmail.com>
>
>
> * tk/untracked-cache-with-uall (2022-02-25) 1 commit
>  - untracked-cache: support '--untracked-files=all' if configured
>
>  The untracked cache system does not work well when the setting of
>  status.showuntrackedfiles is 'normal' and not 'all', which has been
>  updated.
>
>  Needs review.
>  source: <pull.985.v2.git.1645811564461.gitgitgadget@gmail.com>
>
>
> * vd/sparse-read-tree (2022-02-24) 7 commits
>  - read-tree: make three-way merge sparse-aware
>  - read-tree: make two-way merge sparse-aware
>  - read-tree: narrow scope of index expansion for '--prefix'
>  - read-tree: integrate with sparse index
>  - read-tree: expand sparse checkout test coverage
>  - status: fix nested sparse directory diff in sparse index
>  - sparse-index: prevent repo root from becoming sparse
>
>  "git read-tree" has been made to be aware of the sparse-index
>  feature.
>
>  Needs review.
>  source: <pull.1157.v2.git.1645742073.gitgitgadget@gmail.com>
>
> --------------------------------------------------
> [Stalled]
>
> * je/http-better-error-output (2021-12-03) 1 commit
>  . http-backend: give a hint that web browser access is not supported
>
>  When the http-backend program, which is the server-side component
>  for the smart HTTP transport, sends a "404 Not found" error, we
>  deliberately did not say anything to the requesting client.  We now
>  send a message back to the browser to tell the user that they do
>  not want to visit the URL via their browser, instead of a totally
>  blank page.
>
>  Expecting a reroll.
>  Breaks its self tests.
>  cf. <7r23s082-o3q0-479o-srqn-r45q778s5nq7@vanv.qr>
>  source: <20211202102855.23907-1-jengelh@inai.de>
>
>
> * cb/save-term-across-editor-invocation (2021-12-01) 3 commits
>  - fixup! editor: allow for saving/restoring terminal state
>  - editor: allow for saving/restoring terminal state
>  - terminal: teach save_term to fail when not foreground
>
>  Some editors are reported to leave the terminal in funny state
>  after they exit on Windows.  Work it around by saving and restoring
>  the terminal state when needed.
>
>  Expecting a reroll.
>  cf. <CAPUEsphktbdxeV7hvF52Or3CVHS8oOk5-WV=xfEZa8kfCVVnVg@mail.gmail.com>
>  source: <20211202035446.1154-1-carenas@gmail.com>
>
> --------------------------------------------------
> [Cooking]
>
> * en/sparse-checkout-fixes (2022-02-20) 5 commits
>  - sparse-checkout: reject arguments in cone-mode that look like patterns
>  - sparse-checkout: error or warn when given individual files
>  - sparse-checkout: pay attention to prefix for {set, add}
>  - sparse-checkout: correctly set non-cone mode when expected
>  - sparse-checkout: correct reapply's handling of options
>
>  Further polishing of "git sparse-checkout".
>
>  Will merge to 'next'.
>  source: <pull.1118.v5.git.1645289086.gitgitgadget@gmail.com>
>
>
> * ab/commit-plug-leaks (2022-02-16) 2 commits
>  - commit: use strbuf_release() instead of UNLEAK()
>  - commit: fix "author_ident" leak
>
>  Leakfixes in the top-level called-once function.
>
>  Expecting a reroll.
>  I think UNLEAK->strbuf_release() is a regression.
>  source: <cover-0.2-00000000000-20220216T081844Z-avarab@gmail.com>
>
>
> * pw/single-key-interactive (2022-02-23) 4 commits
>  - add -p: disable stdin buffering when interactive.singlekey is set
>  - terminal: set VMIN and VTIME in non-canonical mode
>  - terminal: pop signal handler when terminal is restored
>  - terminal: always reset terminal when reading without echo
>
>  The single-key interactive operation used by "git add -p" has been
>  made more robust.
>
>  Will merge to 'next'?
>  source: <pull.1146.v2.git.1645556015.gitgitgadget@gmail.com>
>
>
> * jh/builtin-fsmonitor-part3 (2022-02-16) 25 commits
>  - t/perf/p7527: add perf test for builtin FSMonitor
>  - t7527: FSMonitor tests for directory moves
>  - fsmonitor: optimize processing of directory events
>  - fsm-listen-darwin: shutdown daemon if worktree root is moved/renamed
>  - fsm-health-win32: force shutdown daemon if worktree root moves
>  - fsm-health-win32: add framework to monitor daemon health
>  - fsmonitor--daemon: stub in health thread
>  - fsmonitor--daemon: rename listener thread related variables
>  - fsmonitor--daemon: prepare for adding health thread
>  - fsmonitor--daemon: cd out of worktree root
>  - fsmonitor--daemon: print start message only if fsmonitor.announceStartup
>  - fsm-listen-darwin: ignore FSEvents caused by xattr changes on macOS
>  - unpack-trees: initialize fsmonitor_has_run_once in o->result
>  - fsmonitor-settings: remote repos on Windows are incompatible with FSMonitor
>  - fsmonitor-settings: remote repos on macOS are incompatible with FSMonitor
>  - fsmonitor-settings: stub in macOS-specific incompatibility checking
>  - fsmonitor-settings: virtual repos are incompatible with FSMonitor
>  - fsmonitor-settings: stub in platform-specific incompatibility checking
>  - fsmonitor-settings: bare repos are incompatible with FSMonitor
>  - t/helper/fsmonitor-client: create stress test
>  - t7527: test builtin FSMonitor watching repos with unicode paths
>  - t7527: test FS event reporing on macOS WRT case and Unicode
>  - fsm-listen-win32: handle shortnames
>  - p7519: leave 1_file directory empty
>  - Merge branch 'jh/builtin-fsmonitor-part2' into jh/builtin-fsmonitor-part3
>  (this branch uses jh/builtin-fsmonitor-part2.)
>
>  More fsmonitor--daemon.
>  source: <pull.1143.git.1644940773.gitgitgadget@gmail.com>
>
>
> * hn/reftable-no-empty-keys (2022-02-23) 7 commits
>  - reftable: rename writer_stats to reftable_writer_stats
>  - reftable: add test for length of disambiguating prefix
>  - reftable: ensure that obj_id_len is >= 2 on writing
>  - reftable: avoid writing empty keys at the block layer
>  - reftable: add a test that verifies that writing empty keys fails
>  - reftable: reject 0 object_id_len
>  - Documentation: object_id_len goes up to 31
>
>  General clean-up in reftable implementation, including
>  clarification of the API documentation, tightening the code to
>  honor documented length limit, etc.
>
>  Will merge to 'next'?
>  source: <pull.1185.v3.git.git.1645469170.gitgitgadget@gmail.com>
>
>
> * ps/fetch-atomic (2022-02-17) 7 commits
>   (merged to 'next' on 2022-02-18 at 3824153b23)
>  + fetch: make `--atomic` flag cover pruning of refs
>  + fetch: make `--atomic` flag cover backfilling of tags
>  + refs: add interface to iterate over queued transactional updates
>  + fetch: report errors when backfilling tags fails
>  + fetch: control lifecycle of FETCH_HEAD in a single place
>  + fetch: backfill tags before setting upstream
>  + fetch: increase test coverage of fetches
>
>  "git fetch" can make two separate fetches, but ref updates coming
>  from them were in two separate ref transactions under "--atomic",
>  which has been corrected.
>
>  Will merge to 'master'.
>  source: <cover.1645102965.git.ps@pks.im>
>
>
> * pw/xdiff-alloc-fail (2022-02-16) 4 commits
>  - xdiff: handle allocation failure when merging
>  - xdiff: refactor a function
>  - xdiff: handle allocation failure in patience diff
>  - xdiff: fix a memory leak
>
>  Improve failure case behaviour of xdiff library when memory
>  allocation fails.
>  source: <pull.1140.v2.git.1645006510.gitgitgadget@gmail.com>
>
>
> * gc/recursive-fetch-with-unused-submodules (2022-02-24) 11 commits
>  - SQUASH???
>  - submodule: fix latent check_has_commit() bug
>  - fetch: fetch unpopulated, changed submodules
>  - submodule: move logic into fetch_task_create()
>  - submodule: extract get_fetch_task()
>  - submodule: store new submodule commits oid_array in a struct
>  - submodule: inline submodule_commits() into caller
>  - submodule: make static functions read submodules from commits
>  - t5526: create superproject commits with test helper
>  - t5526: stop asserting on stderr literally
>  - t5526: introduce test helper to assert on fetches
>
>  When "git fetch --recurse-submodules" grabbed submodule commits
>  that would be needed to recursively check out newly fetched commits
>  in the superproject, it only paid attention to submodules that are
>  in the current checkout of the superproject.  We now do so for all
>  submodules that have been run "git submodule init" on.
>
>  Expecting a reroll.
>  source: <20220224100842.95827-1-chooglen@google.com>
>
>
> * cg/t3903-modernize (2022-02-23) 3 commits
>   (merged to 'next' on 2022-02-23 at 0d5a844b40)
>  + tests: make the code more readable
>  + tests: allow testing if a path is truly a file or a directory
>  + t/t3903-stash.sh: replace test [-d|-f] with test_path_is_*
>
>  Test modernization.
>
>  Will merge to 'master'.
>  source: <20220222215430.605254-1-cogoni.guillaume@gmail.com>
>
>
> * js/bisect-in-c (2022-02-23) 14 commits
>  - bisect: no longer try to clean up left-over `.git/head-name` files
>  - bisect: remove Cogito-related code
>  - bisect: turn `git bisect` into a full built-in
>  - bisect: move even the option parsing to `bisect--helper`
>  - bisect--helper: return only correct exit codes in `cmd_*()`
>  - bisect--helper: move the `BISECT_STATE` case to the end
>  - bisect--helper: make `--bisect-state` optional
>  - bisect--helper: align the sub-command order with git-bisect.sh
>  - bisect--helper: using `--bisect-state` without an argument is a bug
>  - bisect--helper: really retire `--bisect-autostart`
>  - bisect--helper: really retire --bisect-next-check
>  - bisect--helper: retire the --no-log option
>  - bisect: avoid double-quoting when printing the failed command
>  - bisect run: fix the error message
>
>  Final bits of "git bisect.sh" have been rewritten in C.
>
>  Will merge to 'next'?
>  source: <pull.1132.v2.git.1645547423.gitgitgadget@gmail.com>
>
>
> * js/scalar-diagnose (2022-02-06) 6 commits
>  - scalar: teach `diagnose` to gather loose objects information
>  - scalar: teach `diagnose` to gather packfile info
>  - scalar diagnose: include disk space information
>  - scalar: add `diagnose`
>  - scalar: validate the optional enlistment argument
>  - archive: optionally add "virtual" files
>
>  Implementation of "scalar diagnose" subcommand.
>
>  What's the state of this thing?
>  source: <pull.1128.v2.git.1644187146.gitgitgadget@gmail.com>
>
>
> * jc/cat-file-batch-commands (2022-02-18) 4 commits
>  - cat-file: add --batch-command mode
>  - cat-file: add remove_timestamp helper
>  - cat-file: introduce batch_mode enum to replace print_contents
>  - cat-file: rename cmdmode to transform_mode
>
>  "git cat-file" learns "--batch-command" mode, which is a more
>  flexible interface than the existing "--batch" or "--batch-check"
>  modes, to allow different kinds of inquiries made.
>
>  Will merge to 'next'?
>  source: <pull.1212.v10.git.git.1645208594.gitgitgadget@gmail.com>
>
>
> * ar/submodule-update (2022-02-10) 20 commits
>  . fixup! submodule: move core cmd_update() logic to C
>  . fixup! submodule--helper run-update-procedure: learn --remote
>  . fixup! submodule--helper run-update-procedure: remove --suboid
>  . submodule: move core cmd_update() logic to C
>  . submodule--helper: reduce logic in run_update_procedure()
>  . submodule--helper: move functions around
>  . submodule--helper update-clone: learn --init
>  . submodule--helper: remove ensure-core-worktree
>  . submodule--helper run-update-procedure: learn --remote
>  . submodule--helper run-update-procedure: remove --suboid
>  . submodule--helper: reorganize code for sh to C conversion
>  . submodule--helper: remove update-module-mode
>  . submodule tests: test for init and update failure output
>  . submodule--helper: don't use bitfield indirection for parse_options()
>  . builtin/submodule--helper.c: rename option variables to "opt"
>  . builtin/submodule--helper.c: reformat designated initializers
>  . submodule--helper: run update using child process struct
>  . submodule--helper: allow setting superprefix for init_submodule()
>  . submodule--helper: refactor get_submodule_displaypath()
>  . submodule--helper: get remote names from any repository
>
>  Rewrite of "git submodule update" in C.
>
>  Does not seem to play well with other topics in flight, with heavy conflicts.
>  cf. <xmqqv8xj71mt.fsf@gitster.g>
>  source: <20220210092833.55360-1-chooglen@google.com>
>
>
> * rj/receive-pack-abort-upon-disconnect (2022-01-28) 1 commit
>  - receive-pack: check if client is alive before completing the push
>
>  "git push" may be killed by the user when the server side has
>  finished receiving all data and is about to commit the result.
>  Give the latter a better chance to notice such situation and abort
>  processing the ref updates.
>
>  Needs more work?
>  cf. <220204.864k5e4yvf.gmgdl@evledraar.gmail.com>
>  source: <20220128194811.3396281-1-robin.jarry@6wind.com>
>
>
> * ab/object-file-api-updates (2022-02-25) 12 commits
>  - object-file API: pass an enum to read_object_with_reference()
>  - object-file.c: add a literal version of write_object_file_prepare()
>  - object-file API: have hash_object_file() take "enum object_type"
>  - object API: rename hash_object_file_literally() to write_*()
>  - object-file API: split up and simplify check_object_signature()
>  - object API users + docs: check <0, not !0 with check_object_signature()
>  - object API docs: move check_object_signature() docs to cache.h
>  - object API: correct "buf" v.s. "map" mismatch in *.c and *.h
>  - object-file API: have write_object_file() take "enum object_type"
>  - object-file API: add a format_object_header() function
>  - object-file API: return "void", not "int" from hash_object_file()
>  - object-file.c: split up declaration of unrelated variables
>
>  Object-file API shuffling.
>
>  Needs review.
>  source: <cover-v3-00.12-00000000000-20220204T234435Z-avarab@gmail.com>
>
>
> * en/merge-tree (2022-02-23) 13 commits
>  - git-merge-tree.txt: add a section on potentional usage mistakes
>  - merge-tree: add a --allow-unrelated-histories flag
>  - merge-tree: allow `ls-files -u` style info to be NUL terminated
>  - merge-tree: provide easy access to `ls-files -u` style info
>  - merge-tree: provide a list of which files have conflicts
>  - merge-ort: provide a merge_get_conflicted_files() helper function
>  - merge-tree: support including merge messages in output
>  - merge-ort: split out a separate display_update_messages() function
>  - merge-tree: implement real merges
>  - merge-tree: add option parsing and initial shell for real merge function
>  - merge-tree: move logic for existing merge into new function
>  - merge-tree: rename merge_trees() to trivial_merge_trees()
>  - Merge branch 'en/remerge-diff' into en/merge-trees
>
>  A new command is introduced that takes two commits and computes a
>  tree that would be contained in the resulting merge commit, if the
>  histories leading to these two commits were to be merged, and is
>  added as a new mode of "git merge-tree" subcommand.
>
>  Will merge to 'next'.
>  source: <pull.1122.v6.git.1645602413.gitgitgadget@gmail.com>
>
>
> * jh/p4-various-fixups (2022-02-10) 22 commits
>  - git-p4: sort imports
>  - git-p4: seperate multiple statements onto seperate lines
>  - git-p4: move inline comments to line above
>  - git-p4: only seperate code blocks by a single empty line
>  - git-p4: compare to singletons with "is" and "is not"
>  - git-p4: normalize indentation of lines in conditionals
>  - git-p4: ensure there is a single space around all operators
>  - git-p4: ensure every comment has a single #
>  - git-p4: remove spaces between dictionary keys and colons
>  - git-p4: remove redundant backslash-continuations inside brackets
>  - git-p4: remove extraneous spaces before function arguments
>  - git-p4: place a single space after every comma
>  - git-p4: removed brackets when assigning multiple return values
>  - git-p4: remove spaces around default arguments
>  - git-p4: remove padding from lists, tuples and function arguments
>  - git-p4: sort and de-duplcate pylint disable list
>  - git-p4: remove commented code
>  - git-p4: convert descriptive class and function comments into docstrings
>  - git-p4: improve consistency of docstring formatting
>  - git-p4: indent with 4-spaces
>  - git-p4: remove unneeded semicolons from statements
>  - git-p4: add blank lines between functions and class definitions
>
>  Various cleanups to "git p4".
>  source: <20220210164627.279520-1-jholdsworth@nvidia.com>
>
>
> * rs/bisect-executable-not-found (2022-01-19) 4 commits
>  - bisect--helper: double-check run command on exit code 126 and 127
>  - bisect: document run behavior with exit codes 126 and 127
>  - bisect--helper: release strbuf and strvec on run error
>  - bisect--helper: report actual bisect_state() argument on error
>
>  A not-so-common mistake is to write a script to feed "git bisect
>  run" without making it executable, in which case all tests will
>  exit with 126 or 127 error codes, even on revisions that are marked
>  as good.  Try to recoginse this situation and stop iteration early.
>
>  Will merge to 'next'?
>  source: <fead25d6-6f5f-487a-ad4c-0657fe9785fd@www.fastmail.com>
>
>
> * en/present-despite-skipped (2022-02-25) 7 commits
>  - repo_read_index: add config to expect files outside sparse patterns
>   (merged to 'next' on 2022-02-15 at 960873fdad)
>  + Accelerate clear_skip_worktree_from_present_files() by caching
>  + Update documentation related to sparsity and the skip-worktree bit
>  + repo_read_index: clear SKIP_WORKTREE bit from files present in worktree
>  + unpack-trees: fix accidental loss of user changes
>  + t1011: add testcase demonstrating accidental loss of user modifications
>  + Merge branch 'vd/sparse-clean-etc' into en/present-despite-skipped
>
>  In sparse-checkouts, files mis-marked as missing from the working tree
>  could lead to later problems.  Such files were hard to discover, and
>  harder to correct.  Automatically detecting and correcting the marking
>  of such files has been added to avoid these problems.
>
>  Will merge to 'next'?
>  source: <pull.1114.v2.git.1642175983.gitgitgadget@gmail.com>
>
>
> * js/use-builtin-add-i (2021-12-01) 2 commits
>  - add -i: default to the built-in implementation
>  - t2016: require the PERL prereq only when necessary
>
>  "git add -i" was rewritten in C some time ago and has been in
>  testing; the reimplementation is now exposed to general public by
>  default.
>
>  On hold.
>
>  What's the status of the "known breakage"?
>  Are we ready to switch if we wanted to?
>  There are known breakages on macOS.
>  cf. <nycvar.QRO.7.76.6.2112021832060.63@tvgsbejvaqbjf.bet>
>  source: <pull.1087.git.1638281655.gitgitgadget@gmail.com>
>
>
> * tl/ls-tree-oid-only (2022-02-08) 13 commits
>  - ls-tree.c: support --object-only option for "git-ls-tree"
>  - ls-tree: introduce function "fast_path()"
>  - ls-tree.c: introduce "--format" option
>  - cocci: allow padding with `strbuf_addf()`
>  - ls-tree: introduce struct "show_tree_data"
>  - ls-tree: slightly refactor `show_tree()`
>  - ls-tree: fix "--name-only" and "--long" combined use bug
>  - ls-tree: simplify nesting if/else logic in "show_tree()"
>  - ls-tree: rename "retval" to "recurse" in "show_tree()"
>  - ls-tree: use "size_t", not "int" for "struct strbuf"'s "len"
>  - ls-tree: use "enum object_type", not {blob,tree,commit}_type
>  - ls-tree: add missing braces to "else" arms
>  - ls-tree: remove commented-out code
>
>  "git ls-tree" learns "--oid-only" option, similar to "--name-only",
>  and more generalized "--format" option.
>
>  What's the status of this thing?
>  source: <cover.1644319434.git.dyroneteng@gmail.com>
>
>
> * jh/builtin-fsmonitor-part2 (2022-02-11) 30 commits
>  - update-index: convert fsmonitor warnings to advise
>  - t7527: test status with untracked-cache and fsmonitor--daemon
>  - fsmonitor: force update index after large responses
>  - fsmonitor--daemon: use a cookie file to sync with file system
>  - fsmonitor--daemon: periodically truncate list of modified files
>  - t/perf/p7519: add fsmonitor--daemon test cases
>  - t/perf/p7519: speed up test on Windows
>  - t/helper/test-chmtime: skip directories on Windows
>  - t/perf: avoid copying builtin fsmonitor files into test repo
>  - t7527: create test for fsmonitor--daemon
>  - t/helper/fsmonitor-client: create IPC client to talk to FSMonitor Daemon
>  - help: include fsmonitor--daemon feature flag in version info
>  - fsmonitor--daemon: implement handle_client callback
>  - compat/fsmonitor/fsm-listen-darwin: implement FSEvent listener on MacOS
>  - compat/fsmonitor/fsm-listen-darwin: add macos header files for FSEvent
>  - compat/fsmonitor/fsm-listen-win32: implement FSMonitor backend on Windows
>  - fsmonitor--daemon: create token-based changed path cache
>  - fsmonitor--daemon: define token-ids
>  - fsmonitor--daemon: add pathname classification
>  - fsmonitor--daemon: implement 'start' command
>  - fsmonitor--daemon: implement 'run' command
>  - compat/fsmonitor/fsm-listen-darwin: stub in backend for Darwin
>  - compat/fsmonitor/fsm-listen-win32: stub in backend for Windows
>  - fsmonitor--daemon: implement 'stop' and 'status' commands
>  - fsmonitor--daemon: add a built-in fsmonitor daemon
>  - fsmonitor: document builtin fsmonitor
>  - fsmonitor: use IPC to query the builtin FSMonitor daemon
>  - fsmonitor: config settings are repository-specific
>  - fsmonitor-ipc: create client routines for git-fsmonitor--daemon
>  - fsmonitor: enhance existing comments, clarify trivial response handling
>  (this branch is used by jh/builtin-fsmonitor-part3.)
>
>  Built-in fsmonitor (part 2).
>
>  Expecting a (hopefully final) reroll.
>  cf. <4aa1293e-00b6-b9ef-efd4-cdf605db37a1@jeffhostetler.com>
>  source: <pull.1041.v5.git.1644612979.gitgitgadget@gmail.com>
>
>
> * es/superproject-aware-submodules (2022-02-03) 4 commits
>  - submodule: record superproject gitdir during 'update'
>  - submodule: record superproject gitdir during absorbgitdirs
>  - introduce submodule.superprojectGitDir record
>  - t7400-submodule-basic: modernize inspect() helper
>
>  A configuration variable in a submodule points at the location of
>  the superproject it is bound to (RFC).
>
>  What is the status of this thing?
>  source: <20220203215914.683922-1-emilyshaffer@google.com>
