Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36676C4332F
	for <git@archiver.kernel.org>; Fri, 21 Oct 2022 09:22:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbiJUJV7 (ORCPT <rfc822;git@archiver.kernel.org>);
        Fri, 21 Oct 2022 05:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231130AbiJUJV5 (ORCPT <rfc822;git@vger.kernel.org>);
        Fri, 21 Oct 2022 05:21:57 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A3012565F0
        for <git@vger.kernel.org>; Fri, 21 Oct 2022 02:21:53 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id l14-20020a05600c1d0e00b003c6ecc94285so3607610wms.1
        for <git@vger.kernel.org>; Fri, 21 Oct 2022 02:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mjLVzcTdft0VJLpC4LtMhvdey7E5X+kofVDbGuLTEk=;
        b=Azf7iPZd9BTkEW+SLifPbTJQNhNwL/tKYdnKTyMjaBityZqTPeh/Xs0S9TmnAkW8AC
         7x1lk1rxdfq3JeuE+3Bss4+2ZAyNWqgzMw4MMhS8wh3YB8vGm5RnO/YV+tA1ha7dO5Lj
         IRQH4N+YroMnppQqM8nTRYIW3YxQfWzJtMEpUMjnuBL+Qt6w+LWnemFB6FxJSdFz1t+B
         DloCgTY0sof4zb5FYQPwScOWL+4VeE5ad1MuzXRwqFI/ZIB7mxg/J+zeU+5XhQRdI+DC
         60ijm0L8YopJBFiW0TcSYC13gto65lHN8S5DLQq+ES7SFNwycMb1SBEm/pigJiRPxHKX
         yIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9mjLVzcTdft0VJLpC4LtMhvdey7E5X+kofVDbGuLTEk=;
        b=kEAE+k7QlATqD/nY9PCra5aw/0aH6bUslbG5esSKMP9j2SL7exiD2gVfW+4r421Y5D
         eegGuXxfoFwoqJ+m2HASQj+Muiskz3EQbXZybMtPN3Bw3R/ZbbtNKuGWJZaHvbTY/GO2
         PQ/zK6wX/WEO2iB8HqxAHHDy0yY4/MGvtptenGaBEwMD7j7Jt57aEJOkyMh00+6riwum
         jKd5tv/jFtjGVufYIwZ64UDroyipltoPjgANTwZs7pnsQWWYOXgvtM/sqHNrj+Xny+q9
         BHw35w2yYrKvFABMxD5F3/EvPx6H1pe9qpzUn4UN6APITynOJ6Wk9Rwb799QRHvBr5Mh
         3OvQ==
X-Gm-Message-State: ACrzQf1+EC49aSAH/PKAQ/+jK1D1QbcFyOFuPZpmXqIqiFVPkCQzyxAV
        7FxFp74bsZBJA3KgxJBZw1dB5zeiUik=
X-Google-Smtp-Source: AMsMyM7kMFPGs3I6KY2kYrJpFXLivNTRJ9VicILBBWmA3Z+GN0Uk1oI1cy7nkUQqvPX5EidJm2ARmg==
X-Received: by 2002:a05:600c:1da8:b0:3c6:ca7c:2e87 with SMTP id p40-20020a05600c1da800b003c6ca7c2e87mr11740296wms.126.1666344111304;
        Fri, 21 Oct 2022 02:21:51 -0700 (PDT)
Received: from [127.0.0.1] ([13.74.141.28])
        by smtp.gmail.com with ESMTPSA id a18-20020a056000101200b0023655e51c33sm714978wrx.4.2022.10.21.02.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 02:21:50 -0700 (PDT)
Message-Id: <8d5ae067ce361f986634b0f218cf09bb0e2ae33f.1666344108.git.gitgitgadget@gmail.com>
In-Reply-To: <pull.1150.v4.git.1666344108.gitgitgadget@gmail.com>
References: <pull.1150.v3.git.1665567312.gitgitgadget@gmail.com>
        <pull.1150.v4.git.1666344108.gitgitgadget@gmail.com>
From:   "Phillip Wood via GitGitGadget" <gitgitgadget@gmail.com>
Date:   Fri, 21 Oct 2022 09:21:41 +0000
Subject: [PATCH v4 1/8] t3406: rework rebase reflog tests
Fcc:    Sent
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
To:     git@vger.kernel.org
Cc:     Phillip Wood <phillip.wood123@gmail.com>,
        Christian Couder <christian.couder@gmail.com>,
        Elijah Newren <newren@gmail.com>,
        =?UTF-8?Q?=C3=86var_Arnfj=C3=B6r=C3=B0?= Bjarmason 
        <avarab@gmail.com>, Calvin Wan <calvinwan@google.com>,
        Emily Shaffer <emilyshaffer@google.com>,
        Glen Choo <chooglen@google.com>,
        Victoria Dye <vdye@github.com>,
        Phillip Wood <phillip.wood@dunelm.org.uk>,
        Phillip Wood <phillip.wood@dunelm.org.uk>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

From: Phillip Wood <phillip.wood@dunelm.org.uk>

Refactor the tests in preparation for adding more tests in the next
few commits. The reworked tests use the same function for testing both
the "merge" and "apply" backends. The test coverage for the "apply"
backend now includes setting GIT_REFLOG_ACTION.

Note that rebasing the "conflicts" branch does not create any conflicts
yet. A commit to do that will be added shortly and the diff ends up
smaller if we have don't rename the branch when it is added.

Signed-off-by: Phillip Wood <phillip.wood@dunelm.org.uk>
---
 t/t3406-rebase-message.sh | 121 ++++++++++++++++++++++++++------------
 1 file changed, 82 insertions(+), 39 deletions(-)

diff --git a/t/t3406-rebase-message.sh b/t/t3406-rebase-message.sh
index d17b450e811..413d6132ea2 100755
--- a/t/t3406-rebase-message.sh
+++ b/t/t3406-rebase-message.sh
@@ -10,10 +10,15 @@ export GIT_TEST_DEFAULT_INITIAL_BRANCH_NAME
 test_expect_success 'setup' '
 	test_commit O fileO &&
 	test_commit X fileX &&
+	git branch fast-forward &&
 	test_commit A fileA &&
 	test_commit B fileB &&
 	test_commit Y fileY &&
 
+	git checkout -b conflicts O &&
+	test_commit P &&
+	test_commit Q &&
+
 	git checkout -b topic O &&
 	git cherry-pick A B &&
 	test_commit Z fileZ &&
@@ -79,54 +84,92 @@ test_expect_success 'error out early upon -C<n> or --whitespace=<bad>' '
 	test_i18ngrep "Invalid whitespace option" err
 '
 
-test_expect_success 'GIT_REFLOG_ACTION' '
-	git checkout start &&
-	test_commit reflog-onto &&
-	git checkout -b reflog-topic start &&
-	test_commit reflog-to-rebase &&
-
-	git rebase reflog-onto &&
-	git log -g --format=%gs -3 >actual &&
-	cat >expect <<-\EOF &&
-	rebase (finish): returning to refs/heads/reflog-topic
-	rebase (pick): reflog-to-rebase
-	rebase (start): checkout reflog-onto
+write_reflog_expect () {
+	if test $mode = --apply
+	then
+		sed 's/.*(finish)/rebase finished/; s/ ([^)]*)//'
+	else
+		cat
+	fi >expect
+}
+
+test_reflog () {
+	mode=$1
+	reflog_action="$2"
+
+	test_expect_success "rebase $mode reflog${reflog_action:+ GIT_REFLOG_ACTION=$reflog_action}" '
+	git checkout conflicts &&
+	test_when_finished "git reset --hard Q" &&
+
+	(
+		if test -n "$reflog_action"
+		then
+			GIT_REFLOG_ACTION="$reflog_action" &&
+			export GIT_REFLOG_ACTION
+		fi &&
+		git rebase $mode main
+	) &&
+
+	git log -g --format=%gs -4 >actual &&
+	write_reflog_expect <<-EOF &&
+	${reflog_action:-rebase} (finish): returning to refs/heads/conflicts
+	${reflog_action:-rebase} (pick): Q
+	${reflog_action:-rebase} (pick): P
+	${reflog_action:-rebase} (start): checkout main
 	EOF
 	test_cmp expect actual &&
 
-	git checkout -b reflog-prefix reflog-to-rebase &&
-	GIT_REFLOG_ACTION=change-the-reflog git rebase reflog-onto &&
-	git log -g --format=%gs -3 >actual &&
-	cat >expect <<-\EOF &&
-	change-the-reflog (finish): returning to refs/heads/reflog-prefix
-	change-the-reflog (pick): reflog-to-rebase
-	change-the-reflog (start): checkout reflog-onto
+	git log -g --format=%gs -1 conflicts >actual &&
+	write_reflog_expect <<-EOF &&
+	${reflog_action:-rebase} (finish): refs/heads/conflicts onto $(git rev-parse main)
 	EOF
-	test_cmp expect actual
-'
-
-test_expect_success 'rebase --apply reflog' '
-	git checkout -b reflog-apply start &&
-	old_head_reflog="$(git log -g --format=%gs -1 HEAD)" &&
-
-	git rebase --apply Y &&
+	test_cmp expect actual &&
 
-	git log -g --format=%gs -4 HEAD >actual &&
-	cat >expect <<-EOF &&
-	rebase finished: returning to refs/heads/reflog-apply
-	rebase: Z
-	rebase: checkout Y
-	$old_head_reflog
+	# check there is only one new entry in the branch reflog
+	test_cmp_rev conflicts@{1} Q
+	'
+
+	test_expect_success "rebase $mode fast-forward reflog${reflog_action:+ GIT_REFLOG_ACTION=$reflog_action}" '
+	git checkout fast-forward &&
+	test_when_finished "git reset --hard X" &&
+
+	(
+		if test -n "$reflog_action"
+		then
+			GIT_REFLOG_ACTION="$reflog_action" &&
+			export GIT_REFLOG_ACTION
+		fi &&
+		git rebase $mode main
+	) &&
+
+	git log -g --format=%gs -2 >actual &&
+	if test "$mode" = "--apply"
+	then
+		finish_msg="refs/heads/fast-forward onto $(git rev-parse main)"
+	else
+		finish_msg="returning to refs/heads/fast-forward"
+	fi &&
+	write_reflog_expect <<-EOF &&
+	${reflog_action:-rebase} (finish): $finish_msg
+	${reflog_action:-rebase} (start): checkout main
 	EOF
 	test_cmp expect actual &&
 
-	git log -g --format=%gs -2 reflog-apply >actual &&
-	cat >expect <<-EOF &&
-	rebase finished: refs/heads/reflog-apply onto $(git rev-parse Y)
-	branch: Created from start
+	git log -g --format=%gs -1 fast-forward >actual &&
+	write_reflog_expect <<-EOF &&
+	${reflog_action:-rebase} (finish): refs/heads/fast-forward onto $(git rev-parse main)
 	EOF
-	test_cmp expect actual
-'
+	test_cmp expect actual &&
+
+	# check there is only one new entry in the branch reflog
+	test_cmp_rev fast-forward@{1} X
+	'
+}
+
+test_reflog --merge
+test_reflog --merge my-reflog-action
+test_reflog --apply
+test_reflog --apply my-reflog-action
 
 test_expect_success 'rebase -i onto unrelated history' '
 	git init unrelated &&
-- 
gitgitgadget

