Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E34F8C433EF
	for <git@archiver.kernel.org>; Tue,  8 Feb 2022 08:41:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350694AbiBHIkk (ORCPT <rfc822;git@archiver.kernel.org>);
        Tue, 8 Feb 2022 03:40:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350569AbiBHIkY (ORCPT <rfc822;git@vger.kernel.org>);
        Tue, 8 Feb 2022 03:40:24 -0500
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD72C0401F6
        for <git@vger.kernel.org>; Tue,  8 Feb 2022 00:40:24 -0800 (PST)
Received: by mail-pl1-x649.google.com with SMTP id y13-20020a170902d64d00b0014cea2afd46so7018458plh.12
        for <git@vger.kernel.org>; Tue, 08 Feb 2022 00:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=C4m91dacx6CAhzX4YyT26sMDoIhe7B1orAVRP6TgaLI=;
        b=QLreUN9hmK5PgX3vC385obTqFl4V44RXC49qLNvS97oCO50az2Ee/N+N+HBoeGF5ru
         nZweSmeARYf45Bv+orJnYLRAVxT42Q8zV3PQu3Dx9LbDvt+cTgJuDRXIXMHYX/f1dqee
         wVcAnCmZj/UrJBn62JIUnRBclRymMABfWXOpUl+y+3X3ZyApw1/i4kuLwXYx1bTkENH9
         QYBVDBXTXhrxTURiqhP8RS3i+GxfCfo6G5w1D53oXLnPhRFtX/ThUGonAUAJHZ6ZHXWh
         5AX6nTOfs4d7pg9+R4jWg0JUBBGcMB6TG6P3+JpDU9QMCENOrPQDKdkiOhI6mS63LIQe
         U5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=C4m91dacx6CAhzX4YyT26sMDoIhe7B1orAVRP6TgaLI=;
        b=YcJ3QgYlKSUEUVM87Z+s5yTGVqeDSDaXpE3PufkAo9egGPW/yxuWBZcEg/rHOFJSMC
         WmB6Wt/Bfa9es9tDWUonezTmoDn7c3Y8gX9hUMv4Wc+UL+4dSpGh5qdVF/rd+9hwROQP
         ONVGt32/liYFkbo+T8OPalPDI/qqw9s2YhUMZApnOM6EBGsueCgzZBat7fjAxNsoNuGx
         P4RlBl6Mksb0jezcGqQ3B3zIYpQQdlw9sOKaEEAvTDDMVLTuWA3UzxVouSWeFC5ZGUh1
         y553kidA31/M0Za+71FNLiYAs6VlWRHoRgJpT8J9pmFXJF45dInb4dn68Dw1wz483Syg
         H0mA==
X-Gm-Message-State: AOAM532K3r1c0vzf8Z8LW2MwNX75o8dSYQmXgF39IBuCHY6eizQc1qSZ
        MR0kC4CQRRVSoQ3jYznole5VVi7as/9hR2cXOpUMCBRVsYPKGLKx10h7FpPsVlnm8YFXxytQIzI
        7TeXZf1Ea7wDvWJ8kzF6rNwxfut2vX4ChPDnWDP/CQ8YnPBhPCzY5Aljevnc99H4=
X-Google-Smtp-Source: ABdhPJzMPDwc9ml7SOLikhSBpQaBUs1gY60PrJlltSGFwvdaw/Aliw4FArmxkawtagJNPvfP8v9IshAbZq3FoA==
X-Received: from chooglen.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:26d9])
 (user=chooglen job=sendgmr) by 2002:a17:90a:6448:: with SMTP id
 y8mr182596pjm.20.1644309623659; Tue, 08 Feb 2022 00:40:23 -0800 (PST)
Date:   Tue,  8 Feb 2022 16:39:47 +0800
In-Reply-To: <20220208083952.35036-1-chooglen@google.com>
Message-Id: <20220208083952.35036-12-chooglen@google.com>
Mime-Version: 1.0
References: <cover-v5-0.9-00000000000-20220128T125206Z-avarab@gmail.com> <20220208083952.35036-1-chooglen@google.com>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH v6 11/16] submodule--helper run-update-procedure: remove --suboid
From:   Glen Choo <chooglen@google.com>
To:     git@vger.kernel.org
Cc:     Glen Choo <chooglen@google.com>,
        Junio C Hamano <gitster@pobox.com>,
        Atharva Raykar <raykar.ath@gmail.com>,
        Christian Couder <christian.couder@gmail.com>,
        Emily Shaffer <emilyshaffer@google.com>,
        Jonathan Nieder <jrn@google.com>,
        Kaartic Sivaraam <kaartic.sivaraam@gmail.com>,
        pc44800@gmail.com, Shourya Shukla <periperidip@gmail.com>,
        "=?UTF-8?q?=C3=86var=20Arnfj=C3=B6r=C3=B0=20Bjarmason?=" 
        <avarab@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Teach run-update-procedure to determine the oid of the submodule's HEAD
instead of doing it in git-subomdule.sh.

Signed-off-by: Glen Choo <chooglen@google.com>
---
 builtin/submodule--helper.c | 12 +++++++++---
 git-submodule.sh            |  8 +-------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/builtin/submodule--helper.c b/builtin/submodule--helper.c
index 0b5120734a..a26477ce04 100644
--- a/builtin/submodule--helper.c
+++ b/builtin/submodule--helper.c
@@ -2585,9 +2585,6 @@ static int run_update_procedure(int argc, const char **argv, const char *prefix)
 		OPT_CALLBACK_F(0, "oid", &opt.oid, N_("sha1"),
 			       N_("SHA1 expected by superproject"), PARSE_OPT_NONEG,
 			       parse_opt_object_id),
-		OPT_CALLBACK_F(0, "suboid", &opt.suboid, N_("subsha1"),
-			       N_("SHA1 of submodule's HEAD"), PARSE_OPT_NONEG,
-			       parse_opt_object_id),
 		OPT_END()
 	};
 
@@ -2982,6 +2979,15 @@ static int module_set_branch(int argc, const char **argv, const char *prefix)
 /* NEEDSWORK: this is a temporary name until we delete update_submodule() */
 static int update_submodule2(struct update_data *update_data)
 {
+	/* NEEDSWORK: fix the style issues e.g. braces */
+	if (update_data->just_cloned) {
+		oidcpy(&update_data->suboid, null_oid());
+	} else {
+		if (resolve_gitlink_ref(update_data->sm_path, "HEAD", &update_data->suboid))
+			die(_("Unable to find current revision in submodule path '%s'"),
+			    update_data->displaypath);
+	}
+
 	if (!oideq(&update_data->oid, &update_data->suboid) || update_data->force)
 		return do_run_update_procedure(update_data);
 
diff --git a/git-submodule.sh b/git-submodule.sh
index 652861aa66..d48c314f01 100755
--- a/git-submodule.sh
+++ b/git-submodule.sh
@@ -391,14 +391,9 @@ cmd_update()
 
 		displaypath=$(git submodule--helper relative-path "$prefix$sm_path" "$wt_prefix")
 
-		if test $just_cloned -eq 1
+		if test $just_cloned -eq 0
 		then
-			subsha1=
-		else
 			just_cloned=
-			subsha1=$(sanitize_submodule_env; cd "$sm_path" &&
-				git rev-parse --verify HEAD) ||
-			die "fatal: $(eval_gettext "Unable to find current revision in submodule path '\$displaypath'")"
 		fi
 
 		if test -n "$remote"
@@ -426,7 +421,6 @@ cmd_update()
 			  ${update:+--update "$update"} \
 			  ${prefix:+--recursive-prefix "$prefix"} \
 			  ${sha1:+--oid "$sha1"} \
-			  ${subsha1:+--suboid "$subsha1"} \
 			  "--" \
 			  "$sm_path")
 
-- 
2.33.GIT

