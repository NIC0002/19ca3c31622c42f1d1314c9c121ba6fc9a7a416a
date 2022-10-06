Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB85C433F5
	for <git@archiver.kernel.org>; Thu,  6 Oct 2022 22:58:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbiJFW6S (ORCPT <rfc822;git@archiver.kernel.org>);
        Thu, 6 Oct 2022 18:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiJFW6R (ORCPT <rfc822;git@vger.kernel.org>);
        Thu, 6 Oct 2022 18:58:17 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ACC5BEF86
        for <git@vger.kernel.org>; Thu,  6 Oct 2022 15:58:15 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id lx7so3016339pjb.0
        for <git@vger.kernel.org>; Thu, 06 Oct 2022 15:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3cSHq5zA1DXfLdOQU+ou46MhVNV7mXlis93A7ke2L0M=;
        b=H+nplIhZgwRV4gxuGtMyL2qcDk011dsviqEirQUf9OWljRSrtmNhMyqWQI49YccNtG
         phYmBziGmPF14IZAjJxUfKXjdQLMB0b2YWFKoHGNBeDjR4M2BTIyW990+xJKRc5hKnAA
         rkmqcBTOAvc/xpGUlvMMsIWcQIJ83yxdYgyNYUIH3aBcE2TdbBr7MGXVgO/tybRVdjE5
         6SCZkhuXVnTeWApOtQtLA3ZPBipK1VMLhPjIHdsJn7LKH8EqmrturygHl50P8/C4ILVU
         4bNgaU2cnE0wl73O1Yitw4oc4MxXJz2nSQVWWxALvmwOQwAY5XaxabY2cZw9fcDEjadh
         wZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3cSHq5zA1DXfLdOQU+ou46MhVNV7mXlis93A7ke2L0M=;
        b=vJLxV+fQRPahp2D620x/e97ZSYgVR5j9Cp8qvRrhAaTRrMlb5xmvIwmOuJEUy1z5nd
         r9NDk3BjWHc3fxJfaRcBR5ZYRfl2PPTuMLKwUNu1Iip5Ak9q/4+9G+fogZ1+dI87/+2z
         cSkGqs5GTPQ12C1ts63bVOgNaz/RtbFqnUSN82jjXCEuL3RlS4XnP/AKq8SDfNyrkML8
         PmCLMX6arIUWOkp/wnC9wAzKQOVGRtRqgOa7z2zik4W0rt/xrgFq57/utL0gOgsJjFl2
         vxpTqqnXGszvK6/DvmGK5QaIZuHuFpDBhSsKg180Su+oG1Tjmvkz/n/sNhos1gd2lrGJ
         FZtA==
X-Gm-Message-State: ACrzQf3a/zHzOc9OAH6NOUbP89hbETnV9zbTjDMe4n5IK4idpzMfQA1l
        hpx89tHy8fJsa3C68m+2thsBOQ8Smaw=
X-Google-Smtp-Source: AMsMyM6DfF/b7OxvLiDlvBhjNJJqIeKEVh0asClygZDVwG3DgAMIGt82iRvtli8cLxdySES4RRkoYg==
X-Received: by 2002:a17:90b:4a51:b0:20b:d92:516e with SMTP id lb17-20020a17090b4a5100b0020b0d92516emr1965608pjb.86.1665097093738;
        Thu, 06 Oct 2022 15:58:13 -0700 (PDT)
Received: from localhost (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id e1-20020a170902784100b001780e4e1a0fsm145448pln.125.2022.10.06.15.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 15:58:13 -0700 (PDT)
Sender: Junio C Hamano <jch2355@gmail.com>
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Oct 2022, #02; Thu, 6)
X-master-at: 3dcec76d9df911ed8321007b1d197c1a206dc164
X-next-at: 74048e4d9e2b6a27a4fab355a907e0c38d172bfd
Date:   Thu, 06 Oct 2022 15:58:12 -0700
Message-ID: <xmqqzge8h857.fsf@gitster.g>
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

It seems that there aren't many regressions we need to fix immediately
in the most recent release, so let's start merging some topics that
have already been cooking in 'next' down to 'master' and also some
topics that were kept in 'seen' down to 'next' soonish.

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

* jk/sequencer-missing-author-name-check (2022-10-03) 1 commit
 - sequencer: detect author name errors in read_author_script()

 Typofix in code.

 Will merge to 'next'.
 source: <YzqhEcTDwMwa8dQX@coredump.intra.peff.net>


* pw/mailinfo-b-fix (2022-10-03) 1 commit
 - mailinfo -b: fix an out of bounds access

 Fix a logic in "mailinfo -b" that miscomputed the length of a
 substring, which lead to an out-of-bounds access.

 Will merge to 'next'.


* pw/ssh-sign-report-errors (2022-10-05) 1 commit
 - ssh signing: return an error when signature cannot be read

 The codepath to sign learned to report errors when it fails to read
 from "ssh-keygen".

 Will merge to 'next'.
 source: <pull.1371.v2.git.1664877694430.gitgitgadget@gmail.com>


* ab/run-hook-api-cleanup (2022-10-05) 15 commits
 - run-command.c: don't copy "ungroup" to "struct parallel_processes"
 - run-command.c: don't copy *_fn to "struct parallel_processes"
 - run-command API: move *_tr2() users to "run_processes_parallel()"
 - run-command API: have run_process_parallel() take an "opts" struct
 - run-command API: make run_process_parallel{,_tr2}() thin wrappers
 - run-command API: add nascent "struct run_process_parallel_opts"
 - run-command.c: add an initializer for "struct parallel_processes"
 - run-command API: don't fall back on online_cpus()
 - run-command API: make "jobs" parameter an "unsigned int"
 - run-command API: have "run_processes_parallel{,_tr2}()" return void
 - run-command tests: use "return", not "exit"
 - run-command test helper: use "else if" pattern
 - run-command tests: test stdout of run_command_parallel()
 - submodule tests: reset "trace.out" between "grep" invocations
 - hook tests: fix redirection logic error in 96e7225b310

 Move a global variable added as a hack during regression fixes to
 its proper place in the API.

 Needs review.
 source: <cover-00.15-00000000000-20220930T111343Z-avarab@gmail.com>


* nb/doc-mergetool-typofix (2022-10-05) 1 commit
 - mergetool.txt: typofix 'overwriten' -> 'overwritten'

 Typofix.

 Will merge to 'next'.
 source: <pull.1350.git.git.1664844924663.gitgitgadget@gmail.com>


* rs/bisect-start-leakfix (2022-10-05) 1 commit
 - bisect--helper: plug strvec leak in bisect_start()

 Code clean-up that results in plugging a leak.

 Expecting a reroll.
 cf. <04d393cc-d8c7-ddf7-b235-12082f81c560@web.de>
 source: <5c6a4c30-d454-51b6-ec57-9af036b9c4e0@web.de>


* rs/gc-pack-refs-simplify (2022-10-05) 1 commit
 - gc: simplify maintenance_task_pack_refs()

 Code clean-up.

 Will merge to 'next'.
 source: <ab33f72e-d552-7bd7-bf04-3c476d32b5b6@web.de>


* rs/test-httpd-in-C-locale (2022-10-06) 1 commit
 - t/lib-httpd: pass LANG and LC_ALL to Apache

 Force C locale while running tests around httpd to make sure we can
 find expected error messages in the log.

 Will merge to 'next'.
 source: <a1699375-c660-13ab-42fb-26a8afe4c376@web.de>


* ab/unused-annotation (2022-10-05) 1 commit
 - git-compat-util.h: GCC deprecated message arg only in GCC 4.5+

 source: <20221005221928.703750-1-asedeno@google.com>


* dd/document-runtime-prefix-better (2022-10-05) 1 commit
 - Makefile: clarify runtime relative gitexecdir

 source: <20221006013205.15015-1-congdanhqx@gmail.com>


* jk/cleanup-callback-parameters (2022-10-06) 4 commits
 - attr: drop DEBUG_ATTR code
 - commit: avoid writing to global in option callback
 - multi-pack-index: avoid writing to global in option callback
 - test-submodule: inline resolve_relative_url() function

 Code clean-up.

 Will merge to 'next'.
 source: <Yz7Tjy7Rh8cXVxYQ@coredump.intra.peff.net>
 source: <Yz7UhYXvNl6+1GbZ@coredump.intra.peff.net>


* pw/test-todo (2022-10-06) 3 commits
 - test_todo: allow [verbose] test as the command
 - test_todo: allow [!] grep as the command
 - tests: add test_todo() to mark known breakages

 RFC for test framework improvement.

 Needs review.
 source: <pull.1374.git.1665068476.gitgitgadget@gmail.com>

--------------------------------------------------
[Stalled]

* cw/submodule-status-in-parallel (2022-09-23) 4 commits
 . diff-lib: parallelize run_diff_files for submodules
 . diff-lib: refactor functions
 . submodule: move status parsing into function
 . run-command: add pipe_output to run_processes_parallel

 Allow the internal "diff-files" engine to run "how has this
 submodule changed?" in parallel to speed up "git status".

 Breaks its self check.
 cf. https://github.com/git/git/actions/runs/3115673002/jobs/5052804463
 source: <20220922232947.631309-1-calvinwan@google.com>


* es/mark-gc-cruft-as-experimental (2022-08-03) 2 commits
 - config: let feature.experimental imply gc.cruftPacks=true
 - gc: add tests for --cruft and friends

 Enable gc.cruftpacks by default for those who opt into
 feature.experimental setting.

 Expecting a reroll.
 cf. <220804.86a68ke9d5.gmgdl@evledraar.gmail.com>
 cf. <6803b725-526e-a1c8-f15c-a9ed4a144d4c@github.com>
 source: <20220803205721.3686361-1-emilyshaffer@google.com>


* es/doc-creation-factor-fix (2022-07-28) 2 commits
 - range-diff: clarify --creation-factor=<factor>
 - format-patch: clarify --creation-factor=<factor>

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

* jc/tmp-objdir (2022-09-30) 1 commit
 - tmp-objdir: skip clean up when handling a signal

 The code to clean temporary object directories (used for
 quarantine) tried to remove them inside its signal handler, which
 was a no-no.

 Will merge to 'next'?
 source: <pull.1348.v4.git.git.1664570831583.gitgitgadget@gmail.com>


* jc/branch-description-unset (2022-09-30) 1 commit
 - branch: do not fail a no-op --edit-desc

 "GIT_EDITOR=: git branch --edit-description" resulted in failure,
 which has been corrected.

 Will merge to 'next'?
 source: <xmqqmtagka8x.fsf@gitster.g>


* rj/branch-edit-desc-unborn (2022-09-30) 1 commit
 - branch: description for non-existent branch errors

 "git branch --edit-description" on an unborh branch misleadingly
 said that no such branch exists, which has been corrected.

 Will merge to 'next'?
 source: <930ff836-a5c4-0e85-517d-39645f00cd31@gmail.com>


* ab/test-malloc-with-sanitize-leak (2022-09-29) 1 commit
  (merged to 'next' on 2022-09-29 at b6fef2dd1f)
 + test-lib: have SANITIZE=leak imply TEST_NO_MALLOC_CHECK

 Test fix.

 Will merge to 'master'?
 source: <patch-1.1-e31681731b7-20220928T095041Z-avarab@gmail.com>


* ah/branch-autosetupmerge-grammofix (2022-09-28) 1 commit
  (merged to 'next' on 2022-09-29 at 622b75f0da)
 + push: improve grammar of branch.autoSetupMerge advice

 Fix grammar of a message introduced in previous round.

 Will merge to 'master'?
 source: <20220928055811.777227-1-alexhenrie24@gmail.com>


* jt/promisor-remote-fetch-tweak (2022-10-05) 2 commits
 - promisor-remote: die upon failing fetch
 - promisor-remote: remove a return value

 Remove error detection from a function that fetches from promisor
 remotes, and make it die when such a fetch fails to bring all the
 requested objects, to give an early failure to various operations.

 Will merge to 'next'?
 Can somebody give a quick read on the test part of the patch?
 source: <cover.1664917853.git.jonathantanmy@google.com>


* rj/ref-filter-get-head-description-leakfix (2022-09-26) 1 commit
  (merged to 'next' on 2022-09-29 at d05d052eb1)
 + ref-filter.c: fix a leak in get_head_description

 Leakfix.

 Will merge to 'master'?
 source: <6ff29e96-7f8d-c354-dced-b1b363e54467@gmail.com>


* ds/scalar-unregister-idempotent (2022-09-27) 4 commits
  (merged to 'next' on 2022-09-28 at a09a78d861)
 + string-list: document iterator behavior on NULL input
 + gc: replace config subprocesses with API calls
 + scalar: make 'unregister' idempotent
 + maintenance: add 'unregister --force'

 "git maintenance unregister" in a repository that is already been
 unregistered reported an error.

 Will merge to 'master'?
 source: <pull.1358.v4.git.1664287021.gitgitgadget@gmail.com>


* jk/clone-allow-bare-and-o-together (2022-09-22) 1 commit
  (merged to 'next' on 2022-09-27 at 1feca721ac)
 + clone: allow "--bare" with "-o"

 "git clone" did not like to see the "--bare" and the "--origin"
 options used together without a good reason.

 Will merge to 'master'?
 source: <YyvzVdfQVdysvMp2@coredump.intra.peff.net>


* jk/fsck-on-diet (2022-09-22) 3 commits
  (merged to 'next' on 2022-09-27 at c2e93082a1)
 + parse_object_buffer(): respect save_commit_buffer
 + fsck: turn off save_commit_buffer
 + fsck: free tree buffers after walking unreachable objects

 "git fsck" failed to release contents of tree objects already used
 from the memory, which has been fixed.

 Will merge to 'master'?
 source: <Yyw0PSVe3YTQGgRS@coredump.intra.peff.net>


* jk/remote-rename-without-fetch-refspec (2022-09-22) 1 commit
  (merged to 'next' on 2022-09-27 at 165fe0a832)
 + remote: handle rename of remote without fetch refspec

 "git remote rename" failed to rename a remote without fetch
 refspec, which has been corrected.

 Will merge to 'master'?
 source: <YyvzqZ5tmI0UdRAW@coredump.intra.peff.net>


* js/merge-ort-in-read-only-repo (2022-09-28) 2 commits
  (merged to 'next' on 2022-09-29 at 84df46c1b4)
 + merge-ort: return early when failing to write a blob
 + merge-ort: fix segmentation fault in read-only repositories

 In read-only repositories, "git merge-tree" tried to come up with a
 merge result tree object, which it failed (which is not wrong) and
 led to a segfault (which is bad), which has been corrected.

 Will merge to 'master'?
 source: <pull.1362.v5.git.1664350162.gitgitgadget@gmail.com>


* mc/cred-helper-ignore-unknown (2022-09-22) 3 commits
  (merged to 'next' on 2022-09-27 at ce6e3616aa)
 + osxkeychain: clarify that we ignore unknown lines
 + netrc: ignore unknown lines (do not die)
 + wincred: ignore unknown lines (do not die)

 Most credential helpers ignored unknown entries in a credential
 description, but a few died upon seeing them.  The latter were
 taught to ignore them, too

 Will merge to 'master'?
 source: <pull.1363.git.1663865974.gitgitgadget@gmail.com>


* es/retire-efgrep (2022-09-23) 2 commits
  (merged to 'next' on 2022-09-27 at 344fdd138e)
 + check-non-portable-shell: detect obsolescent egrep/fgrep
 + Merge branch 'dd/retire-efgrep' into es/retire-efgrep
 (this branch uses dd/retire-efgrep.)

 Prepare for GNU [ef]grep that throw warning of their uses.

 Will merge to 'master'.
 source: <pull.1338.git.git.1663805905554.gitgitgadget@gmail.com>


* vd/fix-unaligned-read-index-v4 (2022-09-28) 1 commit
  (merged to 'next' on 2022-09-28 at 5b3425fd58)
 + read-cache: avoid misaligned reads in index v4

 The codepath that reads from the index v4 had unaligned memory
 accesses, which has been corrected.

 Will merge to 'master'.
 source: <pull.1366.v2.git.1664385541084.gitgitgadget@gmail.com>


* dd/retire-efgrep (2022-09-21) 4 commits
  (merged to 'next' on 2022-09-21 at 22bc339be1)
 + t: convert fgrep usage to "grep -F"
 + t: convert egrep usage to "grep -E"
 + t: remove \{m,n\} from BRE grep usage
 + CodingGuidelines: allow grep -E
 (this branch is used by es/retire-efgrep.)

 Prepare for GNU [ef]grep that throw warning of their uses.

 Will merge to 'master'.
 source: <cover.1663765176.git.congdanhqx@gmail.com>


* tb/midx-repack-ignore-cruft-packs (2022-09-21) 7 commits
  (merged to 'next' on 2022-09-29 at 55474c6ecc)
 + midx.c: avoid cruft packs with non-zero `repack --batch-size`
 + midx.c: remove unnecessary loop condition
 + midx.c: replace `xcalloc()` with `CALLOC_ARRAY()`
 + midx.c: avoid cruft packs with `repack --batch-size=0`
 + midx.c: prevent `expire` from removing the cruft pack
 + Documentation/git-multi-pack-index.txt: clarify expire behavior
 + Documentation/git-multi-pack-index.txt: fix typo

 "git multi-pack-index repack/expire" used to repack unreachable
 cruft into a new pack, which have been corrected.

 Will merge to 'master'?
 cf. <63a1c3d4-eff3-af10-4263-058c88e74594@github.com>
 source: <cover.1663638929.git.me@ttaylorr.com>


* ah/fsmonitor-daemon-usage-non-l10n (2022-09-21) 1 commit
  (merged to 'next' on 2022-09-21 at bc69a73c6c)
 + fsmonitor--daemon: don't translate literal commands

 Fix messages incorrectly marked for translation.

 Will merge to 'master'?
 source: <20220920050709.326359-1-alexhenrie24@gmail.com>


* so/diff-merges-cleanup (2022-09-16) 3 commits
  (merged to 'next' on 2022-09-22 at 57694bbed7)
 + diff-merges: clarify log.diffMerges documentation
 + diff-merges: cleanup set_diff_merges()
 + diff-merges: cleanup func_by_opt()

 Code clean-up.

 Will merge to 'master'?
 source: <20220914193102.5275-1-sorganov@gmail.com>


* ja/rebase-i-avoid-amending-self (2022-09-26) 1 commit
  (merged to 'next' on 2022-09-29 at 2635f37dae)
 + sequencer: avoid dropping fixup commit that targets self via commit-ish

 "git rebase -i" can mistakenly attempt to apply a fixup to a commit
 itself, which has been corrected.

 Will merge to 'master'?
 source: <20220924222904.1784975-1-aclopte@gmail.com>


* ac/fuzzers (2022-09-19) 1 commit
  (merged to 'next' on 2022-09-29 at 600f45a53b)
 + fuzz: reorganise the path for existing oss-fuzz fuzzers

 Source file shuffling.

 Will merge to 'master'.
 source: <pull.1353.v4.git.1663598215154.gitgitgadget@gmail.com>


* hn/parse-worktree-ref (2022-09-19) 1 commit
  (merged to 'next' on 2022-09-29 at 1f4453eb83)
 + refs: unify parse_worktree_ref() and ref_type()

 Code and semantics cleaning.

 Will merge to 'master'?
 source: <pull.1325.v2.git.git.1663605291172.gitgitgadget@gmail.com>


* ed/fsmonitor-on-networked-macos (2022-10-05) 6 commits
 - fsmonitor: add documentation for allowRemote and socketDir options
 - fsmonitor: check for compatability before communicating with fsmonitor
 - fsmonitor: deal with synthetic firmlinks on macOS
 - fsmonitor: avoid socket location check if using hook
 - fsmonitor: relocate socket file if .git directory is remote
 - fsmonitor: refactor filesystem checks to common interface

 By default, use of fsmonitor on a repository on networked
 filesystem is disabled. Add knobs to make it workable on macOS.

 Will merge to 'next'.
 source: <pull.1326.v15.git.1664904751.gitgitgadget@gmail.com>


* rj/branch-edit-description-with-nth-checkout (2022-09-12) 2 commits
 - branch: support for shortcuts like @{-1} completed
 - branch: refactor "edit_description" code path

 "git branch --edit-description @{-1}" is now a way to edit branch
 description of the branch you were on before switching to the
 current branch.

 Needs review.
 source: <7abdb5a9-5707-7897-4196-8d2892beeb81@gmail.com>


* mj/credential-helper-auth-headers (2022-09-13) 8 commits
 - http: set specific auth scheme depending on credential
 - http: move proactive auth to first slot creation
 - http: store all request headers on active_request_slot
 - credential: add WWW-Authenticate header to cred requests
 - http: read HTTP WWW-Authenticate response headers
 - osxkeychain: clarify that we ignore unknown lines
 - netrc: ignore unknown lines (do not die)
 - wincred: ignore unknown lines (do not die)

 Extending credential helper protocol.

 Expecting a reroll.
 A separate non-RFC submission of the first three is expected.
 cf. <AS8PR03MB86897FAC3E1E4F03D4420644C04F9@AS8PR03MB8689.eurprd03.prod.outlook.com>
 source: <pull.1352.git.1663097156.gitgitgadget@gmail.com>


* jc/environ-docs (2022-09-16) 5 commits
  (merged to 'next' on 2022-09-29 at a0a43b8de5)
 + environ: GIT_INDEX_VERSION affects not just a new repository
 + environ: simplify description of GIT_INDEX_FILE
 + environ: GIT_FLUSH should be made a usual Boolean
 + environ: explain Boolean environment variables
 + environ: document GIT_SSL_NO_VERIFY

 Documentation on various Boolean GIT_* environment variables have
 been clarified.

 Will merge to 'master'?
 source: <20220915160659.126441-1-gitster@pobox.com>


* rs/diff-caret-bang-with-parents (2022-10-01) 3 commits
 - diff: support ^! for merges
 - revisions.txt: unspecify order of resolved parts of ^!
 - revision: use strtol_i() for exclude_parent

 "git diff rev^!" did not show combined diff to go to the rev from
 its parents.

 Needs review.
 source: <16c49d20-cafc-4b48-3c6b-e11c74c29abb@web.de>


* ab/doc-synopsis-and-cmd-usage (2022-10-05) 34 commits
 - tests: assert consistent whitespace in -h output
 - tests: start asserting that *.txt SYNOPSIS matches -h output
 - doc txt & -h consistency: make "worktree" consistent
 - worktree: define subcommand -h in terms of command -h
 - reflog doc: list real subcommands up-front
 - doc txt & -h consistency: make "commit" consistent
 - doc txt & -h consistency: make "diff-tree" consistent
 - doc txt & -h consistency: use "[<label>...]" for "zero or more"
 - doc txt & -h consistency: make "annotate" consistent
 - doc txt & -h consistency: make "stash" consistent
 - doc txt & -h consistency: add missing options
 - doc txt & -h consistency: use "git foo" form, not "git-foo"
 - doc txt & -h consistency: make "bundle" consistent
 - doc txt & -h consistency: make "read-tree" consistent
 - doc txt & -h consistency: make "rerere" consistent
 - doc txt & -h consistency: add missing options and labels
 - doc txt & -h consistency: make output order consistent
 - doc txt & -h consistency: add or fix optional "--" syntax
 - doc txt & -h consistency: fix mismatching labels
 - doc SYNOPSIS & -h: use "-" to separate words in labels, not "_"
 - doc txt & -h consistency: use "<options>", not "<options>..."
 - stash doc SYNOPSIS & -h: correct padding around "[]()"
 - doc txt & -h consistency: correct padding around "[]()"
 - doc txt & -h consistency: balance unbalanced "[" and "]"
 - doc txt & -h consistency: add "-z" to cat-file "-h"
 - doc txt & -h consistency: fix incorrect alternates syntax
 - doc txt & -h consistency: word-wrap
 - built-ins: consistently add "\n" between "usage" and options
 - doc SYNOPSIS: consistently use ' for commands
 - doc SYNOPSIS: don't use ' for subcommands
 - bundle: define subcommand -h in terms of command -h
 - builtin/bundle.c: indent with tabs
 - CodingGuidelines: update and clarify command-line conventions
 - tests: assert *.txt SYNOPSIS and -h output

 The short-help text shown by "git cmd -h" and the synopsis text
 shown at the beginning of "git help cmd" have been made more
 consistent.

 Needs review.
 source: <cover-v4-00.34-00000000000-20221004T132211Z-avarab@gmail.com>


* ab/coccicheck-incremental (2022-08-31) 9 commits
 - spatchcache: add a ccache-alike for "spatch"
 - cocci: optimistically use COMPUTE_HEADER_DEPENDENCIES
 - cocci: make "coccicheck" rule incremental
 - cocci: split off "--all-includes" from SPATCH_FLAGS
 - cocci: split off include-less "tests" from SPATCH_FLAGS
 - Makefile: split off SPATCH_BATCH_SIZE comment from "cocci" heading
 - Makefile: have "coccicheck" re-run if flags change
 - Makefile: add ability to TAB-complete cocci *.patch rules
 - cocci rules: remove unused "F" metavariable from pending rule

 "make coccicheck" is time consuming. It has been made to run more
 incrementally.

 Needs review.
 source: <cover-v2-0.9-00000000000-20220831T205130Z-avarab@gmail.com>


* tb/diffstat-with-utf8-strwidth (2022-09-14) 1 commit
 - diff.c: use utf8_strwidth() to count display width

 "git diff --stat" etc. were invented back when everything was ASCII
 and strlen() was a way to measure the display width of a string;
 adjust them to compute the display width assuming UTF-8 pathnames.

 Expecting a reroll.
 source: <20220914151333.3309-1-tboegi@web.de>


* gc/submodule-clone-update-with-branches (2022-08-29) 6 commits
 - clone, submodule update: check out branches
 - submodule--helper: refactor up-to-date criterion
 - submodule: return target of submodule symref
 - t5617: drop references to remote-tracking branches
 - repo-settings: add submodule_propagate_branches
 - clone: teach --detach option

 "git clone --recurse-submodules" and "git submodule update" learns
 to honor the "propagete branches" option.

 Expecting a reroll.
 cf. <20220901200047.515294-1-jonathantanmy@google.com> and others
 source: <pull.1321.git.git.1661806456.gitgitgadget@gmail.com>


* sy/sparse-grep (2022-09-23) 1 commit
  (merged to 'next' on 2022-09-29 at a5bc34b9c5)
 + builtin/grep.c: integrate with sparse index

 "git grep" learned to expand the sparse-index more lazily and on
 demand in a sparse checkout.

 Will merge to 'master'?
 source: <20220923041842.27817-2-shaoxuan.yuan02@gmail.com>


* ds/use-platform-regex-on-macos (2022-08-26) 1 commit
  (merged to 'next' on 2022-09-14 at 80905596d8)
 + grep: fix multibyte regex handling under macOS

 With a bit of header twiddling, use the native regexp library on
 macOS instead of the compat/ one.

 Will merge to 'master'.
 source: <20220826085815.2771102-1-dds@aueb.gr>


* ds/bundle-uri-3 (2022-10-05) 10 commits
 - bundle-uri: suppress stderr from remote-https
 - bundle-uri: fetch a list of bundles
 - bundle-uri: limit recursion depth for bundle lists
 - bundle-uri: parse bundle list in config format
 - bundle-uri: unit test "key=value" parsing
 - bundle-uri: create "key=value" line parsing
 - bundle-uri: create base key-value pair parsing
 - bundle-uri: create bundle_list struct and helpers
 - bundle-uri: use plain string in find_temp_filename()
 - Merge branch 'ds/bundle-uri-clone' into ds/bundle-uri-3

 Define the logical elements of a "bundle list", data structure to
 store them in-core, format to transfer them, and code to parse
 them.

 Needs review.
 source: <pull.1333.v3.git.1664886860.gitgitgadget@gmail.com>


* js/cmake-updates (2022-08-24) 5 commits
 - cmake: increase time-out for a long-running test
 - cmake: avoid editing t/test-lib.sh
 - add -p: avoid ambiguous signed/unsigned comparison
 - cmake: copy the merge tools for testing
 - cmake: make it easier to diagnose regressions in CTest runs

 Update to build procedure with VS using CMake/CTest.

 Expecting a reroll.
 cf. <3df77ffd-85a2-3a54-9005-34a24ec6e82d@github.com>
 cf. <531620e1-de4c-74aa-c840-c12ce81f8740@github.com> and others
 source: <pull.1320.v2.git.1661243463.gitgitgadget@gmail.com>


* pw/rebase-keep-base-fixes (2022-09-07) 7 commits
 - rebase --keep-base: imply --no-fork-point
 - rebase --keep-base: imply --reapply-cherry-picks
 - rebase: factor out branch_base calculation
 - rebase: rename merge_base to branch_base
 - rebase: store orig_head as a commit
 - t3416: set $EDITOR in subshell
 - t3416: tighten two tests

 "git rebase --keep-base" used to discard the commits that are
 already cherry-picked to the upstream, even when "keep-base" meant
 that the base, on top of which the history is being rebuilt, does
 not yet include these cherry-picked commits.  The --keep-base
 option now implies --reapply-cherry-picks and --no-fork-point
 options.

 Expecting a reroll.
 cf. <e25127f3-6135-b716-a12f-5dbe4f40dc42@gmail.com>
 source: <pull.1323.v2.git.1662561470.gitgitgadget@gmail.com>


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


* po/glossary-around-traversal (2022-07-09) 3 commits
 - glossary: add reachability bitmap description
 - glossary: add commit graph description
 - glossary: add Object DataBase (ODB) abbreviation

 The glossary entries for "commit-graph file" and "reachability
 bitmap" have been added.

 Expecting a reroll.
 cf. <dfe0c1ab-33f8-f13e-71ce-1829bb0d2d7f@iee.email>
 source: <pull.1282.git.1657385781.gitgitgadget@gmail.com>


* js/bisect-in-c (2022-08-30) 17 commits
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

 Final bits of "git bisect.sh" have been rewritten in C.

 Needs review.
 cf. <xmqqv8pr8903.fsf@gitster.g>
 source: <pull.1132.v6.git.1661885419.gitgitgadget@gmail.com>
