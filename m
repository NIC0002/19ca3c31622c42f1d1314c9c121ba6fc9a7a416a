Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA40C433EF
	for <git@archiver.kernel.org>; Fri, 14 Jan 2022 00:49:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238549AbiANAtD (ORCPT <rfc822;git@archiver.kernel.org>);
        Thu, 13 Jan 2022 19:49:03 -0500
Received: from pb-smtp1.pobox.com ([64.147.108.70]:52227 "EHLO
        pb-smtp1.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238527AbiANAtC (ORCPT <rfc822;git@vger.kernel.org>);
        Thu, 13 Jan 2022 19:49:02 -0500
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id A24F310A7FA;
        Thu, 13 Jan 2022 19:49:01 -0500 (EST)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to
        :subject:date:message-id:mime-version:content-type; s=sasl; bh=C
        IQALl/ICu5PilGfBY5b4BFSF6U2KD3gteU4rSFC+xw=; b=rvMQD6F1+/M58a+zq
        Iqc7b5AsfjoZoDXTQEPNNykUxSfZYO3bVq1r+RHBqqjvYzEAqmzkhgTqqX0VexIG
        6Eb9PrZlVHe4GJHJYF5VdgXbiRC6XBpLYH+sZ1acsMHy9IBE/l7HcSnshOX5dzDa
        OBYxMNqIkjpi+UAdeGRxLkTacQ=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id 7828810A7F9;
        Thu, 13 Jan 2022 19:49:01 -0500 (EST)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [104.133.2.91])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 552B810A7F6;
        Thu, 13 Jan 2022 19:49:00 -0500 (EST)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Jan 2022, #03; Thu, 13)
X-master-at: 1ffcbaa1a5f10c9f706314d77f88de20a4a498c2
X-next-at: 00780c9af44409a68481c82f63a97bd18bb2593e
Date:   Thu, 13 Jan 2022 16:48:59 -0800
Message-ID: <xmqq35lrf8g4.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID: C336471A-74D3-11EC-9E64-5E84C8D8090B-77302942!pb-smtp1.pobox.com
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

There are a few "oops, what we merged recently is broken" topics
that still are not in 'master', but otherwise what we have should
be pretty much what we'll have in the final one.

 - I am reasonably happy with ab/refs-errno-cleanup (just one patch)
   that fixes the incorrect state of the code left by the earlier
   parts of the topic that have already been merged during this
   cycle.

 - I am also OK with ab/reftable-build-fixes (two patches), one for
   general type correctness fix, the other for helping older sub-C99
   compilers.

If there are fixes for regressions that we introduced during this
cycle other than these two topics, I certainly am missing them, so
please holler loudly and quickly, hopefully in time for me to tag
the -rc1 tomorrow.

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

* ab/do-not-limit-stash-help-to-push (2021-12-16) 1 commit
  (merged to 'next' on 2022-01-03 at adfc0c1f17)
 + stash: don't show "git stash push" usage on bad "git stash" usage

 "git stash" by default triggers its "push" action, but its
 implementation also made "git stash -h" to show short help only for
 "git stash push", which has been corrected.
 source: <patch-v3-1.1-6b33b104c84-20211216T125317Z-avarab@gmail.com>


* ab/makefile-hook-list-dependency-fix (2021-12-25) 1 commit
  (merged to 'next' on 2022-01-03 at 8c8ca0cbce)
 + Makefile: correct the dependency graph of hook-list.h

 Fix dependency rules to generate hook-list.h header file.
 source: <patch-1.1-1fafa6c643b-20211217T001137Z-avarab@gmail.com>


* ab/makefile-msgfmt-wo-stats (2021-12-25) 1 commit
  (merged to 'next' on 2022-01-03 at 2e2097c310)
 + Makefile: don't invoke msgfmt with --statistics

 Make the recipe that runs msgfmt less noisy.
 source: <patch-1.1-58408f384e7-20211217T000729Z-avarab@gmail.com>


* ab/makefile-pager-env-is-used-only-by-pager.c (2021-12-25) 1 commit
  (merged to 'next' on 2022-01-03 at 7ab1e1c5c4)
 + Makefile: move -DPAGER_ENV from BASIC_CFLAGS to EXTRA_CPPFLAGS

 source: <patch-1.1-90d1e77ad5e-20211217T001628Z-avarab@gmail.com>


* ab/reflog-prep (2021-12-22) 9 commits
  (merged to 'next' on 2022-01-03 at 07d2d78d86)
 + reflog + refs-backend: move "verbose" out of the backend
 + refs files-backend: assume cb->newlog if !EXPIRE_REFLOGS_DRY_RUN
 + reflog: reduce scope of "struct rev_info"
 + reflog expire: don't use lookup_commit_reference_gently()
 + reflog expire: refactor & use "tip_commit" only for UE_NORMAL
 + reflog expire: use "switch" over enum values
 + reflog: change one->many worktree->refnames to use a string_list
 + reflog expire: narrow scope of "cb" in cmd_reflog_expire()
 + reflog delete: narrow scope of "cmd" passed to count_reflog_ent()
 (this branch is used by jc/reflog-parse-options.)

 Code refactoring in the reflog part of refs API.
 source: <cover-v3-0.9-00000000000-20211222T040557Z-avarab@gmail.com>


* ab/usage-die-message (2021-12-07) 6 commits
  (merged to 'next' on 2022-01-03 at 0ef3860099)
 + config API: use get_error_routine(), not vreportf()
 + usage.c + gc: add and use a die_message_errno()
 + gc: return from cmd_gc(), don't call exit()
 + usage.c API users: use die_message() for error() + exit 128
 + usage.c API users: use die_message() for "fatal :" + exit 128
 + usage.c: add a die_message() routine

 Code clean-up to hide vreportf() from public API.
 source: <cover-v2-0.6-00000000000-20211207T182419Z-avarab@gmail.com>


* ak/protect-any-current-branch (2022-01-12) 1 commit
  (merged to 'next' on 2022-01-12 at 5ad87959d2)
 + branch: missing space fix at line 313

 source: <20220111123627.58625-1-bagasdotme@gmail.com>


* ds/fetch-pull-with-sparse-index (2021-12-22) 5 commits
  (merged to 'next' on 2022-01-03 at f58da4a878)
 + test-read-cache: remove --table, --expand options
 + t1091/t3705: remove 'test-tool read-cache --table'
 + t1092: replace 'read-cache --table' with 'ls-files --sparse'
 + ls-files: add --sparse option
 + fetch/pull: use the sparse index

 "git fetch" and "git pull" are now declared sparse-index clean.
 Also "git ls-files" learns the "--sparse" option to help debugging.
 source: <pull.1080.v4.git.1640182856.gitgitgadget@gmail.com>


* ds/sparse-checkout-malformed-pattern-fix (2021-12-30) 3 commits
  (merged to 'next' on 2021-12-30 at c8b2ade48c)
 + sparse-checkout: refuse to add to bad patterns
 + sparse-checkout: fix OOM error with mixed patterns
 + sparse-checkout: fix segfault on malformed patterns

 Certain sparse-checkout patterns that are valid in non-cone mode
 led to segfault in cone mode, which has been corrected.
 source: <pull.1069.v4.git.1639671222.gitgitgadget@gmail.com>


* en/merge-ort-renorm-with-rename-delete-conflict-fix (2021-12-30) 1 commit
  (merged to 'next' on 2022-01-05 at bb81dd432d)
 + merge-ort: fix bug with renormalization and rename/delete conflicts

 A corner case bug in the ort merge strategy has been corrected.
 source: <pull.1174.git.git.1640650846612.gitgitgadget@gmail.com>


* en/stash-df-fix (2022-01-04) 1 commit
  (merged to 'next' on 2022-01-06 at 22d0c6ccf7)
 + stash: do not return before restoring untracked files

 "git stash apply" forgot to attempt restoring untracked files when
 it failed to restore changes to tracked ones.
 source: <pull.1180.git.git.1641337498996.gitgitgadget@gmail.com>


* fs/gpg-unknown-key-test-fix (2022-01-12) 1 commit
  (merged to 'next' on 2022-01-12 at 80d3416168)
 + t/gpg: simplify test for unknown key

 Test simplification.
 source: <20220112120757.874714-1-fs@gigacodes.de>


* fs/ssh-signing-key-lifetime (2022-01-10) 1 commit
  (merged to 'next' on 2022-01-12 at 8541f3399c)
 + fmt-merge-msg: prevent use-after-free with signed tags

 "git merge $signed_tag" started to drop the tag message from the
 default merge message it uses by accident, which has been corrected.
 source: <6e08b73d602853b3de71257117e85e32b96b5c19.1641849502.git.me@ttaylorr.com>


* hn/ref-api-tests-update (2021-12-22) 4 commits
  (merged to 'next' on 2022-01-03 at 6815d4d8c1)
 + t7004: use "test-tool ref-store" for reflog inspection
 + t7004: create separate tags for different tests
 + t5550: require REFFILES
 + t5540: require REFFILES

 Test updates.
 source: <pull.1168.git.git.1640170784.gitgitgadget@gmail.com>


* hn/refs-debug-update (2021-12-22) 3 commits
  (merged to 'next' on 2022-01-03 at 1cd451c66c)
 + refs: centralize initialization of the base ref_store.
 + refs: print error message in debug output
 + refs: pass gitdir to packed_ref_store_create

 Debugging support for refs API.
 source: <pull.1163.v2.git.git.1640196714.gitgitgadget@gmail.com>


* hn/reftable-fixes (2021-12-23) 3 commits
  (merged to 'next' on 2022-01-03 at 532f9bbb27)
 + reftable: support preset file mode for writing
 + reftable: signal overflow
 + reftable: fix typo in header

 Assorted fixlets in reftable code.
 source: <pull.1164.git.git.1640287790.gitgitgadget@gmail.com>


* hn/test-ref-store-show-hash-algo (2021-12-21) 1 commit
  (merged to 'next' on 2022-01-03 at 3cdbfeeaf1)
 + test-ref-store: print hash algorithm

 Debugging support for refs API.
 source: <pull.1167.git.git.1640092500725.gitgitgadget@gmail.com>


* ja/i18n-similar-messages (2022-01-05) 11 commits
  (merged to 'next' on 2022-01-06 at 6440d8fdf2)
 + i18n: turn even more messages into "cannot be used together" ones
 + i18n: ref-filter: factorize "%(foo) atom used without %(bar) atom"
 + i18n: factorize "--foo outside a repository"
 + i18n: refactor "unrecognized %(foo) argument" strings
 + i18n: factorize "no directory given for --foo"
 + i18n: factorize "--foo requires --bar" and the like
 + i18n: tag.c factorize i18n strings
 + i18n: standardize "cannot open" and "cannot read"
 + i18n: turn "options are incompatible" into "cannot be used together"
 + i18n: refactor "%s, %s and %s are mutually exclusive"
 + i18n: refactor "foo and bar are mutually exclusive"

 Similar message templates have been consolidated so that
 translators need to work on fewer number of messages.
 source: <pull.1088.v5.git.1641412944.gitgitgadget@gmail.com>


* ja/perf-use-specified-shell (2021-12-25) 1 commit
  (merged to 'next' on 2022-01-03 at 8ca35ee3d0)
 + t/perf: do not run tests in user's $SHELL

 Perf tests were run with end-user's shell, but it has been
 corrected to use the shell specified by $TEST_SHELL_PATH.
 source: <20211225081656.1311583-1-aclopte@gmail.com>


* jc/doc-submitting-patches-choice-of-base (2021-12-30) 1 commit
  (merged to 'next' on 2022-01-05 at eb97c01c24)
 + SubmittingPatchs: clarify choice of base and testing

 Extend the guidance to choose the base commit to build your work
 on, and hint/nudge contributors to read others' changes.
 source: <xmqqh7apsv6s.fsf_-_@gitster.g>


* jh/p4-human-unit-numbers (2021-12-20) 2 commits
  (merged to 'next' on 2022-01-03 at c385766ff4)
 + git-p4: show progress as an integer
 + git-p4: print size values in appropriate units

 The way "git p4" shows file sizes in its output has been updated to
 use human-readable units.
 source: <20211219154028.3288756-1-jholdsworth@nvidia.com>


* jh/p4-remove-unused (2021-12-22) 2 commits
  (merged to 'next' on 2022-01-03 at 43f61b2fef)
 + git-p4: remove "rollback" verb
 + git-p4: remove "debug" verb

 Remove a few commands from "git p4" that aren't very useful.
 source: <20211222145552.93786-1-jholdsworth@nvidia.com>


* jl/subtree-check-parents-argument-passing-fix (2022-01-04) 1 commit
  (merged to 'next' on 2022-01-05 at 7dc995f026)
 + subtree: fix argument handling in check_parents

 Fix performance-releated bug in "git subtree" (in contrib/).
 source: <pull.1086.v4.git.1638929518657.gitgitgadget@gmail.com>


* js/branch-track-inherit (2021-12-20) 3 commits
  (merged to 'next' on 2022-01-03 at ab5fb34db3)
 + config: require lowercase for branch.*.autosetupmerge
 + branch: add flags and config to inherit tracking
 + branch: accept multiple upstream branches for tracking
 (this branch is used by gc/branch-recurse-submodules.)

 "git -c branch.autosetupmerge=inherit branch new old" makes "new"
 to have the same upstream as the "old" branch, instead of marking
 "old" itself as its upstream.
 source: <cover.1640039978.git.steadmon@google.com>


* js/l10n-mention-ngettext-early-in-readme (2021-12-21) 1 commit
  (merged to 'next' on 2022-01-03 at a644f898ce)
 + l10n: README: call more attention to plural strings

 Localization doc update.
 source: <25107068cbbf8c9ce6886e66e25dff19e072583f.1639425295.git.steadmon@google.com>


* jt/pack-header-lshift-overflow (2022-01-12) 1 commit
  (merged to 'next' on 2022-01-12 at fa27107ab3)
 + packfile: fix off-by-one error in decoding logic

 source: <xmqq4k68u30t.fsf@gitster.g>


* jz/apply-3-corner-cases (2021-12-20) 1 commit
  (merged to 'next' on 2022-01-03 at cb8e19c304)
 + git-apply: skip threeway in add / rename cases

 "git apply --3way" bypasses the attempt to do a three-way
 application in more cases to address the regression caused by the
 recent change to use direct application as a fallback.
 source: <20211217224328.7646-1-jerry@skydio.com>


* lh/use-gnu-color-in-grep (2022-01-05) 1 commit
  (merged to 'next' on 2022-01-05 at a0e2068cb7)
 + grep: align default colors with GNU grep ones

 The color palette used by "git grep" has been updated to match that
 of GNU grep.
 source: <20220105081835.4949-1-lenaic@lhuard.fr>


* ma/header-dup-cleanup (2022-01-10) 1 commit
  (merged to 'next' on 2022-01-12 at de7891f5e8)
 + cache.h: drop duplicate `ensure_full_index()` declaration

 Code clean-up.
 source: <20220110184134.18675-1-martin.agren@gmail.com>


* ma/windows-dynload-fix (2022-01-09) 1 commit
  (merged to 'next' on 2022-01-12 at af0a2e6c90)
 + lazyload: use correct calling conventions

 Fix calling dynamically loaded functions on Windows.
 source: <pull.1181.git.git.1641657750776.gitgitgadget@gmail.com>


* ms/t-readme-typofix (2022-01-04) 1 commit
  (merged to 'next' on 2022-01-06 at 59288ebb22)
 + t/README: fix typo

 Typofix.
 source: <pull.1110.git.1641338224631.gitgitgadget@gmail.com>


* ps/lockfile-cleanup-fix (2022-01-07) 1 commit
  (merged to 'next' on 2022-01-10 at ff0ae63f07)
 + fetch: fix deadlock when cleaning up lockfiles in async signals

 Some lockfile code called free() in signal-death code path, which
 has been corrected.
 source: <555ec6717ecab0fe6ef5660bcf0d61d59f84ef8b.1641552500.git.ps@pks.im>


* rb/nonstop-lacks-uncompress2 (2022-01-12) 1 commit
  (merged to 'next' on 2022-01-12 at 2387a47655)
 + build: NonStop ships with an older zlib

 source: <xmqqzgo0u5j7.fsf@gitster.g>


* ws/fast-export-with-revision-options (2021-12-21) 1 commit
  (merged to 'next' on 2022-01-03 at f94f7f70b6)
 + fast-export: fix surprising behavior with --first-parent

 Use of certain "git rev-list" options with "git fast-export"
 created nonsense results (the worst two of which being "--reverse"
 and "--invert-grep --grep=<foo>").  The use of "--first-parent" is
 made to behave a bit more sensible than before.
 source: <pull.1084.v2.git.1639037637231.gitgitgadget@gmail.com>

--------------------------------------------------
[New Topics]

* jh/p4-fix-use-of-process-error-exception (2022-01-06) 1 commit
  (merged to 'next' on 2022-01-10 at 49d529bfd7)
 + git-p4: fix instantiation of CalledProcessError

 Will cook in 'next'.
 source: <20220106214156.90967-1-jholdsworth@nvidia.com>


* jh/p4-spawning-external-commands-cleanup (2022-01-06) 3 commits
  (merged to 'next' on 2022-01-10 at 54b36b4e66)
 + git-p4: don't print shell commands as python lists
 + git-p4: pass command arguments as lists instead of using shell
 + git-p4: don't select shell mode using the type of the command argument

 Will cook in 'next'.
 source: <20220106214035.90725-1-jholdsworth@nvidia.com>


* pb/pull-rebase-autostash-fix (2022-01-06) 1 commit
 - pull --rebase: honor rebase.autostash even when fast-forwarding

 "git pull --rebase" ignored the rebase.autostash configuration
 variable when the remote history is a descendant of our history,
 which has been corrected.

 Expecting an ack or two.
 source: <4fe0e850-1c30-da70-5535-e2a4105ba734@gmail.com>


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
 - gpg-interface: trim CR from ssh-keygen

 The code path that verifies signatures made with ssh were made to
 work better on a system with CRLF line endings.

 Will merge to 'next'?
 source: <20220103095337.600536-1-fs@gigacodes.de>


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


* ps/avoid-unnecessary-hook-invocation-with-packed-refs (2022-01-12) 7 commits
 - fixup! refs: open-code deletion of packed refs
 - refs: skip hooks when deleting uncovered packed refs
 - refs: do not execute reference-transaction hook on packing refs
 - refs: demonstrate excessive execution of the reference-transaction hook
 - refs: allow skipping the reference-transaction hook
 - refs: allow passing flags when beginning transactions
 - refs: open-code deletion of packed refs

 Because a deletion of ref would need to remove it from both the
 loose ref store and the packed ref store, a delete-ref operation
 that logically removes one ref may end up invoking ref-transaction
 hook twice, which has been corrected.

 Under review.
 source: <cover.1641556319.git.ps@pks.im>


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


* ab/refs-errno-cleanup (2022-01-13) 1 commit
 - refs API: use "failure_errno", not "errno"

 A brown-paper-bag fix on top of a topic that was merged during this
 cycle.

 Will merge to 'next' and then to 'master'.
 source: <patch-v3-1.3-a45268ac24b-20220112T123117Z-avarab@gmail.com>


* ab/reftable-build-fixes (2022-01-13) 2 commits
 - reftable tests: avoid "int" overflow, use "uint64_t"
 - reftable: avoid initializing structs from structs

 A few portability tweaks.

 Will merge to 'next' and then to 'master'?
 source: <cover-0.3-00000000000-20220111T163908Z-avarab@gmail.com>


* en/present-despite-skipped (2022-01-13) 6 commits
 . Accelerate clear_skip_worktree_from_present_files() by caching
 . Update documentation related to sparsity and the skip-worktree bit
 . repo_read_index: clear SKIP_WORKTREE bit from files present in worktree
 . unpack-trees: fix accidental loss of user changes
 . t1011: add testcase demonstrating accidental loss of user modifications
 . Merge branch 'vd/sparse-clean-etc' into en/present-despite-skipped
 (this branch uses vd/sparse-clean-etc.)

 With this topic merged, 'seen' seems to fail t1092.
 source: <pull.1114.git.1642092230.gitgitgadget@gmail.com>


* js/t1450-making-it-writable-does-not-need-full-posixperm (2022-01-13) 1 commit
 - t1450-fsck: exec-bit is not needed to make loose object writable

 Test fix.

 Will merge to 'next'.
 source: <529d99f3-13c8-ffc1-dd4c-3fc70330262a@kdbg.org>

--------------------------------------------------
[Stalled]

* ds/sparse-checkout-requires-per-worktree-config (2021-12-21) 5 commits
 . sparse-checkout: use repo_config_set_worktree_gently()
 . config: add repo_config_set_worktree_gently()
 . worktree: add upgrade_to_worktree_config()
 . config: make some helpers repo-aware
 . setup: use a repository when upgrading format

 "git sparse-checkout" wants to work with per-worktree configration,
 but did not work well in a worktree attached to a bare repository.
 source: <pull.1101.v2.git.1640114048.gitgitgadget@gmail.com>


* pw/add-p-hunk-split-fix (2022-01-12) 2 commits
 - builtin add -p: fix hunk splitting
 - t3701: clean up hunk splitting tests

 "git add -p" rewritten in C regressed hunk splitting in some cases,
 which has been corrected.

 Will merge to 'next'?
 source: <pull.1100.v2.git.1641899530.gitgitgadget@gmail.com>


* gc/fetch-negotiate-only-early-return (2022-01-12) 3 commits
 - fetch --negotiate-only: do not update submodules
 - fetch: skip tasks related to fetching objects
 - fetch: use goto cleanup in cmd_fetch()

 "git fetch --nogotiate-only" is an internal command used by "git
 push" to figure out which part of our history is missing from the
 other side.  It should never recurse into submodules even when
 fetch.recursesubmodules configuration variable is set, nor it
 should trigger "gc".  The code has been tightened up to ensure it
 only does common ancestry discovery and nothing else.

 Almost there.
 source: <20220113004501.78822-1-chooglen@google.com>


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

* bc/csprng-mktemps (2022-01-04) 2 commits
 - wrapper: use a CSPRNG to generate random file names
 - wrapper: add a helper to generate numbers from a CSPRNG

 Pick a better random number generator and use it when we prepare
 temporary filenames.

 Expecting a reroll.
 cf. <YdTQodIhZ9273nJE@camp.crustytoothpaste.net>
 source: <20220104015555.3387101-1-sandals@crustytoothpaste.net>


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
 - update-index: refresh should rewrite index in case of racy timestamps
 - t7508: add tests capturing racy timestamp handling
 - t7508: fix bogus mtime verification
 - test-lib: introduce API for verifying file mtime

 "git update-index --refresh" has been taught to deal better with
 racy timestamps (just like "git status" already does).

 Will merge to 'next'.
 source: <pull.1105.v4.git.1641554252.gitgitgadget@gmail.com>


* jc/find-header (2022-01-06) 1 commit
  (merged to 'next' on 2022-01-10 at 8a13b4f0b3)
 + receive-pack.c: consolidate find header logic

 Code clean-up.

 Will cook in 'next'.
 source: <pull.1125.v6.git.git.1641499655700.gitgitgadget@gmail.com>


* jc/name-rev-stdin (2022-01-10) 2 commits
 - name-rev.c: use strbuf_getline instead of limited size buffer
 - name-rev: deprecate --stdin in favor of --annotate-stdin

 "git name-rev --stdin" does not behave like usual "--stdin" at
 all.  Start the process of renaming it to "--annotate-stdin".

 Will merge to 'next'?
 source: <pull.1171.v7.git.git.1641425372.gitgitgadget@gmail.com>


* en/remerge-diff (2021-12-30) 10 commits
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
 source: <pull.1103.v3.git.1640907369.gitgitgadget@gmail.com>


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

 Will merge to 'next'?
 source: <20211220233459.45739-1-chooglen@google.com>


* hn/reftable-coverity-fixes (2021-12-22) 18 commits
 - reftable: be more paranoid about 0-length memcpy calls
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

 Expecting a reroll.
 cf. <211228.86lf04j0lg.gmgdl@evledraar.gmail.com>
 source: <pull.1152.v5.git.git.1640199396.gitgitgadget@gmail.com>


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


* ab/grep-patterntype (2021-12-27) 7 commits
 - grep API: call grep_config() after grep_init()
 - grep.c: don't pass along NULL callback value
 - built-ins: trust the "prefix" from run_builtin()
 - fixup! grep tests: add missing "grep.patternType" config tests
 - grep tests: add missing "grep.patternType" config tests
 - log tests: check if grep_config() is called by "log"-like cmds
 - grep.h: remove unused "regex_t regexp" from grep_opt

 Some code clean-up in the "git grep" machinery.

 Reroll exists.
 source: <cover-v6-0.7-00000000000-20211226T223035Z-avarab@gmail.com>


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


* jt/conditional-config-on-remote-url (2021-12-15) 2 commits
 - config: include file if remote URL matches a glob
 - config: make git_config_include() static

 The conditional inclusion mechanism of configuration files using
 "[includeIf <condition>]" learns to base its decision on the
 URL of the remote repository the repository interacts with.

 How does this one look these days?
 source: <cover.1639509048.git.jonathantanmy@google.com>


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


* tl/ls-tree-oid-only (2022-01-06) 9 commits
 - cocci: allow padding with `strbuf_addf()`
 - ls-tree.c: introduce "--format" option
 - ls-tree.c: introduce struct "show_tree_data"
 - ls-tree.c: support --object-only option for "git-ls-tree"
 - ls-tree: optimize naming and handling of "return" in show_tree()
 - ls-tree: use "size_t", not "int" for "struct strbuf"'s "len"
 - ls-tree: use "enum object_type", not {blob,tree,commit}_type
 - ls-tree: add missing braces to "else" arms
 - ls-tree: remove commented-out code

 "git ls-tree" learns "--oid-only" option, similar to "--name-only",
 and more generalized "--format" option.
 source: <cover.1641440700.git.dyroneteng@gmail.com>


* ab/config-based-hooks-2 (2022-01-07) 17 commits
 - run-command: remove old run_hook_{le,ve}() hook API
 - receive-pack: convert push-to-checkout hook to hook.h
 - read-cache: convert post-index-change to use hook.h
 - commit: convert {pre-commit,prepare-commit-msg} hook to hook.h
 - git-p4: use 'git hook' to run hooks
 - send-email: use 'git hook run' for 'sendemail-validate'
 - git hook run: add an --ignore-missing flag
 - hooks: convert worktree 'post-checkout' hook to hook library
 - hooks: convert non-worktree 'post-checkout' hook to hook library
 - merge: convert post-merge to use hook.h
 - am: convert applypatch-msg to use hook.h
 - rebase: convert pre-rebase to use hook.h
 - hook API: add a run_hooks_l() wrapper
 - am: convert {pre,post}-applypatch to use hook.h
 - gc: use hook library for pre-auto-gc hook
 - hook API: add a run_hooks() wrapper
 - hook: add 'run' subcommand

 More "config-based hooks".

 Will merge to 'next', with minor nits?
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

--------------------------------------------------
[Discarded]

* ms/customizable-ident-expansion (2021-12-25) 2 commits
 . fixup! keyword expansion: make "$Id$" string configurable
 . keyword expansion: make "$Id$" string configurable

 Instead of "$Id$", user-specified string (like $FreeBSD$) can be
 used as an in-blob placeholder for keyword expansion.

 Will discard.
 Stalled for too long.
 cf. <xmqqfsuosvrh.fsf@gitster.g>
 cf. <211101.86fssf3bn3.gmgdl@evledraar.gmail.com>
 source: <pull.1074.v3.git.git.1630462385587.gitgitgadget@gmail.com>


* tb/cruft-packs (2021-11-29) 17 commits
 . sha1-file.c: don't freshen cruft packs
 . builtin/gc.c: conditionally avoid pruning objects via loose
 . builtin/repack.c: add cruft packs to MIDX during geometric repack
 . builtin/repack.c: use named flags for existing_packs
 . builtin/repack.c: allow configuring cruft pack generation
 . builtin/repack.c: support generating a cruft pack
 . builtin/pack-objects.c: --cruft with expiration
 . reachable: report precise timestamps from objects in cruft packs
 . reachable: add options to add_unseen_recent_objects_to_traversal
 . builtin/pack-objects.c: --cruft without expiration
 . builtin/pack-objects.c: return from create_object_entry()
 . t/helper: add 'pack-mtimes' test-tool
 . pack-mtimes: support writing pack .mtimes files
 . chunk-format.h: extract oid_version()
 . pack-write: pass 'struct packing_data' to 'stage_tmp_packfiles'
 . pack-mtimes: support reading .mtimes files
 . Documentation/technical: add cruft-packs.txt

 Instead of leaving unreachable objects in loose form when packing,
 or ejecting them into loose form when repacking, gather them in a
 packfile with an auxiliary file that records the last-use time of
 these objects.

 Dropped per author request.
 cf. <Ydcev8HqCjycBJS+@nand.local>
 cf. <865b99dd-0b18-9a07-49c1-3959a777c685@gmail.com>
 cf. <c9437c89-9258-4034-9886-8a2aec46aa6b@gmail.com>
 cf. <YaqiYGM48p5F9lS1@nand.local>
 source: <cover.1638224692.git.me@ttaylorr.com>
