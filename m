Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D61C433FE
	for <git@archiver.kernel.org>; Thu, 20 Oct 2022 01:36:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbiJTBg2 (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 19 Oct 2022 21:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231534AbiJTBgX (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 19 Oct 2022 21:36:23 -0400
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D31561402D
        for <git@vger.kernel.org>; Wed, 19 Oct 2022 18:36:03 -0700 (PDT)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id C922A1490FB;
        Wed, 19 Oct 2022 21:34:56 -0400 (EDT)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to
        :subject:date:message-id:mime-version:content-type; s=sasl; bh=X
        jZghwSAlb3ZgUpKfAXET5Srg8ZC0Dbp3eMo2xMw+2c=; b=RNe8Dtv/k/Z+eXzTX
        X+rfugrGwLzUu1mTGknao0zhOUhsB9uuxGhVRAqxKsmItPXqpYlv0upZue7dkVuH
        LfKShTyFfcRKs7NnA9YKMQzQDjcNCr+McceENlHuJF7iH/W3lxaIEKP5d/Dmt1Qj
        Z6/MDp6301ecZSIGM5mQDyDw4U=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id BF00D1490FA;
        Wed, 19 Oct 2022 21:34:56 -0400 (EDT)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [34.83.5.33])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 1DF171490F9;
        Wed, 19 Oct 2022 21:34:56 -0400 (EDT)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Oct 2022, #06; Wed, 19)
X-master-at: 45c9f05c44b1cb6bd2d6cb95a22cf5e3d21d5b63
X-next-at: 067f57bc4a4a1e57327341b80f3d3545eba4dbd2
Date:   Wed, 19 Oct 2022 18:34:55 -0700
Message-ID: <xmqq4jvznups.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID: 67078A9C-5017-11ED-B35C-2AEEC5D8090B-77302942!pb-smtp1.pobox.com
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Here are the topics that have been cooking in my tree.  Commits
prefixed with '+' are in 'next' (being in 'next' is a sign that a
topic is stable enough to be used and are candidate to be in a future
release).  Commits prefixed with '-' are only in 'seen', and aren't
considered "accepted" at all.  A topic without enough support may be
discarded after a long period of no activity.

Git 2.38.1 and friends that address a couple of CVE on maintenance
tracks have been released and they are all merged up to the
development branches.

Some topics outside 'next' have been expecting updates for too long
and we may want to discard them, unless they see some activities.

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

* ab/coding-guidelines-c99 (2022-10-11) 5 commits
  (merged to 'next' on 2022-10-13 at c6b2b74dfb)
 + CodingGuidelines: recommend against unportable C99 struct syntax
 + CodingGuidelines: mention C99 features we can't use
 + CodingGuidelines: allow declaring variables in for loops
 + CodingGuidelines: mention dynamic C99 initializer elements
 + CodingGuidelines: update for C99

 Update CodingGuidelines to clarify what features to use and avoid
 in C99.
 source: <20221010203800.2154698-1-gitster@pobox.com>


* jh/struct-zero-init-with-older-clang (2022-10-10) 1 commit
  (merged to 'next' on 2022-10-13 at 393abc3019)
 + config.mak.dev: disable suggest braces error on old clang versions

 Work around older clang that warns against C99 zero initialization
 syntax for struct.
 source: <pull.1375.v2.git.1665416340806.gitgitgadget@gmail.com>


* rs/archive-dedup-printf (2022-10-11) 1 commit
  (merged to 'next' on 2022-10-13 at af770cf00f)
 + archive: deduplicate verbose printing

 Code simplification.
 source: <af5611aa-8662-7508-4f00-7fcf4e9cbcc6@web.de>

--------------------------------------------------
[New Topics]

* jk/unused-anno-more (2022-10-17) 12 commits
 - ll-merge: mark unused parameters in callbacks
 - diffcore-pickaxe: mark unused parameters in pickaxe functions
 - convert: mark unused parameter in null stream filter
 - apply: mark unused parameters in noop error/warning routine
 - apply: mark unused parameters in handlers
 - date: mark unused parameters in handler functions
 - string-list: mark unused callback parameters
 - object-file: mark unused parameters in hash_unknown functions
 - mark unused parameters in trivial compat functions
 - update-index: drop unused argc from do_reupdate()
 - submodule--helper: drop unused argc from module_list_compute()
 - diffstat_consume(): assert non-zero length

 More UNUSED annotation to help using -Wunused option with the
 compiler.

 Will merge to 'next'.
 source: <Y036whEorZV0rOgB@coredump.intra.peff.net>


* tb/save-keep-pack-during-geometric-repack (2022-10-17) 1 commit
 - repack: don't remove .keep packs with `--pack-kept-objects`

 When geometric repacking feature is in use together with the
 --pack-kept-objects option, we lost packs marked with .keep files.

 Will merge to 'next'.
 source: <6a012cd625c1d197ede91c85299cbfb37adf356b.1666059872.git.me@ttaylorr.com>


* mm/git-pm-try-catch-syntax-fix (2022-10-17) 1 commit
 - Git.pm: add semicolon after catch statement

 Fix a longstanding syntax error in Git.pm error codepath.

 Will merge to 'next'??
 source: <20221016212236.12453-2-michael@mcclimon.org>


* ab/macos-build-fix-with-sha1dc (2022-10-19) 1 commit
  (merged to 'next' on 2022-10-19 at 408ce79f33)
 + fsmonitor OSX: compile with DC_SHA1=YesPlease

 Enable macOS build with sha1dc hash function.

 Will merge to 'master'.
 source: <patch-v2-1.4-392fabdb456-20221019T010222Z-avarab@gmail.com>


* jk/use-o0-in-leak-sanitizer (2022-10-19) 1 commit
  (merged to 'next' on 2022-10-19 at 27c2546b98)
 + Makefile: force -O0 when compiling with SANITIZE=leak

 Avoid false-positive from LSan whose assumption may be broken with
 higher optimization levels.

 Will merge to 'master'.
 source: <Y08JZVDgJpJvrBiz@coredump.intra.peff.net>


* jr/embargoed-releases-doc (2022-10-19) 1 commit
 - embargoed releases: also describe the git-security list and the process

 The role the security mailing list plays in an embargoed release
 has been documented.

 Will merge to 'next'?
 source: <pull.1345.v2.git.1666142160427.gitgitgadget@gmail.com>

--------------------------------------------------
[Stalled]

* ag/merge-strategies-in-c (2022-08-10) 14 commits
 - sequencer: use the "octopus" strategy without forking
 - sequencer: use the "resolve" strategy without forking
 - merge: use the "octopus" strategy without forking
 - merge: use the "resolve" strategy without forking
 - merge-octopus: rewrite in C
 - merge-recursive: move better_branch_name() to merge.c
 - merge-resolve: rewrite in C
 - merge-one-file: rewrite in C
 - update-index: move add_cacheinfo() to read-cache.c
 - merge-index: add a new way to invoke `git-merge-one-file'
 - merge-index: drop the index
 - merge-index: libify merge_one_path() and merge_all()
 - t6060: add tests for removed files
 - t6060: modify multiple files to expose a possible issue with merge-index

 An attempt to rewrite remaining merge strategies from shell to C.

 Needs more work.
 At the minimum, we should lose 11/14 and possibly 08/14.
 cf. <xmqq7d36vfur.fsf@gitster.g>
 source: <20220809185429.20098-1-alban.gruin@gmail.com>


* po/glossary-around-traversal (2022-07-09) 3 commits
 - glossary: add reachability bitmap description
 - glossary: add commit graph description
 - glossary: add Object DataBase (ODB) abbreviation

 The glossary entries for "commit-graph file" and "reachability
 bitmap" have been added.

 Expecting a reroll.
 cf. <dfe0c1ab-33f8-f13e-71ce-1829bb0d2d7f@iee.email>
 source: <pull.1282.git.1657385781.gitgitgadget@gmail.com>


* gc/submodule-clone-update-with-branches (2022-08-29) 6 commits
 - clone, submodule update: check out branches
 - submodule--helper: refactor up-to-date criterion
 - submodule: return target of submodule symref
 - t5617: drop references to remote-tracking branches
 - repo-settings: add submodule_propagate_branches
 - clone: teach --detach option

 "git clone --recurse-submodules" and "git submodule update" learns
 to honor the "propagete branches" option.

 Expecting a reroll.
 cf. <20220901200047.515294-1-jonathantanmy@google.com> and others
 source: <pull.1321.git.git.1661806456.gitgitgadget@gmail.com>


* tb/diffstat-with-utf8-strwidth (2022-09-14) 1 commit
 - diff.c: use utf8_strwidth() to count display width

 "git diff --stat" etc. were invented back when everything was ASCII
 and strlen() was a way to measure the display width of a string;
 adjust them to compute the display width assuming UTF-8 pathnames.

 Expecting a reroll.
 source: <20220914151333.3309-1-tboegi@web.de>


* mj/credential-helper-auth-headers (2022-09-13) 8 commits
 - http: set specific auth scheme depending on credential
 - http: move proactive auth to first slot creation
 - http: store all request headers on active_request_slot
 - credential: add WWW-Authenticate header to cred requests
 - http: read HTTP WWW-Authenticate response headers
 - osxkeychain: clarify that we ignore unknown lines
 - netrc: ignore unknown lines (do not die)
 - wincred: ignore unknown lines (do not die)

 Extending credential helper protocol.

 Expecting a reroll.
 A separate non-RFC submission of the first three is expected.
 cf. <AS8PR03MB86897FAC3E1E4F03D4420644C04F9@AS8PR03MB8689.eurprd03.prod.outlook.com>
 source: <pull.1352.git.1663097156.gitgitgadget@gmail.com>


* cw/submodule-status-in-parallel (2022-09-23) 4 commits
 . diff-lib: parallelize run_diff_files for submodules
 . diff-lib: refactor functions
 . submodule: move status parsing into function
 . run-command: add pipe_output to run_processes_parallel

 Allow the internal "diff-files" engine to run "how has this
 submodule changed?" in parallel to speed up "git status".

 Breaks its self check.
 cf. https://github.com/git/git/actions/runs/3115673002/jobs/5052804463
 source: <20220922232947.631309-1-calvinwan@google.com>


* es/mark-gc-cruft-as-experimental (2022-08-03) 2 commits
 - config: let feature.experimental imply gc.cruftPacks=true
 - gc: add tests for --cruft and friends

 Enable gc.cruftpacks by default for those who opt into
 feature.experimental setting.

 Expecting a reroll.
 cf. <220804.86a68ke9d5.gmgdl@evledraar.gmail.com>
 cf. <6803b725-526e-a1c8-f15c-a9ed4a144d4c@github.com>
 source: <20220803205721.3686361-1-emilyshaffer@google.com>


* es/doc-creation-factor-fix (2022-07-28) 2 commits
 - range-diff: clarify --creation-factor=<factor>
 - format-patch: clarify --creation-factor=<factor>

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

* js/cmake-updates (2022-10-19) 5 commits
 - cmake: increase time-out for a long-running test
 - cmake: avoid editing t/test-lib.sh
 - add -p: avoid ambiguous signed/unsigned comparison
 - cmake: copy the merge tools for testing
 - cmake: make it easier to diagnose regressions in CTest runs

 Update to build procedure with VS using CMake/CTest.

 Will merge to 'next'?
 source: <pull.1320.v3.git.1666090745.gitgitgadget@gmail.com>


* gc/bare-repo-discovery (2022-10-13) 1 commit
  (merged to 'next' on 2022-10-17 at 3de2be7c14)
 + config: respect includes in protected config

 Allow configuration files in "protected" scopes to include other
 configuration files.

 Will merge to 'master'.
 source: <pull.1360.v2.git.git.1665683027912.gitgitgadget@gmail.com>


* jh/trace2-timers-and-counters (2022-10-13) 7 commits
 - trace2: add global counter mechanism
 - trace2: add stopwatch timers
 - trace2: convert ctx.thread_name from strbuf to pointer
 - trace2: rename the thread_name argument to trace2_thread_start
 - api-trace2.txt: elminate section describing the public trace2 API
 - tr2tls: clarify TLS terminology
 - trace2: use size_t alloc,nr_open_regions in tr2tls_thread_ctx

 Two new facilities, "timer" and "counter", are introduced to the
 trace2 API.
 source: <pull.1373.v2.git.1665600750.gitgitgadget@gmail.com>


* tb/midx-bitmap-selection-fix (2022-10-13) 4 commits
 - pack-bitmap-write.c: instrument number of reused bitmaps
 - midx.c: instrument MIDX and bitmap generation with trace2 regions
 - midx.c: consider annotated tags during bitmap selection
 - midx.c: fix whitespace typo

 A bugfix with tracing support in midx codepath

 Will merge to 'next'.
 source: <cover.1665612094.git.me@ttaylorr.com>


* tb/remove-unused-pack-bitmap (2022-10-17) 1 commit
 - builtin/repack.c: remove redundant pack-based bitmaps

 When creating a multi-pack bitmap, remove per-pack bitmap files
 unconditionally as they will never be consulted.

 Will merge to 'next'?
 source: <1e0ef7ee7ff5feb323c77e594cd65433fb1d99f7.1666061096.git.me@ttaylorr.com>


* nw/t1002-cleanup (2022-10-14) 1 commit
 - t1002: modernize outdated conditional

 Code clean-up in test.

 Will merge to 'next'.
 source: <pull.1362.v3.git.git.1665734502591.gitgitgadget@gmail.com>


* zh/patch-id (2022-10-14) 7 commits
 - documentation: format-patch: clarify requirements for patch-ids to match
 - builtin: patch-id: remove unused diff-tree prefix
 - builtin: patch-id: add --include-whitespace as a command mode
 - patch-id: fix patch-id for mode changes
 - builtin: patch-id: fix patch-id with binary diffs
 - patch-id: use stable patch-id for rebases
 - patch-id: fix stable patch id for binary / header-only

 A new "--include-whitespace" option is added to "git patch-id", and
 existing bugs in the internal patch-id logic that did not match
 what "git patch-id" produces have been corrected.

 Will merge to 'next'?
 source: <pull.1359.v3.git.1665737804.gitgitgadget@gmail.com>


* hl/archive-recursive (2022-10-19) 10 commits
 - fixup! archive: add tests for git archive --recurse-submodules
 - archive: add tests for git archive --recurse-submodules
 - archive: add --recurse-submodules to git-archive command
 - archive: remove global repository from archive_args
 - archive: pass repo objects to write_archive handlers
 - tree: add repository parameter to read_tree_fn_t
 - tree: handle submodule case for read_tree_at properly
 - tree: increase test coverage for tree.c
 - tree: update cases to use repo_ tree methods
 - tree: do not use the_repository for tree traversal methods.

 "git archive" has been taught "--recurse-submodules" option to
 create a tarball that includes contents from submodules.

 Expecting a reroll.
 source: <pull.1359.v3.git.git.1665973401.gitgitgadget@gmail.com>


* pw/rebase-keep-base-fixes (2022-10-17) 8 commits
 - rebase --keep-base: imply --no-fork-point
 - rebase --keep-base: imply --reapply-cherry-picks
 - rebase: factor out branch_base calculation
 - rebase: rename merge_base to branch_base
 - rebase: store orig_head as a commit
 - rebase: be stricter when reading state files containing oids
 - t3416: set $EDITOR in subshell
 - t3416: tighten two tests
 (this branch is used by pw/rebase-reflog-fixes.)

 "git rebase --keep-base" used to discard the commits that are
 already cherry-picked to the upstream, even when "keep-base" meant
 that the base, on top of which the history is being rebuilt, does
 not yet include these cherry-picked commits.  The --keep-base
 option now implies --reapply-cherry-picks and --no-fork-point
 options.

 Will merge to 'next'??
 source: <pull.1323.v4.git.1666012665.gitgitgadget@gmail.com>


* ab/grep-simplify-extended-expression (2022-10-11) 1 commit
  (merged to 'next' on 2022-10-13 at 07993f09bc)
 + grep.c: remove "extended" in favor of "pattern_expression", fix segfault

 Giving "--invert-grep" and "--all-match" without "--grep" to the
 "git log" command resulted in an attempt to access grep pattern
 expression structure that has not been allocated, which has been
 corrected.

 Will merge to 'master'.
 source: <patch-v2-1.1-6ad7627706f-20221011T094715Z-avarab@gmail.com>


* pw/rebase-reflog-fixes (2022-10-17) 9 commits
 - rebase: cleanup action handling
 - rebase --abort: improve reflog message
 - rebase --apply: make reflog messages match rebase --merge
 - rebase --apply: respect GIT_REFLOG_ACTION
 - rebase --merge: fix reflog message after skipping
 - rebase --merge: fix reflog when continuing
 - t3406: rework rebase reflog tests
 - rebase --apply: remove duplicated code
 - Merge branch 'pw/rebase-keep-base-fixes' into pw/rebase-reflog-fixes
 (this branch uses pw/rebase-keep-base-fixes.)

 Fix some bugs in the reflog messages when rebasing and changes the
 reflog messages of "rebase --apply" to match "rebase --merge" with
 the aim of making the reflog easier to parse.

 Will merge to 'next'??
 source: <pull.1150.v3.git.1665567312.gitgitgadget@gmail.com>


* sd/doc-smtp-encryption (2022-10-12) 1 commit
 - docs: git-send-email: difference between ssl and tls smtp-encryption

 Expecting a reroll??
 cf. <19e5b678-6014-d783-347f-9169371aaa09@iee.email>
 source: <20221012150619.12877-1-sndanailov@wired4ever.net>


* jc/symbolic-ref-no-recurse (2022-10-09) 1 commit
  (merged to 'next' on 2022-10-13 at 532a3f6a5f)
 + symbolic-ref: teach "--[no-]recurse" option

 After checking out a "branch" that is a symbolic-ref that points at
 another branch, "git symbolic-ref HEAD" reports the underlying
 branch, not the symbolic-ref the user gave checkout as argument.
 The command learned the "--no-recurse" option to stop after
 dereferencing a symbolic-ref only once.

 Will merge to 'master'.
 source: <xmqqleprcn08.fsf@gitster.g>


* ds/cmd-main-reorder (2022-10-08) 1 commit
  (merged to 'next' on 2022-10-14 at d7f07dbecf)
 + git.c: improve code readability in cmd_main()

 Code clean-up.

 Will merge to 'master'.
 source: <pull.1355.v3.git.git.1665246097190.gitgitgadget@gmail.com>


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


* en/sparse-checkout-design (2022-10-08) 1 commit
 - sparse-checkout.txt: new document with sparse-checkout directions

 Design doc.

 Needs review.
 source: <pull.1367.v3.git.1665269538608.gitgitgadget@gmail.com>


* jc/more-sanitizer-at-ci (2022-10-11) 1 commit
 . ci: add address and undefined sanitizer tasks

 Enable address and undefined sanitizer tasks at GitHub Actions CI.

 With this p4 tests seem to die with the server side going away.
 source: <xmqqpmezxl9p.fsf@gitster.g>


* od/ci-use-checkout-v3-when-applicable (2022-10-10) 2 commits
 . ci(main): linux32 uses actions/checkout@v2
 . ci(main): upgrade actions/checkout to v3

 Attempt to update GitHub CI to use actions/checkout@v3

 Expecting a reroll.
 Seems to break the CI completely.
 source: <pull.1354.git.git.1665388136.gitgitgadget@gmail.com>


* ab/run-hook-api-cleanup (2022-10-12) 15 commits
 - run-command.c: remove "max_processes", add "const" to signal() handler
 - run-command.c: pass "opts" further down, and use "opts->processes"
 - run-command.c: use "opts->processes", not "pp->max_processes"
 - run-command.c: don't copy "data" to "struct parallel_processes"
 - run-command.c: don't copy "ungroup" to "struct parallel_processes"
 - run-command.c: don't copy *_fn to "struct parallel_processes"
 - run-command.c: make "struct parallel_processes" const if possible
 - run-command API: move *_tr2() users to "run_processes_parallel()"
 - run-command API: have run_process_parallel() take an "opts" struct
 - run-command.c: use designated init for pp_init(), add "const"
 - run-command API: don't fall back on online_cpus()
 - run-command API: make "n" parameter a "size_t"
 - run-command tests: use "return", not "exit"
 - run-command API: have "run_processes_parallel{,_tr2}()" return void
 - run-command test helper: use "else if" pattern

 Move a global variable added as a hack during regression fixes to
 its proper place in the API.

 Will merge to 'next'.
 source: <cover-v3-00.15-00000000000-20221012T205712Z-avarab@gmail.com>


* pw/test-todo (2022-10-06) 3 commits
 - test_todo: allow [verbose] test as the command
 - test_todo: allow [!] grep as the command
 - tests: add test_todo() to mark known breakages

 RFC for test framework improvement.

 Needs review.
 source: <pull.1374.git.1665068476.gitgitgadget@gmail.com>


* rj/branch-edit-description-with-nth-checkout (2022-10-10) 1 commit
  (merged to 'next' on 2022-10-14 at 90850a2211)
 + branch: support for shortcuts like @{-1}, completed

 "git branch --edit-description @{-1}" is now a way to edit branch
 description of the branch you were on before switching to the
 current branch.

 Will merge to 'master'.
 source: <fbf84e26-4306-c8df-0e2c-45dc94129e3a@gmail.com>


* rs/diff-caret-bang-with-parents (2022-10-01) 3 commits
  (merged to 'next' on 2022-10-17 at 24609eb777)
 + diff: support ^! for merges
 + revisions.txt: unspecify order of resolved parts of ^!
 + revision: use strtol_i() for exclude_parent

 "git diff rev^!" did not show combined diff to go to the rev from
 its parents.

 Will merge to 'master'.
 source: <16c49d20-cafc-4b48-3c6b-e11c74c29abb@web.de>


* ab/doc-synopsis-and-cmd-usage (2022-10-13) 34 commits
 - tests: assert consistent whitespace in -h output
 - tests: start asserting that *.txt SYNOPSIS matches -h output
 - doc txt & -h consistency: make "worktree" consistent
 - worktree: define subcommand -h in terms of command -h
 - reflog doc: list real subcommands up-front
 - doc txt & -h consistency: make "commit" consistent
 - doc txt & -h consistency: make "diff-tree" consistent
 - doc txt & -h consistency: use "[<label>...]" for "zero or more"
 - doc txt & -h consistency: make "annotate" consistent
 - doc txt & -h consistency: make "stash" consistent
 - doc txt & -h consistency: add missing options
 - doc txt & -h consistency: use "git foo" form, not "git-foo"
 - doc txt & -h consistency: make "bundle" consistent
 - doc txt & -h consistency: make "read-tree" consistent
 - doc txt & -h consistency: make "rerere" consistent
 - doc txt & -h consistency: add missing options and labels
 - doc txt & -h consistency: make output order consistent
 - doc txt & -h consistency: add or fix optional "--" syntax
 - doc txt & -h consistency: fix mismatching labels
 - doc SYNOPSIS & -h: use "-" to separate words in labels, not "_"
 - doc txt & -h consistency: use "<options>", not "<options>..."
 - stash doc SYNOPSIS & -h: correct padding around "[]()"
 - doc txt & -h consistency: correct padding around "[]()"
 - doc txt & -h consistency: balance unbalanced "[" and "]"
 - doc txt & -h consistency: add "-z" to cat-file "-h"
 - doc txt & -h consistency: fix incorrect alternates syntax
 - doc txt & -h consistency: word-wrap
 - built-ins: consistently add "\n" between "usage" and options
 - doc SYNOPSIS: consistently use ' for commands
 - doc SYNOPSIS: don't use ' for subcommands
 - bundle: define subcommand -h in terms of command -h
 - builtin/bundle.c: indent with tabs
 - CodingGuidelines: update and clarify command-line conventions
 - tests: assert *.txt SYNOPSIS and -h output

 The short-help text shown by "git cmd -h" and the synopsis text
 shown at the beginning of "git help cmd" have been made more
 consistent.

 Will merge to 'next'?
 source: <cover-v5-00.34-00000000000-20221013T153625Z-avarab@gmail.com>


* ab/coccicheck-incremental (2022-10-14) 11 commits
 - spatchcache: add a ccache-alike for "spatch"
 - cocci: run against a generated ALL.cocci
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
 source: <cover-v3-00.11-00000000000-20221014T152552Z-avarab@gmail.com>


* ds/bundle-uri-3 (2022-10-12) 13 commits
 - bundle-uri: suppress stderr from remote-https
 - bundle-uri: quiet failed unbundlings
 - bundle: add flags to verify_bundle()
 - bundle-uri: fetch a list of bundles
 - bundle: properly clear all revision flags
 - bundle-uri: limit recursion depth for bundle lists
 - bundle-uri: parse bundle list in config format
 - bundle-uri: unit test "key=value" parsing
 - bundle-uri: create "key=value" line parsing
 - bundle-uri: create base key-value pair parsing
 - bundle-uri: create bundle_list struct and helpers
 - bundle-uri: use plain string in find_temp_filename()
 - Merge branch 'ds/bundle-uri-clone' into ds/bundle-uri-3

 Define the logical elements of a "bundle list", data structure to
 store them in-core, format to transfer them, and code to parse
 them.
 source: <pull.1333.v5.git.1665579160.gitgitgadget@gmail.com>


* js/bisect-in-c (2022-08-30) 17 commits
 - bisect: no longer try to clean up left-over `.git/head-name` files
 - bisect: remove Cogito-related code
 - Turn `git bisect` into a full built-in
 - bisect: move even the command-line parsing to `bisect--helper`
 - bisect--helper: make `state` optional
 - bisect--helper: calling `bisect_state()` without an argument is a bug
 - bisect: avoid double-quoting when printing the failed command
 - bisect run: fix the error message
 - bisect: verify that a bogus option won't try to start a bisection
 - bisect--helper: migrate to OPT_SUBCOMMAND()
 - bisect--helper: make the order consistently `argc, argv`
 - bisect--helper: make `terms` an explicit singleton
 - bisect--helper: simplify exit code computation
 - bisect--helper: really retire `--bisect-autostart`
 - bisect--helper: really retire --bisect-next-check
 - bisect--helper: retire the --no-log option
 - Merge branch 'sg/parse-options-subcommand' into js/bisect-in-c

 Final bits of "git bisect.sh" have been rewritten in C.

 Needs review.
 cf. <xmqqv8pr8903.fsf@gitster.g>
 source: <pull.1132.v6.git.1661885419.gitgitgadget@gmail.com>
