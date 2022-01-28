Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25AD0C433EF
	for <git@archiver.kernel.org>; Fri, 28 Jan 2022 18:33:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350565AbiA1Sdw (ORCPT <rfc822;git@archiver.kernel.org>);
        Fri, 28 Jan 2022 13:33:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbiA1Sdt (ORCPT <rfc822;git@vger.kernel.org>);
        Fri, 28 Jan 2022 13:33:49 -0500
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91940C061714
        for <git@vger.kernel.org>; Fri, 28 Jan 2022 10:33:49 -0800 (PST)
Received: by mail-qk1-x72e.google.com with SMTP id 200so6367205qki.2
        for <git@vger.kernel.org>; Fri, 28 Jan 2022 10:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JrkRqwAA6IvGcgVyqh+hm5Pzx6WHeoOjMGAD58fICPw=;
        b=liBfupL6UwJuUEAjxtfDYuIDC18NZbp9jtF9CRVyR+1oBWncZgVLSuyYFbZhwB4/+H
         uIEPErB6sy8Jzz4kjsWzfzLylOwQum6Ie4o7nlczKqujS6Ufb5L4fXP8AmyFuDMClr+p
         G0d8YvWYGNuCjTf+EvOG+nYdSygm41P2/Y610xct9xsjaRrwknfV4MMdjmIo4v76jLyd
         NbheLetmFCBzPOjINGMEf66Ncg93Uyg8RCHZ+Ts8HcjpCOoVPDZxDdnIdSQrVSepb2hZ
         HfrX/NOJVJsps11qMKZgBSlIgFOoXzL1fvbkSoV11YbxaO7Sp7GWWkIGGe93MW0x0vDu
         zAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JrkRqwAA6IvGcgVyqh+hm5Pzx6WHeoOjMGAD58fICPw=;
        b=cNUvLYQIxxCeyWQYwAGG9q0xx0TT/l9qF2iYT7NM+SUkH0kDDodWRGGzmgKxwhZADn
         Z88pKHYt0gLmVw+canr0V9E7glBA0X4Rk0C4GqdInHU06bUNiBBjhdY+7DMLufTsCFI+
         zEPh3Y+w06wbHA8FmmkEjDGUq8v/4aEZgECERKZzWyVlr5trIyX2vbyGaunI3eeYPVwB
         VcEQFNeJbB5oTc/kqX3u1tCwoj71Gpq4dVpdm7wuiY6jEYbPIq9SMRmvk99AGu4+WXXe
         lDo8pi87okF3BOh3XXS03ScYgrBRc+bIr15ubK6RJO277Xiy68nT1Y7D0Pv55OmUMtZa
         +9ZQ==
X-Gm-Message-State: AOAM531kIhRUoO+OZqkFp2lLvkXalTZcIkKykqNmWx3KuE/dA8CU4jMo
        obIOFAj1fE4KpeWCc3kpt7B6nctHiQ6YkQ==
X-Google-Smtp-Source: ABdhPJwVF+cVRYiTdNF5BcBiweV9TW5LiKXWqB2yHQ1Tc8Hp+JjaXM4fs+AkmjCgS+pQFTNdvoKEOQ==
X-Received: by 2002:a05:620a:d42:: with SMTP id o2mr6402317qkl.51.1643394828433;
        Fri, 28 Jan 2022 10:33:48 -0800 (PST)
Received: from Johns-MBP.myfiosgateway.com (pool-108-35-55-112.nwrknj.fios.verizon.net. [108.35.55.112])
        by smtp.gmail.com with ESMTPSA id bq13sm3869987qkb.9.2022.01.28.10.33.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 28 Jan 2022 10:33:47 -0800 (PST)
From:   John Cai <johncai86@gmail.com>
To:     git@vger.kernel.org
Cc:     avarab@gmail.com, me@ttaylorr.com, phillip.wood123@gmail.com,
        e@80x24.org, John Cai <johncai86@gmail.com>
Subject: [RFC v3] cat-file: add a --stdin-cmd mode
Date:   Fri, 28 Jan 2022 13:33:19 -0500
Message-Id: <20220128183319.43496-1-johncai86@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

This RFC patch proposes a new flag --batch-command that works with
git-cat-file --batch. Similar to git-update-ref --stdin, it will accept
commands and arguments from stdin.

The start of this idea was discussed in [1], where the original
motivation was to be able to control when the buffer was flushed to
stdout in --buffer mode.

However, this can actually be much more useful in situations when
git-cat-file --batch is being used as a long lived backend query
process. At GitLab, we use a pair of cat-file processes. One for
iterating over object metadata with --batch-check, and the other to grab
object contents with --batch. However, if we had --batch-command, we could
get rid of the second --batch-check process, and just have one process
where we can flip between getting object info, and getting object contents.
This can lead to huge savings since on a given server there could be hundreds to
thousands of git cat-file processes at a time.

git cat-file --batch-command

$ <command> [arg1] [arg2] NL

This patch adds three commands: object, info, fflush

$ object <sha1> NL
$ info <sha1> NL
$ fflush NL

These three would be immediately useful in GitLab's context, but one can
imagine this mode to be further extended for other things.

Future improvements:
- a non-trivial part of "cat-file --batch" time is spent
on parsing its argument and seeing if it's a revision, ref etc. So we
could add a command that only accepts a full-length 40
character SHA-1.

This would be the first step in adding such an interface to
git-cat-file.

[1] https://lore.kernel.org/git/pull.1124.git.git.1636149400.gitgitgadget@gmail.com/

Helped-by: Ævar Arnfjörð Bjarmason <avarab@gmail.com>
Signed-off-by: John Cai <johncai86@gmail.com>
---

Taylor, I'd be interested in your thoughts on this proposal since you helped
review the previous patch that turned into this RFC. Thanks!

Changes from v2:

- refactored tests to be within run_tests()
- added a test to test --buffer behavior with fflush
- cleaned up cat-file.c: clarified var names, removed unnecessary code
  based on suggestions from Phillip Wood
- removed strvec changes

Changes from v1:

- changed option name to batch-command.
- changed command function interface to receive the whole line after the command
  name to put the onus of parsing arguments to each individual command function.
- pass in whole line to batch_one_object in both parse_cmd_object and
  parse_cmd_info to support spaces in the object reference.
- removed addition of -z to include in a separate patch series
- added documentation.
---
 Documentation/git-cat-file.txt |  15 +++++
 builtin/cat-file.c             | 114 +++++++++++++++++++++++++++++++--
 t/t1006-cat-file.sh            |  83 ++++++++++++++++++++++++
 3 files changed, 205 insertions(+), 7 deletions(-)

diff --git a/Documentation/git-cat-file.txt b/Documentation/git-cat-file.txt
index bef76f4dd0..254e546c79 100644
--- a/Documentation/git-cat-file.txt
+++ b/Documentation/git-cat-file.txt
@@ -96,6 +96,21 @@ OPTIONS
 	need to specify the path, separated by whitespace.  See the
 	section `BATCH OUTPUT` below for details.
 
+--batch-command::
+	Enter a command mode that reads from stdin. May not be combined with any
+	other options or arguments except `--textconv` or `--filters`, in which
+	case the input lines also need to specify the path, separated by
+	whitespace.  See the section `BATCH OUTPUT` below for details.
+
+object <object>::
+	Print object contents for object reference <object>
+
+info <object>::
+	Print object info for object reference <object>
+
+flush::
+	Flush to stdout immediately when used with --buffer
+
 --batch-all-objects::
 	Instead of reading a list of objects on stdin, perform the
 	requested batch operation on all objects in the repository and
diff --git a/builtin/cat-file.c b/builtin/cat-file.c
index 7b3f42950e..cc9e47943b 100644
--- a/builtin/cat-file.c
+++ b/builtin/cat-file.c
@@ -24,9 +24,11 @@ struct batch_options {
 	int buffer_output;
 	int all_objects;
 	int unordered;
-	int cmdmode; /* may be 'w' or 'c' for --filters or --textconv */
+	int mode; /* may be 'w' or 'c' for --filters or --textconv */
 	const char *format;
+	int command;
 };
+static char line_termination = '\n';
 
 static const char *force_path;
 
@@ -302,19 +304,19 @@ static void print_object_or_die(struct batch_options *opt, struct expand_data *d
 	if (data->type == OBJ_BLOB) {
 		if (opt->buffer_output)
 			fflush(stdout);
-		if (opt->cmdmode) {
+		if (opt->mode) {
 			char *contents;
 			unsigned long size;
 
 			if (!data->rest)
 				die("missing path for '%s'", oid_to_hex(oid));
 
-			if (opt->cmdmode == 'w') {
+			if (opt->mode == 'w') {
 				if (filter_object(data->rest, 0100644, oid,
 						  &contents, &size))
 					die("could not convert '%s' %s",
 					    oid_to_hex(oid), data->rest);
-			} else if (opt->cmdmode == 'c') {
+			} else if (opt->mode == 'c') {
 				enum object_type type;
 				if (!textconv_object(the_repository,
 						     data->rest, 0100644, oid,
@@ -326,7 +328,7 @@ static void print_object_or_die(struct batch_options *opt, struct expand_data *d
 					die("could not convert '%s' %s",
 					    oid_to_hex(oid), data->rest);
 			} else
-				BUG("invalid cmdmode: %c", opt->cmdmode);
+				BUG("invalid mode: %c", opt->mode);
 			batch_write(opt, contents, size);
 			free(contents);
 		} else {
@@ -508,6 +510,95 @@ static int batch_unordered_packed(const struct object_id *oid,
 				      data);
 }
 
+static void parse_cmd_object(struct batch_options *opt,
+			     const char *line,
+			     struct strbuf *output,
+			     struct expand_data *data)
+{
+	opt->print_contents = 1;
+	batch_one_object(line, output, opt, data);
+}
+
+static void parse_cmd_info(struct batch_options *opt,
+			   const char *line,
+			   struct strbuf *output,
+			   struct expand_data *data)
+{
+	opt->print_contents = 0;
+	batch_one_object(line, output, opt, data);
+}
+
+static void parse_cmd_fflush(struct batch_options *opt,
+			     const char *line,
+			     struct strbuf *output,
+			     struct expand_data *data)
+{
+	fflush(stdout);
+}
+
+typedef void (*parse_cmd_fn_t)(struct batch_options *, const char *,
+			       struct strbuf *, struct expand_data *);
+
+static const struct parse_cmd {
+	const char *prefix;
+	parse_cmd_fn_t fn;
+	unsigned takes_args;
+} commands[] = {
+	{ "object", parse_cmd_object, 1},
+	{ "info", parse_cmd_info, 1},
+	{ "fflush", parse_cmd_fflush, 0},
+};
+
+static void batch_objects_command(struct batch_options *opt,
+				    struct strbuf *output,
+				    struct expand_data *data)
+{
+	struct strbuf input = STRBUF_INIT;
+
+	/* Read each line dispatch its command */
+	while (!strbuf_getwholeline(&input, stdin, line_termination)) {
+		int i;
+		const struct parse_cmd *cmd = NULL;
+		const char *p, *cmd_end;
+
+		if (*input.buf == line_termination)
+			die("empty command in input");
+		else if (isspace(*input.buf))
+			die("whitespace before command: %s", input.buf);
+
+		for (i = 0; i < ARRAY_SIZE(commands); i++) {
+			const char *prefix = commands[i].prefix;
+			char c;
+			if (!skip_prefix(input.buf, prefix, &cmd_end))
+				continue;
+			/*
+			 * If the command has arguments, verify that it's
+			 * followed by a space. Otherwise, it shall be followed
+			 * by a line terminator.
+			 */
+			c = commands[i].takes_args ? ' ' : line_termination;
+			if (input.buf[strlen(prefix)] != c)
+				die("arguments invalid for command: %s", commands[i].prefix);
+
+			cmd = &commands[i];
+			if (cmd->takes_args) {
+				p = cmd_end + 1;
+				// strip newline before handing it to the
+				// handling function
+				input.buf[strcspn(input.buf, "\n")] = '\0';
+			}
+
+			break;
+		}
+
+		if (!cmd)
+			die("unknown command: %s", input.buf);
+
+		cmd->fn(opt, p, output, data);
+	}
+	strbuf_release(&input);
+}
+
 static int batch_objects(struct batch_options *opt)
 {
 	struct strbuf input = STRBUF_INIT;
@@ -515,6 +606,7 @@ static int batch_objects(struct batch_options *opt)
 	struct expand_data data;
 	int save_warning;
 	int retval = 0;
+	const int command = opt->command;
 
 	if (!opt->format)
 		opt->format = "%(objectname) %(objecttype) %(objectsize)";
@@ -529,7 +621,7 @@ static int batch_objects(struct batch_options *opt)
 	strbuf_expand(&output, opt->format, expand_format, &data);
 	data.mark_query = 0;
 	strbuf_release(&output);
-	if (opt->cmdmode)
+	if (opt->mode)
 		data.split_on_whitespace = 1;
 
 	/*
@@ -590,6 +682,9 @@ static int batch_objects(struct batch_options *opt)
 	save_warning = warn_on_object_refname_ambiguity;
 	warn_on_object_refname_ambiguity = 0;
 
+	if (command)
+		batch_objects_command(opt, &output, &data);
+
 	while (strbuf_getline(&input, stdin) != EOF) {
 		if (data.split_on_whitespace) {
 			/*
@@ -636,6 +731,7 @@ static int batch_option_callback(const struct option *opt,
 
 	bo->enabled = 1;
 	bo->print_contents = !strcmp(opt->long_name, "batch");
+	bo->command = !strcmp(opt->long_name, "batch-command");
 	bo->format = arg;
 
 	return 0;
@@ -683,6 +779,10 @@ int cmd_cat_file(int argc, const char **argv, const char *prefix)
 			N_("like --batch, but don't emit <contents>"),
 			PARSE_OPT_OPTARG | PARSE_OPT_NONEG,
 			batch_option_callback),
+		OPT_CALLBACK_F(0, "batch-command", &batch, N_(""),
+			 N_("enters batch mode that accepts commands"),
+			 PARSE_OPT_NOARG | PARSE_OPT_NONEG,
+			 batch_option_callback),
 		OPT_CMDMODE(0, "batch-all-objects", &opt,
 			    N_("with --batch[-check]: ignores stdin, batches all known objects"), 'b'),
 		/* Batch-specific options */
@@ -742,7 +842,7 @@ int cmd_cat_file(int argc, const char **argv, const char *prefix)
 	/* Return early if we're in batch mode? */
 	if (batch.enabled) {
 		if (opt_cw)
-			batch.cmdmode = opt;
+			batch.mode = opt;
 		else if (opt && opt != 'b')
 			usage_msg_optf(_("'-%c' is incompatible with batch mode"),
 				       usage, options, opt);
diff --git a/t/t1006-cat-file.sh b/t/t1006-cat-file.sh
index 145eee11df..92f0b14a95 100755
--- a/t/t1006-cat-file.sh
+++ b/t/t1006-cat-file.sh
@@ -112,6 +112,46 @@ maybe_remove_timestamp () {
     fi
 }
 
+run_buffer_test () {
+	type=$1
+	sha1=$2
+	size=$3
+	flush=$4
+
+	mkfifo V.input
+	exec 8<>V.input
+	rm V.input
+
+	mkfifo V.output
+	exec 9<>V.output
+	rm V.output
+	
+	(
+		git cat-file --buffer --batch-command <&8 >&9 &
+		echo $! >&9 &&
+		wait $!
+		echo >&9 EARLY_EXIT
+	) &
+	sh_pid=$!
+	read fi_pid <&9
+	test_when_finished "
+		exec 8>&-; exec 9>&-;
+		kill $sh_pid && wait $sh_pid
+		kill $fi_pid && wait $fi_pid
+		true"
+	expect=$(echo "$sha1 $type $size")
+	echo "info $sha1" >&8
+	if test "$flush" = "true"
+	then
+		echo "fflush" >&8
+	else
+		expect="EARLY_EXIT"
+		kill $fi_pid && wait $fi_pid
+	fi
+	read actual <&9
+	test "$actual" = "$expect"
+}
+
 run_tests () {
     type=$1
     sha1=$2
@@ -177,6 +217,18 @@ $content"
 	test_cmp expect actual
     '
 
+    test -z "$content" ||
+    test_expect_success "--batch-command output of $type content is correct" '
+	maybe_remove_timestamp "$batch_output" $no_ts >expect &&
+	maybe_remove_timestamp "$(echo object $sha1 | git cat-file --batch-command)" $no_ts >actual &&
+	test_cmp expect actual
+    '
+
+    test_expect_success "batch-command output of $type info is correct" '
+	echo "$sha1 $type $size" >expect &&
+	echo "info $sha1" | git cat-file --batch-command >actual &&
+	test_cmp expect actual
+'
     test_expect_success "custom --batch-check format" '
 	echo "$type $sha1" >expect &&
 	echo $sha1 | git cat-file --batch-check="%(objecttype) %(objectname)" >actual &&
@@ -232,12 +284,29 @@ test_expect_success '--batch-check without %(rest) considers whole line' '
 	test_cmp expect actual
 '
 
+test_expect_success '--batch-command --buffer with flush is correct for blob' '
+	run_buffer_test 'blob' $hello_sha1 $hello_size true
+'
+
+test_expect_success '--batch-command --buffer without flush is correct for blob' '
+	run_buffer_test 'blob' $hello_sha1 $hello_size false
+'
+
 tree_sha1=$(git write-tree)
+
 tree_size=$(($(test_oid rawsz) + 13))
 tree_pretty_content="100644 blob $hello_sha1	hello"
 
 run_tests 'tree' $tree_sha1 $tree_size "" "$tree_pretty_content"
 
+test_expect_success '--batch-command --buffer with flush is correct for tree' '
+	run_buffer_test 'tree' $tree_sha1 $tree_size true
+'
+
+test_expect_success '--batch-command --buffer without flush is correct for tree' '
+	run_buffer_test 'tree' $tree_sha1 $tree_size false
+'
+
 commit_message="Initial commit"
 commit_sha1=$(echo_without_newline "$commit_message" | git commit-tree $tree_sha1)
 commit_size=$(($(test_oid hexsz) + 137))
@@ -263,6 +332,14 @@ tag_size=$(strlen "$tag_content")
 
 run_tests 'tag' $tag_sha1 $tag_size "$tag_content" "$tag_content" 1
 
+test_expect_success '--batch-command --buffer with flush is correct for tag' '
+	run_buffer_test 'tag' $tag_sha1 $tag_size true
+'
+
+test_expect_success '--batch-command --buffer without flush is correct for tag' '
+	run_buffer_test 'tag' $tag_sha1 $tag_size false
+'
+
 test_expect_success \
     "Reach a blob from a tag pointing to it" \
     "test '$hello_content' = \"\$(git cat-file blob $tag_sha1)\""
@@ -964,4 +1041,10 @@ test_expect_success 'cat-file --batch-all-objects --batch-check ignores replace'
 	test_cmp expect actual
 '
 
+test_expect_success 'batch-command unknown command' '
+	echo unknown_command >cmd &&
+	test_expect_code 128 git cat-file --batch-command < cmd 2>err &&
+	grep -E "^fatal:.*unknown command.*" err
+'
+
 test_done
-- 
2.34.1

