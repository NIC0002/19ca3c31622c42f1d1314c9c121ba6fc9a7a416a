Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2EAC77B6C
	for <git@archiver.kernel.org>; Thu,  6 Apr 2023 23:27:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbjDFX1b (ORCPT <rfc822;git@archiver.kernel.org>);
        Thu, 6 Apr 2023 19:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbjDFX1a (ORCPT <rfc822;git@vger.kernel.org>);
        Thu, 6 Apr 2023 19:27:30 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 552F183F7
        for <git@vger.kernel.org>; Thu,  6 Apr 2023 16:27:26 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so42099534pjb.0
        for <git@vger.kernel.org>; Thu, 06 Apr 2023 16:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680823645; x=1683415645;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TldFqkiPb1e/mUoWiuFgq28L58cUTbVcelUxHFjqTGs=;
        b=qmyIgj6z6ebBPXebP8GD/lh7TURmnFUVfQnYsiBwH0gbmISnIfaqlE0S6b/Nu/Na8D
         a/a6AZyOFDHUJOy5MQDgoC3PEXm68b4DzCGpFbE8AGoEUfGx79SrmUhToAeXa3bTYCkZ
         t7vuM2RRQCsEyaMs5PtNTAcLig4dOErW9KxRBWw/Da4IAfx0Hm9X1VGoK/FYjXkGWAL6
         lSyUrXB2iwcZ7Jp+fwZnk6WExPEx5yU+waI/6j7SnxNemQ2ZEGgkQSFvuGWG33wyt/p0
         /tzGyb3HWlHB/eJS8xhI6H+Ep57M2AM/Hi6RJWU2/NsM+lq/MIj2I+pFzbIBMNYFe/+R
         RAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680823645; x=1683415645;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TldFqkiPb1e/mUoWiuFgq28L58cUTbVcelUxHFjqTGs=;
        b=JpQlZgOlZkpA/cwoerN+4ieu17tPsmhuHy9LIqa8S7beHrc7QorqlpfFvVzFKjOZ5H
         8vl3u0OH5sZRQzd9P435TPyapy/ineg23SvKGh1rauJlPzOi8Xt3EvllF3OAFfxuhXq9
         sFbLdWMvjfOMBQZW2EURpPT3KYJTcr+4wuDmVwuPQQDP4ZkfaQdaYWSy/ILNJc1IgeAA
         Z+0t1MMeJvDYWuknHHvB5QNTLU/qdCcI2c6L0vS2tnWuZrCMF3Oea2oAAX1g/w+Q7N7R
         csW8Z+Rh4tBnK98Sp97i1VFHfUev3LuUDkum1ogo9mYVnBV1D1egItg/6pECWJNAiHZm
         bWIA==
X-Gm-Message-State: AAQBX9fbAIczQEjMekqdrxvus5TNg/QilCBWo7709hbhh4ifktU7lZcD
        DKN4v+m3gusy6HZLm7qaW4d/sXDAClM=
X-Google-Smtp-Source: AKy350ZQWByVVWsbSAzM6Dnx1jwdrCvED97Z3CSkDqR7wGcdMJaK0PTa+CTysliPdUGHi+r3NUc6IA==
X-Received: by 2002:a17:90b:38c7:b0:23b:3641:cf16 with SMTP id nn7-20020a17090b38c700b0023b3641cf16mr103120pjb.11.1680823644859;
        Thu, 06 Apr 2023 16:27:24 -0700 (PDT)
Received: from localhost (254.80.82.34.bc.googleusercontent.com. [34.82.80.254])
        by smtp.gmail.com with ESMTPSA id o4-20020a1709026b0400b001a216d44440sm1844549plk.200.2023.04.06.16.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 16:27:24 -0700 (PDT)
Sender: Junio C Hamano <jch2355@gmail.com>
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Apr 2023, #02; Thu, 6)
X-master-at: 0607f793cbe0af16aee6d2480056d891835884bd
X-next-at: 4ca3ef321147b456561d0c3a4c90cbb38891a488
Date:   Thu, 06 Apr 2023 16:27:23 -0700
Message-ID: <xmqqmt3k4mn8.fsf@gitster.g>
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

We are in the middle of the 4th week of an 10-week cycle which is
expected to last til the end of May.  With quite a many topics that
have been cooking in 'next' already graduated to 'master', it is a
good time to rewind the tip of 'next', which I'll be doing shortly.

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

* ab/config-multi-and-nonbool (2023-03-28) 9 commits
  (merged to 'next' on 2023-03-30 at bcfe99b43d)
 + for-each-repo: with bad config, don't conflate <path> and <cmd>
 + config API: add "string" version of *_value_multi(), fix segfaults
 + config API users: test for *_get_value_multi() segfaults
 + for-each-repo: error on bad --config
 + config API: have *_multi() return an "int" and take a "dest"
 + versioncmp.c: refactor config reading next commit
 + config API: add and use a "git_config_get()" family of functions
 + config tests: add "NULL" tests for *_get_value_multi()
 + config tests: cover blind spots in git_die_config() tests

 Assorted config API updates.
 source: <cover-v8-0.9-00000000000-20230328T140126Z-avarab@gmail.com>


* ab/remove-implicit-use-of-the-repository (2023-03-28) 17 commits
  (merged to 'next' on 2023-03-30 at e0abe2d872)
 + libs: use "struct repository *" argument, not "the_repository"
 + post-cocci: adjust comments for recent repo_* migration
 + cocci: apply the "revision.h" part of "the_repository.pending"
 + cocci: apply the "rerere.h" part of "the_repository.pending"
 + cocci: apply the "refs.h" part of "the_repository.pending"
 + cocci: apply the "promisor-remote.h" part of "the_repository.pending"
 + cocci: apply the "packfile.h" part of "the_repository.pending"
 + cocci: apply the "pretty.h" part of "the_repository.pending"
 + cocci: apply the "object-store.h" part of "the_repository.pending"
 + cocci: apply the "diff.h" part of "the_repository.pending"
 + cocci: apply the "commit.h" part of "the_repository.pending"
 + cocci: apply the "commit-reach.h" part of "the_repository.pending"
 + cocci: apply the "cache.h" part of "the_repository.pending"
 + cocci: add missing "the_repository" macros to "pending"
 + cocci: sort "the_repository" rules by header
 + cocci: fix incorrect & verbose "the_repository" rules
 + cocci: remove dead rule from "the_repository.pending.cocci"
 (this branch is used by en/header-split-cache-h.)

 Code clean-up around the use of the_repository.
 source: <cover-v2-00.17-00000000000-20230328T110946Z-avarab@gmail.com>


* ds/ahead-behind (2023-03-20) 9 commits
  (merged to 'next' on 2023-03-23 at a607895174)
 + commit-reach: add tips_reachable_from_bases()
 + for-each-ref: add ahead-behind format atom
 + commit-reach: implement ahead_behind() logic
 + commit-graph: introduce `ensure_generations_valid()`
 + commit-graph: return generation from memory
 + commit-graph: simplify compute_generation_numbers()
 + commit-graph: refactor compute_topological_levels()
 + for-each-ref: explicitly test no matches
 + for-each-ref: add --stdin option
 (this branch is used by ps/ahead-behind-truncation-fix.)

 "git for-each-ref" learns '%(ahead-behind:<base>)' that computes the
 distances from a single reference point in the history with bunch
 of commits in bulk.
 source: <pull.1489.v4.git.1679311615.gitgitgadget@gmail.com>


* ds/fetch-bundle-uri-with-all (2023-03-31) 1 commit
  (merged to 'next' on 2023-03-31 at a9f787341d)
 + fetch: download bundles once, even with --all

 "git fetch --all" does not have to download and handle the same
 bundleURI over and over, which has been corrected.
 source: <pull.1508.git.1680278344173.gitgitgadget@gmail.com>


* en/header-split-cleanup (2023-03-21) 16 commits
  (merged to 'next' on 2023-03-30 at b69ff46cad)
 + csum-file.h: remove unnecessary inclusion of cache.h
 + write-or-die.h: move declarations for write-or-die.c functions from cache.h
 + treewide: remove cache.h inclusion due to setup.h changes
 + setup.h: move declarations for setup.c functions from cache.h
 + treewide: remove cache.h inclusion due to environment.h changes
 + environment.h: move declarations for environment.c functions from cache.h
 + treewide: remove unnecessary includes of cache.h
 + wrapper.h: move declarations for wrapper.c functions from cache.h
 + path.h: move function declarations for path.c functions from cache.h
 + cache.h: remove expand_user_path()
 + abspath.h: move absolute path functions from cache.h
 + environment: move comment_line_char from cache.h
 + treewide: remove unnecessary cache.h inclusion from several sources
 + treewide: remove unnecessary inclusion of gettext.h
 + treewide: be explicit about dependence on gettext.h
 + treewide: remove unnecessary cache.h inclusion from a few headers
 (this branch is used by en/header-split-cache-h.)

 Split key function and data structure definitions out of cache.h to
 new header files and adjust the users.
 source: <pull.1493.v2.git.1679379968.gitgitgadget@gmail.com>


* gc/config-parsing-cleanup (2023-03-28) 8 commits
  (merged to 'next' on 2023-03-30 at e7ea626edf)
 + config.c: rename "struct config_source cf"
 + config: report cached filenames in die_bad_number()
 + config.c: remove current_parsing_scope
 + config.c: remove current_config_kvi
 + config.c: plumb the_reader through callbacks
 + config.c: create config_reader and the_reader
 + config.c: don't assign to "cf_global" directly
 + config.c: plumb config_source through static fns

 Config API clean-up to reduce its dependence on static variables
 source: <pull.1463.v3.git.git.1680025914.gitgitgadget@gmail.com>


* jk/chainlint-fixes (2023-03-30) 5 commits
  (merged to 'next' on 2023-03-30 at 52f229b710)
 + tests: skip test_eval_ in internal chain-lint
 + tests: drop here-doc check from internal chain-linter
 + tests: diagnose unclosed here-doc in chainlint.pl
 + tests: replace chainlint subshell with a function
 + tests: run internal chain-linter under "make test"

 Test framework fix.
 source: <20230330192712.GA27719@coredump.intra.peff.net>


* jk/document-pack-redundant-deprecation (2023-03-30) 1 commit
  (merged to 'next' on 2023-03-30 at e9d10e27a4)
 + pack-redundant: document deprecation

 Document that we have marked "pack-redundant" as deprecated.
 source: <20230328190641.GF18558@coredump.intra.peff.net>


* jk/unused-post-2.40 (2023-03-17) 4 commits
  (merged to 'next' on 2023-03-30 at 10aeb0d4ae)
 + transport: mark unused parameters in fetch_refs_from_bundle()
 + http: mark unused parameter in fill_active_slot() callbacks
 + http: drop unused parameter from start_object_request()
 + mailmap: drop debugging code

 More "-Wunused-parameters" code clean-up.
 source: <ZBS77VYL9ZrxKtCN@coredump.intra.peff.net>


* jk/unused-post-2.40-part2 (2023-03-28) 7 commits
  (merged to 'next' on 2023-03-29 at 7aeee1b6c6)
 + parse-options: drop parse_opt_unknown_cb()
 + t/helper: mark unused argv/argc arguments
 + mark "argv" as unused when we check argc
 + builtins: mark unused prefix parameters
 + builtins: annotate always-empty prefix parameters
 + builtins: always pass prefix to parse_options()
 + fast-import: fix file access when run from subdir

 Code clean-up for "-Wunused-parameter" build.
 source: <20230328205253.GA1753925@coredump.intra.peff.net>


* ow/ref-format-remove-unused-member (2023-03-30) 1 commit
  (merged to 'next' on 2023-03-30 at 898a5df956)
 + ref-filter: remove unused ref_format member

 Code clean-up.
 source: <20230330112133.4437-2-oystwa@gmail.com>


* ps/ahead-behind-truncation-fix (2023-03-27) 1 commit
  (merged to 'next' on 2023-03-31 at 60bc243011)
 + commit-graph: fix truncated generation numbers
 (this branch uses ds/ahead-behind.)

 Fix unnecessary truncation of generation numbers used in-core.
 source: <f8a0a869e8b0882f05cac49d78f49ba3553d3c44.1679904401.git.ps@pks.im>


* ps/fetch-ref-update-reporting (2023-03-20) 6 commits
  (merged to 'next' on 2023-03-30 at e5df1cae0b)
 + fetch: centralize printing of reference updates
 + fetch: centralize logic to print remote URL
 + fetch: centralize handling of per-reference format
 + fetch: pass the full local reference name to `format_display`
 + fetch: move output format into `display_state`
 + fetch: move reference width calculation into `display_state`

 Clean-up of the code path that reports what "git fetch" did to each
 ref.
 source: <cover.1679315383.git.ps@pks.im>


* sm/ssl-key-type-config (2023-03-23) 1 commit
  (merged to 'next' on 2023-03-30 at 773716fc60)
 + http: add support for different sslcert and sslkey types.

 Add a few configuration variables to tell the cURL library that
 different types of ssl-cert and ssl-key are in use.
 source: <pull.1474.v2.git.git.1679327330032.gitgitgadget@gmail.com>

--------------------------------------------------
[New Topics]

* dw/doc-submittingpatches-grammofix (2023-04-05) 1 commit
  (merged to 'next' on 2023-04-05 at 2691fad020)
 + SubmittingPatches: clarify MUA discussion with "the"

 Originally merged to 'next' on 2023-04-05

 Grammofix.

 Will merge to 'master'.
 source: <ZC0yey+S+OD/S2tt@trent-reznor>


* fc/doc-manpage-base-url-fix (2023-04-05) 1 commit
 - doc: remove manpage-base-url workaround

 Modernize manpage generation toolchain.

 Will merge to 'next'.
 source: <20230322000815.132128-1-felipe.contreras@gmail.com>


* jc/clone-object-format-from-void (2023-04-05) 1 commit
 - clone: propagate object-format when cloning from void

 "git clone" from an empty repository learned to propagate the
 choice of the hash algorithm from the source repository to the
 newly created repository.

 Will merge to 'next'.
 source: <xmqq355euj2i.fsf@gitster.g>


* rj/sendemail-validate-series-hook (2023-04-05) 1 commit
 - hooks: add sendemail-validate-series

 "git send-email" learns a new hook that takes the entire set of
 patch files from its standard input to validate them in one go,
 instead of getting called once per each file.

 Comments?
 source: <20230405231305.96996-1-robin@jarry.cc>


* tk/mergetool-gui-default-config (2023-04-05) 1 commit
 - mergetool: new config guiDefault supports auto-toggling gui by DISPLAY

 "git mergetool" and "git difftool" learns a new configuration
 guiDefault to optionally favor configured guitool over non-gui-tool
 automatically when $DISPLAY is set.

 Will merge to 'next'.
 source: <pull.1381.v4.git.1679153263217.gitgitgadget@gmail.com>


* cm/branch-delete-error-message-update (2023-04-06) 1 commit
 - branch: improve error log on branch not found by checking remotes refs

 "git branch -d origin/master" would say "no such branch", but it is
 likely a missed "-r" if refs/remotes/origin/master exists.  The
 command has been taught to give such a hint in its error message.

 Will merge to 'next'?
 source: <pull.1476.v3.git.git.1680695000257.gitgitgadget@gmail.com>


* fc/remove-header-workarounds-for-asciidoc (2023-04-05) 1 commit
 - doc: asciidoc: remove custom header macro

 Doc toolchain update to remove old workaround for AsciiDoc.

 Will merge to 'next'?
 source: <20230323221523.52472-1-felipe.contreras@gmail.com>


* jk/use-perl-path-consistently (2023-04-06) 1 commit
 - t/lib-httpd: pass PERL_PATH to CGI scripts

 Tests had a few places where we ignored PERL_PATH and blindly used
 /usr/bin/perl, which have been corrected.

 Will merge to 'next'.
 source: <20230406093602.GD2215039@coredump.intra.peff.net>

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

* ow/ref-filter-omit-empty (2023-04-06) 1 commit
 - branch, for-each-ref: add option to omit empty lines

 "git branch --format=..." and "git format-patch --format=..."
 learns "--omit-empty" to hide refs that whose formatting result
 becomes an empty string from the output.

 Looking good.
 source: <20230406170837.10060-3-oystwa@gmail.com>


* jc/spell-id-in-both-caps-in-message-id (2023-04-03) 1 commit
  (merged to 'next' on 2023-04-04 at 4cfa5997eb)
 + e-mail workflow: Message-ID is spelled with ID in both capital letters

 Originally merged to 'next' on 2023-04-04

 Consistently spell "Message-ID" as such, not "Message-Id".

 Will merge to 'master'.
 source: <xmqqsfhgnmqg.fsf@gitster.g>


* rn/sparse-describe (2023-04-03) 1 commit
 - describe: enable sparse index for describe

 "git describe --dirty" learns to work better with sparse-index.

 Will merge to 'next'?
 source: <20230403164749.246001-1-nanth.raghul@gmail.com>


* ar/adjust-tests-for-the-index-fallout (2023-03-31) 2 commits
  (merged to 'next' on 2023-04-04 at 48861fc381)
 + t2107: fix mention of the_index.cache_changed
 + t3060: fix mention of function prune_index

 Originally merged to 'next' on 2023-04-04

 Comment updates.

 Will merge to 'master'.
 source: <20230331143604.82040-2-rybak.a.v@gmail.com>


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


* en/header-split-cache-h (2023-04-04) 25 commits
 - mailmap, quote: move declarations of global vars to correct unit
 - treewide: reduce includes of cache.h in other headers
 - treewide: remove double forward declaration of read_in_full
 - strbuf: move forward declarations to beginning of file
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

 Will merge to 'next'?
 source: <pull.1509.v2.git.1680571348.gitgitgadget@gmail.com>


* jx/cap-object-info-uninitialized-fix (2023-04-03) 1 commit
  (merged to 'next' on 2023-04-05 at d56fe6eedc)
 + object-info: init request_info before reading arg

 Originally merged to 'next' on 2023-04-05

 Correct use of an uninitialized structure member.

 Will merge to 'master'.
 source: <20230402130557.17662-1-worldhello.net@gmail.com>


* sl/sparse-write-tree (2023-04-04) 1 commit
 - write-tree: integrate with sparse index

 "git write-tree" learns to work better with sparse-index.

 Will merge to 'next'.
 source: <20230404003539.1578245-1-cheskaqiqi@gmail.com>


* ed/fsmonitor-windows-named-pipe (2023-03-24) 1 commit
 - fsmonitor: handle differences between Windows named pipe functions

 Fix fsmonitor on Windows when the filesystem path contains certain
 characters.

 Expecting a reroll.
 cf. <b9cf67e4-22a7-2ff0-8310-9223bea10d6d@jeffhostetler.com>
 source: <pull.1503.git.1679678090412.gitgitgadget@gmail.com>


* ws/sparse-check-rules (2023-03-27) 2 commits
  (merged to 'next' on 2023-04-04 at 17a29244a6)
 + builtin/sparse-checkout: add check-rules command
 + builtin/sparse-checkout: remove NEED_WORK_TREE flag

 Originally merged to 'next' on 2023-04-04

 "git sparse-checkout" command learns a debugging aid for the sparse
 rule definitions.

 Will merge to 'master'.
 source: <pull.1488.v2.git.1679903703.gitgitgadget@gmail.com>


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
  (merged to 'next' on 2023-03-21 at b579e226b5)
 + pack-bitmap.c: factor out `bitmap_index_seek_commit()`
 + pack-bitmap.c: use `bitmap_index_seek()` where possible
 + pack-bitmap.c: factor out manual `map_pos` manipulation
 + pack-bitmap.c: drop unnecessary 'inline's
 + pack-bitmap.c: hide bitmap internals in `read_be32()`
 + pack-bitmap.c: hide bitmap internals in `read_u8()`

 Originally merged to 'next' on 2023-03-21

 Clean-up the pack-bitmap codepath.

 On hold.  There is a BUG() on data errors.
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


* pw/rebase-cleanup-merge-strategy-option-handling (2023-04-05) 5 commits
 - rebase: remove a couple of redundant strategy tests
 - rebase -m: fix serialization of strategy options
 - rebase -m: cleanup --strategy-option handling
 - sequencer: use struct strvec to store merge strategy options
 - rebase: stop reading and writing unnecessary strategy state

 Clean-up of the code path that deals with merge strategy option
 handling in "git rebase".
 source: <cover.1680708043.git.phillip.wood@dunelm.org.uk>


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
