Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6611C04A68
	for <git@archiver.kernel.org>; Thu, 28 Jul 2022 23:02:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233433AbiG1XCu (ORCPT <rfc822;git@archiver.kernel.org>);
        Thu, 28 Jul 2022 19:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233330AbiG1XCp (ORCPT <rfc822;git@vger.kernel.org>);
        Thu, 28 Jul 2022 19:02:45 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E7DD74E0A
        for <git@vger.kernel.org>; Thu, 28 Jul 2022 16:02:38 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id e17-20020a656491000000b0041b51b1c9edso1499003pgv.12
        for <git@vger.kernel.org>; Thu, 28 Jul 2022 16:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=5TyqHVxz+h4aXyPFXmpjtZ/RrrvuuL9TqQAFC782oAg=;
        b=HCkZzEQs86f1mEAcf7xAaVMOnAPliVU4kyiM1jWo4v0IoCCtlfeD3H0NDCOdzFDWB1
         ImwhG4rVuwLkeBf4i5Kj2dpq0Nuxc7MeZQk3sCg4PY9it4osgds+a4z7ybpV2kJMCCu5
         Y7Pes/K9KUkULsjVT5b3tCnv82IZNTeWOgL1/UECzDdvBV2mbB7qjO47zLXSpiHfo2Xq
         BHxt3GrpIefn2Zyb29w3EegPP6OLrokp1t66PYbLgAC25CQ0Nh9nu5gQBLrvW3hxhmJQ
         Q7MiKNS18cpVcSKSwfCSaHe1yxlIT3Hi5TxOe6jYWANPvvx642At5cKgo2xOOp6k6zEo
         5AJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=5TyqHVxz+h4aXyPFXmpjtZ/RrrvuuL9TqQAFC782oAg=;
        b=ivzKRMI/HODtyxtYkDewil3vu4Na6pApJq6hDi1LS70A9YY8bAnyOm12gPng1Sgh6H
         9i1dZKPK7tI8yY6o1kIElil1+7FCRQUJ4XZjwdn3td03iVpvNCTC7qn+7iexC3LMmrmM
         ci3Br/H8JDrQayUQP+0jypsZ4SnJYhgkBywHGdAyPwn+Y+sTwJ165DWl12mdBvXQJ8kn
         rwdRmuyg1HDgpsPbWaCNNt5eSVBOEtOjX6wSogbOqYQs4rovTWvP212Pr5q6a3fcqzjq
         l2dZ9xcMlijt/ChZBJZm91doePoqP0C6tjPVxb/AZ2+JRijT4iajpY065iRBK1jRR75C
         2U/Q==
X-Gm-Message-State: ACgBeo3iQRZpfStXr8oC2QAYG++tVm+rMfljLA7cpViMZuq2f5t5fGx1
        uAXQs/bJGX8dz1EYvmfSezR6U3kzL65XMpv2k+eCMaPUmzU2Un+qVnwEN2wOpp8LhSLdJlk6b5N
        PkOMKbLuJ3Q0FdYcJdEKo1lg+LaGxNxA5gVmYl/wKKsRmZvxtgChGZ7SvTByAGMJAMQ==
X-Google-Smtp-Source: AA6agR5D2yG011w4Q4FH3fA2shGSMpatvez+UGLXjqluzkS95I+kOpMVh7btoHRp2O2rt6+Idn/ANf/0f8EKkek=
X-Received: from barleywine.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3bd4])
 (user=calvinwan job=sendgmr) by 2002:a17:903:247:b0:16c:5017:9ad4 with SMTP
 id j7-20020a170903024700b0016c50179ad4mr1036934plh.115.1659049357902; Thu, 28
 Jul 2022 16:02:37 -0700 (PDT)
Date:   Thu, 28 Jul 2022 23:02:10 +0000
In-Reply-To: <20220502170904.2770649-1-calvinwan@google.com>
Message-Id: <20220728230210.2952731-7-calvinwan@google.com>
Mime-Version: 1.0
References: <20220502170904.2770649-1-calvinwan@google.com>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
Subject: [PATCH v5 6/6] cat-file: add remote-object-info to batch-command
From:   Calvin Wan <calvinwan@google.com>
To:     git@vger.kernel.org
Cc:     Calvin Wan <calvinwan@google.com>, gitster@pobox.com,
        jonathantanmy@google.com, philipoakley@iee.email,
        johncai86@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Since the `info` command in cat-file --batch-command prints object info
for a given object, it is natural to add another command in cat-file
--batch-command to print object info for a given object from a remote.
Add `remote-object-info` to cat-file --batch-command.

While `info` takes object ids one at a time, this creates overhead when
making requests to a server so `remote-object-info` instead can take
multiple object ids at once.

cat-file --batch-command is generally implemented in the following
manner:

 - Receive and parse input from user
 - Call respective function attached to command
 - Set batch mode state, get object info, print object info

In --buffer mode, this changes to:

 - Receive and parse input from user
 - Store respective function attached to command in a queue
 - After flush, loop through commands in queue
    - Call respective function attached to command
    - Set batch mode state, get object info, print object info

Notice how the getting and printing of object info is accomplished one
at a time. As described above, this creates a problem for making
requests to a server. Therefore, `remote-object-info` is implemented in
the following manner:

 - Receive and parse input from user
 If command is `remote-object-info`:
    - Get object info from remote
    - Loop through object info
        - Call respective function attached to `info`
        - Set batch mode state, use passed in object info, print object
          info
 Else:
    - Call respective function attached to command
    - Parse input, get object info, print object info

And finally for --buffer mode `remote-object-info`:
 - Receive and parse input from user
 - Store respective function attached to command in a queue
 - After flush, loop through commands in queue:
    If command is `remote-object-info`:
        - Get object info from remote
        - Loop through object info
            - Call respective function attached to `info`
            - Set batch mode state, use passed in object info, print
              object info
    Else:
        - Call respective function attached to command
        - Set batch mode state, get object info, print object info

To summarize, `remote-object-info` gets object info from the remote and
then generates multiple `info` commands with the object info passed in.

In order for remote-object-info to avoid remote communication overhead
in the non-buffer mode, the objects are passed in as such:

remote-object-info <remote> <oid> <oid> ... <oid>

rather than

remote-object-info <remote> <oid>
remote-object-info <remote> <oid>
...
remote-object-info <remote> <oid>

Signed-off-by: Calvin Wan <calvinwan@google.com>
Helped-by: Jonathan Tan <jonathantanmy@google.com>
---
 Documentation/git-cat-file.txt |  16 +-
 builtin/cat-file.c             | 225 ++++++++++++++++-----
 object-file.c                  |  11 ++
 object-store.h                 |   3 +
 t/t1006-cat-file.sh            | 348 +++++++++++++++++++++++++++++++++
 5 files changed, 549 insertions(+), 54 deletions(-)

diff --git a/Documentation/git-cat-file.txt b/Documentation/git-cat-file.txt
index 24a811f0ef..c073d5e50d 100644
--- a/Documentation/git-cat-file.txt
+++ b/Documentation/git-cat-file.txt
@@ -115,6 +115,10 @@ info <object>::
 	Print object info for object reference `<object>`. This corresponds to the
 	output of `--batch-check`.
 
+remote-object-info <remote> [<object>]::
+	Print object info for object references `<object>` at specified <remote>.
+	This command may be combined with `--buffer`.
+
 flush::
 	Used with `--buffer` to execute all preceding commands that were issued
 	since the beginning or since the last flush was issued. When `--buffer`
@@ -245,7 +249,8 @@ newline. The available atoms are:
 	The full hex representation of the object name.
 
 `objecttype`::
-	The type of the object (the same as `cat-file -t` reports).
+	The type of the object (the same as `cat-file -t` reports). See
+	`CAVEATS` below.
 
 `objectsize`::
 	The size, in bytes, of the object (the same as `cat-file -s`
@@ -253,13 +258,14 @@ newline. The available atoms are:
 
 `objectsize:disk`::
 	The size, in bytes, that the object takes up on disk. See the
-	note about on-disk sizes in the `CAVEATS` section below.
+	note about on-disk sizes in the `CAVEATS` section below. Not
+	supported by `remote-object-info`.
 
 `deltabase`::
 	If the object is stored as a delta on-disk, this expands to the
 	full hex representation of the delta base object name.
 	Otherwise, expands to the null OID (all zeroes). See `CAVEATS`
-	below.
+	below. Not supported by `remote-object-info`.
 
 `rest`::
 	If this atom is used in the output string, input lines are split
@@ -346,6 +352,10 @@ directory name.
 CAVEATS
 -------
 
+Note that since object type is currently not supported by the
+object-info command request, git fetches the entire object instead to
+get the object info.
+
 Note that the sizes of objects on disk are reported accurately, but care
 should be taken in drawing conclusions about which refs or objects are
 responsible for disk usage. The size of a packed non-delta object may be
diff --git a/builtin/cat-file.c b/builtin/cat-file.c
index 50cf38999d..68b72377e6 100644
--- a/builtin/cat-file.c
+++ b/builtin/cat-file.c
@@ -16,6 +16,9 @@
 #include "packfile.h"
 #include "object-store.h"
 #include "promisor-remote.h"
+#include "alias.h"
+#include "remote.h"
+#include "transport.h"
 
 enum batch_mode {
 	BATCH_MODE_CONTENTS,
@@ -32,9 +35,14 @@ struct batch_options {
 	int unordered;
 	int transform_mode; /* may be 'w' or 'c' for --filters or --textconv */
 	const char *format;
+	int use_remote_info;
 };
 
+#define DEFAULT_FORMAT "%(objectname) %(objecttype) %(objectsize)"
+
 static const char *force_path;
+static struct object_info *remote_object_info;
+static struct oid_array object_info_oids = OID_ARRAY_INIT;
 
 static int filter_object(const char *path, unsigned mode,
 			 const struct object_id *oid,
@@ -423,48 +431,115 @@ static void batch_one_object(const char *obj_name,
 	int flags = opt->follow_symlinks ? GET_OID_FOLLOW_SYMLINKS : 0;
 	enum get_oid_result result;
 
-	result = get_oid_with_context(the_repository, obj_name,
-				      flags, &data->oid, &ctx);
-	if (result != FOUND) {
-		switch (result) {
-		case MISSING_OBJECT:
-			printf("%s missing\n", obj_name);
-			break;
-		case SHORT_NAME_AMBIGUOUS:
-			printf("%s ambiguous\n", obj_name);
-			break;
-		case DANGLING_SYMLINK:
-			printf("dangling %"PRIuMAX"\n%s\n",
-			       (uintmax_t)strlen(obj_name), obj_name);
-			break;
-		case SYMLINK_LOOP:
-			printf("loop %"PRIuMAX"\n%s\n",
-			       (uintmax_t)strlen(obj_name), obj_name);
-			break;
-		case NOT_DIR:
-			printf("notdir %"PRIuMAX"\n%s\n",
-			       (uintmax_t)strlen(obj_name), obj_name);
-			break;
-		default:
-			BUG("unknown get_sha1_with_context result %d\n",
-			       result);
-			break;
+	if (!opt->use_remote_info) {
+		result = get_oid_with_context(the_repository, obj_name,
+						flags, &data->oid, &ctx);
+		if (result != FOUND) {
+			switch (result) {
+			case MISSING_OBJECT:
+				printf("%s missing\n", obj_name);
+				break;
+			case SHORT_NAME_AMBIGUOUS:
+				printf("%s ambiguous\n", obj_name);
+				break;
+			case DANGLING_SYMLINK:
+				printf("dangling %"PRIuMAX"\n%s\n",
+					(uintmax_t)strlen(obj_name), obj_name);
+				break;
+			case SYMLINK_LOOP:
+				printf("loop %"PRIuMAX"\n%s\n",
+					(uintmax_t)strlen(obj_name), obj_name);
+				break;
+			case NOT_DIR:
+				printf("notdir %"PRIuMAX"\n%s\n",
+					(uintmax_t)strlen(obj_name), obj_name);
+				break;
+			default:
+				BUG("unknown get_sha1_with_context result %d\n",
+					result);
+				break;
+			}
+			fflush(stdout);
+			return;
 		}
-		fflush(stdout);
-		return;
-	}
 
-	if (ctx.mode == 0) {
-		printf("symlink %"PRIuMAX"\n%s\n",
-		       (uintmax_t)ctx.symlink_path.len,
-		       ctx.symlink_path.buf);
-		fflush(stdout);
-		return;
+		if (ctx.mode == 0) {
+			printf("symlink %"PRIuMAX"\n%s\n",
+				(uintmax_t)ctx.symlink_path.len,
+				ctx.symlink_path.buf);
+			fflush(stdout);
+			return;
+		}
 	}
 
 	batch_object_write(obj_name, scratch, opt, data, NULL, 0);
 }
 
+static int get_remote_info(struct batch_options *opt, int argc, const char **argv)
+{
+	int retval = 0;
+	size_t i;
+	struct remote *remote = NULL;
+	struct object_id oid;
+	struct string_list object_info_options = STRING_LIST_INIT_NODUP;
+	static struct transport *gtransport;
+	char *format = DEFAULT_FORMAT;
+
+	if (opt->format)
+		format = xstrdup(opt->format);
+
+	remote = remote_get(argv[0]);
+	if (!remote)
+		die(_("must supply valid remote when using --object-info"));
+	oid_array_clear(&object_info_oids);
+	for (i = 1; i < argc; i++) {
+		if (get_oid(argv[i], &oid))
+			die(_("malformed object id '%s'"), argv[i]);
+		oid_array_append(&object_info_oids, &oid);
+	}
+
+	gtransport = transport_get(remote, NULL);
+	if (gtransport->smart_options) {
+		size_t j;
+		int include_size = 0, include_type = 0;
+
+		remote_object_info = xcalloc(object_info_oids.nr, sizeof(struct object_info));
+		gtransport->smart_options->object_info = 1;
+		gtransport->smart_options->object_info_oids = &object_info_oids;
+		/**
+		 * 'size' is the only option currently supported.
+		 * Other options that are passed in the format will fallback to a
+		 * standard fetch request rather than object-info.
+		 */
+		if (strstr(format, "%(objectsize)")) {
+			string_list_append(&object_info_options, "size");
+			include_size = 1;
+		}
+		if (strstr(format, "%(objecttype)")) {
+			string_list_append(&object_info_options, "type");
+			include_type = 1;
+		}
+		if (strstr(format, "%(objectsize:disk)"))
+			die(_("objectsize:disk is currently not supported with remote-object-info"));
+		if (strstr(format, "%(deltabase)"))
+			die(_("deltabase is currently not supported with remote-object-info"));
+		if (object_info_options.nr > 0) {
+			gtransport->smart_options->object_info_options = &object_info_options;
+			for (j = 0; j < object_info_oids.nr; j++) {
+				if (include_size)
+					remote_object_info[j].sizep = xcalloc(1, sizeof(long));
+				if (include_type)
+					remote_object_info[j].typep = xcalloc(1, sizeof(enum object_type));
+			}
+			gtransport->smart_options->object_info_data = &remote_object_info;
+			retval = transport_fetch_refs(gtransport, NULL);
+		}
+	} else {
+		retval = -1;
+	}
+	return retval;
+}
+
 struct object_cb_data {
 	struct batch_options *opt;
 	struct expand_data *expand;
@@ -536,6 +611,7 @@ typedef void (*parse_cmd_fn_t)(struct batch_options *, const char *,
 struct queued_cmd {
 	parse_cmd_fn_t fn;
 	char *line;
+	const char *name;
 };
 
 static void parse_cmd_contents(struct batch_options *opt,
@@ -556,6 +632,56 @@ static void parse_cmd_info(struct batch_options *opt,
 	batch_one_object(line, output, opt, data);
 }
 
+static const struct parse_cmd {
+	const char *name;
+	parse_cmd_fn_t fn;
+	unsigned takes_args;
+} commands[] = {
+	{ "contents", parse_cmd_contents, 1},
+	{ "info", parse_cmd_info, 1},
+	{ "remote-object-info", parse_cmd_info, 1},
+	{ "flush", NULL, 0},
+};
+
+static void parse_remote_info(struct batch_options *opt,
+			   char *line,
+			   struct strbuf *output,
+			   struct expand_data *data,
+			   const struct parse_cmd *p_cmd,
+			   struct queued_cmd *q_cmd)
+{
+	int count;
+	size_t i;
+	const char **argv;
+
+	count = split_cmdline(line, &argv);
+	if (get_remote_info(opt, count, argv))
+		goto cleanup;
+	opt->use_remote_info = 1;
+	data->skip_object_info = 1;
+	data->mark_query = 0;
+	for (i = 0; i < object_info_oids.nr; i++) {
+		if (remote_object_info[i].sizep)
+			data->size = *remote_object_info[i].sizep;
+		if (remote_object_info[i].typep)
+			data->type = *remote_object_info[i].typep;
+
+		data->oid = object_info_oids.oid[i];
+		if (p_cmd)
+			p_cmd->fn(opt, argv[i+1], output, data);
+		else
+			q_cmd->fn(opt, argv[i+1], output, data);
+	}
+	opt->use_remote_info = 0;
+	data->skip_object_info = 0;
+	data->mark_query = 1;
+
+cleanup:
+	for (i = 0; i < object_info_oids.nr; i++)
+		free_object_info_contents(&remote_object_info[i]);
+	free(remote_object_info);
+}
+
 static void dispatch_calls(struct batch_options *opt,
 		struct strbuf *output,
 		struct expand_data *data,
@@ -567,8 +693,12 @@ static void dispatch_calls(struct batch_options *opt,
 	if (!opt->buffer_output)
 		die(_("flush is only for --buffer mode"));
 
-	for (i = 0; i < nr; i++)
-		cmd[i].fn(opt, cmd[i].line, output, data);
+	for (i = 0; i < nr; i++) {
+		if (!strcmp(cmd[i].name, "remote-object-info"))
+			parse_remote_info(opt, cmd[i].line, output, data, NULL, &cmd[i]);
+		else
+			cmd[i].fn(opt, cmd[i].line, output, data);
+	}
 
 	fflush(stdout);
 }
@@ -583,17 +713,6 @@ static void free_cmds(struct queued_cmd *cmd, size_t *nr)
 	*nr = 0;
 }
 
-
-static const struct parse_cmd {
-	const char *name;
-	parse_cmd_fn_t fn;
-	unsigned takes_args;
-} commands[] = {
-	{ "contents", parse_cmd_contents, 1},
-	{ "info", parse_cmd_info, 1},
-	{ "flush", NULL, 0},
-};
-
 static void batch_objects_command(struct batch_options *opt,
 				    struct strbuf *output,
 				    struct expand_data *data)
@@ -639,11 +758,17 @@ static void batch_objects_command(struct batch_options *opt,
 			dispatch_calls(opt, output, data, queued_cmd, nr);
 			free_cmds(queued_cmd, &nr);
 		} else if (!opt->buffer_output) {
-			cmd->fn(opt, p, output, data);
+			if (!strcmp(cmd->name, "remote-object-info")) {
+				char *line = xstrdup_or_null(p);
+				parse_remote_info(opt, line, output, data, cmd, NULL);
+			} else {
+				cmd->fn(opt, p, output, data);
+			}
 		} else {
 			ALLOC_GROW(queued_cmd, nr + 1, alloc);
 			call.fn = cmd->fn;
 			call.line = xstrdup_or_null(p);
+			call.name = cmd->name;
 			queued_cmd[nr++] = call;
 		}
 	}
@@ -659,8 +784,6 @@ static void batch_objects_command(struct batch_options *opt,
 	strbuf_release(&input);
 }
 
-#define DEFAULT_FORMAT "%(objectname) %(objecttype) %(objectsize)"
-
 static int batch_objects(struct batch_options *opt)
 {
 	struct strbuf input = STRBUF_INIT;
diff --git a/object-file.c b/object-file.c
index 5b270f046d..417c76def3 100644
--- a/object-file.c
+++ b/object-file.c
@@ -2839,3 +2839,14 @@ int read_loose_object(const char *path,
 		munmap(map, mapsize);
 	return ret;
 }
+
+void free_object_info_contents(struct object_info *object_info)
+{
+	if (!object_info)
+		return;
+	free(object_info->typep);
+	free(object_info->sizep);
+	free(object_info->disk_sizep);
+	free(object_info->delta_base_oid);
+	free(object_info->type_name);
+}
diff --git a/object-store.h b/object-store.h
index 5222ee5460..015838eb08 100644
--- a/object-store.h
+++ b/object-store.h
@@ -547,4 +547,7 @@ int for_each_object_in_pack(struct packed_git *p,
 int for_each_packed_object(each_packed_object_fn, void *,
 			   enum for_each_object_flags flags);
 
+/* Free pointers inside of object_info, but not object_info itself */
+void free_object_info_contents(struct object_info *object_info);
+
 #endif /* OBJECT_STORE_H */
diff --git a/t/t1006-cat-file.sh b/t/t1006-cat-file.sh
index dadf3b1458..55b2a1f06f 100755
--- a/t/t1006-cat-file.sh
+++ b/t/t1006-cat-file.sh
@@ -2,6 +2,9 @@
 
 test_description='git cat-file'
 
+GIT_TEST_DEFAULT_INITIAL_BRANCH_NAME=main
+export GIT_TEST_DEFAULT_INITIAL_BRANCH_NAME
+
 . ./test-lib.sh
 
 test_cmdmode_usage () {
@@ -1093,4 +1096,349 @@ test_expect_success 'batch-command flush without --buffer' '
 	grep "^fatal:.*flush is only for --buffer mode.*" err
 '
 
+# This section tests --batch-command with remote-object-info command
+# If a filter is not set, the filter defaults to "%(objectname) %(objectsize) %(objecttype)"
+# Since "%(objecttype)" is currently not supported by the command request, object-info,
+# the filters are set to "%(objectname) %(objectsize)".
+# Tests with the default filter are used to test the fallback to 'fetch' command
+
+set_transport_variables () {
+    tree_sha1=$(git -C "$1" write-tree)
+	commit_sha1=$(echo_without_newline "$commit_message" | git -C "$1" commit-tree $tree_sha1)
+	tag_sha1=$(echo_without_newline "$tag_content" | git -C "$1" hash-object -t tag --stdin -w)
+	tag_size=$(strlen "$tag_content")
+}
+
+# Test --batch-command remote-object-info with 'git://' transport
+
+. "$TEST_DIRECTORY"/lib-git-daemon.sh
+start_git_daemon --export-all --enable=receive-pack
+daemon_parent=$GIT_DAEMON_DOCUMENT_ROOT_PATH/parent
+
+test_expect_success 'create repo to be served by git-daemon' '
+	git init "$daemon_parent" &&
+	echo_without_newline "$hello_content" > $daemon_parent/hello &&
+	git -C "$daemon_parent" update-index --add hello
+'
+
+set_transport_variables "$daemon_parent"
+
+test_expect_success 'batch-command remote-object-info git://' '
+	(
+		cd "$daemon_parent" &&
+
+		echo "$hello_sha1 $hello_size" >expect &&
+		echo "$tree_sha1 $tree_size" >>expect &&
+		echo "$commit_sha1 $commit_size" >>expect &&
+		echo "$tag_sha1 $tag_size" >>expect &&
+		git cat-file --batch-command="%(objectname) %(objectsize)" >actual <<-EOF &&
+		remote-object-info "$GIT_DAEMON_URL/parent" $hello_sha1
+		remote-object-info "$GIT_DAEMON_URL/parent" $tree_sha1
+		remote-object-info "$GIT_DAEMON_URL/parent" $commit_sha1
+		remote-object-info "$GIT_DAEMON_URL/parent" $tag_sha1
+		EOF
+		test_cmp expect actual
+	)
+'
+
+test_expect_success 'batch-command remote-object-info git:// multiple sha1 per line' '
+	(
+		cd "$daemon_parent" &&
+
+		echo "$hello_sha1 $hello_size" >expect &&
+		echo "$tree_sha1 $tree_size" >>expect &&
+		echo "$commit_sha1 $commit_size" >>expect &&
+		echo "$tag_sha1 $tag_size" >>expect &&
+		git cat-file --batch-command="%(objectname) %(objectsize)" >actual <<-EOF &&
+		remote-object-info "$GIT_DAEMON_URL/parent" $hello_sha1 $tree_sha1 $commit_sha1 $tag_sha1
+		EOF
+		test_cmp expect actual
+	)
+'
+
+test_expect_success 'batch-command remote-object-info http:// default filter' '
+	(
+		cd "$daemon_parent" &&
+
+		echo "$hello_sha1 blob $hello_size" >expect &&
+		echo "$tree_sha1 tree $tree_size" >>expect &&
+		echo "$commit_sha1 commit $commit_size" >>expect &&
+		echo "$tag_sha1 tag $tag_size" >>expect &&
+		GIT_TRACE_PACKET=1 git cat-file --batch-command >actual <<-EOF &&
+		remote-object-info "$GIT_DAEMON_URL/parent" $hello_sha1 $tree_sha1
+		remote-object-info "$GIT_DAEMON_URL/parent" $commit_sha1 $tag_sha1
+		EOF
+		test_cmp expect actual
+	)
+'
+
+test_expect_success 'batch-command --buffer remote-object-info git://' '
+	(
+		cd "$daemon_parent" &&
+
+		echo "$hello_sha1 $hello_size" >expect &&
+		echo "$tree_sha1 $tree_size" >>expect &&
+		echo "$commit_sha1 $commit_size" >>expect &&
+		echo "$tag_sha1 $tag_size" >>expect &&
+		git cat-file --batch-command="%(objectname) %(objectsize)" --buffer >actual <<-EOF &&
+		remote-object-info "$GIT_DAEMON_URL/parent" $hello_sha1 $tree_sha1
+		remote-object-info "$GIT_DAEMON_URL/parent" $commit_sha1 $tag_sha1
+		flush
+		EOF
+		test_cmp expect actual
+	)
+'
+
+stop_git_daemon
+
+# Test --batch-command remote-object-info with 'http://' transport
+
+. "$TEST_DIRECTORY"/lib-httpd.sh
+start_httpd
+
+test_expect_success 'create repo to be served by http:// transport' '
+	git init "$HTTPD_DOCUMENT_ROOT_PATH/http_parent" &&
+	git -C "$HTTPD_DOCUMENT_ROOT_PATH/http_parent" config http.receivepack true &&
+	echo_without_newline "$hello_content" > $HTTPD_DOCUMENT_ROOT_PATH/http_parent/hello &&
+	git -C "$HTTPD_DOCUMENT_ROOT_PATH/http_parent" update-index --add hello
+'
+set_transport_variables "$HTTPD_DOCUMENT_ROOT_PATH/http_parent"
+
+test_expect_success 'batch-command remote-object-info http://' '
+	(
+		cd "$HTTPD_DOCUMENT_ROOT_PATH/http_parent" &&
+
+		echo "$hello_sha1 $hello_size" >expect &&
+		echo "$tree_sha1 $tree_size" >>expect &&
+		echo "$commit_sha1 $commit_size" >>expect &&
+		echo "$tag_sha1 $tag_size" >>expect &&
+		git cat-file --batch-command="%(objectname) %(objectsize)" >actual <<-EOF &&
+		remote-object-info "$HTTPD_URL/smart/http_parent" $hello_sha1
+		remote-object-info "$HTTPD_URL/smart/http_parent" $tree_sha1
+		remote-object-info "$HTTPD_URL/smart/http_parent" $commit_sha1
+		remote-object-info "$HTTPD_URL/smart/http_parent" $tag_sha1
+		EOF
+		test_cmp expect actual
+	)
+'
+
+test_expect_success 'batch-command remote-object-info http:// one line' '
+	(
+		cd "$HTTPD_DOCUMENT_ROOT_PATH/http_parent" &&
+
+		echo "$hello_sha1 $hello_size" >expect &&
+		echo "$tree_sha1 $tree_size" >>expect &&
+		echo "$commit_sha1 $commit_size" >>expect &&
+		echo "$tag_sha1 $tag_size" >>expect &&
+		git cat-file --batch-command="%(objectname) %(objectsize)" >actual <<-EOF &&
+		remote-object-info "$HTTPD_URL/smart/http_parent" $hello_sha1 $tree_sha1 $commit_sha1 $tag_sha1
+		EOF
+		test_cmp expect actual
+	)
+'
+
+test_expect_success 'batch-command --buffer remote-object-info http://' '
+	(
+		cd "$HTTPD_DOCUMENT_ROOT_PATH/http_parent" &&
+
+		echo "$hello_sha1 $hello_size" >expect &&
+		echo "$tree_sha1 $tree_size" >>expect &&
+		echo "$commit_sha1 $commit_size" >>expect &&
+		echo "$tag_sha1 $tag_size" >>expect &&
+
+		git cat-file --batch-command="%(objectname) %(objectsize)" --buffer >actual <<-EOF &&
+		remote-object-info "$HTTPD_URL/smart/http_parent" $hello_sha1 $tree_sha1
+		remote-object-info "$HTTPD_URL/smart/http_parent" $commit_sha1 $tag_sha1
+		flush
+		EOF
+		test_cmp expect actual
+	)
+'
+
+test_expect_success 'batch-command remote-object-info http:// default filter' '
+	(
+		cd "$HTTPD_DOCUMENT_ROOT_PATH/http_parent" &&
+
+		echo "$hello_sha1 blob $hello_size" >expect &&
+		echo "$tree_sha1 tree $tree_size" >>expect &&
+		echo "$commit_sha1 commit $commit_size" >>expect &&
+		echo "$tag_sha1 tag $tag_size" >>expect &&
+
+		git cat-file --batch-command >actual <<-EOF &&
+		remote-object-info "$HTTPD_URL/smart/http_parent" $hello_sha1 $tree_sha1
+		remote-object-info "$HTTPD_URL/smart/http_parent" $commit_sha1 $tag_sha1
+		EOF
+		test_cmp expect actual
+	)
+'
+
+test_expect_success 'remote-object-info fails on unspported filter option (objectsize:disk)' '
+	(
+		cd "$HTTPD_DOCUMENT_ROOT_PATH/http_parent" &&
+
+		test_must_fail git cat-file --batch-command="%(objectsize:disk)" 2>err <<-EOF &&
+		remote-object-info "$HTTPD_URL/smart/http_parent" $hello_sha1
+		EOF
+		test_i18ngrep "objectsize:disk is currently not supported with remote-object-info" err
+	)
+'
+
+test_expect_success 'remote-object-info fails on unspported filter option (deltabase)' '
+	(
+		cd "$HTTPD_DOCUMENT_ROOT_PATH/http_parent" &&
+
+		test_must_fail git cat-file --batch-command="%(deltabase)" 2>err <<-EOF &&
+		remote-object-info "$HTTPD_URL/smart/http_parent" $hello_sha1
+		EOF
+		test_i18ngrep "deltabase is currently not supported with remote-object-info" err
+	)
+'
+
+test_expect_success 'remote-object-info fails on server with legacy protocol' '
+	(
+		cd "$HTTPD_DOCUMENT_ROOT_PATH/http_parent" &&
+
+		test_must_fail git -c protocol.version=0 cat-file --batch-command="%(objectname) %(objectsize)" 2>err <<-EOF &&
+		remote-object-info "$HTTPD_URL/smart/http_parent" $hello_sha1
+		EOF
+		test_i18ngrep "object-info requires protocol v2" err
+	)
+'
+
+test_expect_success 'remote-object-info fails on server with legacy protocol fallback' '
+	(
+		cd "$HTTPD_DOCUMENT_ROOT_PATH/http_parent" &&
+
+		test_must_fail git -c protocol.version=0 cat-file --batch-command 2>err <<-EOF &&
+		remote-object-info "$HTTPD_URL/smart/http_parent" $hello_sha1
+		EOF
+		test_i18ngrep "object-info requires protocol v2" err
+	)
+'
+
+test_expect_success 'remote-object-info fails on malformed OID' '
+	(
+		cd "$HTTPD_DOCUMENT_ROOT_PATH/http_parent" &&
+		malformed_object_id="this_id_is_not_valid" &&
+
+		test_must_fail git cat-file --batch-command="%(objectname) %(objectsize)" 2>err <<-EOF &&
+		remote-object-info "$HTTPD_URL/smart/http_parent" $malformed_object_id
+		EOF
+		test_i18ngrep "malformed object id '$malformed_object_id'" err
+	)
+'
+
+test_expect_success 'remote-object-info fails on malformed OID fallback' '
+	(
+		cd "$HTTPD_DOCUMENT_ROOT_PATH/http_parent" &&
+		malformed_object_id="this_id_is_not_valid" &&
+
+		test_must_fail git cat-file --batch-command 2>err <<-EOF &&
+		remote-object-info "$HTTPD_URL/smart/http_parent" $malformed_object_id
+		EOF
+		test_i18ngrep "malformed object id '$malformed_object_id'" err
+	)
+'
+
+test_expect_success 'remote-object-info fails on missing OID' '
+	git clone "$HTTPD_DOCUMENT_ROOT_PATH/http_parent" missing_oid_repo &&
+	test_commit -C missing_oid_repo message1 c.txt &&
+	(
+		cd missing_oid_repo &&
+		object_id=$(git rev-parse message1:c.txt) &&
+		test_must_fail git cat-file --batch-command="%(objectname) %(objectsize)" 2>err <<-EOF &&
+		remote-object-info "$HTTPD_URL/smart/http_parent" $object_id
+		EOF
+		test_i18ngrep "object-info: not our ref $object_id" err
+	)
+'
+
+test_expect_success 'remote-object-info fails on missing OID fallback' '
+	(
+		cd missing_oid_repo &&
+		object_id=$(git rev-parse message1:c.txt) &&
+		test_must_fail git cat-file --batch-command 2>err <<-EOF &&
+		remote-object-info "$HTTPD_URL/smart/http_parent" $object_id
+		EOF
+		test_i18ngrep "fatal: remote error: upload-pack: not our ref $object_id" err
+	)
+'
+
+# Test --batch-command remote-object-info with 'file://' transport
+
+test_expect_success 'create repo to be served by file:// transport' '
+	git init server &&
+	git -C server config protocol.version 2 &&
+	echo_without_newline "$hello_content" > server/hello &&
+	git -C server update-index --add hello
+'
+
+set_transport_variables "server"
+
+test_expect_success 'batch-command remote-object-info file://' '
+	(
+		cd server &&
+
+		echo "$hello_sha1 $hello_size" >expect &&
+		echo "$tree_sha1 $tree_size" >>expect &&
+		echo "$commit_sha1 $commit_size" >>expect &&
+		echo "$tag_sha1 $tag_size" >>expect &&
+		git cat-file --batch-command="%(objectname) %(objectsize)" >actual <<-EOF &&
+		remote-object-info "file://$(pwd)" $hello_sha1
+		remote-object-info "file://$(pwd)" $tree_sha1
+		remote-object-info "file://$(pwd)" $commit_sha1
+		remote-object-info "file://$(pwd)" $tag_sha1
+		EOF
+		test_cmp expect actual
+	)
+'
+
+test_expect_success 'batch-command remote-object-info file:// multiple sha1 per line' '
+	(
+		cd server &&
+
+		echo "$hello_sha1 $hello_size" >expect &&
+		echo "$tree_sha1 $tree_size" >>expect &&
+		echo "$commit_sha1 $commit_size" >>expect &&
+		echo "$tag_sha1 $tag_size" >>expect &&
+		git cat-file --batch-command="%(objectname) %(objectsize)" >actual <<-EOF &&
+		remote-object-info "file://$(pwd)" $hello_sha1 $tree_sha1 $commit_sha1 $tag_sha1
+		EOF
+		test_cmp expect actual
+	)
+'
+
+test_expect_success 'batch-command --buffer remote-object-info file://' '
+	(
+		cd server &&
+
+		echo "$hello_sha1 $hello_size" >expect &&
+		echo "$tree_sha1 $tree_size" >>expect &&
+		echo "$commit_sha1 $commit_size" >>expect &&
+		echo "$tag_sha1 $tag_size" >>expect &&
+		git cat-file --batch-command="%(objectname) %(objectsize)" --buffer >actual <<-EOF &&
+		remote-object-info "file://$(pwd)" $hello_sha1 $tree_sha1
+		remote-object-info "file://$(pwd)" $commit_sha1 $tag_sha1
+		flush
+		EOF
+		test_cmp expect actual
+	)
+'
+
+test_expect_success 'batch-command remote-object-info file:// default filter' '
+	(
+		cd server &&
+
+		echo "$hello_sha1 blob $hello_size" >expect &&
+		echo "$tree_sha1 tree $tree_size" >>expect &&
+		echo "$commit_sha1 commit $commit_size" >>expect &&
+		echo "$tag_sha1 tag $tag_size" >>expect &&
+		git cat-file --batch-command >actual <<-EOF &&
+		remote-object-info "file://$(pwd)" $hello_sha1 $tree_sha1
+		remote-object-info "file://$(pwd)" $commit_sha1 $tag_sha1
+		EOF
+		test_cmp expect actual
+	)
+'
+
 test_done
-- 
2.37.1.455.g008518b4e5-goog

