Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF39C433FE
	for <git@archiver.kernel.org>; Wed, 26 Oct 2022 18:43:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233898AbiJZSn1 (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 26 Oct 2022 14:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233628AbiJZSn0 (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 26 Oct 2022 14:43:26 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B96DF680F
        for <git@vger.kernel.org>; Wed, 26 Oct 2022 11:43:24 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id b29so11857355pfp.13
        for <git@vger.kernel.org>; Wed, 26 Oct 2022 11:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8JX7Z1CcQSNHph34liTZ9WAgjvyEikFNehL6q3tzwQU=;
        b=O1K/wPDo9KTVBN5TsPPYGuA34pp5ovVIdkohVB8U4/EwgBQn1yJJMLTOnBvTc5jByK
         n3XENVkQD2hq5owu8w744m+4mkaWC/Kh9ZF8edMdp4J6Qr8Jr8OuYQsziVGQbWBt8nug
         dwA4TP9eCFRn57N4F9N+VZaNNQ/VSJHnvcXkPbGgK03K9S+gsET94c7nhOqZeKMIDkiq
         TflBzXrFKD1KziwpDtFaIEbVVJUaLFoXEVXAD9uVnsn9pIAN2SKbQPQZAnDky4KvIbDe
         0hhwdf7zf/GaSaAC/tPXvA4jiOwxPjajV/n6VPsTpXC+LuWt+872hOBK3Uv5ChA5VFms
         /J2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8JX7Z1CcQSNHph34liTZ9WAgjvyEikFNehL6q3tzwQU=;
        b=6kGLK/oNgMfhppFRWacc6e/EDXqZVltOaLEZ8vlsaPdubaYe1sXC6gWey34aB91U1U
         5UVcv1Yoi7wIEPW2duaB5BrzmBR3Jq2IcRyTCheMvxuVSjXR+KNPX8tm9oZcpyOchSEQ
         JZ0mkV6bn/oPGSv9LBt2JZ49/HpF0BEmxNqfe1V4I1gGLAIbvIWi4joKPpHi/o3ANYaB
         SH33hZvYbqy6rErwltc5GGJ2gIqVUu4mAJEIt1Zp2EvebdpNVUIwSkjvm3scvVaGPLD2
         1mGyO50V5anpAGXDEBGYZhYOVkEfUggwsDidPB5LuBH8FN7tS0b42bQx6zoZgTP0P8zf
         6m7g==
X-Gm-Message-State: ACrzQf3kGH4B7wIwgdEHQ5frB/KHngHEyrGt/krcQqLB6UU8A9mLrUc2
        qlbNRnjbh8MBU4bh7BcOB84eXirTLos=
X-Google-Smtp-Source: AMsMyM45ifYKy5JmPWcKI4czbcgW1p2WYtVxWpaEZ+w6BehY5ocXYLsyCp0e+am/azu0ehY3KKI6aA==
X-Received: by 2002:a05:6a00:148e:b0:56c:71c4:dff6 with SMTP id v14-20020a056a00148e00b0056c71c4dff6mr3063327pfu.84.1666809802584;
        Wed, 26 Oct 2022 11:43:22 -0700 (PDT)
Received: from localhost (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id p67-20020a625b46000000b0056b6c7a17c6sm3420305pfb.12.2022.10.26.11.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 11:43:22 -0700 (PDT)
Sender: Junio C Hamano <jch2355@gmail.com>
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Oct 2022, #07; Wed, 26)
X-master-at: c6de66bd952dbf9e155871be60e3eb5a0439dac9
X-next-at: 7bbb16d38b18ad93d53518b845d432a38daad2ef
Date:   Wed, 26 Oct 2022 11:43:21 -0700
Message-ID: <xmqqwn8mh1di.fsf@gitster.g>
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

The security releases are over, and we have enough accumulated fixes
on the 'master' front, I've merged a handful of them to 'maint'.  We
may or may not have a 2.38.2 release before we conclude this cycle.
We'll see what happens.

Starting from next week (week #4---see https://tinyurl.com/gitCal),
we'll try a mini "bus factor" exercise, where I will disappear from
the list for a few weeks.  Taylor agreed to volunteer as an interim
maintainer and will take over the daily integration of the project
in the meantime.  The branches at https://github.com/git/git/
repository will be updated to reflect the result of daily
integration cycles by the interim maintainer during the exercise.

Other repositories would not be (see below). Most importantly, the
kernel.org one will be likely left stale.  But the interim
maintainer may choose to publish to other repositories and announce
them on this list.  One that may be handy to have is a repository as
a replacement for https://github.com/gitster/git/ repository that
hosts "broken out" topics.

Around week #7, I'll come back and we will conclude the exercise.
Note that the interim maintainer will really make decisions on what
topics to accept and advance to 'next' and 'master' in these weeks,
and I will accept these decisions when I come back and continue from
there.

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

* ab/grep-simplify-extended-expression (2022-10-11) 1 commit
  (merged to 'next' on 2022-10-13 at 07993f09bc)
 + grep.c: remove "extended" in favor of "pattern_expression", fix segfault

 Giving "--invert-grep" and "--all-match" without "--grep" to the
 "git log" command resulted in an attempt to access grep pattern
 expression structure that has not been allocated, which has been
 corrected.
 source: <patch-v2-1.1-6ad7627706f-20221011T094715Z-avarab@gmail.com>


* ab/macos-build-fix-with-sha1dc (2022-10-19) 1 commit
  (merged to 'next' on 2022-10-19 at 408ce79f33)
 + fsmonitor OSX: compile with DC_SHA1=YesPlease

 Enable macOS build with sha1dc hash function.
 source: <patch-v2-1.4-392fabdb456-20221019T010222Z-avarab@gmail.com>


* ds/cmd-main-reorder (2022-10-08) 1 commit
  (merged to 'next' on 2022-10-14 at d7f07dbecf)
 + git.c: improve code readability in cmd_main()

 Code clean-up.
 source: <pull.1355.v3.git.git.1665246097190.gitgitgadget@gmail.com>


* gc/bare-repo-discovery (2022-10-13) 1 commit
  (merged to 'next' on 2022-10-17 at 3de2be7c14)
 + config: respect includes in protected config

 Allow configuration files in "protected" scopes to include other
 configuration files.
 source: <pull.1360.v2.git.git.1665683027912.gitgitgadget@gmail.com>


* jc/ci-osx-with-sha1dc (2022-10-20) 1 commit
  (merged to 'next' on 2022-10-21 at 2d3312dfb9)
 + ci: use DC_SHA1=YesPlease on osx-clang job for CI

 Give a bit more diversity to macOS CI by using sha1dc in one of the
 jobs (the other one tests Apple Common Crypto).
 source: <xmqq35bitooc.fsf@gitster.g>


* jc/more-sanitizer-at-ci (2022-10-20) 1 commit
  (merged to 'next' on 2022-10-21 at 91ec913532)
 + ci: add address and undefined sanitizer tasks

 Enable address and undefined sanitizer tasks at GitHub Actions CI.
 source: <xmqqpmezxl9p.fsf@gitster.g>


* jc/symbolic-ref-no-recurse (2022-10-09) 1 commit
  (merged to 'next' on 2022-10-13 at 532a3f6a5f)
 + symbolic-ref: teach "--[no-]recurse" option

 After checking out a "branch" that is a symbolic-ref that points at
 another branch, "git symbolic-ref HEAD" reports the underlying
 branch, not the symbolic-ref the user gave checkout as argument.
 The command learned the "--no-recurse" option to stop after
 dereferencing a symbolic-ref only once.
 source: <xmqqleprcn08.fsf@gitster.g>


* jk/use-o0-in-leak-sanitizer (2022-10-19) 1 commit
  (merged to 'next' on 2022-10-19 at 27c2546b98)
 + Makefile: force -O0 when compiling with SANITIZE=leak

 Avoid false-positive from LSan whose assumption may be broken with
 higher optimization levels.
 source: <Y08JZVDgJpJvrBiz@coredump.intra.peff.net>


* rj/branch-edit-description-with-nth-checkout (2022-10-10) 1 commit
  (merged to 'next' on 2022-10-14 at 90850a2211)
 + branch: support for shortcuts like @{-1}, completed

 "git branch --edit-description @{-1}" is now a way to edit branch
 description of the branch you were on before switching to the
 current branch.
 source: <fbf84e26-4306-c8df-0e2c-45dc94129e3a@gmail.com>


* rs/diff-caret-bang-with-parents (2022-10-01) 3 commits
  (merged to 'next' on 2022-10-17 at 24609eb777)
 + diff: support ^! for merges
 + revisions.txt: unspecify order of resolved parts of ^!
 + revision: use strtol_i() for exclude_parent

 "git diff rev^!" did not show combined diff to go to the rev from
 its parents.
 source: <16c49d20-cafc-4b48-3c6b-e11c74c29abb@web.de>

--------------------------------------------------
[New Topics]

* tb/shortlog-group (2022-10-24) 7 commits
  (merged to 'next' on 2022-10-25 at 0d1b797119)
 + shortlog: implement `--group=committer` in terms of `--group=<format>`
 + shortlog: implement `--group=author` in terms of `--group=<format>`
 + shortlog: extract `shortlog_finish_setup()`
 + shortlog: support arbitrary commit format `--group`s
 + shortlog: extract `--group` fragment for translation
 + shortlog: make trailer insertion a noop when appropriate
 + shortlog: accept `--date`-related options

 "git shortlog" learned to group by the "format" string.

 Will merge to 'master'.
 source: <cover.1666637725.git.me@ttaylorr.com>


* pw/config-int-parse-fixes (2022-10-22) 3 commits
 - git_parse_signed(): avoid integer overflow
 - config: require at least one digit when parsing numbers
 - git_parse_unsigned: reject negative values

 Assorted fixes of parsing end-user input as integers.

 Expecting a reroll to add test coverage.
 cf. <Y1L+Qv+cs1bjqjK9@coredump.intra.peff.net>
 source: <pull.1389.git.1666359915.gitgitgadget@gmail.com>


* sa/cat-file-mailmap (2022-10-21) 1 commit
 - doc/cat-file: allow --use-mailmap for --batch options

 Doc updates.

 Waiting for review response.
 source: <20221021103442.202759-1-siddharthasthana31@gmail.com>


* sg/stable-docdep (2022-10-21) 1 commit
  (merged to 'next' on 2022-10-25 at 83ecf487f3)
 + Documentation/build-docdep.perl: generate sorted output

 Make sure generated dependency file is stably sorted to help
 developers debugging their build issues.

 Will merge to 'master'.
 source: <20221021102950.539148-1-szeder.dev@gmail.com>


* pb/subtree-split-and-merge-after-squashing-tag-fix (2022-10-21) 9 commits
 - subtree: fix split after annotated tag was squashed merged
 - subtree: fix squash merging after annotated tag was squashed merged
 - subtree: process 'git-subtree-split' trailer in separate function
 - subtree: use named variables instead of "$@" in cmd_pull
 - subtree: define a variable before its first use in 'find_latest_squash'
 - subtree: prefix die messages with 'fatal'
 - subtree: add 'die_incompatible_opt' function to reduce duplication
 - subtree: use 'git rev-parse --verify [--quiet]' for better error messages
 - test-lib-functions: mark 'test_commit' variables as 'local'

 A bugfix to "git subtree" in its split and merge features.

 Will merge to 'next'.
 source: <pull.1390.git.1666365219.gitgitgadget@gmail.com>


* jk/repack-tempfile-cleanup (2022-10-23) 6 commits
  (merged to 'next' on 2022-10-25 at 7e2d2f45d3)
 + t7700: annotate cruft-pack failure with ok=sigpipe
 + repack: drop remove_temporary_files()
 + repack: use tempfiles for signal cleanup
 + repack: expand error message for missing pack files
 + repack: populate extension bits incrementally
 + repack: convert "names" util bitfield to array

 The way "git repack" creared temporary files when it received a
 signal was prone to deadlocking, which has been corrected.

 Will merge to 'master'.
 source: <Y1M3fVnixJHvKiSg@coredump.intra.peff.net>


* en/ort-dir-rename-and-symlink-fix (2022-10-22) 1 commit
 - merge-ort: fix bug with dir rename vs change dir to symlink

 Merging a branch with directory renames into a branch that changes
 the directory to a symlink was mishandled by the ort merge
 strategy, which has been corrected.

 Will merge to 'next'.
 source: <pull.1391.git.1666465450590.gitgitgadget@gmail.com>


* en/merge-tree-sequence (2022-10-22) 2 commits
 - merge-tree: support multiple batched merges with --stdin
 - merge-tree: update documentation for differences in -z output

 "git merge-tree --stdin" is a new way to request a series of merges
 and report the merge results.

 Will merge to 'next'?
 source: <pull.1361.git.1666488485.gitgitgadget@gmail.com>


* rs/absorb-git-dir-simplify (2022-10-23) 1 commit
  (merged to 'next' on 2022-10-25 at a5d6bc6667)
 + submodule: use strvec_pushf() for --super-prefix

 Code simplification by using strvec_pushf() instead of building an
 argument in a separate strbuf.

 Will merge to 'master'.
 source: <7a4e2fc6-3e01-5683-2be5-13b7e67c7fe5@web.de>


* jc/doc-fsck-msgids (2022-10-25) 4 commits
 - Documentation: add lint-fsck-msgids
 - fsck: document msg-id
 - fsck: remove the unused MISSING_TREE_OBJECT
 - fsck: remove the unused BAD_TAG_OBJECT

 Add documentation for message IDs in fsck error messages.

 Will merge to 'next'?
 source: <20221025224224.2352979-1-gitster@pobox.com>


* tb/repack-expire-to (2022-10-24) 4 commits
 - builtin/repack.c: implement `--expire-to` for storing pruned objects
 - builtin/repack.c: write cruft packs to arbitrary locations
 - builtin/repack.c: pass "cruft_expiration" to `write_cruft_pack`
 - builtin/repack.c: pass "out" to `prepare_pack_objects`

 "git repack" learns to send cruft objects out of the way into
 packfiles outside the repository.

 Will merge to 'next'?
 source: <cover.1666636974.git.me@ttaylorr.com>


* cc/filtered-repack (2022-10-25) 2 commits
 - repack: add --filter=<filter-spec> option
 - pack-objects: allow --filter without --stdout

 "git repack" learns to discard objects that ought to be retrievable
 again from the promissor remote.

 Needs review.
 source: <20221025122856.20204-1-christian.couder@gmail.com>


* tb/cap-patch-at-1gb (2022-10-25) 1 commit
 - apply: reject patches larger than ~1 GiB

 "git apply" limits its input to a bit less than 1 GiB.

 Will merge to 'next'.
 source: <70f5763834dff373a5573a99ec4cdfa36cadf34c.1666722251.git.me@ttaylorr.com>


* tb/midx-cleanup-fix (2022-10-25) 1 commit
 - midx.c: clear auxiliary MIDX files first

 The order in which multi-pack-index and its associated files are
 dropped has been tweaked to make it safer for concurrent users.

 Under discussion, but leaning to negative..
 cf. <143a588a-c98b-733b-2b23-34a87ca89431@github.com>
 source: <bf36093cd6d7ac83b16241b0199b3a8c904e6774.1666722316.git.me@ttaylorr.com>


* al/trace2-clearing-skip-worktree (2022-10-25) 1 commit
 - index: add trace2 region for clear skip worktree

 Add trace2 counters to the region to clear skip worktree bits in a
 sparse checkout.

 Needs review.
 source: <pull.1368.git.git.1666742722502.gitgitgadget@gmail.com>


* jt/skipping-negotiator-wo-recursion (2022-10-25) 1 commit
 - negotiator/skipping: avoid stack overflow

 Rewrite a deep recursion in the skipping negotiator to use a loop
 with on-heap prio queue to avoid stack wastage.

 Will merge to 'next'?
 source: <20221025232934.1504445-1-jonathantanmy@google.com>


* rj/branch-copy-rename-error-codepath-cleanup (2022-10-25) 1 commit
 - branch: error copying or renaming a detached HEAD

 Code simplification.

 Will merge to 'next'.
 source: <0ac8cd48-08d7-9bdd-b074-c8d5ded522f6@gmail.com>


* rj/branch-do-not-exit-with-minus-one-status (2022-10-25) 1 commit
 - branch: error code with --edit-description

 "git branch --edit-description" can exit with status -1 which is
 not a good practice; it learned to use 1 as everybody else instead.

 Will merge to 'next'.
 source: <b0f96b35-4e69-a889-bcdf-e0b40b89384f@gmail.com>

--------------------------------------------------
[Stalled]

* ag/merge-strategies-in-c (2022-08-10) 14 commits
 - sequencer: use the "octopus" strategy without forking
 - sequencer: use the "resolve" strategy without forking
 - merge: use the "octopus" strategy without forking
 - merge: use the "resolve" strategy without forking
 - merge-octopus: rewrite in C
 - merge-recursive: move better_branch_name() to merge.c
 - merge-resolve: rewrite in C
 - merge-one-file: rewrite in C
 - update-index: move add_cacheinfo() to read-cache.c
 - merge-index: add a new way to invoke `git-merge-one-file'
 - merge-index: drop the index
 - merge-index: libify merge_one_path() and merge_all()
 - t6060: add tests for removed files
 - t6060: modify multiple files to expose a possible issue with merge-index

 An attempt to rewrite remaining merge strategies from shell to C.

 Needs more work.
 At the minimum, we should lose 11/14 and possibly 08/14.
 cf. <xmqq7d36vfur.fsf@gitster.g>
 source: <20220809185429.20098-1-alban.gruin@gmail.com>


* gc/submodule-clone-update-with-branches (2022-10-20) 7 commits
 - clone, submodule update: create and check out branches
 - submodule update: refactor update targets
 - submodule: return target of submodule symref
 - t5617: drop references to remote-tracking branches
 - submodule--helper clone: create named branch
 - repo-settings: add submodule_propagate_branches
 - clone: teach --detach option

 "git clone --recurse-submodules" and "git submodule update" learns
 to honor the "propagete branches" option.
 source: <pull.1321.v2.git.git.1666297238.gitgitgadget@gmail.com>


* tb/diffstat-with-utf8-strwidth (2022-10-21) 2 commits
  (merged to 'next' on 2022-10-23 at 43a17bfeac)
 + diff: leave NEEDWORK notes in show_stats() function
 + diff.c: use utf8_strwidth() to count display width

 "git diff --stat" etc. were invented back when everything was ASCII
 and strlen() was a way to measure the display width of a string;
 adjust them to compute the display width assuming UTF-8 pathnames.

 Will merge to 'master'.
 source: <20220914151333.3309-1-tboegi@web.de>


* es/mark-gc-cruft-as-experimental (2022-08-03) 2 commits
 - config: let feature.experimental imply gc.cruftPacks=true
 - gc: add tests for --cruft and friends

 Enable gc.cruftpacks by default for those who opt into
 feature.experimental setting.

 Expecting a reroll.
 cf. <220804.86a68ke9d5.gmgdl@evledraar.gmail.com>
 cf. <6803b725-526e-a1c8-f15c-a9ed4a144d4c@github.com>
 source: <20220803205721.3686361-1-emilyshaffer@google.com>


* es/doc-creation-factor-fix (2022-07-28) 2 commits
 - range-diff: clarify --creation-factor=<factor>
 - format-patch: clarify --creation-factor=<factor>

 Expecting a reroll by somebody more familiar with the logic
 cf. <xmqqo7wfix7p.fsf@gitster.g>
 source: <7229p500-p2r4-on87-6802-8o90s36rr3s4@tzk.qr>


* cw/remote-object-info (2022-08-13) 7 commits
 . SQUASH???
 . cat-file: add remote-object-info to batch-command
 . transport: add client support for object-info
 . serve: advertise object-info feature
 . protocol-caps: initialization bug fix
 . fetch-pack: move fetch initialization
 . fetch-pack: refactor packet writing

 A client component to talk with the object-info endpoint.

 Expecting a reroll.
 Under SANITIZE=address, t1006-cat-file.sh finds a breakage.
 cf. <20220728230210.2952731-1-calvinwan@google.com>
 cf. <CAFySSZDvgwbbHCHfyuaqX3tKsr-GjJ9iihygg6rNNe46Ys7_EA@mail.gmail.com>
 source: <20220728230210.2952731-1-calvinwan@google.com>

--------------------------------------------------
[Cooking]

* po/glossary-around-traversal (2022-10-22) 3 commits
 - glossary: add reachability bitmap description
 - glossary: add "commit graph" description
 - doc: use 'object database' not ODB or abbreviation

 The glossary entries for "commit-graph file" and "reachability
 bitmap" have been added.

 Expecting a (hopefully final) reroll.
 cf. <746491f4-fb41-92fe-7360-20a845dc21fc@iee.email>
 source: <20221022222539.2333-1-philipoakley@iee.email>


* mc/credential-helper-auth-headers (2022-10-21) 6 commits
 - t5556-http-auth: add test for HTTP auth hdr logic
 - http: set specific auth scheme depending on credential
 - http: move proactive auth to first slot creation
 - http: store all request headers on active_request_slot
 - credential: add WWW-Authenticate header to cred requests
 - http: read HTTP WWW-Authenticate response headers

 Extending credential helper protocol.

 Needs review.
 source: <pull.1352.v2.git.1666372083.gitgitgadget@gmail.com>


* cw/submodule-status-in-parallel (2022-10-20) 7 commits
 . diff-lib: parallelize run_diff_files for submodules
 . diff-lib: refactor match_stat_with_submodule
 . submodule: move status parsing into function
 . submodule: strbuf variable rename
 . run-command: add hide_output to run_processes_parallel_opts
 . run-command: add pipe_output_fn to run_processes_parallel_opts
 . Merge branch 'ab/run-hook-api-cleanup' into cw/submodule-status-in-parallel
 (this branch uses ab/run-hook-api-cleanup.)

 Allow the internal "diff-files" engine to run "how has this
 submodule changed?" in parallel to speed up "git status".

 Breaks winVS test?
 cf. <https://github.com/git/git/actions/runs/3298596454/jobs/5441029092>
 source: <20221011232604.839941-1-calvinwan@google.com>


* jk/unused-anno-more (2022-10-17) 12 commits
  (merged to 'next' on 2022-10-20 at 0e52ab6cf9)
 + ll-merge: mark unused parameters in callbacks
 + diffcore-pickaxe: mark unused parameters in pickaxe functions
 + convert: mark unused parameter in null stream filter
 + apply: mark unused parameters in noop error/warning routine
 + apply: mark unused parameters in handlers
 + date: mark unused parameters in handler functions
 + string-list: mark unused callback parameters
 + object-file: mark unused parameters in hash_unknown functions
 + mark unused parameters in trivial compat functions
 + update-index: drop unused argc from do_reupdate()
 + submodule--helper: drop unused argc from module_list_compute()
 + diffstat_consume(): assert non-zero length

 More UNUSED annotation to help using -Wunused option with the
 compiler.

 Will merge to 'master'.
 source: <Y036whEorZV0rOgB@coredump.intra.peff.net>


* tb/save-keep-pack-during-geometric-repack (2022-10-17) 1 commit
  (merged to 'next' on 2022-10-20 at c88c17eb52)
 + repack: don't remove .keep packs with `--pack-kept-objects`

 When geometric repacking feature is in use together with the
 --pack-kept-objects option, we lost packs marked with .keep files.

 Will merge to 'master'.
 source: <6a012cd625c1d197ede91c85299cbfb37adf356b.1666059872.git.me@ttaylorr.com>


* mm/git-pm-try-catch-syntax-fix (2022-10-22) 2 commits
  (merged to 'next' on 2022-10-23 at 011a23710f)
 + Git.pm: trust rev-parse to find bare repositories
  (merged to 'next' on 2022-10-21 at 7896738c3b)
 + Git.pm: add semicolon after catch statement

 Fix a longstanding syntax error in Git.pm error codepath.

 Will merge to 'master'.
 source: <20221016212236.12453-1-michael@mcclimon.org>
 source: <Y1Rdtog/XQV0YLj0@coredump.intra.peff.net>


* jr/embargoed-releases-doc (2022-10-24) 1 commit
 - embargoed releases: also describe the git-security list and the process

 The role the security mailing list plays in an embargoed release
 has been documented.

 Will merge to 'next'.
 source: <pull.1345.v4.git.1666649239302.gitgitgadget@gmail.com>


* js/cmake-updates (2022-10-19) 5 commits
  (merged to 'next' on 2022-10-21 at 012ec675ba)
 + cmake: increase time-out for a long-running test
 + cmake: avoid editing t/test-lib.sh
 + add -p: avoid ambiguous signed/unsigned comparison
 + cmake: copy the merge tools for testing
 + cmake: make it easier to diagnose regressions in CTest runs

 Update to build procedure with VS using CMake/CTest.

 Will merge to 'master'.
 source: <pull.1320.v3.git.1666090745.gitgitgadget@gmail.com>


* jh/trace2-timers-and-counters (2022-10-24) 8 commits
  (merged to 'next' on 2022-10-25 at f8848f3e44)
 + trace2: add global counter mechanism
 + trace2: add stopwatch timers
 + trace2: convert ctx.thread_name from strbuf to pointer
 + trace2: improve thread-name documentation in the thread-context
 + trace2: rename the thread_name argument to trace2_thread_start
 + api-trace2.txt: elminate section describing the public trace2 API
 + tr2tls: clarify TLS terminology
 + trace2: use size_t alloc,nr_open_regions in tr2tls_thread_ctx

 Two new facilities, "timer" and "counter", are introduced to the
 trace2 API.

 Will merge to 'master'.
 source: <pull.1373.v4.git.1666618868.gitgitgadget@gmail.com>


* tb/midx-bitmap-selection-fix (2022-10-13) 4 commits
  (merged to 'next' on 2022-10-20 at b4d98bb5e4)
 + pack-bitmap-write.c: instrument number of reused bitmaps
 + midx.c: instrument MIDX and bitmap generation with trace2 regions
 + midx.c: consider annotated tags during bitmap selection
 + midx.c: fix whitespace typo

 A bugfix with tracing support in midx codepath

 Will merge to 'master'.
 source: <cover.1665612094.git.me@ttaylorr.com>


* tb/remove-unused-pack-bitmap (2022-10-17) 1 commit
  (merged to 'next' on 2022-10-21 at ebb68add44)
 + builtin/repack.c: remove redundant pack-based bitmaps

 When creating a multi-pack bitmap, remove per-pack bitmap files
 unconditionally as they will never be consulted.

 Will merge to 'master'.
 source: <1e0ef7ee7ff5feb323c77e594cd65433fb1d99f7.1666061096.git.me@ttaylorr.com>


* nw/t1002-cleanup (2022-10-14) 1 commit
  (merged to 'next' on 2022-10-20 at e6ae742fef)
 + t1002: modernize outdated conditional

 Code clean-up in test.

 Will merge to 'master'.
 source: <pull.1362.v3.git.git.1665734502591.gitgitgadget@gmail.com>


* jz/patch-id (2022-10-24) 6 commits
  (merged to 'next' on 2022-10-24 at 1ac3b46fbe)
 + builtin: patch-id: remove unused diff-tree prefix
 + builtin: patch-id: add --verbatim as a command mode
 + patch-id: fix patch-id for mode changes
 + builtin: patch-id: fix patch-id with binary diffs
 + patch-id: use stable patch-id for rebases
 + patch-id: fix stable patch id for binary / header-only

 A new "--include-whitespace" option is added to "git patch-id", and
 existing bugs in the internal patch-id logic that did not match
 what "git patch-id" produces have been corrected.

 Will merge to 'master'.
 source: <pull.1359.v5.git.1666642064.gitgitgadget@gmail.com>


* hl/archive-recursive (2022-10-19) 10 commits
 . fixup! archive: add tests for git archive --recurse-submodules
 . archive: add tests for git archive --recurse-submodules
 . archive: add --recurse-submodules to git-archive command
 . archive: remove global repository from archive_args
 . archive: pass repo objects to write_archive handlers
 . tree: add repository parameter to read_tree_fn_t
 . tree: handle submodule case for read_tree_at properly
 . tree: increase test coverage for tree.c
 . tree: update cases to use repo_ tree methods
 . tree: do not use the_repository for tree traversal methods.

 "git archive" has been taught "--recurse-submodules" option to
 create a tarball that includes contents from submodules.

 Expecting a reroll.
 Seems to break win+VS test(8).
 cf. https://github.com/git/git/actions/runs/3293333066 whose only
 difference from https://github.com/git/git/actions/runs/3293553109
 is the inclusion of this topic.
 source: <pull.1359.v3.git.git.1665973401.gitgitgadget@gmail.com>


* pw/rebase-keep-base-fixes (2022-10-17) 8 commits
 - rebase --keep-base: imply --no-fork-point
 - rebase --keep-base: imply --reapply-cherry-picks
 - rebase: factor out branch_base calculation
 - rebase: rename merge_base to branch_base
 - rebase: store orig_head as a commit
 - rebase: be stricter when reading state files containing oids
 - t3416: set $EDITOR in subshell
 - t3416: tighten two tests
 (this branch is used by pw/rebase-reflog-fixes.)

 "git rebase --keep-base" used to discard the commits that are
 already cherry-picked to the upstream, even when "keep-base" meant
 that the base, on top of which the history is being rebuilt, does
 not yet include these cherry-picked commits.  The --keep-base
 option now implies --reapply-cherry-picks and --no-fork-point
 options.

 Will merge to 'next'.
 source: <pull.1323.v4.git.1666012665.gitgitgadget@gmail.com>


* pw/rebase-reflog-fixes (2022-10-17) 9 commits
 - rebase: cleanup action handling
 - rebase --abort: improve reflog message
 - rebase --apply: make reflog messages match rebase --merge
 - rebase --apply: respect GIT_REFLOG_ACTION
 - rebase --merge: fix reflog message after skipping
 - rebase --merge: fix reflog when continuing
 - t3406: rework rebase reflog tests
 - rebase --apply: remove duplicated code
 - Merge branch 'pw/rebase-keep-base-fixes' into pw/rebase-reflog-fixes
 (this branch uses pw/rebase-keep-base-fixes.)

 Fix some bugs in the reflog messages when rebasing and changes the
 reflog messages of "rebase --apply" to match "rebase --merge" with
 the aim of making the reflog easier to parse.

 Will merge to 'next'.
 source: <pull.1150.v3.git.1665567312.gitgitgadget@gmail.com>


* sd/doc-smtp-encryption (2022-10-12) 1 commit
  (merged to 'next' on 2022-10-25 at d122052431)
 + docs: git-send-email: difference between ssl and tls smtp-encryption

 Will merge to 'master'.
 source: <20221012150619.12877-1-sndanailov@wired4ever.net>


* ed/fsmonitor-inotify (2022-10-14) 7 commits
 . fsmonitor: update doc for Linux
 . fsmonitor: test updates
 . fsmonitor: enable fsmonitor for Linux
 . fsmonitor: implement filesystem change listener for Linux
 . fsmonitor: determine if filesystem is local or remote
 . fsmonitor: prepare to share code between Mac OS and Linux
 . Merge branch 'ed/fsmonitor-on-networked-macos' into ed/fsmonitor-inotify

 Bundled fsmonitor for Linux using inotify API.

 Needs review.
 Occasional breakages of t7527.16?
 source: <pull.1352.v2.git.git.1665783944.gitgitgadget@gmail.com>


* en/sparse-checkout-design (2022-10-08) 1 commit
 - sparse-checkout.txt: new document with sparse-checkout directions

 Design doc.

 Needs review.
 source: <pull.1367.v3.git.1665269538608.gitgitgadget@gmail.com>


* od/ci-use-checkout-v3-when-applicable (2022-10-10) 2 commits
 . ci(main): linux32 uses actions/checkout@v2
 . ci(main): upgrade actions/checkout to v3

 Attempt to update GitHub CI to use actions/checkout@v3

 Expecting a reroll.
 Seems to break the CI completely.
 source: <pull.1354.git.git.1665388136.gitgitgadget@gmail.com>


* ab/run-hook-api-cleanup (2022-10-12) 15 commits
  (merged to 'next' on 2022-10-20 at 29ca8c34dc)
 + run-command.c: remove "max_processes", add "const" to signal() handler
 + run-command.c: pass "opts" further down, and use "opts->processes"
 + run-command.c: use "opts->processes", not "pp->max_processes"
 + run-command.c: don't copy "data" to "struct parallel_processes"
 + run-command.c: don't copy "ungroup" to "struct parallel_processes"
 + run-command.c: don't copy *_fn to "struct parallel_processes"
 + run-command.c: make "struct parallel_processes" const if possible
 + run-command API: move *_tr2() users to "run_processes_parallel()"
 + run-command API: have run_process_parallel() take an "opts" struct
 + run-command.c: use designated init for pp_init(), add "const"
 + run-command API: don't fall back on online_cpus()
 + run-command API: make "n" parameter a "size_t"
 + run-command tests: use "return", not "exit"
 + run-command API: have "run_processes_parallel{,_tr2}()" return void
 + run-command test helper: use "else if" pattern
 (this branch is used by cw/submodule-status-in-parallel.)

 Move a global variable added as a hack during regression fixes to
 its proper place in the API.

 Will merge to 'master'.
 source: <cover-v3-00.15-00000000000-20221012T205712Z-avarab@gmail.com>


* pw/test-todo (2022-10-06) 3 commits
 - test_todo: allow [verbose] test as the command
 - test_todo: allow [!] grep as the command
 - tests: add test_todo() to mark known breakages

 RFC for test framework improvement.

 Needs review.
 source: <pull.1374.git.1665068476.gitgitgadget@gmail.com>


* ab/doc-synopsis-and-cmd-usage (2022-10-13) 34 commits
  (merged to 'next' on 2022-10-21 at c6d632ac1a)
 + tests: assert consistent whitespace in -h output
 + tests: start asserting that *.txt SYNOPSIS matches -h output
 + doc txt & -h consistency: make "worktree" consistent
 + worktree: define subcommand -h in terms of command -h
 + reflog doc: list real subcommands up-front
 + doc txt & -h consistency: make "commit" consistent
 + doc txt & -h consistency: make "diff-tree" consistent
 + doc txt & -h consistency: use "[<label>...]" for "zero or more"
 + doc txt & -h consistency: make "annotate" consistent
 + doc txt & -h consistency: make "stash" consistent
 + doc txt & -h consistency: add missing options
 + doc txt & -h consistency: use "git foo" form, not "git-foo"
 + doc txt & -h consistency: make "bundle" consistent
 + doc txt & -h consistency: make "read-tree" consistent
 + doc txt & -h consistency: make "rerere" consistent
 + doc txt & -h consistency: add missing options and labels
 + doc txt & -h consistency: make output order consistent
 + doc txt & -h consistency: add or fix optional "--" syntax
 + doc txt & -h consistency: fix mismatching labels
 + doc SYNOPSIS & -h: use "-" to separate words in labels, not "_"
 + doc txt & -h consistency: use "<options>", not "<options>..."
 + stash doc SYNOPSIS & -h: correct padding around "[]()"
 + doc txt & -h consistency: correct padding around "[]()"
 + doc txt & -h consistency: balance unbalanced "[" and "]"
 + doc txt & -h consistency: add "-z" to cat-file "-h"
 + doc txt & -h consistency: fix incorrect alternates syntax
 + doc txt & -h consistency: word-wrap
 + built-ins: consistently add "\n" between "usage" and options
 + doc SYNOPSIS: consistently use ' for commands
 + doc SYNOPSIS: don't use ' for subcommands
 + bundle: define subcommand -h in terms of command -h
 + builtin/bundle.c: indent with tabs
 + CodingGuidelines: update and clarify command-line conventions
 + tests: assert *.txt SYNOPSIS and -h output

 The short-help text shown by "git cmd -h" and the synopsis text
 shown at the beginning of "git help cmd" have been made more
 consistent.

 Will merge to 'master'.
 source: <cover-v5-00.34-00000000000-20221013T153625Z-avarab@gmail.com>


* ab/coccicheck-incremental (2022-10-26) 12 commits
 - spatchcache: add a ccache-alike for "spatch"
 - cocci: run against a generated ALL.cocci
 - cocci rules: remove <id>'s from rules that don't need them
 - cocci: optimistically use COMPUTE_HEADER_DEPENDENCIES
 - cocci: make "coccicheck" rule incremental
 - cocci: split off "--all-includes" from SPATCH_FLAGS
 - cocci: split off include-less "tests" from SPATCH_FLAGS
 - Makefile: split off SPATCH_BATCH_SIZE comment from "cocci" heading
 - Makefile: have "coccicheck" re-run if flags change
 - Makefile: add ability to TAB-complete cocci *.patch rules
 - cocci rules: remove unused "F" metavariable from pending rule
 - Makefile + shared.mak: rename and indent $(QUIET_SPATCH_T)

 "make coccicheck" is time consuming. It has been made to run more
 incrementally.

 Will merge to 'next'?
 source: <cover-v4-00.12-00000000000-20221026T141005Z-avarab@gmail.com>


* ds/bundle-uri-3 (2022-10-12) 13 commits
 - bundle-uri: suppress stderr from remote-https
 - bundle-uri: quiet failed unbundlings
 - bundle: add flags to verify_bundle()
 - bundle-uri: fetch a list of bundles
 - bundle: properly clear all revision flags
 - bundle-uri: limit recursion depth for bundle lists
 - bundle-uri: parse bundle list in config format
 - bundle-uri: unit test "key=value" parsing
 - bundle-uri: create "key=value" line parsing
 - bundle-uri: create base key-value pair parsing
 - bundle-uri: create bundle_list struct and helpers
 - bundle-uri: use plain string in find_temp_filename()
 - Merge branch 'ds/bundle-uri-clone' into ds/bundle-uri-3

 Define the logical elements of a "bundle list", data structure to
 store them in-core, format to transfer them, and code to parse
 them.

 Will merge to 'next'?
 source: <pull.1333.v5.git.1665579160.gitgitgadget@gmail.com>


* js/bisect-in-c (2022-08-30) 17 commits
 - bisect: no longer try to clean up left-over `.git/head-name` files
 - bisect: remove Cogito-related code
 - Turn `git bisect` into a full built-in
 - bisect: move even the command-line parsing to `bisect--helper`
 - bisect--helper: make `state` optional
 - bisect--helper: calling `bisect_state()` without an argument is a bug
 - bisect: avoid double-quoting when printing the failed command
 - bisect run: fix the error message
 - bisect: verify that a bogus option won't try to start a bisection
 - bisect--helper: migrate to OPT_SUBCOMMAND()
 - bisect--helper: make the order consistently `argc, argv`
 - bisect--helper: make `terms` an explicit singleton
 - bisect--helper: simplify exit code computation
 - bisect--helper: really retire `--bisect-autostart`
 - bisect--helper: really retire --bisect-next-check
 - bisect--helper: retire the --no-log option
 - Merge branch 'sg/parse-options-subcommand' into js/bisect-in-c

 Final bits of "git bisect.sh" have been rewritten in C.

 Needs review.
 cf. <xmqqv8pr8903.fsf@gitster.g>
 source: <pull.1132.v6.git.1661885419.gitgitgadget@gmail.com>
