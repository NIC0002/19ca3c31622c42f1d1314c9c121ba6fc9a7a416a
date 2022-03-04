Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B2FC433F5
	for <git@archiver.kernel.org>; Fri,  4 Mar 2022 04:31:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232969AbiCDEcP (ORCPT <rfc822;git@archiver.kernel.org>);
        Thu, 3 Mar 2022 23:32:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232609AbiCDEcO (ORCPT <rfc822;git@vger.kernel.org>);
        Thu, 3 Mar 2022 23:32:14 -0500
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E59731795D3
        for <git@vger.kernel.org>; Thu,  3 Mar 2022 20:31:23 -0800 (PST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id ADD0210A28A;
        Thu,  3 Mar 2022 23:31:21 -0500 (EST)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to
        :subject:date:message-id:mime-version:content-type; s=sasl; bh=l
        DVLxRP7PT8b74zG+5UuSFkTx/a71m9+duww/VpwgCw=; b=Bjecf0YY9IzBLlZKj
        IMEbC2ygxu07sTuwvAQCglm89HQuyoZHie84G5bMlFlX5zQBAqRgDeEW0Haa7Mb/
        24quI/ezttKhujlLCr/cyCh9rHpMj6jrCCl2ZC3QULugTFDcDrWHRnjEeEsWotq1
        aqoIgNBlNm6O3NU3sdvWA7axmg=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id A500910A289;
        Thu,  3 Mar 2022 23:31:21 -0500 (EST)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [35.230.65.123])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp2.pobox.com (Postfix) with ESMTPSA id E4E0810A288;
        Thu,  3 Mar 2022 23:31:20 -0500 (EST)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Mar 2022, #01; Thu, 3)
X-master-at: 715d08a9e51251ad8290b181b6ac3b9e1f9719d7
X-next-at: 4982287a3110faff562d8f552d63eb9647ce28a7
Date:   Thu, 03 Mar 2022 20:31:19 -0800
Message-ID: <xmqqv8wu2vag.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID: F10F9012-9B73-11EC-98BB-CB998F0A682E-77302942!pb-smtp2.pobox.com
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
[New Topics]

* jd/userdiff-kotlin (2022-03-03) 1 commit
 - userdiff: add builtin diff driver for Kotlin language.

 A new built-in userdiff driver for kotlin.

 source: <20220303181517.70682-1-jaydeepjd.8914@gmail.com>


* ps/fetch-mirror-optim (2022-03-01) 6 commits
 - refs/files-backend: optimize reading of symbolic refs
 - remote: read symbolic refs via `refs_read_symbolic_ref()`
 - refs: add ability for backends to special-case reading of symbolic refs
 - fetch: avoid lookup of commits when not appending to FETCH_HEAD
 - upload-pack: look up "want" lines via commit-graph
 - Merge branch 'ps/fetch-atomic' into ps/fetch-mirror-optim
 (this branch uses ps/fetch-atomic.)

 Various optimization for "git fetch".

 Will merge to 'next'.
 source: <cover.1646127015.git.ps@pks.im>


* tk/t7063-chmtime-dirs-too (2022-03-01) 2 commits
 - t7063: mtime-mangling instead of delays in untracked cache testing
 - t/helper/test-chmtime: update mingw to support chmtime on directories

 Teach "test-chmtime" to work on a directory and use it to avoid
 having to wait for a second in a few places in tests.

 Expecting a reroll.
 cf. <37f66fae-911a-62f1-4711-c9f6c7794911@jeffhostetler.com>
 source: <pull.1166.v2.git.1646127910.gitgitgadget@gmail.com>


* ab/hook-tests-updates (2022-03-02) 10 commits
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

 Expecting a reroll.
 cf. <xmqqzgm8hwwc.fsf@gitster.g>
 cf. <xmqq1qzkhv87.fsf@gitster.g>
 source: <cover-00.10-00000000000-20220302T131859Z-avarab@gmail.com>


* ab/keep-git-exit-codes-in-tests (2022-03-02) 15 commits
 - rev-list simplify tests: don't ignore "git" exit code
 - checkout tests: don't ignore "git <cmd>" exit code
 - apply tests: don't ignore "git ls-files" exit code, drop sub-shell
 - gettext tests: don't ignore "test-tool regex" exit code
 - rev-list tests: don't hide abort() in "test_expect_failure"
 - diff tests: don't ignore "git rev-list" exit code
 - notes tests: don't ignore "git" exit code
 - rev-parse tests: don't ignore "git reflog" exit code
 - merge tests: use "test_must_fail" instead of ad-hoc pattern
 - apply tests: use "test_must_fail" instead of ad-hoc pattern
 - diff tests: don't ignore "git diff" exit code in "read" loop
 - diff tests: don't ignore "git diff" exit code
 - read-tree tests: check "diff-files" exit code on failure
 - tests: use "test_stdout_line_count", not "test $(git [...] | wc -l)"
 - tests: change some 'test $(git) = "x"' to test_cmp

 Updates tests around the use of "test $(git cmd) = constant".

 Expecting a reroll.
 cf. <xmqqsfryah42.fsf@gitster.g>
 source: <cover-00.15-00000000000-20220302T171755Z-avarab@gmail.com>


* ab/plug-random-leaks (2022-03-02) 14 commits
 - repository.c: free the "path cache" in repo_clear()
 - range-diff: plug memory leak in read_patches()
 - range-diff: plug memory leak in common invocation
 - lockfile API users: simplify and don't leak "path"
 - commit-graph: stop fill_oids_from_packs() progress on error and free()
 - commit-graph: fix memory leak in misused string_list API
 - submodule--helper: fix trivial leak in module_add()
 - transport: stop needlessly copying bundle header references
 - bundle: call strvec_clear() on allocated strvec
 - remote-curl.c: free memory in cmd_main()
 - urlmatch.c: add and use a *_release() function
 - diff.c: free "buf" in diff_words_flush()
 - merge-base: free() allocated "struct commit **" list
 - index-pack: fix memory leaks

 Plug random memory leaks.

 Will merge to 'next'.
 source: <cover-00.14-00000000000-20220302T170718Z-avarab@gmail.com>


* en/merge-ort-align-verbosity-with-recursive (2022-03-01) 1 commit
 - merge-ort: exclude messages from inner merges by default

 Align the level of verbose output from the ort backend during inner
 merge to that of the recursive backend.

 Will merge to 'next'.
 source: <pull.1167.git.1646194761463.gitgitgadget@gmail.com>


* ep/test-malloc-check-with-glibc-2.34 (2022-03-03) 1 commit
 - test-lib.sh: Use GLIBC_TUNABLES instead of MALLOC_CHECK_ on glibc >= 2.34

 The method to trigger malloc check used in our tests no longer work
 with newer versions of glibc.

 Expecting a reroll.
 cf. <xmqq8rtq8z41.fsf@gitster.g>
 source: <20220303090640.190307-1-gitter.spiros@gmail.com>


* gc/parse-tree-indirect-errors (2022-03-01) 1 commit
 - checkout, clone: die if tree cannot be parsed

 Check the return value from parse_tree_indirect() to turn segfaults
 into calls to die().

 Will merge to 'next'.
 source: <20220302003613.15567-1-chooglen@google.com>


* jc/mailsplit-warn-on-tty (2022-03-03) 1 commit
 - am/apply: warn if we end up reading patches from terminal

 "git am" can read from the standard input when no mailbox is given
 on the command line, but the end-user gets no indication when it
 happens, making Git appear stuck.

 source: <xmqqlexq8zqo.fsf@gitster.g>


* jc/stash-drop (2022-03-02) 3 commits
 - stash: call reflog_delete() in reflog.c
 - reflog: libify delete reflog function and helpers
 - stash: add tests to ensure reflog --rewrite --updatref behavior

 "git stash drop" is reimplemented as an internal call to
 reflog_delete() function, instead of invoking "git reflog delete"
 via run_command() API.

 Will merge to 'next'?
 source: <pull.1218.v4.git.git.1646260044.gitgitgadget@gmail.com>


* nj/read-tree-doc-reffix (2022-03-03) 1 commit
 - Documentation: git-read-tree: separate links using commas

 Documentation mark-up fix.

 Will merge to 'next'.
 source: <20220303161542.11616-1-nihal@nihaljere.xyz>


* ps/fetch-atomic-fixup (2022-03-03) 1 commit
 - t5503: simplify setup of test which exercises failure of backfill
 (this branch uses ps/fetch-atomic.)

 Test simplification.

 Will merge to 'next'.
 source: <cover.1645102965.git.ps@pks.im>


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

 Will merge to 'next'?
 source: <cover.1646266835.git.me@ttaylorr.com>


* tb/rename-remote-progress (2022-03-03) 2 commits
 - builtin/remote.c: show progress when renaming remote references
 - builtin/remote.c: parse options in 'rename'

 "git remote rename A B", depending on the number of remote-tracking
 refs involved, takes long time renaming them.  The command has been
 taught to show progress bar while making the user wait.

 Will merge to 'next'?
 source: <d5b0a4b71027619123b7284611692d3a9c128518.1646346287.git.me@ttaylorr.com>

--------------------------------------------------
[Stalled]

* tl/ls-tree-oid-only (2022-02-08) 13 commits
 - ls-tree.c: support --object-only option for "git-ls-tree"
 - ls-tree: introduce function "fast_path()"
 - ls-tree.c: introduce "--format" option
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
 source: <cover.1644319434.git.dyroneteng@gmail.com>


* je/http-better-error-output (2021-12-03) 1 commit
 . http-backend: give a hint that web browser access is not supported

 When the http-backend program, which is the server-side component
 for the smart HTTP transport, sends a "404 Not found" error, we
 deliberately did not say anything to the requesting client.  We now
 send a message back to the browser to tell the user that they do
 not want to visit the URL via their browser, instead of a totally
 blank page.

 Expecting a reroll.
 Breaks its self tests.
 cf. <7r23s082-o3q0-479o-srqn-r45q778s5nq7@vanv.qr>
 source: <20211202102855.23907-1-jengelh@inai.de>


* cb/save-term-across-editor-invocation (2021-12-01) 3 commits
 - fixup! editor: allow for saving/restoring terminal state
 - editor: allow for saving/restoring terminal state
 - terminal: teach save_term to fail when not foreground

 Some editors are reported to leave the terminal in funny state
 after they exit on Windows.  Work it around by saving and restoring
 the terminal state when needed.

 Expecting a reroll.
 cf. <CAPUEsphktbdxeV7hvF52Or3CVHS8oOk5-WV=xfEZa8kfCVVnVg@mail.gmail.com>
 source: <20211202035446.1154-1-carenas@gmail.com>

--------------------------------------------------
[Cooking]

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

 Will merge to 'next'?
 cf. <220302.86mti87cj2.gmgdl@evledraar.gmail.com>
 cf. <30dbc8fb-a1db-05bc-3dcb-070e11cf4715@gmail.com>
 source: <pull.1117.v2.git.1646130289.gitgitgadget@gmail.com>


* jk/name-rev-w-genno (2022-02-28) 1 commit
 - name-rev: use generation numbers if available

 "git name-rev" learned to use the generation numbers when setting
 the lower bound of searching commits used to explain the revision,
 when available, instead of committer time.

 Will merge to 'next'?
 source: <20220228215025.325904-2-jacob.e.keller@intel.com>


* et/xdiff-indirection (2022-02-17) 1 commit
 - xdiff: provide indirection to git functions

 Insert a layer of preprocessor macros for common functions in xdiff
 codebase.

 Expecting a (hopefully final) reroll.
 cf. <xmqqbkyudb8n.fsf@gitster.g>
 source: <20220217225408.GB7@edef91d97c94>


* jt/ls-files-stage-recurse (2022-02-23) 1 commit
  (merged to 'next' on 2022-02-28 at 4ad82bfdf6)
 + ls-files: support --recurse-submodules --stage

 Many output modes of "ls-files" does not work with its
 "--recurse-submodules" option, but the "-s" mode has taught to work
 with it.

 Will merge to 'master'.
 source: <20220224002303.2363189-1-jonathantanmy@google.com>


* ab/c99-variadic-macros (2022-02-21) 2 commits
  (merged to 'next' on 2022-03-01 at 0419a86e23)
 + C99: remove hardcoded-out !HAVE_VARIADIC_MACROS code
 + git-compat-util.h: clarify GCC v.s. C99-specific in comment

 Remove the escape hatch we added when we introduced the weather
 balloon to use variadic macros unconditionally, to make it official
 that we now have a hard dependency on the feature.

 Will merge to 'master'.
 source: <cover-v4-0.2-00000000000-20220221T160440Z-avarab@gmail.com>


* ab/hook-tests (2022-02-19) 2 commits
  (merged to 'next' on 2022-02-28 at bb6b7d1c24)
 + hook tests: use a modern style for "pre-push" tests
 + hook tests: test for exact "pre-push" hook input

 Test modernization.

 Will merge to 'master'.
 source: <cover-0.2-00000000000-20220218T204719Z-avarab@gmail.com>


* ab/test-leak-diag (2022-02-28) 4 commits
  (merged to 'next' on 2022-02-28 at 3019aad7fe)
 + test-lib: add "fast_unwind_on_malloc=0" to LSAN_OPTIONS
 + test-lib: make $GIT_BUILD_DIR an absolute path
 + test-lib: correct and assert TEST_DIRECTORY overriding
 + test-lib: add GIT_SAN_OPTIONS, inherit [AL]SAN_OPTIONS

 Random test-framework clean-up.

 Will merge to 'master'.
 source: <cover-v4-0.4-00000000000-20220227T102256Z-avarab@gmail.com>


* ds/worktree-docs (2022-02-23) 11 commits
  (merged to 'next' on 2022-02-28 at b7d23cb1a5)
 + worktree: use 'worktree' over 'working tree'
 + worktree: use 'worktree' over 'working tree'
 + worktree: use 'worktree' over 'working tree'
 + worktree: use 'worktree' over 'working tree'
 + worktree: use 'worktree' over 'working tree'
 + worktree: use 'worktree' over 'working tree'
 + worktree: use 'worktree' over 'working tree'
 + worktree: extract checkout_worktree()
 + worktree: extract copy_sparse_checkout()
 + worktree: extract copy_filtered_worktree_config()
 + worktree: combine two translatable messages

 Tighten the language around "working tree" and "worktree" in the
 docs.

 Will merge to 'master'.
 source: <pull.1154.v3.git.1645626559.gitgitgadget@gmail.com>


* en/merge-ort-plug-leaks (2022-02-20) 2 commits
  (merged to 'next' on 2022-02-28 at d7afb6b624)
 + merge-ort: fix small memory leak in unique_path()
 + merge-ort: fix small memory leak in detect_and_process_renames()

 Leakfix.

 Will merge to 'master'.
 source: <pull.1152.v2.git.1645320591.gitgitgadget@gmail.com>


* jc/rerere-train-modernise (2022-02-27) 1 commit
  (merged to 'next' on 2022-02-28 at d86d29733d)
 + rerere-train: two fixes to the use of "git show -s"

 Small modernization of the rerere-train script (in contrib/).

 Will merge to 'master'.
 source: <20220227220924.2144325-1-gitster@pobox.com>


* ab/help-fixes (2022-02-23) 9 commits
  (merged to 'next' on 2022-03-01 at 215f5dbbfb)
 + help: don't print "\n" before single-section output
 + help: add --no-[external-commands|aliases] for use with --all
 + help: error if [-a|-g|-c] and [-i|-m|-w] are combined
 + help: correct usage & behavior of "git help --all"
 + help: note the option name on option incompatibility
 + help.c: split up list_all_cmds_help() function
 + help tests: test "git" and "git help [-a|-g] spacing
 + help.c: use puts() instead of printf{,_ln}() for consistency
 + help doc: add missing "]" to "[-a|--all]"

 Updates to how command line options to "git help" are handled.

 Will merge to 'master'.
 source: <cover-v2-0.9-00000000000-20220221T193708Z-avarab@gmail.com>


* ac/usage-string-fixups (2022-02-23) 1 commit
  (merged to 'next' on 2022-02-28 at 5e8fa3f846)
 + amend remaining usage strings according to style guide

 Usage-string normalization.

 Will merge to 'master'.
 source: <f425e36b7ea4a310a8ad93d47ead4c1713117388.1645626455.git.gitgitgadget@gmail.com>


* mc/index-pack-report-max-size (2022-02-23) 1 commit
  (merged to 'next' on 2022-02-28 at 31b907844b)
 + index-pack: clarify the breached limit

 When "index-pack" dies due to incoming data exceeding the maximum
 allowed input size, include the value of the limit in the error
 message.

 Will merge to 'master'.
 source: <pull.1158.v2.git.1645661240356.gitgitgadget@gmail.com>


* sm/no-git-in-upstream-of-pipe-in-tests (2022-02-23) 1 commit
 - t0003: avoid pipes with Git on LHS

 Test fixes.

 Will merge to 'next'.
 source: <20220223115347.3083-3-shivam828787@gmail.com>


* ab/c99-designated-initializers (2022-02-24) 9 commits
  (merged to 'next' on 2022-02-28 at 5ff6d5b26f)
 + fast-import.c: use designated initializers for "partial" struct assignments
 + refspec.c: use designated initializers for "struct refspec_item"
 + convert.c: use designated initializers for "struct stream_filter*"
 + userdiff.c: use designated initializers for "struct userdiff_driver"
 + archive-*.c: use designated initializers for "struct archiver"
 + object-file: use designated initializers for "struct git_hash_algo"
 + trace2: use designated initializers for "struct tr2_dst"
 + trace2: use designated initializers for "struct tr2_tgt"
 + imap-send.c: use designated initializers for "struct imap_server_conf"

 Use designated initializers we started using in mid 2017 in more
 parts of the codebase that are relatively quiescent.

 Will merge to 'master'.
 source: <cover-00.12-00000000000-20220224T092805Z-avarab@gmail.com>


* ab/http-gcc-12-workaround (2022-02-25) 1 commit
 - http API: fix dangling pointer issue noted by GCC 12.0

 Work around false warning pre-release of GCC 12.
 source: <patch-v2-1.1-777838267a5-20220225T090816Z-avarab@gmail.com>


* ab/make-optim-noop (2022-03-03) 8 commits
 - Makefiles: add and use wildcard "mkdir -p" template
 - Makefile: add "$(QUIET)" boilerplate to shared.mak
 - Makefile: move $(comma), $(empty) and $(space) to shared.mak
 - Makefile: move ".SUFFIXES" rule to shared.mak
 - Makefile: define $(LIB_H) in terms of $(FIND_SOURCE_FILES)
 - Makefile: disable GNU make built-in wildcard rules
 - Makefiles: add "shared.mak", move ".DELETE_ON_ERROR" to it
 - scalar Makefile: use "The default target of..." pattern

 Makefile refactoring with a bit of suffixes rule stripping to
 optimize the runtime overhead.

 Will merge to 'next'.
 source: <cover-v5-0.8-00000000000-20220303T160155Z-avarab@gmail.com>


* ah/advice-switch-requires-detach-to-detach (2022-02-25) 1 commit
  (merged to 'next' on 2022-02-28 at 941ee621cf)
 + switch: mention the --detach option when dying due to lack of a branch

 The error message given by "git switch HEAD~4" has been clarified
 to suggest the "--detach" option that is required.

 Will merge to 'master'.
 source: <20220226061213.1590341-1-alexhenrie24@gmail.com>


* ds/commit-graph-gen-v2-fixes (2022-03-01) 5 commits
 - commit-graph: fix generation number v2 overflow values
 - commit-graph: start parsing generation v2 (again)
 - commit-graph: fix ordering bug in generation numbers
 - t5318: extract helpers to lib-commit-graph.sh
 - test-read-graph: include extra post-parse info

 Fixes to the way generation number v2 in the commit-graph files are
 (not) handled.
 source: <pull.1163.v3.git.1646164112.gitgitgadget@gmail.com>


* ds/partial-bundles (2022-02-24) 11 commits
 - bundle: unbundle promisor packs
 - bundle: create filtered bundles
 - rev-list: move --filter parsing into revision.c
 - bundle: parse filter capability
 - bundle: safely handle --objects option
 - MyFirstObjectWalk: update recommended usage
 - list-objects: consolidate traverse_commit_list[_filtered]
 - pack-bitmap: drop filter in prepare_bitmap_walk()
 - pack-objects: use rev.filter when possible
 - revision: put object filter into struct rev_info
 - index-pack: document and test the --promisor option
 (this branch is used by ds/bundle-uri.)

 Bundle file format gets extended to allow a partial bundle,
 filtered by similar criteria you would give when making a
 partial/lazy clone.
 source: <pull.1159.git.1645638911.gitgitgadget@gmail.com>


* fs/gpgsm-update (2022-03-02) 3 commits
 - t/lib-gpg: kill all gpg components, not just gpg-agent
 - t/lib-gpg: reload gpg components after updating trustlist
 - gpg-interface/gpgsm: fix for v2.3

 Newer version of GPGSM changed its output in a backward
 incompatible way to break our code that parses its output.  It also
 added more processes our tests need to kill when cleaning up.
 Adjustments have been made to accomodate these changes.

 Will merge to 'next'.
 source: <20220224100628.612789-1-fs@gigacodes.de>


* gc/stash-on-branch-with-multi-level-name (2022-02-24) 1 commit
  (merged to 'next' on 2022-02-28 at 1a94306611)
 + stash: strip "refs/heads/" with skip_prefix

 "git checkout -b branch/with/multi/level/name && git stash" only
 recorded the last level component of the branch name, which has
 been corrected.

 Will merge to 'master'.
 source: <20220124205342.41450-1-chooglen@google.com>


* jd/prompt-upstream-mark (2022-02-25) 4 commits
 - git-prompt: put upstream comments together
 - git-prompt: make long upstream state indicator consistent
 - git-prompt: make upstream state indicator location consistent
 - git-prompt: rename `upstream` to `upstream_type`

 Tweaks in the command line prompt (in contrib/) code around its
 GIT_PS1_SHOWUPSTREAM feature.

 Needs reviews.
 source: <pull.1162.git.1645789446.gitgitgadget@gmail.com>


* pw/worktree-list-with-z (2022-02-25) 1 commit
 - worktree: add -z option for list subcommand

 "git worktree list --porcelain" did not c-quote pathnames and lock
 reasons with unsafe bytes correctly, which is worked around by
 introducing NUL terminated output format with "-z".

 Expecting a reroll.
 cf. <dd16416d-15c4-7f80-aaf6-a36d101e8928@gmail.com>
 source: <pull.1164.git.1645801727732.gitgitgadget@gmail.com>


* rc/fetch-repair (2022-02-24) 8 commits
 - doc/partial-clone: mention --repair fetch option
 - fetch: after repair, encourage auto gc repacking
 - maintenance: add ability to pass config options
 - t5615-partial-clone: add test for fetch --repair
 - fetch: add --repair option
 - builtin/fetch-pack: add --repair option
 - fetch-pack: add repairing
 - fetch-negotiator: add specific noop initializor

 "git fetch --repair" learned to fetch everything without telling
 the other side what we already have, which is useful when you
 cannot trust what you have in the local object store.
 source: <pull.1138.v2.git.1645719218.gitgitgadget@gmail.com>


* tk/empty-untracked-cache (2022-02-28) 3 commits
 - untracked-cache: write index when populating empty untracked cache
 - t7519: populate untracked cache before test
 - t7519: avoid file to index mtime race for untracked cache

 The untracked cache newly computed weren't written back to the
 on-disk index file when there is no other change to the index,
 which has been corrected.

 Will merge to 'next'.
 source: <pull.986.v3.git.1645999021.gitgitgadget@gmail.com>


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


* vd/sparse-read-tree (2022-03-01) 8 commits
 - read-tree: make three-way merge sparse-aware
 - read-tree: make two-way merge sparse-aware
 - read-tree: narrow scope of index expansion for '--prefix'
 - read-tree: integrate with sparse index
 - read-tree: expand sparse checkout test coverage
 - read-tree: explicitly disallow prefixes with a leading '/'
 - status: fix nested sparse directory diff in sparse index
 - sparse-index: prevent repo root from becoming sparse

 "git read-tree" has been made to be aware of the sparse-index
 feature.

 Will merge to 'next'.
 source: <pull.1157.v3.git.1646166271.gitgitgadget@gmail.com>


* en/sparse-checkout-fixes (2022-02-20) 5 commits
  (merged to 'next' on 2022-02-28 at 7307431c62)
 + sparse-checkout: reject arguments in cone-mode that look like patterns
 + sparse-checkout: error or warn when given individual files
 + sparse-checkout: pay attention to prefix for {set, add}
 + sparse-checkout: correctly set non-cone mode when expected
 + sparse-checkout: correct reapply's handling of options

 Further polishing of "git sparse-checkout".

 Will merge to 'master'.
 source: <pull.1118.v5.git.1645289086.gitgitgadget@gmail.com>


* ab/commit-plug-leaks (2022-02-16) 2 commits
 - commit: use strbuf_release() instead of UNLEAK()
 - commit: fix "author_ident" leak

 Leakfixes in the top-level called-once function.

 Expecting a reroll.
 I think UNLEAK->strbuf_release() is a regression.
 source: <cover-0.2-00000000000-20220216T081844Z-avarab@gmail.com>


* pw/single-key-interactive (2022-02-23) 4 commits
 - add -p: disable stdin buffering when interactive.singlekey is set
 - terminal: set VMIN and VTIME in non-canonical mode
 - terminal: pop signal handler when terminal is restored
 - terminal: always reset terminal when reading without echo

 The single-key interactive operation used by "git add -p" has been
 made more robust.

 Will merge to 'next'?
 source: <pull.1146.v2.git.1645556015.gitgitgadget@gmail.com>


* jh/builtin-fsmonitor-part3 (2022-03-01) 23 commits
 - t/perf/p7527: add perf test for builtin FSMonitor
 - t7527: FSMonitor tests for directory moves
 - fsmonitor: optimize processing of directory events
 - fsm-listen-darwin: shutdown daemon if worktree root is moved/renamed
 - fsm-health-win32: force shutdown daemon if worktree root moves
 - fsm-health-win32: add framework to monitor daemon health
 - fsmonitor--daemon: stub in health thread
 - fsmonitor--daemon: rename listener thread related variables
 - fsmonitor--daemon: prepare for adding health thread
 - fsmonitor--daemon: cd out of worktree root
 - fsm-listen-darwin: ignore FSEvents caused by xattr changes on macOS
 - unpack-trees: initialize fsmonitor_has_run_once in o->result
 - fsmonitor-settings: remote repos on Windows are incompatible with FSMonitor
 - fsmonitor-settings: remote repos on macOS are incompatible with FSMonitor
 - fsmonitor-settings: stub in macOS-specific incompatibility checking
 - fsmonitor-settings: virtual repos are incompatible with FSMonitor
 - fsmonitor-settings: stub in platform-specific incompatibility checking
 - fsmonitor-settings: bare repos are incompatible with FSMonitor
 - t/helper/fsmonitor-client: create stress test
 - t7527: test builtin FSMonitor watching repos with unicode paths
 - t7527: test FS event reporing on macOS WRT case and Unicode
 - fsm-listen-win32: handle shortnames
 - Merge branch 'jh/builtin-fsmonitor-part2' into jh/builtin-fsmonitor-part3
 (this branch uses jh/builtin-fsmonitor-part2.)

 More fsmonitor--daemon.

 Expecting a reroll on the updated "part 2".
 source: <pull.1143.git.1644940773.gitgitgadget@gmail.com>


* hn/reftable-no-empty-keys (2022-02-23) 7 commits
  (merged to 'next' on 2022-03-01 at dc4aa7e796)
 + reftable: rename writer_stats to reftable_writer_stats
 + reftable: add test for length of disambiguating prefix
 + reftable: ensure that obj_id_len is >= 2 on writing
 + reftable: avoid writing empty keys at the block layer
 + reftable: add a test that verifies that writing empty keys fails
 + reftable: reject 0 object_id_len
 + Documentation: object_id_len goes up to 31

 General clean-up in reftable implementation, including
 clarification of the API documentation, tightening the code to
 honor documented length limit, etc.

 Will merge to 'master'.
 source: <pull.1185.v3.git.git.1645469170.gitgitgadget@gmail.com>


* ps/fetch-atomic (2022-02-17) 7 commits
  (merged to 'next' on 2022-02-18 at 3824153b23)
 + fetch: make `--atomic` flag cover pruning of refs
 + fetch: make `--atomic` flag cover backfilling of tags
 + refs: add interface to iterate over queued transactional updates
 + fetch: report errors when backfilling tags fails
 + fetch: control lifecycle of FETCH_HEAD in a single place
 + fetch: backfill tags before setting upstream
 + fetch: increase test coverage of fetches
 (this branch is used by ps/fetch-atomic-fixup and ps/fetch-mirror-optim.)

 "git fetch" can make two separate fetches, but ref updates coming
 from them were in two separate ref transactions under "--atomic",
 which has been corrected.

 source: <cover.1645102965.git.ps@pks.im>


* pw/xdiff-alloc-fail (2022-02-16) 4 commits
  (merged to 'next' on 2022-03-01 at 8a10912059)
 + xdiff: handle allocation failure when merging
 + xdiff: refactor a function
 + xdiff: handle allocation failure in patience diff
 + xdiff: fix a memory leak

 Improve failure case behaviour of xdiff library when memory
 allocation fails.

 Will merge to 'master'.
 source: <pull.1140.v2.git.1645006510.gitgitgadget@gmail.com>


* gc/recursive-fetch-with-unused-submodules (2022-02-28) 12 commits
 - SQUASH???
 - SQUASH???
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

 Expecting a reroll.
 source: <20220224100842.95827-1-chooglen@google.com>


* cg/t3903-modernize (2022-02-23) 3 commits
  (merged to 'next' on 2022-02-23 at 0d5a844b40)
 + tests: make the code more readable
 + tests: allow testing if a path is truly a file or a directory
 + t/t3903-stash.sh: replace test [-d|-f] with test_path_is_*

 Test modernization.

 Will merge to 'master'.
 source: <20220222215430.605254-1-cogoni.guillaume@gmail.com>


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

 Will merge to 'next'?
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


* jc/cat-file-batch-commands (2022-02-18) 4 commits
  (merged to 'next' on 2022-03-01 at 8764b7963c)
 + cat-file: add --batch-command mode
 + cat-file: add remove_timestamp helper
 + cat-file: introduce batch_mode enum to replace print_contents
 + cat-file: rename cmdmode to transform_mode

 "git cat-file" learns "--batch-command" mode, which is a more
 flexible interface than the existing "--batch" or "--batch-check"
 modes, to allow different kinds of inquiries made.

 Will merge to 'master'.
 source: <pull.1212.v10.git.git.1645208594.gitgitgadget@gmail.com>


* ar/submodule-update (2022-03-02) 13 commits
 - submodule--helper update-clone: check for --filter and --init
 - submodule update: add tests for --filter
 - submodule--helper update-clone: learn --init
 - submodule--helper: allow setting superprefix for init_submodule()
 - submodule--helper: refactor get_submodule_displaypath()
 - submodule--helper run-update-procedure: learn --remote
 - submodule--helper: don't use bitfield indirection for parse_options()
 - submodule--helper: get remote names from any repository
 - submodule--helper: remove ensure-core-worktree
 - submodule--helper run-update-procedure: remove --suboid
 - submodule--helper: reorganize code for sh to C conversion
 - submodule--helper: remove update-module-mode
 - submodule tests: test for init and update failure output

 Rewrite of "git submodule update" in C (early part).

 cf. <xmqqzgm690iu.fsf@gitster.g>
 source: <20220303005727.69270-1-chooglen@google.com>


* rj/receive-pack-abort-upon-disconnect (2022-01-28) 1 commit
 - receive-pack: check if client is alive before completing the push

 "git push" may be killed by the user when the server side has
 finished receiving all data and is about to commit the result.
 Give the latter a better chance to notice such situation and abort
 processing the ref updates.

 Needs more work?
 cf. <220204.864k5e4yvf.gmgdl@evledraar.gmail.com>
 source: <20220128194811.3396281-1-robin.jarry@6wind.com>


* ab/object-file-api-updates (2022-02-25) 12 commits
 - object-file API: pass an enum to read_object_with_reference()
 - object-file.c: add a literal version of write_object_file_prepare()
 - object-file API: have hash_object_file() take "enum object_type"
 - object API: rename hash_object_file_literally() to write_*()
 - object-file API: split up and simplify check_object_signature()
 - object API users + docs: check <0, not !0 with check_object_signature()
 - object API docs: move check_object_signature() docs to cache.h
 - object API: correct "buf" v.s. "map" mismatch in *.c and *.h
 - object-file API: have write_object_file() take "enum object_type"
 - object-file API: add a format_object_header() function
 - object-file API: return "void", not "int" from hash_object_file()
 - object-file.c: split up declaration of unrelated variables

 Object-file API shuffling.

 Will merge to 'next'.
 source: <cover-v3-00.12-00000000000-20220204T234435Z-avarab@gmail.com>


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


* rs/bisect-executable-not-found (2022-01-19) 4 commits
  (merged to 'next' on 2022-02-28 at c74bff7954)
 + bisect--helper: double-check run command on exit code 126 and 127
 + bisect: document run behavior with exit codes 126 and 127
 + bisect--helper: release strbuf and strvec on run error
 + bisect--helper: report actual bisect_state() argument on error

 A not-so-common mistake is to write a script to feed "git bisect
 run" without making it executable, in which case all tests will
 exit with 126 or 127 error codes, even on revisions that are marked
 as good.  Try to recognize this situation and stop iteration early.

 Will merge to 'master'.
 source: <fead25d6-6f5f-487a-ad4c-0657fe9785fd@www.fastmail.com>


* en/present-despite-skipped (2022-03-01) 7 commits
  (merged to 'next' on 2022-03-01 at 4982287a31)
 + repo_read_index: add config to expect files outside sparse patterns
  (merged to 'next' on 2022-02-15 at 960873fdad)
 + Accelerate clear_skip_worktree_from_present_files() by caching
 + Update documentation related to sparsity and the skip-worktree bit
 + repo_read_index: clear SKIP_WORKTREE bit from files present in worktree
 + unpack-trees: fix accidental loss of user changes
 + t1011: add testcase demonstrating accidental loss of user modifications
 + Merge branch 'vd/sparse-clean-etc' into en/present-despite-skipped

 In sparse-checkouts, files mis-marked as missing from the working tree
 could lead to later problems.  Such files were hard to discover, and
 harder to correct.  Automatically detecting and correcting the marking
 of such files has been added to avoid these problems.

 Will merge to 'master'.
 source: <pull.1114.v2.git.1642175983.gitgitgadget@gmail.com>


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
 - update-index: convert fsmonitor warnings to advise
 - t7527: test status with untracked-cache and fsmonitor--daemon
 - fsmonitor: force update index after large responses
 - fsmonitor--daemon: use a cookie file to sync with file system
 - fsmonitor--daemon: periodically truncate list of modified files
 - t/perf/p7519: add fsmonitor--daemon test cases
 - t/perf/p7519: speed up test on Windows
 - t/helper/test-chmtime: skip directories on Windows
 - t/perf: avoid copying builtin fsmonitor files into test repo
 - t7527: create test for fsmonitor--daemon
 - t/helper/fsmonitor-client: create IPC client to talk to FSMonitor Daemon
 - help: include fsmonitor--daemon feature flag in version info
 - fsmonitor--daemon: implement handle_client callback
 - compat/fsmonitor/fsm-listen-darwin: implement FSEvent listener on MacOS
 - compat/fsmonitor/fsm-listen-darwin: add MacOS header files for FSEvent
 - compat/fsmonitor/fsm-listen-win32: implement FSMonitor backend on Windows
 - fsmonitor--daemon: create token-based changed path cache
 - fsmonitor--daemon: define token-ids
 - fsmonitor--daemon: add pathname classification
 - fsmonitor--daemon: implement 'start' command
 - fsmonitor--daemon: implement 'run' command
 - compat/fsmonitor/fsm-listen-darwin: stub in backend for Darwin
 - compat/fsmonitor/fsm-listen-win32: stub in backend for Windows
 - fsmonitor--daemon: implement 'stop' and 'status' commands
 - fsmonitor--daemon: add a built-in fsmonitor daemon
 - fsmonitor: document builtin fsmonitor
 - fsmonitor: use IPC to query the builtin FSMonitor daemon
 - fsmonitor: config settings are repository-specific
 - fsmonitor-ipc: create client routines for git-fsmonitor--daemon
 - fsmonitor: enhance existing comments, clarify trivial response handling
 (this branch is used by jh/builtin-fsmonitor-part3.)

 Built-in fsmonitor (part 2).

 Will merge to 'next'.
 source: <pull.1041.v6.git.1646160212.gitgitgadget@gmail.com>


* es/superproject-aware-submodules (2022-02-28) 3 commits
 - rev-parse: short-circuit superproject worktree when config unset
 - introduce submodule.hasSuperproject record
 - t7400-submodule-basic: modernize inspect() helper

 A configuration variable in a repository tells if it is (or is not)
 a submodule of a superproject.

 Expecting a reroll.
 cf. <xmqqbkyqupg6.fsf@gitster.g>
 source: <20220301002613.1459916-1-emilyshaffer@google.com>

------------------------------------------------------------
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
