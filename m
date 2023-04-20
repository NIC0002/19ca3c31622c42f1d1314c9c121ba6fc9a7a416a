Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2EC1C7618E
	for <git@archiver.kernel.org>; Thu, 20 Apr 2023 22:35:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232050AbjDTWfp (ORCPT <rfc822;git@archiver.kernel.org>);
        Thu, 20 Apr 2023 18:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232958AbjDTWfl (ORCPT <rfc822;git@vger.kernel.org>);
        Thu, 20 Apr 2023 18:35:41 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D4135A7
        for <git@vger.kernel.org>; Thu, 20 Apr 2023 15:35:18 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1a682eee3baso13452775ad.0
        for <git@vger.kernel.org>; Thu, 20 Apr 2023 15:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682030068; x=1684622068;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :subject:to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8C/2/JC5AyGYU5qKN5VC13XVZv0tggw/WcW64aEdPW8=;
        b=YDgsm1XkN9M3l3dkSIsrHSNnX5LuEFDSYsDElnw8JZeiANcTq2VZtEKLdiO/QQfhRW
         Uvb2B2XSqp1Y9/IXP57mWXts9mOazIjK4XDRze5YEgSwqjHaFxspR3IH0lGvw1r0olN1
         6AMI98+izMK5RM6xQYylFrJfI8dytvXnsAgSUXuPZZoA6yy5PHEVnzYjNjVIFfpBm+/H
         Bp5RCtn5j4XU3RSdITyqhjaesNACfCzGwL9PNV0K2hy0EzKlV3eoyFOOTOAKkJbIGg27
         16XZKV8CzPoxZfu2+xzylgiJOgAtUpJrdZSkV9HJsCWPBvRDJvO/84b1pq3T3eST5pYC
         Qe4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682030068; x=1684622068;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :subject:to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8C/2/JC5AyGYU5qKN5VC13XVZv0tggw/WcW64aEdPW8=;
        b=j5hinJDzKlf2NK6Z4P/5T8bieyGBrZhylpiFw5XH6qrH2PS/9InS5JRBEM0jI3Os/S
         tR7KhH0Ch2qJniugEMskrznHxr8KDfNfFS4it3AFvsgrhwkcwcp/GXh0Ev/QFtxGLJaC
         XeRflx/bgWBZf7T6FYLNqwd/NX9cbH5NSzsRHJYqoAAwygP4nBwj+a0e7UR8VAvNFyVG
         pFgLWsI50WT3Sf7axPrxEtm2Qm/Jsmftm2EpYCZxPp5MvLsk60wMCf13MTlPozhyhHD6
         pNQ8rlfJ7hY5m8I+Nl8Xqlw9hFjk/IZlzVMSvZfuaFfLiwlymQf0Ya2dnGp9FhTgEROv
         N2kA==
X-Gm-Message-State: AAQBX9fvNbY6CVE9CTefDGdhw5K52/MhUMY7a/JNKTNqm0ISzEjJxusq
        T8uk7PDWh6eyThYxyqaC2rl6lai3AUk=
X-Google-Smtp-Source: AKy350ZiQ2uG62yGSKX/uhAFofP+IAY3mft+fc8wISxceil3Vg937egInldOCbT3XDsVVkA7Lt0G2g==
X-Received: by 2002:a17:902:f707:b0:1a4:fe07:49e9 with SMTP id h7-20020a170902f70700b001a4fe0749e9mr2947827plo.63.1682030067673;
        Thu, 20 Apr 2023 15:34:27 -0700 (PDT)
Received: from localhost (170.102.105.34.bc.googleusercontent.com. [34.105.102.170])
        by smtp.gmail.com with ESMTPSA id z13-20020a17090acb0d00b00227223c58ecsm1230336pjt.42.2023.04.20.15.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 15:34:27 -0700 (PDT)
Sender: Junio C Hamano <jch2355@gmail.com>
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Apr 2023, #06; Thu, 20)
X-master-at: 9c6990cca24301ae8f82bf6291049667a0aef14b
X-next-at: bd7f14d9353b7ce9acf82b32f80f585373a5ebe3
Date:   Thu, 20 Apr 2023 15:34:26 -0700
Message-ID: <xmqqwn26w5cd.fsf@gitster.g>
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
[Graduated to 'master']

* ar/t2024-checkout-output-fix (2023-04-10) 1 commit
  (merged to 'next' on 2023-04-13 at a35a043d6c)
 + t2024: fix loose/strict local base branch DWIM test

 Test fix.
 source: <20230408205450.569548-1-rybak.a.v@gmail.com>


* gc/better-error-when-local-clone-fails-with-symlink (2023-04-11) 1 commit
  (merged to 'next' on 2023-04-13 at fff15efe05)
 + clone: error specifically with --local and symlinked objects

 "git clone --local" stops copying from an original repository that
 has symbolic links inside its $GIT_DIR; an error message when that
 happens has been updated.
 source: <pull.1488.v2.git.git.1681165130765.gitgitgadget@gmail.com>


* rs/get-tar-commit-id-use-defined-const (2023-04-10) 1 commit
  (merged to 'next' on 2023-04-13 at ad62b4545a)
 + get-tar-commit-id: use TYPEFLAG_GLOBAL_HEADER instead of magic value

 Code clean-up to replace a hardcoded constant with a CPP macro.
 source: <79497392-0296-2ae3-2560-1f90c1a309b5@web.de>


* rs/remove-approxidate-relative (2023-04-10) 1 commit
  (merged to 'next' on 2023-04-13 at bd7df5f98c)
 + date: remove approxidate_relative()

 The approxidate() API has been simplified by losing an extra
 function that did the same thing as another one.
 source: <f5b9a290-7cec-7a83-660b-e15494d2cdc8@web.de>


* rs/userdiff-multibyte-regex (2023-04-07) 1 commit
  (merged to 'next' on 2023-04-13 at 348908c03c)
 + userdiff: support regexec(3) with multi-byte support

 The userdiff regexp patterns for various filetypes that are built
 into the system have been updated to avoid triggering regexp errors
 from UTF-8 aware regex engines.
 source: <7327ac06-d5da-ec53-543e-78e7729e78bb@web.de>

--------------------------------------------------
[New Topics]

* ar/config-count-tests-updates (2023-04-18) 4 commits
 - SQUASH???
 - t1300: add tests for missing keys
 - t1300: check stderr for "ignores pairs" tests
 - t1300: drop duplicate test

 Test updates.

 Expecting a reroll.
 source: <20230418175034.982433-1-rybak.a.v@gmail.com>


* en/header-split-cache-h-part-2 (2023-04-18) 23 commits
 - reftable: ensure git-compat-util.h is the first (indirect) include
 - diff.h: reduce unnecessary includes
 - object-store.h: reduce unnecessary includes
 - commit.h: reduce unnecessary includes
 - fsmonitor: reduce includes of cache.h
 - cache.h: remove unnecessary headers
 - treewide: remove cache.h inclusion due to previous changes
 - cache,tree: move basic name compare functions from read-cache to tree
 - cache,tree: move cmp_cache_name_compare from tree.[ch] to read-cache.c
 - hash.h, repository.h: reverse the order of these dependencies
 - tree-diff.c: move S_DIFFTREE_IFXMIN_NEQ define from cache.h
 - dir.h: move DTYPE defines from cache.h
 - versioncmp.h: move declarations for versioncmp.c functions from cache.h
 - ws.h: move declarations for ws.c functions from cache.h
 - match-trees.h: move declarations for match-trees.c functions from cache.h
 - pkt-line.h: move declarations for pkt-line.c functions from cache.h
 - base85.h: move declarations for base85.c functions from cache.h
 - copy.h: move declarations for copy.c functions from cache.h
 - server-info.h: move declarations for server-info.c functions from cache.h
 - packfile.h: move pack_window and pack_entry from cache.h
 - symlinks.h: move declarations for symlinks.c functions from cache.h
 - treewide: be explicit about dependence on strbuf.h
 - Merge branch 'en/header-split-cache-h' into en/header-split-cache-h-part-2
 (this branch uses en/header-split-cache-h.)

 More header clean-up.

 Will merge to 'next'?
 source: <pull.1517.git.1681614205.gitgitgadget@gmail.com>


* fc/doc-checkout-markup-updates (2023-04-18) 2 commits
  (merged to 'next' on 2023-04-20 at 62782d75c4)
 + doc: git-checkout: reorganize examples
 + doc: git-checkout: trivial callout cleanup

 Doc mark-up update.

 Will merge to 'master'.
 source: <20230418070048.2209469-1-felipe.contreras@gmail.com>


* jk/gpg-trust-level-fix (2023-04-19) 1 commit
 - gpg-interface: set trust level of missing key to "undefined"

 The "%GT" placeholder for the "--format" option of "git log" and
 friends caused BUG() to trigger on a commit signed with an unknown
 key, which has been corrected.

 Will merge to 'next'.
 source: <20230419012957.GA503941@coredump.intra.peff.net>


* ps/fetch-output-format (2023-04-19) 8 commits
 - fetch: introduce machine-parseable "porcelain" output format
 - fetch: introduce new `--output-format` option
 - fetch: move option related variables into main function
 - fetch: move display format parsing into main function
 - fetch: introduce `display_format` enum
 - fetch: fix missing from-reference when fetching HEAD:foo
 - fetch: add a test to exercise invalid output formats
 - fetch: split out tests for output format

 "git fetch" learned the "--output-format" option that emits what it
 did in a machine-parseable format.

 Needs review.
 source: <cover.1681906948.git.ps@pks.im>


* en/ort-finalize-after-0-merges-fix (2023-04-20) 2 commits
 - SQUASH??? futureproofing suggestion by Derrick
 - merge-ort: fix calling merge_finalize() with no intermediate merge

 source: <pull.1518.git.1681974847078.gitgitgadget@gmail.com>


* ma/gittutorial-fixes (2023-04-20) 2 commits
 - gittutorial: wrap literal examples in backticks
 - gittutorial: drop early mention of origin

 source: <cover.1681579244.git.martin.agren@gmail.com>


* sg/retire-unused-cocci (2023-04-20) 1 commit
 - cocci: remove 'unused.cocci'

 source: <20230420205350.600760-1-szeder.dev@gmail.com>

--------------------------------------------------
[Stalled]

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


* mh/use-wincred-from-system (2023-03-27) 1 commit
 - credential/wincred: include wincred.h

 Code clean-up.

 May want to discard.
 Area maintainer is fairly negative.
 cf. <8511e030-8167-715c-5ed4-1646e6e9ef85@gmx.de>
 source: <pull.1496.git.1679707396407.gitgitgadget@gmail.com>


* cb/checkout-same-branch-twice (2023-03-22) 2 commits
 - SQUASH??? the test marked to expect failure passes from day one
 - checkout/switch: disallow checking out same branch in multiple worktrees

 "git checkout -B $branch" failed to protect against checking out
 a branch that is checked out elsewhere, unlike "git branch -f" did.

 Expecting a hopefully minor and final reroll.
 cf. <CAPUEspj_Bh+LgYLnWfeBdcq_uV5Cbou-7H51GLFjzSa5Qzby9w@mail.gmail.com>
 source: <20230120113553.24655-1-carenas@gmail.com>


* ob/revert-of-revert (2023-03-28) 1 commit
 - sequencer: call a revert of a revert "reapply"

 Instead of "Revert "Revert "original"", give "Replay "original""
 as the title for a revert of a revert.

 Needs more polishing: docs, tests, transitions.
 source: <20230323162234.995465-1-oswald.buddenhagen@gmx.de>


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

* ds/fsck-pack-revindex (2023-04-17) 5 commits
  (merged to 'next' on 2023-04-19 at 6fb9527bf5)
 + fsck: validate .rev file header
 + fsck: check rev-index position values
 + fsck: check rev-index checksums
 + fsck: create scaffolding for rev-index checks
 + Merge branch 'tb/pack-revindex-on-disk' into ds/fsck-pack-revindex
 (this branch uses tb/pack-revindex-on-disk.)

 "git fsck" learned to validate the on-disk pack reverse index files.

 Will merge to 'master'.
 source: <pull.1512.git.1681748502.gitgitgadget@gmail.com>


* tb/enable-cruft-packs-by-default (2023-04-18) 10 commits
 - repository.h: drop unused `gc_cruft_packs`
 - builtin/gc.c: make `gc.cruftPacks` enabled by default
 - t/t9300-fast-import.sh: prepare for `gc --cruft` by default
 - t/t6500-gc.sh: add additional test cases
 - t/t6500-gc.sh: refactor cruft pack tests
 - t/t6501-freshen-objects.sh: prepare for `gc --cruft` by default
 - t/t5304-prune.sh: prepare for `gc --cruft` by default
 - builtin/gc.c: ignore cruft packs with `--keep-largest-pack`
 - builtin/repack.c: fix incorrect reference to '-C'
 - pack-write.c: plug a leak in stage_tmp_packfiles()

 When "gc" needs to retain unreachable objects, packing them into
 cruft packs (instead of exploding them into loose object files) has
 been offered as a more efficient option for some time.  Now the use
 of cruft packs has been made the default and no longer considered
 an experimental feature.

 Will merge to 'next'.
 source: <cover.1681850424.git.me@ttaylorr.com>


* ms/send-email-feed-header-to-validate-hook (2023-04-19) 2 commits
 - send-email: expose header information to git-send-email's sendemail-validate hook
 - send-email: refactor header generation functions

 "git send-email" learned to give the e-mail headers to the validate
 hook by passing an extra argument from the command line.
 source: <20230419202703.2911836-1-michael.strawbridge@amd.com>


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

 Comments?
 source: <20230417093255.31079-1-jacobabel@nullpo.dev>


* gc/doc-cocci-updates (2023-04-12) 2 commits
 - cocci: codify authoring and reviewing practices
 - cocci: add headings to and reword README

 Update documentation regarding Coccinelle patches.

 Expecting review response.
 cf. <xmqqmt3by5sc.fsf@gitster.g>
 source: <pull.1495.git.git.1681329955.gitgitgadget@gmail.com>


* jk/protocol-cap-parse-fix (2023-04-14) 7 commits
  (merged to 'next' on 2023-04-17 at fd9bf05656)
 + v0 protocol: use size_t for capability length/offset
 + t5512: test "ls-remote --heads --symref" filtering with v0 and v2
 + t5512: allow any protocol version for filtered symref test
 + t5512: add v2 support for "ls-remote --symref" test
 + v0 protocol: fix sha1/sha256 confusion for capabilities^{}
 + t5512: stop referring to "v1" protocol
 + v0 protocol: fix infinite loop when parsing multi-valued capabilities

 The code to parse capability list for v0 on-wire protocol fell into
 an infinite loop when a capability appears multiple times, which
 has been corrected.

 Will merge to 'master'.
 source: <20230414212404.GA639653@coredump.intra.peff.net>


* kh/doc-interpret-trailers-updates (2023-04-12) 4 commits
 - doc: interpret-trailers: fix example
 - doc: interpret-trailers: don’t use deprecated config
 - doc: interpret-trailers: use input redirection
 - doc: interpret-trailers: don’t use heredoc in examples

 Doc update.

 Expecting a reroll.
 cf. <xmqqcz487qds.fsf@gitster.g>, <xmqqjzyg7qdw.fsf@gitster.g>
 source: <cover.1681326818.git.code@khaugsbakk.name>


* ps/fix-geom-repack-with-alternates (2023-04-14) 10 commits
  (merged to 'next' on 2023-04-18 at de56e80363)
 + repack: disable writing bitmaps when doing a local repack
 + repack: honor `-l` when calculating pack geometry
 + t/helper: allow chmtime to print verbosely without modifying mtime
 + pack-objects: extend test coverage of `--stdin-packs` with alternates
 + pack-objects: fix error when same packfile is included and excluded
 + pack-objects: fix error when packing same pack twice
 + pack-objects: split out `--stdin-packs` tests into separate file
 + repack: fix generating multi-pack-index with only non-local packs
 + repack: fix trying to use preferred pack in alternates
 + midx: fix segfault with no packs and invalid preferred pack

 Geometric repacking ("git repack --geometric=<n>") in a repository
 that borrows from an alternate object database had various corner
 case bugs, which have been corrected.

 Will merge to 'master'.
 source: <cover.1681452028.git.ps@pks.im>


* rj/send-email-validate-hook-count-messages (2023-04-14) 1 commit
  (merged to 'next' on 2023-04-18 at 0c3db0bd3b)
 + send-email: export patch counters in validate environment

 The sendemail-validate validate hook learned to pass the total
 number of input files and where in the sequence each invocation is
 via environment variables.

 Will merge to 'master'.
 source: <20230414155249.667180-1-robin@jarry.cc>


* tb/pack-revindex-on-disk (2023-04-13) 7 commits
  (merged to 'next' on 2023-04-19 at d6b90b44cf)
 + t: invert `GIT_TEST_WRITE_REV_INDEX`
 + config: enable `pack.writeReverseIndex` by default
 + pack-revindex: introduce `pack.readReverseIndex`
 + pack-revindex: introduce GIT_TEST_REV_INDEX_DIE_ON_DISK
 + pack-revindex: make `load_pack_revindex` take a repository
 + t5325: mark as leak-free
 + pack-write.c: plug a leak in stage_tmp_packfiles()
 (this branch is used by ds/fsck-pack-revindex.)

 The on-disk reverse index that allows mapping from the pack offset
 to the object name for the object stored at the offset has been
 enabled by default.

 Will merge to 'master'.
 source: <cover.1681338013.git.me@ttaylorr.com>


* fc/doc-use-datestamp-in-commit (2023-04-14) 3 commits
  (merged to 'next' on 2023-04-20 at 3b6ccb62ec)
 + doc: set actual revdate for manpages
 + Merge branch 'fc/doc-stop-using-manversion' into fc/doc-use-datestamp-in-commit
 + Merge branch 'fc/remove-header-workarounds-for-asciidoc' into fc/doc-use-datestamp-in-commit
 (this branch uses fc/doc-stop-using-manversion.)

 Instead of the time the formatter was run, show the timestamp
 recorded in the commit in the documentation.

 Will merge to 'master'.
 source: <20230413074722.71260-1-felipe.contreras@gmail.com>


* pb/complete-and-document-auto-merge-and-friends (2023-04-14) 5 commits
  (merged to 'next' on 2023-04-20 at 2728a01622)
 + completion: complete AUTO_MERGE
 + Documentation: document AUTO_MERGE
 + git-merge.txt: modernize word choice in "True merge" section
 + completion: complete REVERT_HEAD and BISECT_HEAD
 + revisions.txt: document more special refs

 Document more pseudo-refs and teach the command line completion
 machinery to complete AUTO_MERGE.

 Will merge to 'master'.
 source: <pull.1515.git.1681495119.gitgitgadget@gmail.com>


* tb/ban-strtok (2023-04-18) 6 commits
 - banned.h: mark `strtok()` as banned
 - t/helper/test-json-writer.c: avoid using `strtok()`
 - t/helper/test-oidmap.c: avoid using `strtok()`
 - t/helper/test-hashmap.c: avoid using `strtok()`
 - string-list: introduce `string_list_setlen()`
 - string-list: introduce `string_list_split_in_place_multi()`

 Mark strtok() and strtok_r() to be banned.

 Comments?
 source: <cover.1681845518.git.me@ttaylorr.com>


* fc/doc-stop-using-manversion (2023-04-10) 1 commit
  (merged to 'next' on 2023-04-14 at 0800fe5ab4)
 + doc: simplify man version
 (this branch is used by fc/doc-use-datestamp-in-commit.)

 Doc build simplification.

 Will merge to 'master'.
 source: <20230408001829.11031-1-felipe.contreras@gmail.com>


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


* ow/ref-filter-omit-empty (2023-04-13) 1 commit
  (merged to 'next' on 2023-04-14 at 2798986c60)
 + branch, for-each-ref, tag: add option to omit empty lines

 "git branch --format=..." and "git format-patch --format=..."
 learns "--omit-empty" to hide refs that whose formatting result
 becomes an empty string from the output.

 Will merge to 'master'.
 source: <20230407175316.6404-1-oystwa@gmail.com>


* rn/sparse-describe (2023-04-03) 1 commit
  (merged to 'next' on 2023-04-14 at 9699cfad2c)
 + describe: enable sparse index for describe

 "git describe --dirty" learns to work better with sparse-index.

 Will merge to 'master'.
 source: <20230403164749.246001-1-nanth.raghul@gmail.com>


* ah/format-patch-thread-doc (2023-04-03) 1 commit
  (merged to 'next' on 2023-04-14 at acf141a832)
 + format-patch: correct documentation of --thread without an argument

 Doc update.

 Will merge to 'master'.
 source: <20230403040724.642513-1-alexhenrie24@gmail.com>


* ar/test-cleanup-unused-file-creation-part2 (2023-04-17) 6 commits
 - t2019: don't create unused files
 - t1502: don't create unused files
 - t1450: don't create unused files
 - t1300: don't create unused files
 - t1300: fix config file syntax error descriptions
 - t0300: don't create unused file

 Test cleanup.

 Comments?
 source: <20230417191044.909094-1-rybak.a.v@gmail.com>


* en/header-split-cache-h (2023-04-18) 25 commits
  (merged to 'next' on 2023-04-18 at 55b4d95cac)
 + protocol.h: move definition of DEFAULT_GIT_PORT from cache.h
  (merged to 'next' on 2023-04-13 at b9afefff0b)
 + mailmap, quote: move declarations of global vars to correct unit
 + treewide: reduce includes of cache.h in other headers
 + treewide: remove double forward declaration of read_in_full
 + cache.h: remove unnecessary includes
 + treewide: remove cache.h inclusion due to pager.h changes
 + pager.h: move declarations for pager.c functions from cache.h
 + treewide: remove cache.h inclusion due to editor.h changes
 + editor: move editor-related functions and declarations into common file
 + treewide: remove cache.h inclusion due to object.h changes
 + object.h: move some inline functions and defines from cache.h
 + treewide: remove cache.h inclusion due to object-file.h changes
 + object-file.h: move declarations for object-file.c functions from cache.h
 + treewide: remove cache.h inclusion due to git-zlib changes
 + git-zlib: move declarations for git-zlib functions from cache.h
 + treewide: remove cache.h inclusion due to object-name.h changes
 + object-name.h: move declarations for object-name.c functions from cache.h
 + treewide: remove unnecessary cache.h inclusion
 + treewide: be explicit about dependence on mem-pool.h
 + treewide: be explicit about dependence on oid-array.h
 + treewide: be explicit about dependence on pack-revindex.h
 + treewide: be explicit about dependence on convert.h
 + treewide: be explicit about dependence on advice.h
 + treewide: be explicit about dependence on trace.h & trace2.h
 + Merge branch 'ab/remove-implicit-use-of-the-repository' into en/header-split-cache-h
 (this branch is used by en/header-split-cache-h-part-2.)

 Header clean-up.

 Will merge to 'master'.
 source: <pull.1509.v3.git.1681182060.gitgitgadget@gmail.com>


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


* pw/sequencer-rescheduled-ones-are-not-done-yet (2023-03-20) 1 commit
 - rebase -i: do not update "done" when rescheduling command

 "rebase -i" moved a "rescheduled" insn in the todo file to the
 "done" list before it completed, which has been corrected.

 Expecting clarification.
 source: <pull.1492.git.1679237337683.gitgitgadget@gmail.com>


* rs/archive-from-subdirectory-fixes (2023-03-24) 1 commit
  (merged to 'next' on 2023-04-14 at 950f9ed807)
 + archive: improve support for running in subdirectory

 "git archive" run from a subdirectory mishandled attributes and
 paths outside the current directory.

 Will merge to 'master'.
 source: <7c33b01b-7b2a-25fa-9a66-1e65cd12bc84@web.de>


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


* sl/diff-files-sparse (2023-03-22) 2 commits
 - diff-files: integrate with sparse index
 - t1092: add tests for `git diff-files`

 Teach "diff-files" not to expand sparse-index unless needed.

 Expecting a reroll.
 cf. <c382017a-8c65-24ba-5092-6b46428d8b9b@github.com>
 source: <20230322161820.3609-1-cheskaqiqi@gmail.com>


* rj/branch-unborn-in-other-worktrees (2023-03-27) 5 commits
 - branch: avoid unnecessary worktrees traversals
 - branch: rename orphan branches in any worktree
 - branch: description for orphan branch errors
 - branch: use get_worktrees() in copy_or_rename_branch()
 - branch: test for failures while renaming branches

 Error messages given when working on an unborn branch that is
 checked out in another worktree have been improved.

 Will merge to 'next'?
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


* rj/sendemail-validate-series-hook (2023-04-05) 1 commit
 . hooks: add sendemail-validate-series

 "git send-email" learns a new hook that takes the entire set of
 patch files from its standard input to validate them in one go,
 instead of getting called once per each file.

 Superseded by the rj/send-email-validate-hook-count-messages topic.
 source: <20230405231305.96996-1-robin@jarry.cc>


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
