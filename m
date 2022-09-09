Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984EAECAAD3
	for <git@archiver.kernel.org>; Fri,  9 Sep 2022 23:06:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbiIIXGe (ORCPT <rfc822;git@archiver.kernel.org>);
        Fri, 9 Sep 2022 19:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230358AbiIIXGb (ORCPT <rfc822;git@vger.kernel.org>);
        Fri, 9 Sep 2022 19:06:31 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 920F491D36
        for <git@vger.kernel.org>; Fri,  9 Sep 2022 16:06:29 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id q3so2793601pjg.3
        for <git@vger.kernel.org>; Fri, 09 Sep 2022 16:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender:from
         :to:cc:subject:date;
        bh=hWI00rsbfzTmg8CPsx9ppRMx5UQH4XVPQSjCU7zmDWI=;
        b=Atg5T5HaopttFxl+U0QGm8XiOJcU5rPqY9nNqeUHTcffXC1+km5zE3jNk1HVldvM8F
         pJKn98w6EBXLMIc/D+x+FB3mD7jiCl2C9JmVuBxpCu6GDdLhcNTJ5PrIgGNlc6HqYtey
         HnginaeKEWWCHaov3XG5Mubb/zexKfEJWVe7vY3PEQ4d9kFv68/qwWqmgja26qm01+fz
         SO1adP+PRwWNihnX7KwCKjmICQQ2gFaEugKcyzMUmNZVV3t/jKv58bkDX5ZWdO1kXHlv
         C1HNesbh3To8N/MY/dmyXXZcsEOrH3U2UNNzUadtoMvObVOnIoIf7g59GYK7wXos7g+O
         3OIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:date:subject:to:from:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=hWI00rsbfzTmg8CPsx9ppRMx5UQH4XVPQSjCU7zmDWI=;
        b=WBFCKz1/8k9fMwFzTTceNnYpcSwmBH+NgKDAzR7bIsSZG9GZdh4FhGHlDO8FIphQqh
         OsCKc/p+zquSVuwVSyWI/jPf2BDcZBHjtdcVUfM7I8ws/16LIYMK54+dxroU3FKWoAP9
         hyIcDUYXoLNET050ZYsg6vjK4vJM2cfybQgO2jW44hEPQllWMeQgcR4OhAJ57zIcI9tn
         Yo97kQJkLRAxafUVN0HNi6v3cFvcxXNyDuysBkKNwAfHpWKJ9FuhP0W6u6SF1IA1Hr94
         EVEJSGUsw8S3OrS+BPJZssOg0FvZ0Z480lxDQqr5QpZk90M9HiI0yL4jxs5ZodcS8BRg
         SdNg==
X-Gm-Message-State: ACgBeo2/Ky1OMWXZxh9K4b65SI96tWexREq3ocpEBjccKkaLvtRP/EFE
        3qvBxpqrCiqBEOiEAhyW0vbpex9YuuY=
X-Google-Smtp-Source: AA6agR5rDXOn/nlQYdbRegiJII95qMeOJvMJBQVdiSzEYtl/qsXgplachCYYLpAhm/HpIQ94WFLkqg==
X-Received: by 2002:a17:902:f0d4:b0:176:988a:77fd with SMTP id v20-20020a170902f0d400b00176988a77fdmr15670647pla.25.1662764788225;
        Fri, 09 Sep 2022 16:06:28 -0700 (PDT)
Received: from localhost (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id u3-20020a17090341c300b00177f82f0789sm968470ple.198.2022.09.09.16.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 16:06:27 -0700 (PDT)
Sender: Junio C Hamano <jch2355@gmail.com>
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Sep 2022, #02; Fri, 9)
X-master-at: dd3f6c4cae7e3b15ce984dce8593ff7569650e24
X-next-at: 50f0e44ec40b5fab5d618dd26ebd776c47e9af13
Date:   Fri, 09 Sep 2022 16:06:27 -0700
Message-ID: <xmqq5yhwi1vw.fsf@gitster.g>
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

We are at the end of week #9 in a 12-week cycle toward Git 2.38
(tinyurl.com/gitCal).  I plan to tag -rc0 (i.e. preview) on the 15th
or so, but I expect that many folks are busy in Chicago for Git Merge
so let's not make a big fuss about it and instead treat it as just one
of the regular updates to the 'master' branch.

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

* ab/retire-ppc-sha1 (2022-08-31) 2 commits
  (merged to 'next' on 2022-09-05 at 480da6ef06)
 + Makefile: use $(OBJECTS) instead of $(C_OBJ)
 + Makefile + hash.h: remove PPC_SHA1 implementation

 Remove the assembly version of SHA-1 implementation for PPC.
 source: <cover-v3-0.2-00000000000-20220831T090744Z-avarab@gmail.com>


* cc/doc-trailer-whitespace-rules (2022-08-30) 1 commit
  (merged to 'next' on 2022-09-05 at 4c018a3ab7)
 + Documentation: clarify whitespace rules for trailers

 Doc update.
 source: <20220830105046.324041-1-christian.couder@gmail.com>


* jc/format-patch-force-in-body-from (2022-08-29) 3 commits
  (merged to 'next' on 2022-09-05 at cecaaad60e)
 + format-patch: learn format.forceInBodyFrom configuration variable
 + format-patch: allow forcing the use of in-body From: header
 + pretty: separate out the logic to decide the use of in-body from

 "git format-patch --from=<ident>" can be told to add an in-body
 "From:" line even for commits that are authored by the given
 <ident> with "--force-in-body-from"option.
 source: <20220829213837.13849-1-gitster@pobox.com>


* jk/tempfile-active-flag-cleanup (2022-08-30) 3 commits
  (merged to 'next' on 2022-09-05 at 43ed4656b3)
 + tempfile: update comment describing state transitions
 + tempfile: drop active flag
 + Merge branch 'rs/tempfile-cleanup-race-fix' into jk/tempfile-active-flag-cleanup

 Code clean-up.
 source: <Yw5nmNJSm9uzLOKL@coredump.intra.peff.net>


* js/add-p-diff-parsing-fix (2022-09-01) 3 commits
  (merged to 'next' on 2022-09-02 at 1545e0898d)
 + add -p: ignore dirty submodules
 + add -p: gracefully handle unparseable hunk headers in colored diffs
 + add -p: detect more mismatches between plain vs colored diffs

 Those who use diff-so-fancy as the diff-filter noticed a regression
 or two in the code that parses the diff output in the built-in
 version of "add -p", which has been corrected.
 source: <pull.1336.v5.git.1662046939.gitgitgadget@gmail.com>


* js/range-diff-with-pathspec (2022-08-26) 3 commits
  (merged to 'next' on 2022-09-05 at c027222552)
 + range-diff: optionally accept pathspecs
 + range-diff: consistently validate the arguments
 + range-diff: reorder argument handling

 Allow passing a pathspec to "git range-diff".
 source: <pull.1335.v2.git.1661506770.gitgitgadget@gmail.com>


* vd/sparse-reset-checkout-fixes (2022-09-02) 1 commit
  (merged to 'next' on 2022-09-05 at 8c59ace003)
 + unpack-trees: fix sparse directory recursion check

 Segfault fix-up to an earlier fix to the topic to teach "git reset"
 and "git checkout" work better in a sparse checkout.
 source: <pull.1344.git.1662066153644.gitgitgadget@gmail.com>

--------------------------------------------------
[New Topics]

* ab/doc-synopsis-and-cmd-usage (2022-09-07) 34 commits
 - tests: start asserting that *.txt SYNOPSIS matches -h output
 - doc txt & -h consistency: make "worktree" consistent
 - worktree: define subcommand -h in terms of command -h
 - reflog doc: list real subcommands up-front
 - doc txt & -h consistency: make "commit" consistent
 - doc txt & -h consistency: make "diff-tree" consistent
 - doc txt & -h consistency: use "[<label>...]" for "zero or more"
 - doc txt & -h consistency: make "annotate" consistent
 - doc txt & -h consistency: make "stash" consistent
 - doc txt & -h consistency: add missing options
 - doc txt & -h consistency: use "git foo" form, not "git-foo"
 - doc txt & -h consistency: make "bundle" consistent
 - doc txt & -h consistency: make "read-tree" consistent
 - doc txt & -h consistency: make "rerere" consistent
 - doc txt & -h consistency: add missing options and labels
 - doc txt & -h consistency: make output order consistent
 - doc txt & -h consistency: add or fix optional "--" syntax
 - doc txt & -h consistency: fix mismatching labels
 - t/helper/test-proc-receive.c: use "<options>", not "<options>..."
 - doc txt & -h consistency: use "<options>", not "<options>..."
 - stash doc SYNOPSIS & -h: correct padding around "[]()"
 - doc txt & -h consistency: correct padding around "[]()"
 - doc txt & -h consistency: add missing "]" to bugreport "-h"
 - doc txt & -h consistency: add "-z" to cat-file "-h"
 - doc txt & -h consistency: fix incorrect alternates syntax
 - doc txt & -h consistency: word-wrap
 - built-ins: consistently add "\n" between "usage" and options
 - doc SYNOPSIS & -h: fix incorrect alternates syntax
 - doc SYNOPSIS: consistently use ' for commands
 - doc SYNOPSIS: don't use ' for subcommands
 - blame: use a more detailed usage_msg_optf() error on bad -L
 - bundle: define subcommand -h in terms of command -h
 - builtin/bundle.c: use \t, not fix indentation 2-SP indentation
 - CodingGuidelines: update and clarify command-line conventions

 The short-help text shown by "git cmd -h" and the synopsis text
 shown at the beginning of "git help cmd" have been made more
 consistent.

 Needs review.
 source: <cover-00.34-00000000000-20220902T092734Z-avarab@gmail.com>


* jk/rev-list-verify-objects-fix (2022-09-07) 2 commits
  (merged to 'next' on 2022-09-07 at 5da58e2145)
 + rev-list: disable commit graph with --verify-objects
 + lookup_commit_in_graph(): use prepare_commit_graph() to check for graph

 "git rev-list --verify-objects" ought to inspect the contents of
 objects and notice corrupted ones, but it didn't when the commit
 graph is in use, which has been corrected.

 Will merge to 'master'.
 source: <Yxe0k++LA/UfFLF/@coredump.intra.peff.net>


* jk/upload-pack-skip-hash-check (2022-09-07) 4 commits
  (merged to 'next' on 2022-09-07 at f638a5a7c9)
 + t1060: check partial clone of misnamed blob
 + parse_object(): check commit-graph when skip_hash set
 + upload-pack: skip parse-object re-hashing of "want" objects
 + parse_object(): allow skipping hash check

 The server side that responds to "git fetch" and "git clone"
 request has been optimized by allowing it to send objects in its
 object store without recomputing and validating the object names.

 Will merge to 'master'.
 source: <YxfQi4qg8uJHs7Gp@coredump.intra.peff.net>
 source: <YxkAxutS+B8//0WF@coredump.intra.peff.net>


* rs/diff-no-index-cleanup (2022-09-07) 3 commits
  (merged to 'next' on 2022-09-07 at a305340e6f)
 + diff-no-index: simplify argv index calculation
 + diff-no-index: release prefixed filenames
 + diff-no-index: release strbuf on queue error
 (this branch is used by jc/diff-no-index-two-stdin.)

 "git diff --no-index A B" managed its the pathnames of its two
 input files rather haphazardly, sometimes leaking them.  The
 command line argument processing has been straightened out to clean
 it up.

 Will merge to 'master'.
 source: <xmqq8rmx1saz.fsf@gitster.g>


* sg/parse-options-subcommand (2022-09-07) 5 commits
  (merged to 'next' on 2022-09-07 at e71f9b1de6)
 + notes, remote: show unknown subcommands between `'
 + notes: simplify default operation mode arguments check
 + test-parse-options.c: fix style of comparison with zero
 + test-parse-options.c: don't use for loop initial declaration
 + t0040-parse-options: remove leftover debugging

 The codepath for the OPT_SUBCOMMAND facility has been cleaned up.

 Will merge to 'master'.
 source: <20220905185007.9042-1-szeder.dev@gmail.com>


* jk/plug-list-object-filter-leaks (2022-09-08) 5 commits
  (merged to 'next' on 2022-09-08 at a6b4b080e4)
 + prepare_repo_settings(): plug leak of config values
 + list_objects_filter_options: plug leak of filter_spec strings
 + transport: free filter options in disconnect_git()
 + transport: deep-copy object-filter struct for fetch-pack
 + list_objects_filter_copy(): deep-copy sparse_oid_name field

 The code that manages list-object-filter structure, used in partial
 clones, leaked the instances, which has been plugged.

 Will merge to 'master'.
 source: <Yxl1BNQoy6Drf0Oe@coredump.intra.peff.net>


* jk/proto-v2-ref-prefix-fix (2022-09-08) 2 commits
 - fetch: add branch.*.merge to default ref-prefix extension
 - fetch: stop checking for NULL transport->remote in do_fetch()

 "git fetch" over protocol v2 sent an incorrect ref prefix request
 to the server and made "git pull" with configured fetch refspec
 that does not cover the remote branch to merge with fail, which has
 been corrected.

 Will merge to 'next'.
 source: <YxpBMaIckimFJYEi@coredump.intra.peff.net>


* vd/doc-reviewing-guidelines (2022-09-09) 1 commit
 - Documentation: add ReviewingGuidelines

 Just like we have coding guidelines, we now have guidelines for
 reviewers.

 source: <pull.1348.git.1662747205235.gitgitgadget@gmail.com>

--------------------------------------------------
[Stalled]

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
 - SQUASH???
 - cat-file: add remote-object-info to batch-command
 - transport: add client support for object-info
 - serve: advertise object-info feature
 - protocol-caps: initialization bug fix
 - fetch-pack: move fetch initialization
 - fetch-pack: refactor packet writing

 A client component to talk with the object-info endpoint.

 Expecting a reroll.
 cf. <20220728230210.2952731-1-calvinwan@google.com>
 cf. <CAFySSZDvgwbbHCHfyuaqX3tKsr-GjJ9iihygg6rNNe46Ys7_EA@mail.gmail.com>
 source: <20220728230210.2952731-1-calvinwan@google.com>

--------------------------------------------------
[Cooking]

* ab/unused-annotation (2022-09-01) 2 commits
  (merged to 'next' on 2022-09-08 at dfc6123c6b)
 + git-compat-util.h: use "deprecated" for UNUSED variables
 + git-compat-util.h: use "UNUSED", not "UNUSED(var)"
 (this branch uses jk/unused-annotation.)

 Undoes 'jk/unused-annotation' topic and redoes it to work around
 Coccinelle rules misfiring false positives in unrelated codepaths.

 Will merge to 'master'.
 source: <cover-0.2-00000000000-20220825T170709Z-avarab@gmail.com>


* ab/coccicheck-incremental (2022-08-31) 9 commits
 - spatchcache: add a ccache-alike for "spatch"
 - cocci: optimistically use COMPUTE_HEADER_DEPENDENCIES
 - cocci: make "coccicheck" rule incremental
 - cocci: split off "--all-includes" from SPATCH_FLAGS
 - cocci: split off include-less "tests" from SPATCH_FLAGS
 - Makefile: split off SPATCH_BATCH_SIZE comment from "cocci" heading
 - Makefile: have "coccicheck" re-run if flags change
 - Makefile: add ability to TAB-complete cocci *.patch rules
 - cocci rules: remove unused "F" metavariable from pending rule

 "make coccicheck" is time consuming. It has been made to run more
 incrementally.

 Needs review.
 source: <cover-v2-0.9-00000000000-20220831T205130Z-avarab@gmail.com>


* en/remerge-diff-fixes (2022-09-02) 3 commits
 - diff: fix filtering of merge commits under --remerge-diff
 - diff: fix filtering of additional headers under --remerge-diff
 - diff: have submodule_format logic avoid additional diff headers

 Fix a few "git log --remerge-diff" bugs.

 Will probably need to rebase to make it mergeable to 'maint'.
 source: <pull.1342.v3.git.1662090810.gitgitgadget@gmail.com>


* es/chainlint (2022-09-01) 18 commits
  (merged to 'next' on 2022-09-08 at eab3357b05)
 + t: retire unused chainlint.sed
 + t/Makefile: teach `make test` and `make prove` to run chainlint.pl
 + test-lib: replace chainlint.sed with chainlint.pl
 + test-lib: retire "lint harder" optimization hack
 + t/chainlint: add more chainlint.pl self-tests
 + chainlint.pl: allow `|| echo` to signal failure upstream of a pipe
 + chainlint.pl: complain about loops lacking explicit failure handling
 + chainlint.pl: don't flag broken &&-chain if failure indicated explicitly
 + chainlint.pl: don't flag broken &&-chain if `$?` handled explicitly
 + chainlint.pl: don't require `&` background command to end with `&&`
 + t/Makefile: apply chainlint.pl to existing self-tests
 + chainlint.pl: don't require `return|exit|continue` to end with `&&`
 + chainlint.pl: validate test scripts in parallel
 + chainlint.pl: add parser to identify test definitions
 + chainlint.pl: add parser to validate tests
 + chainlint.pl: add POSIX shell parser
 + chainlint.pl: add POSIX shell lexical analyzer
 + t: add skeleton chainlint.pl

 Revamp chainlint script for our tests.

 Will merge to 'master'.
 source: <pull.1322.git.git.1661992197.gitgitgadget@gmail.com>


* vd/scalar-to-main (2022-09-02) 9 commits
 - Documentation/technical: include Scalar technical doc
 - t/perf: add 'GIT_PERF_USE_SCALAR' run option
 - t/perf: add Scalar performance tests
 - scalar-clone: add test coverage
 - scalar: add to 'git help -a' command list
 - scalar: implement the `help` subcommand
 - git help: special-case `scalar`
 - scalar: include in standard Git build & installation
 - scalar: fix command documentation section header

 Hoist the remainder of "scalar" out of contrib/ to the main part of
 the codebase.

 Needs review.
 source: <pull.1341.v2.git.1662134210.gitgitgadget@gmail.com>


* ad/t1800-cygwin (2022-09-01) 1 commit
 - t1800: correct test to handle Cygwin

 Test fix.

 Expecting a reroll.
 cf. <YxFinAJ2NeKiHaS8@danh.dev>
 source: <20220901173942.abolcr4aa5gixncm@lucy.dinwoodie.org>


* ow/rev-parse-parseopt-fix (2022-09-08) 1 commit
  (merged to 'next' on 2022-09-08 at a15efb3478)
 + rev-parse --parseopt: detect missing opt-spec

 The parser in the script interface to parse-options in "git
 rev-parse" has been updated to diagnose a bogus input correctly.

 Will merge to 'master'.
 source: <20220902175902.22346-1-oystwa@gmail.com>


* tb/diffstat-with-utf8-strwidth (2022-08-27) 1 commit
 - diff.c: use utf8_strwidth() when appropriate

 "git diff --stat" etc. were invented back when everything was ASCII
 and strlen() was a way to measure the display width of a string;
 adjust them to compute the display width assuming UTF-8 pathnames.
 source: <20220827085007.20030-1-tboegi@web.de>


* gc/submodule-clone-update-with-branches (2022-08-29) 6 commits
 - clone, submodule update: check out branches
 - submodule--helper: refactor up-to-date criterion
 - submodule: return target of submodule symref
 - t5617: drop references to remote-tracking branches
 - repo-settings: add submodule_propagate_branches
 - clone: teach --detach option

 "git clone --recurse-submodules" and "git submodule update" learns
 to honor the "propagete branches" option.

 Needs review.
 source: <pull.1321.git.git.1661806456.gitgitgadget@gmail.com>


* sy/sparse-grep (2022-09-08) 3 commits
 - builtin/grep.c: walking tree instead of expanding index with --sparse
 - builtin/grep.c: integrate with sparse index
 - builtin/grep.c: add --sparse option

 "git grep" learned to work better in a sparse checkout.

 Needs review.
 source: <20220908001854.206789-1-shaoxuan.yuan02@gmail.com>


* js/builtin-add-p-portability-fix (2022-08-30) 3 commits
  (merged to 'next' on 2022-09-08 at 8d3e72e890)
 + t6132(NO_PERL): do not run the scripted `add -p`
 + t3701: test the built-in `add -i` regardless of NO_PERL
 + add -p: avoid ambiguous signed/unsigned comparison

 More fixes to "add -p"

 Will merge to 'master'.
 source: <pull.1340.git.1661867664.gitgitgadget@gmail.com>


* ds/use-platform-regex-on-macos (2022-08-26) 1 commit
 - grep: fix multibyte regex handling under macOS

 With a bit of header twiddling, use the native regexp library on
 macOS instead of the compat/ one.

 Needs review.
 source: <20220826085815.2771102-1-dds@aueb.gr>


* ds/bundle-uri-3 (2022-09-09) 10 commits
 - bundle-uri: fetch a list of bundles
 - bundle-uri: limit recursion depth for bundle lists
 - bundle-uri: parse bundle list in config format
 - bundle-uri: unit test "key=value" parsing
 - bundle-uri: create "key=value" line parsing
 - bundle-uri: create base key-value pair parsing
 - bundle-uri: create bundle_list struct and helpers
 - bundle-uri: use plain string in find_temp_filename()
 - bundle-uri: short-circuit capability parsing
 - Merge branch 'ds/bundle-uri-clone' into ds/bundle-uri-3

 Define the logical elements of a "bundle list", data structure to
 store them in-core, format to transfer them, and code to parse
 them.

 Needs review.
 source: <pull.1333.v2.git.1662734015.gitgitgadget@gmail.com>


* js/cmake-updates (2022-08-24) 5 commits
 - cmake: increase time-out for a long-running test
 - cmake: avoid editing t/test-lib.sh
 - add -p: avoid ambiguous signed/unsigned comparison
 - cmake: copy the merge tools for testing
 - cmake: make it easier to diagnose regressions in CTest runs

 Update to build procedure with VS using CMake/CTest.

 Needs review.
 cf. <3df77ffd-85a2-3a54-9005-34a24ec6e82d@github.com>
 source: <pull.1320.v2.git.1661243463.gitgitgadget@gmail.com>


* jk/unused-annotation (2022-08-19) 11 commits
  (merged to 'next' on 2022-08-24 at 2174b8c75d)
 + is_path_owned_by_current_uid(): mark "report" parameter as unused
 + run-command: mark unused async callback parameters
 + mark unused read_tree_recursive() callback parameters
 + hashmap: mark unused callback parameters
 + config: mark unused callback parameters
 + streaming: mark unused virtual method parameters
 + transport: mark bundle transport_options as unused
 + refs: mark unused virtual method parameters
 + refs: mark unused reflog callback parameters
 + refs: mark unused each_ref_fn parameters
 + git-compat-util: add UNUSED macro
 (this branch is used by ab/unused-annotation.)

 Annotate function parameters that are not used (but cannot be
 removed for structural reasons), to prepare us to later compile
 with -Wunused warning turned on.

 Will merge to 'master' along with 'ab/unused-annotation' that undoes the whole thing.
 cf. <Ywh7ppVFk6VK1Ybs@coredump.intra.peff.net>
 cf. <xmqqy1v7r3so.fsf@gitster.g>
 source: <Yv9gxqH6nK2KYnNj@coredump.intra.peff.net>


* ed/fsmonitor-on-network-disk (2022-08-31) 5 commits
 - fsmonitor: normalize FSEvents event paths to the real path
 - fsmonitor: ensure filesystem and unix socket filesystem are compatible
 - fsmonitor: generate unique Unix socket file name in the desired location
 - fsmonitor: add two new config options, allowRemote and socketDir
  (merged to 'next' on 2022-08-14 at 637d458d9c)
 + fsmonitor: option to allow fsmonitor to run against network-mounted repos

 The built-in fsmonitor refuses to work on a network mounted
 repositories; a configuration knob for users to override this has
 been introduced.

 Needs review.
 source: <pull.1317.v3.git.1660242752495.gitgitgadget@gmail.com>
 source: <pull.1326.v4.git.1661962145.gitgitgadget@gmail.com>


* pw/rebase-keep-base-fixes (2022-09-07) 7 commits
 - rebase --keep-base: imply --no-fork-point
 - rebase --keep-base: imply --reapply-cherry-picks
 - rebase: factor out branch_base calculation
 - rebase: rename merge_base to branch_base
 - rebase: store orig_head as a commit
 - t3416: set $EDITOR in subshell
 - t3416: tighten two tests

 "git rebase --keep-base" used to discard the commits that are
 already cherry-picked to the upstream, even when "keep-base" meant
 that the base, on top of which the history is being rebuilt, does
 not yet include these cherry-picked commits.  The --keep-base
 option now implies --reapply-cherry-picks and --no-fork-point
 options.

 Overall looking good, with some iffy bits.
 cf. <xmqqzgfbuk95.fsf@gitster.g>
 source: <pull.1323.v2.git.1662561470.gitgitgadget@gmail.com>


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


* sy/mv-out-of-cone (2022-09-08) 10 commits
 - builtin/mv.c: fix possible segfault in add_slash()
  (merged to 'next' on 2022-08-17 at 2316d9ce4d)
 + mv: check overwrite for in-to-out move
 + advice.h: add advise_on_moving_dirty_path()
 + mv: cleanup empty WORKING_DIRECTORY
 + mv: from in-cone to out-of-cone
 + mv: remove BOTH from enum update_mode
 + mv: check if <destination> is a SKIP_WORKTREE_DIR
 + mv: free the with_slash in check_dir_in_index()
 + mv: rename check_dir_in_index() to empty_dir_has_sparse_contents()
 + t7002: add tests for moving from in-cone to out-of-cone

 "git mv A B" in a sparsely populated working tree can be asked to
 move a path from a directory that is "in cone" to another directory
 that is "out of cone".  Handling of such a case has been improved.

 Will merge to 'next'.
 source: <20220809120910.2021413-1-shaoxuan.yuan02@gmail.com>
 source: <20220908230223.239970-1-shaoxuan.yuan02@gmail.com>


* ab/submodule-helper-prep (2022-09-02) 33 commits
  (merged to 'next' on 2022-09-05 at b0d1b6ada7)
 + submodule--helper: fix bad config API usage
 + submodule--helper: libify even more "die" paths for module_update()
 + submodule--helper: libify more "die" paths for module_update()
 + submodule--helper: check repo{_submodule,}_init() return values
 + submodule--helper: libify "must_die_on_failure" code paths (for die)
 + submodule--helper update: don't override 'checkout' exit code
 + submodule--helper: libify "must_die_on_failure" code paths
 + submodule--helper: libify determine_submodule_update_strategy()
 + submodule--helper: don't exit() on failure, return
 + submodule--helper: use "code" in run_update_command()
 + submodule API: don't handle SM_..{UNSPECIFIED,COMMAND} in to_string()
 + submodule--helper: don't call submodule_strategy_to_string() in BUG()
 + submodule--helper: add missing braces to "else" arm
 + submodule--helper: return "ret", not "1" from update_submodule()
 + submodule--helper: rename "int res" to "int ret"
 + submodule--helper: don't redundantly check "else if (res)"
 + submodule--helper: refactor "errmsg_str" to be a "struct strbuf"
 + submodule--helper: add "const" to passed "struct update_data"
 + submodule--helper: add "const" to copy of "update_data"
 + submodule--helper: add "const" to passed "module_clone_data"
 + submodule--helper: move "sb" in clone_submodule() to its own scope
 + submodule--helper: use xstrfmt() in clone_submodule()
 + submodule--helper: replace memset() with { 0 }-initialization
 + submodule--helper style: add \n\n after variable declarations
 + submodule--helper style: don't separate declared variables with \n\n
 + submodule--helper: move "resolve-relative-url-test" to a test-tool
 + submodule--helper: move "check-name" to a test-tool
 + submodule--helper: move "is-active" to a test-tool
 + test-tool submodule-config: remove unused "--url" handling
 + submodule--helper: remove unused "list" helper
 + submodule--helper: remove unused "name" helper
 + submodule tests: test for "add <repository> <abs-path>"
 + submodule tests: test usage behavior
 (this branch is used by ab/submodule-helper-leakfix.)

 Code clean-up of "git submodule--helper".

 Will merge to 'master'.
 source: <cover-v4-00.33-00000000000-20220831T230519Z-avarab@gmail.com>


* ab/dedup-config-and-command-docs (2022-09-07) 9 commits
  (merged to 'next' on 2022-09-08 at cd5b217110)
 + docs: add CONFIGURATION sections that fuzzy map to built-ins
 + docs: add CONFIGURATION sections that map to a built-in
 + log docs: de-duplicate configuration sections
 + difftool docs: de-duplicate configuration sections
 + notes docs: de-duplicate and combine configuration sections
 + apply docs: de-duplicate configuration sections
 + send-email docs: de-duplicate configuration sections
 + grep docs: de-duplicate configuration sections
 + docs: add and use include template for config/* includes

 Share the text used to explain configuration variables used by "git
 <subcmd>" in "git help <subcmd>" with the text from "git help config".

 Will merge to 'master'.
 cf. <CAHd-oW71qvhG16YtMweA26SDCLKn+LHZe13njn18CD==9Ewbnw@mail.gmail.com>
 source: <cover-v4-0.9-00000000000-20220907T082419Z-avarab@gmail.com>


* ab/submodule-helper-leakfix (2022-09-02) 18 commits
  (merged to 'next' on 2022-09-08 at bf21cfed4b)
 + submodule--helper: fix a configure_added_submodule() leak
 + submodule--helper: free rest of "displaypath" in "struct update_data"
 + submodule--helper: free some "displaypath" in "struct update_data"
 + submodule--helper: fix a memory leak in print_status()
 + submodule--helper: fix a leak in module_add()
 + submodule--helper: fix obscure leak in module_add()
 + submodule--helper: fix "reference" leak
 + submodule--helper: fix a memory leak in get_default_remote_submodule()
 + submodule--helper: fix a leak with repo_clear()
 + submodule--helper: fix "sm_path" and other "module_cb_list" leaks
 + submodule--helper: fix "errmsg_str" memory leak
 + submodule--helper: add and use *_release() functions
 + submodule--helper: don't leak {run,capture}_command() cp.dir argument
 + submodule--helper: "struct pathspec" memory leak in module_update()
 + submodule--helper: fix most "struct pathspec" memory leaks
 + submodule--helper: fix trivial get_default_remote_submodule() leak
 + submodule--helper: fix a leak in "clone_submodule"
 + Merge branch 'ab/submodule-helper-prep' into ab/submodule-helper-leakfix
 (this branch uses ab/submodule-helper-prep.)

 Plugging leaks in submodule--helper.

 Will merge to 'master'.
 source: <cover-v7-00.17-00000000000-20220831T231003Z-avarab@gmail.com>


* po/glossary-around-traversal (2022-07-09) 3 commits
 - glossary: add reachability bitmap description
 - glossary: add commit graph description
 - glossary: add Object DataBase (ODB) abbreviation

 The glossary entries for "commit-graph file" and "reachability
 bitmap" have been added.

 Expecting a reroll.
 cf. <dfe0c1ab-33f8-f13e-71ce-1829bb0d2d7f@iee.email>
 source: <pull.1282.git.1657385781.gitgitgadget@gmail.com>


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
 source: <pull.1132.v6.git.1661885419.gitgitgadget@gmail.com>

--------------------------------------------------
[Discarded]

* jc/diff-no-index-unleak (2022-09-02) 1 commit
 . diff --no-index: unleak paths[] elements

 Plug a leak or two in "git diff --no-index".

 Superseded by the rs/diff-no-index-cleanup topic.
 source: <xmqqilm579hc.fsf@gitster.g>


* jc/diff-no-index-two-stdin (2022-09-07) 1 commit
 . diff: "--no-index - -" compares the same standard input
 (this branch uses rs/diff-no-index-cleanup.)

 "git diff --no-index - -" learned to optimize the comparison of the
 same thing obtained from the standard input.
 source: <xmqqlequsvt4.fsf_-_@gitster.g>
