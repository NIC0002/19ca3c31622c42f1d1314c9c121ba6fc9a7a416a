Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D84C77B7E
	for <git@archiver.kernel.org>; Sat, 22 Apr 2023 20:18:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbjDVUSA (ORCPT <rfc822;git@archiver.kernel.org>);
        Sat, 22 Apr 2023 16:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbjDVURr (ORCPT <rfc822;git@vger.kernel.org>);
        Sat, 22 Apr 2023 16:17:47 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED6501FE3
        for <git@vger.kernel.org>; Sat, 22 Apr 2023 13:17:40 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f086770a50so19370725e9.2
        for <git@vger.kernel.org>; Sat, 22 Apr 2023 13:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682194659; x=1684786659;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IA6B9hWAldqZfZXVR8JjnS0tErAdEgGFl7Zm1+qIM0g=;
        b=Mg5Z4PQOL0p5Ef8mXTykwakWEIMe1eWTXiVnYwXgTfXDFp2n2uQiIR01TUvcL9lmrb
         6JzIEiaf0g+ixG1e3fZUI1YR6lMa9BLcblOXU+QGbeBZyqH3ZuLlB2ItwixMaqzINVnY
         FUzuUJG/RBRWd9X2VmgAaDMZomnMt/9pEJVQdZBqxjQzqSnwjy1xjvSvG3v0OT6qjQq6
         0/3VYyqBOzQImzwKsDMx31GurhwSoptl/Nkp8cfFylpfbpBTw3wXAJKDdINE3blfW2eY
         1usvZsInIEWSp16clTswdsaLW4LD+u2ygQi/nW1NI/JTLnulDTuZ6OcovE8nNTwFC/+z
         T5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682194659; x=1684786659;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IA6B9hWAldqZfZXVR8JjnS0tErAdEgGFl7Zm1+qIM0g=;
        b=Ohvb0IPxSYXiWVmVkPGtclT5vgjdRsBJd6iHjY/+SQ65te9rqKg68pH6RT76TCyjXb
         0iz41dnYbA4d/PTmffiPFezyWsPbv2eW0buK+7JSbLC+bkiD42rENGCidmRrEmVECJz8
         py7ol4f31a6uMsYCEZXr5MxCYIW0BgdDsc+BD6WBmwj5x+py6pRCnlH4cqmjW9D+RFQW
         aZX/63/FqFIaVXi8pPBUZif8/XiIlL22KpXmz6vUELjMiQ3i8a9CrJSpUz5EMjC2M6rs
         leq3RtitdLraDU0VS5vuAw6Y8W66tFxHsQj21USQpRGeBJHTwPauVUTWl7pAytMxZ4zI
         eHeA==
X-Gm-Message-State: AAQBX9d3zhFzVYXHIozcapyf12qXTiq2A3sF6mfb8KjRhOKqXUSy4vxC
        3ZZlR8Vtz2zTmERhyUObO+X3Eq2dGuE=
X-Google-Smtp-Source: AKy350YEYb7UsugqHPlJhq56eFA0QPbDT5UiThagN8J8ZCEjvVrVnTURiZ0Z2gWy7faH8nmfcSVDdg==
X-Received: by 2002:a7b:c7ce:0:b0:3ef:f26b:a187 with SMTP id z14-20020a7bc7ce000000b003eff26ba187mr4473002wmk.0.1682194659009;
        Sat, 22 Apr 2023 13:17:39 -0700 (PDT)
Received: from [127.0.0.1] ([13.74.141.28])
        by smtp.gmail.com with ESMTPSA id g11-20020a05600c310b00b003f0aefcc457sm11484035wmo.45.2023.04.22.13.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 13:17:38 -0700 (PDT)
Message-Id: <c58314808551082a140499dbddb975ee3d2833c0.1682194651.git.gitgitgadget@gmail.com>
In-Reply-To: <pull.1517.v2.git.1682194649.gitgitgadget@gmail.com>
References: <pull.1517.git.1681614205.gitgitgadget@gmail.com>
        <pull.1517.v2.git.1682194649.gitgitgadget@gmail.com>
From:   "Elijah Newren via GitGitGadget" <gitgitgadget@gmail.com>
Date:   Sat, 22 Apr 2023 20:17:13 +0000
Subject: [PATCH v2 06/22] base85.h: move declarations for base85.c functions
 from cache.h
Fcc:    Sent
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
To:     git@vger.kernel.org
Cc:     Calvin Wan <calvinwan@google.com>,
        Derrick Stolee <derrickstolee@github.com>,
        Elijah Newren <newren@gmail.com>,
        Glen Choo <chooglen@google.com>,
        Elijah Newren <newren@gmail.com>,
        Elijah Newren <newren@gmail.com>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

From: Elijah Newren <newren@gmail.com>

Signed-off-by: Elijah Newren <newren@gmail.com>
---
 apply.c  | 1 +
 base85.c | 3 ++-
 base85.h | 7 +++++++
 cache.h  | 4 ----
 diff.c   | 1 +
 5 files changed, 11 insertions(+), 5 deletions(-)
 create mode 100644 base85.h

diff --git a/apply.c b/apply.c
index efe2dcb0e62..a65a354eef5 100644
--- a/apply.c
+++ b/apply.c
@@ -10,6 +10,7 @@
 #include "cache.h"
 #include "abspath.h"
 #include "alloc.h"
+#include "base85.h"
 #include "config.h"
 #include "object-store.h"
 #include "blob.h"
diff --git a/base85.c b/base85.c
index 5ca601ee14f..bbacdca31b3 100644
--- a/base85.c
+++ b/base85.c
@@ -1,4 +1,5 @@
-#include "cache.h"
+#include "git-compat-util.h"
+#include "base85.h"
 
 #undef DEBUG_85
 
diff --git a/base85.h b/base85.h
new file mode 100644
index 00000000000..c835086e093
--- /dev/null
+++ b/base85.h
@@ -0,0 +1,7 @@
+#ifndef BASE85_H
+#define BASE85_H
+
+int decode_85(char *dst, const char *line, int linelen);
+void encode_85(char *buf, const unsigned char *data, int bytes);
+
+#endif /* BASE85_H */
diff --git a/cache.h b/cache.h
index 2b661764794..b89f4c59802 100644
--- a/cache.h
+++ b/cache.h
@@ -593,10 +593,6 @@ int df_name_compare(const char *name1, size_t len1, int mode1,
 int name_compare(const char *name1, size_t len1, const char *name2, size_t len2);
 int cache_name_stage_compare(const char *name1, int len1, int stage1, const char *name2, int len2, int stage2);
 
-/* base85 */
-int decode_85(char *dst, const char *line, int linelen);
-void encode_85(char *buf, const unsigned char *data, int bytes);
-
 /* pkt-line.c */
 void packet_trace_identity(const char *prog);
 
diff --git a/diff.c b/diff.c
index fa86d023196..e697f78a645 100644
--- a/diff.c
+++ b/diff.c
@@ -4,6 +4,7 @@
 #include "cache.h"
 #include "abspath.h"
 #include "alloc.h"
+#include "base85.h"
 #include "config.h"
 #include "convert.h"
 #include "environment.h"
-- 
gitgitgadget

