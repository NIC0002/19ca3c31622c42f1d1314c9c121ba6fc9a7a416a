Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E79EC433FE
	for <git@archiver.kernel.org>; Wed, 16 Nov 2022 19:52:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234226AbiKPTwC (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 16 Nov 2022 14:52:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234094AbiKPTvu (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 16 Nov 2022 14:51:50 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F260F43AF8
        for <git@vger.kernel.org>; Wed, 16 Nov 2022 11:51:48 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id w14so31697842wru.8
        for <git@vger.kernel.org>; Wed, 16 Nov 2022 11:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:fcc:content-transfer-encoding:mime-version:subject:date:from
         :references:in-reply-to:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUdRbpUXZ/e0h09r4Q7akeFJHmNHo+hT1vq/WO9qf70=;
        b=LmgsYgKfaEk/VUV/FcXHJTska3SybDmUwVUE5Qg/dU2r0+COxtZjaWzQ9t7S39bp8M
         D6NYkoNzag7B2XLw1Xg4WFiVePVsgaMRpS5AyTNdc2pbwzw6R1qn4C4DbECjANw7Q38X
         6ZiAKhnPY8Zo0A88RQB6UXQqC01fyhFv6PjrSN0o7vVfA7w8wdaQTfK4/fS8YuroS/1M
         RmlTdf9sFuP8SHfZtvQKabeNiS245699rMB2cHmpyCCKiAtwnH7zU9HBNkRXy51Pdgwe
         jcTeGHnlf6MvIL6r43LHI+SaaTRWPx9Z03sJT88ZsmFRKQxcNC3W7gd/jCH1Ki8giF9G
         1Dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:fcc:content-transfer-encoding:mime-version:subject:date:from
         :references:in-reply-to:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUdRbpUXZ/e0h09r4Q7akeFJHmNHo+hT1vq/WO9qf70=;
        b=XoSvR0sd98zLASl0QrIKVBgefCthNxPk+SIYwdncfDLTHuMuxnsDz7/blMSHuXhk1V
         m+SuUj2tkTB9EqIbLbqhZPDbPAamLOjjklwfMd1oQm6DWB+xJslDRtcgPnnX7JwTBhFj
         j6aFYZrEMB3vAcHbvp8rFQ4glQlflKn3Wx23VvZ01bv2nncP+JGH+LcRU1i1xiu8eRYO
         Wsez8NbcK2DK+jlPs3PfaI1Lc/LeRexoY38fT8uUfMJufEMkHWKh28R2AIWJYaALR6CG
         JS/XbZrptYLLWaF3oEpzzwX1mrXOnpUqG1k7NqOnZUy5/dFcHm/Oa35yt3PRwVsV1Scu
         MeDg==
X-Gm-Message-State: ANoB5pkf8ScwxHKnaNl0o0ywK5A+uIM+fiBmv4pzdQM4Uo7UXbW+JFlX
        0v0KFts3DeEJ+AQCAEpG1RqJ7ikQctI=
X-Google-Smtp-Source: AA0mqf43NYOCm86ZpjFjOa/pR2huvMosCenC3TRYTSPExg55MLlVZpM+c5zrmaTD8u73MWuVMJ3ywQ==
X-Received: by 2002:adf:e2d1:0:b0:236:8638:121a with SMTP id d17-20020adfe2d1000000b002368638121amr13918513wrj.188.1668628307225;
        Wed, 16 Nov 2022 11:51:47 -0800 (PST)
Received: from [127.0.0.1] ([13.74.141.28])
        by smtp.gmail.com with ESMTPSA id o4-20020a1c7504000000b003c64c186206sm2879087wmc.16.2022.11.16.11.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 11:51:46 -0800 (PST)
Message-Id: <c3269a24b5780023cbb4d173cb9cfb10c5a4b0d8.1668628303.git.gitgitgadget@gmail.com>
In-Reply-To: <pull.1400.v2.git.1668628302.gitgitgadget@gmail.com>
References: <pull.1400.git.1667264854.gitgitgadget@gmail.com>
        <pull.1400.v2.git.1668628302.gitgitgadget@gmail.com>
From:   "=?UTF-8?q?=C3=86var=20Arnfj=C3=B6r=C3=B0=20Bjarmason?= via GitGitGadget" 
        <gitgitgadget@gmail.com>
Date:   Wed, 16 Nov 2022 19:51:36 +0000
Subject: [PATCH v2 3/9] bundle-uri client: add helper for testing server
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Fcc:    Sent
To:     git@vger.kernel.org
Cc:     gitster@pobox.com, me@ttaylorr.com, newren@gmail.com,
        avarab@gmail.com, mjcheetham@outlook.com, steadmon@google.com,
        chooglen@google.com, jonathantanmy@google.com,
        dyroneteng@gmail.com, Derrick Stolee <derrickstolee@github.com>,
        =?UTF-8?q?=C3=86var=20Arnfj=C3=B6r=C3=B0=20Bjarmason?= 
        <avarab@gmail.com>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

From: =?UTF-8?q?=C3=86var=20Arnfj=C3=B6r=C3=B0=20Bjarmason?=
 <avarab@gmail.com>

Add a 'test-tool bundle-uri ls-remote' command. This is a thin wrapper
for issuing protocol v2 "bundle-uri" commands to a server, and to the
parsing routines in bundle-uri.c.

Since in the "git clone" case we'll have already done the handshake(),
but not here, introduce a "got_advertisement" state along with
"got_remote_heads". It seems to me that the "got_remote_heads" is
badly named in the first place, and the whole logic of eagerly getting
ls-refs on handshake() or not could be refactored somewhat, but let's
not do that now, and instead just add another self-documenting state
variable.

Signed-off-by: Ævar Arnfjörð Bjarmason <avarab@gmail.com>
Signed-off-by: Derrick Stolee <derrickstolee@github.com>
---
 builtin/clone.c                       |  2 +-
 t/helper/test-bundle-uri.c            | 46 +++++++++++++++++++
 t/lib-t5730-protocol-v2-bundle-uri.sh | 63 ++++++++++++++++++++++-----
 transport.c                           | 43 ++++++++++++++----
 transport.h                           |  6 ++-
 5 files changed, 139 insertions(+), 21 deletions(-)

diff --git a/builtin/clone.c b/builtin/clone.c
index edf98295af2..22b1e506452 100644
--- a/builtin/clone.c
+++ b/builtin/clone.c
@@ -1271,7 +1271,7 @@ int cmd_clone(int argc, const char **argv, const char *prefix)
 	 * Populate transport->got_remote_bundle_uri and
 	 * transport->bundle_uri. We might get nothing.
 	 */
-	transport_get_remote_bundle_uri(transport);
+	transport_get_remote_bundle_uri(transport, 1);
 
 	if (mapped_refs) {
 		int hash_algo = hash_algo_by_ptr(transport_get_hash_algo(transport));
diff --git a/t/helper/test-bundle-uri.c b/t/helper/test-bundle-uri.c
index 25afd393428..ffb975b7b4f 100644
--- a/t/helper/test-bundle-uri.c
+++ b/t/helper/test-bundle-uri.c
@@ -3,6 +3,10 @@
 #include "bundle-uri.h"
 #include "strbuf.h"
 #include "string-list.h"
+#include "transport.h"
+#include "ref-filter.h"
+#include "remote.h"
+#include "refs.h"
 
 enum input_mode {
 	KEY_VALUE_PAIRS,
@@ -68,6 +72,46 @@ usage:
 	usage_with_options(usage, options);
 }
 
+static int cmd_ls_remote(int argc, const char **argv)
+{
+	const char *uploadpack = NULL;
+	struct string_list server_options = STRING_LIST_INIT_DUP;
+	const char *dest;
+	struct remote *remote;
+	struct transport *transport;
+	int status = 0;
+
+	dest = argc > 1 ? argv[1] : NULL;
+
+	remote = remote_get(dest);
+	if (!remote) {
+		if (dest)
+			die(_("bad repository '%s'"), dest);
+		die(_("no remote configured to get bundle URIs from"));
+	}
+	if (!remote->url_nr)
+		die(_("remote '%s' has no configured URL"), dest);
+
+	transport = transport_get(remote, NULL);
+	if (uploadpack)
+		transport_set_option(transport, TRANS_OPT_UPLOADPACK, uploadpack);
+	if (server_options.nr)
+		transport->server_options = &server_options;
+
+	if (transport_get_remote_bundle_uri(transport, 0) < 0) {
+		error(_("could not get the bundle-uri list"));
+		status = 1;
+		goto cleanup;
+	}
+
+	print_bundle_list(stdout, transport->bundles);
+
+cleanup:
+	if (transport_disconnect(transport))
+		return 1;
+	return status;
+}
+
 int cmd__bundle_uri(int argc, const char **argv)
 {
 	const char *usage[] = {
@@ -88,6 +132,8 @@ int cmd__bundle_uri(int argc, const char **argv)
 		return cmd__bundle_uri_parse(argc - 1, argv + 1, KEY_VALUE_PAIRS);
 	if (!strcmp(argv[1], "parse-config"))
 		return cmd__bundle_uri_parse(argc - 1, argv + 1, CONFIG_FILE);
+	if (!strcmp(argv[1], "ls-remote"))
+		return cmd_ls_remote(argc - 1, argv + 1);
 	error("there is no test-tool bundle-uri tool '%s'", argv[1]);
 
 usage:
diff --git a/t/lib-t5730-protocol-v2-bundle-uri.sh b/t/lib-t5730-protocol-v2-bundle-uri.sh
index 27294e9c976..c327544641b 100644
--- a/t/lib-t5730-protocol-v2-bundle-uri.sh
+++ b/t/lib-t5730-protocol-v2-bundle-uri.sh
@@ -34,7 +34,9 @@ esac
 test_expect_success "setup protocol v2 $T5730_PROTOCOL:// tests" '
 	git init "$T5730_PARENT" &&
 	test_commit -C "$T5730_PARENT" one &&
-	git -C "$T5730_PARENT" config uploadpack.advertiseBundleURIs true
+	git -C "$T5730_PARENT" config uploadpack.advertiseBundleURIs true &&
+	git -C "$T5730_PARENT" config bundle.version 1 &&
+	git -C "$T5730_PARENT" config bundle.mode all
 '
 
 # Poor man's URI escaping. Good enough for the test suite whose trash
@@ -61,9 +63,8 @@ test_expect_success "connect with $T5730_PROTOCOL:// using protocol v2: no bundl
 	git -C "$T5730_PARENT" config uploadpack.advertiseBundleURIs false &&
 
 	GIT_TRACE_PACKET="$PWD/log" \
-	git \
-		-c protocol.version=2 \
-		ls-remote --symref "$T5730_URI" \
+	test-tool bundle-uri \
+		ls-remote "$T5730_URI" \
 		>actual 2>err &&
 
 	# Server responded using protocol v2
@@ -76,12 +77,11 @@ test_expect_success "connect with $T5730_PROTOCOL:// using protocol v2: have bun
 	test_when_finished "rm -f log" &&
 
 	test_config -C "$T5730_PARENT" \
-		uploadpack.bundleURI "$T5730_BUNDLE_URI_ESCAPED" &&
+		bundle.only.uri "$T5730_BUNDLE_URI_ESCAPED" &&
 
 	GIT_TRACE_PACKET="$PWD/log" \
-	git \
-		-c protocol.version=2 \
-		ls-remote --symref "$T5730_URI" \
+	test-tool bundle-uri \
+		ls-remote "$T5730_URI" \
 		>actual 2>err &&
 
 	# Server responded using protocol v2
@@ -94,8 +94,8 @@ test_expect_success "connect with $T5730_PROTOCOL:// using protocol v2: have bun
 test_expect_success !T5730_HTTP "bad client with $T5730_PROTOCOL:// using protocol v2" '
 	test_when_finished "rm -f log" &&
 
-	test_config -C "$T5730_PARENT" uploadpack.bundleURI \
-		"$T5730_BUNDLE_URI_ESCAPED" &&
+	test_config -C "$T5730_PARENT" \
+		bundle.only.uri "$T5730_BUNDLE_URI_ESCAPED" &&
 
 	cat >err.expect <<-\EOF &&
 	Cloning into '"'"'child'"'"'...
@@ -146,3 +146,46 @@ test_expect_success !T5730_HTTP "bad client with $T5730_PROTOCOL:// using protoc
 	grep "clone> test-bad-client$" log >sent-bad-request &&
 	test_file_not_empty sent-bad-request
 '
+
+test_expect_success "ls-remote with $T5730_PROTOCOL:// using protocol v2" '
+	test_when_finished "rm -f log" &&
+
+	test_config -C "$T5730_PARENT" \
+		bundle.only.uri "$T5730_BUNDLE_URI_ESCAPED" &&
+
+	# All data about bundle URIs
+	cat >expect <<-EOF &&
+	[bundle]
+		version = 1
+		mode = all
+	EOF
+	GIT_TRACE_PACKET="$PWD/log" \
+	test-tool bundle-uri \
+		ls-remote \
+		"$T5730_URI" \
+		>actual &&
+	test_cmp_config_output expect actual
+'
+
+test_expect_success "ls-remote with $T5730_PROTOCOL:// using protocol v2 and extra data" '
+	test_when_finished "rm -f log" &&
+
+	test_config -C "$T5730_PARENT" \
+		bundle.only.uri "$T5730_BUNDLE_URI_ESCAPED" &&
+
+	# Extra data should be ignored
+	test_config -C "$T5730_PARENT" bundle.only.extra bogus &&
+
+	# All data about bundle URIs
+	cat >expect <<-EOF &&
+	[bundle]
+		version = 1
+		mode = all
+	EOF
+	GIT_TRACE_PACKET="$PWD/log" \
+	test-tool bundle-uri \
+		ls-remote \
+		"$T5730_URI" \
+		>actual &&
+	test_cmp_config_output expect actual
+'
diff --git a/transport.c b/transport.c
index a020adc1f56..86460f5be28 100644
--- a/transport.c
+++ b/transport.c
@@ -198,6 +198,7 @@ struct git_transport_data {
 	struct git_transport_options options;
 	struct child_process *conn;
 	int fd[2];
+	unsigned got_advertisement : 1;
 	unsigned got_remote_heads : 1;
 	enum protocol_version version;
 	struct oid_array extra_have;
@@ -346,6 +347,7 @@ static struct ref *handshake(struct transport *transport, int for_push,
 		BUG("unknown protocol version");
 	}
 	data->got_remote_heads = 1;
+	data->got_advertisement = 1;
 	transport->hash_algo = reader.hash_algo;
 
 	if (reader.line_peeked)
@@ -371,6 +373,33 @@ static int get_bundle_uri(struct transport *transport)
 		init_bundle_list(transport->bundles);
 	}
 
+	if (!data->got_advertisement) {
+		struct ref *refs;
+		struct git_transport_data *data = transport->data;
+		enum protocol_version version;
+
+		refs = handshake(transport, 0, NULL, 0);
+		version = data->version;
+
+		switch (version) {
+		case protocol_v2:
+			assert(!refs);
+			break;
+		case protocol_v0:
+		case protocol_v1:
+		case protocol_unknown_version:
+			assert(refs);
+			break;
+		}
+	}
+
+	/*
+	 * "Support" protocol v0 and v2 without bundle-uri support by
+	 * silently degrading to a NOOP.
+	 */
+	if (!server_supports_v2("bundle-uri", 0))
+		return 0;
+
 	packet_reader_init(&reader, data->fd[0], NULL, 0,
 			   PACKET_READ_CHOMP_NEWLINE |
 			   PACKET_READ_GENTLE_ON_EOF);
@@ -1507,7 +1536,7 @@ int transport_fetch_refs(struct transport *transport, struct ref *refs)
 	return rc;
 }
 
-int transport_get_remote_bundle_uri(struct transport *transport)
+int transport_get_remote_bundle_uri(struct transport *transport, int quiet)
 {
 	const struct transport_vtable *vtable = transport->vtable;
 
@@ -1515,20 +1544,16 @@ int transport_get_remote_bundle_uri(struct transport *transport)
 	if (transport->got_remote_bundle_uri++)
 		return 0;
 
-	/*
-	 * "Support" protocol v0 and v2 without bundle-uri support by
-	 * silently degrading to a NOOP.
-	 */
-	if (!server_supports_v2("bundle-uri", 0))
-		return 0;
-
 	/*
 	 * This is intentionally below the transport.injectBundleURI,
 	 * we want to be able to inject into protocol v0, or into the
 	 * dialog of a server who doesn't support this.
 	 */
-	if (!vtable->get_bundle_uri)
+	if (!vtable->get_bundle_uri) {
+		if (quiet)
+			return -1;
 		return error(_("bundle-uri operation not supported by protocol"));
+	}
 
 	if (vtable->get_bundle_uri(transport) < 0)
 		return error(_("could not retrieve server-advertised bundle-uri list"));
diff --git a/transport.h b/transport.h
index 85150f504fb..dd0115b83bf 100644
--- a/transport.h
+++ b/transport.h
@@ -297,8 +297,12 @@ const struct ref *transport_get_remote_refs(struct transport *transport,
 /**
  * Retrieve bundle URI(s) from a remote. Populates "struct
  * transport"'s "bundle_uri" and "got_remote_bundle_uri".
+ *
+ * With `quiet=1` it will not complain if the serve doesn't support
+ * the protocol, but only if we discover the server uses it, and
+ * encounter issues then.
  */
-int transport_get_remote_bundle_uri(struct transport *transport);
+int transport_get_remote_bundle_uri(struct transport *transport, int quiet);
 
 /*
  * Fetch the hash algorithm used by a remote.
-- 
gitgitgadget

