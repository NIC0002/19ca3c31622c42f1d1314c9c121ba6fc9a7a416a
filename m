Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7225BC43334
	for <git@archiver.kernel.org>; Wed, 22 Jun 2022 19:34:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359101AbiFVTeG (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 22 Jun 2022 15:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377785AbiFVTds (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 22 Jun 2022 15:33:48 -0400
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF66B40E45
        for <git@vger.kernel.org>; Wed, 22 Jun 2022 12:32:18 -0700 (PDT)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id ACA6712E6C8;
        Wed, 22 Jun 2022 15:32:14 -0400 (EDT)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to
        :subject:date:message-id:mime-version:content-type; s=sasl; bh=T
        rSR+usvnip2vo6e5DryB80Kc8ZfbqTD+aDBOo0z2F8=; b=oDEwsu4bbCf4Bhppt
        GWsGBlaHN5OHWfPcvlykKy829Y6jCPNMAUbcOXnqgktkHRVPwBgLkWAPyhpTNs9z
        Yg61r1D/hgs500IA8bY6f1Y8fuv9c6XqlXQ4iRn7tM+pPRkVu2q9LM2fjBvhrxyN
        DcTP6EbOc+MCC8lZpRzRQyZreE=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id A38F712E6C7;
        Wed, 22 Jun 2022 15:32:14 -0400 (EDT)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [34.82.80.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp1.pobox.com (Postfix) with ESMTPSA id E0B8912E6C5;
        Wed, 22 Jun 2022 15:32:13 -0400 (EDT)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Jun 2022, #07; Wed, 22)
X-master-at: f770e9f396d48b567ef7b37d273e91ad570a3522
X-next-at: 5c70b8d9af74545ad2b62bd035c293f139c02a5c
Date:   Wed, 22 Jun 2022 12:32:12 -0700
Message-ID: <xmqq7d584hqb.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID: 04975288-F262-11EC-A970-5E84C8D8090B-77302942!pb-smtp1.pobox.com
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Here are the topics that have been cooking in my tree.  Commits
prefixed with '+' are in 'next' (being in 'next' is a sign that a
topic is stable enough to be used and are candidate to be in a
future release).  Commits prefixed with '-' are only in 'seen',
and aren't considered "accepted" at all.

Git 2.37-rc2 has been tagged.  Due to summer vacation season in the
northern hemisphere, this cycle is shorter than usual.  We expect to
tag the final 2.37 release early next week.  Hopefully we fixed all
the known regressions in 2.36 without adding too many new ones.

Some new topics are still marked for 'next', but the merges of them
obviously will happen in the next cycle---they will not be in the
upcoming release.

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

* dr/i18n-die-warn-error-usage (2022-06-21) 1 commit
 - i18n: mark message helpers prefix for translation

 Give _() markings to fatal/warning/usage: that is shown in front of
 these messages.

 Will merge to 'next'?
 source: <pull.1279.v2.git.git.1655819877758.gitgitgadget@gmail.com>


* ds/t5510-brokequote (2022-06-21) 1 commit
 - t5510: replace 'origin' with URL more carefully

 Test fix.
 source: <484a330e-0902-6e1b-8189-63c72dcea494@github.com>


* en/merge-restore-to-pristine (2022-06-21) 6 commits
 - merge: do not exit restore_state() prematurely
 - merge: ensure we can actually restore pre-merge state
 - merge: make restore_state() restore staged state too
 - merge: fix save_state() to work when there are racy-dirty files
 - merge: remove unused variable
 - t6424: make sure a failed merge preserves local changes

 When "git merge" finds that it cannot perform a merge, it should
 restore the working tree to the state before the command was
 initiated, but in some corner cases it didn't.

 Needs review.
 source: <pull.1231.v2.git.1655621424.gitgitgadget@gmail.com>


* rs/combine-diff-with-incompatible-options (2022-06-21) 2 commits
 - combine-diff: abort if --output is given
 - combine-diff: abort if --ignore-matching-lines is given

 Certain diff options are currently ignored when combined-diff is
 shown; mark them as incompatible with the feature.

 Will merge to 'next'?
 source: <220524.86v8tuvfl1.gmgdl@evledraar.gmail.com>


* tk/apply-case-insensitive (2022-06-21) 3 commits
 - apply: support case-only renames in case-insensitive filesystems
 - reset: new failing test for reset of case-insensitive duplicate in index
 - t4141: test "git apply" with core.ignorecase

 "git apply" barfed on a patch that makes a case-only rename on a
 case-insensitive filesystem.

 Needs review.
 source: <pull.1257.v2.git.1655655027.gitgitgadget@gmail.com>


* zh/ls-files-format (2022-06-21) 1 commit
 - ls-files: introduce "--format" option

 "git ls-files" learns the "--format" option to tweak its output.

 Needs review.
 source: <pull.1262.v3.git.1655777140231.gitgitgadget@gmail.com>


* ab/test-quoting-fix (2022-06-21) 3 commits
 - config tests: fix harmless but broken "rm -r" cleanup
 - test-lib.sh: fix prepend_var() quoting issue
 - tests: add missing double quotes to included library paths

 Fixes for tests when the source directory has unusual characters in
 its path, e.g. whitespaces, double-quotes, etc.

 Expecting a reroll.
 source: <cover-0.3-00000000000-20220621T221928Z-avarab@gmail.com>


* en/merge-dual-dir-renames-fix (2022-06-21) 3 commits
 - merge-ort: fix issue with dual rename and add/add conflict
 - merge-ort: shuffle the computation and cleanup of potential collisions
 - t6423: add tests of dual directory rename plus add/add conflict

 Fixes a long-standing corner case bug around directory renames in
 the merge-ort strategy.

 Needs review.
 source: <pull.1268.git.1655871651.gitgitgadget@gmail.com>

--------------------------------------------------
[Graduated to 'master']

* jp/prompt-clear-before-upstream-mark (2022-06-10) 2 commits
  (merged to 'next' on 2022-06-15 at e580db03e9)
 + git-prompt: fix expansion of branch colour codes
  (merged to 'next' on 2022-06-08 at 201a84ad63)
 + git-prompt: make colourization consistent

 Bash command line prompt (in contrib/) update.
 source: <20220607115024.64724-1-joak-pet@online.no>


* tb/cruft-packs (2022-06-21) 1 commit
  (merged to 'next' on 2022-06-21 at 0703251124)
 + gc: simplify --cruft description

 Docfix.
 source: <157741e2-cd06-9304-bb21-c67c2cbd923e@web.de>

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

* cr/setup-bug-typo (2022-06-17) 1 commit
  (merged to 'next' on 2022-06-17 at 8834ffe0ab)
 + setup: fix function name in a BUG() message

 Typofix in a BUG() message.

 Will cook in 'next'.
 source: <pull.1255.git.1654782920256.gitgitgadget@gmail.com>


* zk/push-use-bitmaps (2022-06-17) 1 commit
 - send-pack.c: add config push.useBitmaps

 "git push" sometimes perform poorly when reachability bitmaps are
 used, even in a repository where other operations are helped by
 bitmaps.  The push.useBitmaps configuration variable is introduced
 to allow disabling use of reachability bitmaps only for "git push".

 Will merge to 'next'?
 source: <pull.1263.v4.git.1655492779228.gitgitgadget@gmail.com>


* jk/remote-show-with-negative-refspecs (2022-06-17) 1 commit
 - remote: handle negative refspecs in git remote show
 (this branch is used by jk/t5505-restructure.)

 "git remote show [-n] frotz" now pays attention to negative
 pathspecs.

 Will merge to 'next'?
 source: <20220617002036.1577-2-jacob.keller@gmail.com>


* js/commit-graph-parsing-without-repo-settings (2022-06-15) 1 commit
 - commit-graph: refactor to avoid prepare_repo_settings

 source: <9b56496b0809cc8a25af877ea97042e2cb7f2af6.1655246092.git.steadmon@google.com>


* jk/optim-promisor-object-enumeration (2022-06-16) 1 commit
  (merged to 'next' on 2022-06-16 at ce0712a74c)
 + is_promisor_object(): walk promisor packs in pack-order

 Collection of what is referenced by objects in promisor packs have
 been optimized to inspect these objects in the in-pack order.

 Will cook in 'next'.
 source: <YqrTsbXbEjx0Pabn@coredump.intra.peff.net>


* ro/mktree-allow-missing-fix (2022-06-21) 1 commit
 - mktree: do not check type of remote objects

 "git mktree --missing" lazily fetched objects that are missing from
 the local object store, which was totally unnecessary.

 Will merge to 'next'?
 source: <748f39a9-65aa-2110-cf92-7ddf81b5f507@roku.com>


* ll/curl-accept-language (2022-06-13) 2 commits
 - PREP??? give initializer to rpc_state
 - remote-curl: send Accept-Language header to server

 source: <pull.1251.v3.git.1655054421697.gitgitgadget@gmail.com>


* pb/diff-doc-raw-format (2022-06-13) 3 commits
 - diff-index.txt: update raw output format in examples
 - diff-format.txt: correct misleading wording
 - diff-format.txt: dst can be 0* SHA-1 when path is deleted, too

 source: <pull.1259.git.1655123383.gitgitgadget@gmail.com>


* rs/archive-with-internal-gzip (2022-06-15) 6 commits
  (merged to 'next' on 2022-06-17 at ab5af6acd1)
 + archive-tar: use internal gzip by default
 + archive-tar: use OS_CODE 3 (Unix) for internal gzip
 + archive-tar: add internal gzip implementation
 + archive-tar: factor out write_block()
 + archive: rename archiver data field to filter_command
 + archive: update format documentation

 Teach "git archive" to (optionally and then by default) avoid
 spawning an external "gzip" process when creating ".tar.gz" (and
 ".tgz") archives.

 Will cook in 'next'.
 source: <9df761c3-355a-ede9-7971-b32687fe9abb@web.de>


* ds/branch-checked-out (2022-06-21) 7 commits
  (merged to 'next' on 2022-06-21 at e42bc4566f)
 + branch: drop unused worktrees variable
 + fetch: stop passing around unused worktrees variable
  (merged to 'next' on 2022-06-17 at c881874257)
 + branch: fix branch_checked_out() leaks
 + branch: use branch_checked_out() when deleting refs
 + fetch: use new branch_checked_out() and add tests
 + branch: check for bisects and rebases
 + branch: add branch_checked_out() helper

 Introduce a helper to see if a branch is already being worked on
 (hence should not be newly checked out in a working tree), which
 performs much better than the existing find_shared_symref() to
 replace many uses of the latter.

 Will cook in 'next'.
 source: <pull.1254.v2.git.1655234853.gitgitgadget@gmail.com>


* jt/connected-show-missing-from-which-side (2022-06-10) 1 commit
 - fetch,fetch-pack: clarify connectivity check error

 We may find an object missing after a "git fetch" stores the
 objects it obtained from the other side, but it is not necessarily
 because the remote failed to send necessary objects.  Reword the
 messages in an attempt to help users explore other possibilities
 when they hit this error.

 Expecting a reroll.
 source: <20220610195247.1177549-1-jonathantanmy@google.com>


* gc/submodule-update (2022-06-15) 12 commits
 - git-sh-setup.sh: remove "say" function, change last users
 - git-submodule.sh: use "$quiet", not "$GIT_QUIET"
 - submodule--helper: eliminate internal "--update" option
 - submodule--helper: understand --checkout, --merge and --rebase synonyms
 - submodule--helper: report "submodule" as our name in "-h" output
 - submodule--helper: rename "absorb-git-dirs" to "absorbgitdirs"
 - submodule update: remove "-v" option
 - submodule--helper: have --require-init imply --init
 - git-submodule.sh: remove unused top-level "--branch" argument
 - git-submodule.sh: make "$cached" variable a boolean
 - git-submodule.sh: remove unused $prefix var and --super-prefix
 - git-submodule.sh: remove unused sanitize_submodule_env()

 More work on "git submodule update".

 Needs review.
 source: <cover-v2-00.12-00000000000-20220613T220150Z-avarab@gmail.com>


* jc/resolve-undo (2022-06-09) 1 commit
  (merged to 'next' on 2022-06-15 at c195e5a2d9)
 + revision: mark blobs needed for resolve-undo as reachable

 The resolve-undo information in the index was not protected against
 GC, which has been corrected.

 Will cook in 'next'.
 source: <xmqqfskdieqz.fsf@gitster.g>


* ab/build-gitweb (2022-06-02) 7 commits
 - Makefile: build 'gitweb' in the default target
 - gitweb/Makefile: include in top-level Makefile
 - gitweb: remove "test" and "test-installed" targets
 - gitweb/Makefile: prepare to merge into top-level Makefile
 - gitweb/Makefile: clear up and de-duplicate the gitweb.{css,js} vars
 - gitweb/Makefile: add a $(GITWEB_ALL) variable
 - gitweb/Makefile: define all .PHONY prerequisites inline

 Teach "make all" to build gitweb as well.

 Needs review.
 source: <cover-v2-0.7-00000000000-20220531T173805Z-avarab@gmail.com>


* ab/test-without-templates (2022-06-06) 7 commits
 - tests: don't assume a .git/info for .git/info/sparse-checkout
 - tests: don't assume a .git/info for .git/info/exclude
 - tests: don't assume a .git/info for .git/info/refs
 - tests: don't assume a .git/info for .git/info/attributes
 - tests: don't assume a .git/info for .git/info/grafts
 - tests: don't depend on template-created .git/branches
 - t0008: don't rely on default ".git/info/exclude"

 Tweak tests so that they still work when the "git init" template
 did not create .git/info directory.

 Will merge to 'next'?
 source: <cover-v2-0.7-00000000000-20220603T110506Z-avarab@gmail.com>


* ac/bitmap-format-doc (2022-06-16) 3 commits
  (merged to 'next' on 2022-06-16 at 5591d11601)
 + bitmap-format.txt: add information for trailing checksum
 + bitmap-format.txt: fix some formatting issues
 + bitmap-format.txt: feed the file to asciidoc to generate html

 Adjust technical/bitmap-format to be formatted by AsciiDoc, and
 add some missing information to the documentation.

 Will cook in 'next'.
 source: <pull.1246.v4.git.1655355834.gitgitgadget@gmail.com>


* hx/unpack-streaming (2022-06-13) 6 commits
 - unpack-objects: use stream_loose_object() to unpack large objects
 - core doc: modernize core.bigFileThreshold documentation
 - object-file.c: add "stream_loose_object()" to handle large object
 - object-file.c: factor out deflate part of write_loose_object()
 - object-file.c: refactor write_loose_object() to several steps
 - unpack-objects: low memory footprint for get_data() in dry_run mode

 Allow large objects read from a packstream to be streamed into a
 loose object file straight, without having to keep it in-core as a
 whole.

 Will merge to 'next'?
 source: <cover.1654914555.git.chiyutianyi@gmail.com>


* tb/show-ref-count (2022-06-06) 2 commits
 - builtin/show-ref.c: limit output with `--count`
 - builtin/show-ref.c: rename `found_match` to `matches_nr`

 "git show-ref" learned to stop after emitting N refs with the new
 "--count=N" option.

 Expecting a reroll.
 cf. <xmqqczfl4ce1.fsf@gitster.g>
 source: <cover.1654552560.git.me@ttaylorr.com>


* ds/bundle-uri-more (2022-06-06) 6 commits
 - fetch: add 'refs/bundle/' to log.excludeDecoration
 - bundle-uri: add support for http(s):// and file://
 - fetch: add --bundle-uri option
 - bundle-uri: create basic file-copy logic
 - remote-curl: add 'get' capability
 - docs: document bundle URI standard

 The "bundle URI" topic.

 Needs review.
 source: <pull.1248.git.1654545325.gitgitgadget@gmail.com>


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

 The command line parsing is reported to be still broken.
 cf. <220521.86zgjazuy4.gmgdl@evledraar.gmail.com>
 source: <pull.1132.v3.git.1653144546.gitgitgadget@gmail.com>


* gc/bare-repo-discovery (2022-06-07) 5 commits
 - setup.c: create `discovery.bare`
 - safe.directory: use git_protected_config()
 - config: read protected config with `git_protected_config()`
 - Documentation: define protected configuration
 - Documentation/git-config.txt: add SCOPES section

 Introduce a discovery.barerepository configuration variable that
 allows users to forbid discovery of bare repositories.

 Expecting a reroll.
 cf. <xmqqbkv4t7gp.fsf@gitster.g>
 source: <29053d029f8ec61095a2ad557be38b1d485a158f.1654635432.git.gitgitgadget@gmail.com>


* gg/worktree-from-the-above (2022-06-21) 2 commits
 - dir: minor refactoring / clean-up
 - dir: traverse into repository

 With a non-bare repository, with core.worktree pointing at a
 directory that has the repository as its subdirectory, regressed in
 Git 2.27 days.

 Will merge to 'next'.
 source: <20220616234433.225-1-gg.oss@outlook.com>
 source: <20220616231956.154-1-gg.oss@outlook.com>


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

--------------------------------------------------
[Discarded]

* jc/apply-icase-tests (2022-06-13) 1 commit
 . t4141: test "git apply" with core.ignorecase

 Now a part of tk/apply-case-insensitive topic.
 source: <xmqqo7yw77qo.fsf@gitster.g>


* tl/pack-bitmap-trace (2022-06-21) 5 commits
 . bitmap: add trace2 outputs during open "bitmap" file
 . pack-bitmap.c: using error() instead of silently returning -1
 . pack-bitmap.c: make warnings support i18N when opening bitmap
 . pack-bitmap.c: rename "idx_name" to "bitmap_name"
 . pack-bitmap.c: continue looping when first MIDX bitmap is found

 Add trace2 traces in code paths involving the pack bitmaps.

 source: <cover.1655817253.git.dyroneteng@gmail.com>


