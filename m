Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0F7C4332F
	for <git@archiver.kernel.org>; Tue, 22 Nov 2022 18:24:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234451AbiKVSYe (ORCPT <rfc822;git@archiver.kernel.org>);
        Tue, 22 Nov 2022 13:24:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbiKVSYc (ORCPT <rfc822;git@vger.kernel.org>);
        Tue, 22 Nov 2022 13:24:32 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFF61729A8
        for <git@vger.kernel.org>; Tue, 22 Nov 2022 10:24:29 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id mv18so6274882pjb.0
        for <git@vger.kernel.org>; Tue, 22 Nov 2022 10:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JCgRmAUBXx0DCeauy0AJuPLYlL3USEfekuq+LRp5SBI=;
        b=h5tFAg2WL/lLxFwEsVseEJxb+6FQqjtY7j0/WPadplUIxx5d1AoOc1aU6S3X2nKPxP
         IgmTVCIkC/s/j3D8eoGkiNipvaNpQUGxo+TMed7HKU0x833FXeyX4Z/pZHLqymtTY9Ch
         RcYy0oa45UKupcanG1Y1cDmFVrzK38OXAVvqlpe4rq+5gIz1sZd93TpWV+Q20165h/9O
         5aCq3ERkuSIAEePVfobdkMcxIhjGLYgtm8wdpEitnPR1baJi5Nt3kgmvIXo7RQ8k4dDO
         PvfIfET1QYc3eNADNwfkfVw5hKw/8B3mOqGu8/r6tXGkOX2c3DHreTgT1bRr6Id7jsMn
         G5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JCgRmAUBXx0DCeauy0AJuPLYlL3USEfekuq+LRp5SBI=;
        b=Mj/xgrfWpXnwRIQ2QTXWbLeRbWbBcigHDr7KCnRuMw4/McJD1u4jRBv2VbHhQUoQpU
         Tlk7AC8ewollmZNspvboEOYGb9FlIINUnb5Wl9t5G12dHH8w63ra02QbWy0BzebtvYsx
         fzggmrv/MFZJDLka9888oZA21p6kcq1JkzrjL1sG1t9IxRTd2ACxprTEAtintuoaNY7d
         nzE1W915INSBqZkJALKgsNv2/aDFIagrp05YYmveUkixuBHDbUsKFuyFE7cRWPuz8oIY
         bUbjEeVQXru40sqQ06Gc0TvAL1Z3Jf4aw5loeEXZmeYmmecUTEVJcaQgpQI16vY4ij8m
         DpcQ==
X-Gm-Message-State: ANoB5pnHPG2bZCK2gaZ7Hg92Oshfq9ZWDvTxV0v5gzxH2S7vDAz7gr7g
        5cPCk2SldU0bDkdro2YcllbLCRDzr266wQ==
X-Google-Smtp-Source: AA0mqf7Ler2R5A456at3vyIO/ns8znD8UWtGMsxyAMAa8leloTvLHJY6m/sdDcItAL3ZV56VXKT3Sg==
X-Received: by 2002:a17:902:db0b:b0:173:f3f:4a99 with SMTP id m11-20020a170902db0b00b001730f3f4a99mr8706390plx.79.1669141468294;
        Tue, 22 Nov 2022 10:24:28 -0800 (PST)
Received: from localhost (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902bd0500b00183c67844aesm315543pls.22.2022.11.22.10.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 10:24:27 -0800 (PST)
Sender: Junio C Hamano <jch2355@gmail.com>
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Nov 2022, #05; Tue, 22)
X-master-at: a0789512c5a4ae7da935cd2e419f253cb3cb4ce7
X-next-at: 69dc60536b568f42ae709ad6bea424c3fdfcbf1c
Date:   Wed, 23 Nov 2022 03:24:27 +0900
Message-ID: <xmqqfseargo4.fsf@gitster.g>
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

I have been offline for the last couple of weeks, but it seems that
the development community have continued to thrive under Taylor's
care.  Thanks for successfully concluding the "bus factor" exercise,
everybody.  It will probably take me a few more days to catch up
with what is in the tree right now and has been described in the
previous few issues of the "What's cooking" report, and after that
we will have -rc0 for the coming release.

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

* ew/prune-with-missing-objects-pack (2022-11-21) 1 commit
 - prune: quiet ENOENT on missing directories

 "git prune" may try to iterate over .git/objects/pack for trash
 files to remove in it, and loudly fail when the directory is
 missing, which is not necessary.  The command has been taught to
 ignore such a failure.

 Will merge to 'next'.
 source: <20221119201213.2398081-1-e@80x24.org>


* rs/list-objects-filter-leakfix (2022-11-21) 1 commit
 - list-objects-filter: plug combine_filter_data leak

 Leakfix.

 Will merge to 'next'.
 source: <bc25ac8c-ce9a-2385-be0d-0c72798d319d@web.de>


* es/locate-httpd-module-location-in-test (2022-11-22) 1 commit
 - lib-httpd: extend module location auto-detection

 Add one more candidate directory that may house httpd modules while
 running tests.

 Will merge to 'next'.
 source: <pull.1426.git.1668999695898.gitgitgadget@gmail.com>


* zk/push-use-bitmaps (2022-11-22) 1 commit
 - t5516: fail to run in verbose mode

 Test fix.

 Will merge to 'next'.
 source: <20221121134040.12260-1-worldhello.net@gmail.com>

--------------------------------------------------
[Stalled]

* ms/sendemail-validate-headers (2022-11-11) 1 commit
 . Expose header information to git-send-email's sendemail-validate hook

 Expecting a reroll.
 Appears to break t9001 completely?
 source: <20221111194223.644845-2-michael.strawbridge@amd.com>


* ab/config-multi-and-nonbool (2022-11-02) 9 commits
 . for-each-repo: with bad config, don't conflate <path> and <cmd>
 . config API: add "string" version of *_value_multi(), fix segfaults
 . config API users: test for *_get_value_multi() segfaults
 . for-each-repo: error on bad --config
 . config API: have *_multi() return an "int" and take a "dest"
 . versioncmp.c: refactor config reading next commit
 . config tests: add "NULL" tests for *_get_value_multi()
 . config tests: cover blind spots in git_die_config() tests
 . for-each-repo tests: test bad --config keys

 A mixed bag of config API updates.

 Waiting for review.
 cf. <221026.86pmeebcj9.gmgdl@evledraar.gmail.com>
 source: <cover-v2-0.9-00000000000-20221101T225822Z-avarab@gmail.com>


* hl/archive-recursive (2022-10-19) 10 commits
 . fixup! archive: add tests for git archive --recurse-submodules
 . archive: add tests for git archive --recurse-submodules
 . archive: add --recurse-submodules to git-archive command
 . archive: remove global repository from archive_args
 . archive: pass repo objects to write_archive handlers
 . tree: add repository parameter to read_tree_fn_t
 . tree: handle submodule case for read_tree_at properly
 . tree: increase test coverage for tree.c
 . tree: update cases to use repo_ tree methods
 . tree: do not use the_repository for tree traversal methods.

 "git archive" has been taught "--recurse-submodules" option to
 create a tarball that includes contents from submodules.

 Expecting a reroll.
 Seems to break win+VS test(8).
 cf. https://github.com/git/git/actions/runs/3293333066 whose only
 difference from https://github.com/git/git/actions/runs/3293553109
 is the inclusion of this topic.
 source: <pull.1359.v3.git.git.1665973401.gitgitgadget@gmail.com>


* pw/test-todo (2022-10-06) 3 commits
 . test_todo: allow [verbose] test as the command
 . test_todo: allow [!] grep as the command
 . tests: add test_todo() to mark known breakages

 RFC for test framework improvement.

 Needs review.
 source: <pull.1374.git.1665068476.gitgitgadget@gmail.com>


* cw/submodule-status-in-parallel (2022-11-08) 6 commits
 - diff-lib: parallelize run_diff_files for submodules
 - diff-lib: refactor match_stat_with_submodule
 - submodule: move status parsing into function
 - submodule: strbuf variable rename
 - run-command: add duplicate_output_fn to run_processes_parallel_opts
 - Merge branch 'ab/run-hook-api-cleanup' into cw/submodule-status-in-parallel

 Allow the internal "diff-files" engine to run "how has this
 submodule changed?" in parallel to speed up "git status".

 Waiting for review.
 source: <20221020232532.1128326-1-calvinwan@google.com>


* js/bisect-in-c (2022-08-30) 17 commits
 . bisect: no longer try to clean up left-over `.git/head-name` files
 . bisect: remove Cogito-related code
 . Turn `git bisect` into a full built-in
 . bisect: move even the command-line parsing to `bisect--helper`
 . bisect--helper: make `state` optional
 . bisect--helper: calling `bisect_state()` without an argument is a bug
 . bisect: avoid double-quoting when printing the failed command
 . bisect run: fix the error message
 . bisect: verify that a bogus option won't try to start a bisection
 . bisect--helper: migrate to OPT_SUBCOMMAND()
 . bisect--helper: make the order consistently `argc, argv`
 . bisect--helper: make `terms` an explicit singleton
 . bisect--helper: simplify exit code computation
 . bisect--helper: really retire `--bisect-autostart`
 . bisect--helper: really retire --bisect-next-check
 . bisect--helper: retire the --no-log option
 . Merge branch 'sg/parse-options-subcommand' into js/bisect-in-c

 Final bits of "git bisect.sh" have been rewritten in C.

 Temporarily ejected from 'seen'. Waiting for a response on how this
 topic interacts with 'dd/git-bisect-builtin'.
 cf. <xmqqv8pr8903.fsf@gitster.g>
 source: <pull.1132.v6.git.1661885419.gitgitgadget@gmail.com>


* od/ci-use-checkout-v3-when-applicable (2022-10-10) 2 commits
 . ci(main): linux32 uses actions/checkout@v2
 . ci(main): upgrade actions/checkout to v3

 Attempt to update GitHub CI to use actions/checkout@v3

 Expecting a reroll.
 Seems to break the CI completely.
 source: <pull.1354.git.git.1665388136.gitgitgadget@gmail.com>


* ed/fsmonitor-inotify (2022-11-16) 6 commits
 - fsmonitor: update doc for Linux
 - fsmonitor: test updates
 - fsmonitor: enable fsmonitor for Linux
 - fsmonitor: implement filesystem change listener for Linux
 - fsmonitor: determine if filesystem is local or remote
 - fsmonitor: prepare to share code between Mac OS and Linux

 Bundled fsmonitor for Linux using inotify API.

 Needs review on the updated round.
 Occasional breakages of t7527.16??
 source: <pull.1352.v3.git.git.1668641019.gitgitgadget@gmail.com>


* ag/merge-strategies-in-c (2022-08-10) 14 commits
 . sequencer: use the "octopus" strategy without forking
 . sequencer: use the "resolve" strategy without forking
 . merge: use the "octopus" strategy without forking
 . merge: use the "resolve" strategy without forking
 . merge-octopus: rewrite in C
 . merge-recursive: move better_branch_name() to merge.c
 . merge-resolve: rewrite in C
 . merge-one-file: rewrite in C
 . update-index: move add_cacheinfo() to read-cache.c
 . merge-index: add a new way to invoke `git-merge-one-file'
 . merge-index: drop the index
 . merge-index: libify merge_one_path() and merge_all()
 . t6060: add tests for removed files
 . t6060: modify multiple files to expose a possible issue with merge-index

 An attempt to rewrite remaining merge strategies from shell to C.

 Needs more work.
 At the minimum, we should lose 11/14 and possibly 08/14.
 cf. <xmqq7d36vfur.fsf@gitster.g>
 source: <20220809185429.20098-1-alban.gruin@gmail.com>


* es/doc-creation-factor-fix (2022-07-28) 2 commits
 . range-diff: clarify --creation-factor=<factor>
 . format-patch: clarify --creation-factor=<factor>

 Expecting a reroll by somebody more familiar with the logic
 cf. <xmqqo7wfix7p.fsf@gitster.g>
 source: <7229p500-p2r4-on87-6802-8o90s36rr3s4@tzk.qr>


* cw/remote-object-info (2022-08-13) 7 commits
 . SQUASH???
 . cat-file: add remote-object-info to batch-command
 . transport: add client support for object-info
 . serve: advertise object-info feature
 . protocol-caps: initialization bug fix
 . fetch-pack: move fetch initialization
 . fetch-pack: refactor packet writing

 A client component to talk with the object-info endpoint.

 Expecting a reroll.
 Under SANITIZE=address, t1006-cat-file.sh finds a breakage.
 cf. <20220728230210.2952731-1-calvinwan@google.com>
 cf. <CAFySSZDvgwbbHCHfyuaqX3tKsr-GjJ9iihygg6rNNe46Ys7_EA@mail.gmail.com>
 source: <20220728230210.2952731-1-calvinwan@google.com>

--------------------------------------------------
[Cooking]

* sa/cat-file-mailmap--batch-check (2022-11-21) 2 commits
 - cat-file: add mailmap support to --batch-check option
 - cat-file: add mailmap support to -s option

 'cat-file' gains mailmap support for its '--batch-check' and '-s'
 options.
 source: <20221120074852.121346-1-siddharthasthana31@gmail.com>


* ab/fewer-the-index-macros (2022-11-21) 11 commits
 - cocci: apply "pending" index-compatibility to some "builtin/*.c"
 - cache.h & test-tool.h: add & use "USE_THE_INDEX_VARIABLE"
 - {builtin/*,repository}.c: add & use "USE_THE_INDEX_VARIABLE"
 - cocci: apply "pending" index-compatibility to "t/helper/*.c"
 - cocci & cache.h: apply variable section of "pending" index-compatibility
 - cocci & cache.h: apply a selection of "pending" index-compatibility
 - cocci: add a index-compatibility.pending.cocci
 - read-cache API & users: make discard_index() return void
 - cocci & cache.h: remove rarely used "the_index" compat macros
 - builtin/{grep,log}.: don't define "USE_THE_INDEX_COMPATIBILITY_MACROS"
 - cache.h: remove unused "the_index" compat macros

 Progress on removing 'the_index' convenience wrappers.

 Will merge to 'next'.
 source: <cover-v2-00.11-00000000000-20221119T125550Z-avarab@gmail.com>


* ab/tag-object-type-errors (2022-11-22) 5 commits
 - tag: don't emit potentially incorrect "object is a X, not a Y"
 - tag: don't misreport type of tagged objects in errors
 - object tests: add test for unexpected objects in tags
 - object-file.c: free the "t.tag" in check_tag()
 - Merge branch 'jk/parse-object-type-mismatch' into ab/tag-object-type-errors
 (this branch uses jk/parse-object-type-mismatch.)

 Hardening checks around mismatched object types when one of those
 objects is a tag.

 Needs review.
 source: <cover-0.4-00000000000-20221118T113442Z-avarab@gmail.com>


* ew/delta-islands-free (2022-11-18) 1 commit
  (merged to 'next' on 2022-11-18 at 7c4899e0cb)
 + delta-islands: free island-related data after use

 Free structures related to delta islands after use.

 Will merge to 'master'.
 source: <20221117230658.M516129@dcvr>


* gc/resolve-alternate-symlinks (2022-11-22) 1 commit
 - object-file: use real paths when adding alternates

 Resolve symbolic links when processing the locations of alternate
 object stores, since failing to do so can lead to confusing and buggy
 behavior.

 Will merge to 'next'.
 source: <pull.1382.v2.git.git.1669074557348.gitgitgadget@gmail.com>


* jk/parse-object-type-mismatch (2022-11-22) 3 commits
  (merged to 'next' on 2022-11-22 at 69dc60536b)
 + parse_object(): simplify blob conditional
  (merged to 'next' on 2022-11-18 at 1ee133a089)
 + parse_object(): check on-disk type of suspected blob
 + parse_object(): drop extra "has" check before checking object type
 (this branch is used by ab/tag-object-type-errors.)

 `parse_object()` hardening when checking for the existence of a
 suspected blob object.

 Will merge to 'master'.
 source: <Y3vQ/6QcTEFfpjLt@coredump.intra.peff.net>


* js/range-diff-mbox (2022-11-21) 1 commit
 - range-diff: support reading mbox files

 'git range-diff' gained support for reading either side from an .mbox
 file instead of a revision range.
 source: <pull.1420.v2.git.1668899471058.gitgitgadget@gmail.com>


* mg/notes-newline (2022-11-16) 1 commit
  (merged to 'next' on 2022-11-18 at b20234698d)
 + notes: avoid empty line in template

 Avoid a stray empty newline in the template when creating new notes.

 Will merge to 'master'.
 source: <347ee7ad6fea7cf96bb1e51772802102082b58cc.1668614158.git.git@grubix.eu>


* rj/branch-copy-and-rename (2022-11-17) 2 commits
 - branch: clear target branch configuration before copying or renaming
 - branch: force-copy a branch to itself via @{-1} is a no-op

 Fix a pair of bugs in 'git branch'.

 Waiting for review discussion to settle.
 source: <f0b2d46c-2e9c-2630-2870-8ed550dd1606@gmail.com>


* tl/ls-tree--pattern (2022-11-17) 6 commits
 - ls-tree: introduce '--pattern' option
 - ls-tree: introduce 'match_pattern()' function
 - ls-tree: improving cohension in the print code
 - ls-tree: optimize params of 'show_tree_common_default_long()'
 - t3104: remove shift code in 'test_ls_tree_format'
 - ls-tree: cleanup the redundant SPACE

 A synonym for "ls-tree | grep <pattern>", "ls-tree
 --pattern=<pattern>" was introduced.

 Waiting for review response, but leaning negative.
 source: <20221117113023.65865-1-tenglong.tl@alibaba-inc.com>


* tr/am--no-verify (2022-11-18) 1 commit
 - am: Allow passing --no-verify flag

 Conditionally skip the pre-applypatch and applypatch-msg hooks when
 applying patches with 'git am'.

 Expecting another round.
 source: <20221118132743.3525725-1-thierry.reding@gmail.com>


* ab/remove--super-prefix (2022-11-21) 11 commits
 - fetch: rename "--submodule-prefix" to "--super-prefix"
 - read-tree: add "--super-prefix" option, eliminate global
 - submodule--helper: convert "{update,clone}" to their own "--super-prefix"
 - submodule--helper: convert "status" to its own "--super-prefix"
 - submodule--helper: convert "sync" to its own "--super-prefix"
 - submodule--helper: convert "foreach" to its own "--super-prefix"
 - submodule--helper: don't use global --super-prefix in "absorbgitdirs"
 - submodule.c & submodule--helper: pass along "super_prefix" param
 - read-tree + fetch tests: test failing "--super-prefix" interaction
 - Merge branch 'ab/submodule-no-abspath' into ab/remove--super-prefix
 - Merge branch 'ab/submodule-helper-prep-only' into ab/remove--super-prefix
 (this branch uses ab/submodule-helper-prep-only and ab/submodule-no-abspath.)

 Remove the top-level `--super-prefix` option.
 source: <cover-v3-0.9-00000000000-20221119T122853Z-avarab@gmail.com>


* ab/submodule-no-abspath (2022-11-09) 1 commit
  (merged to 'next' on 2022-11-18 at 34d0accc7b)
 + submodule--helper absorbgitdirs: no abspaths in "Migrating git..."
 (this branch is used by ab/remove--super-prefix.)

 Remove an absolute path in the "Migrating git directory" message.

 Will merge to 'master'.
 source: <patch-1.1-34b54fdd9bb-20221109T020347Z-avarab@gmail.com>


* ab/t7610-timeout (2022-11-15) 2 commits
  (merged to 'next' on 2022-11-15 at 9dadac032a)
 + t7610: use "file:///dev/null", not "/dev/null", fixes MinGW
  (merged to 'next' on 2022-11-14 at 82a4abdb1d)
 + t7610: fix flaky timeout issue, don't clone from example.com

 Fix a source of flakiness in CI when compiling with SANITIZE=leak.

 Will merge to 'master'.
 source: <patch-1.1-21a9cb49299-20221115T233516Z-avarab@gmail.com>


* es/chainlint-lineno (2022-11-11) 4 commits
  (merged to 'next' on 2022-11-18 at 20c9692235)
 + chainlint: prefix annotated test definition with line numbers
 + chainlint: latch line numbers at which each token starts and ends
 + chainlint: sidestep impoverished macOS "terminfo"
 + Merge branch 'es/chainlint-output' into es/chainlint-lineno
 (this branch uses es/chainlint-output.)

 Teach chainlint.pl to show corresponding line numbers when printing
 the source of a test.

 Will merge to 'master'.
 source: <pull.1413.v2.git.1668152094.gitgitgadget@gmail.com>


* ew/format-patch-mboxrd (2022-11-14) 1 commit
 - format-patch: add --mboxrd alias for --pretty=mboxrd

 Teach `format-patch` a convenient alias for `--pretty=mboxrd`.

 Waiting for discussion to settle.
 source: <20221114094114.18986-1-e@80x24.org>


* gc/redact-h2h3-headers (2022-11-14) 2 commits
  (merged to 'next' on 2022-11-14 at 34157d24e9)
 + http: redact curl h2h3 headers in info
 + t: run t5551 tests with both HTTP and HTTP/2

 Redact headers from cURL's h2h3 module in GIT_CURL_VERBOSE and
 others.

 Will merge to 'master'.
 source: <pull.1377.v3.git.git.1668206106.gitgitgadget@gmail.com>


* js/drop-mingw-test-cmp (2022-11-14) 2 commits
 - tests(mingw): avoid very slow `mingw_test_cmp`
 - t0021: use Windows-friendly `pwd`

 Use `git diff --no-index` as a test_cmp on Windows.

 Waiting for review response.
 source: <pull.1309.v4.git.1668434812.gitgitgadget@gmail.com>


* mc/switch-advice (2022-11-09) 1 commit
 - po: use `switch` over `checkout` in error message

 Use 'switch' instead of 'checkout' in an error message.

 Waiting for review response.
 source: <pull.1308.git.git.1668018620148.gitgitgadget@gmail.com>


* mh/gitcredentials-generate (2022-11-14) 1 commit
  (merged to 'next' on 2022-11-18 at 99f2365d6b)
 + Docs: describe how a credential-generating helper works

 Doc update.

 Will merge to 'master'.
 source: <pull.1379.git.git.1668217470500.gitgitgadget@gmail.com>


* pw/strict-label-lookups (2022-11-10) 2 commits
  (merged to 'next' on 2022-11-14 at 7db4398d23)
 + sequencer: tighten label lookups
 + sequencer: unify label lookup

 Correct an error where `git rebase` would mistakenly use a branch or
 tag named "refs/rewritten/xyz" when missing a rebase label.

 Will merge to 'master'.
 source: <pull.1414.git.1668098622.gitgitgadget@gmail.com>


* rs/multi-filter-args (2022-11-21) 3 commits
 - Revert "pack-objects: lazily set up "struct rev_info", don't leak"
 - t5317: demonstrate failure to handle multiple --filter options
 - t5317: stop losing return codes of git ls-files

 Fix a bug where `pack-objects` would not respect multiple `--filter`
 arguments when invoked directly.
 source: <d19c6cb4-611f-afea-8a14-5e58d7509113@web.de>


* ab/various-leak-fixes (2022-11-21) 16 commits
  (merged to 'next' on 2022-11-21 at eff484a27c)
 + built-ins: use free() not UNLEAK() if trivial, rm dead code
 + revert: fix parse_options_concat() leak
 + cherry-pick: free "struct replay_opts" members
 + rebase: don't leak on "--abort"
 + connected.c: free the "struct packed_git"
 + sequencer.c: fix "opts->strategy" leak in read_strategy_opts()
 + ls-files: fix a --with-tree memory leak
 + revision API: call graph_clear() in release_revisions()
 + unpack-file: fix ancient leak in create_temp_file()
 + built-ins & libs & helpers: add/move destructors, fix leaks
 + dir.c: free "ident" and "exclude_per_dir" in "struct untracked_cache"
 + read-cache.c: clear and free "sparse_checkout_patterns"
 + commit: discard partial cache before (re-)reading it
 + {reset,merge}: call discard_index() before returning
 + tests: mark tests as passing with SANITIZE=leak
 + Merge branch 'pw/rebase-no-reflog-action' into ab/various-leak-fixes
 (this branch uses pw/rebase-no-reflog-action.)

 Various leak fixes.

 Will cook in 'next'.
 source: <cover-v2-00.15-00000000000-20221108T172650Z-avarab@gmail.com>


* aw/complete-case-insensitive (2022-11-07) 2 commits
 - completion: add case-insensitive match of pseudorefs
 - completion: add optional ignore-case when matching refs

 Introduce a case insensitive mode to the Bash completion helpers.

 Waiting for review.
 source: <pull.1374.git.git.1667669315.gitgitgadget@gmail.com>


* dd/bisect-helper-subcommand (2022-11-11) 3 commits
  (merged to 'next' on 2022-11-14 at 066f19c4fe)
 + bisect--helper: parse subcommand with OPT_SUBCOMMAND
 + bisect--helper: move all subcommands into their own functions
 + bisect--helper: remove unused options
 (this branch is used by dd/git-bisect-builtin.)

 Fix a regression in the bisect-helper which mistakenly treats
 arguments to the command given to 'git bisect run' as arguments to
 the helper.

 Will merge to 'master'.
 source: <cover.1668097286.git.congdanhqx@gmail.com>


* dd/git-bisect-builtin (2022-11-15) 13 commits
  (merged to 'next' on 2022-11-15 at e16e754058)
 + bisect; remove unused "git-bisect.sh" and ".gitignore" entry
  (merged to 'next' on 2022-11-14 at fc304fb52f)
 + Turn `git bisect` into a full built-in
 + bisect--helper: log: allow arbitrary number of arguments
 + bisect--helper: handle states directly
 + bisect--helper: emit usage for "git bisect"
 + bisect test: test exit codes on bad usage
 + bisect--helper: identify as bisect when report error
 + bisect-run: verify_good: account for non-negative exit status
 + bisect run: keep some of the post-v2.30.0 output
 + bisect: fix output regressions in v2.30.0
 + bisect: refactor bisect_run() to match CodingGuidelines
 + bisect tests: test for v2.30.0 "bisect run" regressions
 + Merge branch 'dd/bisect-helper-subcommand' into dd/git-bisect-builtin
 (this branch uses dd/bisect-helper-subcommand.)

 `git bisect` becomes a builtin.

 Will cook in 'next'.
 source: <cover.1668097962.git.congdanhqx@gmail.com>


* ds/packed-refs-v2 (2022-11-07) 30 commits
 - refs: skip hashing when writing packed-refs v2
 - p1401: create performance test for ref operations
 - ci: run GIT_TEST_PACKED_REFS_VERSION=2 in some builds
 - t*: skip packed-refs v2 over http tests
 - t3210: require packed-refs v1 for some tests
 - t5502: add PACKED_REFS_V1 prerequisite
 - t5312: allow packed-refs v2 format
 - t1409: test with packed-refs v2
 - packed-backend: create GIT_TEST_PACKED_REFS_VERSION
 - packed-refs: write prefix chunks
 - packed-refs: read optional prefix chunks
 - packed-refs: read file format v2
 - packed-refs: write file format version 2
 - packed-backend: create shell of v2 writes
 - config: add config values for packed-refs v2
 - packed-backend: create abstraction for writing refs
 - packed-backend: extract iterator/updates merge
 - packed-backend: extract add_write_error()
 - refs: extract packfile format to new file
 - chunk-format: parse trailing table of contents
 - chunk-format: allow trailing table of contents
 - chunk-format: store chunk offset during write
 - chunk-format: document trailing table of contents
 - chunk-format: number of chunks is optional
 - refs: allow loose files without packed-refs
 - repository: wire ref extensions to ref backends
 - config: fix multi-level bulleted list
 - extensions: add refFormat extension
 - read-cache: add index.computeHash config option
 - hashfile: allow skipping the hash function

 Waiting for review.
 source: <pull.1408.git.1667846164.gitgitgadget@gmail.com>


* es/chainlint-output (2022-11-08) 4 commits
  (merged to 'next' on 2022-11-14 at 9cd7d30183)
 + chainlint: annotate original test definition rather than token stream
 + chainlint: latch start/end position of each token
 + chainlint: tighten accuracy when consuming input stream
 + chainlint: add explanatory comments
 (this branch is used by es/chainlint-lineno.)

 Teach chainlint.pl to annotate the original test definition instead
 of the token stream.

 Will merge to 'master'.
 source: <pull.1375.git.git.1667934510.gitgitgadget@gmail.com>


* ja/worktree-orphan (2022-11-10) 2 commits
 - worktree add: add --orphan flag
 - worktree add: Include -B in usage docs

 'git worktree add' learned how to create a worktree based on an
 orphaned branch with `--orphan`.

 Expecting another round?
 source: <20221110233137.10414-1-jacobabel@nullpo.dev>


* js/remove-stale-scalar-repos (2022-11-11) 2 commits
  (merged to 'next' on 2022-11-14 at e1c86051c4)
 + tests(scalar): tighten the stale `scalar.repo` test some
  (merged to 'next' on 2022-11-08 at 6d598a3b80)
 + scalar reconfigure -a: remove stale `scalar.repo` entries

 'scalar reconfigure -a' is taught to automatically remove
 scalar.repo entires which no longer exist.

 Will merge to 'master'.
 source: <pull.1415.git.1668065327120.gitgitgadget@gmail.com>


* jt/submodule-on-demand (2022-11-14) 1 commit
  (merged to 'next' on 2022-11-18 at a89ee23abb)
 + Doc: document push.recurseSubmodules=only

 Push all submodules recursively with
 '--recurse-submodules=on-demand'.

 Will merge to 'master'.
 source: <20221114213713.2341945-1-jonathantanmy@google.com>


* pw/rebase-no-reflog-action (2022-11-09) 2 commits
  (merged to 'next' on 2022-11-14 at 790dadc8d3)
 + rebase: stop exporting GIT_REFLOG_ACTION
 + sequencer: stop exporting GIT_REFLOG_ACTION
 (this branch is used by ab/various-leak-fixes.)

 Avoid setting GIT_REFLOG_ACTION to improve readability of the
 sequencer internals.

 Will merge to 'master'.
 source: <31df037eafede799c2ef27df66c6da309b719b1b.1668003719.git.gitgitgadget@gmail.com>


* rp/maintenance-qol (2022-11-15) 4 commits
  (merged to 'next' on 2022-11-15 at be4379029c)
 + builtin/gc.c: fix use-after-free in maintenance_unregister()
  (merged to 'next' on 2022-11-15 at 53dc6c8b0d)
 + maintenance --unregister: fix uninit'd data use & -Wdeclaration-after-statement
  (merged to 'next' on 2022-11-14 at 17db40bf26)
 + maintenance: add option to register in a specific config
 + for-each-repo: interpolate repo path arguments

 'git maintenance register' is taught to write configuration to an
 arbitrary path, and 'git for-each-repo' is taught to expand tilde
 characters in paths.

 Will merge to 'master'.
 source: <20221109190708.22725-1-ronan@rjp.ie>
 source: <patch-1.1-54d405f15f1-20221115T080212Z-avarab@gmail.com>


* sz/macos-fsmonitor-symlinks (2022-11-08) 1 commit
  (merged to 'next' on 2022-11-18 at ad972b3819)
 + fsmonitor--daemon: on macOS support symlink

 Fix an issue where core.fsmonitor on macOS would not notice created
 or modified symbolic links.

 Will merge to 'master'.
 source: <pull.1406.git.1667885119570.gitgitgadget@gmail.com>


* tb/ci-concurrency (2022-11-08) 1 commit
 - ci: avoid unnecessary builds

 Avoid unnecessary builds in CI, with settings configured in
 ci-config.

 Waiting for review.
 source: <ff172f1de982f6f79b598e4ac6d5b2964ca4a098.1667931937.git.me@ttaylorr.com>


* tl/notes--blankline (2022-11-09) 5 commits
 - notes.c: introduce "--no-blank-line" option
 - notes.c: provide tips when target and append note are both empty
 - notes.c: drop unreachable code in 'append_edit()'
 - notes.c: cleanup for "designated init" and "char ptr init"
 - notes.c: cleanup 'strbuf_grow' call in 'append_edit'

 'git notes append' was taught '--[no-]blank-line' to conditionally
 add a LF between a new and existing note.

 Expecting a reroll.
 source: <cover.1667980450.git.dyroneteng@gmail.com>


* ab/submodule-helper-prep-only (2022-11-08) 9 commits
  (merged to 'next' on 2022-11-08 at c0c4f4d1c3)
 + submodule--helper: use OPT_SUBCOMMAND() API
 + submodule--helper: drop "update --prefix <pfx>" for "-C <pfx> update"
 + submodule--helper: remove --prefix from "absorbgitdirs"
 + submodule API & "absorbgitdirs": remove "----recursive" option
 + submodule.c: refactor recursive block out of absorb function
 + submodule tests: test for a "foreach" blind-spot
 + submodule--helper: fix a memory leak in "status"
 + submodule tests: add tests for top-level flag output
 + submodule--helper: move "config" to a test-tool
 (this branch is used by ab/remove--super-prefix.)

 Preparation to remove git-submodule.sh and replace it with a builtin.

 Will merge to 'master'.
 source: <cover-v2-0.9-00000000000-20221108T140501Z-avarab@gmail.com>


* ds/bundle-uri-4 (2022-11-16) 9 commits
 - clone: unbundle the advertised bundles
 - bundle-uri: download bundles from an advertised list
 - bundle-uri: allow relative URLs in bundle lists
 - strbuf: introduce strbuf_strip_file_from_path()
 - bundle-uri client: add boolean transfer.bundleURI setting
 - bundle-uri: serve bundle.* keys from config
 - bundle-uri client: add helper for testing server
 - bundle-uri client: add minimal NOOP client
 - protocol v2: add server-side "bundle-uri" skeleton

 Bundle URIs part 4.

 Waiting for review.
 source: <pull.1400.v2.git.1668628302.gitgitgadget@gmail.com>


* sg/plug-line-log-leaks (2022-11-02) 3 commits
 - diff.c: use diff_free_queue()
 - line-log: free the diff queues' arrays when processing merge commits
 - line-log: free diff queue when processing non-merge commits

 A handful of leaks in the line-log machinery have been plugged.

 Will merge to 'next'.
 source: <20221102220142.574890-1-szeder.dev@gmail.com>


* tb/howto-maintain-git-fixes (2022-10-31) 2 commits
  (merged to 'next' on 2022-11-18 at e631f9f305)
 + Documentation: build redo-seen.sh from jch..seen
 + Documentation: build redo-jch.sh from master..jch

 A pair of bugfixes to the Documentation/howto/maintain-git.txt guide.

 Will merge to 'master'.
 source: <cover.1667260044.git.me@ttaylorr.com>


* tl/pack-bitmap-absolute-paths (2022-11-14) 2 commits
  (merged to 'next' on 2022-11-14 at 34eb0ea05a)
 + pack-bitmap.c: avoid exposing absolute paths
 + pack-bitmap.c: remove unnecessary "open_pack_index()" calls

 The pack-bitmap machinery is taught to log the paths of redundant
 bitmap(s) to trace2 instead of stderr.

 Waiting for two follow-on patches.
 cf. <xmqqbkozvqbt.fsf@gitster.g>
 source: <cover.1668063122.git.dyroneteng@gmail.com>


* ab/cmake-nix-and-ci (2022-11-04) 14 commits
  (merged to 'next' on 2022-11-08 at 6ef4e93b36)
 + CI: add a "linux-cmake-test" to run cmake & ctest on linux
 + cmake: copy over git-p4.py for t983[56] perforce test
 + cmake: only look for "sh" in "C:/Program Files" on Windows
 + cmake: increase test timeout on Windows only
 + cmake: support GIT_TEST_OPTS, abstract away WIN32 defaults
 + Makefile + cmake: use environment, not GIT-BUILD-DIR
 + test-lib.sh: support a "GIT_TEST_BUILD_DIR"
 + cmake: set "USE_LIBPCRE2" in "GIT-BUILD-OPTIONS" for test-lib.sh
 + cmake & test-lib.sh: add a $GIT_SOURCE_DIR variable
 + cmake: chmod +x the bin-wrappers/* & SCRIPT_{SH,PERL} & git-p4
 + cmake: don't copy chainlint.pl to build directory
 + cmake: update instructions for portable CMakeLists.txt
 + cmake: use "-S" and "-B" to specify source and build directories
 + cmake: don't invoke msgfmt with --statistics

 Fix assorted issues with CTest on *nix machines.

 Will cook in 'next'.
 source: <cover-v4-00.14-00000000000-20221103T160255Z-avarab@gmail.com>


* ab/make-bin-wrappers (2022-10-31) 4 commits
 . Makefile: simplify $(test_bindir_programs) rule by splitting it up
 . Makefile: rename "test_bindir_programs" variable, pre-declare
 . Makefile: define "TEST_{PROGRAM,OBJS}" variables earlier
 . Makefile: factor sed-powered '#!/bin/sh' munging into a variable

 Resolve issues with the bin-wrappers/% rules where "make
 bin-wrappers/git" would generate the script but not "git" itself.

 Waiting for review discussion to settle, but leaning negative.
 source: <cover-v3-0.4-00000000000-20221031T222249Z-avarab@gmail.com>


* kz/merge-tree-merge-base (2022-11-12) 2 commits
  (merged to 'next' on 2022-11-14 at 76d48ae21f)
 + merge-tree.c: allow specifying the merge-base when --stdin is passed
 + merge-tree.c: add --merge-base=<commit> option

 "merge-tree" learns a new `--merge-base` option.

 Will cook in 'next'.
 source: <pull.1397.v7.git.1668210314.gitgitgadget@gmail.com>


* po/pretty-hard-trunc (2022-11-13) 1 commit
 - pretty-formats: add hard truncation, without ellipsis, options

 Add a new pretty format which truncates without ellipsis.

 Waiting for review.
 source: <20221112143616.1429-1-philipoakley@iee.email>


* rr/long-status-advice (2022-11-15) 1 commit
 - status: long status advice adapted to recent capabilities

 The advice message emitted by a slow "status" run is amended to
 mention fsmonitor.

 Waiting for reviewer feedback on the updated round.
 source: <pull.1384.v6.git.1668547188070.gitgitgadget@gmail.com>


* ps/receive-use-only-advertised (2022-11-17) 7 commits
  (merged to 'next' on 2022-11-18 at e4a288a7a5)
 + receive-pack: only use visible refs for connectivity check
 + rev-parse: add `--exclude-hidden=` option
 + revision: add new parameter to exclude hidden refs
 + revision: introduce struct to handle exclusions
 + revision: move together exclusion-related functions
 + refs: get rid of global list of hidden refs
 + refs: fix memory leak when parsing hideRefs config

 "git receive-pack" used to use all the local refs as the boundary for
 checking connectivity of the data "git push" sent, but now it uses
 only the refs that it advertised to the pusher. In a repository with
 the .hideRefs configuration, this reduces the resources needed to
 perform the check.

 Will merge to 'master'.
 cf. <221028.86bkpw805n.gmgdl@evledraar.gmail.com>
 cf. <xmqqr0yrizqm.fsf@gitster.g>
 source: <cover.1668663795.git.ps@pks.im>


* gc/submodule-clone-update-with-branches (2022-10-30) 8 commits
 - clone, submodule update: create and check out branches
 - submodule--helper: remove update_data.suboid
 - submodule update: refactor update targets
 - submodule: return target of submodule symref
 - t5617: drop references to remote-tracking branches
 - submodule--helper clone: create named branch
 - repo-settings: add submodule_propagate_branches
 - clone: teach --detach option

 "git clone --recurse-submodules" and "git submodule update" learns
 to honor the "propagete branches" option.

 Waiting for review on the updated round.
 source: <pull.1321.v3.git.git.1666988096.gitgitgadget@gmail.com>


* pw/config-int-parse-fixes (2022-11-09) 3 commits
 - git_parse_signed(): avoid integer overflow
 - config: require at least one digit when parsing numbers
 - git_parse_unsigned: reject negative values

 Assorted fixes of parsing end-user input as integers.

 Will merge to 'next'.
 source: <pull.1389.v2.git.1668003388.gitgitgadget@gmail.com>


* cc/filtered-repack (2022-10-25) 2 commits
 - repack: add --filter=<filter-spec> option
 - pack-objects: allow --filter without --stdout

 "git repack" learns to discard objects that ought to be retrievable
 again from the promissor remote.

 Needs review.
 source: <20221025122856.20204-1-christian.couder@gmail.com>


* mc/credential-helper-auth-headers (2022-11-02) 11 commits
 - t5556: add HTTP authentication tests
 - test-http-server: add simple authentication
 - test-http-server: pass Git requests to http-backend
 - test-http-server: add HTTP request parsing
 - test-http-server: add HTTP error response function
 - test-http-server: add stub HTTP server test helper
 - http: set specific auth scheme depending on credential
 - http: move proactive auth to first slot creation
 - http: store all request headers on active_request_slot
 - credential: add WWW-Authenticate header to cred requests
 - http: read HTTP WWW-Authenticate response headers

 Extending credential helper protocol.

 Needs review.
 source: <pull.1352.v3.git.1667426969.gitgitgadget@gmail.com>


* ab/coccicheck-incremental (2022-11-11) 14 commits
  (merged to 'next' on 2022-11-14 at 8a70133571)
 + Makefile: don't create a ".build/.build/" for cocci, fix output
  (merged to 'next' on 2022-11-08 at 0f3c55d4c2)
 + spatchcache: add a ccache-alike for "spatch"
 + cocci: run against a generated ALL.cocci
 + cocci rules: remove <id>'s from rules that don't need them
 + Makefile: copy contrib/coccinelle/*.cocci to build/
 + cocci: optimistically use COMPUTE_HEADER_DEPENDENCIES
 + cocci: make "coccicheck" rule incremental
 + cocci: split off "--all-includes" from SPATCH_FLAGS
 + cocci: split off include-less "tests" from SPATCH_FLAGS
 + Makefile: split off SPATCH_BATCH_SIZE comment from "cocci" heading
 + Makefile: have "coccicheck" re-run if flags change
 + Makefile: add ability to TAB-complete cocci *.patch rules
 + cocci rules: remove unused "F" metavariable from pending rule
 + Makefile + shared.mak: rename and indent $(QUIET_SPATCH_T)

 "make coccicheck" is time consuming. It has been made to run more
 incrementally.

 Will merge to 'master'.
 source: <221109.86tu38p1x8.gmgdl@evledraar.gmail.com>
 source: <cover-v5-00.13-00000000000-20221101T222616Z-avarab@gmail.com>
