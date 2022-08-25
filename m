Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB28C04AA5
	for <git@archiver.kernel.org>; Thu, 25 Aug 2022 05:20:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232271AbiHYFUh (ORCPT <rfc822;git@archiver.kernel.org>);
        Thu, 25 Aug 2022 01:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbiHYFUf (ORCPT <rfc822;git@vger.kernel.org>);
        Thu, 25 Aug 2022 01:20:35 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C007C9E6B8
        for <git@vger.kernel.org>; Wed, 24 Aug 2022 22:20:32 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id f4so15084006pgc.12
        for <git@vger.kernel.org>; Wed, 24 Aug 2022 22:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender:from
         :to:cc;
        bh=bUXme1o/Rid1vhyN1puqqBrNCRYj2+F8uLKaxhzzZQ0=;
        b=fqzIxa9bRbeMFbNGIm77KCYxu+hdxPL8IGfOhvyEYaY6w0WDBPNNFbnQXOowS2PuUq
         N8PQFlD5M2c0fSVBctdR3OaX2IIXn3ql4Lr7yCgxTl6ewnmHvdP4NnMjIjFUIU3ZAivR
         9MR7/0O5PTPjW90QWALJLdCF8h0UI82Gn4h0/alxAF5xIBF3xd2Kwz1OjSPaXjL2P305
         Ch9W3hIDOqPoKSErFDhElF/nQkxYFCT5UX6u13m0ttv/cCruIgvIl82rjc97LfhwbJ0W
         oMPBJqWUjSGnbfZa7GjagmWzykaBR6dVqClo++hGp3s2FOTExHuTZebPIp1MaBNimgzY
         g3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender
         :x-gm-message-state:from:to:cc;
        bh=bUXme1o/Rid1vhyN1puqqBrNCRYj2+F8uLKaxhzzZQ0=;
        b=Pi6xWxNNClbG/iMnVAtdCnysyImYa7AHIhSYAL+zNxI6ud1k0JaB3ykccJbfsLz987
         BXQi9Stt+QcZTaprHPdPv1qFX2YwIDk6vI1gqfM3W/cpnqGmSyG4kyBPk5Fvn/WvjyP/
         2Gyi0JJNMPmXxkbkPC/XsXHniREUL5HiXCep3QukpdlAXkV1wdkRvwbGSMeV6dfmdWoZ
         iH1qNccJE5jvCvSS2lIxcs3FlFJk9UMUFilJqQpRD+nxcVTqjfhzRvIM1hoVcAzrVeky
         08Hi5UP5gA5GFI1I/c7RLFwKCn8cJ6zASVSI34cYoOSD/0jzzBBiF2rPYQSVRLKqoh9k
         NGbQ==
X-Gm-Message-State: ACgBeo205J698SZc+UuoyqnPpCTfQoZ4cb9L1RFlb+ZBBM7zGdZ6mhYZ
        V/PIxd/lNU6R2w155KZ/UcPMl2BkxFg=
X-Google-Smtp-Source: AA6agR5i2eocSwNR3efGo1C5xL4JDFd3oHcbaiU3RfDrhJJihi7k1Ca6c2N8RqbqWkDFXtA/Gh0HiA==
X-Received: by 2002:a05:6a00:1894:b0:537:2e86:c7df with SMTP id x20-20020a056a00189400b005372e86c7dfmr2480143pfh.18.1661404831478;
        Wed, 24 Aug 2022 22:20:31 -0700 (PDT)
Received: from localhost (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id s21-20020a170903201500b0016bf5557690sm8738501pla.4.2022.08.24.22.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 22:20:31 -0700 (PDT)
Sender: Junio C Hamano <jch2355@gmail.com>
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Aug 2022, #08; Wed, 24)
X-master-at: 795ea8776befc95ea2becd8020c7a284677b4161
X-next-at: 1cad371f1c4a4d3e2f0d7a9bbce5708e2a9d2902
Date:   Wed, 24 Aug 2022 22:20:30 -0700
Message-ID: <xmqqa67s5275.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Here are the topics that have been cooking in my tree.  Commits
prefixed with '+' are in 'next' (being in 'next' is a sign that a
topic is stable enough to be used and are candidate to be in a future
release).  Commits prefixed with '-' are only in 'seen', and aren't
considered "accepted" at all.  A topic without enough support may be
discarded after a long period of no activity.

We are in the middle of the week #7 of a 12-week cycle
(cf. https://tinyurl.com/gitCal).

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

* ds/bundle-uri-3 (2022-08-24) 8 commits
 - bundle-uri: fetch a list of bundles
 - bundle-uri: limit recursion depth for bundle lists
 - bundle-uri: parse bundle list in config format
 - bundle-uri: unit test "key=value" parsing
 - bundle-uri: create "key=value" line parsing
 - bundle-uri: create base key-value pair parsing
 - bundle-uri: create bundle_list struct and helpers
 - Merge branch 'ds/bundle-uri-clone' into ds/bundle-uri-3
 (this branch uses ds/bundle-uri-clone.)

 Define the logical elements of a "bundle list", data structure to
 store them in-core, format to transfer them, and code to parse
 them.

 Needs review.
 source: <pull.1333.git.1661181174.gitgitgadget@gmail.com>


* en/merge-unstash-only-on-clean-merge (2022-08-24) 1 commit
 - merge: only apply autostash when appropriate

 The auto-stashed local changes created by "git merge --autostash"
 was mixed into a conflicted state left in the working tree, which
 has been corrected.

 Will merge to 'next'.
 source: <610b8d089db97bf1a37dbf230f51ecafe3086254.1661222541.git.gitgitgadget@gmail.com>


* es/fix-chained-tests (2022-08-24) 4 commits
  (merged to 'next' on 2022-08-24 at 6266835a6e)
 + t5329: notice a failure within a loop
  (merged to 'next' on 2022-08-22 at 3774cfdaf4)
 + t: detect and signal failure within loop
 + t1092: fix buggy sparse "blame" test
 + t2407: fix broken &&-chains in compound statement

 Fix broken "&&-" chains and failures in early iterations of a loop.

 Will merge to 'master'.
 source: <pull.1312.git.git.1661192802.gitgitgadget@gmail.com>


* ad/preload-plug-memleak (2022-08-22) 1 commit
  (merged to 'next' on 2022-08-24 at 1cad371f1c)
 + preload-index: fix memleak

 The preload-index codepath made copies of pathspec to give to
 multiple threads, which were left leaked.

 Will merge to 'master'.
 source: <20220822211507.8693-2-anthony.2lannoy@gmail.com>


* sg/xcalloc-cocci-fix (2022-08-24) 1 commit
  (merged to 'next' on 2022-08-24 at 84c05819d3)
 + promisor-remote: fix xcalloc() argument order

 xcalloc(), imitating calloc(), takes "number of elements of the
 array", and "size of a single element", in this order.  A call that
 does not follow this ordering has been corrected.

 Will merge to 'master'.
 source: <20220823095733.58685-1-szeder.dev@gmail.com>


* ds/github-actions-use-newer-ubuntu (2022-08-24) 1 commit
  (merged to 'next' on 2022-08-24 at 55a76348b2)
 + ci: update 'static-analysis' to Ubuntu 22.04

 Update the version of Ubuntu used for GitHub Actions CI from 18.04
 to 22.04.

 Will merge to 'master'.
 source: <pull.1334.git.1661275691795.gitgitgadget@gmail.com>


* en/merge-multi-strategies (2022-08-24) 2 commits
 - merge: small code readability improvement
 - merge: cleanup confusing logic for handling successful merges

 The code that implements multi-strategy support in "git merge" has
 been clean-up a bit.

 Will merge to 'next'.
 source: <pull.1331.v2.git.1661222541.gitgitgadget@gmail.com>


* en/t4301-more-merge-tree-tests (2022-08-24) 1 commit
 - t4301: add more interesting merge-tree testcases

 More tests to protect the current behaviour of "merge-tree" before
 it gets further updated.

 Will merge to 'next'.
 source: <pull.1332.git.1661237316150.gitgitgadget@gmail.com>


* js/add-p-diff-parsing-fix (2022-08-24) 4 commits
 - add -p: ignore dirty submodules
 - add -p: handle `diff-so-fancy`'s hunk headers better
 - add -p: gracefully ignore unparseable hunk headers in colored diffs
 - t3701: redefine what is "bogus" output of a diff filter

 Those who use diff-so-fancy as the diff-filter noticed a regression
 or two in the reimplemented "add -p", which has been corrected.

 Needs review.
 source: <pull.1336.v2.git.1661376112.gitgitgadget@gmail.com>


* js/cmake-updates (2022-08-24) 5 commits
 - cmake: increase time-out for a long-running test
 - cmake: avoid editing t/test-lib.sh
 - add -p: avoid ambiguous signed/unsigned comparison
 - cmake: copy the merge tools for testing
 - cmake: make it easier to diagnose regressions in CTest runs

 Update to build procedure with VS using CMake/CTest.

 Needs review.
 source: <pull.1320.v2.git.1661243463.gitgitgadget@gmail.com>


* js/range-diff-with-pathspec (2022-08-24) 2 commits
 - range-diff: optionally accept a pathspec
 - range-diff: reorder argument handling

 Allow passing a pathspec to "git range-diff".

 Needs review.
 source: <pull.1335.git.1661258122.gitgitgadget@gmail.com>

--------------------------------------------------
[Cooking]

* en/ort-unused-code-removal (2022-08-19) 1 commit
  (merged to 'next' on 2022-08-22 at f09dbeeca3)
 + merge-ort: remove code obsoleted by other changes

 Code clean-up.

 Will merge to 'master'.
 source: <pull.1302.git.git.1660884355643.gitgitgadget@gmail.com>


* jd/prompt-show-conflict (2022-08-19) 1 commit
  (merged to 'next' on 2022-08-19 at 83af487823)
 + git-prompt: show presence of unresolved conflicts at command prompt

 The bash prompt (in contrib/) learned to optionally indicate when
 the index is unmerged.

 Will merge to 'master'.
 source: <pull.1302.v3.git.1660695492382.gitgitgadget@gmail.com>


* jk/unused-annotation (2022-08-19) 11 commits
  (merged to 'next' on 2022-08-24 at 2174b8c75d)
 + is_path_owned_by_current_uid(): mark "report" parameter as unused
 + run-command: mark unused async callback parameters
 + mark unused read_tree_recursive() callback parameters
 + hashmap: mark unused callback parameters
 + config: mark unused callback parameters
 + streaming: mark unused virtual method parameters
 + transport: mark bundle transport_options as unused
 + refs: mark unused virtual method parameters
 + refs: mark unused reflog callback parameters
 + refs: mark unused each_ref_fn parameters
 + git-compat-util: add UNUSED macro

 Annotate function parameters that are not used (but cannot be
 removed for structural reasons), to prepare us to later compile
 with -Wunused warning turned on.

 Will merge to 'master'.
 source: <Yv9gxqH6nK2KYnNj@coredump.intra.peff.net>


* jk/unused-fixes (2022-08-20) 7 commits
  (merged to 'next' on 2022-08-22 at 2fe4de2aed)
 + xdiff: drop unused mmfile parameters from xdl_do_patience_diff()
 + reflog: assert PARSE_OPT_NONEG in parse-options callbacks
 + reftable: drop unused parameter from reader_seek_linear()
 + verify_one_sparse(): drop unused parameters
 + match_pathname(): drop unused "flags" parameter
 + log-tree: drop unused commit param in remerge_diff()
 + xdiff: drop unused mmfile parameters from xdl_do_histogram_diff()

 Code clean-up to remove unused function parameters.

 Will merge to 'master'.
 source: <Yv9Oay+tNqhLDqVl@coredump.intra.peff.net>
 source: <YwCjOETsh1o8u0Og@coredump.intra.peff.net>


* mg/sequencer-untranslate-reflog (2022-08-19) 3 commits
  (merged to 'next' on 2022-08-22 at 75aadeb865)
 + sequencer: do not translate command names
 + sequencer: do not translate parameters to error_resolve_conflict()
 + sequencer: do not translate reflog messages

 The sequencer machinery translated messages left in the reflog by
 mistake, which has been corrected.

 Will merge to 'master'.
 source: <cover.1660828108.git.git@grubix.eu>


* tb/midx-with-changing-preferred-pack-fix (2022-08-22) 7 commits
 - midx.c: avoid adding preferred objects twice
 - midx.c: include preferred pack correctly with existing MIDX
 - midx.c: extract `midx_fanout_add_pack_fanout()`
 - midx.c: extract `midx_fanout_add_midx_fanout()`
 - midx.c: extract `struct midx_fanout`
 - t/lib-bitmap.sh: avoid silencing stderr
 - t5326: demonstrate potential bitmap corruption

 Multi-pack index got corrupted when preferred pack changed from one
 pack to another in a certain way, which has been corrected.

 Will merge to 'next'?
 cf. <be9c7c72-ba24-3e1a-8428-58a2e2afa09a@github.com>
 source: <cover.1661197803.git.me@ttaylorr.com>


* vd/fix-perf-tests (2022-08-19) 2 commits
  (merged to 'next' on 2022-08-22 at e68356e624)
 + p0006: fix 'read-tree' argument ordering
 + p0004: fix prereq declaration

 Rather trivial perf-test code fixes.

 Will merge to 'master'.
 source: <pull.1330.git.1660942149.gitgitgadget@gmail.com>


* vd/scalar-enables-fsmonitor (2022-08-18) 8 commits
  (merged to 'next' on 2022-08-19 at 1e172e5647)
 + scalar: update technical doc roadmap with FSMonitor support
 + scalar unregister: stop FSMonitor daemon
 + scalar: enable built-in FSMonitor on `register`
 + scalar: move config setting logic into its own function
 + scalar-delete: do not 'die()' in 'delete_enlistment()'
 + scalar-[un]register: clearly indicate source of error
 + scalar-unregister: handle error codes greater than 0
 + scalar: constrain enlistment search

 "scalar" now enables built-in fsmonitor on enlisted repositories,
 when able.

 Will merge to 'master'.
 source: <pull.1324.v3.git.1660858853.gitgitgadget@gmail.com>


* en/ancestry-path-in-a-range (2022-08-19) 3 commits
  (merged to 'next' on 2022-08-19 at 4fce3015b3)
 + revision: allow --ancestry-path to take an argument
 + t6019: modernize tests with helper
 + rev-list-options.txt: fix simple typo

 "git rev-list --ancestry-path=C A..B" is a natural extension of
 "git rev-list A..B"; instead of choosing a subset of A..B to those
 that have ancestry relationship with A, it lets a subset with
 ancestry relationship with C.

 Will merge to 'master'.
 source: <pull.1303.v3.git.1660883290.gitgitgadget@gmail.com>


* en/submodule-merge-messages-fixes (2022-08-18) 3 commits
  (merged to 'next' on 2022-08-18 at eb89a1e70f)
 + merge-ort: provide helpful submodule update message when possible
 + merge-ort: avoid surprise with new sub_flag variable
 + merge-ort: remove translator lego in new "submodule conflict suggestion"
 (this branch uses cw/submodule-merge-messages.)

 Further update the help messages given while merging submodules.

 Will merge to 'master'.
 source: <pull.1325.v3.git.1660806927.gitgitgadget@gmail.com>


* ed/fsmonitor-on-network-disk (2022-08-24) 3 commits
 - Check working directory and Unix domain socket file for compatability
 - fsmonitor: macOS: allow fsmonitor to run against network-mounted repos
  (merged to 'next' on 2022-08-14 at 637d458d9c)
 + fsmonitor: option to allow fsmonitor to run against network-mounted repos

 The built-in fsmonitor refuses to work on a network mounted
 repositories; a configuration knob for users to override this has
 been introduced.

 Needs review.
 source: <pull.1317.v3.git.1660242752495.gitgitgadget@gmail.com>
 source: <pull.1326.v3.git.1661280941.gitgitgadget@gmail.com>


* jk/is-promisor-object-keep-tree-in-use (2022-08-14) 1 commit
  (merged to 'next' on 2022-08-17 at 96033ff88d)
 + is_promisor_object(): fix use-after-free of tree buffer

 An earlier optimization discarded a tree-object buffer that is
 still in use, which has been corrected.

 Will merge to 'master'.
 source: <YviWO9Bhz5PU1HaL@coredump.intra.peff.net>


* js/fetch-negotiation-trace (2022-08-15) 1 commit
  (merged to 'next' on 2022-08-17 at 2c9e07b617)
 + fetch-pack: add tracing for negotiation rounds

 The common ancestor negotiation exchange during a "git fetch"
 session now leaves trace log.

 Will merge to 'master'.
 source: <4390677ec75d51487142adf7c2ab821cbd24a53e.1659477669.git.steadmon@google.com>


* pw/rebase-keep-base-fixes (2022-08-18) 5 commits
 - rebase --keep-base: imply --no-fork-point
 - rebase --keep-base: imply --reapply-cherry-picks
 - rebase: factor out merge_base calculation
 - rebase: store orig_head as a commit
 - t3416: set $EDITOR in subshell

 "git rebase --keep-base" used to discard the commits that are
 already cherry-picked to the upstream, even when "keep-base" meant
 that the base, on top of which the history is being rebuilt, does
 not yet include these cherry-picked commits.  The --keep-base
 option now implies --reapply-cherry-picks and --no-fork-point
 options.

 Expecting a reroll.
 cf. <eab55cef-62bd-af2b-c295-1e76beca032f@gmail.com>
 source: <pull.1323.git.1660576283.gitgitgadget@gmail.com>


* ag/merge-strategies-in-c (2022-08-10) 14 commits
 - sequencer: use the "octopus" strategy without forking
 - sequencer: use the "resolve" strategy without forking
 - merge: use the "octopus" strategy without forking
 - merge: use the "resolve" strategy without forking
 - merge-octopus: rewrite in C
 - merge-recursive: move better_branch_name() to merge.c
 - merge-resolve: rewrite in C
 - merge-one-file: rewrite in C
 - update-index: move add_cacheinfo() to read-cache.c
 - merge-index: add a new way to invoke `git-merge-one-file'
 - merge-index: drop the index
 - merge-index: libify merge_one_path() and merge_all()
 - t6060: add tests for removed files
 - t6060: modify multiple files to expose a possible issue with merge-index

 An attempt to rewrite remaining merge strategies from shell to C.

 Needs more work.
 At the minimum, we should lose 11/14 and possibly 08/14.
 cf. <xmqq7d36vfur.fsf@gitster.g>
 source: <20220809185429.20098-1-alban.gruin@gmail.com>


* sy/mv-out-of-cone (2022-08-10) 9 commits
  (merged to 'next' on 2022-08-17 at 2316d9ce4d)
 + mv: check overwrite for in-to-out move
 + advice.h: add advise_on_moving_dirty_path()
 + mv: cleanup empty WORKING_DIRECTORY
 + mv: from in-cone to out-of-cone
 + mv: remove BOTH from enum update_mode
 + mv: check if <destination> is a SKIP_WORKTREE_DIR
 + mv: free the with_slash in check_dir_in_index()
 + mv: rename check_dir_in_index() to empty_dir_has_sparse_contents()
 + t7002: add tests for moving from in-cone to out-of-cone

 "git mv A B" in a sparsely populated working tree can be asked to
 move a path from a directory that is "in cone" to another directory
 that is "out of cone".  Handling of such a case has been improved.

 Will merge to 'master'.
 source: <20220809120910.2021413-1-shaoxuan.yuan02@gmail.com>


* vd/scalar-generalize-diagnose (2022-08-12) 11 commits
  (merged to 'next' on 2022-08-18 at bd8e574713)
 + scalar: update technical doc roadmap
 + scalar-diagnose: use 'git diagnose --mode=all'
 + builtin/bugreport.c: create '--diagnose' option
 + builtin/diagnose.c: add '--mode' option
 + builtin/diagnose.c: create 'git diagnose' builtin
 + diagnose.c: add option to configure archive contents
 + scalar-diagnose: move functionality to common location
 + scalar-diagnose: move 'get_disk_info()' to 'compat/'
 + scalar-diagnose: add directory to archiver more gently
 + scalar-diagnose: avoid 32-bit overflow of size_t
 + scalar-diagnose: use "$GIT_UNZIP" in test

 The "diagnose" feature to create a zip archive for diagnostic
 material has been lifted from "scalar" and made into a feature of
 "git bugreport".

 Will merge to 'master'.
 source: <pull.1310.v4.git.1660335019.gitgitgadget@gmail.com>


* jk/pipe-command-nonblock (2022-08-17) 6 commits
  (merged to 'next' on 2022-08-17 at 91fe8e6354)
 + pipe_command(): mark stdin descriptor as non-blocking
 + pipe_command(): handle ENOSPC when writing to a pipe
 + pipe_command(): avoid xwrite() for writing to pipe
 + git-compat-util: make MAX_IO_SIZE define globally available
 + nonblock: support Windows
 + compat: add function to enable nonblocking pipes

 Fix deadlocks between main Git process and subprocess spawned via
 the pipe_command() API, that can kill "git add -p" that was
 reimplemented in C recently.

 Will merge to 'master'.
 source: <YvyE1RDFVAg4uQo1@coredump.intra.peff.net>


* es/mark-gc-cruft-as-experimental (2022-08-03) 2 commits
 - config: let feature.experimental imply gc.cruftPacks=true
 - gc: add tests for --cruft and friends

 Enable gc.cruftpacks by default for those who opt into
 feature.experimental setting.

 Expecting a reroll.
 cf. <220804.86a68ke9d5.gmgdl@evledraar.gmail.com>
 cf. <6803b725-526e-a1c8-f15c-a9ed4a144d4c@github.com>
 source: <20220803205721.3686361-1-emilyshaffer@google.com>


* sg/parse-options-subcommand (2022-08-19) 20 commits
  (merged to 'next' on 2022-08-22 at 09d07c2271)
 + builtin/worktree.c: let parse-options parse subcommands
 + builtin/stash.c: let parse-options parse subcommands
 + builtin/sparse-checkout.c: let parse-options parse subcommands
 + builtin/remote.c: let parse-options parse subcommands
 + builtin/reflog.c: let parse-options parse subcommands
 + builtin/notes.c: let parse-options parse subcommands
 + builtin/multi-pack-index.c: let parse-options parse subcommands
 + builtin/hook.c: let parse-options parse subcommands
 + builtin/gc.c: let parse-options parse 'git maintenance's subcommands
 + builtin/commit-graph.c: let parse-options parse subcommands
 + builtin/bundle.c: let parse-options parse subcommands
 + parse-options: add support for parsing subcommands
 + parse-options: drop leading space from '--git-completion-helper' output
 + parse-options: clarify the limitations of PARSE_OPT_NODASH
 + parse-options: PARSE_OPT_KEEP_UNKNOWN only applies to --options
 + api-parse-options.txt: fix description of OPT_CMDMODE
 + t0040-parse-options: test parse_options() with various 'parse_opt_flags'
 + t5505-remote.sh: check the behavior without a subcommand
 + t3301-notes.sh: check that default operation mode doesn't take arguments
 + git.c: update NO_PARSEOPT markings

 Introduce the "subcommand" mode to parse-options API and update the
 command line parser of Git commands with subcommands.

 Will merge to 'master'.
 source: <20220819160411.1791200-1-szeder.dev@gmail.com>


* ds/bundle-uri-clone (2022-08-24) 6 commits
 - clone: warn on failure to repo_init()
  (merged to 'next' on 2022-08-18 at 5e8a3ec71e)
 + clone: --bundle-uri cannot be combined with --depth
 + bundle-uri: add support for http(s):// and file://
 + clone: add --bundle-uri option
 + bundle-uri: create basic file-copy logic
 + remote-curl: add 'get' capability
 (this branch is used by ds/bundle-uri-3.)

 Implement "git clone --bundle-uri".

 Will merge to 'master'.
 source: <pull.1300.v3.git.1660050703.gitgitgadget@gmail.com>
 source: <5229519b-3af2-a023-8996-43343b130722@github.com>


* ds/decorate-filter-tweak (2022-08-05) 11 commits
  (merged to 'next' on 2022-08-19 at 064b9daa85)
 + fetch: use ref_namespaces during prefetch
 + maintenance: stop writing log.excludeDecoration
 + log: create log.initialDecorationSet=all
 + log: add --clear-decorations option
 + log: add default decoration filter
 + log-tree: use ref_namespaces instead of if/else-if
 + refs: use ref_namespaces for replace refs base
 + refs: add array of ref namespaces
 + t4207: test coloring of grafted decorations
 + t4207: modernize test
 + refs: allow "HEAD" as decoration filter

 The namespaces used by "log --decorate" from "refs/" hierarchy by
 default has been tightened.

 Will merge to 'master'.
 source: <pull.1301.v3.git.1659722323.gitgitgadget@gmail.com>


* es/doc-creation-factor-fix (2022-07-28) 2 commits
 - range-diff: clarify --creation-factor=<factor>
 - format-patch: clarify --creation-factor=<factor>

 Expecting a reroll.
 source: <7229p500-p2r4-on87-6802-8o90s36rr3s4@tzk.qr>


* ab/submodule-helper-prep (2022-08-22) 32 commits
 - submodule--helper: fix bad config API usage
 - submodule--helper: libify even more "die" paths for module_update()
 - submodule--helper: libify more "die" paths for module_update()
 - submodule--helper: check repo{_submodule,}_init() return values
 - submodule--helper: libify "must_die_on_failure" code paths (for die)
 - submodule--helper update: don't override 'checkout' exit code
 - submodule--helper: libify "must_die_on_failure" code paths
 - submodule--helper: libify determine_submodule_update_strategy()
 - submodule--helper: don't exit() on failure, return
 - submodule--helper: use "code" in run_update_command()
 - submodule API: don't handle SM_..{UNSPECIFIED,COMMAND} in to_string()
 - submodule--helper: don't call submodule_strategy_to_string() in BUG()
 - submodule--helper: add missing braces to "else" arm
 - submodule--helper: return "ret", not "1" from update_submodule()
 - submodule--helper: rename "int res" to "int ret"
 - submodule--helper: don't redundantly check "else if (res)"
 - submodule--helper: refactor "errmsg_str" to be a "struct strbuf"
 - submodule--helper: add "const" to copy of "update_data"
 - submodule--helper: add "const" to passed "module_clone_data"
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

 Code clean-up of "git submodule--helper".

 Under review.
 source: <cover-v3-00.32-00000000000-20220821T130231Z-avarab@gmail.com>


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


* cw/remote-object-info (2022-08-13) 7 commits
 - SQUASH???
 - cat-file: add remote-object-info to batch-command
 - transport: add client support for object-info
 - serve: advertise object-info feature
 - protocol-caps: initialization bug fix
 - fetch-pack: move fetch initialization
 - fetch-pack: refactor packet writing

 A client component to talk with the object-info endpoint.

 Expecting a reroll.
 cf. <20220728230210.2952731-1-calvinwan@google.com>
 cf. <CAFySSZDvgwbbHCHfyuaqX3tKsr-GjJ9iihygg6rNNe46Ys7_EA@mail.gmail.com>
 source: <20220728230210.2952731-1-calvinwan@google.com>


* mt/rot13-in-c (2022-08-14) 4 commits
  (merged to 'next' on 2022-08-19 at 22152a150c)
 + tests: use the new C rot13-filter helper to avoid PERL prereq
 + t0021: implementation the rot13-filter.pl script in C
 + t0021: avoid grepping for a Perl-specific string at filter output
 + Merge branch 'mt/checkout-count-fix' into mt/rot13-in-c

 Test portability improvements.

 Will merge to 'master'.
 source: <cover.1660522524.git.matheus.bernardino@usp.br>


* tl/trace2-config-scope (2022-08-11) 2 commits
  (merged to 'next' on 2022-08-22 at 75a09c7a34)
 + tr2: shows scope unconditionally in addition to key-value pair
 + api-trace2.txt: print config key-value pair

 Tweak trace2 output about configuration variables.

 Will merge to 'master'.
 source: <cover.1660272404.git.dyroneteng@gmail.com>


* ab/submodule-helper-leakfix (2022-08-22) 18 commits
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

 Waiting for the "prep" step.
 source: <cover-v6-00.17-00000000000-20220821T130415Z-avarab@gmail.com>


* cw/submodule-merge-messages (2022-08-04) 1 commit
  (merged to 'next' on 2022-08-12 at ede0890319)
 + submodule merge: update conflict error message
 (this branch is used by en/submodule-merge-messages-fixes.)

 Update the message given when "git merge" sees conflicts at a path
 with a submodule while merging a superproject.

 Will wait for en/submodule-merge-messages-fixes to mature.
 source: <20220804195105.1303455-1-calvinwan@google.com>


* po/glossary-around-traversal (2022-07-09) 3 commits
 - glossary: add reachability bitmap description
 - glossary: add commit graph description
 - glossary: add Object DataBase (ODB) abbreviation

 The glossary entries for "commit-graph file" and "reachability
 bitmap" have been added.

 Expecting a reroll.
 cf. <dfe0c1ab-33f8-f13e-71ce-1829bb0d2d7f@iee.email>
 source: <pull.1282.git.1657385781.gitgitgadget@gmail.com>


* ac/bitmap-lookup-table (2022-08-14) 6 commits
 - bitmap-lookup-table: add performance tests for lookup table
 - pack-bitmap: prepare to read lookup table extension
 - pack-bitmap-write: learn pack.writeBitmapLookupTable and add tests
 - pack-bitmap-write.c: write lookup table extension
 - bitmap: move `get commit positions` code to `bitmap_writer_finish`
 - Documentation/technical: describe bitmap lookup table extension

 The pack bitmap file gained a bitmap-lookup table to speed up
 locating the necessary bitmap for a given commit.

 Needs review.
 cf. <YwOXIE8K0GJRLuDT@nand.local>
 source: <pull.1266.v6.git.1660496112.gitgitgadget@gmail.com>


* tb/show-ref-count (2022-06-06) 2 commits
 - builtin/show-ref.c: limit output with `--count`
 - builtin/show-ref.c: rename `found_match` to `matches_nr`

 "git show-ref" learned to stop after emitting N refs with the new
 "--count=N" option.

 Expecting a reroll.
 cf. <xmqqczfl4ce1.fsf@gitster.g>
 source: <cover.1654552560.git.me@ttaylorr.com>


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

* jt/connected-show-missing-from-which-side (2022-06-10) 1 commit
 . fetch,fetch-pack: clarify connectivity check error

 We may find an object missing after a "git fetch" stores the
 objects it obtained from the other side, but it is not necessarily
 because the remote failed to send necessary objects.  Reword the
 messages in an attempt to help users explore other possibilities
 when they hit this error.

 In stalled state for too long.
 Also it seems to break t5326 with sha256.
 source: <20220610195247.1177549-1-jonathantanmy@google.com>


* js/merge-tree-without-munging-filenames (2022-08-19) 3 commits
 . t4301: add a test case involving a rename, type change & modification
 . merge-tree: show the original file names in the conflict output
 . merge-tree -z: always show the original file name first

 "git merge-tree" output was improved to help "merging without
 working tree" usecase better in a few ways.

 Retracted for now.
 cf. <9p08998o-n88r-2nno-8703-s99o5qpn9o35@tzk.qr>
 source: <pull.1327.git.1660892256.gitgitgadget@gmail.com>
