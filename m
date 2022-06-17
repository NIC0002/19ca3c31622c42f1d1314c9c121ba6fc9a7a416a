Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F6A0C43334
	for <git@archiver.kernel.org>; Fri, 17 Jun 2022 00:15:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379011AbiFQAPl (ORCPT <rfc822;git@archiver.kernel.org>);
        Thu, 16 Jun 2022 20:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbiFQAPh (ORCPT <rfc822;git@vger.kernel.org>);
        Thu, 16 Jun 2022 20:15:37 -0400
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 572A81758A
        for <git@vger.kernel.org>; Thu, 16 Jun 2022 17:15:35 -0700 (PDT)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 8EDC219220D;
        Thu, 16 Jun 2022 20:15:34 -0400 (EDT)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to
        :subject:date:message-id:mime-version:content-type; s=sasl; bh=N
        l41d5gG/p9GRHK0jLgUaw+ohJfY2Kzei8PZEF9aoUo=; b=qOeoeyiDESWpvXKou
        oRvRuBzuHgZOgksaQpuIjca3iCm7YtQT5g5EdC87Sls2SzQYRT1eXSUFHBrb/VPp
        i7nUTdUM1qeHqCfxnAFW+7GA1ZtjqrATN/5MnVI9MvcOH2iqAXVV/YkrMkId8CNV
        pfyae8vI8LtKSQJ3NjNpL9Sk9A=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 875DE19220B;
        Thu, 16 Jun 2022 20:15:34 -0400 (EDT)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [34.82.80.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp21.pobox.com (Postfix) with ESMTPSA id E69BD192209;
        Thu, 16 Jun 2022 20:15:30 -0400 (EDT)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Jun 2022, #05; Thu, 16)
X-master-at: 3b9a5a33c2986522736d484da497ccd99d715220
X-next-at: 10f37bed90c8150629a8f2f8f37966f953baf262
Date:   Thu, 16 Jun 2022 17:15:29 -0700
Message-ID: <xmqqy1xwp2la.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID: 99203FB2-EDD2-11EC-8C9D-CBA7845BAAA9-77302942!pb-smtp21.pobox.com
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Here are the topics that have been cooking in my tree.  Commits
prefixed with '+' are in 'next' (being in 'next' is a sign that a
topic is stable enough to be used and are candidate to be in a
future release).  Commits prefixed with '-' are only in 'seen',
and aren't considered "accepted" at all.

The first -rc for this cycle is expected to be tagged tomorrow.

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

* fs/ssh-default-key-command-doc (2022-06-08) 1 commit
  (merged to 'next' on 2022-06-10 at b5cc5b6619)
 + gpg docs: explain better use of ssh.defaultKeyCommand

 Doc update.
 source: <20220608152437.126276-1-fs@gigacodes.de>


* jc/revert-show-parent-info (2022-05-31) 2 commits
  (merged to 'next' on 2022-06-07 at e405211ff4)
 + revert: --reference should apply only to 'revert', not 'cherry-pick'
  (merged to 'next' on 2022-05-30 at b5da52dc14)
 + revert: optionally refer to commit in the "reference" format

 "git revert" learns "--reference" option to use more human-readable
 reference to the commit it reverts in the message template it
 prepares for the user.
 source: <xmqq8rqn7buk.fsf_-_@gitster.g>


* po/rebase-preserve-merges (2022-06-06) 4 commits
  (merged to 'next' on 2022-06-10 at 471f67aebc)
 + rebase: translate a die(preserve-merges) message
 + rebase: note `preserve` merges may be a pull config option
 + rebase: help users when dying with `preserve-merges`
 + rebase.c: state preserve-merges has been removed

 Various error messages that talk about the removal of
 "--preserve-merges" in "rebase" have been strengthened, and "rebase
 --abort" learned to get out of a state that was left by an earlier
 use of the option.
 source: <pull.1242.v2.git.1654341469.gitgitgadget@gmail.com>

--------------------------------------------------
[New Topics]

* ab/credentials-in-url-more (2022-06-15) 2 commits
  (merged to 'next' on 2022-06-16 at de19b3b40c)
 + transfer doc: move fetch.credentialsInUrl to "transfer" config namespace
 + fetch doc: note "pushurl" caveat about "credentialsInUrl", elaborate

 Rename fetch.credentialsInUrl to transfer.credentialsInUrl as the
 single configuration variable should work both in pushing and
 fetching.

 Will merge to 'master'.
 source: <cover-0.2-00000000000-20220615T103852Z-avarab@gmail.com>


* ds/more-test-coverage (2022-06-16) 4 commits
  (merged to 'next' on 2022-06-16 at 3f0452418c)
 + cache-tree: remove cache_tree_find_path()
 + pack-write: drop always-NULL parameter
 + t5329: test 'git gc --cruft' without '--prune=now'
 + t2107: test 'git update-index --verbose'

 Improve test coverage with a handful of tests.

 Will merge to 'master'.
 source: <pull.1261.v2.git.1655385230.gitgitgadget@gmail.com>


* jk/remote-show-with-negative-refspecs (2022-06-15) 1 commit
 - remote: handle negative refspecs in git remote show

 "git remote show [-n] frotz" now pays attention to negative
 pathspecs.
 source: <20220614003251.16765-1-jacob.e.keller@intel.com>


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


* jk/perf-lib-test-titles (2022-06-16) 1 commit
  (merged to 'next' on 2022-06-16 at 064d7efa99)
 + perf-lib: fix missing test titles in output

 Show test titles to the performance test output again.

 Will merge to 'master'.
 source: <YqrXLO5oMYeOr2PB@coredump.intra.peff.net>


* js/misc-fixes (2022-06-16) 6 commits
  (merged to 'next' on 2022-06-16 at 2f1f98e403)
 + relative_url(): fix incorrect condition
 + pack-mtimes: avoid closing a bogus file descriptor
 + read_index_from(): avoid memory leak
 + submodule--helper: avoid memory leak when fetching submodules
 + submodule-config: avoid memory leak
 + fsmonitor: avoid memory leak in `fsm_settings__get_incompatible_msg()`

 Assorted fixes to problems found by Coverity.

 Will merge to 'master'.
 source: <pull.1264.git.1655336146.gitgitgadget@gmail.com>


* ro/mktree-allow-missing-fix (2022-06-16) 1 commit
 - mktree: do not load objects under '--missing'

 "git mktree --missing" lazily fetched objects that are missing from
 the local object store, which was totally unnecessary.

 Waiting for review response.
 source: <1566aed1-a38f-a9ca-241c-21b56d732328@roku.com>


* jk/bug-fl-va-list-fix (2022-06-16) 1 commit
  (merged to 'next' on 2022-06-16 at 8150aebb0f)
 + bug_fl(): correctly initialize trace2 va_list

 Fix buggy va_list usage in recent code.

 Will merge to 'master'.
 source: <YquMyakxYnU6mI5a@coredump.intra.peff.net>

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

* jc/apply-icase-tests (2022-06-13) 1 commit
 - t4141: test "git apply" with core.ignorecase

 source: <xmqqo7yw77qo.fsf@gitster.g>


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
 - archive-tar: use internal gzip by default
 - archive-tar: use OS_CODE 3 (Unix) for internal gzip
 - archive-tar: add internal gzip implementation
 - archive-tar: factor out write_block()
 - archive: rename archiver data field to filter_command
 - archive: update format documentation

 Teach "git archive" to (optionally and then by default) avoid
 spawning an external "gzip" process when creating ".tar.gz" (and
 ".tgz") archives.

 Will merge to 'next'.
 source: <9df761c3-355a-ede9-7971-b32687fe9abb@web.de>


* tl/pack-bitmap-trace (2022-06-13) 5 commits
 - bitmap: add trace2 outputs during open "bitmap" file
 - pack-bitmap.c: using error() instead of silently returning -1
 - pack-bitmap.c: make warnings support i18N when opening bitmap
 - pack-bitmap.c: rename "idx_name" to "bitmap_name"
 - pack-bitmap.c: continue looping when first MIDX bitmap is found

 Add trace2 traces in code paths involving the pack bitmaps.

 Needs review.
 source: <cover.1655018322.git.dyroneteng@gmail.com>


* ds/branch-checked-out (2022-06-15) 5 commits
 - branch: fix branch_checked_out() leaks
 - branch: use branch_checked_out() when deleting refs
 - fetch: use new branch_checked_out() and add tests
 - branch: check for bisects and rebases
 - branch: add branch_checked_out() helper

 Introduce a helper to see if a branch is already being worked on
 (hence should not be newly checked out in a working tree), which
 performs much better than the existing find_shared_symref() to
 replace many uses of the latter.

 Will merge to 'next'.
 source: <pull.1254.v2.git.1655234853.gitgitgadget@gmail.com>


* js/ci-github-workflow-markup (2022-06-13) 3 commits
  (merged to 'next' on 2022-06-15 at 03eb5e68ed)
 + ci(github): also mark up compile errors
 + ci(github): use grouping also in the `win-build` job
 + ci(github): bring back the 'print test failures' step

 Recent CI update hides certain failures in test jobs, which has
 been corrected.

 Will merge to 'master'?
 source: <pull.1253.v2.git.1655125988.gitgitgadget@gmail.com>


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

 Will merge to 'master'?
 source: <xmqqfskdieqz.fsf@gitster.g>


* jp/prompt-clear-before-upstream-mark (2022-06-10) 2 commits
  (merged to 'next' on 2022-06-15 at e580db03e9)
 + git-prompt: fix expansion of branch colour codes
  (merged to 'next' on 2022-06-08 at 201a84ad63)
 + git-prompt: make colourization consistent

 Bash command line prompt (in contrib/) update.

 Will merge to 'master'?
 source: <20220607115024.64724-1-joak-pet@online.no>


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


* jc/cocci-cleanup (2022-06-07) 1 commit
  (merged to 'next' on 2022-06-16 at 990576f5c5)
 + cocci: retire is_null_sha1() rule

 Remove a coccinelle rule that is no longer relevant.

 Will merge to 'master'.
 source: <xmqq7d5suoqt.fsf@gitster.g>


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


* cb/path-owner-check-with-sudo-plus (2022-05-12) 1 commit
 - git-compat-util: allow root to access both SUDO_UID and root owned

 "sudo git foo" used to consider a repository owned by the original
 user a safe one to access; it now also considers a repository owned
 by root a safe one, too (after all, if an attacker can craft a
 malicious repository owned by root, the box is 0wned already).

 Will merge to 'next'?
 cf. <20220519152344.ktrifm3pc42bjruh@Carlos-MacBook-Pro-2.local>
 source: <20220513010020.55361-5-carenas@gmail.com>


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


* gg/worktree-from-the-above (2022-05-20) 3 commits
 - dir: minor refactoring / clean-up
 - dir: cache git_dir's realpath
 - dir: traverse into repository

 With a non-bare repository, with core.worktree pointing at a
 directory that has the repository as its subdirectory, regressed in
 Git 2.27 days.

 Needs review.
 source: <20220520192840.8942-1-ggossdev@gmail.com>


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
