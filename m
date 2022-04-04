Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E7FC4708C
	for <git@archiver.kernel.org>; Mon,  4 Apr 2022 21:23:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379681AbiDDVUf (ORCPT <rfc822;git@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380668AbiDDUzI (ORCPT <rfc822;git@vger.kernel.org>);
        Mon, 4 Apr 2022 16:55:08 -0400
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF8782D1F3
        for <git@vger.kernel.org>; Mon,  4 Apr 2022 13:53:08 -0700 (PDT)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 60E3D18EB6E;
        Mon,  4 Apr 2022 16:53:08 -0400 (EDT)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to
        :subject:date:message-id:mime-version:content-type; s=sasl; bh=U
        UfftsWG0uYwEEIM1DCMwHyMC2BWf0nM0kfMcgFfOtc=; b=FjA0rcqAFlA8ilLTI
        zQjgcEoVa12vdVZZ1KFQWsvBaAdZFKQxoFQf4Pxe5XqUzDDynJ/A2ZKYkiMZA1lQ
        rKO8DmNlH743ITmNLrpPKtRjpHdGrPBSogMsbYlqUMeLbGimNwoQUFwjPs8NVR8T
        Y7iwAi94mh+cJPneApBs4NwqqA=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 58E2618EB6D;
        Mon,  4 Apr 2022 16:53:08 -0400 (EDT)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [35.227.145.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 93C4D18EB6B;
        Mon,  4 Apr 2022 16:53:05 -0400 (EDT)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Apr 2022, #01; Mon, 4)
X-master-at: faa21c10d44184f616d391c158dcbb13b9c72ef3
X-next-at: 7b1312e21f5434e68922e4ff5aaf1a65af811c8e
Date:   Mon, 04 Apr 2022 13:53:04 -0700
Message-ID: <xmqqilropo3z.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID: 39C8C492-B459-11EC-ADA8-CBA7845BAAA9-77302942!pb-smtp21.pobox.com
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Here are the topics that have been cooking in my tree.  Commits
prefixed with '+' are in 'next' (being in 'next' is a sign that a
topic is stable enough to be used and are candidate to be in a
future release).  Commits prefixed with '-' are only in 'seen',
which means nothing more than that I have found them of interest for
some reason (like "it may have hard-to-resolve conflicts with
another topic already in flight" or "this may turn out to be
useful").  Do not read too much into a topic being in (or not in)
'seen'.  The ones marked with '.' do not appear in any of the
integration branches, but I am still holding onto them.

Git 2.36-rc0 preview release has been tagged.  Topics not in 'next'
as of today will need to wait until the next cycle, while we all
shift our attention to finding and fixing regressions in what has
already been merged for the upcoming release.

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
[New Topics]

* ab/misc-cleanup (2022-04-01) 6 commits
  (merged to 'next' on 2022-04-04 at c5fb674865)
 + alloc.[ch]: remove alloc_report() function
 + object-store.h: remove unused has_sha1_file*()
 + pack-bitmap-write: remove unused bitmap_reset() function
 + xdiff/xmacros.h: remove unused XDL_PTRFREE
 + configure.ac: remove USE_PIC comment
 + run-command.h: remove always unused "clean_on_exit_handler_cbdata"

 Code clean-up.

 Will merge to 'master'.
 source: <cover-v4-0.6-00000000000-20220331T014349Z-avarab@gmail.com>


* gf/shorthand-version-and-help (2022-03-31) 1 commit
 - cli: add -v and -h shorthands

 "git -v" and "git -h" are now understood as "git --version" and
 "git --help".

 Will merge to 'next'?
 source: <20220331212709.36036-1-garrit@slashdev.space>


* ea/progress-partial-blame (2022-04-03) 1 commit
 - blame: report correct number of lines in progress when using ranges

 The progress meter of "git blame" was showing incorrect numbers
 when processing only parts of the file.

 Will merge to 'next'.
 source: <20220403165038.52803-1-eantoranz@gmail.com>

--------------------------------------------------
[Graduated to 'master']

* ab/hook-tests-updates (2022-03-17) 13 commits
  (merged to 'next' on 2022-03-23 at 8c35279100)
 + http tests: use "test_hook" for "smart" and "dumb" http tests
 + proc-receive hook tests: use "test_hook" instead of "write_script"
 + tests: extend "test_hook" for "rm" and "chmod -x", convert "$HOOK"
 + tests: use "test_hook" for misc "mkdir -p" and "chmod" cases
 + tests: change "mkdir -p && write_script" to use "test_hook"
 + tests: change "cat && chmod +x" to use "test_hook"
 + gc + p4 tests: use "test_hook", remove sub-shells
 + fetch+push tests: use "test_hook" and "test_when_finished" pattern
 + bugreport tests: tighten up "git bugreport -s hooks" test
 + tests: assume the hooks are disabled by default
 + http tests: don't rely on "hook/post-update.sample"
 + hook tests: turn exit code assertions into a loop
 + test-lib-functions: add and use a "test_hook" wrapper

 Update tests around the use of hook scripts.
 source: <cover-v3-00.13-00000000000-20220317T100820Z-avarab@gmail.com>


* ab/make-optim-noop (2022-03-21) 1 commit
  (merged to 'next' on 2022-03-23 at ea8e0bdc37)
 + Makefile: use ' ', not non-existing $(wspfx_SQ)

 A micro fix to a topic earlier merged to 'master'
 source: <patch-1.1-05949221e3f-20220319T002715Z-avarab@gmail.com>


* ab/racy-hooks (2022-03-23) 1 commit
  (merged to 'next' on 2022-03-24 at 7c7d902a7c)
 + hooks: fix "invoked hook" regression in a8cc5943338

 Regression fix.
 source: <patch-1.1-d0c9b430b2c-20220321T230933Z-avarab@gmail.com>


* ab/reflog-parse-options (2022-03-28) 9 commits
  (merged to 'next' on 2022-03-29 at deb966122b)
 + reflog: fix 'show' subcommand's argv
  (merged to 'next' on 2022-03-25 at 1f18ebad35)
 + reflog [show]: display sensible -h output
 + reflog: convert to parse_options() API
 + reflog exists: use parse_options() API
 + git reflog [expire|delete]: make -h output consistent with SYNOPSIS
 + reflog: move "usage" variables and use macros
 + reflog tests: add missing "git reflog exists" tests
 + reflog: refactor cmd_reflog() to "if" branches
 + reflog.c: indent argument lists

 "git reflog" command now uses parse-options API to parse its
 command line options.
 source: <cover-0.8-00000000000-20220317T180439Z-avarab@gmail.com>


* ab/reftable-aix-xlc-12 (2022-03-28) 1 commit
  (merged to 'next' on 2022-03-29 at 1d4f13e637)
 + reftable: make assignments portable to AIX xlc v12.01

 Work around AIX C compiler that does not seem to grok
 initialization of a union member of a struct.
 source: <patch-1.1-98267695418-20220328T190642Z-avarab@gmail.com>


* ab/test-tap-fix-for-immediate (2022-03-24) 1 commit
  (merged to 'next' on 2022-03-25 at 1b83c01d99)
 + test-lib: have --immediate emit valid TAP on failure

 Fix test framework a bit.
 source: <patch-1.1-47b236139e6-20220323T204410Z-avarab@gmail.com>


* dp/worktree-repair-in-usage (2022-03-29) 1 commit
  (merged to 'next' on 2022-03-30 at 9bc0b72b96)
 + worktree: include repair cmd in usage

 Usage string fix.
 source: <e0bfbfd5320edad29d20bef5e4eab2750bc3016c.1648500426.git.gitgitgadget@gmail.com>


* ds/partial-bundle-more (2022-03-28) 6 commits
  (merged to 'next' on 2022-03-29 at fa892bdc2a)
 + pack-objects: lazily set up "struct rev_info", don't leak
 + bundle: output hash information in 'verify'
 + bundle: move capabilities to end of 'verify'
 + pack-objects: parse --filter directly into revs.filter
 + pack-objects: move revs out of get_object_list()
 + list-objects-filter: remove CL_ARG__FILTER
 (this branch is used by ab/plug-leak-in-revisions.)

 Code clean-up.
 source: <pull.1186.git.1647970119.gitgitgadget@gmail.com>


* ds/t7700-kept-pack-test (2022-03-25) 2 commits
  (merged to 'next' on 2022-03-29 at fb03a86974)
 + test-lib-functions: remove test_subcommand_inexact
 + t7700: check post-condition in kept-pack test

 Test clean-up.
 source: <pull.1185.v3.git.1648234967.gitgitgadget@gmail.com>


* gc/branch-recurse-submodules-fix (2022-03-31) 7 commits
  (merged to 'next' on 2022-04-01 at 6cb0c300e4)
 + branch.c: simplify advice-and-die sequence
 + branch: rework comments for future developers
 + Merge branch 'ab/usage-die-message' into gc/branch-recurse-submodules-fix
  (merged to 'next' on 2022-03-30 at 7123078bae)
 + branch: remove negative exit code
 + branch --set-upstream-to: be consistent when advising
 + branch: give submodule updating advice before exit
 + branch: support more tracking modes when recursing

 A handful of obvious clean-ups around a topic that is already in
 'master'.
 source: <pull.1190.git.1648584079.gitgitgadget@gmail.com>


* gc/submodule-update-part2 (2022-03-16) 8 commits
  (merged to 'next' on 2022-03-29 at 17ffb55048)
 + submodule--helper: remove forward declaration
 + submodule: move core cmd_update() logic to C
 + submodule--helper: reduce logic in run_update_procedure()
 + submodule--helper: teach update_data more options
 + builtin/submodule--helper.c: rename option struct to "opt"
 + submodule update: use die_message()
 + submodule--helper: run update using child process struct
 + Merge branch 'gc/submodule-update-part1' into gc/submodule-update-part2

 Move more "git submodule update" to C.
 source: <20220315210925.79289-1-chooglen@google.com>


* jc/coding-guidelines-decl-in-for-loop (2022-03-31) 1 commit
  (merged to 'next' on 2022-04-01 at aa0ea645b8)
 + CodingGuidelines: give deadline for "for (int i = 0; ..."

 Coding Guidelines clarification.
 source: <xmqqy20r3rv7.fsf@gitster.g>


* jc/mailsplit-warn-on-tty (2022-03-03) 1 commit
  (merged to 'next' on 2022-04-01 at e2052fb920)
 + am/apply: warn if we end up reading patches from terminal

 "git am" can read from the standard input when no mailbox is given
 on the command line, but the end-user gets no indication when it
 happens, making Git appear stuck.
 source: <xmqqlexq8zqo.fsf@gitster.g>


* jd/prompt-upstream-mark (2022-03-23) 4 commits
  (merged to 'next' on 2022-03-23 at 518404a091)
 + git-prompt: put upstream comments together
 + git-prompt: make long upstream state indicator consistent
 + git-prompt: make upstream state indicator location consistent
 + git-prompt: rename `upstream` to `upstream_type`

 Tweaks in the command line prompt (in contrib/) code around its
 GIT_PS1_SHOWUPSTREAM feature.
 source: <pull.1162.v2.git.1645991832.gitgitgadget@gmail.com>


* jh/builtin-fsmonitor-part2 (2022-03-25) 30 commits
  (merged to 'next' on 2022-04-01 at 72cda55cde)
 + t7527: test status with untracked-cache and fsmonitor--daemon
 + fsmonitor: force update index after large responses
 + fsmonitor--daemon: use a cookie file to sync with file system
 + fsmonitor--daemon: periodically truncate list of modified files
 + t/perf/p7519: add fsmonitor--daemon test cases
 + t/perf/p7519: speed up test on Windows
 + t/perf/p7519: fix coding style
 + t/helper/test-chmtime: skip directories on Windows
 + t/perf: avoid copying builtin fsmonitor files into test repo
 + t7527: create test for fsmonitor--daemon
 + t/helper/fsmonitor-client: create IPC client to talk to FSMonitor Daemon
 + help: include fsmonitor--daemon feature flag in version info
 + fsmonitor--daemon: implement handle_client callback
 + compat/fsmonitor/fsm-listen-darwin: implement FSEvent listener on MacOS
 + compat/fsmonitor/fsm-listen-darwin: add MacOS header files for FSEvent
 + compat/fsmonitor/fsm-listen-win32: implement FSMonitor backend on Windows
 + fsmonitor--daemon: create token-based changed path cache
 + fsmonitor--daemon: define token-ids
 + fsmonitor--daemon: add pathname classification
 + fsmonitor--daemon: implement 'start' command
 + fsmonitor--daemon: implement 'run' command
 + compat/fsmonitor/fsm-listen-darwin: stub in backend for Darwin
 + compat/fsmonitor/fsm-listen-win32: stub in backend for Windows
 + fsmonitor--daemon: implement 'stop' and 'status' commands
 + fsmonitor--daemon: add a built-in fsmonitor daemon
 + fsmonitor: document builtin fsmonitor
 + fsmonitor: use IPC to query the builtin FSMonitor daemon
 + fsmonitor: config settings are repository-specific
 + fsmonitor-ipc: create client routines for git-fsmonitor--daemon
 + fsmonitor: enhance existing comments, clarify trivial response handling
 (this branch is used by jh/builtin-fsmonitor-part3.)

 Built-in fsmonitor (part 2).
 source: <pull.1041.v9.git.1648231393.gitgitgadget@gmail.com>


* ns/core-fsyncmethod (2022-03-30) 2 commits
  (merged to 'next' on 2022-03-30 at 7280eb6f4e)
 + core.fsyncmethod: correctly camel-case warning message
 + core.fsync: fix incorrect expression for default configuration
 (this branch is used by ns/batch-fsync.)

 A couple of fix-up to a topic that is now in 'master'.
 source: <pull.1193.git.1648663716891.gitgitgadget@gmail.com>


* ns/fsync-or-die-message-fix (2022-03-30) 1 commit
  (merged to 'next' on 2022-03-30 at 9de1909e71)
 + object-file: pass filename to fsync_or_die

 When creating a loose object file, we didn't report the exact
 filename of the file we failed to fsync, even though the
 information was readily available, which has been corrected.
 source: <pull.1194.git.1648664055986.gitgitgadget@gmail.com>


* ns/trace2-fsync-stat (2022-03-30) 1 commit
  (merged to 'next' on 2022-03-30 at e7900f9b5a)
 + trace2: add stats for fsync operations

 Trace2 code has been taught to report stats for fsync operations.
 source: <pull.1192.git.1648616800529.gitgitgadget@gmail.com>


* pw/add-p-single-key (2022-03-16) 5 commits
  (merged to 'next' on 2022-03-23 at a00396d9a1)
 + terminal: restore settings on SIGTSTP
 + terminal: work around macos poll() bug
 + terminal: don't assume stdin is /dev/tty
 + terminal: use flags for save_term()
 + Merge branch 'pw/single-key-interactive' into pw/add-p-single-key

 Finishing touches to C rewrite of "git add -i" in single-key
 interactive mode.
 source: <20220316185405.29551-5-phillip.wood123@gmail.com>


* pw/worktree-list-with-z (2022-03-31) 1 commit
  (merged to 'next' on 2022-04-01 at 043549e5b0)
 + worktree: add -z option for list subcommand

 "git worktree list --porcelain" did not c-quote pathnames and lock
 reasons with unsafe bytes correctly, which is worked around by
 introducing NUL terminated output format with "-z".
 source: <pull.1164.v2.git.1648743688825.gitgitgadget@gmail.com>


* rc/fetch-refetch (2022-03-28) 7 commits
  (merged to 'next' on 2022-04-01 at 5a994891e1)
 + docs: mention --refetch fetch option
 + fetch: after refetch, encourage auto gc repacking
 + t5615-partial-clone: add test for fetch --refetch
 + fetch: add --refetch option
 + builtin/fetch-pack: add --refetch option
 + fetch-pack: add refetch
 + fetch-negotiator: add specific noop initializer

 "git fetch --refetch" learned to fetch everything without telling
 the other side what we already have, which is useful when you
 cannot trust what you have in the local object store.
 source: <pull.1138.v4.git.1648476131.gitgitgadget@gmail.com>


* tk/ambiguous-fetch-refspec (2022-04-01) 1 commit
  (merged to 'next' on 2022-04-01 at 2b55db0a4a)
 + tracking branches: add advice to ambiguous refspec error

 Give hint when branch tracking cannot be established because fetch
 refspecs from multiple remote repositories overlap.
 source: <pull.1183.v7.git.1648793113943.gitgitgadget@gmail.com>


* tl/ls-tree-oid-only (2022-03-23) 15 commits
  (merged to 'next' on 2022-03-29 at cfa87a57e7)
 + ls-tree: split up "fast path" callbacks
 + ls-tree: detect and error on --name-only --name-status
 + ls-tree: support --object-only option for "git-ls-tree"
 + ls-tree: introduce "--format" option
 + cocci: allow padding with `strbuf_addf()`
 + ls-tree: introduce struct "show_tree_data"
 + ls-tree: slightly refactor `show_tree()`
 + ls-tree: fix "--name-only" and "--long" combined use bug
 + ls-tree: simplify nesting if/else logic in "show_tree()"
 + ls-tree: rename "retval" to "recurse" in "show_tree()"
 + ls-tree: use "size_t", not "int" for "struct strbuf"'s "len"
 + ls-tree: use "enum object_type", not {blob,tree,commit}_type
 + ls-tree: add missing braces to "else" arms
 + ls-tree: remove commented-out code
 + ls-tree tests: add tests for --name-status

 "git ls-tree" learns "--oid-only" option, similar to "--name-only",
 and more generalized "--format" option.
 source: <cover.1648026472.git.dyroneteng@gmail.com>


* vd/mv-refresh-stat (2022-03-29) 1 commit
  (merged to 'next' on 2022-04-01 at b54225c97b)
 + mv: refresh stat info for moved entry

 "git mv" failed to refresh the cached stat information for the
 entry it moved.
 source: <pull.1187.v2.git.1648516027925.gitgitgadget@gmail.com>


* vd/stash-silence-reset (2022-03-24) 9 commits
  (merged to 'next' on 2022-03-24 at 94218f2a5f)
 + reset: show --no-refresh in the short-help
  (merged to 'next' on 2022-03-23 at 932f4f6529)
 + reset: remove 'reset.refresh' config option
 + reset: remove 'reset.quiet' config option
 + reset: do not make '--quiet' disable index refresh
  (merged to 'next' on 2022-03-17 at c469159b61)
 + stash: make internal resets quiet and refresh index
 + reset: suppress '--no-refresh' advice if logging is silenced
 + reset: replace '--quiet' with '--no-refresh' in performance advice
 + reset: introduce --[no-]refresh option to --mixed
 + reset: revise index refresh advice

 "git stash" does not allow subcommands it internally runs as its
 implementation detail, except for "git reset", to emit messages;
 now "git reset" part has also been squelched.
 source: <pull.1170.v3.git.1647308982.gitgitgadget@gmail.com>

--------------------------------------------------
[Stalled]

* dl/prompt-pick-fix (2022-03-25) 1 commit
 - git-prompt: fix sequencer/todo detection

 Fix shell prompt script (in contrib/) for those who set
 rebase.abbreviateCommands; we failed to recognize that we were in a
 multi-step cherry-pick session.

 Is this even needed?  How?
 cf. <xmqqwngdzque.fsf@gitster.g>
 source: <20220325145301.3370-1-danny0838@gmail.com>


* es/superproject-aware-submodules (2022-03-09) 3 commits
 . rev-parse: short-circuit superproject worktree when config unset
 . introduce submodule.hasSuperproject record
 . t7400-submodule-basic: modernize inspect() helper

 A configuration variable in a repository tells if it is (or is not)
 a submodule of a superproject.

 Expecting a reroll.
 cf. <kl6l4k45s7cb.fsf@chooglen-macbookpro.roam.corp.google.com>
 source: <20220310004423.2627181-1-emilyshaffer@google.com>


* cw/remote-object-info (2022-03-30) 5 commits
 . fixup! transfer.advertiseObjectInfo: add object-info config
 . fixup! object-info: add option for retrieving object info
 . object-info: add option for retrieving object info
 . transfer.advertiseObjectInfo: add object-info config
 . fetch-pack: refactor packet writing and fetch options

 Attempt to add a client component to talk with object-info
 endpoint.

 Expecting a reroll.
 source: <20220328191112.3092139-1-calvinwan@google.com>


--------------------------------------------------
[Cooking]

* ab/plug-leak-in-revisions (2022-04-03) 28 commits
 - revisions API: add a TODO for diff_free(&revs->diffopt)
 - revisions API: have release_revisions() release "topo_walk_info"
 - revisions API: have release_revisions() release "date_mode"
 - revisions API: call diff_free(&revs->pruning) in revisions_release()
 - revisions API: release "reflog_info" in release revisions()
 - revisions API: clear "boundary_commits" in release_revisions()
 - revisions API: have release_revisions() release "prune_data"
 - revisions API: have release_revisions() release "grep_filter"
 - revisions API: have release_revisions() release "filter"
 - revisions API: have release_revisions() release "cmdline"
 - revisions API: have release_revisions() release "mailmap"
 - revisions API: have release_revisions() release "commits"
 - revisions API users: use release_revisions() for "prune_data" users
 - revisions API users: use release_revisions() with UNLEAK()
 - revisions API users: use release_revisions() in builtin/log.c
 - revisions API users: use release_revisions() in http-push.c
 - revisions API users: add "goto cleanup" for release_revisions()
 - stash: always have the owner of "stash_info" free it
 - revisions API users: use release_revisions() needing REV_INFO_INIT
 - revision.[ch]: document and move code declared around "init"
 - revisions API users: add straightforward release_revisions()
 - revision.[ch]: provide and start using a release_revisions()
 - cocci: add and apply free_commit_list() rules
 - format-patch: don't leak "extra_headers" or "ref_message_ids"
 - string_list API users: use string_list_init_{no,}dup
 - blame: use "goto cleanup" for cleanup_scoreboard()
 - t/helper/test-fast-rebase.c: don't leak "struct strbuf"
 - Merge branch 'ds/partial-bundle-more' into ab/plug-leak-in-revisions

 Plug the memory leaks from the trickiest API of all, the revision
 walker.
 source: <cover-v5-00.27-00000000000-20220402T102002Z-avarab@gmail.com>


* ab/ci-github-workflow-markup (2022-03-27) 7 commits
 - ci: call `finalize_test_case_output` a little later
 - ci: use `--github-workflow-markup` in the GitHub workflow
 - ci: optionally mark up output in the GitHub workflow
 - test(junit): avoid line feeds in XML attributes
 - tests: refactor --write-junit-xml code
 - ci: make it easier to find failed tests' logs in the GitHub workflow
 - Merge branch 'ab/ci-setup-simplify' into ab/ci-github-workflow-markup
 (this branch uses ab/ci-setup-simplify.)

 Build a moral equivalent of js/ci-github-workflow-markup on top of
 ab/ci-setup-simplify.

 Waiting for discussion to settle.
 source: <RFC-cover-v3-0.6-00000000000-20220325T183946Z-avarab@gmail.com>


* ab/ci-setup-simplify (2022-03-27) 25 commits
 - CI: don't use "set -x" in "ci/lib.sh" output
 - CI: set PYTHON_PATH setting for osx-{clang,gcc} into "$jobname" case
 - CI: set CC in MAKEFLAGS directly, don't add it to the environment
 - CI: add more variables to MAKEFLAGS, except under vs-build
 - CI: narrow down variable definitions in --build and --test
 - CI: only invoke ci/lib.sh as "steps" in main.yml
 - CI: pre-select test slice in Windows & VS tests
 - ci/run-test-slice.sh: replace shelling out with "echo"
 - CI: move "env" definitions into ci/lib.sh
 - CI: combine ci/install{,-docker}-dependencies.sh
 - CI: split up and reduce "ci/test-documentation.sh"
 - CI: invoke "make artifacts-tar" directly in windows-build
 - CI: check ignored unignored build artifacts in "win[+VS] build" too
 - CI: remove "run-build-and-tests.sh", run "make [test]" directly
 - CI: export variables via a wrapper
 - CI: consistently use "export" in ci/lib.sh
 - CI: move p4 and git-lfs variables to ci/install-dependencies.sh
 - CI: have "static-analysis" run "check-builtins", not "documentation"
 - CI: have "static-analysis" run a "make ci-static-analysis" target
 - CI: don't have "git grep" invoke a pager in tree content check
 - CI: remove unused Azure ci/* code
 - CI: remove dead "tree skipping" code
 - CI: remove more dead Travis CI support
 - CI: make "$jobname" explicit, remove fallback
 - CI: run "set -ex" early in ci/lib.sh
 (this branch is used by ab/ci-github-workflow-markup.)

 Drive more actions done in CI via the Makefile instead of shell
 commands sprinkled in .github/workflows/main.yml

 Waiting for discussion to settle.
 source: <cover-v2-00.25-00000000000-20220325T182534Z-avarab@gmail.com>


* kf/p4-multiple-remotes (2022-03-21) 1 commit
 - git-p4: fix issue with multiple perforce remotes

 Needs review.
 source: <pull.1180.git.1647866603032.gitgitgadget@gmail.com>


* fr/vimdiff-layout (2022-04-03) 4 commits
  (merged to 'next' on 2022-04-04 at 5d1c8197d0)
 + mergetools: add description to all diff/merge tools
 + vimdiff: add tool documentation
 + vimdiff: integrate layout tests in the unit tests framework ('t' folder)
 + vimdiff: new implementation with layout support

 Reimplement "vimdiff[123]" mergetool drivers with a more generic
 layout mechanism.

 Will merge to 'master'.
 source: <20220330191909.294610-1-greenfoo@u92.eu>


* bc/stash-export (2022-04-03) 4 commits
 - builtin/stash: provide a way to import stashes from a ref
 - builtin/stash: provide a way to export stashes to a ref
 - builtin/stash: factor out revision parsing into a function
 - object-name: make get_oid quietly return an error

 A mechanism to export and import stash entries to and from a normal
 commit to transfer it across repositories has been introduced.

 Will merge to 'next'?
 source: <20220403182250.904933-1-sandals@crustytoothpaste.net>


* ns/batch-fsync (2022-03-30) 14 commits
 - core.fsyncmethod: performance tests for batch mode
 - t/perf: add iteration setup mechanism to perf-lib
 - core.fsyncmethod: tests for batch mode
 - test-lib-functions: add parsing helpers for ls-files and ls-tree
 - core.fsync: use batch mode and sync loose objects by default on Windows
 - unpack-objects: use the bulk-checkin infrastructure
 - update-index: use the bulk-checkin infrastructure
 - builtin/add: add ODB transaction around add_files_to_cache
 - cache-tree: use ODB transaction around writing a tree
 - core.fsyncmethod: batched disk flushes for loose-objects
 - object-file: pass filename to fsync_or_die
 - bulk-checkin: rebrand plug/unplug APIs as 'odb transactions'
 - bulk-checkin: rename 'state' variable and separate 'plugged' boolean
 - Merge branch 'ns/core-fsyncmethod' into ns/batch-fsync

 Introduce a filesystem-dependent mechanism to optimize the way the
 bits for many loose object files are ensured to hit the disk
 platter.

 Will merge to 'next'?
 source: <pull.1134.v5.git.1648616734.gitgitgadget@gmail.com>


* en/sparse-cone-becomes-default (2022-03-13) 9 commits
 - Documentation: some sparsity wording clarifications
 - git-sparse-checkout.txt: mark non-cone mode as deprecated
 - git-sparse-checkout.txt: flesh out non-cone mode pattern discussion a bit
 - git-sparse-checkout.txt: add a new EXAMPLES section
 - git-sparse-checkout.txt: shuffle some sections and mark as internal
 - git-sparse-checkout.txt: update docs for deprecation of 'init'
 - git-sparse-checkout.txt: wording updates for the cone mode default
 - sparse-checkout: make --cone the default
 - tests: stop assuming --no-cone is the default mode for sparse-checkout

 source: <pull.1148.v2.git.1647054681.gitgitgadget@gmail.com>


* tb/cruft-packs (2022-03-02) 17 commits
 - sha1-file.c: don't freshen cruft packs
 - builtin/gc.c: conditionally avoid pruning objects via loose
 - builtin/repack.c: add cruft packs to MIDX during geometric repack
 - builtin/repack.c: use named flags for existing_packs
 - builtin/repack.c: allow configuring cruft pack generation
 - builtin/repack.c: support generating a cruft pack
 - builtin/pack-objects.c: --cruft with expiration
 - reachable: report precise timestamps from objects in cruft packs
 - reachable: add options to add_unseen_recent_objects_to_traversal
 - builtin/pack-objects.c: --cruft without expiration
 - builtin/pack-objects.c: return from create_object_entry()
 - t/helper: add 'pack-mtimes' test-tool
 - pack-mtimes: support writing pack .mtimes files
 - chunk-format.h: extract oid_version()
 - pack-write: pass 'struct packing_data' to 'stage_tmp_packfiles'
 - pack-mtimes: support reading .mtimes files
 - Documentation/technical: add cruft-packs.txt

 A mechanism to pack unreachable objects into a "cruft pack",
 instead of ejecting them into loose form to be reclaimed later, has
 been introduced.

 Waiting for discussion to settle.
 cf. <YiZI99yeijQe5Jaq@google.com>
 source: <cover.1646266835.git.me@ttaylorr.com>


* js/ci-github-workflow-markup (2022-03-01) 9 commits
 . ci: call `finalize_test_case_output` a little later
 . ci: use `--github-workflow-markup` in the GitHub workflow
 . ci: optionally mark up output in the GitHub workflow
 . test(junit): avoid line feeds in XML attributes
 . tests: refactor --write-junit-xml code
 . ci/run-build-and-tests: add some structure to the GitHub workflow output
 . ci: make it easier to find failed tests' logs in the GitHub workflow
 . ci/run-build-and-tests: take a more high-level view
 . ci: fix code style

 Update the GitHub workflow support to make it quicker to get to the
 failing test.

 Waiting for discussion to settle.
 cf. <220309.86tuc6lwpj.gmgdl@evledraar.gmail.com>
 cf. <220302.86mti87cj2.gmgdl@evledraar.gmail.com>
 cf. <30dbc8fb-a1db-05bc-3dcb-070e11cf4715@gmail.com>
 source: <pull.1117.v2.git.1646130289.gitgitgadget@gmail.com>


* et/xdiff-indirection (2022-02-17) 1 commit
 - xdiff: provide indirection to git functions

 Insert a layer of preprocessor macros for common functions in xdiff
 codebase.

 Expecting a reroll.
 cf. <xmqqbkyudb8n.fsf@gitster.g>
 source: <20220217225408.GB7@edef91d97c94>


* ab/http-gcc-12-workaround (2022-03-25) 1 commit
 - http API: fix dangling pointer issue noted by GCC 12.0

 Work around false warning pre-release of GCC 12.
 source: <patch-v3-1.1-69190804c67-20220325T143322Z-avarab@gmail.com>


* tk/simple-autosetupmerge (2022-02-25) 2 commits
 - t3200: tests for new branch.autosetupmerge option "simple"
 - merge: new autosetupmerge option 'simple' for matching branches

 "git -c branch.autosetupmerge=simple branch $A $B" will set the $B
 as $A's upstream only when $A and $B shares the same name, and "git
 -c push.default=simple" on branch $A would push to update the
 branch $A at the remote $B came from.

 Needs review.
 source: <pull.1161.v2.git.1645815142.gitgitgadget@gmail.com>


* tk/untracked-cache-with-uall (2022-04-01) 2 commits
  (merged to 'next' on 2022-04-04 at 2e11f1ac0c)
 + untracked-cache: support '--untracked-files=all' if configured
 + untracked-cache: test untracked-cache-bypassing behavior with -uall

 The performance of the "untracked cache" feature has been improved
 when "--untracked-files=<mode>" and "status.showUntrackedFiles"
 are combined.

 Will merge to 'master'.
 source: <pull.985.v6.git.1648742535.gitgitgadget@gmail.com>


* ab/commit-plug-leaks (2022-02-16) 2 commits
 - commit: use strbuf_release() instead of UNLEAK()
 - commit: fix "author_ident" leak

 Leakfixes in the top-level called-once function.

 Expecting a reroll.
 I think UNLEAK->strbuf_release() is a regression.
 source: <cover-0.2-00000000000-20220216T081844Z-avarab@gmail.com>


* jh/builtin-fsmonitor-part3 (2022-03-25) 28 commits
 - t7527: test Unicode NFC/NFD handling on MacOS
 - t/lib-unicode-nfc-nfd: helper prereqs for testing unicode nfc/nfd
 - fsmonitor: on macOS also emit NFC spelling for NFD pathname
 - t7527: test FSMonitor on case insensitive+preserving file system
 - fsmonitor: never set CE_FSMONITOR_VALID on submodules
 - t/perf/p7527: add perf test for builtin FSMonitor
 - t7527: FSMonitor tests for directory moves
 - fsmonitor: optimize processing of directory events
 - fsm-listen-darwin: shutdown daemon if worktree root is moved/renamed
 - fsm-health-win32: force shutdown daemon if worktree root moves
 - fsm-health-win32: add polling framework to monitor daemon health
 - fsmonitor--daemon: stub in health thread
 - fsmonitor--daemon: rename listener thread related variables
 - fsmonitor--daemon: prepare for adding health thread
 - fsmonitor--daemon: cd out of worktree root
 - fsm-listen-darwin: ignore FSEvents caused by xattr changes on macOS
 - unpack-trees: initialize fsmonitor_has_run_once in o->result
 - fsmonitor-settings: NTFS and FAT32 on MacOS are incompatible
 - fsmonitor-settings: remote repos on Windows are incompatible
 - fsmonitor-settings: remote repos on macOS are incompatible
 - fsmonitor-settings: stub in macOS-specific incompatibility checking
 - fsmonitor-settings: VFS for Git virtual repos are incompatible
 - fsmonitor-settings: stub in Win32-specific incompatibility checking
 - fsmonitor-settings: bare repos are incompatible with FSMonitor
 - t/helper/fsmonitor-client: create stress test
 - t7527: test FSMonitor on repos with Unicode root paths
 - fsm-listen-win32: handle shortnames
 - Merge branch 'jh/builtin-fsmonitor-part2' into jh/builtin-fsmonitor-part3

 More fsmonitor--daemon.
 source: <pull.1143.v4.git.1648140680.gitgitgadget@gmail.com>


* js/bisect-in-c (2022-02-23) 14 commits
 - bisect: no longer try to clean up left-over `.git/head-name` files
 - bisect: remove Cogito-related code
 - bisect: turn `git bisect` into a full built-in
 - bisect: move even the option parsing to `bisect--helper`
 - bisect--helper: return only correct exit codes in `cmd_*()`
 - bisect--helper: move the `BISECT_STATE` case to the end
 - bisect--helper: make `--bisect-state` optional
 - bisect--helper: align the sub-command order with git-bisect.sh
 - bisect--helper: using `--bisect-state` without an argument is a bug
 - bisect--helper: really retire `--bisect-autostart`
 - bisect--helper: really retire --bisect-next-check
 - bisect--helper: retire the --no-log option
 - bisect: avoid double-quoting when printing the failed command
 - bisect run: fix the error message

 Final bits of "git bisect.sh" have been rewritten in C.

 Expecting a reroll.
 cf. <220225.86ilt27uln.gmgdl@evledraar.gmail.com>
 source: <pull.1132.v2.git.1645547423.gitgitgadget@gmail.com>


* js/scalar-diagnose (2022-02-06) 6 commits
 - scalar: teach `diagnose` to gather loose objects information
 - scalar: teach `diagnose` to gather packfile info
 - scalar diagnose: include disk space information
 - scalar: add `diagnose`
 - scalar: validate the optional enlistment argument
 - archive: optionally add "virtual" files

 Implementation of "scalar diagnose" subcommand.

 On hold.
 cf. <nycvar.QRO.7.76.6.2203012353090.11118@tvgsbejvaqbjf.bet>
 source: <pull.1128.v2.git.1644187146.gitgitgadget@gmail.com>


* en/merge-tree (2022-02-23) 13 commits
 - git-merge-tree.txt: add a section on potentional usage mistakes
 - merge-tree: add a --allow-unrelated-histories flag
 - merge-tree: allow `ls-files -u` style info to be NUL terminated
 - merge-tree: provide easy access to `ls-files -u` style info
 - merge-tree: provide a list of which files have conflicts
 - merge-ort: provide a merge_get_conflicted_files() helper function
 - merge-tree: support including merge messages in output
 - merge-ort: split out a separate display_update_messages() function
 - merge-tree: implement real merges
 - merge-tree: add option parsing and initial shell for real merge function
 - merge-tree: move logic for existing merge into new function
 - merge-tree: rename merge_trees() to trivial_merge_trees()
 - Merge branch 'en/remerge-diff' into en/merge-trees

 A new command is introduced that takes two commits and computes a
 tree that would be contained in the resulting merge commit, if the
 histories leading to these two commits were to be merged, and is
 added as a new mode of "git merge-tree" subcommand.

 On hold.
 cf. <CABPp-BGZ7OAYRR5YKRsxJSo-C=ho+qcNAkqwkim8CkhCfCeHsA@mail.gmail.com>
 source: <pull.1122.v6.git.1645602413.gitgitgadget@gmail.com>


* jh/p4-various-fixups (2022-04-01) 22 commits
  (merged to 'next' on 2022-04-04 at 251b14976f)
 + git-p4: sort imports
 + git-p4: seperate multiple statements onto seperate lines
 + git-p4: move inline comments to line above
 + git-p4: only seperate code blocks by a single empty line
 + git-p4: compare to singletons with "is" and "is not"
 + git-p4: normalize indentation of lines in conditionals
 + git-p4: ensure there is a single space around all operators
 + git-p4: ensure every comment has a single #
 + git-p4: remove spaces between dictionary keys and colons
 + git-p4: remove redundant backslash-continuations inside brackets
 + git-p4: remove extraneous spaces before function arguments
 + git-p4: place a single space after every comma
 + git-p4: removed brackets when assigning multiple return values
 + git-p4: remove spaces around default arguments
 + git-p4: remove padding from lists, tuples and function arguments
 + git-p4: sort and de-duplcate pylint disable list
 + git-p4: remove commented code
 + git-p4: convert descriptive class and function comments into docstrings
 + git-p4: improve consistency of docstring formatting
 + git-p4: indent with 4-spaces
 + git-p4: remove unneeded semicolons from statements
 + git-p4: add blank lines between functions and class definitions

 Various cleanups to "git p4".

 Will merge to 'master'.
 source: <20220401142504.58995-1-jholdsworth@nvidia.com>


* js/use-builtin-add-i (2021-12-01) 2 commits
 - add -i: default to the built-in implementation
 - t2016: require the PERL prereq only when necessary

 "git add -i" was rewritten in C some time ago and has been in
 testing; the reimplementation is now exposed to general public by
 default.

 On hold.

 What's the status of the "known breakage"?
 Are we ready to switch if we wanted to?
 There are known breakages on macOS.
 cf. <nycvar.QRO.7.76.6.2112021832060.63@tvgsbejvaqbjf.bet>
 source: <pull.1087.git.1638281655.gitgitgadget@gmail.com>
