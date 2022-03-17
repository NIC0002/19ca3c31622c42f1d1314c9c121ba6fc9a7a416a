Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A08C433F5
	for <git@archiver.kernel.org>; Thu, 17 Mar 2022 11:34:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233049AbiCQLfx (ORCPT <rfc822;git@archiver.kernel.org>);
        Thu, 17 Mar 2022 07:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbiCQLfv (ORCPT <rfc822;git@vger.kernel.org>);
        Thu, 17 Mar 2022 07:35:51 -0400
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED752EF081
        for <git@vger.kernel.org>; Thu, 17 Mar 2022 04:34:32 -0700 (PDT)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id DC3EF18083D;
        Thu, 17 Mar 2022 07:34:30 -0400 (EDT)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to
        :subject:date:message-id:mime-version:content-type; s=sasl; bh=7
        FuUm07v6fqc1QTH1O/2WOYh1+fENpcclbZGpce1cos=; b=TC6NE4YPBGZK5xqEp
        9oh9I5aYHE5FY0g3Po4SUQKdGkO9d5hRD0K5Jeoj97Ay2wWvHiMRmNJfiFopo9IZ
        oCz9mG5o0DpnHhXjX3XjcegVx2LpuyZ9ywJQnGPOSCgD5kEYGF4ZGIFScX0u2NsB
        ooDctXm4nNNAnAv51mo/tN8PZI=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id D538C18083C;
        Thu, 17 Mar 2022 07:34:30 -0400 (EDT)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [34.82.80.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 3C4D918083B;
        Thu, 17 Mar 2022 07:34:28 -0400 (EDT)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Mar 2022, #04; Thu, 17)
X-master-at: 74cc1aa55f30ed76424a0e7226ab519aa6265061
X-next-at: ce97038cc250ba04e5362ab4f7996e3fe17ab879
Date:   Thu, 17 Mar 2022 04:34:27 -0700
Message-ID: <xmqqv8wcizi4.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID: 34728CAC-A5E6-11EC-B57D-CBA7845BAAA9-77302942!pb-smtp21.pobox.com
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

* ab/grep-patterntype (2022-03-04) 1 commit
  (merged to 'next' on 2022-03-08 at 407dcd1f5d)
 + log tests: fix "abort tests early" regression in ff37a60c369

 Test fix-up for a topic already in master.
 source: <patch-1.1-3b41c1a26d4-20220304T093323Z-avarab@gmail.com>


* ab/keep-git-exit-codes-in-tests (2022-03-07) 15 commits
  (merged to 'next' on 2022-03-08 at bf89509f4c)
 + rev-list simplify tests: don't ignore "git" exit code
 + checkout tests: don't ignore "git <cmd>" exit code
 + apply tests: don't ignore "git ls-files" exit code, drop sub-shell
 + gettext tests: don't ignore "test-tool regex" exit code
 + rev-list tests: don't hide abort() in "test_expect_failure"
 + diff tests: don't ignore "git rev-list" exit code
 + notes tests: don't ignore "git" exit code
 + rev-parse tests: don't ignore "git reflog" exit code
 + merge tests: use "test_must_fail" instead of ad-hoc pattern
 + apply tests: use "test_must_fail" instead of ad-hoc pattern
 + diff tests: don't ignore "git diff" exit code in "read" loop
 + diff tests: don't ignore "git diff" exit code
 + read-tree tests: check "diff-files" exit code on failure
 + tests: use "test_stdout_line_count", not "test $(git [...] | wc -l)"
 + tests: change some 'test $(git) = "x"' to test_cmp

 Updates tests around the use of "test $(git cmd) = constant".
 source: <cover-v2-00.15-00000000000-20220307T124817Z-avarab@gmail.com>


* ab/object-file-api-updates (2022-02-25) 12 commits
  (merged to 'next' on 2022-03-08 at 7fc151ce67)
 + object-file API: pass an enum to read_object_with_reference()
 + object-file.c: add a literal version of write_object_file_prepare()
 + object-file API: have hash_object_file() take "enum object_type"
 + object API: rename hash_object_file_literally() to write_*()
 + object-file API: split up and simplify check_object_signature()
 + object API users + docs: check <0, not !0 with check_object_signature()
 + object API docs: move check_object_signature() docs to cache.h
 + object API: correct "buf" v.s. "map" mismatch in *.c and *.h
 + object-file API: have write_object_file() take "enum object_type"
 + object-file API: add a format_object_header() function
 + object-file API: return "void", not "int" from hash_object_file()
 + object-file.c: split up declaration of unrelated variables

 Object-file API shuffling.
 source: <cover-v3-00.12-00000000000-20220204T234435Z-avarab@gmail.com>


* ab/racy-hooks (2022-03-07) 2 commits
  (merged to 'next' on 2022-03-08 at 07188be733)
 + hooks: fix an obscure TOCTOU "did we just run a hook?" race
 + merge: don't run post-hook logic on --no-verify

 Code clean-up to allow callers of run_commit_hook() to learn if it
 got "success" because the hook succeeded or because there wasn't
 any hook.
 source: <cover-v2-0.2-00000000000-20220307T123244Z-avarab@gmail.com>


* ab/string-list-count-in-size-t (2022-03-07) 2 commits
  (merged to 'next' on 2022-03-08 at 3458b5c278)
 + string-list API: change "nr" and "alloc" to "size_t"
 + gettext API users: don't explicitly cast ngettext()'s "n"

 Count string_list items in size_t, not "unsigned int".
 source: <cover-v2-0.2-00000000000-20220307T152316Z-avarab@gmail.com>


* ds/commit-graph-gen-v2-fixes (2022-03-07) 6 commits
  (merged to 'next' on 2022-03-08 at 36dd214bc2)
 + commit-graph: declare bankruptcy on GDAT chunks
 + commit-graph: fix generation number v2 overflow values
 + commit-graph: start parsing generation v2 (again)
 + commit-graph: fix ordering bug in generation numbers
 + t5318: extract helpers to lib-commit-graph.sh
 + test-read-graph: include extra post-parse info

 Fixes to the way generation number v2 in the commit-graph files are
 (not) handled.
 source: <pull.1163.v3.git.1646164112.gitgitgadget@gmail.com>


* jc/stash-drop (2022-03-02) 3 commits
  (merged to 'next' on 2022-03-08 at 4073dcf05c)
 + stash: call reflog_delete() in reflog.c
 + reflog: libify delete reflog function and helpers
 + stash: add tests to ensure reflog --rewrite --updatref behavior

 "git stash drop" is reimplemented as an internal call to
 reflog_delete() function, instead of invoking "git reflog delete"
 via run_command() API.
 source: <pull.1218.v4.git.git.1646260044.gitgitgadget@gmail.com>


* mf/fix-type-in-config-h (2022-03-03) 1 commit
  (merged to 'next' on 2022-03-08 at a914e267f2)
 + config: correct "--type" option in "git config -h" output

 "git config -h" did not describe the "--type" option correctly.
 source: <pull.1220.v2.git.git.1646368313714.gitgitgadget@gmail.com>


* ps/fetch-mirror-optim (2022-03-01) 6 commits
  (merged to 'next' on 2022-03-08 at 60aae8731c)
 + refs/files-backend: optimize reading of symbolic refs
 + remote: read symbolic refs via `refs_read_symbolic_ref()`
 + refs: add ability for backends to special-case reading of symbolic refs
 + fetch: avoid lookup of commits when not appending to FETCH_HEAD
 + upload-pack: look up "want" lines via commit-graph
 + Merge branch 'ps/fetch-atomic' into ps/fetch-mirror-optim

 Various optimization for "git fetch".
 source: <cover.1646127015.git.ps@pks.im>


* tb/rename-remote-progress (2022-03-03) 2 commits
  (merged to 'next' on 2022-03-08 at adff4dbd86)
 + builtin/remote.c: show progress when renaming remote references
 + builtin/remote.c: parse options in 'rename'

 "git remote rename A B", depending on the number of remote-tracking
 refs involved, takes long time renaming them.  The command has been
 taught to show progress bar while making the user wait.
 source: <cover.1646346286.git.me@ttaylorr.com>


* tk/empty-untracked-cache (2022-02-28) 3 commits
  (merged to 'next' on 2022-03-08 at d3749d5850)
 + untracked-cache: write index when populating empty untracked cache
 + t7519: populate untracked cache before test
 + t7519: avoid file to index mtime race for untracked cache

 The untracked cache newly computed weren't written back to the
 on-disk index file when there is no other change to the index,
 which has been corrected.
 source: <pull.986.v3.git.1645999021.gitgitgadget@gmail.com>


* tk/t7063-chmtime-dirs-too (2022-03-01) 2 commits
  (merged to 'next' on 2022-03-08 at 99c954903d)
 + t7063: mtime-mangling instead of delays in untracked cache testing
 + t/helper/test-chmtime: update mingw to support chmtime on directories

 Teach "test-chmtime" to work on a directory and use it to avoid
 having to wait for a second in a few places in tests.
 source: <pull.1166.v3.git.1646201124.gitgitgadget@gmail.com>


* vd/sparse-read-tree (2022-03-01) 8 commits
  (merged to 'next' on 2022-03-08 at 037c187db2)
 + read-tree: make three-way merge sparse-aware
 + read-tree: make two-way merge sparse-aware
 + read-tree: narrow scope of index expansion for '--prefix'
 + read-tree: integrate with sparse index
 + read-tree: expand sparse checkout test coverage
 + read-tree: explicitly disallow prefixes with a leading '/'
 + status: fix nested sparse directory diff in sparse index
 + sparse-index: prevent repo root from becoming sparse

 "git read-tree" has been made to be aware of the sparse-index
 feature.
 source: <pull.1157.v3.git.1646166271.gitgitgadget@gmail.com>

--------------------------------------------------
[New Topics]

* ps/repack-with-server-info (2022-03-14) 2 commits
 - repack: add config to skip updating server info
 - repack: refactor to avoid double-negation of update-server-info

 "git repack" learned a new configuration to disable triggering of
 age-old "update-server-info" command, which is rarely useful these
 days.

 Will merge to 'next'.
 source: <cover.1647243508.git.ps@pks.im>


* ds/doc-maintenance-synopsis-fix (2022-03-15) 1 commit
 - maintenance: fix synopsis in documentation

 Doc update.

 Will merge to 'next'.
 source: <pull.1178.git.1647366104967.gitgitgadget@gmail.com>


* jc/cat-file-batch-default-format-optim (2022-03-15) 1 commit
 - cat-file: skip expanding default format

 Optimize away strbuf_expand() call with a hardcoded formatting logic
 specific for the default format in the --batch and --batch-check
 options of "git cat-file".

 Will merge to 'next'?
 source: <pull.1221.v4.git.git.1647312036664.gitgitgadget@gmail.com>


* ac/test-lazy-fetch (2022-03-16) 1 commit
 - partial-clone: add a partial-clone test case

 A new test to ensure a lazy fetching is not triggered when it
 should not be.

 Will merge to 'next'.
 source: <pull.1175.v2.git.1647423969576.gitgitgadget@gmail.com>


* bc/stash-export (2022-03-16) 6 commits
 - doc: add stash export and import to docs
 - builtin/stash: provide a way to import stashes from a ref
 - builtin/stash: provide a way to export stashes to a ref
 - object-name: make get_oid quietly return an error
 - builtin/stash: fill in all commit data
 - builtin/stash: factor out generic function to look up stash info

 A mechanism to export and import stash entries to and from a normal
 commit to transfer it across repositories has been introduced.

 Expecting a reroll.
 source: <20220310173236.4165310-1-sandals@crustytoothpaste.net>


* dc/complete-restore (2022-03-15) 1 commit
 - completion: tab completion of filenames for 'git restore'

 The command line completion support (in contrib/) learns to give
 modified paths to the "git restore" command.

 Will merge to 'next'?
 source: <pull.1227.v3.git.git.1647382437475.gitgitgadget@gmail.com>


* gc/submodule-update-part2 (2022-03-16) 8 commits
 - submodule--helper: remove forward declaration
 - submodule: move core cmd_update() logic to C
 - submodule--helper: reduce logic in run_update_procedure()
 - submodule--helper: teach update_data more options
 - builtin/submodule--helper.c: rename option struct to "opt"
 - submodule update: use die_message()
 - submodule--helper: run update using child process struct
 - Merge branch 'gc/submodule-update-part1' into gc/submodule-update-part2
 (this branch uses gc/submodule-update-part1.)

 Move more "git submodule update" to C.
 source: <20220315210925.79289-1-chooglen@google.com>


* js/in-place-reverse-in-sequencer (2022-03-16) 1 commit
 - sequencer: use reverse_commit_list() helper

 Code clean-up.

 Will merge to 'next'.
 source: <pull.1177.v3.git.1647429623830.gitgitgadget@gmail.com>


* ns/batch-fsync (2022-03-16) 8 commits
 - core.fsyncmethod: performance tests for add and stash
 - core.fsyncmethod: tests for batch mode
 - core.fsync: use batch mode and sync loose objects by default on Windows
 - unpack-objects: use the bulk-checkin infrastructure
 - update-index: use the bulk-checkin infrastructure
 - core.fsyncmethod: batched disk flushes for loose-objects
 - bulk-checkin: rename 'state' variable and separate 'plugged' boolean
 - Merge branch 'ns/core-fsyncmethod' into ns/batch-fsync
 (this branch uses ns/core-fsyncmethod.)

 Introduce a filesystem-dependent mechanism to optimize the way the
 bits for many loose object files are ensured to hit the disk
 platter.

 Needs review.
 source: <pull.1134.git.1647379859.gitgitgadget@gmail.com>


* vd/cache-bottom-fix (2022-03-16) 3 commits
 . Revert "unpack-trees: improve performance of next_cache_entry"
 . unpack-trees: increment cache_bottom for sparse directories
 . t1092: add sparse directory before cone in test repo

 Correct a bug in unpack-trees introduced earlier.

 By itself this passes its tests, but when merged with other topics
 into 'seen', the self-test seems to fail.
 source: <pull.1179.git.1647461522.gitgitgadget@gmail.com>

--------------------------------------------------
[Stalled]

* rj/receive-pack-abort-upon-disconnect (2022-01-28) 1 commit
 - receive-pack: check if client is alive before completing the push

 "git push" may be killed by the user when the server side has
 finished receiving all data and is about to commit the result.
 Give the latter a better chance to notice such situation and abort
 processing the ref updates.

 Needs more work?
 cf. <220204.864k5e4yvf.gmgdl@evledraar.gmail.com>
 source: <20220128194811.3396281-1-robin.jarry@6wind.com>


* je/http-better-error-output (2021-12-03) 1 commit
 . http-backend: give a hint that web browser access is not supported

 When the http-backend program, which is the server-side component
 for the smart HTTP transport, sends a "404 Not found" error, we
 deliberately did not say anything to the requesting client.  We now
 send a message back to the browser to tell the user that they do
 not want to visit the URL via their browser, instead of a totally
 blank page.

 Will discard; getting tired of waiting
 cf. <7r23s082-o3q0-479o-srqn-r45q778s5nq7@vanv.qr>
 source: <20211202102855.23907-1-jengelh@inai.de>


* cb/save-term-across-editor-invocation (2021-12-01) 3 commits
 . fixup! editor: allow for saving/restoring terminal state
 . editor: allow for saving/restoring terminal state
 . terminal: teach save_term to fail when not foreground

 Some editors are reported to leave the terminal in funny state
 after they exit on Windows.  Work it around by saving and restoring
 the terminal state when needed.

 Will discard; getting tired of waiting
 cf. <CAPUEsphktbdxeV7hvF52Or3CVHS8oOk5-WV=xfEZa8kfCVVnVg@mail.gmail.com>
 source: <20211202035446.1154-1-carenas@gmail.com>

--------------------------------------------------
[Cooking]

* bc/block-sha1-without-gcc-asm-extension (2022-03-10) 1 commit
  (merged to 'next' on 2022-03-15 at e285d9988f)
 + block-sha1: remove use of obsolete x86 assembly

 Get rid of one use of __asm__() GCC extension that does not help us
 much these days, which has an added advantage of not having to
 worry about -pedantic complaining.

 Will merge to 'master'.
 source: <20220310174750.4166514-1-sandals@crustytoothpaste.net>


* jy/gitweb-no-need-for-meta (2022-03-08) 2 commits
  (merged to 'next' on 2022-03-13 at 1e8d643130)
 + gitweb: remove invalid http-equiv="content-type"
 + comment: fix typo

 Remove unneeded <meta http-equiv=content-type...> from gitweb
 output.

 Will merge to 'master'.
 source: <20220308155612.105957-3-jason@jasonyundt.email>


* ns/core-fsyncmethod (2022-03-15) 6 commits
 - core.fsync: documentation and user-friendly aggregate options
 - core.fsync: new option to harden the index
 - core.fsync: add configuration parsing
 - core.fsync: introduce granular fsync control infrastructure
 - core.fsyncmethod: add writeout-only mode
 - wrapper: make inclusion of Windows csprng header tightly scoped
 (this branch is used by ns/batch-fsync and ps/fsync-refs.)

 Replace core.fsyncObjectFiles with two new configuration variables,
 core.fsync and core.fsyncMethod.

 Will merge to 'next'.
 source: <pull.1093.v6.git.1646952204.gitgitgadget@gmail.com>


* pw/add-p-single-key (2022-03-16) 5 commits
 - terminal: restore settings on SIGTSTP
 - terminal: work around macos poll() bug
 - terminal: don't assume stdin is /dev/tty
 - terminal: use flags for save_term()
 - Merge branch 'pw/single-key-interactive' into pw/add-p-single-key
 (this branch uses pw/single-key-interactive.)

 Finishing touches to C rewrite of "git add -i" in single-key
 interactive mode.

 Will merge to 'next'?
 source: <20220316185405.29551-1-phillip.wood123@gmail.com>


* ab/reflog-prep-fix (2022-03-13) 1 commit
  (merged to 'next' on 2022-03-15 at c9ef333999)
 + reflog: don't be noisy on empty reflogs

 Regression fix.

 Will merge to 'master'.
 source: <de5e2b0e290791d0a4f58a893d8571b5fc8c4f1a.1646952843.git.avarab@gmail.com>


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


* ep/remove-duplicated-includes (2022-03-14) 6 commits
  (merged to 'next' on 2022-03-15 at 0f87385b56)
 + attr.h: remove duplicate struct definition
 + t/helper/test-run-command.c: delete duplicate include
 + builtin/stash.c: delete duplicate include
 + builtin/sparse-checkout.c: delete duplicate include
 + builtin/gc.c: delete duplicate include
 + attr.c: delete duplicate include

 Code clean-up.

 Will merge to 'master'.
 source: <20220313195536.224075-1-gitter.spiros@gmail.com>


* ep/t6423-modernize (2022-03-13) 1 commit
  (merged to 'next' on 2022-03-15 at d37f7359bf)
 + t6423-merge-rename-directories.sh: use the $(...) construct

 Code clean-up.

 Will merge to 'master'.
 source: <20220313172829.215517-1-gitter.spiros@gmail.com>


* jc/rebase-detach-fix (2022-03-16) 2 commits
 - rebase: set REF_HEAD_DETACH in checkout_up_to_date()
 - rebase: use test_commit helper in setup

 "git rebase $base $non_branch_commit", when $base is an ancestor or
 the $non_branch_commit, modified the current branch, which has been
 corrected.

 Will merge to 'next'.
 source: <pull.1226.v3.git.git.1647487001.gitgitgadget@gmail.com>


* jh/builtin-fsmonitor-part-2plus (2022-03-13) 16 commits
 - fsmonitor-settings: simplify initialization of settings data
 - fsmonitor--daemon: add _() to calls to error()
 - fsmonitor--daemon: add _() to calls to die()
 - compat/fsmonitor/fsm-listen-win32: add _() to calls to error()
 - compat/fsmonitor/fsm-listen-darwin: add _() to calls to error()
 - fsmonitor-ipc: add _() to calls to die()
 - t7527: delete unused verify_status() function
 - t7527: fix && chaining in matrix_try()
 - t7527: add parameters to start_daemon to handle args and subshell
 - t/perf/p7519: cleanup coding style
 - t/perf/p7519: use grep rather than egrep in test
 - fsmonitor--daemon: refactor cookie handling for readability
 - t/helper/fsmonitor-client: cleanup call to parse_options()
 - compat/fsmonitor/fsm-listen-darwin: split out GCC-specific declarations
 - update-index: convert advise() messages back to warning()
 - t/test-lib: avoid using git on LHS of pipe
 (this branch uses jh/builtin-fsmonitor-part2.)

 Various small fixes and cleanups on part-2 of the same topic.

 Needs review.
 source: <pull.1174.git.1647033303.gitgitgadget@gmail.com>


* ps/fsync-refs (2022-03-15) 2 commits
 - core.fsync: new option to harden references
 - Merge branch 'ns/core-fsyncmethod' into ps/fsync-refs
 (this branch uses ns/core-fsyncmethod.)

 Updates to refs traditionally weren't fsync'ed, but we can
 configure using core.fsync variable to do so.

 Will merge to 'next'.
 source: <47dd79106b93bb81750320d50ccaa74c24aacd28.1646992380.git.ps@pks.im>


* vd/stash-silence-reset (2022-03-14) 5 commits
 - stash: make internal resets quiet and refresh index
 - reset: suppress '--no-refresh' advice if logging is silenced
 - reset: replace '--quiet' with '--no-refresh' in performance advice
 - reset: introduce --[no-]refresh option to --mixed
 - reset: revise index refresh advice

 "git stash" does not allow subcommands it internally runs as its
 implementation detail, except for "git reset", to emit messages;
 now "git reset" part has also been squelched.

 Will merge to 'next'?
 source: <pull.1170.v3.git.1647308982.gitgitgadget@gmail.com>


* tl/ls-tree-oid-only (2022-03-04) 12 commits
 - ls-tree: support --object-only option for "git-ls-tree"
 - ls-tree: introduce "--format" option
 - cocci: allow padding with `strbuf_addf()`
 - ls-tree: introduce struct "show_tree_data"
 - ls-tree: slightly refactor `show_tree()`
 - ls-tree: fix "--name-only" and "--long" combined use bug
 - ls-tree: simplify nesting if/else logic in "show_tree()"
 - ls-tree: rename "retval" to "recurse" in "show_tree()"
 - ls-tree: use "size_t", not "int" for "struct strbuf"'s "len"
 - ls-tree: use "enum object_type", not {blob,tree,commit}_type
 - ls-tree: add missing braces to "else" arms
 - ls-tree: remove commented-out code

 "git ls-tree" learns "--oid-only" option, similar to "--name-only",
 and more generalized "--format" option.
 source: <cover.1646390152.git.dyroneteng@gmail.com>


* jd/userdiff-kotlin (2022-03-12) 1 commit
  (merged to 'next' on 2022-03-15 at 10fabd722a)
 + userdiff: add builtin diff driver for kotlin language.

 A new built-in userdiff driver for kotlin.

 Will merge to 'master'.
 source: <20220312044832.718356-1-jaydeepjd.8914@gmail.com>


* ab/hook-tests-updates (2022-03-07) 10 commits
 - tests: change "cat && chmod +x" to use "test_hook"
 - tests: change "mkdir -p && write_script" to use "test_hook"
 - test-lib-functions: add and use a "test_hook" wrapper
 - fetch+push tests: have tests clean up their own mess
 - hook tests: get rid of unnecessary sub-shells
 - tests: indent and add hook setup to "test_expect_success"
 - bugreport tests: tighten up "git bugreport -s hooks" test
 - tests: assume the hooks are disabled by default
 - t5540: don't rely on "hook/post-update.sample"
 - hook tests: turn exit code assertions into a loop

 Update tests around the use of hook scripts.

 Needs a (hopefully) final eyeballing.
 source: <cover-v2-00.10-00000000000-20220307T123909Z-avarab@gmail.com>


* ep/test-malloc-check-with-glibc-2.34 (2022-03-09) 2 commits
  (merged to 'next' on 2022-03-12 at 13ed9014e6)
 + test-lib: declare local variables as local
  (merged to 'next' on 2022-03-08 at 810ac5a1d3)
 + test-lib.sh: Use GLIBC_TUNABLES instead of MALLOC_CHECK_ on glibc >= 2.34

 The method to trigger malloc check used in our tests no longer work
 with newer versions of glibc.

 Will merge to 'master'.
 source: <81f43fbefde84ab7af9ee2ac760845b728a48ab5.1646861976.git.git@grubix.eu>


* jc/mailsplit-warn-on-tty (2022-03-03) 1 commit
 - am/apply: warn if we end up reading patches from terminal

 "git am" can read from the standard input when no mailbox is given
 on the command line, but the end-user gets no indication when it
 happens, making Git appear stuck.
 source: <xmqqlexq8zqo.fsf@gitster.g>


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

 Waiting for discussion to settle.
 cf. <220309.86tuc6lwpj.gmgdl@evledraar.gmail.com>
 cf. <220302.86mti87cj2.gmgdl@evledraar.gmail.com>
 cf. <30dbc8fb-a1db-05bc-3dcb-070e11cf4715@gmail.com>
 source: <pull.1117.v2.git.1646130289.gitgitgadget@gmail.com>


* jk/name-rev-w-genno (2022-03-13) 1 commit
  (merged to 'next' on 2022-03-15 at b370601916)
 + name-rev: use generation numbers if available

 "git name-rev" learned to use the generation numbers when setting
 the lower bound of searching commits used to explain the revision,
 when available, instead of committer time.

 Will merge to 'master'.
 source: <20220312000015.3643427-1-jacob.e.keller@intel.com>


* et/xdiff-indirection (2022-02-17) 1 commit
 - xdiff: provide indirection to git functions

 Insert a layer of preprocessor macros for common functions in xdiff
 codebase.

 Expecting a (hopefully final) reroll.
 cf. <xmqqbkyudb8n.fsf@gitster.g>
 source: <20220217225408.GB7@edef91d97c94>


* sm/no-git-in-upstream-of-pipe-in-tests (2022-03-12) 3 commits
  (merged to 'next' on 2022-03-12 at 9e6f538b36)
 + t0030-t0050: avoid pipes with Git on LHS
 + t0001-t0028: avoid pipes with Git on LHS
  (merged to 'next' on 2022-03-08 at 3ff4e5c09c)
 + t0003: avoid pipes with Git on LHS

 Test fixes.

 Will merge to 'master'.
 source: <20220223115347.3083-1-shivam828787@gmail.com>


* ab/http-gcc-12-workaround (2022-02-25) 1 commit
 - http API: fix dangling pointer issue noted by GCC 12.0

 Work around false warning pre-release of GCC 12.
 source: <patch-v2-1.1-777838267a5-20220225T090816Z-avarab@gmail.com>


* ds/partial-bundles (2022-03-09) 13 commits
  (merged to 'next' on 2022-03-13 at 03529eaa59)
 + clone: fail gracefully when cloning filtered bundle
 + bundle: unbundle promisor packs
 + bundle: create filtered bundles
 + rev-list: move --filter parsing into revision.c
 + bundle: parse filter capability
 + list-objects: handle NULL function pointers
 + MyFirstObjectWalk: update recommended usage
 + list-objects: consolidate traverse_commit_list[_filtered]
 + pack-bitmap: drop filter in prepare_bitmap_walk()
 + pack-objects: use rev.filter when possible
 + revision: put object filter into struct rev_info
 + list-objects-filter-options: create copy helper
 + index-pack: document and test the --promisor option
 (this branch is used by ds/bundle-uri.)

 Bundle file format gets extended to allow a partial bundle,
 filtered by similar criteria you would give when making a
 partial/lazy clone.

 Will merge to 'master'.
 source: <pull.1159.v4.git.1646841703.gitgitgadget@gmail.com>


* jd/prompt-upstream-mark (2022-03-03) 4 commits
 - git-prompt: put upstream comments together
 - git-prompt: make long upstream state indicator consistent
 - git-prompt: make upstream state indicator location consistent
 - git-prompt: rename `upstream` to `upstream_type`

 Tweaks in the command line prompt (in contrib/) code around its
 GIT_PS1_SHOWUPSTREAM feature.

 What's the status of this one?
 source: <pull.1162.v2.git.1645991832.gitgitgadget@gmail.com>


* pw/worktree-list-with-z (2022-02-25) 1 commit
 - worktree: add -z option for list subcommand

 "git worktree list --porcelain" did not c-quote pathnames and lock
 reasons with unsafe bytes correctly, which is worked around by
 introducing NUL terminated output format with "-z".

 Expecting a reroll.
 cf. <dd16416d-15c4-7f80-aaf6-a36d101e8928@gmail.com>
 source: <pull.1164.git.1645801727732.gitgitgadget@gmail.com>


* rc/fetch-refetch (2022-03-04) 7 commits
 - doc/partial-clone: mention --refetch fetch option
 - fetch: after refetch, encourage auto gc repacking
 - t5615-partial-clone: add test for fetch --refetch
 - fetch: add --refetch option
 - builtin/fetch-pack: add --refetch option
 - fetch-pack: add refetch
 - fetch-negotiator: add specific noop initializer

 "git fetch --refetch" learned to fetch everything without telling
 the other side what we already have, which is useful when you
 cannot trust what you have in the local object store.

 Expecting a reroll.
 cf. <CAFLLRpLiCLiXkHNe2u4TKk-FjDy4LVZZR4qqxG+MamZYEFNUGg@mail.gmail.com>
 source: <pull.1138.v3.git.1646406274.gitgitgadget@gmail.com>


* tk/simple-autosetupmerge (2022-02-25) 2 commits
 - t3200: tests for new branch.autosetupmerge option "simple"
 - merge: new autosetupmerge option 'simple' for matching branches

 "git -c branch.autosetupmerge=simple branch $A $B" will set the $B
 as $A's upstream only when $A and $B shares the same name, and "git
 -c push.default=simple" on branch $A would push to update the
 branch $A at the remote $B came from.

 Needs review.
 source: <pull.1161.v2.git.1645815142.gitgitgadget@gmail.com>


* tk/untracked-cache-with-uall (2022-02-25) 1 commit
 - untracked-cache: support '--untracked-files=all' if configured

 The performance of the "untracked cache" feature has been improved
 when "--untracked-files=<mode>" and "status.showUntrackedFiles"
 are combined.

 Expecting a reroll.
 source: <pull.985.v2.git.1645811564461.gitgitgadget@gmail.com>


* ab/commit-plug-leaks (2022-02-16) 2 commits
 - commit: use strbuf_release() instead of UNLEAK()
 - commit: fix "author_ident" leak

 Leakfixes in the top-level called-once function.

 Expecting a reroll.
 I think UNLEAK->strbuf_release() is a regression.
 source: <cover-0.2-00000000000-20220216T081844Z-avarab@gmail.com>


* pw/single-key-interactive (2022-02-23) 4 commits
  (merged to 'next' on 2022-03-13 at 02fd6aca2f)
 + add -p: disable stdin buffering when interactive.singlekey is set
 + terminal: set VMIN and VTIME in non-canonical mode
 + terminal: pop signal handler when terminal is restored
 + terminal: always reset terminal when reading without echo
 (this branch is used by pw/add-p-single-key.)

 The single-key interactive operation used by "git add -p" has been
 made more robust.

 Will merge to 'master'.
 source: <pull.1146.v2.git.1645556015.gitgitgadget@gmail.com>


* jh/builtin-fsmonitor-part3 (2022-03-09) 28 commits
 . fsmonitor-settings: NTFS and FAT32 on MacOS are incompatible
 . t7527: test Unicode NFC/NFD handling on MacOS
 . t/lib-unicode-nfc-nfd: helper prereqs for testing unicode nfc/nfd
 . fsmonitor: on macOS also emit NFC spelling for NFD pathname
 . t7527: test FSMonitor on case insensitive+preserving file system
 . fsmonitor: never set CE_FSMONITOR_VALID on submodules
 . t/perf/p7527: add perf test for builtin FSMonitor
 . t7527: FSMonitor tests for directory moves
 . fsmonitor: optimize processing of directory events
 . fsm-listen-darwin: shutdown daemon if worktree root is moved/renamed
 . fsm-health-win32: force shutdown daemon if worktree root moves
 . fsm-health-win32: add polling framework to monitor daemon health
 . fsmonitor--daemon: stub in health thread
 . fsmonitor--daemon: rename listener thread related variables
 . fsmonitor--daemon: prepare for adding health thread
 . fsmonitor--daemon: cd out of worktree root
 . fsm-listen-darwin: ignore FSEvents caused by xattr changes on macOS
 . unpack-trees: initialize fsmonitor_has_run_once in o->result
 . fsmonitor-settings: remote repos on Windows are incompatible
 . fsmonitor-settings: remote repos on macOS are incompatible
 . fsmonitor-settings: stub in macOS-specific incompatibility checking
 . fsmonitor-settings: VFS for Git virtual repos are incompatible
 . fsmonitor-settings: stub in platform-specific incompatibility checking
 . fsmonitor-settings: bare repos are incompatible with FSMonitor
 . t/helper/fsmonitor-client: create stress test
 . t7527: test FSMonitor on repos with Unicode root paths
 . fsm-listen-win32: handle shortnames
 . Merge branch 'jh/builtin-fsmonitor-part2' into jh/builtin-fsmonitor-part3
 (this branch uses jh/builtin-fsmonitor-part2.)

 More fsmonitor--daemon.
 source: <pull.1143.v2.git.1646777727.gitgitgadget@gmail.com>


* gc/recursive-fetch-with-unused-submodules (2022-03-16) 10 commits
 - submodule: fix latent check_has_commit() bug
 - fetch: fetch unpopulated, changed submodules
 - submodule: move logic into fetch_task_create()
 - submodule: extract get_fetch_task()
 - submodule: store new submodule commits oid_array in a struct
 - submodule: inline submodule_commits() into caller
 - submodule: make static functions read submodules from commits
 - t5526: create superproject commits with test helper
 - t5526: stop asserting on stderr literally
 - t5526: introduce test helper to assert on fetches

 When "git fetch --recurse-submodules" grabbed submodule commits
 that would be needed to recursively check out newly fetched commits
 in the superproject, it only paid attention to submodules that are
 in the current checkout of the superproject.  We now do so for all
 submodules that have been run "git submodule init" on.

 Will merge to 'next'.
 source: <20220308001433.94995-1-chooglen@google.com>


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


* gc/submodule-update-part1 (2022-03-04) 13 commits
  (merged to 'next' on 2022-03-15 at 92911dced9)
 + submodule--helper update-clone: check for --filter and --init
 + submodule update: add tests for --filter
 + submodule--helper: remove ensure-core-worktree
 + submodule--helper update-clone: learn --init
 + submodule--helper: allow setting superprefix for init_submodule()
 + submodule--helper: refactor get_submodule_displaypath()
 + submodule--helper run-update-procedure: learn --remote
 + submodule--helper: don't use bitfield indirection for parse_options()
 + submodule--helper: get remote names from any repository
 + submodule--helper run-update-procedure: remove --suboid
 + submodule--helper: reorganize code for sh to C conversion
 + submodule--helper: remove update-module-mode
 + submodule tests: test for init and update failure output
 (this branch is used by gc/submodule-update-part2.)

 Rewrite of "git submodule update" in C (early part).

 Will merge to 'master'.
 source: <20220305001401.20888-1-chooglen@google.com>


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


* jh/p4-various-fixups (2022-02-10) 22 commits
 - git-p4: sort imports
 - git-p4: seperate multiple statements onto seperate lines
 - git-p4: move inline comments to line above
 - git-p4: only seperate code blocks by a single empty line
 - git-p4: compare to singletons with "is" and "is not"
 - git-p4: normalize indentation of lines in conditionals
 - git-p4: ensure there is a single space around all operators
 - git-p4: ensure every comment has a single #
 - git-p4: remove spaces between dictionary keys and colons
 - git-p4: remove redundant backslash-continuations inside brackets
 - git-p4: remove extraneous spaces before function arguments
 - git-p4: place a single space after every comma
 - git-p4: removed brackets when assigning multiple return values
 - git-p4: remove spaces around default arguments
 - git-p4: remove padding from lists, tuples and function arguments
 - git-p4: sort and de-duplcate pylint disable list
 - git-p4: remove commented code
 - git-p4: convert descriptive class and function comments into docstrings
 - git-p4: improve consistency of docstring formatting
 - git-p4: indent with 4-spaces
 - git-p4: remove unneeded semicolons from statements
 - git-p4: add blank lines between functions and class definitions

 Various cleanups to "git p4".
 source: <20220210164627.279520-1-jholdsworth@nvidia.com>


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


* jh/builtin-fsmonitor-part2 (2022-03-01) 30 commits
  (merged to 'next' on 2022-03-08 at 5f9d385483)
 + update-index: convert fsmonitor warnings to advise
 + t7527: test status with untracked-cache and fsmonitor--daemon
 + fsmonitor: force update index after large responses
 + fsmonitor--daemon: use a cookie file to sync with file system
 + fsmonitor--daemon: periodically truncate list of modified files
 + t/perf/p7519: add fsmonitor--daemon test cases
 + t/perf/p7519: speed up test on Windows
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
 (this branch is used by jh/builtin-fsmonitor-part-2plus and jh/builtin-fsmonitor-part3.)

 Built-in fsmonitor (part 2).

 Discarded to be replaced.
 cf. <33a9f751-6254-9b3e-6eb7-7844ac664e00@jeffhostetler.com>
 source: <pull.1041.v6.git.1646160212.gitgitgadget@gmail.com>


* es/superproject-aware-submodules (2022-03-09) 3 commits
 . rev-parse: short-circuit superproject worktree when config unset
 . introduce submodule.hasSuperproject record
 . t7400-submodule-basic: modernize inspect() helper

 A configuration variable in a repository tells if it is (or is not)
 a submodule of a superproject.

 Expecting a reroll.
 cf. <kl6l4k45s7cb.fsf@chooglen-macbookpro.roam.corp.google.com>
 source: <20220310004423.2627181-1-emilyshaffer@google.com>

--------------------------------------------------
[Discarded]

* jc/parse-options-check (2022-03-01) 1 commit
 . parse-options: make parse_options_check() test-only

 Bypass sanity checks on the options array at runtime, and trigger
 them only during the tests.
 source: <xmqqr17lphav.fsf_-_@gitster.g>


* jc/merge-continue-doc (2022-02-28) 1 commit
 . merge: 'git merge --continue' is merely 'git commit'

 "git merge" documentation clarifies that "git commit" is sufficient
 to conclude an interrupted merge.
 source: <xmqq1qzmy55g.fsf@gitster.g>
