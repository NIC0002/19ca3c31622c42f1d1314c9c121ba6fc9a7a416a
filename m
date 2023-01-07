Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04CD5C54EBD
	for <git@archiver.kernel.org>; Sat,  7 Jan 2023 04:59:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236421AbjAGE7o (ORCPT <rfc822;git@archiver.kernel.org>);
        Fri, 6 Jan 2023 23:59:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjAGE7j (ORCPT <rfc822;git@vger.kernel.org>);
        Fri, 6 Jan 2023 23:59:39 -0500
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF0768D5E0
        for <git@vger.kernel.org>; Fri,  6 Jan 2023 20:59:37 -0800 (PST)
Date:   Sat, 07 Jan 2023 04:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nullpo.dev;
        s=protonmail3; t=1673067576; x=1673326776;
        bh=7leFOl6i7KSEjnL5OlqNHTkYJSqD/XCCFHRz4miI7ZI=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=r0mIyJKKNUWUJamY9GJSbmB4HLccNVftG42IpNy4bn2Zo57tfudNJIIhrfjmUnbpu
         LSM83+uW7Sq+Tq+4ZClvJEZJU9UP+FkMm2dctIUJOWjYwbZ5ExFutCCP2t+GXHBy1p
         qkw+koEQt0UJ31AWxirp9sN5bk1G/E5p0c8adsxtTI/7Aec+jUQpDtAHpusGqkDR9S
         MSV24LO1YDGkEREmxCawE4rZW/DMjtVa6PntqYfH06q2NYOoMRZEM7HE00KzlA8w5X
         H7apoEn11jadoWm1lXvMg2e3FV4q96YOCVQFEGywo85DtMfRsIkgbFlz+LKMcvXi4H
         55DVkDvwr+ptg==
To:     git@vger.kernel.org
From:   Jacob Abel <jacobabel@nullpo.dev>
Cc:     Jacob Abel <jacobabel@nullpo.dev>,
        =?utf-8?Q?=C3=86var_Arnfj=C3=B6r=C3=B0_Bjarmason?= 
        <avarab@gmail.com>, Eric Sunshine <sunshine@sunshineco.com>,
        Junio C Hamano <gitster@pobox.com>,
        Phillip Wood <phillip.wood123@gmail.com>,
        =?utf-8?Q?Rub=C3=A9n_Justo?= <rjusto@gmail.com>,
        Taylor Blau <me@ttaylorr.com>, rsbecker@nexbridge.com
Subject: [PATCH v7 2/4] worktree add: refactor opt exclusion tests
Message-ID: <20230107045757.30037-3-jacobabel@nullpo.dev>
In-Reply-To: <20230107045757.30037-1-jacobabel@nullpo.dev>
References: <20221104010242.11555-1-jacobabel@nullpo.dev> <20221104213401.17393-1-jacobabel@nullpo.dev> <20221110233137.10414-1-jacobabel@nullpo.dev> <20221212014003.20290-1-jacobabel@nullpo.dev> <20221220023637.29042-1-jacobabel@nullpo.dev> <20221228061539.13740-1-jacobabel@nullpo.dev> <20230107045757.30037-1-jacobabel@nullpo.dev>
Feedback-ID: 21506737:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Pull duplicate test code into a function so that additional opt
combinations can be tested succinctly.

Signed-off-by: Jacob Abel <jacobabel@nullpo.dev>
---
 t/t2400-worktree-add.sh | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/t/t2400-worktree-add.sh b/t/t2400-worktree-add.sh
index d587e0b20d..f1ae0cb268 100755
--- a/t/t2400-worktree-add.sh
+++ b/t/t2400-worktree-add.sh
@@ -298,17 +298,20 @@ test_expect_success '"add" no auto-vivify with --deta=
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
+#
+# Note: Quoted arguments containing spaces are not supported.
+test_wt_add_excl () {
+=09local opts=3D"$*" &&
+=09test_expect_success "'worktree add' with '$opts' has mutually exclusive=
 options" '
+=09=09test_must_fail git worktree add $opts 2>actual &&
+=09=09grep -P "fatal:( options)? .* cannot be used together" actual
+=09'
+}

-test_expect_success '"add" -B/--detach mutually exclusive' '
-=09test_must_fail git worktree add -B poodle --detach bamboo main
-'
+test_wt_add_excl -b poodle -B poodle bamboo main
+test_wt_add_excl -b poodle --detach bamboo main
+test_wt_add_excl -B poodle --detach bamboo main

 test_expect_success '"add -B" fails if the branch is checked out' '
 =09git rev-parse newmain >before &&
--
2.38.2


