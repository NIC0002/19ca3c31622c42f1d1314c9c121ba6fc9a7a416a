Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEA4C636D3
	for <git@archiver.kernel.org>; Sat,  4 Feb 2023 16:48:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232661AbjBDQsY (ORCPT <rfc822;git@archiver.kernel.org>);
        Sat, 4 Feb 2023 11:48:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbjBDQsW (ORCPT <rfc822;git@vger.kernel.org>);
        Sat, 4 Feb 2023 11:48:22 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E0A022DCB
        for <git@vger.kernel.org>; Sat,  4 Feb 2023 08:48:21 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id bg26so5960973wmb.0
        for <git@vger.kernel.org>; Sat, 04 Feb 2023 08:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N86R8x7tY/jVkXj4il9Y0qauIyFiObIhfQ6ZH6WJC3o=;
        b=TxQdB97wMhaLRA7v/LBrAVbvJe4/+mvYAZOIZ0cHbPKXAtCvgmSLwR9Wej88pNdLtc
         I0BukffESsexTQ/+q0Bn2TZvxSy8HCmxpy1mYCql+ttPoy5BexnsymT/EuY9lP3/XHrK
         c1zgHUTAPfskn32MoYUfe08/7gXeZSAlc8VWH+Otawd3ytNVkkK256A5kvFVV2KmSGUk
         lwz94KgJov6xespe+x9WVnSdLpr2F0nA5PezBMnU+DnGqbdNp4vULXMx/IPTbc2szjYS
         7VDEkzn8a2Prjgt3LdPK+cm7sd4qZ1rOesgclTwzXqW1PayiFaCrshcYOxZnZ4DHxdzT
         GoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N86R8x7tY/jVkXj4il9Y0qauIyFiObIhfQ6ZH6WJC3o=;
        b=Io6MULPSWVAlGQ+BcdiyLmBKiy9qT7gLssYY4YG8r0wPIeS/M6BOY76wxVHLDd6qVs
         W8pmAhrpIiPMHpTaP68ma23B42IRLY6FsK7xRc2mZVpUj+ynYXGcDUJDgmibxqLgu3jU
         hwDXs0z75toNXvNzf0bKtTGumMV/GMJ7Syi5ltqCLIxd9lInv7yglqDvFPWQ8O1eCj2T
         eYd4GX7+q17ugTwN1IGXtYRNsaDkplSkawTGAD3yhzCs24ULzN1UZLOha6NeysgaOs4F
         DZfuk/H5INO0DuMxwgaqFe63aldS+i4gmmodXyEQ7qgXEsdGoGQ1yhpaGSzW3ZoFE1Ja
         yXJA==
X-Gm-Message-State: AO0yUKWtLxm7GbgFYIY6aVuMWBRpSo7SXoMfKqJibA9/kGO1ubiB4pzh
        8V1LakOo+KsjLP9BKx93BmtFBGpFZro=
X-Google-Smtp-Source: AK7set/wLz3QZd7H9BxbOKd++6TQbdmDZlzHb7KpI6kW04D5jFAPH6FsErwclbqKf+EBV3dJ967J7Q==
X-Received: by 2002:a05:600c:34cb:b0:3dc:51ad:9dc4 with SMTP id d11-20020a05600c34cb00b003dc51ad9dc4mr13835991wmq.18.1675529299899;
        Sat, 04 Feb 2023 08:48:19 -0800 (PST)
Received: from [127.0.0.1] ([13.74.141.28])
        by smtp.gmail.com with ESMTPSA id j29-20020adfb31d000000b00294176c2c01sm4656805wrd.86.2023.02.04.08.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 08:48:19 -0800 (PST)
Message-Id: <214a2b662e3f8d6826a916b88cd3162e2d110e0a.1675529298.git.gitgitgadget@gmail.com>
In-Reply-To: <pull.1465.v2.git.1675529298.gitgitgadget@gmail.com>
References: <pull.1465.git.1673951562.gitgitgadget@gmail.com>
        <pull.1465.v2.git.1675529298.gitgitgadget@gmail.com>
From:   "ZheNing Hu via GitGitGadget" <gitgitgadget@gmail.com>
Date:   Sat, 04 Feb 2023 16:48:16 +0000
Subject: [PATCH v2 1/2] receive-pack: fix funny ref error messsage
Fcc:    Sent
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
To:     git@vger.kernel.org
Cc:     =?UTF-8?Q?=C3=86var_Arnfj=C3=B6r=C3=B0?= Bjarmason 
        <avarab@gmail.com>, Junio C Hamano <gitster@pobox.com>,
        Derrick Stolee <derrickstolee@github.com>,
        Elijah Newren <newren@gmail.com>,
        Michael Haggerty <mhagger@alum.mit.edu>,
        Christian Couder <christian.couder@gmail.com>,
        Jeff King <peff@peff.net>, ZheNing Hu <adlternative@gmail.com>,
        ZheNing Hu <adlternative@gmail.com>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

From: ZheNing Hu <adlternative@gmail.com>

When the user deletes the remote one level branch through
"git push origin -d refs/foo", remote will return an error:
"refusing to create funny ref 'refs/foo' remotely", here we
are not creating "refs/foo" instead wants to delete it, so a
better error description here would be: "refusing to update
funny ref 'refs/foo' remotely".

Signed-off-by: ZheNing Hu <adlternative@gmail.com>
---
 builtin/receive-pack.c | 2 +-
 t/t5516-fetch-push.sh  | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/builtin/receive-pack.c b/builtin/receive-pack.c
index a90af303630..13ff9fae3ba 100644
--- a/builtin/receive-pack.c
+++ b/builtin/receive-pack.c
@@ -1464,7 +1464,7 @@ static const char *update(struct command *cmd, struct shallow_info *si)
 
 	/* only refs/... are allowed */
 	if (!starts_with(name, "refs/") || check_refname_format(name + 5, 0)) {
-		rp_error("refusing to create funny ref '%s' remotely", name);
+		rp_error("refusing to update funny ref '%s' remotely", name);
 		ret = "funny refname";
 		goto out;
 	}
diff --git a/t/t5516-fetch-push.sh b/t/t5516-fetch-push.sh
index 98a27a2948b..f37861efc40 100755
--- a/t/t5516-fetch-push.sh
+++ b/t/t5516-fetch-push.sh
@@ -401,6 +401,11 @@ test_expect_success 'push with ambiguity' '
 
 '
 
+test_expect_success 'push with onelevel ref' '
+	mk_test testrepo heads/main &&
+	test_must_fail git push testrepo HEAD:refs/onelevel
+'
+
 test_expect_success 'push with colon-less refspec (1)' '
 
 	mk_test testrepo heads/frotz tags/frotz &&
-- 
gitgitgadget

