Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9475C433FE
	for <git@archiver.kernel.org>; Wed, 16 Feb 2022 20:59:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233360AbiBPU7q (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 16 Feb 2022 15:59:46 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233301AbiBPU7j (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 16 Feb 2022 15:59:39 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C54B20204F
        for <git@vger.kernel.org>; Wed, 16 Feb 2022 12:59:25 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id d27so5451367wrc.6
        for <git@vger.kernel.org>; Wed, 16 Feb 2022 12:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:in-reply-to:references:from:date:subject:mime-version
         :content-transfer-encoding:fcc:to:cc;
        bh=VnDbq3/crc0j8aEiXfDkIyDrHvIgDhhMvQ9KEfsAHbs=;
        b=RTQK1QQPrTTY+eqRABFmE40Bp01i1B+YUW4d3/V4/1NXel36dsMxxwkyP6JmNVXhcl
         +fRMrEPGmpciMDfBx1RW0gG7ECe0zwUvqnXOk4CKSgZq0X7ze1h16M4wy/uU8XA2jM8S
         wUEEOuzGKeJQssU0c2brNuTcmojZbLJdWjb7OLy7R/JSEFru69QJmmRV06OEaM7wVcnO
         hpaWz/tstQqESK2wbIPC49QuO3KkhYPURgmMlO85PS1QafhINUAhsvwYzkMrlfweyup+
         Ageiq1IuOius0t3JhOQ5fN5pmKUfDaPvJd/Tkvbjk8fWMbjldiWB9cY/iM/rIcbqA7p8
         M8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:in-reply-to:references:from:date
         :subject:mime-version:content-transfer-encoding:fcc:to:cc;
        bh=VnDbq3/crc0j8aEiXfDkIyDrHvIgDhhMvQ9KEfsAHbs=;
        b=5/QCUle8cUk/S8h/yX2RpV795hgcakvkPr8r9cARHyCZK8SLLGjQOs12XcXouhMWtT
         7+u8BsKznILDljGCY1NJBeM4xQF6gkAM9Kpa52HnEd18PIajmfoQ4tCavZtisd1iseI2
         5b5qi2hB61EjS+zrPVLBLqi08oy4QTUmuoNiAp6uuq3HdJ9r1aSkRXNF3JzSEIjikP3q
         wG9xgB6KMumorHlCwA++3gPuQq0U6672LYyeNI4uad+GlfIQFjYbpw8Y1Pts2aycd14l
         2kKMzCw5GZ9lgRE31gfznWxnlRUXIwWyQUNmqagB6aQMpIgIsDOX6bHPkviwFqYdeqha
         apTA==
X-Gm-Message-State: AOAM532fBlFAXtKrsJo+G8RASRlNxjEEqyj1/OvQeY5QBS48ZpjoGsDH
        OnjUh25gYD6ASgK6FaV3XFB9+m2H92Q=
X-Google-Smtp-Source: ABdhPJzIj+zW5hv2uUVU7wOer9qVH2nLfEXBi5FXWmfAGu2jmqFIbO61GUORJcRfUzYB5Af63SafSg==
X-Received: by 2002:a05:6000:1a43:b0:1e7:8794:647c with SMTP id t3-20020a0560001a4300b001e78794647cmr3649815wry.261.1645045163581;
        Wed, 16 Feb 2022 12:59:23 -0800 (PST)
Received: from [127.0.0.1] ([13.74.141.28])
        by smtp.gmail.com with ESMTPSA id p27sm19964890wms.39.2022.02.16.12.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 12:59:22 -0800 (PST)
Message-Id: <dbe194f8a8592dd67d6ba3a11cb7b1c81b789cec.1645045157.git.gitgitgadget@gmail.com>
In-Reply-To: <pull.1212.v9.git.git.1645045157.gitgitgadget@gmail.com>
References: <pull.1212.v8.git.git.1645023740.gitgitgadget@gmail.com>
        <pull.1212.v9.git.git.1645045157.gitgitgadget@gmail.com>
From:   "John Cai via GitGitGadget" <gitgitgadget@gmail.com>
Date:   Wed, 16 Feb 2022 20:59:17 +0000
Subject: [PATCH v9 4/4] cat-file: add --batch-command mode
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Fcc:    Sent
To:     git@vger.kernel.org
Cc:     me@ttaylorr.com, phillip.wood123@gmail.com, avarab@gmail.com,
        e@80x24.org, bagasdotme@gmail.com, gitster@pobox.com,
        Eric Sunshine <sunshine@sunshineco.com>,
        Jonathan Tan <jonathantanmy@google.com>,
        Christian Couder <christian.couder@gmail.com>,
        John Cai <johncai86@gmail.com>, John Cai <johncai86@gmail.com>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

From: John Cai <johncai86@gmail.com>

Add a new flag --batch-command that accepts commands and arguments
from stdin, similar to git-update-ref --stdin.

At GitLab, we use a pair of long running cat-file processes when
accessing object content. One for iterating over object metadata with
--batch-check, and the other to grab object contents with --batch.

However, if we had --batch-command, we wouldn't need to keep both
processes around, and instead just have one --batch-command process
where we can flip between getting object info, and getting object
contents. Since we have a pair of cat-file processes per repository,
this means we can get rid of roughly half of long lived git cat-file
processes. Given there are many repositories being accessed at any given
time, this can lead to huge savings.

git cat-file --batch-command

will enter an interactive command mode whereby the user can enter in
commands and their arguments that get queued in memory:

<command1> [arg1] [arg2] LF
<command2> [arg1] [arg2] LF

When --buffer mode is used, commands will be queued in memory until a
flush command is issued that execute them:

flush LF

The reason for a flush command is that when a consumer process (A)
talks to a git cat-file process (B) and interactively writes to and
reads from it in --buffer mode, (A) needs to be able to control when
the buffer is flushed to stdout.

Currently, from (A)'s perspective, the only way is to either

1. kill (B)'s process
2. send an invalid object to stdin.

1. is not ideal from a performance perspective as it will require
spawning a new cat-file process each time, and 2. is hacky and not a
good long term solution.

With this mechanism of queueing up commands and letting (A) issue a
flush command, process (A) can control when the buffer is flushed and
can guarantee it will receive all of the output when in --buffer mode.
--batch-command also will not allow (B) to flush to stdout until a flush
is received.

This patch adds the basic structure for adding command which can be
extended in the future to add more commands. It also adds the following
two commands (on top of the flush command):

contents <object> LF
info <object> LF

The contents command takes an <object> argument and prints out the object
contents.

The info command takes an <object> argument and prints out the object
metadata.

These can be used in the following way with --buffer:

info <object> LF
contents <object> LF
contents <object> LF
info <object> LF
flush LF
info <object> LF
flush LF

When used without --buffer:

info <object> LF
contents <object> LF
contents <object> LF
info <object> LF
info <object> LF

Helped-by: Ævar Arnfjörð Bjarmason <avarab@gmail.com>
Signed-off-by: John Cai <johncai86@gmail.com>
---
 Documentation/git-cat-file.txt |  42 +++++++++-
 builtin/cat-file.c             | 147 ++++++++++++++++++++++++++++++++-
 t/README                       |   3 +
 t/t1006-cat-file.sh            | 107 +++++++++++++++++++++++-
 4 files changed, 293 insertions(+), 6 deletions(-)

diff --git a/Documentation/git-cat-file.txt b/Documentation/git-cat-file.txt
index bef76f4dd06..70c5b4f12d1 100644
--- a/Documentation/git-cat-file.txt
+++ b/Documentation/git-cat-file.txt
@@ -96,6 +96,33 @@ OPTIONS
 	need to specify the path, separated by whitespace.  See the
 	section `BATCH OUTPUT` below for details.
 
+--batch-command::
+--batch-command=<format>::
+	Enter a command mode that reads commands and arguments from stdin. May
+	only be combined with `--buffer`, `--textconv` or `--filters`. In the
+	case of `--textconv` or `--filters`, the input lines also need to specify
+	the path, separated by whitespace. See the section `BATCH OUTPUT` below
+	for details.
++
+`--batch-command` recognizes the following commands:
++
+--
+contents <object>::
+	Print object contents for object reference `<object>`. This corresponds to
+	the output of `--batch`.
+
+info <object>::
+	Print object info for object reference `<object>`. This corresponds to the
+	output of `--batch-check`.
+
+flush::
+	Used with `--buffer` to execute all preceding commands that were issued
+	since the beginning or since the last flush was issued. When `--buffer`
+	is used, no output will come until a `flush` is issued. When `--buffer`
+	is not used, commands are flushed each time without issuing `flush`.
+--
++
+
 --batch-all-objects::
 	Instead of reading a list of objects on stdin, perform the
 	requested batch operation on all objects in the repository and
@@ -110,7 +137,7 @@ OPTIONS
 	that a process can interactively read and write from
 	`cat-file`. With this option, the output uses normal stdio
 	buffering; this is much more efficient when invoking
-	`--batch-check` on a large number of objects.
+	`--batch-check` or `--batch-command` on a large number of objects.
 
 --unordered::
 	When `--batch-all-objects` is in use, visit objects in an
@@ -202,6 +229,13 @@ from stdin, one per line, and print information about them. By default,
 the whole line is considered as an object, as if it were fed to
 linkgit:git-rev-parse[1].
 
+When `--batch-command` is given, `cat-file` will read commands from stdin,
+one per line, and print information based on the command given. With
+`--batch-command`, the `info` command followed by an object will print
+information about the object the same way `--batch-check` would, and the
+`contents` command followed by an object prints contents in the same way
+`--batch` would.
+
 You can specify the information shown for each object by using a custom
 `<format>`. The `<format>` is copied literally to stdout for each
 object, with placeholders of the form `%(atom)` expanded, followed by a
@@ -237,9 +271,9 @@ newline. The available atoms are:
 If no format is specified, the default format is `%(objectname)
 %(objecttype) %(objectsize)`.
 
-If `--batch` is specified, the object information is followed by the
-object contents (consisting of `%(objectsize)` bytes), followed by a
-newline.
+If `--batch` is specified, or if `--batch-command` is used with the `contents`
+command, the object information is followed by the object contents (consisting
+of `%(objectsize)` bytes), followed by a newline.
 
 For example, `--batch` without a custom format would produce:
 
diff --git a/builtin/cat-file.c b/builtin/cat-file.c
index 5e38af82af1..3dc960e9f85 100644
--- a/builtin/cat-file.c
+++ b/builtin/cat-file.c
@@ -20,6 +20,7 @@
 enum batch_mode {
 	BATCH_MODE_CONTENTS,
 	BATCH_MODE_INFO,
+	BATCH_MODE_QUEUE_AND_DISPATCH,
 };
 
 struct batch_options {
@@ -513,6 +514,138 @@ static int batch_unordered_packed(const struct object_id *oid,
 				      data);
 }
 
+typedef void (*parse_cmd_fn_t)(struct batch_options *, const char *,
+			       struct strbuf *, struct expand_data *);
+
+struct queued_cmd {
+	parse_cmd_fn_t fn;
+	char *line;
+};
+
+static void parse_cmd_contents(struct batch_options *opt,
+			     const char *line,
+			     struct strbuf *output,
+			     struct expand_data *data)
+{
+	opt->batch_mode = BATCH_MODE_CONTENTS;
+	batch_one_object(line, output, opt, data);
+}
+
+static void parse_cmd_info(struct batch_options *opt,
+			   const char *line,
+			   struct strbuf *output,
+			   struct expand_data *data)
+{
+	opt->batch_mode = BATCH_MODE_INFO;
+	batch_one_object(line, output, opt, data);
+}
+
+static void dispatch_calls(struct batch_options *opt,
+		struct strbuf *output,
+		struct expand_data *data,
+		struct queued_cmd *cmd,
+		int nr)
+{
+	int i;
+
+	if (!opt->buffer_output)
+		die(_("flush is only for --buffer mode"));
+
+	for (i = 0; i < nr; i++)
+		cmd[i].fn(opt, cmd[i].line, output, data);
+
+	fflush(stdout);
+}
+
+static void free_cmds(struct queued_cmd *cmd, int nr)
+{
+	int i;
+
+	for (i = 0; i < nr; i++)
+		FREE_AND_NULL(cmd[i].line);
+}
+
+
+static const struct parse_cmd {
+	const char *name;
+	parse_cmd_fn_t fn;
+	unsigned takes_args;
+} commands[] = {
+	{ "contents", parse_cmd_contents, 1},
+	{ "info", parse_cmd_info, 1},
+	{ "flush", NULL, 0},
+};
+
+static void batch_objects_command(struct batch_options *opt,
+				    struct strbuf *output,
+				    struct expand_data *data)
+{
+	struct strbuf input = STRBUF_INIT;
+	struct queued_cmd *queued_cmd = NULL;
+	size_t alloc = 0, nr = 0;
+
+	while (!strbuf_getline(&input, stdin)) {
+		int i;
+		const struct parse_cmd *cmd = NULL;
+		const char *p = NULL, *cmd_end;
+		struct queued_cmd call = {0};
+
+		if (!input.len)
+			die(_("empty command in input"));
+		if (isspace(*input.buf))
+			die(_("whitespace before command: '%s'"), input.buf);
+
+		for (i = 0; i < ARRAY_SIZE(commands); i++) {
+			if (!skip_prefix(input.buf, commands[i].name, &cmd_end))
+				continue;
+
+			cmd = &commands[i];
+			if (cmd->takes_args) {
+				if (*cmd_end != ' ')
+					die(_("%s requires arguments"),
+					    commands[i].name);
+
+				p = cmd_end + 1;
+			} else if (*cmd_end) {
+				die(_("%s takes no arguments"),
+				    commands[i].name);
+			}
+
+			break;
+		}
+
+		if (!cmd)
+			die(_("unknown command: '%s'"), input.buf);
+
+		if (!strcmp(cmd->name, "flush")) {
+			dispatch_calls(opt, output, data, queued_cmd, nr);
+			free_cmds(queued_cmd, nr);
+			nr = 0;
+			continue;
+		}
+
+		if (!opt->buffer_output) {
+			cmd->fn(opt, p, output, data);
+			continue;
+		}
+
+		ALLOC_GROW(queued_cmd, nr + 1, alloc);
+		call.fn = cmd->fn;
+		call.line = xstrdup_or_null(p);
+		queued_cmd[nr++] = call;
+	}
+
+	if (opt->buffer_output &&
+	    nr &&
+	    !git_env_bool("GIT_TEST_CAT_FILE_NO_FLUSH_ON_EXIT", 0)) {
+		dispatch_calls(opt, output, data, queued_cmd, nr);
+		free_cmds(queued_cmd, nr);
+	}
+
+	free(queued_cmd);
+	strbuf_release(&input);
+}
+
 static int batch_objects(struct batch_options *opt)
 {
 	struct strbuf input = STRBUF_INIT;
@@ -595,6 +728,11 @@ static int batch_objects(struct batch_options *opt)
 	save_warning = warn_on_object_refname_ambiguity;
 	warn_on_object_refname_ambiguity = 0;
 
+	if (opt->batch_mode == BATCH_MODE_QUEUE_AND_DISPATCH) {
+		batch_objects_command(opt, &output, &data);
+		goto cleanup;
+	}
+
 	while (strbuf_getline(&input, stdin) != EOF) {
 		if (data.split_on_whitespace) {
 			/*
@@ -613,6 +751,7 @@ static int batch_objects(struct batch_options *opt)
 		batch_one_object(input.buf, &output, opt, &data);
 	}
 
+ cleanup:
 	strbuf_release(&input);
 	strbuf_release(&output);
 	warn_on_object_refname_ambiguity = save_warning;
@@ -645,6 +784,8 @@ static int batch_option_callback(const struct option *opt,
 		bo->batch_mode = BATCH_MODE_CONTENTS;
 	else if (!strcmp(opt->long_name, "batch-check"))
 		bo->batch_mode = BATCH_MODE_INFO;
+	else if (!strcmp(opt->long_name, "batch-command"))
+		bo->batch_mode = BATCH_MODE_QUEUE_AND_DISPATCH;
 	else
 		BUG("%s given to batch-option-callback", opt->long_name);
 
@@ -666,7 +807,7 @@ int cmd_cat_file(int argc, const char **argv, const char *prefix)
 		N_("git cat-file <type> <object>"),
 		N_("git cat-file (-e | -p) <object>"),
 		N_("git cat-file (-t | -s) [--allow-unknown-type] <object>"),
-		N_("git cat-file (--batch | --batch-check) [--batch-all-objects]\n"
+		N_("git cat-file (--batch | --batch-check | --batch-command) [--batch-all-objects]\n"
 		   "             [--buffer] [--follow-symlinks] [--unordered]\n"
 		   "             [--textconv | --filters]"),
 		N_("git cat-file (--textconv | --filters)\n"
@@ -695,6 +836,10 @@ int cmd_cat_file(int argc, const char **argv, const char *prefix)
 			N_("like --batch, but don't emit <contents>"),
 			PARSE_OPT_OPTARG | PARSE_OPT_NONEG,
 			batch_option_callback),
+		OPT_CALLBACK_F(0, "batch-command", &batch, N_("format"),
+			N_("read commands from stdin"),
+			PARSE_OPT_OPTARG | PARSE_OPT_NONEG,
+			batch_option_callback),
 		OPT_CMDMODE(0, "batch-all-objects", &opt,
 			    N_("with --batch[-check]: ignores stdin, batches all known objects"), 'b'),
 		/* Batch-specific options */
diff --git a/t/README b/t/README
index f48e0542cdc..bcd813b0c59 100644
--- a/t/README
+++ b/t/README
@@ -472,6 +472,9 @@ a test and then fails then the whole test run will abort. This can help to make
 sure the expected tests are executed and not silently skipped when their
 dependency breaks or is simply not present in a new environment.
 
+GIT_TEST_CAT_FILE_NO_FLUSH_ON_EXIT=<boolean>, when true will prevent cat-file
+--batch-command from flushing to output on exit.
+
 Naming Tests
 ------------
 
diff --git a/t/t1006-cat-file.sh b/t/t1006-cat-file.sh
index 2d52851dadc..74f0e36b69e 100755
--- a/t/t1006-cat-file.sh
+++ b/t/t1006-cat-file.sh
@@ -182,6 +182,24 @@ $content"
 	test_cmp expect actual
     '
 
+    for opt in --buffer --no-buffer
+    do
+	test -z "$content" ||
+		test_expect_success "--batch-command $opt output of $type content is correct" '
+		maybe_remove_timestamp "$batch_output" $no_ts >expect &&
+		maybe_remove_timestamp "$(test_write_lines "contents $sha1" \
+		| git cat-file --batch-command $opt)" $no_ts >actual &&
+		test_cmp expect actual
+	'
+
+	test_expect_success "--batch-command $opt output of $type info is correct" '
+		echo "$sha1 $type $size" >expect &&
+		test_write_lines "info $sha1" \
+		| git cat-file --batch-command $opt >actual &&
+		test_cmp expect actual
+	'
+    done
+
     test_expect_success "custom --batch-check format" '
 	echo "$type $sha1" >expect &&
 	echo $sha1 | git cat-file --batch-check="%(objecttype) %(objectname)" >actual &&
@@ -229,6 +247,22 @@ test_expect_success "setup" '
 
 run_tests 'blob' $hello_sha1 $hello_size "$hello_content" "$hello_content"
 
+test_expect_success '--batch-command --buffer with flush for blob info' '
+	echo "$hello_sha1 blob $hello_size" >expect &&
+	test_write_lines "info $hello_sha1" "flush" | \
+	GIT_TEST_CAT_FILE_NO_FLUSH_ON_EXIT=1 \
+	git cat-file --batch-command --buffer >actual &&
+	test_cmp expect actual
+'
+
+test_expect_success '--batch-command --buffer without flush for blob info' '
+	touch output &&
+	test_write_lines "info $hello_sha1" | \
+	GIT_TEST_CAT_FILE_NO_FLUSH_ON_EXIT=1 \
+	git cat-file --batch-command --buffer >>output &&
+	test_must_be_empty output
+'
+
 test_expect_success '--batch-check without %(rest) considers whole line' '
 	echo "$hello_sha1 blob $hello_size" >expect &&
 	git update-index --add --cacheinfo 100644 $hello_sha1 "white space" &&
@@ -272,7 +306,7 @@ test_expect_success \
     "Reach a blob from a tag pointing to it" \
     "test '$hello_content' = \"\$(git cat-file blob $tag_sha1)\""
 
-for batch in batch batch-check
+for batch in batch batch-check batch-command
 do
     for opt in t s e p
     do
@@ -378,6 +412,42 @@ test_expect_success "--batch-check with multiple sha1s gives correct format" '
     "$(echo_without_newline "$batch_check_input" | git cat-file --batch-check)"
 '
 
+test_expect_success '--batch-command with multiple info calls gives correct format' '
+	cat >expect <<-EOF &&
+	$hello_sha1 blob $hello_size
+	$tree_sha1 tree $tree_size
+	$commit_sha1 commit $commit_size
+	$tag_sha1 tag $tag_size
+	deadbeef missing
+	EOF
+
+	test_write_lines "info $hello_sha1"\
+	"info $tree_sha1"\
+	"info $commit_sha1"\
+	"info $tag_sha1"\
+	"info deadbeef" | git cat-file --batch-command --buffer >actual &&
+	test_cmp expect actual
+'
+
+test_expect_success '--batch-command with multiple command calls gives correct format' '
+	remove_timestamp >expect <<-EOF &&
+	$hello_sha1 blob $hello_size
+	$hello_content
+	$commit_sha1 commit $commit_size
+	$commit_content
+	$tag_sha1 tag $tag_size
+	$tag_content
+	deadbeef missing
+	EOF
+
+	test_write_lines "contents $hello_sha1"\
+	"contents $commit_sha1"\
+	"contents $tag_sha1"\
+	"contents deadbeef"\
+	"flush" | git cat-file --batch-command --buffer | remove_timestamp >actual &&
+	test_cmp expect actual
+'
+
 test_expect_success 'setup blobs which are likely to delta' '
 	test-tool genrandom foo 10240 >foo &&
 	{ cat foo && echo plus; } >foo-plus &&
@@ -968,5 +1038,40 @@ test_expect_success 'cat-file --batch-all-objects --batch-check ignores replace'
 	echo "$orig commit $orig_size" >expect &&
 	test_cmp expect actual
 '
+test_expect_success 'batch-command empty command' '
+	echo "" >cmd &&
+	test_expect_code 128 git cat-file --batch-command <cmd 2>err &&
+	grep "^fatal:.*empty command in input.*" err
+'
+
+test_expect_success 'batch-command whitespace before command' '
+	echo " info deadbeef" >cmd &&
+	test_expect_code 128 git cat-file --batch-command <cmd 2>err &&
+	grep "^fatal:.*whitespace before command.*" err
+'
+
+test_expect_success 'batch-command unknown command' '
+	echo unknown_command >cmd &&
+	test_expect_code 128 git cat-file --batch-command <cmd 2>err &&
+	grep "^fatal:.*unknown command.*" err
+'
+
+test_expect_success 'batch-command missing arguments' '
+	echo "info" >cmd &&
+	test_expect_code 128 git cat-file --batch-command <cmd 2>err &&
+	grep "^fatal:.*info requires arguments.*" err
+'
+
+test_expect_success 'batch-command flush with arguments' '
+	echo "flush arg" >cmd &&
+	test_expect_code 128 git cat-file --batch-command --buffer <cmd 2>err &&
+	grep "^fatal:.*flush takes no arguments.*" err
+'
+
+test_expect_success 'batch-command flush without --buffer' '
+	echo "flush" >cmd &&
+	test_expect_code 128 git cat-file --batch-command <cmd 2>err &&
+	grep "^fatal:.*flush is only for --buffer mode.*" err
+'
 
 test_done
-- 
gitgitgadget
