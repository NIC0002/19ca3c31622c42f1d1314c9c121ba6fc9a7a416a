Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484B9C433F5
	for <git@archiver.kernel.org>; Thu, 24 Feb 2022 03:40:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbiBXDk7 (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 23 Feb 2022 22:40:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiBXDk6 (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 23 Feb 2022 22:40:58 -0500
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9168247757
        for <git@vger.kernel.org>; Wed, 23 Feb 2022 19:40:27 -0800 (PST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 31CD417BB56;
        Wed, 23 Feb 2022 22:40:27 -0500 (EST)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to
        :subject:date:message-id:mime-version:content-type; s=sasl; bh=B
        +qpKBvVmb2NkQNiHCx9Eum6kWiKMPnN+3L6S2r8oZM=; b=fHEYtGCRM36KXa90q
        +VG2sb+U2yqLKafHyRXlV509Ya4Th9JRZP9buhZpkbTRRgIHSNB2EVKawFHjBpn/
        FJVADiQl5Lwpl/jMYCGYO3dNJFAN4NnZz9vvebwsk7XH+tXhvSu67e3XrMaaKHKy
        92lQbrrrtBAuvxj45jzqedMnWs=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 29E5E17BB55;
        Wed, 23 Feb 2022 22:40:27 -0500 (EST)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [34.82.80.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 9024A17BB54;
        Wed, 23 Feb 2022 22:40:24 -0500 (EST)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Feb 2022, #06; Wed, 23)
X-master-at: dab1b7905d0b295f1acef9785bb2b9cbb0fdec84
X-next-at: 0bdcbb44647328cb1bdb23be648ecb677189c7b4
Date:   Wed, 23 Feb 2022 19:40:23 -0800
Message-ID: <xmqq1qztortk.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID: 8007A37E-9523-11EC-B48C-CBA7845BAAA9-77302942!pb-smtp21.pobox.com
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

Many topics have no summary written yet for them in this issue.

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

* ab/hash-object-leakfix (2022-02-06) 1 commit
  (merged to 'next' on 2022-02-10 at 14956d3087)
 + hash-object: fix a trivial leak in --path

 Trivial leakfix.
 source: <patch-1.1-53863df1455-20220205T000422Z-avarab@gmail.com>


* ab/release-transport-ls-refs-options (2022-02-06) 1 commit
  (merged to 'next' on 2022-02-10 at c4e57c2b29)
 + ls-remote & transport API: release "struct transport_ls_refs_options"

 source: <patch-1.1-e80e8f64eae-20220205T000809Z-avarab@gmail.com>


* ab/t0051-skip-on-non-windows (2022-02-04) 1 commit
  (merged to 'next' on 2022-02-10 at 3e587df1d6)
 + t0051: use "skip_all" under !MINGW in single-test file

 Conditional test update.
 source: <patch-v2-1.1-1bc93bcba4b-20220204T134208Z-avarab@gmail.com>


* ah/log-no-graph (2022-02-11) 2 commits
  (merged to 'next' on 2022-02-14 at 6c8fd1f37f)
 + log: add a --no-graph option
 + log: fix memory leak if --graph is passed multiple times

 "git log --graph --graph" used to leak a graph structure, and there
 was no way to countermand "--graph" that appear earlier on the
 command line.  A "--no-graph" option has been added and resource
 leakage has been plugged.
 source: <20220211163627.598166-2-alexhenrie24@gmail.com>


* bc/clarify-eol-attr (2022-02-14) 1 commit
  (merged to 'next' on 2022-02-14 at 7e23e61f3f)
 + doc: clarify interaction between 'eol' and text=auto

 Documentation update
 source: <xmqqilth2u28.fsf@gitster.g>


* bs/forbid-i18n-of-protocol-token-in-fetch-pack (2022-02-11) 1 commit
  (merged to 'next' on 2022-02-14 at 9abd0dce80)
 + fetch-pack: parameterize message containing 'ready' keyword

 L10n support for a few error messages.
 source: <20211222075805.19027-1-bagasdotme@gmail.com>


* cb/clear-quarantine-early-on-all-ref-update-errors (2022-02-01) 1 commit
  (merged to 'next' on 2022-02-10 at 213f44aec8)
 + receive-pack: purge temporary data if no command is ready to run

 "receive-pack" checks if it will do any ref updates (various
 conditions could reject a push) before received objects are taken
 out of the temporary directory used for quarantine purposes, so
 that a push that is known-to-fail will not leave crufts that a
 future "gc" needs to clean up.
 source: <20220129063538.24038-1-bojun.cbj@gmail.com>


* ds/mailmap (2022-02-14) 1 commit
  (merged to 'next' on 2022-02-14 at 1e50634951)
 + mailmap: change primary address for Derrick Stolee

 Update mailmap entries.
 source: <pull.1142.git.1644857153590.gitgitgadget@gmail.com>


* gc/branch-recurse-submodules (2022-02-04) 7 commits
  (merged to 'next' on 2022-02-10 at b54367ff92)
 + branch.c: use 'goto cleanup' in setup_tracking() to fix memory leaks
 + branch: add --recurse-submodules option for branch creation
 + builtin/branch: consolidate action-picking logic in cmd_branch()
 + branch: add a dry_run parameter to create_branch()
 + branch: make create_branch() always create a branch
 + branch: move --set-upstream-to behavior to dwim_and_setup_tracking()
 + Merge branch 'js/branch-track-inherit' into gc/branch-recurse-submodules

 "git branch" learned the "--recurse-submodules" option.
 source: <20220129000446.99261-1-chooglen@google.com>


* hw/t1410-adjust-test-for-reftable (2022-02-09) 2 commits
  (merged to 'next' on 2022-02-14 at 6b96b4faa4)
 + t1410: mark bufsize boundary test as REFFILES
 + t1410: use test-tool ref-store to inspect reflogs

 Fix tests that are unnecessarily specific to ref-files backend.
 source: <pull.1213.git.git.1644406180.gitgitgadget@gmail.com>


* jc/glossary-worktree (2022-02-09) 1 commit
  (merged to 'next' on 2022-02-10 at d05e2b6ea3)
 + glossary: describe "worktree"

 "working tree" and "per-worktree ref" were in glossary, but
 "worktree" itself wasn't, which has been corrected.
 source: <xmqqczjvxy3o.fsf@gitster.g>


* jd/t0015-modernize (2022-02-09) 1 commit
  (merged to 'next' on 2022-02-10 at a3733234c0)
 + t/t0015-hash.sh: remove unnecessary '\' at line end

 Test modernization.
 source: <20220208092339.651761-2-jaydeepjd.8914@gmail.com>


* js/short-help-outside-repo-fix (2022-02-08) 2 commits
  (merged to 'next' on 2022-02-10 at a86376de89)
 + t0012: verify that built-ins handle `-h` even without gitdir
 + checkout/fetch/pull/pack-objects: allow `-h` outside a repository

 "git cmd -h" outside a repository should error out cleanly for many
 commands, but instead it hit a BUG(), which has been corrected.
 source: <pull.1139.v2.git.1644319314.gitgitgadget@gmail.com>


* ps/avoid-unnecessary-hook-invocation-with-packed-refs (2022-01-17) 6 commits
  (merged to 'next' on 2022-02-10 at 4866a64508)
 + refs: skip hooks when deleting uncovered packed refs
 + refs: do not execute reference-transaction hook on packing refs
 + refs: demonstrate excessive execution of the reference-transaction hook
 + refs: allow skipping the reference-transaction hook
 + refs: allow passing flags when beginning transactions
 + refs: extract packed_refs_delete_refs() to allow control of transaction

 Because a deletion of ref would need to remove it from both the
 loose ref store and the packed ref store, a delete-ref operation
 that logically removes one ref may end up invoking ref-transaction
 hook twice, which has been corrected.
 source: <cover.1642406989.git.ps@pks.im>


* ps/fetch-optim-with-commit-graph (2022-02-10) 2 commits
  (merged to 'next' on 2022-02-14 at 2b331293fb)
 + fetch: skip computing output width when not printing anything
 + fetch-pack: use commit-graph when computing cutoff

 A couple of optimization to "git fetch".
 source: <cover.1644495978.git.ps@pks.im>


* pw/use-in-process-checkout-in-rebase (2022-01-26) 14 commits
  (merged to 'next' on 2022-02-10 at bd7c3615fe)
 + rebase -m: don't fork git checkout
 + rebase --apply: set ORIG_HEAD correctly
 + rebase --apply: fix reflog
 + reset_head(): take struct rebase_head_opts
 + rebase: cleanup reset_head() calls
 + create_autostash(): remove unneeded parameter
 + reset_head(): make default_reflog_action optional
 + reset_head(): factor out ref updates
 + reset_head(): remove action parameter
 + rebase --apply: don't run post-checkout hook if there is an error
 + rebase: do not remove untracked files on checkout
 + rebase: pass correct arguments to post-checkout hook
 + t5403: refactor rebase post-checkout hook tests
 + rebase: factor out checkout for up to date branch

 Use an internal call to reset_head() helper function instead of
 spawning "git checkout" in "rebase", and update code paths that are
 involved in the change.
 source: <pull.1049.v3.git.1643202349.gitgitgadget@gmail.com>


* sy/t0001-use-path-is-helper (2022-02-11) 1 commit
  (merged to 'next' on 2022-02-14 at 2f1bdb0803)
 + t0001: replace "test [-d|-f]" with test_path_is_* functions

 Test modernization.
 source: <20220121102109.433457-2-shaoxuan.yuan02@gmail.com>


* tb/midx-no-bitmap-for-no-objects (2022-02-09) 1 commit
  (merged to 'next' on 2022-02-10 at 5c501a3f80)
 + midx: prevent writing a .bitmap without any objects

 When there is no object to write .bitmap file for, "git
 multi-pack-index" triggered an error, instead of just skipping,
 which has been corrected.
 source: <abc67d757cb6b244cf54b7b030985180ce134724.1644434802.git.me@ttaylorr.com>

--------------------------------------------------
[New Topics]

* et/xdiff-indirection (2022-02-17) 1 commit
 - xdiff: provide indirection to git functions

 Insert a layer of preprocessor macros for common functions in xdiff
 codebase.

 Sort of Meh, other than the fact that it documents what can
 plausibly be renamed.
 source: <20220217225408.GB7@edef91d97c94>


* tb/coc-plc-update (2022-02-18) 1 commit
  (merged to 'next' on 2022-02-23 at 9d45e42c9a)
 + CODE_OF_CONDUCT.md: update PLC members list

 Document Taylor as a new member of Git PLC at SFC.  Welcome.

 Will merge to 'master'.
 source: <f5daef58bc0bededd46bc9686c586ba5ae9a453c.1645211253.git.me@ttaylorr.com>


* jt/ls-files-stage-recurse (2022-02-23) 1 commit
 - ls-files: support --recurse-submodules --stage

 Many output modes of "ls-files" does not work with its
 "--recurse-submodules" option, but the "-s" mode has taught to work
 with it.
 source: <20220224002303.2363189-1-jonathantanmy@google.com>


* ab/c99 (2022-02-21) 2 commits
 - C99: remove hardcoded-out !HAVE_VARIADIC_MACROS code
 - git-compat-util.h: clarify GCC v.s. C99-specific in comment

 source: <cover-v4-0.2-00000000000-20220221T160440Z-avarab@gmail.com>


* ab/hook-tests (2022-02-19) 2 commits
 - hook tests: use a modern style for "pre-push" tests
 - hook tests: test for exact "pre-push" hook input

 source: <cover-0.2-00000000000-20220218T204719Z-avarab@gmail.com>


* ab/test-lib-tweaks (2022-02-21) 4 commits
 - test-lib: add "fast_unwind_on_malloc=0" to LSAN_OPTIONS
 - test-lib: make $GIT_BUILD_DIR an absolute path
 - test-lib: correct commentary on TEST_DIRECTORY overriding
 - test-lib: add GIT_SAN_OPTIONS, inherit [AL]SAN_OPTIONS

 source: <cover-v3-0.4-00000000000-20220221T155656Z-avarab@gmail.com>


* ds/worktree-docs (2022-02-23) 11 commits
 - worktree: use 'worktree' over 'working tree'
 - worktree: use 'worktree' over 'working tree'
 - worktree: use 'worktree' over 'working tree'
 - worktree: use 'worktree' over 'working tree'
 - worktree: use 'worktree' over 'working tree'
 - worktree: use 'worktree' over 'working tree'
 - worktree: use 'worktree' over 'working tree'
 - worktree: extract checkout_worktree()
 - worktree: extract copy_sparse_checkout()
 - worktree: extract copy_filtered_worktree_config()
 - worktree: combine two translatable messages
 (this branch uses ds/sparse-checkout-requires-per-worktree-config.)

 source: <pull.1154.v3.git.1645626559.gitgitgadget@gmail.com>


* en/merge-ort-plug-leaks (2022-02-20) 2 commits
 - merge-ort: fix small memory leak in unique_path()
 - merge-ort: fix small memory leak in detect_and_process_renames()

 source: <pull.1152.v2.git.1645320591.gitgitgadget@gmail.com>


* jc/rerere-train-modernise (2022-02-20) 1 commit
 - rerere-train: modernise a bit

 source: <xmqqsfsjuw8m.fsf@gitster.g>


* ab/help-fixes (2022-02-23) 9 commits
 - help: don't print "\n" before single-section output
 - help: add --no-[external-commands|aliases] for use with --all
 - help: error if [-a|-g|-c] and [-i|-m|-w] are combined
 - help: correct usage & behavior of "git help --all"
 - help: note the option name on option incompatibility
 - help.c: split up list_all_cmds_help() function
 - help tests: test "git" and "git help [-a|-g] spacing
 - help.c: use puts() instead of printf{,_ln}() for consistency
 - help doc: add missing "]" to "[-a|--all]"

 source: <cover-v2-0.9-00000000000-20220221T193708Z-avarab@gmail.com>


* ac/usage-string-fixups (2022-02-23) 2 commits
 - parse-options.c: add style checks for usage-strings
 - amend remaining usage strings according to style guide

 source: <pull.1147.v3.git.1645626455.gitgitgadget@gmail.com>


* mc/index-pack-report-max-size (2022-02-23) 2 commits
 - t5302: confirm that large packs mention limit
 - index-pack: clarify the breached limit

 source: <pull.1158.git.1645632193.gitgitgadget@gmail.com>


* sm/no-git-in-upstream-of-pipe-in-tests (2022-02-23) 1 commit
 - t0003: avoid pipes with Git on LHS

 source: <20220223115347.3083-3-shivam828787@gmail.com>

--------------------------------------------------
[Stalled]

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

* en/sparse-checkout-fixes (2022-02-20) 5 commits
 - sparse-checkout: reject arguments in cone-mode that look like patterns
 - sparse-checkout: error or warn when given individual files
 - sparse-checkout: pay attention to prefix for {set, add}
 - sparse-checkout: correctly set non-cone mode when expected
 - sparse-checkout: correct reapply's handling of options

 Further polishing of "git sparse-checkout".

 Will merge to 'next'.
 source: <pull.1118.v5.git.1645289086.gitgitgadget@gmail.com>


* jc/name-rev-stdin (2022-02-15) 1 commit
  (merged to 'next' on 2022-02-16 at ee993590a4)
 + name-rev: replace --stdin with --annotate-stdin in synopsis

 Finishing touches to an earlier "name-rev --annotate-stdin" series.

 Will merge to 'master'.
 source: <pull.1216.git.git.1644958327302.gitgitgadget@gmail.com>


* ab/commit-plug-leaks (2022-02-16) 2 commits
 - commit: use strbuf_release() instead of UNLEAK()
 - commit: fix "author_ident" leak

 Leakfixes in the top-level called-once function.

 Expecting a reroll.
 I think UNLEAK->strbuf_release() is a regression.
 source: <cover-0.2-00000000000-20220216T081844Z-avarab@gmail.com>


* ab/diff-free-more (2022-02-16) 2 commits
  (merged to 'next' on 2022-02-17 at be8ae78a2d)
 + diff.[ch]: have diff_free() free options->parseopts
 + diff.[ch]: have diff_free() call clear_pathspec(opts.pathspec)

 Leakfixes.

 Will merge to 'master'.
 source: <cover-0.2-00000000000-20220216T105250Z-avarab@gmail.com>


* pw/single-key-interactive (2022-02-23) 4 commits
 - add -p: disable stdin buffering when interactive.singlekey is set
 - terminal: set VMIN and VTIME in non-canonical mode
 - terminal: pop signal handler when terminal is restored
 - terminal: always reset terminal when reading without echo

 The single-key interactive operation used by "git add -p" has been
 made more robust.

 Will merge to 'next'?
 source: <pull.1146.v2.git.1645556015.gitgitgadget@gmail.com>


* jh/builtin-fsmonitor-part3 (2022-02-16) 25 commits
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
 - fsmonitor--daemon: print start message only if fsmonitor.announceStartup
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
 - p7519: leave 1_file directory empty
 - Merge branch 'jh/builtin-fsmonitor-part2' into jh/builtin-fsmonitor-part3
 (this branch uses jh/builtin-fsmonitor-part2.)

 More fsmonitor--daemon.
 source: <pull.1143.git.1644940773.gitgitgadget@gmail.com>


* ds/core-untracked-cache-config (2022-02-17) 1 commit
  (merged to 'next' on 2022-02-18 at 0c426fdec1)
 + dir: force untracked cache with core.untrackedCache

 Setting core.untrackedCache to true failed to add the untracked
 cache extension to the index.

 Will merge to 'master'.
 source: <pull.1058.v2.git.1645131630140.gitgitgadget@gmail.com>


* en/ort-inner-merge-conflict-report (2022-02-17) 1 commit
  (merged to 'next' on 2022-02-18 at 367dd32e74)
 + merge-ort: make informational messages from recursive merges clearer

 Messages "ort" merge backend prepares while dealing with conflicted
 paths were unnecessarily confusing since it did not differentiate
 inner merges and outer merges.

 Will merge to 'master'.
 source: <pull.1121.git.1645079923090.gitgitgadget@gmail.com>


* hn/reftable-no-empty-keys (2022-02-23) 7 commits
 - reftable: rename writer_stats to reftable_writer_stats
 - reftable: add test for length of disambiguating prefix
 - reftable: ensure that obj_id_len is >= 2 on writing
 - reftable: avoid writing empty keys at the block layer
 - reftable: add a test that verifies that writing empty keys fails
 - reftable: reject 0 object_id_len
 - Documentation: object_id_len goes up to 31

 General clean-up in reftable implementation, including
 clarification of the API documentation, tightening the code to
 honor documented length limit, etc.

 Will merge to 'next'?
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

 "git fetch" can make two separate fetches, but ref updates coming
 from them were in two separate ref transactions under "--atomic",
 which has been corrected.

 Will merge to 'master'.
 source: <cover.1645102965.git.ps@pks.im>


* rs/pcre-invalid-utf8-fix-fix (2022-02-17) 1 commit
  (merged to 'next' on 2022-02-18 at 9e47d58bda)
 + grep: fix triggering PCRE2_NO_START_OPTIMIZE workaround

 Workaround we have for versions of PCRE2 before their version 10.36
 were in effect only for their versions newer than 10.36 by mistake,
 which has been corrected.

 Will merge to 'master'.
 source: <4e391e2e-6561-3c2e-0306-c860a37356bc@web.de>


* ab/date-mode-release (2022-02-16) 5 commits
  (merged to 'next' on 2022-02-17 at 62f1cf68ae)
 + date API: add and use a date_mode_release()
 + date API: add basic API docs
 + date API: provide and use a DATE_MODE_INIT
 + date API: create a date.h, split from cache.h
 + cache.h: remove always unused show_date_human() declaration

 Plug (some) memory leaks around parse_date_format().

 Will merge to 'master'.
 source: <cover-v3-0.5-00000000000-20220216T081203Z-avarab@gmail.com>


* pw/xdiff-alloc-fail (2022-02-16) 4 commits
 - xdiff: handle allocation failure when merging
 - xdiff: refactor a function
 - xdiff: handle allocation failure in patience diff
 - xdiff: fix a memory leak

 Improve failure case behaviour of xdiff library when memory
 allocation fails.
 source: <pull.1140.v2.git.1645006510.gitgitgadget@gmail.com>


* gc/recursive-fetch-with-unused-submodules (2022-02-10) 8 commits
 - submodule: fix bug and remove add_submodule_odb()
 - fetch: fetch unpopulated, changed submodules
 - submodule: extract get_fetch_task()
 - t5526: use grep to assert on fetches
 - t5526: introduce test helper to assert on fetches
 - submodule: make static functions read submodules from commits
 - submodule: store new submodule commits oid_array in a struct
 - submodule: inline submodule_commits() into caller

 When "git fetch --recurse-submodules" grabbed submodule commits
 that would be needed to recursively check out newly fetched commits
 in the superproject, it only paid attention to submodules that are
 in the current checkout of the superproject.  We now do so for all
 submodules that have been run "git submodule init" on.

 Expecting a reroll.
 cf. <kl6lv8xc51ox.fsf@chooglen-macbookpro.roam.corp.google.com>
 source: <20220210044152.78352-1-chooglen@google.com>


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

 source: <pull.1128.v2.git.1644187146.gitgitgadget@gmail.com>


* jc/cat-file-batch-commands (2022-02-18) 4 commits
 - cat-file: add --batch-command mode
 - cat-file: add remove_timestamp helper
 - cat-file: introduce batch_mode enum to replace print_contents
 - cat-file: rename cmdmode to transform_mode

 "git cat-file" learns "--batch-command" mode, which is a more
 flexible interface than the existing "--batch" or "--batch-check"
 modes, to allow different kinds of inquiries made.

 Will merge to 'next'?
 source: <pull.1212.v10.git.git.1645208594.gitgitgadget@gmail.com>


* ar/submodule-update (2022-02-10) 20 commits
 . fixup! submodule: move core cmd_update() logic to C
 . fixup! submodule--helper run-update-procedure: learn --remote
 . fixup! submodule--helper run-update-procedure: remove --suboid
 . submodule: move core cmd_update() logic to C
 . submodule--helper: reduce logic in run_update_procedure()
 . submodule--helper: move functions around
 . submodule--helper update-clone: learn --init
 . submodule--helper: remove ensure-core-worktree
 . submodule--helper run-update-procedure: learn --remote
 . submodule--helper run-update-procedure: remove --suboid
 . submodule--helper: reorganize code for sh to C conversion
 . submodule--helper: remove update-module-mode
 . submodule tests: test for init and update failure output
 . submodule--helper: don't use bitfield indirection for parse_options()
 . builtin/submodule--helper.c: rename option variables to "opt"
 . builtin/submodule--helper.c: reformat designated initializers
 . submodule--helper: run update using child process struct
 . submodule--helper: allow setting superprefix for init_submodule()
 . submodule--helper: refactor get_submodule_displaypath()
 . submodule--helper: get remote names from any repository

 Rewrite of "git submodule update" in C.

 Does not seem to play well with other topics in flight, with heavy conflicts.
 cf. <xmqqv8xj71mt.fsf@gitster.g>
 source: <20220210092833.55360-1-chooglen@google.com>


* rj/receive-pack-abort-upon-disconnect (2022-01-28) 1 commit
 - receive-pack: check if client is alive before completing the push

 "git push" may be killed by the user when the server side has
 finished receiving all data and is about to commit the result.
 Give the latter a better chance to notice such situation and abort
 processing the ref updates.

 Needs more work?
 cf. <220204.864k5e4yvf.gmgdl@evledraar.gmail.com>
 source: <20220128194811.3396281-1-robin.jarry@6wind.com>


* ab/object-file-api-updates (2022-02-04) 11 commits
 - object-file API: pass an enum to read_object_with_reference()
 - object-file.c: add a literal version of write_object_file_prepare()
 - object-file API: have hash_object_file() take "enum object_type"
 - object API: rename hash_object_file_literally() to write_*()
 - object-file API: split up and simplify check_object_signature()
 - object API: make check_object_signature() oideq()-like, move docs
 - object API: correct "buf" v.s. "map" mismatch in *.c and *.h
 - object-file API: have write_object_file() take "enum object_type"
 - object-file API: add a format_object_header() function
 - object-file API: return "void", not "int" from hash_object_file()
 - object-file.c: split up declaration of unrelated variables

 Object-file API shuffling.
 source: <cover-v2-00.11-00000000000-20220204T135005Z-avarab@gmail.com>


* ja/i18n-common-messages (2022-02-04) 4 commits
  (merged to 'next' on 2022-02-15 at 23d56641fc)
 + i18n: fix some misformated placeholders in command synopsis
 + i18n: remove from i18n strings that do not hold translatable parts
 + i18n: factorize "invalid value" messages
 + i18n: factorize more 'incompatible options' messages

 Unify more messages to help l10n.

 Will merge to 'master'.
 source: <pull.1123.v4.git.1643666870.gitgitgadget@gmail.com>


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

 Will merge to 'next'.
 source: <pull.1122.v6.git.1645602413.gitgitgadget@gmail.com>


* js/apply-partial-clone-filters-recursively (2022-02-09) 1 commit
  (merged to 'next' on 2022-02-16 at 4b3852bd52)
 + clone, submodule: pass partial clone filters to submodules

 "git clone --filter=... --recurse-submodules" only makes the
 top-level a partial clone, while submodules are fully cloned.  This
 behaviour is changed to pass the same filter down to the submodules.

 Will merge to 'master'.
 source: <690d2316ad518ea4551821b2b3aa652996858475.1644034886.git.steadmon@google.com>


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
 - bisect--helper: double-check run command on exit code 126 and 127
 - bisect: document run behavior with exit codes 126 and 127
 - bisect--helper: release strbuf and strvec on run error
 - bisect--helper: report actual bisect_state() argument on error

 A not-so-common mistake is to write a script to feed "git bisect
 run" without making it executable, in which case all tests will
 exit with 126 or 127 error codes, even on revisions that are marked
 as good.  Try to recoginse this situation and stop iteration early.

 Will merge to 'next'?
 source: <fead25d6-6f5f-487a-ad4c-0657fe9785fd@www.fastmail.com>


* ds/sparse-checkout-requires-per-worktree-config (2022-02-08) 6 commits
  (merged to 'next' on 2022-02-15 at f86bec6da9)
 + config: make git_configset_get_string_tmp() private
 + worktree: copy sparse-checkout patterns and config on add
 + sparse-checkout: set worktree-config correctly
 + config: add repo_config_set_worktree_gently()
 + worktree: create init_worktree_config()
 + Documentation: add extensions.worktreeConfig details
 (this branch is used by ds/worktree-docs.)

 "git sparse-checkout" wants to work with per-worktree configration,
 but did not work well in a worktree attached to a bare repository.

 Will merge to 'master'.
 source: <pull.1101.v6.git.1644269583.gitgitgadget@gmail.com>


* en/present-despite-skipped (2022-02-20) 7 commits
 - Provide config option to expect files outside sparse patterns
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

 On hold.
 cf. <YhBNgUFnujFGVcRo@google.com>
 cf. <CABPp-BFEt1zxR6xoZmwmY2dtXkK+ti+g-1DHZCgeP2VpzWqqyA@mail.gmail.com>
 source: <pull.1114.v2.git.1642175983.gitgitgadget@gmail.com>


* ab/grep-patterntype (2022-02-15) 10 commits
  (merged to 'next' on 2022-02-16 at 64222759a2)
 + grep: simplify config parsing and option parsing
 + grep.c: do "if (bool && memchr())" not "if (memchr() && bool)"
 + grep.h: make "grep_opt.pattern_type_option" use its enum
 + grep API: call grep_config() after grep_init()
 + grep.c: don't pass along NULL callback value
 + built-ins: trust the "prefix" from run_builtin()
 + grep tests: add missing "grep.patternType" config tests
 + grep tests: create a helper function for "BRE" or "ERE"
 + log tests: check if grep_config() is called by "log"-like cmds
 + grep.h: remove unused "regex_t regexp" from grep_opt

 Some code clean-up in the "git grep" machinery.

 Will merge to 'master'.
 source: <cover-v11-00.10-00000000000-20220216T000006Z-avarab@gmail.com>


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


* ab/ambiguous-object-name (2022-01-27) 7 commits
  (merged to 'next' on 2022-02-15 at 6028098cfe)
 + object-name: re-use "struct strbuf" in show_ambiguous_object()
 + object-name: iterate ambiguous objects before showing header
 + object-name: show date for ambiguous tag objects
 + object-name: make ambiguous object output translatable
 + object-name: explicitly handle bad tags in show_ambiguous_object()
 + object-name: explicitly handle OBJ_BAD in show_ambiguous_object()
 + object-name tests: add tests for ambiguous object blind spots

 Error output given in response to an ambiguous object name has been
 improved.

 Will merge to 'master'.
 source: <cover-v8-0.7-00000000000-20220127T052116Z-avarab@gmail.com>


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


* jh/builtin-fsmonitor-part2 (2022-02-11) 30 commits
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
 - compat/fsmonitor/fsm-listen-darwin: add macos header files for FSEvent
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
 source: <pull.1041.v5.git.1644612979.gitgitgadget@gmail.com>


* es/superproject-aware-submodules (2022-02-03) 4 commits
 - submodule: record superproject gitdir during 'update'
 - submodule: record superproject gitdir during absorbgitdirs
 - introduce submodule.superprojectGitDir record
 - t7400-submodule-basic: modernize inspect() helper

 A configuration variable in a submodule points at the location of
 the superproject it is bound to (RFC).
 source: <20220203215914.683922-1-emilyshaffer@google.com>


* ab/only-single-progress-at-once (2022-02-03) 9 commits
  (merged to 'next' on 2022-02-15 at 97ac92e662)
 + pack-bitmap-write.c: don't return without stop_progress()
 + progress API: unify stop_progress{,_msg}(), fix trace2 bug
 + progress.c: refactor stop_progress{,_msg}() to use helpers
 + progress.c: use dereferenced "progress" variable, not "(*p_progress)"
 + progress.h: format and be consistent with progress.c naming
 + progress.c tests: test some invalid usage
 + progress.c tests: make start/stop commands on stdin
 + progress.c test helper: add missing braces
 + leak tests: fix a memory leak in "test-progress" helper

 Further tweaks on progress API.

 Will merge to 'master'.
 source: <cover-v9-0.9-00000000000-20220203T213350Z-avarab@gmail.com>
