Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18323C433FE
	for <git@archiver.kernel.org>; Fri, 21 Oct 2022 21:52:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbiJUVwB (ORCPT <rfc822;git@archiver.kernel.org>);
        Fri, 21 Oct 2022 17:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiJUVwA (ORCPT <rfc822;git@vger.kernel.org>);
        Fri, 21 Oct 2022 17:52:00 -0400
Received: from siwi.pair.com (siwi.pair.com [209.68.5.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D1692A56AD
        for <git@vger.kernel.org>; Fri, 21 Oct 2022 14:51:59 -0700 (PDT)
Received: from siwi.pair.com (localhost [127.0.0.1])
        by siwi.pair.com (Postfix) with ESMTP id 8687BCA1255;
        Fri, 21 Oct 2022 17:51:58 -0400 (EDT)
Received: from jeffhost-mbp.local (162-238-212-202.lightspeed.rlghnc.sbcglobal.net [162.238.212.202])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by siwi.pair.com (Postfix) with ESMTPSA id 1F4D5CC8402;
        Fri, 21 Oct 2022 17:51:58 -0400 (EDT)
Subject: Re: [PATCH v3 7/8] trace2: add stopwatch timers
To:     Junio C Hamano <gitster@pobox.com>
Cc:     Jeff Hostetler via GitGitGadget <gitgitgadget@gmail.com>,
        git@vger.kernel.org,
        =?UTF-8?B?w4Z2YXIgQXJuZmrDtnLDsCBCamFybWFzb24=?= <avarab@gmail.com>,
        Derrick Stolee <derrickstolee@github.com>,
        Jeff Hostetler <jeffhost@microsoft.com>
References: <pull.1373.v2.git.1665600750.gitgitgadget@gmail.com>
 <pull.1373.v3.git.1666290489.gitgitgadget@gmail.com>
 <8e701109976777ad8fae1e0cd3908bb11a1fcf93.1666290489.git.gitgitgadget@gmail.com>
 <xmqq7d0us0o2.fsf@gitster.g>
 <b7860e10-b174-2fb2-53eb-568686a961c4@jeffhostetler.com>
 <xmqqy1taqkok.fsf@gitster.g>
From:   Jeff Hostetler <git@jeffhostetler.com>
Message-ID: <70d683e6-8a91-2752-360d-c13f7ab02604@jeffhostetler.com>
Date:   Fri, 21 Oct 2022 17:51:57 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <xmqqy1taqkok.fsf@gitster.g>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: mailmunge 3.09 on 209.68.5.199
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org



On 10/20/22 4:55 PM, Junio C Hamano wrote:
> Jeff Hostetler <git@jeffhostetler.com> writes:
> 
>> um, it never occurred to me to make it a macro with an arg.
> 
> Heh, that was what you responded with "good point" 6 hours ago ;-)

d'oh.  6 hours was way too many meetings ago.... :-)

Jeff
