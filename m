Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140E8C64ED6
	for <git@archiver.kernel.org>; Wed,  1 Mar 2023 17:50:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjCARuX (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 1 Mar 2023 12:50:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjCARuW (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 1 Mar 2023 12:50:22 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F18121EFF5
        for <git@vger.kernel.org>; Wed,  1 Mar 2023 09:50:18 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id h17-20020a17090aea9100b0023739b10792so32800pjz.1
        for <git@vger.kernel.org>; Wed, 01 Mar 2023 09:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MICoIfM5cHbQUmWxMySO4y4G/2Fj5GPUpehQim2KiPY=;
        b=GDjS3NoN5Etk+qHN8uQrI/sOzFGda2T7whZEASb6Y+z1zJpuKKqyo1eH0rESZPDqnr
         eMfJCCzCW/Cy1Ds6AVRhf7PNuPtltYb4fkYxzZtMioBKuyF1PjWisKKElqrn+YARFwtJ
         xiV15b8QbAmniPQHoDkw+zetIfFI0+j9au2uPeFe59tune4zffNb5ylrMl+rkB/8JiQ6
         4fTnFXDcQFNeMh1vLVbnct+lYU6tEoqfM6wkWt1xQ13cDJDHuoO5ntOftQ4DT6XPah2v
         FS5zyfKrdZoyT2CHPQ9/3G3MaO/R9ZAOfanTAacJEqhgM3lXOwYgc8c8aEsOD5nhswKS
         lcsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MICoIfM5cHbQUmWxMySO4y4G/2Fj5GPUpehQim2KiPY=;
        b=v1mMjMF64g+wVnz4H0FbF+MDwoGrQlhl+r1NAuxIdGgAOrxbFDJSAWvVjvHlB0kCOS
         t7Z4cWsJ1n7vNHdEvAdIs3xDpOfRg1huM/aC1qI0m9R2Y7Kku1cL6SHD2VIGkhhSLVtm
         x1CrBus00NpP/kjqYblDElpGwj2iyhb8nausnaSY0sJAOFWY+Pz0gkRXGvo0pVwj3rjm
         oZ8znfKV8odbB1CMjXgsOcov1l2L+akv14rjgnnmXRBcaFzr8Q0xCyINYdFt+OJjsg7z
         GpQ3elSQLQE/LKGEnm42kz5nQPGWSQAYwtE7pk9jXxgCn9eynuRMvA+ENEItutjllVoW
         fExQ==
X-Gm-Message-State: AO0yUKX4W76giLnfljjVOouUN4gcuTdn7ZKPN8iTPJenOgzIAMHQr5FH
        1JTYpN8Omcu8oE3BTmZdgA63E9apjTU=
X-Google-Smtp-Source: AK7set9qbnpF0VOHrz7arV+DjaDWefZ5VYIslRJ5DQlcTk+CVQ0QLBR9K9WCzrMutBBsFy2213hFDA==
X-Received: by 2002:a17:90b:388c:b0:233:de54:4847 with SMTP id mu12-20020a17090b388c00b00233de544847mr17240063pjb.12.1677693017592;
        Wed, 01 Mar 2023 09:50:17 -0800 (PST)
Received: from localhost (252.157.168.34.bc.googleusercontent.com. [34.168.157.252])
        by smtp.gmail.com with ESMTPSA id k3-20020a170902ba8300b0019a6f32e6c1sm8766342pls.148.2023.03.01.09.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 09:50:17 -0800 (PST)
Sender: Junio C Hamano <jch2355@gmail.com>
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Mar 2023, #01; Wed, 1)
X-master-at: ef7d4f53c2fd9e8186d093dea6d45a91ce57110e
X-next-at: e12885d4f5a6a5e9a900ddf12ad1635bcc81869b
Date:   Wed, 01 Mar 2023 09:50:16 -0800
Message-ID: <xmqqcz5snyxz.fsf@gitster.g>
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

I just tagged Git 2.40-rc1; from here on, let's concentrate on
finding and fixing regressions relative to Git 2.39.

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

* ak/restore-both-incompatible-with-conflicts (2023-02-27) 1 commit
 - restore: fault --staged --worktree with merge opts

 "git restore" supports options like "--ours" that are only
 meaningful during a conflicted merge, but these options are only
 meaningful when updating the working tree files.  These options are
 marked to be incompatible when both "--staged" and "--worktree" are
 in effect.

 Comments?
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
 - push: allow delete single-level ref
 - receive-pack: fix funny ref error messsage

 "git push" has been taught to allow deletion of refs with one-level
 names to help repairing a repository who acquired such a ref by
 mistake.  In general, we don't encourage use of such a ref, and
 creation or update to such a ref is rejected as before.

 Comments?
 source: <pull.1465.v4.git.1677666029.gitgitgadget@gmail.com>


* fz/rebase-msg-update (2023-02-27) 1 commit
  (merged to 'next' on 2023-03-01 at f28c0df111)
 + rebase: fix capitalisation autoSquash in i18n string

 Message update.

 Will cook in 'next'.
 source: <pull.1462.git.git.1677434429160.gitgitgadget@gmail.com>


* gm/signature-format-doc (2023-02-27) 1 commit
  (merged to 'next' on 2023-03-01 at 19f9ce8c40)
 + signature-format.txt: note SSH and X.509 signature delimiters

 Doc update.

 Will cook in 'next'.
 source: <20230227202718.173698-1-gwymor@tilde.club>


* my/wildmatch-cleanups (2023-02-27) 5 commits
 - wildmatch: more cleanups after killing uchar
 - wildmatch: use char instead of uchar
 - wildmatch: remove NEGATE_CLASS(2) macros with trivial refactoring
 - wildmatch: remove IS*() macros
 - git-compat-util: add isblank() and isgraph()

 Code clean-up.

 Comments?
 source: <20230226115021.1681834-1-masahiroy@kernel.org>


* rs/range-diff-custom-abbrev-fix (2023-02-28) 1 commit
  (merged to 'next' on 2023-02-28 at 82f1929a15)
 + range-diff: avoid compiler warning when char is unsigned

 Hotfix for a topic that is already in 'master'.

 Will merge to 'master'.
 source: <1156586e-9dbe-335e-7e33-74eea7913e86@web.de>


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

--------------------------------------------------
[Graduated to 'master']

* ap/t2015-style-update (2023-02-21) 1 commit
  (merged to 'next' on 2023-02-22 at 40883b85c7)
 + t2015-checkout-unborn.sh: changes the style for cd

 Test clean-up.
 source: <20230218192128.7963-1-ashutosh.pandeyhlr007@gmail.com>


* ar/test-lib-remove-stale-comment (2023-02-27) 1 commit
  (merged to 'next' on 2023-02-27 at d948667d2d)
 + test-lib: drop comment about test_description

 Test library clean-up.
 source: <20230226105303.55033-1-rybak.a.v@gmail.com>


* if/simplify-trace-setup (2023-02-21) 1 commit
  (merged to 'next' on 2023-02-24 at 9c8e690f3d)
 + trace.c, git.c: remove unnecessary parameter to trace_repo_setup()

 Code clean-up.
 source: <20230219002527.84315-1-mcsm224@gmail.com>


* jc/countermand-format-attach (2023-02-17) 1 commit
  (merged to 'next' on 2023-02-24 at 709ed91a7c)
 + format.attach: allow empty value to disable multi-part messages

 The format.attach configuration variable lacked a way to override a
 value defined in a lower-priority configuration file (e.g. the
 system one) by redefining it in a higher-priority configuration
 file.  Now, setting format.attach to an empty string means show the
 patch inline in the e-mail message, without using MIME attachment.

 This is a backward incompatible change.
 source: <xmqqwn4fkgtq.fsf@gitster.g>


* jc/diff-algo-attribute (2023-02-21) 2 commits
  (merged to 'next' on 2023-02-22 at 2375640330)
 + diff: teach diff to read algorithm from diff driver
 + diff: consolidate diff algorithm option parsing

 The "diff" drivers specified by the "diff" attribute attached to
 paths can now specify which algorithm (e.g. histogram) to use.
 source: <pull.1452.v4.git.git.1676927082.gitgitgadget@gmail.com>


* jk/http-proxy-tests (2023-02-16) 1 commit
  (merged to 'next' on 2023-02-22 at f1f69d188f)
 + add basic http proxy tests

 Test updates.
 source: <Y+6YgALh6L9m6rSX@coredump.intra.peff.net>


* jk/http-test-fixes (2023-02-23) 16 commits
  (merged to 'next' on 2023-02-24 at 8f3d70acc4)
 + t5559: make SSL/TLS the default
 + t5559: fix test failures with LIB_HTTPD_SSL
 + t/lib-httpd: enable HTTP/2 "h2" protocol, not just h2c
 + t/lib-httpd: respect $HTTPD_PROTO in expect_askpass()
 + t5551: drop curl trace lines without headers
 + t5551: handle v2 protocol in cookie test
 + t5551: simplify expected cookie file
 + t5551: handle v2 protocol in upload-pack service test
 + t5551: handle v2 protocol when checking curl trace
 + t5551: stop forcing clone to run with v0 protocol
 + t5551: handle HTTP/2 when checking curl trace
 + t5551: lower-case headers in expected curl trace
 + t5551: drop redundant grep for Accept-Language
 + t5541: simplify and move "no empty path components" test
 + t5541: stop marking "used receive-pack service" test as v0 only
 + t5541: run "used receive-pack service" test earlier

 Various fix-ups on HTTP tests.
 source: <Y/dEYYWKy/o96vBG@coredump.intra.peff.net>


* jk/shorten-unambiguous-ref-wo-sscanf (2023-02-15) 3 commits
  (merged to 'next' on 2023-02-24 at 12ca5684f0)
 + shorten_unambiguous_ref(): avoid sscanf()
 + shorten_unambiguous_ref(): use NUM_REV_PARSE_RULES constant
 + shorten_unambiguous_ref(): avoid integer truncation

 sscanf(3) used in "git symbolic-ref --short" implementation found
 to be not working reliably on macOS in UTF-8 locales.  Rewrite the
 code to avoid sscanf() altogether to work it around.
 source: <Y+z3MtgayoXsxaHA@coredump.intra.peff.net>


* ma/fetch-parallel-use-online-cpus (2023-02-21) 1 commit
  (merged to 'next' on 2023-02-22 at 756d379bf0)
 + fetch: choose a sensible default with --jobs=0 again

 "git fetch --jobs=0" used to hit a BUG(), which has been corrected
 to use the available CPUs.
 source: <pull.1483.git.1676928805555.gitgitgadget@gmail.com>


* mh/credential-password-expiry (2023-02-22) 1 commit
  (merged to 'next' on 2023-02-24 at dbff7db22a)
 + credential: new attribute password_expiry_utc

 The credential subsystem learned that a password may have an
 explicit expiration.
 source: <pull.1443.v4.git.git.1676701977347.gitgitgadget@gmail.com>


* ps/free-island-marks (2023-02-21) 1 commit
  (merged to 'next' on 2023-02-22 at f46938bce3)
 + delta-islands: fix segfault when freeing island marks

 Fix on a previous fix already in 'master'.
 source: <61e490595b80b34c55fd640e093e021ff6fa9591.1676542973.git.ps@pks.im>


* pw/rebase-i-parse-fix (2023-02-23) 2 commits
  (merged to 'next' on 2023-02-24 at 5a2a2569eb)
 + rebase -i: fix parsing of "fixup -C<commit>"
 + rebase -i: match whole word in is_command()

 Fixes to code that parses the todo file used in "rebase -i".
 source: <pull.1486.git.1677185701.gitgitgadget@gmail.com>


* pw/rebase-i-validate-labels-early (2023-02-21) 1 commit
  (merged to 'next' on 2023-02-22 at 9b37d42d24)
 + rebase -i: check labels and refs when parsing todo list

 An invalid label or ref in the "rebase -i" todo file used to
 trigger an runtime error. SUch an error is now diagnosed while the
 todo file is parsed.
 source: <pull.1482.v2.git.1676902774366.gitgitgadget@gmail.com>


* rs/archive-mtime (2023-02-18) 1 commit
  (merged to 'next' on 2023-02-24 at 34869696a2)
 + archive: add --mtime

 "git archive HEAD^{tree}" records the paths with the current
 timestamp in the archive, making it harder to obtain a stable
 output.  The command learned the --mtime option to specify an
 arbitrary timestamp (e.g. --mtime="@0 +0000" for the epoch).
 source: <91a73f5d-ca3e-6cb0-4ba3-38d703074ee6@web.de>


* tb/drop-dir-iterator-follow-symlink-bit (2023-02-16) 2 commits
  (merged to 'next' on 2023-02-22 at 785e1f323e)
 + t0066: drop setup of "dir5"
 + dir-iterator: drop unused `DIR_ITERATOR_FOLLOW_SYMLINKS`

 Remove leftover and unused code.
 source: <9bb10b607e46f867a3f8f5c71abf13c990d1ecfe.1676572031.git.me@ttaylorr.com>
 source: <CAGdrTFhHBU2BNYdYr7LbOS7i1LOHGjWLw_d5ZJAXxvTKyLiFCA@mail.gmail.com>


* tl/range-diff-custom-abbrev (2023-02-21) 1 commit
  (merged to 'next' on 2023-02-22 at 49db7cce13)
 + range-diff: let '--abbrev' option takes effect

 "git range-diff" learned --abbrev=<num> option.
 source: <20230220142444.18739-2-tenglong.tl@alibaba-inc.com>


* zy/t9700-style (2023-02-25) 1 commit
  (merged to 'next' on 2023-02-27 at 6c52b8ebb2)
 + t9700: modernize test scripts

 Test style fixes.
 source: <20230225013003.1971931-1-18994118902@163.com>

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

* ah/rebase-merges-config (2023-02-25) 3 commits
 - rebase: add a config option for --rebase-merges
 - rebase: deprecate --rebase-merges=""
 - rebase: add documentation and test for --no-rebase-merges

 Streamline --rebase-merges command line option handling and
 introduce rebase.merges configuration variable.

 On hold.
 cf. <b4be9cb3-c24b-4377-bab3-5d53035efdf8@gmx.de>
 source: <20230225180325.796624-1-alexhenrie24@gmail.com>


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
 - commit-reach: avoid NULL dereference

 Under discussion.
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
 - tests: don't lose misc "git" exit codes
 - tests: don't lose exit status with "test <op> $(git ...)"
 - tests: don't lose "git" exit codes in "! ( git ... | grep )"
 - tests: don't lose exit status with "(cd ...; test <op> $(git ...))"
 - t/lib-patch-mode.sh: fix ignored exit codes
 - auto-crlf tests: don't lose exit code in loops and outside tests

 Test clean-up.

 Will merge to 'next'.
 source: <cover-v5-0.6-00000000000-20230206T224200Z-avarab@gmail.com>


* rj/branch-unborn-in-other-worktrees (2023-02-22) 3 commits
 - branch: rename orphan branches in any worktree
 - branch: description for orphan branch errors
 - branch: avoid unnecessary worktrees traversals

 Error messages given when working on an unborn branch that is
 checked out in another worktree have been improvved.

 Comments?
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

 Drop [06/10] step before merging in?
 cf. <kl6lfsaw84vo.fsf@chooglen-macbookpro.roam.corp.google.com>
 source: <cover-v5-00.10-00000000000-20230207T154000Z-avarab@gmail.com>


* cb/checkout-same-branch-twice (2023-01-20) 1 commit
 - checkout/switch: disallow checking out same branch in multiple worktrees

 "git checkout -B $branch" failed to protect against checking out
 a branch that is checked out elsewhere, unlike "git branch -f" did.

 Expecting a hopefully minor and final reroll.
 cf. <8f24fc3c-c30f-dc70-5a94-5ee4ed3de102@dunelm.org.uk>
 source: <20230120113553.24655-1-carenas@gmail.com>


* rj/avoid-switching-to-already-used-branch (2023-02-25) 4 commits
 - switch: reject if the branch is already checked out elsewhere (test)
 - rebase: refuse to switch to a branch already checked out elsewhere (test)
 - branch: fix die_if_checked_out() when ignore_current_worktree
 - worktree: introduce is_shared_symref()

 A few subcommands have been taught to stop users from working on a
 branch that is being used in another worktree linked to the same
 repository.
 source: <6fed3b1b-1c4e-9298-19b6-7ad9c04c87dd@gmail.com>


* rj/bisect-already-used-branch (2023-01-22) 1 commit
 - bisect: fix "reset" when branch is checked out elsewhere

 Allow "git bisect reset [name]" to check out the named branch (or
 the original one) even when the branch is already checked out in a
 different worktree linked to the same repository.

 Will merge to 'next'.
 source: <1c36c334-9f10-3859-c92f-3d889e226769@gmail.com>


* ms/send-email-feed-header-to-validate-hook (2023-01-19) 2 commits
 - send-email: expose header information to git-send-email's sendemail-validate hook
 - send-email: refactor header generation functions

 "git send-email" learned to give the e-mail headers to the validate
 hook by passing an extra argument from the command line.

 Expecting a hopefully minor and final reroll.
 cf. <c1ba0a28-3c39-b313-2757-dceb02930334@amd.com>
 source: <20230120012459.920932-1-michael.strawbridge@amd.com>


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
