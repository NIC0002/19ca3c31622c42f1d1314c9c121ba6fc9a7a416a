Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAEBC77B75
	for <git@archiver.kernel.org>; Wed, 17 May 2023 21:49:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjEQVtK (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 17 May 2023 17:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbjEQVtE (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 17 May 2023 17:49:04 -0400
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A00646E9D
        for <git@vger.kernel.org>; Wed, 17 May 2023 14:48:59 -0700 (PDT)
Date:   Wed, 17 May 2023 21:48:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nullpo.dev;
        s=protonmail; t=1684360137; x=1684619337;
        bh=eQ3cVErhji08+tAd1xA7cvdEPdg6qTM7Hsu8Dbf1Qjs=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=TfYg5lryIL0ri7/jIQJL5fIG49TD46GjBBtoe+svnQZwnne4leP/n5QcDwuyft515
         Xj5rWnGH3/rmUZ+Q2L6ECpwBkuqBtq32WERQEYT5qfrGpu12xJt0D4k9zW6c5lg55h
         6WvX2y7DFex08w6w7rp0yEw3KanT5X3qy1wmt+8Qx8Ft+1Mbh8Ak02Zsp+BmEmdZZ2
         6PHpv0Ng6YuxXtg/eR4O0bgFKHQbPV87/W8VKAuHfe/lYOIVbkgPP+Tkjes1ykwb6T
         2YA73GLyIklei6tTzwVje5UeI5rIHTew1qaAnH+ikT+XLvqHTA0+ovXQVARcvvPAvV
         lAAxtdcwGF79Q==
To:     git@vger.kernel.org
From:   Jacob Abel <jacobabel@nullpo.dev>
Cc:     Jacob Abel <jacobabel@nullpo.dev>,
        =?utf-8?Q?=C3=86var_Arnfj=C3=B6r=C3=B0_Bjarmason?= 
        <avarab@gmail.com>, Eric Sunshine <sunshine@sunshineco.com>,
        Junio C Hamano <gitster@pobox.com>,
        Phillip Wood <phillip.wood123@gmail.com>,
        =?utf-8?Q?Rub=C3=A9n_Justo?= <rjusto@gmail.com>,
        Taylor Blau <me@ttaylorr.com>, rsbecker@nexbridge.com
Subject: [RESEND PATCH v10 6/8] worktree add: introduce "try --orphan" hint
Message-ID: <20230517214711.12467-7-jacobabel@nullpo.dev>
In-Reply-To: <20230517214711.12467-1-jacobabel@nullpo.dev>
References: <20230417093255.31079-1-jacobabel@nullpo.dev> <20230517214711.12467-1-jacobabel@nullpo.dev>
Feedback-ID: 21506737:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Add a new advice/hint in `git worktree add` for when the user
tries to create a new worktree from a reference that doesn't exist.

Current Behavior:

% git init foo
Initialized empty Git repository in /path/to/foo/
% touch file
% git -C foo commit -q -a -m "test commit"
% git -C foo switch --orphan norefbranch
% git -C foo worktree add newbranch/
Preparing worktree (new branch 'newbranch')
fatal: invalid reference: HEAD
%

New Behavior:

% git init --bare foo
Initialized empty Git repository in /path/to/foo/
% touch file
% git -C foo commit -q -a -m "test commit"
% git -C foo switch --orphan norefbranch
% git -C foo worktree add newbranch/
Preparing worktree (new branch 'newbranch')
hint: If you meant to create a worktree containing a new orphan branch
hint: (branch with no commits) for this repository, you can do so
hint: using the --orphan option:
hint:
hint:   git worktree add --orphan newbranch/
hint:
hint: Disable this message with "git config advice.worktreeAddOrphan false"
fatal: invalid reference: HEAD
% git -C foo worktree add -b newbranch2 new_wt/
Preparing worktree (new branch 'newbranch')
hint: If you meant to create a worktree containing a new orphan branch
hint: (branch with no commits) for this repository, you can do so
hint: using the --orphan option:
hint:
hint:   git worktree add --orphan -b newbranch2 new_wt/
hint:
hint: Disable this message with "git config advice.worktreeAddOrphan false"
fatal: invalid reference: HEAD
%

Signed-off-by: Jacob Abel <jacobabel@nullpo.dev>
---
 Documentation/config/advice.txt |  4 ++++
 advice.c                        |  1 +
 advice.h                        |  1 +
 builtin/worktree.c              | 26 +++++++++++++++++++++++
 t/t2400-worktree-add.sh         | 37 +++++++++++++++++++++++++++++++++
 5 files changed, 69 insertions(+)

diff --git a/Documentation/config/advice.txt b/Documentation/config/advice.=
txt
index c96b5b2e5d..c548a91e67 100644
--- a/Documentation/config/advice.txt
+++ b/Documentation/config/advice.txt
@@ -138,4 +138,8 @@ advice.*::
 =09=09checkout.
 =09diverging::
 =09=09Advice shown when a fast-forward is not possible.
+=09worktreeAddOrphan::
+=09=09Advice shown when a user tries to create a worktree from an
+=09=09invalid reference, to instruct how to create a new orphan
+=09=09branch instead.
 --
diff --git a/advice.c b/advice.c
index d6232439c3..e5a9bb9b44 100644
--- a/advice.c
+++ b/advice.c
@@ -78,6 +78,7 @@ static struct {
 =09[ADVICE_SUBMODULES_NOT_UPDATED] =09=09=3D { "submodulesNotUpdated", 1 }=
,
 =09[ADVICE_UPDATE_SPARSE_PATH]=09=09=09=3D { "updateSparsePath", 1 },
 =09[ADVICE_WAITING_FOR_EDITOR]=09=09=09=3D { "waitingForEditor", 1 },
+=09[ADVICE_WORKTREE_ADD_ORPHAN]=09=09=09=3D { "worktreeAddOrphan", 1 },
 };
=20
 static const char turn_off_instructions[] =3D
diff --git a/advice.h b/advice.h
index 0f584163f5..2affbe1426 100644
--- a/advice.h
+++ b/advice.h
@@ -49,6 +49,7 @@ struct string_list;
 =09ADVICE_UPDATE_SPARSE_PATH,
 =09ADVICE_WAITING_FOR_EDITOR,
 =09ADVICE_SKIPPED_CHERRY_PICKS,
+=09ADVICE_WORKTREE_ADD_ORPHAN,
 };
=20
 int git_default_advice_config(const char *var, const char *value);
diff --git a/builtin/worktree.c b/builtin/worktree.c
index 48de7fc3b0..15bdb380c7 100644
--- a/builtin/worktree.c
+++ b/builtin/worktree.c
@@ -1,5 +1,6 @@
 #include "cache.h"
 #include "abspath.h"
+#include "advice.h"
 #include "checkout.h"
 #include "config.h"
 #include "builtin.h"
@@ -39,6 +40,20 @@
 #define BUILTIN_WORKTREE_UNLOCK_USAGE \
 =09N_("git worktree unlock <worktree>")
=20
+#define WORKTREE_ADD_ORPHAN_WITH_DASH_B_HINT_TEXT \
+=09_("If you meant to create a worktree containing a new orphan branch\n" =
\
+=09"(branch with no commits) for this repository, you can do so\n" \
+=09"using the --orphan flag:\n" \
+=09"\n" \
+=09"=09git worktree add --orphan -b %s %s\n")
+
+#define WORKTREE_ADD_ORPHAN_NO_DASH_B_HINT_TEXT \
+=09_("If you meant to create a worktree containing a new orphan branch\n" =
\
+=09"(branch with no commits) for this repository, you can do so\n" \
+=09"using the --orphan flag:\n" \
+=09"\n" \
+=09"=09git worktree add --orphan %s\n")
+
 static const char * const git_worktree_usage[] =3D {
 =09BUILTIN_WORKTREE_ADD_USAGE,
 =09BUILTIN_WORKTREE_LIST_USAGE,
@@ -634,6 +649,7 @@ static int add(int ac, const char **av, const char *pre=
fix)
 =09const char *opt_track =3D NULL;
 =09const char *lock_reason =3D NULL;
 =09int keep_locked =3D 0;
+=09int used_new_branch_options;
 =09struct option options[] =3D {
 =09=09OPT__FORCE(&opts.force,
 =09=09=09   N_("checkout <branch> even if already checked out in other wor=
ktree"),
@@ -686,6 +702,7 @@ static int add(int ac, const char **av, const char *pre=
fix)
=20
 =09path =3D prefix_filename(prefix, av[0]);
 =09branch =3D ac < 2 ? "HEAD" : av[1];
+=09used_new_branch_options =3D new_branch || new_branch_force;
=20
 =09if (!strcmp(branch, "-"))
 =09=09branch =3D "@{-1}";
@@ -728,6 +745,15 @@ static int add(int ac, const char **av, const char *pr=
efix)
 =09}
=20
 =09if (!opts.orphan && !lookup_commit_reference_by_name(branch)) {
+=09=09int attempt_hint =3D !opts.quiet && (ac < 2);
+=09=09if (attempt_hint && used_new_branch_options) {
+=09=09=09advise_if_enabled(ADVICE_WORKTREE_ADD_ORPHAN,
+=09=09=09=09WORKTREE_ADD_ORPHAN_WITH_DASH_B_HINT_TEXT,
+=09=09=09=09new_branch, path);
+=09=09} else if (attempt_hint) {
+=09=09=09advise_if_enabled(ADVICE_WORKTREE_ADD_ORPHAN,
+=09=09=09=09WORKTREE_ADD_ORPHAN_NO_DASH_B_HINT_TEXT, path);
+=09=09}
 =09=09die(_("invalid reference: %s"), branch);
 =09}
=20
diff --git a/t/t2400-worktree-add.sh b/t/t2400-worktree-add.sh
index fba90582b6..46eef26179 100755
--- a/t/t2400-worktree-add.sh
+++ b/t/t2400-worktree-add.sh
@@ -401,6 +401,43 @@ test_expect_success '"add" worktree with orphan branch=
, lock, and reason' '
 =09test_cmp expect .git/worktrees/orphan-with-lock-reason/locked
 '
=20
+# Note: Quoted arguments containing spaces are not supported.
+test_wt_add_orphan_hint () {
+=09local context=3D"$1" &&
+=09local use_branch=3D$2 &&
+=09shift 2 &&
+=09local opts=3D"$*" &&
+=09test_expect_success "'worktree add' show orphan hint in bad/orphan HEAD=
 w/ $context" '
+=09=09test_when_finished "rm -rf repo" &&
+=09=09git init repo &&
+=09=09(cd repo && test_commit commit) &&
+=09=09git -C repo switch --orphan noref &&
+=09=09test_must_fail git -C repo worktree add $opts foobar/ 2>actual &&
+=09=09! grep "error: unknown switch" actual &&
+=09=09grep "hint: If you meant to create a worktree containing a new orpha=
n branch" actual &&
+=09=09if [ $use_branch -eq 1 ]
+=09=09then
+=09=09=09grep -E "^hint:\s+git worktree add --orphan -b \S+ \S+\s*$" actua=
l
+=09=09else
+=09=09=09grep -E "^hint:\s+git worktree add --orphan \S+\s*$" actual
+=09=09fi
+
+=09'
+}
+
+test_wt_add_orphan_hint 'no opts' 0
+test_wt_add_orphan_hint '-b' 1 -b foobar_branch
+test_wt_add_orphan_hint '-B' 1 -B foobar_branch
+
+test_expect_success "'worktree add' doesn't show orphan hint in bad/orphan=
 HEAD w/ --quiet" '
+=09test_when_finished "rm -rf repo" &&
+=09git init repo &&
+=09(cd repo && test_commit commit) &&
+=09test_must_fail git -C repo worktree add --quiet foobar_branch foobar/ 2=
>actual &&
+=09! grep "error: unknown switch" actual &&
+=09! grep "hint: If you meant to create a worktree containing a new orphan=
 branch" actual
+'
+
 test_expect_success 'local clone from linked checkout' '
 =09git clone --local here here-clone &&
 =09( cd here-clone && git fsck )
--=20
2.39.3


