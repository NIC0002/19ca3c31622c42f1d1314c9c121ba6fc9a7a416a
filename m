Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6080AC54EAA
	for <git@archiver.kernel.org>; Mon, 30 Jan 2023 23:10:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjA3XKf (ORCPT <rfc822;git@archiver.kernel.org>);
        Mon, 30 Jan 2023 18:10:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjA3XKc (ORCPT <rfc822;git@vger.kernel.org>);
        Mon, 30 Jan 2023 18:10:32 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68FF7A1
        for <git@vger.kernel.org>; Mon, 30 Jan 2023 15:10:27 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id z1so5744787plg.6
        for <git@vger.kernel.org>; Mon, 30 Jan 2023 15:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o9oaWmJFPv+x6rzV/TnyECVWWZh076T+61x5zHrbeMQ=;
        b=kgAHxfIRnz9lf7vvYcBP+yu/nSK/Q2lin9+QhuZi9K8pEGNeNHMT82C7sx+5OPvhFg
         Le82/EHQVj7xwN9zxijLNtHOWYDzyr3R60qCEfY8dhBhzTTCl1sNlyDy5IwhBPeGL2cX
         VOEsa6biFmXK4KoFqCvrZchtK9C07CZEqsSCqOiZ3f120dOVcxMtNlt0eHymia6XImVP
         AXEn2rOoBxlwf1Xf198gMhedOGIuJPlZNXam0JaDl8KiX2a4S+HngxWcYrXcCeikoTez
         3/Q1D/pID/vY7AFCZ2r7rQ/uJAKgBAGXfk7qFTgq7AKc+DDHLTGagOzUCFU8xLZ9+78A
         hxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o9oaWmJFPv+x6rzV/TnyECVWWZh076T+61x5zHrbeMQ=;
        b=BWNbD67Cp9c1g/N2Iq+klR6nm36r/2er0mkiU8Uk1xx5kfx//ZrIloIxPXhkiuWiSX
         vVhiJNeWkpRByFsoxuz21R4fxLajOTWM4P5L11xbrn1avlr+HLBbnMbpo4277QaD4zoV
         JqPqptRM3i6FFINVhhzJoleVYeAJ1eBR73Z7Rp8rCE2utSVMw/jRjLIqoJv5+gYrT8JB
         kodV8GpkdSPTp9b5PoxZq3S3ZNW8SqYoCF3hs/aUdoXBHvyxZczO3Po16pquW6CGKVWh
         VKW46jDzD1Uq8sohOVtCeC7UsrOhr4vuW9XIzBnXmNb1E4FUDrayqAU0gSSnWEYKDjZz
         pqQA==
X-Gm-Message-State: AO0yUKUHLUs7K1UkaZfCNRS1fNZA8Q6dxvlQKYTP0HNUTp0+vYMwH/5a
        z0OIQv5ASK/+t6WKNGe653ZD7NnGwho=
X-Google-Smtp-Source: AK7set+uTSqVxZZdFIRUZWT90i61I3I3/0zubMAQ2ysbYNmMl2UyA9WzzVHJZyPgXUwUnedHs+pN/Q==
X-Received: by 2002:a17:902:e881:b0:197:8e66:6335 with SMTP id w1-20020a170902e88100b001978e666335mr3412692plg.20.1675120225972;
        Mon, 30 Jan 2023 15:10:25 -0800 (PST)
Received: from localhost (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id f2-20020a170902ff0200b00192c5327021sm8309907plj.200.2023.01.30.15.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 15:10:25 -0800 (PST)
Sender: Junio C Hamano <jch2355@gmail.com>
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Jan 2023, #07; Mon, 30)
X-master-at: 2fc9e9ca3c7505bc60069f11e7ef09b1aeeee473
X-next-at: b5b5020ace4838582d9c7d79847f668b65391eb7
Date:   Mon, 30 Jan 2023 15:10:25 -0800
Message-ID: <xmqqedrb1uvy.fsf@gitster.g>
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

* ab/cache-api-cleanup-users (2023-01-17) 3 commits
  (merged to 'next' on 2023-01-18 at c5a4374652)
 + treewide: always have a valid "index_state.repo" member
 + Merge branch 'ds/omit-trailing-hash-in-index' into ab/cache-api-cleanup-users
 + Merge branch 'ab/cache-api-cleanup' into ab/cache-api-cleanup-users

 Updates the users of the cache API.
 cf. <db312853-81a1-542b-db96-d816c463516c@github.com>
 source: <patch-1.1-b4998652822-20230117T135234Z-avarab@gmail.com>


* ar/markup-em-dash (2023-01-23) 1 commit
  (merged to 'next' on 2023-01-24 at 0367e3035f)
 + Documentation: render dash correctly

 Doc mark-up updates.
 source: <20230123090114.429844-1-rybak.a.v@gmail.com>


* cb/grep-pcre-ucp (2023-01-18) 1 commit
  (merged to 'next' on 2023-01-19 at 2c7e531839)
 + grep: correctly identify utf-8 characters with \{b,w} in -P

 "grep -P" learned to use Unicode Character Property to grok
 character classes when processing \b and \w etc.
 cf. <xmqqzgaf2zpt.fsf@gitster.g>
 source: <20230108155217.2817-1-carenas@gmail.com>


* cw/fetch-remote-group-with-duplication (2023-01-19) 1 commit
  (merged to 'next' on 2023-01-20 at 7f00e43209)
 + fetch: fix duplicate remote parallel fetch bug

 "git fetch <group>", when "<group>" of remotes lists the same
 remote twice, unnecessarily failed when parallel fetching was
 enabled, which has been corrected.
 source: <20230119220538.1522464-1-calvinwan@google.com>


* jc/doc-branch-update-checked-out-branch (2023-01-18) 1 commit
  (merged to 'next' on 2023-01-19 at 970900a232)
 + branch: document `-f` and linked worktree behaviour

 Document that "branch -f <branch>" disables only the safety to
 avoid recreating an existing branch.
 source: <xmqqa62f2dj1.fsf_-_@gitster.g>


* jc/doc-checkout-b (2023-01-19) 1 commit
  (merged to 'next' on 2023-01-23 at 95340e1941)
 + checkout: document -b/-B to highlight the differences from "git branch"

 Clarify how "checkout -b/-B" and "git branch [-f]" are similar but
 different in the documentation.
 source: <xmqqtu0m1m9i.fsf@gitster.g>


* jk/hash-object-fsck (2023-01-19) 7 commits
  (merged to 'next' on 2023-01-23 at 985e87fc34)
 + fsck: do not assume NUL-termination of buffers
 + hash-object: use fsck for object checks
 + fsck: provide a function to fsck buffer without object struct
 + t: use hash-object --literally when created malformed objects
 + t7030: stop using invalid tag name
 + t1006: stop using 0-padded timestamps
 + t1007: modernize malformed object tests

 "git hash-object" now checks that the resulting object is well
 formed with the same code as "git fsck".
 source: <Y8hX+pIZUKXsyYj5@coredump.intra.peff.net>
 source: <Y8ifa7hyqxSbL92U@coredump.intra.peff.net>


* jk/hash-object-literally-fd-leak (2023-01-19) 1 commit
  (merged to 'next' on 2023-01-19 at fff9b60a36)
 + hash-object: fix descriptor leak with --literally

 Leakfix.
 source: <Y8ijpJqtkDTi792i@coredump.intra.peff.net>


* km/send-email-with-v-reroll-count (2022-11-27) 1 commit
  (merged to 'next' on 2023-01-19 at 9b3543471c)
 + send-email: relay '-v N' to format-patch

 "git send-email -v 3" used to be expanded to "git send-email
 --validate 3" when the user meant to pass them down to
 "format-patch", which has been corrected.
 source: <87edtp5uws.fsf@kyleam.com>


* pb/branch-advice-recurse-submodules (2023-01-18) 1 commit
  (merged to 'next' on 2023-01-19 at 13747fc72d)
 + branch: improve advice when --recurse-submodules fails

 Improve advice message given when "git branch --recurse-submodules"
 fails.
 source: <pull.1464.git.1673890908453.gitgitgadget@gmail.com>


* po/pretty-format-columns-doc (2023-01-19) 5 commits
  (merged to 'next' on 2023-01-23 at d41cb5f527)
 + doc: pretty-formats note wide char limitations, and add tests
 + doc: pretty-formats describe use of ellipsis in truncation
 + doc: pretty-formats document negative column alignments
 + doc: pretty-formats: delineate `%<|(` parameter values
 + doc: pretty-formats: separate parameters from placeholders

 Clarify column-padding operators in the pretty format string.
 source: <20230119181827.1319-1-philipoakley@iee.email>


* sa/cat-file-mailmap--batch-check (2023-01-18) 1 commit
  (merged to 'next' on 2023-01-18 at 25ecb1dd3a)
 + git-cat-file.txt: fix list continuations rendering literally

 Docfix.
 source: <20230118082749.1252459-1-martin.agren@gmail.com>


* tb/t0003-invoke-dd-more-portably (2023-01-22) 1 commit
  (merged to 'next' on 2023-01-23 at 917aa24a27)
 + t0003: call dd with portable blocksize

 Test portability fix.
 source: <20230122062839.14542-1-tboegi@web.de>


--------------------------------------------------
[New Topics]

* ds/scalar-ignore-cron-error (2023-01-27) 3 commits
 - scalar: only warn when background maintenance fails
 - t921*: test scalar behavior starting maintenance
 - t: allow 'scalar' in test_must_fail

 Allow "scalar" to warn but continue when its periodic maintenance
 feature cannot be enabled.

 Will merge to 'next'.
 source: <pull.1473.git.1674849963.gitgitgadget@gmail.com>


* mh/doc-credential-cache-only-in-core (2023-01-29) 1 commit
  (merged to 'next' on 2023-01-30 at 021b5227af)
 + Documentation: clarify that cache forgets credentials if the system restarts

 Documentation clarification.

 Will merge to 'master'.
 source: <pull.1447.v3.git.1674936815117.gitgitgadget@gmail.com>

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


* ab/avoid-losing-exit-codes-in-tests (2022-12-20) 6 commits
 - tests: don't lose misc "git" exit codes
 - tests: don't lose "git" exit codes in "! ( git ... | grep )"
 - tests: don't lose exit status with "test <op> $(git ...)"
 - tests: don't lose exit status with "(cd ...; test <op> $(git ...))"
 - t/lib-patch-mode.sh: fix ignored exit codes
 - auto-crlf tests: don't lose exit code in loops and outside tests

 Test clean-up.

 Expecting a hopefully minor and final reroll.
 cf. <1182283a-4a78-3c99-e716-a8c3e58a5823@web.de>
 cf. <xmqqsfhb0vum.fsf@gitster.g>
 source: <cover-v4-0.6-00000000000-20221219T101240Z-avarab@gmail.com>


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


* mc/switch-advice (2022-11-09) 1 commit
 - po: use `switch` over `checkout` in error message

 Use 'switch' instead of 'checkout' in an error message.

 Waiting for review response.
 source: <pull.1308.git.git.1668018620148.gitgitgadget@gmail.com>


* js/range-diff-mbox (2022-11-23) 1 commit
 - range-diff: support reading mbox files

 'git range-diff' gained support for reading either side from an .mbox
 file instead of a revision range.

 Waiting for review response.
 cf. <xmqqr0xupmnf.fsf@gitster.g>
 source: <pull.1420.v3.git.1669108102092.gitgitgadget@gmail.com>


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


* ab/config-multi-and-nonbool (2022-11-27) 9 commits
 - for-each-repo: with bad config, don't conflate <path> and <cmd>
 - config API: add "string" version of *_value_multi(), fix segfaults
 - config API users: test for *_get_value_multi() segfaults
 - for-each-repo: error on bad --config
 - config API: have *_multi() return an "int" and take a "dest"
 - versioncmp.c: refactor config reading next commit
 - config tests: add "NULL" tests for *_get_value_multi()
 - config tests: cover blind spots in git_die_config() tests
 - for-each-repo tests: test bad --config keys

 Assorted config API updates.

 Expecting a reroll.
 source: <cover-v3-0.9-00000000000-20221125T093158Z-avarab@gmail.com>


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

* ab/hook-api-with-stdin (2023-01-23) 5 commits
 - hook: support a --to-stdin=<path> option for testing
 - sequencer: use the new hook API for the simpler "post-rewrite" call
 - hook API: support passing stdin to hooks, convert am's 'post-rewrite'
 - run-command: allow stdin for run_processes_parallel
 - run-command.c: remove dead assignment in while-loop

 Extend the run-hooks API to allow feeding data from the standard
 input when running the hook script(s).

 Expecting review responses.
 source: <cover-0.5-00000000000-20230123T170550Z-avarab@gmail.com>


* as/ssh-signing-improve-key-missing-error (2023-01-25) 1 commit
  (merged to 'next' on 2023-01-25 at 140f2c2c60)
 + ssh signing: better error message when key not in agent

 Improve the error message given when private key is not loaded in
 the ssh agent in the codepath to sign with an ssh key.

 Will merge to 'master'.
 source: <pull.1270.v3.git.git.1674650450662.gitgitgadget@gmail.com>


* en/rebase-incompatible-opts (2023-01-25) 10 commits
  (merged to 'next' on 2023-01-27 at 35a67cf2c6)
 + rebase: provide better error message for apply options vs. merge config
 + rebase: put rebase_options initialization in single place
 + rebase: fix formatting of rebase --reapply-cherry-picks option in docs
 + rebase: clarify the OPT_CMDMODE incompatibilities
 + rebase: add coverage of other incompatible options
 + rebase: fix incompatiblity checks for --[no-]reapply-cherry-picks
 + rebase: fix docs about incompatibilities with --root
 + rebase: remove --allow-empty-message from incompatible opts
 + rebase: flag --apply and --merge as incompatible
 + rebase: mark --update-refs as requiring the merge backend

 "git rebase" often ignored incompatible options instead of
 complaining, which has been corrected.

 Will merge to 'master'.
 Replaces en/rebase-update-refs-needs-merge-backend.
 source: <pull.1466.v5.git.1674619434.gitgitgadget@gmail.com>


* gm/request-pull-with-non-pgp-signed-tags (2023-01-25) 1 commit
  (merged to 'next' on 2023-01-30 at abc684d8df)
 + request-pull: filter out SSH/X.509 tag signatures

 Adjust "git request-pull" to strip embedded signature from signed
 tags to notice non-PGP signatures.

 Will merge to 'master'.
 source: <20230125234725.3918563-1-gwymor@tilde.club>


* cb/grep-fallback-failing-jit (2023-01-30) 2 commits
 - SQUASH???
 - grep: fall back to interpreter if JIT memory allocation fails

 In an environment where dynamically generated code is prohibited to
 run (e.g. SELinux), failure to JIT pcre patterns is expected.  Fall
 back to interpreted execution in such a case.

 Expecting a (hopefully final minor) reroll.
 cf. <xmqqlelj3hvk.fsf@gitster.g>
 source: <20230127154952.485913-1-minipli@grsecurity.net>


* cb/checkout-same-branch-twice (2023-01-20) 1 commit
 - checkout/switch: disallow checking out same branch in multiple worktrees

 "git checkout -B $branch" failed to protect against checking out
 a branch that is checked out elsewhere, unlike "git branch -f" did.

 Expecting a (hopefully final) reroll.
 cf. <8f24fc3c-c30f-dc70-5a94-5ee4ed3de102@dunelm.org.uk>
 source: <20230120113553.24655-1-carenas@gmail.com>


* ab/sequencer-unleak (2023-01-18) 8 commits
 - commit.c: free() revs.commit in get_fork_point()
 - builtin/rebase.c: free() "options.strategy_opts"
 - sequencer.c: always free() the "msgbuf" in do_pick_commit()
 - builtin/rebase.c: fix "options.onto_name" leak
 - builtin/revert.c: move free-ing of "revs" to replay_opts_release()
 - rebase & sequencer API: fix get_replay_opts() leak in "rebase"
 - sequencer.c: split up sequencer_remove_state()
 - rebase: use "cleanup" pattern in do_interactive_rebase()

 Plug leaks in sequencer subsystem and its users.

 Expecting a hopefully minor and final reroll.
 cf. <xmqqedry17r4.fsf@gitster.g>
 source: <cover-v3-0.8-00000000000-20230118T160600Z-avarab@gmail.com>


* jc/attr-doc-fix (2023-01-26) 1 commit
  (merged to 'next' on 2023-01-26 at cb327c4b5f)
 + attr: fix instructions on how to check attrs

 Comment fix.

 Will merge to 'master'.
 source: <pull.1441.v3.git.git.1674768107941.gitgitgadget@gmail.com>


* rj/avoid-switching-to-already-used-branch (2023-01-22) 3 commits
 - switch: reject if the branch is already checked out elsewhere (test)
 - rebase: refuse to switch to a branch already checked out elsewhere (test)
 - branch: fix die_if_checked_out() when ignore_current_worktree

 A few subcommands have been taught to stop users from working on a
 branch that is being used in another worktree linked to the same
 repository.

 Expecting a (hopefully final) reroll.
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


* en/ls-files-doc-update (2023-01-13) 4 commits
  (merged to 'next' on 2023-01-27 at 20b9803add)
 + ls-files: guide folks to --exclude-standard over other --exclude* options
 + ls-files: clarify descriptions of status tags for -t
 + ls-files: clarify descriptions of file selection options
 + ls-files: add missing documentation for --resolve-undo option

 Doc update to ls-files.

 Will merge to 'master'.
 source: <pull.1463.git.1673584914.gitgitgadget@gmail.com>


* ms/send-email-feed-header-to-validate-hook (2023-01-19) 2 commits
 - send-email: expose header information to git-send-email's sendemail-validate hook
 - send-email: refactor header generation functions

 "git send-email" learned to give the e-mail headers to the validate
 hook by passing an extra argument from the command line.

 Expecting a (hopefully final) reroll.
 cf. <c1ba0a28-3c39-b313-2757-dceb02930334@amd.com>
 source: <20230120012459.920932-1-michael.strawbridge@amd.com>


* ds/bundle-uri-5 (2023-01-23) 10 commits
 - bundle-uri: test missing bundles with heuristic
 - bundle-uri: store fetch.bundleCreationToken
 - fetch: fetch from an external bundle URI
 - bundle-uri: drop bundle.flag from design doc
 - clone: set fetch.bundleURI if appropriate
 - bundle-uri: download in creationToken order
 - bundle-uri: parse bundle.<id>.creationToken values
 - bundle-uri: parse bundle.heuristic=creationToken
 - t5558: add tests for creationToken heuristic
 - bundle: optionally skip reachability walk

 The bundle-URI subsystem adds support for creation-token heuristics
 to help incremental fetches.

 Expecting a reroll.
 cf. <771a2993-85bd-0831-0977-24204f84e206@github.com>
 cf. <01f97aff-58a1-ef2c-e668-d37ea513c64e@github.com>
 cf. <ecc6b167-f5c4-48ce-3973-461d1659ed40@github.com>
 source: <pull.1454.v2.git.1674487310.gitgitgadget@gmail.com>


* tc/cat-file-z-use-cquote (2023-01-16) 1 commit
 - cat-file: quote-format name in error when using -z

 "cat-file" in the batch mode that is fed NUL-terminated pathnames
 learned to cquote them in its error output (otherwise, a funny
 pathname with LF in it would break the lines in the output stream).

 Expecting a reroll.
 cf. <2a2a46f0-a9bc-06a6-72e1-28800518777c@dunelm.org.uk>
 source: <20230116190749.4141516-1-toon@iotcl.com>


* cw/submodule-status-in-parallel (2023-01-17) 6 commits
 - submodule: call parallel code from serial status
 - diff-lib: parallelize run_diff_files for submodules
 - diff-lib: refactor match_stat_with_submodule
 - submodule: move status parsing into function
 - submodule: strbuf variable rename
 - run-command: add duplicate_output_fn to run_processes_parallel_opts

 "git submodule status" learned to run the comparison in submodule
 repositories in parallel.

 Expecting a reroll.
 cf. <CAFySSZBiW7=ZTmXRaLzCoKUi0Jd=fzvW5PJ6=Ka0jKHoP2ddSw@mail.gmail.com>
 cf. <kl6lo7qlvg4h.fsf@chooglen-macbookpro.roam.corp.google.com>
 source: <20230104215415.1083526-1-calvinwan@google.com>


* ab/various-leak-fixes (2023-01-18) 19 commits
 - push: free_refs() the "local_refs" in set_refspecs()
 - receive-pack: free() the "ref_name" in "struct command"
 - grep API: plug memory leaks by freeing "header_list"
 - grep.c: refactor free_grep_patterns()
 - object-file.c: release the "tag" in check_tag()
 - builtin/merge.c: free "&buf" on "Your local changes..." error
 - builtin/merge.c: use fixed strings, not "strbuf", fix leak
 - show-branch: free() allocated "head" before return
 - commit-graph: fix a parse_options_concat() leak
 - http-backend.c: fix cmd_main() memory leak, refactor reg{exec,free}()
 - http-backend.c: fix "dir" and "cmd_arg" leaks in cmd_main()
 - worktree: fix a trivial leak in prune_worktrees()
 - repack: fix leaks on error with "goto cleanup"
 - name-rev: don't xstrdup() an already dup'd string
 - various: add missing clear_pathspec(), fix leaks
 - clone: use free() instead of UNLEAK()
 - commit-graph: use free_commit_graph() instead of UNLEAK()
 - bundle.c: don't leak the "args" in the "struct child_process"
 - tests: mark tests as passing with SANITIZE=leak

 Leak fixes.

 Needs review.
 source: <cover-v5-00.19-00000000000-20230118T120334Z-avarab@gmail.com>


* rj/branch-unborn-in-other-worktrees (2023-01-19) 3 commits
 - branch: rename orphan branches in any worktree
 - branch: description for orphan branch errors
 - avoid unnecessary worktrees traversing

 Error messages given when working on an unborn branch that is
 checked out in another worktree have been improvved.

 Expecting a reroll.
 cf. <527f7315-be7b-7ec0-04fc-d07da7d4fefa@gmail.com>
 source: <34a58449-4f2e-66ef-ea01-119186aebd23@gmail.com>


* mc/credential-helper-auth-headers (2023-01-20) 12 commits
  (merged to 'next' on 2023-01-25 at cb95006bb2)
 + credential: add WWW-Authenticate header to cred requests
 + http: read HTTP WWW-Authenticate response headers
 + http: replace unsafe size_t multiplication with st_mult
 + test-http-server: add sending of arbitrary headers
 + test-http-server: add simple authentication
 + test-http-server: pass Git requests to http-backend
 + test-http-server: add HTTP request parsing
 + test-http-server: add HTTP error response function
 + test-http-server: add stub HTTP server test helper
 + daemon: rename some esoteric/laboured terminology
 + daemon: libify child process handling functions
 + daemon: libify socket setup and option functions

 Extending credential helper protocol.

 Will kick out of 'next'.  The test-only server is an eyesore.
 cf. <e57c1ca3-c21c-db41-a386-e5887f46055c@github.com>
 cf. <Y9JkMLueCwjkLHOr@coredump.intra.peff.net>
 source: <pull.1352.v7.git.1674252530.gitgitgadget@gmail.com>

--------------------------------------------------
[Discarded]

* jc/ci-deprecated-declarations-are-not-fatal (2023-01-14) 1 commit
  (merged to 'next' on 2023-01-14 at 5efb778ab0)
 + ci: do not die on deprecated-declarations warning

 CI build fix for overzealous -Werror.

 Reverted out of 'next'
 Preferring jk/curl-avoid-deprecated-api that fixes the code properly.
 source: <xmqq7cxpkpjp.fsf@gitster.g>


* po/pretty-hard-trunc (2022-11-13) 1 commit
 . pretty-formats: add hard truncation, without ellipsis, options

 Add a new pretty format which truncates without ellipsis.

 Superseded by the 'po/pretty-format-columns-doc' topic.
 source: <20221112143616.1429-1-philipoakley@iee.email>


* en/rebase-update-refs-needs-merge-backend (2023-01-22) 9 commits
  (merged to 'next' on 2023-01-23 at 1b65346647)
 + rebase: provide better error message for apply options vs. merge config
 + rebase: put rebase_options initialization in single place
 + rebase: fix formatting of rebase --reapply-cherry-picks option in docs
 + rebase: clarify the OPT_CMDMODE incompatibilities
 + rebase: add coverage of other incompatible options
 + rebase: fix docs about incompatibilities with --root
 + rebase: remove --allow-empty-message from incompatible opts
 + rebase: flag --apply and --merge as incompatible
 + rebase: mark --update-refs as requiring the merge backend

 The "--update-refs" feature of "git rebase" requires the use of the
 merge backend, while "--whitespace=fix" feature does not work with
 the said backend.  Notice the combination and error out, instead of
 silently ignoring one of the features requested.

 Reverted out of 'next' to be replaced with en/rebase-incompatible-opts
 source: <pull.1466.v4.git.1674367961.gitgitgadget@gmail.com>


* rs/tree-parse-mode-overflow-check (2023-01-21) 1 commit
 . tree-walk: disallow overflowing modes

 Reject tree objects with entries whose mode bits are overly wide.

 Retracted.
 cf. <b4b48877-5b80-e96f-d09f-2fe275f42950@web.de>
 source: <d673fde7-7eb2-6306-86b6-1c1a4c988ee8@web.de>


* cc/filtered-repack (2022-12-25) 3 commits
 . gc: add gc.repackFilter config option
 . repack: add --filter=<filter-spec> option
 . pack-objects: allow --filter without --stdout

 "git repack" learns to discard objects that ought to be retrievable
 again from the promisor remote.

 May want to discard.  Its jaggy edges may be a bit too sharp.
 cf. <Y7WTv19aqiFCU8au@ncase>
 source: <20221221040446.2860985-1-christian.couder@gmail.com>
