Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD09C10F1E
	for <git@archiver.kernel.org>; Sun, 18 Dec 2022 07:29:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbiLRHZe (ORCPT <rfc822;git@archiver.kernel.org>);
        Sun, 18 Dec 2022 02:25:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiLRHZc (ORCPT <rfc822;git@vger.kernel.org>);
        Sun, 18 Dec 2022 02:25:32 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFE27BF45
        for <git@vger.kernel.org>; Sat, 17 Dec 2022 23:25:29 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id o12so6254180pjo.4
        for <git@vger.kernel.org>; Sat, 17 Dec 2022 23:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kWTssvZ6iprh0Npj7ekQq6cAB35Jq2k58DpDl+wtE+8=;
        b=qSlBLU3uaOofo9z9HDwxhM7lxUPPGe3DUTYgofRS383zvp+gWGrNxmDhb9fT/gUKYL
         OTWFlTLOEYUOk78LmbXL0FgJKBQ8hVSlgwwf1GvhowRSRil4hVM5fPkRIuaqVhWo9sID
         aqXEtbcdsKC8v12z8goTiRHy4BAnV7TX7SA+00pCOWdlUf2i+K6lbg9xpAaJPBXiBlFI
         Vy5ZImrTXLTdRk5BuNrvsEImJZkN4a4rh0Yqe6JFD6+NYgFyz3OTFW1ef7GIZ/nfCbpM
         WJaL9SF+edQgeMty9m161GXOAxxqRF6GhlsjuewHi+J0dUqGlr6bMSZxdpAvmYmIBDMr
         A53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kWTssvZ6iprh0Npj7ekQq6cAB35Jq2k58DpDl+wtE+8=;
        b=MrAguU7MNAxlM5qiQprBIAlj2FXQFmwqsN5wj5lm5HmYXHyxps4wGsZ7SJG4KwKVGs
         8yZgN0w0aKSaBzmkajhvH5NeQtCKyBvJE5X9TjsdPN2lubbsUXws+M7cUNBS6ZoAIk0A
         LgKMVuZnz3ftJb50/NN4E89A8s8IYLEvfc4kOIy/q+danrm841KkrJ6Jk9xdNM9IJM/b
         /1y7BKDxQkUZRdUE955PVuzgzHYrFyq3twOH/SknhKPjrlEH6dszLI0r3wCVugEV7rbN
         DbcNS6zqzbkFsVCYdMICKfNj9ukrAv8JKu5hCM4auZu3wuK/s6GaMDEktNwiq6EuiejN
         xhbg==
X-Gm-Message-State: AFqh2kqanOQ79+keEmVrhfJmCrlkWCAotd6joDFKx/sp7WL/Qpc0+vfz
        tE56JolliLP7ZHiq0Zq6tnQPlKX7161wvw==
X-Google-Smtp-Source: AMrXdXt4AWjCfl+VjnVZ7USl8Da0eVOPLJsPYopylOsOnWTKLZcqLGcyoyydOmw4EqwYKhuMazaYMA==
X-Received: by 2002:a05:6a20:491a:b0:af:f97e:efc7 with SMTP id ft26-20020a056a20491a00b000aff97eefc7mr5825915pzb.53.1671348328208;
        Sat, 17 Dec 2022 23:25:28 -0800 (PST)
Received: from localhost (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id t76-20020a63784f000000b0046fe244ed6esm4030705pgc.23.2022.12.17.23.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Dec 2022 23:25:27 -0800 (PST)
Sender: Junio C Hamano <jch2355@gmail.com>
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Dec 2022, #06; Sun, 18)
X-master-at: 57e2c6ebbe7108b35ba30184dcbcb6c34c929ad8
X-next-at: 31fb33b8321cb7af67cb16c2d66b91c3989345b3
Date:   Sun, 18 Dec 2022 16:25:27 +0900
Message-ID: <xmqqh6xtw4uw.fsf@gitster.g>
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

Looking at the list of topics slated for 'master' in this issue of
the report, we will probably have a big update to 'master' before
the Chrismas. But other than that, I expect things will be slow
towards the end of the year. Be good boys and girls, and enjoy
yourselves, everybody.

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

* ab/various-leak-fixes (2022-11-21) 16 commits
  (merged to 'next' on 2022-11-21 at eff484a27c)
 + built-ins: use free() not UNLEAK() if trivial, rm dead code
 + revert: fix parse_options_concat() leak
 + cherry-pick: free "struct replay_opts" members
 + rebase: don't leak on "--abort"
 + connected.c: free the "struct packed_git"
 + sequencer.c: fix "opts->strategy" leak in read_strategy_opts()
 + ls-files: fix a --with-tree memory leak
 + revision API: call graph_clear() in release_revisions()
 + unpack-file: fix ancient leak in create_temp_file()
 + built-ins & libs & helpers: add/move destructors, fix leaks
 + dir.c: free "ident" and "exclude_per_dir" in "struct untracked_cache"
 + read-cache.c: clear and free "sparse_checkout_patterns"
 + commit: discard partial cache before (re-)reading it
 + {reset,merge}: call discard_index() before returning
 + tests: mark tests as passing with SANITIZE=leak
 + Merge branch 'pw/rebase-no-reflog-action' into ab/various-leak-fixes

 Various leak fixes.
 source: <cover-v2-00.15-00000000000-20221108T172650Z-avarab@gmail.com>


* dd/git-bisect-builtin (2022-11-15) 13 commits
  (merged to 'next' on 2022-11-15 at e16e754058)
 + bisect; remove unused "git-bisect.sh" and ".gitignore" entry
  (merged to 'next' on 2022-11-14 at fc304fb52f)
 + Turn `git bisect` into a full built-in
 + bisect--helper: log: allow arbitrary number of arguments
 + bisect--helper: handle states directly
 + bisect--helper: emit usage for "git bisect"
 + bisect test: test exit codes on bad usage
 + bisect--helper: identify as bisect when report error
 + bisect-run: verify_good: account for non-negative exit status
 + bisect run: keep some of the post-v2.30.0 output
 + bisect: fix output regressions in v2.30.0
 + bisect: refactor bisect_run() to match CodingGuidelines
 + bisect tests: test for v2.30.0 "bisect run" regressions
 + Merge branch 'dd/bisect-helper-subcommand' into dd/git-bisect-builtin

 `git bisect` becomes a builtin.
 source: <cover.1668097962.git.congdanhqx@gmail.com>


* js/t0021-windows-pwd (2022-12-07) 1 commit
  (merged to 'next' on 2022-12-08 at 63bc7701e8)
 + t0021: use Windows-friendly `pwd`
 (this branch is used by js/drop-mingw-test-cmp.)

 Test fix.
 source: <b38b8fb5a85e10d6189d68b6633adf23fca7b65d.1670339267.git.gitgitgadget@gmail.com>


* kz/merge-tree-merge-base (2022-11-25) 3 commits
  (merged to 'next' on 2022-11-25 at 298ca8e2e8)
 + docs: fix description of the `--merge-base` option
  (merged to 'next' on 2022-11-14 at 76d48ae21f)
 + merge-tree.c: allow specifying the merge-base when --stdin is passed
 + merge-tree.c: add --merge-base=<commit> option

 "merge-tree" learns a new `--merge-base` option.
 source: <pull.1397.v7.git.1668210314.gitgitgadget@gmail.com>
 source: <c21466d1db0e7f7fcd7308b61aa1e3cd4e3d67c4.1669261026.git.gitgitgadget@gmail.com>


* rs/multi-filter-args (2022-11-30) 5 commits
  (merged to 'next' on 2022-12-01 at 5848d16bb6)
 + list-objects-filter: remove OPT_PARSE_LIST_OBJECTS_FILTER_INIT()
 + pack-objects: simplify --filter handling
 + pack-objects: fix handling of multiple --filter options
 + t5317: demonstrate failure to handle multiple --filter options
 + t5317: stop losing return codes of git ls-files

 Fix a bug where `pack-objects` would not respect multiple `--filter`
 arguments when invoked directly.
 source: <c2d3e7a3-599f-dae5-8dde-dc969df39f02@web.de>


* sa/git-var-empty (2022-11-27) 2 commits
  (merged to 'next' on 2022-12-01 at 3b81dcb382)
 + var: allow GIT_EDITOR to return null
 + var: do not print usage() with a correct invocation

 "git var UNKNOWN_VARIABLE" and "git var VARIABLE" with the variable
 given an empty value used to behave identically.  Now the latter
 just gives an empty output, while the former still gives an error
 message.
 source: <pull.1434.v3.git.1669472277.gitgitgadget@gmail.com>


* tl/pack-bitmap-absolute-paths (2022-11-29) 4 commits
  (merged to 'next' on 2022-11-30 at cb5d17ee40)
 + pack-bitmap.c: trace bitmap ignore logs when midx-bitmap is found
 + pack-bitmap.c: break out of the bitmap loop early if not tracing
  (merged to 'next' on 2022-11-14 at 34eb0ea05a)
 + pack-bitmap.c: avoid exposing absolute paths
 + pack-bitmap.c: remove unnecessary "open_pack_index()" calls

 The pack-bitmap machinery is taught to log the paths of redundant
 bitmap(s) to trace2 instead of stderr.
 source: <cover.1669644101.git.dyroneteng@gmail.com>


* yn/git-jump-emacs (2022-11-27) 3 commits
  (merged to 'next' on 2022-11-29 at d0960938a0)
 + git-jump: invoke emacs/emacsclient
 + git-jump: move valid-mode check earlier
 + git-jump: add an optional argument '--stdout'

 "git jump" (in contrib/) learned to present the "quickfix list" to
 its standard output (instead of letting it consumed by the editor
 it invokes), and learned to also drive emacs/emacsclient.
 source: <pull.1423.v8.git.1669511933.gitgitgadget@gmail.com>

--------------------------------------------------
[New Topics]

* ab/darwin-default-to-sha1dc (2022-12-16) 1 commit
  (merged to 'next' on 2022-12-16 at 31fb33b832)
 + Makefile: use sha1collisiondetection by default on OSX and Darwin

 Use the SHA1DC implementation on macOS, just like other platforms,
 by default.

 Will merge to 'master'.
 source: <patch-v2-1.1-3de7cdbd260-20221215T084129Z-avarab@gmail.com>


* ab/no-more-git-global-super-prefix (2022-12-16) 9 commits
 - read-tree: add "--super-prefix" option, eliminate global
 - submodule--helper: convert "{update,clone}" to their own "--super-prefix"
 - submodule--helper: convert "status" to its own "--super-prefix"
 - submodule--helper: convert "sync" to its own "--super-prefix"
 - submodule--helper: convert "foreach" to its own "--super-prefix"
 - submodule--helper: don't use global --super-prefix in "absorbgitdirs"
 - submodule.c & submodule--helper: pass along "super_prefix" param
 - read-tree + fetch tests: test failing "--super-prefix" interaction
 - submodule absorbgitdirs tests: add missing "Migrating git..." tests

 Stop using "git --super-prefix" and narrow the scope of its use to
 the submodule--helper.

 Expecting the final reroll.
 cf. <kl6lzgbocqki.fsf@chooglen-macbookpro.roam.corp.google.com>
 source: <cover-v4-0.9-00000000000-20221215T083502Z-avarab@gmail.com>


* jk/ref-filter-error-reporting-fix (2022-12-15) 5 commits
  (merged to 'next' on 2022-12-16 at 8135d51462)
 + ref-filter: convert email atom parser to use err_bad_arg()
 + ref-filter: truncate atom names in error messages
 + ref-filter: factor out "unrecognized %(foo) arg" errors
 + ref-filter: factor out "%(foo) does not take arguments" errors
 + ref-filter: reject arguments to %(HEAD)

 Clean-ups in error messages produced by "git for-each-ref" and friends.

 Will merge to 'master'.
 source: <Y5n3S7cnD7s/AIRL@coredump.intra.peff.net>


* pg/diff-stat-unmerged-regression-fix (2022-12-15) 1 commit
  (merged to 'next' on 2022-12-16 at 2a61376847)
 + diff: fix regression with --stat and unmerged file

 The output from "git diff --stat" on an unmerged path lost the
 terminating LF in Git 2.39, which has been corrected.

 Will merge to 'master'.
 source: <20221214174150.404821-1-pete@jpgrayson.net>


* sk/remove-duplicate-includes (2022-12-15) 1 commit
  (merged to 'next' on 2022-12-16 at 846bc84e59)
 + git: remove duplicate includes

 Code clean-up.

 Will merge to 'master'.
 source: <pull.1394.git.git.1671036743272.gitgitgadget@gmail.com>

 
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


* lk/line-range-parsing-fix (2022-12-18) 1 commit
 - line-range: fix infinite loop bug with degenerate '$' regex

 When given a pattern that matches an empty string at the end of a
 line, the code to parse the "git diff" line-ranges fell into an
 infinite loop, which has been corrected.

 Will merge to 'next'.
 source: <20221211015340.2181837-1-lars@oddbit.com>


* sa/git-var-sequence-editor (2022-12-18) 1 commit
 - var: add GIT_SEQUENCE_EDITOR variable

 Just like "git var GIT_EDITOR" abstracts the complex logic to
 choose which editor gets used behind it, "git var" now give support
 to GIT_SEQUENCE_EDITOR.

 Will merge to 'next'.
 source: <pull.1424.v2.git.1671318599482.gitgitgadget@gmail.com>


* ss/pull-v-recurse-fix (2022-12-18) 1 commit
 - submodule: accept -v for the update command

 "git pull -v --recurse-submodules" attempted to pass "-v" down to
 underlying "git submodule update", which did not understand the
 request and barfed, which has been corrected.

 Will merge to 'next'.
 source: <f805f2da-a7e1-9fde-cc0a-04a30f79c9af@cs-ware.de>

--------------------------------------------------
[Cooking]

* ds/bundle-uri-4-fixup (2022-12-13) 3 commits
 - bundle-uri: remove GIT_TEST_BUNDLE_URI env variable
 - bundle-uri: advertise based on repo config
 - bundle-uri: drop unused 'uri' parameter
 (this branch uses ds/bundle-uri-4.)

 Incremental fixes on ds/bundle-uri-4 topic.

 Will merge to 'next'?
 source: <pull.1443.git.1670866407.gitgitgadget@gmail.com>


* ds/omit-trailing-hash-in-index (2022-12-17) 4 commits
 - features: feature.manyFiles implies fast index writes
 - test-lib-functions: add helper for trailing hash
 - read-cache: add index.skipHash config option
 - hashfile: allow skipping the hash function

 Introduce an optional configuration to allow the trailing hash that
 protects the index file from bit flipping.

 Will merge to 'next'?
 source: <pull.1439.v4.git.1671204678.gitgitgadget@gmail.com>


* jk/server-supports-v2-cleanup (2022-12-13) 1 commit
  (merged to 'next' on 2022-12-16 at 9b995dc263)
 + server_supports_v2(): use a separate function for die_on_error

 Code clean-up.

 Will merge to 'master'.
 source: <Y5hZirNRGLQUZfOZ@coredump.intra.peff.net>


* jk/unused-post-2.39 (2022-12-13) 9 commits
  (merged to 'next' on 2022-12-16 at 4ce4a868e5)
 + userdiff: mark unused parameter in internal callback
 + list-objects-filter: mark unused parameters in virtual functions
 + diff: mark unused parameters in callbacks
 + xdiff: mark unused parameter in xdl_call_hunk_func()
 + xdiff: drop unused parameter in def_ff()
 + ws: drop unused parameter from ws_blank_line()
 + list-objects: drop process_gitlink() function
 + blob: drop unused parts of parse_blob_buffer()
 + ls-refs: use repository parameter to iterate refs

 Code clean-up around unused function parameters.

 Will merge to 'master'.
 source: <Y5hdvpbLpXySHFRz@coredump.intra.peff.net>


* jt/http-fetch-trace2-report-name (2022-12-13) 1 commit
  (merged to 'next' on 2022-12-16 at b26e38cdb2)
 + http-fetch: invoke trace2_cmd_name()

 "git http-fetch" (which is rarely used) forgot to identify itself
 in the trace2 output.

 Will merge to 'master'.
 source: <20221212224630.2553391-1-jonathantanmy@google.com>


* rs/am-parse-options-cleanup (2022-12-13) 1 commit
  (merged to 'next' on 2022-12-16 at 9013ff2a19)
 + am: don't pass strvec to apply_parse_options()

 Code clean-up.

 Will merge to 'master'.
 source: <baf93e4a-7f05-857c-e551-09675496c03c@web.de>


* rs/clarify-error-in-write-loose-object (2022-12-14) 1 commit
  (merged to 'next' on 2022-12-16 at 8ef4588405)
 + object-file: inline write_buffer()

 Code clean-up.

 Will merge to 'master'.
 source: <94dff140-489c-40b2-7212-201ed3b7d008@web.de>


* rs/clear-commit-marks-cleanup (2022-12-13) 1 commit
  (merged to 'next' on 2022-12-16 at a9e52a7cef)
 + commit: skip already cleared parents in clear_commit_marks_1()

 Code clean-up.

 Will merge to 'master'.
 source: <7cf2ea1f-8dbf-5639-3874-86de391ae20a@web.de>


* rs/reflog-expiry-cleanup (2022-12-13) 1 commit
  (merged to 'next' on 2022-12-16 at 8165a625dd)
 + reflog: clear leftovers in reflog_expiry_cleanup()

 Code clean-up.

 Will merge to 'master'.
 source: <a53d4df3-4b2c-585a-e8ad-2a9b9017fb8c@web.de>


* sg/help-autocorrect-config-fix (2022-12-13) 1 commit
  (merged to 'next' on 2022-12-16 at edcf99f34c)
 + help.c: fix autocorrect in work tree for bare repository

 The code to auto-correct a misspelt subcommand unnecessarily called
 into git_default_config() from the early config codepath, which was
 a no-no.  This has bee corrected.

 Will merge to 'master'.
 source: <pull.1373.v2.git.git.1667073374852.gitgitgadget@gmail.com>


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


* rs/t3920-crlf-eating-grep-fix (2022-12-07) 1 commit
  (merged to 'next' on 2022-12-16 at 56ff27beaa)
 + t3920: support CR-eating grep
 (this branch uses js/t3920-shell-and-or-fix.)

 Test fix.

 Will merge to 'master'.
 source: <cbe88abc-c1fb-cb50-6057-47ff27f7a12d@web.de>


* es/t1509-root-fixes (2022-12-09) 3 commits
 - t1509: facilitate repeated script invocations
 - t1509: make "setup" test more robust
 - t1509: fix failing "root work tree" test due to owner-check

 source: <pull.1425.git.1668999621.gitgitgadget@gmail.com>


* ab/t4023-avoid-losing-exit-status-of-diff (2022-12-05) 1 commit
  (merged to 'next' on 2022-12-16 at 75c7a06930)
 + t4023: fix ignored exit codes of git

 Test fix.

 Will merge to 'master'.
 source: <patch-v2-3.8-c5feef1c808-20221202T000227Z-avarab@gmail.com>


* jh/t7527-unflake-by-forcing-cookie (2022-12-02) 1 commit
  (merged to 'next' on 2022-12-16 at d64198c6c3)
 + fsmonitor: fix race seen in t7527

 Make fsmonitor more robust to avoid the flakiness seen in t7527.

 Will merge to 'master'.
 source: <pull.1437.git.1669937534944.gitgitgadget@gmail.com>


* rs/plug-pattern-list-leak-in-lof (2022-12-02) 1 commit
  (merged to 'next' on 2022-12-16 at 5cc6d4165a)
 + list-objects-filter: plug pattern_list leak

 Leak fix.

 Will merge to 'master'.
 source: <b4361c3e-852b-e30c-f240-86c34bc9c474@web.de>


* rs/t4205-do-not-exit-in-test-script (2022-12-02) 1 commit
  (merged to 'next' on 2022-12-16 at 71b4de7729)
 + t4205: don't exit test script on failure

 Test fix.

 Will merge to 'master'.
 source: <c5b4d091-23c1-5a75-a255-99ec83973d8d@web.de>


* ab/t5314-avoid-losing-exit-status (2022-12-02) 1 commit
  (merged to 'next' on 2022-12-16 at 40f3acd249)
 + t5314: check exit code of "git"

 Test fix.

 Will merge to 'master'.
 source: <patch-v2-1.1-ca77a7249e6-20221128T141818Z-avarab@gmail.com>


* ab/t7600-avoid-losing-exit-status-of-git (2022-12-05) 1 commit
  (merged to 'next' on 2022-12-16 at ef89e4f2d1)
 + t7600: don't ignore "rev-parse" exit code in helper

 Test fix.

 Will merge to 'master'.
 source: <patch-v3-1.8-64dfec31fb3-20221202T114733Z-avarab@gmail.com>


* jh/fsmonitor-darwin-modernize (2022-12-15) 1 commit
  (merged to 'next' on 2022-12-16 at 197e1f8c43)
 + fsmonitor: eliminate call to deprecated FSEventStream function

 Stop using deprecated macOS API in fsmonitor.

 Will merge to 'master'.
 source: <pull.1436.v2.git.1671045153981.gitgitgadget@gmail.com>


* js/t3920-shell-and-or-fix (2022-12-05) 1 commit
  (merged to 'next' on 2022-12-16 at 59536ed758)
 + t3920: don't ignore errors of more than one command with `|| true`
 (this branch is used by rs/t3920-crlf-eating-grep-fix.)

 Test fix.

 Will merge to 'master'.
 source: <febcfb0a-c410-fb71-cff9-92acfcb269e2@kdbg.org>


* sx/pthread-error-check-fix (2022-12-05) 1 commit
  (merged to 'next' on 2022-12-16 at 60848153fe)
 + maintenance: compare output of pthread functions for inequality with 0

 Correct pthread API usage.

 Will merge to 'master'.
 source: <pull.1389.git.git.1670000578395.gitgitgadget@gmail.com>


* jk/avoid-redef-system-functions (2022-12-05) 3 commits
  (merged to 'next' on 2022-12-16 at 55f7102dba)
 + Merge branch 'jk/avoid-redef-system-functions-2.30' into jk/avoid-redef-system-functions
 + Merge branch 'jk/avoid-redef-system-functions-2.30'
 + Merge branch 'jk/avoid-redef-system-functions-2.30' into maint
 (this branch uses jk/avoid-redef-system-functions-2.30.)

 The jk/avoid-redef-system-functions-2.30 topic pre-merged for more
 recent codebase.

 Will merge to 'master'.


* jk/avoid-redef-system-functions-2.30 (2022-12-05) 2 commits
  (merged to 'next' on 2022-12-16 at aa101dfc0c)
 + git-compat-util: undefine system names before redeclaring them
 + git-compat-util: avoid redefining system function names
 (this branch is used by jk/avoid-redef-system-functions.)

 Redefining system functions for a few functions did not follow our
 usual "implement git_foo() and #define foo(args) git_foo(args)"
 pattern, which has broken build for some folks.

 Will merge to 'master'.
 source: <Y4fH4rhcSztHwKvK@coredump.intra.peff.net>


* jt/avoid-lazy-fetch-commits (2022-12-15) 4 commits
 - commit: don't lazy-fetch commits
 - object-file: emit corruption errors when detected
 - object-file: refactor map_loose_object_1()
 - object-file: remove OBJECT_INFO_IGNORE_LOOSE

 Even in a repository with promissor remote, it is useless to
 attempt to lazily attempt fetching an object that is expected to be
 commit, because no "filter" mode omits commit objects.  Take
 advantage of this assumption to fail fast on errors.

 Will merge to 'next'?
 source: <cover.1671045259.git.jonathantanmy@google.com>


* rs/diff-parseopts (2022-12-02) 3 commits
  (merged to 'next' on 2022-12-16 at 6fdfd67cb9)
 + diff: remove parseopts member from struct diff_options
 + diff: use add_diff_options() in diff_opt_parse()
 + diff: factor out add_diff_options()

 The way the diff machinery prepares the options array for the
 parse_options API has been refactored to avoid resource leaks.

 Will merge to 'master'.
 source: <19325420-5630-87bb-0c2c-362151214b36@web.de>


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


* sa/cat-file-mailmap--batch-check (2022-12-02) 2 commits
 - cat-file: add mailmap support to --batch-check option
 - cat-file: add mailmap support to -s option

 'cat-file' gains mailmap support for its '--batch-check' and '-s'
 options.
 source: <20221201155504.320461-1-siddharthasthana31@gmail.com>


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


* rj/branch-copy-and-rename (2022-11-17) 1 commit
  (merged to 'next' on 2022-12-16 at b88fa41a8a)
 + branch: force-copy a branch to itself via @{-1} is a no-op

 Fix a pair of bugs in 'git branch'.

 Will merge to 'master'.
 source: <f0b2d46c-2e9c-2630-2870-8ed550dd1606@gmail.com>


* tr/am--no-verify (2022-12-01) 2 commits
 - SQUASH???
 - am: allow passing --no-verify flag

 Conditionally skip the pre-applypatch and applypatch-msg hooks when
 applying patches with 'git am'.

 Expecting a (hopefully final) reroll.
 source: <20221130172833.2662751-1-thierry.reding@gmail.com>


* ew/format-patch-mboxrd (2022-11-14) 1 commit
 - format-patch: add --mboxrd alias for --pretty=mboxrd

 Teach `format-patch` a convenient alias for `--pretty=mboxrd`.

 Waiting for discussion to settle.
 source: <20221114094114.18986-1-e@80x24.org>


* js/drop-mingw-test-cmp (2022-12-13) 1 commit
 - tests(mingw): avoid very slow `mingw_test_cmp`

 Use `git diff --no-index` as a test_cmp on Windows.

 Waiting for review response.
 source: <pull.1309.v5.git.1670339267.gitgitgadget@gmail.com>


* mc/switch-advice (2022-11-09) 1 commit
 - po: use `switch` over `checkout` in error message

 Use 'switch' instead of 'checkout' in an error message.

 Waiting for review response.
 source: <pull.1308.git.git.1668018620148.gitgitgadget@gmail.com>


* aw/complete-case-insensitive (2022-11-30) 2 commits
  (merged to 'next' on 2022-12-16 at 341974c2bb)
 + completion: add case-insensitive match of pseudorefs
 + completion: add optional ignore-case when matching refs

 Introduce a case insensitive mode to the Bash completion helpers.

 Will merge to 'master'.
 source: <pull.1374.v2.git.git.1668990419.gitgitgadget@gmail.com>


* ja/worktree-orphan (2022-11-10) 2 commits
 - worktree add: add --orphan flag
 - worktree add: Include -B in usage docs

 'git worktree add' learned how to create a worktree based on an
 orphaned branch with `--orphan`.

 Expecting another round?
 source: <20221110233137.10414-1-jacobabel@nullpo.dev>


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


* ds/bundle-uri-4 (2022-12-06) 11 commits
 - clone: unbundle the advertised bundles
 - bundle-uri: download bundles from an advertised list
 - bundle-uri: allow relative URLs in bundle lists
 - strbuf: introduce strbuf_strip_file_from_path()
 - bundle-uri: serve bundle.* keys from config
 - bundle-uri client: add helper for testing server
 - transport: rename got_remote_heads
 - bundle-uri client: add boolean transfer.bundleURI setting
 - clone: request the 'bundle-uri' command when available
 - t: create test harness for 'bundle-uri' command
 - protocol v2: add server-side "bundle-uri" skeleton
 (this branch is used by ds/bundle-uri-4-fixup.)

 Bundle URIs part 4.

 Will merge to 'next'?
 source: <pull.1400.v3.git.1670262639.gitgitgadget@gmail.com>


* po/pretty-hard-trunc (2022-11-13) 1 commit
 - pretty-formats: add hard truncation, without ellipsis, options

 Add a new pretty format which truncates without ellipsis.

 Waiting for review.
 source: <20221112143616.1429-1-philipoakley@iee.email>


* rr/status-untracked-advice (2022-12-01) 1 commit
  (merged to 'next' on 2022-12-16 at bed7d84d07)
 + status: modernize git-status "slow untracked files" advice

 The advice message given by "git status" when it takes long time to
 enumerate untracked paths has been updated.

 Will merge to 'master'.
 source: <pull.1384.v9.git.1669769536707.gitgitgadget@gmail.com>


* cc/filtered-repack (2022-11-23) 2 commits
 - repack: add --filter=<filter-spec> option
 - pack-objects: allow --filter without --stdout

 "git repack" learns to discard objects that ought to be retrievable
 again from the promissor remote.

 Needs review.
 Seems to break CI.
 cf. https://github.com/git/git/actions/runs/3560918726
 source: <20221122175150.366828-1-christian.couder@gmail.com>


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

--------------------------------------------------
[Discarded]

* pw/test-todo (2022-10-06) 3 commits
 . test_todo: allow [verbose] test as the command
 . test_todo: allow [!] grep as the command
 . tests: add test_todo() to mark known breakages

 RFC for test framework improvement.

 Needs review.
 source: <pull.1374.git.1665068476.gitgitgadget@gmail.com>


* cw/submodule-status-in-parallel (2022-11-08) 6 commits
 . diff-lib: parallelize run_diff_files for submodules
 . diff-lib: refactor match_stat_with_submodule
 . submodule: move status parsing into function
 . submodule: strbuf variable rename
 . run-command: add duplicate_output_fn to run_processes_parallel_opts
 . Merge branch 'ab/run-hook-api-cleanup' into cw/submodule-status-in-parallel

 Allow the internal "diff-files" engine to run "how has this
 submodule changed?" in parallel to speed up "git status".

 Waiting for review.
 source: <20221020232532.1128326-1-calvinwan@google.com>


* es/doc-creation-factor-fix (2022-07-28) 2 commits
 . range-diff: clarify --creation-factor=<factor>
 . format-patch: clarify --creation-factor=<factor>

 Expecting a reroll by somebody more familiar with the logic
 cf. <xmqqo7wfix7p.fsf@gitster.g>
 source: <7229p500-p2r4-on87-6802-8o90s36rr3s4@tzk.qr>
