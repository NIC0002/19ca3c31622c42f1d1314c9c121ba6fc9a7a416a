Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8C0C00140
	for <git@archiver.kernel.org>; Tue,  9 Aug 2022 00:51:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244760AbiHIAvc (ORCPT <rfc822;git@archiver.kernel.org>);
        Mon, 8 Aug 2022 20:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238516AbiHIAv2 (ORCPT <rfc822;git@vger.kernel.org>);
        Mon, 8 Aug 2022 20:51:28 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3685C186D0
        for <git@vger.kernel.org>; Mon,  8 Aug 2022 17:51:27 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id h28so9484096pfq.11
        for <git@vger.kernel.org>; Mon, 08 Aug 2022 17:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=github.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=oKabtHO887nEIWW2tJjMsiVgxKsV05NxlY4m5EsQ6Fg=;
        b=dMfZptL8OMKtu1IR61wlRyrQQP3izkAxe0WuF0TqsTGt8lqDVXc0OhseM0iHO793md
         bycxHJ2bRjzZGuuPhey2zF1AwriERBlKQMoxdQ+qjKtR4WCoIaf61+z5h2htB/JOGjdK
         U8ZqT4pXnpIedMr35sbnbiXY/kDH5Cj3JxE5fJWusYx8SSU5x9GLDrohJJqctpRNEQJx
         Exfpa4Q8AW9Zy2eoTB0qDu6lovlogu9P5QM4Pv4OWt9Phh/V0ZKKfPhG+JR0GuwFHqKF
         Bw0tpgNCBNwhjmpBnQZQIz7PwEmzJYq8H6280q+IlbUhsliQFLxpXRkdkQxv+k1wD6/J
         i9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=oKabtHO887nEIWW2tJjMsiVgxKsV05NxlY4m5EsQ6Fg=;
        b=o2Ed1AXSyniO4KQ5mcK11OMPLCBa1p1vVNuoj1GzuI6cBnLF3a2TXnuToJI6azTlsg
         9gBDUZsZ2Fg/xuOtaNitZKuzbaDVI9Dh0gvv3PXEcISSi5ryZV/FoXGb31W3zheCkOcP
         Jp3CqYemrewV4LNOPk7GtwN6hxQ0FCsCHttjvmK6x0JOmHXVrEgmMz2YOLbdwkDFQsQV
         ZaNauXlkr7wOBLKcjMf5hEH7eUzUnb4O8QPz6u1lDU15YbmR7T7eoM40rLD5m3ch1n4S
         Tmin3uG8+ELD/vN9UEML7mEFy6eAZro+Rcb8yrqdfRLPz1zZWsGXSWQVG5bx4FuUFoiO
         1A/g==
X-Gm-Message-State: ACgBeo1NFoa3AttolUMObUeHLA3yMldYi7CfeSHbRfN+l1c4WCY2TaUI
        Ankqcp4KOalRnQ5qkIhRTQ45563RBLFK
X-Google-Smtp-Source: AA6agR6xPQFgUD1ZlBczjHr6CoigAuqGgV+ge0Y3hWtCvl7DxYOkRm0bAYubzg/OD2E+btGwWtx4Yg==
X-Received: by 2002:a05:6a00:1395:b0:52e:128a:23de with SMTP id t21-20020a056a00139500b0052e128a23demr21465098pfg.5.1660006286705;
        Mon, 08 Aug 2022 17:51:26 -0700 (PDT)
Received: from [192.168.0.104] (cpe-172-249-73-112.socal.res.rr.com. [172.249.73.112])
        by smtp.gmail.com with ESMTPSA id f71-20020a62384a000000b0052d96d86836sm9218996pfa.50.2022.08.08.17.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 17:51:25 -0700 (PDT)
Message-ID: <bd80881d-b2a3-c220-8f2d-a07a46e14207@github.com>
Date:   Mon, 8 Aug 2022 17:51:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/9] t7002: add tests for moving from in-cone to
 out-of-cone
Content-Language: en-US
To:     Shaoxuan Yuan <shaoxuan.yuan02@gmail.com>, git@vger.kernel.org
Cc:     derrickstolee@github.com
References: <20220719132809.409247-1-shaoxuan.yuan02@gmail.com>
 <20220805030528.1535376-1-shaoxuan.yuan02@gmail.com>
 <20220805030528.1535376-2-shaoxuan.yuan02@gmail.com>
From:   Victoria Dye <vdye@github.com>
In-Reply-To: <20220805030528.1535376-2-shaoxuan.yuan02@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Shaoxuan Yuan wrote:
> Add corresponding tests to test that user can move an in-cone <source>
> to out-of-cone <destination> when --sparse is supplied.
> 
> Such <source> can be either clean or dirty, and moving it results in
> different behaviors:
> 
> A clean move should move the <source> to the <destination>, both in the
> working tree and the index, then remove the resulted path from the
> working tree, and turn on its CE_SKIP_WORKTREE bit.

Looking ahead to patch 6, I think the part about "move it in the working
tree, then delete from the working tree" doesn't quite match your
implementation. Instead, if I'm not mistaken, what happens is:

1. Move <source> to <destination> in the index (do *not* create
   <destination> in the worktree)
2. Delete <source> from the working tree

> 
> A dirty move should move the <source> to the <destination>, both in the
> working tree and the index, but should *not* remove the resulted path
> from the working tree and should *not* turn on its CE_SKIP_WORKTREE bit.

Makes sense.

> 
> Also make sure that if <destination> exists in the index (existing
> check for if <destination> is in the worktree is not enough in
> in-to-out moves), warn user against the overwrite. And Git should force
> the overwrite when supplied with -f or --force.

Also makes sense. 

> 
> Helped-by: Derrick Stolee <derrickstolee@github.com>
> Helped-by: Victoria Dye <vdye@github.com>
> Signed-off-by: Shaoxuan Yuan <shaoxuan.yuan02@gmail.com>
> ---
>  t/t7002-mv-sparse-checkout.sh | 122 ++++++++++++++++++++++++++++++++++
>  1 file changed, 122 insertions(+)
> 
> diff --git a/t/t7002-mv-sparse-checkout.sh b/t/t7002-mv-sparse-checkout.sh
> index 71fe29690f..9b3a9ab4c3 100755
> --- a/t/t7002-mv-sparse-checkout.sh
> +++ b/t/t7002-mv-sparse-checkout.sh
> @@ -290,4 +290,126 @@ test_expect_success 'move sparse file to existing destination with --force and -
>  	test_cmp expect sub/file1
>  '
>  
> +test_expect_failure 'move clean path from in-cone to out-of-cone' '
> +	test_when_finished "cleanup_sparse_checkout" &&
> +	setup_sparse_checkout &&
> +
> +	test_must_fail git mv sub/d folder1 2>stderr &&
> +	cat sparse_error_header >expect &&
> +	echo "folder1/d" >>expect &&
> +	cat sparse_hint >>expect &&
> +	test_cmp expect stderr &&
> +
> +	git mv --sparse sub/d folder1 2>stderr &&
> +	test_must_be_empty stderr &&
> +
> +	test_path_is_missing sub/d &&
> +	test_path_is_missing folder1/d &&
> +	git ls-files -t >actual &&
> +	! grep "^H sub/d\$" actual &&
> +	grep "S folder1/d" actual
> +'
> +
> +test_expect_failure 'move clean path from in-cone to out-of-cone overwrite' '
> +	test_when_finished "cleanup_sparse_checkout" &&
> +	setup_sparse_checkout &&
> +	echo "sub/file1 overwrite" >sub/file1 &&
> +	git add sub/file1 &&
> +
> +	test_must_fail git mv sub/file1 folder1 2>stderr &&
> +	cat sparse_error_header >expect &&
> +	echo "folder1/file1" >>expect &&
> +	cat sparse_hint >>expect &&
> +	test_cmp expect stderr &&
> +
> +	test_must_fail git mv --sparse sub/file1 folder1 2>stderr &&
> +	echo "fatal: destination exists in the index, source=sub/file1, destination=folder1/file1" \
> +	>expect &&
> +	test_cmp expect stderr &&
> +
> +	git mv --sparse -f sub/file1 folder1 2>stderr &&
> +	test_must_be_empty stderr &&
> +
> +	test_path_is_missing sub/file1 &&
> +	test_path_is_missing folder1/file1 &&
> +	git ls-files -t >actual &&
> +	! grep "H sub/file1" actual &&
> +	grep "S folder1/file1" actual &&
> +
> +	# compare file content before move and after move
> +	echo "sub/file1 overwrite" >expect &&
> +	git ls-files -s -- folder1/file1 | awk "{print \$2}" >oid &&
> +	git cat-file blob $(cat oid) >actual &&
> +	test_cmp expect actual
> +'
> +
> +test_expect_failure 'move dirty path from in-cone to out-of-cone' '
> +	test_when_finished "cleanup_sparse_checkout" &&
> +	setup_sparse_checkout &&
> +	echo "modified" >>sub/d &&
> +
> +	test_must_fail git mv sub/d folder1 2>stderr &&
> +	cat sparse_error_header >expect &&
> +	echo "folder1/d" >>expect &&
> +	cat sparse_hint >>expect &&
> +	test_cmp expect stderr &&
> +
> +	git mv --sparse sub/d folder1 2>stderr &&
> +
> +	test_path_is_missing sub/d &&
> +	test_path_is_file folder1/d &&
> +	git ls-files -t >actual &&
> +	! grep "^H sub/d\$" actual &&
> +	grep "H folder1/d" actual
> +'
> +
> +test_expect_failure 'move dir from in-cone to out-of-cone' '
> +	test_when_finished "cleanup_sparse_checkout" &&
> +	setup_sparse_checkout &&
> +
> +	test_must_fail git mv sub/dir folder1 2>stderr &&
> +	cat sparse_error_header >expect &&
> +	echo "folder1/dir/e" >>expect &&
> +	cat sparse_hint >>expect &&
> +	test_cmp expect stderr &&
> +
> +	git mv --sparse sub/dir folder1 2>stderr &&
> +	test_must_be_empty stderr &&
> +
> +	test_path_is_missing folder1 &&
> +	git ls-files -t >actual &&
> +	! grep "H sub/dir/e" actual &&
> +	grep "S folder1/dir/e" actual
> +'
> +
> +test_expect_failure 'move partially-dirty dir from in-cone to out-of-cone' '
> +	test_when_finished "cleanup_sparse_checkout" &&
> +	setup_sparse_checkout &&
> +	touch sub/dir/e2 sub/dir/e3 &&
> +	git add sub/dir/e2 sub/dir/e3 &&
> +	echo "modified" >>sub/dir/e2 &&
> +	echo "modified" >>sub/dir/e3 &&
> +
> +	test_must_fail git mv sub/dir folder1 2>stderr &&
> +	cat sparse_error_header >expect &&
> +	echo "folder1/dir/e" >>expect &&
> +	echo "folder1/dir/e2" >>expect &&
> +	echo "folder1/dir/e3" >>expect &&
> +	cat sparse_hint >>expect &&
> +	test_cmp expect stderr &&
> +
> +	git mv --sparse sub/dir folder1 2>stderr &&
> +
> +	test_path_is_missing folder1/dir/e &&
> +	test_path_is_file folder1/dir/e2 &&
> +	test_path_is_file folder1/dir/e3 &&
> +	git ls-files -t >actual &&
> +	! grep "H sub/dir/e" actual &&
> +	! grep "H sub/dir/e2" actual &&
> +	! grep "H sub/dir/e3" actual &&
> +	grep "S folder1/dir/e" actual &&
> +	grep "H folder1/dir/e2" actual &&
> +	grep "H folder1/dir/e3" actual
> +'
> +

There are two other test cases I'd be interested in seeing:

1. Move a (clean or dirty) in-cone source file to an out-of-cone destination
   *file*. For example:

	echo test >sub/dir/file1 && 
	git add sub/dir/file1 && 
	git mv --sparse sub/dir/file1 folder1/file1

   I'm assuming this should behave the same way as show in 'move clean path
   from in-cone to out-of-cone overwrite'. 

2. Move a (clean or dirty) in-cone source directory to an out-of-cone
   destination where one or more files in <src> overwrite files in <dst>.
   For example, something like:

	echo test >sub/dir/file1 &&
	git add sub/dir/file1 &&
	git mv --sparse sub/dir folder1

   I don't have a strong opinion on the behavior (does it fail the whole
   'mv' operation? move everything except the files that overwrite
   something?), but it would help to have it documented via test here.

>  test_done

