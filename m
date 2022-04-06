Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C28EC433EF
	for <git@archiver.kernel.org>; Wed,  6 Apr 2022 17:49:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239422AbiDFRvp (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 6 Apr 2022 13:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239468AbiDFRvZ (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 6 Apr 2022 13:51:25 -0400
Received: from elephants.elehost.com (elephants.elehost.com [216.66.27.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D7A211EC9
        for <git@vger.kernel.org>; Wed,  6 Apr 2022 09:23:17 -0700 (PDT)
Received: from Mazikeen (cpe788df74d2cc1-cm788df74d2cc0.cpe.net.cable.rogers.com [72.138.27.250] (may be forged))
        (authenticated bits=0)
        by elephants.elehost.com (8.16.1/8.16.1) with ESMTPSA id 236GNEcq043513
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 6 Apr 2022 12:23:15 -0400 (EDT)
        (envelope-from rsbecker@nexbridge.com)
Reply-To: <rsbecker@nexbridge.com>
From:   <rsbecker@nexbridge.com>
To:     "'Junio C Hamano'" <gitster@pobox.com>
Cc:     "'Git Mailing List'" <git@vger.kernel.org>,
        <git-packagers@googlegroups.com>
References: <034101d84873$993f96f0$cbbec4d0$@nexbridge.com>     <CAPc5daWSDYSexkSeUUpfYDyT-M_F8d-rSMko5pqw140iLwBc_w@mail.gmail.com>    <034701d84875$030bfb40$0923f1c0$@nexbridge.com> <xmqqv8vmyysp.fsf@gitster.g>
In-Reply-To: <xmqqv8vmyysp.fsf@gitster.g>
Subject: RE: [ANNOUNCE] Git v2.36.0-rc0 - Build failure on NonStops
Date:   Wed, 6 Apr 2022 12:23:09 -0400
Organization: Nexbridge Inc.
Message-ID: <046001d849d2$9daf2290$d90d67b0$@nexbridge.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQE87yXqDmaysdJkpyH6/spM26GbOgJ005kMAt5RIzwBs7vyta3hjcLw
Content-Language: en-ca
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

On April 6, 2022 12:14 PM, Junio C Hamano wrote:
><rsbecker@nexbridge.com> writes:
>
>> On April 4, 2022 6:33 PM, Junio C Hamano wrote:
>>>To: Randall S. Becker <rsbecker@nexbridge.com>
>>>Cc: Git Mailing List <git@vger.kernel.org>;
>>>git-packagers@googlegroups.com
>>>Subject: Re: [ANNOUNCE] Git v2.36.0-rc0 - Build failure on NonStops
>>>
>>>CSPRNG_METHOD?
>>
>> We already have
>>
>>         CSPRNG_METHOD = openssl
>>
>> In the config for NonStop. Should that not have worked?
>
>In your original report, you said
>
>>> I thought we did not have a direct reference to OpenSSL. What do I
>>> need here to resolve this?
>
>I misread it as "I did not directly ask to use OpenSSL---why am I seeing
breakage
>from RAND_bytes() that is an OpenSSL thing?", and where my suggestion to
look
>for CSPRNG_METHOD came from.
>
>Downthread, folks seem to have figured out that OpenSSL support failed to
>include a necessary header and link with libraries, while I was offline
yesterday, so
>hopefully all is well?
>
>Since d073bdc6 (Merge branch 'bc/csprng-mktemps', 2022-02-11) the CSPRNG
>code has been in 'master/main' and the topic was merged to 'next' much
earlier,
>at 2e32375c (Merge branch 'bc/csprng-mktemps'
>into next, 2022-02-04).  I was puzzled why it took this long for your
report to come,
>as I somehow thought you've been quite good at reporting portability issues
to
>your platform quickly, and was wondering if we broke something between the
>time we merged it to 'next' and -rc0, but it seems that it was not working
from the
>beginning X-<.

I have no explanation on why this and the PATH issue showed up at 2.36.0-rc0
and not at 2.35.1. 2.35.0. Our build/test cycles are thorough but only on
the releases and rc* notices because it takes 50+ hours to run the whole
test cycle. The CSPRNG_METHOD was already set in the platform config, so we
did not have to change that. wrapper.c had an issue that was missing the
required includes on more than just our platform - adding that in did help.
t6200 did not previously fail but we are looking into whether an OpenSSH
install caused that. I think we will have to selectively modify the path in
config.mak.uname for each build going forward for tests to pass.

I am sorry that I do not have better or more clear info.
--Randall

