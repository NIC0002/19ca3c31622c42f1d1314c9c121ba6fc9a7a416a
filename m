Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7F9EB64DA
	for <git@archiver.kernel.org>; Thu, 22 Jun 2023 19:51:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbjFVTve (ORCPT <rfc822;git@archiver.kernel.org>);
        Thu, 22 Jun 2023 15:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbjFVTvd (ORCPT <rfc822;git@vger.kernel.org>);
        Thu, 22 Jun 2023 15:51:33 -0400
Received: from ring.crustytoothpaste.net (ring.crustytoothpaste.net [IPv6:2600:3c04::f03c:92ff:fe9e:c6d8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6040E1FF0
        for <git@vger.kernel.org>; Thu, 22 Jun 2023 12:51:31 -0700 (PDT)
Received: from tapette.crustytoothpaste.net (unknown [IPv6:2001:470:b056:101:5e4a:89fa:93b9:2058])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (3072 bits) server-digest SHA256)
        (No client certificate requested)
        by ring.crustytoothpaste.net (Postfix) with ESMTPSA id 591515A215;
        Thu, 22 Jun 2023 19:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crustytoothpaste.net;
        s=default; t=1687463490;
        bh=6iVbe2z3zoZlSKhGzL00jVTdg7CotKY1uqmNpmM/404=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Reply-To:
         Subject:Date:To:CC:Resent-Date:Resent-From:Resent-To:Resent-Cc:
         In-Reply-To:References:Content-Type:Content-Disposition;
        b=bnbxiGpaSFuSGyIaeJZt//+Y4Ii9b8vLRcWq8LXM4SeF0iT+YcGtz29caUl+BI53Q
         I/QmWmkdawmVPqp6j8JiY+RU09YQUQ66VdVdOUTJXsY5Jw/Rv0BBMPkIwX377fNodS
         HkVonMRicrTKPXjw2aZkxNi6LhbUSuBvjZvRncRk+xm59HobgtC39Pg1QB3ClPNZyn
         4doS47zLCPja27CsUdPZ+dn+r9Ah7Ye7mjMTGwqfWzP03h0YXPPj+phDyVieXU7aXZ
         h4orS4bsQXVLztV1l1F6rQyRfBY6YtEsd2z+k/ndKily+hozWOWbFo78cDR4JvCSfX
         r7rCO8FaRUtOs1RJ07G/HLqjPE/8gWSKDFNMK+KWME5xWLHCd8lazZOfqfPTYJ3//5
         iSOSxe+MOIu4QGuIDzyOzLkRM7DfHFh0u2Z/mQIg+oFFhQe27zuOSMwPVCDEu7ou72
         hv6lwZsmGf5p5j0EOxq0eAR3X0EjZvJ6m4y20OjWfVJC3bp2Fmn
From:   "brian m. carlson" <sandals@crustytoothpaste.net>
To:     <git@vger.kernel.org>
Cc:     Junio C Hamano <gitster@pobox.com>,
        Elijah Newren <newren@gmail.com>,
        Calvin Wan <calvinwan@google.com>
Subject: [PATCH 1/3] var: add support for listing the shell
Date:   Thu, 22 Jun 2023 19:50:57 +0000
Message-ID: <20230622195059.320593-2-sandals@crustytoothpaste.net>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8
In-Reply-To: <20230622195059.320593-1-sandals@crustytoothpaste.net>
References: <20230622195059.320593-1-sandals@crustytoothpaste.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

From: "brian m. carlson" <bk2204@github.com>

On most Unix systems, finding a suitable shell is easy: one simply uses
"sh" with an appropriate PATH value.  However, in many Windows
environments, the shell is shipped alongside Git, and it may or may not
be in PATH, even if Git is.

In such an environment, it can be very helpful to query Git for the
shell it's using, since other tools may want to use the same shell as
well.  To help them out, let's add a variable, GIT_SHELL_PATH, that
points to the location of the shell.

On Unix, we know our shell must be executable to be functional, so
assume that the distributor has correctly configured their environment,
and use that as a basic test.  On Git for Windows, we know that our
shell will be one of a few fixed values, all of which end in "sh" (such
as "bash").  This seems like it might be a nice test on Unix as well,
since it is customary for all shells to end in "sh", but there probably
exist such systems that don't have such a configuration, so be careful
here not to break them.

Signed-off-by: brian m. carlson <bk2204@github.com>
---
 Documentation/git-var.txt |  3 +++
 builtin/var.c             |  6 ++++++
 t/t0007-git-var.sh        | 12 ++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/Documentation/git-var.txt b/Documentation/git-var.txt
index f40202b8e3..f0f647e14a 100644
--- a/Documentation/git-var.txt
+++ b/Documentation/git-var.txt
@@ -71,6 +71,9 @@ endif::git-default-pager[]
 GIT_DEFAULT_BRANCH::
     The name of the first branch created in newly initialized repositories.
 
+GIT_SHELL_PATH::
+    The path of the binary providing the POSIX shell for commands which use the shell.
+
 SEE ALSO
 --------
 linkgit:git-commit-tree[1]
diff --git a/builtin/var.c b/builtin/var.c
index 2149998980..f97178eed1 100644
--- a/builtin/var.c
+++ b/builtin/var.c
@@ -36,6 +36,11 @@ static const char *default_branch(int flag)
 	return git_default_branch_name(1);
 }
 
+static const char *shell_path(int flag)
+{
+	return SHELL_PATH;
+}
+
 struct git_var {
 	const char *name;
 	const char *(*read)(int);
@@ -47,6 +52,7 @@ static struct git_var git_vars[] = {
 	{ "GIT_SEQUENCE_EDITOR", sequence_editor },
 	{ "GIT_PAGER", pager },
 	{ "GIT_DEFAULT_BRANCH", default_branch },
+	{ "GIT_SHELL_PATH", shell_path },
 	{ "", NULL },
 };
 
diff --git a/t/t0007-git-var.sh b/t/t0007-git-var.sh
index eeb8539c1b..270bd4e512 100755
--- a/t/t0007-git-var.sh
+++ b/t/t0007-git-var.sh
@@ -147,6 +147,18 @@ test_expect_success 'get GIT_SEQUENCE_EDITOR with configuration and environment
 	)
 '
 
+test_expect_success POSIXPERM 'GIT_SHELL_PATH points to a valid executable' '
+	git var GIT_SHELL_PATH >shell &&
+	test -x "$(cat shell)"
+'
+
+# We know in this environment that our shell will be one of a few fixed values
+# that all end in "sh".
+test_expect_success MINGW 'GIT_SHELL_PATH points to a suitable shell' '
+	git var GIT_SHELL_PATH >shell &&
+	grep "sh\$" shell
+'
+
 # For git var -l, we check only a representative variable;
 # testing the whole output would make our test too brittle with
 # respect to unrelated changes in the test suite's environment.
