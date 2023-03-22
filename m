Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 282B3C6FD1F
	for <git@archiver.kernel.org>; Wed, 22 Mar 2023 23:55:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbjCVXzW (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 22 Mar 2023 19:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjCVXzV (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 22 Mar 2023 19:55:21 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD1C028D04
        for <git@vger.kernel.org>; Wed, 22 Mar 2023 16:55:17 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id dw14so6747629pfb.6
        for <git@vger.kernel.org>; Wed, 22 Mar 2023 16:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679529317;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uMBedbPX36iidJ17RXXYdzB6jPO/2XkaAEc43qT8w0c=;
        b=g5T5xpwoTQ56voklHcbkgsmvMkvO0TrqdgD0t8u9ZQR+Ytu2Z3rHrc6mldRJpK6So5
         m4yNXBXFFSMQBDqBnrgiSF0X4yQVHHU8NHRiKYPN4nmsusaaMRRVoSqZNXIOAAp2m9M6
         CNYvpXojAfaA3kEpLte0DfJsd8gs+CwBzuXK27suESLCgOnoJF/l71Aj96TkT69FY/s2
         9vdXnMphxN2tN9gZY7B7mwWUXpu2AML4iI1pt2GTOXDi1etbXhemCGUeXro4PjvnqFMk
         5Gu+a1f5bSdHK1crConLfjy1MJWDI8b9BEKhAQZv1JksZ0ZfVwMq//VLNImy2PrYmwp8
         PsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679529317;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uMBedbPX36iidJ17RXXYdzB6jPO/2XkaAEc43qT8w0c=;
        b=ClitYdmB87tYGeHhLlLikG1Y3ZLbLoavg0VjzYZ4XhBdZQZBwT6F1xYJqhi1WF/PgJ
         h/HQo0N72zCPonFHRx4jHy67P+akUCmJhlbQzsAFzTHt1ren0hZdPmi+XaGmUdZ9X6+K
         CnTlXiKdJnsociNz9qm+YYat+bcZOet55Lu3uapWrs9CsFcFPE07DYqSw/5W1q0im1XQ
         MoQ78lTH+97DAi7OEfeaOfNpAj2LBfpmi+RtisH16izQj01uUn3lJ8Q89/ypL+tcA1mh
         zuQqZzSUsYKh6AytoPxzOBDebNCBhmEvu3WfFhpiLRxEoSnlTtxremL+dNIbZykMxQSq
         SV4w==
X-Gm-Message-State: AO0yUKVoz/TYKOdDrsHbFZbX+78FtY4PjZmmDXkACaKRVwkcinvHiXoq
        //LwbI0SbYSn5nvxDljYRz6C1Zk5FWY=
X-Google-Smtp-Source: AK7set/83QC6aOwNtdx88NL+ID2yJ1uHBuH4mrH+SLfUjVjr6rNxFXXhgmZlsdHu5oaRAc3zJZAMpg==
X-Received: by 2002:a05:6a00:c4:b0:61d:f243:e817 with SMTP id e4-20020a056a0000c400b0061df243e817mr5050357pfj.16.1679529316392;
        Wed, 22 Mar 2023 16:55:16 -0700 (PDT)
Received: from localhost (83.92.168.34.bc.googleusercontent.com. [34.168.92.83])
        by smtp.gmail.com with ESMTPSA id w5-20020aa78585000000b005a8dd86018dsm5407767pfn.64.2023.03.22.16.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 16:55:16 -0700 (PDT)
Sender: Junio C Hamano <jch2355@gmail.com>
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Mar 2023, #05; Wed, 22)
X-master-at: 27d43aaaf50ef0ae014b88bba294f93658016a2e
X-next-at: c903bb7e22f8f86da64de537e5768ab0ca886f4b
Date:   Wed, 22 Mar 2023 16:55:15 -0700
Message-ID: <xmqqcz50bau4.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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

The first two batches of topics are in 'master' for the next feature
release, and the tip of 'maint' now points at Git 2.40.0 to start
another maintenance track.

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

* ab/avoid-losing-exit-codes-in-tests (2023-02-06) 6 commits
  (merged to 'next' on 2023-03-06 at 60d7d0d493)
 + tests: don't lose misc "git" exit codes
 + tests: don't lose exit status with "test <op> $(git ...)"
 + tests: don't lose "git" exit codes in "! ( git ... | grep )"
 + tests: don't lose exit status with "(cd ...; test <op> $(git ...))"
 + t/lib-patch-mode.sh: fix ignored exit codes
 + auto-crlf tests: don't lose exit code in loops and outside tests

 Test clean-up.
 source: <cover-v5-0.6-00000000000-20230206T224200Z-avarab@gmail.com>


* ab/fix-strategy-opts-parsing (2023-03-08) 1 commit
  (merged to 'next' on 2023-03-08 at bd9eff2779)
 + sequencer.c: fix overflow & segfault in parse_strategy_opts()
 (this branch is used by pw/rebase-cleanup-merge-strategy-option-handling.)

 The code to parse "git rebase -X<opt>" was not prepared to see an
 unparsable option string, which has been corrected.
 source: <patch-1.1-f6a06e25cf3-20230307T182039Z-avarab@gmail.com>


* aj/ls-files-format-fix (2023-03-10) 1 commit
  (merged to 'next' on 2023-03-13 at 27f876afa4)
 + ls-files: fix "--format" output of relative paths

 Fix for a "ls-files --format="%(path)" that produced nonsense
 output, which was a bug in 2.38.
 source: <pull.1465.git.git.1678453473484.gitgitgadget@gmail.com>


* ak/restore-both-incompatible-with-conflicts (2023-02-27) 1 commit
  (merged to 'next' on 2023-03-06 at 4ee341853c)
 + restore: fault --staged --worktree with merge opts

 "git restore" supports options like "--ours" that are only
 meaningful during a conflicted merge, but these options are only
 meaningful when updating the working tree files.  These options are
 marked to be incompatible when both "--staged" and "--worktree" are
 in effect.
 source: <20230226184354.221-1-andy.koppe@gmail.com>


* as/doc-markup-fix (2023-03-06) 1 commit
  (merged to 'next' on 2023-03-07 at 8c7289659a)
 + git-merge-tree.txt: replace spurious HTML entity

 Fix for a mis-mark-up in doc made in Git 2.39 days.
 source: <87y1oco3i9.fsf@igel.home>


* ds/reprepare-alternates-when-repreparing-packfiles (2023-03-09) 1 commit
  (merged to 'next' on 2023-03-09 at 851bceed17)
 + object-file: reprepare alternates when necessary

 Once we start running, we assumed that the list of alternate object
 databases would never change.  Hook into the machinery used to
 update the list of packfiles during runtime to update this list as
 well.
 source: <pull.1490.v2.git.1678301252360.gitgitgadget@gmail.com>


* ew/commit-reach-clean-up-flags-fix (2023-02-11) 1 commit
  (merged to 'next' on 2023-03-06 at 5dc1c4c0b7)
 + commit-reach: avoid NULL dereference

 Fix a segfaulting loop.  The function and its caller may need
 further clean-up.
 cf. <876cf920-113a-90cf-f49e-6e1b7b146acf@github.com>
 source: <20230211111526.2028178-1-e@80x24.org>


* ew/fetch-no-write-fetch-head-fix (2023-03-09) 1 commit
  (merged to 'next' on 2023-03-09 at 283e2159c8)
 + fetch: pass --no-write-fetch-head to subprocesses

 source: <20230308222205.M679514@dcvr>


* fc/advice-diverged-history (2023-03-08) 1 commit
  (merged to 'next' on 2023-03-08 at 30e7016218)
 + advice: add diverging advice for novices

 After "git pull" that is configured with pull.rebase=false
 merge.ff=only fails due to our end having our own development, give
 advice messages to get out of the "Not possible to fast-forward"
 state.
 source: <20230308024834.1562386-2-felipe.contreras@gmail.com>


* fc/test-aggregation-clean-up (2023-03-09) 2 commits
  (merged to 'next' on 2023-03-13 at f938b09366)
 + test: don't print aggregate-results command
 + test: simplify counts aggregation

 Code clean-up for test framework.
 source: <20230309173032.959968-1-felipe.contreras@gmail.com>


* jk/add-p-unmerged-fix (2023-03-09) 1 commit
  (merged to 'next' on 2023-03-09 at a46443480c)
 + add-patch: handle "* Unmerged path" lines

 "git add -p" while the index is unmerged sometimes failed to parse
 the diff output it internally produces and died, which has been
 corrected.
 source: <ZAmfqC9WMl3XeyEr@coredump.intra.peff.net>


* jk/bundle-progress (2023-03-06) 1 commit
  (merged to 'next' on 2023-03-07 at 0df2b09e1b)
 + bundle: turn on --all-progress-implied by default

 Simplify UI to control progress meter given by "git bundle" command.
 source: <ZAMjkffYmp+DNmr+@coredump.intra.peff.net>


* jk/bundle-use-dash-for-stdfiles (2023-03-06) 5 commits
  (merged to 'next' on 2023-03-07 at 8ceb58f725)
 + parse-options: use prefix_filename_except_for_dash() helper
 + parse-options: consistently allocate memory in fix_filename()
 + bundle: don't blindly apply prefix_filename() to "-"
 + bundle: document handling of "-" as stdin
 + bundle: let "-" mean stdin for reading operations

 "git bundle" learned that "-" is a common way to say that the input
 comes from the standard input and/or the output goes to the
 standard output.  It used to work only for output and only from the
 root level of the working tree.
 source: <ZAMb8LSpm2gOrpeY@coredump.intra.peff.net>


* jk/format-patch-change-format-for-empty-commits (2023-03-03) 1 commit
  (merged to 'next' on 2023-03-07 at 1c421f4a9f)
 + format-patch: output header for empty commits

 "git format-patch" learned to write a log-message only output file
 for empty commits.
 source: <20230303160301.3659328-1-john@keeping.me.uk>


* jk/format-patch-ignore-noprefix (2023-03-13) 6 commits
  (merged to 'next' on 2023-03-13 at 4b28e389f5)
 + rebase: prefer --default-prefix to --{src,dst}-prefix for format-patch
  (merged to 'next' on 2023-03-12 at 621d71c151)
 + format-patch: add format.noprefix option
 + format-patch: do not respect diff.noprefix
 + diff: add --default-prefix option
 + t4013: add tests for diff prefix options
 + diff: factor out src/dst prefix setup

 "git format-patch" honors the src/dst prefixes set to nonstandard
 values with configuration variables like "diff.noprefix", causing
 receiving end of the patch that expects the standard -p1 format to
 break.  Teach "format-patch" to ignore end-user configuration and
 always use the standard prefixes.

 This is a backward compatibility breaking change.
 source: <ZAl3bHB9zxjLITgf@coredump.intra.peff.net>


* ps/receive-pack-unlock-before-die (2023-03-10) 1 commit
  (merged to 'next' on 2023-03-13 at 8d099dffcc)
 + receive-pack: fix stale packfile locks when dying

 "git receive-pack" that responds to "git push" requests failed to
 clean a stale lockfile when killed in the middle, which has been
 corrected.
 source: <e1ee1d8026a361bc58d16bc741e2b347ada7a53e.1678431076.git.ps@pks.im>


* rj/avoid-switching-to-already-used-branch (2023-02-25) 4 commits
  (merged to 'next' on 2023-03-06 at 7546231ddf)
 + switch: reject if the branch is already checked out elsewhere (test)
 + rebase: refuse to switch to a branch already checked out elsewhere (test)
 + branch: fix die_if_checked_out() when ignore_current_worktree
 + worktree: introduce is_shared_symref()

 A few subcommands have been taught to stop users from working on a
 branch that is being used in another worktree linked to the same
 repository.
 source: <6fed3b1b-1c4e-9298-19b6-7ad9c04c87dd@gmail.com>


* rj/bisect-already-used-branch (2023-01-22) 1 commit
  (merged to 'next' on 2023-03-06 at 3508814a41)
 + bisect: fix "reset" when branch is checked out elsewhere

 Allow "git bisect reset" to check out the original branch when the
 branch is already checked out in a different worktree linked to the
 same repository.
 source: <1c36c334-9f10-3859-c92f-3d889e226769@gmail.com>


* zh/push-to-delete-onelevel-ref (2023-03-01) 2 commits
  (merged to 'next' on 2023-03-06 at f08def5949)
 + push: allow delete single-level ref
 + receive-pack: fix funny ref error messsage

 "git push" has been taught to allow deletion of refs with one-level
 names to help repairing a repository who acquired such a ref by
 mistake.  In general, we don't encourage use of such a ref, and
 creation or update to such a ref is rejected as before.
 source: <pull.1465.v4.git.1677666029.gitgitgadget@gmail.com>

--------------------------------------------------
[New Topics]

* jk/fix-proto-downgrade-to-v0 (2023-03-17) 1 commit
  (merged to 'next' on 2023-03-21 at ed9e43d3ed)
 + git_connect(): fix corner cases in downgrading v2 to v0

 Transports that do not support protocol v2 did not correctly fall
 back to protocol v0 under certain conditions, which has been
 corrected.

 Will merge to 'master'.
 source: <ZBS6wwWXcEBwGBm/@coredump.intra.peff.net>


* pe/time-use-gettimeofday (2023-03-21) 1 commit
  (merged to 'next' on 2023-03-21 at 456b65b4c2)
 + git-compat-util: use gettimeofday(2) for time(2)

 time(2) on glib 2.31+, especially on Linux, goes out of sync with
 higher resolution timers used for gettimeofday(2) and by the
 filesystem.  Replace all calls to it with a time_now() wrapper and
 then use gettimeofday(2) in its implementation.

 Will merge to 'master'.
 source: <20230320230507.3932018-1-gitster@pobox.com>


* pw/sequencer-rescheduled-ones-are-not-done-yet (2023-03-20) 1 commit
 - rebase -i: do not update "done" when rescheduling command

 "rebase -i" moved a "rescheduled" insn in the todo file to the
 "done" list before it completed, which has been corrected.

 Expecting clarification.
 source: <pull.1492.git.1679237337683.gitgitgadget@gmail.com>


* pw/wildmatch-fixes (2023-03-20) 3 commits
 - wildmatch: hide internal return values
 - wildmatch: avoid undefined behavior
 - wildmatch: fix exponential behavior

 The wildmatch library code unlearns exponential behaviour it
 acquired some time ago since it was borrowed from rsync.

 Needs review.
 source: <cover.1679328580.git.phillip.wood@dunelm.org.uk>


* sg/parse-options-h-initializers (2023-03-20) 3 commits
 - parse-options.h: use designated initializers in OPT_* macros
 - parse-options.h: rename _OPT_CONTAINS_OR_WITH()'s parameters
 - parse-options.h: use consistent name for the callback parameters

 Code clean-up to use designated initializers in parse-options API.

 Will merge to 'next'.
 source: <20230319165648.656738-1-szeder.dev@gmail.com>


* sg/parse-options-h-users (2023-03-20) 2 commits
 - treewide: remove unnecessary inclusions of parse-options.h from headers
 - treewide: include parse-options.h in source files

 Code clean-up to include and/or uninclude parse-options.h file as
 needed.

 Will merge to 'next'.
 source: <20230319162712.654137-1-szeder.dev@gmail.com>


* rs/archive-from-subdirectory-fixes (2023-03-20) 1 commit
 . archive: improve support for running in a subdirectory

 "git archive" run from a subdirectory mishandled attributes and
 paths outside the current directory.

 Breaks CI.
 cf. <xmqqlejpg17g.fsf@gitster.g>
 source: <e923e844-6891-76dc-e7db-4771b2d91792@web.de>


* tb/pack-bitmap-index-seek (2023-03-20) 6 commits
  (merged to 'next' on 2023-03-21 at b579e226b5)
 + pack-bitmap.c: factor out `bitmap_index_seek_commit()`
 + pack-bitmap.c: use `bitmap_index_seek()` where possible
 + pack-bitmap.c: factor out manual `map_pos` manipulation
 + pack-bitmap.c: drop unnecessary 'inline's
 + pack-bitmap.c: hide bitmap internals in `read_be32()`
 + pack-bitmap.c: hide bitmap internals in `read_u8()`

 Clean-up the pack-bitmap codepath.

 Will merge to 'master'.
 source: <cover.1679342296.git.me@ttaylorr.com>


* en/header-split-cleanup (2023-03-21) 16 commits
 - csum-file.h: remove unnecessary inclusion of cache.h
 - write-or-die.h: move declarations for write-or-die.c functions from cache.h
 - treewide: remove cache.h inclusion due to setup.h changes
 - setup.h: move declarations for setup.c functions from cache.h
 - treewide: remove cache.h inclusion due to environment.h changes
 - environment.h: move declarations for environment.c functions from cache.h
 - treewide: remove unnecessary includes of cache.h
 - wrapper.h: move declarations for wrapper.c functions from cache.h
 - path.h: move function declarations for path.c functions from cache.h
 - cache.h: remove expand_user_path()
 - abspath.h: move absolute path functions from cache.h
 - environment: move comment_line_char from cache.h
 - treewide: remove unnecessary cache.h inclusion from several sources
 - treewide: remove unnecessary inclusion of gettext.h
 - treewide: be explicit about dependence on gettext.h
 - treewide: remove unnecessary cache.h inclusion from a few headers

 Split key function and data structure definitions out of cache.h to
 new header files and adjust the users.

 Needs review.
 source: <pull.1493.v2.git.1679379968.gitgitgadget@gmail.com>


* fc/docbook-remove-groff-workaround (2023-03-21) 1 commit
  (merged to 'next' on 2023-03-21 at 6c59b16205)
 + doc: remove GNU troff workaround

 Remove workaround for ancient versions of DocBook to make it work
 correctly with groff, which has not been necessary since docbook
 1.76 from 2010.

 Will merge to 'master'.
 source: <20230320190047.79836-1-felipe.contreras@gmail.com>


* jc/am-doc-refer-to-format-patch (2023-03-21) 1 commit
 - am: refer to format-patch in the documentation

 Doc update.

 Will merge to 'next'.
 source: <xmqq1qlij9qr.fsf@gitster.g>


* jk/fast-export-cleanup (2023-03-22) 6 commits
 - fast-export: drop unused parameter from anonymize_commit_message()
 - fast-export: drop data parameter from anonymous generators
 - fast-export: de-obfuscate --anonymize-map handling
 - fast-export: factor out anonymized_entry creation
 - fast-export: simplify initialization of anonymized hashmaps
 - fast-export: drop const when storing anonymized values

 Code clean-up.

 Will merge to 'next'?
 source: <20230322173636.GA5643@coredump.intra.peff.net>


* js/split-index-fixes (2023-03-22) 4 commits
 - unpack-trees: take care to propagate the split-index flag
 - fsmonitor: avoid overriding `cache_changed` bits
 - split-index; stop abusing the `base_oid` to strip the "link" extension
 - split-index & fsmonitor: demonstrate a bug

 The index files can become corrupt under certain conditions when
 the split-index feature is in use, especially together with
 fsmonitor, which have been corrected.

 Will merge to 'next'?
 source: <pull.1497.git.1679500859.gitgitgadget@gmail.com>

--------------------------------------------------
[Stalled]

* ed/fsmonitor-inotify (2022-12-13) 6 commits
 - fsmonitor: update doc for Linux
 - fsmonitor: test updates
 - fsmonitor: enable fsmonitor for Linux
 - fsmonitor: implement filesystem change listener for Linux
 - fsmonitor: determine if filesystem is local or remote
 - fsmonitor: prepare to share code between Mac OS and Linux

 Bundled fsmonitor for Linux using inotify API.

 What's the status of this one?
 source: <pull.1352.v5.git.git.1670882286.gitgitgadget@gmail.com>


* ja/worktree-orphan (2023-01-13) 4 commits
 - worktree add: add hint to direct users towards --orphan
 - worktree add: add --orphan flag
 - worktree add: refactor opt exclusion tests
 - worktree add: include -B in usage docs

 'git worktree add' learned how to create a worktree based on an
 orphaned branch with `--orphan`.

 Expecting a reroll.
 cf. <11be1b0e-ee38-119f-1d80-cb818946116b@dunelm.org.uk>
 source: <20230109173227.29264-1-jacobabel@nullpo.dev>


* tl/notes--blankline (2023-02-24) 4 commits
 - SQUASH??? leakfix
 - notes.c: introduce '--separator=<paragraph-break>' option
 - notes.c: cleanup for "designated init"
 - notes.c: cleanup 'strbuf_grow' call in 'append_edit'

 'git notes append' was taught '--separator' to specify string to insert
 between paragraphs.

 Expecting further updates on -c/-C.
 source: <cover.1677136319.git.dyroneteng@gmail.com>


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


* jc/spell-id-in-both-caps-in-message-id (2022-12-17) 1 commit
 - e-mail workflow: Message-ID is spelled with ID in both capital letters

 Consistently spell "Message-ID" as such, not "Message-Id".

 Needs review.
 source: <xmqqsfhgnmqg.fsf@gitster.g>


* ad/test-record-count-when-harness-is-in-use (2022-12-25) 1 commit
 - test-lib: allow storing counts with test harnesses

 Allow summary results from tests to be written to t/test-results
 directory even when a test harness like 'prove' is in use.

 Needs review.
 source: <20221224225200.1027806-1-adam@dinwoodie.org>


* so/diff-merges-more (2022-12-18) 5 commits
 - diff-merges: improve --diff-merges documentation
 - diff-merges: issue warning on lone '-m' option
 - diff-merges: support list of values for --diff-merges
 - diff-merges: implement log.diffMerges-m-imply-p config
 - diff-merges: implement [no-]hide option and log.diffMergesHide config

 Assorted updates to "--diff-merges=X" option.

 May want to discard.  Breaking compatibility does not seem worth it.
 source: <20221217132955.108542-1-sorganov@gmail.com>

--------------------------------------------------
[Cooking]

* ar/test-cleanup-unused-file-creation (2023-03-20) 7 commits
 - t1507: assert output of rev-parse
 - t1404: don't create unused file
 - t1400: assert output of update-ref
 - t1302: don't create unused file
 - t1010: don't create unused files
 - t1006: assert error output of cat-file
 - t1005: assert output of ls-files

 Test clean-up.

 Needs Review.
 source: <20230312201520.370234-1-rybak.a.v@gmail.com>


* nw/for-each-ref-signature (2023-03-13) 1 commit
 . ref-filter: add new "signature" atom

 "git (for-each-ref|branch|tag) --format=<format>" learns the "%(signature)"
 placeholder and friends.

 Breaks CI.
 cf. <xmqqpm9bosjw.fsf@gitster.g>
 source: <20230311210607.64927-2-nsengiyumvawilberforce@gmail.com>


* mh/credential-oauth-refresh-token (2023-03-14) 1 commit
 - credential: new attribute oauth_refresh_token

 The credential subsystem learns to help OAuth framework.

 Needs Review.
 source: <pull.1394.git.1678776364753.gitgitgadget@gmail.com>


* mh/credential-password-expiry-libsecret (2023-03-14) 1 commit
 - credential/libsecret: support password_expiry_utc

 The libsecret credential helper learns to handle the password
 expiry time information.

 Needs Review.
 source: <pull.1469.git.git.1678829531648.gitgitgadget@gmail.com>


* ps/fetch-ref-update-reporting (2023-03-20) 6 commits
 - fetch: centralize printing of reference updates
 - fetch: centralize logic to print remote URL
 - fetch: centralize handling of per-reference format
 - fetch: pass the full local reference name to `format_display`
 - fetch: move output format into `display_state`
 - fetch: move reference width calculation into `display_state`

 Clean-up of the code path that reports what "git fetch" did to each
 ref.

 Will merge to 'next'?
 source: <cover.1679315383.git.ps@pks.im>


* pw/rebase-cleanup-merge-strategy-option-handling (2023-03-15) 5 commits
 - rebase: remove a couple of redundant strategy tests
 - rebase -m: fix serialization of strategy options
 - rebase -m: cleanup --strategy-option handling
 - rebase: stop reading and writing unnecessary strategy state
 - Merge branch 'ab/fix-strategy-opts-parsing'

 Clean-up of the code path that deals with merge strategy option
 handling in "git rebase".

 Needs review.
 source: <cover.1678893298.git.phillip.wood@dunelm.org.uk>


* ab/remove-implicit-use-of-the-repository (2023-03-17) 17 commits
 - libs: use "struct repository *" argument, not "the_repository"
 - post-cocci: adjust comments for recent repo_* migration
 - cocci: apply the "revision.h" part of "the_repository.pending"
 - cocci: apply the "rerere.h" part of "the_repository.pending"
 - cocci: apply the "refs.h" part of "the_repository.pending"
 - cocci: apply the "promisor-remote.h" part of "the_repository.pending"
 - cocci: apply the "packfile.h" part of "the_repository.pending"
 - cocci: apply the "pretty.h" part of "the_repository.pending"
 - cocci: apply the "object-store.h" part of "the_repository.pending"
 - cocci: apply the "diff.h" part of "the_repository.pending"
 - cocci: apply the "commit.h" part of "the_repository.pending"
 - cocci: apply the "commit-reach.h" part of "the_repository.pending"
 - cocci: apply the "cache.h" part of "the_repository.pending"
 - cocci: add missing "the_repository" macros to "pending"
 - cocci: sort "the_repository" rules by header
 - cocci: fix incorrect & verbose "the_repository" rules
 - cocci: remove dead rule from "the_repository.pending.cocci"

 Code clean-up around the use of the_repository.

 Needs review.
 source: <cover-00.17-00000000000-20230317T152724Z-avarab@gmail.com>


* fc/completion-colors-do-not-need-prompt-command (2023-03-16) 1 commit
  (merged to 'next' on 2023-03-19 at 35911c8f54)
 + completion: prompt: use generic colors

 Lift the limitation that colored prompts can only be used with
 PROMPT_COMMAND mode.

 Will merge to 'master'.
 source: <20230228145934.4182166-1-felipe.contreras@gmail.com>


* fc/oid-quietly-parse-upstream (2023-03-16) 1 commit
  (merged to 'next' on 2023-03-21 at 593883005f)
 + object-name: fix quiet @{u} parsing

 "git rev-parse --quiet foo@{u}", or anything that asks @{u} to be
 parsed with GET_OID_QUIETLY option, did not quietly fail, which has
 been corrected.

 Will merge to 'master'.
 source: <20230316171514.23741-1-felipe.contreras@gmail.com>


* jk/unused-post-2.40 (2023-03-17) 4 commits
 - transport: mark unused parameters in fetch_refs_from_bundle()
 - http: mark unused parameter in fill_active_slot() callbacks
 - http: drop unused parameter from start_object_request()
 - mailmap: drop debugging code

 source: <ZBS77VYL9ZrxKtCN@coredump.intra.peff.net>


* sl/diff-files-sparse (2023-03-20) 2 commits
 - diff-files: integrate with sparse index
 - t1092: add tests for `git diff-files`

 Teach "diff-files" not to expand sparse-index unless needed.

 Comments?
 source: <20230320205241.105476-1-cheskaqiqi@gmail.com>


* ds/ahead-behind (2023-03-20) 9 commits
 - commit-reach: add tips_reachable_from_bases()
 - for-each-ref: add ahead-behind format atom
 - commit-reach: implement ahead_behind() logic
 - commit-graph: introduce `ensure_generations_valid()`
 - commit-graph: return generation from memory
 - commit-graph: simplify compute_generation_numbers()
 - commit-graph: refactor compute_topological_levels()
 - for-each-ref: explicitly test no matches
 - for-each-ref: add --stdin option

 "git for-each-ref" learns '%(ahead-behind:<base>)' that computes the
 distances from a single reference point in the history with bunch
 of commits in bulk.

 Will merge to 'next'.
 source: <pull.1489.v4.git.1679311615.gitgitgadget@gmail.com>


* gc/config-parsing-cleanup (2023-03-15) 8 commits
 - config.c: rename "struct config_source cf"
 - config: report cached filenames in die_bad_number()
 - config.c: remove current_parsing_scope
 - config.c: remove current_config_kvi
 - config.c: plumb the_reader through callbacks
 - config.c: create config_reader and the_reader
 - config.c: don't assign to "cf_global" directly
 - config.c: plumb config_source through static fns

 Config API clean-up to reduce its dependence on static variables

 Comments?
 source: <pull.1463.v2.git.git.1678925506.gitgitgadget@gmail.com>


* my/wildmatch-cleanups (2023-02-27) 5 commits
 . wildmatch: more cleanups after killing uchar
 . wildmatch: use char instead of uchar
 . wildmatch: remove NEGATE_CLASS(2) macros with trivial refactoring
 . wildmatch: remove IS*() macros
 . git-compat-util: add isblank() and isgraph()

 Code clean-up.

 Ejected as it conflicts with pw/wildmatch-fixes topic.
 source: <20230226115021.1681834-1-masahiroy@kernel.org>


* cw/forbid-use-of-gitlink-outside-submodules (2023-02-28) 6 commits
 . add: reject nested repositories
 . tests: remove duplicate .gitmodules path
 . tests: use `git submodule add` and fix expected status
 . tests: use `git submodule add` and fix expected diffs
 . tests: Use `git submodule add` instead of `git add`
 . t4041, t4060: modernize test style

 Forbid "git add dir" from adding a gitlink to the index.

 Comments?
 Seems to break tests when merged to 'seen'.
 source: <20230228185253.2356546-1-calvinwan@google.com>


* ah/rebase-merges-config (2023-03-20) 3 commits
 - rebase: add a config option for --rebase-merges
 - rebase: deprecate --rebase-merges=""
 - rebase: add documentation and test for --no-rebase-merges

 Streamline --rebase-merges command line option handling and
 introduce rebase.merges configuration variable.

 Comments?
 source: <20230320055955.461138-1-alexhenrie24@gmail.com>


* tk/pull-conflict-suggest-rebase-merge-not-rebase-true (2023-02-13) 1 commit
 - pull: conflict hint pull.rebase suggestion should offer "merges" vs "true"

 In an advice message after failed non-ff pull, we used to suggest
 setting pull.rebase=true, but these days pull.rebase=merges may be
 more inline with the original spirit of "rebuild your side on top
 of theirs".

 On hold. This is too much of a departure from the existing practice.
 cf. <CAMMLpeTPEoKVTbfc17w+Y9qn7jOGmQi_Ux0Y3sFW5QTgGWJ=SA@mail.gmail.com>
 cf. <CABPp-BGqAxKnxDRVN4cYMteLp33hvto07R3=TJBT5WubJT4+Og@mail.gmail.com>
 source: <pull.1474.git.1675614276549.gitgitgadget@gmail.com>


* rj/branch-unborn-in-other-worktrees (2023-02-22) 3 commits
  (merged to 'next' on 2023-03-06 at 6ee0ec72ae)
 + branch: rename orphan branches in any worktree
 + branch: description for orphan branch errors
 + branch: avoid unnecessary worktrees traversals

 Error messages given when working on an unborn branch that is
 checked out in another worktree have been improved.

 Needs update.
 cf. <877b6f9d-bab6-1343-42d0-3e17e3d0a9c5@gmail.com>
 source: <139555f1-21ab-d987-a58e-c7f04ce222d3@gmail.com>


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


* ab/config-multi-and-nonbool (2023-03-08) 9 commits
 - for-each-repo: with bad config, don't conflate <path> and <cmd>
 - config API: add "string" version of *_value_multi(), fix segfaults
 - config API users: test for *_get_value_multi() segfaults
 - for-each-repo: error on bad --config
 - config API: have *_multi() return an "int" and take a "dest"
 - versioncmp.c: refactor config reading next commit
 - config API: add and use a "git_config_get()" family of functions
 - config tests: add "NULL" tests for *_get_value_multi()
 - config tests: cover blind spots in git_die_config() tests

 Assorted config API updates.

 Almost there.
 cf. <kl6l8rg5hhen.fsf@chooglen-macbookpro.roam.corp.google.com>
 source: <cover-v7-0.9-00000000000-20230308T090513Z-avarab@gmail.com>


* cb/checkout-same-branch-twice (2023-01-20) 1 commit
 - checkout/switch: disallow checking out same branch in multiple worktrees

 "git checkout -B $branch" failed to protect against checking out
 a branch that is checked out elsewhere, unlike "git branch -f" did.

 Expecting a hopefully minor and final reroll.
 cf. <8f24fc3c-c30f-dc70-5a94-5ee4ed3de102@dunelm.org.uk>
 source: <20230120113553.24655-1-carenas@gmail.com>


* ms/send-email-feed-header-to-validate-hook (2023-01-19) 2 commits
 - send-email: expose header information to git-send-email's sendemail-validate hook
 - send-email: refactor header generation functions

 "git send-email" learned to give the e-mail headers to the validate
 hook by passing an extra argument from the command line.

 Expecting a hopefully minor and final reroll.
 cf. <c1ba0a28-3c39-b313-2757-dceb02930334@amd.com>
 source: <20230120012459.920932-1-michael.strawbridge@amd.com>


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

 Comments?
 source: <20230302215237.1473444-1-calvinwan@google.com>
