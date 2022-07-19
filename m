Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0046DC43334
	for <git@archiver.kernel.org>; Tue, 19 Jul 2022 16:48:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234519AbiGSQr7 (ORCPT <rfc822;git@archiver.kernel.org>);
        Tue, 19 Jul 2022 12:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234207AbiGSQr4 (ORCPT <rfc822;git@vger.kernel.org>);
        Tue, 19 Jul 2022 12:47:56 -0400
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E45257262
        for <git@vger.kernel.org>; Tue, 19 Jul 2022 09:47:55 -0700 (PDT)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id 81F9812508D;
        Tue, 19 Jul 2022 12:47:54 -0400 (EDT)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
        :subject:references:date:in-reply-to:message-id:mime-version
        :content-type:content-transfer-encoding; s=sasl; bh=dJSeVnbdmxVj
        slknXgCcguBh/J7Eg8ocE3Bjn3IV7pY=; b=tvkoQqKqTZe5k/nJcSOuhOEx58xk
        BNrc08jmgxST3QMQhm2ZPZL2JUFaEaQyEOYQdEJ1yUDQfqIAkMDXPSrnOD7GCbzJ
        gN/AENAio1NijQe+ZLIrkrotaadeoUM4BeB7qq9AmfS0fIBRo2s1ufkCQ67GgUB+
        Sv4ZgdHbJF4EySY=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id 7595112508B;
        Tue, 19 Jul 2022 12:47:54 -0400 (EDT)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [34.83.92.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp2.pobox.com (Postfix) with ESMTPSA id CFDF612508A;
        Tue, 19 Jul 2022 12:47:53 -0400 (EDT)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     ZheNing Hu <adlternative@gmail.com>
Cc:     =?utf-8?B?w4Z2YXIgQXJuZmrDtnLDsA==?= Bjarmason <avarab@gmail.com>,
        ZheNing Hu via GitGitGadget <gitgitgadget@gmail.com>,
        Git List <git@vger.kernel.org>,
        Christian Couder <christian.couder@gmail.com>,
        Phillip Wood <phillip.wood123@gmail.com>,
        Torsten =?utf-8?Q?B=C3=B6gershausen?= <tboegi@web.de>
Subject: Re: [PATCH v7] ls-files: introduce "--format" option
References: <pull.1262.v6.git.1657558435532.gitgitgadget@gmail.com>
        <pull.1262.v7.git.1657692472994.gitgitgadget@gmail.com>
        <220718.86pmi2ygbt.gmgdl@evledraar.gmail.com>
        <CAOLTT8R_=hmwDab1Tq+qy1vXUZ4C1z6+9xTyR8WSzQ=JOBnhjg@mail.gmail.com>
Date:   Tue, 19 Jul 2022 09:47:52 -0700
In-Reply-To: <CAOLTT8R_=hmwDab1Tq+qy1vXUZ4C1z6+9xTyR8WSzQ=JOBnhjg@mail.gmail.com>
        (ZheNing Hu's message of "Wed, 20 Jul 2022 00:19:36 +0800")
Message-ID: <xmqqh73daw1z.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-Pobox-Relay-ID: 88B073E4-0782-11ED-88E5-CB998F0A682E-77302942!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

ZheNing Hu <adlternative@gmail.com> writes:

> =C3=86var Arnfj=C3=B6r=C3=B0 Bjarmason <avarab@gmail.com> =E4=BA=8E2022=
=E5=B9=B47=E6=9C=8818=E6=97=A5=E5=91=A8=E4=B8=80 16:29=E5=86=99=E9=81=93=EF=
=BC=9A
>>
>>
>> On Wed, Jul 13 2022, ZheNing Hu via GitGitGadget wrote:
>>
>> > +test_expect_success 'setup' '
>> > +     printf "LINEONE\nLINETWO\nLINETHREE\n" >o1.txt &&
>> > +     printf "LINEONE\r\nLINETWO\r\nLINETHREE\r\n" >o2.txt &&
>> > +     printf "LINEONE\r\nLINETWO\nLINETHREE\n" >o3.txt &&
>>
>> If you want to do this sort of thing in general this pattern is better=
:
>>
>>         x=3D"a b c" &&
>>         printf "%s\n" $x
>>         printf "%s\r\n" $x
>>
>
> Let see what's these cmd output:
>
> x=3D"a b c" &&
> printf "%s\n" $x &&
> printf "%s\r\n" $x
>
> a b c
> a b c

The above makes it look as if your shell is broken or you have an
unusual IFS that does not have space in it.  Are you sure you did
not place anything around $x on the second and the third line, which
is given to printf after its contents split into words at $IFS?
