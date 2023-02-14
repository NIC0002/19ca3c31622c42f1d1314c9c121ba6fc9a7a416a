Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31906C05027
	for <git@archiver.kernel.org>; Tue, 14 Feb 2023 18:05:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233245AbjBNSFc (ORCPT <rfc822;git@archiver.kernel.org>);
        Tue, 14 Feb 2023 13:05:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233256AbjBNSF1 (ORCPT <rfc822;git@vger.kernel.org>);
        Tue, 14 Feb 2023 13:05:27 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367EC2E80A
        for <git@vger.kernel.org>; Tue, 14 Feb 2023 10:05:21 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id k13so17908155plg.0
        for <git@vger.kernel.org>; Tue, 14 Feb 2023 10:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qZCXBtP2umx8ey6QoxLsWnk2aSb42nLa3JIGWn0n9Sw=;
        b=SCvUtDx5b6OfOBNkVysdw78j4SZkaCJdgukuSzt9xp5cDDRFRGp4Gru27zfcCtKcBo
         z9FceLIjvA8IW+kkzzV26MplpEcNMT94YzKA5sZXv65AkP2r0VB4Mwrx5nSAepAsSqqw
         aeJHXKP2JDr1ox4RwOG9x8igfOHR77xfdZapOPJoFl85MEwaa+XwMuNGMwxpuA9tMF3s
         BDkkl/NKSXwRM0+lRb6I9h5psABSe9QlInEfa+U9enjuyT9PMLVYzdsz//Oj4HGa80Yu
         myr7IcHEQkasdwrkMI1zc3GUFMPpYtsb31JGVLRZF/JtIGfPPkFAO9SyhJVIJ0Id4Sl7
         7DoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qZCXBtP2umx8ey6QoxLsWnk2aSb42nLa3JIGWn0n9Sw=;
        b=pRYq0XjQPMEl/GIMR1cW1qMJbdt6/MgIFerm83/iotgIpL34bHRARPBMgt9kbF9Yye
         YbMwKxW2n79AMuvWQ3D62eRwFNo9e9H87y3ALKySoosdC7XQYGnMCdii1o9uFJH+pMAp
         I0yrbVVxD9dmfZA8lOSlo42OJ/jw0stRoYue/3+F5KzyQK1z2jPlG8mJZ5MvkXi94HQd
         6U24YRE9GZAXd14ERSXgW5gav01m/AAyVrBQ2tqI2fDlqRxEFgorD9OIeAOjeoLVDitI
         6D3KIpauTWONg7ATUQFAGVhM2oCEqxj8TyO0FOnywpo4ElBO1TdU6CeD7ZAsX7Avqv/y
         u+eg==
X-Gm-Message-State: AO0yUKXpQzwdiI1C6TQXz3YO5Cb5pXSOyoKSiErGQgBNIWyzC/Zqh0Pl
        vQS5ckGKPoGXvL2XzW/rVxLv0x4iR/Q=
X-Google-Smtp-Source: AK7set+GvYYBhGL45+XGPZu2+PCYXkEDeDDLqRIQmb+8/gT8RtlEQbq782/qBlSl1Jm36Np947NeaQ==
X-Received: by 2002:a05:6a20:914a:b0:bf:75a2:e454 with SMTP id x10-20020a056a20914a00b000bf75a2e454mr3899091pzc.2.1676397919858;
        Tue, 14 Feb 2023 10:05:19 -0800 (PST)
Received: from localhost (252.157.168.34.bc.googleusercontent.com. [34.168.157.252])
        by smtp.gmail.com with ESMTPSA id t1-20020a63b701000000b004fb5704f19bsm7804789pgf.31.2023.02.14.10.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 10:05:19 -0800 (PST)
Sender: Junio C Hamano <jch2355@gmail.com>
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Feb 2023, #03; Tue, 14)
X-master-at: c867e4fa180bec4750e9b54eb10f459030dbebfd
X-next-at: 0c349d5c3e2f4fa3283bdb20107953df3ec27116
Date:   Tue, 14 Feb 2023 10:05:19 -0800
Message-ID: <xmqqk00k5di8.fsf@gitster.g>
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

There are security releases, ranging from 2.30.8 to 2.39.2.  The
fixes in these releases have already been integrated to the 'master'
branch as well.

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

* ab/the-index-compatibility (2023-02-10) 6 commits
  (merged to 'next' on 2023-02-13 at 4f9869d4cf)
 + cocci & cache.h: remove "USE_THE_INDEX_COMPATIBILITY_MACROS"
 + cache-tree API: remove redundant update_main_cache_tree()
 + cocci & cache-tree.h: migrate "write_cache_as_tree" to "*_index_*"
 + cocci & cache.h: apply pending "index_cache_pos" rule
 + cocci & cache.h: fully apply "active_nr" part of index-compatibility
 + builtin/rm.c: use narrower "USE_THE_INDEX_VARIABLE"

 Remove more remaining uses of macros that relies on the_index
 singleton instance without explicitly spelling it out.

 Will merge to 'master'.
 source: <cover-v2-0.6-00000000000-20230210T102114Z-avarab@gmail.com>


* rs/cache-tree-strbuf-growth-fix (2023-02-10) 1 commit
  (merged to 'next' on 2023-02-13 at fd9ae8790b)
 + cache-tree: fix strbuf growth in prime_cache_tree_rec()

 Remove unnecessary explicit sizing of strbuf.

 Will merge to 'master'.
 source: <a37623c8-d2fb-aec6-3423-2d402d717959@web.de>


* jk/doc-ls-remote-matching (2023-02-10) 2 commits
  (merged to 'next' on 2023-02-13 at 79a209bcb3)
 + doc/ls-remote: clarify pattern format
 + doc/ls-remote: cosmetic cleanups for examples

 Doc update.

 Will merge to 'master'.
 source: <Y+cAdZTs5y0yiTkM@coredump.intra.peff.net>


* ew/commit-reach-clean-up-flags-fix (2023-02-11) 1 commit
 - commit-reach: avoid NULL dereference

 Under discussion.
 cf. <876cf920-113a-90cf-f49e-6e1b7b146acf@github.com>
 source: <20230211111526.2028178-1-e@80x24.org>


* rs/ctype-test (2023-02-13) 3 commits
 - test-ctype: test iscntrl, ispunct, isxdigit and isprint
 - test-ctype: test islower and isupper
 - test-ctype: test isascii

 Test safe_ctype

 Will merge to 'next'.
 source: <81eee04b-598e-dfe1-f954-3105bcbcb2f2@web.de>


* mh/credential-password-expiry (2023-02-13) 1 commit
 . credential: new attribute password_expiry_utc

 Seems to break CI only on Windows?
 cf. https://github.com/git/git/actions/runs/4169057114/jobs/7217377625
 source: <pull.1443.v3.git.git.1675545372271.gitgitgadget@gmail.com>


* tk/pull-conflict-suggest-rebase-merge-not-rebase-true (2023-02-13) 1 commit
 - pull: conflict hint pull.rebase suggestion should offer "merges" vs "true"

 In an advice message after failed non-ff pull, we used to suggest
 setting pull.rebase=true, but these days pull.rebase=merges may be
 more inline with the original spirit of "rebuild your side on top
 of theirs".

 source: <pull.1474.git.1675614276549.gitgitgadget@gmail.com>

--------------------------------------------------
[Stalled]

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


* tl/notes--blankline (2022-11-09) 5 commits
 - notes.c: introduce "--no-blank-line" option
 - notes.c: provide tips when target and append note are both empty
 - notes.c: drop unreachable code in 'append_edit()'
 - notes.c: cleanup for "designated init" and "char ptr init"
 - notes.c: cleanup 'strbuf_grow' call in 'append_edit'

 'git notes append' was taught '--[no-]blank-line' to conditionally
 add a LF between a new and existing note.

 Expecting a reroll.
 cf. <CAPig+cRcezSp4Rqt1Y9bD-FT6+7b0g9qHfbGRx65AOnw2FQXKg@mail.gmail.com>
 source: <cover.1667980450.git.dyroneteng@gmail.com>


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


* ed/fsmonitor-inotify (2022-12-13) 6 commits
 - fsmonitor: update doc for Linux
 - fsmonitor: test updates
 - fsmonitor: enable fsmonitor for Linux
 - fsmonitor: implement filesystem change listener for Linux
 - fsmonitor: determine if filesystem is local or remote
 - fsmonitor: prepare to share code between Mac OS and Linux

 Bundled fsmonitor for Linux using inotify API.

 Needs review on the updated round.
 source: <pull.1352.v5.git.git.1670882286.gitgitgadget@gmail.com>


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

* ab/config-h-remove-unused (2023-02-07) 1 commit
  (merged to 'next' on 2023-02-09 at fa83258b81)
 + config.h: remove unused git_configset_add_parameters()

 Code clean-up.

 Will merge to 'master'.
 source: <patch-1.1-31f4a08c068-20230207T161453Z-avarab@gmail.com>


* ab/retire-scripted-add-p (2023-02-06) 3 commits
  (merged to 'next' on 2023-02-09 at 1b8c7bce7d)
 + docs & comments: replace mentions of "git-add--interactive.perl"
 + add API: remove run_add_interactive() wrapper function
 + add: remove "add.interactive.useBuiltin" & Perl "git add--interactive"

 Finally retire the scripted "git add -p/-i" implementation and have
 everybody use the one reimplemented in C.

 Will merge to 'master'.
 source: <cover-v2-0.3-00000000000-20230206T225639Z-avarab@gmail.com>


* ar/userdiff-java-update (2023-02-08) 3 commits
  (merged to 'next' on 2023-02-09 at f62497382a)
 + userdiff: support Java sealed classes
 + userdiff: support Java record types
 + userdiff: support Java type parameters

 Userdiff regexp update for Java language.

 Will merge to 'master'.
 source: <20230207234259.452141-1-rybak.a.v@gmail.com>


* cw/doc-pushurl-vs-url (2023-02-07) 1 commit
  (merged to 'next' on 2023-02-09 at 21b0678d19)
 + Documentation: clarify multiple pushurls vs urls

 Doc update.

 Will merge to 'master'.
 source: <20230207181227.361290-1-calvinwan@google.com>


* en/name-rev-make-taggerdate-much-less-important (2023-02-09) 1 commit
  (merged to 'next' on 2023-02-10 at 059bc956aa)
 + name-rev: fix names by dropping taggerdate workaround

 "git name-rev" heuristics update.

 Will merge to 'master'.
 source: <pull.1468.v3.git.1675933906906.gitgitgadget@gmail.com>


* kf/t5000-modernise (2023-02-06) 1 commit
  (merged to 'next' on 2023-02-09 at 0341c54639)
 + t5000: modernise archive and :(glob) test

 Test clean-up.

 Will merge to 'master'.
 source: <20230204204124.80741-1-kostya.farber@gmail.com>


* po/attributes-text (2023-02-06) 1 commit
  (merged to 'next' on 2023-02-09 at 8be7b134da)
 + .gitattributes: include `text` attribute for eol attributes

 In-tree .gitattributes update to match the way we recommend our
 users to mark a file as text.

 Will merge to 'master'.
 source: <20230203125920.751-1-philipoakley@iee.email>


* rs/size-t-fixes (2023-02-06) 2 commits
  (merged to 'next' on 2023-02-09 at 4bf6998479)
 + pack-objects: use strcspn(3) in name_cmp_len()
 + read-cache: use size_t for {base,df}_name_compare()

 Type fixes.

 Will merge to 'master'.
 source: <7315487c-c97c-b8a2-d3b2-4fbf642495dd@web.de>


* wl/new-command-doc (2023-02-06) 1 commit
  (merged to 'next' on 2023-02-09 at 23bcd4d4d9)
 + new-command.txt: update reference to builtin docs

 Comment fix.

 Will merge to 'master'.
 source: <pull.1451.git.git.1675477659972.gitgitgadget@gmail.com>


* jc/gpg-lazy-init (2023-02-09) 1 commit
 - gpg-interface: lazily initialize and read the configuration

 Instead of forcing each command to choose to honor GPG related
 configuration variables, make the subsystem lazily initialize
 itself.
 source: <xmqqpmaimvtd.fsf_-_@gitster.g>


* mc/credential-helper-www-authenticate (2023-02-08) 3 commits
 - credential: add WWW-Authenticate header to cred requests
 - http: read HTTP WWW-Authenticate response headers
 - t5563: add tests for basic and anoymous HTTP access

 Allow information carried on the WWW-AUthenticate header to be
 passed to the credential helpers.

 Expecting a (hopefully minor and final) reroll.
 cf. <9012b8a3-4abe-d3c6-41ee-f28931869ad7@github.com>
 source: <pull.1352.v8.git.1675711789.gitgitgadget@gmail.com>


* ab/avoid-losing-exit-codes-in-tests (2023-02-06) 6 commits
 - tests: don't lose misc "git" exit codes
 - tests: don't lose exit status with "test <op> $(git ...)"
 - tests: don't lose "git" exit codes in "! ( git ... | grep )"
 - tests: don't lose exit status with "(cd ...; test <op> $(git ...))"
 - t/lib-patch-mode.sh: fix ignored exit codes
 - auto-crlf tests: don't lose exit code in loops and outside tests

 Test clean-up.
 source: <cover-v5-0.6-00000000000-20230206T224200Z-avarab@gmail.com>


* rj/branch-unborn-in-other-worktrees (2023-02-06) 3 commits
 - branch: rename orphan branches in any worktree
 - branch: description for orphan branch errors
 - branch: avoid unnecessary worktrees traversals

 Error messages given when working on an unborn branch that is
 checked out in another worktree have been improvved.

 cf. <230207.86cz6l501v.gmgdl@evledraar.gmail.com>
 source: <2193a4ed-b263-068e-92f8-847dcb053f8c@gmail.com>


* ab/imap-send-requires-curl (2023-02-02) 6 commits
 - imap-send: correctly report "host" when using "tunnel"
 - imap-send: remove old --no-curl codepath
 - imap-send: make --curl no-optional
 - imap-send: replace auto-probe libcurl with hard dependency
 - imap-send doc: the imap.sslVerify is used with imap.tunnel
 - imap-send: note "auth_method", not "host" on auth method failure

 Give a hard dependency on cURL library to build "git imap-send",
 and remove the code to interact with IMAP server without using cURL.

 The 'tunnel' part is still iffy.
 cf. <230203.86bkmabfjr.gmgdl@evledraar.gmail.com>
 source: <cover-v2-0.6-00000000000-20230202T093706Z-avarab@gmail.com>


* rd/doc-default-date-format (2023-02-01) 1 commit
 - rev-list: clarify git-log default date format

 Update --date=default documentation.
 source: <20230201155712.86577-1-rafael@dulfer.be>


* ab/config-multi-and-nonbool (2023-02-07) 10 commits
 - for-each-repo: with bad config, don't conflate <path> and <cmd>
 - config API: add "string" version of *_value_multi(), fix segfaults
 - config API users: test for *_get_value_multi() segfaults
 - for-each-repo: error on bad --config
 - config API: don't lose the git_*get*() return values
 - config API: have *_multi() return an "int" and take a "dest"
 - versioncmp.c: refactor config reading next commit
 - config API: add and use a "git_config_get()" family of functions
 - config tests: add "NULL" tests for *_get_value_multi()
 - config tests: cover blind spots in git_die_config() tests

 Assorted config API updates.
 source: <cover-v5-00.10-00000000000-20230207T154000Z-avarab@gmail.com>


* ab/hook-api-with-stdin (2023-02-08) 5 commits
  (merged to 'next' on 2023-02-13 at 4cb74ecb6b)
 + hook: support a --to-stdin=<path> option
 + sequencer: use the new hook API for the simpler "post-rewrite" call
 + hook API: support passing stdin to hooks, convert am's 'post-rewrite'
 + run-command: allow stdin for run_processes_parallel
 + run-command.c: remove dead assignment in while-loop

 Extend the run-hooks API to allow feeding data from the standard
 input when running the hook script(s).

 Will merge to 'master'.
 source: <cover-v2-0.5-00000000000-20230208T191924Z-avarab@gmail.com>


* cb/grep-fallback-failing-jit (2023-01-31) 1 commit
  (merged to 'next' on 2023-02-08 at 3a70d6ef6c)
 + grep: fall back to interpreter if JIT memory allocation fails

 In an environment where dynamically generated code is prohibited to
 run (e.g. SELinux), failure to JIT pcre patterns is expected.  Fall
 back to interpreted execution in such a case.

 Will merge to 'master'.
 source: <20230131185611.520311-1-minipli@grsecurity.net>


* cb/checkout-same-branch-twice (2023-01-20) 1 commit
 - checkout/switch: disallow checking out same branch in multiple worktrees

 "git checkout -B $branch" failed to protect against checking out
 a branch that is checked out elsewhere, unlike "git branch -f" did.

 Expecting a hopefully minor and final reroll.
 cf. <8f24fc3c-c30f-dc70-5a94-5ee4ed3de102@dunelm.org.uk>
 source: <20230120113553.24655-1-carenas@gmail.com>


* ab/sequencer-unleak (2023-02-06) 8 commits
  (merged to 'next' on 2023-02-09 at 98bff1953f)
 + commit.c: free() revs.commit in get_fork_point()
 + builtin/rebase.c: free() "options.strategy_opts"
 + sequencer.c: always free() the "msgbuf" in do_pick_commit()
 + builtin/rebase.c: fix "options.onto_name" leak
 + builtin/revert.c: move free-ing of "revs" to replay_opts_release()
 + sequencer API users: fix get_replay_opts() leaks
 + sequencer.c: split up sequencer_remove_state()
 + rebase: use "cleanup" pattern in do_interactive_rebase()

 Plug leaks in sequencer subsystem and its users.

 Will merge to 'master'.
 source: <cover-v4-0.8-00000000000-20230206T190346Z-avarab@gmail.com>


* rj/avoid-switching-to-already-used-branch (2023-01-22) 3 commits
 - switch: reject if the branch is already checked out elsewhere (test)
 - rebase: refuse to switch to a branch already checked out elsewhere (test)
 - branch: fix die_if_checked_out() when ignore_current_worktree

 A few subcommands have been taught to stop users from working on a
 branch that is being used in another worktree linked to the same
 repository.

 Expecting a hopefully minor and final reroll.
 cf. <d61a2393-64c8-da49-fe13-00bc4a52d5e3@gmail.com>
 source: <f7f45f54-9261-45ea-3399-8ba8dee6832b@gmail.com>


* rj/bisect-already-used-branch (2023-01-22) 1 commit
 - bisect: fix "reset" when branch is checked out elsewhere

 Allow "git bisect reset [name]" to check out the named branch (or
 the original one) even when the branch is already checked out in a
 different worktree linked to the same repository.

 Leaning negative. Why is it a good thing?
 cf. <xmqqo7qqovp1.fsf@gitster.g>
 source: <1c36c334-9f10-3859-c92f-3d889e226769@gmail.com>


* ms/send-email-feed-header-to-validate-hook (2023-01-19) 2 commits
 - send-email: expose header information to git-send-email's sendemail-validate hook
 - send-email: refactor header generation functions

 "git send-email" learned to give the e-mail headers to the validate
 hook by passing an extra argument from the command line.

 Expecting a hopefully minor and final reroll.
 cf. <c1ba0a28-3c39-b313-2757-dceb02930334@amd.com>
 source: <20230120012459.920932-1-michael.strawbridge@amd.com>


* ds/bundle-uri-5 (2023-01-31) 11 commits
  (merged to 'next' on 2023-02-08 at 1ba9ba565d)
 + bundle-uri: test missing bundles with heuristic
 + bundle-uri: store fetch.bundleCreationToken
 + fetch: fetch from an external bundle URI
 + bundle-uri: drop bundle.flag from design doc
 + clone: set fetch.bundleURI if appropriate
 + bundle-uri: download in creationToken order
 + bundle-uri: parse bundle.<id>.creationToken values
 + bundle-uri: parse bundle.heuristic=creationToken
 + t5558: add tests for creationToken heuristic
 + bundle: verify using check_connected()
 + bundle: test unbundling with incomplete history

 The bundle-URI subsystem adds support for creation-token heuristics
 to help incremental fetches.

 Will merge to 'master'.
 source: <pull.1454.v3.git.1675171759.gitgitgadget@gmail.com>


* tc/cat-file-z-use-cquote (2023-01-16) 1 commit
 - cat-file: quote-format name in error when using -z

 "cat-file" in the batch mode that is fed NUL-terminated pathnames
 learned to cquote them in its error output (otherwise, a funny
 pathname with LF in it would break the lines in the output stream).

 Expecting a reroll.
 cf. <2a2a46f0-a9bc-06a6-72e1-28800518777c@dunelm.org.uk>
 source: <20230116190749.4141516-1-toon@iotcl.com>


* cw/submodule-status-in-parallel (2023-02-09) 6 commits
 - diff-lib: parallelize run_diff_files for submodules
 - diff-lib: refactor out diff_change logic
 - submodule: refactor is_submodule_modified()
 - submodule: move status parsing into function
 - submodule: strbuf variable rename
 - run-command: add duplicate_output_fn to run_processes_parallel_opts

 "git submodule status" learned to run the comparison in submodule
 repositories in parallel.

 Not quite there yet...
 source: <20230209000212.1892457-1-calvinwan@google.com>


* ab/various-leak-fixes (2023-02-06) 19 commits
  (merged to 'next' on 2023-02-13 at 0cee9746f7)
 + push: free_refs() the "local_refs" in set_refspecs()
 + push: refactor refspec_append_mapped() for subsequent leak-fix
 + receive-pack: release the linked "struct command *" list
 + grep API: plug memory leaks by freeing "header_list"
 + grep.c: refactor free_grep_patterns()
 + builtin/merge.c: free "&buf" on "Your local changes..." error
 + builtin/merge.c: use fixed strings, not "strbuf", fix leak
 + show-branch: free() allocated "head" before return
 + commit-graph: fix a parse_options_concat() leak
 + http-backend.c: fix cmd_main() memory leak, refactor reg{exec,free}()
 + http-backend.c: fix "dir" and "cmd_arg" leaks in cmd_main()
 + worktree: fix a trivial leak in prune_worktrees()
 + repack: fix leaks on error with "goto cleanup"
 + name-rev: don't xstrdup() an already dup'd string
 + various: add missing clear_pathspec(), fix leaks
 + clone: use free() instead of UNLEAK()
 + commit-graph: use free_commit_graph() instead of UNLEAK()
 + bundle.c: don't leak the "args" in the "struct child_process"
 + tests: mark tests as passing with SANITIZE=leak

 Leak fixes.

 Will merge to 'master'.
 source: <cover-v7-00.19-00000000000-20230206T230141Z-avarab@gmail.com>

--------------------------------------------------
[Discarded]

* mc/switch-advice (2022-11-09) 1 commit
 . po: use `switch` over `checkout` in error message

 Use 'switch' instead of 'checkout' in an error message.

 Will discard.
 Getting tired of waiting for review response.


* js/range-diff-mbox (2022-11-23) 1 commit
 . range-diff: support reading mbox files

 'git range-diff' gained support for reading either side from an .mbox
 file instead of a revision range.

 Will discard.
 Getting tired of waiting for review response.
 cf. <xmqqr0xupmnf.fsf@gitster.g>
 source: <pull.1420.v3.git.1669108102092.gitgitgadget@gmail.com>


* jc/test-prereq-symlink-update (2023-02-09) 1 commit
 . test: make SYMLINKS prerequisite more robust

 For some reason, "ln -s x y && test -h y" started passing on
 Windows, even though we do not have working readlink(3) there.
 Tighten the check to enable SYMLINKS prerequisite in our tests.

 It turns out that this was caused by using a faulty build of the
 Windows dev environment, which was fixed.
 source: <xmqqwn4sq73f.fsf@gitster.g>


* jc/t5559-workaround (2023-02-09) 1 commit
 . t5559: skip a known-to-be-broken test

 source: <xmqq357ems2h.fsf@gitster.g>
