Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 717A5C433F5
	for <git@archiver.kernel.org>; Thu, 26 May 2022 08:41:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346724AbiEZIle (ORCPT <rfc822;git@archiver.kernel.org>);
        Thu, 26 May 2022 04:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbiEZIlc (ORCPT <rfc822;git@vger.kernel.org>);
        Thu, 26 May 2022 04:41:32 -0400
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 449CFEF
        for <git@vger.kernel.org>; Thu, 26 May 2022 01:41:28 -0700 (PDT)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id 1ADD5121ADE;
        Thu, 26 May 2022 04:41:27 -0400 (EDT)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to
        :subject:date:message-id:mime-version:content-type; s=sasl; bh=4
        RiPigThcPnTh5s0mPU8waL/gfGtYJBUAcYZnlIJZX8=; b=TscLR231RLayxGFpW
        iQaUNNLaVC1H5n0WyNMhyzaPsuxgWpXBW3tzLU+DK3+RO2SUuWjWHkPctCHnF6Zp
        heZTwjuikYYKGLhXbS7crMHJmOKMYgn2Ulfm5y9PmlSME2Z/cQKciLO3+hoeA75S
        9TevoVkQfofSU2VXHqgqcBWJNo=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id 112F6121ADD;
        Thu, 26 May 2022 04:41:27 -0400 (EDT)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [34.83.92.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 55D62121ADC;
        Thu, 26 May 2022 04:41:26 -0400 (EDT)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (May 2022, #07; Wed, 25)
X-master-at: 6afdb07b7b918ed9282ea6e955f53369df862be8
X-next-at: c4f0e309ae745751d08727f24e8ff55e56355755
Date:   Thu, 26 May 2022 01:41:25 -0700
Message-ID: <xmqqzgj41ya2.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID: A1458238-DCCF-11EC-AD0A-5E84C8D8090B-77302942!pb-smtp1.pobox.com
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Here are the topics that have been cooking in my tree.  Commits
prefixed with '+' are in 'next' (being in 'next' is a sign that a
topic is stable enough to be used and are candidate to be in a
future release).  Commits prefixed with '-' are only in 'seen',
and aren't considered "accepted" at all.

This cycle will conclude in early July (https://tinyurl.com/gitCal);
we are in the week #5 of the cycle.

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

* ab/commit-plug-leaks (2022-05-12) 1 commit
  (merged to 'next' on 2022-05-16 at 00bcda44af)
 + commit: fix "author_ident" leak

 Leakfix in the top-level called-once function.
 source: <xmqqzgjmcqlg.fsf@gitster.g>


* ab/valgrind-fixes (2022-05-12) 4 commits
  (merged to 'next' on 2022-05-16 at 75d760528f)
 + commit-graph.c: don't assume that stat() succeeds
 + object-file: fix a unpack_loose_header() regression in 3b6a8db3b03
 + log test: skip a failing mkstemp() test under valgrind
 + tests: using custom GIT_EXEC_PATH breaks --valgrind tests
 (this branch is used by ds/object-file-unpack-loose-header-fix.)

 A bit of test framework fixes with a few fixes to issues found by
 valgrind.
 source: <20220512223218.237544-1-gitster@pobox.com>


* ep/coverage-report-wants-test-to-have-run (2022-04-13) 1 commit
  (merged to 'next' on 2022-05-18 at e4a51b0867)
 + Makefile: add a prerequisite to the coverage-report target

 "make coverage-report" without first running "make coverage" did
 not produce any meaningful result, which has been corrected.
 source: <20220414022513.31465-1-gitter.spiros@gmail.com>


* jc/archive-add-file-normalize-mode (2022-05-12) 1 commit
  (merged to 'next' on 2022-05-16 at 265bb02f2a)
 + archive: do not let on-disk mode leak to zip archives

 "git archive --add-file=<path>" picked up the raw permission bits
 from the path and propagated to zip output in some cases, without
 normalization, which has been corrected (tar output did not have
 this issue).
 source: <xmqqmtfme8v6.fsf@gitster.g>


* jc/avoid-redundant-submodule-fetch (2022-05-18) 1 commit
  (merged to 'next' on 2022-05-19 at 11dabe678b)
 + fetch: do not run a redundant fetch from submodule

 "git fetch --recurse-submodules" from multiple remotes (either from
 a remote group, or "--all") used to make one extra "git fetch" in
 the submodules, which has been corrected.
 source: <xmqqk0alyqyj.fsf_-_@gitster.g>


* jc/show-branch-g-current (2022-04-21) 1 commit
  (merged to 'next' on 2022-05-18 at 870a1a1a71)
 + show-branch: -g and --current are incompatible

 The "--current" option of "git show-branch" should have been made
 incompatible with the "--reflog" mode, but this was not enforced,
 which has been corrected.
 source: <xmqqh76mf7s4.fsf_-_@gitster.g>


* jt/fetch-peek-optional-section (2022-05-16) 1 commit
  (merged to 'next' on 2022-05-18 at bc876bd2cf)
 + fetch-pack: make unexpected peek result non-fatal

 "git fetch" unnecessarily failed when an unexpected optional
 section appeared in the output, which has been corrected.
 source: <20220516110221.3490982-1-jonathantanmy@google.com>


* os/fetch-check-not-current-branch (2022-05-16) 1 commit
  (merged to 'next' on 2022-05-19 at f48dca6322)
 + fetch: limit shared symref check only for local branches

 The way "git fetch" without "--update-head-ok" ensures that HEAD in
 no worktree points at any ref being updated was too wasteful, which
 has been optimized a bit.
 source: <pull.1266.v2.git.git.1652690501963.gitgitgadget@gmail.com>


* pb/ggg-in-mfc-doc (2022-05-12) 5 commits
  (merged to 'next' on 2022-05-19 at e1c148492f)
 + MyFirstContribution: drop PR description for GGG single-patch contributions
 + MyFirstContribution: reference "The cover letter" in GitGitGadget section
 + MyFirstContribution: reference "The cover letter" in "Preparing Email"
 + MyFirstContribution: add standalone section on cover letter
 + MyFirstContribution: add "Anatomy of a Patch Series" section

 Documentation update.
 source: <pull.1226.v3.git.1652399017.gitgitgadget@gmail.com>


* tb/receive-pack-code-cleanup (2022-05-18) 1 commit
  (merged to 'next' on 2022-05-19 at 756d64f5a2)
 + builtin/receive-pack.c: remove redundant 'if'

 Code clean-up.
 source: <d22f2ca975778d594449857d64be8cd8c0d4a327.1652905549.git.me@ttaylorr.com>

--------------------------------------------------
[New Topics]

* ds/bundle-uri-more (2022-05-20) 24 commits
 - t5601: basic bundle URI tests
 - clone: unbundle the advertised bundles
 - bundle-uri: download bundles from an advertised list
 - bundle-uri: allow relative URLs in bundle lists
 - bundle-uri client: add boolean transfer.bundleURI setting
 - bundle-uri: serve URI advertisement from bundle.* config
 - bundle-uri client: add "git ls-remote-bundle-uri"
 - bundle-uri client: add minimal NOOP client
 - protocol v2: add server-side "bundle-uri" skeleton
 - bundle-uri: fetch a list of bundles
 - bundle-uri: parse bundle list in config format
 - bundle-uri: limit recursion depth for bundle lists
 - bundle-uri: unit test "key=value" parsing
 - bundle-uri: create "key=value" line parsing
 - bundle-uri: create base key-value pair parsing
 - bundle-uri: create bundle_list struct and helpers
 - clone: --bundle-uri cannot be combined with --depth
 - clone: add --bundle-uri option
 - fetch: add 'refs/bundle/' to log.excludeDecoration
 - fetch: add --bundle-uri option
 - bundle-uri: add support for http(s):// and file://
 - bundle-uri: create basic file-copy logic
 - remote-curl: add 'get' capability
 - docs: document bundle URI standard
 (this branch uses ds/bundle-uri.)

 source: <pull.1234.git.1653072042.gitgitgadget@gmail.com>
 source: <pull.1233.git.1652731865.gitgitgadget@gmail.com>


* jc/revert-show-parent-info (2022-05-23) 1 commit
 - revert: optionally refer to commit in the "reference" format

 source: <xmqqsfp2b30k.fsf@gitster.g>


* jc/http-clear-finished-pointer (2022-05-24) 1 commit
 - http.c: clear the 'finished' member once we are done with it

 Meant to go with js/ci-gcc-12-fixes

 Will merge to 'next'?
 source: <xmqqczgqjr8y.fsf_-_@gitster.g>


* js/ci-gcc-12-fixes (2022-05-24) 3 commits
 - dir.c: avoid "exceeds maximum object size" error with GCC v12.x
 - nedmalloc: avoid new compile error
 - compat/win32/syslog: fix use-after-realloc

 Fixes real problems noticed by gcc 12 and works around false
 positives.

 Will merge to 'next'?
 source: <pull.1238.git.1653351786.gitgitgadget@gmail.com>


* kl/setup-in-unreadable-worktree (2022-05-24) 1 commit
 - setup: don't die if realpath(3) fails on getcwd(3)

 Disable the "do not remove the directory the user started Git in"
 logic when Git cannot tell where that directory is.  Earlier we
 refused to run in such a case.

 Will merge to 'next'.
 source: <8b20840014d214023c50ee62439147f798e6f9cc.1653419993.git.kevin@kevinlocke.name>


* pb/use-freebsd-12.3-in-cirrus-ci (2022-05-25) 1 commit
 - ci: update Cirrus-CI image to FreeBSD 12.3

 Update the version of FreeBSD image used in Cirrus CI.

 Will merge to 'next'.
 source: <20220525125112.86954-1-levraiphilippeblain@gmail.com>


* yw/cmake-updates (2022-05-24) 3 commits
 - cmake: remove (_)UNICODE def on Windows in CMakeLists.txt
 - cmake: add pcre2 support
 - cmake: fix CMakeLists.txt on Linux

 CMake updates.

 Will merge to 'next'?
 source: <pull.1267.v2.git.git.1653374328.gitgitgadget@gmail.com>


* sg/build-gitweb (2022-05-25) 1 commit
 - Makefile: build 'gitweb' in the default target

 "make all" should but didn't build "gitweb".

 Will merge to 'next'.
 source: <20220525205651.825669-1-szeder.dev@gmail.com>

--------------------------------------------------
[Stalled]

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


* ab/ci-github-workflow-markup (2022-05-22) 12 commits
 . fixup! ci: make it easier to find failed tests' logs in the GitHub workflow
 . ci: call `finalize_test_case_output` a little later
 . ci: use `--github-workflow-markup` in the GitHub workflow
 . ci: optionally mark up output in the GitHub workflow
 . test(junit): avoid line feeds in XML attributes
 . tests: refactor --write-junit-xml code
 . ci: make it easier to find failed tests' logs in the GitHub workflow
 . CI: stop setting FAILED_TEST_ARTIFACTS N times
 . CI: don't include "test-results/" in ci/print-test-failures.sh output
 . CI: add --exit-code to ci/print-test-failures.sh
 . CI: don't "cd" in ci/print-test-failures.sh
 . Merge branch 'ab/ci-setup-simplify' into ab/ci-github-workflow-markup
 (this branch uses ab/ci-setup-simplify.)

 Build a moral equivalent of js/ci-github-workflow-markup on top of
 ab/ci-setup-simplify.
 source: <RFC-cover-v5-00.10-00000000000-20220421T183001Z-avarab@gmail.com>


* ab/ci-setup-simplify (2022-04-21) 29 commits
 . CI: make it easy to use ci/*.sh outside of CI
 . CI: don't use "set -x" in "ci/lib.sh" output
 . CI: set PYTHON_PATH setting for osx-{clang,gcc} into "$jobname" case
 . CI: set SANITIZE=leak in MAKEFLAGS directly
 . CI: set CC in MAKEFLAGS directly, don't add it to the environment
 . CI: add more variables to MAKEFLAGS, except under vs-build
 . CI: narrow down variable definitions in --build and --test
 . CI: only invoke ci/lib.sh as "steps" in main.yml
 . CI: pre-select test slice in Windows & VS tests
 . ci/run-test-slice.sh: replace shelling out with "echo"
 . CI: move "env" definitions into ci/lib.sh
 . CI: combine ci/install{,-docker}-dependencies.sh
 . CI: split up and reduce "ci/test-documentation.sh"
 . CI: invoke "make artifacts-tar" directly in windows-build
 . CI: check ignored unignored build artifacts in "win[+VS] build" too
 . CI: make ci/{lib,install-dependencies}.sh POSIX-compatible
 . CI: remove "run-build-and-tests.sh", run "make [test]" directly
 . CI: export variables via a wrapper
 . CI: consistently use "export" in ci/lib.sh
 . CI: move p4 and git-lfs variables to ci/install-dependencies.sh
 . CI: have "static-analysis" run "check-builtins", not "documentation"
 . CI: have "static-analysis" run a "make ci-static-analysis" target
 . CI: don't have "git grep" invoke a pager in tree content check
 . CI/lib.sh: stop adding leading whitespace to $MAKEFLAGS
 . CI: remove unused Azure ci/* code
 . CI: remove dead "tree skipping" code
 . CI: remove more dead Travis CI support
 . CI: make "$jobname" explicit, remove fallback
 . CI: run "set -ex" early in ci/lib.sh
 (this branch is used by ab/ci-github-workflow-markup.)

 Drive more actions done in CI via the Makefile instead of shell
 commands sprinkled in .github/workflows/main.yml
 source: <cover-v5-00.29-00000000000-20220421T181526Z-avarab@gmail.com>


* et/xdiff-indirection (2022-02-17) 1 commit
 - xdiff: provide indirection to git functions

 Insert a layer of preprocessor macros for common functions in xdiff
 codebase.

 Will discard, as it has been stalled for way too long.
 cf. <xmqqbkyudb8n.fsf@gitster.g>
 source: <20220217225408.GB7@edef91d97c94>


* bc/stash-export (2022-04-08) 4 commits
 - builtin/stash: provide a way to import stashes from a ref
 - builtin/stash: provide a way to export stashes to a ref
 - builtin/stash: factor out revision parsing into a function
 - object-name: make get_oid quietly return an error

 A mechanism to export and import stash entries to and from a normal
 commit to transfer it across repositories has been introduced.

 Expecting a reroll.
 cf. <YnL2d4Vr9Vr7W4Hj@camp.crustytoothpaste.net>
 source: <20220407215352.3491567-1-sandals@crustytoothpaste.net>


* js/wait-or-whine-can-fail (2022-04-28) 1 commit
 - run-command: don't spam trace2_child_exit()

 We used to log an error return from wait_or_whine() as process
 termination of the waited child, which was incorrect.

 Needs clarifying "in rare cases".
 source: <4616d09ffa632bd2c9e308a713c4bdf2a1328c3c.1651179450.git.steadmon@google.com>


* dl/prompt-pick-fix (2022-03-25) 1 commit
 . git-prompt: fix sequencer/todo detection

 Fix shell prompt script (in contrib/) for those who set
 rebase.abbreviateCommands; we failed to recognize that we were in a
 multi-step cherry-pick session.

 Will discard, as it has been stalled for way too long.
 cf. <xmqqwngdzque.fsf@gitster.g>
 source: <20220325145301.3370-1-danny0838@gmail.com>


* es/superproject-aware-submodules (2022-03-09) 3 commits
 . rev-parse: short-circuit superproject worktree when config unset
 . introduce submodule.hasSuperproject record
 . t7400-submodule-basic: modernize inspect() helper

 A configuration variable in a repository tells if it is (or is not)
 a submodule of a superproject.

 Will discard, as it has been stalled for way too long.
 cf. <kl6l4k45s7cb.fsf@chooglen-macbookpro.roam.corp.google.com>
 source: <20220310004423.2627181-1-emilyshaffer@google.com>


* cw/remote-object-info (2022-05-06) 11 commits
 - SQUASH??? coccicheck
 - SQUASH??? ensure that coccicheck is happy
 - SQUASH??? compilation fix
 - cat-file: add --batch-command remote-object-info command
 - cat-file: move parse_cmd and DEFAULT_FORMAT up
 - transport: add object-info fallback to fetch
 - transport: add client side capability to request object-info
 - object-info: send attribute packet regardless of object ids
 - object-store: add function to free object_info contents
 - fetch-pack: move fetch default settings
 - fetch-pack: refactor packet writing

 A client component to talk with the object-info endpoint.

 Expecting a reroll.
 source: <20220502170904.2770649-1-calvinwan@google.com>

--------------------------------------------------
[Cooking]

* js/ci-github-workflow-markup (2022-05-21) 12 commits
 - ci: call `finalize_test_case_output` a little later
 - ci(github): mention where the full logs can be found
 - ci: use `--github-workflow-markup` in the GitHub workflow
 - ci(github): avoid printing test case preamble twice
 - ci(github): skip the logs of the successful test cases
 - ci: optionally mark up output in the GitHub workflow
 - ci/run-build-and-tests: add some structure to the GitHub workflow output
 - ci: make it easier to find failed tests' logs in the GitHub workflow
 - ci/run-build-and-tests: take a more high-level view
 - test(junit): avoid line feeds in XML attributes
 - tests: refactor --write-junit-xml code
 - ci: fix code style

 Update the GitHub workflow support to make it quicker to get to the
 failing test.

 Will merge to 'next'?
 source: <pull.1117.v3.git.1653171536.gitgitgadget@gmail.com>


* js/bisect-in-c (2022-05-21) 15 commits
 - bisect: no longer try to clean up left-over `.git/head-name` files
 - bisect: remove Cogito-related code
 - Turn `git bisect` into a full built-in
 - bisect: teach the `bisect--helper` command to show the correct usage strings
 - bisect: move even the command-line parsing to `bisect--helper`
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

 Will merge to 'next'?
 source: <pull.1132.v3.git.1653144546.gitgitgadget@gmail.com>


* cb/path-owner-check-with-sudo-plus (2022-05-12) 1 commit
 - git-compat-util: allow root to access both SUDO_UID and root owned
 (this branch uses cb/path-owner-check-with-sudo.)

 "sudo git foo" used to consider a repository owned by the original
 user a safe one to access; it now also considers a repository owned
 by root a safe one, too (after all, if an attacker can craft a
 malicious repository owned by root, the box is 0wned already).
 source: <20220513010020.55361-1-carenas@gmail.com>


* jc/t6424-failing-merge-preserve-local-changes (2022-05-19) 1 commit
  (merged to 'next' on 2022-05-23 at 849cf6f24c)
 + t6424: make sure a failed merge preserves local changes

 The tests that ensured merges stop when interfering local changes
 are present did not make sure that local changes are preserved; now
 they do.

 Will merge to 'master'.
 source: <xmqqbkvtnyae.fsf@gitster.g>


* tb/geom-repack-with-keep-and-max (2022-05-20) 3 commits
 - builtin/repack.c: ensure that `names` is sorted
 - t7703: demonstrate object corruption with pack.packSizeLimit
 - repack: respect --keep-pack with geometric repack

 source: <cover.1653073280.git.me@ttaylorr.com>


* ab/hooks-regression-fix (2022-05-18) 8 commits
 - hook API: fix v2.36.0 regression: hooks should be connected to a TTY
 - hook API: don't redundantly re-set "no_stdin" and "stdout_to_stderr"
 - hook tests: fix redirection logic error in 96e7225b310
 - run-command: add an "ungroup" option to run_process_parallel()
 - run-command.c: add an initializer for "struct parallel_processes"
 - run-command tests: test stdout of run_command_parallel()
 - run-command API: use "opts" struct for run_processes_parallel{,_tr2}()
 - run-command tests: change if/if/... to if/else if/else

 In Git 2.36 we revamped the way how hooks are invoked.  One change
 that is end-user visible is that the output of a hook is no longer
 directly connected to the standard output of "git" that spawns the
 hook, which was noticed post release.  This is getting corrected.
 source: <cover-v2-0.8-00000000000-20220518T195858Z-avarab@gmail.com>


* tb/midx-race-in-pack-objects (2022-05-24) 4 commits
 - builtin/pack-objects.c: ensure pack validity from MIDX bitmap objects
 - builtin/pack-objects.c: ensure included `--stdin-packs` exist
 - builtin/pack-objects.c: avoid redundant NULL check
 - pack-bitmap.c: check preferred pack validity when opening MIDX bitmap

 The multi-pack-index code did not protect the packfile it is going
 to depend on from getting removed while in use, which has been
 corrected.

 Will merge to 'next'?
 source: <cover.1653418457.git.me@ttaylorr.com>


* ds/bundle-uri (2022-05-16) 8 commits
  (merged to 'next' on 2022-05-25 at 43b1b9092c)
 + bundle.h: make "fd" version of read_bundle_header() public
 + remote: allow relative_url() to return an absolute url
 + remote: move relative_url()
 + http: make http_get_file() external
 + fetch-pack: move --keep=* option filling to a function
 + fetch-pack: add a deref_without_lazy_fetch_extended()
 + dir API: add a generalized path_match_flags() function
 + connect.c: refactor sending of agent & object-format
 (this branch is used by ds/bundle-uri-more.)

 Preliminary code refactoring around transport and bundle code.

 Will merge to 'master'.
 source: <pull.1233.git.1652731865.gitgitgadget@gmail.com>


* ds/sparse-sparse-checkout (2022-05-23) 10 commits
 - sparse-checkout: integrate with sparse index
 - p2000: add test for 'git sparse-checkout [add|set]'
 - sparse-index: complete partial expansion
 - sparse-index: partially expand directories
 - sparse-checkout: --no-sparse-index needs a full index
 - cache-tree: implement cache_tree_find_path()
 - sparse-index: introduce partially-sparse indexes
 - sparse-index: create expand_index()
 - t1092: stress test 'git sparse-checkout set'
 - t1092: refactor 'sparse-index contents' test

 "sparse-checkout" learns to work well with the sparse-index
 feature.

 Will merge to 'next'?
 source: <pull.1208.v3.git.1653313726.gitgitgadget@gmail.com>


* gc/bare-repo-discovery (2022-05-16) 3 commits
 - SQUASH??? move new test to t0035
 - setup.c: learn discovery.bareRepository=cwd
 - setup.c: make bare repo discovery optional

 Introduce a discovery.barerepository configuration variable that
 allows users to forbid discovery of bare repositories.

 Expecting a reroll.
 source: <pull.1261.v2.git.git.1652485058.gitgitgadget@gmail.com>


* ds/object-file-unpack-loose-header-fix (2022-05-16) 1 commit
 - object-file: convert 'switch' back to 'if'

 Coding style fix.

 Will merge to 'next'.
 source: <377be0e9-8a0f-4a86-0a66-3b08c0284dae@github.com>


* gg/worktree-from-the-above (2022-05-20) 3 commits
 - dir: minor refactoring / clean-up
 - dir: cache git_dir's realpath
 - dir: traverse into repository

 With a non-bare repository, with core.worktree pointing at a
 directory that has the repository as its subdirectory, regressed in
 Git 2.27 days.

 Needs review.
 source: <20220520192840.8942-1-ggossdev@gmail.com>


* ac/remote-v-with-object-list-filters (2022-05-09) 1 commit
  (merged to 'next' on 2022-05-20 at 8d2dc10d8f)
 + builtin/remote.c: teach `-v` to list filters for promisor remotes

 "git remote -v" now shows the list-objects-filter used during
 fetching from the remote, if available.

 Will merge to 'master'.
 source: <pull.1227.v4.git.1652095969026.gitgitgadget@gmail.com>


* cc/http-curlopt-resolve (2022-05-16) 1 commit
  (merged to 'next' on 2022-05-20 at 80a07dc7de)
 + http: add custom hostname to IP address resolutions

 With the new http.curloptResolve configuration, the CURLOPT_RESOLVE
 mechanism that allows cURL based applications to use pre-resolved
 IP addresses for the requests is exposed to the scripts.

 Will merge to 'master'.
 source: <20220516083851.202057-1-chriscool@tuxfamily.org>


* jx/l10n-workflow-change (2022-05-23) 8 commits
 - l10n: Document the new l10n workflow
 - Makefile: add "po-init" rule to initialize po/XX.po
 - Makefile: add "po-update" rule to update po/XX.po
 - po/git.pot: don't check in result of "make pot"
 - i18n CI: stop allowing non-ASCII source messages in po/git.pot
 - Makefile: have "make pot" not "reset --hard"
 - Makefile: generate "po/git.pot" from stable LOCALIZED_C
 - Makefile: sort "po/git.pot" by file location

 A workflow change for translators are being proposed.

 Will merge to 'next'?
 source: <20220523012531.4505-1-worldhello.net@gmail.com>


* cb/path-owner-check-with-sudo (2022-05-12) 3 commits
  (merged to 'next' on 2022-05-19 at d282e56560)
 + t0034: add negative tests and allow git init to mostly work under sudo
 + git-compat-util: avoid failing dir ownership checks if running privileged
 + t: regression git needs safe.directory when using sudo
 (this branch is used by cb/path-owner-check-with-sudo-plus.)

 With a recent update to refuse access to repositories of other
 people by default, "sudo make install" and "sudo git describe"
 stopped working.  This series intends to loosen it while keeping
 the safety.

 Will merge to 'master'.
 source: <20220513010020.55361-1-carenas@gmail.com>


* cg/tools-for-git-doc (2022-04-21) 1 commit
  (merged to 'next' on 2022-05-19 at e6b6309afb)
 + Documentation/ToolsForGit.txt: Tools for developing Git

 A new doc that lists tips for tools to work with Git's codebase.

 Will merge to 'master'.
 source: <20220421084515.21236-2-cogoni.guillaume@gmail.com>


* ar/send-email-confirm-by-default (2022-04-22) 1 commit
 - send-email: always confirm by default

 "git send-email" is changed so that by default it asks for
 confirmation before sending each message out.

 Will discard.

 I wanted to like this, and had it in the version of Git I use
 myself for daily work, but the prompting turned out to be somewhat
 distracting.

 Thoughts?
 source: <20220422083629.1404989-1-hi@alyssa.is>


* ab/env-array (2022-05-20) 4 commits
 - run-command API users: use "env" not "env_array" in comments & names
 - cocci: remove env_array -> env migration
 - run-command API: rename "env_array" to "env"
 - cocci: add a rename of "struct child_process"'s "env_array" to "env"

 Rename .env_array member to .env in the child_process structure.

 Expecting a (hopefully final) reroll, before merging it to 'next'.
 cf. <xmqqilq0jhk2.fsf@gitster.g>
 source: <cover-v2-0.4-00000000000-20220520T072122Z-avarab@gmail.com>


* ab/plug-leak-in-revisions (2022-04-13) 28 commits
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

 Will merge to 'next'?
 source: <cover-v6-00.27-00000000000-20220413T195935Z-avarab@gmail.com>


* ns/batch-fsync (2022-04-06) 13 commits
  (merged to 'next' on 2022-05-23 at 379d8bd500)
 + core.fsyncmethod: performance tests for batch mode
 + t/perf: add iteration setup mechanism to perf-lib
 + core.fsyncmethod: tests for batch mode
 + test-lib-functions: add parsing helpers for ls-files and ls-tree
 + core.fsync: use batch mode and sync loose objects by default on Windows
 + unpack-objects: use the bulk-checkin infrastructure
 + update-index: use the bulk-checkin infrastructure
 + builtin/add: add ODB transaction around add_files_to_cache
 + cache-tree: use ODB transaction around writing a tree
 + core.fsyncmethod: batched disk flushes for loose-objects
 + bulk-checkin: rebrand plug/unplug APIs as 'odb transactions'
 + bulk-checkin: rename 'state' variable and separate 'plugged' boolean
 + Merge branch 'ns/core-fsyncmethod' into ns/batch-fsync

 Introduce a filesystem-dependent mechanism to optimize the way the
 bits for many loose object files are ensured to hit the disk
 platter.

 Will merge to 'master'.
 source: <pull.1134.v5.git.1648616734.gitgitgadget@gmail.com>


* en/sparse-cone-becomes-default (2022-04-21) 9 commits
  (merged to 'next' on 2022-05-13 at c168eb55cf)
 + Documentation: some sparsity wording clarifications
 + git-sparse-checkout.txt: mark non-cone mode as deprecated
 + git-sparse-checkout.txt: flesh out pattern set sections a bit
 + git-sparse-checkout.txt: add a new EXAMPLES section
 + git-sparse-checkout.txt: shuffle some sections and mark as internal
 + git-sparse-checkout.txt: update docs for deprecation of 'init'
 + git-sparse-checkout.txt: wording updates for the cone mode default
 + sparse-checkout: make --cone the default
 + tests: stop assuming --no-cone is the default mode for sparse-checkout

 Deprecate non-cone mode of the sparse-checkout feature.

 Will cook in 'next' til 06-03 and then merge to 'master'.
 source: <pull.1148.v3.git.1650594746.gitgitgadget@gmail.com>


* tb/cruft-packs (2022-05-25) 18 commits
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
 - fixup! pack-mtimes: support reading .mtimes files
 - pack-mtimes: support reading .mtimes files
 - Documentation/technical: add cruft-packs.txt

 A mechanism to pack unreachable objects into a "cruft pack",
 instead of ejecting them into loose form to be reclaimed later, has
 been introduced.

 Will merge to 'next' after squashing fixup! in???
 source: <cover.1653088640.git.me@ttaylorr.com>


* tk/simple-autosetupmerge (2022-04-29) 3 commits
  (merged to 'next' on 2022-05-19 at 9666852f1e)
 + push: new config option "push.autoSetupRemote" supports "simple" push
 + push: default to single remote even when not named origin
 + branch: new autosetupmerge option 'simple' for matching branches

 "git -c branch.autosetupmerge=simple branch $A $B" will set the $B
 as $A's upstream only when $A and $B shares the same name, and "git
 -c push.default=simple" on branch $A would push to update the
 branch $A at the remote $B came from.  Also more places use the
 sole remote, if exists, before defaulting to 'origin'.

 Will merge to 'master'.
 source: <pull.1161.v5.git.1651226206.gitgitgadget@gmail.com>


* jh/builtin-fsmonitor-part3 (2022-05-25) 31 commits
 - t7527: improve implicit shutdown testing in fsmonitor--daemon
 - fsmonitor--daemon: allow --super-prefix argument
 - t7527: test Unicode NFC/NFD handling on MacOS
 - t/lib-unicode-nfc-nfd: helper prereqs for testing unicode nfc/nfd
 - t/helper/hexdump: add helper to print hexdump of stdin
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

 Expecting further work.
 Breaks its own t7527?
 source: <pull.1143.v8.git.1653490852.gitgitgadget@gmail.com>


* js/scalar-diagnose (2022-05-25) 9 commits
 - fixup! archive --add-virtual-file: allow paths containing colons
 - fixup! archive: optionally add "virtual" files
 - scalar: teach `diagnose` to gather loose objects information
 - scalar: teach `diagnose` to gather packfile info
 - scalar diagnose: include disk space information
 - Implement `scalar diagnose`
 - scalar: validate the optional enlistment argument
 - archive --add-virtual-file: allow paths containing colons
 - archive: optionally add "virtual" files

 Implementation of "scalar diagnose" subcommand.

 Will merge to 'next'?
 source: <pull.1128.v6.git.1653145696.gitgitgadget@gmail.com>


* js/use-builtin-add-i (2021-12-01) 2 commits
  (merged to 'next' on 2022-05-23 at a6434bc6f7)
 + add -i: default to the built-in implementation
 + t2016: require the PERL prereq only when necessary

 "git add -i" was rewritten in C some time ago and has been in
 testing; the reimplementation is now exposed to general public by
 default.

 Will merge to 'master'.
 source: <pull.1087.git.1638281655.gitgitgadget@gmail.com>
