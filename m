Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D478CC433EF
	for <git@archiver.kernel.org>; Tue, 22 Mar 2022 18:02:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240051AbiCVSDv (ORCPT <rfc822;git@archiver.kernel.org>);
        Tue, 22 Mar 2022 14:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240106AbiCVSCX (ORCPT <rfc822;git@vger.kernel.org>);
        Tue, 22 Mar 2022 14:02:23 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4644B6833A
        for <git@vger.kernel.org>; Tue, 22 Mar 2022 11:00:47 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id q8so13191868wrc.0
        for <git@vger.kernel.org>; Tue, 22 Mar 2022 11:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:in-reply-to:references:from:date:subject:fcc
         :content-transfer-encoding:mime-version:to:cc;
        bh=ekpkFZZsg/xn+/xY3K+YVOvurMdWK/1l1/dNkxZdexU=;
        b=Py55XCVCoxUxS9b4kGG39xADMQXG1sdXa3yyEYoEs+y0PrdEnug3yseJhIoYeY+KyC
         i1DufSv1qQiP6UHkzHbGdJwhYMkqnlhaBAgV6T5tEoEBE9wH7Vr87rulE0die1bqfujG
         qbF+s3Z2X+jBVEqbxdkwPsQs7HOU1nwOaeRx8ldMmyR/5uRBMGalHUFtufIu/IDAoxQt
         y3Lh2yqQLsPETtAVuEr/QN9ay9Yh+rGwg0GkluLQnhT1gQnhaEl0IfKmt7mRQD1ohGz5
         nOnaUM02BiaKH9Fgm7vS8hYtsHhu/J9K40jzL3Bt0SOxhv2YI/+NTC1vK7O9W54wEl4d
         r38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:in-reply-to:references:from:date
         :subject:fcc:content-transfer-encoding:mime-version:to:cc;
        bh=ekpkFZZsg/xn+/xY3K+YVOvurMdWK/1l1/dNkxZdexU=;
        b=fOr18Mim1pe7umMrmU/1c4Fv/6R1EYc4JwZ4hIcvoUywphae62pc96pdbLL1Vdocuz
         HxOyTuabBFQn3jobyqFVtabm4HUc/NHryzSDImrG3Jt2Sa0X5Pk4hob9/BAky3rDt8Vk
         st90EsvisbYnvlLvDMp3+MECmNMkFzantGV0cCUMZoRjPPZitRlz/FuYnnxO4zWNXC59
         iNSWLQ+4t13kh5dv9EUXFofGx4A1KQmWGf+ijPD/VFNwGwDMllGLEmzD9F4EkzOgcX/+
         W7givcpP/ttWiZlAjqJ0w855vwE4neYMuf5eTeetyLqwOW0wJpwvxNC2REC0zHj2mYaq
         W+vA==
X-Gm-Message-State: AOAM530EU8SKPCsmgiVERSUf/Z5ddWO50vHoOk9p416BInRZkPAAOvNs
        n0q5KalCoIDl/QMfo0bVyeK++oWgeSI=
X-Google-Smtp-Source: ABdhPJwEq3dZlcV04SX99fx0DWFB13OxcHuqkhagymypEfESGK5Ot3KnX+Sr3JvNhL0mWuSnOMGk0g==
X-Received: by 2002:a5d:648f:0:b0:204:14ed:13a5 with SMTP id o15-20020a5d648f000000b0020414ed13a5mr8410261wri.162.1647972045626;
        Tue, 22 Mar 2022 11:00:45 -0700 (PDT)
Received: from [127.0.0.1] ([13.74.141.28])
        by smtp.gmail.com with ESMTPSA id h188-20020a1c21c5000000b0038c6c37efc3sm2337107wmh.12.2022.03.22.11.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 11:00:44 -0700 (PDT)
Message-Id: <1bd74a815937f6db8fae42afc0d0b780053087b8.1647972010.git.gitgitgadget@gmail.com>
In-Reply-To: <pull.1041.v7.git.1647972010.gitgitgadget@gmail.com>
References: <pull.1041.v6.git.1646160212.gitgitgadget@gmail.com>
        <pull.1041.v7.git.1647972010.gitgitgadget@gmail.com>
From:   "Jeff Hostetler via GitGitGadget" <gitgitgadget@gmail.com>
Date:   Tue, 22 Mar 2022 18:00:01 +0000
Subject: [PATCH v7 20/29] t/helper/fsmonitor-client: create IPC client to talk
 to FSMonitor Daemon
Fcc:    Sent
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
To:     git@vger.kernel.org
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>,
        =?UTF-8?Q?=C3=86var_Arnfj=C3=B6r=C3=B0?= Bjarmason 
        <avarab@gmail.com>, Jeff Hostetler <git@jeffhostetler.com>,
        Eric Sunshine <sunshine@sunshineco.com>,
        Johannes Schindelin <Johannes.Schindelin@gmx.de>,
        Tao Klerks <tao@klerks.biz>,
        Jeff Hostetler <jeffhost@microsoft.com>,
        Jeff Hostetler <jeffhost@microsoft.com>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

From: Jeff Hostetler <jeffhost@microsoft.com>

Create an IPC client to send query and flush commands to the daemon.

Signed-off-by: Jeff Hostetler <jeffhost@microsoft.com>
Signed-off-by: Junio C Hamano <gitster@pobox.com>
---
 Makefile                         |   1 +
 t/helper/test-fsmonitor-client.c | 116 +++++++++++++++++++++++++++++++
 t/helper/test-tool.c             |   1 +
 t/helper/test-tool.h             |   1 +
 4 files changed, 119 insertions(+)
 create mode 100644 t/helper/test-fsmonitor-client.c

diff --git a/Makefile b/Makefile
index 26567d4f772..daa21bed6c3 100644
--- a/Makefile
+++ b/Makefile
@@ -716,6 +716,7 @@ TEST_BUILTINS_OBJS += test-dump-split-index.o
 TEST_BUILTINS_OBJS += test-dump-untracked-cache.o
 TEST_BUILTINS_OBJS += test-example-decorate.o
 TEST_BUILTINS_OBJS += test-fast-rebase.o
+TEST_BUILTINS_OBJS += test-fsmonitor-client.o
 TEST_BUILTINS_OBJS += test-genrandom.o
 TEST_BUILTINS_OBJS += test-genzeros.o
 TEST_BUILTINS_OBJS += test-getcwd.o
diff --git a/t/helper/test-fsmonitor-client.c b/t/helper/test-fsmonitor-client.c
new file mode 100644
index 00000000000..3062c8a3c2b
--- /dev/null
+++ b/t/helper/test-fsmonitor-client.c
@@ -0,0 +1,116 @@
+/*
+ * test-fsmonitor-client.c: client code to send commands/requests to
+ * a `git fsmonitor--daemon` daemon.
+ */
+
+#include "test-tool.h"
+#include "cache.h"
+#include "parse-options.h"
+#include "fsmonitor-ipc.h"
+
+#ifndef HAVE_FSMONITOR_DAEMON_BACKEND
+int cmd__fsmonitor_client(int argc, const char **argv)
+{
+	die("fsmonitor--daemon not available on this platform");
+}
+#else
+
+/*
+ * Read the `.git/index` to get the last token written to the
+ * FSMonitor Index Extension.
+ */
+static const char *get_token_from_index(void)
+{
+	struct index_state *istate = the_repository->index;
+
+	if (do_read_index(istate, the_repository->index_file, 0) < 0)
+		die("unable to read index file");
+	if (!istate->fsmonitor_last_update)
+		die("index file does not have fsmonitor extension");
+
+	return istate->fsmonitor_last_update;
+}
+
+/*
+ * Send an IPC query to a `git-fsmonitor--daemon` daemon and
+ * ask for the changes since the given token or from the last
+ * token in the index extension.
+ *
+ * This will implicitly start a daemon process if necessary.  The
+ * daemon process will persist after we exit.
+ */
+static int do_send_query(const char *token)
+{
+	struct strbuf answer = STRBUF_INIT;
+	int ret;
+
+	if (!token || !*token)
+		token = get_token_from_index();
+
+	ret = fsmonitor_ipc__send_query(token, &answer);
+	if (ret < 0)
+		die("could not query fsmonitor--daemon");
+
+	write_in_full(1, answer.buf, answer.len);
+	strbuf_release(&answer);
+
+	return 0;
+}
+
+/*
+ * Send a "flush" command to the `git-fsmonitor--daemon` (if running)
+ * and tell it to flush its cache.
+ *
+ * This feature is primarily used by the test suite to simulate a loss of
+ * sync with the filesystem where we miss kernel events.
+ */
+static int do_send_flush(void)
+{
+	struct strbuf answer = STRBUF_INIT;
+	int ret;
+
+	ret = fsmonitor_ipc__send_command("flush", &answer);
+	if (ret)
+		return ret;
+
+	write_in_full(1, answer.buf, answer.len);
+	strbuf_release(&answer);
+
+	return 0;
+}
+
+int cmd__fsmonitor_client(int argc, const char **argv)
+{
+	const char *subcmd;
+	const char *token = NULL;
+
+	const char * const fsmonitor_client_usage[] = {
+		"test-tool fsmonitor-client query [<token>]",
+		"test-tool fsmonitor-client flush",
+		NULL,
+	};
+
+	struct option options[] = {
+		OPT_STRING(0, "token", &token, "token",
+			   "command token to send to the server"),
+		OPT_END()
+	};
+
+	argc = parse_options(argc, argv, NULL, options, fsmonitor_client_usage, 0);
+
+	if (argc != 1)
+		usage_with_options(fsmonitor_client_usage, options);
+
+	subcmd = argv[0];
+
+	setup_git_directory();
+
+	if (!strcmp(subcmd, "query"))
+		return !!do_send_query(token);
+
+	if (!strcmp(subcmd, "flush"))
+		return !!do_send_flush();
+
+	die("Unhandled subcommand: '%s'", subcmd);
+}
+#endif
diff --git a/t/helper/test-tool.c b/t/helper/test-tool.c
index e6ec69cf326..0424f7adf5d 100644
--- a/t/helper/test-tool.c
+++ b/t/helper/test-tool.c
@@ -32,6 +32,7 @@ static struct test_cmd cmds[] = {
 	{ "dump-untracked-cache", cmd__dump_untracked_cache },
 	{ "example-decorate", cmd__example_decorate },
 	{ "fast-rebase", cmd__fast_rebase },
+	{ "fsmonitor-client", cmd__fsmonitor_client },
 	{ "genrandom", cmd__genrandom },
 	{ "genzeros", cmd__genzeros },
 	{ "getcwd", cmd__getcwd },
diff --git a/t/helper/test-tool.h b/t/helper/test-tool.h
index 20756eefdda..c876e8246fb 100644
--- a/t/helper/test-tool.h
+++ b/t/helper/test-tool.h
@@ -23,6 +23,7 @@ int cmd__dump_untracked_cache(int argc, const char **argv);
 int cmd__dump_reftable(int argc, const char **argv);
 int cmd__example_decorate(int argc, const char **argv);
 int cmd__fast_rebase(int argc, const char **argv);
+int cmd__fsmonitor_client(int argc, const char **argv);
 int cmd__genrandom(int argc, const char **argv);
 int cmd__genzeros(int argc, const char **argv);
 int cmd__getcwd(int argc, const char **argv);
-- 
gitgitgadget

