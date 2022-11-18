Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C24C433FE
	for <git@archiver.kernel.org>; Fri, 18 Nov 2022 11:47:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241438AbiKRLrV (ORCPT <rfc822;git@archiver.kernel.org>);
        Fri, 18 Nov 2022 06:47:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241683AbiKRLrI (ORCPT <rfc822;git@vger.kernel.org>);
        Fri, 18 Nov 2022 06:47:08 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 818B882BCB
        for <git@vger.kernel.org>; Fri, 18 Nov 2022 03:47:06 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id f18so12430884ejz.5
        for <git@vger.kernel.org>; Fri, 18 Nov 2022 03:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqXhBc329812HBPTfgww2TQRGYdF3e1M0LMZ0mDcuP4=;
        b=ptTJLikLhCGPKOAPJkX//vmcFsU+KGRkmU0HvTS4vnJyZ4TulE14xDrUORc8rO422r
         GyqkAaG1QfvyAC2yG1EXHsFNOANjeq2XDRnCcsc0EdE9D6to4cLAdqJlTdLpKJCbPg9m
         DJ9q7wk20Qv14WTbP4vc376Nk0jrMmbYQCgio4QJa3rFSKftqgf8UdtIGG8/xtXvxrlR
         yoQKlBjLfi73OiUHD/a1oyAyZqYvp+Kv8YKAPOFA/t3j1ofduHaxRAeahnVENmdo6hJR
         +7DddNOWwWv2mDGC5jYPPCVFySsudO9nut8RxP7xS1tlwepAkfj/2tCO7HlGP+UYOdUW
         tcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KqXhBc329812HBPTfgww2TQRGYdF3e1M0LMZ0mDcuP4=;
        b=HLSBYcV41ekczj1Ql9zLkSsqvs8GQvK3hMuI5Ucd9gu28E+JSdQPqc2ZGfOyb4Upzm
         rgBUaNHZAUJ0uRc0z42XD9C8tuv9eZYgyA1y8TdzSIJbE/3UW6fIuDLFnf4jYk+zbuYm
         OQNAPiVi70GeU/2Mlk5NXO8Zi/ettI9rrBalZPNGnm/gMJwE8cfNSNrUSu+8azSdbf5V
         ytXFVWr91smeloOwl2NVQsaji5DoGvwJmpOUEvCnIKjf6YHlWFEWnxfVaPDDRZspGMzb
         c90xPfAeUMF5jJBDv9EdyysXYTjfgsqlVZr4oko1IJxxcTFW+maIYMLdHT8k95FQ1b58
         Q2ZQ==
X-Gm-Message-State: ANoB5pnMS7lcf2m9sBTGwmGvoPg+KQ6/C1k7djyEP1Bo/+LfNdRPCb3m
        4fBxRprB/dmwBCzMsI+2l2W7O1bZl9M6oA==
X-Google-Smtp-Source: AA0mqf6YUiA2tIuhkMPSRGbR5mp1UMqgrf6zRUwr5zKiKWcjLUebgeCAy57NlrFzo/cvJ6dvGQk0IA==
X-Received: by 2002:a17:906:c052:b0:79a:101a:7e57 with SMTP id bm18-20020a170906c05200b0079a101a7e57mr5649090ejb.368.1668772024656;
        Fri, 18 Nov 2022 03:47:04 -0800 (PST)
Received: from vm.nix.is (vm.nix.is. [2a01:4f8:120:2468::2])
        by smtp.gmail.com with ESMTPSA id o8-20020aa7dd48000000b004615e1bbaf4sm1705349edw.87.2022.11.18.03.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 03:47:03 -0800 (PST)
From:   =?UTF-8?q?=C3=86var=20Arnfj=C3=B6r=C3=B0=20Bjarmason?= 
        <avarab@gmail.com>
To:     git@vger.kernel.org
Cc:     Taylor Blau <me@ttaylorr.com>, Junio C Hamano <gitster@pobox.com>,
        Jeff King <peff@peff.net>,
        Jonathan Tan <jonathantanmy@google.com>,
        Kousik Sanagavarapu <five231003@gmail.com>,
        =?UTF-8?q?=C3=86var=20Arnfj=C3=B6r=C3=B0=20Bjarmason?= 
        <avarab@gmail.com>
Subject: [PATCH 3/4] tag: don't misreport type of tagged objects in errors
Date:   Fri, 18 Nov 2022 12:46:58 +0100
Message-Id: <patch-3.4-468af961dc4-20221118T113442Z-avarab@gmail.com>
X-Mailer: git-send-email 2.38.0.1512.g9e0c09a155f
In-Reply-To: <cover-0.4-00000000000-20221118T113442Z-avarab@gmail.com>
References: <Y3a3qcqNG8W3ueeb@coredump.intra.peff.net> <cover-0.4-00000000000-20221118T113442Z-avarab@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Fix a regression in 89e4202f982 ([PATCH] Parse tags for absent
objects, 2005-06-21) (yes, that ancient!) and correctly report an
error on a tag like:

    object <a tree hash>
    type commit

As:

    error: object <a tree hash> is tree, not a commit

Instead of our long-standing misbehavior of inverting the two, and
reporting:

    error: object <a tree hash> is commit, not a tree

Which, as can be trivially seen with 'git cat-file -t <a tree hash>'
is incorrect.

The reason for this misreporting is that in parse_tag_buffer() we end
up doing a lookup_{blob,commit,tag,tree}() depending on what we read
out of the "type" line.

If we haven't parsed that object before we end up dispatching to the
type-specific lookup functions, e.g. this for commit.c in
lookup_commit_type():

	struct object *obj = lookup_object(r, oid);
	if (!obj)
		return create_object(r, oid, alloc_commit_node(r));

Its allocation will then set the obj->type according to what the tag
told us the type was, but which we've never validated. At this point
we've got an object in memory that hasn't been parsed, and whose type
is incorrect, since we mistrusted a tag to tell us the type.

Then when we actually load the object with parse_object() we read it
and find that it's a "tree". See 8ff226a9d5e (add object_as_type
helper for casting objects, 2014-07-13) for that behavior (that's just
a refactoring commit, but shows all the code involved).

Which explains why we inverted the error report. Normally when
object_as_type() is called it's by the lookup_{blob,commit,tag,tree}()
functions via parse_object(). At that point we can trust the
obj->type.

In the case of parsing objects we've learned about via a tag with an
incorrect type it's the opposite, the obj->type isn't correct and
holds the mislabeled type, but we're parsing the object and know for
sure what object type we're dealing with.

So, let's add "lookup_{blob,commit,tag,tree}_type()" functions to go
with the existing ""lookup_{blob,commit,tag,tree}()", we'll call these
from "parse_object_buffer()" where we actually know the type, as
opposed to the "parse_tag_buffer()" code where we're just guessing
what it might be.

This only help with the cases where we do see the tag reference, and
then end up doing a full parse of the object. But as seen in the
"for-each-ref" and "fsck" tests we have cases where we'll never fully
parse it.

Those will be handled in a subsequent commit, but for now this handles
the common case of "show" etc. running into these.

Signed-off-by: Ævar Arnfjörð Bjarmason <avarab@gmail.com>
---
 blob.c                                 | 11 +++++++++--
 blob.h                                 |  3 +++
 commit.c                               | 11 +++++++++--
 commit.h                               |  2 ++
 object.c                               | 20 ++++++++++++++++----
 object.h                               |  2 ++
 t/t6102-rev-list-unexpected-objects.sh |  8 ++++----
 tag.c                                  | 21 +++++++++++++++++----
 tag.h                                  |  2 ++
 tree.c                                 | 11 +++++++++--
 tree.h                                 |  2 ++
 11 files changed, 75 insertions(+), 18 deletions(-)

diff --git a/blob.c b/blob.c
index 182718aba9f..ca30a22b2e8 100644
--- a/blob.c
+++ b/blob.c
@@ -5,12 +5,19 @@
 
 const char *blob_type = "blob";
 
-struct blob *lookup_blob(struct repository *r, const struct object_id *oid)
+struct blob *lookup_blob_type(struct repository *r,
+			      const struct object_id *oid,
+			      enum object_type type)
 {
 	struct object *obj = lookup_object(r, oid);
 	if (!obj)
 		return create_object(r, oid, alloc_blob_node(r));
-	return object_as_type(obj, OBJ_BLOB, 0);
+	return object_as_type_hint(obj, OBJ_BLOB, type);
+}
+
+struct blob *lookup_blob(struct repository *r, const struct object_id *oid)
+{
+	return lookup_blob_type(r, oid, OBJ_NONE);
 }
 
 int parse_blob_buffer(struct blob *item, void *buffer, unsigned long size)
diff --git a/blob.h b/blob.h
index 16648720557..066a2effcbf 100644
--- a/blob.h
+++ b/blob.h
@@ -10,6 +10,9 @@ struct blob {
 };
 
 struct blob *lookup_blob(struct repository *r, const struct object_id *oid);
+struct blob *lookup_blob_type(struct repository *r,
+			      const struct object_id *oid,
+			      enum object_type type);
 
 int parse_blob_buffer(struct blob *item, void *buffer, unsigned long size);
 
diff --git a/commit.c b/commit.c
index 572301b80a2..8a90f279e24 100644
--- a/commit.c
+++ b/commit.c
@@ -67,12 +67,19 @@ struct commit *lookup_commit_object(struct repository *r,
 
 }
 
-struct commit *lookup_commit(struct repository *r, const struct object_id *oid)
+struct commit *lookup_commit_type(struct repository *r,
+				  const struct object_id *oid,
+				  enum object_type type)
 {
 	struct object *obj = lookup_object(r, oid);
 	if (!obj)
 		return create_object(r, oid, alloc_commit_node(r));
-	return object_as_type(obj, OBJ_COMMIT, 0);
+	return object_as_type_hint(obj, OBJ_COMMIT, type);
+}
+
+struct commit *lookup_commit(struct repository *r, const struct object_id *oid)
+{
+	return lookup_commit_type(r, oid, OBJ_NONE);
 }
 
 struct commit *lookup_commit_reference_by_name(const char *name)
diff --git a/commit.h b/commit.h
index fa39202fa6b..95001a29d6b 100644
--- a/commit.h
+++ b/commit.h
@@ -78,6 +78,8 @@ struct commit *lookup_commit_object(struct repository *r, const struct object_id
  * "oid" is not in the object cache.
  */
 struct commit *lookup_commit(struct repository *r, const struct object_id *oid);
+struct commit *lookup_commit_type(struct repository *r, const struct object_id *oid,
+				  enum object_type type);
 struct commit *lookup_commit_reference(struct repository *r,
 				       const struct object_id *oid);
 struct commit *lookup_commit_reference_gently(struct repository *r,
diff --git a/object.c b/object.c
index fad1a5af4a6..cc17ed0606e 100644
--- a/object.c
+++ b/object.c
@@ -177,6 +177,18 @@ void *object_as_type(struct object *obj, enum object_type type, int quiet)
 	}
 }
 
+void *object_as_type_hint(struct object *obj, enum object_type type,
+			  enum object_type hint)
+{
+	if (hint != OBJ_NONE && obj->type != OBJ_NONE && obj->type != type) {
+		error(_("object %s is a %s, not a %s"), oid_to_hex(&obj->oid),
+		      type_name(type), type_name(obj->type));
+		obj->type = type;
+		return NULL;
+	}
+	return object_as_type(obj, type, 0);;
+}
+
 struct object *lookup_unknown_object(struct repository *r, const struct object_id *oid)
 {
 	struct object *obj = lookup_object(r, oid);
@@ -210,14 +222,14 @@ struct object *parse_object_buffer(struct repository *r, const struct object_id
 
 	obj = NULL;
 	if (type == OBJ_BLOB) {
-		struct blob *blob = lookup_blob(r, oid);
+		struct blob *blob = lookup_blob_type(r, oid, type);
 		if (blob) {
 			if (parse_blob_buffer(blob, buffer, size))
 				return NULL;
 			obj = &blob->object;
 		}
 	} else if (type == OBJ_TREE) {
-		struct tree *tree = lookup_tree(r, oid);
+		struct tree *tree = lookup_tree_type(r, oid, type);
 		if (tree) {
 			obj = &tree->object;
 			if (!tree->buffer)
@@ -229,7 +241,7 @@ struct object *parse_object_buffer(struct repository *r, const struct object_id
 			}
 		}
 	} else if (type == OBJ_COMMIT) {
-		struct commit *commit = lookup_commit(r, oid);
+		struct commit *commit = lookup_commit_type(r, oid, type);
 		if (commit) {
 			if (parse_commit_buffer(r, commit, buffer, size, 1))
 				return NULL;
@@ -241,7 +253,7 @@ struct object *parse_object_buffer(struct repository *r, const struct object_id
 			obj = &commit->object;
 		}
 	} else if (type == OBJ_TAG) {
-		struct tag *tag = lookup_tag(r, oid);
+		struct tag *tag = lookup_tag_type(r, oid, type);
 		if (tag) {
 			if (parse_tag_buffer(r, tag, buffer, size))
 			       return NULL;
diff --git a/object.h b/object.h
index 31ebe114585..042c304d3a4 100644
--- a/object.h
+++ b/object.h
@@ -122,6 +122,8 @@ struct object *lookup_object(struct repository *r, const struct object_id *oid);
 void *create_object(struct repository *r, const struct object_id *oid, void *obj);
 
 void *object_as_type(struct object *obj, enum object_type type, int quiet);
+void *object_as_type_hint(struct object *obj, enum object_type type,
+			  enum object_type hint);
 
 /*
  * Returns the object, having parsed it to find out what it is.
diff --git a/t/t6102-rev-list-unexpected-objects.sh b/t/t6102-rev-list-unexpected-objects.sh
index ac49f7182fd..2e36d8bcfd9 100755
--- a/t/t6102-rev-list-unexpected-objects.sh
+++ b/t/t6102-rev-list-unexpected-objects.sh
@@ -166,7 +166,7 @@ test_expect_success 'setup unexpected non-tag tag' '
 	git update-ref refs/tags/commit_tag_blob $commit_tag_blob
 '
 
-test_expect_failure 'traverse unexpected incorrectly typed tag (to commit & tag)' '
+test_expect_success 'traverse unexpected incorrectly typed tag (to commit & tag)' '
 	test_must_fail git rev-list --objects $tag_tag_commit 2>err &&
 	cat >expect <<-EOF &&
 	error: object $commit is a commit, not a tag
@@ -182,7 +182,7 @@ test_expect_failure 'traverse unexpected incorrectly typed tag (to commit & tag)
 	test_cmp expect err
 '
 
-test_expect_failure 'traverse unexpected incorrectly typed tag (to tree)' '
+test_expect_success 'traverse unexpected incorrectly typed tag (to tree)' '
 	test_must_fail git rev-list --objects $tag_tag_tree 2>err &&
 	cat >expect <<-EOF &&
 	error: object $tree is a tree, not a tag
@@ -198,7 +198,7 @@ test_expect_failure 'traverse unexpected incorrectly typed tag (to tree)' '
 	test_cmp expect err
 '
 
-test_expect_failure 'traverse unexpected incorrectly typed tag (to blob)' '
+test_expect_success 'traverse unexpected incorrectly typed tag (to blob)' '
 	test_must_fail git rev-list --objects $tag_tag_blob 2>err &&
 	cat >expect <<-EOF &&
 	error: object $blob is a blob, not a tag
@@ -214,7 +214,7 @@ test_expect_failure 'traverse unexpected incorrectly typed tag (to blob)' '
 	test_cmp expect err
 '
 
-test_expect_failure 'traverse unexpected non-tag tag (tree seen to blob)' '
+test_expect_success 'traverse unexpected non-tag tag (tree seen to blob)' '
 	test_must_fail git rev-list --objects $tree $commit_tag_blob 2>err &&
 	cat >expect <<-EOF &&
 	error: object $blob is a blob, not a commit
diff --git a/tag.c b/tag.c
index dfbcd7fcc24..19453c2edbf 100644
--- a/tag.c
+++ b/tag.c
@@ -100,12 +100,18 @@ struct object *deref_tag_noverify(struct object *o)
 	return o;
 }
 
-struct tag *lookup_tag(struct repository *r, const struct object_id *oid)
+struct tag *lookup_tag_type(struct repository *r, const struct object_id *oid,
+			    enum object_type type)
 {
 	struct object *obj = lookup_object(r, oid);
 	if (!obj)
 		return create_object(r, oid, alloc_tag_node(r));
-	return object_as_type(obj, OBJ_TAG, 0);
+	return object_as_type_hint(obj, OBJ_TAG, type);
+}
+
+struct tag *lookup_tag(struct repository *r, const struct object_id *oid)
+{
+	return lookup_tag_type(r, oid, OBJ_NONE);
 }
 
 static timestamp_t parse_tag_date(const char *buf, const char *tail)
@@ -135,6 +141,7 @@ void release_tag_memory(struct tag *t)
 
 int parse_tag_buffer(struct repository *r, struct tag *item, const void *data, unsigned long size)
 {
+	struct object *obj;
 	struct object_id oid;
 	char type[20];
 	const char *bufptr = data;
@@ -169,7 +176,10 @@ int parse_tag_buffer(struct repository *r, struct tag *item, const void *data, u
 	type[nl - bufptr] = '\0';
 	bufptr = nl + 1;
 
-	if (!strcmp(type, blob_type)) {
+	obj = lookup_object(r, &oid);
+	if (obj) {
+		item->tagged = obj;
+	} else if (!strcmp(type, blob_type)) {
 		item->tagged = (struct object *)lookup_blob(r, &oid);
 	} else if (!strcmp(type, tree_type)) {
 		item->tagged = (struct object *)lookup_tree(r, &oid);
@@ -182,10 +192,13 @@ int parse_tag_buffer(struct repository *r, struct tag *item, const void *data, u
 			     type, oid_to_hex(&item->object.oid));
 	}
 
-	if (!item->tagged)
+	if (!item->tagged || strcmp(type_name(item->tagged->type), type)) {
+		error(_("object %s is a %s, not a %s"), oid_to_hex(&oid),
+		      type_name(item->tagged->type), type);
 		return error("bad tag pointer to %s in %s",
 			     oid_to_hex(&oid),
 			     oid_to_hex(&item->object.oid));
+	}
 
 	if (bufptr + 4 < tail && starts_with(bufptr, "tag "))
 		; 		/* good */
diff --git a/tag.h b/tag.h
index 3ce8e721924..42bd3e64011 100644
--- a/tag.h
+++ b/tag.h
@@ -12,6 +12,8 @@ struct tag {
 	timestamp_t date;
 };
 struct tag *lookup_tag(struct repository *r, const struct object_id *oid);
+struct tag *lookup_tag_type(struct repository *r, const struct object_id *oid,
+			    enum object_type type);
 int parse_tag_buffer(struct repository *r, struct tag *item, const void *data, unsigned long size);
 int parse_tag(struct tag *item);
 void release_tag_memory(struct tag *t);
diff --git a/tree.c b/tree.c
index 410e3b477e5..1a730249bb8 100644
--- a/tree.c
+++ b/tree.c
@@ -102,12 +102,19 @@ int cmp_cache_name_compare(const void *a_, const void *b_)
 				  ce2->name, ce2->ce_namelen, ce_stage(ce2));
 }
 
-struct tree *lookup_tree(struct repository *r, const struct object_id *oid)
+struct tree *lookup_tree_type(struct repository *r,
+			      const struct object_id *oid,
+			      enum object_type type)
 {
 	struct object *obj = lookup_object(r, oid);
 	if (!obj)
 		return create_object(r, oid, alloc_tree_node(r));
-	return object_as_type(obj, OBJ_TREE, 0);
+	return object_as_type_hint(obj, OBJ_TREE, type);
+}
+
+struct tree *lookup_tree(struct repository *r, const struct object_id *oid)
+{
+	return lookup_tree_type(r, oid, OBJ_NONE);
 }
 
 int parse_tree_buffer(struct tree *item, void *buffer, unsigned long size)
diff --git a/tree.h b/tree.h
index 6efff003e21..4af3b617f3d 100644
--- a/tree.h
+++ b/tree.h
@@ -15,6 +15,8 @@ struct tree {
 extern const char *tree_type;
 
 struct tree *lookup_tree(struct repository *r, const struct object_id *oid);
+struct tree *lookup_tree_type(struct repository *r, const struct object_id *oid,
+			      enum object_type type);
 
 int parse_tree_buffer(struct tree *item, void *buffer, unsigned long size);
 
-- 
2.38.0.1511.gcdcff1f1dc2

