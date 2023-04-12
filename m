Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F451C77B6C
	for <git@archiver.kernel.org>; Wed, 12 Apr 2023 22:00:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbjDLWAE (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 12 Apr 2023 18:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjDLWAC (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 12 Apr 2023 18:00:02 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E933C2A
        for <git@vger.kernel.org>; Wed, 12 Apr 2023 14:59:58 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-517c01edaaaso662104a12.3
        for <git@vger.kernel.org>; Wed, 12 Apr 2023 14:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681336798; x=1683928798;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TwN3XRHM0uI3kGUcokliLGifr2Z56VB6rPqXOwDRNf4=;
        b=i4d4tP1JgiSTsxob7XN+Rt0tJP8IUoH0fwoKN2wqe8TTz6WFEmNcFN3yDHk6I2v/l7
         YSR1p6th5yr3wq1fECWDPtmtek04nyuRHTnJuUA2XHhPYZi0lJus1PbTu5WeMvkcPKmp
         hoAP+sp+3gaWzSwbXgWAmW4RlpLGLR442NnvC7/3B/TEDOLVZja3CaK3e9FqjoxZ0JuL
         mk7AbZb+XARdD+AV+VXsyU+8ykDx1lbUz2G+FKMB4wklQAder6GVAH2k9q0mpU2iQd0a
         o/dnwiiE//R6I/EAcAgT0gCQq0dDCeLAk/n5Y+4oNtI+vGdQNz1QmccbVboBl2FwlIK4
         Nddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681336798; x=1683928798;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TwN3XRHM0uI3kGUcokliLGifr2Z56VB6rPqXOwDRNf4=;
        b=IlUWdBKlC0932V5uPtP7F479LnXfhJnf75mXH5lumgi3DW8htKRPOQE1DmDW86YTEC
         Ck6Vd8UKB1Mt1otjRTZ9UPr0TD+p/m9gJ5hYEVl+wiQNrTUqhw7JngciDAFmDDpywopq
         DFrjFWqCVyCmNJNJUX5vEWlAyQGfASJSqMpWGW1+OJB1Rj7x8NVyGXaac8Av5LfEhKF7
         01HEmSCugYzMwgZoen3U/ydQuH2GMySck+mYdHndT1Y0v0EvunexEcEQ3U06Zt7NJCQC
         s+Ib8NdgO0jdPr+HaE7plSO0tVhH4XDVnrjwTxzWLB4XS9ktHHurDFcaYGwxuTMfFAZP
         aYaA==
X-Gm-Message-State: AAQBX9dFZ3XAGaoQ4s4ECXZIYGCy/hwigziW2BuGp90uGkahrE2lQdOy
        xDyWxSZcxuM88bzMiAg4FwbngQgZ4/M=
X-Google-Smtp-Source: AKy350YXOEMHw5sRawbEH1Gdevh04KtkXq78jNnjKcWw1hF9PBPyu8BbNPDrdel8NXhQ8FGiitXx7w==
X-Received: by 2002:a05:6a00:80b:b0:635:e719:43e2 with SMTP id m11-20020a056a00080b00b00635e71943e2mr466690pfk.15.1681336797422;
        Wed, 12 Apr 2023 14:59:57 -0700 (PDT)
Received: from localhost (254.80.82.34.bc.googleusercontent.com. [34.82.80.254])
        by smtp.gmail.com with ESMTPSA id i10-20020aa787ca000000b0063a3f41e5fbsm48pfo.129.2023.04.12.14.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 14:59:57 -0700 (PDT)
Sender: Junio C Hamano <jch2355@gmail.com>
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Apr 2023, #03; Tue, 11)
X-master-at: 9857273be005833c71e2d16ba48e193113e12276
X-next-at: 15816b0a8ae864e36a03af255e1d048f21d56b4d
Date:   Wed, 12 Apr 2023 14:59:56 -0700
Message-ID: <xmqqo7ns69sz.fsf@gitster.g>
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

* ar/adjust-tests-for-the-index-fallout (2023-03-31) 2 commits
  (merged to 'next' on 2023-04-06 at 8a9dfa25d4)
 + t2107: fix mention of the_index.cache_changed
 + t3060: fix mention of function prune_index

 Comment updates.
 source: <20230331143604.82040-2-rybak.a.v@gmail.com>


* dw/doc-submittingpatches-grammofix (2023-04-05) 1 commit
  (merged to 'next' on 2023-04-06 at 1c48670236)
 + SubmittingPatches: clarify MUA discussion with "the"

 Grammofix.
 source: <ZC0yey+S+OD/S2tt@trent-reznor>


* fc/doc-manpage-base-url-fix (2023-04-05) 1 commit
  (merged to 'next' on 2023-04-07 at c764614b80)
 + doc: remove manpage-base-url workaround

 Modernize manpage generation toolchain.
 source: <20230322000815.132128-1-felipe.contreras@gmail.com>


* jc/clone-object-format-from-void (2023-04-05) 1 commit
  (merged to 'next' on 2023-04-07 at 78eb68f3fa)
 + clone: propagate object-format when cloning from void

 "git clone" from an empty repository learned to propagate the
 choice of the hash algorithm from the source repository to the
 newly created repository.
 source: <xmqq355euj2i.fsf@gitster.g>


* jc/spell-id-in-both-caps-in-message-id (2023-04-03) 1 commit
  (merged to 'next' on 2023-04-06 at 17f4690220)
 + e-mail workflow: Message-ID is spelled with ID in both capital letters

 Consistently spell "Message-ID" as such, not "Message-Id".
 source: <xmqqsfhgnmqg.fsf@gitster.g>


* jk/use-perl-path-consistently (2023-04-06) 1 commit
  (merged to 'next' on 2023-04-07 at 3aa36fcb80)
 + t/lib-httpd: pass PERL_PATH to CGI scripts

 Tests had a few places where we ignored PERL_PATH and blindly used
 /usr/bin/perl, which have been corrected.
 source: <20230406093602.GD2215039@coredump.intra.peff.net>


* jx/cap-object-info-uninitialized-fix (2023-04-03) 1 commit
  (merged to 'next' on 2023-04-06 at 5a8b6068f3)
 + object-info: init request_info before reading arg

 Correct use of an uninitialized structure member.
 source: <20230402130557.17662-1-worldhello.net@gmail.com>


* ws/sparse-check-rules (2023-03-27) 2 commits
  (merged to 'next' on 2023-04-06 at 3fd16233c7)
 + builtin/sparse-checkout: add check-rules command
 + builtin/sparse-checkout: remove NEED_WORK_TREE flag

 "git sparse-checkout" command learns a debugging aid for the sparse
 rule definitions.
 source: <pull.1488.v2.git.1679903703.gitgitgadget@gmail.com>

--------------------------------------------------
[New Topics]

* la/mfc-markup-fix (2023-04-06) 1 commit
  (merged to 'next' on 2023-04-10 at 05415e1c90)
 + MyFirstContribution: render literal *

 Documentation mark-up fix.

 Will merge to 'master'.
 source: <pull.1510.git.1680661709616.gitgitgadget@gmail.com>


* ar/t2024-checkout-output-fix (2023-04-10) 1 commit
 - t2024: fix loose/strict local base branch DWIM test

 Test fix.

 Will merge to 'next'.
 source: <20230408205450.569548-1-rybak.a.v@gmail.com>


* fc/doc-stop-using-manversion (2023-04-10) 1 commit
 - doc: simplify man version

 Doc build simplification.

 Will merge to 'next'?
 source: <20230408001829.11031-1-felipe.contreras@gmail.com>


* rn/sparse-diff-index (2023-04-10) 1 commit
 - diff-index: enable sparse index

 "git diff-index" command has been taught to work better with the
 sparse index.

 Comments?
 source: <20230408112342.404318-1-nanth.raghul@gmail.com>


* rs/get-tar-commit-id-use-defined-const (2023-04-10) 1 commit
 - get-tar-commit-id: use TYPEFLAG_GLOBAL_HEADER instead of magic value

 Code clean-up to replace a hardcoded constant with a CPP macro.

 Will merge to 'next'.
 source: <79497392-0296-2ae3-2560-1f90c1a309b5@web.de>


* rs/remove-approxidate-relative (2023-04-10) 1 commit
 - date: remove approxidate_relative()

 The approxidate() API has been simplified by losing an extra
 function that did the same thing as another one.

 Will merge to 'next'.
 source: <f5b9a290-7cec-7a83-660b-e15494d2cdc8@web.de>


* rs/userdiff-multibyte-regex (2023-04-07) 1 commit
 - userdiff: support regexec(3) with multi-byte support

 The userdiff regexp patterns for various filetypes that are built
 into the system have been updated to avoid triggering regexp errors
 from UTF-8 aware regex engines.

 Will merge to 'next'.
 source: <7327ac06-d5da-ec53-543e-78e7729e78bb@web.de>


* es/recurse-submodules-option-is-a-bool (2023-04-10) 1 commit
 - usage: clarify --recurse-submodules as a boolean

 The "--[no-]recurse-submodules" option of "git checkout" and others
 supported an undocumented syntax --recurse-submodules=<value> where
 the value can spell a Boolean in various ways.  The support for the
 syntax is being dropped.

 Comments?
 source: <ZDSTFwMFO7vbj/du@google.com>


* gc/better-error-when-local-clone-fails-with-symlink (2023-04-11) 1 commit
 - clone: error specifically with --local and symlinked objects

 "git clone --local" stops copying from an original repository that
 has symbolic links inside its $GIT_DIR; an error message when that
 happens has been updated.

 Will merge to 'next'.
 source: <pull.1488.v2.git.git.1681165130765.gitgitgadget@gmail.com>

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


* tl/notes-separator (2023-03-28) 4 commits
 . notes.c: don't do stripespace when parse file arg
 . notes.c: introduce '--separator=<paragraph-break>' option
 . notes.c: use designated initializers for clarity
 . notes.c: cleanup 'strbuf_grow' call in 'append_edit'

 'git notes append' was taught '--separator' to specify string to insert
 between paragraphs.

 Seems to break CI.
 cf. <xmqqy1nf8c0f.fsf@gitster.g>
 source: <cover.1680012650.git.dyroneteng@gmail.com>


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

 May want to discard.  Breaking compatibility does not seem worth it.
 source: <20221217132955.108542-1-sorganov@gmail.com>

--------------------------------------------------
[Cooking]

* rj/sendemail-validate-series-hook (2023-04-05) 1 commit
 - hooks: add sendemail-validate-series

 "git send-email" learns a new hook that takes the entire set of
 patch files from its standard input to validate them in one go,
 instead of getting called once per each file.

 Comments?
 source: <20230405231305.96996-1-robin@jarry.cc>


* tk/mergetool-gui-default-config (2023-04-05) 1 commit
  (merged to 'next' on 2023-04-10 at 228432526c)
 + mergetool: new config guiDefault supports auto-toggling gui by DISPLAY

 "git mergetool" and "git difftool" learns a new configuration
 guiDefault to optionally favor configured guitool over non-gui-tool
 automatically when $DISPLAY is set.

 Will merge to 'master'.
 source: <pull.1381.v4.git.1679153263217.gitgitgadget@gmail.com>


* cm/branch-delete-error-message-update (2023-04-06) 1 commit
  (merged to 'next' on 2023-04-10 at 09c987c822)
 + branch: improve error log on branch not found by checking remotes refs

 "git branch -d origin/master" would say "no such branch", but it is
 likely a missed "-r" if refs/remotes/origin/master exists.  The
 command has been taught to give such a hint in its error message.

 Will merge to 'master'.
 source: <pull.1476.v3.git.git.1680695000257.gitgitgadget@gmail.com>


* fc/remove-header-workarounds-for-asciidoc (2023-04-05) 1 commit
  (merged to 'next' on 2023-04-10 at f08eab44f2)
 + doc: asciidoc: remove custom header macro

 Doc toolchain update to remove old workaround for AsciiDoc.

 Will merge to 'master'.
 source: <20230323221523.52472-1-felipe.contreras@gmail.com>


* ow/ref-filter-omit-empty (2023-04-07) 1 commit
 - branch, for-each-ref, tag: add option to omit empty lines

 "git branch --format=..." and "git format-patch --format=..."
 learns "--omit-empty" to hide refs that whose formatting result
 becomes an empty string from the output.

 Will merge to 'next'?
 source: <20230407175316.6404-1-oystwa@gmail.com>


* rn/sparse-describe (2023-04-03) 1 commit
 - describe: enable sparse index for describe

 "git describe --dirty" learns to work better with sparse-index.

 Will merge to 'next'?
 source: <20230403164749.246001-1-nanth.raghul@gmail.com>


* ah/format-patch-thread-doc (2023-04-03) 1 commit
 - format-patch: correct documentation of --thread without an argument

 Doc update.
 source: <20230403040724.642513-1-alexhenrie24@gmail.com>


* ar/test-cleanup-unused-file-creation-part2 (2023-04-03) 6 commits
 - t2019: don't create unused files
 - t1502: don't create unused files
 - t1450: don't create unused files
 - t1300: don't create unused files
 - t1300: fix config file syntax error descriptions
 - t0300: don't create unused file

 Test cleanup.

 Will merge to 'next'?
 source: <20230403223338.468025-1-rybak.a.v@gmail.com>


* en/header-split-cache-h (2023-04-11) 24 commits
 - mailmap, quote: move declarations of global vars to correct unit
 - treewide: reduce includes of cache.h in other headers
 - treewide: remove double forward declaration of read_in_full
 - cache.h: remove unnecessary includes
 - treewide: remove cache.h inclusion due to pager.h changes
 - pager.h: move declarations for pager.c functions from cache.h
 - treewide: remove cache.h inclusion due to editor.h changes
 - editor: move editor-related functions and declarations into common file
 - treewide: remove cache.h inclusion due to object.h changes
 - object.h: move some inline functions and defines from cache.h
 - treewide: remove cache.h inclusion due to object-file.h changes
 - object-file.h: move declarations for object-file.c functions from cache.h
 - treewide: remove cache.h inclusion due to git-zlib changes
 - git-zlib: move declarations for git-zlib functions from cache.h
 - treewide: remove cache.h inclusion due to object-name.h changes
 - object-name.h: move declarations for object-name.c functions from cache.h
 - treewide: remove unnecessary cache.h inclusion
 - treewide: be explicit about dependence on mem-pool.h
 - treewide: be explicit about dependence on oid-array.h
 - treewide: be explicit about dependence on pack-revindex.h
 - treewide: be explicit about dependence on convert.h
 - treewide: be explicit about dependence on advice.h
 - treewide: be explicit about dependence on trace.h & trace2.h
 - Merge branch 'ab/remove-implicit-use-of-the-repository' into en/header-split-cache-h

 Header clean-up.

 Will merge to 'next'.
 source: <pull.1509.v3.git.1681182060.gitgitgadget@gmail.com>


* sl/sparse-write-tree (2023-04-04) 1 commit
  (merged to 'next' on 2023-04-10 at 0cd39c23b1)
 + write-tree: integrate with sparse index

 "git write-tree" learns to work better with sparse-index.

 Will merge to 'master'.
 source: <20230404003539.1578245-1-cheskaqiqi@gmail.com>


* ed/fsmonitor-windows-named-pipe (2023-03-24) 1 commit
 - fsmonitor: handle differences between Windows named pipe functions

 Fix fsmonitor on Windows when the filesystem path contains certain
 characters.

 Expecting a reroll.
 cf. <b9cf67e4-22a7-2ff0-8310-9223bea10d6d@jeffhostetler.com>
 source: <pull.1503.git.1679678090412.gitgitgadget@gmail.com>


* mh/credential-password-expiry-wincred (2023-04-03) 1 commit
 - credential/wincred: store password_expiry_utc

 Teach the recently invented "password expiry time" trait to the
 wincred credential helper.

 Will merge to 'next'?
 source: <pull.1477.v3.git.git.1680508028077.gitgitgadget@gmail.com>


* mh/use-wincred-from-system (2023-03-27) 1 commit
 - credential/wincred: include wincred.h

 Code clean-up.

 Area maintainer is fairly negative.  Perhaps drop?
 cf. <8511e030-8167-715c-5ed4-1646e6e9ef85@gmx.de>
 source: <pull.1496.git.1679707396407.gitgitgadget@gmail.com>


* ob/revert-of-revert (2023-03-28) 1 commit
 - sequencer: call a revert of a revert "reapply"

 Instead of "Revert "Revert "original"", give "Replay "original""
 as the title for a revert of a revert.

 Needs more polishing: docs, tests, transitions.
 source: <20230323162234.995465-1-oswald.buddenhagen@gmx.de>


* pw/sequencer-rescheduled-ones-are-not-done-yet (2023-03-20) 1 commit
 - rebase -i: do not update "done" when rescheduling command

 "rebase -i" moved a "rescheduled" insn in the todo file to the
 "done" list before it completed, which has been corrected.

 Expecting clarification.
 source: <pull.1492.git.1679237337683.gitgitgadget@gmail.com>


* rs/archive-from-subdirectory-fixes (2023-03-24) 1 commit
 - archive: improve support for running in subdirectory

 "git archive" run from a subdirectory mishandled attributes and
 paths outside the current directory.
 source: <7c33b01b-7b2a-25fa-9a66-1e65cd12bc84@web.de>


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


* mh/credential-password-expiry-libsecret (2023-03-27) 1 commit
 - credential/libsecret: support password_expiry_utc

 The libsecret credential helper learns to handle the password
 expiry time information.

 Needs Review.
 source: <pull.1469.v2.git.git.1679729764851.gitgitgadget@gmail.com>


* pw/rebase-cleanup-merge-strategy-option-handling (2023-04-10) 5 commits
  (merged to 'next' on 2023-04-11 at a3b1fd5ec7)
 + rebase: remove a couple of redundant strategy tests
 + rebase -m: fix serialization of strategy options
 + rebase -m: cleanup --strategy-option handling
 + sequencer: use struct strvec to store merge strategy options
 + rebase: stop reading and writing unnecessary strategy state

 Clean-up of the code path that deals with merge strategy option
 handling in "git rebase".

 Will merge to 'master'.
 source: <cover.1681117706.git.phillip.wood@dunelm.org.uk>


* sl/diff-files-sparse (2023-03-22) 2 commits
 - diff-files: integrate with sparse index
 - t1092: add tests for `git diff-files`

 Teach "diff-files" not to expand sparse-index unless needed.

 Comments?
 source: <20230322161820.3609-1-cheskaqiqi@gmail.com>


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


* rj/branch-unborn-in-other-worktrees (2023-03-27) 5 commits
 - branch: avoid unnecessary worktrees traversals
 - branch: rename orphan branches in any worktree
 - branch: description for orphan branch errors
 - branch: use get_worktrees() in copy_or_rename_branch()
 - branch: test for failures while renaming branches

 Error messages given when working on an unborn branch that is
 checked out in another worktree have been improved.

 Kicked out of 'next' to replace with an updated version.
 source: <f8e6447e-5cd3-98fa-f567-39e1c60dacb0@gmail.com>


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


* cb/checkout-same-branch-twice (2023-03-22) 2 commits
 - SQUASH??? the test marked to expect failure passes from day one
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

 Expecting a reroll.
 cf. <CAFySSZDk05m6gU5-V1R+y3YnQ5PPduVW54+_gjBwD0rmacsLsw@mail.gmail.com>
 cf. <230307.865ybc273g.gmgdl@evledraar.gmail.com>
 source: <20230302215237.1473444-1-calvinwan@google.com>
