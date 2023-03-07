Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E231BC678D5
	for <git@archiver.kernel.org>; Tue,  7 Mar 2023 22:26:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjCGW0T (ORCPT <rfc822;git@archiver.kernel.org>);
        Tue, 7 Mar 2023 17:26:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbjCGW0L (ORCPT <rfc822;git@vger.kernel.org>);
        Tue, 7 Mar 2023 17:26:11 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20B0A9AFC5
        for <git@vger.kernel.org>; Tue,  7 Mar 2023 14:25:29 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id x11so11218115pln.12
        for <git@vger.kernel.org>; Tue, 07 Mar 2023 14:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678227913;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/+2G8zHbs2iODypC5IlOv0xCF3bTJlc9IRyRdUS8R/Y=;
        b=ZQE9mNDawe5HX1KqkFsTSEG0WIa6+BEnmLmudp3fEHfP6BUsSkV0ovOW9ai01TTeuw
         4u71wTXx+oSiWV0MkzM6lK5G6PcV74ELiOfFjV8wW0xGxbUnDEjso5V8Uc6E3lsHemi+
         Vf4aDlnAMQHuqI3uoDeiBjKfM/iErgSEduyxgKoBL+hhNtmcYJXfInIEGxteL3RkpLWH
         g7naHK2GNzXH+MpNV8A8h1uh36JlFASjn69ciGMd+fByU+7fGW4TJFmCv60xkrDBSlex
         XJpG2YAL5PWUuqajE+Xm6Lrh9/yglGal5cka1aH4FmNV3ToQZhQXUNBXHlSjs3aNq7vX
         S4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678227913;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/+2G8zHbs2iODypC5IlOv0xCF3bTJlc9IRyRdUS8R/Y=;
        b=lpdD7io34TkHVoA/yv5BSrchj5P/CW2XVnF8Nz3gtUJQUwPpM7ThNB7344NoLXEQh8
         +BtW7HNZZePWrHKrihpwLa55lS3Bzmr7feI5TaMRbujPyW1FXzqkcpelyO9S902spQd1
         AkM190hDb5ji51ojXWz9sVif2sSY7cIGFJSE7yEiH65ItlJW6IL9lY78S1+1YN37AZJn
         l5Gna25Ev+8EL6ITNQE51sM3Tsgkb0NYIqVBx2ODNIDtfo4E8Es1OC/cAPPtr64BVPV2
         7YeN8WO15dzdXUXhHzhpPWtB78GTYORSscgQY1J7F6B8PNBjbHPhf/ssTEXvB16XspUp
         hacQ==
X-Gm-Message-State: AO0yUKVAHj2C48LB/2xK5QMIBorDsgLodlRk9vPkd4WVs7CmNo0oCCvs
        Xvh5zH3vjM9A5Xr6j7RcfPPg5jmS1R0=
X-Google-Smtp-Source: AK7set80tbA1z/f/gRdiCFAJapntWiyKZnM7LEmh2dYutMFIHM0z9Jr/I0fZDgGfDTB/aqqpg4ENPg==
X-Received: by 2002:a17:90a:e7c6:b0:234:8950:6d1f with SMTP id kb6-20020a17090ae7c600b0023489506d1fmr17002583pjb.11.1678227912569;
        Tue, 07 Mar 2023 14:25:12 -0800 (PST)
Received: from localhost (83.92.168.34.bc.googleusercontent.com. [34.168.92.83])
        by smtp.gmail.com with ESMTPSA id z10-20020a17090a1fca00b0023086d280c5sm7715634pjz.3.2023.03.07.14.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:25:11 -0800 (PST)
Sender: Junio C Hamano <jch2355@gmail.com>
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Mar 2023, #02; Tue, 7)
X-master-at: 725f57037d81e24eacfda6e59a19c60c0b4c8062
X-next-at: 97d40d926ee7422876456a84ac38bfc5edc7d9d1
Date:   Tue, 07 Mar 2023 14:25:11 -0800
Message-ID: <xmqq4jqww660.fsf@gitster.g>
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

* as/doc-markup-fix (2023-03-06) 1 commit
 - git-merge-tree.txt: replace spurious HTML entity

 Fix for a mis-mark-up in doc made in Git 2.39 days.

 Will merge to 'next'.
 source: <87y1oco3i9.fsf@igel.home>


* ds/ahead-behind (2023-03-06) 8 commits
 - ahead-behind: add --contains mode
 - ahead-behind: implement ahead_behind() logic
 - commit-graph: introduce `ensure_generations_valid()`
 - commit-graph: return generation from memory
 - commit-graph: combine generation computations
 - ahead-behind: implement --ignore-missing option
 - ahead-behind: parse tip references
 - ahead-behind: create empty builtin

 "git ahead-behind --base=<reference> --stdin" computes the
 distances from a single reference point in the history with bunch
 of commits in bulk.

 Comments?
 source: <pull.1489.git.1678111598.gitgitgadget@gmail.com>


* gc/config-parsing-cleanup (2023-03-03) 6 commits
 - config.c: remove current_parsing_scope
 - config.c: remove current_config_kvi
 - config.c: plumb the_reader through callbacks
 - config.c: create config_reader and the_reader
 - config.c: don't assign to "cf" directly
 - config.c: plumb config_source through static fns

 Config API clean-up to reduce its dependence on static variables

 Comments?
 source: <pull.1463.git.git.1677631097.gitgitgadget@gmail.com>


* jk/bundle-progress (2023-03-06) 1 commit
 - bundle: turn on --all-progress-implied by default

 Simplify UI to control progress meter given by "git bundle" command.

 Will merge to 'next'.
 source: <ZAMjkffYmp+DNmr+@coredump.intra.peff.net>


* jk/bundle-use-dash-for-stdfiles (2023-03-06) 5 commits
 - parse-options: use prefix_filename_except_for_dash() helper
 - parse-options: consistently allocate memory in fix_filename()
 - bundle: don't blindly apply prefix_filename() to "-"
 - bundle: document handling of "-" as stdin
 - bundle: let "-" mean stdin for reading operations

 "git bundle" learned that "-" is a common way to say that the input
 comes from the standard input and/or the output goes to the
 standard output.  It used to work only for output and only from the
 root level of the working tree.

 Will merge to 'next'.
 source: <ZAMb8LSpm2gOrpeY@coredump.intra.peff.net>


* jk/format-patch-change-format-for-empty-commits (2023-03-03) 1 commit
 - format-patch: output header for empty commits

 "git format-patch" learned to write a log-message only output file
 for empty commits.

 Will merge to 'next'.
 source: <20230303160301.3659328-1-john@keeping.me.uk>


* ds/reprepare-alternates-when-repreparing-packfiles (2023-03-06) 1 commit
 - object-file: reprepare alternates when necessary

 Once we start running, we assumed that the list of alternate object
 databases would never change.  Hook into the machinery used to
 update the list of packfiles during runtime to update this list as
 well.

 Comments?
 source: <pull.1490.git.1678136369387.gitgitgadget@gmail.com>

--------------------------------------------------
[Graduated to 'master']

* gm/signature-format-doc (2023-02-27) 1 commit
  (merged to 'next' on 2023-03-01 at 19f9ce8c40)
 + signature-format.txt: note SSH and X.509 signature delimiters

 Doc update.

 Will cook in 'next'.
 source: <20230227202718.173698-1-gwymor@tilde.club>


* rs/range-diff-custom-abbrev-fix (2023-02-28) 1 commit
  (merged to 'next' on 2023-02-28 at 82f1929a15)
 + range-diff: avoid compiler warning when char is unsigned

 Hotfix for a topic that is already in 'master'.
 source: <1156586e-9dbe-335e-7e33-74eea7913e86@web.de>

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

* ak/restore-both-incompatible-with-conflicts (2023-02-27) 1 commit
  (merged to 'next' on 2023-03-06 at 4ee341853c)
 + restore: fault --staged --worktree with merge opts

 "git restore" supports options like "--ours" that are only
 meaningful during a conflicted merge, but these options are only
 meaningful when updating the working tree files.  These options are
 marked to be incompatible when both "--staged" and "--worktree" are
 in effect.

 Will cook in 'next'.
 source: <20230226184354.221-1-andy.koppe@gmail.com>


* ew/fetch-hiderefs (2023-02-27) 1 commit
  (merged to 'next' on 2023-03-01 at 6a7eece733)
 + fetch: support hideRefs to speed up connectivity checks

 A new "fetch.hideRefs" option can be used to exclude specified refs
 from "rev-list --objects --stdin --not --all" traversal for
 checking object connectivity, most useful when there are many
 unrelated histories in a single repository.

 Will cook in 'next'.
 source: <20230212090426.M558990@dcvr>


* zh/push-to-delete-onelevel-ref (2023-03-01) 2 commits
  (merged to 'next' on 2023-03-06 at f08def5949)
 + push: allow delete single-level ref
 + receive-pack: fix funny ref error messsage

 "git push" has been taught to allow deletion of refs with one-level
 names to help repairing a repository who acquired such a ref by
 mistake.  In general, we don't encourage use of such a ref, and
 creation or update to such a ref is rejected as before.

 Will cook in 'next'.
 source: <pull.1465.v4.git.1677666029.gitgitgadget@gmail.com>


* fz/rebase-msg-update (2023-02-27) 1 commit
  (merged to 'next' on 2023-03-01 at f28c0df111)
 + rebase: fix capitalisation autoSquash in i18n string

 Message update.

 Will cook in 'next'.
 source: <pull.1462.git.git.1677434429160.gitgitgadget@gmail.com>


* my/wildmatch-cleanups (2023-02-27) 5 commits
 - wildmatch: more cleanups after killing uchar
 - wildmatch: use char instead of uchar
 - wildmatch: remove NEGATE_CLASS(2) macros with trivial refactoring
 - wildmatch: remove IS*() macros
 - git-compat-util: add isblank() and isgraph()

 Code clean-up.

 Comments?
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


* ah/rebase-merges-config (2023-03-06) 3 commits
 - rebase: add a config option for --rebase-merges
 - rebase: deprecate --rebase-merges=""
 - rebase: add documentation and test for --no-rebase-merges

 Streamline --rebase-merges command line option handling and
 introduce rebase.merges configuration variable.

 On hold.
 cf. <b4be9cb3-c24b-4377-bab3-5d53035efdf8@gmx.de>
 source: <20230305050709.68736-1-alexhenrie24@gmail.com>


* en/dir-api-cleanup (2023-02-27) 13 commits
  (merged to 'next' on 2023-02-27 at 434ac6b592)
 + unpack-trees: add usage notices around df_conflict_entry
 + unpack-trees: special case read-tree debugging as internal usage
 + unpack-trees: rewrap a few overlong lines from previous patch
 + unpack-trees: mark fields only used internally as internal
 + unpack_trees: start splitting internal fields from public API
 + sparse-checkout: avoid using internal API of unpack-trees, take 2
 + sparse-checkout: avoid using internal API of unpack-trees
 + unpack-trees: clean up some flow control
 + dir: mark output only fields of dir_struct as such
 + dir: add a usage note to exclude_per_dir
 + dir: separate public from internal portion of dir_struct
 + unpack-trees: heed requests to overwrite ignored files
 + t2021: fix platform-specific leftover cruft

 Code clean-up to clarify directory traversal API.

 Will cook in 'next'.
 source: <pull.1149.v3.git.1677511700.gitgitgadget@gmail.com>


* en/header-cleanup (2023-02-23) 17 commits
  (merged to 'next' on 2023-02-27 at f4a3707530)
 + diff.h: remove unnecessary include of object.h
 + Remove unnecessary includes of builtin.h
 + treewide: replace cache.h with more direct headers, where possible
 + replace-object.h: move read_replace_refs declaration from cache.h to here
 + object-store.h: move struct object_info from cache.h
 + dir.h: refactor to no longer need to include cache.h
 + object.h: stop depending on cache.h; make cache.h depend on object.h
 + ident.h: move ident-related declarations out of cache.h
 + pretty.h: move has_non_ascii() declaration from commit.h
 + cache.h: remove dependence on hex.h; make other files include it explicitly
 + hex.h: move some hex-related declarations from cache.h
 + hash.h: move some oid-related declarations from cache.h
 + alloc.h: move ALLOC_GROW() functions from cache.h
 + treewide: remove unnecessary cache.h includes in source files
 + treewide: remove unnecessary cache.h includes
 + treewide: remove unnecessary git-compat-util.h includes in headers
 + treewide: ensure one of the appropriate headers is sourced first

 Code clean-up to clarify the rule that "git-compat-util.h" must be
 the first to be included.

 Will cook in 'next'.
 source: <pull.1485.v2.git.1677197376.gitgitgadget@gmail.com>


* jk/fsck-indices-in-worktrees (2023-02-27) 4 commits
  (merged to 'next' on 2023-02-27 at 6eb92abb6b)
 + fsck: check even zero-entry index files
  (merged to 'next' on 2023-02-24 at 38c0793286)
 + fsck: mention file path for index errors
 + fsck: check index files in all worktrees
 + fsck: factor out index fsck

 "git fsck" learned to check the index files in other worktrees,
 just like "git gc" honors them as anchoring points.

 Will cook in 'next'.
 source: <Y/hv0MXAyBY3HEo9@coredump.intra.peff.net>


* jk/unused-post-2.39-part2 (2023-02-24) 21 commits
  (merged to 'next' on 2023-02-27 at f0ec2a81b3)
 + help: mark unused parameter in git_unknown_cmd_config()
 + run_processes_parallel: mark unused callback parameters
 + userformat_want_item(): mark unused parameter
 + for_each_commit_graft(): mark unused callback parameter
 + rewrite_parents(): mark unused callback parameter
 + fetch-pack: mark unused parameter in callback function
 + notes: mark unused callback parameters
 + prio-queue: mark unused parameters in comparison functions
 + for_each_object: mark unused callback parameters
 + list-objects: mark unused callback parameters
 + mark unused parameters in signal handlers
 + run-command: mark error routine parameters as unused
 + mark "pointless" data pointers in callbacks
 + ref-filter: mark unused callback parameters
 + http-backend: mark unused parameters in virtual functions
 + http-backend: mark argc/argv unused
 + object-name: mark unused parameters in disambiguate callbacks
 + serve: mark unused parameters in virtual functions
 + serve: use repository pointer to get config
 + ls-refs: drop config caching
 + ref-filter: drop unused atom parameter from get_worktree_path()

 More work towards -Wunused.

 Will cook in 'next'.
 source: <Y/habYJxDRJQg/kJ@coredump.intra.peff.net>


* ew/commit-reach-clean-up-flags-fix (2023-02-11) 1 commit
  (merged to 'next' on 2023-03-06 at 5dc1c4c0b7)
 + commit-reach: avoid NULL dereference

 Fix a segfaulting loop.  The function and its caller may need
 further clean-up.

 Will cook in 'next'.
 cf. <876cf920-113a-90cf-f49e-6e1b7b146acf@github.com>
 source: <20230211111526.2028178-1-e@80x24.org>


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


* jc/gpg-lazy-init (2023-02-27) 2 commits
  (merged to 'next' on 2023-02-27 at e3f81cfdbc)
 + drop pure pass-through config callbacks
 + gpg-interface: lazily initialize and read the configuration

 Instead of forcing each command to choose to honor GPG related
 configuration variables, make the subsystem lazily initialize
 itself.

 Will cook in 'next'.
 source: <xmqqpmaimvtd.fsf_-_@gitster.g>


* mc/credential-helper-www-authenticate (2023-02-27) 3 commits
  (merged to 'next' on 2023-02-27 at 89c9bd4b8f)
 + credential: add WWW-Authenticate header to cred requests
 + http: read HTTP WWW-Authenticate response headers
 + t5563: add tests for basic and anoymous HTTP access

 Allow information carried on the WWW-AUthenticate header to be
 passed to the credential helpers.

 Will cook in 'next'.
 source: <pull.1352.v11.git.1677518420.gitgitgadget@gmail.com>


* ab/avoid-losing-exit-codes-in-tests (2023-02-06) 6 commits
  (merged to 'next' on 2023-03-06 at 60d7d0d493)
 + tests: don't lose misc "git" exit codes
 + tests: don't lose exit status with "test <op> $(git ...)"
 + tests: don't lose "git" exit codes in "! ( git ... | grep )"
 + tests: don't lose exit status with "(cd ...; test <op> $(git ...))"
 + t/lib-patch-mode.sh: fix ignored exit codes
 + auto-crlf tests: don't lose exit code in loops and outside tests

 Test clean-up.

 Will cook in 'next'.
 source: <cover-v5-0.6-00000000000-20230206T224200Z-avarab@gmail.com>


* rj/branch-unborn-in-other-worktrees (2023-02-22) 3 commits
  (merged to 'next' on 2023-03-06 at 6ee0ec72ae)
 + branch: rename orphan branches in any worktree
 + branch: description for orphan branch errors
 + branch: avoid unnecessary worktrees traversals

 Error messages given when working on an unborn branch that is
 checked out in another worktree have been improvved.

 Will cook in 'next'.
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


* ab/config-multi-and-nonbool (2023-03-07) 9 commits
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

 Comments?
 source: <cover-v6-0.9-00000000000-20230307T180516Z-avarab@gmail.com>


* cb/checkout-same-branch-twice (2023-01-20) 1 commit
 - checkout/switch: disallow checking out same branch in multiple worktrees

 "git checkout -B $branch" failed to protect against checking out
 a branch that is checked out elsewhere, unlike "git branch -f" did.

 Expecting a hopefully minor and final reroll.
 cf. <8f24fc3c-c30f-dc70-5a94-5ee4ed3de102@dunelm.org.uk>
 source: <20230120113553.24655-1-carenas@gmail.com>


* rj/avoid-switching-to-already-used-branch (2023-02-25) 4 commits
  (merged to 'next' on 2023-03-06 at 7546231ddf)
 + switch: reject if the branch is already checked out elsewhere (test)
 + rebase: refuse to switch to a branch already checked out elsewhere (test)
 + branch: fix die_if_checked_out() when ignore_current_worktree
 + worktree: introduce is_shared_symref()

 A few subcommands have been taught to stop users from working on a
 branch that is being used in another worktree linked to the same
 repository.

 Will cook in 'next'.
 source: <6fed3b1b-1c4e-9298-19b6-7ad9c04c87dd@gmail.com>


* rj/bisect-already-used-branch (2023-01-22) 1 commit
  (merged to 'next' on 2023-03-06 at 3508814a41)
 + bisect: fix "reset" when branch is checked out elsewhere

 Allow "git bisect reset [name]" to check out the named branch (or
 the original one) even when the branch is already checked out in a
 different worktree linked to the same repository.

 Will cook in 'next'.
 source: <1c36c334-9f10-3859-c92f-3d889e226769@gmail.com>


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
