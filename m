Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13923C46467
	for <git@archiver.kernel.org>; Tue,  3 Jan 2023 00:58:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbjACA6M (ORCPT <rfc822;git@archiver.kernel.org>);
        Mon, 2 Jan 2023 19:58:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbjACA6I (ORCPT <rfc822;git@vger.kernel.org>);
        Mon, 2 Jan 2023 19:58:08 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A66BC
        for <git@vger.kernel.org>; Mon,  2 Jan 2023 16:58:06 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id p4so31392745pjk.2
        for <git@vger.kernel.org>; Mon, 02 Jan 2023 16:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ROZgOVWq+w4TFvHqHiku4hivtROrutAq2S+ll1jW634=;
        b=a26tukskS+egZzxpmIMrEbb54saetLRh6Q2/juItHLMDvZRBsKvlWGC1/PrClQ1PU4
         pIj8tktSi3Q29BWF79EfjMY8w13UNb+oieWTHpgpxfYhEssfm+5zaWXLAM6BZuc7/4n3
         tSZcldZGqDBkosdGJHg5HHmkAoJCBTELPyJEbdKqSbQtgSn53YRRwXw7LnF+LMKaM1Na
         fAxuQ7FwsJEWwTbJrGJmzerBbp+vHuzpdI5vjjb9WJEqjckFTft4ywd7yTdvMOupHBkZ
         Vns0jpOEzVxUITDYv/LsazLCHqcZd/Ll7JhJpTnWwTscYsrfoTfVKmXSZyS/S+JUsIUO
         W3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ROZgOVWq+w4TFvHqHiku4hivtROrutAq2S+ll1jW634=;
        b=QrY/XzVW5qa2ZCNzIV0mP6Q/2qArNIpeNGZeOVGsZyNGlEbSvho3SngCMcYGw5Z9Qb
         JKnpnPlnVB+IsyBpa9bjFwGDiuRsN6ucEH9WMIEvEf+EIUbA9wDcmjfbIZsis9M7EPol
         C+ksQGMCXM+RRoWLBDlHWGfskwDthoB2SEtxjU41e1sf3x9MS7PbSxb+s44C5F0L88pi
         Liv4gqCFhbr7i+cK6kZP95BZDMIE1K4z7MGBoz/oJsrV+9USeTkyFEDZHOYF6YVUFNrD
         NvE9njlf7R1HpcOIR2PPHgbUDQV+8a7CsVYMbm11R2EcqFvBqbF02CGWgOuB+Zz5hY/Z
         UpHA==
X-Gm-Message-State: AFqh2kpRCwOud0OnLTIgqdwRcwR1UMA92UQLTDipzgD17pnh8wSffwq/
        lfGidde9pIRfj7+r5AfQmXlomoUWpBOJXA==
X-Google-Smtp-Source: AMrXdXvrvFn0TC+yZMSPfsVP2tBQaBmMOaUZZnhbV2juhbtlfs7nEOsPqRp6f2f9wLel4vapJIlG8w==
X-Received: by 2002:a17:902:e74a:b0:192:8e0b:23d3 with SMTP id p10-20020a170902e74a00b001928e0b23d3mr32877895plf.23.1672707484975;
        Mon, 02 Jan 2023 16:58:04 -0800 (PST)
Received: from localhost (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id z2-20020a170903018200b001925d6fdfebsm19930658plg.299.2023.01.02.16.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 16:58:03 -0800 (PST)
Sender: Junio C Hamano <jch2355@gmail.com>
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Jan 2023, #01; Mon, 2)
X-master-at: 2b4f5a4e4bb102ac8d967cea653ed753b608193c
X-next-at: 7cf837fe5f11ff7b613db06ba8547786c6d37bd9
Date:   Tue, 03 Jan 2023 09:58:03 +0900
Message-ID: <xmqqpmbwv3hg.fsf@gitster.g>
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

* ds/bundle-uri-4 (2022-12-25) 11 commits
  (merged to 'next' on 2022-12-26 at 6d7c21c44a)
 + clone: unbundle the advertised bundles
 + bundle-uri: download bundles from an advertised list
 + bundle-uri: allow relative URLs in bundle lists
 + strbuf: introduce strbuf_strip_file_from_path()
 + bundle-uri: serve bundle.* keys from config
 + bundle-uri client: add helper for testing server
 + transport: rename got_remote_heads
 + bundle-uri client: add boolean transfer.bundleURI setting
 + clone: request the 'bundle-uri' command when available
 + t: create test harness for 'bundle-uri' command
 + protocol v2: add server-side "bundle-uri" skeleton

 Bundle URIs part 4.
 source: <pull.1400.v4.git.1671722058.gitgitgadget@gmail.com>


* ew/format-patch-mboxrd (2022-12-25) 1 commit
  (merged to 'next' on 2022-12-26 at bb6cc9e207)
 + format-patch: support format.mboxrd with --stdout

 "git format-patch" learned to honor format.mboxrd even when sending
 patches to the standard output stream,
 source: <20221222201619.M435985@dcvr>


* lk/line-range-parsing-fix (2022-12-20) 1 commit
  (merged to 'next' on 2022-12-26 at 216226a6e2)
 + line-range: fix infinite loop bug with '$' regex

 When given a pattern that matches an empty string at the end of a
 line, the code to parse the "git diff" line-ranges fell into an
 infinite loop, which has been corrected.
 source: <20221219224850.2703967-1-lars@oddbit.com>


* ps/fsync-refs-fix (2022-12-25) 1 commit
  (merged to 'next' on 2022-12-26 at 6358875b39)
 + refs: fix corruption by not correctly syncing packed-refs to disk

 Fix the sequence to fsync $GIT_DIR/packed-refs file that forgot to
 flush its output to the disk..
 source: <8c8ecf8e3718cbca049ee7a283edd7b7887e464e.1671547905.git.ps@pks.im>


* sa/git-var-sequence-editor (2022-12-18) 1 commit
  (merged to 'next' on 2022-12-20 at a5737674b6)
 + var: add GIT_SEQUENCE_EDITOR variable

 Just like "git var GIT_EDITOR" abstracts the complex logic to
 choose which editor gets used behind it, "git var" now give support
 to GIT_SEQUENCE_EDITOR.
 source: <pull.1424.v2.git.1671318599482.gitgitgadget@gmail.com>


* sk/win32-pthread-exit-fix (2022-12-25) 1 commit
  (merged to 'next' on 2022-12-26 at ebcb1fef4c)
 + win32: use _endthreadex to terminate threads, not ExitThread

 An API emulation fix.
 source: <pull.1414.v2.git.git.1671932510529.gitgitgadget@gmail.com>


* ss/pull-v-recurse-fix (2022-12-18) 1 commit
  (merged to 'next' on 2022-12-20 at 21f91dc75d)
 + submodule: accept -v for the update command

 "git pull -v --recurse-submodules" attempted to pass "-v" down to
 underlying "git submodule update", which did not understand the
 request and barfed, which has been corrected.
 source: <f805f2da-a7e1-9fde-cc0a-04a30f79c9af@cs-ware.de>

--------------------------------------------------
[New Topics]

* km/doc-branch-start-point (2022-12-27) 1 commit
  (merged to 'next' on 2022-12-28 at 0c24f1cd9b)
 + doc/git-branch: fix --force description typo

 Typofix.

 Will merge to 'master'.
 source: <20221226165441.126625-1-kyle@kyleam.com>


* ar/typofix-gitattributes-doc (2022-12-28) 1 commit
  (merged to 'next' on 2022-12-28 at e193a15659)
 + gitattributes.txt: fix typo in "comma separated"

 Typofix.

 Will merge to 'master'.
 source: <20221227210156.1532168-1-rybak.a.v@gmail.com>


* ab/various-leak-fixes (2022-12-30) 20 commits
 - push: free_refs() the "local_refs" in set_refspecs()
 - receive-pack: free() the "ref_name" in "struct command"
 - grep API: plug memory leaks by freeing "header_list"
 - grep.c: refactor free_grep_patterns()
 - object-file.c: release the "tag" in check_tag()
 - connected.c: free(new_pack) in check_connected()
 - builtin/merge.c: free "&buf" on "Your local changes..." error
 - builtin/merge.c: always free "struct strbuf msg"
 - show-branch: free() allocated "head" before return
 - commit-graph: fix a parse_options_concat() leak
 - http-backend.c: fix cmd_main() memory leak, refactor reg{exec,free}()
 - http-backend.c: fix "dir" and "cmd_arg" leaks in cmd_main()
 - worktree: fix a trivial leak in prune_worktrees()
 - repack: fix leaks on error with "goto cleanup"
 - name-rev: don't xstrdup() an already dup'd string
 - various: add missing clear_pathspec(), fix leaks
 - clone: use free() instead of UNLEAK()
 - commit-graph: use free() instead of UNLEAK()
 - bundle.c: don't leak the "args" in the "struct child_process"
 - tests: mark tests as passing with SANITIZE=leak

 source: <cover-v2-00.20-00000000000-20221230T020341Z-avarab@gmail.com>


* rj/branch-unborn-in-other-worktrees (2023-01-01) 2 commits
 - branch: rename orphan branches in any worktree
 - branch: description for orphan branch errors

 source: <ffd675e9-8a64-ae05-fc3b-36ae99092735@gmail.com>


* rs/dup-array (2023-01-02) 4 commits
 - use DUP_ARRAY
 - add DUP_ARRAY
 - do full type check in BARF_UNLESS_COPYABLE
 - factor out BARF_UNLESS_COPYABLE

 source: <9bc1bd74-f72c-1b43-df7c-950815babb03@web.de>

--------------------------------------------------
[Cooking]

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


* cw/ci-whitespace (2022-12-20) 3 commits
 - ci (check-whitespace): move to actions/checkout@v3
 - ci (check-whitespace): add links to job output
 - ci (check-whitespace): suggest fixes for errors

 CI updates.  We probably want a clean-up to move the long shell
 script embedded in yaml file into a separate file, but that can
 come later.

 Will merge to 'next'.
 source: <pull.1444.v2.git.1671496548.gitgitgadget@gmail.com>


* dh/mingw-ownership-check-typofix (2022-12-20) 1 commit
  (merged to 'next' on 2022-12-28 at 3753a46f6d)
 + mingw: fix typo in an error message from ownership check

 Error message typofix.

 Will merge to 'master'.
 source: <pull.1393.git.git.1671416810927.gitgitgadget@gmail.com>


* js/ci-disable-cmake-by-default (2022-12-20) 1 commit
  (merged to 'next' on 2023-01-02 at 3f014ca5d1)
 + ci: only run win+VS build & tests in Git for Windows' fork

 Stop running win+VS build by default.

 Will merge to 'master'.
 source: <pull.1445.git.1671461414191.gitgitgadget@gmail.com>


* sg/test-oid-wo-incomplete-line (2022-12-19) 1 commit
  (merged to 'next' on 2022-12-28 at 8dadf8c521)
 + tests: make 'test_oid' print trailing newline

 Test helper updates.

 Will merge to 'master'.
 source: <20221218162905.3508164-1-szeder.dev@gmail.com>


* ab/bundle-wo-args (2022-12-28) 3 commits
  (merged to 'next' on 2022-12-28 at 6ae8fc1c88)
 + bundle <cmd>: have usage_msg_opt() note the missing "<file>"
 + builtin/bundle.c: remove superfluous "newargc" variable
  (merged to 'next' on 2022-12-26 at b086677fd0)
 + bundle: don't segfault on "git bundle <subcmd>"

 Fix to a small regression in 2.38 days.

 Will merge to 'master'.
 source: <patch-1.1-2319eb2ddbd-20221220T133941Z-avarab@gmail.com>
 source: <cover-0.2-00000000000-20221227T183708Z-avarab@gmail.com>


* ad/test-record-count-when-harness-is-in-use (2022-12-25) 1 commit
 - test-lib: allow storing counts with test harnesses

 Allow summary results from tests to be written to t/test-results
 directory even when a test harness like 'prove' is in use.

 Comments?
 source: <20221224225200.1027806-1-adam@dinwoodie.org>


* sk/win32-close-handle-upon-pthread-join (2022-12-26) 2 commits
 - win32: close handles of threads that have been joined
 - win32-pthread: prepare pthread.c for change by formatting

 source: <pull.1406.v12.git.git.1671932405.gitgitgadget@gmail.com>


* ab/no-more-git-global-super-prefix (2022-12-26) 9 commits
  (merged to 'next' on 2022-12-28 at 126b1fbad1)
 + read-tree: add "--super-prefix" option, eliminate global
 + submodule--helper: convert "{update,clone}" to their own "--super-prefix"
 + submodule--helper: convert "status" to its own "--super-prefix"
 + submodule--helper: convert "sync" to its own "--super-prefix"
 + submodule--helper: convert "foreach" to its own "--super-prefix"
 + submodule--helper: don't use global --super-prefix in "absorbgitdirs"
 + submodule.c & submodule--helper: pass along "super_prefix" param
 + read-tree + fetch tests: test failing "--super-prefix" interaction
 + submodule absorbgitdirs tests: add missing "Migrating git..." tests

 Stop using "git --super-prefix" and narrow the scope of its use to
 the submodule--helper.

 Will merge to 'master'.
 source: <cover-v5-0.9-00000000000-20221220T104519Z-avarab@gmail.com>


* cb/grep-fallback-failing-jit (2022-12-17) 1 commit
 - grep: fall back to interpreter mode if JIT fails

 In an environment where dynamically generated code is prohibited to
 run (e.g. SELinux), failure to JIT pcre patterns is expected.  Fall
 back to interpreted execution in such a case.

 Expecting a reroll.
 cf. <62a06c5b-9646-17f8-b4d5-39823d3cc25a@grsecurity.net>
 source: <20221216121557.30714-1-minipli@grsecurity.net>


* jc/spell-id-in-both-caps-in-message-id (2022-12-17) 1 commit
 - e-mail workflow: Message-ID is spelled with ID in both capital letters

 Consistently spell "Message-ID" as such, not "Message-Id".

 Comments?
 source: <xmqqsfhgnmqg.fsf@gitster.g>


* ds/omit-trailing-hash-in-index (2022-12-17) 4 commits
 - features: feature.manyFiles implies fast index writes
 - test-lib-functions: add helper for trailing hash
 - read-cache: add index.skipHash config option
 - hashfile: allow skipping the hash function

 Introduce an optional configuration to allow the trailing hash that
 protects the index file from bit flipping.

 cf. <221216.86sfhf1gbc.gmgdl@evledraar.gmail.com>
 source: <pull.1439.v4.git.1671204678.gitgitgadget@gmail.com>


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


* es/t1509-root-fixes (2022-12-09) 3 commits
 - t1509: facilitate repeated script invocations
 - t1509: make "setup" test more robust
 - t1509: fix failing "root work tree" test due to owner-check

 source: <pull.1425.git.1668999621.gitgitgadget@gmail.com>


* jt/avoid-lazy-fetch-commits (2022-12-15) 4 commits
  (merged to 'next' on 2022-12-28 at 35276d17e2)
 + commit: don't lazy-fetch commits
 + object-file: emit corruption errors when detected
 + object-file: refactor map_loose_object_1()
 + object-file: remove OBJECT_INFO_IGNORE_LOOSE

 Even in a repository with promisor remote, it is useless to
 attempt to lazily attempt fetching an object that is expected to be
 commit, because no "filter" mode omits commit objects.  Take
 advantage of this assumption to fail fast on errors.

 Will merge to 'master'.
 source: <cover.1671045259.git.jonathantanmy@google.com>


* jx/t1301-updates (2022-11-30) 3 commits
 - t1301: do not change $CWD in "shared=all" test case
 - t1301: use test_when_finished for cleanup
 - t1301: fix wrong template dir for git-init

 Test updates.
 source: <20221128130323.8914-1-worldhello.net@gmail.com>


* km/send-email-with-v-reroll-count (2022-11-30) 2 commits
 - SQUASH???
 - send-email: relay '-v N' to format-patch

 "git send-email -v 3" used to be expanded to "git send-email
 --validate 3" when the user meant to pass them down to
 "format-patch", which has been corrected.

 Seems to break CI.
 source: <87edtp5uws.fsf@kyleam.com>


* so/diff-merges-more (2022-12-18) 5 commits
 - diff-merges: improve --diff-merges documentation
 - diff-merges: issue warning on lone '-m' option
 - diff-merges: support list of values for --diff-merges
 - diff-merges: implement log.diffMerges-m-imply-p config
 - diff-merges: implement [no-]hide option and log.diffMergesHide config

 Assorted updates to "--diff-merges=X" option.
 source: <20221217132955.108542-1-sorganov@gmail.com>


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

 Waiting for review.
 source: <cover-v3-0.9-00000000000-20221125T093158Z-avarab@gmail.com>


* sa/cat-file-mailmap--batch-check (2022-12-20) 2 commits
  (merged to 'next' on 2022-12-28 at 57531d3fe8)
 + cat-file: add mailmap support to --batch-check option
 + cat-file: add mailmap support to -s option

 'cat-file' gains mailmap support for its '--batch-check' and '-s'
 options.

 Will merge to 'master'.
 cf. <221220.865ye6xlmo.gmgdl@evledraar.gmail.com>
 source: <20221220060113.51010-1-siddharthasthana31@gmail.com>


* ab/tag-object-type-errors (2022-11-22) 5 commits
 - tag: don't emit potentially incorrect "object is a X, not a Y"
 - tag: don't misreport type of tagged objects in errors
 - object tests: add test for unexpected objects in tags
 - object-file.c: free the "t.tag" in check_tag()
 - Merge branch 'jk/parse-object-type-mismatch' into ab/tag-object-type-errors

 Hardening checks around mismatched object types when one of those
 objects is a tag.

 Needs review.
 source: <cover-0.4-00000000000-20221118T113442Z-avarab@gmail.com>


* js/range-diff-mbox (2022-11-23) 1 commit
 - range-diff: support reading mbox files

 'git range-diff' gained support for reading either side from an .mbox
 file instead of a revision range.

 Expecting review responses.
 source: <pull.1420.v3.git.1669108102092.gitgitgadget@gmail.com>


* tr/am--no-verify (2022-12-01) 2 commits
 - SQUASH???
 - am: allow passing --no-verify flag

 Conditionally skip the pre-applypatch and applypatch-msg hooks when
 applying patches with 'git am'.

 Expecting a (hopefully final) reroll.
 source: <20221130172833.2662751-1-thierry.reding@gmail.com>


* js/drop-mingw-test-cmp (2022-12-13) 1 commit
  (merged to 'next' on 2023-01-02 at 402866b048)
 + tests(mingw): avoid very slow `mingw_test_cmp`

 Use `git diff --no-index` as a test_cmp on Windows.

 We'd probably need to revisit "do we really want to, and have to,
 lose CRLF vs LF?" later, at which time we may be able to further
 clean this up by replacing "git diff --no-index" with "diff -u".

 Will merge to 'master'.
 source: <6a80fab7e3936ec56e1583d6136d47487327e907.1670339267.git.gitgitgadget@gmail.com>


* mc/switch-advice (2022-11-09) 1 commit
 - po: use `switch` over `checkout` in error message

 Use 'switch' instead of 'checkout' in an error message.

 Waiting for review response.
 source: <pull.1308.git.git.1668018620148.gitgitgadget@gmail.com>


* ja/worktree-orphan (2022-12-20) 4 commits
 . worktree add: add hint to use --orphan when bad ref
 . worktree add: add --orphan flag
 . worktree add: refactor opt exclusion tests
 . worktree add: include -B in usage docs

 'git worktree add' learned how to create a worktree based on an
 orphaned branch with `--orphan`.

 Seems to break the CI.
 cf. https://github.com/git/git/actions/runs/3784676950 (bad with topic)
 https://github.com/git/git/actions/runs/3787726481 (good without)
 source: <20221220023637.29042-1-jacobabel@nullpo.dev>


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

 Waiting for review.
 source: <cover.1667980450.git.dyroneteng@gmail.com>


* po/pretty-hard-trunc (2022-11-13) 1 commit
 - pretty-formats: add hard truncation, without ellipsis, options

 Add a new pretty format which truncates without ellipsis.

 Waiting for review.
 source: <20221112143616.1429-1-philipoakley@iee.email>


* cc/filtered-repack (2022-12-25) 3 commits
 - gc: add gc.repackFilter config option
 - repack: add --filter=<filter-spec> option
 - pack-objects: allow --filter without --stdout

 "git repack" learns to discard objects that ought to be retrievable
 again from the promisor remote.
 source: <20221221040446.2860985-1-christian.couder@gmail.com>


* mc/credential-helper-auth-headers (2022-12-13) 8 commits
 - t5556: add HTTP authentication tests
 - test-http-server: add simple authentication
 - test-http-server: pass Git requests to http-backend
 - test-http-server: add HTTP request parsing
 - test-http-server: add HTTP error response function
 - test-http-server: add stub HTTP server test helper
 - credential: add WWW-Authenticate header to cred requests
 - http: read HTTP WWW-Authenticate response headers

 Extending credential helper protocol.

 Waiting for review responses (or a reroll).
 cf. <1dc44716-2550-47de-e666-9972b102905d@github.com>
 source: <pull.1352.v4.git.1670880984.gitgitgadget@gmail.com>
