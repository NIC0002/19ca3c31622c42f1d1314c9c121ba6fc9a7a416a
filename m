Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CEFC433EF
	for <git@archiver.kernel.org>; Fri, 20 May 2022 23:17:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354028AbiETXRy (ORCPT <rfc822;git@archiver.kernel.org>);
        Fri, 20 May 2022 19:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354029AbiETXRm (ORCPT <rfc822;git@vger.kernel.org>);
        Fri, 20 May 2022 19:17:42 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3131957A3
        for <git@vger.kernel.org>; Fri, 20 May 2022 16:17:34 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id hh4so8859421qtb.10
        for <git@vger.kernel.org>; Fri, 20 May 2022 16:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ttaylorr-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J9A7QUwSMtUTE9V9ep9knuOFm86Sksaj+/ci+zTakCc=;
        b=ELj77lHKB+eEgmx5zcJ5UahCNJWNcWgulpiVmFlA/hOLicfeX9Olg/zdI5jkegbdaj
         nHgqhSWw3tdkIKq0fvOxtj62WF9qa5c1LXWUaFJytvrnLd1eDY6laZfOiPgVczZGYIJx
         mBe27WaiAbcn6EGYfzXYFUb2ntKZ4D1sYj0dlZdxGVNhFoQe4twAVBcd3RmylJvJZtjg
         KzqvLY/WE2X4d0pYpHqJtm2GBZ82xGkCnQqXX+fLmTVTZKiuP5HbtOo+Bv/HfUsJb7gr
         +9k95etOOK8NZam9bDaVl9JscUF1Pvdqmr9mzTeqhJ2eCva0zwI4msFTTe02wQXa6u1r
         N+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J9A7QUwSMtUTE9V9ep9knuOFm86Sksaj+/ci+zTakCc=;
        b=Tg61Sr5OehQcmHfJ03uPKsisemsOtEXru40UA4Sv7OMcp5+f5s9XDgRkqUbgrw6ui4
         NQ2yyM52RdX4MYuylTQtfHZNZq2UNk19kE5n5kiww4JWlozHCZdqSiioZTvVXPwykRKB
         jIJ3Yo7Cjf1DOLNwWgABFT0tp1L4YKfDGim22lvcWrKLp8GkRihfiiG9QB2Njh1Vt6qF
         Aq6CxeoPD04qNUsHyH0VXGKA6fd82e9FkTDfmc+c4pkwqJwB+qX66Q+BWjntLveyCOkF
         t7OiLU+9m6B4IHmpeuHY8/JOMx+ztnVjl2D08iNgD1az5KlB6xbOLeCQ9wWh8qLCVF4h
         lK6Q==
X-Gm-Message-State: AOAM531cdCPbuGyuwi+Cnq4F6yfBRJpxnxmE/qBXf7by/PCmPeM1RJcA
        iPOJGZJ7Fe9kVKDjeo7XGp2LMbHQw57QY5fI
X-Google-Smtp-Source: ABdhPJzd+7Kz+CYzjW9B1wY+YC70u3l3HLo1QWFY+wY5RoFrN/XUJ+H/XDkz62CR2mn5lPOzQsuOqw==
X-Received: by 2002:a05:622a:651:b0:2f3:b1b2:4702 with SMTP id a17-20020a05622a065100b002f3b1b24702mr9487320qtb.239.1653088653691;
        Fri, 20 May 2022 16:17:33 -0700 (PDT)
Received: from localhost (104-178-186-189.lightspeed.milwwi.sbcglobal.net. [104.178.186.189])
        by smtp.gmail.com with ESMTPSA id u20-20020a05620a121400b0069fc13ce223sm430584qkj.84.2022.05.20.16.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 16:17:33 -0700 (PDT)
Date:   Fri, 20 May 2022 19:17:32 -0400
From:   Taylor Blau <me@ttaylorr.com>
To:     git@vger.kernel.org
Cc:     avarab@gmail.com, derrickstolee@github.com, gitster@pobox.com,
        jrnieder@gmail.com, larsxschneider@gmail.com, tytso@mit.edu
Subject: [PATCH v5 01/17] Documentation/technical: add cruft-packs.txt
Message-ID: <f494ef7377bf8fb14d96e860106033d1bd1c9ec1.1653088640.git.me@ttaylorr.com>
References: <cover.1638224692.git.me@ttaylorr.com>
 <cover.1653088640.git.me@ttaylorr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1653088640.git.me@ttaylorr.com>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Create a technical document to explain cruft packs. It contains a brief
overview of the problem, some background, details on the implementation,
and a couple of alternative approaches not considered here.

Signed-off-by: Taylor Blau <me@ttaylorr.com>
---
 Documentation/Makefile                  |   1 +
 Documentation/technical/cruft-packs.txt | 123 ++++++++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 Documentation/technical/cruft-packs.txt

diff --git a/Documentation/Makefile b/Documentation/Makefile
index adb2f1b50a..2faffb52ab 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -94,6 +94,7 @@ TECH_DOCS += MyFirstContribution
 TECH_DOCS += MyFirstObjectWalk
 TECH_DOCS += SubmittingPatches
 TECH_DOCS += technical/bundle-format
+TECH_DOCS += technical/cruft-packs
 TECH_DOCS += technical/hash-function-transition
 TECH_DOCS += technical/http-protocol
 TECH_DOCS += technical/index-format
diff --git a/Documentation/technical/cruft-packs.txt b/Documentation/technical/cruft-packs.txt
new file mode 100644
index 0000000000..c0f583cd48
--- /dev/null
+++ b/Documentation/technical/cruft-packs.txt
@@ -0,0 +1,123 @@
+= Cruft packs
+
+The cruft packs feature offer an alternative to Git's traditional mechanism of
+removing unreachable objects. This document provides an overview of Git's
+pruning mechanism, and how a cruft pack can be used instead to accomplish the
+same.
+
+== Background
+
+To remove unreachable objects from your repository, Git offers `git repack -Ad`
+(see linkgit:git-repack[1]). Quoting from the documentation:
+
+[quote]
+[...] unreachable objects in a previous pack become loose, unpacked objects,
+instead of being left in the old pack. [...] loose unreachable objects will be
+pruned according to normal expiry rules with the next 'git gc' invocation.
+
+Unreachable objects aren't removed immediately, since doing so could race with
+an incoming push which may reference an object which is about to be deleted.
+Instead, those unreachable objects are stored as loose object and stay that way
+until they are older than the expiration window, at which point they are removed
+by linkgit:git-prune[1].
+
+Git must store these unreachable objects loose in order to keep track of their
+per-object mtimes. If these unreachable objects were written into one big pack,
+then either freshening that pack (because an object contained within it was
+re-written) or creating a new pack of unreachable objects would cause the pack's
+mtime to get updated, and the objects within it would never leave the expiration
+window. Instead, objects are stored loose in order to keep track of the
+individual object mtimes and avoid a situation where all cruft objects are
+freshened at once.
+
+This can lead to undesirable situations when a repository contains many
+unreachable objects which have not yet left the grace period. Having large
+directories in the shards of `.git/objects` can lead to decreased performance in
+the repository. But given enough unreachable objects, this can lead to inode
+starvation and degrade the performance of the whole system. Since we
+can never pack those objects, these repositories often take up a large amount of
+disk space, since we can only zlib compress them, but not store them in delta
+chains.
+
+== Cruft packs
+
+A cruft pack eliminates the need for storing unreachable objects in a loose
+state by including the per-object mtimes in a separate file alongside a single
+pack containing all loose objects.
+
+A cruft pack is written by `git repack --cruft` when generating a new pack.
+linkgit:git-pack-objects[1]'s `--cruft` option. Note that `git repack --cruft`
+is a classic all-into-one repack, meaning that everything in the resulting pack is
+reachable, and everything else is unreachable. Once written, the `--cruft`
+option instructs `git repack` to generate another pack containing only objects
+not packed in the previous step (which equates to packing all unreachable
+objects together). This progresses as follows:
+
+  1. Enumerate every object, marking any object which is (a) not contained in a
+     kept-pack, and (b) whose mtime is within the grace period as a traversal
+     tip.
+
+  2. Perform a reachability traversal based on the tips gathered in the previous
+     step, adding every object along the way to the pack.
+
+  3. Write the pack out, along with a `.mtimes` file that records the per-object
+     timestamps.
+
+This mode is invoked internally by linkgit:git-repack[1] when instructed to
+write a cruft pack. Crucially, the set of in-core kept packs is exactly the set
+of packs which will not be deleted by the repack; in other words, they contain
+all of the repository's reachable objects.
+
+When a repository already has a cruft pack, `git repack --cruft` typically only
+adds objects to it. An exception to this is when `git repack` is given the
+`--cruft-expiration` option, which allows the generated cruft pack to omit
+expired objects instead of waiting for linkgit:git-gc[1] to expire those objects
+later on.
+
+It is linkgit:git-gc[1] that is typically responsible for removing expired
+unreachable objects.
+
+== Caution for mixed-version environments
+
+Repositories that have cruft packs in them will continue to work with any older
+version of Git. Note, however, that previous versions of Git which do not
+understand the `.mtimes` file will use the cruft pack's mtime as the mtime for
+all of the objects in it. In other words, do not expect older (pre-cruft pack)
+versions of Git to interpret or even read the contents of the `.mtimes` file.
+
+Note that having mixed versions of Git GC-ing the same repository can lead to
+unreachable objects never being completely pruned. This can happen under the
+following circumstances:
+
+  - An older version of Git running GC explodes the contents of an existing
+    cruft pack loose, using the cruft pack's mtime.
+  - A newer version running GC collects those loose objects into a cruft pack,
+    where the .mtime file reflects the loose object's actual mtimes, but the
+    cruft pack mtime is "now".
+
+Repeating this process will lead to unreachable objects not getting pruned as a
+result of repeatedly resetting the objects' mtimes to the present time.
+
+If you are GC-ing repositories in a mixed version environment, consider omitting
+the `--cruft` option when using linkgit:git-repack[1] and linkgit:git-gc[1], and
+leaving the `gc.cruftPacks` configuration unset until all writers understand
+cruft packs.
+
+== Alternatives
+
+Notable alternatives to this design include:
+
+  - The location of the per-object mtime data, and
+  - Storing unreachable objects in multiple cruft packs.
+
+On the location of mtime data, a new auxiliary file tied to the pack was chosen
+to avoid complicating the `.idx` format. If the `.idx` format were ever to gain
+support for optional chunks of data, it may make sense to consolidate the
+`.mtimes` format into the `.idx` itself.
+
+Storing unreachable objects among multiple cruft packs (e.g., creating a new
+cruft pack during each repacking operation including only unreachable objects
+which aren't already stored in an earlier cruft pack) is significantly more
+complicated to construct, and so aren't pursued here. The obvious drawback to
+the current implementation is that the entire cruft pack must be re-written from
+scratch.
-- 
2.36.1.94.gb0d54bedca

