Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C941BC433EF
	for <git@archiver.kernel.org>; Tue, 22 Feb 2022 17:49:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbiBVRt0 (ORCPT <rfc822;git@archiver.kernel.org>);
        Tue, 22 Feb 2022 12:49:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231438AbiBVRtZ (ORCPT <rfc822;git@vger.kernel.org>);
        Tue, 22 Feb 2022 12:49:25 -0500
Received: from smtp.hosts.co.uk (smtp.hosts.co.uk [85.233.160.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA42015FC90
        for <git@vger.kernel.org>; Tue, 22 Feb 2022 09:48:59 -0800 (PST)
Received: from host-84-13-159-41.opaltelecom.net ([84.13.159.41] helo=[192.168.1.37])
        by smtp.hosts.co.uk with esmtpa (Exim)
        (envelope-from <philipoakley@iee.email>)
        id 1nMZHW-0008wU-3V;
        Tue, 22 Feb 2022 17:48:58 +0000
Message-ID: <c5197f9d-11eb-5f91-ce33-c196069dc2d8@iee.email>
Date:   Tue, 22 Feb 2022 17:48:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 2/2] rebase: `preserve` is also a pull option, tell dying
 users
Content-Language: en-GB
From:   Philip Oakley <philipoakley@iee.email>
To:     =?UTF-8?B?w4Z2YXIgQXJuZmrDtnLDsCBCamFybWFzb24=?= <avarab@gmail.com>,
        Philip Oakley via GitGitGadget <gitgitgadget@gmail.com>
Cc:     git@vger.kernel.org,
        Johannes Schindelin <johannes.schindelin@gmx.de>
References: <pull.1155.git.1645526016.gitgitgadget@gmail.com>
 <eb5871db95b12500cc0a6b8b0e3a82ed9e8fcfbd.1645526016.git.gitgitgadget@gmail.com>
 <220222.868ru27vtt.gmgdl@evledraar.gmail.com>
 <3e144b59-dce2-ce10-cd9b-eca92eee922c@iee.email>
In-Reply-To: <3e144b59-dce2-ce10-cd9b-eca92eee922c@iee.email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Hi Ævar,

On 22/02/2022 15:56, Philip Oakley wrote:
> On 22/02/2022 15:34, Ævar Arnfjörð Bjarmason wrote:
>> On Tue, Feb 22 2022, Philip Oakley via GitGitGadget wrote:
>>
>>> From: Philip Oakley <philipoakley@iee.email>
>>>
>>> The `--preserve-merges` option was removed by v2.35.0. However
>>> users may not be aware that it is also a Pull option, and it is
>>> still offered by major IDE vendors such as Visual Studio.
>>>
>>> Extend the `--preserve-merges` die message to direct users to
>>> this option and it's locations.
>>>
>>> Signed-off-by: Philip Oakley <philipoakley@iee.email>
>>> Signed-off-by: Johannes Schindelin <johannes.schindelin@gmx.de>
>>> ---
>>>  builtin/rebase.c | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/builtin/rebase.c b/builtin/rebase.c
>>> index 07221d0ae41..97f704bb297 100644
>>> --- a/builtin/rebase.c
>>> +++ b/builtin/rebase.c
>>> @@ -1205,7 +1205,10 @@ int cmd_rebase(int argc, const char **argv, const char *prefix)
>>>  			     builtin_rebase_usage, 0);
>>>  
>>>  	if (preserve_merges_selected)
>>> -		die(_("--preserve-merges was replaced by --rebase-merges"));
>>> +		die(_("--preserve-merges was replaced by --rebase-merges\n"
>>> +			"Also, check your `pull` configuration settings\n"
>>> +			"`git config --show-scope --show-origin --get-regexp 'pull.*'`\n"
>>> +			"which may also invoke this option."));
>> I may be missing some subtlety, but how is the user ever going to need
>> to check their config?
>>
>> After 52f1e82178e (pull: remove support for `--rebase=preserve`,
>> 2021-09-07) we:
>>
>>     $ git -c pull.rebase=preserve pull
>>     error: rebase.c:29: preserve: 'preserve' superseded by 'merges'
>>     fatal: builtin/pull.c:45: Invalid value for pull.rebase: preserve
>>
>> I.e. we'd error before this, and the "preserve_merges_selected" variable
>> being checked here is not affected by config, i.e. we only ever got to
>> this "via config" route if "pull" et al was invoking us.
>>
>> But now that command dies.
>>
>> If there is still a codepath where we call "rebase --preserve-merges" on
>> the basis of config that I've missed, shouldn't this die() be happening
>> there?
> Hi Ævar,
>
> The preserve merges is a pull config item, still supported by Visual
> Studio, so could easily be set for many users. When they click on the
> "Pull" menu and get the old die() fatal: message they won't know why
> this happened or how to resolve it. Hence the extra info.
>
> If the user was actually running a rebase command then, yes, they
> would/should be reasonably OK with the original error message telling
> them what was wrong with their command line. But a `git pull`?
> especially as the manual says nothing about preserve merges any more.
>
> If we are to remove a capability the `give up and die` messages should
> be helpful in the edge cases. The issue (needing to check the pull, as
> well as the rebase configs) has already shown on the git-users list. It
> took a while to workout how it all happened.
>
> Not sure if I've covered your concerns properly, but this is one of the
> places that can and warn the user.
>
>
I don't think that came out well. For this message, it's about reminding
users that they may *also* be using the `preserve` option within their
pull options, and not just within their rebase command's options.

A case of "don't use it here, and don't use it there either, please check".

Philip
