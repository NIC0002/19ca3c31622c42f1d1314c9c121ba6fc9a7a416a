Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14953C433F5
	for <git@archiver.kernel.org>; Thu,  3 Mar 2022 00:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbiCCAVr (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 2 Mar 2022 19:21:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbiCCAVm (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 2 Mar 2022 19:21:42 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29012F8B9F
        for <git@vger.kernel.org>; Wed,  2 Mar 2022 16:20:57 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id t21so2744161qkg.6
        for <git@vger.kernel.org>; Wed, 02 Mar 2022 16:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ttaylorr-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P5GgWkN9cl8Xn1q1KDYUKB5PiHhKBc7Ki0Cn957yFXs=;
        b=oJ4tVASl754dK/CLSKcNRVFAWhc9vCvmLzEoSbEA6PCX4PS0ii59ZFLnK+ynHOUniT
         /2I2eh/8SaRTF/03xtQIa4sk2GYa5DWHUDC1tVYkFSlXRY+Yu3zf55SRiHRzaYTAI4ul
         mLvqCkys63jjuaBBz8YSuAbUrR+nX3rTUdw7Pzn1GJotGm2deuKik3OOZPTCxjW0ui5n
         kuCbx4HRkpAB28PEYY8iNj7q1DFLP7JOPTMnAzj1Cj7uvRjlDY1vxopDDjz/o7lnrzC/
         Z1aoqIHEeMgjFXc66W2jws492XoOZFddNUeQoqUhyZhpIeSBeeXF+g49tQFtn7/Q1vA4
         N/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P5GgWkN9cl8Xn1q1KDYUKB5PiHhKBc7Ki0Cn957yFXs=;
        b=lPVVt1Qke9bW0gC0x/J52B5Rf5T391eSqYxZwvjY3OL9W+XFLe9kt/zFQybcjCxnvg
         pJUHi8IP+uNBGh4toio+v0ifeXF3h78whV0dl/mXfjsPAqu1Y/El+ZLNJ0PUVw41kqUD
         cjhz+QaBDmcGvo7X3ZUR5c0d5kJz8miH91gunipiQJEFZi1BQRhfegPNsy2P9Q9DI+av
         rRz0Mi5GnJVLGfdNX2FnitUVze+OoNWKaZDa0eBCbmSpinepStKmBm5WavB0c67ph/iw
         FOS1U+n3lsM8kDz+izP0xbxbbtPxZkYYBrnFR8f5NWpUWHoFOJ3ohHD67hs2hNj49XL/
         pVSA==
X-Gm-Message-State: AOAM533tFH//NtGYy8EWzxUoVarK7lzVkxAB/TDmEuaDZvue8swIUEA6
        0jMdkOWsuWM65aEeT3WRwX72eR+CnBUtvNGz
X-Google-Smtp-Source: ABdhPJxxojgWeDd65u5CQX3vhm2HxqUoGHdSWQarKm7zfMPGdBl4N08SF3hjNpB0B6Y+yCEJP2vu1g==
X-Received: by 2002:a05:620a:2a05:b0:649:1a85:9212 with SMTP id o5-20020a05620a2a0500b006491a859212mr17655407qkp.586.1646266856074;
        Wed, 02 Mar 2022 16:20:56 -0800 (PST)
Received: from localhost (104-178-186-189.lightspeed.milwwi.sbcglobal.net. [104.178.186.189])
        by smtp.gmail.com with ESMTPSA id f13-20020ac87f0d000000b002dce143f369sm384826qtk.53.2022.03.02.16.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 16:20:55 -0800 (PST)
Date:   Wed, 2 Mar 2022 19:20:55 -0500
From:   Taylor Blau <me@ttaylorr.com>
To:     git@vger.kernel.org
Cc:     tytso@mit.edu, derrickstolee@github.com, gitster@pobox.com,
        larsxschneider@gmail.com
Subject: [PATCH v3 05/17] pack-mtimes: support writing pack .mtimes files
Message-ID: <0600503856dbccb135aaead27693b6815a774b4f.1646266835.git.me@ttaylorr.com>
References: <cover.1638224692.git.me@ttaylorr.com>
 <cover.1646266835.git.me@ttaylorr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1646266835.git.me@ttaylorr.com>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Now that the `.mtimes` format is defined, supplement the pack-write API
to be able to conditionally write an `.mtimes` file along with a pack by
setting an additional flag and passing an oidmap that contains the
timestamps corresponding to each object in the pack.

Signed-off-by: Taylor Blau <me@ttaylorr.com>
---
 pack-objects.c |  6 ++++
 pack-objects.h | 25 ++++++++++++++++
 pack-write.c   | 77 ++++++++++++++++++++++++++++++++++++++++++++++++++
 pack.h         |  1 +
 4 files changed, 109 insertions(+)

diff --git a/pack-objects.c b/pack-objects.c
index fe2a4eace9..272e8d4517 100644
--- a/pack-objects.c
+++ b/pack-objects.c
@@ -170,6 +170,9 @@ struct object_entry *packlist_alloc(struct packing_data *pdata,
 
 		if (pdata->layer)
 			REALLOC_ARRAY(pdata->layer, pdata->nr_alloc);
+
+		if (pdata->cruft_mtime)
+			REALLOC_ARRAY(pdata->cruft_mtime, pdata->nr_alloc);
 	}
 
 	new_entry = pdata->objects + pdata->nr_objects++;
@@ -198,6 +201,9 @@ struct object_entry *packlist_alloc(struct packing_data *pdata,
 	if (pdata->layer)
 		pdata->layer[pdata->nr_objects - 1] = 0;
 
+	if (pdata->cruft_mtime)
+		pdata->cruft_mtime[pdata->nr_objects - 1] = 0;
+
 	return new_entry;
 }
 
diff --git a/pack-objects.h b/pack-objects.h
index dca2351ef9..393b9db546 100644
--- a/pack-objects.h
+++ b/pack-objects.h
@@ -168,6 +168,14 @@ struct packing_data {
 	/* delta islands */
 	unsigned int *tree_depth;
 	unsigned char *layer;
+
+	/*
+	 * Used when writing cruft packs.
+	 *
+	 * Object mtimes are stored in pack order when writing, but
+	 * written out in lexicographic (index) order.
+	 */
+	uint32_t *cruft_mtime;
 };
 
 void prepare_packing_data(struct repository *r, struct packing_data *pdata);
@@ -289,4 +297,21 @@ static inline void oe_set_layer(struct packing_data *pack,
 	pack->layer[e - pack->objects] = layer;
 }
 
+static inline uint32_t oe_cruft_mtime(struct packing_data *pack,
+				      struct object_entry *e)
+{
+	if (!pack->cruft_mtime)
+		return 0;
+	return pack->cruft_mtime[e - pack->objects];
+}
+
+static inline void oe_set_cruft_mtime(struct packing_data *pack,
+				      struct object_entry *e,
+				      uint32_t mtime)
+{
+	if (!pack->cruft_mtime)
+		CALLOC_ARRAY(pack->cruft_mtime, pack->nr_alloc);
+	pack->cruft_mtime[e - pack->objects] = mtime;
+}
+
 #endif
diff --git a/pack-write.c b/pack-write.c
index ff305b404c..270280c4df 100644
--- a/pack-write.c
+++ b/pack-write.c
@@ -3,6 +3,10 @@
 #include "csum-file.h"
 #include "remote.h"
 #include "chunk-format.h"
+#include "pack-mtimes.h"
+#include "oidmap.h"
+#include "chunk-format.h"
+#include "pack-objects.h"
 
 void reset_pack_idx_option(struct pack_idx_option *opts)
 {
@@ -276,6 +280,70 @@ const char *write_rev_file_order(const char *rev_name,
 	return rev_name;
 }
 
+static void write_mtimes_header(struct hashfile *f)
+{
+	hashwrite_be32(f, MTIMES_SIGNATURE);
+	hashwrite_be32(f, MTIMES_VERSION);
+	hashwrite_be32(f, oid_version(the_hash_algo));
+}
+
+/*
+ * Writes the object mtimes of "objects" for use in a .mtimes file.
+ * Note that objects must be in lexicographic (index) order, which is
+ * the expected ordering of these values in the .mtimes file.
+ */
+static void write_mtimes_objects(struct hashfile *f,
+				 struct packing_data *to_pack,
+				 struct pack_idx_entry **objects,
+				 uint32_t nr_objects)
+{
+	uint32_t i;
+	for (i = 0; i < nr_objects; i++) {
+		struct object_entry *e = (struct object_entry*)objects[i];
+		hashwrite_be32(f, oe_cruft_mtime(to_pack, e));
+	}
+}
+
+static void write_mtimes_trailer(struct hashfile *f, const unsigned char *hash)
+{
+	hashwrite(f, hash, the_hash_algo->rawsz);
+}
+
+static const char *write_mtimes_file(const char *mtimes_name,
+				     struct packing_data *to_pack,
+				     struct pack_idx_entry **objects,
+				     uint32_t nr_objects,
+				     const unsigned char *hash)
+{
+	struct hashfile *f;
+	int fd;
+
+	if (!to_pack)
+		BUG("cannot call write_mtimes_file with NULL packing_data");
+
+	if (!mtimes_name) {
+		struct strbuf tmp_file = STRBUF_INIT;
+		fd = odb_mkstemp(&tmp_file, "pack/tmp_mtimes_XXXXXX");
+		mtimes_name = strbuf_detach(&tmp_file, NULL);
+	} else {
+		unlink(mtimes_name);
+		fd = xopen(mtimes_name, O_CREAT|O_EXCL|O_WRONLY, 0600);
+	}
+	f = hashfd(fd, mtimes_name);
+
+	write_mtimes_header(f);
+	write_mtimes_objects(f, to_pack, objects, nr_objects);
+	write_mtimes_trailer(f, hash);
+
+	if (adjust_shared_perm(mtimes_name) < 0)
+		die(_("failed to make %s readable"), mtimes_name);
+
+	finalize_hashfile(f, NULL,
+			  CSUM_HASH_IN_STREAM | CSUM_CLOSE | CSUM_FSYNC);
+
+	return mtimes_name;
+}
+
 off_t write_pack_header(struct hashfile *f, uint32_t nr_entries)
 {
 	struct pack_header hdr;
@@ -478,6 +546,7 @@ void stage_tmp_packfiles(struct strbuf *name_buffer,
 			 char **idx_tmp_name)
 {
 	const char *rev_tmp_name = NULL;
+	const char *mtimes_tmp_name = NULL;
 
 	if (adjust_shared_perm(pack_tmp_name))
 		die_errno("unable to make temporary pack file readable");
@@ -490,9 +559,17 @@ void stage_tmp_packfiles(struct strbuf *name_buffer,
 	rev_tmp_name = write_rev_file(NULL, written_list, nr_written, hash,
 				      pack_idx_opts->flags);
 
+	if (pack_idx_opts->flags & WRITE_MTIMES) {
+		mtimes_tmp_name = write_mtimes_file(NULL, to_pack, written_list,
+						    nr_written,
+						    hash);
+	}
+
 	rename_tmp_packfile(name_buffer, pack_tmp_name, "pack");
 	if (rev_tmp_name)
 		rename_tmp_packfile(name_buffer, rev_tmp_name, "rev");
+	if (mtimes_tmp_name)
+		rename_tmp_packfile(name_buffer, mtimes_tmp_name, "mtimes");
 }
 
 void write_promisor_file(const char *promisor_name, struct ref **sought, int nr_sought)
diff --git a/pack.h b/pack.h
index fd27cfdfd7..01d385903a 100644
--- a/pack.h
+++ b/pack.h
@@ -44,6 +44,7 @@ struct pack_idx_option {
 #define WRITE_IDX_STRICT 02
 #define WRITE_REV 04
 #define WRITE_REV_VERIFY 010
+#define WRITE_MTIMES 020
 
 	uint32_t version;
 	uint32_t off32_limit;
-- 
2.35.1.73.gccc5557600

