Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24103C433EF
	for <git@archiver.kernel.org>; Mon,  7 Mar 2022 18:15:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240088AbiCGSQ1 (ORCPT <rfc822;git@archiver.kernel.org>);
        Mon, 7 Mar 2022 13:16:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235031AbiCGSQY (ORCPT <rfc822;git@vger.kernel.org>);
        Mon, 7 Mar 2022 13:16:24 -0500
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D8832EF9
        for <git@vger.kernel.org>; Mon,  7 Mar 2022 10:15:29 -0800 (PST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
        by pb-smtp20.pobox.com (Postfix) with ESMTP id BEABF19103C;
        Mon,  7 Mar 2022 13:15:28 -0500 (EST)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
        :subject:references:date:in-reply-to:message-id:mime-version
        :content-type; s=sasl; bh=MYWkxYDy8nlV12ZlVCU8N+hhcuzVgYd6DUXlr4
        HsoOM=; b=jEb9zwhEcnYAz20p7fdJSAe1QUfYn+31FLi1bwHsJDB6tfAEWJ1SsX
        Ox0ndCqnCemDZXfvelnjALi5gT607U4K1P5FBJnMEpxWiN77UxWm87FOXFPV3hSg
        2yVkJ7deL7mZ/ezlt4BXx8vCUtoUdtRjN60DM5gpf+yzKXzYLSMxo=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp20.pobox.com (Postfix) with ESMTP id A19DD19103B;
        Mon,  7 Mar 2022 13:15:28 -0500 (EST)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [35.230.65.123])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp20.pobox.com (Postfix) with ESMTPSA id EC99019103A;
        Mon,  7 Mar 2022 13:15:24 -0500 (EST)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     Tao Klerks <tao@klerks.biz>
Cc:     git <git@vger.kernel.org>,
        =?utf-8?B?w4Z2YXIgQXJuZmrDtnLDsA==?= Bjarmason <avarab@gmail.com>,
        Jeff Hostetler <git@jeffhostetler.com>
Subject: Re: [PATCH v3 0/2] Reduce explicit sleep calls in t7063 untracked
 cache tests
References: <pull.1166.v2.git.1646127910.gitgitgadget@gmail.com>
        <pull.1166.v3.git.1646201124.gitgitgadget@gmail.com>
        <CAPMMpogoVzHBh8j4GZG-tRpAxap4wY+hAray5V_QUcaNpf7dEQ@mail.gmail.com>
        <xmqqv8wqvj54.fsf@gitster.g>
        <CAPMMpojOrnSRQgA51+O7wfc3tGFO8w9mtejw8i8h1MoA5WvS5Q@mail.gmail.com>
Date:   Mon, 07 Mar 2022 10:15:24 -0800
In-Reply-To: <CAPMMpojOrnSRQgA51+O7wfc3tGFO8w9mtejw8i8h1MoA5WvS5Q@mail.gmail.com>
        (Tao Klerks's message of "Mon, 7 Mar 2022 06:37:02 +0100")
Message-ID: <xmqqlexlsk77.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID: 8F3D8C00-9E42-11EC-A738-C85A9F429DF0-77302942!pb-smtp20.pobox.com
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Tao Klerks <tao@klerks.biz> writes:

> On Sun, Mar 6, 2022 at 10:57 PM Junio C Hamano <gitster@pobox.com> wrote:
>>
>> Tao Klerks <tao@klerks.biz> writes:
>>
>> > I see that in the latest "what's coming" update, this patch series is
>> > listed as expecting reroll, but as far as I can see there have been no
>> > comments since I sent this V3 out.
>>
>> I see <v2> reference on the source: line for that topic in the
>> "What's cooking" report you are referring to, so I suspect I have
>> been too busy and haven't got around to replacing it with <v3>,
>> perhaps?
>>
> Eek, my apologies. I will remember to check that!

No need to apologize.

It often happens that I forget to update the status of a series
after a new iteration replaces the old one when sending out a new
issue of the "What's cooking" report.  It is very much appreciated
to be watchful and report such mistakes when you notice it.

This time, it turns out that what happened was that I updated the
"What's cooking" report and sent it out, and then continued working
for the rest of the day to queue new topics and replace existing
ones.  And when you pinged me, I already had <v3> queued.

To me, judging from the exchanges between you and Jeff Hostetler,
the topic at v3 seems to be ready for 'next', so let me mark it as
such in the draft of the next issue of "What's cooking" I keep
locally.

Thanks.




