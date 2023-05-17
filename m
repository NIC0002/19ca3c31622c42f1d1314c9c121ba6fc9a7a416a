Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219C2C77B7A
	for <git@archiver.kernel.org>; Wed, 17 May 2023 00:30:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbjEQAav (ORCPT <rfc822;git@archiver.kernel.org>);
        Tue, 16 May 2023 20:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbjEQAau (ORCPT <rfc822;git@vger.kernel.org>);
        Tue, 16 May 2023 20:30:50 -0400
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 879C140EB
        for <git@vger.kernel.org>; Tue, 16 May 2023 17:30:46 -0700 (PDT)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id 9B55419F17F;
        Tue, 16 May 2023 20:30:45 -0400 (EDT)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to
        :subject:date:message-id:mime-version:content-type
        :content-transfer-encoding; s=sasl; bh=7y5omJTN3OdDj5sjE0YiOijMW
        g2J4coNRwGOI7LvxFo=; b=PENrThK9eHnWTJwhnARNEOtA59RGoApWrSsJANxB+
        Vd3oFhzretChktaIWll0zRwr02JlqC/usRtI+oIVG1PNbwyHWmeibdE0zinw3nmT
        xz03R7NXHkHFxAkzdwCc6OQTQSdt8q4moMZ4pkYXmTo+NytvP7S9Xs/d/hU033Qc
        Ds=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id 920DD19F17E;
        Tue, 16 May 2023 20:30:45 -0400 (EDT)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [35.203.137.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp1.pobox.com (Postfix) with ESMTPSA id DE47F19F17D;
        Tue, 16 May 2023 20:30:44 -0400 (EDT)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (May 2023, #05; Tue, 16)
X-master-at: 0df2c180904f6b709766f9c24669a9d01543f915
X-next-at: b87f41e99e62330abb8a140c6bb46d61a0bfd809
Date:   Tue, 16 May 2023 17:30:43 -0700
Message-ID: <xmqqa5y3ssss.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-Pobox-Relay-ID: 0FDC621A-F44A-11ED-B1E7-C65BE52EC81B-77302942!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Here are the topics that have been cooking in my tree.  Commits
prefixed with '+' are in 'next' (being in 'next' is a sign that a
topic is stable enough to be used and are candidate to be in a future
release).  Commits prefixed with '-' are only in 'seen', and aren't
considered "accepted" at all and may be annotated with an URL to a
message that raises issues but they are no means exhaustive.  A
topic without enough support may be discarded after a long period of
no activity.

Git 2.41-rc0 has been tagged.  Hopefully we will merge a few more
topics by -rc1 and then go into pre-release feature freeze.
Starting next week, until early June, my availability may be
sporadic, but this time I won't be completely away from the keyboard
to require an interim maintainer.

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

* ar/config-count-tests-updates (2023-04-24) 3 commits
  (merged to 'next' on 2023-05-06 at c585a56132)
 + t1300: add tests for missing keys
 + t1300: check stderr for "ignores pairs" tests
 + t1300: drop duplicate test

 Test updates.
 source: <20230423134649.431783-1-rybak.a.v@gmail.com>


* ar/test-cleanup-unused-file-creation (2023-05-09) 1 commit
  (merged to 'next' on 2023-05-09 at 7734f3d690)
 + test: rev-parse-upstream: add missing cmp

 Test fix.
 source: <20230509000246.1760327-1-felipe.contreras@gmail.com>


* ds/fsck-bitmap (2023-05-02) 2 commits
  (merged to 'next' on 2023-05-09 at c2148408a2)
 + fsck: use local repository
 + fsck: verify checksums of all .bitmap files

 "git fsck" learned to detect bit-flip breakages in the reachability
 bitmap files.
 source: <pull.1526.v2.git.1683034042.gitgitgadget@gmail.com>


* ds/merge-tree-use-config (2023-05-10) 1 commit
  (merged to 'next' on 2023-05-11 at e0dab53028)
 + merge-tree: load default git config

 Allow git forges to disable replace-refs feature while running "git
 merge-tree".
 source: <pull.1530.git.1683745654800.gitgitgadget@gmail.com>


* fc/doc-use-datestamp-in-commit (2023-05-05) 2 commits
  (merged to 'next' on 2023-05-06 at 1eda43b03f)
 + doc-diff: drop SOURCE_DATE_EPOCH override
 + doc: doc-diff: specify date

 An earlier change broke "doc-diff", which has been corrected.
 source: <20230503232349.59997-1-felipe.contreras@gmail.com>
 source: <20230505211610.GA3197168@coredump.intra.peff.net>


* gc/trace-bare-repo-setup (2023-05-01) 1 commit
  (merged to 'next' on 2023-05-06 at 72b977d2f9)
 + setup: trace bare repository setups

 The tracing mechanism learned to notice and report when
 auto-discovered bare repositories are being used, as allowing so
 without explicitly stating the user intends to do so (with setting
 GIT_DIR for example) can be used with social engineering as an
 attack vector.
 source: <e98be8e7f703fc741e06d9208545abc8c24d1a4a.1682962110.git.steadmo=
n@google.com>


* jc/dirstat-plug-leaks (2023-05-05) 2 commits
  (merged to 'next' on 2023-05-09 at 2df7cf06e4)
 + diff: plug leaks in dirstat
 + diff: refactor common tail part of dirstat computation
 (this branch is used by jc/diff-s-with-other-options.)

 "git diff --dirstat" leaked memory, which has been plugged.
 source: <20230505211917.2746751-1-gitster@pobox.com>


* jc/doc-clarify-git-default-hash-variable (2023-04-26) 1 commit
  (merged to 'next' on 2023-05-06 at 7bae4db4cc)
 + doc: GIT_DEFAULT_HASH is and will be ignored during "clone"

 The documentation was misleading about the interaction between
 GIT_DEFAULT_HASH and "git clone", which has been clarified to
 stress that the variable is to be ignored by the command.
 source: <xmqqzg6uvfpo.fsf_-_@gitster.g>


* jc/name-rev-deprecate-stdin-further (2023-05-06) 1 commit
  (merged to 'next' on 2023-05-09 at 0db4f08e32)
 + name-rev: make --stdin hidden

 The "--stdin" option of "git name-rev" has been replaced with
 the "--annotate-stdin" option more than a year ago.  We stop
 advertising it in the "git name-rev -h" output.
 source: <pull.1225.v3.git.git.1683346451239.gitgitgadget@gmail.com>


* jc/t9800-fix-use-of-show-s-raw (2023-05-06) 1 commit
  (merged to 'next' on 2023-05-09 at f4d7a7d671)
 + t9800: correct misuse of 'show -s --raw' in a test

 A test fix.
 source: <xmqqild5rvvw.fsf@gitster.g>


* jk/test-verbose-no-more (2023-05-08) 3 commits
  (merged to 'next' on 2023-05-09 at 897bfd0a6b)
 + t: drop "verbose" helper function
 + t7001: use "ls-files --format" instead of "cut"
 + t7001: avoid git on upstream of pipe

 Retire "verbose" helper function from the test framework.
 source: <20230508185953.GA2108869@coredump.intra.peff.net>


* js/gitk-fixes-from-gfw (2023-05-08) 3 commits
  (merged to 'next' on 2023-05-08 at adb334deec)
 + Merge gitk changes into js/gitk-fixes-from-gfw
 + gitk: escape file paths before piping to git log
 + gitk: prevent overly long command lines

 Gitk updates from GfW project.
 source: <pull.1469.git.1674559397.gitgitgadget@gmail.com>


* js/subtree-fully-spelt-quiet-and-debug-options (2023-05-08) 1 commit
  (merged to 'next' on 2023-05-10 at 2980db981e)
 + subtree: support long global flags

 "git subtree" (in contrib/) update.
 source: <pull.1514.git.1683428988693.gitgitgadget@gmail.com>


* kh/doc-interpret-trailers-updates (2023-05-01) 4 commits
  (merged to 'next' on 2023-05-06 at 4e9a640131)
 + doc: interpret-trailers: fix example
 + doc: interpret-trailers: don=E2=80=99t use deprecated config
 + doc: interpret-trailers: use input redirection
 + doc: interpret-trailers: don=E2=80=99t use heredoc in examples

 Doc update.
 source: <cover.1682970213.git.code@khaugsbakk.name>


* mc/send-email-header-cmd (2023-05-01) 3 commits
  (merged to 'next' on 2023-05-06 at 04514468b6)
 + send-email: detect empty blank lines in command output
 + send-email: add --header-cmd, --no-header-cmd options
 + send-email: extract execute_cmd from recipients_cmd

 "git send-email" learned "--header-cmd=3D<cmd>" that can inject
 arbitrary e-mail header lines to the outgoing messages.
 source: <20230501143848.19674-1-maxim.cournoyer@gmail.com>


* ps/fetch-output-format (2023-05-10) 9 commits
  (merged to 'next' on 2023-05-12 at 4126a008a5)
 + fetch: introduce machine-parseable "porcelain" output format
 + fetch: move option related variables into main function
 + fetch: lift up parsing of "fetch.output" config variable
 + fetch: introduce `display_format` enum
 + fetch: refactor calculation of the display table width
 + fetch: print left-hand side when fetching HEAD:foo
 + fetch: add a test to exercise invalid output formats
 + fetch: split out tests for output format
 + fetch: fix `--no-recurse-submodules` with multi-remote fetches

 "git fetch" learned the "--porcelain" option that emits what it did
 in a machine-parseable format.
 source: <cover.1683721293.git.ps@pks.im>


* rj/branch-unborn-in-other-worktrees (2023-03-27) 5 commits
  (merged to 'next' on 2023-05-06 at c61e9b0672)
 + branch: avoid unnecessary worktrees traversals
 + branch: rename orphan branches in any worktree
 + branch: description for orphan branch errors
 + branch: use get_worktrees() in copy_or_rename_branch()
 + branch: test for failures while renaming branches

 Error messages given when working on an unborn branch that is
 checked out in another worktree have been improved.
 source: <f8e6447e-5cd3-98fa-f567-39e1c60dacb0@gmail.com>


* sg/retire-unused-cocci (2023-04-20) 1 commit
  (merged to 'next' on 2023-05-12 at 77cc27c837)
 + cocci: remove 'unused.cocci'

 Retire a rather expensive-to-run Coccinelle check patch.
 source: <20230420205350.600760-1-szeder.dev@gmail.com>


* sl/diff-files-sparse (2023-05-09) 2 commits
  (merged to 'next' on 2023-05-12 at 486be95d1b)
 + diff-files: integrate with sparse index
 + t1092: add tests for `git diff-files`

 Teach "diff-files" not to expand sparse-index unless needed.
 cf. <f51a8d77-c480-f021-38c4-78a9d75cdd11@github.com>
 source: <20230509194241.469477-1-cheskaqiqi@gmail.com>


* tl/push-branches-is-an-alias-for-all (2023-05-12) 2 commits
  (merged to 'next' on 2023-05-12 at 536aaf0bd9)
 + t5583: fix shebang line
  (merged to 'next' on 2023-05-09 at 1d8c3e5dcf)
 + push: introduce '--branches' option

 "git push --all" gained an alias "git push --branches".
 source: <20230506113408.61529-2-tenglong.tl@alibaba-inc.com>
 source: <pull.1532.git.1683904156670.gitgitgadget@gmail.com>

--------------------------------------------------
[New Topics]

* cg/doc-http-lowspeed-limit (2023-05-14) 1 commit
 - doc/git-config: add unit for http.lowSpeedLimit

 Doc update.

 Will merge to 'next'.
 source: <pull.1507.git.git.1683970203084.gitgitgadget@gmail.com>


* kh/keep-tag-editmsg-upon-failure (2023-05-16) 3 commits
 - tag: keep the message file in case ref transaction fails
 - t/t7004-tag: add regression test for successful tag creation
 - doc: tag: document `TAG_EDITMSG`

 "git tag" learned to leave the "$GIT_DIR/TAG_EDITMSG" file when the
 command failed, so that the user can salvage what they typed.

 Will merge to 'next'.
 source: <cover.1684258780.git.code@khaugsbakk.name>


* sa/doc-ls-remote (2023-05-15) 6 commits
 - ls-remote doc: document the output format
 - ls-remote doc: explain what each example does
 - ls-remote doc: show peeled tags in examples
 - ls-remote doc: remove redundant --tags example
 - show-branch doc: say <ref>, not <reference>
 - show-ref doc: update for internal consistency

 Doc update.

 Expecting a minor and hopefully final reroll.
 source: <pull.1471.v3.git.git.1684152793.gitgitgadget@gmail.com>


* tb/refs-exclusion-and-packed-refs (2023-05-15) 16 commits
 - ls-refs.c: avoid enumerating hidden refs where possible
 - upload-pack.c: avoid enumerating hidden refs where possible
 - builtin/receive-pack.c: avoid enumerating hidden references
 - refs.h: let `for_each_namespaced_ref()` take excluded patterns
 - refs/packed-backend.c: ignore complicated hidden refs rules
 - revision.h: store hidden refs in a `strvec`
 - refs/packed-backend.c: add trace2 counters for jump list
 - refs/packed-backend.c: implement jump lists to avoid excluded pattern(=
s)
 - refs/packed-backend.c: refactor `find_reference_location()`
 - refs: plumb `exclude_patterns` argument throughout
 - builtin/for-each-ref.c: add `--exclude` option
 - ref-filter.c: parameterize match functions over patterns
 - ref-filter: add `ref_filter_clear()`
 - ref-filter: clear reachable list pointers after freeing
 - ref-filter.h: provide `REF_FILTER_INIT`
 - refs.c: rename `ref_filter`

 Enumerating refs in the packed-refs file, while excluding refs that
 match certain patterns, has been optimized.

 Will merge to 'next'?
 source: <cover.1684178576.git.me@ttaylorr.com>


* zh/ls-files-format-atoms (2023-05-14) 2 commits
 - ls-files: add %(objectsize) atom to format option
 - ls-files: add %(objecttype) atom to format option

 Some atoms that can be used in "--format=3D<format>" for "git ls-tree"
 were not supported by "git ls-files", even though they were relevant
 in the context of the latter.
 source: <pull.1533.git.1683969100.gitgitgadget@gmail.com>


* jc/do-not-negate-test-helpers (2023-05-16) 3 commits
 - test: do not negate test_path_is_* to assert absense
 - t2021: do not negate test_path_is_dir
 - tests: do not negate test_path_exists

 Small fixes.

 Will merge to 'next'.
 source: <20230516022646.648123-1-gitster@pobox.com>


* tb/run-command-needs-alloc-h (2023-05-16) 1 commit
  (merged to 'next' on 2023-05-16 at b87f41e99e)
 + run-command.c: fix missing include under `NO_PTHREADS`

 Fix the build problem with NO_PTHREADS defined, a fallout from
 recent header file shuffling.

 Will merge to 'master'.
 source: <ZGP2tw0USsj9oecZ@nand.local>

--------------------------------------------------
[Stalled]

* ed/fsmonitor-windows-named-pipe (2023-03-24) 1 commit
 - fsmonitor: handle differences between Windows named pipe functions

 Fix fsmonitor on Windows when the filesystem path contains certain
 characters.

 Expecting a reroll.
 cf. <b9cf67e4-22a7-2ff0-8310-9223bea10d6d@jeffhostetler.com>
 source: <pull.1503.git.1679678090412.gitgitgadget@gmail.com>


* rn/sparse-diff-index (2023-04-10) 1 commit
 - diff-index: enable sparse index

 "git diff-index" command has been taught to work better with the
 sparse index.

 Expecting a reroll.
 cf. <62821012-4fc3-5ad8-695c-70f7ab14a8c9@github.com>
 source: <20230408112342.404318-1-nanth.raghul@gmail.com>


* ja/worktree-orphan (2023-04-17) 8 commits
 - worktree add: emit warn when there is a bad HEAD
 - worktree add: extend DWIM to infer --orphan
 - worktree add: introduce "try --orphan" hint
 - worktree add: add --orphan flag
 - t2400: add tests to verify --quiet
 - t2400: refactor "worktree add" opt exclusion tests
 - t2400: print captured git output when finished
 - worktree add: include -B in usage docs

 'git worktree add' learned how to create a worktree based on an
 orphaned branch with `--orphan`.

 Expecting a reroll.
 cf. <m7crhly2j3k76whydbtdwhvzghvoql436g3lqtst4v3ahv75aa@wq5zjepgrxz5>
 source: <20230417093255.31079-1-jacobabel@nullpo.dev>


* es/recurse-submodules-option-is-a-bool (2023-04-10) 1 commit
 - usage: clarify --recurse-submodules as a boolean

 The "--[no-]recurse-submodules" option of "git checkout" and others
 supported an undocumented syntax --recurse-submodules=3D<value> where
 the value can spell a Boolean in various ways.  The support for the
 syntax is being dropped.

 Expecting a reroll.
 cf. <ZDSTFwMFO7vbj/du@google.com>
 source: <ZDSTFwMFO7vbj/du@google.com>


* tb/pack-bitmap-index-seek (2023-03-20) 6 commits
 - pack-bitmap.c: factor out `bitmap_index_seek_commit()`
 - pack-bitmap.c: use `bitmap_index_seek()` where possible
 - pack-bitmap.c: factor out manual `map_pos` manipulation
 - pack-bitmap.c: drop unnecessary 'inline's
 - pack-bitmap.c: hide bitmap internals in `read_be32()`
 - pack-bitmap.c: hide bitmap internals in `read_u8()`

 Clean-up the pack-bitmap codepath.

 Kicked back to 'seen' out of 'next'.
 There is a BUG() on data errors that needs to be fixed.
 source: <cover.1679342296.git.me@ttaylorr.com>


* cb/checkout-same-branch-twice (2023-03-22) 2 commits
 - SQUASH??? the test marked to expect failure passes from day one
 - checkout/switch: disallow checking out same branch in multiple worktre=
es

 "git checkout -B $branch" failed to protect against checking out
 a branch that is checked out elsewhere, unlike "git branch -f" did.

 Expecting a hopefully minor and final reroll.
 cf. <CAPUEspj_Bh+LgYLnWfeBdcq_uV5Cbou-7H51GLFjzSa5Qzby9w@mail.gmail.com>
 source: <20230120113553.24655-1-carenas@gmail.com>


* tk/pull-conflict-suggest-rebase-merge-not-rebase-true (2023-02-13) 1 co=
mmit
 - pull: conflict hint pull.rebase suggestion should offer "merges" vs "t=
rue"

 In an advice message after failed non-ff pull, we used to suggest
 setting pull.rebase=3Dtrue, but these days pull.rebase=3Dmerges may be
 more inline with the original spirit of "rebuild your side on top
 of theirs".

 May want to discard.
 This is too much of a departure from the existing practice.
 cf. <CAMMLpeTPEoKVTbfc17w+Y9qn7jOGmQi_Ux0Y3sFW5QTgGWJ=3DSA@mail.gmail.co=
m>
 cf. <CABPp-BGqAxKnxDRVN4cYMteLp33hvto07R3=3DTJBT5WubJT4+Og@mail.gmail.co=
m>
 source: <pull.1474.git.1675614276549.gitgitgadget@gmail.com>


* ab/tag-object-type-errors (2023-05-10) 4 commits
 - tag: don't emit potentially incorrect "object is a X, not a Y"
 - tag: don't misreport type of tagged objects in errors
 - object tests: add test for unexpected objects in tags
 - Merge branch 'jk/parse-object-type-mismatch' into ab/tag-object-type-e=
rrors

 Hardening checks around mismatched object types when one of those
 objects is a tag.
 source: <cover-v2-0.3-00000000000-20221230T011725Z-avarab@gmail.com>


* ad/test-record-count-when-harness-is-in-use (2022-12-25) 1 commit
 - test-lib: allow storing counts with test harnesses

 Allow summary results from tests to be written to t/test-results
 directory even when a test harness like 'prove' is in use.

 Expecting a reroll.
 cf. <CABPp-BGoPuGCZw+9wCgdYyRR4Zf4y9Kun27GrQhtMdYWpOUsYQ@mail.gmail.com>
 source: <20221224225200.1027806-1-adam@dinwoodie.org>


* so/diff-merges-more (2022-12-18) 5 commits
 - diff-merges: improve --diff-merges documentation
 - diff-merges: issue warning on lone '-m' option
 - diff-merges: support list of values for --diff-merges
 - diff-merges: implement log.diffMerges-m-imply-p config
 - diff-merges: implement [no-]hide option and log.diffMergesHide config

 Assorted updates to "--diff-merges=3DX" option.

 May want to discard.
 Breaking compatibility does not seem worth it.
 source: <20221217132955.108542-1-sorganov@gmail.com>


* ab/imap-send-requires-curl (2023-02-02) 6 commits
 - imap-send: correctly report "host" when using "tunnel"
 - imap-send: remove old --no-curl codepath
 - imap-send: make --curl no-optional
 - imap-send: replace auto-probe libcurl with hard dependency
 - imap-send doc: the imap.sslVerify is used with imap.tunnel
 - imap-send: note "auth_method", not "host" on auth method failure

 Give a hard dependency on cURL library to build "git imap-send",
 and remove the code to interact with IMAP server without using cURL.

 Expecting a reroll.
 The 'tunnel' part is still iffy.
 cf. <230203.86bkmabfjr.gmgdl@evledraar.gmail.com>
 source: <cover-v2-0.6-00000000000-20230202T093706Z-avarab@gmail.com>


* cw/submodule-status-in-parallel (2023-03-02) 6 commits
 - diff-lib: parallelize run_diff_files for submodules
 - diff-lib: refactor out diff_change logic
 - submodule: refactor is_submodule_modified()
 - submodule: move status parsing into function
 - submodule: rename strbuf variable
 - run-command: add on_stderr_output_fn to run_processes_parallel_opts

 "git submodule status" learned to run the comparison in submodule
 repositories in parallel.

 Expecting a reroll.
 cf. <CAFySSZDk05m6gU5-V1R+y3YnQ5PPduVW54+_gjBwD0rmacsLsw@mail.gmail.com>
 cf. <230307.865ybc273g.gmgdl@evledraar.gmail.com>
 source: <20230302215237.1473444-1-calvinwan@google.com>

--------------------------------------------------
[Cooking]

* tc/cat-file-z-use-cquote (2023-05-10) 1 commit
 - cat-file: quote-format name in error when using -z

 "cat-file" in the batch mode that is fed NUL-terminated pathnames
 learned to cquote them in its error output (otherwise, a funny
 pathname with LF in it would break the lines in the output stream).

 Redesign.
 source: <20230510190116.795641-2-toon@iotcl.com>


* js/rebase-count-fixes (2023-05-14) 2 commits
 - rebase -r: fix the total number shown in the progress
 - rebase --update-refs: fix loops

 A few bugs in the sequencer machinery that results in miscounting
 the steps have been corrected.

 Will merge to 'next'.
 source: <pull.1531.v2.git.1683965487.gitgitgadget@gmail.com>


* en/header-split-cache-h-part-3 (2023-05-16) 29 commits
 - fsmonitor-ll.h: split this header out of fsmonitor.h
 - hash-ll, hashmap: move oidhash() to hash-ll
 - object-store-ll.h: split this header out of object-store.h
 - khash: name the structs that khash declares
 - merge-ll: rename from ll-merge
 - git-compat-util.h: remove unneccessary include of wildmatch.h
 - builtin.h: remove unneccessary includes
 - list-objects-filter-options.h: remove unneccessary include
 - diff.h: remove unnecessary include of oidset.h
 - repository: remove unnecessary include of path.h
 - log-tree: replace include of revision.h with simple forward declaratio=
n
 - cache.h: remove this no-longer-used header
 - read-cache*.h: move declarations for read-cache.c functions from cache=
.h
 - repository.h: move declaration of the_index from cache.h
 - merge.h: move declarations for merge.c from cache.h
 - diff.h: move declaration for global in diff.c from cache.h
 - preload-index.h: move declarations for preload-index.c from elsewhere
 - sparse-index.h: move declarations for sparse-index.c from cache.h
 - name-hash.h: move declarations for name-hash.c from cache.h
 - run-command.h: move declarations for run-command.c from cache.h
 - statinfo: move stat_{data,validity} functions from cache/read-cache
 - read-cache: move shared add/checkout/commit code
 - add: modify add_files_to_cache() to avoid globals
 - read-cache: move shared commit and ls-files code
 - setup: adopt shared init-db & clone code
 - init-db, clone: change unnecessary global into passed parameter
 - init-db: remove unnecessary global variable
 - init-db: document existing bug with core.bare in template config
 - Merge branch 'en/header-split-cache-h-part-2' into en/header-split-cac=
he-h-part-3

 Header files cleanup.
 source: <pull.1525.v3.git.1684218848.gitgitgadget@gmail.com>


* la/doc-interpret-trailers (2023-05-11) 9 commits
 - doc: trailer: add more examples in DESCRIPTION
 - doc: trailer: mention 'key' in DESCRIPTION
 - doc: trailer.<token>.command: emphasize deprecation
 - doc: trailer: use angle brackets for <token> and <value>
 - doc: trailer: remove redundant phrasing
 - doc: trailer: examples: avoid the word "message" by itself
 - doc: trailer: drop "commit message part" phrasing
 - doc: trailer: swap verb order
 - doc: trailer: fix grammar

 Doc update.

 On hold. Looking good.
 Want to be rebased once kh/doc-interpret-trailers-updates lands.
 source: <pull.1506.v2.git.git.1683839975.gitgitgadget@gmail.com>


* cc/git-replay (2023-05-09) 16 commits
 - SQUASH???
 - replay: stop assuming replayed branches do not diverge
 - replay: add --contained to rebase contained branches
 - replay: add --advance or 'cherry-pick' mode
 - replay: disallow revision specific options and pathspecs
 - replay: use standard revision ranges
 - replay: make it a minimal server side command
 - replay: remove HEAD related sanity check
 - replay: remove progress and info output
 - replay: add an important FIXME comment about gpg signing
 - replay: don't simplify history
 - replay: introduce pick_regular_commit()
 - replay: die() instead of failing assert()
 - replay: start using parse_options API
 - replay: introduce new builtin
 - t6429: remove switching aspects of fast-rebase

 source: <20230509175347.1714141-1-christian.couder@gmail.com>


* jc/pack-ref-exclude-include (2023-05-12) 3 commits
 - pack-refs: teach pack-refs --include option
 - pack-refs: teach --exclude option to exclude refs from being packed
 - docs: clarify git-pack-refs --all will pack all refs

 "git pack-refs" learns "--include" and "--exclude" to tweak the ref
 hierarchy to be packed using pattern matching.

 Will merge to 'next'?
 source: <pull.1501.v4.git.git.1683927282.gitgitgadget@gmail.com>


* tb/gc-recent-object-hook (2023-05-15) 2 commits
 - gc: introduce `gc.recentObjectsHook`
 - reachable.c: extract `obj_is_recent()`

 "git pack-objects" learned to invoke a new hook program that
 enumerates extra objects to be used as anchoring points to keep
 otherwise unreachable objects in cruft packs.
 source: <cover.1684196634.git.me@ttaylorr.com>


* jc/diff-s-with-other-options (2023-05-05) 1 commit
 - diff: fix interaction between the "-s" option and other options

 The "-s" (silent, squelch) option of the "diff" family of commands
 did not interact with other options that specify the output format
 well.  This has been cleaned up so that it will clear all the
 formatting options given before.

 Will merge to 'next'?
 source: <20230505165952.335256-1-gitster@pobox.com>


* ob/revert-of-revert (2023-05-05) 1 commit
 - sequencer: beautify subject of reverts of reverts

 Instead of "Revert "Revert "original"", give "Reapply "original""
 as the title for a revert of a revert.

 Expecting a hopefully final reroll.
 Looking much better, except for minor cosmetic issues.
 source: <20230428083528.1699221-1-oswald.buddenhagen@gmx.de>


* jc/attr-source-tree (2023-05-06) 1 commit
  (merged to 'next' on 2023-05-10 at cb94f4fba6)
 + attr: teach "--attr-source=3D<tree>" global option to "git"

 "git --attr-source=3D<tree> cmd $args" is a new way to have any
 command to read attributes not from the working tree but from the
 given tree object.

 Will merge to 'master'.
 source: <pull.1470.v6.git.git.1683346530487.gitgitgadget@gmail.com>


* bc/clone-empty-repo-via-protocol-v0 (2023-05-01) 1 commit
 - upload-pack: advertise capabilities when cloning empty repos

 Expecting a minor and hopefully final update.
 cf. <20230501224038.GA1174291@coredump.intra.peff.net>
 source: <20230501170018.1410567-2-sandals@crustytoothpaste.net>


* cw/strbuf-cleanup (2023-05-12) 7 commits
  (merged to 'next' on 2023-05-15 at 31d08296f2)
 + strbuf: remove global variable
 + strbuf: clarify dependency
 + path: move related function to path
 + object-name: move related functions to object-name
 + credential-store: move related functions to credential-store file
 + abspath: move related functions to abspath
 + strbuf: clarify API boundary

 Move functions that are not about pure string manipulation out of
 strbuf.[ch]

 Will merge to 'master'.
 source: <20230512171429.2202982-1-calvinwan@google.com>


* tl/notes-separator (2023-04-28) 6 commits
  (merged to 'next' on 2023-05-06 at 598ed19c9b)
 + notes.c: introduce "--[no-]stripspace" option
 + notes.c: append separator instead of insert by pos
 + notes.c: introduce '--separator=3D<paragraph-break>' option
 + t3321: add test cases about the notes stripspace behavior
 + notes.c: use designated initializers for clarity
 + notes.c: cleanup 'strbuf_grow' call in 'append_edit'

 'git notes append' was taught '--separator' to specify string to insert
 between paragraphs.

 Will merge to 'master'.
 source: <cover.1682671758.git.dyroneteng@gmail.com>


* pw/rebase-i-after-failure (2023-04-21) 6 commits
 - rebase -i: fix adding failed command to the todo list
 - rebase: fix rewritten list for failed pick
 - rebase --continue: refuse to commit after failed command
 - sequencer: factor out part of pick_commits()
 - rebase -i: remove patch file after conflict resolution
 - rebase -i: move unlink() calls

 Various fixes to the behaviour of "rebase -i" when the command got
 interrupted by conflicting changes.

 Expecting a reroll.
 cf. <xmqqsfcthrpb.fsf@gitster.g>
 cf. <1fd54422-b66a-c2e4-7cd7-934ea01190ad@gmail.com>
 source: <pull.1492.v2.git.1682089074.gitgitgadget@gmail.com>


* sl/sparse-write-tree-part-2 (2023-05-08) 1 commit
 - t1092: update a write-tree test

 Fix-up to a topic already graduated to 'master'.

 Will merge to 'next'?
 source: <20230508202140.464363-1-cheskaqiqi@gmail.com>


* tb/pack-bitmap-traversal-with-boundary (2023-05-08) 3 commits
 - pack-bitmap.c: use commit boundary during bitmap traversal
 - pack-bitmap.c: extract `fill_in_bitmap()`
 - object: add object_array initializer helper function

 The object traversal using reachability bitmap done by
 "pack-object" has been tweaked to take advantage of the fact that
 using "boundary" commits as representative of all the uninteresting
 ones can save quite a lot of object enumeration.
 source: <cover.1683567065.git.me@ttaylorr.com>


* gc/doc-cocci-updates (2023-04-27) 2 commits
 - cocci: codify authoring and reviewing practices
 - cocci: add headings to and reword README

 Update documentation regarding Coccinelle patches.

 Will merge to 'next'?
 source: <pull.1495.v2.git.git.1682634143.gitgitgadget@gmail.com>


* pb/complete-and-document-auto-merge-and-friends (2023-04-14) 5 commits
  (merged to 'next' on 2023-04-20 at 2728a01622)
 + completion: complete AUTO_MERGE
 + Documentation: document AUTO_MERGE
 + git-merge.txt: modernize word choice in "True merge" section
 + completion: complete REVERT_HEAD and BISECT_HEAD
 + revisions.txt: document more special refs

 Document more pseudo-refs and teach the command line completion
 machinery to complete AUTO_MERGE.

 On hold, waiting for a fix-up.
 cf. <a10648d5-8cba-4c7c-a303-b5b0dcdd3310@gmail.com>
 source: <pull.1515.git.1681495119.gitgitgadget@gmail.com>


* mh/credential-password-expiry-libsecret (2023-05-05) 1 commit
  (merged to 'next' on 2023-05-09 at fd898e3756)
 + credential/libsecret: support password_expiry_utc

 The libsecret credential helper learns to handle the password
 expiry time information.

 On hold.
 The database gets littered with entries whose expiration dates only diff=
er.
 cf. <CAGJzqskMwOJkriH6serqdwAVYi+fftEL8ohJd-suP6v+OxB_bg@mail.gmail.com>
 source: <pull.1469.v3.git.git.1683270298313.gitgitgadget@gmail.com>

--------------------------------------------------
[Discarded]

* ed/fsmonitor-inotify (2022-12-13) 6 commits
 . fsmonitor: update doc for Linux
 . fsmonitor: test updates
 . fsmonitor: enable fsmonitor for Linux
 . fsmonitor: implement filesystem change listener for Linux
 . fsmonitor: determine if filesystem is local or remote
 . fsmonitor: prepare to share code between Mac OS and Linux

 Bundled fsmonitor for Linux using inotify API.

 Seems to break asan job at CI when merged to 'seen'.
 cf. <xmqqzg7d8xn2.fsf@gitster.g>
 source: <pull.1352.v5.git.git.1670882286.gitgitgadget@gmail.com>


* my/wildmatch-cleanups (2023-02-27) 5 commits
 . wildmatch: more cleanups after killing uchar
 . wildmatch: use char instead of uchar
 . wildmatch: remove NEGATE_CLASS(2) macros with trivial refactoring
 . wildmatch: remove IS*() macros
 . git-compat-util: add isblank() and isgraph()

 Code clean-up.

 Discarded without prejudice after more than 6 weeks of inactivity.
 source: <20230226115021.1681834-1-masahiroy@kernel.org>


* cw/forbid-use-of-gitlink-outside-submodules (2023-02-28) 6 commits
 . add: reject nested repositories
 . tests: remove duplicate .gitmodules path
 . tests: use `git submodule add` and fix expected status
 . tests: use `git submodule add` and fix expected diffs
 . tests: Use `git submodule add` instead of `git add`
 . t4041, t4060: modernize test style

 Forbid "git add dir" from adding a gitlink to the index.

 Discarded without prejudice after more than 6 weeks of inactivity.
 source: <20230228185253.2356546-1-calvinwan@google.com>


* nw/for-each-ref-signature (2023-03-13) 1 commit
 . ref-filter: add new "signature" atom

 "git (for-each-ref|branch|tag) --format=3D<format>" learns the "%(signat=
ure)"
 placeholder and friends.

 Breaks CI.
 cf. <xmqqpm9bosjw.fsf@gitster.g>
 source: <20230311210607.64927-2-nsengiyumvawilberforce@gmail.com>


* fc/asciidoc-code-block-hack (2023-05-04) 2 commits
 . doc: manpage: remove ancient workaround
 . doc: git-svn: use listing instead of verse

 Documentation toolchain lost an ancient workaround that is no
 longer needed.

 The contributor is no longer with the project.
 source: <20230504035517.329765-1-felipe.contreras@gmail.com>


* fc/doc-revisions-markup-fix (2023-05-04) 2 commits
 . doc: revisions: add a bunch of missing quotes
 . doc: revisions: fix missing escape

 Doc cleanup.

 The contributor is no longer with the project.
 source: <20230504163421.100400-1-felipe.contreras@gmail.com>
