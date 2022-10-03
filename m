Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A21B5C4332F
	for <git@archiver.kernel.org>; Mon,  3 Oct 2022 17:27:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbiJCR07 (ORCPT <rfc822;git@archiver.kernel.org>);
        Mon, 3 Oct 2022 13:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbiJCR0s (ORCPT <rfc822;git@vger.kernel.org>);
        Mon, 3 Oct 2022 13:26:48 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B84FB193DF
        for <git@vger.kernel.org>; Mon,  3 Oct 2022 10:26:46 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id l12so10289271pjh.2
        for <git@vger.kernel.org>; Mon, 03 Oct 2022 10:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LMJ48SarayvWXKxCTn1kLNLAw3zbTIzlgWln0WORcTE=;
        b=lvk07pzhr6cVn/e9ctBKXh6vwE6sjuD5x9egjYn6Pt8qYYOW/W5C+xTwdJvk0ONBe6
         S+dG08B2Qc1AKDKqn9E1/GtQW5Ubs9Yluid1ysGN+9fzxOqy6mmgGpABTZtaIRSKsBJW
         G7bPh8LBrhHx8rhjosWPGdklgtbrjjLfkcza6SCWQGJlLK8RBj1W6xvXgFHdBE6SxlWs
         NA8lmN4dM656oO3kcFjZvqALGwlhiMFCHeUqm9ohisAjupJ2X/mBlLVqbHyt5SD9A0QR
         ZOPlzzrBTTZIR2MXuJYhNhX18qyKvjlgT/peF4zW8zlZjFufEo9/bsCAQm3u9TZhoBWf
         rbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LMJ48SarayvWXKxCTn1kLNLAw3zbTIzlgWln0WORcTE=;
        b=jZGwTwbUiW5QU5V7epg2PXJjfPqUFvJ31BHIvqtHcw7oZLoye0K/32dG/Aw5pNGsq0
         rKLHva9KMl54041IQP0Hx4352v4zjPoxgLN7UxkJEqWlWQhDdRzIKtc4d9ACubJaRIe9
         2jJWh4zZb2LYXe+m7KSd1/L8nRnMcG7m47zdXcIrQJ+pmGX46Ae/390HSAQ5Klhw85vQ
         6wgcQ7GQ5cwvKFc/LeDI89EPE5XPzhm7zCFE6Hn11u53AlTFwTqC6fRed8l1B9NZ0tAb
         dIqNBsHXUEuynFnRCisZ6bg0OGwhR9hXl6vVubiFejYRFj59I5u+fDWmTpmVD7P5O7i5
         Cldw==
X-Gm-Message-State: ACrzQf0dVR+K30ot1zHWNY/gV2PLzzSCxluYNA4TAPQPO2+O5pUFjPcA
        OF9BtpRY1pM8vnjGjgBs1DefkBT5tWo=
X-Google-Smtp-Source: AMsMyM6Y8tt8GgvTxQyg5t7GdnDQv279UryDK8QkS7VYv/6hi3bRBZNNwB3wEgujo4YUuiI3y7TBEA==
X-Received: by 2002:a17:90b:3a90:b0:202:d341:bf81 with SMTP id om16-20020a17090b3a9000b00202d341bf81mr13169140pjb.179.1664818005257;
        Mon, 03 Oct 2022 10:26:45 -0700 (PDT)
Received: from localhost (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id jn15-20020a170903050f00b00178650510f9sm7496669plb.160.2022.10.03.10.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 10:26:44 -0700 (PDT)
Sender: Junio C Hamano <jch2355@gmail.com>
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Oct 2022, #01; Mon, 3)
X-master-at: 3dcec76d9df911ed8321007b1d197c1a206dc164
X-next-at: 74048e4d9e2b6a27a4fab355a907e0c38d172bfd
Date:   Mon, 03 Oct 2022 10:26:44 -0700
Message-ID: <xmqqh70ku8bv.fsf@gitster.g>
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

Git 2.38 has been tagged.  There are many topics that have been
cooking in 'next' and should be ready to graduate, but let's first
see if any brown paper bag regressions are reported, which may
require a quick maintenance track update, before merging them down.

The cycle toward 2.39 will start after that for real.  With holidays
near the end of November in some parts of the world and of December
in many parts of the world, traditionally cycles in Q4 have been
short ones.  The 2.39 cycle is planned to last 9 weeks, and I will
go offline at around week #4 for a few weeks, during which an
interim maintainer will take over the daily operation of the
project, until I come back and receive the baton again.  Consider it
a bus-factor preparedness exercise.

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

* jc/tmp-objdir (2022-09-30) 1 commit
 - tmp-objdir: skip clean up when handling a signal

 The code to clean temporary object directories (used for
 quarantine) tried to remove them inside its signal handler, which
 was a no-no.

 Will merge to 'next'?
 source: <pull.1348.v4.git.git.1664570831583.gitgitgadget@gmail.com>

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

 Will cook in 'next'.
 source: <patch-1.1-e31681731b7-20220928T095041Z-avarab@gmail.com>


* ah/branch-autosetupmerge-grammofix (2022-09-28) 1 commit
  (merged to 'next' on 2022-09-29 at 622b75f0da)
 + push: improve grammar of branch.autoSetupMerge advice

 Fix grammar of a message introduced in previous round.

 Will cook in 'next'.
 source: <20220928055811.777227-1-alexhenrie24@gmail.com>


* jt/promisor-remote-fetch-tweak (2022-09-29) 2 commits
 - promisor-remote: die upon failing fetch
 - promisor-remote: remove a return value

 Remove error detection from a function that fetches from promisor
 remotes, and make it die when such a fetch fails to bring all the
 requested objects, to give an early failure to various operations.

 Needs review.
 source: <cover.1664316642.git.jonathantanmy@google.com>


* rj/ref-filter-get-head-description-leakfix (2022-09-26) 1 commit
  (merged to 'next' on 2022-09-29 at d05d052eb1)
 + ref-filter.c: fix a leak in get_head_description

 Leakfix.

 Will cook in 'next'.
 source: <6ff29e96-7f8d-c354-dced-b1b363e54467@gmail.com>


* ds/scalar-unregister-idempotent (2022-09-27) 4 commits
  (merged to 'next' on 2022-09-28 at a09a78d861)
 + string-list: document iterator behavior on NULL input
 + gc: replace config subprocesses with API calls
 + scalar: make 'unregister' idempotent
 + maintenance: add 'unregister --force'

 "git maintenance unregister" in a repository that is already been
 unregistered reported an error.

 Will cook in 'next'.
 source: <pull.1358.v4.git.1664287021.gitgitgadget@gmail.com>


* jk/clone-allow-bare-and-o-together (2022-09-22) 1 commit
  (merged to 'next' on 2022-09-27 at 1feca721ac)
 + clone: allow "--bare" with "-o"

 "git clone" did not like to see the "--bare" and the "--origin"
 options used together without a good reason.

 Will cook in 'next'.
 source: <YyvzVdfQVdysvMp2@coredump.intra.peff.net>


* jk/fsck-on-diet (2022-09-22) 3 commits
  (merged to 'next' on 2022-09-27 at c2e93082a1)
 + parse_object_buffer(): respect save_commit_buffer
 + fsck: turn off save_commit_buffer
 + fsck: free tree buffers after walking unreachable objects

 "git fsck" failed to release contents of tree objects already used
 from the memory, which has been fixed.

 Will cook in 'next'.
 source: <Yyw0PSVe3YTQGgRS@coredump.intra.peff.net>


* jk/remote-rename-without-fetch-refspec (2022-09-22) 1 commit
  (merged to 'next' on 2022-09-27 at 165fe0a832)
 + remote: handle rename of remote without fetch refspec

 "git remote rename" failed to rename a remote without fetch
 refspec, which has been corrected.

 Will cook in 'next'.
 source: <YyvzqZ5tmI0UdRAW@coredump.intra.peff.net>


* js/merge-ort-in-read-only-repo (2022-09-28) 2 commits
  (merged to 'next' on 2022-09-29 at 84df46c1b4)
 + merge-ort: return early when failing to write a blob
 + merge-ort: fix segmentation fault in read-only repositories

 In read-only repositories, "git merge-tree" tried to come up with a
 merge result tree object, which it failed (which is not wrong) and
 led to a segfault (which is bad), which has been corrected.

 Will cook in 'next'.
 source: <pull.1362.v5.git.1664350162.gitgitgadget@gmail.com>


* mc/cred-helper-ignore-unknown (2022-09-22) 3 commits
  (merged to 'next' on 2022-09-27 at ce6e3616aa)
 + osxkeychain: clarify that we ignore unknown lines
 + netrc: ignore unknown lines (do not die)
 + wincred: ignore unknown lines (do not die)

 Most credential helpers ignored unknown entries in a credential
 description, but a few died upon seeing them.  The latter were
 taught to ignore them, too

 Will cook in 'next'.
 source: <pull.1363.git.1663865974.gitgitgadget@gmail.com>


* es/retire-efgrep (2022-09-23) 2 commits
  (merged to 'next' on 2022-09-27 at 344fdd138e)
 + check-non-portable-shell: detect obsolescent egrep/fgrep
 + Merge branch 'dd/retire-efgrep' into es/retire-efgrep
 (this branch uses dd/retire-efgrep.)

 Prepare for GNU [ef]grep that throw warning of their uses.

 Will cook in 'next'.
 source: <pull.1338.git.git.1663805905554.gitgitgadget@gmail.com>


* vd/fix-unaligned-read-index-v4 (2022-09-28) 1 commit
  (merged to 'next' on 2022-09-28 at 5b3425fd58)
 + read-cache: avoid misaligned reads in index v4

 The codepath that reads from the index v4 had unaligned memory
 accesses, which has been corrected.

 Will cook in 'next'.
 source: <pull.1366.v2.git.1664385541084.gitgitgadget@gmail.com>


* dd/retire-efgrep (2022-09-21) 4 commits
  (merged to 'next' on 2022-09-21 at 22bc339be1)
 + t: convert fgrep usage to "grep -F"
 + t: convert egrep usage to "grep -E"
 + t: remove \{m,n\} from BRE grep usage
 + CodingGuidelines: allow grep -E
 (this branch is used by es/retire-efgrep.)

 Prepare for GNU [ef]grep that throw warning of their uses.

 Will cook in 'next'.
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

 Will cook in 'next'.
 cf. <63a1c3d4-eff3-af10-4263-058c88e74594@github.com>
 source: <cover.1663638929.git.me@ttaylorr.com>


* ah/fsmonitor-daemon-usage-non-l10n (2022-09-21) 1 commit
  (merged to 'next' on 2022-09-21 at bc69a73c6c)
 + fsmonitor--daemon: don't translate literal commands

 Fix messages incorrectly marked for translation.

 Will cook in 'next'.
 source: <20220920050709.326359-1-alexhenrie24@gmail.com>


* so/diff-merges-cleanup (2022-09-16) 3 commits
  (merged to 'next' on 2022-09-22 at 57694bbed7)
 + diff-merges: clarify log.diffMerges documentation
 + diff-merges: cleanup set_diff_merges()
 + diff-merges: cleanup func_by_opt()

 Code clean-up.

 Will cook in 'next'.
 source: <20220914193102.5275-1-sorganov@gmail.com>


* ja/rebase-i-avoid-amending-self (2022-09-26) 1 commit
  (merged to 'next' on 2022-09-29 at 2635f37dae)
 + sequencer: avoid dropping fixup commit that targets self via commit-ish

 "git rebase -i" can mistakenly attempt to apply a fixup to a commit
 itself, which has been corrected.

 Will cook in 'next'.
 source: <20220924222904.1784975-1-aclopte@gmail.com>


* ac/fuzzers (2022-09-19) 1 commit
  (merged to 'next' on 2022-09-29 at 600f45a53b)
 + fuzz: reorganise the path for existing oss-fuzz fuzzers

 Source file shuffling.

 Will cook in 'next'.
 source: <pull.1353.v4.git.1663598215154.gitgitgadget@gmail.com>


* hn/parse-worktree-ref (2022-09-19) 1 commit
  (merged to 'next' on 2022-09-29 at 1f4453eb83)
 + refs: unify parse_worktree_ref() and ref_type()

 Code and semantics cleaning.

 Will cook in 'next'.
 source: <pull.1325.v2.git.git.1663605291172.gitgitgadget@gmail.com>


* ed/fsmonitor-on-networked-macos (2022-09-28) 6 commits
 - fsmonitor: add documentation for allowRemote and socketDir options
 - fsmonitor: check for compatability before communicating with fsmonitor
 - fsmonitor: deal with synthetic firmlinks on macOS
 - fsmonitor: avoid socket location check if using hook
 - fsmonitor: relocate socket file if .git directory is remote
 - fsmonitor: refactor filesystem checks to common interface

 By default, use of fsmonitor on a repository on networked
 filesystem is disabled. Add knobs to make it workable on macOS.

 Will merge to 'next'?
 source: <pull.1326.v14.git.1664395931.gitgitgadget@gmail.com>


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

 Will cook in 'next'.
 source: <20220915160659.126441-1-gitster@pobox.com>


* rs/diff-caret-bang-with-parents (2022-10-01) 3 commits
 - diff: support ^! for merges
 - revisions.txt: unspecify order of resolved parts of ^!
 - revision: use strtol_i() for exclude_parent

 "git diff rev^!" did not show combined diff to go to the rev from
 its parents.

 Needs review.
 source: <16c49d20-cafc-4b48-3c6b-e11c74c29abb@web.de>


* ab/doc-synopsis-and-cmd-usage (2022-09-30) 36 commits
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
 - t/helper/test-proc-receive.c: use "<options>", not "<options>..."
 - doc txt & -h consistency: use "<options>", not "<options>..."
 - stash doc SYNOPSIS & -h: correct padding around "[]()"
 - doc txt & -h consistency: correct padding around "[]()"
 - doc txt & -h consistency: balance unbalanced "[" and "]"
 - doc txt & -h consistency: add "-z" to cat-file "-h"
 - doc txt & -h consistency: fix incorrect alternates syntax
 - doc txt & -h consistency: word-wrap
 - doc SYNOPSIS & -h: word-wrap
 - built-ins: consistently add "\n" between "usage" and options
 - doc SYNOPSIS & -h: fix incorrect alternates syntax
 - doc SYNOPSIS: consistently use ' for commands
 - doc SYNOPSIS: don't use ' for subcommands
 - blame: use a more detailed usage_msg_optf() error on bad -L
 - bundle: define subcommand -h in terms of command -h
 - builtin/bundle.c: indent with tabs
 - CodingGuidelines: update and clarify command-line conventions

 The short-help text shown by "git cmd -h" and the synopsis text
 shown at the beginning of "git help cmd" have been made more
 consistent.

 Needs review.
 source: <cover-v3-00.36-00000000000-20220930T180414Z-avarab@gmail.com>


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

 Will cook in 'next'.
 source: <20220923041842.27817-2-shaoxuan.yuan02@gmail.com>


* ds/use-platform-regex-on-macos (2022-08-26) 1 commit
  (merged to 'next' on 2022-09-14 at 80905596d8)
 + grep: fix multibyte regex handling under macOS

 With a bit of header twiddling, use the native regexp library on
 macOS instead of the compat/ one.

 Will cook in 'next'.
 cf. <xmqqzgf389k9.fsf@gitster.g>
 source: <20220826085815.2771102-1-dds@aueb.gr>


* ds/bundle-uri-3 (2022-09-09) 10 commits
 - bundle-uri: fetch a list of bundles
 - bundle-uri: limit recursion depth for bundle lists
 - bundle-uri: parse bundle list in config format
 - bundle-uri: unit test "key=value" parsing
 - bundle-uri: create "key=value" line parsing
 - bundle-uri: create base key-value pair parsing
 - bundle-uri: create bundle_list struct and helpers
 - bundle-uri: use plain string in find_temp_filename()
 - bundle-uri: short-circuit capability parsing
 - Merge branch 'ds/bundle-uri-clone' into ds/bundle-uri-3

 Define the logical elements of a "bundle list", data structure to
 store them in-core, format to transfer them, and code to parse
 them.

 Needs review.
 source: <pull.1333.v2.git.1662734015.gitgitgadget@gmail.com>


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
