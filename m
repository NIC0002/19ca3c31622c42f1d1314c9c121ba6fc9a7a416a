Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2270BC433F5
	for <git@archiver.kernel.org>; Wed,  5 Oct 2022 15:01:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbiJEPBF (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 5 Oct 2022 11:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230281AbiJEPAb (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 5 Oct 2022 11:00:31 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF240A19B
        for <git@vger.kernel.org>; Wed,  5 Oct 2022 07:59:39 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id z13-20020a7bc7cd000000b003b5054c6f9bso1183773wmk.2
        for <git@vger.kernel.org>; Wed, 05 Oct 2022 07:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:from:to:cc:subject:date;
        bh=WzIgU5hQlJDUrAI9kqXumRFNuuWF5VhvANjFc4CEoSM=;
        b=ICUeKBhqWc86xa5St7tgKzoQ4+JyJRuPoRuTnt1HhLCzWr+87nq+Hbe85fhOQDAIl3
         rilAoYGehPjkw/6jhqNCCGohFcA6B+Do+B3jDZHqXVlkqNVEe0KerI6bvFZ4EpZ9a1Hg
         LXT+bZpY54Plk0mR7nYf53Bxa8/HN+gzUhA0aEObMn78f+gZewAXsqspboZFM4jYhi4r
         904fXUVjAZoLdK4pqwQ4fRADC5g3ZB7+9AgB9S6/wdUrHiOY2/UaVSYmbcKKSwtTGljU
         kJnvgikd3wkHu7DaGsmM9LBjjmxo90tqzCMWIywyXY+f+jcElH4EdktypDiP2oX9oPjv
         xR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:x-gm-message-state:from:to:cc
         :subject:date;
        bh=WzIgU5hQlJDUrAI9kqXumRFNuuWF5VhvANjFc4CEoSM=;
        b=d0NQL9LuX+Pgvl/f0GRbGOpPAwL524Uspdw6+Fvz0L22TGovd7Rd0RcKOnLl7GMqnX
         ewT0XP/ZO70zLZ+4e1xQwvWhMbk96i6tLDh8Azoy/9ZvgBX1jWYYCTydefHDI34wXGQ9
         Y4f86GfsqhkKvBMBvAvyfJKs4hXROIID6P6MFX7UXwhu+G6B6kguFXDVPLmVpCugqJoQ
         znc3ByUXNrTgoYudS94ykIneNcA1DiUo+JQlogDKkPGdQ25E+0Z3c82yVGhELPXIzruL
         tQxGGKc6ywfcLWWqDpR+fswIMr6Bp8Hx6BV4o45dntvzYYhTmDwhta0sApsEpsWT10QH
         qdiw==
X-Gm-Message-State: ACrzQf2/7AmU6gROeJIBiu77qPkHCTzK+Lf8oe4vrloMp2QTkpux3K5z
        sGSO73ei8xPNvIgIN7b3LAlw+roivE8=
X-Google-Smtp-Source: AMsMyM5xHZm9q79blciFTQ9qEAVNHClgXf7JH6Cm6TsnZCfou9StUstj7cXk/gu8jvxFKEQrdqJUJg==
X-Received: by 2002:a05:600c:a147:b0:3b4:86e7:4315 with SMTP id ib7-20020a05600ca14700b003b486e74315mr3702044wmb.156.1664981961000;
        Wed, 05 Oct 2022 07:59:21 -0700 (PDT)
Received: from [127.0.0.1] ([13.74.141.28])
        by smtp.gmail.com with ESMTPSA id k16-20020adfd850000000b0022e3538d305sm12430850wrl.117.2022.10.05.07.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 07:59:20 -0700 (PDT)
Message-Id: <a5eb93254191b7ae9c17ce52e056955c669ea007.1664981958.git.gitgitgadget@gmail.com>
In-Reply-To: <pull.1356.v2.git.1664981957.gitgitgadget@gmail.com>
References: <pull.1356.git.1663959324.gitgitgadget@gmail.com>
        <pull.1356.v2.git.1664981957.gitgitgadget@gmail.com>
From:   "Stefan Xenos via GitGitGadget" <gitgitgadget@gmail.com>
Date:   Wed, 05 Oct 2022 14:59:08 +0000
Subject: [PATCH v2 01/10] technical doc: add a design doc for the evolve
 command
Fcc:    Sent
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
To:     git@vger.kernel.org
Cc:     Jerry Zhang <jerry@skydio.com>,
        Phillip Wood <phillip.wood123@gmail.com>,
        =?UTF-8?Q?=C3=86var_Arnfj=C3=B6r=C3=B0?= Bjarmason 
        <avarab@gmail.com>, Chris Poucet <poucet@google.com>,
        Christophe Poucet <christophe.poucet@gmail.com>,
        Stefan Xenos <sxenos@google.com>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

From: Stefan Xenos <sxenos@google.com>

This document describes what a change graph for
git would look like, the behavior of the evolve command,
and the changes planned for other commands.

It was originally proposed in 2018, see
https://public-inbox.org/git/20181115005546.212538-1-sxenos@google.com/

Signed-off-by: Stefan Xenos <sxenos@google.com>
Signed-off-by: Chris Poucet <poucet@google.com>
---
 Documentation/technical/evolve.txt | 1070 ++++++++++++++++++++++++++++
 1 file changed, 1070 insertions(+)
 create mode 100644 Documentation/technical/evolve.txt

diff --git a/Documentation/technical/evolve.txt b/Documentation/technical/evolve.txt
new file mode 100644
index 00000000000..2051ea77b8a
--- /dev/null
+++ b/Documentation/technical/evolve.txt
@@ -0,0 +1,1070 @@
+Evolve
+======
+
+Objective
+=========
+Create an "evolve" command to help users craft a high quality commit history.
+Users can improve commits one at a time and in any order, then run git evolve to
+rewrite their recent history to ensure everything is up-to-date. We track
+amendments to a commit over time in a change graph. Users can share their
+progress with others by exchanging their change graphs using the standard push,
+fetch, and format-patch commands.
+
+Status
+======
+This proposal has not been implemented yet.
+
+Background
+==========
+Imagine you have three sequential changes up for review and you receive feedback
+that requires editing all three changes. We'll define the word "change"
+formally later, but for the moment let's say that a change is a work-in-progress
+whose final version will be submitted as a commit in the future.
+
+While you're editing one change, more feedback arrives on one of the others.
+What do you do?
+
+The evolve command is a convenient way to work with chains of commits that are
+under review. Whenever you rebase or amend a commit, the repository remembers
+that the old commit is obsolete and has been replaced by the new one. Then, at
+some point in the future, you can run "git evolve" and the correct sequence of
+rebases will occur in the correct order such that no commit has an obsolete
+parent.
+
+Part of making the "evolve" command work involves tracking the edits to a commit
+over time, which is why we need an change graph. However, the change
+graph will also bring other benefits:
+
+- Users can view the history of a change directly (the sequence of amends and
+  rebases it has undergone, orthogonal to the history of the branch it is on).
+- It will be possible to quickly locate and list all the changes the user
+  currently has in progress.
+- It can be used as part of other high-level commands that combine or split
+  changes.
+- It can be used to decorate commits (in git log, gitk, etc) that are either
+  obsolete or are the tip of a work in progress.
+- By pushing and pulling the change graph, users can collaborate more
+  easily on changes-in-progress. This is better than pushing and pulling the
+  commits themselves since the change graph can be used to locate a more
+  specific merge base, allowing for better merges between different versions of
+  the same change.
+- It could be used to correctly rebase local changes and other local branches
+  after running git-filter-branch.
+- It can replace the change-id footer used by gerrit.
+
+Goals
+-----
+Legend: Goals marked with P0 are required. Goals marked with Pn should be
+attempted unless they interfere with goals marked with Pn-1.
+
+P0. All commands that modify commits (such as the normal commit --amend or
+    rebase command) should mark the old commit as being obsolete and replaced by
+    the new one. No additional commands should be required to keep the
+    change graph up-to-date.
+P0. Any commit that may be involved in a future evolve command should not be
+    garbage collected. Specifically:
+    - Commits that obsolete another should not be garbage collected until
+      user-specified conditions have occurred and the change has expired from
+      the reflog. User specified conditions for removing changes include:
+      - The user explicitly deleted the change.
+      - The change was merged into a specific branch.
+    - Commits that have been obsoleted by another should not be garbage
+      collected if any of their replacements are still being retained.
+P0. A commit can be obsoleted by more than one replacement (called divergence).
+P0. Users must be able to resolve divergence (convergence).
+P1. Users should be able to share chains of obsolete changes in order to
+    collaborate on WIP changes.
+P2. Such sharing should be at the user’s option. That is, it should be possible
+    to directly share a change without also sharing the file states or commit
+    comments from the obsolete changes that led up to it, and the choice not to
+    share those commits should not require changing any commit hashes.
+P2. It should be possible to discard part or all of the change graph
+    without discarding the commits themselves that are already present in
+    branches and the reflog.
+P2. Provide sufficient information to replace gerrit's Change-Id footers.
+
+Similar technologies
+--------------------
+There are some other technologies that address the same end-user problem.
+
+Rebase -i can be used to solve the same problem, but users can't easily switch
+tasks midway through an interactive rebase or have more than one interactive
+rebase going on at the same time. It can't handle the case where you have
+multiple changes sharing the same parent when that parent needs to be rebased
+and won't let you collaborate with others on resolving a complicated interactive
+rebase. You can think of rebase -i as a top-down approach and the evolve command
+as the bottom-up approach to the same problem.
+
+Revup amend (https://github.com/Skydio/revup/blob/main/docs/amend.md)
+allows insertion of cached changes into any commit in
+the current history, and then reapplies the rest of history on top of
+those changes. It uses a "git apply --cached" engine under the hood so
+doesn't touch the working directory (although it will soon use the new
+git merge-tree). When paired with "revup upload" which creates and
+pushes multiple branches in the background for you, its possible to
+work on a "graph" of changes on a single branch linearly, then have
+the true graph structure created at upload time.
+
+git-revise (https://github.com/mystor/git-revise) does some very
+similar things except it uses "git merge-file" combined with manually
+merging the resulting trees. git branchstack
+(https://github.com/krobelus/git-branchstack) can also create branches
+in the background with the same mechanism.
+
+These tools don't store any external state, but as such also don't
+provide any specific collaboration mechanism for individual changes.
+
+Several patch queue managers have been built on top of git (such as topgit,
+stgit, and quilt). They address the same user need. However they also rely on
+state managed outside git that needs to be kept in sync. Such state can be
+easily damaged when running a git native command that is unaware of the patch
+queue. They also typically require an explicit initialization step to be done by
+the user which creates workflow problems.
+
+Mercurial implements a very similar feature in its EvolveExtension. The behavior
+of the evolve command itself is very similar, but the storage format for the
+change graph differs. In the case of mercurial, each change set can have one or
+more obsolescence markers that point to other changesets that they replace. This
+is similar to the "Commit Headers" approach considered in the other options
+appendix. The approach proposed here stores obsolescence information in a
+separate metacommit graph, which makes exchanging of obsolescence information
+optional.
+
+Mercurial's default behavior makes it easy to find and switch between
+non-obsolete changesets that aren't currently on any branch. We introduce the
+notion of a new ref namespace that enables a similar workflow via a different
+mechanism. Mercurial has the notion of changeset phases which isn't present
+in git and creates new ways for a changeset to diverge. Git doesn't need
+to deal with these issues, but it has to deal with the problems of picking an
+upstream branch as a target for rebases and protecting obsolescence information
+from GC. We also introduce some additional transformations (see
+obsolescence-over-cherry-pick, below) that aren't present in the mercurial
+implementation.
+
+Semi-related work
+-----------------
+There are other technologies that address different problems but have some
+similarities with this proposal.
+
+Replacements (refs/replace) are superficially similar to obsolescences in that
+they describe that one commit should be replaced by another. However, they
+differ in both how they are created and how they are intended to be used.
+Obsolescences are created automatically by the commands a user runs, and they
+describe the user’s intent to perform a future rebase. Obsolete commits still
+appear in branches, logs, etc like normal commits (possibly with an extra
+decoration that marks them as obsolete). Replacements are typically created
+explicitly by the user, they are meant to be kept around for a long time, and
+they describe a replacement to be applied at read-time rather than as the input
+to a future operation. When a replaced commit is queried, it is typically hidden
+and swapped out with its replacement as though the replacement has already
+occurred.
+
+Git-imerge is a project to help make complicated merges easier, particularly
+when merging or rebasing long chains of patches. It is not an alternative to
+the change graph, but its algorithm of applying smaller incremental merges
+could be used as part of the evolve algorithm in the future.
+
+Overview
+========
+We introduce the notion of “meta-commits” which describe how one commit was
+created from other commits. A branch of meta-commits is known as a change.
+Changes are created and updated automatically whenever a user runs a command
+that creates a commit. They are used for locating obsolete commits, providing a
+list of a user’s unsubmitted work in progress, and providing a stable name for
+each unsubmitted change.
+
+Users can exchange edit histories by pushing and fetching changes.
+
+New commands will be introduced for manipulating changes and resolving
+divergence between them. Existing commands that create commits will be updated
+to modify the meta-commit graph and create changes where necessary.
+
+Example usage
+-------------
+# First create three dependent changes
+$ echo foo>bar.txt && git add .
+$ git commit -m "This is a test"
+created change metas/this_is_a_test
+$ echo foo2>bar2.txt && git add .
+$ git commit -m "This is also a test"
+created change metas/this_is_also_a_test
+$ echo foo3>bar3.txt && git add .
+$ git commit -m "More testing"
+created change metas/more_testing
+
+# List all our changes in progress
+$ git change list
+metas/this_is_a_test
+metas/this_is_also_a_test
+* metas/more_testing
+metas/some_change_already_merged_upstream
+
+# Now modify the earliest change, using its stable name
+$ git reset --hard metas/this_is_a_test
+$ echo morefoo>>bar.txt && git add . && git commit --amend --no-edit
+
+# Use git-evolve to fix up any dependent changes
+$ git evolve
+rebasing metas/this_is_also_a_test onto metas/this_is_a_test
+rebasing metas/more_testing onto metas/this_is_also_a_test
+Done
+
+# Use git-obslog to view the history of the this_is_a_test change
+$ git log --obslog
+93f110 metas/this_is_a_test@{0} commit (amend): This is a test
+930219 metas/this_is_a_test@{1} commit: This is a test
+
+# Now create an unrelated change
+$ git reset --hard origin/master
+$ echo newchange>unrelated.txt && git add .
+$ git commit -m "Unrelated change"
+created change metas/unrelated_change
+
+# Fetch the latest code from origin/master and use git-evolve
+# to rebase all dependent changes.
+$ git fetch origin master
+$ git evolve origin/master
+deleting metas/some_change_already_merged_upstream
+rebasing metas/this_is_a_test onto origin/master
+rebasing metas/this_is_also_a_test onto metas/this_is_a_test
+rebasing metas/more_testing onto metas/this_is_also_a_test
+rebasing metas/unrelated_change onto origin/master
+Conflict detected! Resolve it and then use git evolve --continue to resume.
+
+# Sort out the conflict
+$ git mergetool
+$ git evolve origin/master
+Done
+
+# Share the full history of edits for the this_is_a_test change
+# with a review server
+$ git push origin metas/this_is_a_test:refs/for/master
+# Share the lastest commit for “Unrelated change”, without history
+$ git push origin HEAD:refs/for/master
+
+Detailed design
+===============
+Obsolescence information is stored as a graph of meta-commits. A meta-commit is
+a specially-formatted merge commit that describes how one commit was created
+from others.
+
+Meta-commits look like this:
+
+$ git cat-file -p <example_meta_commit>
+tree 4b825dc642cb6eb9a060e54bf8d69288fbee4904
+parent aa7ce55545bf2c14bef48db91af1a74e2347539a
+parent d64309ee51d0af12723b6cb027fc9f195b15a5e9
+parent 7e1bbcd3a0fa854a7a9eac9bf1eea6465de98136
+author Stefan Xenos <sxenos@gmail.com> 1540841596 -0700
+committer Stefan Xenos <sxenos@gmail.com> 1540841596 -0700
+parent-type c r o
+
+This says “commit aa7ce555 makes commit d64309ee obsolete. It was created by
+cherry-picking commit 7e1bbcd3”.
+
+The tree for meta-commits is always the empty tree, but future versions of git
+may attach other trees here. For forward-compatibility fsck should ignore such
+trees if found on future repository versions. This will allow future versions of
+git to add metadata to the meta-commit tree without breaking forwards
+compatibility.
+
+The commit comment for a meta-commit is an auto-generated user-readable string
+describing the command that produced the meta commit. These strings are shown
+to the user when they view the obslog.
+
+Parent-type
+-----------
+The “parent-type” field in the commit header identifies a commit as a
+meta-commit and indicates the meaning for each of its parents. It is never
+present for normal commits. It contains a space-deliminated list of enum values
+whose order matches the order of the parents. Possible parent types are:
+
+- c: (content) the content parent identifies the commit that this meta-commit is
+  describing.
+- r: (replaced) indicates that this parent is made obsolete by the content
+  parent.
+- o: (origin) indicates that the content parent was generated by cherry-picking
+  this parent.
+- a: (abandoned) used in place of a content parent for abandoned changes. Points
+  to the final content commit for the change at the time it was abandoned.
+
+There must be exactly one content or abandoned parent for each meta-commit and
+it is always the first parent. The content commit will always be a normal commit
+and not a meta-commit. However, future versions of git may create meta-commits
+for other meta-commits and the fsck tool must be aware of this for forwards
+compatibility.
+
+A meta-commit can have zero or more replaced parents. An amend operation creates
+a single replaced parent. A merge used to resolve divergence (see divergence,
+below) will create multiple replaced parents. A meta-commit may have no
+replaced parents if it describes a cherry-pick or squash merge that copies one
+or more commits but does not replace them.
+
+A meta-commit can have zero or more origin parents. A cherry-pick creates a
+single origin parent. Certain types of squash merge will create multiple origin
+parents. Origin parents don't directly cause their origin to become obsolete,
+but are used when computing blame or locating a merge base. The section
+on obsolescence over cherry-picks describes how the evolve command uses
+origin parents.
+
+A replaced parent or origin parent may be either a normal commit (indicating
+the oldest-known version of a change) or another meta-commit (for a change that
+has already been modified one or more times).
+
+The parent-type field needs to go after the committer field since git's rules
+for forwards-compatibility require that new fields to be at the end of the
+header. Putting a new field in the middle of the header would break fsck.
+
+The presence of an abandoned parent indicates that the change should be pruned
+by the evolve command, and removed from the repository's history. Any follow-up
+changes should rebased onto the parent of the pruned commit. The abandoned
+parent points to the version of the change that should be restored if the user
+attempts to restore the change.
+
+Changes
+-------
+A branch of meta-commits describes how a commit was produced and what previous
+commits it is based on. It is also an identifier for a thing the user is
+currently working on. We refer to such a meta-branch as a change.
+
+Local changes are stored in the new refs/metas namespace. Remote changes are
+stored in the refs/remote/<remotename>/metas namespace.
+
+The list of changes in refs/metas is more than just a mechanism for the evolve
+command to locate obsolete commits. It is also a convenient list of all of a
+user’s work in progress and their current state - a list of things they’re
+likely to want to come back to.
+
+Strictly speaking, it is the presence of the branch in the refs/metas namespace
+that marks a branch as being a change, not the fact that it points to a
+metacommit. Metacommits are only created when a commit is amended or rebased, so
+in the case where a change points to a commit that has never been modified, the
+change points to that initial commit rather than a metacommit.
+
+Changes are also stored in the refs/hiddenmetas namespace. Hiddenmetas holds
+metadata for historical changes that are not currently in progress by the user.
+Commands like filter-branch and other bulk import commands create metadata in
+this namespace.
+
+Note that the changes in hiddenmetas get special treatment in several ways:
+
+- They are not cleaned up automatically once merged, since it is expected that
+  they refer to historical changes.
+- User commands that modify changes don't append to these changes as they would
+  to a change in refs/metas.
+- They are not displayed when the user lists their local changes.
+
+Obsolescence
+------------
+A commit is considered obsolete if it is reachable from the “replaces” edges
+anywhere in the history of a change and it isn’t the head of that change.
+Commits may be the content for 0 or more meta-commits. If the same commit
+appears in multiple changes, it is not obsolete if it is the head of any of
+those changes.
+
+Note that there is an exception to this rule. The metas namespace takes
+precedence over the hiddenmetas namespace for the purpose of obsolescence. That
+is, if a change appears in a replaces edge of a change in the metas namespace,
+it is obsolete even if it also appears as the head of a change in the
+hiddenmetas namespace.
+
+This special case prevents the hiddenmetas namespace from creating divergence
+with the user's work in progress, and allows the user to resolve historical
+divergence by creating new changes in the metas namespace.
+
+Divergence
+----------
+From the user’s perspective, two changes are divergent if they both ask for
+different replacements to the same commit. More precisely, a target commit is
+considered divergent if there is more than one commit at the head of a change in
+refs/metas that leads to the target commit via an unbroken chain of “replaces”
+parents.
+
+Much like a merge conflict, divergence is a situation that requires user
+intervention to resolve. The evolve command will stop when it encounters
+divergence and prompt the user to resolve the problem. Users can solve the
+problem in several ways:
+
+- Discard one of the changes (by deleting its change branch).
+- Merge the two changes (producing a single change branch).
+- Copy one of the changes (keep both commits, but one of them gets a new
+  metacommit appended to its history that is connected to its predecessor via an
+  origin edge rather than a replaces edge. That new change no longer obsoletes
+  the original.)
+
+Obsolescence across cherry-picks
+--------------------------------
+By default the evolve command will treat cherry-picks and squash merges as being
+completely separate from the original. Further amendments to the original commit
+will have no effect on the cherry-picked copy. However, this behavior may not be
+desirable in all circumstances.
+
+The evolve command may at some point support an option to look for cases where
+the source of a cherry-pick or squash merge has itself been amended, and
+automatically apply that same change to the cherry-picked copy. In such cases,
+it would traverse origin edges rather than ignoring them, and would treat a
+commit with origin edges as being obsolete if any of its origins were obsolete.
+
+Garbage collection
+------------------
+For GC purposes, meta-commits are normal commits. Just as a commit causes its
+parents and tree to be retained, a meta-commit also causes its parents to be
+retained.
+
+Change creation
+---------------
+Changes are created automatically whenever the user runs a command like “commit”
+that has the semantics of creating a new change. They also move forward
+automatically even if they’re not checked out. For example, whenever the user
+runs a command like “commit --amend” that modifies a commit, all branches in
+refs/metas that pointed to the old commit move forward to point to its
+replacement instead. This also happens when the user is working from a detached
+head.
+
+This does not mean that every commit has a corresponding change. By default,
+changes only exist for recent locally-created commits. Users may explicitly pull
+changes from other users or keep their changes around for a long time, but
+either behavior requires a user to opt-in. Code review systems like gerrit may
+also choose to keep changes around forever.
+
+Note that the changes in refs/metas serve a dual function as both a way to
+identify obsolete changes and as a way for the user to keep track of their work
+in progress. If we were only concerned with identifying obsolete changes, it
+would be sufficient to create the change branch lazily the first time a commit
+is obsoleted. Addressing the second use - of refs/metas as a mechanism for
+keeping track of work in progress - is the reason for eagerly creating the
+change on first commit.
+
+Change naming
+-------------
+When a change is first created, the only requirement for its name is that it
+must be unique. Good names would also serve as useful mnemonics and be easy to
+type. For example, a short word from the commit message containing no numbers or
+special characters and that shows up with low frequency in other commit messages
+would make a good choice.
+
+Different users may prefer different heuristics for their change names. For this
+reason a new hook will be introduced to compute change names. Git will invoke
+the hook for all newly-created changes and will append a numeric suffix if the
+name isn’t unique. The default heuristics are not specified by this proposal and
+may change during implementation.
+
+Change deletion
+---------------
+Changes are normally only interesting to a user while a commit is still in
+development and under review. Once the commit has submitted wherever it is
+going, its change can be discarded.
+
+The normal way of deleting changes makes this easy to do - changes are deleted
+by the evolve command when it detects that the change is present in an upstream
+branch. It does this in two ways: if the latest commit in a change either shows
+up in the branch history or the change becomes empty after a rebase, it is
+considered merged and the change is discarded. In this context, an “upstream
+branch” is any branch passed in as the upstream argument of the evolve command.
+
+In case this sometimes deletes a useful change, such automatic deletions are
+recorded in the reflog allowing them to be easily recovered.
+
+Sharing changes
+---------------
+Change histories are shared by pushing or fetching meta-commits and change
+branches. This provides users with a lot of control of what to share and
+repository implementations with control over what to retain.
+
+Users that only want to share the content of a commit can do so by pushing the
+commit itself as they currently would. Users that want to share an edit history
+for the commit can push its change, which would point to a meta-commit rather
+than the commit itself if there is any history to share. Note that multiple
+changes can refer to the same commits, so it’s possible to construct and push a
+different history for the same commit in order to remove sensitive or irrelevant
+intermediate states.
+
+Imagine the user is working on a change “mychange” that is currently the latest
+commit on master. They have two ways to share it:
+
+# User shares just a commit without its history
+> git push origin master
+
+# User shares the full history of the commit to a review system
+> git push origin metas/mychange:refs/for/master
+
+# User fetches a collaborator’s modifications to their change
+> git fetch remotename metas/mychange
+# Which updates the ref remote/remotename/metas/mychange
+
+This will cause more intermediate states to be shared with the server than would
+have been shared previously. A review system like gerrit would need to keep
+track of which states had been explicitly pushed versus other intermediate
+states in order to de-emphasize (or hide) the extra intermediate states from the
+user interface.
+
+Merge-base
+----------
+Merge-base will be changed to search the meta-commit graph for common ancestors
+as well as the commit graph, and will generally prefer results from the
+meta-commit graph over the commit graph. Merge-base will consider meta-commits
+from all changes, and will traverse both origin and obsolete edges.
+
+The reason for this is that - when merging two versions of the same commit
+together - an earlier version of that same commit will usually be much more
+similar than their common parent. This should make the workflow of collaborating
+on unsubmitted patches as convenient as the workflow for collaborating in a
+topic branch by eliminating repeated merges.
+
+Configuration
+-------------
+The core.enableChanges configuration variable enables the creation and update
+of change branches. This is enabled by default.
+
+User interface
+--------------
+All git porcelain commands that create commits are classified as having one of
+four behaviors: modify, create, copy, or import. These behaviors are discussed
+in more detail below.
+
+Modify commands
+---------------
+Modification commands (commit --amend, rebase) will mark the old commit as
+obsolete by creating a new meta-commit that references the old one as a
+replaced parent. In the event that multiple changes point to the same commit,
+this is done independently for every such change.
+
+More specifically, modifications work like this:
+
+1. Locate all existing changes for which the old commit is the content for the
+   head of the change branch. If no such branch exists, create one that points
+   to the old commit. Changes that include this commit in their history but not
+   at their head are explicitly not included.
+2. For every such change, create a new meta-commit that references the new
+   commit as its content and references the old head of the change as a
+   replaced parent.
+3. Move the change branch forward to point to the new meta-commit.
+
+Copy commands
+-------------
+Copy commands (cherry-pick, merge --squash) create a new meta-commit that
+references the old commits as origin parents. Besides the fact that the new
+parents are tagged differently, copy commands work the same way as modify
+commands.
+
+Create commands
+---------------
+Creation commands (commit, merge) create a new commit and a new change that
+points to that commit. The do not create any meta-commits.
+
+Import commands
+---------------
+Import commands (fetch, pull) do not create any new meta-commits or changes
+unless that is specifically what they are importing. For example, the fetch
+command would update remote/origin/metas/change35 and fetch all referenced
+meta-commits if asked to do so directly, but it wouldn’t create any changes or
+meta-commits for commits discovered on the master branch when running “git fetch
+origin master”.
+
+Other commands
+--------------
+Some commands don’t fit cleanly into one of the above categories.
+
+Semantically, filter-branch should be treated as a modify command, but doing so
+is likely to create a lot of irrelevant clutter in the changes namespace and the
+large number of extra change refs may introduce performance problems. We
+recommend treating filter-branch as an import command initially, but making it
+behave more like a modify command in future follow-up work. One possible
+solution may be to treat commits that are part of existing changes as being
+modified but to avoid creating changes for other rewritten changes. Another
+solution may be to record the modifications as changes in the hiddenmetas
+namespace.
+
+Once the evolve command can handle obsolescence across cherry-picks, such
+cherry-picks will result in a hybrid move-and-copy operation. It will create
+cherry-picks that replace other cherry-picks, which will have both origin edges
+(pointing to the new source commit being picked) and replacement edges (pointing
+to the previous cherry-pick being replaced).
+
+Evolve
+------
+The evolve command performs the correct sequence of rebases such that no change
+has an obsolete parent. The syntax looks like this:
+
+git evolve [upstream…]
+
+It takes an optional list of upstream branches. All changes whose parent shows
+up in the history of one of the upstream branches will be rebased onto the
+upstream branch before resolving obsolete parents.
+
+Any change whose latest state is found in an upstream branch (or that ends up
+empty after rebase) will be deleted. This is the normal mechanism for deleting
+changes. Changes are created automatically on the first commit, and are deleted
+automatically when evolve determines that they’ve been merged upstream.
+
+Orphan commits are commits with obsolete parents. The evolve command then
+repeatedly rebases orphan commits with non-orphan parents until there are either
+no orphan commits left, or a merge conflict is discovered. It will also
+terminate if it detects a divergent parent or a cycle that can't be resolved
+using any of the enabled transformations.
+
+When evolve discovers divergence, it will first check if it can resolve the
+divergence automatically using one of its enabled transformations. Supported
+transformations are:
+
+- Check if the user has already merged the divergent changes in a follow-up
+  change. That is, look for an existing merge in a follow-up change where all
+  the parents are divergent versions of the same change. Squash that merge with
+  its parents and use the result as the resolution for the divergence.
+
+- Attempt to auto-merge all the divergent changes (disabled by default).
+
+Each of the transformations can be enabled or disabled by command line options.
+
+Cycles can occur when two changes reference one another as parents. This can
+happen when both changes use an obsolete version of the other change as their
+parent. Although there are never cycles in the commit graph, users can create
+cycles in the change graph by rebasing changes onto obsolete commits. The evolve
+command has a transformation that will detect and break cycles by arbitrarily
+picking one of the changes to go first. If this generates a merge conflict,
+it tries each of the other changes in sequence to see if any ordering merges
+cleanly. If no possible ordering merges cleanly, it picks one and terminates
+to let the user resolve the merge conflict.
+
+If the working tree is dirty, evolve will attempt to stash the user's changes
+before applying the evolve and then reapply those changes afterward, in much
+the same way as rebase --autostash does.
+
+Checkout
+--------
+Running checkout on a change by name has the same effect as checking out a
+detached head pointing to the latest commit on that change-branch. There is no
+need to ever have HEAD point to a change since changes always move forward when
+necessary, no matter what branch the user has checked out
+
+Meta-commits themselves cannot be checked out by their hash.
+
+Reset
+-----
+Resetting a branch to a change by name is the same as resetting to the content
+(or abandoned) commit at that change’s head.
+
+Commit
+------
+Commit --amend gets modify semantics and will move existing changes forward. The
+normal form of commit gets create semantics and will create a new change.
+
+$ touch foo && git add . && git commit -m "foo" && git tag A
+$ touch bar && git add . && git commit -m "bar" && git tag B
+$ touch baz && git add . && git commit -m "baz" && git tag C
+
+This produces the following commits:
+A(tree=[foo])
+B(tree=[foo, bar], parent=A)
+C(tree=[foo, bar, baz], parent=B)
+
+...along with three changes:
+metas/foo = A
+metas/bar = B
+metas/baz = C
+
+Running commit --amend does the following:
+$ git checkout B
+$ touch zoom && git add . && git commit --amend -m "baz and zoom"
+$ git tag D
+
+Commits:
+A(tree=[foo])
+B(tree=[foo, bar], parent=A)
+C(tree=[foo, bar, baz], parent=B)
+D(tree=[foo, bar, zoom], parent=A)
+Dmeta(content=D, obsolete=B)
+
+Changes:
+metas/foo = A
+metas/bar = Dmeta
+metas/baz = C
+
+Merge
+-----
+Merge gets create, modify, or copy semantics based on what is being merged and
+the options being used.
+
+The --squash version of merge gets copy semantics (it produces a new change that
+is marked as a copy of all the original changes that were squashed into it).
+
+The “modify” version of merge replaces both of the original commits with the
+resulting merge commit. This is one of the standard mechanisms for resolving
+divergence. The parents of the merge commit are the parents of the two commits
+being merged. The resulting commit will not be a merge commit if both of the
+original commits had the same parent or if one was the parent of the other.
+
+The “create” version of merge creates a new change pointing to a merge commit
+that has both original commits as parents. The result is what merge produces now
+- a new merge commit. However, this version of merge doesn’t directly resolve
+divergence.
+
+To select between these two behaviors, merge gets new “--amend” and “--noamend”
+options which select between the “create” and “modify” behaviors respectively,
+with noamend being the default.
+
+For example, imagine we created two divergent changes like this:
+
+$ touch foo && git add . && git commit -m "foo" && git tag A
+$ touch bar && git add . && git commit -m "bar" && git tag B
+$ touch baz && git add . && git commit --amend -m "bar and baz"
+$ git tag C
+$ git checkout B
+$ touch bam && git add . && git commit --amend -m "bar and bam"
+$ git tag D
+
+At this point the commit graph looks like this:
+
+A(tree=[foo])
+B(tree=[bar], parent=A)
+C(tree=[bar, baz], parent=A)
+D(tree=[bar, bam], parent=A)
+Cmeta(content=C, obsoletes=B)
+Dmeta(content=D, obsoletes=B)
+
+There would be three active changes with heads pointing as follows:
+
+metas/changeA=A
+metas/changeB=Cmeta
+metas/changeB2=Dmeta
+
+ChangeB and changeB2 are divergent at this point. Lets consider what happens if
+perform each type of merge between changeB and changeB2.
+
+Merge example: Amend merge
+One way to resolve divergent changes is to use an amend merge. Recall that HEAD
+is currently pointing to D at this point.
+
+$ git merge --amend metas/changeB
+
+Here we’ve asked for an amend merge since we’re trying to resolve divergence
+between two versions of the same change. There are no conflicts so we end up
+with this:
+
+E(tree=[bar, baz, bam], parent=A)
+Emeta(content=E, obsoletes=[Cmeta, Dmeta])
+
+With the following branches:
+
+metas/changeA=A
+metas/changeB=Emeta
+metas/changeB2=Emeta
+
+Notice that the result of the “amend merge” is a replacement for C and D rather
+than a new commit with C and D as parents (as a normal merge would have
+produced). The parents of the amend merge are the parents of C and D which - in
+this case - is just A, so the result is not a merge commit. Also notice that
+changeB and changeB2 are now aliases for the same change.
+
+Merge example: Noamend merge
+Consider what would have happened if we’d used a noamend merge instead. Recall
+that HEAD was at D and our branches looked like this:
+
+metas/changeA=A
+metas/changeB=Cmeta
+metas/changeB2=Dmeta
+
+$ git merge --noamend metas/changeB
+
+That would produce the sort of merge we’d normally expect today:
+
+F(tree=[bar, baz, bam], parent=[C, D])
+
+And our changes would look like this:
+metas/changeA=A
+metas/changeB=Cmeta
+metas/changeB2=Dmeta
+metas/changeF=F
+
+In this case, changeB and changeB2 are still divergent and we’ve created a new
+change for our merge commit. However, this is just a temporary state. The next
+time we run the “evolve” command, it will discover the divergence but also
+discover the merge commit F that resolves it. Evolve will suggest converting F
+into an amend merge in order to resolve the divergence and will display the
+command for doing so.
+
+Rebase
+------
+In general the rebase command is treated as a modify command. When a change is
+rebased, the new commit replaces the original.
+
+Rebase --abort is special. Its intent is to restore git to the state it had
+prior to running rebase. It should move back any changes to point to the refs
+they had prior to running rebase and delete any new changes that were created as
+part of the rebase. To achieve this, rebase will save the state of all changes
+in refs/metas prior to running rebase and will restore the entire namespace
+after rebase completes (deleting any newly-created changes). Newly-created
+metacommits are left in place, but will have no effect until garbage collected
+since metacommits are only used if they are reachable from refs/metas.
+
+Change
+------
+The “change” command can be used to list, rename, reset or delete change. It has
+a number of subcommands.
+
+The "list" subcommand lists local changes. If given the -r argument, it lists
+remote changes.
+
+The "rename" subcommand renames a change, given its old and new name. If the old
+name is omitted and there is exactly one change pointing to the current HEAD,
+that change is renamed. If there are no changes pointing to the current HEAD,
+one is created with the given name.
+
+The "forget" subcommand deletes a change by deleting its ref from the metas/
+namespace. This is the normal way to delete extra aliases for a change if the
+change has more than one name. By default, this will refuse to delete the last
+alias for a change if there are any other changes that reference this change as
+a parent.
+
+The "update" subcommand adds a new state to a change. It uses the default
+algorithm for assigning change names. If the content commit is omitted, HEAD is
+used. If given the optional --force argument, it will overwrite any existing
+change of the same name. This latter form of "update" can be used to effectively
+reset changes.
+
+The "update" command can accept any number of --origin and --replace arguments.
+If any are present, the resulting change branch will point to a metacommit
+containing the given origin and replacement edges.
+
+The "abandon" command deletes a change using obsolescence markers. It marks the
+change as being obsolete and having been replaced by its parent. If given no
+arguments, it applies to the current commit. Running evolve will cause any
+abandoned changes to be removed from the branch. Any child changes will be
+reparented on top of the parent of the abandoned change. If the current change
+is abandoned, HEAD will move to point to its parent.
+
+The "restore" command restores a previously-abandoned change.
+
+The "prune" command deletes all obsolete changes and all changes that are
+present in the given branch. Note that such changes can be recovered from the
+reflog.
+
+Combined with the GC protection that is offered, this is intended to facilitate
+a workflow that relies on changes instead of branches. Users could choose to
+work with no local branches and use changes instead - both for mailing list and
+gerrit workflows.
+
+Log
+---
+When a commit is shown in git log that is part of a change, it is decorated with
+extra change information. If it is the head of a change, the name of the change
+is shown next to the list of branches. If it is obsolete, it is decorated with
+the text “obsolete, <n> commits behind <changename>”.
+
+Log gets a new --obslog argument indicating that the obsolescence graph should
+be followed instead of the commit graph. This also changes the default
+formatting options to make them more appropriate for viewing different
+iterations of the same commit.
+
+Pull
+----
+
+Pull gets an --evolve argument that will automatically attempt to run "evolve"
+on any affected branches after pulling.
+
+We also introduce an "evolve" enum value for the branch.<name>.rebase config
+value. When set, the evolve behavior will happen automatically for that branch
+after every pull even if the --evolve argument is not used.
+
+Next
+----
+
+The "next" command will reset HEAD to a non-obsolete commit that refers to this
+change as its parent. If there is more than one such change, the user will be
+prompted. If given the --evolve argument, the next commit will be evolved if
+necessary first.
+
+The "next" command can be thought of as the opposite of
+"git reset --hard HEAD^" in that it navigates to a child commit rather than a
+parent.
+
+Prev
+----
+
+The "prev" command will reset HEAD to the latest version of the parent change.
+If the parent change isn't obsolete, this is equivalent to
+"git reset --hard HEAD^". If the parent commit is obsolete, it resets to the
+latest replacement for the parent commit.
+
+Other options considered
+========================
+We considered several other options for storing the obsolescence graph. This
+section describes the other options and why they were rejected.
+
+Commit header
+-------------
+Add an “obsoletes” field to the commit header that points backwards from a
+commit to the previous commits it obsoletes.
+
+Pros:
+- Very simple
+- Easy to traverse from a commit to the previous commits it obsoletes.
+Cons:
+- Adds a cost to the storage format, even for commits where the change history
+  is uninteresting.
+- Unconditionally prevents the change history from being garbage collected.
+- Always causes the change history to be shared when pushing or pulling changes.
+
+Git notes
+---------
+Instead of storing obsolescence information in metacommits, the metacommit
+content could go in a new notes namespace - say refs/notes/metacommit. Each note
+would contain the list of obsolete and origin parents. An automerger could
+be supplied to make it easy to merge the metacommit notes from different remotes.
+
+Pros:
+- Easy to locate all commits obsoleted by a given commit (since there would only
+  be one metacommit for any given commit).
+Cons:
+- Wrong GC behavior (obsolete commits wouldn’t automatically be retained by GC)
+  unless we introduced a special case for these kinds of notes.
+- No way to selectively share or pull the metacommits for one specific change.
+  It would be all-or-nothing, which would be expensive. This could be addressed
+  by changes to the protocol, but this would be invasive.
+- Requires custom auto-merging behavior on fetch.
+
+Tags
+----
+Put the content of the metacommit in a message attached to tag on the
+replacement commit. This is very similar to the git notes approach and has the
+same pros and cons.
+
+Simple forward references
+-------------------------
+Record an edge from an obsolete commit to its replacement in this form:
+
+refs/obsoletes/<A>
+
+pointing to commit <B> as an indication that B is the replacement for the
+obsolete commit A.
+
+Pros:
+- Protects <B> from being garbage collected.
+- Fast lookup for the evolve operation, without additional search structures
+  (“what is the replacement for <A>?” is very fast).
+
+Cons:
+- Can’t represent divergence (which is a P0 requirement).
+- Creates lots of refs (which can be inefficient)
+- Doesn’t provide a way to fetch only refs for a specific change.
+- The obslog command requires a search of all refs.
+
+Complex forward references
+--------------------------
+Record an edge from an obsolete commit to its replacement in this form:
+
+refs/obsoletes/<change_id>/obs<A>_<B>
+
+Pointing to commit <B> as an indication that B is the replacement for obsolete
+commit A.
+
+Pros:
+- Permits sharing and fetching refs for only a specific change.
+- Supports divergence
+- Protects <B> from being garbage collected.
+
+Cons:
+- Creates lots of refs, which is inefficient.
+- Doesn’t provide a good lookup structure for lookups in either direction.
+
+Backward references
+-------------------
+Record an edge from a replacement commit to the obsolete one in this form:
+
+refs/obsolescences/<B>
+
+Cons:
+- Doesn’t provide a way to resolve divergence (which is a P0 requirement).
+- Doesn’t protect <B> from being garbage collected (which could be fixed by
+  combining this with a refs/metas namespace, as in the metacommit variant).
+
+Obsolescences file
+------------------
+Create a custom file (or files) in .git recording obsolescences.
+
+Pros:
+- Can store exactly the information we want with exactly the performance we want
+  for all operations. For example, there could be a disk-based hashtable
+  permitting constant time lookups in either direction.
+
+Cons:
+- Handling GC, pushing, and pulling would all require custom solutions. GC
+  issues could be addressed with a repository format extension.
+
+Squash points
+-------------
+We treat changes like topic branches, and use special squash points to mark
+places in the commit graph that separate changes.
+
+We create and update change branches in refs/metas at the same time we
+would have in the metacommit proposal. However, rather than pointing to a
+metacommit branch they point to normal commits and are treated as “squash
+points” - markers for sequences of commits intended to be squashed together on
+submission.
+
+Amends and rebases work differently than they do now. Rather than actually
+containing the desired state of a commit, they contain a delta from the previous
+version along with a squash point indicating that the preceding changes are
+intended to be squashed on submission. Specifically, amends would become new
+changes and rebases would become merge commits with the old commit and new
+parent as parents.
+
+When the changes are finally submitted, the squashes are executed, producing the
+final version of the commit.
+
+In addition to the squash points, git would maintain a set of “nosquash” tags
+for commits that were used as ancestors of a change that are not meant to be
+included in the squash.
+
+For example, if we have this commit graph:
+
+A(...)
+B(parent=A)
+C(parent=B)
+
+...and we amend B to produce D, we’d get:
+
+A(...)
+B(parent=A)
+C(parent=B)
+D(parent=B)
+
+...along with a new change branch indicating D should be squashed with its
+parents when submitted:
+
+metas/changeB = D
+metas/changeC = C
+
+We’d also create a nosquash tag for A indicating that A shouldn’t be included
+when changeB is squashed.
+
+If a user amends the change again, they’d get:
+
+A(...)
+B(parent=A)
+C(parent=B)
+D(parent=B)
+E(parent=D)
+
+metas/changeB = E
+metas/changeC = C
+
+Pros:
+- Good GC behavior.
+- Provides a natural way to share changes (they’re just normal branches).
+- Merge-base works automatically without special cases.
+- Rewriting the obslog would be easy using existing git commands.
+- No new data types needed.
+Cons:
+- No way to connect the squashed version of a change to the original, so no way
+  to automatically clean up old changes. This also means users lose all benefits
+  of the evolve command if they prematurely squash their commits. This may occur
+  if a user thinks a change is ready for submission, squashes it, and then later
+  discovers an additional change to make.
+- Histories would look very cluttered (users would see all previous edits to
+  their commit in the commit log, and all previous rebases would show up as
+  merges). Could be quite hard for users to tell what is going on. (Possible
+  fix: also implement a new smart log feature that displays the log as though
+  the squashes had occurred).
+- Need to change the current behavior of current commands (like amend and
+  rebase) in ways that will be unexpected to many users.
-- 
gitgitgadget

