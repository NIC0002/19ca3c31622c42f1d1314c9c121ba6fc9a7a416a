Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DB8ECAAD3
	for <git@archiver.kernel.org>; Fri, 16 Sep 2022 02:47:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiIPCrR (ORCPT <rfc822;git@archiver.kernel.org>);
        Thu, 15 Sep 2022 22:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiIPCrP (ORCPT <rfc822;git@vger.kernel.org>);
        Thu, 15 Sep 2022 22:47:15 -0400
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DAF2979C0
        for <git@vger.kernel.org>; Thu, 15 Sep 2022 19:47:12 -0700 (PDT)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
        by pb-smtp20.pobox.com (Postfix) with ESMTP id 951031BC0AF;
        Thu, 15 Sep 2022 22:47:12 -0400 (EDT)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to
        :subject:date:message-id:mime-version:content-type; s=sasl; bh=3
        bc3mOns198Tup51acFeOBrpJNYYTa4H7Qpbd4NQltQ=; b=H9KqMXLyWg5J6/Aew
        GleZ3v5PYSufGIiRtsE/D87auYIwm4iCU02gSuG98yfrdKuDyHuC0pSyVaY6auCU
        26pNOUx1D9Z4lb1TJ7RZzEl3s2MeZ2xLyeyl+cBOoCiN7hf4fBo1R6nidAT6KTvJ
        ZGavIi7nZ7oSEY7e+dTCT0gykA=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp20.pobox.com (Postfix) with ESMTP id 8CB8E1BC0AE;
        Thu, 15 Sep 2022 22:47:12 -0400 (EDT)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [34.83.5.33])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 2890D1BC0AD;
        Thu, 15 Sep 2022 22:47:09 -0400 (EDT)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Sep 2022, #04; Thu, 15)
X-master-at: d3fa443f97e3a8d75b51341e2d5bac380b7422df
X-next-at: 21cbab75150d71ca294e09180c59ee529ca53957
Date:   Thu, 15 Sep 2022 19:47:07 -0700
Message-ID: <xmqq7d24kpck.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID: DBAE2798-3569-11ED-A02F-C2DA088D43B2-77302942!pb-smtp20.pobox.com
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Here are the topics that have been cooking in my tree.  Commits
prefixed with '+' are in 'next' (being in 'next' is a sign that a
topic is stable enough to be used and are candidate to be in a future
release).  Commits prefixed with '-' are only in 'seen', and aren't
considered "accepted" at all.  A topic without enough support may be
discarded after a long period of no activity.

I tagged the tip of the 'master' branch as 2.38-rc0, aka "preview",
but since many folks are away attending Git Merge, expect not much
activity on the release.  The first "release candidate" that signals
the start of pre-release feature freeze is scheduled to happen mid
next week (cf. http://tinyurl.com/gitCal).

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

 Plugging leaks in submodule--helper.
 source: <cover-v7-00.17-00000000000-20220831T231003Z-avarab@gmail.com>


* ab/unused-annotation (2022-09-01) 2 commits
  (merged to 'next' on 2022-09-08 at dfc6123c6b)
 + git-compat-util.h: use "deprecated" for UNUSED variables
 + git-compat-util.h: use "UNUSED", not "UNUSED(var)"
 (this branch uses jk/unused-annotation.)

 Undoes 'jk/unused-annotation' topic and redoes it to work around
 Coccinelle rules misfiring false positives in unrelated codepaths.
 source: <cover-0.2-00000000000-20220825T170709Z-avarab@gmail.com>


* en/remerge-diff-fixes (2022-09-02) 3 commits
  (merged to 'next' on 2022-09-12 at 9879cec049)
 + diff: fix filtering of merge commits under --remerge-diff
 + diff: fix filtering of additional headers under --remerge-diff
 + diff: have submodule_format logic avoid additional diff headers

 Fix a few "git log --remerge-diff" bugs.
 source: <pull.1342.v3.git.1662090810.gitgitgadget@gmail.com>


* jk/plug-list-object-filter-leaks (2022-09-08) 5 commits
  (merged to 'next' on 2022-09-08 at a6b4b080e4)
 + prepare_repo_settings(): plug leak of config values
 + list_objects_filter_options: plug leak of filter_spec strings
 + transport: free filter options in disconnect_git()
 + transport: deep-copy object-filter struct for fetch-pack
 + list_objects_filter_copy(): deep-copy sparse_oid_name field
 (this branch is used by jk/list-objects-filter-cleanup.)

 The code that manages list-object-filter structure, used in partial
 clones, leaked the instances, which has been plugged.
 source: <Yxl1BNQoy6Drf0Oe@coredump.intra.peff.net>


* jk/proto-v2-ref-prefix-fix (2022-09-08) 2 commits
  (merged to 'next' on 2022-09-12 at 70c5528b86)
 + fetch: add branch.*.merge to default ref-prefix extension
 + fetch: stop checking for NULL transport->remote in do_fetch()

 "git fetch" over protocol v2 sent an incorrect ref prefix request
 to the server and made "git pull" with configured fetch refspec
 that does not cover the remote branch to merge with fail, which has
 been corrected.
 source: <YxpBMaIckimFJYEi@coredump.intra.peff.net>


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
 source: <Yv9gxqH6nK2KYnNj@coredump.intra.peff.net>


* js/typofix (2022-09-12) 1 commit
  (merged to 'next' on 2022-09-12 at 76d57e004b)
 + Documentation: fix various repeat word typos

 Typofix.
 source: <20220911102320.39954-2-jacob@initialcommit.io>


* rs/add-p-worktree-mode-prompt-fix (2022-09-14) 1 commit
  (merged to 'next' on 2022-09-14 at 5f29a569d4)
 + add -p: fix worktree patch mode prompts

 Fix another UI regression in the reimplemented "add -p".
 source: <2463c4b9-313b-032f-9313-d1421f71f111@web.de>

--------------------------------------------------
[New Topics]

* ed/fsmonitor-on-networked-macos (2022-09-13) 5 commits
 - fsmonitor: add documentation for allowRemote and socketDir options
 - fsmonitor: deal with synthetic firmlinks on macOS
 - fsmonitor: avoid socket location check if using hook
 - fsmonitor: relocate socket file if .git directory is remote
 - fsmonitor: refactor filesystem checks to common interface

 By default, use of fsmonitor on a repository on networked
 filesystem is disabled. Add knobs to make it workable on macOS.

 Needs review.
 source: <pull.1326.v6.git.1663100858.gitgitgadget@gmail.com>


* rj/branch-edit-description-with-nth-checkout (2022-09-12) 2 commits
 - branch: support for shortcuts like @{-1} completed
 - branch: refactor "edit_description" code path

 "git branch --edit-description @{-1}" is now a way to edit branch
 description of the branch you were on before switching to the
 current branch.

 Needs review.
 source: <7abdb5a9-5707-7897-4196-8d2892beeb81@gmail.com>


* mj/credential-helper-auth-headers (2022-09-13) 8 commits
 - http: set specific auth scheme depending on credential
 - http: move proactive auth to first slot creation
 - http: store all request headers on active_request_slot
 - credential: add WWW-Authenticate header to cred requests
 - http: read HTTP WWW-Authenticate response headers
 - osxkeychain: clarify that we ignore unknown lines
 - netrc: ignore unknown lines (do not die)
 - wincred: ignore unknown lines (do not die)

 RFC
 source: <pull.1352.git.1663097156.gitgitgadget@gmail.com>


* ec/reftable-pass-pq-entry-by-reference (2022-09-15) 1 commit
  (merged to 'next' on 2022-09-15 at 928e75c7d1)
 + reftable: use a pointer for pq_entry param

 Small code clean-up in reftable implementation.

 Will merge to 'master'.
 source: <1833f3928cb.acf3c97d869879.7909589521159235166@elijahpepe.com>


* jc/environ-docs (2022-09-15) 5 commits
 - environ: GIT_INDEX_VERSION affects not just a new repository
 - environ: simplify description of GIT_INDEX_FILE
 - environ: GIT_FLUSH should be made a usual Boolean
 - environ: explain Boolean environment variables
 - environ: document GIT_SSL_NO_VERIFY

 Documentation on various Boolean GIT_* environment variables have
 been clarified.

 Needs review.
 source: <20220915160659.126441-1-gitster@pobox.com>


* rs/diff-caret-bang-with-parents (2022-09-15) 6 commits
 - revision: add parents after child for ^!
 - revision: rename add_parents_only() to add_nth_parent()
 - revision: factor out add_parents()
 - revision: factor out add_parent()
 - revision: factor out get_commit()
 - revision: use strtol_i() for exclude_parent

 "git diff rev^!" did not show combined diff to go to the rev from
 its parents.

 Needs review.
 source: <ba6eea28-fb3a-b376-2529-351727c02f1a@web.de>

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

* jk/list-objects-filter-cleanup (2022-09-12) 5 commits
  (merged to 'next' on 2022-09-12 at 33cb79c924)
 + list-objects-filter: convert filter_spec to a strbuf
 + list-objects-filter: add and use initializers
 + list-objects-filter: handle null default filter spec
 + list-objects-filter: don't memset after releasing filter struct
 + Merge branch 'jk/plug-list-object-filter-leaks' into jk/list-objects-filter-cleanup

 A couple of bugfixes with code clean-up.

 Will merge to 'master'.
 source: <Yx1qwlpNbxGEiUgc@coredump.intra.peff.net>


* zh/ls-files-format (2022-09-12) 1 commit
  (merged to 'next' on 2022-09-12 at 91dda58387)
 + ls-files: fix black space in error message

 Typofix in the UI of a topic that has graduated to 'master'.

 Will merge to 'master'.
 source: <pull.1350.git.1662904997760.gitgitgadget@gmail.com>


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


* vd/doc-reviewing-guidelines (2022-09-09) 1 commit
 - Documentation: add ReviewingGuidelines

 Just like we have coding guidelines, we now have guidelines for
 reviewers.

 Needs review.
 source: <pull.1348.git.1662747205235.gitgitgadget@gmail.com>


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


* es/chainlint (2022-09-12) 19 commits
  (merged to 'next' on 2022-09-12 at 577e59143f)
 + chainlint: colorize problem annotations and test delimiters
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
 source: <pull.1324.git.git.1663023888412.gitgitgadget@gmail.com>


* vd/scalar-to-main (2022-09-02) 9 commits
  (merged to 'next' on 2022-09-14 at 230bf89c01)
 + Documentation/technical: include Scalar technical doc
 + t/perf: add 'GIT_PERF_USE_SCALAR' run option
 + t/perf: add Scalar performance tests
 + scalar-clone: add test coverage
 + scalar: add to 'git help -a' command list
 + scalar: implement the `help` subcommand
 + git help: special-case `scalar`
 + scalar: include in standard Git build & installation
 + scalar: fix command documentation section header

 Hoist the remainder of "scalar" out of contrib/ to the main part of
 the codebase.

 Will merge to 'master'.
 source: <pull.1341.v2.git.1662134210.gitgitgadget@gmail.com>


* ad/t1800-cygwin (2022-09-15) 1 commit
  (merged to 'next' on 2022-09-15 at 9667abb48c)
 + t1800: correct test to handle Cygwin

 Test fix.

 Will merge to 'master'.
 source: <20220915075717.425673-1-adam@dinwoodie.org>


* tb/diffstat-with-utf8-strwidth (2022-09-14) 1 commit
 - diff.c: use utf8_strwidth() to count display width

 "git diff --stat" etc. were invented back when everything was ASCII
 and strlen() was a way to measure the display width of a string;
 adjust them to compute the display width assuming UTF-8 pathnames.

 Expecting a reroll.
 source: <20220914151333.3309-1-tboegi@web.de>


* gc/submodule-clone-update-with-branches (2022-08-29) 6 commits
 - clone, submodule update: check out branches
 - submodule--helper: refactor up-to-date criterion
 - submodule: return target of submodule symref
 - t5617: drop references to remote-tracking branches
 - repo-settings: add submodule_propagate_branches
 - clone: teach --detach option

 "git clone --recurse-submodules" and "git submodule update" learns
 to honor the "propagete branches" option.

 Expecting a reroll.
 cf. <20220901200047.515294-1-jonathantanmy@google.com> and others
 source: <pull.1321.git.git.1661806456.gitgitgadget@gmail.com>


* sy/sparse-grep (2022-09-08) 3 commits
 - builtin/grep.c: walking tree instead of expanding index with --sparse
 - builtin/grep.c: integrate with sparse index
 - builtin/grep.c: add --sparse option

 "git grep" learned to work better in a sparse checkout.

 The design of "--sparse" feels iffy.
 cf. <093827ae-41ef-5f7c-7829-647536ce1305@github.com>
 cf. <CABPp-BF-z72=hY_Jf8h3g95s+wwZOsV_S=+dDNs_AVskQxoaTw@mail.gmail.com>
 source: <20220908001854.206789-1-shaoxuan.yuan02@gmail.com>


* ds/use-platform-regex-on-macos (2022-08-26) 1 commit
  (merged to 'next' on 2022-09-14 at 80905596d8)
 + grep: fix multibyte regex handling under macOS

 With a bit of header twiddling, use the native regexp library on
 macOS instead of the compat/ one.

 Will cook in 'next'.
 cf. <xmqqzgf389k9.fsf@gitster.g>
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

 Expecting a reroll.
 cf. <3df77ffd-85a2-3a54-9005-34a24ec6e82d@github.com>
 cf. <531620e1-de4c-74aa-c840-c12ce81f8740@github.com> and others
 source: <pull.1320.v2.git.1661243463.gitgitgadget@gmail.com>


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

 Expecting a reroll.
 cf. <e25127f3-6135-b716-a12f-5dbe4f40dc42@gmail.com>
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


* sy/mv-out-of-cone (2022-09-09) 10 commits
  (merged to 'next' on 2022-09-12 at 7cb7b41779)
 + builtin/mv.c: fix possible segfault in add_slash()
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

 Will merge to 'master'.
 source: <20220809120910.2021413-1-shaoxuan.yuan02@gmail.com>
 source: <20220909222736.279362-1-shaoxuan.yuan02@gmail.com>


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

 Needs review.
 cf. <xmqqv8pr8903.fsf@gitster.g>
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

 "git diff --no-index - -" learned to optimize the comparison of the
 same thing obtained from the standard input.
 source: <xmqqlequsvt4.fsf_-_@gitster.g>
