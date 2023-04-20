Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE3EC77B73
	for <git@archiver.kernel.org>; Thu, 20 Apr 2023 17:27:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbjDTR1R (ORCPT <rfc822;git@archiver.kernel.org>);
        Thu, 20 Apr 2023 13:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231519AbjDTR1P (ORCPT <rfc822;git@vger.kernel.org>);
        Thu, 20 Apr 2023 13:27:15 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F3A7173A
        for <git@vger.kernel.org>; Thu, 20 Apr 2023 10:27:09 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-54fb615ac3dso52519597b3.2
        for <git@vger.kernel.org>; Thu, 20 Apr 2023 10:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ttaylorr-com.20221208.gappssmtp.com; s=20221208; t=1682011628; x=1684603628;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j0c7N5sbN3lZ2U/QHda/sAcJ3ocbIIItIEtbcXhvt2w=;
        b=iuEaEjKP+Vr3rFnG3mJSnzPotRCbD/Ip6crvGbimjbMk/Hw2ozV7x0N7cUO6+LY1G4
         ryjvLU/hVLOWW/HC4B28F/5+C4GKx6V8Jwq8ccUzLoZWzoY5nHkbbGAOZYyYJJ3S2hWE
         v8ldtqfuz6/QteYoGHCiPgrtlxJ8xwhM3RnTXp9JTB/3EDtEYqjiN+A3KTAtmU+7SFWa
         YWS/K2y9RDztu77zpjPU7CaskrjrbIKvaoaMs0I/GxUrBi5wJMkn2oRhltjBELNmLFGj
         4auXjTJCB7n95qtb6U6Jpt4uglQgmB4b06YkPa6OCpGFybUcTfJR6C68omfL11dqSzC9
         uKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682011628; x=1684603628;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j0c7N5sbN3lZ2U/QHda/sAcJ3ocbIIItIEtbcXhvt2w=;
        b=ctwkQDVa3N0xGd4pNmDq1rsTf7mkDMzMg2cHnLMz8lX1sMvLUbWwpSwtVqRclBYn1X
         Y8mkrRUH0ueUdmXIOD4Ktf2KBiSNGK3GUq1w7ljpCHD4wJjl9wBRPgnYpBLTts+F3ssu
         sjDQbCQ9M6uNL4BqHmd2zm5dlw43yEVU0FM+8sefkTInElyS4kxZrZ+oyxPhAE8Jjn1U
         P+Iptc+Q0txzz03e4nz3qFMrUnFHlvocFR5Z1o9POzpS1//wvs0kO/lm8OYzJctfrqBw
         /ocCXi+e/spA3ddpblt7+CPT0dZ8C5knzfistfvGetptB39n1xe9/3NHoFVE12CNel2L
         a9dA==
X-Gm-Message-State: AAQBX9dD7H3NA1jWHq+rW4BH45sYkDPKd2qDtUPkvoN/Dl3xYT6aSczf
        +iH4m4mddvmu2G+O4bA4yZuz9p4oX80tG92qxFgNaw==
X-Google-Smtp-Source: AKy350YMlVDRtvn8l9DL246ItIA/UMapiOOD0nD5YGUgSquOwBZXWV3lmo0J2EK3kiK4wKJJLI2Uww==
X-Received: by 2002:a0d:eb95:0:b0:54f:a985:dd48 with SMTP id u143-20020a0deb95000000b0054fa985dd48mr1497468ywe.41.1682011628091;
        Thu, 20 Apr 2023 10:27:08 -0700 (PDT)
Received: from localhost (104-178-186-189.lightspeed.milwwi.sbcglobal.net. [104.178.186.189])
        by smtp.gmail.com with ESMTPSA id h185-20020a0dc5c2000000b005463f6ae720sm442189ywd.68.2023.04.20.10.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 10:27:07 -0700 (PDT)
Date:   Thu, 20 Apr 2023 13:27:06 -0400
From:   Taylor Blau <me@ttaylorr.com>
To:     git@vger.kernel.org
Cc:     Jeff King <peff@peff.net>,
        Derrick Stolee <derrickstolee@github.com>,
        Junio C Hamano <gitster@pobox.com>
Subject: [PATCH] builtin/pack-objects.c: introduce `pack.extraCruftTips`
Message-ID: <8af478ebe34539b68ffb9b353bbb1372dfca3871.1682011600.git.me@ttaylorr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

This patch introduces a new multi-valued configuration option,
`pack.extraCruftTips` as an alternative means to mark certain objects in
the cruft pack as rescued, even if they would otherwise be pruned.

Traditionally, cruft packs are generated in one of two ways:

  - When not pruning, all packed and loose objects which do not appear
    in the any of the packs which wil remain (as indicated over stdin,
    with `--cruft`) are packed separately into a cruft pack.

  - When pruning, the above process happens, with two additional tweaks.
    Instead of adding every object into the cruft pack, only objects
    which have mtime that is within the grace period are kept. In
    addition, a "rescuing" traversal is performed over the remaining
    cruft objects to keep around cruft objects which would have aged out
    of the repository, but are reachable from other cruft objects which
    have not yet aged out.

This works well for repositories which have all of their "interesting"
objects worth keeping around reachable via at least one reference.

However, there is no option to be able to keep around certain objects
that have otherwise aged out of the grace period. The only way to retain
those objects is:

  - to point a reference at them, which may be undesirable or
    infeasible,
  - to extend the grace period, which may keep around other objects that
    the caller *does* want to discard,
  - or, to force the caller to construct the pack of objects they want
    to keep themselves, and then mark the pack as kept by adding a
    ".keep" file.

This patch introduces a new configuration, `pack.extraCruftTips` which
allows the caller to specify a program (or set of programs) whose output
is treated as a set of objects to treat as "kept", even if they are
unreachable and have aged out of the retention period.

The implementation is straightforward: after determining the set of
objects to pack into the cruft pack (either by calling
`enumerate_cruft_objects()` or `enumerate_and_traverse_cruft_objects()`)
we figure out if there are any program(s) we need to consult in order to
determine if there are any objects which we need to "rescue". We then
add those as tips to another reachability traversal, marking every
object along the way as cruft (and thus retaining it in the cruft pack).

A potential alternative here is to introduce a new mode to alter the
contents of the reachable pack instead of the cruft one. One could
imagine a new option to `pack-objects`, say `--extra-tips` that does the
same thing as above, adding the visited set of objects along the
traversal to the pack.

But this has the unfortunate side-effect of altering the reachability
closure of that pack. If parts of the unreachable object graph mentioned
by one or more of the "extra tips" programs is not closed, then the
resulting pack won't be either. This makes it impossible in the general
case to write out reachability bitmaps for that pack, since closure is a
requirement there.

Instead, keep these unreachable objects in the cruft pack instead, to
ensure that we can continue to have a pack containing just reachable
objects, which is always safe to write a bitmap over.

Signed-off-by: Taylor Blau <me@ttaylorr.com>
---
 Documentation/config/pack.txt |  9 ++++
 builtin/pack-objects.c        | 95 +++++++++++++++++++++++++++++++++
 t/t5329-pack-objects-cruft.sh | 98 +++++++++++++++++++++++++++++++++++
 3 files changed, 202 insertions(+)

diff --git a/Documentation/config/pack.txt b/Documentation/config/pack.txt
index 53093d9996..ab6aadd4b0 100644
--- a/Documentation/config/pack.txt
+++ b/Documentation/config/pack.txt
@@ -67,6 +67,15 @@ pack.deltaCacheLimit::
 	result once the best match for all objects is found.
 	Defaults to 1000. Maximum value is 65535.
 
+pack.extraCruftTips::
+	When generating a cruft pack, use the shell to execute the
+	specified command(s), and interpret their output as additional
+	tips of objects to keep in the cruft pack, regardless of their
+	age.
++
+Output must contain exactly one hex object ID per line, and nothing
+else. Objects which cannot be found in the repository are ignored.
+
 pack.threads::
 	Specifies the number of threads to spawn when searching for best
 	delta matches.  This requires that linkgit:git-pack-objects[1]
diff --git a/builtin/pack-objects.c b/builtin/pack-objects.c
index 77d88f85b0..3b575c79dc 100644
--- a/builtin/pack-objects.c
+++ b/builtin/pack-objects.c
@@ -43,6 +43,7 @@
 #include "pack-mtimes.h"
 #include "parse-options.h"
 #include "wrapper.h"
+#include "run-command.h"
 
 /*
  * Objects we are going to pack are collected in the `to_pack` structure.
@@ -3586,6 +3587,98 @@ static void enumerate_and_traverse_cruft_objects(struct string_list *fresh_packs
 	stop_progress(&progress_state);
 }
 
+static int enumerate_extra_cruft_tips_1(struct rev_info *revs, const char *args)
+{
+	struct child_process cmd = CHILD_PROCESS_INIT;
+	struct strbuf buf = STRBUF_INIT;
+	FILE *out = NULL;
+	int ret = 0;
+
+	cmd.use_shell = 1;
+	cmd.out = -1;
+
+	strvec_push(&cmd.args, args);
+	strvec_pushv(&cmd.env, (const char **)local_repo_env);
+
+	if (start_command(&cmd)) {
+		ret = -1;
+		goto done;
+	}
+
+	out = xfdopen(cmd.out, "r");
+	while (strbuf_getline_lf(&buf, out) != EOF) {
+		struct object_id oid;
+		struct object *obj;
+		const char *rest;
+
+		if (parse_oid_hex(buf.buf, &oid, &rest) || *rest) {
+			ret = error(_("invalid extra cruft tip: '%s'"), buf.buf);
+			goto done;
+		}
+
+		obj = parse_object(the_repository, &oid);
+		if (!obj)
+			continue;
+
+		display_progress(progress_state, ++nr_seen);
+		add_pending_object(revs, obj, "");
+	}
+
+done:
+	if (out)
+		fclose(out);
+	strbuf_release(&buf);
+	child_process_clear(&cmd);
+
+	return ret;
+}
+
+static int enumerate_extra_cruft_tips(void)
+{
+	struct rev_info revs;
+	const struct string_list *programs;
+	int ret = 0;
+	size_t i;
+
+	if (git_config_get_string_multi("pack.extracrufttips", &programs))
+		return ret;
+
+	repo_init_revisions(the_repository, &revs, NULL);
+
+	revs.tag_objects = 1;
+	revs.tree_objects = 1;
+	revs.blob_objects = 1;
+
+	revs.include_check = cruft_include_check;
+	revs.include_check_obj = cruft_include_check_obj;
+
+	revs.ignore_missing_links = 1;
+
+	if (progress)
+		progress_state = start_progress(_("Enumerating extra cruft tips"), 0);
+	nr_seen = 0;
+	for (i = 0; i < programs->nr; i++) {
+		ret = enumerate_extra_cruft_tips_1(&revs,
+						   programs->items[i].string);
+		if (!ret)
+			break;
+	}
+	stop_progress(&progress_state);
+
+	if (ret)
+		die(_("unable to enumerate additional cruft tips"));
+
+	if (prepare_revision_walk(&revs))
+		die(_("revision walk setup failed"));
+	if (progress)
+		progress_state = start_progress(_("Traversing extra cruft objects"), 0);
+	nr_seen = 0;
+	traverse_commit_list(&revs, show_cruft_commit, show_cruft_object, NULL);
+	stop_progress(&progress_state);
+
+	return ret;
+}
+
 static void read_cruft_objects(void)
 {
 	struct strbuf buf = STRBUF_INIT;
@@ -3641,6 +3734,8 @@ static void read_cruft_objects(void)
 	else
 		enumerate_cruft_objects();
 
+	enumerate_extra_cruft_tips();
+
 	strbuf_release(&buf);
 	string_list_clear(&discard_packs, 0);
 	string_list_clear(&fresh_packs, 0);
diff --git a/t/t5329-pack-objects-cruft.sh b/t/t5329-pack-objects-cruft.sh
index 303f7a5d84..1260e11d41 100755
--- a/t/t5329-pack-objects-cruft.sh
+++ b/t/t5329-pack-objects-cruft.sh
@@ -739,4 +739,102 @@ test_expect_success 'cruft objects are freshend via loose' '
 	)
 '
 
+test_expect_success 'additional cruft tips may be specified via pack.extraCruftTips' '
+	git init repo &&
+	test_when_finished "rm -fr repo" &&
+	(
+		cd repo &&
+
+		# Create a handful of objects.
+		#
+		#   - one reachable commit, "base", designated for the reachable
+		#     pack
+		#   - one unreachable commit, "cruft.discard", which is marked
+		#     for deletion
+		#   - one unreachable commit, "cruft.old", which would be marked
+		#     for deletion, but is rescued as an extra cruft tip
+		#   - one unreachable commit, "cruft.new", which is not marked
+		#     for deletion
+		test_commit base &&
+		git branch -M main &&
+
+		git checkout --orphan discard &&
+		git rm -fr . &&
+		test_commit --no-tag cruft.discard &&
+
+		git checkout --orphan old &&
+		git rm -fr . &&
+		test_commit --no-tag cruft.old &&
+		cruft_old="$(git rev-parse HEAD)" &&
+
+		git checkout --orphan new &&
+		git rm -fr . &&
+		test_commit --no-tag cruft.new &&
+		cruft_new="$(git rev-parse HEAD)" &&
+
+		git checkout main &&
+		git branch -D old new &&
+		git reflog expire --all --expire=all &&
+
+		# mark cruft.old with an mtime that is many minutes
+		# older than the expiration period, and mark cruft.new
+		# with an mtime that is in the future (and thus not
+		# eligible for pruning).
+		test-tool chmtime -2000 "$objdir/$(test_oid_to_path $cruft_old)" &&
+		test-tool chmtime +1000 "$objdir/$(test_oid_to_path $cruft_new)" &&
+
+		# Write the list of cruft objects we expect to
+		# accumulate, which is comprised of everything reachable
+		# from cruft.old and cruft.new, but not cruft.discard.
+		git rev-list --objects --no-object-names \
+			$cruft_old $cruft_new >cruft.raw &&
+		sort cruft.raw >cruft.expect &&
+
+		# Write the script to list extra tips, which are limited
+		# to cruft.old, in this case.
+		write_script extra-tips <<-EOF &&
+		echo $cruft_old
+		EOF
+		git config pack.extraCruftTips ./extra-tips &&
+
+		git repack --cruft --cruft-expiration=now -d &&
+
+		mtimes="$(ls .git/objects/pack/pack-*.mtimes)" &&
+		git show-index <${mtimes%.mtimes}.idx >cruft &&
+		cut -d" " -f2 cruft | sort >cruft.actual &&
+		test_cmp cruft.expect cruft.actual
+	)
+'
+
+test_expect_success 'additional cruft blobs via pack.extraCruftTips' '
+	git init repo &&
+	test_when_finished "rm -fr repo" &&
+	(
+		cd repo &&
+
+		test_commit base &&
+
+		blob=$(echo "unreachable" | git hash-object -w --stdin) &&
+
+		# mark the unreachable blob we wrote above as having
+		# aged out of the retention period
+		test-tool chmtime -2000 "$objdir/$(test_oid_to_path $blob)" &&
+
+		# Write the script to list extra tips, which is just the
+		# extra blob as above.
+		write_script extra-tips <<-EOF &&
+		echo $blob
+		EOF
+		git config pack.extraCruftTips ./extra-tips &&
+
+		git repack --cruft --cruft-expiration=now -d &&
+
+		mtimes="$(ls .git/objects/pack/pack-*.mtimes)" &&
+		git show-index <${mtimes%.mtimes}.idx >cruft &&
+		cut -d" " -f2 cruft >actual &&
+		echo $blob >expect &&
+		test_cmp expect actual
+	)
+'
+
 test_done
-- 
2.40.0.353.g8af478ebe3
