Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627C0ECAAD5
	for <git@archiver.kernel.org>; Tue, 30 Aug 2022 19:18:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbiH3TSH (ORCPT <rfc822;git@archiver.kernel.org>);
        Tue, 30 Aug 2022 15:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbiH3TSG (ORCPT <rfc822;git@vger.kernel.org>);
        Tue, 30 Aug 2022 15:18:06 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E1236E8BE
        for <git@vger.kernel.org>; Tue, 30 Aug 2022 12:18:01 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id l3so12044981plb.10
        for <git@vger.kernel.org>; Tue, 30 Aug 2022 12:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender:from
         :to:cc:subject:date;
        bh=inYVZzb6vaO86qmjm7lf6YiDvlZWSFUCnIfapSsMl0E=;
        b=fRPEIH8ZB91zsxbkkLcK/HeaQaM1cFcSTTOzfwPirzsOSwMGM28mmZbwpdi7fFtu2m
         u9HLO7S66DCiIqNZj68ZRqzv9F3qJsn2S2/GnxKWxyQaCdWXq++wx7QEZvqWY8NsrsVp
         Nmpra9LQiWcWfvVyG8re3xT6rkhTje1O0dopbWbfj1pY+DfCkogxM6YUnMGM3l4tT8Z6
         jYA92shfggEG3kaYk4ibUKcbenPUcITwEeMIrXvQmnHBBvQiTJjdT6ZKCG9e15Sr4+EB
         HA51WkTWyArJas1ykk06e20cLXzK+OEZsbo/cfJt5SVZyB4St4PLJ3Ara57qeqEp28lA
         sKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=inYVZzb6vaO86qmjm7lf6YiDvlZWSFUCnIfapSsMl0E=;
        b=v92A09uiAZbbnYOk8GcV7VcXAfX+q60IGKMvCQBfKEc8miqc7o9UYLvbPtYE+jvAnw
         u/4tovHcFWEQ+jMzZQ7fyHY6mr/91l608pd6KPVeFULigZN37QGaalnPg+I9VruA4hBH
         RumgXewhmFcH6+1mY2nuPN5SeuSTU06LTr0vkX5JFOQYpkJZBTSCGfnjHqbC2Ttf3a+Y
         +Ct7XeICtYY9gXVL1QGyEV3Abb9PKiVfC3cde8WTA+1fpa8sH/rgg2TRjW870i99r4ku
         QQcq7qQh5AzU78v6MPaCf2znIvoJ4o5mhgVBSUrEEIVuEzJJfhTXeTq6HjDuLR9Sswha
         CmDQ==
X-Gm-Message-State: ACgBeo0r0D+Sc+1NGpNX5zzXzEbP90sh0unvUrcz5oYMIkEhHes5MHFy
        V+KHNLgbZWJaD0wk3mX5wbHg/NUy280=
X-Google-Smtp-Source: AA6agR4lwkLALGeYG6L4wlerpdqh7Ifq+BXkaQcTs0XBzOyQC5vweQGKUwYnZ83umnCuaUAlh7hpBg==
X-Received: by 2002:a17:902:aa42:b0:173:b84:ccf9 with SMTP id c2-20020a170902aa4200b001730b84ccf9mr22297833plr.83.1661887080256;
        Tue, 30 Aug 2022 12:18:00 -0700 (PDT)
Received: from localhost (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id i9-20020a170902c94900b00173cfb184c0sm10300527pla.32.2022.08.30.12.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 12:17:59 -0700 (PDT)
Sender: Junio C Hamano <jch2355@gmail.com>
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Aug 2022, #10; Tue, 30)
X-master-at: d42b38dfb5edf1a7fddd9542d722f91038407819
X-next-at: 179cf4a1993382e88ddca40c073b2b2f5899be0d
Date:   Tue, 30 Aug 2022 12:17:59 -0700
Message-ID: <xmqqilm9k0bc.fsf@gitster.g>
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

We are in the middle of week #8 in a 12-week cycle toward Git 2.38
(tinyurl.com/gitCal).  As we have accumulated enough material on
the 'maint' branch, Git 2.37.3 has been tagged.

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

* ad/preload-plug-memleak (2022-08-22) 1 commit
  (merged to 'next' on 2022-08-24 at 1cad371f1c)
 + preload-index: fix memleak

 The preload-index codepath made copies of pathspec to give to
 multiple threads, which were left leaked.
 source: <20220822211507.8693-2-anthony.2lannoy@gmail.com>


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
 source: <pull.1301.v3.git.1659722323.gitgitgadget@gmail.com>


* ds/github-actions-use-newer-ubuntu (2022-08-24) 1 commit
  (merged to 'next' on 2022-08-24 at 55a76348b2)
 + ci: update 'static-analysis' to Ubuntu 22.04

 Update the version of Ubuntu used for GitHub Actions CI from 18.04
 to 22.04.
 source: <pull.1334.git.1661275691795.gitgitgadget@gmail.com>


* en/ancestry-path-in-a-range (2022-08-19) 3 commits
  (merged to 'next' on 2022-08-19 at 4fce3015b3)
 + revision: allow --ancestry-path to take an argument
 + t6019: modernize tests with helper
 + rev-list-options.txt: fix simple typo

 "git rev-list --ancestry-path=C A..B" is a natural extension of
 "git rev-list A..B"; instead of choosing a subset of A..B to those
 that have ancestry relationship with A, it lets a subset with
 ancestry relationship with C.
 source: <pull.1303.v3.git.1660883290.gitgitgadget@gmail.com>


* en/ort-unused-code-removal (2022-08-19) 1 commit
  (merged to 'next' on 2022-08-22 at f09dbeeca3)
 + merge-ort: remove code obsoleted by other changes

 Code clean-up.
 source: <pull.1302.git.git.1660884355643.gitgitgadget@gmail.com>


* es/fix-chained-tests (2022-08-24) 4 commits
  (merged to 'next' on 2022-08-24 at 6266835a6e)
 + t5329: notice a failure within a loop
  (merged to 'next' on 2022-08-22 at 3774cfdaf4)
 + t: detect and signal failure within loop
 + t1092: fix buggy sparse "blame" test
 + t2407: fix broken &&-chains in compound statement

 Fix broken "&&-" chains and failures in early iterations of a loop.
 source: <pull.1312.git.git.1661192802.gitgitgadget@gmail.com>


* jd/prompt-show-conflict (2022-08-19) 1 commit
  (merged to 'next' on 2022-08-19 at 83af487823)
 + git-prompt: show presence of unresolved conflicts at command prompt

 The bash prompt (in contrib/) learned to optionally indicate when
 the index is unmerged.
 source: <pull.1302.v3.git.1660695492382.gitgitgadget@gmail.com>


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
 source: <Yv9Oay+tNqhLDqVl@coredump.intra.peff.net>
 source: <YwCjOETsh1o8u0Og@coredump.intra.peff.net>


* mg/sequencer-untranslate-reflog (2022-08-19) 3 commits
  (merged to 'next' on 2022-08-22 at 75aadeb865)
 + sequencer: do not translate command names
 + sequencer: do not translate parameters to error_resolve_conflict()
 + sequencer: do not translate reflog messages

 The sequencer machinery translated messages left in the reflog by
 mistake, which has been corrected.
 source: <cover.1660828108.git.git@grubix.eu>


* mt/rot13-in-c (2022-08-14) 4 commits
  (merged to 'next' on 2022-08-19 at 22152a150c)
 + tests: use the new C rot13-filter helper to avoid PERL prereq
 + t0021: implementation the rot13-filter.pl script in C
 + t0021: avoid grepping for a Perl-specific string at filter output
 + Merge branch 'mt/checkout-count-fix' into mt/rot13-in-c

 Test portability improvements.
 source: <cover.1660522524.git.matheus.bernardino@usp.br>


* sg/xcalloc-cocci-fix (2022-08-24) 1 commit
  (merged to 'next' on 2022-08-24 at 84c05819d3)
 + promisor-remote: fix xcalloc() argument order

 xcalloc(), imitating calloc(), takes "number of elements of the
 array", and "size of a single element", in this order.  A call that
 does not follow this ordering has been corrected.
 source: <20220823095733.58685-1-szeder.dev@gmail.com>


* tl/trace2-config-scope (2022-08-11) 2 commits
  (merged to 'next' on 2022-08-22 at 75a09c7a34)
 + tr2: shows scope unconditionally in addition to key-value pair
 + api-trace2.txt: print config key-value pair

 Tweak trace2 output about configuration variables.
 source: <cover.1660272404.git.dyroneteng@gmail.com>


* vd/fix-perf-tests (2022-08-19) 2 commits
  (merged to 'next' on 2022-08-22 at e68356e624)
 + p0006: fix 'read-tree' argument ordering
 + p0004: fix prereq declaration

 Rather trivial perf-test code fixes.
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
 source: <pull.1324.v3.git.1660858853.gitgitgadget@gmail.com>

--------------------------------------------------
[New Topics]

* rs/tempfile-cleanup-race-fix (2022-08-27) 1 commit
  (merged to 'next' on 2022-08-30 at 158dd1c910)
 + tempfile: avoid directory cleanup race

 The clean-up of temporary files created via mks_tempfile_dt() was
 racy and attempted to unlink() the leading directory when signals
 are involved, which has been corrected.

 Will merge to 'master'.
 source: <526a174e-b179-c284-a21c-7afe0a0b4df2@web.de>


* tb/diffstat-with-utf8-strwidth (2022-08-27) 1 commit
 - diff.c: use utf8_strwidth() when appropriate

 "git diff --stat" etc. were invented back when everything was ASCII
 and strlen() was a way to measure the display width of a string;
 adjust them to compute the display width assuming UTF-8 pathnames.
 source: <20220827085007.20030-1-tboegi@web.de>


* bc/gc-crontab-fix (2022-08-28) 1 commit
  (merged to 'next' on 2022-08-30 at a7a240a4da)
 + gc: use temporary file for editing crontab

 FreeBSD portability fix for "git maintenance" that spawns "crontab"
 to schedule tasks.

 Will merge to 'master'.
 source: <20220828214143.754759-1-sandals@crustytoothpaste.net>


* en/test-without-test-create-repo (2022-08-26) 1 commit
  (merged to 'next' on 2022-08-30 at 4f80f48e27)
 + t64xx: convert 'test_create_repo' to 'git init'

 Test clean-up.

 Will merge to 'master'.
 source: <pull.1303.v2.git.git.1661485759789.gitgitgadget@gmail.com>


* es/t4301-sed-portability-fix (2022-08-29) 4 commits
  (merged to 'next' on 2022-08-30 at eec0ceef0a)
 + t4301: emit blank line in more idiomatic fashion
 + t4301: fix broken &&-chains and add missing loop termination
 + t4301: account for behavior differences between sed implementations
 + Merge branch 'en/t4301-more-merge-tree-tests' into es/t4301-sed-portability-fix
 (this branch uses en/t4301-more-merge-tree-tests.)

 Test clean-up.

 Will merge to 'master'.
 source: <pull.1339.git.1661663879.gitgitgadget@gmail.com>


* gc/submodule-propagate-branches (2022-08-29) 6 commits
 - clone, submodule update: check out branches
 - submodule--helper: refactor up-to-date criterion
 - submodule: return target of submodule symref
 - t5617: drop references to remote-tracking branches
 - repo-settings: add submodule_propagate_branches
 - clone: teach --detach option

 "git clone --recurse-submodules" and "git submodule update" learns
 to honor the "propagete branches" option.

 Needs review.
 source: <pull.1321.git.git.1661806456.gitgitgadget@gmail.com>


* rs/test-mergesort (2022-08-28) 2 commits
  (merged to 'next' on 2022-08-30 at 4905149886)
 + test-mergesort: use mem_pool for sort input
 + test-mergesort: read sort input all at once

 Optimization of a test-helper command.

 Will merge to 'master'.
 source: <128f0fb8-d29b-8622-0cfe-2ecadc999db5@web.de>


* jc/format-patch-force-in-body-from (2022-08-29) 3 commits
 - format-patch: learn format.forceInBodyFrom configuration variable
 - format-patch: allow forcing the use of in-body From: header
 - pretty: separate out the logic to decide the use of in-body from

 "git format-patch --from=<ident>" can be told to add an in-body
 "From:" line even for commits that are authored by the given
 <ident> with "--force-in-body-from"option.

 Will merge to 'next'?
 source: <20220829213837.13849-1-gitster@pobox.com>


* sy/sparse-grep (2022-08-29) 2 commits
 - builtin/grep.c: integrate with sparse index
 - builtin/grep.c: add --sparse option

 source: <20220829232843.183711-1-shaoxuan.yuan02@gmail.com>


* cc/doc-trailer-whitespace-rules (2022-08-30) 1 commit
 - Documentation: clarify whitespace rules for trailers

 source: <20220830105046.324041-1-christian.couder@gmail.com>


* js/builtin-add-p-portability-fix (2022-08-30) 3 commits
 - t6132(NO_PERL): do not run the scripted `add -p`
 - t3701: test the built-in `add -i` regardless of NO_PERL
 - add -p: avoid ambiguous signed/unsigned comparison

 source: <pull.1340.git.1661867664.gitgitgadget@gmail.com>

--------------------------------------------------
[Cooking]

* ds/use-platform-regex-on-macos (2022-08-26) 1 commit
 - grep: fix multibyte regex handling under macOS

 With a bit of header twiddling, use the native regexp library on
 macOS instead of the compat/ one.

 Needs review.
 source: <20220826085815.2771102-1-dds@aueb.gr>


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
  (merged to 'next' on 2022-08-25 at a144bdf6cb)
 + merge: only apply autostash when appropriate

 The auto-stashed local changes created by "git merge --autostash"
 was mixed into a conflicted state left in the working tree, which
 has been corrected.

 Will merge to 'master'.
 source: <610b8d089db97bf1a37dbf230f51ecafe3086254.1661222541.git.gitgitgadget@gmail.com>


* en/merge-multi-strategies (2022-08-24) 2 commits
  (merged to 'next' on 2022-08-25 at 420e2eae66)
 + merge: small code readability improvement
 + merge: cleanup confusing logic for handling successful merges

 The code that implements multi-strategy support in "git merge" has
 been clean-up a bit.

 Will merge to 'master'.
 source: <pull.1331.v2.git.1661222541.gitgitgadget@gmail.com>


* en/t4301-more-merge-tree-tests (2022-08-24) 1 commit
  (merged to 'next' on 2022-08-25 at c7abf60ff4)
 + t4301: add more interesting merge-tree testcases
 (this branch is used by es/t4301-sed-portability-fix.)

 More tests to protect the current behaviour of "merge-tree" before
 it gets further updated.

 Will merge to 'master'.
 source: <pull.1332.git.1661237316150.gitgitgadget@gmail.com>


* js/add-p-diff-parsing-fix (2022-08-29) 5 commits
 - add -p: ignore dirty submodules
 - add -p: handle `diff-so-fancy`'s hunk headers better
 - add -p: insert space in colored hunk header as needed
 - add -p: gracefully ignore unparseable hunk headers in colored diffs
 - t3701: redefine what is "bogus" output of a diff filter

 Those who use diff-so-fancy as the diff-filter noticed a regression
 or two in the reimplemented "add -p", which has been corrected.

 Will merge to 'next'?
 source: <pull.1336.v3.git.1661785916.gitgitgadget@gmail.com>


* js/cmake-updates (2022-08-24) 5 commits
 - cmake: increase time-out for a long-running test
 - cmake: avoid editing t/test-lib.sh
 - add -p: avoid ambiguous signed/unsigned comparison
 - cmake: copy the merge tools for testing
 - cmake: make it easier to diagnose regressions in CTest runs

 Update to build procedure with VS using CMake/CTest.

 Needs review.
 source: <pull.1320.v2.git.1661243463.gitgitgadget@gmail.com>


* js/range-diff-with-pathspec (2022-08-26) 3 commits
 - range-diff: optionally accept pathspecs
 - range-diff: consistently validate the arguments
 - range-diff: reorder argument handling

 Allow passing a pathspec to "git range-diff".

 Will merge to 'next'?
 source: <pull.1335.v2.git.1661506770.gitgitgadget@gmail.com>


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

 Will revert; coccinelle cannot even parse the annotation correctly.
 cf. <Ywh7ppVFk6VK1Ybs@coredump.intra.peff.net>
 cf. <xmqqy1v7r3so.fsf@gitster.g>
 source: <Yv9gxqH6nK2KYnNj@coredump.intra.peff.net>


* tb/midx-with-changing-preferred-pack-fix (2022-08-22) 7 commits
  (merged to 'next' on 2022-08-26 at 305a9d3323)
 + midx.c: avoid adding preferred objects twice
 + midx.c: include preferred pack correctly with existing MIDX
 + midx.c: extract `midx_fanout_add_pack_fanout()`
 + midx.c: extract `midx_fanout_add_midx_fanout()`
 + midx.c: extract `struct midx_fanout`
 + t/lib-bitmap.sh: avoid silencing stderr
 + t5326: demonstrate potential bitmap corruption

 Multi-pack index got corrupted when preferred pack changed from one
 pack to another in a certain way, which has been corrected.

 Will merge to 'master'.
 source: <cover.1661197803.git.me@ttaylorr.com>


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

 An oob read access makes sanitizer build segfault.
 cf.<YwdJRRuST2SP8ZT7@coredump.intra.peff.net>
 source: <20220809120910.2021413-1-shaoxuan.yuan02@gmail.com>


* es/mark-gc-cruft-as-experimental (2022-08-03) 2 commits
 - config: let feature.experimental imply gc.cruftPacks=true
 - gc: add tests for --cruft and friends

 Enable gc.cruftpacks by default for those who opt into
 feature.experimental setting.

 Expecting a reroll.
 cf. <220804.86a68ke9d5.gmgdl@evledraar.gmail.com>
 cf. <6803b725-526e-a1c8-f15c-a9ed4a144d4c@github.com>
 source: <20220803205721.3686361-1-emilyshaffer@google.com>


* sg/parse-options-subcommand (2022-08-25) 23 commits
  (merged to 'next' on 2022-08-25 at dab6bf1439)
 + remote: run "remote rm" argv through parse_options()
 + maintenance: add parse-options boilerplate for subcommands
 + pass subcommand "prefix" arguments to parse_options()
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
 (this branch is used by js/bisect-in-c.)

 Introduce the "subcommand" mode to parse-options API and update the
 command line parser of Git commands with subcommands.

 Will merge to 'master'.
 source: <20220819160411.1791200-1-szeder.dev@gmail.com>
 source: <YwdSzrF3xaHvLsI+@coredump.intra.peff.net>


* ds/bundle-uri-clone (2022-08-24) 6 commits
  (merged to 'next' on 2022-08-25 at 14754922fa)
 + clone: warn on failure to repo_init()
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


* es/doc-creation-factor-fix (2022-07-28) 2 commits
 - range-diff: clarify --creation-factor=<factor>
 - format-patch: clarify --creation-factor=<factor>

 Expecting a reroll by somebody more familiar with the logic
 cf. <xmqqo7wfix7p.fsf@gitster.g>
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


* po/glossary-around-traversal (2022-07-09) 3 commits
 - glossary: add reachability bitmap description
 - glossary: add commit graph description
 - glossary: add Object DataBase (ODB) abbreviation

 The glossary entries for "commit-graph file" and "reachability
 bitmap" have been added.

 Expecting a reroll.
 cf. <dfe0c1ab-33f8-f13e-71ce-1829bb0d2d7f@iee.email>
 source: <pull.1282.git.1657385781.gitgitgadget@gmail.com>


* ac/bitmap-lookup-table (2022-08-28) 7 commits
  (merged to 'next' on 2022-08-29 at 05d2d2c8bd)
 + pack-bitmap-write: drop unused pack_idx_entry parameters
  (merged to 'next' on 2022-08-26 at 7914c141eb)
 + bitmap-lookup-table: add performance tests for lookup table
 + pack-bitmap: prepare to read lookup table extension
 + pack-bitmap-write: learn pack.writeBitmapLookupTable and add tests
 + pack-bitmap-write.c: write lookup table extension
 + bitmap: move `get commit positions` code to `bitmap_writer_finish`
 + Documentation/technical: describe bitmap lookup table extension

 The pack bitmap file gained a bitmap-lookup table to speed up
 locating the necessary bitmap for a given commit.

 Will merge to 'master'.
 source: <pull.1266.v6.git.1660496112.gitgitgadget@gmail.com>


* js/bisect-in-c (2022-08-27) 17 commits
 - bisect: no longer try to clean up left-over `.git/head-name` files
 - bisect: remove Cogito-related code
 - Turn `git bisect` into a full built-in
 - bisect: move even the command-line parsing to `bisect--helper`
 - bisect--helper: make `state` optional
 - bisect--helper: calling `bisect_state()` without an argument is a bug
 - bisect: avoid double-quoting when printing the failed command
 - bisect run: fix the error message
 - bisect: verify that a bogus option won't try to start a bisection
 - bisect--helper: migrate to OPT_SUBCOMMAND()
 - bisect--helper: make the order consistently `argc, argv`
 - bisect--helper: make `terms` an explicit singleton
 - bisect--helper: simplify exit code computation
 - bisect--helper: really retire `--bisect-autostart`
 - bisect--helper: really retire --bisect-next-check
 - bisect--helper: retire the --no-log option
 - Merge branch 'sg/parse-options-subcommand' into js/bisect-in-c
 (this branch uses sg/parse-options-subcommand.)

 Final bits of "git bisect.sh" have been rewritten in C.

 Expecting a (hopefully final) reroll.
 cf. <20627.86ilolhnnn.gmgdl@evledraar.gmail.com>
 source: <pull.1132.v5.git.1661604264.gitgitgadget@gmail.com>

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


* tb/show-ref-count (2022-06-06) 2 commits
 . builtin/show-ref.c: limit output with `--count`
 . builtin/show-ref.c: rename `found_match` to `matches_nr`

 "git show-ref" learned to stop after emitting N refs with the new
 "--count=N" option.

 Retracted for now.
 cf. <Ywf1zngpKknCmGYl@nand.local>
 source: <cover.1654552560.git.me@ttaylorr.com>
