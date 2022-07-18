Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C13C43334
	for <git@archiver.kernel.org>; Mon, 18 Jul 2022 03:14:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbiGRDOS (ORCPT <rfc822;git@archiver.kernel.org>);
        Sun, 17 Jul 2022 23:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiGRDOR (ORCPT <rfc822;git@vger.kernel.org>);
        Sun, 17 Jul 2022 23:14:17 -0400
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F7322620
        for <git@vger.kernel.org>; Sun, 17 Jul 2022 20:14:14 -0700 (PDT)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 062401BA00D
        for <git@vger.kernel.org>; Sun, 17 Jul 2022 23:14:12 -0400 (EDT)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to
        :subject:date:message-id:mime-version:content-type; s=sasl; bh=0
        XOt9dAuhWpm2xGupa6nyxZlxNVIMu7NA4GaPcN0gJE=; b=Ad1DrLPgG+6hb4t6s
        Xxm48likRSb0U0sLF4gp6FqSiIkWdJQ5LIvFhrxfEFMmxTWUoHjlPHhdIsC766KL
        a3q2Kkdt/cv/3qvnJTeMXvNePuzgLm/sWivXnmCbwjkSVFO7+Y837lFu4AySaLLU
        gDtcOsUg+ZoCgFULVQk96S4wZs=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id E72D71BA00C
        for <git@vger.kernel.org>; Sun, 17 Jul 2022 23:14:11 -0400 (EDT)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [34.83.92.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 9C7BF1BA00B
        for <git@vger.kernel.org>; Sun, 17 Jul 2022 23:14:08 -0400 (EDT)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <jch@google.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Jul 2022, #05; Sun, 17)
X-master-at: 9dd64cb4d310986dd7b8ca7fff92f9b61e0bd21a
X-next-at: 4dd4a117ecf0e90cdeac8c0e51a870de51791f4a
Date:   Sun, 17 Jul 2022 20:14:07 -0700
Message-ID: <xmqq7d4bt8n4.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID: B02D5ACC-0647-11ED-B49C-CBA7845BAAA9-77302942!pb-smtp21.pobox.com
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

* ab/submodule-cleanup (2022-06-28) 12 commits
  (merged to 'next' on 2022-07-08 at 6f3886aa03)
 + git-sh-setup.sh: remove "say" function, change last users
 + git-submodule.sh: use "$quiet", not "$GIT_QUIET"
 + submodule--helper: eliminate internal "--update" option
 + submodule--helper: understand --checkout, --merge and --rebase synonyms
 + submodule--helper: report "submodule" as our name in some "-h" output
 + submodule--helper: rename "absorb-git-dirs" to "absorbgitdirs"
 + submodule update: remove "-v" option
 + submodule--helper: have --require-init imply --init
 + git-submodule.sh: remove unused top-level "--branch" argument
 + git-submodule.sh: make the "$cached" variable a boolean
 + git-submodule.sh: remove unused $prefix variable
 + git-submodule.sh: remove unused sanitize_submodule_env()
 (this branch is used by gc/submodule-use-super-prefix.)

 Further preparation to turn git-submodule.sh into a builtin.
 source: <cover-v4-00.12-00000000000-20220628T095914Z-avarab@gmail.com>


* en/merge-tree (2022-06-22) 17 commits
  (merged to 'next' on 2022-07-08 at a29b4896ab)
 + git-merge-tree.txt: add a section on potentional usage mistakes
 + merge-tree: add a --allow-unrelated-histories flag
 + merge-tree: allow `ls-files -u` style info to be NUL terminated
 + merge-ort: optionally produce machine-readable output
 + merge-ort: store more specific conflict information
 + merge-ort: make `path_messages` a strmap to a string_list
 + merge-ort: store messages in a list, not in a single strbuf
 + merge-tree: provide easy access to `ls-files -u` style info
 + merge-tree: provide a list of which files have conflicts
 + merge-ort: remove command-line-centric submodule message from merge-ort
 + merge-ort: provide a merge_get_conflicted_files() helper function
 + merge-tree: support including merge messages in output
 + merge-ort: split out a separate display_update_messages() function
 + merge-tree: implement real merges
 + merge-tree: add option parsing and initial shell for real merge function
 + merge-tree: move logic for existing merge into new function
 + merge-tree: rename merge_trees() to trivial_merge_trees()

 "git merge-tree" learned a new mode where it takes two commits and
 computes a tree that would result in the merge commit, if the
 histories leading to these two commits were to be merged.
 source: <pull.1122.v7.git.1655511660.gitgitgadget@gmail.com>


* gg/worktree-from-the-above (2022-06-21) 2 commits
  (merged to 'next' on 2022-07-08 at fa0e71ba39)
 + dir: minor refactoring / clean-up
 + dir: traverse into repository

 In a non-bare repository, the behavior of Git when the
 core.worktree configuration variable points at a directory that has
 a repository as its subdirectory, regressed in Git 2.27 days.
 source: <20220616234433.225-1-gg.oss@outlook.com>
 source: <20220616231956.154-1-gg.oss@outlook.com>


* hx/unpack-streaming (2022-06-13) 6 commits
  (merged to 'next' on 2022-07-08 at 4eb375ec2f)
 + unpack-objects: use stream_loose_object() to unpack large objects
 + core doc: modernize core.bigFileThreshold documentation
 + object-file.c: add "stream_loose_object()" to handle large object
 + object-file.c: factor out deflate part of write_loose_object()
 + object-file.c: refactor write_loose_object() to several steps
 + unpack-objects: low memory footprint for get_data() in dry_run mode

 Allow large objects read from a packstream to be streamed into a
 loose object file straight, without having to keep it in-core as a
 whole.
 source: <cover.1654914555.git.chiyutianyi@gmail.com>


* sy/mv-out-of-cone (2022-07-01) 8 commits
  (merged to 'next' on 2022-07-08 at 654970fdb7)
 + mv: add check_dir_in_index() and solve general dir check issue
 + mv: use flags mode for update_mode
 + mv: check if <destination> exists in index to handle overwriting
 + mv: check if out-of-cone file exists in index with SKIP_WORKTREE bit
 + mv: decouple if/else-if checks using goto
 + mv: update sparsity after moving from out-of-cone to in-cone
 + t1092: mv directory from out-of-cone to in-cone
 + t7002: add tests for moving out-of-cone file/directory

 "git mv A B" in a sparsely populated working tree can be asked to
 move a path between directories that are "in cone" (i.e. expected
 to be materialized in the working tree) and "out of cone"
 (i.e. expected to be hidden).  The handling of such cases has been
 improved.
 source: <20220630023737.473690-1-shaoxuan.yuan02@gmail.com>

--------------------------------------------------
[New Topics]

* js/ci-github-workflow-markup (2022-07-14) 1 commit
  (merged to 'next' on 2022-07-15 at 196166f671)
 + tests: fix incorrect --write-junit-xml code

 A fix for a regression in test framework.

 Will merge to 'master'.
 source: <pull.1288.git.1657789234416.gitgitgadget@gmail.com>


* js/shortlog-sort-stably (2022-07-14) 1 commit
  (merged to 'next' on 2022-07-15 at 75e4efe678)
 + shortlog: use a stable sort

 "git shortlog -n" relied on the underlying qsort() to be stable,
 which shouldn't have.  Fixed.

 Will merge to 'master'.
 source: <pull.1290.git.1657813429221.gitgitgadget@gmail.com>


* mt/doc-config (2022-07-14) 3 commits
 - doc: notes: unify configuration variables definitions
 - doc: apply: unify configuration variables definitions
 - doc: grep: unify configuration variables definitions

 Unify description of configuration variables used by individual
 commands in the documentation of the commands and the documentation
 of the "git config".

 Retracted?.
 cf. <CAHd-oW4zHA1YLX-5B1vYTA1f8PocziUCi0WxvSEkFUuf2GqKxg@mail.gmail.com>
 source: <cover.1657819649.git.matheus.bernardino@usp.br>


* rs/mingw-tighten-mkstemp (2022-07-14) 1 commit
  (merged to 'next' on 2022-07-15 at 4dd4a117ec)
 + mingw: avoid mktemp() in mkstemp() implementation

 mkstemp() emulation on Windows has been improved.

 Will merge to 'master'.
 source: <7265e37f-fd29-3579-b840-19a1df52a59f@web.de>


* jt/fetch-pack-trace2-filter-spec (2022-07-15) 1 commit
 - fetch-pack: write effective filter to trace2

 "git fetch" client logs the partial clone filter used in the trace2
 output.

 Will merge to 'next'?
 source: <20220715172943.2681492-1-jonathantanmy@google.com>


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

 source: <4d7cd286-398e-215c-f2bd-aa7e8207be4f@web.de>

--------------------------------------------------
[Stalled]

* ll/curl-accept-language (2022-07-11) 1 commit
  (merged to 'next' on 2022-07-13 at 076aba7421)
 + remote-curl: send Accept-Language header to server

 Earlier, HTTP transport clients learned to tell the server side
 what locale they are in by sending Accept-Language HTTP header, but
 this was done only for some requests but not others.

 Will merge to 'master'.
 source: <pull.1251.v4.git.1657519134336.gitgitgadget@gmail.com>


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

* jk/diff-files-cleanup-fix (2022-07-12) 1 commit
  (merged to 'next' on 2022-07-13 at 9db5235d01)
 + diff-files: move misplaced cleanup label

 An earlier attempt to plug leaks placed a clean-up label to jump to
 at a bogus place, which as been corrected.

 Will merge to 'master'.
 source: <Ys0c0ePxPOqZ/5ck@coredump.intra.peff.net>


* cw/submodule-merge-messages (2022-07-13) 1 commit
 - submodule merge: update conflict error message

 Update the message given when "git merge" sees conflicts at a path
 with a submodule while merging a superproject.

 Needs review.
 source: <20220712231935.2979727-1-calvinwan@google.com>


* ds/doc-wo-whitelist (2022-07-14) 3 commits
 - *: avoid "whitelist"
 - t/*: avoid "whitelist"
 - Documentation: remove use of whitelist

 Avoid "white/black-list" in documentation and code comments.

 Will merge to 'next'?
 source: <pull.1274.v2.git.1657852722.gitgitgadget@gmail.com>


* js/vimdiff-quotepath-fix (2022-07-14) 1 commit
  (merged to 'next' on 2022-07-15 at 4273bbd4b4)
 + mergetool(vimdiff): allow paths to contain spaces again

 Variable quoting fix in the vimdiff driver of "git mergetool"

 Will merge to 'master'.
 source: <pull.1287.v2.git.1657809063728.gitgitgadget@gmail.com>


* mt/checkout-count-fix (2022-07-14) 3 commits
 - checkout: fix two bugs on the final count of updated entries
 - checkout: show bug about failed entries being included in final report
 - checkout: document bug where delayed checkout counts entries twice

 "git checkout" miscounted the paths it updated, which has been
 corrected.

 Will merge to 'next'?
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


* rs/cocci-array-copy (2022-07-10) 1 commit
  (merged to 'next' on 2022-07-13 at f21dec0f71)
 + cocci: avoid normalization rules for memcpy

 A coccinelle rule (in contrib/) to encourage use of COPY_ARRAY
 macro has been improved.

 Will merge to 'master'.
 source: <ded153d4-4aea-d4da-11cb-ec66d181e4c9@web.de>


* sg/multi-pack-index-parse-options-fix (2022-07-10) 1 commit
  (merged to 'next' on 2022-07-11 at 1e14685680)
 + multi-pack-index: simplify handling of unknown --options

 The way "git multi-pack" uses parse-options API has been improved.

 Will merge to 'master'.
 source: <20220710151645.GA2038@szeder.dev>


* jk/ref-filter-discard-commit-buffer (2022-07-11) 1 commit
  (merged to 'next' on 2022-07-13 at d1521724db)
 + ref-filter: disable save_commit_buffer while traversing

 Will merge to 'master'.
 source: <Ysw4JtoHW1vWmqhz@coredump.intra.peff.net>


* ab/cocci-unused (2022-07-06) 6 commits
  (merged to 'next' on 2022-07-11 at 7fa60d2a5b)
 + cocci: generalize "unused" rule to cover more than "strbuf"
 + cocci: add and apply a rule to find "unused" strbufs
 + cocci: have "coccicheck{,-pending}" depend on "coccicheck-test"
 + cocci: add a "coccicheck-test" target and test *.cocci rules
 + Makefile & .gitignore: ignore & clean "git.res", not "*.res"
 + Makefile: remove mandatory "spatch" arguments from SPATCH_FLAGS

 Add Coccinelle rules to detect the pattern of initializing and then
 finalizing a structure without using it in between at all, which
 happens after code restructuring and the compilers fail to
 recognize as an unused varilable.

 Will merge to 'master'.
 source: <cover-v4-0.6-00000000000-20220705T134033Z-avarab@gmail.com>


* jk/clone-unborn-confusion (2022-07-11) 4 commits
  (merged to 'next' on 2022-07-13 at a7ae8cb4b5)
 + clone: move unborn head creation to update_head()
 + clone: use remote branch if it matches default HEAD
 + clone: propagate empty remote HEAD even with other branches
 + clone: drop extra newline from warning message

 "git clone" from a repository with some ref whose HEAD is unborn
 did not set the HEAD in the resulting repository correctly, which
 has been corrected.

 Will merge to 'master'.
 source: <YsdyLS4UFzj0j/wB@coredump.intra.peff.net>


* ac/bitmap-lookup-table (2022-07-06) 6 commits
 - p5310-pack-bitmaps.sh: remove pack.writeReverseIndex
 - bitmap-lookup-table: add performance tests for lookup table
 - pack-bitmap: prepare to read lookup table extension
 - pack-bitmap-write: learn pack.writeBitmapLookupTable and add tests
 - pack-bitmap-write.c: write lookup table extension
 - Documentation/technical: describe bitmap lookup table extension

 The pack bitmap file gained a bitmap-lookup table to speed up
 locating the necessary bitmap for a given commit.

 Waiting for a more thorough review.
 cf. <Ys4DjW9JjQFx5Bhb@nand.local>
 source: <pull.1266.v3.git.1656924376.gitgitgadget@gmail.com>


* bc/nettle-sha256 (2022-07-10) 1 commit
  (merged to 'next' on 2022-07-11 at cf9595d8ca)
 + sha256: add support for Nettle

 Support for libnettle as SHA256 implementation has been added.

 Will merge to 'master'.
 source: <20220710132907.1499365-1-sandals@crustytoothpaste.net>


* jc/builtin-mv-move-array (2022-07-09) 1 commit
  (merged to 'next' on 2022-07-09 at 0d3b3f62e5)
 + builtin/mv.c: use the MOVE_ARRAY() macro instead of memmove()

 Apply Coccinelle rule to turn raw memmove() into MOVE_ARRAY() cpp
 macro, which would improve maintainability and readability.

 Will merge to 'master'.
 source: <xmqq4jzpu4xp.fsf_-_@gitster.g>


* jd/gpg-interface-trust-level-string (2022-07-10) 1 commit
  (merged to 'next' on 2022-07-11 at 7b3cca73a8)
 + gpg-interface: add function for converting trust level to string

 The code to convert between GPG trust level strings and internal
 constants we use to represent them have been cleaned up.

 Will merge to 'master'.
 source: <pull.1281.v4.git.1657515650587.gitgitgadget@gmail.com>


* kk/p4-client-name-encoding-fix (2022-07-08) 1 commit
  (merged to 'next' on 2022-07-11 at 9c18616f76)
 + git-p4: fix bug with encoding of p4 client name

 "git p4" did not handle non-ASCII client name well, which has been
 corrected.

 Will merge to 'master'.
 source: <pull.1285.git.git.1657267260405.gitgitgadget@gmail.com>


* sa/cat-file-mailmap (2022-07-17) 4 commits
 - cat-file: add mailmap support
 - ident: rename commit_rewrite_person() to apply_mailmap_to_header()
 - ident: move commit_rewrite_person() to ident.c
 - revision: improve commit_rewrite_person()

 "git cat-file" learned an option to use the mailmap when showing
 commit and tag objects.

 Expecting a reroll; I think this is almost there.
 cf. <xmqqo7xnv17x.fsf@gitster.g>
 source: <20220716074055.1786231-1-siddharthasthana31@gmail.com>


* fr/vimdiff-layout-fix (2022-07-08) 1 commit
  (merged to 'next' on 2022-07-09 at d8461bd236)
 + vimdiff: make layout engine more robust against user vim settings

 Recent update to vimdiff layout code has been made more robust
 against different end-user vim settings.

 Will merge to 'master'.
 source: <20220708181024.45839-1-greenfoo@u92.eu>


* ds/rebase-update-ref (2022-07-12) 13 commits
 - sequencer: notify user of --update-refs activity
 - sequencer: ignore HEAD ref under --update-refs
 - rebase: add rebase.updateRefs config option
 - sequencer: rewrite update-refs as user edits todo list
 - rebase: update refs from 'update-ref' commands
 - rebase: add --update-refs option
 - sequencer: add update-ref command
 - sequencer: define array with enum values
 - rebase-interactive: update 'merge' description
 - branch: consider refs under 'update-refs'
 - t2407: test branches currently using apply backend
 - t2407: test bisect and rebase as black-boxes
 - Merge branch 'ds/branch-checked-out' into ds/rebase-update-ref

 "git rebase -i" learns to update branches whose tip appear in the
 rebased range.

 Will merge to 'next'?
 source: <pull.1247.v4.git.1657631225.gitgitgadget@gmail.com>


* ab/leakfix (2022-07-01) 11 commits
  (merged to 'next' on 2022-07-11 at 0b107fffcf)
 + pull: fix a "struct oid_array" memory leak
 + cat-file: fix a common "struct object_context" memory leak
 + gc: fix a memory leak
 + checkout: avoid "struct unpack_trees_options" leak
 + merge-file: fix memory leaks on error path
 + merge-file: refactor for subsequent memory leak fix
 + cat-file: fix a memory leak in --batch-command mode
 + revert: free "struct replay_opts" members
 + submodule.c: free() memory from xgetcwd()
 + clone: fix memory leak in wanted_peer_refs()
 + check-ref-format: fix trivial memory leak

 Plug various memory leaks.

 Will merge to 'master'.
 source: <cover-v2-00.11-00000000000-20220701T104017Z-avarab@gmail.com>


* ab/test-tool-leakfix (2022-07-01) 9 commits
  (merged to 'next' on 2022-07-11 at db7a724694)
 + test-tool delta: fix a memory leak
 + test-tool ref-store: fix a memory leak
 + test-tool bloom: fix memory leaks
 + test-tool json-writer: fix memory leaks
 + test-tool regex: call regfree(), fix memory leaks
 + test-tool urlmatch-normalization: fix a memory leak
 + test-tool {dump,scrap}-cache-tree: fix memory leaks
 + test-tool path-utils: fix a memory leak
 + test-tool test-hash: fix a memory leak

 Plug various memory leaks in test-tool commands.

 Will merge to 'master'.
 source: <cover-v2-0.9-00000000000-20220701T103503Z-avarab@gmail.com>


* gc/submodule-use-super-prefix (2022-06-30) 8 commits
  (merged to 'next' on 2022-07-11 at 0d9cf172f9)
 + submodule--helper: remove display path helper
 + submodule--helper update: use --super-prefix
 + submodule--helper: remove unused SUPPORT_SUPER_PREFIX flags
 + submodule--helper: use correct display path helper
 + submodule--helper: don't recreate recursive prefix
 + submodule--helper update: use display path helper
 + submodule--helper tests: add missing "display path" coverage
 + Merge branch 'ab/submodule-cleanup' into gc/submodule-use-super-prefix

 Another step to rewrite more parts of "git submodule" in C.

 Will merge to 'master'.
 source: <20220701021157.88858-1-chooglen@google.com>


* hx/lookup-commit-in-graph-fix (2022-07-12) 2 commits
  (merged to 'next' on 2022-07-13 at 4489696814)
 + t5330: remove run_with_limited_processses()
  (merged to 'next' on 2022-07-08 at cef32db0b6)
 + commit-graph.c: no lazy fetch in lookup_commit_in_graph()

 A corner case bug where lazily fetching objects from a promisor
 remote resulted in infinite recursion has been corrected.

 Will merge to 'master'.
 source: <cover.1656593279.git.hanxin.hx@bytedance.com>


* pw/xdiff-alloc (2022-07-08) 4 commits
 - xdiff: introduce XDL_ALLOC_GROW()
 - xdiff: introduce XDL_CALLOC_ARRAY()
 - xdiff: introduce xdl_calloc
 - xdiff: introduce XDL_ALLOC_ARRAY()

 Add a level of redirection to array allocation API in xdiff part,
 to make it easier to share with the libgit2 project.

 Will merge to 'next'?
 source: <pull.1272.v2.git.1657297519.gitgitgadget@gmail.com>


* ab/squelch-empty-fsync-traces (2022-06-30) 1 commit
 . trace2: don't include "fsync" events in all trace2 logs

 Omit fsync-related trace2 entries when their values are all zero.

 Breaks tests in hx/unpack-streaming with an interesting interaction.
 source: <patch-v2-1.1-a1fc37de947-20220630T084607Z-avarab@gmail.com>


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


* tk/apply-case-insensitive (2022-06-21) 3 commits
 - apply: support case-only renames in case-insensitive filesystems
 - reset: new failing test for reset of case-insensitive duplicate in index
 - t4141: test "git apply" with core.ignorecase

 "git apply" barfed on a patch that makes a case-only rename on a
 case-insensitive filesystem.

 Needs review.
 source: <pull.1257.v2.git.1655655027.gitgitgadget@gmail.com>


* zh/ls-files-format (2022-07-13) 1 commit
 - ls-files: introduce "--format" option

 "git ls-files" learns the "--format" option to tweak its output.

 Will merge to 'next'?
 source: <pull.1262.v7.git.1657692472994.gitgitgadget@gmail.com>


* en/merge-dual-dir-renames-fix (2022-07-06) 5 commits
  (merged to 'next' on 2022-07-11 at 5f8dadf87b)
 + merge-ort: fix issue with dual rename and add/add conflict
 + merge-ort: shuffle the computation and cleanup of potential collisions
 + merge-ort: make a separate function for freeing struct collisions
 + merge-ort: small cleanups of check_for_directory_rename
 + t6423: add tests of dual directory rename plus add/add conflict

 Fixes a long-standing corner case bug around directory renames in
 the merge-ort strategy.

 Will merge to 'master'.
 source: <pull.1268.v4.git.1656984823.gitgitgadget@gmail.com>


* js/commit-graph-parsing-without-repo-settings (2022-07-14) 1 commit
 - commit-graph: pass repo_settings instead of repository

 API tweak to make it easier to run fuzz testing on commit-graph parser.

 Will merge to 'next'.
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


* jc/resolve-undo (2022-07-11) 2 commits
  (merged to 'next' on 2022-07-13 at b9ef9482e8)
 + fsck: do not dereference NULL while checking resolve-undo data
  (merged to 'next' on 2022-06-15 at c195e5a2d9)
 + revision: mark blobs needed for resolve-undo as reachable

 The resolve-undo information in the index was not protected against
 GC, which has been corrected.

 Will merge to 'master'.
 source: <xmqq35f7kzad.fsf@gitster.g>


* ab/build-gitweb (2022-06-28) 8 commits
  (merged to 'next' on 2022-07-11 at 731e354ff0)
 + gitweb/Makefile: add a "NO_GITWEB" parameter
 + Makefile: build 'gitweb' in the default target
 + gitweb/Makefile: include in top-level Makefile
 + gitweb: remove "test" and "test-installed" targets
 + gitweb/Makefile: prepare to merge into top-level Makefile
 + gitweb/Makefile: clear up and de-duplicate the gitweb.{css,js} vars
 + gitweb/Makefile: add a $(GITWEB_ALL) variable
 + gitweb/Makefile: define all .PHONY prerequisites inline

 Teach "make all" to build gitweb as well.

 Will merge to 'master'.
 source: <cover-v3-0.8-00000000000-20220628T100936Z-avarab@gmail.com>


* ab/test-without-templates (2022-06-06) 7 commits
  (merged to 'next' on 2022-07-11 at afab6c1918)
 + tests: don't assume a .git/info for .git/info/sparse-checkout
 + tests: don't assume a .git/info for .git/info/exclude
 + tests: don't assume a .git/info for .git/info/refs
 + tests: don't assume a .git/info for .git/info/attributes
 + tests: don't assume a .git/info for .git/info/grafts
 + tests: don't depend on template-created .git/branches
 + t0008: don't rely on default ".git/info/exclude"

 Tweak tests so that they still work when the "git init" template
 did not create .git/info directory.

 Will merge to 'master'.
 source: <cover-v2-0.7-00000000000-20220603T110506Z-avarab@gmail.com>


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


* gc/bare-repo-discovery (2022-07-14) 5 commits
  (merged to 'next' on 2022-07-15 at 5206577852)
 + setup.c: create `safe.bareRepository`
 + safe.directory: use git_protected_config()
 + config: learn `git_protected_config()`
 + Documentation: define protected configuration
 + Documentation/git-config.txt: add SCOPES section

 Introduce a discovery.barerepository configuration variable that
 allows users to forbid discovery of bare repositories.

 Will merge to 'master'.
 source: <pull.1261.v8.git.git.1657834081.gitgitgadget@gmail.com>

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
