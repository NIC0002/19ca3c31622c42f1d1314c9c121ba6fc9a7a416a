Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03087C77B61
	for <git@archiver.kernel.org>; Wed, 26 Apr 2023 00:18:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238378AbjDZAS2 (ORCPT <rfc822;git@archiver.kernel.org>);
        Tue, 25 Apr 2023 20:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232211AbjDZAS1 (ORCPT <rfc822;git@vger.kernel.org>);
        Tue, 25 Apr 2023 20:18:27 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C49B208
        for <git@vger.kernel.org>; Tue, 25 Apr 2023 17:18:23 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1a80d827179so52201955ad.3
        for <git@vger.kernel.org>; Tue, 25 Apr 2023 17:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682468302; x=1685060302;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :subject:to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jme03kb3Kp5wnCzK8lIf7VHA4s82e8By6zwFrS7OytU=;
        b=Kk+qHg04RXOClHkOzQhqialYnGhrdCsGh1CGqwDgDnSDdWy7Gwt2vFNqv08O5Pfock
         T1125X/YkADpIhM9Z6Zbjk0UjnlTsOyBeqnckj9bs3vRdcuraHfno6rjlT9G/+FBxFCK
         zZ1KrCqnaQCy9y5YwBx266i0H5ZTBP/VpuynyqqOG65OblZ+Jo3X/Gx0yqNZVQg7+h1d
         TrDYvikL5lzEu4pI+ZPNn8xj1xZqV2Yrew32UCQCU/dzh/4AqoyjsYdFXHqVQERF9Aeq
         0HTR2PYC9fSQuC2mNtpTgbXquoF5AD2bf/nl3qevy7StXhM6OZXHnJyqWqpbMS2X/tqF
         xgvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682468302; x=1685060302;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :subject:to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jme03kb3Kp5wnCzK8lIf7VHA4s82e8By6zwFrS7OytU=;
        b=Z+LKODo/PXBriZ69HTvECa0Rjh/2IZ5Moj02uDh48EKglB/QIlKEtSwDk0mGN+/PTh
         r6x52Xrf6lxpHSVgWoD4KJPrasLHDU95YI0sCSawiGTj+1NdqfBaAtKzet9dr/kojV3W
         ge72J5hLGeEL9GyAt/QXcLbuDF5PnsGMyNB7NM/hyIg0XKqG25FcmvDb65RZsJufPW7/
         5ebSGn+Ic1t7am7Dib7GQ0F5ID94G6mAqVghkk9CTJFulKbD29OGwFqf2oBhW6fIhEzy
         UDT9oqA5AGrk+hiEg/kewzicJZHSfeCYu5GeonMvFZOYIUbgzCTCgwJ0yhbWxfw/wupe
         9ZQA==
X-Gm-Message-State: AC+VfDxxO2PVx7TtFWKkPvQMHvIjk3lYNYfJWY58nGc++Rc35Fmjf0Rs
        h5GnOpL5qKyAjTT8x5hs6qbu/PxUxyw=
X-Google-Smtp-Source: ACHHUZ6SPsKQOHCyr94dKjDBkCRTTImRLK/6ZHqxaELavH55Ql2kL1co5YKgMWlYTm0yDwJFCd1w2Q==
X-Received: by 2002:a17:903:22c5:b0:1a9:7dc2:9435 with SMTP id y5-20020a17090322c500b001a97dc29435mr8049983plg.0.1682468301720;
        Tue, 25 Apr 2023 17:18:21 -0700 (PDT)
Received: from localhost (187.137.203.35.bc.googleusercontent.com. [35.203.137.187])
        by smtp.gmail.com with ESMTPSA id z2-20020a170902708200b001a19196af48sm8776342plk.64.2023.04.25.17.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 17:18:21 -0700 (PDT)
Sender: Junio C Hamano <jch2355@gmail.com>
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Apr 2023, #07; Tue, 25)
X-master-at: 2807bd2c10606e590886543afe4e4f208dddd489
X-next-at: 96c395b00cfdcc2a001874b3e5d6fadf5fd01d38
Date:   Tue, 25 Apr 2023 17:18:20 -0700
Message-ID: <xmqq354nxzqr.fsf@gitster.g>
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

A set of new maintenance releases to address some security issues
have been made; all the integration tracks also have the same fixes.

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

* ah/format-patch-thread-doc (2023-04-03) 1 commit
  (merged to 'next' on 2023-04-14 at acf141a832)
 + format-patch: correct documentation of --thread without an argument

 Doc update.
 source: <20230403040724.642513-1-alexhenrie24@gmail.com>


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
 source: <pull.1509.v3.git.1681182060.gitgitgadget@gmail.com>


* fc/doc-stop-using-manversion (2023-04-10) 1 commit
  (merged to 'next' on 2023-04-14 at 0800fe5ab4)
 + doc: simplify man version
 (this branch is used by fc/doc-use-datestamp-in-commit.)

 Doc build simplification.
 source: <20230408001829.11031-1-felipe.contreras@gmail.com>


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
 source: <20230414212404.GA639653@coredump.intra.peff.net>


* ow/ref-filter-omit-empty (2023-04-13) 1 commit
  (merged to 'next' on 2023-04-14 at 2798986c60)
 + branch, for-each-ref, tag: add option to omit empty lines

 "git branch --format=..." and "git format-patch --format=..."
 learns "--omit-empty" to hide refs that whose formatting result
 becomes an empty string from the output.
 source: <20230407175316.6404-1-oystwa@gmail.com>


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
 source: <cover.1681452028.git.ps@pks.im>


* rj/send-email-validate-hook-count-messages (2023-04-14) 1 commit
  (merged to 'next' on 2023-04-18 at 0c3db0bd3b)
 + send-email: export patch counters in validate environment

 The sendemail-validate validate hook learned to pass the total
 number of input files and where in the sequence each invocation is
 via environment variables.
 source: <20230414155249.667180-1-robin@jarry.cc>


* rn/sparse-describe (2023-04-03) 1 commit
  (merged to 'next' on 2023-04-14 at 9699cfad2c)
 + describe: enable sparse index for describe

 "git describe --dirty" learns to work better with sparse-index.
 source: <20230403164749.246001-1-nanth.raghul@gmail.com>


* rs/archive-from-subdirectory-fixes (2023-03-24) 1 commit
  (merged to 'next' on 2023-04-14 at 950f9ed807)
 + archive: improve support for running in subdirectory

 "git archive" run from a subdirectory mishandled attributes and
 paths outside the current directory.
 source: <7c33b01b-7b2a-25fa-9a66-1e65cd12bc84@web.de>

--------------------------------------------------
[New Topics]

* ek/completion-use-read-r-to-read-literally (2023-04-20) 1 commit
  (merged to 'next' on 2023-04-24 at 25bf3b808b)
 + completion: suppress unwanted unescaping of `read`

 The completion script used to use bare "read" without the "-r"
 option to read the contents of various state files, which risked
 getting confused with backslashes in them.  This has been
 corrected.

 Will merge to 'master'.
 source: <20230420223800.1698197-1-myoga.murase@gmail.com>


* pw/rebase-i-after-failure (2023-04-21) 6 commits
 - rebase -i: fix adding failed command to the todo list
 - rebase: fix rewritten list for failed pick
 - rebase --continue: refuse to commit after failed command
 - sequencer: factor out part of pick_commits()
 - rebase -i: remove patch file after conflict resolution
 - rebase -i: move unlink() calls

 Various fixes to the behaviour of "rebase -i" when the command got
 interrupted by conflicting changes.

 Needs review.
 source: <pull.1492.v2.git.1682089074.gitgitgadget@gmail.com>


* jk/blame-fake-commit-label (2023-04-24) 1 commit
 - blame: use different author name for fake commit generated by --contents

 The output given by "git blame" that attributes a line to contents
 taken from the file specified by the "--contents" option shows it
 differently from a line attributed to the working tree file.

 Will merge to 'next'.
 source: <20230424193508.2245566-1-jacob.e.keller@intel.com>


* jk/misc-null-check-fixes (2023-04-24) 2 commits
 - fetch_bundle_uri(): drop pointless NULL check
 - notes: clean up confusing NULL checks in init_notes()

 Code clean-up.

 Will merge to 'next'.
 source: <20230422135455.GA3942740@coredump.intra.peff.net>


* jk/parse-commit-with-malformed-ident (2023-04-25) 4 commits
 - parse_commit(): describe more date-parsing failure modes
 - parse_commit(): handle broken whitespace-only timestamp
 - parse_commit(): parse timestamp from end of line
 - t4212: avoid putting git on left-hand side of pipe

 The commit object parser has been taught to be a bit more lenient
 to parse timestamps on the author/committer line with a malformed
 author/committer ident.

 Will merge to 'next'?
 Protecting against mischieves using \f and \v may be worth doing.
 source: <20230425055244.GA4014505@coredump.intra.peff.net>


* sl/sparse-write-tree-part-2 (2023-04-24) 1 commit
 - write-tree: optimize sparse integration

 Fix-up to a topic already graduated to 'master'.

 Iffy.
 source: <20230423071243.1863977-1-cheskaqiqi@gmail.com>


* tb/pack-bitmap-traversal-with-boundary (2023-04-25) 3 commits
 - pack-bitmap.c: use commit boundary during bitmap traversal
 - pack-bitmap.c: extract `fill_in_bitmap()`
 - revision: support tracking uninteresting commits

 The object traversal using reachability bitmap done by
 "pack-object" has been tweaked to take advantage of the fact that
 using "boundary" commits as representative of all the uninteresting
 ones can save quite a lot of object enumeration.

 source: <cover.1682380788.git.me@ttaylorr.com>

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

* tl/notes-separator (2023-04-25) 6 commits
 - notes.c: introduce "--[no-]stripspace" option
 - notes.c: append separator instead of insert by pos
 - notes.c: introduce '--separator=<paragraph-break>' option
 - t3321: add test cases about the notes stripspace behavior
 - notes.c: use designated initializers for clarity
 - notes.c: cleanup 'strbuf_grow' call in 'append_edit'

 'git notes append' was taught '--separator' to specify string to insert
 between paragraphs.

 source: <cover.1682429602.git.dyroneteng@gmail.com>


* ar/config-count-tests-updates (2023-04-24) 3 commits
 - t1300: add tests for missing keys
 - t1300: check stderr for "ignores pairs" tests
 - t1300: drop duplicate test

 Test updates.
 source: <20230423134649.431783-1-rybak.a.v@gmail.com>


* en/header-split-cache-h-part-2 (2023-04-24) 22 commits
 - reftable: ensure git-compat-util.h is the first (indirect) include
 - diff.h: reduce unnecessary includes
 - object-store.h: reduce unnecessary includes
 - commit.h: reduce unnecessary includes
 - fsmonitor: reduce includes of cache.h
 - cache.h: remove unnecessary headers
 - treewide: remove cache.h inclusion due to previous changes
 - cache,tree: move basic name compare functions from read-cache to tree
 - cache,tree: move cmp_cache_name_compare from tree.[ch] to read-cache.c
 - hash-ll.h: split out of hash.h to remove dependency on repository.h
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

 More header clean-up.
 source: <pull.1517.v2.git.1682194649.gitgitgadget@gmail.com>


* fc/doc-checkout-markup-updates (2023-04-18) 2 commits
  (merged to 'next' on 2023-04-20 at 62782d75c4)
 + doc: git-checkout: reorganize examples
 + doc: git-checkout: trivial callout cleanup

 Doc mark-up update.

 Will merge to 'master'.
 source: <20230418070048.2209469-1-felipe.contreras@gmail.com>


* jk/gpg-trust-level-fix (2023-04-19) 1 commit
  (merged to 'next' on 2023-04-21 at eb8413dc9d)
 + gpg-interface: set trust level of missing key to "undefined"

 The "%GT" placeholder for the "--format" option of "git log" and
 friends caused BUG() to trigger on a commit signed with an unknown
 key, which has been corrected.

 Will merge to 'master'.
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


* en/ort-finalize-after-0-merges-fix (2023-04-24) 1 commit
  (merged to 'next' on 2023-04-25 at 1bc935225b)
 + merge-ort: fix calling merge_finalize() with no intermediate merge

 A small API fix to the ort merge strategy backend.

 Will merge to 'master'.
 source: <pull.1518.v2.git.1682194930766.gitgitgadget@gmail.com>


* ma/gittutorial-fixes (2023-04-20) 2 commits
 - gittutorial: wrap literal examples in backticks
 - gittutorial: drop early mention of origin

 source: <cover.1681579244.git.martin.agren@gmail.com>


* sg/retire-unused-cocci (2023-04-20) 1 commit
 - cocci: remove 'unused.cocci'

 source: <20230420205350.600760-1-szeder.dev@gmail.com>


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
  (merged to 'next' on 2023-04-21 at 068bf86fc3)
 + repository.h: drop unused `gc_cruft_packs`
 + builtin/gc.c: make `gc.cruftPacks` enabled by default
 + t/t9300-fast-import.sh: prepare for `gc --cruft` by default
 + t/t6500-gc.sh: add additional test cases
 + t/t6500-gc.sh: refactor cruft pack tests
 + t/t6501-freshen-objects.sh: prepare for `gc --cruft` by default
 + t/t5304-prune.sh: prepare for `gc --cruft` by default
 + builtin/gc.c: ignore cruft packs with `--keep-largest-pack`
 + builtin/repack.c: fix incorrect reference to '-C'
 + pack-write.c: plug a leak in stage_tmp_packfiles()

 When "gc" needs to retain unreachable objects, packing them into
 cruft packs (instead of exploding them into loose object files) has
 been offered as a more efficient option for some time.  Now the use
 of cruft packs has been made the default and no longer considered
 an experimental feature.

 Will merge to 'master'.
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


* kh/doc-interpret-trailers-updates (2023-04-12) 4 commits
 - doc: interpret-trailers: fix example
 - doc: interpret-trailers: don’t use deprecated config
 - doc: interpret-trailers: use input redirection
 - doc: interpret-trailers: don’t use heredoc in examples

 Doc update.

 Expecting a reroll.
 cf. <xmqqcz487qds.fsf@gitster.g>, <xmqqjzyg7qdw.fsf@gitster.g>
 source: <cover.1681326818.git.code@khaugsbakk.name>


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

 On hold, waiting for a fix-up.
 cf. <a10648d5-8cba-4c7c-a303-b5b0dcdd3310@gmail.com>
 source: <pull.1515.git.1681495119.gitgitgadget@gmail.com>


* tb/ban-strtok (2023-04-24) 6 commits
 - banned.h: mark `strtok()` and `strtok_r()` as banned
 - t/helper/test-json-writer.c: avoid using `strtok()`
 - t/helper/test-oidmap.c: avoid using `strtok()`
 - t/helper/test-hashmap.c: avoid using `strtok()`
 - string-list: introduce `string_list_setlen()`
 - string-list: multi-delimiter `string_list_split_in_place()`

 Mark strtok() and strtok_r() to be banned.
 source: <cover.1682374789.git.me@ttaylorr.com>


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


* nw/for-each-ref-signature (2023-03-13) 1 commit
 . ref-filter: add new "signature" atom

 "git (for-each-ref|branch|tag) --format=<format>" learns the "%(signature)"
 placeholder and friends.

 Breaks CI.
 cf. <xmqqpm9bosjw.fsf@gitster.g>
 source: <20230311210607.64927-2-nsengiyumvawilberforce@gmail.com>


* mh/credential-oauth-refresh-token (2023-04-21) 1 commit
 - credential: new attribute oauth_refresh_token

 The credential subsystem learns to help OAuth framework.

 Needs Review.
 source: <pull.1394.v2.git.1682070479816.gitgitgadget@gmail.com>


* mh/credential-password-expiry-libsecret (2023-03-27) 1 commit
 - credential/libsecret: support password_expiry_utc

 The libsecret credential helper learns to handle the password
 expiry time information.

 Needs Review.
 source: <pull.1469.v2.git.git.1679729764851.gitgitgadget@gmail.com>


* sl/diff-files-sparse (2023-04-24) 2 commits
 - diff-files: integrate with sparse index
 - t1092: add tests for `git diff-files`

 Teach "diff-files" not to expand sparse-index unless needed.
 source: <20230423010721.1402736-1-cheskaqiqi@gmail.com>


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

* pw/sequencer-rescheduled-ones-are-not-done-yet (2023-03-20) 1 commit
 . rebase -i: do not update "done" when rescheduling command

 "rebase -i" moved a "rescheduled" insn in the todo file to the
 "done" list before it completed, which has been corrected.

 Replaced with a much more enhanced pw/rebase-i-after-failure topic.
 source: <pull.1492.git.1679237337683.gitgitgadget@gmail.com>


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
