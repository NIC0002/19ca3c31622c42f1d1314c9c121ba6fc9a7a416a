Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA382C4332F
	for <git@archiver.kernel.org>; Wed, 12 Oct 2022 21:23:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbiJLVXT (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 12 Oct 2022 17:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiJLVXR (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 12 Oct 2022 17:23:17 -0400
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD5211B2EB
        for <git@vger.kernel.org>; Wed, 12 Oct 2022 14:23:13 -0700 (PDT)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id 0F662150C26;
        Wed, 12 Oct 2022 17:23:12 -0400 (EDT)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to
        :subject:date:message-id:mime-version:content-type; s=sasl; bh=p
        7priXQcGS+epkw1aORKW/l5uuHwV6I0LR1fAILrCbQ=; b=KfD1hRrTVIvy4U2gb
        Q3gHitA4n4bFwXhbE0+v5A/Ny4eF40RygJ0BqDvSdTEtTY5LCBbZSR0dXnCyyd+k
        0GNyd4WKAoyQL3KJ5JHHwCs3R8STwZuFtrTH1DIiUyDtFoPDaLGzh+34LCrTJ0by
        +Euk/sM46D7+Jem+9tzJ2bIRrQ=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id 065AC150C25;
        Wed, 12 Oct 2022 17:23:12 -0400 (EDT)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [34.83.5.33])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 55DCE150C24;
        Wed, 12 Oct 2022 17:23:11 -0400 (EDT)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Oct 2022, #04; Wed, 12)
X-master-at: d420dda0576340909c3faff364cfbd1485f70376
X-next-at: 000bd34796a7971322b88e0157682adcb79b6cda
Date:   Wed, 12 Oct 2022 14:23:10 -0700
Message-ID: <xmqqedvcka81.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID: 12FE9B46-4A74-11ED-97C2-307A8E0A682E-77302942!pb-smtp2.pobox.com
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Here are the topics that have been cooking in my tree.  Commits
prefixed with '+' are in 'next' (being in 'next' is a sign that a
topic is stable enough to be used and are candidate to be in a future
release).  Commits prefixed with '-' are only in 'seen', and aren't
considered "accepted" at all.  A topic without enough support may be
discarded after a long period of no activity.

The tip of 'next' has been rewound, after most of the topics that
have been cooking during the last weeks of the previous round
graduated to the 'master' branch.  The topics in these early batches
are mostly minor fixes, which might someday become part of the
2.38.x maintenance track, but they need to be on 'master' for a few
weeks before that happens.  Some topics outside 'next' have been
expecting updates for too long and we may want to discard them,
unless they see some activities.

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

* ds/bundle-uri-docfix (2022-10-07) 1 commit
  (merged to 'next' on 2022-10-07 at 9ebc1e497a)
 + bundle-uri: fix technical doc issues

 Doc formatting fix.
 source: <pull.1377.git.1665157810025.gitgitgadget@gmail.com>


* jk/sequencer-missing-author-name-check (2022-10-03) 1 commit
  (merged to 'next' on 2022-10-07 at 6a9f7e8b80)
 + sequencer: detect author name errors in read_author_script()

 Typofix in code.
 source: <YzsdRuD2CdJFdNVG@coredump.intra.peff.net>


* nb/doc-mergetool-typofix (2022-10-05) 1 commit
  (merged to 'next' on 2022-10-07 at d309a9a130)
 + mergetool.txt: typofix 'overwriten' -> 'overwritten'

 Typofix.
 source: <pull.1350.git.git.1664844924663.gitgitgadget@gmail.com>


* pw/mailinfo-b-fix (2022-10-03) 1 commit
  (merged to 'next' on 2022-10-07 at 5c5d79daef)
 + mailinfo -b: fix an out of bounds access

 Fix a logic in "mailinfo -b" that miscomputed the length of a
 substring, which lead to an out-of-bounds access.
 source: <pull.1372.git.1664789011089.gitgitgadget@gmail.com>


* pw/ssh-sign-report-errors (2022-10-05) 1 commit
  (merged to 'next' on 2022-10-07 at 4df1d2379a)
 + ssh signing: return an error when signature cannot be read

 The codepath to sign learned to report errors when it fails to read
 from "ssh-keygen".
 source: <pull.1371.v2.git.1664877694430.gitgitgadget@gmail.com>


* rs/gc-pack-refs-simplify (2022-10-05) 1 commit
  (merged to 'next' on 2022-10-07 at ef7d12408d)
 + gc: simplify maintenance_task_pack_refs()

 Code clean-up.
 source: <ab33f72e-d552-7bd7-bf04-3c476d32b5b6@web.de>


* rs/test-httpd-in-C-locale (2022-10-06) 1 commit
  (merged to 'next' on 2022-10-07 at 832c1e856a)
 + t/lib-httpd: pass LANG and LC_ALL to Apache

 Force C locale while running tests around httpd to make sure we can
 find expected error messages in the log.
 source: <a1699375-c660-13ab-42fb-26a8afe4c376@web.de>

--------------------------------------------------
[New Topics]

* ab/grep-simplify-extended-expression (2022-10-11) 1 commit
 - grep.c: remove "extended" in favor of "pattern_expression", fix segfault

 Giving "--invert-grep" and "--all-match" without "--grep" to the
 "git log" command resulted in an attempt to access grep pattern
 expression structure that has not been allocated, which has been
 corrected.

 Will merge to 'next'.
 source: <patch-v2-1.1-6ad7627706f-20221011T094715Z-avarab@gmail.com>


* rs/archive-dedup-printf (2022-10-11) 1 commit
 - archive: deduplicate verbose printing

 Code simplification.

 Will merge to 'next'.
 source: <af5611aa-8662-7508-4f00-7fcf4e9cbcc6@web.de>


* pw/rebase-reflog-fixes (2022-10-12) 9 commits
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

 source: <pull.1150.v3.git.1665567312.gitgitgadget@gmail.com>


* sd/doc-smtp-encryption (2022-10-12) 1 commit
 - docs: git-send-email: difference between ssl and tls smtp-encryption

 Expecting a reroll??
 cf. <19e5b678-6014-d783-347f-9169371aaa09@iee.email>
 source: <20221012150619.12877-1-sndanailov@wired4ever.net>

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


* pw/rebase-keep-base-fixes (2022-09-07) 7 commits
 - rebase --keep-base: imply --no-fork-point
 - rebase --keep-base: imply --reapply-cherry-picks
 - rebase: factor out branch_base calculation
 - rebase: rename merge_base to branch_base
 - rebase: store orig_head as a commit
 - t3416: set $EDITOR in subshell
 - t3416: tighten two tests
 (this branch is used by pw/rebase-reflog-fixes.)

 "git rebase --keep-base" used to discard the commits that are
 already cherry-picked to the upstream, even when "keep-base" meant
 that the base, on top of which the history is being rebuilt, does
 not yet include these cherry-picked commits.  The --keep-base
 option now implies --reapply-cherry-picks and --no-fork-point
 options.

 Expecting a reroll.
 cf. <e25127f3-6135-b716-a12f-5dbe4f40dc42@gmail.com>
 source: <pull.1323.v2.git.1662561470.gitgitgadget@gmail.com>


* js/cmake-updates (2022-08-24) 5 commits
 - cmake: increase time-out for a long-running test
 - cmake: avoid editing t/test-lib.sh
 - add -p: avoid ambiguous signed/unsigned comparison
 - cmake: copy the merge tools for testing
 - cmake: make it easier to diagnose regressions in CTest runs

 Update to build procedure with VS using CMake/CTest.

 Expecting a reroll.
 cf. <3df77ffd-85a2-3a54-9005-34a24ec6e82d@github.com>
 cf. <531620e1-de4c-74aa-c840-c12ce81f8740@github.com> and others
 source: <pull.1320.v2.git.1661243463.gitgitgadget@gmail.com>


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

* ab/coding-guidelines-c99 (2022-10-11) 5 commits
 - CodingGuidelines: recommend against unportable C99 struct syntax
 - CodingGuidelines: mention C99 features we can't use
 - CodingGuidelines: allow declaring variables in for loops
 - CodingGuidelines: mention dynamic C99 initializer elements
 - CodingGuidelines: update for C99

 Update CodingGuidelines to clarify what features to use and avoid
 in C99.

 Will merge to 'next'.
 source: <20221010203800.2154698-1-gitster@pobox.com>


* jc/symbolic-ref-no-recurse (2022-10-09) 1 commit
 - symbolic-ref: teach "--[no-]recurse" option

 After checking out a "branch" that is a symbolic-ref that points at
 another branch, "git symbolic-ref HEAD" reports the underlying
 branch, not the symbolic-ref the user gave checkout as argument.
 The command learned the "--no-recurse" option to stop after
 dereferencing a symbolic-ref only once.

 Will merge to 'next'?
 source: <xmqqleprcn08.fsf@gitster.g>


* jc/use-of-uc-in-log-messages (2022-10-07) 1 commit
  (merged to 'next' on 2022-10-11 at 0b8c91d7e2)
 + SubmittingPatches: use usual capitalization in the log message body

 Clarify that "the sentence after <area>: prefix does not begin with
 a capital letter" rule applies only to the commit title.

 Will merge to 'master'.
 source: <xmqqedvjfqx1.fsf@gitster.g>


* ds/cmd-main-reorder (2022-10-08) 1 commit
 - git.c: improve code readability in cmd_main()

 Code clean-up.

 Will merge to 'next'?
 source: <pull.1355.v3.git.git.1665246097190.gitgitgadget@gmail.com>


* ed/fsmonitor-inotify (2022-10-10) 6 commits
 . fsmonitor: update doc for Linux
 . fsmonitor: test updates
 . fsmonitor: enable fsmonitor for Linux
 . fsmonitor: implement filesystem change listener for Linux
 . fsmonitor: determine if filesystem is local or remote
 . fsmonitor: prepare to share code between Mac OS and Linux
 (this branch uses ed/fsmonitor-on-networked-macos.)

 Bundled fsmonitor for Linux using inotify API.

 Needs review.
 source: <pull.1352.git.git.1665326258.gitgitgadget@gmail.com>


* en/sparse-checkout-design (2022-10-08) 1 commit
 - sparse-checkout.txt: new document with sparse-checkout directions

 Design doc.

 Needs review.
 source: <pull.1367.v3.git.1665269538608.gitgitgadget@gmail.com>


* jc/more-sanitizer-at-ci (2022-10-11) 1 commit
 - ci: add address and undefined sanitizer tasks

 Enable address and undefined sanitizer tasks at GitHub Actions CI.

 Will merge to and cook in 'next'??
 source: <xmqqpmezxl9p.fsf@gitster.g>


* rs/use-fspathncmp (2022-10-08) 1 commit
  (merged to 'next' on 2022-10-11 at 11cbd1ce81)
 + dir: use fspathncmp() in pl_hashmap_cmp()

 Code clean-up.

 Will merge to 'master'.
 source: <cb6ffcdb-d719-7928-96b8-e46482dd141f@web.de>


* jh/struct-zero-init-with-older-clang (2022-10-10) 1 commit
 - config.mak.dev: disable suggest braces error on old clang versions

 Work around older clang that warns against C99 zero initialization
 syntax for struct.

 Will merge to 'next'.
 source: <pull.1375.v2.git.1665416340806.gitgitgadget@gmail.com>


* od/ci-use-checkout-v3-when-applicable (2022-10-10) 2 commits
 . ci(main): linux32 uses actions/checkout@v2
 . ci(main): upgrade actions/checkout to v3

 Attempt to update GitHub CI to use actions/checkout@v3

 Expecting a reroll.
 Seems to break the CI completely.
 source: <pull.1354.git.git.1665388136.gitgitgadget@gmail.com>


* pw/remove-rebase-p-test (2022-10-10) 1 commit
  (merged to 'next' on 2022-10-11 at 000bd34796)
 + t3435: remove redundant test case

 Remove outdated test.

 Will merge to 'master'.
 source: <pull.1379.git.1665395106351.gitgitgadget@gmail.com>


* ab/run-hook-api-cleanup (2022-10-05) 15 commits
 - run-command.c: don't copy "ungroup" to "struct parallel_processes"
 - run-command.c: don't copy *_fn to "struct parallel_processes"
 - run-command API: move *_tr2() users to "run_processes_parallel()"
 - run-command API: have run_process_parallel() take an "opts" struct
 - run-command API: make run_process_parallel{,_tr2}() thin wrappers
 - run-command API: add nascent "struct run_process_parallel_opts"
 - run-command.c: add an initializer for "struct parallel_processes"
 - run-command API: don't fall back on online_cpus()
 - run-command API: make "jobs" parameter an "unsigned int"
 - run-command API: have "run_processes_parallel{,_tr2}()" return void
 - run-command tests: use "return", not "exit"
 - run-command test helper: use "else if" pattern
 - run-command tests: test stdout of run_command_parallel()
 - submodule tests: reset "trace.out" between "grep" invocations
 - hook tests: fix redirection logic error in 96e7225b310

 Move a global variable added as a hack during regression fixes to
 its proper place in the API.

 Needs review.
 source: <cover-00.15-00000000000-20220930T111343Z-avarab@gmail.com>


* rs/bisect-start-leakfix (2022-10-07) 1 commit
  (merged to 'next' on 2022-10-11 at 07f87534c1)
 + bisect--helper: plug strvec leak

 Code clean-up that results in plugging a leak.

 Will merge to 'master'.
 source: <1965b54b-122a-c965-f886-1a7dd6afbfb4@web.de>


* ab/unused-annotation (2022-10-05) 1 commit
  (merged to 'next' on 2022-10-11 at c3099ad3ab)
 + git-compat-util.h: GCC deprecated message arg only in GCC 4.5+

 Compilation fix for ancient compilers.

 Will merge to 'master'.
 source: <20221005221928.703750-1-asedeno@google.com>


* dd/document-runtime-prefix-better (2022-10-05) 1 commit
  (merged to 'next' on 2022-10-11 at 9f4a3bb7bd)
 + Makefile: clarify runtime relative gitexecdir

 Update comment in the Makefile about the RUNTIME_PREFIX config knob.

 Will merge to 'master'.
 source: <20221006013205.15015-1-congdanhqx@gmail.com>


* jk/cleanup-callback-parameters (2022-10-06) 4 commits
  (merged to 'next' on 2022-10-11 at a3350d66b6)
 + attr: drop DEBUG_ATTR code
 + commit: avoid writing to global in option callback
 + multi-pack-index: avoid writing to global in option callback
 + test-submodule: inline resolve_relative_url() function

 Code clean-up.

 Will merge to 'master'.
 source: <Yz7Tjy7Rh8cXVxYQ@coredump.intra.peff.net>
 source: <Yz7UhYXvNl6+1GbZ@coredump.intra.peff.net>


* pw/test-todo (2022-10-06) 3 commits
 - test_todo: allow [verbose] test as the command
 - test_todo: allow [!] grep as the command
 - tests: add test_todo() to mark known breakages

 RFC for test framework improvement.

 Needs review.
 source: <pull.1374.git.1665068476.gitgitgadget@gmail.com>


* jc/tmp-objdir (2022-09-30) 1 commit
  (merged to 'next' on 2022-10-11 at 17d0843c43)
 + tmp-objdir: skip clean up when handling a signal

 The code to clean temporary object directories (used for
 quarantine) tried to remove them inside its signal handler, which
 was a no-no.

 Will merge to 'master'.
 source: <pull.1348.v4.git.git.1664570831583.gitgitgadget@gmail.com>


* jc/branch-description-unset (2022-09-30) 1 commit
  (merged to 'next' on 2022-10-11 at 3f81ee978b)
 + branch: do not fail a no-op --edit-desc

 "GIT_EDITOR=: git branch --edit-description" resulted in failure,
 which has been corrected.

 Will merge to 'master'.
 source: <xmqqmtagka8x.fsf@gitster.g>


* rj/branch-edit-desc-unborn (2022-10-07) 1 commit
  (merged to 'next' on 2022-10-11 at de3eccde7c)
 + branch: description for non-existent branch errors

 "git branch --edit-description" on an unborh branch misleadingly
 said that no such branch exists, which has been corrected.

 Will merge to 'master'.
 source: <8d627a2c-923f-181f-a03b-15f370c4dd0f@gmail.com>


* jt/promisor-remote-fetch-tweak (2022-10-05) 2 commits
  (merged to 'next' on 2022-10-11 at e93567bc8f)
 + promisor-remote: die upon failing fetch
 + promisor-remote: remove a return value

 Remove error detection from a function that fetches from promisor
 remotes, and make it die when such a fetch fails to bring all the
 requested objects, to give an early failure to various operations.

 Will merge to 'master'.
 source: <cover.1664917853.git.jonathantanmy@google.com>


* ed/fsmonitor-on-networked-macos (2022-10-10) 7 commits
  (merged to 'next' on 2022-10-11 at 32076d13b7)
 + fsmonitor: fix leak of warning message
 + fsmonitor: add documentation for allowRemote and socketDir options
 + fsmonitor: check for compatability before communicating with fsmonitor
 + fsmonitor: deal with synthetic firmlinks on macOS
 + fsmonitor: avoid socket location check if using hook
 + fsmonitor: relocate socket file if .git directory is remote
 + fsmonitor: refactor filesystem checks to common interface
 (this branch is used by ed/fsmonitor-inotify.)

 By default, use of fsmonitor on a repository on networked
 filesystem is disabled. Add knobs to make it workable on macOS.

 Will merge to 'master'.
 source: <pull.1326.v15.git.1664904751.gitgitgadget@gmail.com>


* rj/branch-edit-description-with-nth-checkout (2022-10-10) 1 commit
 - branch: support for shortcuts like @{-1}, completed

 "git branch --edit-description @{-1}" is now a way to edit branch
 description of the branch you were on before switching to the
 current branch.

 Will merge to 'next'.
 source: <fbf84e26-4306-c8df-0e2c-45dc94129e3a@gmail.com>


* rs/diff-caret-bang-with-parents (2022-10-01) 3 commits
 - diff: support ^! for merges
 - revisions.txt: unspecify order of resolved parts of ^!
 - revision: use strtol_i() for exclude_parent

 "git diff rev^!" did not show combined diff to go to the rev from
 its parents.

 Needs review.
 source: <16c49d20-cafc-4b48-3c6b-e11c74c29abb@web.de>


* ab/doc-synopsis-and-cmd-usage (2022-10-05) 34 commits
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

 Needs review.
 source: <cover-v4-00.34-00000000000-20221004T132211Z-avarab@gmail.com>


* ab/coccicheck-incremental (2022-08-31) 9 commits
 - spatchcache: add a ccache-alike for "spatch"
 - cocci: optimistically use COMPUTE_HEADER_DEPENDENCIES
 - cocci: make "coccicheck" rule incremental
 - cocci: split off "--all-includes" from SPATCH_FLAGS
 - cocci: split off include-less "tests" from SPATCH_FLAGS
 - Makefile: split off SPATCH_BATCH_SIZE comment from "cocci" heading
 - Makefile: have "coccicheck" re-run if flags change
 - Makefile: add ability to TAB-complete cocci *.patch rules
 - cocci rules: remove unused "F" metavariable from pending rule

 "make coccicheck" is time consuming. It has been made to run more
 incrementally.

 Needs review.
 source: <cover-v2-0.9-00000000000-20220831T205130Z-avarab@gmail.com>


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
