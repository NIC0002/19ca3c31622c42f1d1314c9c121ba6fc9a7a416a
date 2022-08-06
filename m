Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB651C19F29
	for <git@archiver.kernel.org>; Sat,  6 Aug 2022 03:38:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239692AbiHFDiX (ORCPT <rfc822;git@archiver.kernel.org>);
        Fri, 5 Aug 2022 23:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236885AbiHFDiV (ORCPT <rfc822;git@vger.kernel.org>);
        Fri, 5 Aug 2022 23:38:21 -0400
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 423871BE86
        for <git@vger.kernel.org>; Fri,  5 Aug 2022 20:38:19 -0700 (PDT)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 56EDD19CAB8;
        Fri,  5 Aug 2022 23:38:18 -0400 (EDT)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to
        :subject:date:message-id:mime-version:content-type; s=sasl; bh=0
        drOBlEHRG00EpD3jNV6qtBRN3mrzrcZvqLwfM6U56c=; b=uroW4DzvbPyvxpaKe
        N30A0AjCV7vne6GXFZKh/lQMsxmeQceQQyRDUmdvhwjSTfNlt/HRn2NytiN6q/oU
        m8saErVCmQG6vSNfFDNUpGm2FPl2O0syzCC5LkkhHjQzNaywLKsqj0V10By3KrXz
        kK51CeuAqWy4CyiOJdyk3voMx0=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 4206319CAB7;
        Fri,  5 Aug 2022 23:38:18 -0400 (EDT)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [34.145.39.32])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 5CD8619CAB5;
        Fri,  5 Aug 2022 23:38:14 -0400 (EDT)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Aug 2022, #02; Fri, 5)
X-master-at: 679aad9e82d0dfd8ef3d1f98fa4629665496cec9
X-next-at: 8b5581f2bb185e8784b9bfb4e62049927bff10d8
Date:   Fri, 05 Aug 2022 20:38:12 -0700
Message-ID: <xmqqa68ixcrf.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID: 33C0FBA0-1539-11ED-8372-CBA7845BAAA9-77302942!pb-smtp21.pobox.com
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Here are the topics that have been cooking in my tree.  Commits
prefixed with '+' are in 'next' (being in 'next' is a sign that a
topic is stable enough to be used and are candidate to be in a
future release).  Commits prefixed with '-' are only in 'seen',
and aren't considered "accepted" at all.

A handful of topics have graduated to the 'master' track, and half a
dozen topics are now in 'next' to cook.  We are at the end of Week
#4 of a 12-week cycle (cf. https://tinyurl.com/gitCal).

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

* ds/midx-with-less-memory (2022-07-27) 4 commits
  (merged to 'next' on 2022-07-27 at 9ac7aed9f6)
 + write_midx_bitmap(): drop unused refs_snapshot parameter
  (merged to 'next' on 2022-07-20 at 250d257c3e)
 + midx: reduce memory pressure while writing bitmaps
 + midx: extract bitmap write setup
 + pack-bitmap-write: use const for hashes

 The codepath to write multi-pack index has been taught to release a
 large chunk of memory that holds an array of objects in the packs,
 as soon as it is done with the array, to reduce memory consumption.
 source: <pull.1292.v2.git.1658244366.gitgitgadget@gmail.com>


* en/merge-restore-to-pristine (2022-07-22) 8 commits
  (merged to 'next' on 2022-07-27 at daafc50c15)
 + merge: do not exit restore_state() prematurely
 + merge: ensure we can actually restore pre-merge state
 + merge: make restore_state() restore staged state too
 + merge: fix save_state() to work when there are stat-dirty files
 + merge: do not abort early if one strategy fails to handle the merge
 + merge: abort if index does not match HEAD for trivial merges
 + merge-resolve: abort if index does not match HEAD
 + merge-ort-wrappers: make printed message match the one from recursive

 When "git merge" finds that it cannot perform a merge, it should
 restore the working tree to the state before the command was
 initiated, but in some corner cases it didn't.
 source: <pull.1231.v5.git.1658541198.gitgitgadget@gmail.com>


* gc/bare-repo-discovery (2022-07-26) 1 commit
  (merged to 'next' on 2022-07-28 at 1d2bef98f6)
 + config.c: NULL check when reading protected config

 Fix-up for what has been merged to 'master' recently.
 source: <pull.1299.v2.git.git.1658874067077.gitgitgadget@gmail.com>


* jc/string-list-cleanup (2022-07-20) 1 commit
  (merged to 'next' on 2022-07-27 at 858a0b2a28)
 + builtin/remote.c: use the right kind of STRING_LIST_INIT

 Code clean-up.
 source: <xmqq7d471dns.fsf@gitster.g>


* jr/gitweb-title-shortening (2022-07-26) 1 commit
  (merged to 'next' on 2022-07-28 at 7528e87220)
 + gitweb: remove title shortening heuristics

 Gitweb had legacy URL shortener that is specific to the way
 projects hosted on kernel.org used to (but no longer) work, which
 has been removed.
 source: <20220726135911.ycvgwbkixb3ei6w3@jrouhaud>


* jt/fetch-pack-trace2-filter-spec (2022-07-26) 1 commit
  (merged to 'next' on 2022-07-28 at 8e6237d6b0)
 + fetch-pack: write effective filter to trace2

 "git fetch" client logs the partial clone filter used in the trace2
 output.
 source: <20220726162712.1774355-1-jonathantanmy@google.com>


* pw/xdiff-alloc (2022-07-08) 4 commits
  (merged to 'next' on 2022-07-25 at 92a39a5ff2)
 + xdiff: introduce XDL_ALLOC_GROW()
 + xdiff: introduce XDL_CALLOC_ARRAY()
 + xdiff: introduce xdl_calloc
 + xdiff: introduce XDL_ALLOC_ARRAY()

 Add a level of redirection to array allocation API in xdiff part,
 to make it easier to share with the libgit2 project.
 source: <pull.1272.v2.git.1657297519.gitgitgadget@gmail.com>


* rs/mergesort (2022-07-17) 10 commits
  (merged to 'next' on 2022-07-27 at 42607a44bb)
 + mergesort: remove llist_mergesort()
 + packfile: use DEFINE_LIST_SORT
 + fetch-pack: use DEFINE_LIST_SORT
 + commit: use DEFINE_LIST_SORT
 + blame: use DEFINE_LIST_SORT
 + test-mergesort: use DEFINE_LIST_SORT
 + test-mergesort: use DEFINE_LIST_SORT_DEBUG
 + mergesort: add macros for typed sort of linked lists
 + mergesort: tighten merge loop
 + mergesort: unify ranks loops

 Make our mergesort implementation type-safe.
 source: <4d7cd286-398e-215c-f2bd-aa7e8207be4f@web.de>


* sa/cat-file-mailmap (2022-07-18) 4 commits
  (merged to 'next' on 2022-07-27 at 59c4eb32b3)
 + cat-file: add mailmap support
 + ident: rename commit_rewrite_person() to apply_mailmap_to_header()
 + ident: move commit_rewrite_person() to ident.c
 + revision: improve commit_rewrite_person()

 "git cat-file" learned an option to use the mailmap when showing
 commit and tag objects.
 source: <20220718195102.66321-1-siddharthasthana31@gmail.com>


* tb/cat-file-z (2022-07-22) 2 commits
  (merged to 'next' on 2022-07-28 at 78731f0fdb)
 + builtin/cat-file.c: support NUL-delimited input with `-z`
 + t1006: extract --batch-command inputs to variables

 Operating modes like "--batch" of "git cat-file" command learned to
 take NUL-terminated input, instead of one-item-per-line.
 source: <cover.1658532524.git.me@ttaylorr.com>


* tb/commit-graph-genv2-upgrade-fix (2022-07-15) 3 commits
  (merged to 'next' on 2022-07-25 at e3464c2c1d)
 + commit-graph: fix corrupt upgrade from generation v1 to v2
 + commit-graph: introduce `repo_find_commit_pos_in_graph()`
 + t5318: demonstrate commit-graph generation v2 corruption

 There was a bug in the codepath to upgrade generation information
 in commit-graph from v1 to v2 format, which has been corrected.
 source: <cover.1657667404.git.me@ttaylorr.com>


* tk/untracked-cache-with-uall (2022-07-22) 1 commit
  (merged to 'next' on 2022-07-25 at b792dd5012)
 + read-cache: make `do_read_index()` always set up `istate->repo`

 Fix for a bug that makes write-tree to fail to write out a
 non-existent index as a tree, introduced in 2.37.
 source: <20220722212232.833188-1-martin.agren@gmail.com>


* zh/ls-files-format (2022-07-23) 1 commit
  (merged to 'next' on 2022-07-27 at b7301f16ce)
 + ls-files: introduce "--format" option

 "git ls-files" learns the "--format" option to tweak its output.
 source: <pull.1262.v9.git.1658558685407.gitgitgadget@gmail.com>

--------------------------------------------------
[New Topics]

* lt/symbolic-ref-sanity (2022-08-01) 1 commit
  (merged to 'next' on 2022-08-03 at 443647b94a)
 + symbolic-ref: refuse to set syntactically invalid target

 "git symbolic-ref symref non..sen..se" is now diagnosed as an error.

 Will merge to 'master'.
 source: <YugYNzQYWqDCmOqN@coredump.intra.peff.net>


* vd/scalar-generalize-diagnose (2022-08-03) 10 commits
 - scalar: update technical doc roadmap
 - scalar-diagnose: use 'git diagnose --all'
 - builtin/bugreport.c: create '--diagnose' option
 - builtin/diagnose.c: gate certain data behind '--all'
 - builtin/diagnose.c: create 'git diagnose' builtin
 - scalar-diagnose: move functionality to common location
 - scalar-diagnose: move 'get_disk_info()' to 'compat/'
 - scalar-diagnose: add directory to archiver more gently
 - scalar-diagnose: avoid 32-bit overflow of size_t
 - scalar-diagnose: use "$GIT_UNZIP" in test

 The "diagnose" feature to create a zip archive for diagnostic
 material has been lifted from "scalar" and made into a feature of
 "git bugreport".
 source: <pull.1310.v2.git.1659577543.gitgitgadget@gmail.com>


* gc/git-reflog-doc-markup (2022-08-01) 1 commit
  (merged to 'next' on 2022-08-05 at f2d8721ab2)
 + Documentation/git-reflog: remove unneeded \ from \{

 Doc mark-up fix.

 Will merge to 'master'.
 source: <pull.1304.git.git.1659387885711.gitgitgadget@gmail.com>


* jk/pipe-command-nonblock (2022-08-03) 1 commit
 - pipe_command(): mark stdin descriptor as non-blocking

 Fix deadlocks between main Git process and subprocess spawned via
 the pipe_command() API, that can kill "git add -p" that was
 reimplemented in C recently.

 Needs waiting for corresponding change to Windows to put the pipe
 into nonblock mode.
 cf. <YulFTSTbVaTwuQtt@coredump.intra.peff.net>
 source: <YunxHOa2sJeEpJxd@coredump.intra.peff.net>


* ab/plug-revisions-leak (2022-08-03) 6 commits
  (merged to 'next' on 2022-08-05 at d1ca88976f)
 + revisions API: don't leak memory on argv elements that need free()-ing
 + bisect.c: partially fix bisect_rev_setup() memory leak
 + log: refactor "rev.pending" code in cmd_show()
 + log: fix a memory leak in "git show <revision>..."
 + test-fast-rebase helper: use release_revisions() (again)
 + bisect.c: add missing "goto" for release_revisions()

 Plug a bit more leaks in the revisions API.

 Will merge to 'master'.
 source: <cover-v3-0.6-00000000000-20220802T152925Z-avarab@gmail.com>


* jc/rerere-autoupdate-doc (2022-08-03) 2 commits
 - doc: clarify rerere-autoupdate
 - doc: consolidate --rerere-autoupdate description

 Update documentation on the "--[no-]rerere-autoupdate" option.

 Will merge to 'next'.
 source: <xmqq35f2ysd9.fsf@gitster.g>


* es/mark-gc-cruft-as-experimental (2022-08-03) 2 commits
 - config: let feature.experimental imply gc.cruftPacks=true
 - gc: add tests for --cruft and friends

 Enable gc.cruftpacks by default for those who opt into
 feature.experimental setting.

 Expecting a reroll.
 cf. <220804.86a68ke9d5.gmgdl@evledraar.gmail.com>
 cf. <6803b725-526e-a1c8-f15c-a9ed4a144d4c@github.com>
 source: <20220803205721.3686361-1-emilyshaffer@google.com>


* pw/use-glibc-tunable-for-malloc-optim (2022-08-04) 1 commit
 - tests: cache glibc version check

 Avoid repeatedly running getconf to ask libc version in the test
 suite, and instead just as it once per script.

 Will merge to 'next'?
 source: <pull.1311.git.1659620305757.gitgitgadget@gmail.com>


* vd/sparse-reset-checkout-fixes (2022-08-04) 4 commits
 - unpack-trees: handle missing sparse directories
 - cache.h: replace 'index_entry_exists()' with 'index_name_pos_sparse()'
 - oneway_diff: handle removed sparse directories
 - checkout: fix nested sparse directory diff in sparse index

 Fixes to sparse index compatibility work for "reset" and "checkout"
 commands.

 Expecting a reroll to further clarify [4/4].
 cf. <3825ef9a-4c71-21ed-6452-bbd322ca839c@github.com>
 source: <pull.1312.git.1659645967.gitgitgadget@gmail.com>


* ab/hooks-regression-fix (2022-08-05) 1 commit
 - hook API: don't segfault on strbuf_addf() to NULL "out"

 A follow-up fix to a fix for a regression in 2.36.

 Will merge to 'next' and then to 'master'.
 source: <patch-1.1-2450e3e65cf-20220805T141402Z-avarab@gmail.com>

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

--------------------------------------------------
[Cooking]

* ab/tech-docs-to-help (2022-08-04) 12 commits
 - docs: move http-protocol docs to man section 5
 - docs: move cruft pack docs to gitformat-pack
 - docs: move pack format docs to man section 5
 - docs: move signature docs to man section 5
 - docs: move index format docs to man section 5
 - docs: move protocol-related docs to man section 5
 - docs: move commit-graph format docs to man section 5
 - git docs: add a category for file formats, protocols and interfaces
 - git docs: add a category for user-facing file, repo and command UX
 - git help doc: use "<doc>" instead of "<guide>"
 - help.c: remove common category behavior from drop_prefix() behavior
 - help.c: refactor drop_prefix() to use a "switch" statement"

 Expose a lot of "tech docs" via "git help" interface.

 Will merge to 'next'?
 source: <cover-v8-00.12-00000000000-20220804T162138Z-avarab@gmail.com>


* sg/parse-options-subcommand (2022-07-25) 20 commits
 - builtin/worktree.c: let parse-options parse subcommands
 - builtin/stash.c: let parse-options parse subcommands
 - builtin/sparse-checkout.c: let parse-options parse subcommands
 - builtin/remote.c: let parse-options parse subcommands
 - builtin/reflog.c: let parse-options parse subcommands
 - builtin/notes.c: let parse-options parse subcommands
 - builtin/multi-pack-index.c: let parse-options parse subcommands
 - builtin/hook.c: let parse-option parse subcommands
 - builtin/gc.c: let parse-options parse 'git maintenance's subcommands
 - builtin/commit-graph.c: let parse-options parse subcommands
 - builtin/bundle.c: let parse-options parse subcommands
 - parse-options: add support for parsing subcommands
 - parse-options: drop leading space from '--git-completion-helper' output
 - parse-options: clarify the limitations of PARSE_OPT_NODASH
 - parse-options: PARSE_OPT_KEEP_UNKNOWN only applies to --options
 - api-parse-options.txt: fix description of OPT_CMDMODE
 - t0040-parse-options: test parse_options() with various 'parse_opt_flags'
 - t5505-remote.sh: check the behavior without a subcommand
 - t3301-notes.sh: check that default operation mode doesn't take arguments
 - git.c: update NO_PARSEOPT markings

 Introduce the "subcommand" mode to parse-options API and update the
 command line parser of Git commands with subcommands.
 source: <20220725123857.2773963-1-szeder.dev@gmail.com>


* ds/bundle-uri-clone (2022-08-02) 5 commits
 - clone: --bundle-uri cannot be combined with --depth
 - bundle-uri: add support for http(s):// and file://
 - clone: add --bundle-uri option
 - bundle-uri: create basic file-copy logic
 - remote-curl: add 'get' capability

 Implement "git clone --bundle-uri".
 source: <pull.1300.v2.git.1659443384.gitgitgadget@gmail.com>


* ca/unignore-local-installation-on-windows (2022-07-27) 1 commit
  (merged to 'next' on 2022-08-01 at 1d4f4c32a6)
 + cmake: support local installations of git

 Fix build procedure for Windows that uses CMake so that it can pick
 up the shell interpreter from local installation location.

 Will merge to 'master'.
 source: <pull.1304.git.1658912756815.gitgitgadget@gmail.com>


* ds/decorate-filter-tweak (2022-08-05) 11 commits
 - fetch: use ref_namespaces during prefetch
 - maintenance: stop writing log.excludeDecoration
 - log: create log.initialDecorationSet=all
 - log: add --clear-decorations option
 - log: add default decoration filter
 - log-tree: use ref_namespaces instead of if/else-if
 - refs: use ref_namespaces for replace refs base
 - refs: add array of ref namespaces
 - t4207: test coloring of grafted decorations
 - t4207: modernize test
 - refs: allow "HEAD" as decoration filter

 The namespaces used by "log --decorate" from "refs/" hierarchy by
 default has been tightened.
 source: <pull.1301.v3.git.1659722323.gitgitgadget@gmail.com>


* es/doc-creation-factor-fix (2022-07-28) 2 commits
 - range-diff: clarify --creation-factor=<factor>
 - format-patch: clarify --creation-factor=<factor>

 Expecting a reroll.
 source: <7229p500-p2r4-on87-6802-8o90s36rr3s4@tzk.qr>


* js/lstat-mingw-enotdir-fix (2022-07-29) 1 commit
  (merged to 'next' on 2022-08-01 at 10499943b7)
 + lstat(mingw): correctly detect ENOTDIR scenarios

 Fix to lstat() emulation on Windows.

 Will merge to 'master'.
 source: <pull.1291.v3.git.1659089152877.gitgitgadget@gmail.com>


* js/mingw-with-python (2022-07-29) 3 commits
  (merged to 'next' on 2022-08-01 at 73b8f06182)
 + mingw: remove unneeded `NO_CURL` directive
 + mingw: remove unneeded `NO_GETTEXT` directive
 + windows: include the Python bits when building Git for Windows

 Conditionally allow building Python interpreter on Windows

 Will merge to 'master'.
 source: <pull.1306.v2.git.1659109272.gitgitgadget@gmail.com>


* ab/submodule-helper-prep (2022-08-03) 28 commits
 - submodule--helper: fix bad config API usage
 - submodule--helper: libify "must_die_on_failure" code paths (for die)
 - submodule--helper: libify "must_die_on_failure" code paths
 - submodule--helper: libify determine_submodule_update_strategy()
 - submodule--helper: don't exit() on failure, return
 - submodule--helper: use "code" in run_update_command()
 - submodule--helper: move submodule_strategy_to_string() to only user
 - submodule--helper: don't call submodule_strategy_to_string() in BUG()
 - submodule--helper: add missing braces to "else" arm
 - submodule--helper: return "ret", not "1" from update_submodule()
 - submodule--helper: rename "int res" to "int ret"
 - submodule--helper: don't redundantly check "else if (res)"
 - submodule--helper: refactor "errmsg_str" to be a "struct strbuf"
 - submodule--helper: add "const" to copy of "update_data"
 - submodule--helper: pass a "const struct module_clone_data" to clone_submodule()
 - submodule--helper: move "sb" in clone_submodule() to its own scope
 - submodule--helper: use xstrfmt() in clone_submodule()
 - submodule--helper: replace memset() with { 0 }-initialization
 - submodule--helper style: add \n\n after variable declarations
 - submodule--helper style: don't separate declared variables with \n\n
 - submodule--helper: move "resolve-relative-url-test" to a test-tool
 - submodule--helper: move "check-name" to a test-tool
 - submodule--helper: move "is-active" to a test-tool
 - test-tool submodule-config: remove unused "--url" handling
 - submodule--helper: remove unused "list" helper
 - submodule--helper: remove unused "name" helper
 - submodule tests: test for "add <repository> <abs-path>"
 - submodule tests: test usage behavior
 (this branch is used by ab/submodule-helper-leakfix.)

 source: <cover-v2-00.28-00000000000-20220802T154036Z-avarab@gmail.com>


* ab/dedup-config-and-command-docs (2022-07-29) 9 commits
 - docs: add CONFIGURATION sections that fuzzy map to built-ins
 - docs: add CONFIGURATION sections that map to a built-in
 - log docs: de-duplicate configuration sections
 - difftool docs: de-duplicate configuration sections
 - notes docs: de-duplicate configuration sections
 - apply docs: de-duplicate configuration sections
 - send-email docs: de-duplicate configuration sections
 - grep docs: de-duplicate configuration sections
 - docs: add and use include template for config/* includes

 Share the text used to explain configuration variables used by "git
 <subcmd>" in "git help <subcmd>" with the text from "git help config".

 Expecting a reroll.
 cf. <CAHd-oW5mD-H1kvuF9VEVb8KjaSkUSUpBH-WAkpCn6_Ci8o888w@mail.gmail.com>
 cf. <CAHd-oW7s6Hu24uTjCW9ROBbJkA5+7TCu32a4L_BXVLhcvw5kSw@mail.gmail.com>
 cf. <xmqqlesb4lwh.fsf@gitster.g>
 source: <cover-v2-0.9-00000000000-20220729T081959Z-avarab@gmail.com>


* jk/struct-zero-init-with-older-gcc (2022-07-31) 1 commit
  (merged to 'next' on 2022-08-01 at cde4f95964)
 + config.mak.dev: squelch -Wno-missing-braces for older gcc

 Older gcc with -Wall complains about the universal zero initializer
 "struct s = { 0 };" idiom, which makes developers' lives
 inconvenient (as -Werror is enabled by DEVELOPER=YesPlease).  The
 build procedure has been tweaked to help these compilers.

 Will merge to 'master'.
 source: <YuQ60ZUPBHAVETD7@coredump.intra.peff.net>


* js/ort-clean-up-after-failed-merge (2022-07-31) 2 commits
  (merged to 'next' on 2022-08-01 at 0c9f02f3ec)
 + merge-ort: do leave trace2 region even if checkout fails
 + merge-ort: clean up after failed merge

 Plug memory leaks in the failure code path in the "merge-ort" merge
 strategy backend.

 Will merge to 'master'.
 source: <pull.1307.v2.git.1659114727.gitgitgadget@gmail.com>


* js/t5351-freebsd-fix (2022-07-29) 2 commits
  (merged to 'next' on 2022-08-01 at b47609e891)
 + t5351: avoid using `test_cmp` for binary data
 + t5351: avoid relying on `core.fsyncMethod = batch` to be supported

 Some tests assumed that core.fsyncMethod=batch is supported
 everywhere, which broke FreeBSD.

 Will merge to 'master'.
 source: <pull.1308.git.1659097724.gitgitgadget@gmail.com>


* cw/remote-object-info (2022-07-28) 6 commits
 - cat-file: add remote-object-info to batch-command
 - transport: add client support for object-info
 - serve: advertise object-info feature
 - protocol-caps: initialization bug fix
 - fetch-pack: move fetch initialization
 - fetch-pack: refactor packet writing

 A client component to talk with the object-info endpoint.
 source: <20220728230210.2952731-1-calvinwan@google.com>


* ab/leak-check (2022-07-27) 15 commits
  (merged to 'next' on 2022-08-05 at 2a6b9c8432)
 + CI: use "GIT_TEST_SANITIZE_LEAK_LOG=true" in linux-leaks
 + upload-pack: fix a memory leak in create_pack_file()
 + leak tests: mark passing SANITIZE=leak tests as leak-free
 + leak tests: don't skip some tests under SANITIZE=leak
 + test-lib: have the "check" mode for SANITIZE=leak consider leak logs
 + test-lib: add a GIT_TEST_PASSING_SANITIZE_LEAK=check mode
 + test-lib: simplify by removing test_external
 + tests: move copy/pasted PERL + Test::More checks to a lib-perl.sh
 + t/Makefile: don't remove test-results in "clean-except-prove-cache"
 + test-lib: add a SANITIZE=leak logging mode
 + t/README: reword the "GIT_TEST_PASSING_SANITIZE_LEAK" description
 + test-lib: add a --invert-exit-code switch
 + test-lib: fix GIT_EXIT_OK logic errors, use BAIL_OUT
 + test-lib: don't set GIT_EXIT_OK before calling test_atexit_handler
 + test-lib: use $1, not $@ in test_known_broken_{ok,failure}_

 Extend SANITIZE=leak checking and declare more tests "currently leak-free".

 Will merge to 'master'.
 source: <cover-v3-00.15-00000000000-20220727T230800Z-avarab@gmail.com>


* mt/rot13-in-c (2022-07-31) 4 commits
 - tests: use the new C rot13-filter helper to avoid PERL prereq
 - t0021: implementation the rot13-filter.pl script in C
 - t0021: avoid grepping for a Perl-specific string at filter output
 - Merge branch 'mt/checkout-count-fix' into mt/rot13-in-c

 Test portability improvements.
 source: <cover.1659291025.git.matheus.bernardino@usp.br>


* tl/trace2-config-scope (2022-07-22) 2 commits
 - tr2: shows scope unconditionally in addition to key-value pair
 - api-trace2.txt: print config key-value pair

 Tweak trace2 output about configuration variables.

 Needs reviewer response
 cf. <20220801122515.23146-1-tenglong.tl@alibaba-inc.com>
 source: <cover.1658472474.git.dyroneteng@gmail.com>


* ab/submodule-helper-leakfix (2022-08-03) 18 commits
 - submodule--helper: fix a configure_added_submodule() leak
 - submodule--helper: free rest of "displaypath" in "struct update_data"
 - submodule--helper: free some "displaypath" in "struct update_data"
 - submodule--helper: fix a memory leak in print_status()
 - submodule--helper: fix a leak in module_add()
 - submodule--helper: fix obscure leak in module_add()
 - submodule--helper: fix "reference" leak
 - submodule--helper: fix a memory leak in get_default_remote_submodule()
 - submodule--helper: fix a leak with repo_clear()
 - submodule--helper: fix "sm_path" and other "module_cb_list" leaks
 - submodule--helper: fix "errmsg_str" memory leak
 - submodule--helper: add and use *_release() functions
 - submodule--helper: don't leak {run,capture}_command() cp.dir argument
 - submodule--helper: "struct pathspec" memory leak in module_update()
 - submodule--helper: fix most "struct pathspec" memory leaks
 - submodule--helper: fix trivial get_default_remote_submodule() leak
 - submodule--helper: fix a leak in "clone_submodule"
 - Merge branch 'ab/submodule-helper-prep' into ab/submodule-helper-leakfix
 (this branch uses ab/submodule-helper-prep.)

 Plugging leaks in submodule--helper.

 Getting there.
 source: <cover-v5-00.17-00000000000-20220802T155002Z-avarab@gmail.com>


* cw/submodule-merge-messages (2022-08-04) 1 commit
 - submodule merge: update conflict error message

 Update the message given when "git merge" sees conflicts at a path
 with a submodule while merging a superproject.

 Getting closer?
 source: <20220804195105.1303455-1-calvinwan@google.com>


* js/safe-directory-plus (2022-07-13) 3 commits
 - mingw: be more informative when ownership check fails on FAT32
 - mingw: handle a file owned by the Administrators group correctly
 - Allow debugging unsafe directories' ownership

 Expecting a reroll.
 cf. <8rqqnqp1-q613-ron6-6q8s-n7sq57o980q9@tzk.qr>
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

 Seems to be flaky-broken under SHA-256.
 cf. <p3r70610-8n52-s8q0-n641-onp4ps01330n@tzk.qr>
 source: <pull.1266.v5.git.1658342304.gitgitgadget@gmail.com>


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


* ds/bundle-uri-more (2022-07-25) 2 commits
 - bundle-uri: add example bundle organization
 - docs: document bundle URI standard

 The "bundle URI" topic.

 Needs review.
 source: <pull.1248.v3.git.1658757188.gitgitgadget@gmail.com>


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


* mt/doc-config (2022-07-14) 3 commits
 . doc: notes: unify configuration variables definitions
 . doc: apply: unify configuration variables definitions
 . doc: grep: unify configuration variables definitions

 Unify description of configuration variables used by individual
 commands in the documentation of the commands and the documentation
 of the "git config".

 Retracted.
 cf. <20220723134834.9693-1-matheus.bernardino@usp.br>
 source: <cover.1657819649.git.matheus.bernardino@usp.br>


* mb/doc-rerere-autoupdate (2022-07-15) 1 commit
 . cherry-pick doc: clarify no-rerere-autoupdate still allows rerere

 Clarifies that the "--no-rerere-autoupdate" option does not disable
 the "rerere" mechanism (nor does "--rerere-autoupdate" enable it).
 source: <20220715092527.1567837-1-mail@beyermatthias.de>
