Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D3EC43217
	for <git@archiver.kernel.org>; Wed, 23 Feb 2022 17:55:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243597AbiBWRzx (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 23 Feb 2022 12:55:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243584AbiBWRzt (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 23 Feb 2022 12:55:49 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CED47676
        for <git@vger.kernel.org>; Wed, 23 Feb 2022 09:55:20 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id y5so3789706wmi.0
        for <git@vger.kernel.org>; Wed, 23 Feb 2022 09:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:in-reply-to:references:from:date:subject:fcc
         :content-transfer-encoding:mime-version:to:cc;
        bh=nGmhClemBjCXUaD+XiZ/cSIN9riLpu6JFE1FglUlAQg=;
        b=lkWujp2eUs+W/Vcv0miS8EuhaA2E3QFHVj7q6RWALJ+Jl18z7UQ3P2iogMA1PojnF7
         xDpI5t6hioZSsLyOmZRxYamM4TzPA+d1BPvagbgEWIv0mNjm24W51RW+S/i5tcMDgpJ2
         VO7wMB95feuzw0rmNGcCmRX4Pj2dJ+a4nfpDu7hDjf6/i/C6DLCNgLhtpE2MOw6F3vNe
         lo/iFOTrNfVyJuCY216sMDkuScnc6Rj8DDV0sOnPE21LvbFD1kk0hHvDzPgo4bKnHLp8
         +AKCzaPBV/JzZc5uNbkWktdiignEM1yZ5/3t/vYoj/xP+AVSRHzL+PKhRu8V7oG7Hrwx
         XbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:in-reply-to:references:from:date
         :subject:fcc:content-transfer-encoding:mime-version:to:cc;
        bh=nGmhClemBjCXUaD+XiZ/cSIN9riLpu6JFE1FglUlAQg=;
        b=ApHso5fEZ2gys0ckydnVBGsG6/bnakkcFlNHZ7DouON1j1HknVsjAutGlfEmJIzX34
         R8k8NNvpokVxg8sln08R1xetrBb+TcdtwFl8fcJXtyCNbBbzBvKmkJanj5INVkedreGB
         s72BiTAMYmGTA2O5CKAoKoRt2Lu+IbArZGIpEtyj13NCgMCfZMCMpGIVhQQiPJmQZTGu
         mo/JL9qzfAnq54YSgyxfLBu1hLGtqGWCoHqJce/A1/iuGTz3Mqz1Otbfu2A3YBnqY4e0
         UHGYobgrm9TqoXdDyrH/2GO7+7E7MOZ+FS0rSsPL3iVETpcD/ssJHAQqHn3e8MyEKVNr
         HRMQ==
X-Gm-Message-State: AOAM532Xgm1jJVbxSrW7Mmahp7TLCAdVZhWmlbe+38q6VBTcFx84dd07
        P032MS+ucUm+c9MypTGmmpRJtV05CIA=
X-Google-Smtp-Source: ABdhPJz4irxormOzt/w5Ogf0skQPjPPXy26QOGcFQnir3oiP4qPVjJW1URQ+M8GFl63nlPhTWy0a0A==
X-Received: by 2002:a05:600c:2319:b0:380:e369:83ea with SMTP id 25-20020a05600c231900b00380e36983eamr652403wmo.45.1645638918744;
        Wed, 23 Feb 2022 09:55:18 -0800 (PST)
Received: from [127.0.0.1] ([13.74.141.28])
        by smtp.gmail.com with ESMTPSA id g6sm194451wrq.97.2022.02.23.09.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 09:55:18 -0800 (PST)
Message-Id: <355c503157ad02e6106179c2dc7228bdf63a6228.1645638911.git.gitgitgadget@gmail.com>
In-Reply-To: <pull.1159.git.1645638911.gitgitgadget@gmail.com>
References: <pull.1159.git.1645638911.gitgitgadget@gmail.com>
From:   "Derrick Stolee via GitGitGadget" <gitgitgadget@gmail.com>
Date:   Wed, 23 Feb 2022 17:55:06 +0000
Subject: [PATCH 06/11] MyFirstObjectWalk: update recommended usage
Fcc:    Sent
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
To:     git@vger.kernel.org
Cc:     stolee@gmail.com, avarab@gmail.com, gitster@pobox.com,
        zhiyou.jx@alibaba-inc.com, jonathantanmy@google.com,
        Derrick Stolee <derrickstolee@github.com>,
        Derrick Stolee <derrickstolee@github.com>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

From: Derrick Stolee <derrickstolee@github.com>

The previous change consolidated traverse_commit_list() and
traverse_commit_list_filtered(). This allows us to simplify the
recommended usage in MyFirstObjectWalk.txt to use this new set of
values.

While here, add some clarification on the difference between the two
methods.

Signed-off-by: Derrick Stolee <derrickstolee@github.com>
---
 Documentation/MyFirstObjectWalk.txt | 44 +++++++++++------------------
 1 file changed, 16 insertions(+), 28 deletions(-)

diff --git a/Documentation/MyFirstObjectWalk.txt b/Documentation/MyFirstObjectWalk.txt
index ca267941f3e..8ec83185b8a 100644
--- a/Documentation/MyFirstObjectWalk.txt
+++ b/Documentation/MyFirstObjectWalk.txt
@@ -522,24 +522,25 @@ function shows that the all-object walk is being performed by
 `traverse_commit_list()` or `traverse_commit_list_filtered()`. Those two
 functions reside in `list-objects.c`; examining the source shows that, despite
 the name, these functions traverse all kinds of objects. Let's have a look at
-the arguments to `traverse_commit_list_filtered()`, which are a superset of the
-arguments to the unfiltered version.
+the arguments to `traverse_commit_list()`.
 
-- `struct list_objects_filter_options *filter_options`: This is a struct which
-  stores a filter-spec as outlined in `Documentation/rev-list-options.txt`.
-- `struct rev_info *revs`: This is the `rev_info` used for the walk.
+- `struct rev_info *revs`: This is the `rev_info` used for the walk. It
+  includes a `filter` member which contains information for how to filter
+  the object list.
 - `show_commit_fn show_commit`: A callback which will be used to handle each
   individual commit object.
 - `show_object_fn show_object`: A callback which will be used to handle each
   non-commit object (so each blob, tree, or tag).
 - `void *show_data`: A context buffer which is passed in turn to `show_commit`
   and `show_object`.
+
+In addition, `traverse_commit_list_filtered()` has an additional paramter:
+
 - `struct oidset *omitted`: A linked-list of object IDs which the provided
   filter caused to be omitted.
 
-It looks like this `traverse_commit_list_filtered()` uses callbacks we provide
-instead of needing us to call it repeatedly ourselves. Cool! Let's add the
-callbacks first.
+It looks like these methods use callbacks we provide instead of needing us
+to call it repeatedly ourselves. Cool! Let's add the callbacks first.
 
 For the sake of this tutorial, we'll simply keep track of how many of each kind
 of object we find. At file scope in `builtin/walken.c` add the following
@@ -712,20 +713,9 @@ help understand. In our case, that means we omit trees and blobs not directly
 referenced by `HEAD` or `HEAD`'s history, because we begin the walk with only
 `HEAD` in the `pending` list.)
 
-First, we'll need to `#include "list-objects-filter-options.h"` and set up the
-`struct list_objects_filter_options` at the top of the function.
-
-----
-static void walken_object_walk(struct rev_info *rev)
-{
-	struct list_objects_filter_options filter_options = { 0 };
-
-	...
-----
-
 For now, we are not going to track the omitted objects, so we'll replace those
 parameters with `NULL`. For the sake of simplicity, we'll add a simple
-build-time branch to use our filter or not. Replace the line calling
+build-time branch to use our filter or not. Preface the line calling
 `traverse_commit_list()` with the following, which will remind us which kind of
 walk we've just performed:
 
@@ -733,19 +723,17 @@ walk we've just performed:
 	if (0) {
 		/* Unfiltered: */
 		trace_printf(_("Unfiltered object walk.\n"));
-		traverse_commit_list(rev, walken_show_commit,
-				walken_show_object, NULL);
 	} else {
 		trace_printf(
 			_("Filtered object walk with filterspec 'tree:1'.\n"));
-		parse_list_objects_filter(&filter_options, "tree:1");
-
-		traverse_commit_list_filtered(&filter_options, rev,
-			walken_show_commit, walken_show_object, NULL, NULL);
+		CALLOC_ARRAY(rev->filter, 1);
+		parse_list_objects_filter(rev->filter, "tree:1");
 	}
+	traverse_commit_list(rev, walken_show_commit,
+			     walken_show_object, NULL);
 ----
 
-`struct list_objects_filter_options` is usually built directly from a command
+The `rev->filter` member is usually built directly from a command
 line argument, so the module provides an easy way to build one from a string.
 Even though we aren't taking user input right now, we can still build one with
 a hardcoded string using `parse_list_objects_filter()`.
@@ -784,7 +772,7 @@ object:
 ----
 	...
 
-		traverse_commit_list_filtered(&filter_options, rev,
+		traverse_commit_list_filtered(rev,
 			walken_show_commit, walken_show_object, NULL, &omitted);
 
 	...
-- 
gitgitgadget

