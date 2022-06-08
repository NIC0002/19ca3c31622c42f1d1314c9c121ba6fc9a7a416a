Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A42C43334
	for <git@archiver.kernel.org>; Wed,  8 Jun 2022 04:06:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbiFHED4 (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 8 Jun 2022 00:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232482AbiFHED2 (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 8 Jun 2022 00:03:28 -0400
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C4ED26E921
        for <git@vger.kernel.org>; Tue,  7 Jun 2022 18:16:29 -0700 (PDT)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 3069619B803;
        Tue,  7 Jun 2022 21:12:55 -0400 (EDT)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to
        :subject:date:message-id:mime-version:content-type; s=sasl; bh=G
        sALQDprXE6KFcERguww90N12hJB7EiTej37gIB289w=; b=JSUZCVplTdGmm0fs2
        QePog32HM6qcOUWP1kBSbSSBbWVdftHDVSNKvddeAVI7MXNn5iA1+VWC2fLPF0zF
        EItjp1Mdr0M+KueGBsfKHbkMaj3zpj4bF0TbZ6gdkO22BeNuVrjSVGZQPGyX6IlE
        XCsk0OVB/g+PDyJnFromyFRLCg=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 2897119B802;
        Tue,  7 Jun 2022 21:12:55 -0400 (EDT)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [34.83.92.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp21.pobox.com (Postfix) with ESMTPSA id BDB4F19B801;
        Tue,  7 Jun 2022 21:12:51 -0400 (EDT)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Jun 2022, #02; Tue, 7)
X-master-at: 9c897eef06347cc5a3eb07c3ae409970ab1052c8
X-next-at: c6f46106abc684656a9b2608ecedc4b8ac04b8ef
Date:   Tue, 07 Jun 2022 18:12:50 -0700
Message-ID: <xmqqwndsrm99.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID: 1E4E12CA-E6C8-11EC-B575-CBA7845BAAA9-77302942!pb-smtp21.pobox.com
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Here are the topics that have been cooking in my tree.  Commits
prefixed with '+' are in 'next' (being in 'next' is a sign that a
topic is stable enough to be used and are candidate to be in a
future release).  Commits prefixed with '-' are only in 'seen',
and aren't considered "accepted" at all.

This cycle will complete at around the end of June
(https://tinyurl.com/gitCal); we are in the week #7 of the cycle.

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

* ab/plug-leak-in-revisions (2022-04-13) 28 commits
  (merged to 'next' on 2022-05-30 at 2ff85c8e71)
 + revisions API: add a TODO for diff_free(&revs->diffopt)
 + revisions API: have release_revisions() release "topo_walk_info"
 + revisions API: have release_revisions() release "date_mode"
 + revisions API: call diff_free(&revs->pruning) in revisions_release()
 + revisions API: release "reflog_info" in release revisions()
 + revisions API: clear "boundary_commits" in release_revisions()
 + revisions API: have release_revisions() release "prune_data"
 + revisions API: have release_revisions() release "grep_filter"
 + revisions API: have release_revisions() release "filter"
 + revisions API: have release_revisions() release "cmdline"
 + revisions API: have release_revisions() release "mailmap"
 + revisions API: have release_revisions() release "commits"
 + revisions API users: use release_revisions() for "prune_data" users
 + revisions API users: use release_revisions() with UNLEAK()
 + revisions API users: use release_revisions() in builtin/log.c
 + revisions API users: use release_revisions() in http-push.c
 + revisions API users: add "goto cleanup" for release_revisions()
 + stash: always have the owner of "stash_info" free it
 + revisions API users: use release_revisions() needing REV_INFO_INIT
 + revision.[ch]: document and move code declared around "init"
 + revisions API users: add straightforward release_revisions()
 + revision.[ch]: provide and start using a release_revisions()
 + cocci: add and apply free_commit_list() rules
 + format-patch: don't leak "extra_headers" or "ref_message_ids"
 + string_list API users: use string_list_init_{no,}dup
 + blame: use "goto cleanup" for cleanup_scoreboard()
 + t/helper/test-fast-rebase.c: don't leak "struct strbuf"
 + Merge branch 'ds/partial-bundle-more' into ab/plug-leak-in-revisions

 Plug the memory leaks from the trickiest API of all, the revision
 walker.
 source: <cover-v6-00.27-00000000000-20220413T195935Z-avarab@gmail.com>


* ds/bundle-uri (2022-05-16) 8 commits
  (merged to 'next' on 2022-05-25 at 43b1b9092c)
 + bundle.h: make "fd" version of read_bundle_header() public
 + remote: allow relative_url() to return an absolute url
 + remote: move relative_url()
 + http: make http_get_file() external
 + fetch-pack: move --keep=* option filling to a function
 + fetch-pack: add a deref_without_lazy_fetch_extended()
 + dir API: add a generalized path_match_flags() function
 + connect.c: refactor sending of agent & object-format
 (this branch is used by ds/bundle-uri-more.)

 Preliminary code refactoring around transport and bundle code.
 source: <pull.1233.git.1652731865.gitgitgadget@gmail.com>


* ds/object-file-unpack-loose-header-fix (2022-05-16) 1 commit
  (merged to 'next' on 2022-05-26 at b35a1d5db6)
 + object-file: convert 'switch' back to 'if'

 Coding style fix.
 source: <377be0e9-8a0f-4a86-0a66-3b08c0284dae@github.com>


* ds/sparse-sparse-checkout (2022-05-23) 10 commits
  (merged to 'next' on 2022-05-26 at e0e07693c5)
 + sparse-checkout: integrate with sparse index
 + p2000: add test for 'git sparse-checkout [add|set]'
 + sparse-index: complete partial expansion
 + sparse-index: partially expand directories
 + sparse-checkout: --no-sparse-index needs a full index
 + cache-tree: implement cache_tree_find_path()
 + sparse-index: introduce partially-sparse indexes
 + sparse-index: create expand_index()
 + t1092: stress test 'git sparse-checkout set'
 + t1092: refactor 'sparse-index contents' test

 "sparse-checkout" learns to work well with the sparse-index
 feature.
 source: <pull.1208.v3.git.1653313726.gitgitgadget@gmail.com>


* en/sparse-cone-becomes-default (2022-04-21) 9 commits
  (merged to 'next' on 2022-05-13 at c168eb55cf)
 + Documentation: some sparsity wording clarifications
 + git-sparse-checkout.txt: mark non-cone mode as deprecated
 + git-sparse-checkout.txt: flesh out pattern set sections a bit
 + git-sparse-checkout.txt: add a new EXAMPLES section
 + git-sparse-checkout.txt: shuffle some sections and mark as internal
 + git-sparse-checkout.txt: update docs for deprecation of 'init'
 + git-sparse-checkout.txt: wording updates for the cone mode default
 + sparse-checkout: make --cone the default
 + tests: stop assuming --no-cone is the default mode for sparse-checkout

 Deprecate non-cone mode of the sparse-checkout feature.
 source: <pull.1148.v3.git.1650594746.gitgitgadget@gmail.com>


* fh/transport-push-leakfix (2022-05-27) 3 commits
  (merged to 'next' on 2022-05-30 at e70a36b915)
 + transport: free local and remote refs in transport_push()
 + transport: unify return values and exit point from transport_push()
 + transport: remove unnecessary indenting in transport_push()

 Leakfix.
 source: <20220520124952.2393299-1-frantisek@hrbata.com>


* jc/all-negative-pathspec (2022-05-29) 1 commit
  (merged to 'next' on 2022-05-31 at 2d65a13996)
 + pathspec: correct an empty string used as a pathspec element

 A git subcommand like "git add -p" spawns a separate git process
 while relaying its command line arguments.  A pathspec with only
 negative elements was mistakenly passed with an empty string, which
 has been corrected.
 source: <xmqqpmjwx8so.fsf_-_@gitster.g>


* js/ci-github-workflow-markup (2022-05-21) 12 commits
  (merged to 'next' on 2022-05-30 at bd37e9e41f)
 + ci: call `finalize_test_case_output` a little later
 + ci(github): mention where the full logs can be found
 + ci: use `--github-workflow-markup` in the GitHub workflow
 + ci(github): avoid printing test case preamble twice
 + ci(github): skip the logs of the successful test cases
 + ci: optionally mark up output in the GitHub workflow
 + ci/run-build-and-tests: add some structure to the GitHub workflow output
 + ci: make it easier to find failed tests' logs in the GitHub workflow
 + ci/run-build-and-tests: take a more high-level view
 + test(junit): avoid line feeds in XML attributes
 + tests: refactor --write-junit-xml code
 + ci: fix code style

 Update the GitHub workflow support to make it quicker to get to the
 failing test.
 source: <pull.1117.v3.git.1653171536.gitgitgadget@gmail.com>


* js/scalar-diagnose (2022-05-30) 8 commits
  (merged to 'next' on 2022-05-31 at 8c878f3ac5)
 + scalar: teach `diagnose` to gather loose objects information
 + scalar: teach `diagnose` to gather packfile info
 + scalar diagnose: include disk space information
 + scalar: implement `scalar diagnose`
 + scalar: validate the optional enlistment argument
 + archive --add-virtual-file: allow paths containing colons
 + archive: optionally add "virtual" files
 + Merge branch 'rs/document-archive-prefix' into js/scalar-diagnose
 (this branch uses rs/document-archive-prefix.)

 Implementation of "scalar diagnose" subcommand.
 source: <20220528231118.3504387-1-gitster@pobox.com>


* jx/l10n-workflow-change (2022-05-26) 10 commits
  (merged to 'next' on 2022-05-26 at 252c979843)
 + l10n: Document the new l10n workflow
 + Makefile: add "po-init" rule to initialize po/XX.po
 + Makefile: add "po-update" rule to update po/XX.po
 + po/git.pot: don't check in result of "make pot"
 + po/git.pot: this is now a generated file
 + Makefile: remove duplicate and unwanted files in FOUND_SOURCE_FILES
 + i18n CI: stop allowing non-ASCII source messages in po/git.pot
 + Makefile: have "make pot" not "reset --hard"
 + Makefile: generate "po/git.pot" from stable LOCALIZED_C
 + Makefile: sort source files before feeding to xgettext

 A workflow change for translators are being proposed.
 source: <20220523152128.26380-1-worldhello.net@gmail.com>


* kl/setup-in-unreadable-worktree (2022-05-24) 1 commit
  (merged to 'next' on 2022-05-27 at 4867873678)
 + setup: don't die if realpath(3) fails on getcwd(3)

 Disable the "do not remove the directory the user started Git in"
 logic when Git cannot tell where that directory is.  Earlier we
 refused to run in such a case.
 source: <8b20840014d214023c50ee62439147f798e6f9cc.1653419993.git.kevin@kevinlocke.name>


* ns/batch-fsync (2022-04-06) 13 commits
  (merged to 'next' on 2022-05-23 at 379d8bd500)
 + core.fsyncmethod: performance tests for batch mode
 + t/perf: add iteration setup mechanism to perf-lib
 + core.fsyncmethod: tests for batch mode
 + test-lib-functions: add parsing helpers for ls-files and ls-tree
 + core.fsync: use batch mode and sync loose objects by default on Windows
 + unpack-objects: use the bulk-checkin infrastructure
 + update-index: use the bulk-checkin infrastructure
 + builtin/add: add ODB transaction around add_files_to_cache
 + cache-tree: use ODB transaction around writing a tree
 + core.fsyncmethod: batched disk flushes for loose-objects
 + bulk-checkin: rebrand plug/unplug APIs as 'odb transactions'
 + bulk-checkin: rename 'state' variable and separate 'plugged' boolean
 + Merge branch 'ns/core-fsyncmethod' into ns/batch-fsync

 Introduce a filesystem-dependent mechanism to optimize the way the
 bits for many loose object files are ensured to hit the disk
 platter.
 source: <pull.1134.v5.git.1648616734.gitgitgadget@gmail.com>


* pb/use-freebsd-12.3-in-cirrus-ci (2022-05-25) 1 commit
  (merged to 'next' on 2022-05-26 at cea1e33100)
 + ci: update Cirrus-CI image to FreeBSD 12.3

 Update the version of FreeBSD image used in Cirrus CI.
 source: <20220525125112.86954-1-levraiphilippeblain@gmail.com>


* rs/document-archive-prefix (2022-05-28) 1 commit
  (merged to 'next' on 2022-05-30 at c9e9c54880)
 + archive: improve documentation of --prefix
 (this branch is used by js/scalar-diagnose.)

 The documentation on the interaction between "--add-file" and
 "--prefix" options of "git archive" has been improved.
 source: <6ef7f836-45f6-8386-03c0-dc18b125ec67@web.de>


* tb/cruft-packs (2022-05-26) 17 commits
  (merged to 'next' on 2022-05-27 at cfa4cbd790)
 + sha1-file.c: don't freshen cruft packs
 + builtin/gc.c: conditionally avoid pruning objects via loose
 + builtin/repack.c: add cruft packs to MIDX during geometric repack
 + builtin/repack.c: use named flags for existing_packs
 + builtin/repack.c: allow configuring cruft pack generation
 + builtin/repack.c: support generating a cruft pack
 + builtin/pack-objects.c: --cruft with expiration
 + reachable: report precise timestamps from objects in cruft packs
 + reachable: add options to add_unseen_recent_objects_to_traversal
 + builtin/pack-objects.c: --cruft without expiration
 + builtin/pack-objects.c: return from create_object_entry()
 + t/helper: add 'pack-mtimes' test-tool
 + pack-mtimes: support writing pack .mtimes files
 + chunk-format.h: extract oid_version()
 + pack-write: pass 'struct packing_data' to 'stage_tmp_packfiles'
 + pack-mtimes: support reading .mtimes files
 + Documentation/technical: add cruft-packs.txt

 A mechanism to pack unreachable objects into a "cruft pack",
 instead of ejecting them into loose form to be reclaimed later, has
 been introduced.
 source: <cover.1653088640.git.me@ttaylorr.com>


* tb/geom-repack-with-keep-and-max (2022-05-20) 3 commits
  (merged to 'next' on 2022-05-26 at 4068f4afd3)
 + builtin/repack.c: ensure that `names` is sorted
 + t7703: demonstrate object corruption with pack.packSizeLimit
 + repack: respect --keep-pack with geometric repack

 Teach "git repack --geometric" work better with "--keep-pack" and
 avoid corrupting the repository when packsize limit is used.
 source: <cover.1653073280.git.me@ttaylorr.com>


* tb/midx-race-in-pack-objects (2022-05-24) 4 commits
  (merged to 'next' on 2022-05-26 at b51897dfc4)
 + builtin/pack-objects.c: ensure pack validity from MIDX bitmap objects
 + builtin/pack-objects.c: ensure included `--stdin-packs` exist
 + builtin/pack-objects.c: avoid redundant NULL check
 + pack-bitmap.c: check preferred pack validity when opening MIDX bitmap

 The multi-pack-index code did not protect the packfile it is going
 to depend on from getting removed while in use, which has been
 corrected.
 source: <cover.1653418457.git.me@ttaylorr.com>


* yw/cmake-updates (2022-05-24) 3 commits
  (merged to 'next' on 2022-05-30 at ff3184441c)
 + cmake: remove (_)UNICODE def on Windows in CMakeLists.txt
 + cmake: add pcre2 support
 + cmake: fix CMakeLists.txt on Linux

 CMake updates.
 source: <pull.1267.v2.git.git.1653374328.gitgitgadget@gmail.com>

--------------------------------------------------
[New Topics]

* jy/gitweb-xhtml5 (2022-06-02) 1 commit
  (merged to 'next' on 2022-06-02 at cc6a77b48b)
 + gitweb: switch to an XHTML5 DOCTYPE

 Update the doctype written in gitweb output to xhtml5.

 Will merge to 'master'.
 source: <20220602114305.5915-1-jason@jasonyundt.email>


* pb/range-diff-with-submodule (2022-06-06) 1 commit
  (merged to 'next' on 2022-06-07 at e5e31590c4)
 + range-diff: show submodule changes irrespective of diff.submodule

 "git range-diff" did not show anything for submodules that changed
 in the ranges being compared.  Change the behaviour to include the
 "--submodule=short" output unconditionally to be compared.

 Will merge to 'master'.
 source: <pull.1244.v2.git.1654549153769.gitgitgadget@gmail.com>


* jp/prompt-clear-before-upstream-mark (2022-06-07) 1 commit
 - git-prompt: make colourization consistent

 Bash command line prompt (in contrib/) update.

 Will merge to 'next'.
 source: <20220607115024.64724-1-joak-pet@online.no>


* jt/unparse-commit-upon-graft-change (2022-06-06) 1 commit
 - commit,shallow: unparse commits if grafts changed

 Updating the graft information invalidates the list of parents of
 in-core commit objects that used to be in the graft file.

 Will merge to 'next'.
 source: <20220606175437.1740447-1-jonathantanmy@google.com>


* ds/rebase-update-refs (2022-06-07) 7 commits
 - rebase: add rebase.updateRefs config option
 - sequencer: implement 'update-refs' command
 - rebase: add --update-refs option
 - sequencer: add update-refs command
 - sequencer: define array with enum values
 - branch: add branch_checked_out() helper
 - log-tree: create for_each_decoration()

 "git rebase" learns "--update-refs" to update the refs that point
 at commits being rewritten so that they point at the corresponding
 commits in the rewritten history.

 source: <3d7d3f656b4e93e8caa0d18d29c318ede956d1d7.1654634569.git.gitgitgadget@gmail.com>


* ab/build-gitweb (2022-06-02) 7 commits
 - Makefile: build 'gitweb' in the default target
 - gitweb/Makefile: include in top-level Makefile
 - gitweb: remove "test" and "test-installed" targets
 - gitweb/Makefile: prepare to merge into top-level Makefile
 - gitweb/Makefile: clear up and de-duplicate the gitweb.{css,js} vars
 - gitweb/Makefile: add a $(GITWEB_ALL) variable
 - gitweb/Makefile: define all .PHONY prerequisites inline

 source: <cover-v2-0.7-00000000000-20220531T173805Z-avarab@gmail.com>


* ab/test-without-templates (2022-06-06) 7 commits
 - tests: don't assume a .git/info for .git/info/sparse-checkout
 - tests: don't assume a .git/info for .git/info/exclude
 - tests: don't assume a .git/info for .git/info/refs
 - tests: don't assume a .git/info for .git/info/attributes
 - tests: don't assume a .git/info for .git/info/grafts
 - tests: don't depend on template-created .git/branches
 - t0008: don't rely on default ".git/info/exclude"

 source: <cover-v2-0.7-00000000000-20220603T110506Z-avarab@gmail.com>


* ac/bitmap-format-doc (2022-06-07) 3 commits
 - bitmap-format.txt: add information for trailing checksum
 - bitmap-format.txt: fix some formatting issues
 - bitmap-format.txt: feed the file to asciidoc to generate html

 Adjust technical/bitmap-format to be formatted by AsciiDoc.

 Needs more work to really use AsciiDoc to produce true HTML.
 source: <pull.1246.v2.git.1654623814.gitgitgadget@gmail.com>


* hx/unpack-streaming (2022-06-06) 7 commits
 - unpack-objects: use stream_loose_object() to unpack large objects
 - core doc: modernize core.bigFileThreshold documentation
 - object-file.c: add "stream_loose_object()" to handle large object
 - object-file.c: factor out deflate part of write_loose_object()
 - object-file.c: refactor write_loose_object() to several steps
 - object-file.c: do fsync() and close() before post-write die()
 - unpack-objects: low memory footprint for get_data() in dry_run mode

 Allow large objects read from a packstream to be streamed into a
 loose object file straight, without having to keep it in-core as a
 whole.

 Needs rebasing on batched-fsync stuff.
 cf. <7ba4858a-d1cc-a4eb-b6d6-4c04a5dd6ce7@gmail.com>
 source: <cover-v13-0.7-00000000000-20220604T095113Z-avarab@gmail.com>


* po/rebase-preserve-merges (2022-06-06) 4 commits
 - rebase: translate a die(preserve-merges) message
 - rebase: note `preserve` merges may be a pull config option
 - rebase: help users when dying with `preserve-merges`
 - rebase.c: state preserve-merges has been removed

 Various error messages that talk about the removal of
 "--preserve-merges" in "rebase" have been strengthened, and "rebase
 --abort" learned to get out of a state that was left by an earlier
 use of the option.

 Will merge to 'next'.
 source: <pull.1242.v2.git.1654341469.gitgitgadget@gmail.com>


* tb/show-ref-optim (2022-06-06) 1 commit
 - builtin/show-ref.c: avoid over-iterating with --heads, --tags

 "git show-ref --heads" (and "--tags") still iterated over all the
 refs, which has been corrected.

 Will merge to 'next'.
 source: <3fa6932641f18d78156bbf60b1571383f2cb5046.1654293264.git.me@ttaylorr.com>


* zh/read-cache-copy-name-entry-fix (2022-06-06) 1 commit
 - read-cache.c: reduce unnecessary cache entry name copying

 Remove redundant copying (with index v3 and older) or possible
 over-reading beyond end of mmapped memory (with index v4) has been
 corrected.

 Will merge to 'next'.
 source: <pull.1249.git.1654436248249.gitgitgadget@gmail.com>


* ab/remote-free-fix (2022-06-07) 2 commits
 - remote.c: don't dereference NULL in freeing loop
 - remote.c: remove braces from one-statement "for"-loops

 Use-after-free (with another forget-to-free) fix.

 Will merge to 'next'.
 source: <cover-0.3-00000000000-20220607T154520Z-avarab@gmail.com>


* sn/fsmonitor-missing-clock (2022-06-07) 1 commit
 - fsmonitor: query watchman with right valid json

 Sample watchman interface hook sometimes failed to produce
 correctly formatted JSON message, which has been corrected.

 Will merge to 'next'.
 source: <20220607111419.15753-1-sluongng@gmail.com>


* tb/show-ref-count (2022-06-06) 2 commits
 - builtin/show-ref.c: limit output with `--count`
 - builtin/show-ref.c: rename `found_match` to `matches_nr`

 "git show-ref" learned to stop after emitting N refs with the new
 "--count=N" option.

 Expecting a reroll.
 cf. <xmqqczfl4ce1.fsf@gitster.g>
 source: <cover.1654552560.git.me@ttaylorr.com>


* jc/cocci-cleanup (2022-06-07) 1 commit
 - cocci: retire is_null_sha1() rule

 Remove a coccinelle rule that is no longer relevant.

 source: <xmqq7d5suoqt.fsf@gitster.g>

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


* ab/ci-github-workflow-markup (2022-05-26) 14 commits
 . CI: make the --github-workflow-markup "github" output the default
 . CI: make --github-workflow-markup ci-config, off by default
 . ci: call `finalize_test_case_output` a little later
 . ci(github): mention where the full logs can be found
 . ci(github): avoid printing test case preamble twice
 . ci(github): skip "skip" tests in --github-workflow-markup
 . ci(github): skip the logs of the successful test cases
 . ci: make it easier to find failed tests' logs in the GitHub workflow
 . ci: optionally mark up output in the GitHub workflow
 . test(junit): avoid line feeds in XML attributes
 . tests: refactor --write-junit-xml code
 . CI: stop setting FAILED_TEST_ARTIFACTS N times
 . CI: don't include "test-results/" in ci/print-test-failures.sh output
 . CI: don't "cd" in ci/print-test-failures.sh
 (this branch uses ab/ci-setup-simplify.)

 Build a moral equivalent of js/ci-github-workflow-markup on top of
 ab/ci-setup-simplify.


* ab/ci-setup-simplify (2022-05-26) 29 commits
 . CI: make it easy to use ci/*.sh outside of CI
 . CI: don't use "set -x" in "ci/lib.sh" output
 . CI: set PYTHON_PATH setting for osx-{clang,gcc} into "$jobname" case
 . CI: set SANITIZE=leak in MAKEFLAGS directly
 . CI: set CC in MAKEFLAGS directly, don't add it to the environment
 . CI: add more variables to MAKEFLAGS, except under vs-build
 . CI: narrow down variable definitions in --build and --test
 . CI: only invoke ci/lib.sh as "steps" in main.yml
 . CI: pre-select test slice in Windows & VS tests
 . ci/run-test-slice.sh: replace shelling out with "echo"
 . CI: move "env" definitions into ci/lib.sh
 . CI: combine ci/install{,-docker}-dependencies.sh
 . CI: split up and reduce "ci/test-documentation.sh"
 . CI: invoke "make artifacts-tar" directly in windows-build
 . CI: check ignored unignored build artifacts in "win[+VS] build" too
 . CI: make ci/{lib,install-dependencies}.sh POSIX-compatible
 . CI: remove "run-build-and-tests.sh", run "make [test]" directly
 . CI: export variables via a wrapper
 . CI: consistently use "export" in ci/lib.sh
 . CI: move p4 and git-lfs variables to ci/install-dependencies.sh
 . CI: have "static-analysis" run "check-builtins", not "documentation"
 . CI: have "static-analysis" run a "make ci-static-analysis" target
 . CI: don't have "git grep" invoke a pager in tree content check
 . CI/lib.sh: stop adding leading whitespace to $MAKEFLAGS
 . CI: remove unused Azure ci/* code
 . CI: remove dead "tree skipping" code
 . CI: remove more dead Travis CI support
 . CI: make "$jobname" explicit, remove fallback
 . CI: run "set -ex" early in ci/lib.sh
 (this branch is used by ab/ci-github-workflow-markup.)

 Drive more actions done in CI via the Makefile instead of shell
 commands sprinkled in .github/workflows/main.yml
 source: <cover-v6-00.29-00000000000-20220525T094123Z-avarab@gmail.com>


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

* js/wait-or-whine-can-fail (2022-06-07) 1 commit
 - run-command: don't spam trace2_child_exit()

 We used to log an error return from wait_or_whine() as process
 termination of the waited child, which was incorrect.

 Will merge to 'next'.
 source: <50d872a057a558fa5519856b95abd048ddb514dc.1654625626.git.steadmon@google.com>


* ds/credentials-in-url (2022-06-06) 1 commit
 - remote: create fetch.credentialsInUrl config

 The "fetch.credentialsInUrl" configuration variable controls what
 happens when a URL with embedded login credential is used.

 Will merge to 'next'.
 source: <pull.1237.v5.git.1654526176695.gitgitgadget@gmail.com>


* ab/bug-if-bug (2022-06-02) 6 commits
  (merged to 'next' on 2022-06-03 at 25290bb7ec)
 + cache-tree.c: use bug() and BUG_if_bug()
 + receive-pack: use bug() and BUG_if_bug()
 + parse-options.c: use optbug() instead of BUG() "opts" check
 + parse-options.c: use new bug() API for optbug()
 + usage.c: add a non-fatal bug() function to go with BUG()
 + common-main.c: move non-trace2 exit() behavior out of trace2.c

 A new bug() and BUG_if_bug() API is introduced to make it easier to
 uniformly log "detect multiple bugs and abort in the end" pattern.

 Will merge to 'master'.
 source: <cover-v3-0.6-00000000000-20220602T122106Z-avarab@gmail.com>


* cb/buggy-gcc-12-workaround (2022-06-01) 1 commit
  (merged to 'next' on 2022-06-01 at 01e199fd58)
 + Revert -Wno-error=dangling-pointer

 With a more targetted workaround in http.c in another topic, we may
 be able to lift this blanket "GCC12 dangling-pointer warning is
 broken and unsalvageable" workaround.

 Will merge to 'master'.


* gc/zero-length-branch-config-fix (2022-06-01) 2 commits
  (merged to 'next' on 2022-06-02 at 438605f627)
 + remote.c: reject 0-length branch names
 + remote.c: don't BUG() on 0-length branch names

 A misconfigured 'branch..remote' led to a bug in configuration
 parsing.

 Will merge to 'master'.
 source: <pull.1273.git.git.1654038754.gitgitgadget@gmail.com>


* tl/ls-tree-oid-only (2022-06-03) 1 commit
  (merged to 'next' on 2022-06-07 at e1c1e0b25a)
 + ls-tree: test for the regression in 9c4d58ff2c3

 Add tests for a regression fixed earlier.

 Will merge to 'master'.
 source: <patch-v2-1.1-f2beb02dd29-20220603T102148Z-avarab@gmail.com>


* ds/bundle-uri-more (2022-06-06) 6 commits
 - fetch: add 'refs/bundle/' to log.excludeDecoration
 - bundle-uri: add support for http(s):// and file://
 - fetch: add --bundle-uri option
 - bundle-uri: create basic file-copy logic
 - remote-curl: add 'get' capability
 - docs: document bundle URI standard

 source: <pull.1248.git.1654545325.gitgitgadget@gmail.com>


* jc/revert-show-parent-info (2022-05-31) 2 commits
  (merged to 'next' on 2022-06-07 at e405211ff4)
 + revert: --reference should apply only to 'revert', not 'cherry-pick'
  (merged to 'next' on 2022-05-30 at b5da52dc14)
 + revert: optionally refer to commit in the "reference" format

 "git revert" learns "--reference" option to use more human-readable
 reference to the commit it reverts in the message template it
 prepares for the user.

 Will merge to 'master'.
 source: <xmqq8rqn7buk.fsf_-_@gitster.g>


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

 What's our take on this one?  IIRC, the last time we discussed,
 Carlo was hesitant to push this step forward?
 cf. <20220519152344.ktrifm3pc42bjruh@Carlos-MacBook-Pro-2.local>
 source: <20220513010020.55361-5-carenas@gmail.com>


* ab/hooks-regression-fix (2022-06-07) 2 commits
 - hook API: fix v2.36.0 regression: hooks should be connected to a TTY
 - run-command: add an "ungroup" option to run_process_parallel()

 In Git 2.36 we revamped the way how hooks are invoked.  One change
 that is end-user visible is that the output of a hook is no longer
 directly connected to the standard output of "git" that spawns the
 hook, which was noticed post release.  This is getting corrected.

 Will merge to 'next'.
 source: <cover-v6-0.2-00000000000-20220606T170356Z-avarab@gmail.com>


* gc/bare-repo-discovery (2022-06-07) 5 commits
 - setup.c: create `discovery.bare`
 - safe.directory: use git_protected_config()
 - config: read protected config with `git_protected_config()`
 - Documentation: define protected configuration
 - Documentation/git-config.txt: add SCOPES section

 Introduce a discovery.barerepository configuration variable that
 allows users to forbid discovery of bare repositories.

 Expecting a reroll.
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


* ab/env-array (2022-06-02) 2 commits
  (merged to 'next' on 2022-06-02 at e1e05318d3)
 + run-command API users: use "env" not "env_array" in comments & names
 + run-command API: rename "env_array" to "env"

 Rename .env_array member to .env in the child_process structure.

 Will merge to 'master'.
 source: <cover-v3-0.2-00000000000-20220602T090745Z-avarab@gmail.com>


* jh/builtin-fsmonitor-part3 (2022-05-26) 31 commits
  (merged to 'next' on 2022-06-02 at 3599e359b3)
 + t7527: improve implicit shutdown testing in fsmonitor--daemon
 + fsmonitor--daemon: allow --super-prefix argument
 + t7527: test Unicode NFC/NFD handling on MacOS
 + t/lib-unicode-nfc-nfd: helper prereqs for testing unicode nfc/nfd
 + t/helper/hexdump: add helper to print hexdump of stdin
 + fsmonitor: on macOS also emit NFC spelling for NFD pathname
 + t7527: test FSMonitor on case insensitive+preserving file system
 + fsmonitor: never set CE_FSMONITOR_VALID on submodules
 + t/perf/p7527: add perf test for builtin FSMonitor
 + t7527: FSMonitor tests for directory moves
 + fsmonitor: optimize processing of directory events
 + fsm-listen-darwin: shutdown daemon if worktree root is moved/renamed
 + fsm-health-win32: force shutdown daemon if worktree root moves
 + fsm-health-win32: add polling framework to monitor daemon health
 + fsmonitor--daemon: stub in health thread
 + fsmonitor--daemon: rename listener thread related variables
 + fsmonitor--daemon: prepare for adding health thread
 + fsmonitor--daemon: cd out of worktree root
 + fsm-listen-darwin: ignore FSEvents caused by xattr changes on macOS
 + unpack-trees: initialize fsmonitor_has_run_once in o->result
 + fsmonitor-settings: NTFS and FAT32 on MacOS are incompatible
 + fsmonitor-settings: remote repos on Windows are incompatible
 + fsmonitor-settings: remote repos on macOS are incompatible
 + fsmonitor-settings: stub in macOS-specific incompatibility checking
 + fsmonitor-settings: VFS for Git virtual repos are incompatible
 + fsmonitor-settings: stub in Win32-specific incompatibility checking
 + fsmonitor-settings: bare repos are incompatible with FSMonitor
 + t/helper/fsmonitor-client: create stress test
 + t7527: test FSMonitor on repos with Unicode root paths
 + fsm-listen-win32: handle shortnames
 + Merge branch 'jh/builtin-fsmonitor-part2' into jh/builtin-fsmonitor-part3

 More fsmonitor--daemon.

 Will merge to 'master'.
 source: <pull.1143.v9.git.1653601644.gitgitgadget@gmail.com>

--------------------------------------------------
[Discarded]

* jx/uniq-source-list (2022-05-25) 1 commit
 . Makefile: dedup git-ls-files output to prevent duplicate targets

 Build fix.

 Will discard.
 No longer needed with the updated jx/l10n-workflow-change.
 source: <20220526021540.2812-1-worldhello.net@gmail.com>


* et/xdiff-indirection (2022-02-17) 1 commit
 . xdiff: provide indirection to git functions

 Insert a layer of preprocessor macros for common functions in xdiff
 codebase.

 Will discard, as it has been stalled for way too long.
 cf. <xmqqbkyudb8n.fsf@gitster.g>
 source: <20220217225408.GB7@edef91d97c94>


* dl/prompt-pick-fix (2022-03-25) 1 commit
 . git-prompt: fix sequencer/todo detection

 Fix shell prompt script (in contrib/) for those who set
 rebase.abbreviateCommands; we failed to recognize that we were in a
 multi-step cherry-pick session.

 Will discard, as it has been stalled for way too long.
 cf. <xmqqwngdzque.fsf@gitster.g>
 source: <20220325145301.3370-1-danny0838@gmail.com>


* es/superproject-aware-submodules (2022-03-09) 3 commits
 . rev-parse: short-circuit superproject worktree when config unset
 . introduce submodule.hasSuperproject record
 . t7400-submodule-basic: modernize inspect() helper

 A configuration variable in a repository tells if it is (or is not)
 a submodule of a superproject.

 Will discard, as it has been stalled for way too long.
 cf. <kl6l4k45s7cb.fsf@chooglen-macbookpro.roam.corp.google.com>
 source: <20220310004423.2627181-1-emilyshaffer@google.com>


* sg/build-gitweb (2022-05-25) 1 commit
 . Makefile: build 'gitweb' in the default target

 "make all" should but didn't build "gitweb".

 Will discard.
 cf. <220526.86k0a96sv2.gmgdl@evledraar.gmail.com>
 cf. <Yo8y3AHWa3PChLwd@coredump.intra.peff.net>
 source: <20220525205651.825669-1-szeder.dev@gmail.com>
