Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7E7C61DA3
	for <git@archiver.kernel.org>; Mon, 20 Feb 2023 21:04:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbjBTVEv (ORCPT <rfc822;git@archiver.kernel.org>);
        Mon, 20 Feb 2023 16:04:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbjBTVEt (ORCPT <rfc822;git@vger.kernel.org>);
        Mon, 20 Feb 2023 16:04:49 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C016693FD
        for <git@vger.kernel.org>; Mon, 20 Feb 2023 13:04:46 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id p3-20020a05600c358300b003e206711347so1747168wmq.0
        for <git@vger.kernel.org>; Mon, 20 Feb 2023 13:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUoQ+5Na3Y/7Nf95s0l9O6HuawoCJR3L4MSNvkV1rS8=;
        b=hWE4golAx8yyutjzpEJrL5ulSqSGDI/jb+9LB03h+VibMzja/iuG4MluVc22IKpU63
         i1H4P+pZ1C+leOcddCSf9+K0LeGfUAzXaI7MVnEPMasIzDEwDyvQ7bsXikTZ5etwcxTu
         kVpjKqmnHh6Ea+iVGKcHAdP2lzhGnQZiOnVuVGc6IfPa7DeMsPkdoV6BcbjmnqtF8xsf
         jvtssaIqNmHURfqYg5czkBxg3M7E2rxGThwVzKS74d3U+eWGnuWcBXzMGPssko8XEhgZ
         Wo/pq+n37shNAsx3rFmtTycrb2vsfanV5B5a9ABLOizAUmKXv/XiSr1A5KWzIVYJ6Pr9
         7pFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUoQ+5Na3Y/7Nf95s0l9O6HuawoCJR3L4MSNvkV1rS8=;
        b=7H20Y8fxgTC/QpS+aUcUKs0giZfgcODwzLAjSFyUSKA29jutGpHEq/TLrdtp+r0zFZ
         1UCpSFrHgd+MCHoH1sIaokmX39QKj8mRiezeggi90LP92RXh69IMti+qBlIySLQ4Mllv
         lyEdpb4OdL4gt6Z6CZH6/OFLS9QjPn/9JWAN9khXqAStt9X5NmqM3++41XD9agRhl7Mz
         kTMSU+KbF0GD8dM4w/uu5W63r4JWMBicHjDyH+aYvcOEfdtrGnFV4gHX4xoiL3z+gXKT
         9kcZS43TgqeqCQdRQwfbxesV/oHe5VvEpdvlSuHDZh0EvD8cHFX+AaI0B5b6P+EIMY94
         yZ2g==
X-Gm-Message-State: AO0yUKVyb4S+4ZEgqNekozNMlOiDU1VfpqPrG9Ptkj8uF+vjIEQiXsOb
        tR9D/nAr+6g7bmscZdCKiat0qd7W6pY=
X-Google-Smtp-Source: AK7set+p4r8Gj3ILiB4u6+oLmCfX2e91FPCoGI/KR4R0ZtchIHBpUAUbUK6LJOGUqbAqZAbPKYDVXw==
X-Received: by 2002:a05:600c:308a:b0:3df:f85a:4724 with SMTP id g10-20020a05600c308a00b003dff85a4724mr6786280wmn.39.1676927085045;
        Mon, 20 Feb 2023 13:04:45 -0800 (PST)
Received: from [127.0.0.1] ([13.74.141.28])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c500900b003daffc2ecdesm11391396wmr.13.2023.02.20.13.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 13:04:44 -0800 (PST)
Message-Id: <816c47aa414586e99aa762604396bd8be4fb11f4.1676927082.git.gitgitgadget@gmail.com>
In-Reply-To: <pull.1452.v4.git.git.1676927082.gitgitgadget@gmail.com>
References: <pull.1452.v3.git.git.1676665285.gitgitgadget@gmail.com>
        <pull.1452.v4.git.git.1676927082.gitgitgadget@gmail.com>
From:   "John Cai via GitGitGadget" <gitgitgadget@gmail.com>
Date:   Mon, 20 Feb 2023 21:04:41 +0000
Subject: [PATCH v4 1/2] diff: consolidate diff algorithm option parsing
Fcc:    Sent
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
To:     git@vger.kernel.org
Cc:     Eric Sunshine <sunshine@sunshineco.com>,
        Phillip Wood <phillip.wood123@gmail.com>,
        =?UTF-8?Q?=C3=86var_Arnfj=C3=B6r=C3=B0?= Bjarmason 
        <avarab@gmail.com>, Jeff King <peff@peff.net>,
        Elijah Newren <newren@gmail.com>,
        John Cai <johncai86@gmail.com>, John Cai <johncai86@gmail.com>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

From: John Cai <johncai86@gmail.com>

A subsequent commit will need the ability to tell if the diff algorithm
was set through the command line through setting a new member of
diff_options. While this logic can be added to the
diff_opt_diff_algorithm() callback, the `--minimal` and `--histogram`
options are handled via OPT_BIT without a callback.

Remedy this by consolidating the options parsing logic for --minimal and
--histogram into one callback. This way we can modify `diff_options` in
that function.

As an additional refactor, the logic that sets the diff algorithm in
diff_opt_diff_algorithm() can be refactored into a helper that will
allow multiple callsites to set the diff algorithm.

Signed-off-by: John Cai <johncai86@gmail.com>
---
 diff.c | 57 +++++++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 14 deletions(-)

diff --git a/diff.c b/diff.c
index 329eebf16a0..5efc22ca06b 100644
--- a/diff.c
+++ b/diff.c
@@ -3437,6 +3437,22 @@ static int diff_filepair_is_phoney(struct diff_filespec *one,
 	return !DIFF_FILE_VALID(one) && !DIFF_FILE_VALID(two);
 }
 
+static int set_diff_algorithm(struct diff_options *opts,
+			      const char *alg)
+{
+	long value = parse_algorithm_value(alg);
+
+	if (value < 0)
+		return -1;
+
+	/* clear out previous settings */
+	DIFF_XDL_CLR(opts, NEED_MINIMAL);
+	opts->xdl_opts &= ~XDF_DIFF_ALGORITHM_MASK;
+	opts->xdl_opts |= value;
+
+	return 0;
+}
+
 static void builtin_diff(const char *name_a,
 			 const char *name_b,
 			 struct diff_filespec *one,
@@ -5107,17 +5123,28 @@ static int diff_opt_diff_algorithm(const struct option *opt,
 				   const char *arg, int unset)
 {
 	struct diff_options *options = opt->value;
-	long value = parse_algorithm_value(arg);
 
 	BUG_ON_OPT_NEG(unset);
-	if (value < 0)
+
+	if (set_diff_algorithm(options, arg))
 		return error(_("option diff-algorithm accepts \"myers\", "
 			       "\"minimal\", \"patience\" and \"histogram\""));
 
-	/* clear out previous settings */
-	DIFF_XDL_CLR(options, NEED_MINIMAL);
-	options->xdl_opts &= ~XDF_DIFF_ALGORITHM_MASK;
-	options->xdl_opts |= value;
+	return 0;
+}
+
+static int diff_opt_diff_algorithm_no_arg(const struct option *opt,
+				   const char *arg, int unset)
+{
+	struct diff_options *options = opt->value;
+
+	BUG_ON_OPT_NEG(unset);
+	BUG_ON_OPT_ARG(arg);
+
+	if (set_diff_algorithm(options, opt->long_name))
+		BUG("available diff algorithms include \"myers\", "
+			       "\"minimal\", \"patience\" and \"histogram\"");
+
 	return 0;
 }
 
@@ -5250,7 +5277,6 @@ static int diff_opt_patience(const struct option *opt,
 
 	BUG_ON_OPT_NEG(unset);
 	BUG_ON_OPT_ARG(arg);
-	options->xdl_opts = DIFF_WITH_ALG(options, PATIENCE_DIFF);
 	/*
 	 * Both --patience and --anchored use PATIENCE_DIFF
 	 * internally, so remove any anchors previously
@@ -5259,7 +5285,8 @@ static int diff_opt_patience(const struct option *opt,
 	for (i = 0; i < options->anchors_nr; i++)
 		free(options->anchors[i]);
 	options->anchors_nr = 0;
-	return 0;
+
+	return set_diff_algorithm(options, "patience");
 }
 
 static int diff_opt_ignore_regex(const struct option *opt,
@@ -5562,9 +5589,10 @@ struct option *add_diff_options(const struct option *opts,
 			    N_("prevent rename/copy detection if the number of rename/copy targets exceeds given limit")),
 
 		OPT_GROUP(N_("Diff algorithm options")),
-		OPT_BIT(0, "minimal", &options->xdl_opts,
-			N_("produce the smallest possible diff"),
-			XDF_NEED_MINIMAL),
+		OPT_CALLBACK_F(0, "minimal", options, NULL,
+			       N_("produce the smallest possible diff"),
+			       PARSE_OPT_NONEG | PARSE_OPT_NOARG,
+			       diff_opt_diff_algorithm_no_arg),
 		OPT_BIT_F('w', "ignore-all-space", &options->xdl_opts,
 			  N_("ignore whitespace when comparing lines"),
 			  XDF_IGNORE_WHITESPACE, PARSE_OPT_NONEG),
@@ -5590,9 +5618,10 @@ struct option *add_diff_options(const struct option *opts,
 			       N_("generate diff using the \"patience diff\" algorithm"),
 			       PARSE_OPT_NONEG | PARSE_OPT_NOARG,
 			       diff_opt_patience),
-		OPT_BITOP(0, "histogram", &options->xdl_opts,
-			  N_("generate diff using the \"histogram diff\" algorithm"),
-			  XDF_HISTOGRAM_DIFF, XDF_DIFF_ALGORITHM_MASK),
+		OPT_CALLBACK_F(0, "histogram", options, NULL,
+			       N_("generate diff using the \"histogram diff\" algorithm"),
+			       PARSE_OPT_NONEG | PARSE_OPT_NOARG,
+			       diff_opt_diff_algorithm_no_arg),
 		OPT_CALLBACK_F(0, "diff-algorithm", options, N_("<algorithm>"),
 			       N_("choose a diff algorithm"),
 			       PARSE_OPT_NONEG, diff_opt_diff_algorithm),
-- 
gitgitgadget

