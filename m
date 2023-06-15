Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E8CEB64D9
	for <git@archiver.kernel.org>; Thu, 15 Jun 2023 00:07:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231975AbjFOAHA (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 14 Jun 2023 20:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231151AbjFOAG4 (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 14 Jun 2023 20:06:56 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47ABC199D
        for <git@vger.kernel.org>; Wed, 14 Jun 2023 17:06:53 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b3db8f3d94so22025455ad.1
        for <git@vger.kernel.org>; Wed, 14 Jun 2023 17:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686787612; x=1689379612;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kwOcrZmB9GDh21QqOmeAhA9VLj28gV8s18o44tuup4E=;
        b=FeHGINANCBWs46/bWgRvq9f1dnoaqRYmpRmQacA000rm1yUaW3wYTSwffPiI7oLZ6b
         7o0+u5SJSPo/MVR93i2dMnv688EKNpGufui5+EMXTIHynbeLS4oJbjMhu5F1EA6jOD5c
         wPbBHQvo/GXsllnKMjLLWb8FWSlyUWyl4R66WdeT0tcKsMKG06znuAUpZMzUinQXhcck
         DyY2DYssjl9z7t2MOELfmAwggbswsCtk0HE0Ua4owjJXsi8D7VyD+98G0XVTkwLH5WCM
         0BgURtotwg8VwKIQ8Yopv05TBNdXencQ+horknAHcDGPJLu/uGVJZ1qffxtsgNN0SMwc
         YRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686787612; x=1689379612;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kwOcrZmB9GDh21QqOmeAhA9VLj28gV8s18o44tuup4E=;
        b=hcjb6l/A4ac3mmIlpqKhsalY81XnaoRwF//i8pX1XDkkSxTxidL1t0n/IDRB3BkkK/
         bh+1KF+cPgcrKRUxJt2lzh8ET7bmMYFoH8zrg1RvhG7XkVr2JbkICSE2WH50MdoNghYi
         VFnGTIWZMxXAXvhrXiUKBXOzQC6YKKUdiX2Bv1B034jwrIU+S+BFwatwH05zoSvsAp4P
         0bwzwb6vNIhCIP+xnFG58jE6CpgKejSbsuTE0LW9E0Wue1VesjL2cKKrVGM5a3iAeRzF
         BuEjRaebeKU3Rw6+RE4lqlZz4ImYtgzfc0T2kA9sHFSl0GnRwE1xZdiqCMmCvfhhoFat
         3qcA==
X-Gm-Message-State: AC+VfDza5/FvgSF91hNxO6pC9Pds93G7eGqk2qEf5+NTvYXeEa5kcBId
        BlHVLo3/5iQjTKilbij8qTwfF/30KGU=
X-Google-Smtp-Source: ACHHUZ4+T8wt22uZX1cWjbXHCaiVKbZoMKWyygS2NZ9mgaxoPGGbSDG6U3zGPcFdOPz8oV0+tJfUsg==
X-Received: by 2002:a17:90b:1241:b0:25b:e122:e29c with SMTP id gx1-20020a17090b124100b0025be122e29cmr2060512pjb.49.1686787611146;
        Wed, 14 Jun 2023 17:06:51 -0700 (PDT)
Received: from localhost (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c14600b001b045c9ababsm1021393plj.264.2023.06.14.17.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 17:06:50 -0700 (PDT)
Sender: Junio C Hamano <jch2355@gmail.com>
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Jun 2023, #04; Wed, 14)
X-master-at: d7d8841f67f29e6ecbad85a11805c907d0f00d5d
X-next-at: 91eec092e0048861e489d5248932fabb011982fc
Date:   Wed, 14 Jun 2023 17:06:50 -0700
Message-ID: <xmqqedmdwput.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
[New Topics]

* jc/notes-separator-fix (2023-06-13) 1 commit
  (merged to 'next' on 2023-06-14 at 3321da32a9)
 + notes: do not access before the beginning of an array
 (this branch uses tl/notes-separator.)

 Fix to tl/notes-separator topic.

 Will merge to 'master'.
 source: <cover.1682671758.git.dyroneteng@gmail.com>


* js/doc-unit-tests (2023-06-13) 1 commit
 - unit tests: Add a project plan document

 Process to add some form of low-level unit tests has started.

 Comments?  Filling in blanks?
 source: <8afdb215d7e10ca16a2ce8226b4127b3d8a2d971.1686352386.git.steadmon@google.com>


* jt/doc-use-octal-with-printf (2023-06-13) 1 commit
 - CodingGuidelines: use octal escapes, not hex

 Suggest to refrain from using hex literals that are non-portable
 when writing printf(1) format strings.

 Will merge to 'next'.
 source: <20230614001558.277755-1-jonathantanmy@google.com>


* js/defeat-ignore-submodules-config-with-explicit-addition (2023-06-14) 1 commit
 - diff-lib: honor override_submodule_config flag bit

 Even when diff.ignoreSubmodules tells us to ignore submodule
 changes, "git commit" with an index that already records changes to
 submodules should include the submodule changes in the resulting
 commit, but it did not.

 Will merge to 'next'.
 source: <20230614164856.3186012-2-sokcevic@google.com>

--------------------------------------------------
[Graduated to 'master']

* gc/doc-cocci-updates (2023-04-27) 2 commits
  (merged to 'next' on 2023-05-20 at 3fe237c1a8)
 + cocci: codify authoring and reviewing practices
 + cocci: add headings to and reword README

 Update documentation regarding Coccinelle patches.
 source: <pull.1495.v2.git.git.1682634143.gitgitgadget@gmail.com>


* jc/diff-s-with-other-options (2023-05-05) 1 commit
  (merged to 'next' on 2023-05-20 at dda3826a68)
 + diff: fix interaction between the "-s" option and other options

 The "-s" (silent, squelch) option of the "diff" family of commands
 did not interact with other options that specify the output format
 well.  This has been cleaned up so that it will clear all the
 formatting options given before.
 source: <20230505165952.335256-1-gitster@pobox.com>


* jc/pack-ref-exclude-include (2023-05-12) 3 commits
  (merged to 'next' on 2023-05-23 at 37333a2d00)
 + pack-refs: teach pack-refs --include option
 + pack-refs: teach --exclude option to exclude refs from being packed
 + docs: clarify git-pack-refs --all will pack all refs

 "git pack-refs" learns "--include" and "--exclude" to tweak the ref
 hierarchy to be packed using pattern matching.
 source: <pull.1501.v4.git.git.1683927282.gitgitgadget@gmail.com>


* jk/format-patch-message-id-unleak (2023-05-19) 2 commits
  (merged to 'next' on 2023-05-23 at 44b9e1ab91)
 + format-patch: free elements of rev.ref_message_ids list
 + format-patch: free rev.message_id when exiting

 Leakfix.
 source: <20230519000239.GA1975039@coredump.intra.peff.net>


* kh/keep-tag-editmsg-upon-failure (2023-05-16) 3 commits
  (merged to 'next' on 2023-05-19 at fc0fe3173d)
 + tag: keep the message file in case ref transaction fails
 + t/t7004-tag: add regression test for successful tag creation
 + doc: tag: document `TAG_EDITMSG`

 "git tag" learned to leave the "$GIT_DIR/TAG_EDITMSG" file when the
 command failed, so that the user can salvage what they typed.
 source: <cover.1684258780.git.code@khaugsbakk.name>


* sa/doc-ls-remote (2023-05-19) 6 commits
  (merged to 'next' on 2023-05-20 at d577bf75a0)
 + ls-remote doc: document the output format
 + ls-remote doc: explain what each example does
 + ls-remote doc: show peeled tags in examples
 + ls-remote doc: remove redundant --tags example
 + show-branch doc: say <ref>, not <reference>
 + show-ref doc: update for internal consistency

 Doc update.
 source: <pull.1471.v4.git.git.1684469874.gitgitgadget@gmail.com>


* sl/diff-tree-sparse (2023-05-18) 1 commit
  (merged to 'next' on 2023-05-24 at 5d4f2dec4d)
 + diff-tree: integrate with sparse index

 "git diff-tree" has been taught to take advantage of the
 sparse-index feature.
 cf. <2a2b7223-bb5d-65f9-95bb-9be45d329c87@github.com>
 source: <20230518154454.475487-1-cheskaqiqi@gmail.com>


* zh/ls-files-format-atoms (2023-05-23) 1 commit
  (merged to 'next' on 2023-05-24 at 116b11effb)
 + ls-files: align format atoms with ls-tree

 Some atoms that can be used in "--format=<format>" for "git ls-tree"
 were not supported by "git ls-files", even though they were relevant
 in the context of the latter.
 source: <pull.1533.v2.git.1684832418299.gitgitgadget@gmail.com>

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

* as/dtype-compilation-fix (2023-06-12) 1 commit
 - statinfo.h: move DTYPE defines from dir.h

 Compilation fix for platforms without D_TYPE in struct dirent.

 Will merge to 'next'.
 source: <20230606205935.3183276-1-asedeno@google.com>


* la/docs-typofixes (2023-06-12) 1 commit
 - docs: typofixes

 Typofixes.

 Will merge to 'next'.
 source: <pull.1542.v2.git.1686166007816.gitgitgadget@gmail.com>


* mh/mingw-case-sensitive-build (2023-06-12) 1 commit
 - mingw: use lowercase includes for some Windows headers

 Names of MinGW header files are spelled in mixed case in some
 source files, but the build host can be using case sensitive
 filesystem with header files with their name spelled in all
 lowercase.

 Needs review.
 source: <20230604211934.1365289-1-mh@glandium.org>


* pb/complete-diff-options (2023-06-12) 25 commits
 - diff.c: mention completion above add_diff_options
 - completion: complete --remerge-diff
 - completion: complete --diff-merges, its options and --no-diff-merges
 - completion: move --pickaxe-{all,regex} to __git_diff_common_options
 - completion: complete --ws-error-highlight
 - completion: complete --unified
 - completion: complete --patch-with-raw
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

 Expecting a reroll.
 cf. <5cba334c-4d75-0dac-20c6-9e3def1f224a@gmail.com>
 source: <pull.1543.v2.git.1686574374.gitgitgadget@gmail.com>


* rj/leakfixes (2023-06-12) 6 commits
 - branch: fix a leak in setup_tracking
 - branch: fix a leak in check_tracking_branch
 - branch: fix a leak in inherit_tracking
 - branch: fix a leak in dwim_and_setup_tracking
 - remote: fix a leak in query_matches_negative_refspec
 - config: fix a leak in git_config_copy_or_rename_section_in_file

 Leakfixes (subset)

 Will merge to 'next'.
 source: <9eb931e7-dd18-8ce8-4d4a-cf3d85066189@gmail.com>


* rs/run-command-exec-error-on-noent (2023-06-12) 2 commits
 - run-command: report exec error even on ENOENT
 - t1800: loosen matching of error message for bad shebang

 Simplify error message when run-command fails to start a command.

 Will merge to 'next'.
 source: <14e1be60-3765-0ba5-00f5-2848bb57bf53@web.de>


* sl/worktree-sparse (2023-06-12) 1 commit
 - worktree: integrate with sparse-index

 "git worktree" learned to work better with sparse index feature.

 Will merge to 'next'.
 source: <20230606172633.669916-1-cheskaqiqi@gmail.com>


* tb/collect-pack-filenames-fix (2023-06-12) 1 commit
 - builtin/repack.c: only collect fully-formed packs

 Avoid breakage of "git pack-objects --cruft" due to inconsistency
 between the way the code enumerates packfiles in the repository.

 Will merge to 'next'?
 source: <20230607101617.ges6tnMry4E52lDGld43QgtNUsIS4YQq6w-t71hEfkQ@z>


* tb/open-midx-bitmap-fallback (2023-06-12) 1 commit
 - pack-bitmap.c: gracefully degrade on failure to load MIDX'd pack

 Gracefully deal with a stale MIDX file that lists a packfile that
 no longer exists.

 Will merge to 'next'.
 source: <f123b68cb8a277fbf105b1789a84b9405a499b79.1686178854.git.me@ttaylorr.com>


* tz/lib-gpg-prereq-fix (2023-06-12) 1 commit
 - t/lib-gpg: require GPGSSH for GPGSSH_VERIFYTIME prereq

 Test update.

 Will merge to 'next'.
 source: <20230606214707.55739-1-tmz@pobox.com>


* jk/ci-use-clang-for-sanitizer-jobs (2023-06-03) 3 commits
  (merged to 'next' on 2023-06-12 at f6d4c5aac6)
 + ci: drop linux-clang job
 + ci: run ASan/UBSan in a single job
 + ci: use clang for ASan/UBSan checks

 Clang's sanitizer implementation seems to work better than GCC's.

 Will merge to 'master'.
 source: <20230601180220.GA4167745@coredump.intra.peff.net>


* jk/log-follow-with-non-literal-pathspec (2023-06-03) 3 commits
  (merged to 'next' on 2023-06-13 at 6c864e2f8a)
 + diff: detect pathspec magic not supported by --follow
 + diff: factor out --follow pathspec check
 + pathspec: factor out magic-to-name function

 "git [-c log.follow=true] log [--follow] ':(glob)f**'" used to barf.

 Will merge to 'master'.
 source: <20230601173724.GA4158369@coredump.intra.peff.net>


* kh/use-default-notes-doc (2023-06-06) 2 commits
  (merged to 'next' on 2023-06-13 at ebfbf7a376)
 + notes: move the documentation to the struct
 + notes: update documentation for `use_default_notes`

 Doc update.

 Will merge to 'master'.
 source: <cover.1685958731.git.code@khaugsbakk.name>


* ps/cat-file-null-output (2023-06-12) 5 commits
  (merged to 'next' on 2023-06-14 at f879ffcbf0)
 + cat-file: add option '-Z' that delimits input and output with NUL
 + cat-file: simplify reading from standard input
 + strbuf: provide CRLF-aware helper to read until a specified delimiter
 + t1006: modernize test style to use `test_cmp`
 + t1006: don't strip timestamps from expected results

 "git cat-file --batch" and friends learned "-Z" that uses NUL
 delimiter for both input and output.

 Will merge to 'master'.
 source: <cover.1686028409.git.ps@pks.im>


* tl/quote-problematic-arg-for-clarity (2023-06-03) 1 commit
  (merged to 'next' on 2023-06-12 at 68851799e5)
 + surround %s with quotes when failed to lookup commit

 Error message fix.

 Will merge to 'master'.
 source: <1f7c62a8870433792076fae30d6c4dc4b61a00d8.1685366301.git.dyroneteng@gmail.com>


* ds/add-i-color-configuration-fix (2023-06-12) 2 commits
  (merged to 'next' on 2023-06-14 at 91eec092e0)
 + add: test use of brackets when color is disabled
 + add: check color.ui for interactive add

 The reimplemented "git add -i" did not honor color.ui configuration.

 Will merge to 'master'.
 source: <pull.1541.v2.git.1686061219078.gitgitgadget@gmail.com>


* ks/ref-filter-signature (2023-06-06) 2 commits
 - ref-filter: add new "signature" atom
 - t/lib-gpg: introduce new prereq GPG2

 The "git for-each-ref" family of commands learned placeholders
 related to GPG signature verification.

 Needs review.
 source: <20230604185815.15761-1-five231003@gmail.com>


* mh/commit-reach-get-reachable-plug-leak (2023-06-04) 1 commit
  (merged to 'next' on 2023-06-12 at 7c58973941)
 + commit-reach: fix memory leak in get_reachable_subset()

 Plug memory leak.

 Will merge to 'master'.
 source: <20230603002819.1122129-1-mh@glandium.org>


* ds/disable-replace-refs (2023-06-12) 3 commits
  (merged to 'next' on 2023-06-14 at 82ba5a6ffa)
 + repository: create read_replace_refs setting
 + replace-objects: create wrapper around setting
 + repository: create disable_replace_refs()
 (this branch uses tb/pack-bitmap-traversal-with-boundary.)

 Introduce a mechanism to disable replace refs globally and per
 repository.

 Will merge to 'master'.
 source: <pull.1537.v3.git.1686057877.gitgitgadget@gmail.com>


* tz/test-fix-pthreads-prereq (2023-05-26) 1 commit
  (merged to 'next' on 2023-06-12 at 82d9529f2c)
 + trace2 tests: fix PTHREADS prereq

 Test fix.

 Will merge to 'master'.
 source: <20230525031218.3554586-1-tmz@pobox.com>


* tz/test-ssh-verifytime-fix (2023-05-26) 1 commit
  (merged to 'next' on 2023-06-12 at 3abad605d6)
 + t/lib-gpg: fix ssh-keygen -Y check-novalidate with openssh-9.0

 Test fix.

 Will merge to 'master'.
 source: <20230525031026.3554406-1-tmz@pobox.com>


* vd/worktree-config-is-per-repository (2023-05-26) 3 commits
  (merged to 'next' on 2023-06-13 at 339d281663)
 + repository: move 'repository_format_worktree_config' to repo scope
 + config: pass 'repo' directly to 'config_with_options()'
 + config: use gitdir to get worktree config

 The value of config.worktree is per-repository, but has been kept
 in a singleton global variable per process. This has been OK as
 most Git operations interacted with a single repository at a time,
 but not right for operations like recursive "grep" that want to
 access multiple repositories from a single process without forking.

 The global variable has been eliminated and made into a member in
 the per-repository data structure.

 Will merge to 'master'.
 cf. <3145f4f3-7bd4-8a1b-4943-11b7d22b60c6@github.com>
 cf. <kl6lr0qwno2q.fsf@chooglen-macbookpro.roam.corp.google.com>
 source: <pull.1536.v2.git.1685064781.gitgitgadget@gmail.com>


* tb/submodule-null-deref-fix (2023-05-25) 1 commit
  (merged to 'next' on 2023-06-13 at 5eb6a7948d)
 + builtin/submodule--helper.c: handle missing submodule URLs

 "git submodule" code trusted the data coming from the config (and
 the in-tree .gitmodules file) too much without validating, leading
 to NULL dereference if the user mucks with a repository (e.g.
 submodule.<name>.url is removed).  This has been corrected.

 Will merge to 'master'.
 source: <ae6cf3fa461b85e346f034371dae56a2790dfa20.1684957882.git.me@ttaylorr.com>


* jc/test-modernization-2 (2023-05-23) 10 commits
  (merged to 'next' on 2023-06-13 at e3ab8eea9a)
 + t9400-git-cvsserver-server: modernize test format
 + t9200-git-cvsexportcommit: modernize test format
 + t9104-git-svn-follow-parent: modernize test format
 + t9100-git-svn-basic: modernize test format
 + t7700-repack: modernize test format
 + t7600-merge: modernize test format
 + t7508-status: modernize test format
 + t7201-co: modernize test format
 + t7111-reset-table: modernize test format
 + t7110-reset-merge: modernize test format
 (this branch uses jc/test-modernization.)

 Test style updates.

 Will merge to 'master'.
 source: <pull.1514.git.git.1684599239.gitgitgadget@gmail.com>


* jt/path-filter-fix (2023-06-13) 4 commits
 - commit-graph: new filter ver. that fixes murmur3
 - repo-settings: introduce commitgraph.changedPathsVersion
 - t4216: test changed path filters with high bit paths
 - gitformat-commit-graph: describe version 2 of BDAT

 The Bloom filter used for path limited history traversal was broken
 on systems whose "char" is unsigned; update the implementation and
 bump the format version to 2.

 Will merge to 'next'?
 source: <cover.1686677910.git.jonathantanmy@google.com>


* tk/cherry-pick-sequence-requires-clean-worktree (2023-06-01) 1 commit
 - cherry-pick: refuse cherry-pick sequence if index is dirty

 "git cherry-pick A" that replays a single commit stopped before
 clobbering local modification, but "git cherry-pick A..B" did not,
 which has been corrected.

 Expecting a reroll.
 cf. <999f12b2-38d6-f446-e763-4985116ad37d@gmail.com>
 source: <pull.1535.v2.git.1685264889088.gitgitgadget@gmail.com>


* mh/credential-libsecret-attrs (2023-05-17) 1 commit
 - credential/libsecret: store new attributes

 The way authentication related data other than passwords (e.g.
 oath token and password expiration data) are stored in libsecret
 keyrings has been rethought.

 Needs review.
 source: <pull.1469.v4.git.git.1684306540947.gitgitgadget@gmail.com>


* ps/fetch-cleanups (2023-05-17) 9 commits
  (merged to 'next' on 2023-06-12 at d15d335893)
 + fetch: use `fetch_config` to store "submodule.fetchJobs" value
 + fetch: use `fetch_config` to store "fetch.parallel" value
 + fetch: use `fetch_config` to store "fetch.recurseSubmodules" value
 + fetch: use `fetch_config` to store "fetch.showForcedUpdates" value
 + fetch: use `fetch_config` to store "fetch.pruneTags" value
 + fetch: use `fetch_config` to store "fetch.prune" value
 + fetch: pass through `fetch_config` directly
 + fetch: drop unneeded NULL-check for `remote_ref`
 + fetch: drop unused DISPLAY_FORMAT_UNKNOWN enum value

 Code clean-up.

 Will merge to 'master'.
 cf. <20230519002128.GD2442034@coredump.intra.peff.net>
 source: <cover.1684324059.git.ps@pks.im>


* jc/test-modernization (2023-05-19) 20 commits
  (merged to 'next' on 2023-06-13 at a61e7b7248)
 + t7101-reset-empty-subdirs: modernize test format
 + t6050-replace: modernize test format
 + t5306-pack-nobase: modernize test format
 + t5303-pack-corruption-resilience: modernize test format
 + t5301-sliding-window: modernize test format
 + t5300-pack-object: modernize test format
 + t4206-log-follow-harder-copies: modernize test format
 + t4202-log: modernize test format
 + t4004-diff-rename-symlink: modernize test format
 + t4003-diff-rename-1: modernize test format
 + t4002-diff-basic: modernize test format
 + t3903-stash: modernize test format
 + t3700-add: modernize test format
 + t3500-cherry: modernize test format
 + t1006-cat-file: modernize test format
 + t1002-read-tree-m-u-2way: modernize test format
 + t1001-read-tree-m-2way: modernize test format
 + t3210-pack-refs: modernize test format
 + t0030-stripspace: modernize test format
 + t0000-basic: modernize test format
 (this branch is used by jc/test-modernization-2.)

 Will merge to 'master'.
 source: <pull.1513.git.git.1684440205.gitgitgadget@gmail.com>


* ja/worktree-orphan (2023-05-17) 8 commits
  (merged to 'next' on 2023-06-14 at 25d508496b)
 + worktree add: emit warn when there is a bad HEAD
 + worktree add: extend DWIM to infer --orphan
 + worktree add: introduce "try --orphan" hint
 + worktree add: add --orphan flag
 + t2400: add tests to verify --quiet
 + t2400: refactor "worktree add" opt exclusion tests
 + t2400: cleanup created worktree in test
 + worktree add: include -B in usage docs

 'git worktree add' learned how to create a worktree based on an
 orphaned branch with `--orphan`.

 Will merge to 'master'.
 source: <20230517214711.12467-1-jacobabel@nullpo.dev>


* tb/refs-exclusion-and-packed-refs (2023-06-12) 16 commits
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
 source: <cover.1686134440.git.me@ttaylorr.com>


* en/header-split-cache-h-part-3 (2023-05-16) 29 commits
  (merged to 'next' on 2023-06-13 at 56bcca52ac)
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
 + Merge branch 'en/header-split-cache-h-part-2' into en/header-split-cache-h-part-3

 Header files cleanup.

 Will merge to 'master'.
 source: <pull.1525.v3.git.1684218848.gitgitgadget@gmail.com>


* la/doc-interpret-trailers (2023-06-12) 9 commits
  (merged to 'next' on 2023-06-14 at 64a59e71b3)
 + doc: trailer: add more examples in DESCRIPTION
 + doc: trailer: mention 'key' in DESCRIPTION
 + doc: trailer.<token>.command: emphasize deprecation
 + doc: trailer: use angle brackets for <token> and <value>
 + doc: trailer: remove redundant phrasing
 + doc: trailer: examples: avoid the word "message" by itself
 + doc: trailer: drop "commit message part" phrasing
 + doc: trailer: swap verb order
 + doc: trailer: fix grammar

 Doc update.

 Will merge to 'master'.
 source: <pull.1506.v3.git.git.1686017304.gitgitgadget@gmail.com>


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


* tb/gc-recent-object-hook (2023-06-12) 2 commits
 - gc: introduce `gc.recentObjectsHook`
 - reachable.c: extract `obj_is_recent()`

 "git pack-objects" learned to invoke a new hook program that
 enumerates extra objects to be used as anchoring points to keep
 otherwise unreachable objects in cruft packs.

 Will merge to 'next'.
 source: <cover.1686178684.git.me@ttaylorr.com>


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
 source: <20230606194720.2053551-1-calvinwan@google.com>


* tl/notes-separator (2023-04-28) 6 commits
  (merged to 'next' on 2023-05-06 at 598ed19c9b)
 + notes.c: introduce "--[no-]stripspace" option
 + notes.c: append separator instead of insert by pos
 + notes.c: introduce '--separator=<paragraph-break>' option
 + t3321: add test cases about the notes stripspace behavior
 + notes.c: use designated initializers for clarity
 + notes.c: cleanup 'strbuf_grow' call in 'append_edit'
 (this branch is used by jc/notes-separator-fix.)

 'git notes append' was taught '--separator' to specify string to insert
 between paragraphs.

 Will merge to 'next' together with its fix-up.
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


* tb/pack-bitmap-traversal-with-boundary (2023-05-08) 3 commits
 + pack-bitmap.c: use commit boundary during bitmap traversal
 + pack-bitmap.c: extract `fill_in_bitmap()`
 + object: add object_array initializer helper function
 (this branch is used by ds/disable-replace-refs.)

 The object traversal using reachability bitmap done by
 "pack-object" has been tweaked to take advantage of the fact that
 using "boundary" commits as representative of all the uninteresting
 ones can save quite a lot of object enumeration.

 Will merge to 'next'.
 source: <cover.1683567065.git.me@ttaylorr.com>


* pb/complete-and-document-auto-merge-and-friends (2023-05-23) 6 commits
  (merged to 'next' on 2023-06-13 at 46ca10d88d)
 + completion: complete AUTO_MERGE
 + Documentation: document AUTO_MERGE
 + git-merge.txt: modernize word choice in "True merge" section
 + completion: complete REVERT_HEAD and BISECT_HEAD
 + revisions.txt: document more special refs
 + revisions.txt: use description list for special refs

 Document more pseudo-refs and teach the command line completion
 machinery to complete AUTO_MERGE.

 Will merge to 'master'.
 source: <pull.1515.v2.git.1684783741.gitgitgadget@gmail.com>


* mh/credential-password-expiry-libsecret (2023-05-05) 1 commit
  (merged to 'next' on 2023-05-09 at fd898e3756)
 + credential/libsecret: support password_expiry_utc

 The libsecret credential helper learns to handle the password
 expiry time information.

 On hold.
 The database gets littered with entries whose expiration dates only differ.
 cf. <CAGJzqskMwOJkriH6serqdwAVYi+fftEL8ohJd-suP6v+OxB_bg@mail.gmail.com>
 source: <pull.1469.v3.git.git.1683270298313.gitgitgadget@gmail.com>
