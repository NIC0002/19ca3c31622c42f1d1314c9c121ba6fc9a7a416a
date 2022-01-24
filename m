Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC97C433F5
	for <git@archiver.kernel.org>; Mon, 24 Jan 2022 19:01:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344362AbiAXTBh (ORCPT <rfc822;git@archiver.kernel.org>);
        Mon, 24 Jan 2022 14:01:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344728AbiAXS7A (ORCPT <rfc822;git@vger.kernel.org>);
        Mon, 24 Jan 2022 13:59:00 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61FCDC06124E
        for <git@vger.kernel.org>; Mon, 24 Jan 2022 10:56:18 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id r65so550233wma.0
        for <git@vger.kernel.org>; Mon, 24 Jan 2022 10:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:date:subject:fcc:content-transfer-encoding
         :mime-version:to:cc;
        bh=RU6DQxFtT8zQTzM0eb0z0Gc2Pnj94UIPWTjuZrH1SO0=;
        b=AWT9nsjm8D6zZl/hKi/XfbDAojXDHUN9RZ3Z0C20eDqaFTwAwlPk1No8Mp0pSyqNh0
         lZ5qIOAYS9LFCTMg2rX7qUUdWOlphtmgLU1awKxyAzR6dPOOsjNfBM0rtLGrn6KaqzCC
         mA6uKUr+5pgZJLGvuoRYyiwKupLLxS0Qx9e9sC+QnYyqqPJkLG1bbzv4OhTz32ZMS/hW
         YqCT+2jrvdoTQ9Cx1fSHVZqpkhF3uhcNw/XR7P8/mgm37ZXqcbT+lqg8v33rPi72aUJA
         qxs53rToL6Axqy6t4UMplDvNdSilDxMtLyR63Ed8UaygzuFchzL1bIoQ9Ch4za7ShyNw
         tp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:date:subject:fcc
         :content-transfer-encoding:mime-version:to:cc;
        bh=RU6DQxFtT8zQTzM0eb0z0Gc2Pnj94UIPWTjuZrH1SO0=;
        b=yeiW5wp573XjlZuxjOvAEJ1j36S2/drAuqjT6rRf58c7NoutFCW4w6QyRVYzXquIUB
         maoWRmPzBpsKnNV0H2QqarE7puAi11cns6XkP4D1MgApeBbmagS+qy+bDf03N3epK8mf
         TQBVcVwkNVnZPUBOTSJClCOHOziYwWK+NXd5mV7rk+WXpgqF3/sUHfhF6TSS69rsdj6/
         vVCw6yfu+vZ7FxZIFoqc4Wis2Q4s2tESokH8K3i2ThuR4TMGL23a3ShmVKRMRADXavNf
         mAxJsF3CqPa5kjBORaRk31yUsC/DF/t/T5/Qz8Stz3aBVy6Unzuy66hH7hXipmDt7i2O
         DgdA==
X-Gm-Message-State: AOAM532KYxxZXzGFsr3TfReURPlDrpLV6x6vzyqsimDqGVWTKOHI2kUA
        FVTDnQaDkieAzT9Y76U5gSgHLeO2z3Y=
X-Google-Smtp-Source: ABdhPJwwnv1hjdunf5KR/CiY+mTrvOJB84ienrYQDEF9szrfbDHqDQ9Qz0DccRvy0EhKVOPR2rB4OA==
X-Received: by 2002:a05:600c:220f:: with SMTP id z15mr2941789wml.145.1643050576601;
        Mon, 24 Jan 2022 10:56:16 -0800 (PST)
Received: from [127.0.0.1] ([13.74.141.28])
        by smtp.gmail.com with ESMTPSA id i3sm14587491wru.33.2022.01.24.10.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 10:56:15 -0800 (PST)
Message-Id: <pull.1117.git.1643050574.gitgitgadget@gmail.com>
From:   "Johannes Schindelin via GitGitGadget" <gitgitgadget@gmail.com>
Date:   Mon, 24 Jan 2022 18:56:05 +0000
Subject: [PATCH 0/9] ci: make Git's GitHub workflow output much more helpful
Fcc:    Sent
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
To:     git@vger.kernel.org
Cc:     Johannes Schindelin <johannes.schindelin@gmx.de>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org


Background
==========

Recent patches intended to help readers figure out CI failures much quicker
than before. Unfortunately, they haven't been entirely positive for me. For
example, they broke the branch protections in Microsoft's fork of Git, where
we require Pull Requests to pass a certain set of Checks (which are
identified by their names) and therefore caused follow-up work.

Using CI and in general making it easier for new contributors is an area I'm
passionate about, and one I'd like to see improved.


The current situation
=====================

Let me walk you through the current experience when a PR build fails: I get
a notification mail that only says that a certain job failed. There's no
indication of which test failed (or was it the build?). I can click on a
link at it takes me to the workflow run. Once there, all it says is "Process
completed with exit code 1", or even "code 2". Sure, I can click on one of
the failed jobs. It even expands the failed step's log (collapsing the other
steps). And what do I see there?

Let's look at an example of a failed linux-clang (ubuntu-latest) job
[https://github.com/git-for-windows/git/runs/4822802185?check_suite_focus=true]:

[...]
Test Summary Report
-------------------
t1092-sparse-checkout-compatibility.sh           (Wstat: 256 Tests: 53 Failed: 1)
  Failed test:  49
  Non-zero exit status: 1
t3701-add-interactive.sh                         (Wstat: 0 Tests: 71 Failed: 0)
  TODO passed:   45, 47
Files=957, Tests=25489, 645 wallclock secs ( 5.74 usr  1.56 sys + 866.28 cusr 364.34 csys = 1237.92 CPU)
Result: FAIL
make[1]: *** [Makefile:53: prove] Error 1
make[1]: Leaving directory '/home/runner/work/git/git/t'
make: *** [Makefile:3018: test] Error 2


That's it. I count myself lucky not to be a new contributor being faced with
something like this.

Now, since I am active in the Git project for a couple of days or so, I can
make sense of the "TODO passed" label and know that for the purpose of
fixing the build failures, I need to ignore this, and that I need to focus
on the "Failed test" part instead.

I also know that I do not have to get myself an ubuntu-latest box just to
reproduce the error, I do not even have to check out the code and run it
just to learn what that "49" means.

I know, and I do not expect any new contributor, not even most seasoned
contributors to know, that I have to patiently collapse the "Run
ci/run-build-and-tests.sh" job's log, and instead expand the "Run
ci/print-test-failures.sh" job log (which did not fail and hence does not
draw any attention to it).

I know, and again: I do not expect many others to know this, that I then
have to click into the "Search logs" box (not the regular web browser's
search via Ctrl+F!) and type in "not ok" to find the log of the failed test
case (and this might still be a "known broken" one that is marked via
test_expect_failure and once again needs to be ignored).

To be excessively clear: This is not a great experience!


Improved output
===============

Our previous Azure Pipelines-based CI builds had a much nicer UI, one that
even showed flaky tests, and trends e.g. how long the test cases ran. When I
ported Git's CI over to GitHub workflows (to make CI more accessible to new
contributors), I knew fully well that we would leave this very nice UI
behind, and I had hoped that we would get something similar back via new,
community-contributed GitHub Actions that can be used in GitHub workflows.
However, most likely because we use a home-grown test framework implemented
in opinionated POSIX shells scripts, that did not happen.

So I had a look at what standards exist e.g. when testing PowerShell
modules, in the way of marking up their test output in GitHub workflows, and
I was not disappointed: GitHub workflows support "grouping" of output lines,
i.e. marking sections of the output as a group that is then collapsed by
default and can be expanded. And it is this feature I decided to use in this
patch series, along with GitHub workflows' commands to display errors or
notices that are also shown on the summary page of the workflow run. Now, in
addition to "Process completed with exit code" on the summary page, we also
read something like:

⊗ linux-gcc (ubuntu-latest)
   failed: t9800.20 submit from detached head


Even better, this message is a link, and following that, the reader is
presented with something like this
[https://github.com/dscho/git/runs/4840190622?check_suite_focus=true]:

⏵ Run ci/run-build-and-tests.sh
⏵ CI setup
  + ln -s /home/runner/none/.prove t/.prove
  + run_tests=t
  + export GIT_TEST_DEFAULT_INITIAL_BRANCH_NAME=main
  + group Build make
  + set +x
⏵ Build
⏵ Run tests
  === Failed test: t9800-git-p4-basic ===
⏵ ok: t9800.1 start p4d
⏵ ok: t9800.2 add p4 files
⏵ ok: t9800.3 basic git p4 clone
⏵ ok: t9800.4 depot typo error
⏵ ok: t9800.5 git p4 clone @all
⏵ ok: t9800.6 git p4 sync uninitialized repo
⏵ ok: t9800.7 git p4 sync new branch
⏵ ok: t9800.8 clone two dirs
⏵ ok: t9800.9 clone two dirs, @all
⏵ ok: t9800.10 clone two dirs, @all, conflicting files
⏵ ok: t9800.11 clone two dirs, each edited by submit, single git commit
⏵ ok: t9800.12 clone using non-numeric revision ranges
⏵ ok: t9800.13 clone with date range, excluding some changes
⏵ ok: t9800.14 exit when p4 fails to produce marshaled output
⏵ ok: t9800.15 exit gracefully for p4 server errors
⏵ ok: t9800.16 clone --bare should make a bare repository
⏵ ok: t9800.17 initial import time from top change time
⏵ ok: t9800.18 unresolvable host in P4PORT should display error
⏵ ok: t9800.19 run hook p4-pre-submit before submit
  Error: failed: t9800.20 submit from detached head
⏵ failure: t9800.20 submit from detached head 
  Error: failed: t9800.21 submit from worktree
⏵ failure: t9800.21 submit from worktree 
  === Failed test: t9801-git-p4-branch ===
  [...]


The "Failed test:" lines are colored in yellow to give a better visual clue
about the logs' structure, the "Error:" label is colored in red to draw the
attention to the important part of the log, and the "⏵" characters indicate
that part of the log is collapsed and can be expanded by clicking on it.

To drill down, the reader merely needs to expand the (failed) test case's
log by clicking on it, and then study the log. If needed (e.g. when the test
case relies on side effects from previous test cases), the logs of preceding
test cases can be expanded as well. In this example, when expanding
t9800.20, it looks like this (for ease of reading, I cut a few chunks of
lines, indicated by "[...]"):

[...]
⏵ ok: t9800.19 run hook p4-pre-submit before submit
  Error: failed: t9800.20 submit from detached head
⏷ failure: t9800.20 submit from detached head 
      test_when_finished cleanup_git &&
      git p4 clone --dest="$git" //depot &&
        (
          cd "$git" &&
          git checkout p4/master &&
          >detached_head_test &&
          git add detached_head_test &&
          git commit -m "add detached_head" &&
          git config git-p4.skipSubmitEdit true &&
          git p4 submit &&
            git p4 rebase &&
            git log p4/master | grep detached_head
        )
    [...]
    Depot paths: //depot/
    Import destination: refs/remotes/p4/master
    
    Importing revision 9 (100%)Perforce db files in '.' will be created if missing...
    Perforce db files in '.' will be created if missing...
    
    Traceback (most recent call last):
      File "/home/runner/work/git/git/git-p4", line 4455, in <module>
        main()
      File "/home/runner/work/git/git/git-p4", line 4449, in main
        if not cmd.run(args):
      File "/home/runner/work/git/git/git-p4", line 2590, in run
        rebase.rebase()
      File "/home/runner/work/git/git/git-p4", line 4121, in rebase
        if len(read_pipe("git diff-index HEAD --")) > 0:
      File "/home/runner/work/git/git/git-p4", line 297, in read_pipe
        retcode, out, err = read_pipe_full(c, *k, **kw)
      File "/home/runner/work/git/git/git-p4", line 284, in read_pipe_full
        p = subprocess.Popen(
      File "/usr/lib/python3.8/subprocess.py", line 858, in __init__
        self._execute_child(args, executable, preexec_fn, close_fds,
      File "/usr/lib/python3.8/subprocess.py", line 1704, in _execute_child
        raise child_exception_type(errno_num, err_msg, err_filename)
    FileNotFoundError: [Errno 2] No such file or directory: 'git diff-index HEAD --'
    error: last command exited with $?=1
    + cleanup_git
    + retry_until_success rm -r /home/runner/work/git/git/t/trash directory.t9800-git-p4-basic/git
    + nr_tries_left=60
    + rm -r /home/runner/work/git/git/t/trash directory.t9800-git-p4-basic/git
    + test_path_is_missing /home/runner/work/git/git/t/trash directory.t9800-git-p4-basic/git
    + test 1 -ne 1
    + test -e /home/runner/work/git/git/t/trash directory.t9800-git-p4-basic/git
    + retry_until_success mkdir /home/runner/work/git/git/t/trash directory.t9800-git-p4-basic/git
    + nr_tries_left=60
    + mkdir /home/runner/work/git/git/t/trash directory.t9800-git-p4-basic/git
    + exit 1
    + eval_ret=1
    + :
    not ok 20 - submit from detached head
    #    
    #        test_when_finished cleanup_git &&
    #        git p4 clone --dest="$git" //depot &&
    #        (
    #            cd "$git" &&
    #            git checkout p4/master &&
    #            >detached_head_test &&
    #            git add detached_head_test &&
    #            git commit -m "add detached_head" &&
    #            git config git-p4.skipSubmitEdit true &&
    #            git p4 submit &&
    #            git p4 rebase &&
    #            git log p4/master | grep detached_head
    #        )
    #    
  Error: failed: t9800.21 submit from worktree
  [...]


Is this the best UI we can have for test failures in CI runs? I hope we can
do better. Having said that, this patch series presents a pretty good start,
and offers a basis for future improvements.

Johannes Schindelin (9):
  ci: fix code style
  ci/run-build-and-tests: take a more high-level view
  ci: make it easier to find failed tests' logs in the GitHub workflow
  ci/run-build-and-tests: add some structure to the GitHub workflow
    output
  tests: refactor --write-junit-xml code
  test(junit): avoid line feeds in XML attributes
  ci: optionally mark up output in the GitHub workflow
  ci: use `--github-workflow-markup` in the GitHub workflow
  ci: call `finalize_test_case_output` a little later

 .github/workflows/main.yml           |  12 ---
 ci/lib.sh                            |  81 ++++++++++++++--
 ci/run-build-and-tests.sh            |  11 ++-
 ci/run-test-slice.sh                 |   5 +-
 t/test-lib-functions.sh              |   4 +-
 t/test-lib-github-workflow-markup.sh |  50 ++++++++++
 t/test-lib-junit.sh                  | 132 +++++++++++++++++++++++++++
 t/test-lib.sh                        | 128 ++++----------------------
 8 files changed, 287 insertions(+), 136 deletions(-)
 create mode 100644 t/test-lib-github-workflow-markup.sh
 create mode 100644 t/test-lib-junit.sh


base-commit: af4e5f569bc89f356eb34a9373d7f82aca6faa8a
Published-As: https://github.com/gitgitgadget/git/releases/tag/pr-1117%2Fdscho%2Fuse-grouping-in-ci-v1
Fetch-It-Via: git fetch https://github.com/gitgitgadget/git pr-1117/dscho/use-grouping-in-ci-v1
Pull-Request: https://github.com/gitgitgadget/git/pull/1117
-- 
gitgitgadget
