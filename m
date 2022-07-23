Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3AC7C43334
	for <git@archiver.kernel.org>; Sat, 23 Jul 2022 01:01:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbiGWBBY (ORCPT <rfc822;git@archiver.kernel.org>);
        Fri, 22 Jul 2022 21:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiGWBBS (ORCPT <rfc822;git@vger.kernel.org>);
        Fri, 22 Jul 2022 21:01:18 -0400
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12CC41C902
        for <git@vger.kernel.org>; Fri, 22 Jul 2022 18:01:14 -0700 (PDT)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id 17A92140C00;
        Fri, 22 Jul 2022 21:01:12 -0400 (EDT)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to
        :subject:date:message-id:mime-version:content-type; s=sasl; bh=/
        8ju872SYlQsNAt6G+vhnrCXbm/WSc5xTOd4XZq5aKI=; b=Is40SR4VEgApkSuef
        RYACONJ+8ZEND3hj1wKWx1V5uI4zSr1BLJlLQRfarUKpeI5TyLcfS4ilEfWSJKOo
        jkFePUgkVt6W9LkciZFFLU2q2ZALxvIrQKTwELIMPfWbKWaQ+peDyWGnYmi33IAL
        6U9WAwDLE7GukyVSvqld42UJFw=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id 0F41E140BFF;
        Fri, 22 Jul 2022 21:01:12 -0400 (EDT)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [34.105.40.190])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 66C8F140BFE;
        Fri, 22 Jul 2022 21:01:11 -0400 (EDT)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <junio@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Jul 2022, #07; Fri, 22)
X-master-at: 6a475b71f8c4ce708d69fdc9317aefbde3769e25
X-next-at: a8f742fd52ac1e242fca73527be643aa60514c94
Date:   Fri, 22 Jul 2022 18:01:10 -0700
Message-ID: <xmqqh738bq21.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID: F172C966-0A22-11ED-9FE8-5E84C8D8090B-77302942!pb-smtp1.pobox.com
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Here are the topics that have been cooking in my tree.  Commits
prefixed with '+' are in 'next' (being in 'next' is a sign that a
topic is stable enough to be used and are candidate to be in a
future release).  Commits prefixed with '-' are only in 'seen',
and aren't considered "accepted" at all.

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

* gc/bare-repo-discovery (2022-07-14) 5 commits
  (merged to 'next' on 2022-07-15 at 5206577852)
 + setup.c: create `safe.bareRepository`
 + safe.directory: use git_protected_config()
 + config: learn `git_protected_config()`
 + Documentation: define protected configuration
 + Documentation/git-config.txt: add SCOPES section

 Introduce a discovery.barerepository configuration variable that
 allows users to forbid discovery of bare repositories.
 source: <pull.1261.v8.git.git.1657834081.gitgitgadget@gmail.com>


* js/ci-github-workflow-markup (2022-07-14) 1 commit
  (merged to 'next' on 2022-07-15 at 196166f671)
 + tests: fix incorrect --write-junit-xml code

 A fix for a regression in test framework.
 source: <pull.1288.git.1657789234416.gitgitgadget@gmail.com>


* js/shortlog-sort-stably (2022-07-14) 1 commit
  (merged to 'next' on 2022-07-15 at 75e4efe678)
 + shortlog: use a stable sort

 "git shortlog -n" relied on the underlying qsort() to be stable,
 which shouldn't have.  Fixed.
 source: <pull.1290.git.1657813429221.gitgitgadget@gmail.com>


* js/vimdiff-quotepath-fix (2022-07-14) 1 commit
  (merged to 'next' on 2022-07-15 at 4273bbd4b4)
 + mergetool(vimdiff): allow paths to contain spaces again

 Variable quoting fix in the vimdiff driver of "git mergetool"
 source: <pull.1287.v2.git.1657809063728.gitgitgadget@gmail.com>


* rs/mingw-tighten-mkstemp (2022-07-14) 1 commit
  (merged to 'next' on 2022-07-15 at 4dd4a117ec)
 + mingw: avoid mktemp() in mkstemp() implementation

 mkstemp() emulation on Windows has been improved.
 source: <7265e37f-fd29-3579-b840-19a1df52a59f@web.de>

--------------------------------------------------
[New Topics]

* ab/leak-check (2022-07-20) 14 commits
 - CI: use "GIT_TEST_SANITIZE_LEAK_LOG=true" in linux-leaks
 - upload-pack: fix a memory leak in create_pack_file()
 - leak tests: mark passing SANITIZE=leak tests as leak-free
 - test-lib: have the "check" mode for SANITIZE=leak consider leak logs
 - test-lib: add a GIT_TEST_PASSING_SANITIZE_LEAK=check mode
 - test-lib: simplify by removing test_external
 - tests: move copy/pasted PERL + Test::More checks to a lib-perl.sh
 - t/Makefile: don't remove test-results in "clean-except-prove-cache"
 - test-lib: add a SANITIZE=leak logging mode
 - t/README: reword the "GIT_TEST_PASSING_SANITIZE_LEAK" description
 - test-lib: add a --invert-exit-code switch
 - test-lib: fix GIT_EXIT_OK logic errors, use BAIL_OUT
 - test-lib: don't set GIT_EXIT_OK before calling test_atexit_handler
 - test-lib: use $1, not $@ in test_known_broken_{ok,failure}_

 Plugging more leaks.
 source: <cover-v2-00.14-00000000000-20220720T211221Z-avarab@gmail.com>


* mb/p4-fixes (2022-07-20) 2 commits
  (merged to 'next' on 2022-07-20 at 7942d72b1c)
 + git-p4: fix error handling in P4Unshelve.renameBranch()
 + git-p4: fix typo in P4Submit.applyCommit()

 Fix a few issues in "git p4".

 Will merge to 'master'.
 source: <pull.1297.v2.git.git.1658343330.gitgitgadget@gmail.com>


* mb/p4-utf16-crlf (2022-07-20) 1 commit
  (merged to 'next' on 2022-07-20 at c2fedd2fc2)
 + git-p4: fix CR LF handling for utf16 files

 "git p4" working on UTF-16 files on Windows did not implement
 CRLF-to-LF conversion correctly, which has been corrected.

 Will merge to 'master'.
 source: <pull.1294.v2.git.git.1658341065221.gitgitgadget@gmail.com>


* jc/string-list-cleanup (2022-07-20) 1 commit
 - builtin/remote.c: use the right kind of STRING_LIST_INIT

 Code clean-up.

 Will merge to 'next'.
 source: <xmqq7d471dns.fsf@gitster.g>


* mt/pkt-line-comment-tweak (2022-07-22) 1 commit
  (merged to 'next' on 2022-07-22 at 4004fa75eb)
 + pkt-line.h: move comment closer to the associated code

 In-code comment clarification.

 Will merge to 'master'.
 source: <6a14443c101fa132498297af6d7a483520688d75.1658488203.git.matheus.bernardino@usp.br>


* mt/rot13-in-c (2022-07-22) 3 commits
 - t/t0021: replace old rot13-filter.pl uses with new test-tool cmd
 - t/t0021: convert the rot13-filter.pl script to C
 - Merge branch 'mt/checkout-count-fix' into mt/rot13-in-c
 (this branch uses mt/checkout-count-fix.)

 Test portability improvements.

 Needs review.
 source: <cover.1658518769.git.matheus.bernardino@usp.br>


* tk/untracked-cache-with-uall (2022-07-22) 1 commit
 - read-cache: make `do_read_index()` always set up `istate->repo`

 Fix for a bug that makes write-tree to faile to write out a
 non-existent index as a tree, introduced in 2.37.

 Will merge to 'next'.
 source: <20220722212232.833188-1-martin.agren@gmail.com>

--------------------------------------------------
[Stalled]

* tk/apply-case-insensitive (2022-06-21) 3 commits
 - apply: support case-only renames in case-insensitive filesystems
 - reset: new failing test for reset of case-insensitive duplicate in index
 - t4141: test "git apply" with core.ignorecase

 "git apply" barfed on a patch that makes a case-only rename on a
 case-insensitive filesystem.

 Needs review.
 source: <pull.1257.v2.git.1655655027.gitgitgadget@gmail.com>


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

* ds/midx-with-less-memory (2022-07-19) 3 commits
  (merged to 'next' on 2022-07-20 at 250d257c3e)
 + midx: reduce memory pressure while writing bitmaps
 + midx: extract bitmap write setup
 + pack-bitmap-write: use const for hashes

 The codepath to write multi-pack index has been taught to release a
 large chunk of memory that holds an array of objects in the packs,
 as soon as it is done with the array, to reduce memory consumption.

 Will merge to 'master'.
 source: <pull.1292.v2.git.1658244366.gitgitgadget@gmail.com>


* ma/sparse-checkout-cone-doc-fix (2022-07-18) 1 commit
  (merged to 'next' on 2022-07-19 at c259b61b0e)
 + config/core.txt: fix minor issues for `core.sparseCheckoutCone`

 Docfix.

 Will merge to 'master'.
 source: <20220718100530.2068354-1-martin.agren@gmail.com>


* ma/t4200-update (2022-07-18) 1 commit
  (merged to 'next' on 2022-07-19 at 710d0cafd9)
 + t4200: drop irrelevant code

 Test fix.

 Will merge to 'master'.
 source: <20220718154322.2177166-1-martin.agren@gmail.com>


* mb/config-document-include (2022-07-17) 1 commit
  (merged to 'next' on 2022-07-19 at 8267b80aa2)
 + config.txt: document include, includeIf

 Add missing documentation for "include" and "includeIf" features in
 "git config" file format, which incidentally teachs the command
 line completion to include them in its offerings.

 Will merge to 'master'.
 source: <pull.1285.v2.git.1658002423864.gitgitgadget@gmail.com>


* sg/index-format-doc-update (2022-07-18) 1 commit
  (merged to 'next' on 2022-07-19 at ccc384be5e)
 + index-format.txt: remove outdated list of supported extensions

 Docfix.

 Will merge to 'master'.
 source: <20220718085640.7395-1-szeder.dev@gmail.com>


* tl/pack-bitmap-error-messages (2022-07-18) 6 commits
  (merged to 'next' on 2022-07-19 at 3f9565653a)
 + pack-bitmap.c: continue looping when first MIDX bitmap is found
 + pack-bitmap.c: using error() instead of silently returning -1
 + pack-bitmap.c: do not ignore error when opening a bitmap file
 + pack-bitmap.c: rename "idx_name" to "bitmap_name"
 + pack-bitmap.c: mark more strings for translations
 + pack-bitmap.c: fix formatting of error messages

 Tweak various messages that come from the pack-bitmap codepaths.

 Will merge to 'master'.
 source: <cover.1658159745.git.dyroneteng@gmail.com>


* tl/trace2-config-scope (2022-07-22) 2 commits
 - tr2: shows scope unconditionally in addition to key-value pair
 - api-trace2.txt: print config key-value pair

 Tweak trace2 output about configuration variables.

 Will merge to 'next'?
 source: <cover.1658472474.git.dyroneteng@gmail.com>


* vd/scalar-doc (2022-07-18) 2 commits
  (merged to 'next' on 2022-07-20 at fab0234da4)
 + scalar: convert README.md into a technical design doc
 + scalar: reword command documentation to clarify purpose

 Doc update.

 Will merge to 'master'.
 source: <pull.1275.v2.git.1657584367.gitgitgadget@gmail.com>


* cl/rerere-train-with-no-sign (2022-07-19) 1 commit
  (merged to 'next' on 2022-07-20 at fbb9414d09)
 + contrib/rerere-train: avoid useless gpg sign in training

 "rerere-train" script (in contrib/) used to honor commit.gpgSign
 while recreating the throw-away merges.

 Will merge to 'master'.
 source: <PH7PR14MB5594A27B9295E95ACA4D6A69CE8F9@PH7PR14MB5594.namprd14.prod.outlook.com>


* ds/win-syslog-compiler-fix (2022-07-19) 1 commit
  (merged to 'next' on 2022-07-20 at d38b649b18)
 + compat/win32: correct for incorrect compiler warning

 Workaround for a false positive compiler warning.

 Will merge to 'master'.
 source: <pull.1294.git.1658256354725.gitgitgadget@gmail.com>


* ld/osx-keychain-usage-fix (2022-07-19) 1 commit
  (merged to 'next' on 2022-07-20 at eebd316ef6)
 + osx-keychain: fix compiler warning

 Workaround for a compiler warning against use of die() in
 osx-keychain (in contrib/).

 Will merge to 'master'.
 source: <pull.1293.git.1658251503775.gitgitgadget@gmail.com>


* ab/submodule-helper-leakfix (2022-07-21) 26 commits
 - submodule--helper: fix a configure_added_submodule() leak
 - submodule--helper: fix bad config API usage
 - submodule--helper: free rest of "displaypath" in "struct update_data"
 - submodule--helper: don't exit() on failure, return
 - submodule--helper: add skeleton "goto cleanup" to update_submodule()
 - submodule--helper: rename "int res" to "int ret"
 - submodule--helper: free some "displaypath" in "struct update_data"
 - submodule--helper: fix a memory leak in print_status()
 - submodule--helper: fix a leak in module_add()
 - submodule--helper: fix obscure leak in module_add()
 - submodule--helper: fix "reference" leak is "module_clone_data"
 - submodule--helper: fix a memory leak in get_default_remote_submodule()
 - submodule--helper: fix a leak with repo_clear()
 - submodule--helper: fix "sm_path" and other "module_cb_list" leaks
 - submodule--helper: fix "errmsg_str" memory leak
 - submodule--helper: refactor "errmsg_str" to be a "struct strbuf"
 - submodule--helper: add and use *_release() functions
 - submodule--helper: add "const" to copy of "update_data"
 - submodule--helper: don't leak {run,capture}_command() cp.dir argument
 - submodule--helper: "struct pathspec" memory leak in module_update()
 - submodule--helper: fix most "struct pathspec" memory leaks
 - submodule--helper: fix trivial get_default_remote_submodule() leak
 - submodule--helper: fix a leak in "clone_submodule"
 - submodule--helper: pass a "const struct module_clone_data" to clone_submodule()
 - submodule--helper: stop conflating "sb" in clone_submodule()
 - submodule--helper: replace memset() with { 0 }-initialization

 Plugging leaks in submodule--helper.

 Getting there.
 source: <cover-v3-00.26-00000000000-20220721T191249Z-avarab@gmail.com>


* mt/doc-config (2022-07-14) 3 commits
 - doc: notes: unify configuration variables definitions
 - doc: apply: unify configuration variables definitions
 - doc: grep: unify configuration variables definitions

 Unify description of configuration variables used by individual
 commands in the documentation of the commands and the documentation
 of the "git config".

 Will discard (Retracted?).
 cf. <CAHd-oW4zHA1YLX-5B1vYTA1f8PocziUCi0WxvSEkFUuf2GqKxg@mail.gmail.com>
 source: <cover.1657819649.git.matheus.bernardino@usp.br>


* jt/fetch-pack-trace2-filter-spec (2022-07-18) 1 commit
 - fetch-pack: write effective filter to trace2

 "git fetch" client logs the partial clone filter used in the trace2
 output.

 Will merge to 'next'?
 source: <20220718170027.3993042-1-jonathantanmy@google.com>


* mb/doc-rerere-autoupdate (2022-07-15) 1 commit
 - cherry-pick doc: clarify no-rerere-autoupdate still allows rerere

 Clarifies that the "--no-rerere-autoupdate" option does not disable
 the "rerere" mechanism (nor does "--rerere-autoupdate" enable it).

 Will merge to 'next'?
 source: <20220715092527.1567837-1-mail@beyermatthias.de>


* rs/mergesort (2022-07-17) 10 commits
 - mergesort: remove llist_mergesort()
 - packfile: use DEFINE_LIST_SORT
 - fetch-pack: use DEFINE_LIST_SORT
 - commit: use DEFINE_LIST_SORT
 - blame: use DEFINE_LIST_SORT
 - test-mergesort: use DEFINE_LIST_SORT
 - test-mergesort: use DEFINE_LIST_SORT_DEBUG
 - mergesort: add macros for typed sort of linked lists
 - mergesort: tighten merge loop
 - mergesort: unify ranks loops

 Make our mergesort implementation type-safe.

 Will merge to 'next'?
 source: <4d7cd286-398e-215c-f2bd-aa7e8207be4f@web.de>


* cw/submodule-merge-messages (2022-07-18) 1 commit
 - submodule merge: update conflict error message

 Update the message given when "git merge" sees conflicts at a path
 with a submodule while merging a superproject.

 Needs review.
 source: <20220718214349.3379328-1-calvinwan@google.com>


* ds/doc-wo-whitelist (2022-07-19) 5 commits
  (merged to 'next' on 2022-07-20 at ec51c6269a)
 + transport.c: avoid "whitelist"
 + t: avoid "whitelist"
 + git.txt: remove redundant language
 + git-cvsserver: clarify directory list
 + daemon: clarify directory arguments

 Avoid "white/black-list" in documentation and code comments.

 Will merge to 'master'.
 source: <pull.1274.v3.git.1658255537.gitgitgadget@gmail.com>


* mt/checkout-count-fix (2022-07-14) 3 commits
  (merged to 'next' on 2022-07-22 at 60c73a6b0b)
 + checkout: fix two bugs on the final count of updated entries
 + checkout: show bug about failed entries being included in final report
 + checkout: document bug where delayed checkout counts entries twice
 (this branch is used by mt/rot13-in-c.)

 "git checkout" miscounted the paths it updated, which has been
 corrected.

 Will merge to 'master'.
 source: <cover.1657799213.git.matheus.bernardino@usp.br>


* tb/commit-graph-genv2-upgrade-fix (2022-07-15) 3 commits
 - commit-graph: fix corrupt upgrade from generation v1 to v2
 - commit-graph: introduce `repo_find_commit_pos_in_graph()`
 - t5318: demonstrate commit-graph generation v2 corruption

 There was a bug in the codepath to upgrade generation information
 in commit-graph from v1 to v2 format, which has been corrected.

 Will merge to 'next'?
 source: <cover.1657667404.git.me@ttaylorr.com>


* js/safe-directory-plus (2022-07-13) 3 commits
 - mingw: be more informative when ownership check fails on FAT32
 - mingw: handle a file owned by the Administrators group correctly
 - Allow debugging unsafe directories' ownership

 Needs review.
 source: <pull.1286.git.1657700238.gitgitgadget@gmail.com>


* po/doc-add-renormalize (2022-07-09) 1 commit
 - doc add: renormalize is not idempotent for CRCRLF

 Documentation for "git add --renormalize" has been improved.

 Expecting a reroll.
 cf. <dfe0c1ab-33f8-f13e-71ce-1829bb0d2d7f@iee.email>
 source: <d3b8ed97a105ea1d7e656c964b7eee378e11ede6.1657385781.git.gitgitgadget@gmail.com>


* po/glossary-around-traversal (2022-07-09) 3 commits
 - glossary: add reachability bitmap description
 - glossary: add commit graph description
 - glossary: add Object DataBase (ODB) abbreviation

 The glossary entries for "commit-graph file" and "reachability
 bitmap" have been added.

 Expecting a reroll.
 cf. <dfe0c1ab-33f8-f13e-71ce-1829bb0d2d7f@iee.email>
 source: <pull.1282.git.1657385781.gitgitgadget@gmail.com>


* ac/bitmap-lookup-table (2022-07-20) 6 commits
 - bitmap-lookup-table: add performance tests for lookup table
 - p5310-pack-bitmaps.sh: enable `pack.writeReverseIndex`
 - pack-bitmap: prepare to read lookup table extension
 - pack-bitmap-write: learn pack.writeBitmapLookupTable and add tests
 - pack-bitmap-write.c: write lookup table extension
 - Documentation/technical: describe bitmap lookup table extension

 The pack bitmap file gained a bitmap-lookup table to speed up
 locating the necessary bitmap for a given commit.

 Waiting for a more thorough review.
 cf. <Ys4DjW9JjQFx5Bhb@nand.local>
 source: <pull.1266.v4.git.1658325913.gitgitgadget@gmail.com>


* kk/p4-client-name-encoding-fix (2022-07-21) 2 commits
  (merged to 'next' on 2022-07-21 at 008518b4e5)
 + git-p4: refactoring of p4CmdList()
  (merged to 'next' on 2022-07-11 at 9c18616f76)
 + git-p4: fix bug with encoding of p4 client name

 "git p4" did not handle non-ASCII client name well, which has been
 corrected.

 Will merge to 'master'.
 source: <pull.1285.v3.git.git.1658394440.gitgitgadget@gmail.com>


* sa/cat-file-mailmap (2022-07-18) 4 commits
 - cat-file: add mailmap support
 - ident: rename commit_rewrite_person() to apply_mailmap_to_header()
 - ident: move commit_rewrite_person() to ident.c
 - revision: improve commit_rewrite_person()

 "git cat-file" learned an option to use the mailmap when showing
 commit and tag objects.

 Will merge to 'next'?
 source: <20220718195102.66321-1-siddharthasthana31@gmail.com>


* ds/rebase-update-ref (2022-07-19) 13 commits
  (merged to 'next' on 2022-07-20 at 9f4bf9ef6c)
 + sequencer: notify user of --update-refs activity
 + sequencer: ignore HEAD ref under --update-refs
 + rebase: add rebase.updateRefs config option
 + sequencer: rewrite update-refs as user edits todo list
 + rebase: update refs from 'update-ref' commands
 + rebase: add --update-refs option
 + sequencer: add update-ref command
 + sequencer: define array with enum values
 + rebase-interactive: update 'merge' description
 + branch: consider refs under 'update-refs'
 + t2407: test branches currently using apply backend
 + t2407: test bisect and rebase as black-boxes
 + Merge branch 'ds/branch-checked-out' into ds/rebase-update-ref

 "git rebase -i" learns to update branches whose tip appear in the
 rebased range.

 Will merge to 'master'.
 source: <pull.1247.v5.git.1658255624.gitgitgadget@gmail.com>


* pw/xdiff-alloc (2022-07-08) 4 commits
 - xdiff: introduce XDL_ALLOC_GROW()
 - xdiff: introduce XDL_CALLOC_ARRAY()
 - xdiff: introduce xdl_calloc
 - xdiff: introduce XDL_ALLOC_ARRAY()

 Add a level of redirection to array allocation API in xdiff part,
 to make it easier to share with the libgit2 project.

 Will merge to 'next'?
 source: <pull.1272.v2.git.1657297519.gitgitgadget@gmail.com>


* ab/squelch-empty-fsync-traces (2022-07-18) 1 commit
  (merged to 'next' on 2022-07-19 at f77cd40c29)
 + trace2: only include "fsync" events if we git_fsync()

 Omit fsync-related trace2 entries when their values are all zero.

 Will merge to 'master'.
 source: <patch-v3-1.1-979dea5956a-20220718T102747Z-avarab@gmail.com>


* en/merge-restore-to-pristine (2022-07-21) 7 commits
 - merge: do not exit restore_state() prematurely
 - merge: ensure we can actually restore pre-merge state
 - merge: make restore_state() restore staged state too
 - merge: fix save_state() to work when there are stat-dirty files
 - merge: do not abort early if one strategy fails to handle the merge
 - merge-resolve: abort if index does not match HEAD
 - merge-ort-wrappers: make printed message match the one from recursive

 When "git merge" finds that it cannot perform a merge, it should
 restore the working tree to the state before the command was
 initiated, but in some corner cases it didn't.

 Will merge to 'next'?
 source: <pull.1231.v3.git.1658391391.gitgitgadget@gmail.com>


* zh/ls-files-format (2022-07-20) 1 commit
 - ls-files: introduce "--format" option

 "git ls-files" learns the "--format" option to tweak its output.

 Will merge to 'next'?
 source: <pull.1262.v8.git.1658334983053.gitgitgadget@gmail.com>


* js/commit-graph-parsing-without-repo-settings (2022-07-14) 1 commit
  (merged to 'next' on 2022-07-19 at bcc29d823d)
 + commit-graph: pass repo_settings instead of repository

 API tweak to make it easier to run fuzz testing on commit-graph parser.

 Will merge to 'master'.
 source: <fd70b6119153b165a62ee4f693dbe47031cfb2be.1657834657.git.steadmon@google.com>


* jt/connected-show-missing-from-which-side (2022-06-10) 1 commit
 - fetch,fetch-pack: clarify connectivity check error

 We may find an object missing after a "git fetch" stores the
 objects it obtained from the other side, but it is not necessarily
 because the remote failed to send necessary objects.  Reword the
 messages in an attempt to help users explore other possibilities
 when they hit this error.

 Expecting a reroll.
 source: <20220610195247.1177549-1-jonathantanmy@google.com>


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


* js/bisect-in-c (2022-06-27) 16 commits
 - bisect: no longer try to clean up left-over `.git/head-name` files
 - bisect: remove Cogito-related code
 - Turn `git bisect` into a full built-in
 - bisect: move even the command-line parsing to `bisect--helper`
 - bisect: teach the `bisect--helper` command to show the correct usage strings
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
 - bisect: verify that a bogus option won't try to start a bisection

 Final bits of "git bisect.sh" have been rewritten in C.

 Expecting a (hopefully final) reroll.
 cf. <20627.86ilolhnnn.gmgdl@evledraar.gmail.com>
 source: <pull.1132.v4.git.1656354677.gitgitgadget@gmail.com>

--------------------------------------------------
[Discarded]

* ar/send-email-confirm-by-default (2022-04-22) 1 commit
 . send-email: always confirm by default

 "git send-email" is changed so that by default it asks for
 confirmation before sending each message out.

 Discarded.
 I wanted to like this, and had it in the version of Git I use
 myself for daily work, but the prompting turned out to be somewhat
 distracting.
 source: <20220422083629.1404989-1-hi@alyssa.is>
