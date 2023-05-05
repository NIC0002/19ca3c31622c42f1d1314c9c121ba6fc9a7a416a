Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E80C77B75
	for <git@archiver.kernel.org>; Fri,  5 May 2023 23:06:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbjEEXGF (ORCPT <rfc822;git@archiver.kernel.org>);
        Fri, 5 May 2023 19:06:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjEEXGD (ORCPT <rfc822;git@vger.kernel.org>);
        Fri, 5 May 2023 19:06:03 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A97510D9
        for <git@vger.kernel.org>; Fri,  5 May 2023 16:06:00 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-24e0c29733fso2173303a91.2
        for <git@vger.kernel.org>; Fri, 05 May 2023 16:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683327959; x=1685919959;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :subject:to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=JX+t6qi5e7d49Dg5w7UbhEODecgpObaGI7u1z71geMw=;
        b=ew7qiMx0YW+6w9HIXlL8arDBOxZT4Ejo2iC84ISdlyWSx3erLoNd5ATcIqYU6kY8XH
         wloYxIjPrCW236Lqirbq7UWANbh3m7/oz+Cgbt+7oDT9rfB/bSUXo79RQMGJalUReO9b
         vvQ6vIklJZcOTSUQfAPI6OfEMp+VNT7Vrvd6+3dVCZKALkAsx08kAYQ4i9KVb3hjDEzJ
         IQTZyk3xgnBa+wZA5GCqhVCJYKnZapsfrI6XgPGUWJE/rdYiEHb38v+5aI582U8peDnO
         Ynra3BcG2/v1Udmct+aVZxfLe31vjrv1xxS9dNWQK7JyEUrnKbg/j6Qk3ivKrc0g5GI8
         GScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683327959; x=1685919959;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :subject:to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JX+t6qi5e7d49Dg5w7UbhEODecgpObaGI7u1z71geMw=;
        b=Tb+siKgIu61ciNKJ4JVu2nTSk3tQybzZDHHvMTdHAgyTtWmw6ERNwzpIHu7lFsnBoT
         oPKKdDsRNT878dTH0ij7AXPB3TxqF6DBrOKSew3PhA0pQAh8Sp/aWwNKsU8jyd7zlePP
         MBPlIe2vwPsC/KC6v/Sp5gfaDZAjBsQiZojnnw5xDa7LhPVXLQawM1CI/p7x8FRBJoK7
         3LizMJOtKJcYaSer/xsAxBOp/iAFigEFro17S4E1xiXRXSFALBBKBIEE5HTczhIa2Cs4
         WRtwI0LgL1ux3ZBhhT3XMEegmoOhI3mZEe3qCQyRYcZTyJq0aYmHtDtPbJMfTOGQFi2J
         p+8Q==
X-Gm-Message-State: AC+VfDw5HXpCNPZtLQmmoLmWbapf5KwQSkx/J7esP/9Fb/ekYHiW9/u5
        RMQ85ZbKP/zGTDv+JSGPnsgOpiAPcg4=
X-Google-Smtp-Source: ACHHUZ6CH0jvfBcV3CZ/RuzNHme3PjlrcihASQC9Nce0eK2rP/i+mqLCL+GKGQGX79XJvGquSixHyA==
X-Received: by 2002:a17:902:d485:b0:1aa:f612:cdf with SMTP id c5-20020a170902d48500b001aaf6120cdfmr4026285plg.37.1683327958402;
        Fri, 05 May 2023 16:05:58 -0700 (PDT)
Received: from localhost (187.137.203.35.bc.googleusercontent.com. [35.203.137.187])
        by smtp.gmail.com with ESMTPSA id g2-20020a170902740200b001aaf2172418sm2250787pll.95.2023.05.05.16.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 16:05:57 -0700 (PDT)
Sender: Junio C Hamano <jch2355@gmail.com>
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (May 2023, #02; Fri, 5)
X-master-at: 69c786637d7a7fe3b2b8f7d989af095f5f49c3a8
X-next-at: a4b1b128d6e6f4cf1ab6838085988181581b2791
Date:   Fri, 05 May 2023 16:05:57 -0700
Message-ID: <xmqqmt2ibcq2.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Here are the topics that have been cooking in my tree.  Commits
prefixed with '+' are in 'next' (being in 'next' is a sign that a
topic is stable enough to be used and are candidate to be in a future
release).  Commits prefixed with '-' are only in 'seen', and aren't
considered "accepted" at all and may be annotated with an URL to a
message that raises issues but they are no means exhaustive.  A
topic without enough support may be discarded after a long period of
no activity.

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

* fc/doc-drop-custom-callout-format (2023-05-03) 1 commit
  (merged to 'next' on 2023-05-04 at c2fd654367)
 + doc: remove custom callouts format

 Our custom callout formatter is no longer used in the documentation
 formatting toolchain, as the upstream default ones give better
 output these days.

 Will merge to 'master'.
 source: <20230418011828.47851-1-felipe.contreras@gmail.com>


* fc/doc-man-lift-title-length-limit (2023-05-03) 1 commit
  (merged to 'next' on 2023-05-04 at d048eb1ef8)
 + doc: manpage: remove maximum title length

 The titles of manual pages (formatted with AsciiDoc) used to be
 chomped at unreasonably short limit, which has been removed; this
 makes the formatted output match that of asciidoctor.

 Will merge to 'master'.
 source: <20230503171658.8996-1-felipe.contreras@gmail.com>


* sd/doc-gitignore-and-rm-cached (2023-05-03) 1 commit
  (merged to 'next' on 2023-05-04 at a4b1b128d6)
 + docs: clarify git rm --cached function in gitignore note

 Doc update.

 Will merge to 'master'.
 source: <pull.862.v3.git.git.1683150400953.gitgitgadget@gmail.com>


* tb/pack-extra-cruft-tips (2023-05-03) 1 commit
 - builtin/pack-objects.c: introduce `pack.extraCruftTips`

 "git pack-objects" learned to invoke a new hook program that
 enumerates extra objects to be used as anchoring points to keep
 otherwise unreachable objects in cruft packs.

 Under discussion
 cf. <20230505221921.GE3321533@coredump.intra.peff.net>
 source: <27a7f16aab35b5cac391d9831aadb0f2e2146313.1683151485.git.me@ttaylorr.com>


* jc/diff-s-with-other-options (2023-05-05) 1 commit
 - diff: fix interaction between the "-s" option and other options
 (this branch uses jc/dirstat-plug-leaks.)

 The "-s" (silent, squelch) option of the "diff" family of commands
 did not interact with other options that specify the output format
 well.  This has been cleaned up so that it will clear all the
 formatting options given before.

 Will merge to 'next'?
 source: <20230505165952.335256-1-gitster@pobox.com>

* fc/asciidoc-code-block-hack (2023-05-04) 2 commits
 - doc: manpage: remove ancient workaround
 - doc: git-svn: use listing instead of verse

 Documentation toolchain lost an ancient workaround that is no
 longer needed.

 Needs review.
 source: <20230504035517.329765-1-felipe.contreras@gmail.com>


* fc/doc-revisions-markup-fix (2023-05-04) 2 commits
 - doc: revisions: add a bunch of missing quotes
 - doc: revisions: fix missing escape

 Doc cleanup.

 Needs review.
 source: <20230504163421.100400-1-felipe.contreras@gmail.com>


* fc/doc-use-datestamp-in-commit (2023-05-05) 2 commits
 - doc-diff: drop SOURCE_DATE_EPOCH override
 - doc: doc-diff: specify date

 An earlier change broke "doc-diff", which has been corrected.

 Will merge to 'next'.
 source: <20230503232349.59997-1-felipe.contreras@gmail.com>
 source: <20230505211610.GA3197168@coredump.intra.peff.net>


* jc/dirstat-plug-leaks (2023-05-05) 2 commits
 - diff: plug leaks in dirstat
 - diff: refactor common tail part of dirstat computation
 (this branch is used by jc/diff-s-with-other-options.)

 "git diff --dirstat" leaked memory, which has been plugged.

 Will merge to 'next'?
 source: <20230505211917.2746751-1-gitster@pobox.com>


* jc/name-rev-deprecate-stdin-further (2023-05-05) 1 commit
 - name-rev: make --stdin hidden

 The "--stdin" option of "git name-rev" has been replaced with
 the "--annotate-stdin" option more than a year ago.  We stop
 advertising it in the "git name-rev -h" output.

 Expecting a reroll.
 source: <pull.1225.v2.git.git.1683314270964.gitgitgadget@gmail.com>

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


* ja/worktree-orphan (2023-04-17) 8 commits
 - worktree add: emit warn when there is a bad HEAD
 - worktree add: extend DWIM to infer --orphan
 - worktree add: introduce "try --orphan" hint
 - worktree add: add --orphan flag
 - t2400: add tests to verify --quiet
 - t2400: refactor "worktree add" opt exclusion tests
 - t2400: print captured git output when finished
 - worktree add: include -B in usage docs

 'git worktree add' learned how to create a worktree based on an
 orphaned branch with `--orphan`.

 Expecting a reroll.
 cf. <m7crhly2j3k76whydbtdwhvzghvoql436g3lqtst4v3ahv75aa@wq5zjepgrxz5>
 source: <20230417093255.31079-1-jacobabel@nullpo.dev>


* es/recurse-submodules-option-is-a-bool (2023-04-10) 1 commit
 - usage: clarify --recurse-submodules as a boolean

 The "--[no-]recurse-submodules" option of "git checkout" and others
 supported an undocumented syntax --recurse-submodules=<value> where
 the value can spell a Boolean in various ways.  The support for the
 syntax is being dropped.

 Expecting a reroll.
 cf. <ZDSTFwMFO7vbj/du@google.com>
 source: <ZDSTFwMFO7vbj/du@google.com>


* tb/pack-bitmap-index-seek (2023-03-20) 6 commits
 - pack-bitmap.c: factor out `bitmap_index_seek_commit()`
 - pack-bitmap.c: use `bitmap_index_seek()` where possible
 - pack-bitmap.c: factor out manual `map_pos` manipulation
 - pack-bitmap.c: drop unnecessary 'inline's
 - pack-bitmap.c: hide bitmap internals in `read_be32()`
 - pack-bitmap.c: hide bitmap internals in `read_u8()`

 Clean-up the pack-bitmap codepath.

 Kicked back to 'seen' out of 'next'.
 There is a BUG() on data errors that needs to be fixed.
 source: <cover.1679342296.git.me@ttaylorr.com>


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


* ab/tag-object-type-errors (2022-11-22) 5 commits
 - tag: don't emit potentially incorrect "object is a X, not a Y"
 - tag: don't misreport type of tagged objects in errors
 - object tests: add test for unexpected objects in tags
 - object-file.c: free the "t.tag" in check_tag()
 - Merge branch 'jk/parse-object-type-mismatch' into ab/tag-object-type-errors

 Hardening checks around mismatched object types when one of those
 objects is a tag.

 Expecting a reroll.
 cf. <xmqqzgb5jz5c.fsf@gitster.g>
 cf. <xmqqsfgxjugi.fsf@gitster.g>
 source: <cover-0.4-00000000000-20221118T113442Z-avarab@gmail.com>


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


* tc/cat-file-z-use-cquote (2023-03-03) 2 commits
 . cat-file: quote-format name in error when using -z
 . cat-file: extract printing batch error message into function

 "cat-file" in the batch mode that is fed NUL-terminated pathnames
 learned to cquote them in its error output (otherwise, a funny
 pathname with LF in it would break the lines in the output stream).

 Breaks "cat-file --batch-all-objects --batch-check".
 cf. <xmqqilfhctrr.fsf@gitster.g>
 source: <20230303191708.77894-1-toon@iotcl.com>


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

* ob/revert-of-revert (2023-05-05) 1 commit
 - sequencer: beautify subject of reverts of reverts

 Instead of "Revert "Revert "original"", give "Replay "original""
 as the title for a revert of a revert.

 Expecting a hopefully final reroll.
 Looking much better, except for minor cosmetic issues.
 source: <20230428083528.1699221-1-oswald.buddenhagen@gmx.de>


* mh/use-wincred-from-system (2023-03-27) 1 commit
 - credential/wincred: include wincred.h

 Code clean-up.

 Will merge to 'next'.
 cf. <8511e030-8167-715c-5ed4-1646e6e9ef85@gmx.de>
 cf. <CAGJzqsm4LmpYE46v2=y4=A+Och44zaQyzTXQRteX-KNSzA_18g@mail.gmail.com>
 source: <pull.1496.git.1679707396407.gitgitgadget@gmail.com>


* jc/attr-source-tree (2023-05-03) 1 commit
 - attr: teach "--attr-source=<tree>" global option to "git"

 "git --attr-source=<tree> cmd $args" is a new way to have any
 command to read attributes not from the working tree but from the
 given tree object.

 Expecting a hopefully final minor reroll.
 cf. <CAP8UFD1AuFWWC=iAe0duhpSsw9HnA-tcpV2F3NGT+089aY60Ow@mail.gmail.com>
 source: <pull.1470.v5.git.git.1683144574158.gitgitgadget@gmail.com>


* mc/send-email-header-cmd (2023-05-01) 3 commits
 - send-email: detect empty blank lines in command output
 - send-email: add --header-cmd, --no-header-cmd options
 - send-email: extract execute_cmd from recipients_cmd

 "git send-email" learned "--header-cmd=<cmd>" that can inject
 arbitrary e-mail header lines to the outgoing messages.

 Will merge to 'next'.
 source: <20230501143848.19674-1-maxim.cournoyer@gmail.com>


* ob/t3501-retitle (2023-05-01) 1 commit
  (merged to 'next' on 2023-05-01 at 52730fcaaa)
 + t/t3501-revert-cherry-pick.sh: clarify scope of the file

 Retitle a test script with an overly narrow name.

 Will merge to 'master'.
 source: <20230430100034.1889796-1-oswald.buddenhagen@gmx.de>


* rs/test-ctype-eof (2023-05-02) 1 commit
  (merged to 'next' on 2023-05-02 at a19201a6a9)
 + test-ctype: check EOF

 ctype tests have been taught to test EOF, too.

 Will merge to 'master'.
 source: <1dbbd7ce-2b3f-6f88-f902-1d4ffe62e259@web.de>


* tb/credential-long-lines (2023-05-01) 7 commits
  (merged to 'next' on 2023-05-02 at f027002b92)
 + contrib/credential: embiggen fixed-size buffer in wincred
 + contrib/credential: avoid fixed-size buffer in libsecret
 + contrib/credential: .gitignore libsecret build artifacts
 + contrib/credential: remove 'gnome-keyring' credential helper
 + contrib/credential: avoid fixed-size buffer in osxkeychain
 + t/lib-credential.sh: ensure credential helpers handle long headers
 + credential.c: store "wwwauth[]" values in `credential_read()`

 The implementation of credential helpers used fgets() over fixed
 size buffers to read protocol messages, causing the remainder of
 the folded long line to trigger unexpected behaviour, which has
 been corrected.

 Will merge to 'master'.
 source: <cover.1682956419.git.me@ttaylorr.com>


* bc/clone-empty-repo-via-protocol-v0 (2023-05-01) 1 commit
 - upload-pack: advertise capabilities when cloning empty repos

 Expecting a minor and hopefully final update.
 cf. <20230501224038.GA1174291@coredump.intra.peff.net>
 source: <20230501170018.1410567-2-sandals@crustytoothpaste.net>


* ds/fsck-bitmap (2023-05-02) 2 commits
 - fsck: use local repository
 - fsck: verify checksums of all .bitmap files

 "git fsck" learned to detect bit-flip breakages in the reachability
 bitmap files.

 Will merge to 'master'.
 source: <pull.1526.v2.git.1683034042.gitgitgadget@gmail.com>


* gc/trace-bare-repo-setup (2023-05-01) 1 commit
 - setup: trace bare repository setups

 The tracing mechanism learned to notice and report when
 auto-discovered bare repositories are being used, as allowing so
 without explicitly stating the user intends to do so (with setting
 GIT_DIR for example) can be used with social engineering as an
 attack vector.

 Will merge to 'next'.
 source: <e98be8e7f703fc741e06d9208545abc8c24d1a4a.1682962110.git.steadmon@google.com>


* cw/strbuf-cleanup (2023-05-03) 7 commits
 - strbuf: remove environment variables
 - strbuf: clarify dependency
 - path: move related function to path
 - object-name: move related functions to object-name
 - credential-store: move related functions to credential-store file
 - abspath: move related functions to abspath
 - strbuf: clarify API boundary

 Move functions that are not about pure string manipulation out of
 strbuf.[ch]

 Comments?
 source: <20230503184849.1809304-1-calvinwan@google.com>


* ah/doc-attributes-text (2023-05-03) 1 commit
  (merged to 'next' on 2023-05-04 at 121c97817e)
 + docs: rewrite the documentation of the text and eol attributes

 Doc update to clarify how text and eol attributes interact to
 specify the end-of-line conversion.

 Will merge to 'master'.
 source: <20230503044656.221175-2-alexhenrie24@gmail.com>


* jw/send-email-update-gmail-insn (2023-04-28) 1 commit
  (merged to 'next' on 2023-05-01 at cb5d83ee92)
 + send-email docs: Remove mention of discontinued gmail feature

 Doc update to drop use of deprecated app-specific password against
 gmail.

 Will merge to 'master'.
 source: <20221001104609.18453-1-j.witteveen@gmail.com>


* ob/messages-capitalize-exception (2023-04-28) 1 commit
  (merged to 'next' on 2023-05-01 at db0ef42b3a)
 + messages: capitalization and punctuation exceptions
 (this branch uses ob/sequencer-i18n-fix.)

 Message update.

 Will merge to 'master'.
 source: <20230428125649.1719796-1-oswald.buddenhagen@gmx.de>


* ob/sequencer-i18n-fix (2023-04-28) 1 commit
  (merged to 'next' on 2023-05-01 at 242ca8ce15)
 + sequencer: actually translate report in do_exec()
 (this branch is used by ob/messages-capitalize-exception.)

 Message update.

 Will merge to 'master'.
 source: <20230428125649.1719796-2-oswald.buddenhagen@gmx.de>


* hx/negotiator-non-recursive (2023-04-26) 2 commits
  (merged to 'next' on 2023-05-02 at 64f97cc72d)
 + negotiator/skipping: fix some problems in mark_common()
 + negotiator/default: avoid stack overflow

 The implementation of the default "negotiator", used to find common
 ancestor over the network for object tranfer, used to be recursive;
 it was updated to be iterative to conserve stackspace usage.

 Will merge to 'master'.
 cf. <9ad5f246-e21f-0a13-1a53-1ae3307c3f0e@github.com>
 source: <cover.1682513384.git.hanxin.hx@bytedance.com>


* jc/doc-clarify-git-default-hash-variable (2023-04-26) 1 commit
 - doc: GIT_DEFAULT_HASH is and will be ignored during "clone"

 The documentation was misleading about the interaction between
 GIT_DEFAULT_HASH and "git clone", which has been clarified to
 stress that the variable is to be ignored by the command.

 Will merge to 'next'.
 source: <xmqqzg6uvfpo.fsf_-_@gitster.g>


* mh/fix-detect-compilers-with-nondigit-versions (2023-04-26) 1 commit
  (merged to 'next' on 2023-04-28 at c0c54291c2)
 + Handle some compiler versions containing a dash

 The detect-compilers script to help auto-tweaking the build system
 had trouble working with compilers whose version number has extra
 suffixes.  The script has been taught that certain suffixes (like
 "-win32" in "gcc 10-win32") can be safely stripped as they share
 the same features and bugs with the version without the suffix.

 Will merge to 'master'.
 source: <20230426004843.3391826-1-mh@glandium.org>


* tl/notes-separator (2023-04-28) 6 commits
 - notes.c: introduce "--[no-]stripspace" option
 - notes.c: append separator instead of insert by pos
 - notes.c: introduce '--separator=<paragraph-break>' option
 - t3321: add test cases about the notes stripspace behavior
 - notes.c: use designated initializers for clarity
 - notes.c: cleanup 'strbuf_grow' call in 'append_edit'

 'git notes append' was taught '--separator' to specify string to insert
 between paragraphs.

 Will merge to 'next'.
 source: <cover.1682671758.git.dyroneteng@gmail.com>


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


* jk/parse-commit-with-malformed-ident (2023-04-27) 4 commits
  (merged to 'next' on 2023-04-28 at cb6ea0412a)
 + parse_commit(): describe more date-parsing failure modes
 + parse_commit(): handle broken whitespace-only timestamp
 + parse_commit(): parse timestamp from end of line
 + t4212: avoid putting git on left-hand side of pipe

 The commit object parser has been taught to be a bit more lenient
 to parse timestamps on the author/committer line with a malformed
 author/committer ident.

 Will merge to 'master'.
 source: <20230427081330.GA1461786@coredump.intra.peff.net>


* sl/sparse-write-tree-part-2 (2023-04-24) 1 commit
 - write-tree: optimize sparse integration

 Fix-up to a topic already graduated to 'master'.

 Expecting a reroll.
 cf. <20230423071243.1863977-1-cheskaqiqi@gmail.com>
 source: <20230423071243.1863977-1-cheskaqiqi@gmail.com>


* tb/pack-bitmap-traversal-with-boundary (2023-05-05) 2 commits
 - pack-bitmap.c: use commit boundary during bitmap traversal
 - pack-bitmap.c: extract `fill_in_bitmap()`

 The object traversal using reachability bitmap done by
 "pack-object" has been tweaked to take advantage of the fact that
 using "boundary" commits as representative of all the uninteresting
 ones can save quite a lot of object enumeration.

 Under discussion.
 cf. <4ce3ff5f-e7cd-f604-f5da-66939be7d314@github.com>
 source: <cover.1683307620.git.me@ttaylorr.com>


* ar/config-count-tests-updates (2023-04-24) 3 commits
 - t1300: add tests for missing keys
 - t1300: check stderr for "ignores pairs" tests
 - t1300: drop duplicate test

 Test updates.

 Will merge to 'next'.
 source: <20230423134649.431783-1-rybak.a.v@gmail.com>


* en/header-split-cache-h-part-2 (2023-04-24) 22 commits
  (merged to 'next' on 2023-05-01 at 722c412915)
 + reftable: ensure git-compat-util.h is the first (indirect) include
 + diff.h: reduce unnecessary includes
 + object-store.h: reduce unnecessary includes
 + commit.h: reduce unnecessary includes
 + fsmonitor: reduce includes of cache.h
 + cache.h: remove unnecessary headers
 + treewide: remove cache.h inclusion due to previous changes
 + cache,tree: move basic name compare functions from read-cache to tree
 + cache,tree: move cmp_cache_name_compare from tree.[ch] to read-cache.c
 + hash-ll.h: split out of hash.h to remove dependency on repository.h
 + tree-diff.c: move S_DIFFTREE_IFXMIN_NEQ define from cache.h
 + dir.h: move DTYPE defines from cache.h
 + versioncmp.h: move declarations for versioncmp.c functions from cache.h
 + ws.h: move declarations for ws.c functions from cache.h
 + match-trees.h: move declarations for match-trees.c functions from cache.h
 + pkt-line.h: move declarations for pkt-line.c functions from cache.h
 + base85.h: move declarations for base85.c functions from cache.h
 + copy.h: move declarations for copy.c functions from cache.h
 + server-info.h: move declarations for server-info.c functions from cache.h
 + packfile.h: move pack_window and pack_entry from cache.h
 + symlinks.h: move declarations for symlinks.c functions from cache.h
 + treewide: be explicit about dependence on strbuf.h

 More header clean-up.

 Will merge to 'master'.
 source: <pull.1517.v2.git.1682194649.gitgitgadget@gmail.com>


* ps/fetch-output-format (2023-05-03) 8 commits
 - fetch: introduce machine-parseable "porcelain" output format
 - fetch: move option related variables into main function
 - fetch: move display format parsing into main function
 - fetch: introduce `display_format` enum
 - fetch: fix missing from-reference when fetching HEAD:foo
 - fetch: add a test to exercise invalid output formats
 - fetch: split out tests for output format
 - fetch: fix `--no-recurse-submodules` with multi-remote fetches

 "git fetch" learned the "--output-format" option that emits what it
 did in a machine-parseable format.

 Will merge to 'next'?
 source: <cover.1683113177.git.ps@pks.im>


* ma/gittutorial-fixes (2023-04-20) 2 commits
  (merged to 'next' on 2023-05-02 at bf96011972)
 + gittutorial: wrap literal examples in backticks
 + gittutorial: drop early mention of origin

 Doc fixes.

 Will merge to 'master'.
 source: <cover.1681579244.git.martin.agren@gmail.com>


* sg/retire-unused-cocci (2023-04-20) 1 commit
 - cocci: remove 'unused.cocci'

 Retire a rather expensive-to-run Coccinelle check patch.

 source: <20230420205350.600760-1-szeder.dev@gmail.com>


* ms/send-email-feed-header-to-validate-hook (2023-04-19) 2 commits
  (merged to 'next' on 2023-05-03 at ba7079bcd4)
 + send-email: expose header information to git-send-email's sendemail-validate hook
 + send-email: refactor header generation functions

 "git send-email" learned to give the e-mail headers to the validate
 hook by passing an extra argument from the command line.

 Will merge to 'master'.
 source: <20230419202703.2911836-1-michael.strawbridge@amd.com>


* gc/doc-cocci-updates (2023-04-27) 2 commits
 - cocci: codify authoring and reviewing practices
 - cocci: add headings to and reword README

 Update documentation regarding Coccinelle patches.

 Will merge to 'next'?
 source: <pull.1495.v2.git.git.1682634143.gitgitgadget@gmail.com>


* kh/doc-interpret-trailers-updates (2023-05-01) 4 commits
 - doc: interpret-trailers: fix example
 - doc: interpret-trailers: don’t use deprecated config
 - doc: interpret-trailers: use input redirection
 - doc: interpret-trailers: don’t use heredoc in examples

 Doc update.

 Will merge to 'next'.
 source: <cover.1682970213.git.code@khaugsbakk.name>


* pb/complete-and-document-auto-merge-and-friends (2023-04-14) 5 commits
  (merged to 'next' on 2023-04-20 at 2728a01622)
 + completion: complete AUTO_MERGE
 + Documentation: document AUTO_MERGE
 + git-merge.txt: modernize word choice in "True merge" section
 + completion: complete REVERT_HEAD and BISECT_HEAD
 + revisions.txt: document more special refs

 Document more pseudo-refs and teach the command line completion
 machinery to complete AUTO_MERGE.

 On hold, waiting for a fix-up.
 cf. <a10648d5-8cba-4c7c-a303-b5b0dcdd3310@gmail.com>
 source: <pull.1515.git.1681495119.gitgitgadget@gmail.com>


* ar/test-cleanup-unused-file-creation-part2 (2023-05-03) 6 commits
  (merged to 'next' on 2023-05-03 at 185f0ec195)
 + t2019: don't create unused files
 + t1502: don't create unused files
 + t1450: don't create unused files
 + t1300: don't create unused files
 + t1300: fix config file syntax error descriptions
 + t0300: don't create unused file

 Test cleanup.

 Will merge to 'master'.
 cf. <CABPp-BFCBPTBc9savP13gNFmBo_WCnZHUv_Z8bWE6T6GZOrs-Q@mail.gmail.com>
 source: <20230417191044.909094-1-rybak.a.v@gmail.com>


* mh/credential-password-expiry-wincred (2023-04-03) 1 commit
 - credential/wincred: store password_expiry_utc

 Teach the recently invented "password expiry time" trait to the
 wincred credential helper.

 Will merge to 'next'.
 cf. <CAGJzqsm4LmpYE46v2=y4=A+Och44zaQyzTXQRteX-KNSzA_18g@mail.gmail.com>
 source: <pull.1477.v3.git.git.1680508028077.gitgitgadget@gmail.com>


* mh/credential-oauth-refresh-token (2023-04-21) 1 commit
  (merged to 'next' on 2023-05-04 at 9ade4aa024)
 + credential: new attribute oauth_refresh_token

 The credential subsystem learns to help OAuth framework.

 Will merge to 'master'.
 source: <pull.1394.v2.git.1682070479816.gitgitgadget@gmail.com>


* mh/credential-password-expiry-libsecret (2023-05-05) 1 commit
 - credential/libsecret: support password_expiry_utc

 The libsecret credential helper learns to handle the password
 expiry time information.

 Will merge to 'next'?
 source: <pull.1469.v3.git.git.1683270298313.gitgitgadget@gmail.com>


* sl/diff-files-sparse (2023-05-03) 2 commits
 - diff-files: integrate with sparse index
 - t1092: add tests for `git diff-files`

 Teach "diff-files" not to expand sparse-index unless needed.

 Expecting a hopefully minor and final reroll.
 cf. <xmqqpm7hm1yy.fsf@gitster.g>
 source: <20230503215549.511999-1-cheskaqiqi@gmail.com>


* rj/branch-unborn-in-other-worktrees (2023-03-27) 5 commits
 - branch: avoid unnecessary worktrees traversals
 - branch: rename orphan branches in any worktree
 - branch: description for orphan branch errors
 - branch: use get_worktrees() in copy_or_rename_branch()
 - branch: test for failures while renaming branches

 Error messages given when working on an unborn branch that is
 checked out in another worktree have been improved.

 Will merge to 'next'.
 source: <f8e6447e-5cd3-98fa-f567-39e1c60dacb0@gmail.com>

--------------------------------------------------
[Discarded]

* ed/fsmonitor-inotify (2022-12-13) 6 commits
 . fsmonitor: update doc for Linux
 . fsmonitor: test updates
 . fsmonitor: enable fsmonitor for Linux
 . fsmonitor: implement filesystem change listener for Linux
 . fsmonitor: determine if filesystem is local or remote
 . fsmonitor: prepare to share code between Mac OS and Linux

 Bundled fsmonitor for Linux using inotify API.

 Seems to break asan job at CI when merged to 'seen'.
 cf. <xmqqzg7d8xn2.fsf@gitster.g>
 source: <pull.1352.v5.git.git.1670882286.gitgitgadget@gmail.com>


* my/wildmatch-cleanups (2023-02-27) 5 commits
 . wildmatch: more cleanups after killing uchar
 . wildmatch: use char instead of uchar
 . wildmatch: remove NEGATE_CLASS(2) macros with trivial refactoring
 . wildmatch: remove IS*() macros
 . git-compat-util: add isblank() and isgraph()

 Code clean-up.

 Discarded without prejudice after more than 6 weeks of inactivity.
 source: <20230226115021.1681834-1-masahiroy@kernel.org>


* cw/forbid-use-of-gitlink-outside-submodules (2023-02-28) 6 commits
 . add: reject nested repositories
 . tests: remove duplicate .gitmodules path
 . tests: use `git submodule add` and fix expected status
 . tests: use `git submodule add` and fix expected diffs
 . tests: Use `git submodule add` instead of `git add`
 . t4041, t4060: modernize test style

 Forbid "git add dir" from adding a gitlink to the index.

 Discarded without prejudice after more than 6 weeks of inactivity.
 source: <20230228185253.2356546-1-calvinwan@google.com>


* nw/for-each-ref-signature (2023-03-13) 1 commit
 . ref-filter: add new "signature" atom

 "git (for-each-ref|branch|tag) --format=<format>" learns the "%(signature)"
 placeholder and friends.

 Breaks CI.
 cf. <xmqqpm9bosjw.fsf@gitster.g>
 source: <20230311210607.64927-2-nsengiyumvawilberforce@gmail.com>
