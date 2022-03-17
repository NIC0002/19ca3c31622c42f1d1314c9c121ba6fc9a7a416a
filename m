Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 018F8C433EF
	for <git@archiver.kernel.org>; Thu, 17 Mar 2022 15:34:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235918AbiCQPgH (ORCPT <rfc822;git@archiver.kernel.org>);
        Thu, 17 Mar 2022 11:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234055AbiCQPgG (ORCPT <rfc822;git@vger.kernel.org>);
        Thu, 17 Mar 2022 11:36:06 -0400
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455641817B6
        for <git@vger.kernel.org>; Thu, 17 Mar 2022 08:34:50 -0700 (PDT)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id 563BE128094;
        Thu, 17 Mar 2022 11:34:49 -0400 (EDT)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
        :subject:references:date:in-reply-to:message-id:mime-version
        :content-type:content-transfer-encoding; s=sasl; bh=HVOysu6m3D+m
        7oge3XLKj5iUBm8QpQ/WOVTAdjjqzis=; b=cMOUbnEI7hvH2ZY2KY4ALdlbhv+W
        xyeHYoQdq6NYSIwpi4Wog/8KoIqcYSNL3IthkkfJgCrM00NfAnjtZroLGxWil9YR
        w3H+rsk3EfVr/O4Til2n40herlGKefjtaoy2Zg1SLfQ8cN526MdLho+qUXFmulPa
        H+iHYL3PPNBE6xI=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id 4DA66128093;
        Thu, 17 Mar 2022 11:34:49 -0400 (EDT)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [34.82.80.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp2.pobox.com (Postfix) with ESMTPSA id A3B2A128092;
        Thu, 17 Mar 2022 11:34:48 -0400 (EDT)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     =?utf-8?B?w4Z2YXIgQXJuZmrDtnLDsA==?= Bjarmason <avarab@gmail.com>
Cc:     John Cai via GitGitGadget <gitgitgadget@gmail.com>,
        git@vger.kernel.org, Phillip Wood <phillip.wood123@gmail.com>,
        John Cai <johncai86@gmail.com>
Subject: Re: [PATCH v3 2/2] rebase: set REF_HEAD_DETACH in
 checkout_up_to_date()
References: <pull.1226.v2.git.git.1647019492.gitgitgadget@gmail.com>
        <pull.1226.v3.git.git.1647487001.gitgitgadget@gmail.com>
        <bd1c9537ffc503707690ed173b9e6e808d58ce5d.1647487001.git.gitgitgadget@gmail.com>
        <220317.86r170d6zs.gmgdl@evledraar.gmail.com>
Date:   Thu, 17 Mar 2022 08:34:47 -0700
In-Reply-To: <220317.86r170d6zs.gmgdl@evledraar.gmail.com> (=?utf-8?B?IsOG?=
 =?utf-8?B?dmFyIEFybmZqw7Zyw7A=?=
        Bjarmason"'s message of "Thu, 17 Mar 2022 14:42:53 +0100")
Message-ID: <xmqqy218h9t4.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-Pobox-Relay-ID: C7B12494-A607-11EC-A43C-CB998F0A682E-77302942!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

=C3=86var Arnfj=C3=B6r=C3=B0 Bjarmason <avarab@gmail.com> writes:

>> @@ -827,8 +827,11 @@ static int checkout_up_to_date(struct rebase_opti=
ons *options)
>>  		    getenv(GIT_REFLOG_ACTION_ENVIRONMENT),
>>  		    options->switch_to);
>>  	ropts.oid =3D &options->orig_head;
>> -	ropts.branch =3D options->head_name;
>>  	ropts.flags =3D RESET_HEAD_RUN_POST_CHECKOUT_HOOK;
>> +	if (options->head_name)
>> +		ropts.branch =3D options->head_name;
>> +	else
>> +		ropts.flags |=3D  RESET_HEAD_DETACH;
>>  	ropts.head_msg =3D buf.buf;
>>  	if (reset_head(the_repository, &ropts) < 0)
>>  		ret =3D error(_("could not switch to %s"), options->switch_to);
>
> In this case a smaller change of:
>
>     if (!ropts.branch)
> 		ropts.flags |=3D  RESET_HEAD_DETACH;
>
> will do the same.

Thanks.  That is much easier to read and simpler to follow.

> I wonder if just converting it to a designated initializer while we're
> at it (or a pre-cleanup commit) would be better, i.e.:

I do not think it easier to follow than even the original or the
improvement above, especially the part that computes .flags member.
