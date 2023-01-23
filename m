Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B065EC38142
	for <git@archiver.kernel.org>; Mon, 23 Jan 2023 07:48:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbjAWHsM (ORCPT <rfc822;git@archiver.kernel.org>);
        Mon, 23 Jan 2023 02:48:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbjAWHsL (ORCPT <rfc822;git@vger.kernel.org>);
        Mon, 23 Jan 2023 02:48:11 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFABB7AAE
        for <git@vger.kernel.org>; Sun, 22 Jan 2023 23:48:07 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id g205so8130702pfb.6
        for <git@vger.kernel.org>; Sun, 22 Jan 2023 23:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g4pBebLD78cowgdTRsCKA7vB98B/FOJb3lgc2AoJCAw=;
        b=FOgzmtq731YLiaf4F2MNsmCK8EGIYEgWJj6FI35Eq37yA59jm/HZRLCtUhjKxSB/v1
         mGTibz927FIEPZEr1cUWxB5TXM1pUZ0qi7AOy1cVNGg2KozIh2YwfPGQ09S4pXbn/krU
         s9UKk82vt1XFSV9d0rCCK21MuNifgaW8dNy39+UHjaMqfWtVJKU6e0uLOrDhufCduz4o
         OtReQWuIoC8c93NoCohSmb7hS4H6nI4WR4o6JNq5j3ZHx41V5BunUSMfrEv5zKJOe7d8
         wfCG07qy+IfBj6/Dvf+nRwwLIx8FfWgUV55ugXKkls/OeycMkoLOutIr89Uj15xsrknV
         281Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g4pBebLD78cowgdTRsCKA7vB98B/FOJb3lgc2AoJCAw=;
        b=vc07YBbx0slqS9sOB3ykk+lEgc5wWZnfJNoZRiJ1aE5wg5oxPqaqywJBUlbIoI23LS
         ggtYNuHusQJiwXjSIXaPGF6gsZWIDFhRdDUSElX5f0zmhF2aQTRmw29RhmIewo5MFdii
         XTW1BumEwsJnTTXSwobgD5apo9ptW6/8xDYpornqs0CwV+p7EERKPTAdqooNi+k1I8oy
         WP3Gk1iVgXMCka7s3Lh0lSkJzIDuHoxdhAxR4U1zrSylglIqIsLUZhe7oHU4/YlezlzE
         FBUrsAoAEQwNOMj++2VKHta00XTQA64iAd2n2sC+piOLQNryB6d9Z3hPho9/dCM02NEC
         nf1g==
X-Gm-Message-State: AFqh2kqgxTH6iXDv6pu09fafICFZ7TxnCWubiWx0+4PqNKLh86NRp344
        H4QLOzTJV3w6VUvzL016W8OmQ6bKerY=
X-Google-Smtp-Source: AMrXdXvhKoAowOQfKH0hjt+/iIFHY8v3lsZe7k3MYTppwEeupBj39ibyrpYaubsd8c3KHS/2aaTiRw==
X-Received: by 2002:aa7:874c:0:b0:58d:a1e9:36d with SMTP id g12-20020aa7874c000000b0058da1e9036dmr24205522pfo.31.1674460086535;
        Sun, 22 Jan 2023 23:48:06 -0800 (PST)
Received: from localhost (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id a8-20020aa78e88000000b0056bb36c047asm21964427pfr.105.2023.01.22.23.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 23:48:06 -0800 (PST)
Sender: Junio C Hamano <jch2355@gmail.com>
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Jan 2023, #06; Sun, 22)
X-master-at: 56c8fb1e95377900ec9d53c07886022af0a5d3c2
X-next-at: fc5497dd1b1018e63e916d3ef950ac3f70ea090d
Date:   Sun, 22 Jan 2023 23:48:05 -0800
Message-ID: <xmqqk01dofnu.fsf@gitster.g>
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

* ab/bisect-cleanup (2023-01-13) 6 commits
  (merged to 'next' on 2023-01-14 at 945b631a1e)
 + bisect: no longer try to clean up left-over `.git/head-name` files
 + bisect: remove Cogito-related code
 + bisect run: fix the error message
 + bisect: verify that a bogus option won't try to start a bisection
 + bisect--helper: make the order consistently `argc, argv`
 + bisect--helper: simplify exit code computation

 Code clean-up.
 source: <cover-v2-0.6-00000000000-20230112T151651Z-avarab@gmail.com>


* ar/bisect-doc-update (2023-01-13) 2 commits
  (merged to 'next' on 2023-01-14 at df5185519c)
 + git-bisect-lk2009: update nist report link
 + git-bisect-lk2009: update java code conventions link

 Doc update.
 source: <20230110093251.193552-1-rybak.a.v@gmail.com>


* ar/test-cleanup (2023-01-13) 3 commits
  (merged to 'next' on 2023-01-14 at 16d372b65d)
 + t7527: use test_when_finished in 'case insensitive+preserving'
 + t6422: drop commented out code
 + t6003: uncomment test '--max-age=c3, --topo-order'

 Test clean-up.
 source: <20230111233242.16870-1-rybak.a.v@gmail.com>


* es/hooks-and-local-env (2023-01-13) 1 commit
  (merged to 'next' on 2023-01-14 at 93acd89393)
 + githooks: discuss Git operations in foreign repositories

 Doc update for environment variables set when hooks are invoked.
 source: <pull.1457.v2.git.1673293508399.gitgitgadget@gmail.com>


* jc/doc-diff-patch.txt (2023-01-13) 1 commit
  (merged to 'next' on 2023-01-14 at d25ec1f631)
 + docs: link generating patch sections

 Doc update.
 source: <pull.1392.v2.git.git.1673626524221.gitgitgadget@gmail.com>


* jk/curl-avoid-deprecated-api (2023-01-17) 3 commits
  (merged to 'next' on 2023-01-17 at e3ead5f8a0)
 + http: support CURLOPT_PROTOCOLS_STR
 + http: prefer CURLOPT_SEEKFUNCTION to CURLOPT_IOCTLFUNCTION
 + http-push: prefer CURLOPT_UPLOAD to CURLOPT_PUT

 Deal with a few deprecation warning from cURL library.
 source: <Y8YP+R/hyNr6sEFA@coredump.intra.peff.net>


* jk/interop-error (2023-01-13) 1 commit
  (merged to 'next' on 2023-01-14 at ddca7887a5)
 + t/interop: report which vanilla git command failed

 Test helper improvement.
 source: <Y8A3yGeJl0TCDNqe@coredump.intra.peff.net>


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
 source: <Y7l4LsEQcDT9HZ21@coredump.intra.peff.net>


* jx/t1301-updates (2022-11-30) 3 commits
  (merged to 'next' on 2023-01-14 at d4f081b3f8)
 + t1301: do not change $CWD in "shared=all" test case
 + t1301: use test_when_finished for cleanup
 + t1301: fix wrong template dir for git-init

 Test updates.
 source: <20221128130323.8914-1-worldhello.net@gmail.com>


* pb/doc-orig-head (2023-01-13) 5 commits
  (merged to 'next' on 2023-01-14 at 0583c146cb)
 + git-rebase.txt: add a note about 'ORIG_HEAD' being overwritten
 + revisions.txt: be explicit about commands writing 'ORIG_HEAD'
 + git-merge.txt: mention 'ORIG_HEAD' in the Description
 + git-reset.txt: mention 'ORIG_HEAD' in the Description
 + git-cherry-pick.txt: do not use 'ORIG_HEAD' in example

 Document ORIG_HEAD a bit more.
 source: <pull.1456.v2.git.1673356521.gitgitgadget@gmail.com>


* ph/parse-date-reduced-precision (2023-01-13) 1 commit
  (merged to 'next' on 2023-01-14 at eb83564c3e)
 + date.c: allow ISO 8601 reduced precision times

 Loosen date parsing heuristics.
 source: <20230111001003.10916-1-congdanhqx@gmail.com>


* pw/rebase-exec-cleanup (2023-01-13) 1 commit
  (merged to 'next' on 2023-01-14 at 553d0daa62)
 + rebase: cleanup "--exec" option handling

 Code clean-up.
 source: <pull.1461.git.1673542201452.gitgitgadget@gmail.com>


* rs/dup-array (2023-01-09) 5 commits
  (merged to 'next' on 2023-01-14 at 3efbd1ffe0)
 + use DUP_ARRAY
 + add DUP_ARRAY
 + do full type check in BARF_UNLESS_COPYABLE
 + factor out BARF_UNLESS_COPYABLE
 + mingw: make argv2 in try_shell_exec() non-const

 Code cleaning.
 source: <9bc1bd74-f72c-1b43-df7c-950815babb03@web.de>
 source: <3e04e283-cad0-7be4-d85c-65d0a52289e2@web.de>


* sk/merge-filtering-strategies-micro-optim (2023-01-13) 1 commit
  (merged to 'next' on 2023-01-14 at f171559fae)
 + merge: break out of all_strategy loop when strategy is found

 Micro optimization.
 source: <pull.1429.v2.git.git.1673285669004.gitgitgadget@gmail.com>


* tl/ls-tree-code-clean-up (2023-01-13) 6 commits
  (merged to 'next' on 2023-01-14 at f7238037fd)
 + t3104: remove shift code in 'test_ls_tree_format'
 + ls-tree: cleanup the redundant SPACE
 + ls-tree: make "line_termination" less generic
 + ls-tree: fold "show_tree_data" into "cb" struct
 + ls-tree: use a "struct options"
 + ls-tree: don't use "show_tree_data" for "fast" callbacks

 Code clean-up.
 source: <20230112091135.20050-1-tenglong.tl@alibaba-inc.com>


* yc/doc-fetch-fix (2023-01-13) 1 commit
  (merged to 'next' on 2023-01-14 at a3ca60840b)
 + doc: fix non-existent config name

 Doc fix.
 source: <CAEg0tHSZi22RUBREJB=Cfy6O72cicv9FTkgo_Z=gvGRdPK1acw@mail.gmail.com>


* yo/doc-use-more-switch-c (2023-01-13) 1 commit
  (merged to 'next' on 2023-01-14 at 7169d5dabc)
 + doc: add "git switch -c" as another option on detached HEAD

 Doc update.
 source: <pull.1422.v2.git.git.1673261237449.gitgitgadget@gmail.com>

--------------------------------------------------
[New Topics]

* ab/cache-api-cleanup-users (2023-01-17) 3 commits
  (merged to 'next' on 2023-01-18 at c5a4374652)
 + treewide: always have a valid "index_state.repo" member
 + Merge branch 'ds/omit-trailing-hash-in-index' into ab/cache-api-cleanup-users
 + Merge branch 'ab/cache-api-cleanup' into ab/cache-api-cleanup-users
 (this branch uses ab/cache-api-cleanup and ds/omit-trailing-hash-in-index.)

 Updates the users of the cache API.

 Will merge to 'master'.
 cf. <db312853-81a1-542b-db96-d816c463516c@github.com>
 source: <patch-1.1-b4998652822-20230117T135234Z-avarab@gmail.com>


* cb/checkout-same-branch-twice (2023-01-20) 1 commit
 - checkout/switch: disallow checking out same branch in multiple worktrees

 "git checkout -B $branch" failed to protect against checking out
 a branch that is checked out elsewhere, unlike "git branch -f" did.

 Expecting a (hopefully final) reroll.
 cf. <8f24fc3c-c30f-dc70-5a94-5ee4ed3de102@dunelm.org.uk>
 source: <20230120113553.24655-1-carenas@gmail.com>


* sa/cat-file-mailmap--batch-check (2023-01-18) 1 commit
  (merged to 'next' on 2023-01-18 at 25ecb1dd3a)
 + git-cat-file.txt: fix list continuations rendering literally

 Docfix.

 Will merge to 'master'.
 source: <20230118082749.1252459-1-martin.agren@gmail.com>


* pb/branch-advice-recurse-submodules (2023-01-18) 1 commit
  (merged to 'next' on 2023-01-19 at 13747fc72d)
 + branch: improve advice when --recurse-submodules fails

 Improve advice message given when "git branch --resurse-submodules"
 fails.

 Will merge to 'master'.
 source: <pull.1464.git.1673890908453.gitgitgadget@gmail.com>


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

 Needs review.
 source: <cover-v3-0.8-00000000000-20230118T160600Z-avarab@gmail.com>


* en/rebase-update-refs-needs-merge-backend (2023-01-22) 9 commits
 - rebase: provide better error message for apply options vs. merge config
 - rebase: put rebase_options initialization in single place
 - rebase: fix formatting of rebase --reapply-cherry-picks option in docs
 - rebase: clarify the OPT_CMDMODE incompatibilities
 - rebase: add coverage of other incompatible options
 - rebase: fix docs about incompatibilities with --root
 - rebase: remove --allow-empty-message from incompatible opts
 - rebase: flag --apply and --merge as incompatible
 - rebase: mark --update-refs as requiring the merge backend

 The "--update-refs" feature of "git rebase" requires the use of the
 merge backend, while "--whitespace=fix" feature does not work with
 the said backend.  Notice the combination and error out, instead of
 silently ignoring one of the features requested.

 Needs review.
 source: <pull.1466.v4.git.1674367961.gitgitgadget@gmail.com>


* jk/hash-object-literally-fd-leak (2023-01-19) 1 commit
  (merged to 'next' on 2023-01-19 at fff9b60a36)
 + hash-object: fix descriptor leak with --literally

 Leakfix.

 Will merge to 'master'.
 source: <Y8ijpJqtkDTi792i@coredump.intra.peff.net>


* jc/doc-branch-update-checked-out-branch (2023-01-18) 1 commit
  (merged to 'next' on 2023-01-19 at 970900a232)
 + branch: document `-f` and linked worktree behaviour

 Document that "branch -f <branch>" disables only the safety to
 avoid recreating an existing branch.

 Will merge to 'master'.
 source: <xmqqa62f2dj1.fsf_-_@gitster.g>


* jc/doc-checkout-b (2023-01-19) 1 commit
 - checkout: document -b/-B to highlight the differences from "git branch"

 Clarify how "checkout -b/-B" and "git branch [-f]" are similar but
 different in the documentation.

 Will merge to 'next'.
 source: <xmqqtu0m1m9i.fsf@gitster.g>


* cw/fetch-remote-group-with-duplication (2023-01-19) 1 commit
  (merged to 'next' on 2023-01-20 at 7f00e43209)
 + fetch: fix duplicate remote parallel fetch bug

 "git fetch <group>", when "<group>" of remotes lists the same
 remote twice, unnecessarily failed when parallel fetching was
 enabled, which has been corrected.

 Will merge to 'master'.
 source: <20230119220538.1522464-1-calvinwan@google.com>


* po/pretty-format-columns-doc (2023-01-19) 5 commits
 - doc: pretty-formats note wide char limitations, and add tests
 - doc: pretty-formats describe use of ellipsis in truncation
 - doc: pretty-formats document negative column alignments
 - doc: pretty-formats: delineate `%<|(` parameter values
 - doc: pretty-formats: separate parameters from placeholders

 Clarify column-padding operators in the pretty format string.

 Will merge to 'next'.
 source: <20230119181827.1319-1-philipoakley@iee.email>


* jk/hash-object-fsck (2023-01-19) 7 commits
 - fsck: do not assume NUL-termination of buffers
 - hash-object: use fsck for object checks
 - fsck: provide a function to fsck buffer without object struct
 - t: use hash-object --literally when created malformed objects
 - t7030: stop using invalid tag name
 - t1006: stop using 0-padded timestamps
 - t1007: modernize malformed object tests

 "git hash-object" now checks that the resulting object is well
 formed with the same code as "git fsck".

 Will merge to 'next'.
 source: <Y8hX+pIZUKXsyYj5@coredump.intra.peff.net>
 source: <Y8ifa7hyqxSbL92U@coredump.intra.peff.net>


* rs/tree-parse-mode-overflow-check (2023-01-21) 1 commit
 - tree-walk: disallow overflowing modes

 Reject tree objects with entries whose mode bits are overly wide.

 Will merge to 'next'.
 source: <d673fde7-7eb2-6306-86b6-1c1a4c988ee8@web.de>


* tb/t0003-invoke-dd-more-portably (2023-01-22) 1 commit
 - t0003: call dd with portable blocksize

 Test portability fix.

 Will merge to 'next'.
 source: <20230122062839.14542-1-tboegi@web.de>


* ar/markup-em-en-dash (2023-01-22) 1 commit
 - Documentation: render dash correctly

 Doc mark-up fix.

 Will merge to 'next'.
 source: <20230122165628.1601062-1-rybak.a.v@gmail.com>


* jc/attr-doc-fix (2023-01-22) 1 commit
 - attr: fix instructions on how to check attrs

 Comment fix.

 Will merge to 'next'.
 source: <pull.1441.git.git.1674356774172.gitgitgadget@gmail.com>


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


* cb/grep-fallback-failing-jit (2022-12-17) 1 commit
 - grep: fall back to interpreter mode if JIT fails

 In an environment where dynamically generated code is prohibited to
 run (e.g. SELinux), failure to JIT pcre patterns is expected.  Fall
 back to interpreted execution in such a case.

 Expecting a reroll.
 cf. <f680b274-fa85-6624-096a-7753a2671c15@grsecurity.net>
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


* ds/omit-trailing-hash-in-index (2023-01-17) 1 commit
  (merged to 'next' on 2023-01-17 at 8dde3cf2db)
 + t1600: fix racy index.skipHash test
 (this branch is used by ab/cache-api-cleanup-users.)

 Quickfix for a topic already in 'master'.

 Will merge to 'master'.
 source: <76204710-356a-2a85-9057-302e6619b9df@github.com>


* ab/cache-api-cleanup (2023-01-16) 5 commits
  (merged to 'next' on 2023-01-16 at a0f388b149)
 + cache API: add a "INDEX_STATE_INIT" macro/function, add release_index()
 + read-cache.c: refactor set_new_index_sparsity() for subsequent commit
 + sparse-index API: BUG() out on NULL ensure_full_index()
 + sparse-index.c: expand_to_path() can assume non-NULL "istate"
 + builtin/difftool.c: { 0 }-initialize rather than using memset()
 (this branch is used by ab/cache-api-cleanup-users.)

 Code clean-up to tighten the use of in-core index in the API.

 Will merge to 'master'.
 source: <cover-v2-0.6-00000000000-20230112T124842Z-avarab@gmail.com>


* ab/test-env-helper (2023-01-14) 1 commit
  (merged to 'next' on 2023-01-16 at 82c17f02e5)
 + env-helper: move this built-in to "test-tool env-helper"

 Remove "git env--helper" and demote it to a test-tool subcommand.

 Will merge to 'master'.
 source: <patch-1.1-e662c570f1d-20230112T155226Z-avarab@gmail.com>


* en/ls-files-doc-update (2023-01-13) 4 commits
 - ls-files: guide folks to --exclude-standard over other --exclude* options
 - ls-files: clarify descriptions of status tags for -t
 - ls-files: clarify descriptions of file selection options
 - ls-files: add missing documentation for --resolve-undo option

 Doc update to ls-files.

 Will merge to 'next'?
 source: <pull.1463.git.1673584914.gitgitgadget@gmail.com>


* en/t6426-todo-cleanup (2023-01-14) 1 commit
  (merged to 'next' on 2023-01-16 at 7d13842eeb)
 + t6426: fix TODO about making test more comprehensive

 Test clean-up.

 Will merge to 'master'.
 source: <pull.1462.v2.git.1673722187025.gitgitgadget@gmail.com>


* zh/scalar-progress (2023-01-16) 1 commit
  (merged to 'next' on 2023-01-17 at d4c25cc71f)
 + scalar: show progress if stderr refers to a terminal

 "scalar" learned to give progress bar.

 Will merge to 'master'.
 source: <pull.1441.v3.git.1673442860379.gitgitgadget@gmail.com>


* ms/send-email-feed-header-to-validate-hook (2023-01-19) 2 commits
 - send-email: expose header information to git-send-email's sendemail-validate hook
 - send-email: refactor header generation functions

 "git send-email" learned to give the e-mail headers to the validate
 hook by passing an extra argument from the command line.

 Expecting a (hopefully final) reroll.
 cf. <c1ba0a28-3c39-b313-2757-dceb02930334@amd.com>
 source: <20230120012459.920932-1-michael.strawbridge@amd.com>


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

 Expecting a reroll.
 cf. <4e2ac966-0f45-8018-ff8f-3831ea0c3c2e@github.com>
 source: <pull.1454.git.1673037405.gitgitgadget@gmail.com>


* tc/cat-file-z-use-cquote (2023-01-16) 1 commit
 - cat-file: quote-format name in error when using -z

 "cat-file" in the batch mode that is fed NUL-terminated pathnames
 learned to cquote them in its error output (otherwise, a funny
 pathname with LF in it would break the lines in the output stream).

 Expecting a reroll.
 cf. <2a2a46f0-a9bc-06a6-72e1-28800518777c@dunelm.org.uk>
 source: <20230116190749.4141516-1-toon@iotcl.com>


* cb/grep-pcre-ucp (2023-01-18) 1 commit
  (merged to 'next' on 2023-01-19 at 2c7e531839)
 + grep: correctly identify utf-8 characters with \{b,w} in -P

 "grep -P" learned to use Unicode Character Property to grok
 character classes when processing \b and \w etc.

 Will merge to 'master'.
 cf. <xmqqzgaf2zpt.fsf@gitster.g>
 source: <20230108155217.2817-1-carenas@gmail.com>


* rs/use-enhanced-bre-on-macos (2023-01-08) 1 commit
  (merged to 'next' on 2023-01-16 at 9b80d4253f)
 + use enhanced basic regular expressions on macOS

 Newer regex library macOS stopped enabling GNU-like enhanced BRE,
 where '\(A\|B\)' works as alternation, unless explicitly asked with
 the REG_ENHANCED flag.  "git grep" now can be compiled to do so, to
 retain the old behaviour.

 Will merge to 'master'.
 source: <26a0d4ca-3d97-ace4-1a1f-92b1ee6715a6@web.de>


* cw/submodule-status-in-parallel (2023-01-17) 6 commits
 - submodule: call parallel code from serial status
 - diff-lib: parallelize run_diff_files for submodules
 - diff-lib: refactor match_stat_with_submodule
 - submodule: move status parsing into function
 - submodule: strbuf variable rename
 - run-command: add duplicate_output_fn to run_processes_parallel_opts

 "git submodule status" learned to run the comparison in submodule
 repositories in parallel.

 Needs review.
 source: <20230104215415.1083526-1-calvinwan@google.com>


* kn/attr-from-tree (2023-01-14) 2 commits
  (merged to 'next' on 2023-01-16 at 426f357683)
 + attr: add flag `--source` to work with tree-ish
 + t0003: move setup for `--all` into new block

 "git check-attr" learned to take an optional tree-ish to read the
 .gitattributes file from.

 Will merge to 'master'.
 source: <cover.1673684790.git.karthik.188@gmail.com>


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


* km/send-email-with-v-reroll-count (2022-11-27) 1 commit
  (merged to 'next' on 2023-01-19 at 9b3543471c)
 + send-email: relay '-v N' to format-patch

 "git send-email -v 3" used to be expanded to "git send-email
 --validate 3" when the user meant to pass them down to
 "format-patch", which has been corrected.

 Will merge to 'master'.
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


* mc/credential-helper-auth-headers (2023-01-20) 12 commits
 - credential: add WWW-Authenticate header to cred requests
 - http: read HTTP WWW-Authenticate response headers
 - http: replace unsafe size_t multiplication with st_mult
 - test-http-server: add sending of arbitrary headers
 - test-http-server: add simple authentication
 - test-http-server: pass Git requests to http-backend
 - test-http-server: add HTTP request parsing
 - test-http-server: add HTTP error response function
 - test-http-server: add stub HTTP server test helper
 - daemon: rename some esoteric/laboured terminology
 - daemon: libify child process handling functions
 - daemon: libify socket setup and option functions

 Extending credential helper protocol.

 Needs review.
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
 source: <20221112143616.1429-1-philipoakley@iee.email>
