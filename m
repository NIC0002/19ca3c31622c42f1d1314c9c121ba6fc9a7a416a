Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04230C2BA4C
	for <git@archiver.kernel.org>; Wed, 26 Jan 2022 13:06:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237978AbiAZNGV (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 26 Jan 2022 08:06:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237450AbiAZNGL (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 26 Jan 2022 08:06:11 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 983FBC061774
        for <git@vger.kernel.org>; Wed, 26 Jan 2022 05:06:04 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id u15so25702577wrt.3
        for <git@vger.kernel.org>; Wed, 26 Jan 2022 05:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:in-reply-to:references:from:date:subject:fcc
         :content-transfer-encoding:mime-version:to:cc;
        bh=ieTmdmFrQ3TWBhksR7eaDCc6S5DicVx4i30sMnKFuC4=;
        b=RM5Rh+oxLQhcw7OGQYn1F2b4VAOTbAeIr6GbyoR+Sr4qXFtyj8GN9ztbfM1rPvMevP
         KblqqDH7Ydy2XPd9dx6O3/z9uxtRI+Woq4v81BFjkhNMY12vAm0QzZvY9ElZjGNh2XdI
         6ZyDTKrOOOWEJcXLtpwWtS4Tk7uPp3UZr/v3yt5l7dnx9DCUtZTKGJD/1AFYRW/eF98F
         i9NguS79LUVnhvRDi6kdpW8+EVXHetrqeZVuTcPL9Z/mPdgzCZXG/cs70fImtFtIxBQF
         YXGkF10vCwsgXDL39+GYWt7n1omEydtHf2KBvtHmFXg8kSwmiwYiWQu6eggyaAlczAw6
         PhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:in-reply-to:references:from:date
         :subject:fcc:content-transfer-encoding:mime-version:to:cc;
        bh=ieTmdmFrQ3TWBhksR7eaDCc6S5DicVx4i30sMnKFuC4=;
        b=ytB+HMABBJl6yJUYY2+3fslKq7f4oyJN7O2bOiFHUnFFkL/hdJOPs3iEBS30aoWePh
         oZFhoaoUnVLYoJp7mQn9+qXbdbIUe9+5Xztra+oXUgGbpU3eNK/HwpNjh0bbwMfoEudR
         qHSawic0S4PJlMbU5bu1fbvbfaT1hO501br9X5HpHCY4kE1l7BRjqgZx3D6y3ujoQEWH
         f50nWwC7l0lnnxzkWlHkfacpoJyPTClf7fUzc1ssEtiKrda47JG6RcjSxyq2whyB0Dn8
         grMNDczOZM6lfMIxhCaxgZOoL0QtIi7YAoNDsBZYywClIY7iBRwC14pbQ0b/BZ87OfQO
         3miQ==
X-Gm-Message-State: AOAM533U1NW9DdXpcNKjfAeIE7fvM1zIbufrnzDRdlPZQldqZOF7z7ng
        IiP7JR/UPsTyayID7Wof2GpUJGNsgyY=
X-Google-Smtp-Source: ABdhPJzhZxf5gTnnVrEY7cphrR8h2hSGTE3XXyV8g4ff44yFtqsfJ/jVCZns2TEjUfYxK42wCYmAVA==
X-Received: by 2002:a05:6000:2c6:: with SMTP id o6mr11109811wry.660.1643202363048;
        Wed, 26 Jan 2022 05:06:03 -0800 (PST)
Received: from [127.0.0.1] ([13.74.141.28])
        by smtp.gmail.com with ESMTPSA id u9sm2962593wmc.11.2022.01.26.05.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 05:06:02 -0800 (PST)
Message-Id: <9b9560ef6767721d2e6095a1515dfa8a01ec7be1.1643202349.git.gitgitgadget@gmail.com>
In-Reply-To: <pull.1049.v3.git.1643202349.gitgitgadget@gmail.com>
References: <pull.1049.v2.git.1638975481.gitgitgadget@gmail.com>
        <pull.1049.v3.git.1643202349.gitgitgadget@gmail.com>
From:   "Phillip Wood via GitGitGadget" <gitgitgadget@gmail.com>
Date:   Wed, 26 Jan 2022 13:05:49 +0000
Subject: [PATCH v3 14/14] rebase -m: don't fork git checkout
Fcc:    Sent
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
To:     git@vger.kernel.org
Cc:     Philippe Blain <levraiphilippeblain@gmail.com>,
        Johannes Schindelin <Johannes.Schindelin@gmx.de>,
        Elijah Newren <newren@gmail.com>,
        Eric Sunshine <sunshine@sunshineco.com>,
        Phillip Wood <phillip.wood123@gmail.com>,
        =?UTF-8?Q?Ren=C3=A9?= Scharfe <l.s.r@web.de>,
        =?UTF-8?Q?=C3=86var_Arnfj=C3=B6r=C3=B0?= Bjarmason 
        <avarab@gmail.com>, Phillip Wood <phillip.wood@dunelm.org.uk>,
        Phillip Wood <phillip.wood@dunelm.org.uk>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

From: Phillip Wood <phillip.wood@dunelm.org.uk>

Now that reset_head() can handle the initial checkout of onto
correctly use it in the "merge" backend instead of forking "git
checkout".  This opens the way for us to stop calling the
post-checkout hook in the future. Not running "git checkout" means
that "rebase -i/m" no longer recurse submodules when checking out
"onto" (thanks to Philippe Blain for pointing this out). As the rest
of rebase does not know what to do with submodules this is probably a
good thing. When using merge-ort rebase ought be able to handle
submodules correctly if it parsed the submodule config, such a change
is left for a future patch series.

The "apply" based rebase has avoided forking git checkout
since ac7f467fef ("builtin/rebase: support running "git rebase
<upstream>"", 2018-08-07). The code that handles the checkout was
moved into libgit by b309a97108 ("reset: extract reset_head() from
rebase", 2020-04-07).

Signed-off-by: Phillip Wood <phillip.wood@dunelm.org.uk>
---
 sequencer.c | 38 +++++++++++---------------------------
 1 file changed, 11 insertions(+), 27 deletions(-)

diff --git a/sequencer.c b/sequencer.c
index a62ea9d0e05..19082aa6c9b 100644
--- a/sequencer.c
+++ b/sequencer.c
@@ -4217,42 +4217,26 @@ int apply_autostash_oid(const char *stash_oid)
 	return apply_save_autostash_oid(stash_oid, 1);
 }
 
-static int run_git_checkout(struct repository *r, struct replay_opts *opts,
-			    const char *commit, const char *action)
-{
-	struct child_process cmd = CHILD_PROCESS_INIT;
-	int ret;
-
-	cmd.git_cmd = 1;
-
-	strvec_push(&cmd.args, "checkout");
-	strvec_push(&cmd.args, commit);
-	strvec_pushf(&cmd.env_array, GIT_REFLOG_ACTION "=%s", action);
-
-	if (opts->verbose)
-		ret = run_command(&cmd);
-	else
-		ret = run_command_silent_on_success(&cmd);
-
-	if (!ret)
-		discard_index(r->index);
-
-	return ret;
-}
-
 static int checkout_onto(struct repository *r, struct replay_opts *opts,
 			 const char *onto_name, const struct object_id *onto,
 			 const struct object_id *orig_head)
 {
-	const char *action = reflog_message(opts, "start", "checkout %s", onto_name);
-
-	if (run_git_checkout(r, opts, oid_to_hex(onto), action)) {
+	struct reset_head_opts ropts = {
+		.oid = onto,
+		.orig_head = orig_head,
+		.flags = RESET_HEAD_DETACH | RESET_ORIG_HEAD |
+				RESET_HEAD_RUN_POST_CHECKOUT_HOOK,
+		.head_msg = reflog_message(opts, "start", "checkout %s",
+					   onto_name),
+		.default_reflog_action = "rebase"
+	};
+	if (reset_head(r, &ropts)) {
 		apply_autostash(rebase_path_autostash());
 		sequencer_remove_state(opts);
 		return error(_("could not detach HEAD"));
 	}
 
-	return update_ref(NULL, "ORIG_HEAD", orig_head, NULL, 0, UPDATE_REFS_MSG_ON_ERR);
+	return 0;
 }
 
 static int stopped_at_head(struct repository *r)
-- 
gitgitgadget
