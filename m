Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E92C636CC
	for <git@archiver.kernel.org>; Wed,  8 Feb 2023 14:20:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbjBHOUZ (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 8 Feb 2023 09:20:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230305AbjBHOUY (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 8 Feb 2023 09:20:24 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704A14B74F
        for <git@vger.kernel.org>; Wed,  8 Feb 2023 06:19:59 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso1593927wms.3
        for <git@vger.kernel.org>; Wed, 08 Feb 2023 06:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gka5gHpXc+1yNx4KoI3LDu/UxpdYV19YU6dPgXaY4ac=;
        b=cs5rm9ia6G3yIvlN1mQLagcqWqOSE+AEG8IV8cG327AjqeeMPbw3sqB193hbWro56U
         3YP0rArYY5OLi6zRE/Uhc8w0DHvRrD4Xe1BZr8HjPKGp3gva09ljfFaUIhUVU6ga8p+7
         4hcOBOLE9gSF3v+Ye2EdgAeWxQpmAoM4hvRhP3PAYwCIFTJVxghq0n5MXDU++6ToXNJG
         gYcRdHT6EXfuXAzIRWuv6VGsrJgIZqWLZMSCP5sq24EAqTS0YubXaF78bXpRM1xxHsjQ
         /quXEpaCBbzdVhzSQ+VH+E/tLNKhvOR15Sm0IaYiKfVKwlrDuBuazz18kpeC7ojwm7hH
         ie9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gka5gHpXc+1yNx4KoI3LDu/UxpdYV19YU6dPgXaY4ac=;
        b=Zw6JnidkPY3lJvOHjekh+kpWww0NG50ctvx94ixXY/46wy3BKDd3kSmyEfHjY2Srsq
         CVDyX+LC7Pp+jNN7dunAwRURjzS1EuyrrXWudC8PQuzxsC+9Vmt/JcEy9d1UU/qV4t/a
         o0H6tATi4MNdKMIfTGW0vQErwZASpPO8kfHxdDk7c6qok9jjPkbtbi8PRdIJbOzARJFY
         46SUzzZN44eBtEDp5jLC91wcXTyVwPuH1yrKW/oaZBXgYnNC5ru86MAMiDcWl0DOcBiV
         sVAF+BG1xIyaGPQeBnintKmvm2KdS2DsvUay5degRg1IwQ4TsaRNBVzEFFO64inwOiIv
         x/FA==
X-Gm-Message-State: AO0yUKUXlOFipCSOOBRf0ioYd3+A6cuR0z4i0wIGlKPBFuKJZr314EZP
        JgCatmwhOWu5JFmtA5OAJwscTIB/Yew=
X-Google-Smtp-Source: AK7set+ZP9T9GQ7oueBkc11QAqdBko1SLvmKEkCPmOiZAgBQ2YXhMAT06ccvgKCTOP4FP7LDCZKqDg==
X-Received: by 2002:a05:600c:998:b0:3e0:95:ea3e with SMTP id w24-20020a05600c099800b003e00095ea3emr6850105wmp.22.1675865997852;
        Wed, 08 Feb 2023 06:19:57 -0800 (PST)
Received: from [192.168.1.212] ([90.248.183.175])
        by smtp.gmail.com with ESMTPSA id n10-20020a05600c304a00b003db1ca20170sm1954320wmh.37.2023.02.08.06.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 06:19:57 -0800 (PST)
From:   Phillip Wood <phillip.wood123@gmail.com>
X-Google-Original-From: Phillip Wood <phillip.wood@dunelm.org.uk>
Message-ID: <cd528776-caa8-6372-0ca5-db0545947fba@dunelm.org.uk>
Date:   Wed, 8 Feb 2023 14:19:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Reply-To: phillip.wood@dunelm.org.uk
Subject: Re: [PATCH v7 1/7] run-command: add duplicate_output_fn to
 run_processes_parallel_opts
Content-Language: en-US
To:     Calvin Wan <calvinwan@google.com>, git@vger.kernel.org
Cc:     avarab@gmail.com, chooglen@google.com, newren@gmail.com,
        jonathantanmy@google.com
References: <20230117193041.708692-1-calvinwan@google.com>
 <20230207181706.363453-2-calvinwan@google.com>
In-Reply-To: <20230207181706.363453-2-calvinwan@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Hi Calvin

On 07/02/2023 18:17, Calvin Wan wrote:
> Add duplicate_output_fn as an optionally set function in
> run_process_parallel_opts. If set, output from each child process is
> copied and passed to the callback function whenever output from the
> child process is buffered to allow for separate parsing.
> 
> Signed-off-by: Calvin Wan <calvinwan@google.com>
> ---
>   run-command.c               | 16 ++++++++++++---
>   run-command.h               | 27 +++++++++++++++++++++++++
>   t/helper/test-run-command.c | 21 ++++++++++++++++++++
>   t/t0061-run-command.sh      | 39 +++++++++++++++++++++++++++++++++++++
>   4 files changed, 100 insertions(+), 3 deletions(-)
> 
> diff --git a/run-command.c b/run-command.c
> index 756f1839aa..cad88befe0 100644
> --- a/run-command.c
> +++ b/run-command.c
> @@ -1526,6 +1526,9 @@ static void pp_init(struct parallel_processes *pp,
>   	if (!opts->get_next_task)
>   		BUG("you need to specify a get_next_task function");
>   
> +	if (opts->duplicate_output && opts->ungroup)
> +		BUG("duplicate_output and ungroup are incompatible with each other");
> +
>   	CALLOC_ARRAY(pp->children, n);
>   	if (!opts->ungroup)
>   		CALLOC_ARRAY(pp->pfd, n);
> @@ -1645,14 +1648,21 @@ static void pp_buffer_stderr(struct parallel_processes *pp,
>   	for (size_t i = 0; i < opts->processes; i++) {
>   		if (pp->children[i].state == GIT_CP_WORKING &&
>   		    pp->pfd[i].revents & (POLLIN | POLLHUP)) {
> -			int n = strbuf_read_once(&pp->children[i].err,
> -						 pp->children[i].process.err, 0);
> +			ssize_t n = strbuf_read_once(&pp->children[i].err,
> +						     pp->children[i].process.err, 0);
>   			if (n == 0) {
>   				close(pp->children[i].process.err);
>   				pp->children[i].state = GIT_CP_WAIT_CLEANUP;
> -			} else if (n < 0)
> +			} else if (n < 0) {
>   				if (errno != EAGAIN)
>   					die_errno("read");
> +			} else {
> +				if (opts->duplicate_output)
> +					opts->duplicate_output(&pp->children[i].err,
> +					       strlen(pp->children[i].err.buf) - n,

Looking at how this is used in patch 7 I think it would be better to 
pass a const char*, length pair rather than a struct strbuf*, offset pair.
i.e.
	opts->duplicate_output(pp->children[i].err.buf + 
pp->children[i].err.len - n, n, ...)

That would make it clear that we do not expect duplicate_output() to 
alter the buffer and would avoid the duplicate_output() having to add 
the offset to the start of the buffer to find the new data.

Best Wishes

Phillip


> +					       opts->data,
> +					       pp->children[i].data);
> +			}
>   		}
>   	}
>   }
> diff --git a/run-command.h b/run-command.h
> index 072db56a4d..6dcf999f6c 100644
> --- a/run-command.h
> +++ b/run-command.h
> @@ -408,6 +408,27 @@ typedef int (*start_failure_fn)(struct strbuf *out,
>   				void *pp_cb,
>   				void *pp_task_cb);
>   
> +/**
> + * This callback is called whenever output from a child process is buffered
> + *
> + * See run_processes_parallel() below for a discussion of the "struct
> + * strbuf *out" parameter.
> + *
> + * The offset refers to the number of bytes originally in "out" before
> + * the output from the child process was buffered. Therefore, the buffer
> + * range, "out + buf" to the end of "out", would contain the buffer of
> + * the child process output.
> + *
> + * pp_cb is the callback cookie as passed into run_processes_parallel,
> + * pp_task_cb is the callback cookie as passed into get_next_task_fn.
> + *
> + * This function is incompatible with "ungroup"
> + */
> +typedef void (*duplicate_output_fn)(struct strbuf *out,
> +				    size_t offset,
> +				    void *pp_cb,
> +				    void *pp_task_cb);
> +
>   /**
>    * This callback is called on every child process that finished processing.
>    *
> @@ -461,6 +482,12 @@ struct run_process_parallel_opts
>   	 */
>   	start_failure_fn start_failure;
>   
> +	/**
> +	 * duplicate_output: See duplicate_output_fn() above. This should be
> +	 * NULL unless process specific output is needed
> +	 */
> +	duplicate_output_fn duplicate_output;
> +
>   	/**
>   	 * task_finished: See task_finished_fn() above. This can be
>   	 * NULL to omit any special handling.
> diff --git a/t/helper/test-run-command.c b/t/helper/test-run-command.c
> index 3ecb830f4a..ffd3cd0045 100644
> --- a/t/helper/test-run-command.c
> +++ b/t/helper/test-run-command.c
> @@ -52,6 +52,21 @@ static int no_job(struct child_process *cp,
>   	return 0;
>   }
>   
> +static void duplicate_output(struct strbuf *out,
> +			size_t offset,
> +			void *pp_cb UNUSED,
> +			void *pp_task_cb UNUSED)
> +{
> +	struct string_list list = STRING_LIST_INIT_DUP;
> +
> +	string_list_split(&list, out->buf + offset, '\n', -1);
> +	for (size_t i = 0; i < list.nr; i++) {
> +		if (strlen(list.items[i].string) > 0)
> +			fprintf(stderr, "duplicate_output: %s\n", list.items[i].string);
> +	}
> +	string_list_clear(&list, 0);
> +}
> +
>   static int task_finished(int result,
>   			 struct strbuf *err,
>   			 void *pp_cb,
> @@ -439,6 +454,12 @@ int cmd__run_command(int argc, const char **argv)
>   		opts.ungroup = 1;
>   	}
>   
> +	if (!strcmp(argv[1], "--duplicate-output")) {
> +		argv += 1;
> +		argc -= 1;
> +		opts.duplicate_output = duplicate_output;
> +	}
> +
>   	jobs = atoi(argv[2]);
>   	strvec_clear(&proc.args);
>   	strvec_pushv(&proc.args, (const char **)argv + 3);
> diff --git a/t/t0061-run-command.sh b/t/t0061-run-command.sh
> index e2411f6a9b..879e536638 100755
> --- a/t/t0061-run-command.sh
> +++ b/t/t0061-run-command.sh
> @@ -135,6 +135,15 @@ test_expect_success 'run_command runs in parallel with more jobs available than
>   	test_cmp expect actual
>   '
>   
> +test_expect_success 'run_command runs in parallel with more jobs available than tasks --duplicate-output' '
> +	test-tool run-command --duplicate-output run-command-parallel 5 sh -c "printf \"%s\n%s\n\" Hello World" >out 2>err &&
> +	test_must_be_empty out &&
> +	test 4 = $(grep -c "duplicate_output: Hello" err) &&
> +	test 4 = $(grep -c "duplicate_output: World" err) &&
> +	sed "/duplicate_output/d" err > err1 &&
> +	test_cmp expect err1
> +'
> +
>   test_expect_success 'run_command runs ungrouped in parallel with more jobs available than tasks' '
>   	test-tool run-command --ungroup run-command-parallel 5 sh -c "printf \"%s\n%s\n\" Hello World" >out 2>err &&
>   	test_line_count = 8 out &&
> @@ -147,6 +156,15 @@ test_expect_success 'run_command runs in parallel with as many jobs as tasks' '
>   	test_cmp expect actual
>   '
>   
> +test_expect_success 'run_command runs in parallel with as many jobs as tasks --duplicate-output' '
> +	test-tool run-command --duplicate-output run-command-parallel 4 sh -c "printf \"%s\n%s\n\" Hello World" >out 2>err &&
> +	test_must_be_empty out &&
> +	test 4 = $(grep -c "duplicate_output: Hello" err) &&
> +	test 4 = $(grep -c "duplicate_output: World" err) &&
> +	sed "/duplicate_output/d" err > err1 &&
> +	test_cmp expect err1
> +'
> +
>   test_expect_success 'run_command runs ungrouped in parallel with as many jobs as tasks' '
>   	test-tool run-command --ungroup run-command-parallel 4 sh -c "printf \"%s\n%s\n\" Hello World" >out 2>err &&
>   	test_line_count = 8 out &&
> @@ -159,6 +177,15 @@ test_expect_success 'run_command runs in parallel with more tasks than jobs avai
>   	test_cmp expect actual
>   '
>   
> +test_expect_success 'run_command runs in parallel with more tasks than jobs available --duplicate-output' '
> +	test-tool run-command --duplicate-output run-command-parallel 3 sh -c "printf \"%s\n%s\n\" Hello World" >out 2>err &&
> +	test_must_be_empty out &&
> +	test 4 = $(grep -c "duplicate_output: Hello" err) &&
> +	test 4 = $(grep -c "duplicate_output: World" err) &&
> +	sed "/duplicate_output/d" err > err1 &&
> +	test_cmp expect err1
> +'
> +
>   test_expect_success 'run_command runs ungrouped in parallel with more tasks than jobs available' '
>   	test-tool run-command --ungroup run-command-parallel 3 sh -c "printf \"%s\n%s\n\" Hello World" >out 2>err &&
>   	test_line_count = 8 out &&
> @@ -180,6 +207,12 @@ test_expect_success 'run_command is asked to abort gracefully' '
>   	test_cmp expect actual
>   '
>   
> +test_expect_success 'run_command is asked to abort gracefully --duplicate-output' '
> +	test-tool run-command --duplicate-output run-command-abort 3 false >out 2>err &&
> +	test_must_be_empty out &&
> +	test_cmp expect err
> +'
> +
>   test_expect_success 'run_command is asked to abort gracefully (ungroup)' '
>   	test-tool run-command --ungroup run-command-abort 3 false >out 2>err &&
>   	test_must_be_empty out &&
> @@ -196,6 +229,12 @@ test_expect_success 'run_command outputs ' '
>   	test_cmp expect actual
>   '
>   
> +test_expect_success 'run_command outputs --duplicate-output' '
> +	test-tool run-command --duplicate-output run-command-no-jobs 3 sh -c "printf \"%s\n%s\n\" Hello World" >out 2>err &&
> +	test_must_be_empty out &&
> +	test_cmp expect err
> +'
> +
>   test_expect_success 'run_command outputs (ungroup) ' '
>   	test-tool run-command --ungroup run-command-no-jobs 3 sh -c "printf \"%s\n%s\n\" Hello World" >out 2>err &&
>   	test_must_be_empty out &&
