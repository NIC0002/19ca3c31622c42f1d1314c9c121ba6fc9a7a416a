Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8CBC433FE
	for <git@archiver.kernel.org>; Wed,  5 Oct 2022 15:01:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbiJEPBC (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 5 Oct 2022 11:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbiJEPAd (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 5 Oct 2022 11:00:33 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B638712636
        for <git@vger.kernel.org>; Wed,  5 Oct 2022 07:59:43 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id o5so10962959wms.1
        for <git@vger.kernel.org>; Wed, 05 Oct 2022 07:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:from:to:cc:subject:date;
        bh=5z9Hbkrit14cvEBI3XWysZvHIiRKf889uT4YQ1fdE0k=;
        b=KAe6iEK3D55ZgVphH4ULpnGoa9KDg3njVg7iGNqIVyu12AcZxgP98AR23j6a0vE2FN
         lhhkCXIltvWXC6NSJpr3XkuwwER1lx4Dixp+Beyu8qpTWeVv9IjgmZNzz/jPFelaJFZe
         j4i9BPOa+ny65N32RB2So6f5alhlqtdEzRi46T+zPmAeYmUbmYo0uCQzyd4upjRU76oc
         mHomyZyvpL6VvXsYOk0RNB9CFiDQwcZKz6VNfsZXJUPgQLtBhF40dil24zl6EK/xlJnK
         BqSi9vzRb8b0eCzJ+FFzg+sb2HCu0aEdJDWA+X8GlwITVKPDxpAbuD8mbHdoxp3xBA5X
         iWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5z9Hbkrit14cvEBI3XWysZvHIiRKf889uT4YQ1fdE0k=;
        b=h5yX0DJ263mdpmtLQV7M6iJWMAzQrmgbbhvXsUVvJ67NsRy0uWuWHlilHZPzbw8+bP
         ezlAaadzSVdHuyazq/OMZv5wRzJfA50lUn+XJuUNfipQ4bspDVtW0MI/19VrahlaJ1DH
         UKTTitLDMKKv+QBpusPdGw0ToXakgFy/G2nsqwVKR1KYk+NO/kC783uKil3AV8c4/csT
         OMwrDMVlZT0F2T5CAZDEmZjYfSZ9k7tLM029Z8m4evbtaci4VdYQAslJUqVAkxrSkG9P
         V26/tg5Y/gu2Q+mdfCE1MkIxgcF9qZNLcWZQv2WEkxFdgqVagbwVYDsAQU4FjAdF+d6Y
         UmQQ==
X-Gm-Message-State: ACrzQf21z7SY7vg+rgu33Oi36Hf9RcWZgUE2EniXt/ScpWrI7J+HRuLk
        j37nXabIf0vPzuESAhRyLqKUZFLN+4M=
X-Google-Smtp-Source: AMsMyM7JZJ/+9T8GbG3HPsdacv0dIDjWh5jmz4+7v9ns+SHg26GlYglrp+BlXmZOlGuGYdhJSrhM1w==
X-Received: by 2002:a05:600c:1987:b0:3b4:9b03:c440 with SMTP id t7-20020a05600c198700b003b49b03c440mr3666wmq.14.1664981965844;
        Wed, 05 Oct 2022 07:59:25 -0700 (PDT)
Received: from [127.0.0.1] ([13.74.141.28])
        by smtp.gmail.com with ESMTPSA id u12-20020adfc64c000000b00225307f43fbsm16941469wrg.44.2022.10.05.07.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 07:59:25 -0700 (PDT)
Message-Id: <353d97d0f38870f287d862c626e0728dd7b84193.1664981958.git.gitgitgadget@gmail.com>
In-Reply-To: <pull.1356.v2.git.1664981957.gitgitgadget@gmail.com>
References: <pull.1356.git.1663959324.gitgitgadget@gmail.com>
        <pull.1356.v2.git.1664981957.gitgitgadget@gmail.com>
From:   "Stefan Xenos via GitGitGadget" <gitgitgadget@gmail.com>
Date:   Wed, 05 Oct 2022 14:59:13 +0000
Subject: [PATCH v2 06/10] evolve: add support for writing metacommits
Fcc:    Sent
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
To:     git@vger.kernel.org
Cc:     Jerry Zhang <jerry@skydio.com>,
        Phillip Wood <phillip.wood123@gmail.com>,
        =?UTF-8?Q?=C3=86var_Arnfj=C3=B6r=C3=B0?= Bjarmason 
        <avarab@gmail.com>, Chris Poucet <poucet@google.com>,
        Christophe Poucet <christophe.poucet@gmail.com>,
        Stefan Xenos <sxenos@google.com>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

From: Stefan Xenos <sxenos@google.com>

metacommit.c supports the creation of metacommits and
adds the API needed to create and update changes.

Create the "modify_change" function that can be called from modification
commands like "rebase" and "git amend" to record obsolescences in the
change graph.

Create the "record_metacommit" function for recording more complicated
commit relationships in the commit graph.

Create the "write_metacommit" function for low-level creation of
metacommits.

Signed-off-by: Stefan Xenos <sxenos@google.com>
Signed-off-by: Chris Poucet <poucet@google.com>
---
 Makefile     |   1 +
 metacommit.c | 410 +++++++++++++++++++++++++++++++++++++++++++++++++++
 metacommit.h |  75 ++++++++++
 3 files changed, 486 insertions(+)
 create mode 100644 metacommit.c
 create mode 100644 metacommit.h

diff --git a/Makefile b/Makefile
index 2b847e7e7de..68082ef94c7 100644
--- a/Makefile
+++ b/Makefile
@@ -1000,6 +1000,7 @@ LIB_OBJS += merge-ort.o
 LIB_OBJS += merge-ort-wrappers.o
 LIB_OBJS += merge-recursive.o
 LIB_OBJS += merge.o
+LIB_OBJS += metacommit.o
 LIB_OBJS += metacommit-parser.o
 LIB_OBJS += midx.o
 LIB_OBJS += name-hash.o
diff --git a/metacommit.c b/metacommit.c
new file mode 100644
index 00000000000..3c2e3ae1031
--- /dev/null
+++ b/metacommit.c
@@ -0,0 +1,410 @@
+#include "cache.h"
+#include "metacommit.h"
+#include "commit.h"
+#include "change-table.h"
+#include "refs.h"
+
+void clear_metacommit_data(struct metacommit_data *state)
+{
+	oidcpy(&state->content, null_oid());
+	oid_array_clear(&state->replace);
+	oid_array_clear(&state->origin);
+	state->abandoned = 0;
+}
+
+static void compute_default_change_name(struct commit *initial_commit,
+					struct strbuf* result)
+{
+	struct strbuf default_name = STRBUF_INIT;
+	const char *buffer;
+	const char *subject;
+	const char *eol;
+	size_t len;
+	buffer = get_commit_buffer(initial_commit, NULL);
+	find_commit_subject(buffer, &subject);
+	eol = strchrnul(subject, '\n');
+	for (len = 0; subject < eol && len < 10; subject++, len++) {
+		char next = *subject;
+		if (isspace(next))
+			continue;
+
+		strbuf_addch(&default_name, next);
+	}
+	sanitize_refname_component(default_name.buf, result);
+	unuse_commit_buffer(initial_commit, buffer);
+}
+
+/*
+ * Computes a change name for a change rooted at the given initial commit. Good
+ * change names should be memorable, unique, and easy to type. They are not
+ * required to match the commit comment.
+ */
+static void compute_change_name(struct commit *initial_commit, struct strbuf* result)
+{
+	struct strbuf default_name = STRBUF_INIT;
+	struct object_id unused;
+
+	if (initial_commit)
+		compute_default_change_name(initial_commit, &default_name);
+	else
+		BUG("initial commit is NULL");
+	strbuf_addstr(result, "refs/metas/");
+	strbuf_addbuf(result, &default_name);
+
+	/* If there is already a change of this name, append a suffix */
+	if (!read_ref(result->buf, &unused)) {
+		int suffix = 2;
+		size_t original_length = result->len;
+
+		while (1) {
+			strbuf_addf(result, "%d", suffix);
+			if (read_ref(result->buf, &unused))
+				break;
+			strbuf_remove(result, original_length,
+				      result->len - original_length);
+			++suffix;
+		}
+	}
+
+	strbuf_release(&default_name);
+}
+
+struct resolve_metacommit_context
+{
+	struct change_table* active_changes;
+	struct string_list *changes;
+	struct oid_array *heads;
+};
+
+static int resolve_metacommit_callback(const char *refname, void *cb_data)
+{
+	struct resolve_metacommit_context *data = cb_data;
+	struct change_head *chhead;
+
+	chhead = get_change_head(data->active_changes, refname);
+
+	if (data->changes)
+		string_list_append(data->changes, refname)->util = &chhead->head;
+	if (data->heads)
+		oid_array_append(data->heads, &(chhead->head));
+
+	return 0;
+}
+
+/*
+ * Produces the final form of a metacommit based on the current change refs.
+ */
+static void resolve_metacommit(
+	struct repository* repo,
+	struct change_table* active_changes,
+	const struct metacommit_data *to_resolve,
+	struct metacommit_data *resolved_output,
+	struct string_list *to_advance,
+	int allow_append)
+{
+	size_t i;
+	size_t len = to_resolve->replace.nr;
+	struct resolve_metacommit_context ctx = {
+		.active_changes = active_changes,
+		.changes = to_advance,
+		.heads = &resolved_output->replace
+	};
+	int old_change_list_length = to_advance->nr;
+	struct commit* content;
+
+	oidcpy(&resolved_output->content, &to_resolve->content);
+
+	/*
+	 * First look for changes that point to any of the replacement edges in the
+	 * metacommit. These will be the changes that get advanced by this
+	 * metacommit.
+	 */
+	resolved_output->abandoned = to_resolve->abandoned;
+
+	if (allow_append) {
+		for (i = 0; i < len; i++) {
+			int old_number = resolved_output->replace.nr;
+			for_each_change_referencing(
+				active_changes,
+				&(to_resolve->replace.oid[i]),
+				resolve_metacommit_callback,
+				&ctx);
+			/* If no changes were found, use the unresolved value. */
+			if (old_number == resolved_output->replace.nr)
+				oid_array_append(&(resolved_output->replace),
+						 &(to_resolve->replace.oid[i]));
+		}
+	}
+
+	ctx.changes = NULL;
+	ctx.heads = &(resolved_output->origin);
+
+	len = to_resolve->origin.nr;
+	for (i = 0; i < len; i++) {
+		int old_number = resolved_output->origin.nr;
+		for_each_change_referencing(
+			active_changes,
+			&(to_resolve->origin.oid[i]),
+			resolve_metacommit_callback,
+			&ctx);
+		if (old_number == resolved_output->origin.nr)
+			oid_array_append(&(resolved_output->origin),
+					 &(to_resolve->origin.oid[i]));
+	}
+
+	/*
+	 * If no changes were advanced by this metacommit, we'll need to create
+	 * a new one. */
+	if (to_advance->nr == old_change_list_length) {
+		struct strbuf change_name;
+
+		strbuf_init(&change_name, 80);
+
+		content = lookup_commit_reference_gently(
+			repo, &(to_resolve->content), 1);
+
+		compute_change_name(content, &change_name);
+		string_list_append(to_advance, change_name.buf);
+		strbuf_release(&change_name);
+	}
+}
+
+static void lookup_commits(
+	struct repository *repo,
+	struct oid_array *to_lookup,
+	struct commit_list **result)
+{
+	int i = to_lookup->nr;
+
+	while (--i >= 0) {
+		struct object_id *next = &(to_lookup->oid[i]);
+		struct commit *commit =
+			lookup_commit_reference_gently(repo, next, 1);
+		commit_list_insert(commit, result);
+	}
+}
+
+#define PARENT_TYPE_PREFIX "parent-type "
+
+int write_metacommit(struct repository *repo, struct metacommit_data *state,
+	struct object_id *result)
+{
+	struct commit_list *parents = NULL;
+	struct strbuf comment;
+	size_t i;
+	struct commit *content;
+
+	strbuf_init(&comment, strlen(PARENT_TYPE_PREFIX)
+		+ 1 + 2 * (state->origin.nr + state->replace.nr));
+	lookup_commits(repo, &state->origin, &parents);
+	lookup_commits(repo, &state->replace, &parents);
+	content = lookup_commit_reference_gently(repo, &state->content, 1);
+	if (!content) {
+		strbuf_release(&comment);
+		free_commit_list(parents);
+		return -1;
+	}
+	commit_list_insert(content, &parents);
+
+	strbuf_addstr(&comment, PARENT_TYPE_PREFIX);
+	strbuf_addstr(&comment, state->abandoned ? "a" : "c");
+	for (i = 0; i < state->replace.nr; i++)
+		strbuf_addstr(&comment, " r");
+
+	for (i = 0; i < state->origin.nr; i++)
+		strbuf_addstr(&comment, " o");
+
+	/* The parents list will be freed by this call. */
+	commit_tree(
+		comment.buf,
+		comment.len,
+		repo->hash_algo->empty_tree,
+		parents,
+		result,
+		NULL,
+		NULL);
+
+	strbuf_release(&comment);
+	return 0;
+}
+
+/*
+ * Returns true iff the given metacommit is abandoned, has one or more origin
+ * parents, or has one or more replacement parents.
+ */
+static int is_nontrivial_metacommit(struct metacommit_data *state)
+{
+	return state->replace.nr || state->origin.nr || state->abandoned;
+}
+
+/*
+ * Records the relationships described by the given metacommit in the
+ * repository.
+ *
+ * If override_change is NULL (the default), an attempt will be made
+ * to append to existing changes wherever possible instead of creating new ones.
+ * If override_change is non-null, only the given change ref will be updated.
+ *
+ * The changes list is filled in with the list of change refs that were updated,
+ * with the util pointers pointing to the old object IDS for those changes.
+ * The object ID pointers all point to objects owned by the change_table and
+ * will go out of scope when the change_table is destroyed.
+ *
+ * options is a bitwise combination of the UPDATE_OPTION_* flags.
+ */
+static int record_metacommit_withresult(
+	struct repository *repo,
+	struct change_table *chtable,
+	const struct metacommit_data *metacommit,
+	const char *override_change,
+	int options,
+	struct strbuf *err,
+	struct string_list *changes)
+{
+	static const char *msg = "updating change";
+	struct metacommit_data resolved_metacommit = METACOMMIT_DATA_INIT;
+	struct object_id commit_target;
+	struct ref_transaction *transaction = NULL;
+	struct change_head *overridden_head;
+	const struct object_id *old_head;
+
+	size_t i;
+	int ret = 0;
+	int force = (options & UPDATE_OPTION_FORCE);
+
+	resolve_metacommit(repo, chtable, metacommit, &resolved_metacommit, changes,
+		(options & UPDATE_OPTION_NOAPPEND) == 0);
+
+	if (override_change) {
+		string_list_clear(changes, 0);
+		overridden_head = get_change_head(chtable, override_change);
+		if (overridden_head) {
+			/* This is an existing change */
+			old_head = &overridden_head->head;
+			if (!force) {
+				if (!oid_array_readonly_contains(&(resolved_metacommit.replace),
+					&overridden_head->head)) {
+					/* Attempted non-fast-forward change */
+					strbuf_addf(err, _("non-fast-forward update to '%s'"),
+						override_change);
+					ret = -1;
+					goto cleanup;
+				}
+			}
+		} else
+			/* ...then this is a newly-created change */
+			old_head = null_oid();
+
+		/*
+		 * The expected "current" head of the change is stored in the
+		 * util pointer. Cast required because old_head is const*
+		 */
+		string_list_append(changes, override_change)->util = (void *)old_head;
+	}
+
+	if (is_nontrivial_metacommit(&resolved_metacommit)) {
+		/* If there are any origin or replacement parents, create a new metacommit
+		 * object. */
+		if (write_metacommit(repo, &resolved_metacommit, &commit_target) < 0) {
+			ret = -1;
+			goto cleanup;
+		}
+	} else {
+		/*
+		 * If the metacommit would only contain a content commit, point to the
+		 * commit itself rather than creating a trivial metacommit.
+		 */
+		oidcpy(&commit_target, &(resolved_metacommit.content));
+	}
+
+	/*
+	 * If a change already exists with this target and we're not forcing an
+	 * update to some specific override_change && change, there's nothing to do.
+	 */
+	if (!override_change
+		&& change_table_has_change_referencing(chtable, &commit_target))
+		/* Not an error */
+		goto cleanup;
+
+	transaction = ref_transaction_begin(err);
+
+	/* Update the refs for each affected change */
+	if (!transaction)
+		ret = -1;
+	else {
+		for (i = 0; i < changes->nr; i++) {
+			struct string_list_item *it = &changes->items[i];
+
+			/*
+			 * The expected current head of the change is stored in the util pointer.
+			 * It is null if the change should be newly-created.
+			 */
+			if (it->util) {
+				if (ref_transaction_update(transaction, it->string, &commit_target,
+					force ? NULL : it->util, 0, msg, err))
+
+					ret = -1;
+			} else {
+				if (ref_transaction_create(transaction, it->string,
+					&commit_target, 0, msg, err))
+
+					ret = -1;
+			}
+		}
+
+		if (!ret)
+			if (ref_transaction_commit(transaction, err))
+				ret = -1;
+	}
+
+cleanup:
+	ref_transaction_free(transaction);
+	clear_metacommit_data(&resolved_metacommit);
+
+	return ret;
+}
+
+int record_metacommit(
+	struct repository *repo,
+	const struct metacommit_data *metacommit,
+	const char *override_change,
+	int options,
+	struct strbuf *err,
+	struct string_list *changes)
+{
+		struct change_table chtable;
+		int result;
+
+		change_table_init(&chtable);
+		change_table_add_all_visible(&chtable, repo);
+
+		result = record_metacommit_withresult(
+			repo,
+			&chtable,
+			metacommit,
+			override_change,
+			options,
+			err,
+			changes);
+
+		change_table_clear(&chtable);
+		return result;
+}
+
+void modify_change(
+	struct repository *repo,
+	const struct object_id *old_commit,
+	const struct object_id *new_commit,
+	struct strbuf *err)
+{
+	struct string_list changes = STRING_LIST_INIT_DUP;
+	struct metacommit_data metacommit = METACOMMIT_DATA_INIT;
+
+	oidcpy(&(metacommit.content), new_commit);
+	oid_array_append(&(metacommit.replace), old_commit);
+
+	record_metacommit(repo, &metacommit, NULL, 0, err, &changes);
+
+	clear_metacommit_data(&metacommit);
+	string_list_clear(&changes, 0);
+}
diff --git a/metacommit.h b/metacommit.h
new file mode 100644
index 00000000000..45625cd0d02
--- /dev/null
+++ b/metacommit.h
@@ -0,0 +1,75 @@
+#ifndef METACOMMIT_H
+#define METACOMMIT_H
+
+#include "hash.h"
+#include "oid-array.h"
+#include "repository.h"
+#include "string-list.h"
+
+/* If specified, non-fast-forward changes are permitted. */
+#define UPDATE_OPTION_FORCE     0x0001
+/**
+ * If specified, no attempt will be made to append to existing changes.
+ * Normally, if a metacommit points to a commit in its replace or origin
+ * list and an existing change points to that same commit as its content, the
+ * new metacommit will attempt to append to that same change. This may replace
+ * the commit parent with one or more metacommits from the head of the appended
+ * changes. This option disables this behavior, and will always create a new
+ * change rather than reusing existing changes.
+ */
+#define UPDATE_OPTION_NOAPPEND  0x0002
+
+/* Metacommit Data */
+
+struct metacommit_data {
+	struct object_id content;
+	struct oid_array replace;
+	struct oid_array origin;
+	int abandoned;
+};
+
+#define METACOMMIT_DATA_INIT { 0 }
+
+extern void clear_metacommit_data(struct metacommit_data *state);
+
+/**
+ * Records the relationships described by the given metacommit in the
+ * repository.
+ *
+ * If override_change is NULL (the default), an attempt will be made
+ * to append to existing changes wherever possible instead of creating new ones.
+ * If override_change is non-null, only the given change ref will be updated.
+ *
+ * options is a bitwise combination of the UPDATE_OPTION_* flags.
+ */
+int record_metacommit(
+	struct repository *repo,
+	const struct metacommit_data *metacommit,
+	const char* override_change,
+	int options,
+	struct strbuf *err,
+	struct string_list *changes);
+
+/**
+ * Should be invoked after a command that has "modify" semantics - commands that
+ * create a new commit based on an old commit and treat the new one as a
+ * replacement for the old one. This method records the replacement in the
+ * change graph, such that a future evolve operation will rebase children of
+ * the old commit onto the new commit.
+ */
+void modify_change(
+	struct repository *repo,
+	const struct object_id *old_commit,
+	const struct object_id *new_commit,
+	struct strbuf *err);
+
+/**
+ * Creates a new metacommit object with the given content. Writes the object
+ * id of the newly-created commit to result.
+ */
+int write_metacommit(
+	struct repository *repo,
+	struct metacommit_data *state,
+	struct object_id *result);
+
+#endif
-- 
gitgitgadget

