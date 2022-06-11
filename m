Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBAAC43334
	for <git@archiver.kernel.org>; Sat, 11 Jun 2022 03:39:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348963AbiFKDje (ORCPT <rfc822;git@archiver.kernel.org>);
        Fri, 10 Jun 2022 23:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242868AbiFKDjc (ORCPT <rfc822;git@vger.kernel.org>);
        Fri, 10 Jun 2022 23:39:32 -0400
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DACE73983A
        for <git@vger.kernel.org>; Fri, 10 Jun 2022 20:39:28 -0700 (PDT)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id E0E3D120D0C;
        Fri, 10 Jun 2022 23:39:25 -0400 (EDT)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to
        :subject:date:message-id:mime-version:content-type; s=sasl; bh=d
        yOgtmspycxKupLjk3MnrMZu9VCDDZ3U7pOZkqrpatI=; b=CxUT/Re0m9q8RfWlk
        CPY0SGQ0K1D10c18FSRSFSSdCRJeR3tq7z/P8V8xhDcEAYuMfoexFr+qOdl4AlJS
        gNmNjofH+ErfUyX7sfwTVcUNttskYeWvkyc6hiwvFtnPspzXRhKcsHEvnBfbMvoF
        yxcM4yKxlrF7JdmCvm2CCom8C0=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id C5EB4120D0B;
        Fri, 10 Jun 2022 23:39:25 -0400 (EDT)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [34.83.92.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 0407B120D0A;
        Fri, 10 Jun 2022 23:39:24 -0400 (EDT)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     git@vger.kernel.org
Subject: What's cooking in git.git (Jun 2022, #03; Fri, 10)
X-master-at: 5699ec1b0aec51b9e9ba5a2785f65970c5a95d84
X-next-at: 398c3b25f6b9f91c426747cd7d43f16731766a3a
Date:   Fri, 10 Jun 2022 20:39:23 -0700
Message-ID: <xmqqsfobc1hw.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID: 16B9174A-E938-11EC-9EC2-5E84C8D8090B-77302942!pb-smtp1.pobox.com
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Here are the topics that have been cooking in my tree.  Commits
prefixed with '+' are in 'next' (being in 'next' is a sign that a
topic is stable enough to be used and are candidate to be in a
future release).  Commits prefixed with '-' are only in 'seen',
and aren't considered "accepted" at all.

This cycle will complete at around the end of June
(https://tinyurl.com/gitCal); -rc0 and -rc1 are scheduled to happen
next week.

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

* ab/bug-if-bug (2022-06-02) 6 commits
  (merged to 'next' on 2022-06-03 at 25290bb7ec)
 + cache-tree.c: use bug() and BUG_if_bug()
 + receive-pack: use bug() and BUG_if_bug()
 + parse-options.c: use optbug() instead of BUG() "opts" check
 + parse-options.c: use new bug() API for optbug()
 + usage.c: add a non-fatal bug() function to go with BUG()
 + common-main.c: move non-trace2 exit() behavior out of trace2.c

 A new bug() and BUG_if_bug() API is introduced to make it easier to
 uniformly log "detect multiple bugs and abort in the end" pattern.
 source: <cover-v3-0.6-00000000000-20220602T122106Z-avarab@gmail.com>


* ab/env-array (2022-06-02) 2 commits
  (merged to 'next' on 2022-06-02 at e1e05318d3)
 + run-command API users: use "env" not "env_array" in comments & names
 + run-command API: rename "env_array" to "env"

 Rename .env_array member to .env in the child_process structure.
 source: <cover-v3-0.2-00000000000-20220602T090745Z-avarab@gmail.com>


* cb/buggy-gcc-12-workaround (2022-06-01) 1 commit
  (merged to 'next' on 2022-06-01 at 01e199fd58)
 + Revert -Wno-error=dangling-pointer

 With a more targetted workaround in http.c in another topic, we may
 be able to lift this blanket "GCC12 dangling-pointer warning is
 broken and unsalvageable" workaround.


* gc/zero-length-branch-config-fix (2022-06-01) 2 commits
  (merged to 'next' on 2022-06-02 at 438605f627)
 + remote.c: reject 0-length branch names
 + remote.c: don't BUG() on 0-length branch names

 A misconfigured 'branch..remote' led to a bug in configuration
 parsing.
 source: <pull.1273.git.git.1654038754.gitgitgadget@gmail.com>


* jh/builtin-fsmonitor-part3 (2022-05-26) 31 commits
  (merged to 'next' on 2022-06-02 at 3599e359b3)
 + t7527: improve implicit shutdown testing in fsmonitor--daemon
 + fsmonitor--daemon: allow --super-prefix argument
 + t7527: test Unicode NFC/NFD handling on MacOS
 + t/lib-unicode-nfc-nfd: helper prereqs for testing unicode nfc/nfd
 + t/helper/hexdump: add helper to print hexdump of stdin
 + fsmonitor: on macOS also emit NFC spelling for NFD pathname
 + t7527: test FSMonitor on case insensitive+preserving file system
 + fsmonitor: never set CE_FSMONITOR_VALID on submodules
 + t/perf/p7527: add perf test for builtin FSMonitor
 + t7527: FSMonitor tests for directory moves
 + fsmonitor: optimize processing of directory events
 + fsm-listen-darwin: shutdown daemon if worktree root is moved/renamed
 + fsm-health-win32: force shutdown daemon if worktree root moves
 + fsm-health-win32: add polling framework to monitor daemon health
 + fsmonitor--daemon: stub in health thread
 + fsmonitor--daemon: rename listener thread related variables
 + fsmonitor--daemon: prepare for adding health thread
 + fsmonitor--daemon: cd out of worktree root
 + fsm-listen-darwin: ignore FSEvents caused by xattr changes on macOS
 + unpack-trees: initialize fsmonitor_has_run_once in o->result
 + fsmonitor-settings: NTFS and FAT32 on MacOS are incompatible
 + fsmonitor-settings: remote repos on Windows are incompatible
 + fsmonitor-settings: remote repos on macOS are incompatible
 + fsmonitor-settings: stub in macOS-specific incompatibility checking
 + fsmonitor-settings: VFS for Git virtual repos are incompatible
 + fsmonitor-settings: stub in Win32-specific incompatibility checking
 + fsmonitor-settings: bare repos are incompatible with FSMonitor
 + t/helper/fsmonitor-client: create stress test
 + t7527: test FSMonitor on repos with Unicode root paths
 + fsm-listen-win32: handle shortnames
 + Merge branch 'jh/builtin-fsmonitor-part2' into jh/builtin-fsmonitor-part3

 More fsmonitor--daemon.
 source: <pull.1143.v9.git.1653601644.gitgitgadget@gmail.com>


* jy/gitweb-xhtml5 (2022-06-02) 1 commit
  (merged to 'next' on 2022-06-02 at cc6a77b48b)
 + gitweb: switch to an XHTML5 DOCTYPE

 Update the doctype written in gitweb output to xhtml5.
 source: <20220602114305.5915-1-jason@jasonyundt.email>

--------------------------------------------------
[New Topics]

* gc/document-config-worktree-scope (2022-06-07) 1 commit
  (merged to 'next' on 2022-06-08 at 85f62a864a)
 + config: document and test the 'worktree' scope

 Doc update.

 Will merge to 'master'.
 source: <pull.1274.git.git.1654637044966.gitgitgadget@gmail.com>


* ds/branch-checked-out (2022-06-08) 4 commits
 - branch: use branch_checked_out() when deleting refs
 - fetch: use new branch_checked_out() and add tests
 - branch: check for bisects and rebases
 - branch: add branch_checked_out() helper

 Introduce a helper to see if a branch is already being worked on
 (hence should not be newly checked out in a working tree), which
 performs much better than the existing find_shared_symref() to
 replace many uses of the latter.

 Will merge to 'next'?
 source: <pull.1254.git.1654718942.gitgitgadget@gmail.com>


* fs/ssh-default-key-command-doc (2022-06-08) 1 commit
  (merged to 'next' on 2022-06-10 at b5cc5b6619)
 + gpg docs: explain better use of ssh.defaultKeyCommand

 Doc update.

 Will merge to 'master'.
 source: <20220608152437.126276-1-fs@gigacodes.de>


* js/ci-github-workflow-markup (2022-06-10) 3 commits
 - ci(github): also mark up compile errors
 - ci(github): use grouping also in the `win-build` job
 - ci(github): bring back the 'print test failures' step

 Recent CI update hides certain failures in test jobs, which has
 been corrected.

 Will merge to 'next'?
 source: <pull.1253.git.1654774347.gitgitgadget@gmail.com>


* jt/connected-show-missing-from-which-side (2022-06-10) 1 commit
 - fetch,fetch-pack: clarify connectivity check error

 We may find an object missing after a "git fetch" stores the
 objects it obtained from the other side, but it is not necessarily
 because the remote failed to send necessary objects.  Reword the
 messages in an attempt to help users explore other possibilities
 when they hit this error.

 Expecting a reroll.
 source: <20220610195247.1177549-1-jonathantanmy@google.com>


* gc/submodule-update (2022-06-10) 8 commits
 - submodule update: remove never-used expansion
 - submodule update: stop parsing options in .sh
 - submodule update: remove -v, pass --quiet
 - submodule--helper update: use one param per type
 - submodule update: pass --require-init and --init
 - submodule update: pass options with stuck forms
 - submodule update: pass options containing "[no-]"
 - submodule update: remove intermediate parsing

 More work on "git submodule update".

 Needs review.
 source: <pull.1275.git.git.1654820781.gitgitgadget@gmail.com>


* jc/resolve-undo (2022-06-09) 1 commit
 - revision: mark blobs needed for resolve-undo as reachable

 The resolve-undo information in the index was not protected against
 GC, which has been corrected.

 Will merge to 'next'?
 source: <xmqqfskdieqz.fsf@gitster.g>

--------------------------------------------------
[Stalled]

* en/merge-tree (2022-02-23) 13 commits
 - git-merge-tree.txt: add a section on potentional usage mistakes
 - merge-tree: add a --allow-unrelated-histories flag
 - merge-tree: allow `ls-files -u` style info to be NUL terminated
 - merge-tree: provide easy access to `ls-files -u` style info
 - merge-tree: provide a list of which files have conflicts
 - merge-ort: provide a merge_get_conflicted_files() helper function
 - merge-tree: support including merge messages in output
 - merge-ort: split out a separate display_update_messages() function
 - merge-tree: implement real merges
 - merge-tree: add option parsing and initial shell for real merge function
 - merge-tree: move logic for existing merge into new function
 - merge-tree: rename merge_trees() to trivial_merge_trees()
 - Merge branch 'en/remerge-diff' into en/merge-trees

 A new command is introduced that takes two commits and computes a
 tree that would be contained in the resulting merge commit, if the
 histories leading to these two commits were to be merged, and is
 added as a new mode of "git merge-tree" subcommand.

 On hold.
 cf. <CABPp-BGZ7OAYRR5YKRsxJSo-C=ho+qcNAkqwkim8CkhCfCeHsA@mail.gmail.com>
 source: <pull.1122.v6.git.1645602413.gitgitgadget@gmail.com>


* bc/stash-export (2022-04-08) 4 commits
 - builtin/stash: provide a way to import stashes from a ref
 - builtin/stash: provide a way to export stashes to a ref
 - builtin/stash: factor out revision parsing into a function
 - object-name: make get_oid quietly return an error

 A mechanism to export and import stash entries to and from a normal
 commit to transfer it across repositories has been introduced.

 Expecting a reroll.
 cf. <YnL2d4Vr9Vr7W4Hj@camp.crustytoothpaste.net>
 source: <20220407215352.3491567-1-sandals@crustytoothpaste.net>


* cw/remote-object-info (2022-05-06) 11 commits
 - SQUASH??? coccicheck
 - SQUASH??? ensure that coccicheck is happy
 - SQUASH??? compilation fix
 - cat-file: add --batch-command remote-object-info command
 - cat-file: move parse_cmd and DEFAULT_FORMAT up
 - transport: add object-info fallback to fetch
 - transport: add client side capability to request object-info
 - object-info: send attribute packet regardless of object ids
 - object-store: add function to free object_info contents
 - fetch-pack: move fetch default settings
 - fetch-pack: refactor packet writing

 A client component to talk with the object-info endpoint.

 Expecting a reroll.
 source: <20220502170904.2770649-1-calvinwan@google.com>

--------------------------------------------------
[Cooking]

* pb/range-diff-with-submodule (2022-06-06) 1 commit
  (merged to 'next' on 2022-06-07 at e5e31590c4)
 + range-diff: show submodule changes irrespective of diff.submodule

 "git range-diff" did not show anything for submodules that changed
 in the ranges being compared.  Change the behaviour to include the
 "--submodule=short" output unconditionally to be compared.

 Will merge to 'master'.
 source: <pull.1244.v2.git.1654549153769.gitgitgadget@gmail.com>


* jp/prompt-clear-before-upstream-mark (2022-06-10) 2 commits
 - git-prompt: fix expansion of branch colour codes
  (merged to 'next' on 2022-06-08 at 201a84ad63)
 + git-prompt: make colourization consistent

 Bash command line prompt (in contrib/) update.

 Will merge to 'next'.
 source: <20220609204447.32841-1-joak-pet@online.no>
 source: <20220606175022.8410-1-joak-pet@online.no>


* jt/unparse-commit-upon-graft-change (2022-06-06) 1 commit
  (merged to 'next' on 2022-06-08 at 3d8de84325)
 + commit,shallow: unparse commits if grafts changed

 Updating the graft information invalidates the list of parents of
 in-core commit objects that used to be in the graft file.

 Will merge to 'master'.
 source: <20220606175437.1740447-1-jonathantanmy@google.com>


* ab/build-gitweb (2022-06-02) 7 commits
 - Makefile: build 'gitweb' in the default target
 - gitweb/Makefile: include in top-level Makefile
 - gitweb: remove "test" and "test-installed" targets
 - gitweb/Makefile: prepare to merge into top-level Makefile
 - gitweb/Makefile: clear up and de-duplicate the gitweb.{css,js} vars
 - gitweb/Makefile: add a $(GITWEB_ALL) variable
 - gitweb/Makefile: define all .PHONY prerequisites inline

 Teach "make all" to build gitweb as well.

 Needs review.
 source: <cover-v2-0.7-00000000000-20220531T173805Z-avarab@gmail.com>


* ab/test-without-templates (2022-06-06) 7 commits
 - tests: don't assume a .git/info for .git/info/sparse-checkout
 - tests: don't assume a .git/info for .git/info/exclude
 - tests: don't assume a .git/info for .git/info/refs
 - tests: don't assume a .git/info for .git/info/attributes
 - tests: don't assume a .git/info for .git/info/grafts
 - tests: don't depend on template-created .git/branches
 - t0008: don't rely on default ".git/info/exclude"

 Tweak tests so that they still work when the "git init" template
 did not create .git/info directory.

 Will merge to 'next'?
 source: <cover-v2-0.7-00000000000-20220603T110506Z-avarab@gmail.com>


* ac/bitmap-format-doc (2022-06-10) 3 commits
 - bitmap-format.txt: add information for trailing checksum
 - bitmap-format.txt: fix some formatting issues
 - bitmap-format.txt: feed the file to asciidoc to generate html

 Adjust technical/bitmap-format to be formatted by AsciiDoc, and
 add some missing information to the documentation.

 Will merge to 'next'?
 source: <pull.1246.v3.git.1654858481.gitgitgadget@gmail.com>


* hx/unpack-streaming (2022-06-10) 7 commits
 - unpack-objects: use stream_loose_object() to unpack large objects
 - core doc: modernize core.bigFileThreshold documentation
 - object-file.c: add "stream_loose_object()" to handle large object
 - object-file.c: factor out deflate part of write_loose_object()
 - object-file.c: refactor write_loose_object() to several steps
 - object-file.c: do fsync() and close() before post-write die()
 - unpack-objects: low memory footprint for get_data() in dry_run mode

 Allow large objects read from a packstream to be streamed into a
 loose object file straight, without having to keep it in-core as a
 whole.

 Will merge to 'next'?
 source: <cover.1654871915.git.chiyutianyi@gmail.com>


* po/rebase-preserve-merges (2022-06-06) 4 commits
  (merged to 'next' on 2022-06-10 at 471f67aebc)
 + rebase: translate a die(preserve-merges) message
 + rebase: note `preserve` merges may be a pull config option
 + rebase: help users when dying with `preserve-merges`
 + rebase.c: state preserve-merges has been removed

 Various error messages that talk about the removal of
 "--preserve-merges" in "rebase" have been strengthened, and "rebase
 --abort" learned to get out of a state that was left by an earlier
 use of the option.

 Will merge to 'master'.
 source: <pull.1242.v2.git.1654341469.gitgitgadget@gmail.com>


* tb/show-ref-optim (2022-06-06) 1 commit
  (merged to 'next' on 2022-06-08 at 683a3cc261)
 + builtin/show-ref.c: avoid over-iterating with --heads, --tags

 "git show-ref --heads" (and "--tags") still iterated over all the
 refs, which has been corrected.

 Will merge to 'master'.
 source: <3fa6932641f18d78156bbf60b1571383f2cb5046.1654293264.git.me@ttaylorr.com>


* zh/read-cache-copy-name-entry-fix (2022-06-06) 1 commit
  (merged to 'next' on 2022-06-08 at 760f43dd19)
 + read-cache.c: reduce unnecessary cache entry name copying

 Remove redundant copying (with index v3 and older) or possible
 over-reading beyond end of mmapped memory (with index v4) has been
 corrected.

 Will merge to 'master'.
 source: <pull.1249.git.1654436248249.gitgitgadget@gmail.com>


* ab/remote-free-fix (2022-06-07) 2 commits
  (merged to 'next' on 2022-06-08 at 03c3aeaeee)
 + remote.c: don't dereference NULL in freeing loop
 + remote.c: remove braces from one-statement "for"-loops

 Use-after-free (with another forget-to-free) fix.

 Will merge to 'master'.
 source: <cover-0.3-00000000000-20220607T154520Z-avarab@gmail.com>


* sn/fsmonitor-missing-clock (2022-06-07) 1 commit
  (merged to 'next' on 2022-06-08 at 812b99338c)
 + fsmonitor: query watchman with right valid json

 Sample watchman interface hook sometimes failed to produce
 correctly formatted JSON message, which has been corrected.

 Will merge to 'master'.
 source: <20220607111419.15753-1-sluongng@gmail.com>


* tb/show-ref-count (2022-06-06) 2 commits
 - builtin/show-ref.c: limit output with `--count`
 - builtin/show-ref.c: rename `found_match` to `matches_nr`

 "git show-ref" learned to stop after emitting N refs with the new
 "--count=N" option.

 Expecting a reroll.
 cf. <xmqqczfl4ce1.fsf@gitster.g>
 source: <cover.1654552560.git.me@ttaylorr.com>


* jc/cocci-cleanup (2022-06-07) 1 commit
 - cocci: retire is_null_sha1() rule

 Remove a coccinelle rule that is no longer relevant.

 Will merge to 'next'.
 source: <xmqq7d5suoqt.fsf@gitster.g>


* js/wait-or-whine-can-fail (2022-06-07) 1 commit
  (merged to 'next' on 2022-06-08 at 54fe70c95d)
 + run-command: don't spam trace2_child_exit()

 We used to log an error return from wait_or_whine() as process
 termination of the waited child, which was incorrect.

 Will merge to 'master'.
 source: <50d872a057a558fa5519856b95abd048ddb514dc.1654625626.git.steadmon@google.com>


* ds/credentials-in-url (2022-06-06) 1 commit
  (merged to 'next' on 2022-06-08 at 3db83a2012)
 + remote: create fetch.credentialsInUrl config

 The "fetch.credentialsInUrl" configuration variable controls what
 happens when a URL with embedded login credential is used.

 Will merge to 'master'.
 source: <pull.1237.v5.git.1654526176695.gitgitgadget@gmail.com>


* tl/ls-tree-oid-only (2022-06-03) 1 commit
  (merged to 'next' on 2022-06-07 at e1c1e0b25a)
 + ls-tree: test for the regression in 9c4d58ff2c3

 Add tests for a regression fixed earlier.

 Will merge to 'master'.
 source: <patch-v2-1.1-f2beb02dd29-20220603T102148Z-avarab@gmail.com>


* ds/bundle-uri-more (2022-06-06) 6 commits
 - fetch: add 'refs/bundle/' to log.excludeDecoration
 - bundle-uri: add support for http(s):// and file://
 - fetch: add --bundle-uri option
 - bundle-uri: create basic file-copy logic
 - remote-curl: add 'get' capability
 - docs: document bundle URI standard

 The "bundle URI" topic.

 Needs review.
 source: <pull.1248.git.1654545325.gitgitgadget@gmail.com>


* jc/revert-show-parent-info (2022-05-31) 2 commits
  (merged to 'next' on 2022-06-07 at e405211ff4)
 + revert: --reference should apply only to 'revert', not 'cherry-pick'
  (merged to 'next' on 2022-05-30 at b5da52dc14)
 + revert: optionally refer to commit in the "reference" format

 "git revert" learns "--reference" option to use more human-readable
 reference to the commit it reverts in the message template it
 prepares for the user.

 Will merge to 'master'.
 source: <xmqq8rqn7buk.fsf_-_@gitster.g>


* js/bisect-in-c (2022-05-21) 15 commits
 - bisect: no longer try to clean up left-over `.git/head-name` files
 - bisect: remove Cogito-related code
 - Turn `git bisect` into a full built-in
 - bisect: teach the `bisect--helper` command to show the correct usage strings
 - bisect: move even the command-line parsing to `bisect--helper`
 - bisect--helper: return only correct exit codes in `cmd_*()`
 - bisect--helper: move the `BISECT_STATE` case to the end
 - bisect--helper: make `--bisect-state` optional
 - bisect--helper: align the sub-command order with git-bisect.sh
 - bisect--helper: using `--bisect-state` without an argument is a bug
 - bisect--helper: really retire `--bisect-autostart`
 - bisect--helper: really retire --bisect-next-check
 - bisect--helper: retire the --no-log option
 - bisect: avoid double-quoting when printing the failed command
 - bisect run: fix the error message

 Final bits of "git bisect.sh" have been rewritten in C.

 The command line parsing is reported to be still broken.
 cf. <220521.86zgjazuy4.gmgdl@evledraar.gmail.com>
 source: <pull.1132.v3.git.1653144546.gitgitgadget@gmail.com>


* cb/path-owner-check-with-sudo-plus (2022-05-12) 1 commit
 - git-compat-util: allow root to access both SUDO_UID and root owned

 "sudo git foo" used to consider a repository owned by the original
 user a safe one to access; it now also considers a repository owned
 by root a safe one, too (after all, if an attacker can craft a
 malicious repository owned by root, the box is 0wned already).

 Will merge to 'next'?
 cf. <20220519152344.ktrifm3pc42bjruh@Carlos-MacBook-Pro-2.local>
 source: <20220513010020.55361-5-carenas@gmail.com>


* ab/hooks-regression-fix (2022-06-07) 2 commits
  (merged to 'next' on 2022-06-08 at c1109feb67)
 + hook API: fix v2.36.0 regression: hooks should be connected to a TTY
 + run-command: add an "ungroup" option to run_process_parallel()

 In Git 2.36 we revamped the way how hooks are invoked.  One change
 that is end-user visible is that the output of a hook is no longer
 directly connected to the standard output of "git" that spawns the
 hook, which was noticed post release.  This is getting corrected.

 Will merge to 'master'.
 source: <cover-v6-0.2-00000000000-20220606T170356Z-avarab@gmail.com>


* gc/bare-repo-discovery (2022-06-07) 5 commits
 - setup.c: create `discovery.bare`
 - safe.directory: use git_protected_config()
 - config: read protected config with `git_protected_config()`
 - Documentation: define protected configuration
 - Documentation/git-config.txt: add SCOPES section

 Introduce a discovery.barerepository configuration variable that
 allows users to forbid discovery of bare repositories.

 Expecting a reroll.
 source: <29053d029f8ec61095a2ad557be38b1d485a158f.1654635432.git.gitgitgadget@gmail.com>


* gg/worktree-from-the-above (2022-05-20) 3 commits
 - dir: minor refactoring / clean-up
 - dir: cache git_dir's realpath
 - dir: traverse into repository

 With a non-bare repository, with core.worktree pointing at a
 directory that has the repository as its subdirectory, regressed in
 Git 2.27 days.

 Needs review.
 source: <20220520192840.8942-1-ggossdev@gmail.com>


* ar/send-email-confirm-by-default (2022-04-22) 1 commit
 - send-email: always confirm by default

 "git send-email" is changed so that by default it asks for
 confirmation before sending each message out.

 Will discard.

 I wanted to like this, and had it in the version of Git I use
 myself for daily work, but the prompting turned out to be somewhat
 distracting.

 Thoughts?
 source: <20220422083629.1404989-1-hi@alyssa.is>

--------------------------------------------------
[Discarded]

* ds/rebase-update-refs (2022-06-07) 7 commits
 . rebase: add rebase.updateRefs config option
 . sequencer: implement 'update-refs' command
 . rebase: add --update-refs option
 . sequencer: add update-refs command
 . sequencer: define array with enum values
 . branch: add branch_checked_out() helper
 . log-tree: create for_each_decoration()

 "git rebase" learns "--update-refs" to update the refs that point
 at commits being rewritten so that they point at the corresponding
 commits in the rewritten history.

 Retracted for possible future redesign.
 cf. <pull.1254.git.1654718942.gitgitgadget@gmail.com>
 source: <pull.1247.v2.git.1654634569.gitgitgadget@gmail.com>


* ab/ci-github-workflow-markup (2022-05-26) 14 commits
 . CI: make the --github-workflow-markup "github" output the default
 . CI: make --github-workflow-markup ci-config, off by default
 . ci: call `finalize_test_case_output` a little later
 . ci(github): mention where the full logs can be found
 . ci(github): avoid printing test case preamble twice
 . ci(github): skip "skip" tests in --github-workflow-markup
 . ci(github): skip the logs of the successful test cases
 . ci: make it easier to find failed tests' logs in the GitHub workflow
 . ci: optionally mark up output in the GitHub workflow
 . test(junit): avoid line feeds in XML attributes
 . tests: refactor --write-junit-xml code
 . CI: stop setting FAILED_TEST_ARTIFACTS N times
 . CI: don't include "test-results/" in ci/print-test-failures.sh output
 . CI: don't "cd" in ci/print-test-failures.sh
 (this branch uses ab/ci-setup-simplify.)

 Discarded to stop "competing" with js/ci-github-workflow-markup.


* ab/ci-setup-simplify (2022-05-26) 29 commits
 . CI: make it easy to use ci/*.sh outside of CI
 . CI: don't use "set -x" in "ci/lib.sh" output
 . CI: set PYTHON_PATH setting for osx-{clang,gcc} into "$jobname" case
 . CI: set SANITIZE=leak in MAKEFLAGS directly
 . CI: set CC in MAKEFLAGS directly, don't add it to the environment
 . CI: add more variables to MAKEFLAGS, except under vs-build
 . CI: narrow down variable definitions in --build and --test
 . CI: only invoke ci/lib.sh as "steps" in main.yml
 . CI: pre-select test slice in Windows & VS tests
 . ci/run-test-slice.sh: replace shelling out with "echo"
 . CI: move "env" definitions into ci/lib.sh
 . CI: combine ci/install{,-docker}-dependencies.sh
 . CI: split up and reduce "ci/test-documentation.sh"
 . CI: invoke "make artifacts-tar" directly in windows-build
 . CI: check ignored unignored build artifacts in "win[+VS] build" too
 . CI: make ci/{lib,install-dependencies}.sh POSIX-compatible
 . CI: remove "run-build-and-tests.sh", run "make [test]" directly
 . CI: export variables via a wrapper
 . CI: consistently use "export" in ci/lib.sh
 . CI: move p4 and git-lfs variables to ci/install-dependencies.sh
 . CI: have "static-analysis" run "check-builtins", not "documentation"
 . CI: have "static-analysis" run a "make ci-static-analysis" target
 . CI: don't have "git grep" invoke a pager in tree content check
 . CI/lib.sh: stop adding leading whitespace to $MAKEFLAGS
 . CI: remove unused Azure ci/* code
 . CI: remove dead "tree skipping" code
 . CI: remove more dead Travis CI support
 . CI: make "$jobname" explicit, remove fallback
 . CI: run "set -ex" early in ci/lib.sh
 (this branch is used by ab/ci-github-workflow-markup.)

 Discarded to stop "conflicing" with js/ci-github-workflow-markup;
 good bits from the series may want to be resurrected and rebuilt on
 top of the other topics.
