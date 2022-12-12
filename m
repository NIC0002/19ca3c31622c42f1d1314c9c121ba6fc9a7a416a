Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63EE4C4332F
	for <git@archiver.kernel.org>; Mon, 12 Dec 2022 01:42:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbiLLBmv (ORCPT <rfc822;git@archiver.kernel.org>);
        Sun, 11 Dec 2022 20:42:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231164AbiLLBmt (ORCPT <rfc822;git@vger.kernel.org>);
        Sun, 11 Dec 2022 20:42:49 -0500
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 384ACB6B
        for <git@vger.kernel.org>; Sun, 11 Dec 2022 17:42:46 -0800 (PST)
Date:   Mon, 12 Dec 2022 01:42:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nullpo.dev;
        s=protonmail3; t=1670809365; x=1671068565;
        bh=TTo+Di8KQrZM5P7+M2iSKjsrr5m8DWSSfXX8aArDmhg=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=N5EyRTFIhlQgIXis9xLb3giOSWJIov2AFA2ONaf6t48jQAMotZhDYB9X4mhLWkczA
         dXeQ8xUvEk8maHHfjqR7ec4P/BwZRC/uqHEheHV/F+AQnJYEUn9nJysZXm7H57H9z+
         Yj02CyNVtksDNpyYmWqa8F6HMXmPhelBSF8Eqro+3srKrjZFRFYJPCxfduvYD6esmb
         eQlcUDv/awB9Hz9v5hj271uKzmuyMuQe1/15TLe9Eh8/rbwcn9M6t3pZfsn0iTINJ3
         HIl/EncchKEXOagWqE1vDdcx2D0jBZaH5CW9TWebi35+Ao0AZ4kONMZ+ZF0XxEKXHN
         ThuL0IAKZOURQ==
To:     git@vger.kernel.org
From:   Jacob Abel <jacobabel@nullpo.dev>
Cc:     Jacob Abel <jacobabel@nullpo.dev>,
        =?utf-8?Q?=C3=86var_Arnfj=C3=B6r=C3=B0_Bjarmason?= 
        <avarab@gmail.com>, Eric Sunshine <sunshine@sunshineco.com>,
        Phillip Wood <phillip.wood123@gmail.com>,
        =?utf-8?Q?Rub=C3=A9n_Justo?= <rjusto@gmail.com>,
        Taylor Blau <me@ttaylorr.com>, rsbecker@nexbridge.com
Subject: [PATCH v4 2/3] worktree add: add --orphan flag
Message-ID: <20221212014003.20290-3-jacobabel@nullpo.dev>
In-Reply-To: <20221212014003.20290-1-jacobabel@nullpo.dev>
References: <20221104010242.11555-1-jacobabel@nullpo.dev> <20221104213401.17393-1-jacobabel@nullpo.dev> <20221110233137.10414-1-jacobabel@nullpo.dev> <20221212014003.20290-1-jacobabel@nullpo.dev>
Feedback-ID: 21506737:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Adds support for creating an orphan branch when adding a new worktree.
This functionality is equivalent to git switch's --orphan flag.

The original reason this feature was implemented was to allow a user
to initialise a new repository using solely the worktree oriented
workflow.

Current Behavior:

% git init --bare foo.git
Initialized empty Git repository in /path/to/foo.git/
% git -C foo.git worktree add main/
Preparing worktree (new branch 'main')
fatal: not a valid object name: 'HEAD'
%

New Behavior:

% git init --bare foo.git
Initialized empty Git repository in /path/to/foo.git/
% git -C foo.git worktree add --orphan main main/
Preparing worktree (new branch 'main')
%

Signed-off-by: Jacob Abel <jacobabel@nullpo.dev>
Signed-off-by: =C3=86var Arnfj=C3=B6r=C3=B0 Bjarmason <avarab@gmail.com>
---
 Documentation/git-worktree.txt | 15 +++++++
 builtin/worktree.c             | 73 +++++++++++++++++++++++++++++----
 t/t2400-worktree-add.sh        | 74 +++++++++++++++++++++++++++++-----
 3 files changed, 145 insertions(+), 17 deletions(-)

diff --git a/Documentation/git-worktree.txt b/Documentation/git-worktree.tx=
t
index 4dd658012b..c6e6899d8b 100644
--- a/Documentation/git-worktree.txt
+++ b/Documentation/git-worktree.txt
@@ -11,6 +11,8 @@ SYNOPSIS
 [verse]
 'git worktree add' [-f] [--detach] [--checkout] [--lock [--reason <string>=
]]
 =09=09   [[-b | -B] <new-branch>] <path> [<commit-ish>]
+'git worktree add' [-f] [--lock [--reason <string>]]
+=09=09   --orphan <new-branch> <path>
 'git worktree list' [-v | --porcelain [-z]]
 'git worktree lock' [--reason <string>] <worktree>
 'git worktree move' <worktree> <new-path>
@@ -95,6 +97,15 @@ exist, a new branch based on `HEAD` is automatically cre=
ated as if
 `-b <branch>` was given.  If `<branch>` does exist, it will be checked out
 in the new worktree, if it's not checked out anywhere else, otherwise the
 command will refuse to create the worktree (unless `--force` is used).
++
+------------
+$ git worktree add --orphan <branch> <path>
+------------
++
+Create a worktree containing no files, with an empty index, and associated
+with a new orphan branch named `<branch>`. The first commit made on this n=
ew
+branch will have no parents and will be the root of a new history disconne=
cted
+from any other branches.

 list::

@@ -222,6 +233,10 @@ This can also be set up as the default behaviour by us=
ing the
 =09With `prune`, do not remove anything; just report what it would
 =09remove.

+--orphan <new-branch>::
+=09With `add`, make the new worktree and index empty, associating
+=09the worktree with a new orphan branch named `<new-branch>`.
+
 --porcelain::
 =09With `list`, output in an easy-to-parse format for scripts.
 =09This format will remain stable across Git versions and regardless of us=
er
diff --git a/builtin/worktree.c b/builtin/worktree.c
index fccb17f070..51b247b2a7 100644
--- a/builtin/worktree.c
+++ b/builtin/worktree.c
@@ -17,7 +17,10 @@

 #define BUILTIN_WORKTREE_ADD_USAGE \
 =09N_("git worktree add [-f] [--detach] [--checkout] [--lock [--reason <st=
ring>]]\n" \
-=09   "                 [[-b | -B] <new-branch>] <path> [<commit-ish>]")
+=09   "                 [[-b | -B] <new-branch>] <path> [<commit-ish>]"), =
\
+=09N_("git worktree add [-f] [--lock [--reason <string>]]\n" \
+=09   "                 --orphan <new-branch> <path>")
+
 #define BUILTIN_WORKTREE_LIST_USAGE \
 =09N_("git worktree list [-v | --porcelain [-z]]")
 #define BUILTIN_WORKTREE_LOCK_USAGE \
@@ -90,6 +93,7 @@ struct add_opts {
 =09int detach;
 =09int quiet;
 =09int checkout;
+=09int orphan;
 =09const char *keep_locked;
 };

@@ -364,6 +368,24 @@ static int checkout_worktree(const struct add_opts *op=
ts,
 =09return run_command(&cp);
 }

+static int make_worktree_orphan(const char * ref, const struct add_opts *o=
pts,
+=09=09=09=09struct strvec *child_env)
+{
+=09int ret;
+=09struct strbuf symref =3D STRBUF_INIT;
+=09struct child_process cp =3D CHILD_PROCESS_INIT;
+=09cp.git_cmd =3D 1;
+
+=09validate_new_branchname(ref, &symref, 0);
+=09strvec_pushl(&cp.args, "symbolic-ref", "HEAD", symref.buf, NULL);
+=09if (opts->quiet)
+=09=09strvec_push(&cp.args, "--quiet");
+=09strvec_pushv(&cp.env, child_env->v);
+=09ret =3D run_command(&cp);
+=09strbuf_release(&symref);
+=09return ret;
+}
+
 static int add_worktree(const char *path, const char *refname,
 =09=09=09const struct add_opts *opts)
 {
@@ -393,8 +415,9 @@ static int add_worktree(const char *path, const char *r=
efname,
 =09=09=09die_if_checked_out(symref.buf, 0);
 =09}
 =09commit =3D lookup_commit_reference_by_name(refname);
-=09if (!commit)
+=09if (!commit && !opts->orphan) {
 =09=09die(_("invalid reference: %s"), refname);
+=09}

 =09name =3D worktree_basename(path, &len);
 =09strbuf_add(&sb, name, path + len - name);
@@ -482,10 +505,10 @@ static int add_worktree(const char *path, const char =
*refname,
 =09strvec_pushf(&child_env, "%s=3D%s", GIT_WORK_TREE_ENVIRONMENT, path);
 =09cp.git_cmd =3D 1;

-=09if (!is_branch)
+=09if (!is_branch && commit) {
 =09=09strvec_pushl(&cp.args, "update-ref", "HEAD",
 =09=09=09     oid_to_hex(&commit->object.oid), NULL);
-=09else {
+=09} else {
 =09=09strvec_pushl(&cp.args, "symbolic-ref", "HEAD",
 =09=09=09     symref.buf, NULL);
 =09=09if (opts->quiet)
@@ -497,6 +520,10 @@ static int add_worktree(const char *path, const char *=
refname,
 =09if (ret)
 =09=09goto done;

+=09if (opts->orphan &&
+=09    (ret =3D make_worktree_orphan(refname, opts, &child_env)))
+=09=09goto done;
+
 =09if (opts->checkout &&
 =09    (ret =3D checkout_worktree(opts, &child_env)))
 =09=09goto done;
@@ -516,7 +543,7 @@ static int add_worktree(const char *path, const char *r=
efname,
 =09 * Hook failure does not warrant worktree deletion, so run hook after
 =09 * is_junk is cleared, but do return appropriate code when hook fails.
 =09 */
-=09if (!ret && opts->checkout) {
+=09if (!ret && opts->checkout && !opts->orphan) {
 =09=09struct run_hooks_opt opt =3D RUN_HOOKS_OPT_INIT;

 =09=09strvec_pushl(&opt.env, "GIT_DIR", "GIT_WORK_TREE", NULL);
@@ -605,6 +632,7 @@ static int add(int ac, const char **av, const char *pre=
fix)
 =09char *path;
 =09const char *branch;
 =09const char *new_branch =3D NULL;
+=09const char *orphan_branch =3D NULL;
 =09const char *opt_track =3D NULL;
 =09const char *lock_reason =3D NULL;
 =09int keep_locked =3D 0;
@@ -616,6 +644,8 @@ static int add(int ac, const char **av, const char *pre=
fix)
 =09=09=09   N_("create a new branch")),
 =09=09OPT_STRING('B', NULL, &new_branch_force, N_("branch"),
 =09=09=09   N_("create or reset a branch")),
+=09=09OPT_STRING(0, "orphan", &orphan_branch, N_("branch"),
+=09=09=09   N_("new unparented branch")),
 =09=09OPT_BOOL('d', "detach", &opts.detach, N_("detach HEAD at named commi=
t")),
 =09=09OPT_BOOL(0, "checkout", &opts.checkout, N_("populate the new working=
 tree")),
 =09=09OPT_BOOL(0, "lock", &keep_locked, N_("keep the new working tree lock=
ed")),
@@ -633,8 +663,20 @@ static int add(int ac, const char **av, const char *pr=
efix)
 =09memset(&opts, 0, sizeof(opts));
 =09opts.checkout =3D 1;
 =09ac =3D parse_options(ac, av, prefix, options, git_worktree_add_usage, 0=
);
+=09opts.orphan =3D !!orphan_branch;
 =09if (!!opts.detach + !!new_branch + !!new_branch_force > 1)
 =09=09die(_("options '%s', '%s', and '%s' cannot be used together"), "-b",=
 "-B", "--detach");
+=09if (!!opts.detach + !!opts.orphan + !!new_branch + !!new_branch_force >=
 1)
+=09=09die(_("options '%s', '%s', '%s', and '%s' cannot be used together"),
+=09=09    "-b", "-B", "--orphan", "--detach");
+=09if (opts.orphan && opt_track)
+=09=09die(_("'%s' and '%s' cannot be used together"), "--orphan", "--track=
");
+=09if (opts.orphan && !opts.checkout)
+=09=09die(_("'%s' and '%s' cannot be used together"), "--orphan",
+=09=09    "--no-checkout");
+=09if (opts.orphan && ac =3D=3D 2)
+=09=09die(_("'%s' and '%s' cannot be used together"), "--orphan",
+=09=09    _("<commit-ish>"));
 =09if (lock_reason && !keep_locked)
 =09=09die(_("the option '%s' requires '%s'"), "--reason", "--lock");
 =09if (lock_reason)
@@ -651,6 +693,13 @@ static int add(int ac, const char **av, const char *pr=
efix)
 =09if (!strcmp(branch, "-"))
 =09=09branch =3D "@{-1}";

+=09/*
+=09 * When creating a new branch, new_branch now contains the branch to
+=09 * create.
+=09 *
+=09 * Past this point, new_branch_force can be treated solely as a
+=09 * boolean flag to indicate whether `-B` was selected.
+=09 */
 =09if (new_branch_force) {
 =09=09struct strbuf symref =3D STRBUF_INIT;

@@ -663,7 +712,9 @@ static int add(int ac, const char **av, const char *pre=
fix)
 =09=09strbuf_release(&symref);
 =09}

-=09if (ac < 2 && !new_branch && !opts.detach) {
+=09if (opts.orphan) {
+=09=09new_branch =3D orphan_branch;
+=09} else if (ac < 2 && !new_branch && !opts.detach) {
 =09=09const char *s =3D dwim_branch(path, &new_branch);
 =09=09if (s)
 =09=09=09branch =3D s;
@@ -686,7 +737,15 @@ static int add(int ac, const char **av, const char *pr=
efix)
 =09if (!opts.quiet)
 =09=09print_preparing_worktree_line(opts.detach, branch, new_branch, !!new=
_branch_force);

-=09if (new_branch) {
+=09if (opts.orphan) {
+=09=09branch =3D new_branch;
+=09} else if (!lookup_commit_reference_by_name(branch)) {
+=09=09/*
+=09=09 * If `branch` does not reference a valid commit, a new
+=09=09 * worktree (and/or branch) cannot be created based off of it.
+=09=09 */
+=09=09die(_("invalid reference: %s"), branch);
+=09} else if (new_branch) {
 =09=09struct child_process cp =3D CHILD_PROCESS_INIT;
 =09=09cp.git_cmd =3D 1;
 =09=09strvec_push(&cp.args, "branch");
diff --git a/t/t2400-worktree-add.sh b/t/t2400-worktree-add.sh
index d587e0b20d..6118ace92d 100755
--- a/t/t2400-worktree-add.sh
+++ b/t/t2400-worktree-add.sh
@@ -298,17 +298,23 @@ test_expect_success '"add" no auto-vivify with --deta=
ch and <branch> omitted' '
 =09test_must_fail git -C mish/mash symbolic-ref HEAD
 '

-test_expect_success '"add" -b/-B mutually exclusive' '
-=09test_must_fail git worktree add -b poodle -B poodle bamboo main
-'
-
-test_expect_success '"add" -b/--detach mutually exclusive' '
-=09test_must_fail git worktree add -b poodle --detach bamboo main
-'
+# Helper function to test mutually exclusive options.
+test_wt_add_excl() {
+=09local opts=3D"$@" &&
+=09test_expect_success "'worktree add' with '$opts' has mutually exclusive=
 options" '
+=09=09test_must_fail git worktree add $opts
+=09'
+}

-test_expect_success '"add" -B/--detach mutually exclusive' '
-=09test_must_fail git worktree add -B poodle --detach bamboo main
-'
+test_wt_add_excl -b poodle -B poodle bamboo main
+test_wt_add_excl -b poodle --orphan poodle bamboo
+test_wt_add_excl -b poodle --detach bamboo main
+test_wt_add_excl -B poodle --detach bamboo main
+test_wt_add_excl -B poodle --detach bamboo main
+test_wt_add_excl -B poodle --orphan poodle bamboo
+test_wt_add_excl --orphan poodle --detach bamboo
+test_wt_add_excl --orphan poodle --no-checkout bamboo
+test_wt_add_excl --orphan poodle bamboo main

 test_expect_success '"add -B" fails if the branch is checked out' '
 =09git rev-parse newmain >before &&
@@ -330,6 +336,46 @@ test_expect_success 'add --quiet' '
 =09test_must_be_empty actual
 '

+test_expect_success '"add --orphan"' '
+=09test_when_finished "git worktree remove -f -f orphandir" &&
+=09git worktree add --orphan neworphan orphandir &&
+=09echo refs/heads/neworphan >expected &&
+=09git -C orphandir symbolic-ref HEAD >actual &&
+=09test_cmp expected actual
+'
+
+test_expect_success '"add --orphan" fails if the branch already exists' '
+=09test_when_finished "git branch -D existingbranch" &&
+=09test_when_finished "git worktree remove -f -f orphandir" &&
+=09git worktree add -b existingbranch orphandir main &&
+=09test_must_fail git worktree add --orphan existingbranch orphandir2 &&
+=09test_path_is_missing orphandir2
+'
+
+test_expect_success '"add --orphan" with empty repository' '
+=09test_when_finished "rm -rf empty_repo" &&
+=09echo refs/heads/newbranch >expected &&
+=09GIT_DIR=3D"empty_repo" git init --bare &&
+=09git -C empty_repo  worktree add --orphan newbranch worktreedir &&
+=09git -C empty_repo/worktreedir symbolic-ref HEAD >actual &&
+=09test_cmp expected actual
+'
+
+test_expect_success '"add" worktree with orphan branch and lock' '
+=09git worktree add --lock --orphan orphanbr orphan-with-lock &&
+=09test_when_finished "git worktree unlock orphan-with-lock || :" &&
+=09test -f .git/worktrees/orphan-with-lock/locked
+'
+
+test_expect_success '"add" worktree with orphan branch, lock, and reason' =
'
+=09lock_reason=3D"why not" &&
+=09git worktree add --detach --lock --reason "$lock_reason" orphan-with-lo=
ck-reason main &&
+=09test_when_finished "git worktree unlock orphan-with-lock-reason || :" &=
&
+=09test -f .git/worktrees/orphan-with-lock-reason/locked &&
+=09echo "$lock_reason" >expect &&
+=09test_cmp expect .git/worktrees/orphan-with-lock-reason/locked
+'
+
 test_expect_success 'local clone from linked checkout' '
 =09git clone --local here here-clone &&
 =09( cd here-clone && git fsck )
@@ -446,6 +492,14 @@ setup_remote_repo () {
 =09)
 }

+test_expect_success '"add" <path> <remote/branch> w/ no HEAD' '
+=09test_when_finished rm -rf repo_upstream repo_local foo &&
+=09setup_remote_repo repo_upstream repo_local &&
+=09git -C repo_local config --bool core.bare true &&
+=09git -C repo_local branch -D main &&
+=09git -C repo_local worktree add ./foo repo_upstream/foo
+'
+
 test_expect_success '--no-track avoids setting up tracking' '
 =09test_when_finished rm -rf repo_upstream repo_local foo &&
 =09setup_remote_repo repo_upstream repo_local &&
--
2.37.4


