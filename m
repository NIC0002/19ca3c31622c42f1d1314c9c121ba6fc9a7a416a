Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C36C61DA4
	for <git@archiver.kernel.org>; Sun,  5 Mar 2023 05:08:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjCEFIT (ORCPT <rfc822;git@archiver.kernel.org>);
        Sun, 5 Mar 2023 00:08:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjCEFIM (ORCPT <rfc822;git@vger.kernel.org>);
        Sun, 5 Mar 2023 00:08:12 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F576BB98
        for <git@vger.kernel.org>; Sat,  4 Mar 2023 21:08:10 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id d10so3669558pgt.12
        for <git@vger.kernel.org>; Sat, 04 Mar 2023 21:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677992889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YaEO+1pM3TW8bKnmcw95TnArBKyuztctYd07gt3Pmvc=;
        b=YiyUaSrHGDTDVk7qssT/ux0egXBjOF9ckI100+3C9ni81gXOF/tusnhbklGsLQdCvo
         gbCTkYwwZc2TEXkcD/1Xqv8/S9+Feu7V+WQZ/LuvFUBD2FzeaV5OAnGJ9FOH9DmQhqxD
         MomjLF2cmjG0f+xMywazM4b6Tni+FSB9OrG0wIVCsoWZdTloZ4Y7dJR7r0nKLGxqRxMg
         byZ/FtRDAw+uoUAtcJ3yawdm/O93wG3w/DytaWr6tLn/3TKgMZJVmTmv5rqaaabhKJOl
         uOahRY7wAEzNJWLG7wLECRrtirAqexTfZc4jpcKgmlEvKV2pdjDbksgbjSp8vyFv8Hfu
         oQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677992889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaEO+1pM3TW8bKnmcw95TnArBKyuztctYd07gt3Pmvc=;
        b=czfPKuvaWXWTFHly78aye+e6l0N8JAeqxxunCh2aaE7Wqyh3rEHgeuSN996lSRY78U
         l32eyYyrBlWRlu9JWrShthkcuaHFo3ll0hK8ats3pC+Zd4tI/8avAmEUuOVjEYlLPCk7
         ukOLQFqU7lLLvKRwn3GU+dNRnQ8hKw1BUAdCMjXsZkbN7FILabdNFWIupa3GQcgTwq4+
         DI12sl5N7Q9S7Iorxo/NImYwQqvToEZlbPjLhK93wZgBdVx9iWbnwRFngC1ldiIB6AWZ
         S7JL/a7Op2GV+SF117jBnak2mfrsSv09oWB8b32yh5yKnsvvScdliiofQ6P0CUuP52J1
         nr4g==
X-Gm-Message-State: AO0yUKV2vl34JJK4UAJZ/nq0+d4aJf5lL1GN1871LIjuENf3whNkTUc4
        p8czguEhFXyaNvnzKPCPBwDt8yoic1Q9vQ==
X-Google-Smtp-Source: AK7set+/zR4m4WSh/kv67D+I5tsPWjnw20ICWvbyZ5oauc9D/ZUuebmlSoUBDGFHfiuvTFqghB+mLQ==
X-Received: by 2002:aa7:9f4e:0:b0:5aa:6597:507b with SMTP id h14-20020aa79f4e000000b005aa6597507bmr6775650pfr.12.1677992888715;
        Sat, 04 Mar 2023 21:08:08 -0800 (PST)
Received: from xavier.lan ([2607:fa18:92fe:92b::2a2])
        by smtp.gmail.com with ESMTPSA id v6-20020aa78506000000b005dd975176c3sm3996769pfn.53.2023.03.04.21.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 21:08:08 -0800 (PST)
From:   Alex Henrie <alexhenrie24@gmail.com>
To:     git@vger.kernel.org, tao@klerks.biz, gitster@pobox.com,
        newren@gmail.com, phillip.wood123@gmail.com,
        Johannes.Schindelin@gmx.de, sorganov@gmail.com,
        chooglen@google.com, calvinwan@google.com, jonathantanmy@google.com
Cc:     Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH v6 3/3] rebase: add a config option for --rebase-merges
Date:   Sat,  4 Mar 2023 22:07:09 -0700
Message-Id: <20230305050709.68736-4-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230305050709.68736-1-alexhenrie24@gmail.com>
References: <20230225180325.796624-1-alexhenrie24@gmail.com>
 <20230305050709.68736-1-alexhenrie24@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

The purpose of the new option is to accommodate users who would like
--rebase-merges to be on by default and to facilitate turning on
--rebase-merges by default without configuration in a future version of
Git.

Name the new option rebase.rebaseMerges, even though it is a little
redundant, for consistency with the name of the command line option and
to be clear when scrolling through values in the [rebase] section of
.gitconfig.

In the future, the default rebase-merges mode may change from
no-rebase-cousins to rebase-cousins. Support setting rebase.rebaseMerges
to the nonspecific value "true" for users who do not need or want to
care about the default changing in the future. Similarly, for users who
have --rebase-merges in an alias and want to get the future behavior
now, use the specific rebase-merges mode from the config if a specific
mode is not given on the command line.

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 Documentation/config/rebase.txt        | 11 ++++
 Documentation/git-rebase.txt           | 17 +++---
 builtin/rebase.c                       | 79 ++++++++++++++++++--------
 t/t3422-rebase-incompatible-options.sh | 17 ++++++
 t/t3430-rebase-merges.sh               | 68 ++++++++++++++++++++++
 5 files changed, 161 insertions(+), 31 deletions(-)

diff --git a/Documentation/config/rebase.txt b/Documentation/config/rebase.txt
index f19bd0e040..f7d3218b1d 100644
--- a/Documentation/config/rebase.txt
+++ b/Documentation/config/rebase.txt
@@ -67,3 +67,14 @@ rebase.rescheduleFailedExec::
 
 rebase.forkPoint::
 	If set to false set `--no-fork-point` option by default.
+
+rebase.rebaseMerges::
+	Whether and how to set the `--rebase-merges` option by default. Can
+	be `rebase-cousins`, `no-rebase-cousins`, or a boolean. Setting to
+	true is equivalent to `--rebase-merges` without an argument, setting to
+	`rebase-cousins` or `no-rebase-cousins` is equivalent to
+	`--rebase-merges` with that value as its argument, and setting to false
+	is equivalent to `--no-rebase-merges`. Passing `--rebase-merges` on the
+	command line without an argument overrides a `rebase.rebaseMerges=false`
+	configuration, but the absence of a specific rebase-merges mode on the
+	command line does not counteract a specific mode set in the configuration.
diff --git a/Documentation/git-rebase.txt b/Documentation/git-rebase.txt
index 4e57a87624..6ec86c9c6e 100644
--- a/Documentation/git-rebase.txt
+++ b/Documentation/git-rebase.txt
@@ -537,16 +537,17 @@ See also INCOMPATIBLE OPTIONS below.
 	by recreating the merge commits. Any resolved merge conflicts or
 	manual amendments in these merge commits will have to be
 	resolved/re-applied manually. `--no-rebase-merges` can be used to
-	countermand a previous `--rebase-merges`.
+	countermand both the `rebase.rebaseMerges` config option and a previous
+	`--rebase-merges`.
 +
 When rebasing merges, there are two modes: `rebase-cousins` and
-`no-rebase-cousins`. If the mode is not specified, it defaults to
-`no-rebase-cousins`. In `no-rebase-cousins` mode, commits which do not have
-`<upstream>` as direct ancestor will keep their original branch point, i.e.
-commits that would be excluded by linkgit:git-log[1]'s `--ancestry-path`
-option will keep their original ancestry by default. In `rebase-cousins` mode,
-such commits are instead rebased onto `<upstream>` (or `<onto>`, if
-specified).
+`no-rebase-cousins`. If the mode is not specified on the command line or in
+the `rebase.rebaseMerges` config option, it defaults to `no-rebase-cousins`.
+In `no-rebase-cousins` mode, commits which do not have `<upstream>` as direct
+ancestor will keep their original branch point, i.e. commits that would be
+excluded by linkgit:git-log[1]'s `--ancestry-path` option will keep their
+original ancestry by default. In `rebase-cousins` mode, such commits are
+instead rebased onto `<upstream>` (or `<onto>`, if specified).
 +
 It is currently only possible to recreate the merge commits using the
 `ort` merge strategy; different merge strategies can be used only via
diff --git a/builtin/rebase.c b/builtin/rebase.c
index c36ddc0050..04f815e3d0 100644
--- a/builtin/rebase.c
+++ b/builtin/rebase.c
@@ -123,6 +123,7 @@ struct rebase_options {
 	int fork_point;
 	int update_refs;
 	int config_autosquash;
+	int config_rebase_merges;
 	int config_update_refs;
 };
 
@@ -140,6 +141,8 @@ struct rebase_options {
 		.allow_empty_message = 1,               \
 		.autosquash = -1,                       \
 		.config_autosquash = -1,                \
+		.rebase_merges = -1,                    \
+		.config_rebase_merges = -1,             \
 		.update_refs = -1,                      \
 		.config_update_refs = -1,               \
 	}
@@ -771,6 +774,16 @@ static int run_specific_rebase(struct rebase_options *opts)
 	return status ? -1 : 0;
 }
 
+static void parse_rebase_merges_value(struct rebase_options *options, const char *value)
+{
+	if (!strcmp("no-rebase-cousins", value))
+		options->rebase_cousins = 0;
+	else if (!strcmp("rebase-cousins", value))
+		options->rebase_cousins = 1;
+	else
+		die(_("Unknown rebase-merges mode: %s"), value);
+}
+
 static int rebase_config(const char *var, const char *value, void *data)
 {
 	struct rebase_options *opts = data;
@@ -800,6 +813,15 @@ static int rebase_config(const char *var, const char *value, void *data)
 		return 0;
 	}
 
+	if (!strcmp(var, "rebase.rebasemerges")) {
+		opts->config_rebase_merges = git_parse_maybe_bool(value);
+		if (opts->config_rebase_merges < 0) {
+			opts->config_rebase_merges = 1;
+			parse_rebase_merges_value(opts, value);
+		}
+		return 0;
+	}
+
 	if (!strcmp(var, "rebase.updaterefs")) {
 		opts->config_update_refs = git_config_bool(var, value);
 		return 0;
@@ -980,6 +1002,27 @@ static int parse_opt_empty(const struct option *opt, const char *arg, int unset)
 	return 0;
 }
 
+static int parse_opt_rebase_merges(const struct option *opt, const char *arg, int unset)
+{
+	struct rebase_options *options = opt->value;
+
+	options->rebase_merges = !unset;
+
+	if (arg) {
+		if (!*arg) {
+			warning(_("--rebase-merges with an empty string "
+				  "argument is deprecated and will stop "
+				  "working in a future version of Git. Use "
+				  "--rebase-merges without an argument "
+				  "instead, which does the same thing."));
+			return 0;
+		}
+		parse_rebase_merges_value(options, arg);
+	}
+
+	return 0;
+}
+
 static void NORETURN error_on_missing_default_upstream(void)
 {
 	struct branch *current_branch = branch_get(NULL);
@@ -1035,7 +1078,6 @@ int cmd_rebase(int argc, const char **argv, const char *prefix)
 	struct object_id branch_base;
 	int ignore_whitespace = 0;
 	const char *gpg_sign = NULL;
-	const char *rebase_merges = NULL;
 	struct string_list strategy_options = STRING_LIST_INIT_NODUP;
 	struct object_id squash_onto;
 	char *squash_onto_name = NULL;
@@ -1137,10 +1179,9 @@ int cmd_rebase(int argc, const char **argv, const char *prefix)
 			   &options.allow_empty_message,
 			   N_("allow rebasing commits with empty messages"),
 			   PARSE_OPT_HIDDEN),
-		{OPTION_STRING, 'r', "rebase-merges", &rebase_merges,
-			N_("mode"),
+		OPT_CALLBACK_F('r', "rebase-merges", &options, N_("mode"),
 			N_("try to rebase merges instead of skipping them"),
-			PARSE_OPT_OPTARG, NULL, (intptr_t)"no-rebase-cousins"},
+			PARSE_OPT_OPTARG, parse_opt_rebase_merges),
 		OPT_BOOL(0, "fork-point", &options.fork_point,
 			 N_("use 'merge-base --fork-point' to refine upstream")),
 		OPT_STRING('s', "strategy", &options.strategy,
@@ -1436,21 +1477,6 @@ int cmd_rebase(int argc, const char **argv, const char *prefix)
 	if (options.exec.nr)
 		imply_merge(&options, "--exec");
 
-	if (rebase_merges) {
-		if (!*rebase_merges)
-			warning(_("--rebase-merges with an empty string "
-				  "argument is deprecated and will stop "
-				  "working in a future version of Git. Use "
-				  "--rebase-merges without an argument "
-				  "instead, which does the same thing."));
-		else if (!strcmp("rebase-cousins", rebase_merges))
-			options.rebase_cousins = 1;
-		else if (strcmp("no-rebase-cousins", rebase_merges))
-			die(_("Unknown mode: %s"), rebase_merges);
-		options.rebase_merges = 1;
-		imply_merge(&options, "--rebase-merges");
-	}
-
 	if (options.type == REBASE_APPLY) {
 		if (ignore_whitespace)
 			strvec_push(&options.git_am_opts,
@@ -1513,13 +1539,15 @@ int cmd_rebase(int argc, const char **argv, const char *prefix)
 				break;
 
 		if (i >= 0 || options.type == REBASE_APPLY) {
-			if (is_merge(&options))
-				die(_("apply options and merge options "
-					  "cannot be used together"));
-			else if (options.autosquash == -1 && options.config_autosquash == 1)
+			if (options.autosquash == -1 && options.config_autosquash == 1)
 				die(_("apply options are incompatible with rebase.autosquash.  Consider adding --no-autosquash"));
+			else if (options.rebase_merges == -1 && options.config_rebase_merges == 1)
+				die(_("apply options are incompatible with rebase.rebaseMerges.  Consider adding --no-rebase-merges"));
 			else if (options.update_refs == -1 && options.config_update_refs == 1)
 				die(_("apply options are incompatible with rebase.updateRefs.  Consider adding --no-update-refs"));
+			else if (is_merge(&options))
+				die(_("apply options and merge options "
+					  "cannot be used together"));
 			else
 				options.type = REBASE_APPLY;
 		}
@@ -1530,6 +1558,11 @@ int cmd_rebase(int argc, const char **argv, const char *prefix)
 	options.update_refs = (options.update_refs >= 0) ? options.update_refs :
 			     ((options.config_update_refs >= 0) ? options.config_update_refs : 0);
 
+	if (options.rebase_merges == 1)
+		imply_merge(&options, "--rebase-merges");
+	options.rebase_merges = (options.rebase_merges >= 0) ? options.rebase_merges :
+				((options.config_rebase_merges >= 0) ? options.config_rebase_merges : 0);
+
 	if (options.autosquash == 1)
 		imply_merge(&options, "--autosquash");
 	options.autosquash = (options.autosquash >= 0) ? options.autosquash :
diff --git a/t/t3422-rebase-incompatible-options.sh b/t/t3422-rebase-incompatible-options.sh
index 4711b37a28..2eba00bdf5 100755
--- a/t/t3422-rebase-incompatible-options.sh
+++ b/t/t3422-rebase-incompatible-options.sh
@@ -85,6 +85,11 @@ test_rebase_am_only () {
 		test_must_fail git rebase $opt --reapply-cherry-picks A
 	"
 
+	test_expect_success "$opt incompatible with --rebase-merges" "
+		git checkout B^0 &&
+		test_must_fail git rebase $opt --rebase-merges A
+	"
+
 	test_expect_success "$opt incompatible with --update-refs" "
 		git checkout B^0 &&
 		test_must_fail git rebase $opt --update-refs A
@@ -101,6 +106,12 @@ test_rebase_am_only () {
 		grep -e --no-autosquash err
 	"
 
+	test_expect_success "$opt incompatible with rebase.rebaseMerges" "
+		git checkout B^0 &&
+		test_must_fail git -c rebase.rebaseMerges=true rebase $opt A 2>err &&
+		grep -e --no-rebase-merges err
+	"
+
 	test_expect_success "$opt incompatible with rebase.updateRefs" "
 		git checkout B^0 &&
 		test_must_fail git -c rebase.updateRefs=true rebase $opt A 2>err &&
@@ -113,6 +124,12 @@ test_rebase_am_only () {
 		git -c rebase.autosquash=true rebase --no-autosquash $opt A
 	"
 
+	test_expect_success "$opt okay with overridden rebase.rebaseMerges" "
+		test_when_finished \"git reset --hard B^0\" &&
+		git checkout B^0 &&
+		git -c rebase.rebaseMerges=true rebase --no-rebase-merges $opt A
+	"
+
 	test_expect_success "$opt okay with overridden rebase.updateRefs" "
 		test_when_finished \"git reset --hard B^0\" &&
 		git checkout B^0 &&
diff --git a/t/t3430-rebase-merges.sh b/t/t3430-rebase-merges.sh
index d46d9545f2..aa75e192d1 100755
--- a/t/t3430-rebase-merges.sh
+++ b/t/t3430-rebase-merges.sh
@@ -278,6 +278,74 @@ test_expect_success 'do not rebase cousins unless asked for' '
 	EOF
 '
 
+test_expect_success '--rebase-merges="" is deprecated' '
+	git rebase --rebase-merges="" HEAD^ 2>actual &&
+	grep deprecated actual
+'
+
+test_expect_success 'rebase.rebaseMerges=rebase-cousins is equivalent to --rebase-merges=rebase-cousins' '
+	test_config rebase.rebaseMerges rebase-cousins &&
+	git checkout -b config-rebase-cousins main &&
+	git rebase HEAD^ &&
+	test_cmp_graph HEAD^.. <<-\EOF
+	*   Merge the topic branch '\''onebranch'\''
+	|\
+	| * D
+	| * G
+	|/
+	o H
+	EOF
+'
+
+test_expect_success '--no-rebase-merges overrides rebase.rebaseMerges=no-rebase-cousins' '
+	test_config rebase.rebaseMerges no-rebase-cousins &&
+	git checkout -b override-config-no-rebase-cousins E &&
+	git rebase --no-rebase-merges C &&
+	test_cmp_graph C.. <<-\EOF
+	* B
+	* D
+	o C
+	EOF
+'
+
+test_expect_success '--rebase-merges=no-rebase-cousins overrides rebase.rebaseMerges=rebase-cousins' '
+	test_config rebase.rebaseMerges rebase-cousins &&
+	git checkout -b override-config-rebase-cousins main &&
+	git rebase --rebase-merges=no-rebase-cousins HEAD^ &&
+	test_cmp_graph HEAD^.. <<-\EOF
+	*   Merge the topic branch '\''onebranch'\''
+	|\
+	| * D
+	| * G
+	o | H
+	|/
+	o A
+	EOF
+'
+
+test_expect_success '--rebase-merges overrides rebase.rebaseMerges=false' '
+	test_config rebase.rebaseMerges false &&
+	git checkout -b override-config-merges-false E &&
+	before="$(git rev-parse --verify HEAD)" &&
+	test_tick &&
+	git rebase --rebase-merges C &&
+	test_cmp_rev HEAD $before
+'
+
+test_expect_success '--rebase-merges does not override rebase.rebaseMerges=rebase-cousins' '
+	test_config rebase.rebaseMerges rebase-cousins &&
+	git checkout -b no-override-config-rebase-cousins main &&
+	git rebase --rebase-merges HEAD^ &&
+	test_cmp_graph HEAD^.. <<-\EOF
+	*   Merge the topic branch '\''onebranch'\''
+	|\
+	| * D
+	| * G
+	|/
+	o H
+	EOF
+'
+
 test_expect_success 'refs/rewritten/* is worktree-local' '
 	git worktree add wt &&
 	cat >wt/script-from-scratch <<-\EOF &&
-- 
2.39.2

