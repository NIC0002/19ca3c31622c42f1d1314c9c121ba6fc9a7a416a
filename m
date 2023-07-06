Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25045EB64DA
	for <git@archiver.kernel.org>; Thu,  6 Jul 2023 01:05:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231835AbjGFBFg (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 5 Jul 2023 21:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbjGFBFf (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 5 Jul 2023 21:05:35 -0400
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C21D1989
        for <git@vger.kernel.org>; Wed,  5 Jul 2023 18:05:32 -0700 (PDT)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
        by pb-smtp20.pobox.com (Postfix) with ESMTP id 62146351BA;
        Wed,  5 Jul 2023 21:05:25 -0400 (EDT)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to
        :subject:date:message-id:mime-version:content-type; s=sasl; bh=t
        AdYXvE+FhGr742zLrZtA09UN74NRdrN7ZG5iYUW6Ic=; b=cEuDkZP8hFG0EAUlZ
        tVX1QbqAW2THKRKsp0t/efkrtO8/zGVc06AARmPjB6SQzUUqOMQfxXzXAwEBjr39
        tvsafD3nt9J3UsG5W38xcBcC9XNooa01VzZlN+4Awrh067ZITha83WxhqV/DK/b+
        yfjn/6ccuoVwRYgbWAI87ieY6E=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp20.pobox.com (Postfix) with ESMTP id 5A8E5351B9;
        Wed,  5 Jul 2023 21:05:25 -0400 (EDT)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [35.233.135.164])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp20.pobox.com (Postfix) with ESMTPSA id E55E9351B8;
        Wed,  5 Jul 2023 21:05:21 -0400 (EDT)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Jul 2023, #01; Wed, 5)
X-master-at: a646b86cd10282de2ceb64ef33b5412e4fb2a54c
X-next-at: a8219df2e13870c2093740ee0a3038d600051289
Date:   Wed, 05 Jul 2023 18:05:19 -0700
Message-ID: <xmqqedllvohc.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID: 2E85DDBA-1B99-11EE-B267-C2DA088D43B2-77302942!pb-smtp20.pobox.com
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

I expect the rest of the week would also be slower than usual.
There are quite a few good topics cooking, though.

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

 Add more "git var" for toolsmiths to learn various locations Git is
 configured with either via the configuration or hardcoded defaults.
 source: <20230627161902.754472-1-sandals@crustytoothpaste.net>


* ps/revision-stdin-with-options (2023-06-15) 3 commits
  (merged to 'next' on 2023-06-26 at eda3e4d0b5)
 + revision: handle pseudo-opts in `--stdin` mode
 + revision: small readability improvement for reading from stdin
 + revision: reorder `read_revisions_from_stdin()`

 The set-up code for the get_revision() API now allows feeding
 options like --all and --not in the --stdin mode.
 source: <cover.1686839572.git.ps@pks.im>

--------------------------------------------------
[New Topics]

* cw/compat-util-header-cleanup (2023-07-05) 6 commits
 - git-compat-util: move alloc macros to git-compat-util.h
 - treewide: remove unnecessary includes for wrapper.h
 - kwset: move translation table from ctype
 - sane-ctype.h: create header for sane-ctype macros
 - git-compat-util: move wrapper.c funcs to its header
 - git-compat-util: move strbuf.c funcs to its header

 Further shuffling of declarations across header files to streamline
 file dependencies.

 Will merge to 'next'?
 source: <20230705170812.3833103-1-calvinwan@google.com>


* jk/imap-send-unused-variable-cleanup (2023-07-05) 3 commits
 - imap-send: drop unused fields from imap_cmd_cb
 - imap-send: drop unused parameter from imap_cmd_cb callback
 - imap-send: use server conf argument in setup_curl()

 "imap-send" codepaths got cleaned up to get rid of unused
 parameters.

 Will merge to 'next'.
 source: <20230703063247.GA3524302@coredump.intra.peff.net>


* ma/t0091-fixup (2023-07-05) 1 commit
 - t0091-bugreport.sh: actually verify some content of report

 "git bugreport" tests did not test what it wanted to test, which
 has been corrected.

 Will merge to 'next'.
 source: <20230705183532.3057433-1-martin.agren@gmail.com>


* rs/packet-length-simplify (2023-07-04) 1 commit
 - pkt-line: don't check string length in packet_length()

 Code simplification.

 Will merge to 'next'?
 source: <89d58db7-6a01-b3fa-54f0-19d5a3819eb3@web.de>

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

* jk/cherry-pick-revert-status (2023-06-27) 1 commit
  (merged to 'next' on 2023-06-28 at 4a0d88ef7a)
 + fix cherry-pick/revert status when doing multiple commits

 During a cherry-pick or revert session that works on multiple
 commits, "git status" did not give correct information, which has
 been corrected.

 Will merge to 'master'.
 source: <20230627224230.1951135-1-jacob.e.keller@intel.com>


* ks/t4205-test-describe-with-abbrev-fix (2023-06-29) 1 commit
  (merged to 'next' on 2023-06-29 at 5fc309dc75)
 + t4205: correctly test %(describe:abbrev=...)

 Test update.

 Will merge to 'master'.
 source: <20230629133841.18784-2-five231003@gmail.com>


* jk/fsck-indices-in-worktrees (2023-06-29) 1 commit
  (merged to 'next' on 2023-06-29 at 9d245b3681)
 + fsck: avoid misleading variable name

 Code clarification.

 Will merge to 'master'.
 source: <20230629181333.87465-1-ericsunshine@charter.net>


* js/empty-index-fixes (2023-06-29) 3 commits
  (merged to 'next' on 2023-06-29 at cdfd131900)
 + commit -a -m: allow the top-level tree to become empty again
 + split-index: accept that a base index can be empty
 + do_read_index(): always mark index as initialized unless erroring out

 A few places failed to differenciate the case where the index is
 truly empty (nothing added) and we haven't yet read from the
 on-disk index file, which have been corrected.

 Will merge to 'master'.
 source: <pull.1554.git.1688044991.gitgitgadget@gmail.com>


* vd/adjust-mfow-doc-to-updated-headers (2023-07-04) 1 commit
 - docs: add necessary headers to Documentation/MFOW.txt

 Code snippets in a tutorial document no longer compiled after
 recent header shuffling, which have been corrected.

 Will merge to 'next'?
 source: <20230702151457.3227-1-vinayakdev.sci@gmail.com>


* mh/credential-erase-improvements-more (2023-06-24) 2 commits
 - credential/wincred: erase matching creds only
 - credential/libsecret: erase matching creds only

 Needs review.
 source: <pull.1529.git.git.1687596777147.gitgitgadget@gmail.com>


* gc/config-context (2023-06-28) 11 commits
  (merged to 'next' on 2023-06-28 at 38632f3daf)
 + config: pass source to config_parser_event_fn_t
 + config: add kvi.path, use it to evaluate includes
 + config.c: remove config_reader from configsets
 + config: pass kvi to die_bad_number()
 + trace2: plumb config kvi
 + config.c: pass ctx with CLI config
 + config: pass ctx with config files
 + config.c: pass ctx in configsets
 + config: add ctx arg to config_fn_t
 + urlmatch.h: use config_fn_t type
 + config: inline git_color_default_config

 Reduce reliance on a global state in the config reading API.

 Will merge to 'master'.
 source: <pull.1497.v5.git.git.1687980390.gitgitgadget@gmail.com>


* gc/config-partial-submodule-kvi-fix (2023-06-26) 1 commit
  (merged to 'next' on 2023-06-28 at 1fb30a34e3)
 + config: don't BUG when both kvi and source are set

 Partially revert a sanity check that the rest of the config code
 was not ready, to avoid triggering it in a corner case.

 Will merge to 'master'.
 source: <pull.1535.git.git.1687801297404.gitgitgadget@gmail.com>


* pw/apply-too-large (2023-06-26) 1 commit
  (merged to 'next' on 2023-06-28 at c0460d682c)
 + apply: improve error messages when reading patch

 "git apply" punts when it is fed too large a patch input; the error
 message it gives when it happens has been clarified.

 Will merge to 'master'.
 source: <pull.1552.git.1687772253869.gitgitgadget@gmail.com>


* pw/diff-no-index-from-named-pipes (2023-07-05) 4 commits
 - diff --no-index: support reading from named pipes
 - t4054: test diff --no-index with stdin
 - diff --no-index: die on error reading stdin
 - diff --no-index: refuse to compare stdin to a directory

 "git diff --no-index" learned to read from named pipes as if they
 were regular files, to allow "git diff <(process) <(substitution)"
 some shells support.

 Will merge to 'next'.
 source: <cover.1688586536.git.phillip.wood@dunelm.org.uk>


* jc/doc-hash-object-types (2023-06-28) 1 commit
  (merged to 'next' on 2023-06-28 at adff1700c2)
 + docs: add git hash-object -t option's possible values

 Doc update.

 Will merge to 'master'.
 source: <pull.1533.v3.git.git.1688004473941.gitgitgadget@gmail.com>


* cc/repack-sift-filtered-objects-to-separate-pack (2023-07-05) 8 commits
 - gc: add `gc.repackFilterTo` config option
 - repack: implement `--filter-to` for storing filtered out objects
 - gc: add `gc.repackFilter` config option
 - repack: add `--filter=<filter-spec>` option
 - repack: refactor finding pack prefix
 - repack: refactor finishing pack-objects command
 - t/helper: add 'find-pack' test-tool
 - pack-objects: allow `--filter` without `--stdout`

 "git repack" machinery learns to pay attention to the "--filter="
 option.

 Comments?
 cf. <xmqqh6qi1byn.fsf@gitster.g>
 source: <20230705060812.2865188-1-christian.couder@gmail.com>


* rs/strbuf-expand-step (2023-06-18) 5 commits
  (merged to 'next' on 2023-06-28 at 1918915b71)
 + strbuf: simplify strbuf_expand_literal_cb()
 + replace strbuf_expand() with strbuf_expand_step()
 + replace strbuf_expand_dict_cb() with strbuf_expand_step()
 + strbuf: factor out strbuf_expand_step()
 + pretty: factor out expand_separator()

 Code clean-up around strbuf_expand() API.

 Will merge to 'master'.
 source: <767baa64-20a6-daf2-d34b-d81f72363749@web.de>


* js/doc-unit-tests (2023-06-30) 1 commit
 - unit tests: Add a project plan document

 Process to add some form of low-level unit tests has started.

 Still filling in blanks.
 source: <0169ce6fb9ccafc089b74ae406db0d1a8ff8ac65.1688165272.git.steadmon@google.com>


* mh/mingw-case-sensitive-build (2023-06-12) 1 commit
 - mingw: use lowercase includes for some Windows headers

 Names of MinGW header files are spelled in mixed case in some
 source files, but the build host can be using case sensitive
 filesystem with header files with their name spelled in all
 lowercase.

 Needs review.
 source: <20230604211934.1365289-1-mh@glandium.org>


* pb/complete-diff-options (2023-06-26) 24 commits
  (merged to 'next' on 2023-06-28 at ccff93557d)
 + diff.c: mention completion above add_diff_options
 + completion: complete --remerge-diff
 + completion: complete --diff-merges, its options and --no-diff-merges
 + completion: move --pickaxe-{all,regex} to __git_diff_common_options
 + completion: complete --ws-error-highlight
 + completion: complete --unified
 + completion: complete --output-indicator-{context,new,old}
 + completion: complete --output
 + completion: complete --no-stat
 + completion: complete --no-relative
 + completion: complete --line-prefix
 + completion: complete --ita-invisible-in-index and --ita-visible-in-index
 + completion: complete --irreversible-delete
 + completion: complete --ignore-matching-lines
 + completion: complete --function-context
 + completion: complete --find-renames
 + completion: complete --find-object
 + completion: complete --find-copies
 + completion: complete --default-prefix
 + completion: complete --compact-summary
 + completion: complete --combined-all-paths
 + completion: complete --cc
 + completion: complete --break-rewrites
 + completion: add comments describing __git_diff_* globals

 Completion updates.

 Will merge to 'master'.
 source: <pull.1543.v3.git.1687796688.gitgitgadget@gmail.com>


* ks/ref-filter-signature (2023-06-06) 2 commits
 - ref-filter: add new "signature" atom
 - t/lib-gpg: introduce new prereq GPG2

 The "git for-each-ref" family of commands learned placeholders
 related to GPG signature verification.

 Will merge to 'next'.
 cf. <CAP8UFD1CfUm+9PTXO0wBBdBs0U=YVte+EiPbDyUyg7T152aw2g@mail.gmail.com>
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

 Under discussion.
 source: <cover.1687270849.git.me@ttaylorr.com>


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
  (merged to 'next' on 2023-06-28 at c158b004a8)
 + strbuf: remove global variable
 + path: move related function to path
 + object-name: move related functions to object-name
 + credential-store: move related functions to credential-store file
 + abspath: move related functions to abspath
 + strbuf: clarify dependency
 + strbuf: clarify API boundary

 Move functions that are not about pure string manipulation out of
 strbuf.[ch]

 Will merge to 'master'.
 source: <20230606194720.2053551-1-calvinwan@google.com>


* tl/notes-separator (2023-06-21) 7 commits
  (merged to 'next' on 2023-06-28 at 74fa459f4d)
 + notes: introduce "--no-separator" option
 + notes.c: introduce "--[no-]stripspace" option
 + notes.c: append separator instead of insert by pos
 + notes.c: introduce '--separator=<paragraph-break>' option
 + t3321: add test cases about the notes stripspace behavior
 + notes.c: use designated initializers for clarity
 + notes.c: cleanup 'strbuf_grow' call in 'append_edit'

 'git notes append' was taught '--separator' to specify string to insert
 between paragraphs.

 Will merge to 'master'.
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
