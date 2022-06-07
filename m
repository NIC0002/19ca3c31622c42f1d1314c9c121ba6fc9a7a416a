Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A992C433EF
	for <git@archiver.kernel.org>; Tue,  7 Jun 2022 08:48:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238744AbiFGIsw (ORCPT <rfc822;git@archiver.kernel.org>);
        Tue, 7 Jun 2022 04:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238733AbiFGIse (ORCPT <rfc822;git@vger.kernel.org>);
        Tue, 7 Jun 2022 04:48:34 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2245295DFC
        for <git@vger.kernel.org>; Tue,  7 Jun 2022 01:48:26 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id p10so23112600wrg.12
        for <git@vger.kernel.org>; Tue, 07 Jun 2022 01:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hXFv0Wu4sSNOksTCR6sRIIulUQicfzyQaEWIwp6R8Wk=;
        b=VbjnQCzvOvwHR65HwLm0a4RRO2FSk+7GMdKhrjDl68LfGxk2xwOCcP1Zerb7pCv5xp
         tA1xxjd34K7Q1Kh8OEIeVlKeWln6eznT6pY/bnV0PZYtHdRI1zCB4yJS9kOGgWrSamnB
         4wHmUmHnmfbysHAGifvbauE7ysiwQD0hiRapaNmhNtopv7pE3wjDnCUJGZom+4TRmivN
         jtpv69z0707ZH/hQ+WP/8rIPN08RHtRJfQx2D7L2CItqSF2mlH/dZJOt1tsIdlKJcCZT
         W8GQ61+6AYYdNbQ4EQ6GhAvHeM3JmzsyBehHFIln7SpM35KL8z1hpFXRiFZ3vub6Cwmb
         SLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hXFv0Wu4sSNOksTCR6sRIIulUQicfzyQaEWIwp6R8Wk=;
        b=0Nux92SjG2UAS+o9227nJIVR/dHUxgSXeIlOGuiZFLwdOx881ko05URdM5gSqklaWH
         K0O0mwm/6FRZQ54o9CTKhASYKqG63ggPpwYb3M8wkOd5ALudDzAtxlJqIPHEfWXxeBaA
         ghvSxpJqUj+lfs88pJHd4PE6W5yYYqQi0exTLoJOG/Gc0ArQmE9D/YKA6vddJKXuLouj
         qCDZX2BZSaAtQfsVWrEOzTJOS2uKM8i7M/GozVNM7mL2wumsFkWenvPP61ZCo9vyohX8
         +Ar6iZaaxFHJjV9MZ5VWurculF3Iob1IQVIgLY1IB/8hkM+3kVcZDuQ4iRQ38MMGFk5W
         Mb6Q==
X-Gm-Message-State: AOAM533dj5T8X/u43Y/dS1V6DqYp80d2rY5BYaPKHZtaxQ5uZgyYzsiZ
        3D3/dTdM+wR+w8YCCXlIj+zuZvLlJmynUQ==
X-Google-Smtp-Source: ABdhPJwtrzxGp+cAzT6YrmEWP8ER/8XppZcn54clylszwDX9XoE+G72YmP3T3Nw+vr6uLqaARZDVMg==
X-Received: by 2002:adf:d1c6:0:b0:218:51ae:8812 with SMTP id b6-20020adfd1c6000000b0021851ae8812mr1534695wrd.178.1654591704024;
        Tue, 07 Jun 2022 01:48:24 -0700 (PDT)
Received: from vm.nix.is (vm.nix.is. [2a01:4f8:120:2468::2])
        by smtp.gmail.com with ESMTPSA id h11-20020a5d688b000000b0020e63ab5d78sm17297421wru.26.2022.06.07.01.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 01:48:23 -0700 (PDT)
From:   =?UTF-8?q?=C3=86var=20Arnfj=C3=B6r=C3=B0=20Bjarmason?= 
        <avarab@gmail.com>
To:     git@vger.kernel.org
Cc:     Junio C Hamano <gitster@pobox.com>,
        Anthony Sottile <asottile@umich.edu>,
        Emily Shaffer <emilyshaffer@google.com>,
        Phillip Wood <phillip.wood123@gmail.com>,
        Johannes Schindelin <Johannes.Schindelin@gmx.de>,
        =?UTF-8?q?=C3=86var=20Arnfj=C3=B6r=C3=B0=20Bjarmason?= 
        <avarab@gmail.com>
Subject: [PATCH v6 1/2] run-command: add an "ungroup" option to run_process_parallel()
Date:   Tue,  7 Jun 2022 10:48:19 +0200
Message-Id: <patch-v6-1.2-45248c786d7-20220606T170356Z-avarab@gmail.com>
X-Mailer: git-send-email 2.36.1.1173.gcad22db6399
In-Reply-To: <cover-v6-0.2-00000000000-20220606T170356Z-avarab@gmail.com>
References: <cover-v5-0.2-00000000000-20220602T131858Z-avarab@gmail.com> <cover-v6-0.2-00000000000-20220606T170356Z-avarab@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Extend the parallel execution API added in c553c72eed6 (run-command:
add an asynchronous parallel child processor, 2015-12-15) to support a
mode where the stdout and stderr of the processes isn't captured and
output in a deterministic order, instead we'll leave it to the kernel
and stdio to sort it out.

This gives the API same functionality as GNU parallel's --ungroup
option. As we'll see in a subsequent commit the main reason to want
this is to support stdout and stderr being connected to the TTY in the
case of jobs=1, demonstrated here with GNU parallel:

	$ parallel --ungroup 'test -t {} && echo TTY || echo NTTY' ::: 1 2
	TTY
	TTY
	$ parallel 'test -t {} && echo TTY || echo NTTY' ::: 1 2
	NTTY
	NTTY

Another is as GNU parallel's documentation notes a potential for
optimization. As demonstrated in next commit our results with "git
hook run" will be similar, but generally speaking this shows that if
you want to run processes in parallel where the exact order isn't
important this can be a lot faster:

	$ hyperfine -r 3 -L o ,--ungroup 'parallel {o} seq ::: 10000000 >/dev/null '
	Benchmark 1: parallel  seq ::: 10000000 >/dev/null
	  Time (mean ± σ):     220.2 ms ±   9.3 ms    [User: 124.9 ms, System: 96.1 ms]
	  Range (min … max):   212.3 ms … 230.5 ms    3 runs

	Benchmark 2: parallel --ungroup seq ::: 10000000 >/dev/null
	  Time (mean ± σ):     154.7 ms ±   0.9 ms    [User: 136.2 ms, System: 25.1 ms]
	  Range (min … max):   153.9 ms … 155.7 ms    3 runs

	Summary
	  'parallel --ungroup seq ::: 10000000 >/dev/null ' ran
	    1.42 ± 0.06 times faster than 'parallel  seq ::: 10000000 >/dev/null '

A large part of the juggling in the API is to make the API safer for
its maintenance and consumers alike.

For the maintenance of the API we e.g. avoid malloc()-ing the
"pp->pfd", ensuring that SANITIZE=address and other similar tools will
catch any unexpected misuse.

For API consumers we take pains to never pass the non-NULL "out"
buffer to an API user that provided the "ungroup" option. The
resulting code in t/helper/test-run-command.c isn't typical of such a
user, i.e. they'd typically use one mode or the other, and would know
whether they'd provided "ungroup" or not.

We could also avoid the strbuf_init() for "buffered_output" by having
"struct parallel_processes" use a static PARALLEL_PROCESSES_INIT
initializer, but let's leave that cleanup for later.

Using a global "run_processes_parallel_ungroup" variable to enable
this option is rather nasty, but is being done here to produce as
minimal of a change as possible for a subsequent regression fix. This
change is extracted from a larger initial version[1] which ends up
with a better end-state for the API, but in doing so needed to modify
all existing callers of the API. Let's defer that for now, and
narrowly focus on what we need for fixing the regression in the
subsequent commit.

It's safe to do this with a global variable because:

 A) hook.c is the only user of it that sets it to non-zero, and before
    we'll get any other API users we'll refactor away this method of
    passing in the option, i.e. re-roll [1].

 B) Even if hook.c wasn't the only user we don't have callers of this
    API that concurrently invoke this parallel process starting API
    itself in parallel.

As noted above "A" && "B" are rather nasty, and we don't want to live
with those caveats long-term, but for now they should be an acceptable
compromise.

1. https://lore.kernel.org/git/cover-v2-0.8-00000000000-20220518T195858Z-avarab@gmail.com/

Signed-off-by: Ævar Arnfjörð Bjarmason <avarab@gmail.com>
---
 run-command.c               | 70 +++++++++++++++++++++++++++----------
 run-command.h               | 30 ++++++++++++----
 t/helper/test-run-command.c | 22 ++++++++++--
 t/t0061-run-command.sh      | 30 ++++++++++++++++
 4 files changed, 123 insertions(+), 29 deletions(-)

diff --git a/run-command.c b/run-command.c
index a8501e38ceb..7ab2dd28f3c 100644
--- a/run-command.c
+++ b/run-command.c
@@ -1471,6 +1471,7 @@ enum child_state {
 	GIT_CP_WAIT_CLEANUP,
 };
 
+int run_processes_parallel_ungroup;
 struct parallel_processes {
 	void *data;
 
@@ -1494,6 +1495,7 @@ struct parallel_processes {
 	struct pollfd *pfd;
 
 	unsigned shutdown : 1;
+	unsigned ungroup : 1;
 
 	int output_owner;
 	struct strbuf buffered_output; /* of finished children */
@@ -1537,7 +1539,7 @@ static void pp_init(struct parallel_processes *pp,
 		    get_next_task_fn get_next_task,
 		    start_failure_fn start_failure,
 		    task_finished_fn task_finished,
-		    void *data)
+		    void *data, int ungroup)
 {
 	int i;
 
@@ -1559,15 +1561,21 @@ static void pp_init(struct parallel_processes *pp,
 	pp->nr_processes = 0;
 	pp->output_owner = 0;
 	pp->shutdown = 0;
+	pp->ungroup = ungroup;
 	CALLOC_ARRAY(pp->children, n);
-	CALLOC_ARRAY(pp->pfd, n);
+	if (pp->ungroup)
+		pp->pfd = NULL;
+	else
+		CALLOC_ARRAY(pp->pfd, n);
 	strbuf_init(&pp->buffered_output, 0);
 
 	for (i = 0; i < n; i++) {
 		strbuf_init(&pp->children[i].err, 0);
 		child_process_init(&pp->children[i].process);
-		pp->pfd[i].events = POLLIN | POLLHUP;
-		pp->pfd[i].fd = -1;
+		if (pp->pfd) {
+			pp->pfd[i].events = POLLIN | POLLHUP;
+			pp->pfd[i].fd = -1;
+		}
 	}
 
 	pp_for_signal = pp;
@@ -1615,24 +1623,31 @@ static int pp_start_one(struct parallel_processes *pp)
 		BUG("bookkeeping is hard");
 
 	code = pp->get_next_task(&pp->children[i].process,
-				 &pp->children[i].err,
+				 pp->ungroup ? NULL : &pp->children[i].err,
 				 pp->data,
 				 &pp->children[i].data);
 	if (!code) {
-		strbuf_addbuf(&pp->buffered_output, &pp->children[i].err);
-		strbuf_reset(&pp->children[i].err);
+		if (!pp->ungroup) {
+			strbuf_addbuf(&pp->buffered_output, &pp->children[i].err);
+			strbuf_reset(&pp->children[i].err);
+		}
 		return 1;
 	}
-	pp->children[i].process.err = -1;
-	pp->children[i].process.stdout_to_stderr = 1;
+	if (!pp->ungroup) {
+		pp->children[i].process.err = -1;
+		pp->children[i].process.stdout_to_stderr = 1;
+	}
 	pp->children[i].process.no_stdin = 1;
 
 	if (start_command(&pp->children[i].process)) {
-		code = pp->start_failure(&pp->children[i].err,
+		code = pp->start_failure(pp->ungroup ? NULL :
+					 &pp->children[i].err,
 					 pp->data,
 					 pp->children[i].data);
-		strbuf_addbuf(&pp->buffered_output, &pp->children[i].err);
-		strbuf_reset(&pp->children[i].err);
+		if (!pp->ungroup) {
+			strbuf_addbuf(&pp->buffered_output, &pp->children[i].err);
+			strbuf_reset(&pp->children[i].err);
+		}
 		if (code)
 			pp->shutdown = 1;
 		return code;
@@ -1640,7 +1655,8 @@ static int pp_start_one(struct parallel_processes *pp)
 
 	pp->nr_processes++;
 	pp->children[i].state = GIT_CP_WORKING;
-	pp->pfd[i].fd = pp->children[i].process.err;
+	if (pp->pfd)
+		pp->pfd[i].fd = pp->children[i].process.err;
 	return 0;
 }
 
@@ -1674,6 +1690,7 @@ static void pp_buffer_stderr(struct parallel_processes *pp, int output_timeout)
 static void pp_output(struct parallel_processes *pp)
 {
 	int i = pp->output_owner;
+
 	if (pp->children[i].state == GIT_CP_WORKING &&
 	    pp->children[i].err.len) {
 		strbuf_write(&pp->children[i].err, stderr);
@@ -1696,7 +1713,7 @@ static int pp_collect_finished(struct parallel_processes *pp)
 
 		code = finish_command(&pp->children[i].process);
 
-		code = pp->task_finished(code,
+		code = pp->task_finished(code, pp->ungroup ? NULL :
 					 &pp->children[i].err, pp->data,
 					 pp->children[i].data);
 
@@ -1707,10 +1724,13 @@ static int pp_collect_finished(struct parallel_processes *pp)
 
 		pp->nr_processes--;
 		pp->children[i].state = GIT_CP_FREE;
-		pp->pfd[i].fd = -1;
+		if (pp->pfd)
+			pp->pfd[i].fd = -1;
 		child_process_init(&pp->children[i].process);
 
-		if (i != pp->output_owner) {
+		if (pp->ungroup) {
+			; /* no strbuf_*() work to do here */
+		} else if (i != pp->output_owner) {
 			strbuf_addbuf(&pp->buffered_output, &pp->children[i].err);
 			strbuf_reset(&pp->children[i].err);
 		} else {
@@ -1747,9 +1767,14 @@ int run_processes_parallel(int n,
 	int i, code;
 	int output_timeout = 100;
 	int spawn_cap = 4;
+	int ungroup = run_processes_parallel_ungroup;
 	struct parallel_processes pp;
 
-	pp_init(&pp, n, get_next_task, start_failure, task_finished, pp_cb);
+	/* unset for the next API user */
+	run_processes_parallel_ungroup = 0;
+
+	pp_init(&pp, n, get_next_task, start_failure, task_finished, pp_cb,
+		ungroup);
 	while (1) {
 		for (i = 0;
 		    i < spawn_cap && !pp.shutdown &&
@@ -1766,8 +1791,15 @@ int run_processes_parallel(int n,
 		}
 		if (!pp.nr_processes)
 			break;
-		pp_buffer_stderr(&pp, output_timeout);
-		pp_output(&pp);
+		if (ungroup) {
+			int i;
+
+			for (i = 0; i < pp.max_processes; i++)
+				pp.children[i].state = GIT_CP_WAIT_CLEANUP;
+		} else {
+			pp_buffer_stderr(&pp, output_timeout);
+			pp_output(&pp);
+		}
 		code = pp_collect_finished(&pp);
 		if (code) {
 			pp.shutdown = 1;
diff --git a/run-command.h b/run-command.h
index 5bd0c933e80..bf4236f1164 100644
--- a/run-command.h
+++ b/run-command.h
@@ -405,6 +405,9 @@ void check_pipe(int err);
  * pp_cb is the callback cookie as passed to run_processes_parallel.
  * You can store a child process specific callback cookie in pp_task_cb.
  *
+ * See run_processes_parallel() below for a discussion of the "struct
+ * strbuf *out" parameter.
+ *
  * Even after returning 0 to indicate that there are no more processes,
  * this function will be called again until there are no more running
  * child processes.
@@ -423,9 +426,8 @@ typedef int (*get_next_task_fn)(struct child_process *cp,
  * This callback is called whenever there are problems starting
  * a new process.
  *
- * You must not write to stdout or stderr in this function. Add your
- * message to the strbuf out instead, which will be printed without
- * messing up the output of the other parallel processes.
+ * See run_processes_parallel() below for a discussion of the "struct
+ * strbuf *out" parameter.
  *
  * pp_cb is the callback cookie as passed into run_processes_parallel,
  * pp_task_cb is the callback cookie as passed into get_next_task_fn.
@@ -441,9 +443,8 @@ typedef int (*start_failure_fn)(struct strbuf *out,
 /**
  * This callback is called on every child process that finished processing.
  *
- * You must not write to stdout or stderr in this function. Add your
- * message to the strbuf out instead, which will be printed without
- * messing up the output of the other parallel processes.
+ * See run_processes_parallel() below for a discussion of the "struct
+ * strbuf *out" parameter.
  *
  * pp_cb is the callback cookie as passed into run_processes_parallel,
  * pp_task_cb is the callback cookie as passed into get_next_task_fn.
@@ -464,11 +465,26 @@ typedef int (*task_finished_fn)(int result,
  *
  * The children started via this function run in parallel. Their output
  * (both stdout and stderr) is routed to stderr in a manner that output
- * from different tasks does not interleave.
+ * from different tasks does not interleave (but see "ungroup" below).
  *
  * start_failure_fn and task_finished_fn can be NULL to omit any
  * special handling.
+ *
+ * If the "ungroup" option isn't specified, the API will set the
+ * "stdout_to_stderr" parameter in "struct child_process" and provide
+ * the callbacks with a "struct strbuf *out" parameter to write output
+ * to. In this case the callbacks must not write to stdout or
+ * stderr as such output will mess up the output of the other parallel
+ * processes. If "ungroup" option is specified callbacks will get a
+ * NULL "struct strbuf *out" parameter, and are responsible for
+ * emitting their own output, including dealing with any race
+ * conditions due to writing in parallel to stdout and stderr.
+ * The "ungroup" option can be enabled by setting the global
+ * "run_processes_parallel_ungroup" to "1" before invoking
+ * run_processes_parallel(), it will be set back to "0" as soon as the
+ * API reads that setting.
  */
+extern int run_processes_parallel_ungroup;
 int run_processes_parallel(int n,
 			   get_next_task_fn,
 			   start_failure_fn,
diff --git a/t/helper/test-run-command.c b/t/helper/test-run-command.c
index f3b90aa834a..34cce45b584 100644
--- a/t/helper/test-run-command.c
+++ b/t/helper/test-run-command.c
@@ -31,7 +31,11 @@ static int parallel_next(struct child_process *cp,
 		return 0;
 
 	strvec_pushv(&cp->args, d->args.v);
-	strbuf_addstr(err, "preloaded output of a child\n");
+	if (err)
+		strbuf_addstr(err, "preloaded output of a child\n");
+	else
+		fprintf(stderr, "preloaded output of a child\n");
+
 	number_callbacks++;
 	return 1;
 }
@@ -41,7 +45,10 @@ static int no_job(struct child_process *cp,
 		  void *cb,
 		  void **task_cb)
 {
-	strbuf_addstr(err, "no further jobs available\n");
+	if (err)
+		strbuf_addstr(err, "no further jobs available\n");
+	else
+		fprintf(stderr, "no further jobs available\n");
 	return 0;
 }
 
@@ -50,7 +57,10 @@ static int task_finished(int result,
 			 void *pp_cb,
 			 void *pp_task_cb)
 {
-	strbuf_addstr(err, "asking for a quick stop\n");
+	if (err)
+		strbuf_addstr(err, "asking for a quick stop\n");
+	else
+		fprintf(stderr, "asking for a quick stop\n");
 	return 1;
 }
 
@@ -407,6 +417,12 @@ int cmd__run_command(int argc, const char **argv)
 	if (!strcmp(argv[1], "run-command"))
 		exit(run_command(&proc));
 
+	if (!strcmp(argv[1], "--ungroup")) {
+		argv += 1;
+		argc -= 1;
+		run_processes_parallel_ungroup = 1;
+	}
+
 	jobs = atoi(argv[2]);
 	strvec_clear(&proc.args);
 	strvec_pushv(&proc.args, (const char **)argv + 3);
diff --git a/t/t0061-run-command.sh b/t/t0061-run-command.sh
index ee281909bc3..7b5423eebda 100755
--- a/t/t0061-run-command.sh
+++ b/t/t0061-run-command.sh
@@ -134,16 +134,34 @@ test_expect_success 'run_command runs in parallel with more jobs available than
 	test_cmp expect actual
 '
 
+test_expect_success 'run_command runs ungrouped in parallel with more jobs available than tasks' '
+	test-tool run-command --ungroup run-command-parallel 5 sh -c "printf \"%s\n%s\n\" Hello World" >out 2>err &&
+	test_line_count = 8 out &&
+	test_line_count = 4 err
+'
+
 test_expect_success 'run_command runs in parallel with as many jobs as tasks' '
 	test-tool run-command run-command-parallel 4 sh -c "printf \"%s\n%s\n\" Hello World" 2>actual &&
 	test_cmp expect actual
 '
 
+test_expect_success 'run_command runs ungrouped in parallel with as many jobs as tasks' '
+	test-tool run-command --ungroup run-command-parallel 4 sh -c "printf \"%s\n%s\n\" Hello World" >out 2>err &&
+	test_line_count = 8 out &&
+	test_line_count = 4 err
+'
+
 test_expect_success 'run_command runs in parallel with more tasks than jobs available' '
 	test-tool run-command run-command-parallel 3 sh -c "printf \"%s\n%s\n\" Hello World" 2>actual &&
 	test_cmp expect actual
 '
 
+test_expect_success 'run_command runs ungrouped in parallel with more tasks than jobs available' '
+	test-tool run-command --ungroup run-command-parallel 3 sh -c "printf \"%s\n%s\n\" Hello World" >out 2>err &&
+	test_line_count = 8 out &&
+	test_line_count = 4 err
+'
+
 cat >expect <<-EOF
 preloaded output of a child
 asking for a quick stop
@@ -158,6 +176,12 @@ test_expect_success 'run_command is asked to abort gracefully' '
 	test_cmp expect actual
 '
 
+test_expect_success 'run_command is asked to abort gracefully (ungroup)' '
+	test-tool run-command --ungroup run-command-abort 3 false >out 2>err &&
+	test_must_be_empty out &&
+	test_line_count = 6 err
+'
+
 cat >expect <<-EOF
 no further jobs available
 EOF
@@ -167,6 +191,12 @@ test_expect_success 'run_command outputs ' '
 	test_cmp expect actual
 '
 
+test_expect_success 'run_command outputs (ungroup) ' '
+	test-tool run-command --ungroup run-command-no-jobs 3 sh -c "printf \"%s\n%s\n\" Hello World" >out 2>err &&
+	test_must_be_empty out &&
+	test_cmp expect err
+'
+
 test_trace () {
 	expect="$1"
 	shift
-- 
2.36.1.1173.gcad22db6399

