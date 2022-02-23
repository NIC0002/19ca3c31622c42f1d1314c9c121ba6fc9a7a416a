Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C7DC433EF
	for <git@archiver.kernel.org>; Wed, 23 Feb 2022 10:36:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239621AbiBWKgi (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 23 Feb 2022 05:36:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236653AbiBWKgh (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 23 Feb 2022 05:36:37 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA444674D5
        for <git@vger.kernel.org>; Wed, 23 Feb 2022 02:36:09 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id s14so26036196edw.0
        for <git@vger.kernel.org>; Wed, 23 Feb 2022 02:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:references:user-agent:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=YRNG57VCHOFYOqi27BKcprEJjHfg2+UvsiM9mknCQzQ=;
        b=GbZ7w+Ly1vi0FumVFphKExiMvmCHaCJ+Ghk5exaxEFRtuUygAP/AtzF5ckV25jWBkN
         v1s5l14rKScDsDw8GyrJ+Q6Kdvx2pYts1FKX1W0WLf4WXdYtGx3R/HeKqYZ74gkC0f4D
         JEUjASQYKcfIQPaiyp1BvfdCx/neoldAbTcmrzT6fu0dOPAruY4IxRetJrlMzpjZ1tz9
         XJPD1NpfkOdAufGXG6ETYc+T5Lja7A7vNJmFmrkYQV0+FjwuHB5ixKU52tf/080Hu7Ug
         6RW8BcOldyWHseU2shCuVSBYBEy9mynpljquBEzdFgGXXWMf1ZgKPrD15U+Yb0DPnjCw
         no2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:references:user-agent
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=YRNG57VCHOFYOqi27BKcprEJjHfg2+UvsiM9mknCQzQ=;
        b=VrXmAPV0kaJlEOH1epu/bSsjE53Gaz45nvqI9juzHDpIzjgEVPpyneV+9ON/zFbeXG
         T+NjnWhUxcWDUdo0xhPg7XeQR1cr91ZI3Aov1A2AUrBW4U/Q9V350Gu1gK3kR1wrQfyu
         1UrxTTTn3TtTRrS4u+6JhAZP9iZA4MIcjZH+kyNJ5fucVHMkh8Owr7O6Igh2eYCjL16O
         1Ylz8Nsr8/ICF6HFrxwT/m+OZ2Af2AYEav8+C+D4z6161lhdmlezLZfQU2WIZgst1Mtn
         01kG3C5+1IiTDzPMRNMa4Tz+Qj77eeW6/wwSMyHJYn0AJIIZmstAMDPwKxWKTOl/PbyD
         u5HQ==
X-Gm-Message-State: AOAM530oax4q8DPobSPTX6LIGf/tVR3oReDWKhDzRCKR1ujRkauFOi3T
        Lvgw5S34tcrmIMoKqpoUcuk=
X-Google-Smtp-Source: ABdhPJyNuhZI9dDfBCifwT1LBgMhc9/BaPiLWKBZN8rN2jp1L3Y6daQb4JKmNQFv4EC9h0XHqp0RHA==
X-Received: by 2002:aa7:ca19:0:b0:409:9cf0:50d4 with SMTP id y25-20020aa7ca19000000b004099cf050d4mr30707749eds.305.1645612568156;
        Wed, 23 Feb 2022 02:36:08 -0800 (PST)
Received: from gmgdl (j120189.upc-j.chello.nl. [24.132.120.189])
        by smtp.gmail.com with ESMTPSA id c6sm7201479ejs.130.2022.02.23.02.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 02:36:07 -0800 (PST)
Received: from avar by gmgdl with local (Exim 4.95)
        (envelope-from <avarab@gmail.com>)
        id 1nMp09-006GPQ-NT;
        Wed, 23 Feb 2022 11:36:05 +0100
From:   =?utf-8?B?w4Z2YXIgQXJuZmrDtnLDsA==?= Bjarmason <avarab@gmail.com>
To:     Philip Oakley <philipoakley@iee.email>
Cc:     Philip Oakley via GitGitGadget <gitgitgadget@gmail.com>,
        git@vger.kernel.org,
        Johannes Schindelin <johannes.schindelin@gmx.de>
Subject: Re: [PATCH 2/2] rebase: `preserve` is also a pull option, tell
 dying users
Date:   Wed, 23 Feb 2022 11:27:32 +0100
References: <pull.1155.git.1645526016.gitgitgadget@gmail.com>
 <eb5871db95b12500cc0a6b8b0e3a82ed9e8fcfbd.1645526016.git.gitgitgadget@gmail.com>
 <220222.868ru27vtt.gmgdl@evledraar.gmail.com>
 <3e144b59-dce2-ce10-cd9b-eca92eee922c@iee.email>
 <c5197f9d-11eb-5f91-ce33-c196069dc2d8@iee.email>
User-agent: Debian GNU/Linux bookworm/sid; Emacs 27.1; mu4e 1.6.10
In-reply-to: <c5197f9d-11eb-5f91-ce33-c196069dc2d8@iee.email>
Message-ID: <220223.86mtih6fai.gmgdl@evledraar.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org


On Tue, Feb 22 2022, Philip Oakley wrote:

> Hi =C3=86var,
>
> On 22/02/2022 15:56, Philip Oakley wrote:
>> On 22/02/2022 15:34, =C3=86var Arnfj=C3=B6r=C3=B0 Bjarmason wrote:
>>> On Tue, Feb 22 2022, Philip Oakley via GitGitGadget wrote:
>>>
>>>> From: Philip Oakley <philipoakley@iee.email>
>>>>
>>>> The `--preserve-merges` option was removed by v2.35.0. However
>>>> users may not be aware that it is also a Pull option, and it is
>>>> still offered by major IDE vendors such as Visual Studio.
>>>>
>>>> Extend the `--preserve-merges` die message to direct users to
>>>> this option and it's locations.
>>>>
>>>> Signed-off-by: Philip Oakley <philipoakley@iee.email>
>>>> Signed-off-by: Johannes Schindelin <johannes.schindelin@gmx.de>
>>>> ---
>>>>  builtin/rebase.c | 5 ++++-
>>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/builtin/rebase.c b/builtin/rebase.c
>>>> index 07221d0ae41..97f704bb297 100644
>>>> --- a/builtin/rebase.c
>>>> +++ b/builtin/rebase.c
>>>> @@ -1205,7 +1205,10 @@ int cmd_rebase(int argc, const char **argv, con=
st char *prefix)
>>>>  			     builtin_rebase_usage, 0);
>>>>=20=20
>>>>  	if (preserve_merges_selected)
>>>> -		die(_("--preserve-merges was replaced by --rebase-merges"));
>>>> +		die(_("--preserve-merges was replaced by --rebase-merges\n"
>>>> +			"Also, check your `pull` configuration settings\n"
>>>> +			"`git config --show-scope --show-origin --get-regexp 'pull.*'`\n"
>>>> +			"which may also invoke this option."));
>>> I may be missing some subtlety, but how is the user ever going to need
>>> to check their config?
>>>
>>> After 52f1e82178e (pull: remove support for `--rebase=3Dpreserve`,
>>> 2021-09-07) we:
>>>
>>>     $ git -c pull.rebase=3Dpreserve pull
>>>     error: rebase.c:29: preserve: 'preserve' superseded by 'merges'
>>>     fatal: builtin/pull.c:45: Invalid value for pull.rebase: preserve
>>>
>>> I.e. we'd error before this, and the "preserve_merges_selected" variable
>>> being checked here is not affected by config, i.e. we only ever got to
>>> this "via config" route if "pull" et al was invoking us.
>>>
>>> But now that command dies.
>>>
>>> If there is still a codepath where we call "rebase --preserve-merges" on
>>> the basis of config that I've missed, shouldn't this die() be happening
>>> there?
>> Hi =C3=86var,
>>
>> The preserve merges is a pull config item, still supported by Visual
>> Studio, so could easily be set for many users. When they click on the
>> "Pull" menu and get the old die() fatal: message they won't know why
>> this happened or how to resolve it. Hence the extra info.
>>
>> If the user was actually running a rebase command then, yes, they
>> would/should be reasonably OK with the original error message telling
>> them what was wrong with their command line. But a `git pull`?
>> especially as the manual says nothing about preserve merges any more.
>>
>> If we are to remove a capability the `give up and die` messages should
>> be helpful in the edge cases. The issue (needing to check the pull, as
>> well as the rebase configs) has already shown on the git-users list. It
>> took a while to workout how it all happened.
>>
>> Not sure if I've covered your concerns properly, but this is one of the
>> places that can and warn the user.
>>
>>
> I don't think that came out well. For this message, it's about reminding
> users that they may *also* be using the `preserve` option within their
> pull options, and not just within their rebase command's options.
>
> A case of "don't use it here, and don't use it there either, please check=
".

I see. What I was confused with (and still find confusing) is that the
error here says "[and the pull.rebase=3Dpreserve config] may also invoke
this option".

But it doesn't do that at all, it *used to*, but now "git pull" will
promptly fail on it as well.

So this is really just trying to tell us something like this, right?

    Hey, you invoked --preserve-merges, bad mojo! Also: if you invoke
    'git pull' and used the related config you may or may not have used,
    that'll die too. So maybe check that out?

:)

Anyway, to the user the "invoke this option" isn't strictly accurate,
but they probably don't care/know the difference, so I don't mind
per-se, I was just wondering if I was missing something.

I do wonder if this part is needed at all. I.e. at this point this will
only benefit users who are *manually* invoking "git rebase
--preserve-merges", everyone else (including that "VS" example you
mentioned) will go through "git pull" and see the other error.

IOW maybe just saying "this option is an error now" when we intercept
the option is enough, and ditto for "this config is an error now" when
we intercept the config, and not assume that a user using the option
must also be using the config is simpler/sufficient.

Just my 0.02. For my part whahtever you decide to do here is fine by me,
I was just wondering if I'd misundestood the whole flow around this
legacy option and how we invoke the small parts of die() boilerplate
left of it.
