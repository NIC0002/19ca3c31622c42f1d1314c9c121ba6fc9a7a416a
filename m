Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF32C00140
	for <git@archiver.kernel.org>; Mon, 15 Aug 2022 14:56:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241799AbiHOO4n (ORCPT <rfc822;git@archiver.kernel.org>);
        Mon, 15 Aug 2022 10:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232817AbiHOO4c (ORCPT <rfc822;git@vger.kernel.org>);
        Mon, 15 Aug 2022 10:56:32 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 265961C118
        for <git@vger.kernel.org>; Mon, 15 Aug 2022 07:56:30 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id z16so9334763wrh.12
        for <git@vger.kernel.org>; Mon, 15 Aug 2022 07:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:from:to:cc;
        bh=hDVjLRnWpVO3TkEFDNWKI126UQJ12yha3nc75qAxsNo=;
        b=pXSyHU9y2dwx9X0Tk5KYRn8kxPr6IDrqQHZwlI1UceE5xEqEU0yjmiIh2XedXPcHDh
         rAfCgEnIYTceNqSsU9qKz6kddnpvwluyqlULdfMfWJlLhbgoL7t5VnrsuSJE5XgrVpgP
         nBKiFX7cLWVcmT2g5mz7DoZRYdAtPXmjVS0PlbL5Uo/aEGZ6s2pnJL51mfaIRodAXSJ1
         5eGUaRvafGI5goz3sSAXQj+8/Xiwz9MB6O32/2KKkm3n0WSFrHs4DC7b2cGXk8xn4P03
         svbFTQhVPLnkpnF2LpOguSk/fXfXKHd7R4iTH7Tpb0VFGhJTvsSvKksOcJyhcraX47ur
         o9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:mime-version:content-transfer-encoding:fcc:subject:date:from
         :references:in-reply-to:message-id:x-gm-message-state:from:to:cc;
        bh=hDVjLRnWpVO3TkEFDNWKI126UQJ12yha3nc75qAxsNo=;
        b=jgp9Kxj+5VeyMxfiKHyps6BLRSY6z3goIUIqcVbO/WuWIpBesi13mEwnW3a4EJVSyA
         0vzZHYjX9UnArOEJ2vAAJgME1YuA5fKHztDzAov68scYuPtGI3jd6kFuyjVvOD2pKjmC
         NZu2gUFklvjmVuXBctsrqnv5t9YaHMnbzX0IoralqED1Kk4WRL97H9HO/Wy4SdrylPkV
         c0HFDuHVYrhQkroP7qxP0leu7i9IqzSOwbUIoSKvdLh+fNVt/yv1lUHXVzCa+mgsiHaa
         LEpUbaopd0n97De/5kvt3+KdfDBgfUB5/DnUnjP/BHhkpHdKtuEkmed29ywNxRCVokSQ
         0IIQ==
X-Gm-Message-State: ACgBeo3cOJPNrwxT2wtBifckKgmzoWSiWZHVnv+hquw8zspJeyngNzvM
        eFMb/jyEY301spPT8cb0XoyFxOf2JSE=
X-Google-Smtp-Source: AA6agR4jtJ1A3AIbBjmvjTnqyaSytchTsS9355rWYc/nSTpQ71HqVRC8QS35hRDN2gu1MDf7KNxlkQ==
X-Received: by 2002:a5d:5848:0:b0:222:c8cd:288 with SMTP id i8-20020a5d5848000000b00222c8cd0288mr8980938wrf.34.1660575388280;
        Mon, 15 Aug 2022 07:56:28 -0700 (PDT)
Received: from [127.0.0.1] ([13.74.141.28])
        by smtp.gmail.com with ESMTPSA id c21-20020a05600c0ad500b003a53e6c5425sm9726553wmr.8.2022.08.15.07.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 07:56:27 -0700 (PDT)
Message-Id: <b8a490cb3df4cb8bc271c07a62b4140a67d102cd.1660575385.git.gitgitgadget@gmail.com>
In-Reply-To: <pull.1301.v3.git.git.1660575384.gitgitgadget@gmail.com>
References: <pull.1301.v2.git.git.1660524865.gitgitgadget@gmail.com>
        <pull.1301.v3.git.git.1660575384.gitgitgadget@gmail.com>
From:   "Sun Chao via GitGitGadget" <gitgitgadget@gmail.com>
Date:   Mon, 15 Aug 2022 14:56:23 +0000
Subject: [PATCH v3 2/3] t1419: add test cases for hide-refs hook
Fcc:    Sent
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
To:     git@vger.kernel.org
Cc:     Sun Chao <16657101987@163.com>, Sun Chao <sunchao9@huawei.com>
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

From: Sun Chao <sunchao9@huawei.com>

Add test cases for the new 'hide-refs' hook which is used to
filter the references during reference discovery phase.

Signed-off-by: Sun Chao <sunchao9@huawei.com>
---
 t/t1419-hide-refs-hook.sh                     | 142 +++++++++++++++
 t/t1419/common-functions.sh                   |  80 +++++++++
 t/t1419/once-0000-abnormal-hide-refs-hook.sh  | 161 ++++++++++++++++++
 ...test-0001-ls-remote-with-hide-refs-hook.sh |  77 +++++++++
 ...st-0002-upload-pack-with-hide-refs-hook.sh | 122 +++++++++++++
 ...t-0003-receive-pack-with-hide-refs-hook.sh |  87 ++++++++++
 6 files changed, 669 insertions(+)
 create mode 100755 t/t1419-hide-refs-hook.sh
 create mode 100644 t/t1419/common-functions.sh
 create mode 100644 t/t1419/once-0000-abnormal-hide-refs-hook.sh
 create mode 100644 t/t1419/test-0001-ls-remote-with-hide-refs-hook.sh
 create mode 100644 t/t1419/test-0002-upload-pack-with-hide-refs-hook.sh
 create mode 100644 t/t1419/test-0003-receive-pack-with-hide-refs-hook.sh

diff --git a/t/t1419-hide-refs-hook.sh b/t/t1419-hide-refs-hook.sh
new file mode 100755
index 00000000000..52ce61c0e1f
--- /dev/null
+++ b/t/t1419-hide-refs-hook.sh
@@ -0,0 +1,142 @@
+#!/bin/sh
+#
+# Copyright (c) 2022 Sun Chao
+#
+
+test_description='Test hide-refs hook'
+
+GIT_TEST_DEFAULT_INITIAL_BRANCH_NAME=main
+export GIT_TEST_DEFAULT_INITIAL_BRANCH_NAME
+
+. ./test-lib.sh
+
+. "$TEST_DIRECTORY"/t1419/common-functions.sh
+
+setup_bare_repo_and_work_repo () {
+	# Refs of bare_repo : main(A)
+	# Refs of work_repo: main(A)  tags/v123
+	test_expect_success "setup bare_repo and work_repo" '
+		rm -rf bare_repo.git bare_repo.git.dump &&
+		rm -rf work_repo work_repo.dump &&
+		git init --bare bare_repo.git &&
+		git init work_repo &&
+		create_commits_in work_repo A B C D &&
+		(
+			cd work_repo &&
+			git config --local core.abbrev 7 &&
+			git remote add origin ../bare_repo.git &&
+			git update-ref refs/heads/dev $A &&
+			git update-ref refs/heads/main $B &&
+			git update-ref refs/pull-requests/1/head $C &&
+			git tag -m "v123" v123 $D &&
+			git push origin +refs/heads/*:refs/heads/* &&
+			git push origin +refs/tags/*:refs/tags/* &&
+			git push origin +refs/pull-requests/*:refs/pull-requests/*
+		) &&
+		TAG=$(git -C work_repo rev-parse v123) &&
+
+		# setup pre-receive hook
+		write_script bare_repo.git/hooks/pre-receive <<-\EOF &&
+		exec >&2
+		echo "# pre-receive hook"
+		while read old new ref
+		do
+			echo "pre-receive< $old $new $ref"
+		done
+		EOF
+
+		# setup update hook
+		write_script bare_repo.git/hooks/update <<-\EOF &&
+		exec >&2
+		echo "# update hook"
+		echo "update< $@"
+		EOF
+
+		# setup post-receive hook
+		write_script bare_repo.git/hooks/post-receive <<-\EOF
+		exec >&2
+		echo "# post-receive hook"
+		while read old new ref
+		do
+			echo "post-receive< $old $new $ref"
+		done
+		EOF
+	'
+}
+
+run_hide_refs_hook_tests() {
+	case $1 in
+		http)
+			PROTOCOL="HTTP protocol"
+			BAREREPO_GIT_DIR="$HTTPD_DOCUMENT_ROOT_PATH/bare_repo.git"
+			BAREREPO_PREFIX="$HTTPD_URL"/smart
+			;;
+		local)
+			PROTOCOL="builtin protocol"
+			BAREREPO_GIT_DIR="$(pwd)/bare_repo.git"
+			BAREREPO_PREFIX="$(pwd)"
+			;;
+	esac
+
+	BAREREPO_URL="$BAREREPO_PREFIX/bare_repo.git"
+
+	GIT_TEST_PROTOCOL_VERSION=$2
+
+	# Run test cases for 'hide-refs' hook
+	for t in  "$TEST_DIRECTORY"/t1419/test-*.sh
+	do
+		# Initialize the bare_repo repository and work_repo
+		setup_bare_repo_and_work_repo
+		git -C work_repo remote set-url origin "$BAREREPO_URL"
+		cp -rf work_repo work_repo.dump
+
+		git -C bare_repo.git config --local http.receivepack true
+		git -C bare_repo.git config --add transfer.hiderefs force:HEAD
+		git -C bare_repo.git config --add transfer.hiderefs force:refs
+		cp -rf bare_repo.git bare_repo.git.dump
+
+		if test "$1" = "http"; then
+			setup_askpass_helper
+			rm -rf "$HTTPD_DOCUMENT_ROOT_PATH/bare_repo.git"
+			mv bare_repo.git "$HTTPD_DOCUMENT_ROOT_PATH/bare_repo.git"
+		fi
+
+		. "$t"
+	done
+}
+
+
+setup_bare_repo_and_work_repo
+BAREREPO_GIT_DIR="$(pwd)/bare_repo.git"
+BAREREPO_PREFIX="$(pwd)"
+BAREREPO_URL="$BAREREPO_PREFIX/bare_repo.git"
+
+# Load test cases that only need to be executed once.
+for t in  "$TEST_DIRECTORY"/t1419/once-*.sh
+do
+	git -C "$BAREREPO_GIT_DIR" config --add transfer.hiderefs force:HEAD
+	git -C "$BAREREPO_GIT_DIR" config --add transfer.hiderefs force:refs
+	. "$t"
+done
+
+for protocol in 1 2
+do
+	# Run test cases for 'hide-refs' hook on local file protocol.
+	run_hide_refs_hook_tests local $protocol
+done
+
+ROOT_PATH="$PWD"
+. "$TEST_DIRECTORY"/lib-gpg.sh
+. "$TEST_DIRECTORY"/lib-httpd.sh
+. "$TEST_DIRECTORY"/lib-terminal.sh
+
+start_httpd
+set_askpass user@host pass@host
+
+# Run test cases for 'hide-refs' hook on HTTP protocol.
+for protocol in 1 2
+do
+	run_hide_refs_hook_tests http $protocol
+done
+
+test_done
diff --git a/t/t1419/common-functions.sh b/t/t1419/common-functions.sh
new file mode 100644
index 00000000000..e86c3d11317
--- /dev/null
+++ b/t/t1419/common-functions.sh
@@ -0,0 +1,80 @@
+# Create commits in <repo> and assign each commit's oid to shell variables
+# given in the arguments (A, B, and C). E.g.:
+#
+#     create_commits_in <repo> A B C
+#
+# NOTE: Never calling this function from a subshell since variable
+# assignments will disappear when subshell exits.
+create_commits_in () {
+	repo="$1" && test -d "$repo" ||
+	error "Repository $repo does not exist."
+	shift &&
+	while test $# -gt 0
+	do
+		name=$1 &&
+		shift &&
+		test_commit -C "$repo" --no-tag "$name" &&
+		eval $name=$(git -C "$repo" rev-parse HEAD)
+	done
+}
+
+get_abbrev_oid () {
+	oid=$1 &&
+	suffix=${oid#???????} &&
+	oid=${oid%$suffix} &&
+	if test -n "$oid"
+	then
+		echo "$oid"
+	else
+		echo "undefined-oid"
+	fi
+}
+
+# Format the output of git-push, git-show-ref and other commands to make a
+# user-friendly and stable text.  We can easily prepare the expect text
+# without having to worry about changes of the commit ID (full or abbrev.)
+# of the output.  Single quotes are replaced with double quotes, because
+# it is boring to prepare unquoted single quotes in expect text.  We also
+# remove some locale error messages. The emitted human-readable errors are
+# redundant to the more machine-readable output the tests already assert.
+make_user_friendly_and_stable_output () {
+	tr '\0' '@' | sed \
+		-e "s/'/\"/g" \
+		-e "s/@.*//g" \
+		-e "s/$(get_abbrev_oid $A)[0-9a-f]*/<COMMIT-A>/g" \
+		-e "s/$(get_abbrev_oid $B)[0-9a-f]*/<COMMIT-B>/g" \
+		-e "s/$(get_abbrev_oid $C)[0-9a-f]*/<COMMIT-C>/g" \
+		-e "s/$(get_abbrev_oid $D)[0-9a-f]*/<COMMIT-D>/g" \
+		-e "s/$(get_abbrev_oid $TAG)[0-9a-f]*/<COMMIT-TAG-v123>/g" \
+		-e "s/$ZERO_OID/<ZERO-OID>/g" \
+		-e "s#$TRASH_DIRECTORY/bare_repo.git#<URL/of/bare_repo.git>#" \
+		-e "s#$BAREREPO_PREFIX/bare_repo.git#<URL/of/bare_repo.git>#"
+}
+
+filter_out_hide_refs_output() {
+	make_user_friendly_and_stable_output | sed 's/^[0-9a-f]\{4\}//g'
+}
+
+filter_out_user_friendly_and_stable_output () {
+	make_user_friendly_and_stable_output |
+		sed -n ${1+"$@"}
+}
+
+format_and_save_expect () {
+	sed -e 's/^> //' -e 's/Z$//' >expect
+}
+
+test_cmp_refs () {
+	indir=
+	if test "$1" = "-C"
+	then
+		shift
+		indir="$1"
+		shift
+	fi
+	indir=${indir:+"$indir"/}
+	cat >show-ref.expect &&
+	git ${indir:+ -C "$indir"} show-ref >show-ref.pristine &&
+	make_user_friendly_and_stable_output <show-ref.pristine >show-ref.filtered &&
+	test_cmp show-ref.expect show-ref.filtered
+}
diff --git a/t/t1419/once-0000-abnormal-hide-refs-hook.sh b/t/t1419/once-0000-abnormal-hide-refs-hook.sh
new file mode 100644
index 00000000000..c4ff642264e
--- /dev/null
+++ b/t/t1419/once-0000-abnormal-hide-refs-hook.sh
@@ -0,0 +1,161 @@
+test_expect_success "builtin protocol (protocol: 1): setup hide-refs hook which die when read version" '
+	write_script "$BAREREPO_GIT_DIR/hooks/hide-refs" <<-EOF
+		test-tool hide-refs \
+			--die-read-version \
+			-r refs/heads/main
+	EOF
+'
+
+test_expect_success "builtin protocol (protocol: 1): upload-pack --advertise-refs while hide-refs hook die when read version" '
+	test_must_fail git -c protocol.version=1 upload-pack --advertise-refs "$BAREREPO_URL" >out 2>&1 &&
+	cat out | grep "fatal: " | make_user_friendly_and_stable_output >actual &&
+	format_and_save_expect <<-EOF &&
+		fatal: die with the --die-read-version option
+		fatal: can not read version message from hook hide-refs
+	EOF
+	test_cmp expect actual
+'
+
+test_expect_success "builtin protocol (protocol: 1): setup hide-refs hook which die when write version" '
+	write_script "$BAREREPO_GIT_DIR/hooks/hide-refs" <<-EOF
+		test-tool hide-refs --die-write-version
+	EOF
+'
+
+test_expect_success "builtin protocol (protocol: 1): upload-pack --advertise-refs while hide-refs hook die when write version" '
+	test_must_fail git -c protocol.version=1 upload-pack --advertise-refs "$BAREREPO_URL" >out 2>&1 &&
+	cat out | grep "fatal: " | make_user_friendly_and_stable_output >actual &&
+	format_and_save_expect <<-EOF &&
+		fatal: die with the --die-write-version option
+		fatal: can not read version message from hook hide-refs
+	EOF
+	test_cmp expect actual
+'
+
+test_expect_success "builtin protocol (protocol: 1): setup hide-refs hook which die when read first filter request" '
+	write_script "$BAREREPO_GIT_DIR/hooks/hide-refs" <<-EOF
+		test-tool hide-refs --die-read-first-ref
+	EOF
+'
+
+test_expect_success "builtin protocol (protocol: 1): upload-pack --advertise-refs while hide-refs hook die when read first filter request" '
+	test_must_fail git -c protocol.version=1 upload-pack --advertise-refs "$BAREREPO_URL" >out 2>&1 &&
+	cat out | grep "fatal: " | make_user_friendly_and_stable_output >actual &&
+	format_and_save_expect <<-EOF &&
+		fatal: die with the --die-read-first-ref option
+		fatal: hook hide-refs died abnormally
+	EOF
+	test_cmp expect actual
+'
+
+test_expect_success "builtin protocol (protocol: 1): setup hide-refs hook which die when read second filter request" '
+	write_script "$BAREREPO_GIT_DIR/hooks/hide-refs" <<-EOF
+		test-tool hide-refs --die-read-second-ref
+	EOF
+'
+
+test_expect_success "builtin protocol (protocol: 1): upload-pack --advertise-refs while hide-refs hook die when read second filter request" '
+	test_must_fail git -c protocol.version=1 upload-pack --advertise-refs "$BAREREPO_URL"  >out 2>&1 &&
+	cat out | grep "fatal: " | make_user_friendly_and_stable_output >actual &&
+	format_and_save_expect <<-EOF &&
+		fatal: die with the --die-read-second-ref option
+		fatal: hook hide-refs died abnormally
+	EOF
+	test_cmp expect actual
+'
+
+test_expect_success "builtin protocol (protocol: 1): setup hide-refs hook which die while filtring refs" '
+	write_script "$BAREREPO_GIT_DIR/hooks/hide-refs" <<-EOF
+		test-tool hide-refs --die-after-proc-refs
+	EOF
+'
+
+test_expect_success "builtin protocol (protocol: 1): upload-pack --advertise-refs while hide-refs hook die while filtring refs" '
+	test_must_fail git -c protocol.version=1 upload-pack --advertise-refs "$BAREREPO_URL"  >out 2>&1 &&
+	cat out | grep "fatal: " | make_user_friendly_and_stable_output >actual &&
+	format_and_save_expect <<-EOF &&
+		fatal: die with the --die-after-proc-refs option
+		fatal: hook hide-refs died abnormally
+	EOF
+	test_cmp expect actual
+'
+
+test_expect_success "builtin protocol (protocol: 2): setup hide-refs hook which die when read version" '
+	write_script "$BAREREPO_GIT_DIR/hooks/hide-refs" <<-EOF
+		test-tool hide-refs --die-read-version
+	EOF
+'
+
+test_expect_success "builtin protocol (protocol: 2): upload-pack --advertise-refs while hide-refs hook die when read version" '
+	test_must_fail git -c protocol.version=2 upload-pack --advertise-refs "$BAREREPO_URL" >out 2>&1 &&
+	cat out | grep "fatal: " | make_user_friendly_and_stable_output >actual &&
+	format_and_save_expect <<-EOF &&
+		fatal: die with the --die-read-version option
+		fatal: can not read version message from hook hide-refs
+	EOF
+	test_cmp expect actual
+'
+
+test_expect_success "builtin protocol (protocol: 2): setup hide-refs hook which die when write version" '
+	write_script "$BAREREPO_GIT_DIR/hooks/hide-refs" <<-EOF
+		test-tool hide-refs --die-write-version
+	EOF
+'
+
+test_expect_success "builtin protocol (protocol: 2): upload-pack --advertise-refs while hide-refs hook die when write version" '
+	test_must_fail git -c protocol.version=2 upload-pack --advertise-refs "$BAREREPO_URL" >out 2>&1 &&
+	cat out | grep "fatal: " | make_user_friendly_and_stable_output >actual &&
+	format_and_save_expect <<-EOF &&
+		fatal: die with the --die-write-version option
+		fatal: can not read version message from hook hide-refs
+	EOF
+	test_cmp expect actual
+'
+
+test_expect_success "builtin protocol (protocol: 2): setup hide-refs hook which die when read first filter request" '
+	write_script "$BAREREPO_GIT_DIR/hooks/hide-refs" <<-EOF
+		test-tool hide-refs --die-read-first-ref
+	EOF
+'
+
+test_expect_success "builtin protocol (protocol: 2): upload-pack --advertise-refs while hide-refs hook die when read first filter request" '
+	test_must_fail git -c protocol.version=2 upload-pack --advertise-refs "$BAREREPO_URL" >out 2>&1 &&
+	cat out | grep "fatal: " | make_user_friendly_and_stable_output >actual &&
+	format_and_save_expect <<-EOF &&
+		fatal: die with the --die-read-first-ref option
+		fatal: hook hide-refs died abnormally
+	EOF
+	test_cmp expect actual
+'
+
+test_expect_success "builtin protocol (protocol: 2): setup hide-refs hook which die when read second filter request" '
+	write_script "$BAREREPO_GIT_DIR/hooks/hide-refs" <<-EOF
+		test-tool hide-refs --die-read-second-ref
+	EOF
+'
+
+test_expect_success "builtin protocol (protocol: 2): upload-pack --advertise-refs while hide-refs hook die when read second filter request" '
+	test_must_fail git -c protocol.version=2 upload-pack --advertise-refs "$BAREREPO_URL" >out 2>&1 &&
+	cat out | grep "fatal: " | make_user_friendly_and_stable_output >actual &&
+	format_and_save_expect <<-EOF &&
+		fatal: die with the --die-read-second-ref option
+		fatal: hook hide-refs died abnormally
+	EOF
+	test_cmp expect actual
+'
+
+test_expect_success "builtin protocol (protocol: 2): setup hide-refs hook which die while filtring refs" '
+	write_script "$BAREREPO_GIT_DIR/hooks/hide-refs" <<-EOF
+		test-tool hide-refs --die-after-proc-refs
+	EOF
+'
+
+test_expect_success "builtin protocol (protocol: 2): upload-pack --advertise-refs while hide-refs hook die while filtring refs" '
+	test_must_fail git -c protocol.version=2 upload-pack --advertise-refs "$BAREREPO_URL" >out 2>&1 &&
+	cat out | grep "fatal: " | make_user_friendly_and_stable_output >actual &&
+	format_and_save_expect <<-EOF &&
+		fatal: die with the --die-after-proc-refs option
+		fatal: hook hide-refs died abnormally
+	EOF
+	test_cmp expect actual
+'
diff --git a/t/t1419/test-0001-ls-remote-with-hide-refs-hook.sh b/t/t1419/test-0001-ls-remote-with-hide-refs-hook.sh
new file mode 100644
index 00000000000..1766d869d58
--- /dev/null
+++ b/t/t1419/test-0001-ls-remote-with-hide-refs-hook.sh
@@ -0,0 +1,77 @@
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): setup hide-refs hook which hide no refs" '
+	write_script "$BAREREPO_GIT_DIR/hooks/hide-refs" <<-EOF
+		test-tool hide-refs
+	EOF
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): ls-remote while hide-refs hook hide no refs" '
+	git -c protocol.version=$GIT_TEST_PROTOCOL_VERSION ls-remote "$BAREREPO_URL" >out 2>&1 &&
+	make_user_friendly_and_stable_output <out >actual &&
+	format_and_save_expect <<-EOF &&
+		<COMMIT-B>	HEAD
+		<COMMIT-A>	refs/heads/dev
+		<COMMIT-B>	refs/heads/main
+		<COMMIT-C>	refs/pull-requests/1/head
+		<COMMIT-TAG-v123>	refs/tags/v123
+		<COMMIT-D>	refs/tags/v123^{}
+	EOF
+	test_cmp expect actual
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): setup hide-refs hook which hide all refs" '
+	write_script "$BAREREPO_GIT_DIR/hooks/hide-refs" <<-EOF
+	test-tool hide-refs \
+		-r "HEAD" \
+		-r "refs/heads/dev" \
+		-r "refs/heads/main" \
+		-r "refs/pull-requests/1/head" \
+		-r "refs/tags/v123"
+	EOF
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): ls-remote while hide-refs hook hide all refs" '
+	git -c protocol.version=$GIT_TEST_PROTOCOL_VERSION ls-remote "$BAREREPO_URL" >out 2>&1 &&
+	make_user_friendly_and_stable_output <out >actual &&
+	format_and_save_expect <<-EOF &&
+	EOF
+	test_cmp expect actual
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): setup hide-refs hook which hide branches" '
+	write_script "$BAREREPO_GIT_DIR/hooks/hide-refs" <<-EOF
+	test-tool hide-refs \
+		-r "HEAD" \
+		-r "refs/heads/dev" \
+		-r "refs/heads/main"
+	EOF
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): ls-remote while hide-refs hook hide branches" '
+	git -c protocol.version=$GIT_TEST_PROTOCOL_VERSION ls-remote "$BAREREPO_URL" >out 2>&1 &&
+	make_user_friendly_and_stable_output <out >actual &&
+	format_and_save_expect <<-EOF &&
+		<COMMIT-C>	refs/pull-requests/1/head
+		<COMMIT-TAG-v123>	refs/tags/v123
+		<COMMIT-D>	refs/tags/v123^{}
+	EOF
+	test_cmp expect actual
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): setup hide-refs hook which hide pull refs and tags" '
+	write_script "$BAREREPO_GIT_DIR/hooks/hide-refs" <<-EOF
+	test-tool hide-refs \
+		-r "refs/pull-requests/1/head" \
+		-r "refs/tags/v123"
+	EOF
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): ls-remote while hide-refs hook hide pull refs and tags" '
+	git -c protocol.version=$GIT_TEST_PROTOCOL_VERSION ls-remote "$BAREREPO_URL" >out 2>&1 &&
+	make_user_friendly_and_stable_output <out >actual &&
+	format_and_save_expect <<-EOF &&
+		<COMMIT-B>	HEAD
+		<COMMIT-A>	refs/heads/dev
+		<COMMIT-B>	refs/heads/main
+	EOF
+	test_cmp expect actual
+'
diff --git a/t/t1419/test-0002-upload-pack-with-hide-refs-hook.sh b/t/t1419/test-0002-upload-pack-with-hide-refs-hook.sh
new file mode 100644
index 00000000000..d2fc5f0c4f4
--- /dev/null
+++ b/t/t1419/test-0002-upload-pack-with-hide-refs-hook.sh
@@ -0,0 +1,122 @@
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): setup hide-refs hook which hide no refs" '
+	write_script "$BAREREPO_GIT_DIR/hooks/hide-refs" <<-EOF
+		test-tool hide-refs
+	EOF
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): mirror clone while hide-refs hook hide no refs" '
+	rm -rf local.git &&
+	git -c protocol.version=$GIT_TEST_PROTOCOL_VERSION clone --mirror "$BAREREPO_URL" local.git &&
+	git -C local.git show-ref -d >out 2>&1 &&
+	make_user_friendly_and_stable_output <out >actual &&
+	format_and_save_expect <<-EOF &&
+		<COMMIT-A> refs/heads/dev
+		<COMMIT-B> refs/heads/main
+		<COMMIT-C> refs/pull-requests/1/head
+		<COMMIT-TAG-v123> refs/tags/v123
+		<COMMIT-D> refs/tags/v123^{}
+	EOF
+	test_cmp expect actual
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): setup hide-refs hook which hide all refs" '
+	write_script "$BAREREPO_GIT_DIR/hooks/hide-refs" <<-EOF
+	test-tool hide-refs \
+		-r "HEAD" \
+		-r "refs/heads/dev" \
+		-r "refs/heads/main" \
+		-r "refs/pull-requests/1/head" \
+		-r "refs/tags/v123"
+	EOF
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): mirror clone while hide-refs hide all refs" '
+	rm -rf local.git &&
+	git -c protocol.version=$GIT_TEST_PROTOCOL_VERSION clone --mirror "$BAREREPO_URL" local.git &&
+	test_must_fail git -C local.git show-ref -d >out 2>&1 &&
+	make_user_friendly_and_stable_output <out >actual &&
+	format_and_save_expect <<-EOF &&
+	EOF
+	test_cmp expect actual
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): setup hide-refs hook which hide branches" '
+	write_script "$BAREREPO_GIT_DIR/hooks/hide-refs" <<-EOF
+	test-tool hide-refs \
+		-r "HEAD" \
+		-r "refs/heads/dev" \
+		-r "refs/heads/main"
+	EOF
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): mirror clone branches" '
+	rm -rf local.git &&
+	git -c protocol.version=$GIT_TEST_PROTOCOL_VERSION clone --mirror "$BAREREPO_URL" local.git &&
+	git -C local.git show-ref -d >out 2>&1 &&
+	make_user_friendly_and_stable_output <out >actual &&
+	format_and_save_expect <<-EOF &&
+		<COMMIT-C> refs/pull-requests/1/head
+		<COMMIT-TAG-v123> refs/tags/v123
+		<COMMIT-D> refs/tags/v123^{}
+	EOF
+	test_cmp expect actual
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): setup hide-refs hook which some branches" '
+	write_script "$BAREREPO_GIT_DIR/hooks/hide-refs" <<-EOF
+	test-tool hide-refs \
+		-r "HEAD" \
+		-r "refs/heads/dev"
+	EOF
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): fetch a tip commit which is not hidden" '
+	rm -rf local.git &&
+	git init local.git &&
+	git -C local.git remote add origin "$BAREREPO_URL" &&
+	git -C local.git -c protocol.version=$GIT_TEST_PROTOCOL_VERSION fetch "$BAREREPO_URL" $B
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): config allowAnySHA1InWant to true" '
+	git -C "$BAREREPO_GIT_DIR" config uploadpack.allowTipSHA1InWant true &&
+	git -C "$BAREREPO_GIT_DIR" config uploadpack.allowReachableSHA1InWant true
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): fetch a non-tip commit which is not hidden" '
+	rm -rf local.git &&
+	git init local.git &&
+	git -C local.git remote add origin "$BAREREPO_URL" &&
+	git -C local.git -c protocol.version=$GIT_TEST_PROTOCOL_VERSION fetch "$BAREREPO_URL" $A
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): setup hide-refs hook which hide pull refs and tags" '
+	write_script "$BAREREPO_GIT_DIR/hooks/hide-refs" <<-EOF
+	test-tool hide-refs \
+		-r "refs/pull-requests/1/head" \
+		-r "refs/tags/v123"
+	EOF
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): mirror clone while hide-refs hook hide pull refs and tags" '
+	rm -rf local.git &&
+	git -c protocol.version=$GIT_TEST_PROTOCOL_VERSION clone --mirror "$BAREREPO_URL" local.git &&
+	git -C local.git show-ref -d >out 2>&1 &&
+	make_user_friendly_and_stable_output <out >actual &&
+	format_and_save_expect <<-EOF &&
+		<COMMIT-A> refs/heads/dev
+		<COMMIT-B> refs/heads/main
+	EOF
+	test_cmp expect actual
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): config allowAnySHA1InWant to true" '
+	git -C "$BAREREPO_GIT_DIR" config uploadpack.allowTipSHA1InWant true &&
+	git -C "$BAREREPO_GIT_DIR" config uploadpack.allowReachableSHA1InWant true
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): fetch a non-tip commit which is hidden" '
+	rm -rf local.git &&
+	git init local.git &&
+	git -C local.git remote add origin "$BAREREPO_URL" &&
+	test_must_fail git -C local.git -c protocol.version=$GIT_TEST_PROTOCOL_VERSION fetch "$BAREREPO_URL" $C
+'
diff --git a/t/t1419/test-0003-receive-pack-with-hide-refs-hook.sh b/t/t1419/test-0003-receive-pack-with-hide-refs-hook.sh
new file mode 100644
index 00000000000..198fbf5fa5c
--- /dev/null
+++ b/t/t1419/test-0003-receive-pack-with-hide-refs-hook.sh
@@ -0,0 +1,87 @@
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): setup hide-refs hook which hide no refs" '
+	write_script "$BAREREPO_GIT_DIR/hooks/hide-refs" <<-EOF
+		test-tool hide-refs
+	EOF
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): push to main while hide-refs hook hide no refs" '
+	create_commits_in work_repo E &&
+	git -c protocol.version=$GIT_TEST_PROTOCOL_VERSION -C work_repo push origin HEAD:main >out 2>&1 &&
+	make_user_friendly_and_stable_output <out >out.tmp &&
+	sed "s/$(get_abbrev_oid $E)[0-9a-f]*/<COMMIT-E>/g" <out.tmp >actual &&
+	format_and_save_expect <<-EOF &&
+		remote: # pre-receive hook        Z
+		remote: pre-receive< <COMMIT-B> <COMMIT-E> refs/heads/main        Z
+		remote: # update hook        Z
+		remote: update< refs/heads/main <COMMIT-B> <COMMIT-E>        Z
+		remote: # post-receive hook        Z
+		remote: post-receive< <COMMIT-B> <COMMIT-E> refs/heads/main        Z
+		To <URL/of/bare_repo.git>
+		   <COMMIT-B>..<COMMIT-E>  HEAD -> main
+	EOF
+	test_cmp expect actual
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): create ref while hide-refs hook hide no refs" '
+	git -c protocol.version=$GIT_TEST_PROTOCOL_VERSION -C work_repo push origin HEAD:new >out 2>&1 &&
+	make_user_friendly_and_stable_output <out >out.tmp &&
+	sed "s/$(get_abbrev_oid $E)[0-9a-f]*/<COMMIT-E>/g" <out.tmp >actual &&
+	format_and_save_expect <<-EOF &&
+		remote: # pre-receive hook        Z
+		remote: pre-receive< <ZERO-OID> <COMMIT-E> refs/heads/new        Z
+		remote: # update hook        Z
+		remote: update< refs/heads/new <ZERO-OID> <COMMIT-E>        Z
+		remote: # post-receive hook        Z
+		remote: post-receive< <ZERO-OID> <COMMIT-E> refs/heads/new        Z
+		To <URL/of/bare_repo.git>
+		 * [new branch]      HEAD -> new
+		EOF
+	test_cmp expect actual
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): push to delete ref while hide-refs hook hide no refs" '
+	git -c protocol.version=$GIT_TEST_PROTOCOL_VERSION -C work_repo push origin :dev >out 2>&1 &&
+	make_user_friendly_and_stable_output <out >out.tmp &&
+	sed "s/$(get_abbrev_oid $E)[0-9a-f]*/<COMMIT-E>/g" <out.tmp >actual &&
+	format_and_save_expect <<-EOF &&
+		remote: # pre-receive hook        Z
+		remote: pre-receive< <COMMIT-A> <ZERO-OID> refs/heads/dev        Z
+		remote: # update hook        Z
+		remote: update< refs/heads/dev <COMMIT-A> <ZERO-OID>        Z
+		remote: # post-receive hook        Z
+		remote: post-receive< <COMMIT-A> <ZERO-OID> refs/heads/dev        Z
+		To <URL/of/bare_repo.git>
+		 - [deleted]         dev
+	EOF
+	test_cmp expect actual
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): setup hide-refs hook which hide all refs" '
+	rm -rf work_repo &&
+	cp -rf work_repo.dump work_repo &&
+	rm -rf "$BAREREPO_GIT_DIR" &&
+	cp -rf bare_repo.git.dump "$BAREREPO_GIT_DIR" &&
+	write_script "$BAREREPO_GIT_DIR/hooks/hide-refs" <<-EOF
+	test-tool hide-refs \
+		-r "HEAD" \
+		-r "refs/heads/dev" \
+		-r "refs/heads/main" \
+		-r "refs/pull-requests/1/head" \
+		-r "refs/tags/v123"
+	EOF
+'
+
+test_expect_success "$PROTOCOL (protocol: $GIT_TEST_PROTOCOL_VERSION): push to main while hide-refs hook hide all refs" '
+	create_commits_in work_repo E &&
+	test_must_fail git -c protocol.version=$GIT_TEST_PROTOCOL_VERSION -C work_repo push origin HEAD:main >out 2>&1 &&
+	make_user_friendly_and_stable_output <out >out.tmp &&
+	sed "s/$(get_abbrev_oid $E)[0-9a-f]*/<COMMIT-E>/g" <out.tmp >actual &&
+	format_and_save_expect <<-EOF &&
+		remote: # pre-receive hook        Z
+		remote: pre-receive< <ZERO-OID> <COMMIT-E> refs/heads/main        Z
+		To <URL/of/bare_repo.git>
+		 ! [remote rejected] HEAD -> main (deny updating a hidden ref)
+		error: failed to push some refs to "<URL/of/bare_repo.git>"
+	EOF
+	test_cmp expect actual
+'
-- 
gitgitgadget

