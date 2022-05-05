Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D535C433EF
	for <git@archiver.kernel.org>; Thu,  5 May 2022 19:28:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349616AbiEETcf (ORCPT <rfc822;git@archiver.kernel.org>);
        Thu, 5 May 2022 15:32:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232129AbiEETcd (ORCPT <rfc822;git@vger.kernel.org>);
        Thu, 5 May 2022 15:32:33 -0400
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFACE34652
        for <git@vger.kernel.org>; Thu,  5 May 2022 12:28:50 -0700 (PDT)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
        by pb-smtp20.pobox.com (Postfix) with ESMTP id 0EA571AD20E;
        Thu,  5 May 2022 15:28:50 -0400 (EDT)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to
        :subject:date:message-id:mime-version:content-type; s=sasl; bh=u
        ILF/nXs5a4qNsZNfR5otn2sCTi9DIZc/W2S38oWUgM=; b=xv59NOnxuAv6pfq5Q
        rD8RTV1nfzqkNGBC8eQkbuVjfXIUID7/VY/LvlA657xgTbiMBR2WnXI+fV2sL0kl
        OPBpmhuffFGCU55gmSE2m0yF1iC9LuKcvPthxnLFGtoF2YnYyFs3k+/DM9rqd6nS
        flXuSjPoUOvonekuTEh2xCrK+M=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp20.pobox.com (Postfix) with ESMTP id 05BF81AD20D;
        Thu,  5 May 2022 15:28:50 -0400 (EDT)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [34.83.65.128])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 50CDB1AD20B;
        Thu,  5 May 2022 15:28:46 -0400 (EDT)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (May 2022, #02; Thu, 5)
X-master-at: f5aaf72f1b5aeb3b77bccabce014ea2590e823e2
X-next-at: b09085170807c0234d945e787c60e6af100d2712
X-Gnus-Delayed: Thu, 05 May 2022 12:43:32 -0700
Date:   Thu, 05 May 2022 12:28:45 -0700
Message-ID: <xmqqlevfdbiq.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID: 95073574-CCA9-11EC-8387-C85A9F429DF0-77302942!pb-smtp20.pobox.com
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Here are the topics that have been cooking in my tree.  Commits
prefixed with '+' are in 'next' (being in 'next' is a sign that a
topic is stable enough to be used and are candidate to be in a
future release).  Commits prefixed with '-' are only in 'seen',
and aren't considered "accepted" at all.

The 2.36 release unfortunately turned out to be a release with
unusually high number of regressions.  We have dealt with a few of
them on the 'master' front already, and I am planning to cut 2.36.1
soonish by merging them down to 'maint'.

There are a few more whose fixes have not been adequately reviewed
or agreed upon.

 - hooks no longer is connected directly to the standard output.
   cf. <CA+dzEBn108QoMA28f0nC8K21XT+Afua0V2Qv8XkR8rAeqUCCZw@mail.gmail.com>

 - "sudo make install" does not work out-of-the-box.
   cf. <4ef9287b-6260-9538-7c89-cffb611520ee@maurel.de>

These fixed soon, 2.36.2 needs to follow, but one step at a time.

We're in week #2 of this cycle (https://tinyurl.com/gitCal), which
is expected to conclude in early July.

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

* ab/cc-package-fixes (2022-04-22) 1 commit
  (merged to 'next' on 2022-05-02 at 59e6137286)
 + CI: select CC based on CC_PACKAGE (again)

 Correct choices of C compilers used in various CI jobs.
 source: <patch-v3-1.1-8b3444ecc87-20220422T092015Z-avarab@gmail.com>


* cm/reftable-0-length-memset (2022-04-15) 1 commit
  (merged to 'next' on 2022-05-02 at 781715e2b7)
 + reftable: avoid undefined behaviour breaking t0032

 Code clean-up.
 source: <20220415083058.29495-1-carenas@gmail.com>


* ds/midx-normalize-pathname-before-comparison (2022-04-25) 3 commits
  (merged to 'next' on 2022-05-02 at aba30d3c42)
 + cache: use const char * for get_object_directory()
 + multi-pack-index: use --object-dir real path
 + midx: use real paths in lookup_multi_pack_index()

 The path taken by "git multi-pack-index" command from the end user
 was compared with path internally prepared by the tool withut first
 normalizing, which lead to duplicated paths not being noticed,
 which has been corrected.
 source: <pull.1221.v2.git.1650911234.gitgitgadget@gmail.com>


* jc/clone-remote-name-leak-fix (2022-04-30) 1 commit
  (merged to 'next' on 2022-05-02 at 32a51558ea)
 + clone: plug a miniscule leak

 "git clone --origin X" leaked piece of memory that held value read
 from the clone.defaultRemoteName configuration variable, which has
 been plugged.
 source: <xmqqlevl4ysk.fsf@gitster.g>


* jc/cocci-xstrdup-or-null-fix (2022-04-30) 1 commit
  (merged to 'next' on 2022-05-02 at dda0f8bfce)
 + cocci: drop bogus xstrdup_or_null() rule

 Get rid of a bogus and over-eager coccinelle rule.
 source: <xmqq1qxd6e4x.fsf@gitster.g>


* jc/show-pathspec-fix (2022-04-29) 1 commit
  (merged to 'next' on 2022-05-02 at 7781c7b275)
 + 2.36 show regression fix

 "git show <commit1> <commit2>... -- <pathspec>" lost the pathspec
 when showing the second and subsequent commits, which has been
 corrected.
 source: <xmqqo80j87g0.fsf_-_@gitster.g>


* rs/fast-export-pathspec-fix (2022-04-30) 1 commit
  (merged to 'next' on 2022-05-02 at 0fb97cb01d)
 + 2.36 fast-export regression fix

 "git fast-export -- <pathspec>" lost the pathspec when showing the
 second and subsequent commits, which has been corrected.
 source: <2c988c7b-0efe-4222-4a43-8124fe1a9da6@web.de>


* rs/format-patch-pathspec-fix (2022-04-30) 1 commit
  (merged to 'next' on 2022-05-02 at 1f0a9f982a)
 + 2.36 format-patch regression fix

 "git format-patch <args> -- <pathspec>" lost the pathspec when
 showing the second and subsequent commits, which has been
 corrected.
 source: <c36896a1-6247-123b-4fa3-b7eb24af1897@web.de>

--------------------------------------------------
[New Topics]

* ac/remote-v-with-object-list-filters (2022-05-04) 1 commit
 - builtin/remote.c: teach `-v` to list filters for promisor remotes

 source: <pull.1227.v2.git.1651591253333.gitgitgadget@gmail.com>


* cc/http-curlopt-resolve (2022-05-04) 1 commit
 - http: add custom hostname to IP address resolutions

 source: <20220504104601.136403-1-chriscool@tuxfamily.org>


* js/trace2-doc-fixes (2022-05-04) 6 commits
 - trace2 docs: add missing full stop
 - trace2 docs: clarify what `varargs` is all about
 - trace2 docs: fix a JSON formatted example
 - trace2 docs: surround more terms in backticks
 - trace2 docs: "printf" is not an English word
 - trace2 docs: a couple of grammar fixes

 source: <pull.1172.v2.git.1651573607.gitgitgadget@gmail.com>


* jx/l10n-workflow-change (2022-05-04) 9 commits
 - l10n: Document the new l10n workflow
 - Makefile: add "po-init" rule to initialize po/XX.po
 - Makefile: add "po-update" rule to update po/XX.po
 - po/git.pot: don't check in result of "make pot"
 - po/git.pot: this is now a generated file
 - i18n CI: stop allowing non-ASCII source messages in po/git.pot
 - Makefile: have "make pot" not "reset --hard"
 - Makefile: generate "po/git.pot" from stable LOCALIZED_C
 - Makefile: sort "po/git.pot" by file location

 source: <20220503132354.9567-1-worldhello.net@gmail.com>


* tk/p4-metadata-coding-strategies (2022-05-04) 1 commit
 - git-p4: improve encoding handling to support inconsistent encodings

 source: <pull.1206.v4.git.1651346812586.gitgitgadget@gmail.com>

--------------------------------------------------
[Stalled]

* ab/commit-plug-leaks (2022-02-16) 2 commits
 - commit: use strbuf_release() instead of UNLEAK()
 - commit: fix "author_ident" leak

 Leakfixes in the top-level called-once function.

 Expecting a reroll.
 I think UNLEAK->strbuf_release() is a regression.
 source: <cover-0.2-00000000000-20220216T081844Z-avarab@gmail.com>


* dl/prompt-pick-fix (2022-03-25) 1 commit
 . git-prompt: fix sequencer/todo detection

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


* cw/remote-object-info (2022-05-04) 10 commits
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

* ep/equals-null-cocci (2022-05-02) 2 commits
 - tree-wide: apply equals-null.cocci
 - Merge branch 'ep/maint-equals-null-cocci' into ep/equals-null-cocci
 (this branch uses ep/maint-equals-null-cocci.)

 Merges up ep/maint-equals-null-cocci to the current codebase.

 Will merge to 'next'?


* ep/maint-equals-null-cocci (2022-05-02) 4 commits
 - tree-wide: apply equals-null.cocci
 - Merge branch 'ep/maint-equals-null-cocci' for maint-2.35
 - tree-wide: apply equals-null.cocci
 - contrib/coccinnelle: add equals-null.cocci
 (this branch is used by ep/equals-null-cocci.)

 Introduce and apply coccinelle rule to discourage an explicit
 comparison between a pointer and NULL, and applies the clean-up to
 the maintenance track.

 Will merge to 'next'?


* js/wait-or-whine-can-fail (2022-04-28) 1 commit
 - run-command: don't spam trace2_child_exit()

 We used to log an error return from wait_or_whine() as process
 termination of the waited child, which was incorrect.

 Needs clarifying "in rare cases".
 source: <4616d09ffa632bd2c9e308a713c4bdf2a1328c3c.1651179450.git.steadmon@google.com>


* ds/sparse-colon-path (2022-04-26) 5 commits
 - rev-parse: integrate with sparse index
 - object-name: diagnose trees in index properly
 - object-name: reject trees found in the index
 - show: integrate with the sparse index
 - t1092: add compatibility tests for 'git show'

 "git show :<path>" learned to work better with the sparse-index
 feature.

 Will merge to 'next'.
 source: <pull.1207.v2.git.1651005800.gitgitgadget@gmail.com>


* cb/path-owner-check-with-sudo (2022-05-02) 3 commits
 - t0034: enhance framework to allow testing more commands under sudo
 - git-compat-util: avoid failing dir ownership checks if running privileged
 - t: document regression git safe.directory when using sudo

 With a recent update to refuse access to repositories of other
 people by default, "sudo make install" and "sudo git describe"
 stopped working.  This series intends to loosen it while keeping
 the safety.
 source: <20220502183920.88982-1-carenas@gmail.com>


* pb/ggg-in-mfc-doc (2022-04-27) 3 commits
 - MyFirstContribution: drop PR description for GGG single-patch contributions
 - MyFirstContribution: also explain cover letter in GitGitGadget section
 - MyFirstContribution: move cover letter description to a separate file

 Documentation update.

 Expecting a reroll.
 cf. <706e34fb-fb0c-e86d-5d0f-0bd052566b3a@gmail.com>
 source: <pull.1226.git.1651086288.gitgitgadget@gmail.com>


* sg/safe-directory-tests-and-docs (2022-04-27) 3 commits
 - safe.directory: document and check that it's ignored in the environment
 - t0033-safe-directory: check when 'safe.directory' is ignored
 - t0033-safe-directory: check the error message without matching the trash dir

 New tests for the safe.directory mechanism.

 Will merge to 'next'.
 source: <20220427170649.4949-1-szeder.dev@gmail.com>


* ah/rebase-keep-base-fix (2022-04-21) 1 commit
  (merged to 'next' on 2022-05-02 at 8e6071e208)
 + rebase: use correct base for --keep-base when a branch is given

 "git rebase --keep-base <upstream> <branch-to-rebase>" computed the
 commit to rebase onto incorrectly, which has been corrected.

 Will merge to 'master'.
 source: <20220421044233.894255-1-alexhenrie24@gmail.com>


* cg/tools-for-git-doc (2022-04-21) 1 commit
 - Documentation/ToolsForGit.txt: Tools for developing Git

 A new doc that lists tips for tools to work with Git's codebase.

 Thoughts?
 source: <20220421084515.21236-2-cogoni.guillaume@gmail.com>


* ea/rebase-code-simplify (2022-04-20) 1 commit
  (merged to 'next' on 2022-05-02 at 88ed49c2d0)
 + rebase: simplify an assignment of options.type in cmd_rebase

 Code clean-up.

 Will merge to 'master'.
 source: <20220418172721.215898-1-eantoranz@gmail.com>


* kt/commit-graph-plug-fp-leak-on-error (2022-04-20) 1 commit
  (merged to 'next' on 2022-05-02 at c3bcb92518)
 + commit-graph: close file before returning NULL

 Fix a leak of FILE * in an error codepath.

 Will merge to 'master'.
 source: <pull.1213.git.1650302007395.gitgitgadget@gmail.com>


* ab/valgrind-fixes (2022-04-21) 4 commits
 - object-file: fix a unpack_loose_header() regression in 3b6a8db3b03
 - commit-graph.c: don't assume that stat() succeeds
 - log test: skip a failing mkstemp() test under valgrind
 - tests: make RUNTIME_PREFIX compatible with --valgrind

 A bit of test framework fixes with a few fixes to issues found by
 valgrind.

 Expecting a reroll.
 source: <cover-0.4-00000000000-20220421T200733Z-avarab@gmail.com>


* cb/ci-make-p4-optional (2022-04-25) 6 commits
 - fixup! ci: make failure to find perforce more user friendly
 - fixup! CI: use https, not http to download binaries from perforce.com
 - CI: use https, not http to download binaries from perforce.com
 - ci: reintroduce prevention from perforce being quarantined in macOS
 - ci: avoid brew for installing perforce
 - ci: make failure to find perforce more user friendly

 macOS CI jobs have been occasionally flaky due to tentative version
 skew between perforce and the homebrew packager.  Instead of
 failing the whole CI job, just let it skip the p4 tests when this
 happens.

 Expecting a reroll.
 source: <20220423142559.32507-1-carenas@gmail.com>
 source: <0220423142559.32507-5-carenas@gmail.com>


* jc/show-branch-g-current (2022-04-21) 1 commit
 - show-branch: -g and --current are incompatible

 The "--current" option of "git show-branch" should have been made
 incompatible with the "--reflog" mode, but this was not enforced,
 which has been corrected.
 source: <xmqqh76mf7s4.fsf_-_@gitster.g>


* rs/external-diff-tempfile (2022-04-20) 2 commits
 - diff: use mks_tempfile_dt()
 - tempfile: add mks_tempfile_dt()

 The temporary files fed to external diff command are now generated
 inside a new temporary directory under the same basename.

 Will merge to 'next'.
 source: <2ad1dd80-e79f-7304-219c-db24bb269c4d@web.de>


* ab/hooks-regression-fix (2022-04-21) 6 commits
 - hook API: fix v2.36.0 regression: hooks should be connected to a TTY
 - hook API: don't redundantly re-set "no_stdin" and "stdout_to_stderr"
 - hook tests: fix redirection logic error in 96e7225b310
 - run-command: add an "ungroup" option to run_process_parallel()
 - run-command tests: test stdout of run_command_parallel()
 - run-command API: replace run_processes_parallel_tr2() with opts struct

 In Git 2.36 we revamped the way how hooks are invoked.  One change
 that is end-user visible is that the output of a hook is no longer
 directly connected to the standard output of "git" that spawns the
 hook, which was noticed post release.  This is getting corrected.

 Expecting a reroll.
 source: <cover-0.6-00000000000-20220421T122108Z-avarab@gmail.com>


* ar/send-email-confirm-by-default (2022-04-22) 1 commit
 - send-email: always confirm by default

 "git send-email" is changed so that by default it asks for
 confirmation before sending each message out.

 Thoughts?
 source: <20220422083629.1404989-1-hi@alyssa.is>


* mv/log-since-as-filter (2022-04-23) 1 commit
 - log: "--since-as-filter" option is a non-terminating "--since" variant

 "git log --since=X" will stop traversal upon seeing a commit that
 is older than X, but there may be commits behind it that is younger
 than X when the commit was created with a faulty clock.  A new
 option is added to keep digging without stopping, and instead
 filter out commits with timestamp older than X.

 Will merge to 'next'.
 source: <YmP4TaYmSEi6GeB4@vmiklos.hu>


* ds/do-not-call-bug-on-bad-refs (2022-04-25) 1 commit
 - clone: die() instead of BUG() on bad refs

 Code clean-up.

 Will merge to 'next'.
 source: <pull.1214.v2.git.1650894450441.gitgitgadget@gmail.com>


* vd/sparse-stash (2022-04-27) 7 commits
 - unpack-trees: preserve index sparsity
 - stash: merge applied stash with merge-ort
 - merge-recursive: add merge function arg to 'merge_recursive_generic'
 - read-cache: set sparsity when index is new
 - sparse-index: expose 'is_sparse_index_allowed()'
 - stash: integrate with sparse index
 - stash: expand sparse-checkout compatibility testing

 Teach "git stash" to work better with sparse index entries.
 source: <pull.1171.v2.git.1651083378.gitgitgadget@gmail.com>


* sa/t1011-use-helpers (2022-04-12) 1 commit
 - t1011: replace test -f with test_path_is_file

 A GSoC practice.

 Will merge to 'next'.
 source: <20220412203722.10484-1-siddharthasthana31@gmail.com>


* ep/coverage-report-wants-test-to-have-run (2022-04-13) 1 commit
 - Makefile: add a prerequisite to the coverage-report target

 source: <20220414022513.31465-1-gitter.spiros@gmail.com>


* pw/test-malloc-with-sanitize-address (2022-04-11) 1 commit
  (merged to 'next' on 2022-05-02 at a25766055f)
 + tests: make SANITIZE=address imply TEST_NO_MALLOC_CHECK

 Avoid problems from interaction between malloc_check and address
 sanitizer.

 Will merge to 'master'.
 source: <pull.1210.git.1649507317350.gitgitgadget@gmail.com>


* rs/t7812-pcre2-ws-bug-test (2022-04-11) 1 commit
 - t7812: test PCRE2 whitespace bug

 A test to ensure workaround for an earlier pcre2 bug does work.

 Will merge to 'next'.
 source: <3a49649d-8ff9-e5a7-e3fd-33fee5068ae8@web.de>


* ah/convert-warning-message (2022-04-08) 1 commit
 - convert: clarify line ending conversion warning

 Update a few end-user facing messages around eol conversion.

 Will merge to 'next'.
 source: <20220408044154.9947-1-alexhenrie24@gmail.com>


* cg/vscode-with-gdb (2022-04-08) 1 commit
 - contrib/vscode/: debugging with VS Code and gdb

 VS code configuration updates.

 Will merge to 'next'.
 source: <20220407204001.112287-2-cogoni.guillaume@gmail.com>


* gf/unused-includes (2022-04-06) 2 commits
 - apply.c: remove unnecessary include
 - serve.c: remove unnecessary include

 Remove unused includes.

 Will merge to 'next'.
 source: <20220331194436.58005-1-garrit@slashdev.space>


* km/t3501-use-test-helpers (2022-04-06) 1 commit
 - t3501: remove test -f and stop ignoring git <cmd> exit code

 Test script updates.

 Will merge to 'next'.
 source: <20220405134742.17526-2-khalid.masum.92@gmail.com>


* pb/submodule-recurse-mode-enum (2022-04-06) 1 commit
 - submodule.h: use a named enum for RECURSE_SUBMODULES_*

 Small code clean-up.

 Will merge to 'next'.
 source: <pull.1111.v2.git.1649092211419.gitgitgadget@gmail.com>


* rs/commit-summary-wo-break-rewrite (2022-04-06) 1 commit
  (merged to 'next' on 2022-05-02 at c40509b820)
 + commit, sequencer: turn off break_opt for commit summary

 The commit summary shown after making a commit is matched to what
 is given in "git status" not to use the break-rewrite heuristics.

 Will merge to 'master'.
 source: <c35bd0aa-2e46-e710-2b39-89f18bad0097@web.de>


* tk/p4-utf8-bom (2022-04-06) 1 commit
 - git-p4: preserve utf8 BOM when importing from p4 to git

 "git p4" update.

 Will merge to 'next'.
 source: <pull.1203.git.1649051436934.gitgitgadget@gmail.com>


* tk/p4-with-explicity-sync (2022-04-06) 1 commit
 - git-p4: support explicit sync of arbitrary existing git-p4 refs

 "git p4" update.

 Will merge to 'next'.
 source: <pull.1202.git.1649049054600.gitgitgadget@gmail.com>


* ab/env-array (2022-04-06) 3 commits
 - run-command API users: use "env" not "env_array" in comments & names
 - run-command API: rename "env_array" to "env"
 - cocci: add a rename of "struct child_process"'s "env_array" to "env"

 Rename .env_array member to .env in the child_process structure.

 On hold.
 source: <cover-0.3-00000000000-20220406T104134Z-avarab@gmail.com>


* ab/misc-cleanup (2022-04-01) 6 commits
  (merged to 'next' on 2022-04-04 at c5fb674865)
 + alloc.[ch]: remove alloc_report() function
 + object-store.h: remove unused has_sha1_file*()
 + pack-bitmap-write: remove unused bitmap_reset() function
 + xdiff/xmacros.h: remove unused XDL_PTRFREE
 + configure.ac: remove USE_PIC comment
 + run-command.h: remove always unused "clean_on_exit_handler_cbdata"

 Code clean-up.

 Will cook in 'next'.
 source: <cover-v4-0.6-00000000000-20220331T014349Z-avarab@gmail.com>


* gf/shorthand-version-and-help (2022-03-31) 1 commit
 - cli: add -v and -h shorthands

 "git -v" and "git -h" are now understood as "git --version" and
 "git --help".

 Will merge to 'next'.
 source: <20220331212709.36036-1-garrit@slashdev.space>


* ea/progress-partial-blame (2022-04-06) 1 commit
  (merged to 'next' on 2022-04-07 at 7df8392d71)
 + blame: report correct number of lines in progress when using ranges

 The progress meter of "git blame" was showing incorrect numbers
 when processing only parts of the file.

 Will cook in 'next'.
 source: <20220406181320.16911-1-eantoranz@gmail.com>


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

 On hold.
 source: <cover-v6-00.27-00000000000-20220413T195935Z-avarab@gmail.com>


* ab/ci-github-workflow-markup (2022-04-21) 11 commits
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


* kf/p4-multiple-remotes (2022-03-21) 1 commit
 - git-p4: fix issue with multiple perforce remotes

 "git p4" update.

 Will merge to 'next'?
 source: <pull.1180.git.1647866603032.gitgitgadget@gmail.com>


* fr/vimdiff-layout (2022-04-03) 4 commits
  (merged to 'next' on 2022-04-04 at 5d1c8197d0)
 + mergetools: add description to all diff/merge tools
 + vimdiff: add tool documentation
 + vimdiff: integrate layout tests in the unit tests framework ('t' folder)
 + vimdiff: new implementation with layout support

 Reimplement "vimdiff[123]" mergetool drivers with a more generic
 layout mechanism.

 Will cook in 'next'.
 source: <20220330191909.294610-1-greenfoo@u92.eu>


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


* ns/batch-fsync (2022-04-06) 13 commits
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
 - bulk-checkin: rebrand plug/unplug APIs as 'odb transactions'
 - bulk-checkin: rename 'state' variable and separate 'plugged' boolean
 - Merge branch 'ns/core-fsyncmethod' into ns/batch-fsync

 Introduce a filesystem-dependent mechanism to optimize the way the
 bits for many loose object files are ensured to hit the disk
 platter.

 Will merge to 'next'?
 source: <pull.1134.v5.git.1648616734.gitgitgadget@gmail.com>


* en/sparse-cone-becomes-default (2022-04-21) 9 commits
 - Documentation: some sparsity wording clarifications
 - git-sparse-checkout.txt: mark non-cone mode as deprecated
 - git-sparse-checkout.txt: flesh out pattern set sections a bit
 - git-sparse-checkout.txt: add a new EXAMPLES section
 - git-sparse-checkout.txt: shuffle some sections and mark as internal
 - git-sparse-checkout.txt: update docs for deprecation of 'init'
 - git-sparse-checkout.txt: wording updates for the cone mode default
 - sparse-checkout: make --cone the default
 - tests: stop assuming --no-cone is the default mode for sparse-checkout

 Deprecate non-cone mode of the sparse-checkout feature.

 Will merge to 'next'.
 source: <pull.1148.v3.git.1650594746.gitgitgadget@gmail.com>


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
 - ci: call `finalize_test_case_output` a little later
 - ci: use `--github-workflow-markup` in the GitHub workflow
 - ci: optionally mark up output in the GitHub workflow
 - test(junit): avoid line feeds in XML attributes
 - tests: refactor --write-junit-xml code
 - ci/run-build-and-tests: add some structure to the GitHub workflow output
 - ci: make it easier to find failed tests' logs in the GitHub workflow
 - ci/run-build-and-tests: take a more high-level view
 - ci: fix code style

 Update the GitHub workflow support to make it quicker to get to the
 failing test.

 Expecting a reroll.
 cf. <52382f7c-5b6a-63b6-2eb2-26c12f31f529@gmail.com>
 source: <pull.1117.v2.git.1646130289.gitgitgadget@gmail.com>


* et/xdiff-indirection (2022-02-17) 1 commit
 - xdiff: provide indirection to git functions

 Insert a layer of preprocessor macros for common functions in xdiff
 codebase.

 Expecting a reroll.
 cf. <xmqqbkyudb8n.fsf@gitster.g>
 source: <20220217225408.GB7@edef91d97c94>


* tk/simple-autosetupmerge (2022-04-29) 3 commits
 - push: new config option "push.autoSetupRemote" supports "simple" push
 - push: default to single remote even when not named origin
 - branch: new autosetupmerge option 'simple' for matching branches

 "git -c branch.autosetupmerge=simple branch $A $B" will set the $B
 as $A's upstream only when $A and $B shares the same name, and "git
 -c push.default=simple" on branch $A would push to update the
 branch $A at the remote $B came from.  Also more places use the
 sole remote, if exists, before defaulting to 'origin'.
 source: <pull.1161.v5.git.1651226206.gitgitgadget@gmail.com>


* tk/untracked-cache-with-uall (2022-04-01) 2 commits
  (merged to 'next' on 2022-04-04 at 2e11f1ac0c)
 + untracked-cache: support '--untracked-files=all' if configured
 + untracked-cache: test untracked-cache-bypassing behavior with -uall

 The performance of the "untracked cache" feature has been improved
 when "--untracked-files=<mode>" and "status.showUntrackedFiles"
 are combined.

 Will cook in 'next'.
 source: <pull.985.v6.git.1648742535.gitgitgadget@gmail.com>


* jh/builtin-fsmonitor-part3 (2022-04-22) 29 commits
 - fsmonitor--daemon: allow --super-prefix argument
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
 source: <pull.1143.v6.git.1650662994.gitgitgadget@gmail.com>


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


* js/scalar-diagnose (2022-05-04) 7 commits
 - scalar: teach `diagnose` to gather loose objects information
 - scalar: teach `diagnose` to gather packfile info
 - scalar diagnose: include disk space information
 - Implement `scalar diagnose`
 - scalar: validate the optional enlistment argument
 - archive --add-file-with-contents: allow paths containing colons
 - archive: optionally add "virtual" files

 Implementation of "scalar diagnose" subcommand.
 source: <pull.1128.v3.git.1651677919.gitgitgadget@gmail.com>


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

 Will cook in 'next'.
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
