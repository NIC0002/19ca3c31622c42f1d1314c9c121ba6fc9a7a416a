Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56231EB64D9
	for <git@archiver.kernel.org>; Tue, 27 Jun 2023 22:11:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbjF0WL1 (ORCPT <rfc822;git@archiver.kernel.org>);
        Tue, 27 Jun 2023 18:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjF0WLZ (ORCPT <rfc822;git@vger.kernel.org>);
        Tue, 27 Jun 2023 18:11:25 -0400
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC0C51BD5
        for <git@vger.kernel.org>; Tue, 27 Jun 2023 15:11:22 -0700 (PDT)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 9E79B1E84F;
        Tue, 27 Jun 2023 18:11:20 -0400 (EDT)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to
        :subject:date:message-id:mime-version:content-type; s=sasl; bh=y
        8oHpuVhyymM8MrdoFFkJnPmvOHzyunL+HeQ3ldX790=; b=oCUjjB7UiHaGCohVA
        T4xQHTiJ4xkUhKulK7BfWwq3Onzy/LMhY/XPMfaFpN7CuJktMHFqWqwBEMpiW2zc
        jWj54xmPl6TZhwi6L2b3773QCQxsd6qyuvP/wQ1LqiQYc1WqezO/3fmqbEhkM3M9
        P/BUSKvk+ClCgKrF16hu+cDGYU=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 96C931E84E;
        Tue, 27 Jun 2023 18:11:20 -0400 (EDT)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [35.233.135.164])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp21.pobox.com (Postfix) with ESMTPSA id AF9611E84C;
        Tue, 27 Jun 2023 18:11:17 -0400 (EDT)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Jun 2023, #07; Tue, 27)
X-master-at: a9e066fa63149291a55f383cfa113d8bdbdaa6b3
X-next-at: ea14687e91835d59149e0866d2a4cde22a5e5c3a
Date:   Tue, 27 Jun 2023 15:11:16 -0700
Message-ID: <xmqqcz1gftdn.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID: 89FA57B0-1537-11EE-867A-B31D44D1D7AA-77302942!pb-smtp21.pobox.com
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Here are the topics that have been cooking in my tree.  Commits
prefixed with '+' are in 'next' (being in 'next' is a sign that a
topic is stable enough to be used and are candidate to be in a
future release).  Commits prefixed with '-' are only in 'seen', and
aren't considered "accepted" at all and may be annotated with an URL
to a message that raises issues but they are no means exhaustive.  A
topic without enough support may be discarded after a long period of
no activity (of course they can be resubmit when new interests
arise).

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

* jk/commit-use-no-divider-with-interpret-trailers (2023-06-16) 1 commit
  (merged to 'next' on 2023-06-20 at 08e5f2a6b5)
 + commit: pass --no-divider to interpret-trailers

 When "git commit --trailer=..." invokes the interpret-trailers
 machinery, it knows what it feeds to interpret-trailers is a full
 log message without any patch, but failed to express that by
 passing the "--no-divider" option, which has been corrected.
 source: <20230617042624.GA562686@coredump.intra.peff.net>


* jk/redact-h2h3-headers-fix (2023-06-17) 1 commit
  (merged to 'next' on 2023-06-20 at c1247fd527)
 + http: handle both "h2" and "h2h3" in curl info lines

 Curl library recently changed how http2 traces are shown and broke
 the code to redact sensitive info header, which has been fixed.

 The GitHub Actions CI has been broken for recent macOS jobs, so
 this topic has been fast-tracked to help them.
 source: <20230617051559.GD562686@coredump.intra.peff.net>


* tb/collect-pack-filenames-fix (2023-06-12) 1 commit
  (merged to 'next' on 2023-06-20 at abcc6892c8)
 + builtin/repack.c: only collect fully-formed packs

 Avoid breakage of "git pack-objects --cruft" due to inconsistency
 between the way the code enumerates packfiles in the repository.
 source: <20230607101617.ges6tnMry4E52lDGld43QgtNUsIS4YQq6w-t71hEfkQ@z>

--------------------------------------------------
[New Topics]

* mh/credential-erase-improvements-more (2023-06-24) 2 commits
 - credential/wincred: erase matching creds only
 - credential/libsecret: erase matching creds only

 Needs review.
 source: <pull.1529.git.git.1687596777147.gitgitgadget@gmail.com>


* tb/gc-recent-object-hook (2023-06-24) 1 commit
  (merged to 'next' on 2023-06-24 at e8c295841b)
 + t7701: make annotated tag unreachable

 Test update.

 Will merge to 'master'.
 source: <259b1b559114ab1a9a0bd7f1ad29a4cba2612ae0.1687617197.git.me@ttaylorr.com>


* gc/config-context (2023-06-26) 12 commits
 - config: pass source to config_parser_event_fn_t
 - config: add kvi.path, use it to evaluate includes
 - config.c: remove config_reader from configsets
 - config: pass kvi to die_bad_number()
 - trace2: plumb config kvi
 - config.c: pass ctx with CLI config
 - builtin/config.c: test misuse of format_config()
 - config: pass ctx with config files
 - config.c: pass ctx in configsets
 - config: add ctx arg to config_fn_t
 - urlmatch.h: use config_fn_t type
 - config: inline git_color_default_config

 source: <pull.1497.v4.git.git.1687803083.gitgitgadget@gmail.com>


* gc/config-partial-submodule-kvi-fix (2023-06-26) 1 commit
 - config: don't BUG when both kvi and source are set

 source: <pull.1535.git.git.1687801297404.gitgitgadget@gmail.com>


* pw/apply-too-large (2023-06-26) 1 commit
 - apply: improve error messages when reading patch

 source: <pull.1552.git.1687772253869.gitgitgadget@gmail.com>


* pw/diff-no-index-from-named-pipes (2023-06-27) 3 commits
 . diff --no-index: support reading from named pipes
 . t4054: test diff --no-index with stdin
 . diff --no-index: die on error reading stdin

 source: <cover.1687874975.git.phillip.wood@dunelm.org.uk>

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


* es/recurse-submodules-option-is-a-bool (2023-04-10) 1 commit
 - usage: clarify --recurse-submodules as a boolean

 The "--[no-]recurse-submodules" option of "git checkout" and others
 supported an undocumented syntax --recurse-submodules=<value> where
 the value can spell a Boolean in various ways.  The support for the
 syntax is being dropped.

 Expecting a reroll.
 cf. <ZDSTFwMFO7vbj/du@google.com>
 source: <ZDSTFwMFO7vbj/du@google.com>


* cb/checkout-same-branch-twice (2023-03-22) 2 commits
 - SQUASH??? the test marked to expect failure passes from day one
 - checkout/switch: disallow checking out same branch in multiple worktrees

 "git checkout -B $branch" failed to protect against checking out
 a branch that is checked out elsewhere, unlike "git branch -f" did.

 Expecting a hopefully minor and final reroll.
 cf. <CAPUEspj_Bh+LgYLnWfeBdcq_uV5Cbou-7H51GLFjzSa5Qzby9w@mail.gmail.com>
 source: <20230120113553.24655-1-carenas@gmail.com>


* tk/pull-conflict-suggest-rebase-merge-not-rebase-true (2023-02-13) 1 commit
 - pull: conflict hint pull.rebase suggestion should offer "merges" vs "true"

 In an advice message after failed non-ff pull, we used to suggest
 setting pull.rebase=true, but these days pull.rebase=merges may be
 more inline with the original spirit of "rebuild your side on top
 of theirs".

 May want to discard.
 This is too much of a departure from the existing practice.
 cf. <CAMMLpeTPEoKVTbfc17w+Y9qn7jOGmQi_Ux0Y3sFW5QTgGWJ=SA@mail.gmail.com>
 cf. <CABPp-BGqAxKnxDRVN4cYMteLp33hvto07R3=TJBT5WubJT4+Og@mail.gmail.com>
 source: <pull.1474.git.1675614276549.gitgitgadget@gmail.com>


* ab/tag-object-type-errors (2023-05-10) 4 commits
 - tag: don't emit potentially incorrect "object is a X, not a Y"
 - tag: don't misreport type of tagged objects in errors
 - object tests: add test for unexpected objects in tags
 - Merge branch 'jk/parse-object-type-mismatch' into ab/tag-object-type-errors

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

 Assorted updates to "--diff-merges=X" option.

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

* ds/remove-idx-before-pack (2023-06-20) 1 commit
  (merged to 'next' on 2023-06-23 at fa97bf0e41)
 + packfile: delete .idx files before .pack files

 We create .pack and then .idx, we consider only packfiles that have
 .idx usable (those with only .pack are not ready yet), so we should
 remove .idx before removing .pack for consistency.

 Will merge to 'master'.
 source: <pull.1547.git.1687287675248.gitgitgadget@gmail.com>


* bc/more-git-var (2023-06-27) 8 commits
  (merged to 'next' on 2023-06-27 at ea14687e91)
 + var: add config file locations
 + var: add attributes files locations
 + attr: expose and rename accessor functions
 + var: adjust memory allocation for strings
 + var: format variable structure with C99 initializers
 + var: add support for listing the shell
 + t: add a function to check executable bit
 + var: mark unused parameters in git_var callbacks
<<
* bc/more-git-var (2023-06-27) 8 commits
 . var: add config file locations
 . var: add attributes files locations
 . attr: expose and rename accessor functions
 . var: adjust memory allocation for strings
 . var: format variable structure with C99 initializers
 . var: add support for listing the shell
 . t: add a function to check executable bit
 . var: mark unused parameters in git_var callbacks
>>

 Add more "git var" for toolsmiths to learn various locations Git is
 configured with either via the configuration or hardcoded defaults.

 Will merge to 'master'.
 source: <20230627161902.754472-1-sandals@crustytoothpaste.net>


* jc/doc-hash-object-types (2023-06-23) 1 commit
 - docs: add git hash-object -t option's possible values

 Doc update.

 Will merge to 'next'.
 source: <pull.1533.v2.git.git.1687555504551.gitgitgadget@gmail.com>


* jc/abort-ll-merge-with-a-signal (2023-06-23) 2 commits
  (merged to 'next' on 2023-06-24 at 685eb5d25c)
 + t6406: skip "external merge driver getting killed by a signal" test on Windows
  (merged to 'next' on 2023-06-23 at 9c9c37e95e)
 + ll-merge: killing the external merge driver aborts the merge

 When the external merge driver is killed by a signal, its output
 should not be trusted as a resolution with conflicts that is
 proposed by the driver, but the code did.

 Will merge to 'master'.
 source: <xmqq4jmzc91e.fsf_-_@gitster.g>


* cc/repack-sift-filtered-objects-to-separate-pack (2023-06-14) 9 commits
 - gc: add `gc.repackFilterTo` config option
 - repack: implement `--filter-to` for storing filtered out objects
 - gc: add `gc.repackFilter` config option
 - repack: add `--filter=<filter-spec>` option
 - repack: refactor finishing pack-objects command
 - repack: refactor piping an oid to a command
 - t/helper: add 'find-pack' test-tool
 - pack-objects: add `--print-filtered` to print omitted objects
 - pack-objects: allow `--filter` without `--stdout`

 "git repack" machinery learns to pay attention to the "--filter="
 option.

 Needs review.
 source: <20230614192541.1599256-1-christian.couder@gmail.com>


* ps/revision-stdin-with-options (2023-06-15) 3 commits
  (merged to 'next' on 2023-06-26 at eda3e4d0b5)
 + revision: handle pseudo-opts in `--stdin` mode
 + revision: small readability improvement for reading from stdin
 + revision: reorder `read_revisions_from_stdin()`

 The set-up code for the get_revision() API now allows feeding
 options like --all and --not in the --stdin mode.

 Will merge to 'master'.
 source: <cover.1686839572.git.ps@pks.im>


* rs/strbuf-expand-step (2023-06-18) 5 commits
 - strbuf: simplify strbuf_expand_literal_cb()
 - replace strbuf_expand() with strbuf_expand_step()
 - replace strbuf_expand_dict_cb() with strbuf_expand_step()
 - strbuf: factor out strbuf_expand_step()
 - pretty: factor out expand_separator()

 Code clean-up around strbuf_expand() API.

 Will merge to 'next'.
 source: <767baa64-20a6-daf2-d34b-d81f72363749@web.de>


* js/doc-unit-tests (2023-06-13) 1 commit
 - unit tests: Add a project plan document

 Process to add some form of low-level unit tests has started.

 Comments?  Filling in blanks?
 source: <8afdb215d7e10ca16a2ce8226b4127b3d8a2d971.1686352386.git.steadmon@google.com>


* mh/mingw-case-sensitive-build (2023-06-12) 1 commit
 - mingw: use lowercase includes for some Windows headers

 Names of MinGW header files are spelled in mixed case in some
 source files, but the build host can be using case sensitive
 filesystem with header files with their name spelled in all
 lowercase.

 Needs review.
 source: <20230604211934.1365289-1-mh@glandium.org>


* pb/complete-diff-options (2023-06-26) 24 commits
 - diff.c: mention completion above add_diff_options
 - completion: complete --remerge-diff
 - completion: complete --diff-merges, its options and --no-diff-merges
 - completion: move --pickaxe-{all,regex} to __git_diff_common_options
 - completion: complete --ws-error-highlight
 - completion: complete --unified
 - completion: complete --output-indicator-{context,new,old}
 - completion: complete --output
 - completion: complete --no-stat
 - completion: complete --no-relative
 - completion: complete --line-prefix
 - completion: complete --ita-invisible-in-index and --ita-visible-in-index
 - completion: complete --irreversible-delete
 - completion: complete --ignore-matching-lines
 - completion: complete --function-context
 - completion: complete --find-renames
 - completion: complete --find-object
 - completion: complete --find-copies
 - completion: complete --default-prefix
 - completion: complete --compact-summary
 - completion: complete --combined-all-paths
 - completion: complete --cc
 - completion: complete --break-rewrites
 - completion: add comments describing __git_diff_* globals

 Completion updates.

 Will merge to 'next'.
 source: <pull.1543.v3.git.1687796688.gitgitgadget@gmail.com>


* ks/ref-filter-signature (2023-06-06) 2 commits
 - ref-filter: add new "signature" atom
 - t/lib-gpg: introduce new prereq GPG2

 The "git for-each-ref" family of commands learned placeholders
 related to GPG signature verification.

 Needs review.
 source: <20230604185815.15761-1-five231003@gmail.com>


* jt/path-filter-fix (2023-06-13) 4 commits
 - commit-graph: new filter ver. that fixes murmur3
 - repo-settings: introduce commitgraph.changedPathsVersion
 - t4216: test changed path filters with high bit paths
 - gitformat-commit-graph: describe version 2 of BDAT

 The Bloom filter used for path limited history traversal was broken
 on systems whose "char" is unsigned; update the implementation and
 bump the format version to 2.

 Expecting a reroll.
 cf. <c7b66d2c-cdc3-1f0f-60a0-a2ee21c277bf@github.com>
 source: <cover.1686677910.git.jonathantanmy@google.com>


* tk/cherry-pick-sequence-requires-clean-worktree (2023-06-01) 1 commit
 - cherry-pick: refuse cherry-pick sequence if index is dirty

 "git cherry-pick A" that replays a single commit stopped before
 clobbering local modification, but "git cherry-pick A..B" did not,
 which has been corrected.

 Expecting a reroll.
 cf. <999f12b2-38d6-f446-e763-4985116ad37d@gmail.com>
 source: <pull.1535.v2.git.1685264889088.gitgitgadget@gmail.com>


* mh/credential-libsecret-attrs (2023-06-16) 1 commit
 - credential/libsecret: store new attributes

 The way authentication related data other than passwords (e.g.
 oath token and password expiration data) are stored in libsecret
 keyrings has been rethought.

 Needs review.
 source: <pull.1469.v5.git.git.1686945306242.gitgitgadget@gmail.com>


* tb/refs-exclusion-and-packed-refs (2023-06-20) 16 commits
 - ls-refs.c: avoid enumerating hidden refs where possible
 - upload-pack.c: avoid enumerating hidden refs where possible
 - builtin/receive-pack.c: avoid enumerating hidden references
 - refs.h: let `for_each_namespaced_ref()` take excluded patterns
 - refs/packed-backend.c: ignore complicated hidden refs rules
 - revision.h: store hidden refs in a `strvec`
 - refs/packed-backend.c: add trace2 counters for jump list
 - refs/packed-backend.c: implement jump lists to avoid excluded pattern(s)
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
 source: <cover.1687270849.git.me@ttaylorr.com>


* en/header-split-cache-h-part-3 (2023-06-21) 28 commits
  (merged to 'next' on 2023-06-23 at 84ad22bf36)
 + fsmonitor-ll.h: split this header out of fsmonitor.h
 + hash-ll, hashmap: move oidhash() to hash-ll
 + object-store-ll.h: split this header out of object-store.h
 + khash: name the structs that khash declares
 + merge-ll: rename from ll-merge
 + git-compat-util.h: remove unneccessary include of wildmatch.h
 + builtin.h: remove unneccessary includes
 + list-objects-filter-options.h: remove unneccessary include
 + diff.h: remove unnecessary include of oidset.h
 + repository: remove unnecessary include of path.h
 + log-tree: replace include of revision.h with simple forward declaration
 + cache.h: remove this no-longer-used header
 + read-cache*.h: move declarations for read-cache.c functions from cache.h
 + repository.h: move declaration of the_index from cache.h
 + merge.h: move declarations for merge.c from cache.h
 + diff.h: move declaration for global in diff.c from cache.h
 + preload-index.h: move declarations for preload-index.c from elsewhere
 + sparse-index.h: move declarations for sparse-index.c from cache.h
 + name-hash.h: move declarations for name-hash.c from cache.h
 + run-command.h: move declarations for run-command.c from cache.h
 + statinfo: move stat_{data,validity} functions from cache/read-cache
 + read-cache: move shared add/checkout/commit code
 + add: modify add_files_to_cache() to avoid globals
 + read-cache: move shared commit and ls-files code
 + setup: adopt shared init-db & clone code
 + init-db, clone: change unnecessary global into passed parameter
 + init-db: remove unnecessary global variable
 + init-db: document existing bug with core.bare in template config

 Header files cleanup.

 Will merge to 'master'.
 source: <pull.1525.v3.git.1684218848.gitgitgadget@gmail.com>


* cc/git-replay (2023-06-03) 15 commits
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

 source: <20230602102533.876905-1-christian.couder@gmail.com>


* ob/revert-of-revert (2023-05-05) 1 commit
 - sequencer: beautify subject of reverts of reverts

 Instead of "Revert "Revert "original"", give "Reapply "original""
 as the title for a revert of a revert.

 Expecting a hopefully final reroll.
 Looking much better, except for minor cosmetic issues.
 source: <20230428083528.1699221-1-oswald.buddenhagen@gmx.de>


* cw/strbuf-cleanup (2023-06-12) 7 commits
 - strbuf: remove global variable
 - path: move related function to path
 - object-name: move related functions to object-name
 - credential-store: move related functions to credential-store file
 - abspath: move related functions to abspath
 - strbuf: clarify dependency
 - strbuf: clarify API boundary

 Move functions that are not about pure string manipulation out of
 strbuf.[ch]

 Will merge to 'next'.
 source: <20230606194720.2053551-1-calvinwan@google.com>


* tl/notes-separator (2023-06-21) 7 commits
 - notes: introduce "--no-separator" option
 - notes.c: introduce "--[no-]stripspace" option
 - notes.c: append separator instead of insert by pos
 - notes.c: introduce '--separator=<paragraph-break>' option
 - t3321: add test cases about the notes stripspace behavior
 - notes.c: use designated initializers for clarity
 - notes.c: cleanup 'strbuf_grow' call in 'append_edit'

 'git notes append' was taught '--separator' to specify string to insert
 between paragraphs.
 source: <cover.1685174011.git.dyroneteng@gmail.com>


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

--------------------------------------------------
[Discarded]

* mh/credential-password-expiry-libsecret (2023-05-05) 1 commit
 . credential/libsecret: support password_expiry_utc

 Originally merged to 'next' on 2023-05-09

 The libsecret credential helper learns to handle the password
 expiry time information.

 Superseded by mh/credential-libsecret-attrs.
 cf. <CAGJzqskMwOJkriH6serqdwAVYi+fftEL8ohJd-suP6v+OxB_bg@mail.gmail.com>
 source: <pull.1469.v3.git.git.1683270298313.gitgitgadget@gmail.com>


* tb/pack-bitmap-index-seek (2023-03-20) 6 commits
 . pack-bitmap.c: factor out `bitmap_index_seek_commit()`
 . pack-bitmap.c: use `bitmap_index_seek()` where possible
 . pack-bitmap.c: factor out manual `map_pos` manipulation
 . pack-bitmap.c: drop unnecessary 'inline's
 . pack-bitmap.c: hide bitmap internals in `read_be32()`
 . pack-bitmap.c: hide bitmap internals in `read_u8()`

 Clean-up the pack-bitmap codepath.

 Retracted for now.
 cf. <ZJCI6FHtbuOKPlV1@nand.local>
 source: <cover.1679342296.git.me@ttaylorr.com>


* js/cmake-wo-cache-h (2023-06-15) 1 commit
 . cmake: adapt to `cache.h` being no more

 Build fix in en/header-split-cache-h-part-3 topic.

 Ejected out of 'next' and made into a part of en/header-split-cache-h-part-3
 source: <pull.1525.v3.git.1684218848.gitgitgadget@gmail.com>


* jc/notes-separator-fix (2023-06-13) 7 commits
 . notes: do not access before the beginning of an array

 Fix to tl/notes-separator topic.

 Discarded as the updated base topic should not require it anymore.
 source: <cover.1682671758.git.dyroneteng@gmail.com>
