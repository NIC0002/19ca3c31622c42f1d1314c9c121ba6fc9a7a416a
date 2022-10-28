Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8475EC38A02
	for <git@archiver.kernel.org>; Fri, 28 Oct 2022 22:51:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbiJ1Wvk (ORCPT <rfc822;git@archiver.kernel.org>);
        Fri, 28 Oct 2022 18:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbiJ1Wvj (ORCPT <rfc822;git@vger.kernel.org>);
        Fri, 28 Oct 2022 18:51:39 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99EE421CD49
        for <git@vger.kernel.org>; Fri, 28 Oct 2022 15:51:36 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id o7so2642747pjj.1
        for <git@vger.kernel.org>; Fri, 28 Oct 2022 15:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sk0fPWsU9jJooP842GwOMJiI15oD+Ecc3Q8ba+D0MZA=;
        b=eZox93nlFKZ4VwkUFPMUeQS5NQ1Vu/2SxV941ZzTeoa7let9EcpLWsQqq1tXPInwWf
         hDRuF6bdandv1KIxNp/aJDKaZNxZc2yUk69Kc9vQk3qlqWEzrDcqkYVCXUJIB/AbKPyz
         +ik8BNYKNY+2DCsxSmy4quB017CZcc/SgDaFN686TY0LrfxjDznPr4OZu50zAP8hh3IX
         Q7dsokROb/isCaa20xxu0PnJys3UTneX59akue3ieZNfycook3oBzOrAGM338FSqt/4I
         U3JpgZbzMnDzL/gD/aXeNe1ulO0JBBCA6btGC4zat7CfsfSNc0Qztf0gSXWBK7XyfdMh
         u7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sk0fPWsU9jJooP842GwOMJiI15oD+Ecc3Q8ba+D0MZA=;
        b=41zjkijMRk1IrOJBklsaDz1JfujprhgkCj3RFTKusVXvzI+slmspCUYPu6bW3IK7HF
         NfNB9mlCOZ6pXHTlcbB4IJ9aoJ7nzpKTJbAj1cGTJB/P5oVKlFjJgIBLMpo2OfqKprql
         frsUlz4g/nv841rovnKFQdmol8scSsvb2YoigFp4H2mZD71XdJ3S2IOMmE0PCeiyQh8s
         KDHuI8Rxb7iphC9XyeJgyA0BoJ6d3Ag8DhahR8KsvKChqk1YqDaNLSnUi8UBASV7pPcM
         iakOtu6mTRdCHGI/xxm25Jpk5UWiVNstJey32NIz7w0dJNn9yyrgcoUWAEWfrdia+Shb
         W9xQ==
X-Gm-Message-State: ACrzQf34rwdTaLC3FBtFXJZhsZ5wc1RX/iT6GNK+Km7gs0i4gSaZW493
        zMzO6t7CsufpXzX2NHHB/zlE0eL+sXs=
X-Google-Smtp-Source: AMsMyM4BujGGdVyBF5PIQILgxYG2EA7IRSN3peQhsTOxIhaf6pDzuqaWjWQCPCCNv2gOEgNBUk/eoA==
X-Received: by 2002:a17:902:6a86:b0:176:a6bc:54c0 with SMTP id n6-20020a1709026a8600b00176a6bc54c0mr1350260plk.87.1666997495259;
        Fri, 28 Oct 2022 15:51:35 -0700 (PDT)
Received: from localhost (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id o73-20020a62cd4c000000b0056328e516f4sm3408952pfg.148.2022.10.28.15.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 15:51:34 -0700 (PDT)
Sender: Junio C Hamano <jch2355@gmail.com>
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Oct 2022, #08; Fri, 28)
X-master-at: 63bba4fdd86d80ef061c449daa97a981a9be0792
X-next-at: 37b22c650d22cf3ee7c1d89d0a08614485da773a
Date:   Fri, 28 Oct 2022 15:51:34 -0700
Message-ID: <xmqqy1szef49.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Here are the topics that have been cooking in my tree.  Commits
prefixed with '+' are in 'next' (being in 'next' is a sign that a
topic is stable enough to be used and are candidate to be in a future
release).  Commits prefixed with '-' are only in 'seen', and aren't
considered "accepted" at all.  A topic without enough support may be
discarded after a long period of no activity.

Starting from next week (week #4---see https://tinyurl.com/gitCal),
we'll try a mini "bus factor" exercise, where I will disappear from
the list for a few weeks.  See the previous issue of this report
for details: https://lore.kernel.org/git/xmqqwn8mh1di.fsf@gitster.g/

Copies of the source code to Git live in many repositories, and the
following is a list of the ones I push into or their mirrors.  Some
repositories have only a subset of branches.

With maint, master, next, seen, todo:

	git://git.kernel.org/pub/scm/git/git.git/
	git://repo.or.cz/alt-git.git/
	https://kernel.googlesource.com/pub/scm/git/git/
	https://github.com/git/git/
	https://gitlab.com/git-vcs/git/

With all the integration branches and topics broken out:

	https://github.com/gitster/git/

Even though the preformatted documentation in HTML and man format
are not sources, they are published in these repositories for
convenience (replace "htmldocs" with "manpages" for the manual
pages):

	git://git.kernel.org/pub/scm/git/git-htmldocs.git/
	https://github.com/gitster/git-htmldocs.git/

Release tarballs are available at:

	https://www.kernel.org/pub/software/scm/git/

--------------------------------------------------
[Graduated to 'master']

* ab/doc-synopsis-and-cmd-usage (2022-10-13) 34 commits
  (merged to 'next' on 2022-10-21 at c6d632ac1a)
 + tests: assert consistent whitespace in -h output
 + tests: start asserting that *.txt SYNOPSIS matches -h output
 + doc txt & -h consistency: make "worktree" consistent
 + worktree: define subcommand -h in terms of command -h
 + reflog doc: list real subcommands up-front
 + doc txt & -h consistency: make "commit" consistent
 + doc txt & -h consistency: make "diff-tree" consistent
 + doc txt & -h consistency: use "[<label>...]" for "zero or more"
 + doc txt & -h consistency: make "annotate" consistent
 + doc txt & -h consistency: make "stash" consistent
 + doc txt & -h consistency: add missing options
 + doc txt & -h consistency: use "git foo" form, not "git-foo"
 + doc txt & -h consistency: make "bundle" consistent
 + doc txt & -h consistency: make "read-tree" consistent
 + doc txt & -h consistency: make "rerere" consistent
 + doc txt & -h consistency: add missing options and labels
 + doc txt & -h consistency: make output order consistent
 + doc txt & -h consistency: add or fix optional "--" syntax
 + doc txt & -h consistency: fix mismatching labels
 + doc SYNOPSIS & -h: use "-" to separate words in labels, not "_"
 + doc txt & -h consistency: use "<options>", not "<options>..."
 + stash doc SYNOPSIS & -h: correct padding around "[]()"
 + doc txt & -h consistency: correct padding around "[]()"
 + doc txt & -h consistency: balance unbalanced "[" and "]"
 + doc txt & -h consistency: add "-z" to cat-file "-h"
 + doc txt & -h consistency: fix incorrect alternates syntax
 + doc txt & -h consistency: word-wrap
 + built-ins: consistently add "\n" between "usage" and options
 + doc SYNOPSIS: consistently use ' for commands
 + doc SYNOPSIS: don't use ' for subcommands
 + bundle: define subcommand -h in terms of command -h
 + builtin/bundle.c: indent with tabs
 + CodingGuidelines: update and clarify command-line conventions
 + tests: assert *.txt SYNOPSIS and -h output

 The short-help text shown by "git cmd -h" and the synopsis text
 shown at the beginning of "git help cmd" have been made more
 consistent.
 source: <cover-v5-00.34-00000000000-20221013T153625Z-avarab@gmail.com>


* ab/run-hook-api-cleanup (2022-10-12) 15 commits
  (merged to 'next' on 2022-10-20 at 29ca8c34dc)
 + run-command.c: remove "max_processes", add "const" to signal() handler
 + run-command.c: pass "opts" further down, and use "opts->processes"
 + run-command.c: use "opts->processes", not "pp->max_processes"
 + run-command.c: don't copy "data" to "struct parallel_processes"
 + run-command.c: don't copy "ungroup" to "struct parallel_processes"
 + run-command.c: don't copy *_fn to "struct parallel_processes"
 + run-command.c: make "struct parallel_processes" const if possible
 + run-command API: move *_tr2() users to "run_processes_parallel()"
 + run-command API: have run_process_parallel() take an "opts" struct
 + run-command.c: use designated init for pp_init(), add "const"
 + run-command API: don't fall back on online_cpus()
 + run-command API: make "n" parameter a "size_t"
 + run-command tests: use "return", not "exit"
 + run-command API: have "run_processes_parallel{,_tr2}()" return void
 + run-command test helper: use "else if" pattern
 (this branch is used by cw/submodule-status-in-parallel.)

 Move a global variable added as a hack during regression fixes to
 its proper place in the API.
 source: <cover-v3-00.15-00000000000-20221012T205712Z-avarab@gmail.com>


* jk/unused-anno-more (2022-10-17) 12 commits
  (merged to 'next' on 2022-10-20 at 0e52ab6cf9)
 + ll-merge: mark unused parameters in callbacks
 + diffcore-pickaxe: mark unused parameters in pickaxe functions
 + convert: mark unused parameter in null stream filter
 + apply: mark unused parameters in noop error/warning routine
 + apply: mark unused parameters in handlers
 + date: mark unused parameters in handler functions
 + string-list: mark unused callback parameters
 + object-file: mark unused parameters in hash_unknown functions
 + mark unused parameters in trivial compat functions
 + update-index: drop unused argc from do_reupdate()
 + submodule--helper: drop unused argc from module_list_compute()
 + diffstat_consume(): assert non-zero length

 More UNUSED annotation to help using -Wunused option with the
 compiler.
 source: <Y036whEorZV0rOgB@coredump.intra.peff.net>


* js/cmake-updates (2022-10-19) 5 commits
  (merged to 'next' on 2022-10-21 at 012ec675ba)
 + cmake: increase time-out for a long-running test
 + cmake: avoid editing t/test-lib.sh
 + add -p: avoid ambiguous signed/unsigned comparison
 + cmake: copy the merge tools for testing
 + cmake: make it easier to diagnose regressions in CTest runs

 Update to build procedure with VS using CMake/CTest.
 source: <pull.1320.v3.git.1666090745.gitgitgadget@gmail.com>


* mm/git-pm-try-catch-syntax-fix (2022-10-22) 2 commits
  (merged to 'next' on 2022-10-23 at 011a23710f)
 + Git.pm: trust rev-parse to find bare repositories
  (merged to 'next' on 2022-10-21 at 7896738c3b)
 + Git.pm: add semicolon after catch statement

 Fix a longstanding syntax error in Git.pm error codepath.
 source: <20221016212236.12453-1-michael@mcclimon.org>
 source: <Y1Rdtog/XQV0YLj0@coredump.intra.peff.net>


* nw/t1002-cleanup (2022-10-14) 1 commit
  (merged to 'next' on 2022-10-20 at e6ae742fef)
 + t1002: modernize outdated conditional

 Code clean-up in test.
 source: <pull.1362.v3.git.git.1665734502591.gitgitgadget@gmail.com>


* tb/diffstat-with-utf8-strwidth (2022-10-21) 2 commits
  (merged to 'next' on 2022-10-23 at 43a17bfeac)
 + diff: leave NEEDWORK notes in show_stats() function
 + diff.c: use utf8_strwidth() to count display width

 "git diff --stat" etc. were invented back when everything was ASCII
 and strlen() was a way to measure the display width of a string;
 adjust them to compute the display width assuming UTF-8 pathnames.
 source: <20220914151333.3309-1-tboegi@web.de>


* tb/midx-bitmap-selection-fix (2022-10-13) 4 commits
  (merged to 'next' on 2022-10-20 at b4d98bb5e4)
 + pack-bitmap-write.c: instrument number of reused bitmaps
 + midx.c: instrument MIDX and bitmap generation with trace2 regions
 + midx.c: consider annotated tags during bitmap selection
 + midx.c: fix whitespace typo

 A bugfix with tracing support in midx codepath
 source: <cover.1665612094.git.me@ttaylorr.com>


* tb/remove-unused-pack-bitmap (2022-10-17) 1 commit
  (merged to 'next' on 2022-10-21 at ebb68add44)
 + builtin/repack.c: remove redundant pack-based bitmaps

 When creating a multi-pack bitmap, remove per-pack bitmap files
 unconditionally as they will never be consulted.
 source: <1e0ef7ee7ff5feb323c77e594cd65433fb1d99f7.1666061096.git.me@ttaylorr.com>


* tb/save-keep-pack-during-geometric-repack (2022-10-17) 1 commit
  (merged to 'next' on 2022-10-20 at c88c17eb52)
 + repack: don't remove .keep packs with `--pack-kept-objects`

 When geometric repacking feature is in use together with the
 --pack-kept-objects option, we lost packs marked with .keep files.
 source: <6a012cd625c1d197ede91c85299cbfb37adf356b.1666059872.git.me@ttaylorr.com>

--------------------------------------------------
[New Topics]

* ab/config-multi-and-nonbool (2022-10-27) 10 commits
 - for-each-repo: with bad config, don't conflate <path> and <cmd>
 - config API: add "string" version of *_value_multi(), fix segfaults
 - config tests: add "NULL" tests for *_get_value_multi()
 - config API: add and use "lookup_value" functions
 - builtin/gc.c: use "unsorted_string_list_has_string()" where appropriate
 - string-list API: make has_string() and list_lookup() "const"
 - string-list API: mark "struct_string_list" to "for_each_string_list" const
 - config API: mark *_multi() with RESULT_MUST_BE_USED
 - for-each-repo: error on bad --config
 - config API: have *_multi() return an "int" and take a "dest"

 A mixed bag of config API updates.

 Expecting a reroll.
 cf. <221026.86pmeebcj9.gmgdl@evledraar.gmail.com>
 source: <cover-00.10-00000000000-20221026T151328Z-avarab@gmail.com>


* ab/sha-makefile-doc (2022-10-26) 9 commits
 - Makefile: discuss SHAttered in *_SHA{1,256} discussion
 - Makefile: document default SHA-1 backend on OSX
 - Makefile: document SHA-1 and SHA-256 default and selection order
 - Makefile: document default SHA-256 backend
 - Makefile: rephrase the discussion of *_SHA1 knobs
 - Makefile: create and use sections for "define" flag listing
 - Makefile: correct DC_SHA1 documentation
 - INSTALL: remove discussion of SHA-1 backends
 - Makefile: always (re)set DC_SHA1 on fallback

 Makefile comments updates and reordering to clarify knobs used to
 choose SHA implementations.

 Will merge to 'next'?
 source: <cover-v4-0.9-00000000000-20221026T145255Z-avarab@gmail.com>


* rs/no-more-run-command-v (2022-10-28) 9 commits
 - run-command: fix return value comment
 - replace and remove run_command_v_opt()
 - replace and remove run_command_v_opt_cd_env_tr2()
 - replace and remove run_command_v_opt_tr2()
 - replace and remove run_command_v_opt_cd_env()
 - use child_process member "args" instead of string array variable
 - use child_process members "args" and "env" directly
 - bisect--helper: factor out do_bisect_run()
 - merge: remove always-the-same "verbose" arguments

 Simplify the run-command API.

 Will merge to 'next'?
 source: <7407e074-4bd8-b351-7fa4-baf59b41880c@web.de>
 source: <8428e83f-9deb-e928-8699-b5b13e8b7577@web.de>


* tb/howto-using-redo-script (2022-10-26) 1 commit
 - Documentation/howto/maintain-git.txt: fix Meta/redo-jch.sh invocation

 Doc update.

 Will merge to 'next'.
 source: <4ba057094ae6b1bd5c18583f23f7f99232034c72.1666815325.git.me@ttaylorr.com>


* ps/receive-use-only-advertised (2022-10-28) 3 commits
 - SQUASH - leakfix
 - receive-pack: use advertised reference tips to inform connectivity check
 - connected: allow supplying different view of reachable objects

 "git receive-pack" used to use all the local refs as the boundary
 for checking connectivity of the data "git push" sent, but now it
 uses only the refs that it advertised to the pusher.  In a
 repository with the .hideRefs configuration, this reduces the
 resource needed to perform the check, and also forces the pusher to
 prove they have all objects that are necessary to complete the
 history on top of only the history available to them.

 Expecting a reroll.
 cf. <221028.86bkpw805n.gmgdl@evledraar.gmail.com>
 cf. <xmqqr0yrizqm.fsf@gitster.g>
 source: <cover.1666967670.git.ps@pks.im>


* jc/set-gid-bit-less-aggressively (2022-10-28) 1 commit
 - adjust_shared_perm(): leave g+s alone when the group does not matter

 The adjust_shared_perm() helper function learned to refrain from
 setting the "g+s" bit on directories when it is not necessary.

 Will merge to 'next'??
 source: <xmqqr0yrhco6.fsf@gitster.g>

--------------------------------------------------
[Stalled]

* cw/submodule-status-in-parallel (2022-10-20) 7 commits
 . diff-lib: parallelize run_diff_files for submodules
 . diff-lib: refactor match_stat_with_submodule
 . submodule: move status parsing into function
 . submodule: strbuf variable rename
 . run-command: add hide_output to run_processes_parallel_opts
 . run-command: add pipe_output_fn to run_processes_parallel_opts
 . Merge branch 'ab/run-hook-api-cleanup' into cw/submodule-status-in-parallel

 Allow the internal "diff-files" engine to run "how has this
 submodule changed?" in parallel to speed up "git status".

 Breaks winVS test?
 cf. <https://github.com/git/git/actions/runs/3298596454/jobs/5441029092>
 source: <20221011232604.839941-1-calvinwan@google.com>


* js/bisect-in-c (2022-08-30) 17 commits
 . bisect: no longer try to clean up left-over `.git/head-name` files
 . bisect: remove Cogito-related code
 . Turn `git bisect` into a full built-in
 . bisect: move even the command-line parsing to `bisect--helper`
 . bisect--helper: make `state` optional
 . bisect--helper: calling `bisect_state()` without an argument is a bug
 . bisect: avoid double-quoting when printing the failed command
 . bisect run: fix the error message
 . bisect: verify that a bogus option won't try to start a bisection
 . bisect--helper: migrate to OPT_SUBCOMMAND()
 . bisect--helper: make the order consistently `argc, argv`
 . bisect--helper: make `terms` an explicit singleton
 . bisect--helper: simplify exit code computation
 . bisect--helper: really retire `--bisect-autostart`
 . bisect--helper: really retire --bisect-next-check
 . bisect--helper: retire the --no-log option
 . Merge branch 'sg/parse-options-subcommand' into js/bisect-in-c

 Final bits of "git bisect.sh" have been rewritten in C.

 Needs review.
 cf. <xmqqv8pr8903.fsf@gitster.g>
 source: <pull.1132.v6.git.1661885419.gitgitgadget@gmail.com>


* od/ci-use-checkout-v3-when-applicable (2022-10-10) 2 commits
 . ci(main): linux32 uses actions/checkout@v2
 . ci(main): upgrade actions/checkout to v3

 Attempt to update GitHub CI to use actions/checkout@v3

 Expecting a reroll.
 Seems to break the CI completely.
 source: <pull.1354.git.git.1665388136.gitgitgadget@gmail.com>


* ed/fsmonitor-inotify (2022-10-14) 7 commits
 . fsmonitor: update doc for Linux
 . fsmonitor: test updates
 . fsmonitor: enable fsmonitor for Linux
 . fsmonitor: implement filesystem change listener for Linux
 . fsmonitor: determine if filesystem is local or remote
 . fsmonitor: prepare to share code between Mac OS and Linux
 . Merge branch 'ed/fsmonitor-on-networked-macos' into ed/fsmonitor-inotify

 Bundled fsmonitor for Linux using inotify API.

 Needs review.
 Occasional breakages of t7527.16?
 source: <pull.1352.v2.git.git.1665783944.gitgitgadget@gmail.com>


* ag/merge-strategies-in-c (2022-08-10) 14 commits
 . sequencer: use the "octopus" strategy without forking
 . sequencer: use the "resolve" strategy without forking
 . merge: use the "octopus" strategy without forking
 . merge: use the "resolve" strategy without forking
 . merge-octopus: rewrite in C
 . merge-recursive: move better_branch_name() to merge.c
 . merge-resolve: rewrite in C
 . merge-one-file: rewrite in C
 . update-index: move add_cacheinfo() to read-cache.c
 . merge-index: add a new way to invoke `git-merge-one-file'
 . merge-index: drop the index
 . merge-index: libify merge_one_path() and merge_all()
 . t6060: add tests for removed files
 . t6060: modify multiple files to expose a possible issue with merge-index

 An attempt to rewrite remaining merge strategies from shell to C.

 Needs more work.
 At the minimum, we should lose 11/14 and possibly 08/14.
 cf. <xmqq7d36vfur.fsf@gitster.g>
 source: <20220809185429.20098-1-alban.gruin@gmail.com>


* es/doc-creation-factor-fix (2022-07-28) 2 commits
 . range-diff: clarify --creation-factor=<factor>
 . format-patch: clarify --creation-factor=<factor>

 Expecting a reroll by somebody more familiar with the logic
 cf. <xmqqo7wfix7p.fsf@gitster.g>
 source: <7229p500-p2r4-on87-6802-8o90s36rr3s4@tzk.qr>


* cw/remote-object-info (2022-08-13) 7 commits
 . SQUASH???
 . cat-file: add remote-object-info to batch-command
 . transport: add client support for object-info
 . serve: advertise object-info feature
 . protocol-caps: initialization bug fix
 . fetch-pack: move fetch initialization
 . fetch-pack: refactor packet writing

 A client component to talk with the object-info endpoint.

 Expecting a reroll.
 Under SANITIZE=address, t1006-cat-file.sh finds a breakage.
 cf. <20220728230210.2952731-1-calvinwan@google.com>
 cf. <CAFySSZDvgwbbHCHfyuaqX3tKsr-GjJ9iihygg6rNNe46Ys7_EA@mail.gmail.com>
 source: <20220728230210.2952731-1-calvinwan@google.com>

--------------------------------------------------
[Cooking]

* gc/submodule-clone-update-with-branches (2022-10-28) 8 commits
 - clone, submodule update: create and check out branches
 - submodule--helper: remove update_data.suboid
 - submodule update: refactor update targets
 - submodule: return target of submodule symref
 - t5617: drop references to remote-tracking branches
 - submodule--helper clone: create named branch
 - repo-settings: add submodule_propagate_branches
 - clone: teach --detach option

 "git clone --recurse-submodules" and "git submodule update" learns
 to honor the "propagete branches" option.
 source: <pull.1321.v3.git.git.1666988096.gitgitgadget@gmail.com>


* es/mark-gc-cruft-as-experimental (2022-10-26) 2 commits
 - config: let feature.experimental imply gc.cruftPacks=true
 - gc: add tests for --cruft and friends

 Enable gc.cruftpacks by default for those who opt into
 feature.experimental setting.

 Will merge to 'next'.
 source: <cover.1666819953.git.me@ttaylorr.com>


* tb/shortlog-group (2022-10-24) 7 commits
  (merged to 'next' on 2022-10-26 at 76e64a6036)
 + shortlog: implement `--group=committer` in terms of `--group=<format>`
 + shortlog: implement `--group=author` in terms of `--group=<format>`
 + shortlog: extract `shortlog_finish_setup()`
 + shortlog: support arbitrary commit format `--group`s
 + shortlog: extract `--group` fragment for translation
 + shortlog: make trailer insertion a noop when appropriate
 + shortlog: accept `--date`-related options

 "git shortlog" learned to group by the "format" string.

 Will merge to 'master'.
 source: <cover.1666637725.git.me@ttaylorr.com>


* pw/config-int-parse-fixes (2022-10-22) 3 commits
 - git_parse_signed(): avoid integer overflow
 - config: require at least one digit when parsing numbers
 - git_parse_unsigned: reject negative values

 Assorted fixes of parsing end-user input as integers.

 Expecting a reroll to add test coverage.
 cf. <Y1L+Qv+cs1bjqjK9@coredump.intra.peff.net>
 source: <pull.1389.git.1666359915.gitgitgadget@gmail.com>


* sa/cat-file-mailmap (2022-10-21) 1 commit
 - doc/cat-file: allow --use-mailmap for --batch options

 Doc updates.

 Waiting for review response.
 source: <20221021103442.202759-1-siddharthasthana31@gmail.com>


* sg/stable-docdep (2022-10-21) 1 commit
  (merged to 'next' on 2022-10-26 at 68432e1b2c)
 + Documentation/build-docdep.perl: generate sorted output

 Make sure generated dependency file is stably sorted to help
 developers debugging their build issues.

 Will merge to 'master'.
 source: <20221021102950.539148-1-szeder.dev@gmail.com>


* pb/subtree-split-and-merge-after-squashing-tag-fix (2022-10-21) 9 commits
  (merged to 'next' on 2022-10-27 at 4f2134dd87)
 + subtree: fix split after annotated tag was squashed merged
 + subtree: fix squash merging after annotated tag was squashed merged
 + subtree: process 'git-subtree-split' trailer in separate function
 + subtree: use named variables instead of "$@" in cmd_pull
 + subtree: define a variable before its first use in 'find_latest_squash'
 + subtree: prefix die messages with 'fatal'
 + subtree: add 'die_incompatible_opt' function to reduce duplication
 + subtree: use 'git rev-parse --verify [--quiet]' for better error messages
 + test-lib-functions: mark 'test_commit' variables as 'local'

 A bugfix to "git subtree" in its split and merge features.

 Will merge to 'master'.
 source: <pull.1390.git.1666365219.gitgitgadget@gmail.com>


* jk/repack-tempfile-cleanup (2022-10-23) 6 commits
  (merged to 'next' on 2022-10-26 at e706eb120c)
 + t7700: annotate cruft-pack failure with ok=sigpipe
 + repack: drop remove_temporary_files()
 + repack: use tempfiles for signal cleanup
 + repack: expand error message for missing pack files
 + repack: populate extension bits incrementally
 + repack: convert "names" util bitfield to array

 The way "git repack" creared temporary files when it received a
 signal was prone to deadlocking, which has been corrected.

 Will merge to 'master'.
 source: <Y1M3fVnixJHvKiSg@coredump.intra.peff.net>


* en/ort-dir-rename-and-symlink-fix (2022-10-22) 1 commit
  (merged to 'next' on 2022-10-27 at 56f1e5222d)
 + merge-ort: fix bug with dir rename vs change dir to symlink

 Merging a branch with directory renames into a branch that changes
 the directory to a symlink was mishandled by the ort merge
 strategy, which has been corrected.

 Will merge to 'master'.
 source: <pull.1391.git.1666465450590.gitgitgadget@gmail.com>


* en/merge-tree-sequence (2022-10-22) 2 commits
  (merged to 'next' on 2022-10-28 at 31459cd5a8)
 + merge-tree: support multiple batched merges with --stdin
 + merge-tree: update documentation for differences in -z output

 "git merge-tree --stdin" is a new way to request a series of merges
 and report the merge results.

 Will merge to 'master'.
 source: <pull.1361.git.1666488485.gitgitgadget@gmail.com>


* rs/absorb-git-dir-simplify (2022-10-23) 1 commit
  (merged to 'next' on 2022-10-26 at 3d23cfd399)
 + submodule: use strvec_pushf() for --super-prefix

 Code simplification by using strvec_pushf() instead of building an
 argument in a separate strbuf.

 Will merge to 'master'.
 source: <7a4e2fc6-3e01-5683-2be5-13b7e67c7fe5@web.de>


* jc/doc-fsck-msgids (2022-10-25) 4 commits
  (merged to 'next' on 2022-10-28 at 3c00edabf8)
 + Documentation: add lint-fsck-msgids
 + fsck: document msg-id
 + fsck: remove the unused MISSING_TREE_OBJECT
 + fsck: remove the unused BAD_TAG_OBJECT

 Add documentation for message IDs in fsck error messages.

 Will merge to 'master'.
 source: <20221025224224.2352979-1-gitster@pobox.com>


* tb/repack-expire-to (2022-10-24) 4 commits
 - builtin/repack.c: implement `--expire-to` for storing pruned objects
 - builtin/repack.c: write cruft packs to arbitrary locations
 - builtin/repack.c: pass "cruft_expiration" to `write_cruft_pack`
 - builtin/repack.c: pass "out" to `prepare_pack_objects`

 "git repack" learns to send cruft objects out of the way into
 packfiles outside the repository.

 Will merge to 'next'?
 source: <cover.1666636974.git.me@ttaylorr.com>


* cc/filtered-repack (2022-10-25) 2 commits
 - repack: add --filter=<filter-spec> option
 - pack-objects: allow --filter without --stdout

 "git repack" learns to discard objects that ought to be retrievable
 again from the promissor remote.

 Needs review.
 source: <20221025122856.20204-1-christian.couder@gmail.com>


* tb/cap-patch-at-1gb (2022-10-25) 1 commit
  (merged to 'next' on 2022-10-27 at f0b4f9c12a)
 + apply: reject patches larger than ~1 GiB

 "git apply" limits its input to a bit less than 1 GiB.

 Will merge to 'master'.
 source: <70f5763834dff373a5573a99ec4cdfa36cadf34c.1666722251.git.me@ttaylorr.com>


* tb/midx-cleanup-fix (2022-10-25) 1 commit
 - midx.c: clear auxiliary MIDX files first

 The order in which multi-pack-index and its associated files are
 dropped has been tweaked to make it safer for concurrent users.

 Under discussion, but leaning to negative..
 cf. <143a588a-c98b-733b-2b23-34a87ca89431@github.com>
 source: <bf36093cd6d7ac83b16241b0199b3a8c904e6774.1666722316.git.me@ttaylorr.com>


* al/trace2-clearing-skip-worktree (2022-10-28) 2 commits
 - SQUASH???
 - index: add trace2 region for clear skip worktree

 Add trace2 counters to the region to clear skip worktree bits in a
 sparse checkout.

 Expecting a reroll?
 source: <pull.1368.v2.git.git.1666917961644.gitgitgadget@gmail.com>


* jt/skipping-negotiator-wo-recursion (2022-10-25) 1 commit
  (merged to 'next' on 2022-10-28 at 4a2588ab9e)
 + negotiator/skipping: avoid stack overflow

 Rewrite a deep recursion in the skipping negotiator to use a loop
 with on-heap prio queue to avoid stack wastage.

 Will merge to 'master'.
 source: <20221025232934.1504445-1-jonathantanmy@google.com>


* rj/branch-copy-rename-error-codepath-cleanup (2022-10-26) 1 commit
  (merged to 'next' on 2022-10-27 at f01a4ff619)
 + branch: error copying or renaming a detached HEAD

 Code simplification.

 Will merge to 'master'.
 source: <0ac8cd48-08d7-9bdd-b074-c8d5ded522f6@gmail.com>


* rj/branch-do-not-exit-with-minus-one-status (2022-10-26) 1 commit
  (merged to 'next' on 2022-10-27 at 061f63d4e2)
 + branch: error code with --edit-description

 "git branch --edit-description" can exit with status -1 which is
 not a good practice; it learned to use 1 as everybody else instead.

 Will merge to 'master'.
 source: <b0f96b35-4e69-a889-bcdf-e0b40b89384f@gmail.com>


* po/glossary-around-traversal (2022-10-22) 3 commits
 - glossary: add reachability bitmap description
 - glossary: add "commit graph" description
 - doc: use 'object database' not ODB or abbreviation

 The glossary entries for "commit-graph file" and "reachability
 bitmap" have been added.

 Expecting a (hopefully final) reroll.
 cf. <746491f4-fb41-92fe-7360-20a845dc21fc@iee.email>
 source: <20221022222539.2333-1-philipoakley@iee.email>


* mc/credential-helper-auth-headers (2022-10-21) 6 commits
 - t5556-http-auth: add test for HTTP auth hdr logic
 - http: set specific auth scheme depending on credential
 - http: move proactive auth to first slot creation
 - http: store all request headers on active_request_slot
 - credential: add WWW-Authenticate header to cred requests
 - http: read HTTP WWW-Authenticate response headers

 Extending credential helper protocol.

 Needs review.
 source: <pull.1352.v2.git.1666372083.gitgitgadget@gmail.com>


* jr/embargoed-releases-doc (2022-10-24) 1 commit
  (merged to 'next' on 2022-10-27 at c000502eaa)
 + embargoed releases: also describe the git-security list and the process

 The role the security mailing list plays in an embargoed release
 has been documented.

 Will merge to 'master'.
 source: <pull.1345.v4.git.1666649239302.gitgitgadget@gmail.com>


* jh/trace2-timers-and-counters (2022-10-24) 8 commits
  (merged to 'next' on 2022-10-26 at e4933e2658)
 + trace2: add global counter mechanism
 + trace2: add stopwatch timers
 + trace2: convert ctx.thread_name from strbuf to pointer
 + trace2: improve thread-name documentation in the thread-context
 + trace2: rename the thread_name argument to trace2_thread_start
 + api-trace2.txt: elminate section describing the public trace2 API
 + tr2tls: clarify TLS terminology
 + trace2: use size_t alloc,nr_open_regions in tr2tls_thread_ctx

 Two new facilities, "timer" and "counter", are introduced to the
 trace2 API.

 Will merge to 'master'.
 source: <pull.1373.v4.git.1666618868.gitgitgadget@gmail.com>


* jz/patch-id (2022-10-24) 6 commits
  (merged to 'next' on 2022-10-24 at 1ac3b46fbe)
 + builtin: patch-id: remove unused diff-tree prefix
 + builtin: patch-id: add --verbatim as a command mode
 + patch-id: fix patch-id for mode changes
 + builtin: patch-id: fix patch-id with binary diffs
 + patch-id: use stable patch-id for rebases
 + patch-id: fix stable patch id for binary / header-only

 A new "--include-whitespace" option is added to "git patch-id", and
 existing bugs in the internal patch-id logic that did not match
 what "git patch-id" produces have been corrected.

 Will merge to 'master'.
 source: <pull.1359.v5.git.1666642064.gitgitgadget@gmail.com>


* hl/archive-recursive (2022-10-19) 10 commits
 . fixup! archive: add tests for git archive --recurse-submodules
 . archive: add tests for git archive --recurse-submodules
 . archive: add --recurse-submodules to git-archive command
 . archive: remove global repository from archive_args
 . archive: pass repo objects to write_archive handlers
 . tree: add repository parameter to read_tree_fn_t
 . tree: handle submodule case for read_tree_at properly
 . tree: increase test coverage for tree.c
 . tree: update cases to use repo_ tree methods
 . tree: do not use the_repository for tree traversal methods.

 "git archive" has been taught "--recurse-submodules" option to
 create a tarball that includes contents from submodules.

 Expecting a reroll.
 Seems to break win+VS test(8).
 cf. https://github.com/git/git/actions/runs/3293333066 whose only
 difference from https://github.com/git/git/actions/runs/3293553109
 is the inclusion of this topic.
 source: <pull.1359.v3.git.git.1665973401.gitgitgadget@gmail.com>


* pw/rebase-keep-base-fixes (2022-10-17) 8 commits
  (merged to 'next' on 2022-10-27 at 802359afac)
 + rebase --keep-base: imply --no-fork-point
 + rebase --keep-base: imply --reapply-cherry-picks
 + rebase: factor out branch_base calculation
 + rebase: rename merge_base to branch_base
 + rebase: store orig_head as a commit
 + rebase: be stricter when reading state files containing oids
 + t3416: set $EDITOR in subshell
 + t3416: tighten two tests
 (this branch is used by pw/rebase-reflog-fixes.)

 "git rebase --keep-base" used to discard the commits that are
 already cherry-picked to the upstream, even when "keep-base" meant
 that the base, on top of which the history is being rebuilt, does
 not yet include these cherry-picked commits.  The --keep-base
 option now implies --reapply-cherry-picks and --no-fork-point
 options.

 Will merge to 'master'.
 source: <pull.1323.v4.git.1666012665.gitgitgadget@gmail.com>


* pw/rebase-reflog-fixes (2022-10-17) 9 commits
  (merged to 'next' on 2022-10-27 at 60738821ef)
 + rebase: cleanup action handling
 + rebase --abort: improve reflog message
 + rebase --apply: make reflog messages match rebase --merge
 + rebase --apply: respect GIT_REFLOG_ACTION
 + rebase --merge: fix reflog message after skipping
 + rebase --merge: fix reflog when continuing
 + t3406: rework rebase reflog tests
 + rebase --apply: remove duplicated code
 + Merge branch 'pw/rebase-keep-base-fixes' into pw/rebase-reflog-fixes
 (this branch uses pw/rebase-keep-base-fixes.)

 Fix some bugs in the reflog messages when rebasing and changes the
 reflog messages of "rebase --apply" to match "rebase --merge" with
 the aim of making the reflog easier to parse.

 Will merge to 'master'.
 source: <pull.1150.v3.git.1665567312.gitgitgadget@gmail.com>


* sd/doc-smtp-encryption (2022-10-12) 1 commit
  (merged to 'next' on 2022-10-26 at b984763a1b)
 + docs: git-send-email: difference between ssl and tls smtp-encryption

 Will merge to 'master'.
 source: <20221012150619.12877-1-sndanailov@wired4ever.net>


* en/sparse-checkout-design (2022-10-08) 1 commit
 - sparse-checkout.txt: new document with sparse-checkout directions

 Design doc.

 Needs review.
 source: <pull.1367.v3.git.1665269538608.gitgitgadget@gmail.com>


* pw/test-todo (2022-10-06) 3 commits
 - test_todo: allow [verbose] test as the command
 - test_todo: allow [!] grep as the command
 - tests: add test_todo() to mark known breakages

 RFC for test framework improvement.

 Needs review.
 source: <pull.1374.git.1665068476.gitgitgadget@gmail.com>


* ab/coccicheck-incremental (2022-10-26) 12 commits
 - spatchcache: add a ccache-alike for "spatch"
 - cocci: run against a generated ALL.cocci
 - cocci rules: remove <id>'s from rules that don't need them
 - cocci: optimistically use COMPUTE_HEADER_DEPENDENCIES
 - cocci: make "coccicheck" rule incremental
 - cocci: split off "--all-includes" from SPATCH_FLAGS
 - cocci: split off include-less "tests" from SPATCH_FLAGS
 - Makefile: split off SPATCH_BATCH_SIZE comment from "cocci" heading
 - Makefile: have "coccicheck" re-run if flags change
 - Makefile: add ability to TAB-complete cocci *.patch rules
 - cocci rules: remove unused "F" metavariable from pending rule
 - Makefile + shared.mak: rename and indent $(QUIET_SPATCH_T)

 "make coccicheck" is time consuming. It has been made to run more
 incrementally.

 Will merge to 'next'?
 source: <cover-v4-00.12-00000000000-20221026T141005Z-avarab@gmail.com>


* ds/bundle-uri-3 (2022-10-12) 13 commits
  (merged to 'next' on 2022-10-28 at 9d9092b4cc)
 + bundle-uri: suppress stderr from remote-https
 + bundle-uri: quiet failed unbundlings
 + bundle: add flags to verify_bundle()
 + bundle-uri: fetch a list of bundles
 + bundle: properly clear all revision flags
 + bundle-uri: limit recursion depth for bundle lists
 + bundle-uri: parse bundle list in config format
 + bundle-uri: unit test "key=value" parsing
 + bundle-uri: create "key=value" line parsing
 + bundle-uri: create base key-value pair parsing
 + bundle-uri: create bundle_list struct and helpers
 + bundle-uri: use plain string in find_temp_filename()
 + Merge branch 'ds/bundle-uri-clone' into ds/bundle-uri-3

 Define the logical elements of a "bundle list", data structure to
 store them in-core, format to transfer them, and code to parse
 them.

 Will merge to 'master'.
 source: <pull.1333.v5.git.1665579160.gitgitgadget@gmail.com>
