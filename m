Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3FAC4332F
	for <git@archiver.kernel.org>; Tue,  8 Nov 2022 23:12:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbiKHXMO (ORCPT <rfc822;git@archiver.kernel.org>);
        Tue, 8 Nov 2022 18:12:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiKHXMM (ORCPT <rfc822;git@vger.kernel.org>);
        Tue, 8 Nov 2022 18:12:12 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40CA91181A
        for <git@vger.kernel.org>; Tue,  8 Nov 2022 15:12:09 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id r81so12728286iod.2
        for <git@vger.kernel.org>; Tue, 08 Nov 2022 15:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ttaylorr-com.20210112.gappssmtp.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nn44VQgC33yZ1wbnh9zBo5pp1OM0C5qfCqOEUXeOR2M=;
        b=lRhgKJeuohL9v9HG47j5sIUkZaQSg9ks1hB7Yr8tFRZzMfg7M5XsEcjEweF0zgHxxf
         khdQsyDy403cBfkviZt+Qpij3MC11RtPd7bInx/q7QG2WD+qTSGz3KHrIjFNQcGp9kRJ
         rSV4QcT8QxSQsMKjrWBR4Gu53n46rKRPOGkJODIhjvJXprpbbqDoT4uf+2YU3JpIWbvg
         5kAiJ8604a1XCeaIjlqPwlNAp0gHJj45Go48k4ruIFzMw09yb+tPHp0CARlmSX7xtta0
         sGw0GcgDYD8ehBbDYCqr3yjOganKSyXYy/ZCaQcW1Q1/+e+JiGxpnxAx6PEwrepGLzvD
         Whlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nn44VQgC33yZ1wbnh9zBo5pp1OM0C5qfCqOEUXeOR2M=;
        b=3UHT2gMOaDf994p9wwOZxJw9fltTNlqCFWmU0f7PPtosJfxLWKmaytoesdy9IPwrQr
         DmV1EOHX8ThT/CFn1ARkEwia8ooHJ3wvlzIVRqy2lk9h++dRTwGPfEZ5xUAxu8yzPEu3
         zbzpla2w1KS4sb0ARHfmVr0wSDvBaXP/py4eIHZy6yU60PBAcvRQdLLY6+ge4qZCboKk
         PfmfuRWeC2nGsTkEbCFjVc99tIvnZay83PRPNkVMUb3qVnRYdQGMjodUBchegfLVMcu8
         LIayJI5v0d9cqctqEUw5KjDYWvgDioX1Oyt+XOnyEUq6lIY3uI4AKkDtSkAriw+vXNXA
         Jslg==
X-Gm-Message-State: ACrzQf2RX/wD+vjGNbxMp4K1aGFcrCkJyZFDPRZyG7u8K5qjG09Jj/y2
        diidhtxez6N5LVlEHd44yqlLb4J/AS95Ksh9
X-Google-Smtp-Source: AMsMyM7gJ67rk9GqYk6EebyBBZ4EnBesVBRWI4tYP9QThWgGyeqo0vXFI/J5x8JglRxj9/aclxKr4Q==
X-Received: by 2002:a02:3946:0:b0:375:4d99:520b with SMTP id w6-20020a023946000000b003754d99520bmr1181178jae.118.1667949127705;
        Tue, 08 Nov 2022 15:12:07 -0800 (PST)
Received: from localhost (104-178-186-189.lightspeed.milwwi.sbcglobal.net. [104.178.186.189])
        by smtp.gmail.com with ESMTPSA id h44-20020a022b2c000000b00375217ea9b6sm4192789jaa.45.2022.11.08.15.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 15:12:06 -0800 (PST)
Date:   Tue, 8 Nov 2022 18:12:05 -0500
From:   Taylor Blau <me@ttaylorr.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Nov 2022, #02; Tue, 8)
Message-ID: <Y2riRSL+NprJt278@nand.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-master-at: 319605f8f00e402f3ea758a02c63534ff800a711
X-next-at: 0f3c55d4c2b7864bffb2d92278eff08d0b2e083f
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Here are the topics that have been cooking in my tree.  Commits
prefixed with '+' are in 'next' (being in 'next' is a sign that a
topic is stable enough to be used and are candidate to be in a future
release).  Commits prefixed with '-' are only in 'seen', and aren't
considered "accepted" at all.  A topic without enough support may be
discarded after a long period of no activity.

A handful of topics are still sitting in 'seen' waiting review. They
are marked accordingly below. Otherwise, a number of topics have
graduated, and the slate for 'next' is relatively small. Hopefully
some additional review effort will mean that we can graduate some of
those topics to 'next' in the next round of integration.

Copies of the source code to Git live in many repositories, and the
following is a list of the ones I push into or their mirrors.  Some
repositories have only a subset of branches.

With maint, master, next, seen, todo:

	https://github.com/git/git/

The following mirrors are currently out-of-date while the usual
maintainer is offline.

	git://git.kernel.org/pub/scm/git/git.git/
	git://repo.or.cz/alt-git.git/
	https://kernel.googlesource.com/pub/scm/git/git/
	https://gitlab.com/git-vcs/git/

With all the integration branches and topics broken out:

	https://github.com/ttaylorr/git/

Even though the preformatted documentation in HTML and man format
are not sources, they are typically published in these repositories
for convenience (replace "htmldocs" with "manpages" for the manual
  pages):

	git://git.kernel.org/pub/scm/git/git-htmldocs.git/
	https://github.com/gitster/git-htmldocs.git/

...but these and the release tarballs below are similarly out-of-date:

	https://www.kernel.org/pub/software/scm/git/

--------------------------------------------------
[Graduated to 'master']

* es/mark-gc-cruft-as-experimental (2022-10-26) 2 commits
  (merged to 'next' on 2022-11-03 at 4079e1b06b)
 + config: let feature.experimental imply gc.cruftPacks=true
 + gc: add tests for --cruft and friends

 Enable gc.cruftpacks by default for those who opt into
 feature.experimental setting.
 source: <cover.1666819953.git.me@ttaylorr.com>


* jc/set-gid-bit-less-aggressively (2022-10-28) 1 commit
  (merged to 'next' on 2022-11-03 at 32bfd99ffd)
 + adjust_shared_perm(): leave g+s alone when the group does not matter

 The adjust_shared_perm() helper function learned to refrain from
 setting the "g+s" bit on directories when it is not necessary.
 source: <xmqqr0yrhco6.fsf@gitster.g>


* jk/ref-filter-parsing-bugs (2022-11-02) 2 commits
  (merged to 'next' on 2022-11-03 at 92c1a50548)
 + ref-filter: fix parsing of signatures with CRLF and no body
 + ref-filter: fix parsing of signatures without blank lines

 Various tests exercising the transfer.credentialsInUrl configuration
 are taught to avoid making requests which require resolving localhost
 to reduce CI-flakiness.
 source: <Y2IeqOT5Ao1Qa0Zl@coredump.intra.peff.net>


* ma/drop-redundant-diagnostic (2022-10-31) 1 commit
  (merged to 'next' on 2022-11-03 at 196c5a337b)
 + test-lib-functions: drop redundant diagnostic print

 A redundant diagnostic message is dropped from test_path_is_missing().
 source: <20221031180048.5766-1-martin.agren@gmail.com>


* po/glossary-around-traversal (2022-10-30) 4 commits
  (merged to 'next' on 2022-11-03 at 58b659f92b)
 + glossary: add reachability bitmap description
 + glossary: add "commit graph" description
 + doc: use 'object database' not ODB or abbreviation
 + doc: use "commit-graph" hyphenation consistently

 The glossary entries for "commit-graph file" and "reachability
 bitmap" have been added.
 source: <20221029164112.2097-1-philipoakley@iee.email>


* rs/archive-filter-error-once (2022-10-30) 1 commit
  (merged to 'next' on 2022-11-03 at c2d1004d96)
 + archive-tar: report filter start error only once

 "git archive" mistakenly complained twice about a missing executable,
 which has been corrected.
 source: <c51b72e5-1c32-65e4-6faa-04693b623e2e@web.de>


* rs/no-more-run-command-v (2022-10-30) 12 commits
  (merged to 'next' on 2022-11-03 at 27eb80811c)
 + replace and remove run_command_v_opt()
 + replace and remove run_command_v_opt_cd_env_tr2()
 + replace and remove run_command_v_opt_tr2()
 + replace and remove run_command_v_opt_cd_env()
 + use child_process members "args" and "env" directly
 + use child_process member "args" instead of string array variable
 + sequencer: simplify building argument list in do_exec()
 + bisect--helper: factor out do_bisect_run()
 + bisect: simplify building "checkout" argument list
 + am: simplify building "show" argument list
 + run-command: fix return value comment
 + merge: remove always-the-same "verbose" arguments

 Simplify the run-command API.
 source: <ea061164-b36b-485c-963f-8c13e813a47e@web.de>


* tb/howto-using-redo-script (2022-10-26) 1 commit
  (merged to 'next' on 2022-11-03 at 521600fd56)
 + Documentation/howto/maintain-git.txt: fix Meta/redo-jch.sh invocation
 (this branch is used by tb/howto-maintain-git-fixes.)

 Doc update.
 source: <4ba057094ae6b1bd5c18583f23f7f99232034c72.1666815325.git.me@ttaylorr.com>

--------------------------------------------------
[New Topics]

* ab/rev-info-init (2022-11-08) 1 commit
  (merged to 'next' on 2022-11-08 at 909ad9ed3a)
 + revisions API: extend the nascent REV_INFO_INIT macro

 Progress on being able to initialize a rev_info struct with a macro.

 Will merge to 'master'.
 source: <patch-1.1-c3afcd69ddb-20221108T140134Z-avarab@gmail.com>


* ab/various-leak-fixes (2022-11-08) 16 commits
 - built-ins: use free() not UNLEAK() if trivial, rm dead code
 - revert: fix parse_options_concat() leak
 - cherry-pick: free "struct replay_opts" members
 - rebase: don't leak on "--abort"
 - connected.c: free the "struct packed_git"
 - sequencer.c: fix "opts->strategy" leak in read_strategy_opts()
 - ls-files: fix a --with-tree memory leak
 - revision API: call graph_clear() in release_revisions()
 - unpack-file: fix ancient leak in create_temp_file()
 - built-ins & libs & helpers: add/move destructors, fix leaks
 - dir.c: free "ident" and "exclude_per_dir" in "struct untracked_cache"
 - read-cache.c: clear and free "sparse_checkout_patterns"
 - commit: discard partial cache before (re-)reading it
 - {reset,merge}: call discard_index() before returning
 - tests: mark tests as passing with SANITIZE=leak
 - Merge branch 'pw/rebase-no-reflog-action' into ab/various-leak-fixes
 (this branch uses pw/rebase-no-reflog-action.)

 Various leak fixes.

 Will merge to 'next'.
 source: <cover-v2-00.15-00000000000-20221108T172650Z-avarab@gmail.com>


* aw/complete-case-insensitive (2022-11-07) 2 commits
 - completion: add case-insensitive match of pseudorefs
 - completion: add optional ignore-case when matching refs

 Introduce a case insensitive mode to the Bash completion helpers.

 Waiting for review.
 source: <pull.1374.git.git.1667669315.gitgitgadget@gmail.com>


* dd/bisect-helper-subcommand (2022-11-05) 3 commits
  (merged to 'next' on 2022-11-08 at 3951bf0f12)
 + bisect--helper: parse subcommand with OPT_SUBCOMMAND
 + bisect--helper: move all subcommands into their own functions
 + bisect--helper: remove unused options
 (this branch is used by dd/git-bisect-builtin.)

 Fix a regression in the bisect-helper which mistakenly treats
 arguments to the command given to 'git bisect run' as arguments to
 the helper.

 Will cook in 'next'.
 source: <cover.1667667058.git.congdanhqx@gmail.com>


* dd/git-bisect-builtin (2022-11-07) 14 commits
 - Turn `git bisect` into a full built-in
 - bisect--helper: log: allow arbitrary number of arguments
 - bisect--helper: remove subcommand state
 - bisect--helper: make `state` optional
 - bisect--helper: emit usage for "git bisect"
 - bisect test: test exit codes on bad usage
 - bisect--helper: pretend we're real bisect when report error
 - bisect--helper: remove unused arguments from do_bisect_run
 - bisect run: keep some of the post-v2.30.0 output
 - bisect: fix output regressions in v2.30.0
 - bisect--helper: pass arg[cv] down to do_bisect_run
 - bisect: refactor bisect_run() to match CodingGuidelines
 - bisect tests: test for v2.30.0 "bisect run" regressions
 - Merge branch 'dd/bisect-helper-subcommand' into dd/git-bisect-builtin
 (this branch uses dd/bisect-helper-subcommand.)

 Expecting a (combined) reroll???
 source: <cover-00.13-00000000000-20221104T132117Z-avarab@gmail.com>

* ds/packed-refs-v2 (2022-11-07) 30 commits
 - refs: skip hashing when writing packed-refs v2
 - p1401: create performance test for ref operations
 - ci: run GIT_TEST_PACKED_REFS_VERSION=2 in some builds
 - t*: skip packed-refs v2 over http tests
 - t3210: require packed-refs v1 for some tests
 - t5502: add PACKED_REFS_V1 prerequisite
 - t5312: allow packed-refs v2 format
 - t1409: test with packed-refs v2
 - packed-backend: create GIT_TEST_PACKED_REFS_VERSION
 - packed-refs: write prefix chunks
 - packed-refs: read optional prefix chunks
 - packed-refs: read file format v2
 - packed-refs: write file format version 2
 - packed-backend: create shell of v2 writes
 - config: add config values for packed-refs v2
 - packed-backend: create abstraction for writing refs
 - packed-backend: extract iterator/updates merge
 - packed-backend: extract add_write_error()
 - refs: extract packfile format to new file
 - chunk-format: parse trailing table of contents
 - chunk-format: allow trailing table of contents
 - chunk-format: store chunk offset during write
 - chunk-format: document trailing table of contents
 - chunk-format: number of chunks is optional
 - refs: allow loose files without packed-refs
 - repository: wire ref extensions to ref backends
 - config: fix multi-level bulleted list
 - extensions: add refFormat extension
 - read-cache: add index.computeHash config option
 - hashfile: allow skipping the hash function

 Waiting for review.
 source: <pull.1408.git.1667846164.gitgitgadget@gmail.com>


* es/chainlint-output (2022-11-08) 4 commits
 - chainlint: annotate original test definition rather than token stream
 - chainlint: latch start/end position of each token
 - chainlint: tighten accuracy when consuming input stream
 - chainlint: add explanatory comments

 Teach chainlint.pl to annotate the original test definition instead
 of the token stream.

 Will merge to 'next'?
 source: <pull.1375.git.git.1667934510.gitgitgadget@gmail.com>


* ja/worktree-orphan (2022-11-04) 2 commits
 - worktree add: add --orphan flag
 - worktree add: Include -B in usage docs

 'git worktree add' learned how to create a worktree based on an
 orphaned branch with `--orphan`.

 source: <20221104213401.17393-1-jacobabel@nullpo.dev>


* js/ci-set-output (2022-11-08) 1 commit
  (merged to 'next' on 2022-11-08 at 553062428c)
 + ci: use a newer `github-script` version

 Update the actions/github-script dependency in CI to avoid a
 deprecation warning.

 Will merge to 'master'.
 source: <pull.1387.git.1667902408921.gitgitgadget@gmail.com>


* js/remove-stale-scalar-repos (2022-11-07) 1 commit
  (merged to 'next' on 2022-11-08 at 6d598a3b80)
 + scalar reconfigure -a: remove stale `scalar.repo` entries

 'scalar reconfigure -a' is taught to automatically remove
 scalar.repo entires which no longer exist.

 Will cook in 'next'.
 source: <pull.1407.git.1667845501422.gitgitgadget@gmail.com>


* jt/submodule-on-demand (2022-11-07) 1 commit
 - submodule: explicitly specify on-demand upon push

 Push all submodules recursively with
 '--recurse-submodules=on-demand'.

 Waiting for review.
 source: <20221108002553.3836987-1-jonathantanmy@google.com>


* pw/rebase-no-reflog-action (2022-11-04) 2 commits
 - rebase: stop exporting GIT_REFLOG_ACTION
 - sequencer: stop exporting GIT_REFLOG_ACTION
 (this branch is used by ab/various-leak-fixes.)

 Avoid setting GIT_REFLOG_ACTION to improve readability of the
 sequencer internals.

 Expecting a (final?) reroll.
 source: <pull.1405.git.1667575142.gitgitgadget@gmail.com>


* rp/maintenance-qol (2022-11-08) 2 commits
  (merged to 'next' on 2022-11-08 at 076428c430)
 + maintenance: add option to register in a specific config
 + for-each-repo: interpolate repo path arguments

 'git maintenance register' is taught to write configuration to an
 arbitrary path, and 'git for-each-repo' is taught to expand tilde
 characters in paths.

 Will cook in 'next'.
 source: <20221108194930.25805-1-ronan@rjp.ie>


* sa/cat-file-mailmap--batch-check (2022-10-30) 2 commits
 - cat-file: add mailmap support to --batch-check option
 - cat-file: add mailmap support to -s option

 'cat-file' gains mailmap support for its '--batch-check' and '-s'
 options.

* sz/macos-fsmonitor-symlinks (2022-11-08) 1 commit
 - fsmonitor--daemon: on macOS support symlink

 Fix an issue where core.fsmonitor on macOS would not notice created
 or modified symbolic links.

 Waiting for review.
 source: <pull.1406.git.1667885119570.gitgitgadget@gmail.com>


* tb/ci-concurrency (2022-11-08) 1 commit
 - ci: avoid unnecessary builds

 Avoid unnecessary builds in CI, with settings configured in
 ci-config.

 Waiting for review.
 source: <ff172f1de982f6f79b598e4ac6d5b2964ca4a098.1667931937.git.me@ttaylorr.com>


* tl/notes--blankline (2022-11-07) 3 commits
 - notes.c: drop unreachable code in "append_edit()"
 - notes.c: fixed tip when target and append note are both empty
 - notes.c: introduce "--blank-line" option

 'git notes append' was taught '--[no-]blank-line' to conditionally
 add a LF between a new and existing note.

 Expecting a reroll.
 source: <cover.1667828335.git.dyroneteng@gmail.com>


* vd/update-refs-delete (2022-11-07) 1 commit
  (merged to 'next' on 2022-11-08 at 2866156953)
 + rebase --update-refs: avoid unintended ref deletion

 Will cook in 'next'.
 source: <20221107174752.91186-1-vdye@github.com>

--------------------------------------------------
[Stalled]

* cw/submodule-status-in-parallel (2022-11-08) 6 commits
 - diff-lib: parallelize run_diff_files for submodules
 - diff-lib: refactor match_stat_with_submodule
 - submodule: move status parsing into function
 - submodule: strbuf variable rename
 - run-command: add duplicate_output_fn to run_processes_parallel_opts
 - Merge branch 'ab/run-hook-api-cleanup' into cw/submodule-status-in-parallel

 Allow the internal "diff-files" engine to run "how has this
 submodule changed?" in parallel to speed up "git status".

 Waiting for review.
 source: <20221020232532.1128326-1-calvinwan@google.com>


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

* ab/submodule-helper-prep-only (2022-11-08) 9 commits
  (merged to 'next' on 2022-11-08 at c0c4f4d1c3)
 + submodule--helper: use OPT_SUBCOMMAND() API
 + submodule--helper: drop "update --prefix <pfx>" for "-C <pfx> update"
 + submodule--helper: remove --prefix from "absorbgitdirs"
 + submodule API & "absorbgitdirs": remove "----recursive" option
 + submodule.c: refactor recursive block out of absorb function
 + submodule tests: test for a "foreach" blind-spot
 + submodule--helper: fix a memory leak in "status"
 + submodule tests: add tests for top-level flag output
 + submodule--helper: move "config" to a test-tool

 Preparation to remove git-submodule.sh and replace it with a builtin.

 Will cook in 'next'.
 source: <cover-v2-0.9-00000000000-20221108T140501Z-avarab@gmail.com>


* ds/bundle-uri-4 (2022-10-31) 9 commits
 - clone: unbundle the advertised bundles
 - bundle-uri: download bundles from an advertised list
 - bundle-uri: allow relative URLs in bundle lists
 - strbuf: reintroduce strbuf_parent_directory()
 - bundle-uri client: add boolean transfer.bundleURI setting
 - bundle-uri: serve bundle.* keys from config
 - bundle-uri client: add helper for testing server
 - bundle-uri client: add minimal NOOP client
 - protocol v2: add server-side "bundle-uri" skeleton

 Bundle URIs part 4.

 Waiting for review.
 source: <pull.1400.git.1667264854.gitgitgadget@gmail.com>


* sg/plug-line-log-leaks (2022-11-02) 3 commits
 - diff.c: use diff_free_queue()
 - line-log: free the diff queues' arrays when processing merge commits
 - line-log: free diff queue when processing non-merge commits

 A handful of leaks in the line-log machinery have been plugged.

 Expecting a reroll.
 source: <20221102220142.574890-1-szeder.dev@gmail.com>


* tb/branch-delete-detached (2022-11-01) 1 commit
 - branch: gracefully handle '-d' on detached HEAD

 'git branch -d' is taught to ignore failures to resolve HEAD when
 detached.

 Expecting a reroll.
 source: <c68f4b140f2495a35c5f30bec4e2e56c246160f4.1667334672.git.me@ttaylorr.com>


* tb/howto-maintain-git-fixes (2022-10-31) 2 commits
 - Documentation: build redo-seen.sh from jch..seen
 - Documentation: build redo-jch.sh from master..jch

 A pair of bugfixes to the Documentation/howto/maintain-git.txt guide.

 Will merge to 'next'.
 source: <cover.1667260044.git.me@ttaylorr.com>


* tl/pack-bitmap-absolute-paths (2022-11-04) 2 commits
 - pack-bitmap.c: remove unnecessary "open_pack_index()" calls
 - pack-bitmap.c: avoid exposing absolute paths

 The pack-bitmap machinery is taught to log the paths of redundant
 bitmap(s) to trace2 instead of stderr.

 Expecting a (final?) reroll.
 source: <cover.1667470481.git.dyroneteng@gmail.com>


* ab/cmake-nix-and-ci (2022-11-04) 14 commits
  (merged to 'next' on 2022-11-08 at 6ef4e93b36)
 + CI: add a "linux-cmake-test" to run cmake & ctest on linux
 + cmake: copy over git-p4.py for t983[56] perforce test
 + cmake: only look for "sh" in "C:/Program Files" on Windows
 + cmake: increase test timeout on Windows only
 + cmake: support GIT_TEST_OPTS, abstract away WIN32 defaults
 + Makefile + cmake: use environment, not GIT-BUILD-DIR
 + test-lib.sh: support a "GIT_TEST_BUILD_DIR"
 + cmake: set "USE_LIBPCRE2" in "GIT-BUILD-OPTIONS" for test-lib.sh
 + cmake & test-lib.sh: add a $GIT_SOURCE_DIR variable
 + cmake: chmod +x the bin-wrappers/* & SCRIPT_{SH,PERL} & git-p4
 + cmake: don't copy chainlint.pl to build directory
 + cmake: update instructions for portable CMakeLists.txt
 + cmake: use "-S" and "-B" to specify source and build directories
 + cmake: don't invoke msgfmt with --statistics

 Fix assorted issues with CTest on *nix machines.

 Will cook in 'next'.
 source: <cover-v4-00.14-00000000000-20221103T160255Z-avarab@gmail.com>


* ab/make-bin-wrappers (2022-10-31) 4 commits
 - Makefile: simplify $(test_bindir_programs) rule by splitting it up
 - Makefile: rename "test_bindir_programs" variable, pre-declare
 - Makefile: define "TEST_{PROGRAM,OBJS}" variables earlier
 - Makefile: factor sed-powered '#!/bin/sh' munging into a variable

 Resolve issues with the bin-wrappers/% rules where "make
 bin-wrappers/git" would generate the script but not "git" itself.

 Waiting for review.
 source: <cover-v3-0.4-00000000000-20221031T222249Z-avarab@gmail.com>


* ab/misc-hook-submodule-run-command (2022-10-31) 3 commits
  (merged to 'next' on 2022-11-03 at 0f01b25561)
 + run-command tests: test stdout of run_command_parallel()
 + submodule tests: reset "trace.out" between "grep" invocations
 + hook tests: fix redirection logic error in 96e7225b310

 Various test updates.

 Waiting for review.
 source: <cover-0.3-00000000000-20221029T025520Z-avarab@gmail.com>


* do/modernize-t7001 (2022-11-04) 1 commit
  (merged to 'next' on 2022-11-08 at dfc9c80e73)
 + t7001-mv.sh: modernizing test script using functions

 Modernize test script to avoid "test -f" and friends.

 Will merge to 'master'.
 source: <pull.1372.v3.git.git.1667574352244.gitgitgadget@gmail.com>


* kz/merge-tree-merge-base (2022-11-04) 2 commits
 - merge-tree.c: allow specifying the merge-base when --stdin is passed
 - merge-tree.c: add --merge-base=<commit> option

 "merge-tree" learns a new `--merge-base` option.

 Waiting for review.
 source: <pull.1397.v6.git.1667472621.gitgitgadget@gmail.com>


* mh/password-can-be-pat (2022-11-08) 1 commit
  (merged to 'next' on 2022-11-08 at 3135ade2a6)
 + Documentation/gitcredentials.txt: mention password alternatives

 Documentation update to git-credential(1).

 Will merge to 'master'.
 source: <pull.1396.v3.git.1667912487608.gitgitgadget@gmail.com>


* po/pretty-hard-trunc (2022-11-02) 1 commit
 - pretty-formats: add hard truncation, without ellipsis, options

 Add a new pretty format which truncates without ellipsis.

 Missing test coverage.
 source: <20221102120853.2013-1-philipoakley@iee.email>


* rr/long-status-advice (2022-11-04) 1 commit
 - status: long status advice adapted to recent capabilities

 The advice message emitted by a slow "status" run is amended to
 mention fsmonitor.

 Waiting for reviewer feedback on the updated round.
 source: <pull.1384.v3.git.1667424467505.gitgitgadget@gmail.com>


* ab/config-multi-and-nonbool (2022-11-02) 9 commits
 - for-each-repo: with bad config, don't conflate <path> and <cmd>
 - config API: add "string" version of *_value_multi(), fix segfaults
 - config API users: test for *_get_value_multi() segfaults
 - for-each-repo: error on bad --config
 - config API: have *_multi() return an "int" and take a "dest"
 - versioncmp.c: refactor config reading next commit
 - config tests: add "NULL" tests for *_get_value_multi()
 - config tests: cover blind spots in git_die_config() tests
 - for-each-repo tests: test bad --config keys

 A mixed bag of config API updates.

 Expecting a reroll.
 cf. <221026.86pmeebcj9.gmgdl@evledraar.gmail.com>
 source: <cover-v2-0.9-00000000000-20221101T225822Z-avarab@gmail.com>


* ab/sha-makefile-doc (2022-11-07) 10 commits
  (merged to 'next' on 2022-11-08 at 6d3068d7cd)
 + Makefile: discuss SHAttered in *_SHA{1,256} discussion
 + Makefile: document default SHA-1 backend on OSX
 + Makefile & test-tool: replace "DC_SHA1" variable with a "define"
 + Makefile: document SHA-1 and SHA-256 default and selection order
 + Makefile: document default SHA-256 backend
 + Makefile: rephrase the discussion of *_SHA1 knobs
 + Makefile: create and use sections for "define" flag listing
 + Makefile: correct DC_SHA1 documentation
 + INSTALL: remove discussion of SHA-1 backends
 + Makefile: always (re)set DC_SHA1 on fallback

 Makefile comments updates and reordering to clarify knobs used to
 choose SHA implementations.

 Will cook in 'next'.
 source: <cover-v5-00.10-00000000000-20221107T211736Z-avarab@gmail.com>


* ps/receive-use-only-advertised (2022-11-08) 6 commits
 - receive-pack: only use visible refs for connectivity check
 - rev-parse: add `--exclude-hidden=` option
 - revision: add new parameter to exclude hidden refs
 - revision: introduce struct to handle exclusions
 - revision: move together exclusion-related functions
 - refs: get rid of global list of hidden refs

 "git receive-pack" used to use all the local refs as the boundary
 for checking connectivity of the data "git push" sent, but now it
 uses only the refs that it advertised to the pusher.  In a
 repository with the .hideRefs configuration, this reduces the
 resource needed to perform the check, and also forces the pusher to
 prove they have all objects that are necessary to complete the
 history on top of only the history available to them.

 Expecting a (final?) reroll.
 cf. <221028.86bkpw805n.gmgdl@evledraar.gmail.com>
 cf. <xmqqr0yrizqm.fsf@gitster.g>
 source: <cover.1667901510.git.ps@pks.im>


* gc/submodule-clone-update-with-branches (2022-10-30) 8 commits
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

 Waiting for review.
 source: <pull.1321.v3.git.git.1666988096.gitgitgadget@gmail.com>


* pw/config-int-parse-fixes (2022-10-22) 3 commits
 . git_parse_signed(): avoid integer overflow
 . config: require at least one digit when parsing numbers
 . git_parse_unsigned: reject negative values

 Assorted fixes of parsing end-user input as integers.

 Expecting a reroll to add test coverage.
 cf. <Y1L+Qv+cs1bjqjK9@coredump.intra.peff.net>
 source: <pull.1389.git.1666359915.gitgitgadget@gmail.com>


* sa/cat-file-mailmap (2022-10-21) 1 commit
 . doc/cat-file: allow --use-mailmap for --batch options

 Doc updates.

 Waiting for review response.
 source: <20221021103442.202759-1-siddharthasthana31@gmail.com>


* tb/repack-expire-to (2022-10-24) 4 commits
  (merged to 'next' on 2022-11-08 at 496ce3c62d)
 + builtin/repack.c: implement `--expire-to` for storing pruned objects
 + builtin/repack.c: write cruft packs to arbitrary locations
 + builtin/repack.c: pass "cruft_expiration" to `write_cruft_pack`
 + builtin/repack.c: pass "out" to `prepare_pack_objects`

 "git repack" learns to send cruft objects out of the way into
 packfiles outside the repository.

 Will cook in 'next'.
 source: <cover.1666636974.git.me@ttaylorr.com>


* cc/filtered-repack (2022-10-25) 2 commits
 - repack: add --filter=<filter-spec> option
 - pack-objects: allow --filter without --stdout

 "git repack" learns to discard objects that ought to be retrievable
 again from the promissor remote.

 Needs review.
 source: <20221025122856.20204-1-christian.couder@gmail.com>


* al/trace2-clearing-skip-worktree (2022-11-04) 2 commits
  (merged to 'next' on 2022-11-08 at 567aeb8d83)
 + index: raise a bug if the index is materialised more than once
 + index: add trace2 region for clear skip worktree

 Add trace2 counters to the region to clear skip worktree bits in a
 sparse checkout.

 Will merge to 'master'.
 source: <pull.1368.v4.git.git.1667516701.gitgitgadget@gmail.com>


* mc/credential-helper-auth-headers (2022-11-02) 11 commits
 - t5556: add HTTP authentication tests
 - test-http-server: add simple authentication
 - test-http-server: pass Git requests to http-backend
 - test-http-server: add HTTP request parsing
 - test-http-server: add HTTP error response function
 - test-http-server: add stub HTTP server test helper
 - http: set specific auth scheme depending on credential
 - http: move proactive auth to first slot creation
 - http: store all request headers on active_request_slot
 - credential: add WWW-Authenticate header to cred requests
 - http: read HTTP WWW-Authenticate response headers

 Extending credential helper protocol.

 Needs review.
 source: <pull.1352.v3.git.1667426969.gitgitgadget@gmail.com>


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


* en/sparse-checkout-design (2022-11-07) 1 commit
  (merged to 'next' on 2022-11-08 at 42e164b490)
 + sparse-checkout.txt: new document with sparse-checkout directions

 Design doc.

 Needs review.
 source: <pull.1367.v4.git.1667714666810.gitgitgadget@gmail.com>


* pw/test-todo (2022-10-06) 3 commits
 . test_todo: allow [verbose] test as the command
 . test_todo: allow [!] grep as the command
 . tests: add test_todo() to mark known breakages

 RFC for test framework improvement.

 Needs review.
 source: <pull.1374.git.1665068476.gitgitgadget@gmail.com>


* ab/coccicheck-incremental (2022-11-02) 13 commits
  (merged to 'next' on 2022-11-08 at 0f3c55d4c2)
 + spatchcache: add a ccache-alike for "spatch"
 + cocci: run against a generated ALL.cocci
 + cocci rules: remove <id>'s from rules that don't need them
 + Makefile: copy contrib/coccinelle/*.cocci to build/
 + cocci: optimistically use COMPUTE_HEADER_DEPENDENCIES
 + cocci: make "coccicheck" rule incremental
 + cocci: split off "--all-includes" from SPATCH_FLAGS
 + cocci: split off include-less "tests" from SPATCH_FLAGS
 + Makefile: split off SPATCH_BATCH_SIZE comment from "cocci" heading
 + Makefile: have "coccicheck" re-run if flags change
 + Makefile: add ability to TAB-complete cocci *.patch rules
 + cocci rules: remove unused "F" metavariable from pending rule
 + Makefile + shared.mak: rename and indent $(QUIET_SPATCH_T)

 "make coccicheck" is time consuming. It has been made to run more
 incrementally.

 Will cook in 'next'.
 source: <cover-v5-00.13-00000000000-20221101T222616Z-avarab@gmail.com>
