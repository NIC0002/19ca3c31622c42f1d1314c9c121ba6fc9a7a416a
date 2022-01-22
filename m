Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670EAC433F5
	for <git@archiver.kernel.org>; Sat, 22 Jan 2022 05:16:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbiAVFQK (ORCPT <rfc822;git@archiver.kernel.org>);
        Sat, 22 Jan 2022 00:16:10 -0500
Received: from pb-smtp2.pobox.com ([64.147.108.71]:60322 "EHLO
        pb-smtp2.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbiAVFQJ (ORCPT <rfc822;git@vger.kernel.org>);
        Sat, 22 Jan 2022 00:16:09 -0500
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id 737871046F5;
        Sat, 22 Jan 2022 00:16:08 -0500 (EST)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to
        :subject:date:message-id:mime-version:content-type; s=sasl; bh=4
        rryccigpKFmFsI35w0jnyLBoEDNHriiNgS+cF/vIbI=; b=Gx/O7tX7j39UdQr8Q
        5h+4knQBJef4KlLA5AJMEZeLMYs9e+qBgfBrsWZaaahapZS+eG1Vr6BsXNsluPrD
        EP2tnf+kgo3f3ibyrXOvR3d3I7nHZ+U3ZKuGRZ+a/e03YT+CNc/xoyXFMQ9LK3/c
        /uypRwLY2z23Eb7OAZWHHtTVBY=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id 6BDD31046F4;
        Sat, 22 Jan 2022 00:16:08 -0500 (EST)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [104.133.2.91])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp2.pobox.com (Postfix) with ESMTPSA id B3B2A1046F3;
        Sat, 22 Jan 2022 00:16:07 -0500 (EST)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Jan 2022, #06; Fri, 21)
X-master-at: 297ca895a27a6bbdb7906371d533f72a12ad25b2
X-next-at: 9bf600f5edf4beea0ee980660bdc5ff523e7b5c5
Date:   Fri, 21 Jan 2022 21:16:06 -0800
Message-ID: <xmqq8rv8bbah.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID: 6794D654-7B42-11EC-9FDB-CB998F0A682E-77302942!pb-smtp2.pobox.com
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Possibly a few more last-minute fixes may want to be on 'master'
before the final:

 - ab/checkout-branch-info-leakfix is to stop "git checkout -f
   <ref>" from triggering BUG() when <ref> is a symbolic ref that
   points at a strange place.

 - en/merge-ort-restart-optim-fix is to avoid triggering assertion
   failure when merge.renameLimit is set to a value that is too low.

 - js/test-unset-trace2-parents is to help those developers who run
   "make test" inside a git that is being traced via GIT_TRACE2
   mechanism.

 - ab/auto-detect-zlib-compress2 is to automate use of replacement
   uncompress2() implementation on platforms with zlib that is too
   old.

 - pb/pull-rebase-autostash-fix is to fix the remaining case where
   "git pull --rebase" that reused the merge machinery when the
   update can be fast-forwarded did not behave well.

but we can probably do without many of them.

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

* ab/auto-detect-zlib-compress2 (2022-01-21) 1 commit
 - cache.h: auto-detect if zlib has uncompress2()

 Notice older zlib to enable our replacement uncompress2()
 automatically.

 Will merge to 'next'.
 source: <patch-v3-1.1-e9cb8763fd4-20220120T011414Z-avarab@gmail.com>


* ab/checkout-branch-info-leakfix (2022-01-21) 1 commit
 - checkout: avoid BUG() when hitting a broken repository

 We added an unrelated sanity checking that leads to a BUG() while
 plugging a leak, which triggered in a repository with symrefs in
 the local branch namespace that point at a ref outside.  Partially
 revert the change to avoid triggering the BUG().

 Will merge to 'next' and then to 'master'?
 source: <xmqqbl04d1s9.fsf_-_@gitster.g>


* en/plug-leaks-in-merge (2022-01-21) 2 commits
 - merge: fix memory leaks in cmd_merge()
 - merge-ort: fix memory leak in merge_ort_internal()

 Leakfix.

 Will merge to 'next'.
 source: <pull.1200.git.git.1642664835.gitgitgadget@gmail.com>


* js/apply-partial-clone-filters-recursively (2022-01-21) 1 commit
 - clone, submodule: pass partial clone filters to submodules

 "git clone --filter=... --recurse-submodules" only makes the
 top-level a partial clone, while submodules are fully cloned.  This
 behaviour is changed to pass the same filter down to the submodules.

 source: <50ebf7bd39adf34fa4ada27cd433d81b5381abe5.1642735881.git.steadmon@google.com>


* js/sparse-vs-split-index (2022-01-21) 3 commits
 - split-index: it really is incompatible with the sparse index
 - t1091: disable split index
 - sparse-index: sparse index is disallowed when split index is active

 Mark in various places in the code that the sparse index and the
 split index features are mutually incompatible.

 source: <pull.1119.git.1642613379.gitgitgadget@gmail.com>


* js/test-unset-trace2-parents (2022-01-20) 1 commit
  (merged to 'next' on 2022-01-20 at ebb085e3e4)
 + test-lib: unset trace2 parent envvars

 Avoid tests that are run under GIT_TRACE2 set from failing
 unnecessarily.

 Will cook in 'next'.
 source: <82e51a52e20fbe13a5a898a0a2f6dbe1188e3fa3.1642116539.git.steadmon@google.com>


* jt/sparse-checkout-leading-dir-fix (2022-01-21) 1 commit
 - sparse-checkout: create leading directory

 "git sparse-checkout init" failed to write into $GIT_DIR/info
 directory when the repository was created without one, which has
 been corrected to auto-create it.

 Will merge to 'next'.
 source: <20220121174441.3991963-1-jonathantanmy@google.com>


* rs/parse-options-lithelp-help (2022-01-20) 1 commit
 - parse-options: document bracketing of argh

 Comment update.

 source: <c6ab4408-1091-4d14-849e-afe5f3053e8b@web.de>

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


* ar/submodule-update (2021-10-13) 9 commits
 . submodule--helper: rename helper functions
 . submodule--helper: remove unused helpers
 . submodule: move core cmd_update() logic to C
 . submodule--helper: run update using child process struct
 . submodule--helper: allow setting superprefix for init_submodule()
 . submodule--helper: refactor get_submodule_displaypath()
 . submodule--helper: rename helpers for update-clone
 . submodule--helper: get remote names from any repository
 . submodule--helper: split up ensure_core_worktree()

 Rewrite of "git submodule update" in C.

 Expecting a reroll?
 cf. <YWiXL+plA7GHfuVv@google.com>
 source: <20211013051805.45662-10-raykar.ath@gmail.com>

--------------------------------------------------
[Cooking]

* en/merge-ort-restart-optim-fix (2022-01-17) 1 commit
  (merged to 'next' on 2022-01-19 at 84da10b057)
 + merge-ort: avoid assuming all renames detected

 The merge-ort misbehaved when merge.renameLimit configuration is
 set too low and failed to find all renames.

 Will cook in 'next'.
 source: <pull.1194.v2.git.git.1642443955836.gitgitgadget@gmail.com>


* jh/p4-various-fixups (2022-01-16) 23 commits
 . git-p4: seperate multiple statements onto seperate lines
 . git-p4: move inline comments to line above
 . git-p4: only seperate code blocks by a single empty line
 . git-p4: compare to singletons with "is" and "is not"
 . git-p4: normalize indentation of lines in conditionals
 . git-p4: ensure there is a single space around all operators
 . git-p4: ensure every comment has a single #
 . git-p4: remove spaces between dictionary keys and colons
 . git-p4: remove redundant backslash-continuations inside brackets
 . git-p4: remove extraneous spaces before function arguments
 . git-p4: place a single space after every comma
 . git-p4: removed brackets when assigning multiple return values
 . git-p4: remove spaces around default arguments
 . git-p4: remove padding from lists, tuples and function arguments
 . git-p4: sort and de-duplcate pylint disable list
 . git-p4: remove commented code
 . git-p4: convert descriptive class and function comments into docstrings
 . git-p4: improve consistency of docstring formatting
 . git-p4: indent with 4-spaces
 . git-p4: remove unneeded semicolons from statements
 . git-p4: add blank lines between functions and class definitions
 . Merge branch 'jh/p4-spawning-external-commands-cleanup' into jh/p4-various-fixups
 . Merge branch 'jh/p4-fix-use-of-process-error-exception' into jh/p4-various-fixups
 (this branch uses jh/p4-fix-use-of-process-error-exception and jh/p4-spawning-external-commands-cleanup.)

 Various cleanups to "git p4".

 Breaks its own test suite.
 source: <20220116160550.514637-1-jholdsworth@nvidia.com>


* po/readme-mention-contributor-hints (2022-01-17) 1 commit
  (merged to 'next' on 2022-01-19 at 7e14690eb9)
 + README.md: add CodingGuidelines and a link for Translators

 Doc update.

 Will cook in 'next'.
 source: <pull.1115.v3.git.1642443491609.gitgitgadget@gmail.com>


* tl/doc-cli-options-first (2022-01-17) 1 commit
  (merged to 'next' on 2022-01-19 at 9ec14cfe73)
 + git-cli.txt: clarify "options first and then args"

 We explain that revs come first before the pathspec among command
 line arguments, but did not spell out that dashed options come
 before other args, which has been corrected.

 Will cook in 'next'.
 source: <fe748304d94e0ae25fd3549aadc49cf951ff2d64.1642405806.git.dyroneteng@gmail.com>


* rs/bisect-executable-not-found (2022-01-19) 4 commits
 - bisect--helper: double-check run command on exit code 126 and 127
 - bisect: document run behavior with exit codes 126 and 127
 - bisect--helper: release strbuf and strvec on run error
 - bisect--helper: report actual bisect_state() argument on error

 source: <fead25d6-6f5f-487a-ad4c-0657fe9785fd@www.fastmail.com>


* ds/sparse-checkout-requires-per-worktree-config (2022-01-14) 6 commits
 . worktree: copy sparse-checkout patterns and config on add
 . sparse-checkout: use repo_config_set_worktree_gently()
 . config: add repo_config_set_worktree_gently()
 . worktree: add 'init-worktree-config' subcommand
 . config: make some helpers repo-aware
 . setup: use a repository when upgrading format

 "git sparse-checkout" wants to work with per-worktree configration,
 but did not work well in a worktree attached to a bare repository.

 Expecting an update.
 cf. <1db0f601-4769-15c0-cd58-ecddfa1fc9d5@gmail.com>
 Introduces new leaks.
 cf. https://github.com/git/git/runs/4823667255?check_suite_focus=true
 source: <pull.1101.v3.git.1640727143.gitgitgadget@gmail.com>


* pw/add-p-hunk-split-fix (2022-01-12) 2 commits
  (merged to 'next' on 2022-01-19 at ea57b2c9a6)
 + builtin add -p: fix hunk splitting
 + t3701: clean up hunk splitting tests

 "git add -p" rewritten in C regressed hunk splitting in some cases,
 which has been corrected.

 Will cook in 'next'.
 source: <pull.1100.v2.git.1641899530.gitgitgadget@gmail.com>


* gc/fetch-negotiate-only-early-return (2022-01-20) 4 commits
  (merged to 'next' on 2022-01-20 at e7616428eb)
 + fetch: help translators by reusing the same message template
  (merged to 'next' on 2022-01-19 at 0f15147cfa)
 + fetch --negotiate-only: do not update submodules
 + fetch: skip tasks related to fetching objects
 + fetch: use goto cleanup in cmd_fetch()

 "git fetch --negotiate-only" is an internal command used by "git
 push" to figure out which part of our history is missing from the
 other side.  It should never recurse into submodules even when
 fetch.recursesubmodules configuration variable is set, nor it
 should trigger "gc".  The code has been tightened up to ensure it
 only does common ancestry discovery and nothing else.

 Will cook in 'next'.
 source: <20220119000056.58503-1-chooglen@google.com>


* jh/p4-fix-use-of-process-error-exception (2022-01-06) 1 commit
  (merged to 'next' on 2022-01-10 at 49d529bfd7)
 + git-p4: fix instantiation of CalledProcessError
 (this branch is used by jh/p4-various-fixups.)

 Will cook in 'next'.
 source: <20220106214156.90967-1-jholdsworth@nvidia.com>


* jh/p4-spawning-external-commands-cleanup (2022-01-06) 3 commits
  (merged to 'next' on 2022-01-10 at 54b36b4e66)
 + git-p4: don't print shell commands as python lists
 + git-p4: pass command arguments as lists instead of using shell
 + git-p4: don't select shell mode using the type of the command argument
 (this branch is used by jh/p4-various-fixups.)

 Will cook in 'next'.
 source: <20220106214035.90725-1-jholdsworth@nvidia.com>


* pb/pull-rebase-autostash-fix (2022-01-14) 1 commit
  (merged to 'next' on 2022-01-14 at 83a388a7e2)
 + pull --rebase: honor rebase.autostash when fast-forwarding

 "git pull --rebase" ignored the rebase.autostash configuration
 variable when the remote history is a descendant of our history,
 which has been corrected.

 Will cook in 'next'.
 source: <xmqqr19aayxp.fsf@gitster.g>


* rs/grep-expr-cleanup (2022-01-06) 4 commits
  (merged to 'next' on 2022-01-10 at b70a3bb0fa)
 + grep: use grep_and_expr() in compile_pattern_and()
 + grep: extract grep_binexp() from grep_or_expr()
 + grep: use grep_not_expr() in compile_pattern_not()
 + grep: use grep_or_expr() in compile_pattern_or()

 Code clean-up.

 Will cook in 'next'.
 source: <cover.1641498525.git.me@ttaylorr.com>


* fs/ssh-signing-crlf (2022-01-07) 1 commit
  (merged to 'next' on 2022-01-19 at 76b86faafb)
 + gpg-interface: trim CR from ssh-keygen

 The code path that verifies signatures made with ssh were made to
 work better on a system with CRLF line endings.

 Will cook in 'next'.
 source: <20220107090735.580225-1-fs@gigacodes.de>


* jc/qsort-s-alignment-fix (2022-01-07) 2 commits
  (merged to 'next' on 2022-01-10 at 329fd6e09a)
 + stable-qsort: avoid using potentially unaligned access
 + compat/qsort_s.c: avoid using potentially unaligned access

 Fix a hand-rolled alloca() imitation that may have violated
 alignment requirement of data being sorted in compatibility
 implementation of qsort_s() and stable qsort().

 Will cook in 'next'.
 source: <f40c1b47-9aad-2dcc-ceeb-5dee2b517cd8@web.de>
 source: <xmqqzgo76xpj.fsf@gitster.g>


* ps/avoid-unnecessary-hook-invocation-with-packed-refs (2022-01-17) 6 commits
 - refs: skip hooks when deleting uncovered packed refs
 - refs: do not execute reference-transaction hook on packing refs
 - refs: demonstrate excessive execution of the reference-transaction hook
 - refs: allow skipping the reference-transaction hook
 - refs: allow passing flags when beginning transactions
 - refs: extract packed_refs_delete_refs() to allow control of transaction

 Because a deletion of ref would need to remove it from both the
 loose ref store and the packed ref store, a delete-ref operation
 that logically removes one ref may end up invoking ref-transaction
 hook twice, which has been corrected.

 Introduces new leaks when merged to 'seen'.
 source: <cover.1642406989.git.ps@pks.im>


* rs/apply-symlinks-use-strset (2022-01-07) 1 commit
  (merged to 'next' on 2022-01-10 at 32497a67d5)
 + apply: use strsets to track symlinks

 "git apply" (ab)used the util pointer of the string-list to keep
 track of how each symbolic link needs to be handled, which has been
 simplified by using strset.

 Will cook in 'next'.
 source: <8739caad-aa3d-1f0f-b5dd-6174a8e059f6@web.de>


* ld/sparse-index-bash-completion (2022-01-10) 3 commits
 - sparse-checkout: limit tab completion to a single level
 - sparse-checkout: custom tab completion
 - sparse-checkout: custom tab completion tests

 The command line completion (in contrib/) learns to complete
 arguments give to "git sparse-checkout" command.
 source: <pull.1108.v3.git.1641841193.gitgitgadget@gmail.com>


* bc/clarify-eol-attr (2022-01-12) 2 commits
 - docs: correct documentation about eol attribute
 - t0027: add tests for eol without text in .gitattributes

 Doc and test update around the eol attribute.
 source: <20220111021507.531736-1-sandals@crustytoothpaste.net>


* jz/rev-list-exclude-first-parent-only (2022-01-12) 1 commit
 - git-rev-list: add --exclude-first-parent-only flag

 "git log" and friends learned an option --exclude-first-parent-only
 to propagate UNINTERESTING bit down only along the first-parent
 chain, just like --first-parent option shows commits that lack the
 UNINTERESTING bit only along the first-parent chain.
 source: <20220111213941.30129-1-jerry@skydio.com>


* en/present-despite-skipped (2022-01-14) 6 commits
 - Accelerate clear_skip_worktree_from_present_files() by caching
 - Update documentation related to sparsity and the skip-worktree bit
 - repo_read_index: clear SKIP_WORKTREE bit from files present in worktree
 - unpack-trees: fix accidental loss of user changes
 - t1011: add testcase demonstrating accidental loss of user modifications
 - Merge branch 'vd/sparse-clean-etc' into en/present-despite-skipped
 (this branch uses vd/sparse-clean-etc.)

 In sparse-checkouts, files mis-marked as missing from the working tree
 could lead to later problems.  Such files were hard to discover, and
 harder to correct.  Automatically detecting and correcting the marking
 of such files has been added to avoid these problems.
 source: <pull.1114.v2.git.1642175983.gitgitgadget@gmail.com>


* bc/csprng-mktemps (2022-01-17) 2 commits
 - wrapper: use a CSPRNG to generate random file names
 - wrapper: add a helper to generate numbers from a CSPRNG

 Pick a better random number generator and use it when we prepare
 temporary filenames.

 Are we solving the right problem?
 cf. <220118.86zgntpegy.gmgdl@evledraar.gmail.com>
 source: <20220117215617.843190-1-sandals@crustytoothpaste.net>


* jc/reflog-parse-options (2022-01-10) 2 commits
  (merged to 'next' on 2022-01-12 at 1659e49c4b)
 + builtin/reflog.c: use parse-options api for expire, delete subcommands
 + Merge branch 'ab/reflog-prep' into jc/reflog-parse-options

 Use the parse-options API in "git reflog" command.

 Will cook in 'next'.
 source: <pull.1175.v5.git.git.1641495981650.gitgitgadget@gmail.com>


* vd/sparse-clean-etc (2022-01-13) 9 commits
 - update-index: reduce scope of index expansion in do_reupdate
 - update-index: integrate with sparse index
 - update-index: add tests for sparse-checkout compatibility
 - checkout-index: integrate with sparse index
 - checkout-index: add --ignore-skip-worktree-bits option
 - checkout-index: expand sparse checkout compatibility tests
 - clean: integrate with sparse index
 - reset: reorder wildcard pathspec conditions
 - reset: fix validation in sparse index test
 (this branch is used by en/present-despite-skipped.)

 "git update-index", "git checkout-index", and "git clean" are
 taught to work better with the sparse checkout feature.
 source: <pull.1109.v2.git.1641924306.gitgitgadget@gmail.com>


* ms/update-index-racy (2022-01-07) 4 commits
  (merged to 'next' on 2022-01-14 at 705a33f63b)
 + update-index: refresh should rewrite index in case of racy timestamps
 + t7508: add tests capturing racy timestamp handling
 + t7508: fix bogus mtime verification
 + test-lib: introduce API for verifying file mtime

 "git update-index --refresh" has been taught to deal better with
 racy timestamps (just like "git status" already does).

 Will cook in 'next'.
 source: <pull.1105.v4.git.1641554252.gitgitgadget@gmail.com>


* jc/find-header (2022-01-06) 1 commit
  (merged to 'next' on 2022-01-10 at 8a13b4f0b3)
 + receive-pack.c: consolidate find header logic

 Code clean-up.

 Will cook in 'next'.
 source: <pull.1125.v6.git.git.1641499655700.gitgitgadget@gmail.com>


* jc/name-rev-stdin (2022-01-10) 2 commits
  (merged to 'next' on 2022-01-19 at a58e05fabe)
 + name-rev.c: use strbuf_getline instead of limited size buffer
 + name-rev: deprecate --stdin in favor of --annotate-stdin

 "git name-rev --stdin" does not behave like usual "--stdin" at
 all.  Start the process of renaming it to "--annotate-stdin".

 Will cook in 'next'.
 source: <pull.1171.v7.git.git.1641425372.gitgitgadget@gmail.com>


* en/remerge-diff (2022-01-21) 11 commits
 - diff-merges: avoid history simplifications when diffing merges
 - merge-ort: mark conflict/warning messages from inner merges as omittable
 - show, log: include conflict/warning messages in --remerge-diff headers
 - diff: add ability to insert additional headers for paths
 - merge-ort: format messages slightly different for use in headers
 - merge-ort: mark a few more conflict messages as omittable
 - merge-ort: capture and print ll-merge warnings in our preferred fashion
 - ll-merge: make callers responsible for showing warnings
 - log: clean unneeded objects during `log --remerge-diff`
 - show, log: provide a --remerge-diff capability
 - Merge branch 'ns/tmp-objdir' into en/remerge-diff

 "git log --remerge-diff" shows the difference from mechanical merge
 result and the merge result that is actually recorded.

 Will merge to 'next'?
 source: <pull.1103.v4.git.1642792341.gitgitgadget@gmail.com>


* bs/forbid-i18n-of-protocol-token-in-fetch-pack (2021-12-22) 2 commits
 - fixup! fetch-pack: parameterize message containing 'ready' keyword
 - fetch-pack: parameterize message containing 'ready' keyword

 L10n support for a few error messages.

 Expecting an ack for fixup.
 source: <20211222075805.19027-1-bagasdotme@gmail.com>


* gc/branch-recurse-submodules (2022-01-10) 6 commits
 - branch: add --recurse-submodules option for branch creation
 - builtin/branch: clean up action-picking logic in cmd_branch()
 - branch: add a dry_run parameter to create_branch()
 - branch: make create_branch() always create a branch
 - branch: move --set-upstream-to behavior to dwim_and_setup_tracking()
 - Merge branch 'js/branch-track-inherit' into gc/branch-recurse-submodules

 "git branch" learned the "--recurse-submodules" option.

 Expecting a reroll.
 cf. <kl6l7db6kvp2.fsf@chooglen-macbookpro.roam.corp.google.com>
 source: <20211220233459.45739-1-chooglen@google.com>


* hn/reftable-coverity-fixes (2022-01-20) 17 commits
 - reftable: add print functions to the record types
 - reftable: make reftable_record a tagged union
 - reftable: remove outdated file reftable.c
 - reftable: implement record equality generically
 - reftable: make reftable-record.h function signatures const correct
 - reftable: handle null refnames in reftable_ref_record_equal
 - reftable: drop stray printf in readwrite_test
 - reftable: order unittests by complexity
 - reftable: all xxx_free() functions accept NULL arguments
 - reftable: fix resource warning
 - reftable: ignore remove() return value in stack_test.c
 - reftable: check reftable_stack_auto_compact() return value
 - reftable: fix resource leak blocksource.c
 - reftable: fix resource leak in block.c error path
 - reftable: fix OOB stack write in print functions
 - Merge branch 'hn/create-reflog-simplify' into hn/reftable-coverity-fixes
 - Merge branch 'hn/reftable' into hn/reftable-coverity-fixes

 Problems identified by Coverity in the reftable code have been
 corrected.

 Will merge to 'next'.
 source: <pull.1152.v6.git.git.1642691534.gitgitgadget@gmail.com>


* tb/midx-bitmap-corruption-fix (2022-01-04) 9 commits
 - pack-bitmap.c: gracefully fallback after opening pack/MIDX
 - midx: read `RIDX` chunk when present
 - t/lib-bitmap.sh: parameterize tests over reverse index source
 - t5326: move tests to t/lib-bitmap.sh
 - t5326: extract `test_rev_exists`
 - t5326: drop unnecessary setup
 - pack-revindex.c: instrument loading on-disk reverse index
 - midx.c: make changing the preferred pack safe
 - t5326: demonstrate bitmap corruption after permutation

 A bug that made multi-pack bitmap and the object order out-of-sync
 (hence the .midx data gets corrupted) has been fixed.

 Waiting for a hopefully final review.
 cf. <Ydceeo33Yt4N%2FbrN@nand.local>
 source: <cover.1641320129.git.me@ttaylorr.com>


* pw/fix-some-issues-in-reset-head (2021-12-08) 14 commits
 - rebase -m: don't fork git checkout
 - rebase --apply: set ORIG_HEAD correctly
 - rebase --apply: fix reflog
 - reset_head(): take struct rebase_head_opts
 - rebase: cleanup reset_head() calls
 - reset_head(): make default_reflog_action optional
 - reset_head(): factor out ref updates
 - create_autostash(): remove unneeded parameter
 - reset_head(): remove action parameter
 - rebase --apply: don't run post-checkout hook if there is an error
 - rebase: do not remove untracked files on checkout
 - rebase: pass correct arguments to post-checkout hook
 - t5403: refactor rebase post-checkout hook tests
 - rebase: factor out checkout for up to date branch

 Fix "some issues" in a helper function reset_head().

 Expecting a reroll.
 cf. <xmqqk0gdskkh.fsf@gitster.g>
 cf. <xmqqwnkdr3xb.fsf@gitster.g>
 cf. <xmqqpmq5r3j9.fsf@gitster.g>
 cf. <xmqqczm5r34h.fsf@gitster.g>
 cf. <CABPp-BEHW4VLG18twcM_8iOco1jZ2iuGT+KN8aS+-sAAnBhTnw@mail.gmail.com>
 source: <pull.1049.v2.git.1638975481.gitgitgadget@gmail.com>


* ab/cat-file (2022-01-12) 12 commits
  (merged to 'next' on 2022-01-12 at ee4d43041d)
 + cat-file: s/_/-/ in typo'd usage_msg_optf() message
 + cat-file: don't whitespace-pad "(...)" in SYNOPSIS and usage output
  (merged to 'next' on 2022-01-05 at e145efa605)
 + cat-file: use GET_OID_ONLY_TO_DIE in --(textconv|filters)
 + object-name.c: don't have GET_OID_ONLY_TO_DIE imply *_QUIETLY
 + cat-file: correct and improve usage information
 + cat-file: fix remaining usage bugs
 + cat-file: make --batch-all-objects a CMDMODE
 + cat-file: move "usage" variable to cmd_cat_file()
 + cat-file docs: fix SYNOPSIS and "-h" output
 + parse-options API: add a usage_msg_optf()
 + cat-file tests: test messaging on bad objects/paths
 + cat-file tests: test bad usage

 Assorted updates to "git cat-file", especially "-h".

 Will cook in 'next'.
 source: <cover-v6-00.10-00000000000-20211228T132637Z-avarab@gmail.com>
 source: <cover-0.2-00000000000-20220110T220553Z-avarab@gmail.com>


* ab/grep-patterntype (2022-01-18) 10 commits
 - grep.[ch]: remove GREP_PATTERN_TYPE_UNSPECIFIED
 - grep: simplify config parsing and option parsing
 - grep.c: do "if (bool && memchr())" not "if (memchr() && bool)"
 - grep.h: make "grep_opt.pattern_type_option" use its enum
 - grep API: call grep_config() after grep_init()
 - grep.c: don't pass along NULL callback value
 - built-ins: trust the "prefix" from run_builtin()
 - grep tests: add missing "grep.patternType" config tests
 - log tests: check if grep_config() is called by "log"-like cmds
 - grep.h: remove unused "regex_t regexp" from grep_opt

 Some code clean-up in the "git grep" machinery.

 Looking good, except for the last two steps.
 source: <cover-v8-00.10-00000000000-20220118T155211Z-avarab@gmail.com>


* js/use-builtin-add-i (2021-12-01) 2 commits
 - add -i: default to the built-in implementation
 - t2016: require the PERL prereq only when necessary

 "git add -i" was rewritten in C some time ago and has been in
 testing; the reimplementation is now exposed to general public by
 default.

 On hold.
 There are known breakages on macOS.
 cf. <nycvar.QRO.7.76.6.2112021832060.63@tvgsbejvaqbjf.bet>
 source: <pull.1087.git.1638281655.gitgitgadget@gmail.com>


* jt/conditional-config-on-remote-url (2022-01-18) 2 commits
  (merged to 'next' on 2022-01-19 at 3c2df266eb)
 + config: include file if remote URL matches a glob
 + config: make git_config_include() static

 The conditional inclusion mechanism of configuration files using
 "[includeIf <condition>]" learns to base its decision on the
 URL of the remote repository the repository interacts with.

 Will cook in 'next'.
 source: <cover.1642527965.git.jonathantanmy@google.com>


* ab/ambiguous-object-name (2022-01-13) 6 commits
 - object-name: re-use "struct strbuf" in show_ambiguous_object()
 - object-name: iterate ambiguous objects before showing header
 - object-name: show date for ambiguous tag objects
 - object-name: make ambiguous object output translatable
 - object-name: explicitly handle OBJ_BAD in show_ambiguous_object()
 - object-name tests: add tests for ambiguous object blind spots

 Error output given in response to an ambiguous object name has been
 improved.
 source: <cover-v7-0.6-00000000000-20220111T130811Z-avarab@gmail.com>


* tl/ls-tree-oid-only (2022-01-13) 9 commits
 - ls-tree.c: introduce "--format" option
 - cocci: allow padding with `strbuf_addf()`
 - ls-tree.c: introduce struct "show_tree_data"
 - ls-tree.c: support --object-only option for "git-ls-tree"
 - ls-tree: optimize naming and handling of "return" in show_tree()
 - ls-tree: use "size_t", not "int" for "struct strbuf"'s "len"
 - ls-tree: use "enum object_type", not {blob,tree,commit}_type
 - ls-tree: add missing braces to "else" arms
 - ls-tree: remove commented-out code

 "git ls-tree" learns "--oid-only" option, similar to "--name-only",
 and more generalized "--format" option.
 source: <cover.1641978175.git.dyroneteng@gmail.com>


* ab/config-based-hooks-2 (2022-01-07) 17 commits
  (merged to 'next' on 2022-01-19 at 594b6da22c)
 + run-command: remove old run_hook_{le,ve}() hook API
 + receive-pack: convert push-to-checkout hook to hook.h
 + read-cache: convert post-index-change to use hook.h
 + commit: convert {pre-commit,prepare-commit-msg} hook to hook.h
 + git-p4: use 'git hook' to run hooks
 + send-email: use 'git hook run' for 'sendemail-validate'
 + git hook run: add an --ignore-missing flag
 + hooks: convert worktree 'post-checkout' hook to hook library
 + hooks: convert non-worktree 'post-checkout' hook to hook library
 + merge: convert post-merge to use hook.h
 + am: convert applypatch-msg to use hook.h
 + rebase: convert pre-rebase to use hook.h
 + hook API: add a run_hooks_l() wrapper
 + am: convert {pre,post}-applypatch to use hook.h
 + gc: use hook library for pre-auto-gc hook
 + hook API: add a run_hooks() wrapper
 + hook: add 'run' subcommand

 More "config-based hooks".

 Will cook in 'next'.
 source: <cover-v6-00.17-00000000000-20211222T035755Z-avarab@gmail.com>


* jh/builtin-fsmonitor-part2 (2021-12-25) 31 commits
 - fixup! t7527: create test for fsmonitor--daemon
 - fixup! t/perf/p7519: speed up test on Windows
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
 - fsmonitor: enhance existing comments

 Built-in fsmonitor (part 2).

 Expecting a reroll.
 Seems that the discussion stalled.
 cf. <d9c3ef61-768c-3560-2858-3438c355a742@jeffhostetler.com>
 source: <pull.1041.v4.git.1634826309.gitgitgadget@gmail.com>


* es/superproject-aware-submodules (2021-11-18) 5 commits
 - submodule: use config to find superproject worktree
 - submodule: record superproject gitdir during 'update'
 - submodule: record superproject gitdir during absorbgitdirs
 - introduce submodule.superprojectGitDir record
 - t7400-submodule-basic: modernize inspect() helper

 A configuration variable in a submodule points at the location of
 the superproject it is bound to (RFC).

 Expecting a reroll.
 cf. <20211117234300.2598132-1-jonathantanmy@google.com>
 source: <20211117005701.371808-1-emilyshaffer@google.com>


* ab/only-single-progress-at-once (2022-01-07) 7 commits
 - *.c: use isatty(0|2), not isatty(STDIN_FILENO|STDERR_FILENO)
 - pack-bitmap-write.c: don't return without stop_progress()
 - progress.c: add temporary variable from progress struct
 - progress.c tests: test some invalid usage
 - progress.c tests: make start/stop commands on stdin
 - progress.c test helper: add missing braces
 - leak tests: fix a memory leak in "test-progress" helper

 Further tweaks on progress API.

 Getting there.
 source: <cover-v8-0.7-00000000000-20211228T150728Z-avarab@gmail.com>
