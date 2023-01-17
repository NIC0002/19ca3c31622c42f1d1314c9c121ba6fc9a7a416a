Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13888C54E76
	for <git@archiver.kernel.org>; Tue, 17 Jan 2023 19:04:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbjAQTDu (ORCPT <rfc822;git@archiver.kernel.org>);
        Tue, 17 Jan 2023 14:03:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234608AbjAQS7J (ORCPT <rfc822;git@vger.kernel.org>);
        Tue, 17 Jan 2023 13:59:09 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0117C5B458
        for <git@vger.kernel.org>; Tue, 17 Jan 2023 10:18:25 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id k13so1817144plg.0
        for <git@vger.kernel.org>; Tue, 17 Jan 2023 10:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A4R2R6SszMBLyRfjmEYByDpXY3zKunnj9GNSArmpGfM=;
        b=n72Cfo3jhoQ1yMpMHhMd+INiMNUHabq1B8+vSSmNInfYOTOiMxgsLNlKuUdqRGAs2k
         jkbic6Rpzquv+gdHYVvAmvgfz0fQoJn7v9lC0n6M50PjgZ2lcNRmuM4RWlZpN70QqNmW
         CjhTdzk05QO/QWMXIYXRPKtyJ65DArpkCPhSGQLsPVuzBMBzqBdx8s4glH6ChbTa5kXH
         +BytA3ZApfFnizTUL/aXRLFy+NoS5r1o59sM6xcR6Nq4M4+XCaHvVGWNQ0rqKYM38T9g
         4Uj9dR9IEcBkVKBBUkdqg4uFRLi0sCGFonwWNGRKwIM19BrfItpjm/lO/JfJ/Ld/LuqF
         o8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A4R2R6SszMBLyRfjmEYByDpXY3zKunnj9GNSArmpGfM=;
        b=p5aZmNxECmvqS0dCylykW7V2Mp8YTnYL/SOOxaqozLTfUSaWdet1pf5BL0aU79nNFM
         TpqOIZBA0gihVvQQNq9YbyJJssSfNjUhcfBjrR9nkHLzV8mKCmhiKCXjd8vlU+NvB5fw
         3vEdUhoAmr+M86FBsvWO3+1mhNLyL5VQj+PJqzXjboJ8CfCaUO6ijiQ/98aRKczpu90l
         lnC/5JlwlEvtB4s24dCmPj0eYVYcTBlPc32VWW6PoKIJfEJ43K7ozeZkYU4RSchDOfUz
         IAdbW7HDuX+qCGtgQwdzcqNNKf+xoW0x4zt5tMXH9HI4ZXzeg4Z2Da3mqiyuwP4o5ov9
         Y/wg==
X-Gm-Message-State: AFqh2kr92zxCmulSkGZtmthNzCtpwaR/9gSKZ3GvjaB9s2YIb1Sg8+Ae
        VhFVhHuI5d9+Y5KkS3JKhi5TfN4z3kc=
X-Google-Smtp-Source: AMrXdXsg5jfwBH9iaLnJiOPaBa+8DhanCg8cgfhctMumpiQjH++pnyyGYnkSIGRp56il0BYxYeHbLw==
X-Received: by 2002:a17:902:8216:b0:194:59c2:a155 with SMTP id x22-20020a170902821600b0019459c2a155mr3847412pln.16.1673979504598;
        Tue, 17 Jan 2023 10:18:24 -0800 (PST)
Received: from localhost (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id ij15-20020a170902ab4f00b00176b84eb29asm5526794plb.301.2023.01.17.10.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 10:18:24 -0800 (PST)
Sender: Junio C Hamano <jch2355@gmail.com>
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Jan 2023, #05; Tue, 17)
X-master-at: a7caae2729742fc80147bca1c02ae848cb55921a
X-next-at: 3abcab475e35598790da85d8a607d719986a9436
Date:   Tue, 17 Jan 2023 10:18:24 -0800
Message-ID: <xmqqv8l581ov.fsf@gitster.g>
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

A maintenance release Git 2.39.1 and friends to address two security
issues are out, and today's 'master', 'next', and 'seen' all include
the fixes.

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

* ds/omit-trailing-hash-in-index (2023-01-07) 4 commits
  (merged to 'next' on 2023-01-09 at e17ef56485)
 + features: feature.manyFiles implies fast index writes
 + test-lib-functions: add helper for trailing hash
 + read-cache: add index.skipHash config option
 + hashfile: allow skipping the hash function

 Introduce an optional configuration to allow the trailing hash that
 protects the index file from bit flipping.
 source: <pull.1439.v5.git.1673022717.gitgitgadget@gmail.com>

* ar/dup-words-fixes (2023-01-08) 1 commit
  (merged to 'next' on 2023-01-09 at 2a5d4537a2)
 + *: fix typos which duplicate a word

 Typofixes.
 source: <20230107135655.149892-1-rybak.a.v@gmail.com>


* ds/bundle-uri-4 (2023-01-06) 1 commit
  (merged to 'next' on 2023-01-08 at d5b03bdd48)
 + test-bundle-uri: drop unused variables
 (this branch is used by ds/bundle-uri-5.)

 Code clean-up.
 source: <Y7fgV5eFx78BHdQ4@coredump.intra.peff.net>


* es/t1509-root-fixes (2022-12-09) 3 commits
  (merged to 'next' on 2023-01-08 at c922e34bab)
 + t1509: facilitate repeated script invocations
 + t1509: make "setup" test more robust
 + t1509: fix failing "root work tree" test due to owner-check

 Test fixes.
 source: <pull.1425.git.1668999621.gitgitgadget@gmail.com>


* jk/ext-diff-with-relative (2023-01-06) 3 commits
  (merged to 'next' on 2023-01-08 at 5233a7d3ee)
 + diff: drop "name" parameter from prepare_temp_file()
 + diff: clean up external-diff argv setup
 + diff: use filespec path to set up tempfiles for ext-diff

 "git diff --relative" did not mix well with "git diff --ext-diff",
 which has been corrected.
 source: <Y7f/YiVu1TgbucDI@coredump.intra.peff.net>


* jk/strncmp-to-api-funcs (2023-01-08) 2 commits
  (merged to 'next' on 2023-01-09 at 47395b7c6f)
 + convert trivial uses of strncmp() to skip_prefix()
 + convert trivial uses of strncmp() to starts_with()

 Code clean-up.
 source: <Y7lyga5g2leSmWQd@coredump.intra.peff.net>


* pw/ci-print-failure-name-fix (2023-01-04) 1 commit
  (merged to 'next' on 2023-01-08 at 8bb55c12c7)
 + ci(github): restore "print test failures" step name

 (cosmetic) CI regression fix.
 source: <pull.1453.git.1672741640587.gitgitgadget@gmail.com>


* tb/ci-concurrency (2022-11-08) 1 commit
  (merged to 'next' on 2023-01-08 at ab7cdc20b8)
 + ci: avoid unnecessary builds

 Avoid unnecessary builds in CI, with settings configured in
 ci-config.
 source: <ff172f1de982f6f79b598e4ac6d5b2964ca4a098.1667931937.git.me@ttaylorr.com>


* tr/am--no-verify (2023-01-05) 1 commit
  (merged to 'next' on 2023-01-08 at 4585013067)
 + am: allow passing --no-verify flag

 Conditionally skip the pre-applypatch and applypatch-msg hooks when
 applying patches with 'git am'.
 source: <20221130172833.2662751-1-thierry.reding@gmail.com>


* ws/single-file-cone (2023-01-05) 1 commit
  (merged to 'next' on 2023-01-09 at b6d4d7b905)
 + dir: check for single file cone patterns

 The logic to see if we are using the "cone" mode by checking the
 sparsity patterns has been tightened to avoid mistaking a pattern
 that names a single file as specifying a cone.
 source: <pull.1446.v2.git.1672734059938.gitgitgadget@gmail.com>

--------------------------------------------------
[New Topics]

* rs/ls-tree-path-expansion-fix (2023-01-14) 2 commits
  (merged to 'next' on 2023-01-16 at 6359f28ba7)
 + ls-tree: remove dead store and strbuf for quote_c_style()
 + ls-tree: fix expansion of repeated %(path)

 "git ls-tree --format='%(path) %(path)' $tree $path" showed the
 path three times, which has been corrected.

 Will merge to 'master'.
 source: <55ae7333-3a13-0575-93ed-f858a1c2877e@web.de>


* jc/format-patch-v-unleak (2023-01-16) 1 commit
  (merged to 'next' on 2023-01-16 at 2155d512bc)
 + format-patch: unleak "-v <num>"

 Plug a small leak.

 Will merge to 'master'.
 source: <xmqqv8l8gr6s.fsf@gitster.g>


* jk/curl-avoid-deprecated-api (2023-01-17) 3 commits
 - http: support CURLOPT_PROTOCOLS_STR
 - http: prefer CURLOPT_SEEKFUNCTION to CURLOPT_IOCTLFUNCTION
 - http-push: prefer CURLOPT_UPLOAD to CURLOPT_PUT

 Deal with a few deprecation warning from cURL library.

 Will merge to 'next'.
 source: <Y8YP+R/hyNr6sEFA@coredump.intra.peff.net>


* ds/omit-trailing-hash-in-index (2023-01-17) 1 commit
 - t1600: fix racy index.skipHash test

 Quickfix for a topic already in 'master'.

 Will merge to 'next' and then to 'master'.
 source: <76204710-356a-2a85-9057-302e6619b9df@github.com>

--------------------------------------------------
[Stalled]

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


* po/pretty-hard-trunc (2022-11-13) 1 commit
 - pretty-formats: add hard truncation, without ellipsis, options

 Add a new pretty format which truncates without ellipsis.

 Expecting a reroll.
 cf. <093e1dca-b9d4-f1f2-0845-ad6711622cf5@iee.email>
 source: <20221112143616.1429-1-philipoakley@iee.email>


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

 Needs review.
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


* cb/grep-fallback-failing-jit (2022-12-17) 1 commit
 - grep: fall back to interpreter mode if JIT fails

 In an environment where dynamically generated code is prohibited to
 run (e.g. SELinux), failure to JIT pcre patterns is expected.  Fall
 back to interpreted execution in such a case.

 Expecting a reroll.
 cf. <62a06c5b-9646-17f8-b4d5-39823d3cc25a@grsecurity.net>
 source: <20221216121557.30714-1-minipli@grsecurity.net>


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

* ab/cache-api-cleanup (2023-01-16) 5 commits
  (merged to 'next' on 2023-01-16 at a0f388b149)
 + cache API: add a "INDEX_STATE_INIT" macro/function, add release_index()
 + read-cache.c: refactor set_new_index_sparsity() for subsequent commit
 + sparse-index API: BUG() out on NULL ensure_full_index()
 + sparse-index.c: expand_to_path() can assume non-NULL "istate"
 + builtin/difftool.c: { 0 }-initialize rather than using memset()

 Code clean-up to tighten the use of in-core index in the API.

 Will merge to 'master'.
 source: <cover-v2-0.6-00000000000-20230112T124842Z-avarab@gmail.com>


* ab/test-env-helper (2023-01-14) 1 commit
  (merged to 'next' on 2023-01-16 at 82c17f02e5)
 + env-helper: move this built-in to "test-tool env-helper"

 Remove "git env--helper" and demote it to a test-tool subcommand.

 Will merge to 'master'.
 source: <patch-1.1-e662c570f1d-20230112T155226Z-avarab@gmail.com>


* ar/bisect-doc-update (2023-01-13) 2 commits
  (merged to 'next' on 2023-01-14 at df5185519c)
 + git-bisect-lk2009: update nist report link
 + git-bisect-lk2009: update java code conventions link

 Doc update.

 Will merge to 'master'.
 source: <20230110093251.193552-1-rybak.a.v@gmail.com>


* ar/test-cleanup (2023-01-13) 3 commits
  (merged to 'next' on 2023-01-14 at 16d372b65d)
 + t7527: use test_when_finished in 'case insensitive+preserving'
 + t6422: drop commented out code
 + t6003: uncomment test '--max-age=c3, --topo-order'

 Test clean-up.

 Will merge to 'master'.
 source: <20230111233242.16870-1-rybak.a.v@gmail.com>


* en/ls-files-doc-update (2023-01-13) 4 commits
 - ls-files: guide folks to --exclude-standard over other --exclude* options
 - ls-files: clarify descriptions of status tags for -t
 - ls-files: clarify descriptions of file selection options
 - ls-files: add missing documentation for --resolve-undo option

 Doc update to ls-files.

 Needs review.
 source: <pull.1463.git.1673584914.gitgitgadget@gmail.com>


* en/t6426-todo-cleanup (2023-01-14) 1 commit
  (merged to 'next' on 2023-01-16 at 7d13842eeb)
 + t6426: fix TODO about making test more comprehensive

 Test clean-up.

 Will merge to 'master'.
 source: <pull.1462.v2.git.1673722187025.gitgitgadget@gmail.com>


* jc/doc-diff-patch.txt (2023-01-13) 1 commit
  (merged to 'next' on 2023-01-14 at d25ec1f631)
 + docs: link generating patch sections

 Doc update.

 Will merge to 'master'.
 source: <pull.1392.v2.git.git.1673626524221.gitgitgadget@gmail.com>


* jk/interop-error (2023-01-13) 1 commit
  (merged to 'next' on 2023-01-14 at ddca7887a5)
 + t/interop: report which vanilla git command failed

 Test helper improvement.

 Will merge to 'master'.
 source: <Y8A3yGeJl0TCDNqe@coredump.intra.peff.net>


* pw/rebase-exec-cleanup (2023-01-13) 1 commit
  (merged to 'next' on 2023-01-14 at 553d0daa62)
 + rebase: cleanup "--exec" option handling

 Code clean-up.

 Will merge to 'master'.
 source: <pull.1461.git.1673542201452.gitgitgadget@gmail.com>


* sk/merge-filtering-strategies-micro-optim (2023-01-13) 1 commit
  (merged to 'next' on 2023-01-14 at f171559fae)
 + merge: break out of all_strategy loop when strategy is found

 Micro optimization.

 Will merge to 'master'.
 source: <pull.1429.v2.git.git.1673285669004.gitgitgadget@gmail.com>


* yo/doc-use-more-switch-c (2023-01-13) 1 commit
  (merged to 'next' on 2023-01-14 at 7169d5dabc)
 + doc: add "git switch -c" as another option on detached HEAD

 Doc update.

 Will merge to 'master'.
 source: <pull.1422.v2.git.git.1673261237449.gitgitgadget@gmail.com>


* zh/scalar-progress (2023-01-16) 1 commit
 - scalar: show progress if stderr refers to a terminal

 "scalar" learned to give progress bar.

 Will merge to 'next'.
 source: <pull.1441.v3.git.1673442860379.gitgitgadget@gmail.com>


* ab/bisect-cleanup (2023-01-13) 6 commits
  (merged to 'next' on 2023-01-14 at 945b631a1e)
 + bisect: no longer try to clean up left-over `.git/head-name` files
 + bisect: remove Cogito-related code
 + bisect run: fix the error message
 + bisect: verify that a bogus option won't try to start a bisection
 + bisect--helper: make the order consistently `argc, argv`
 + bisect--helper: simplify exit code computation

 Code clean-up.

 Will merge to 'master'.
 source: <cover-v2-0.6-00000000000-20230112T151651Z-avarab@gmail.com>


* ms/send-email-feed-header-to-validate-hook (2023-01-17) 2 commits
 - send-email: expose header information to git-send-email's sendemail-validate hook
 - send-email: refactor header generation functions

 "git send-email" learned to give the e-mail headers to the validate
 hook by passing an extra argument from the command line.

 Under review.
 source: <20230117142706.230404-1-michael.strawbridge@amd.com>


* tl/ls-tree-code-clean-up (2023-01-13) 6 commits
  (merged to 'next' on 2023-01-14 at f7238037fd)
 + t3104: remove shift code in 'test_ls_tree_format'
 + ls-tree: cleanup the redundant SPACE
 + ls-tree: make "line_termination" less generic
 + ls-tree: fold "show_tree_data" into "cb" struct
 + ls-tree: use a "struct options"
 + ls-tree: don't use "show_tree_data" for "fast" callbacks

 Code clean-up.

 Will merge to 'master'.
 source: <20230112091135.20050-1-tenglong.tl@alibaba-inc.com>


* yc/doc-fetch-fix (2023-01-13) 1 commit
  (merged to 'next' on 2023-01-14 at a3ca60840b)
 + doc: fix non-existent config name

 Doc fix.

 Will merge to 'master'.
 source: <CAEg0tHSZi22RUBREJB=Cfy6O72cicv9FTkgo_Z=gvGRdPK1acw@mail.gmail.com>


* jc/ci-deprecated-declarations-are-not-fatal (2023-01-14) 1 commit
  (merged to 'next' on 2023-01-14 at 5efb778ab0)
 + ci: do not die on deprecated-declarations warning

 CI build fix for overzealous -Werror.

 Will merge to 'master'.
 source: <xmqq7cxpkpjp.fsf@gitster.g>


* ds/bundle-uri-5 (2023-01-07) 8 commits
 - bundle-uri: store fetch.bundleCreationToken
 - fetch: fetch from an external bundle URI
 - bundle-uri: drop bundle.flag from design doc
 - clone: set fetch.bundleURI if appropriate
 - bundle-uri: download in creationToken order
 - bundle-uri: parse bundle.<id>.creationToken values
 - bundle-uri: parse bundle.heuristic=creationToken
 - t5558: add tests for creationToken heuristic

 The bundle-URI subsystem adds support for creation-token heuristics
 to help incremental fetches.

 Needs review.
 source: <pull.1454.git.1673037405.gitgitgadget@gmail.com>


* jk/read-object-cleanup (2023-01-13) 6 commits
  (merged to 'next' on 2023-01-13 at 8cbeef4abd)
 + object-file: fix indent-with-space
  (merged to 'next' on 2023-01-09 at 19cc3de33e)
 + packfile: inline custom read_object()
 + repo_read_object_file(): stop wrapping read_object_file_extended()
 + read_object_file_extended(): drop lookup_replace option
 + streaming: inline call to read_object_file_extended()
 + object-file: inline calls to read_object()

 Code clean-up.

 Will merge to 'master'.
 source: <Y7l4LsEQcDT9HZ21@coredump.intra.peff.net>


* pb/doc-orig-head (2023-01-13) 5 commits
  (merged to 'next' on 2023-01-14 at 0583c146cb)
 + git-rebase.txt: add a note about 'ORIG_HEAD' being overwritten
 + revisions.txt: be explicit about commands writing 'ORIG_HEAD'
 + git-merge.txt: mention 'ORIG_HEAD' in the Description
 + git-reset.txt: mention 'ORIG_HEAD' in the Description
 + git-cherry-pick.txt: do not use 'ORIG_HEAD' in example

 Document ORIG_HEAD a bit more.

 Will merge to 'master'.
 source: <pull.1456.v2.git.1673356521.gitgitgadget@gmail.com>


* tc/cat-file-z-use-cquote (2023-01-16) 1 commit
 - cat-file: quote-format name in error when using -z

 "cat-file" in the batch mode that is fed NUL-terminated pathnames
 learned to cquote them in its error output (otherwise, a funny
 pathname with LF in it would break the lines in the output stream).
 source: <20230116190749.4141516-1-toon@iotcl.com>


* cb/grep-pcre-ucp (2023-01-09) 1 commit
 - grep: correctly identify utf-8 characters with \{b,w} in -P

 "grep -P" learned to use Unicode Character Property to grok
 character classes when processing \b and \w etc.

 Still skeptical.
 cf. <230109.86v8lf297g.gmgdl@evledraar.gmail.com>
 source: <20230108155217.2817-1-carenas@gmail.com>


* es/hooks-and-local-env (2023-01-13) 1 commit
  (merged to 'next' on 2023-01-14 at 93acd89393)
 + githooks: discuss Git operations in foreign repositories

 Doc update for environment variables set when hooks are invoked.

 Will merge to 'master'.
 source: <pull.1457.v2.git.1673293508399.gitgitgadget@gmail.com>


* ph/parse-date-reduced-precision (2023-01-13) 1 commit
  (merged to 'next' on 2023-01-14 at eb83564c3e)
 + date.c: allow ISO 8601 reduced precision times

 Loosen date parsing heuristics.

 Will merge to 'master'.
 source: <20230111001003.10916-1-congdanhqx@gmail.com>


* rs/use-enhanced-bre-on-macos (2023-01-08) 1 commit
  (merged to 'next' on 2023-01-16 at 9b80d4253f)
 + use enhanced basic regular expressions on macOS

 Newer regex library macOS stopped enabling GNU-like enhanced BRE,
 where '\(A\|B\)' works as alternation, unless explicitly asked with
 the REG_ENHANCED flag.  "git grep" now can be compiled to do so, to
 retain the old behaviour.

 Will merge to 'master'.
 source: <26a0d4ca-3d97-ace4-1a1f-92b1ee6715a6@web.de>


* cw/submodule-status-in-parallel (2023-01-05) 6 commits
 . submodule: call parallel code from serial status
 . diff-lib: parallelize run_diff_files for submodules
 . diff-lib: refactor match_stat_with_submodule
 . submodule: move status parsing into function
 . submodule: strbuf variable rename
 . run-command: add duplicate_output_fn to run_processes_parallel_opts

 "git submodule status" learned to run the comparison in submodule
 repositories in parallel.

 Needs review.
 Breaks "linux-leaks" CI job.
 cf. <xmqqv8l8f8j8.fsf@gitster.g>
 source: <https://lore.kernel.org/git/20221108184200.2813458-1-calvinwan@google.com/>


* kn/attr-from-tree (2023-01-14) 2 commits
  (merged to 'next' on 2023-01-16 at 426f357683)
 + attr: add flag `--source` to work with tree-ish
 + t0003: move setup for `--all` into new block

 "git check-attr" learned to take an optional tree-ish to read the
 .gitattributes file from.

 Will merge to 'master'.
 source: <cover.1673684790.git.karthik.188@gmail.com>


* ab/various-leak-fixes (2023-01-14) 19 commits
 - push: free_refs() the "local_refs" in set_refspecs()
 - receive-pack: free() the "ref_name" in "struct command"
 - grep API: plug memory leaks by freeing "header_list"
 - grep.c: refactor free_grep_patterns()
 - object-file.c: release the "tag" in check_tag()
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
 - commit-graph: use free_commit_graph() instead of UNLEAK()
 - bundle.c: don't leak the "args" in the "struct child_process"
 - tests: mark tests as passing with SANITIZE=leak

 Leak fixes.

 Will merge to 'next'?
 source: <cover-v3-00.19-00000000000-20230110T054138Z-avarab@gmail.com>


* rj/branch-unborn-in-other-worktrees (2023-01-01) 2 commits
 - branch: rename orphan branches in any worktree
 - branch: description for orphan branch errors

 Error messages given when working on an unborn branch that is
 checked out in another worktree have been improvved.
 source: <ffd675e9-8a64-ae05-fc3b-36ae99092735@gmail.com>


* rs/dup-array (2023-01-09) 5 commits
  (merged to 'next' on 2023-01-14 at 3efbd1ffe0)
 + use DUP_ARRAY
 + add DUP_ARRAY
 + do full type check in BARF_UNLESS_COPYABLE
 + factor out BARF_UNLESS_COPYABLE
 + mingw: make argv2 in try_shell_exec() non-const

 Code cleaning.

 Will merge to 'master'.
 source: <9bc1bd74-f72c-1b43-df7c-950815babb03@web.de>
 source: <3e04e283-cad0-7be4-d85c-65d0a52289e2@web.de>


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


* sk/win32-close-handle-upon-pthread-join (2023-01-04) 2 commits
  (merged to 'next' on 2023-01-16 at faa279fd5b)
 + win32: close handles of threads that have been joined
 + win32: prepare pthread.c for change by formatting

 Pthread emulation on Win32 leaked thread handle when a thread is
 joined.

 Will merge to 'master'.
 source: <pull.1406.v13.git.git.1672762819.gitgitgadget@gmail.com>


* jx/t1301-updates (2022-11-30) 3 commits
  (merged to 'next' on 2023-01-14 at d4f081b3f8)
 + t1301: do not change $CWD in "shared=all" test case
 + t1301: use test_when_finished for cleanup
 + t1301: fix wrong template dir for git-init

 Test updates.

 Will merge to 'master'.
 source: <20221128130323.8914-1-worldhello.net@gmail.com>


* km/send-email-with-v-reroll-count (2022-11-27) 1 commit
 - send-email: relay '-v N' to format-patch

 "git send-email -v 3" used to be expanded to "git send-email
 --validate 3" when the user meant to pass them down to
 "format-patch", which has been corrected.

 Will merge to 'next'?
 source: <87edtp5uws.fsf@kyleam.com>


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


* cc/filtered-repack (2022-12-25) 3 commits
 - gc: add gc.repackFilter config option
 - repack: add --filter=<filter-spec> option
 - pack-objects: allow --filter without --stdout

 "git repack" learns to discard objects that ought to be retrievable
 again from the promisor remote.

 May want to discard.  Its jaggy edges may be a bit too sharp.
 cf. <Y7WTv19aqiFCU8au@ncase>
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
