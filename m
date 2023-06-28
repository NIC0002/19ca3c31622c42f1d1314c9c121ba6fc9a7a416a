Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E698EB64DC
	for <git@archiver.kernel.org>; Wed, 28 Jun 2023 09:25:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231366AbjF1JYz (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 28 Jun 2023 05:24:55 -0400
Received: from bsmtp5.bon.at ([195.3.86.187]:53304 "EHLO bsmtp5.bon.at"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233041AbjF1JCy (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 28 Jun 2023 05:02:54 -0400
Received: from bsmtp2.bon.at (unknown [192.168.181.105])
        by bsmtp5.bon.at (Postfix) with ESMTPS id 4QrWQ65vWxz5v3w
        for <git@vger.kernel.org>; Wed, 28 Jun 2023 08:09:50 +0200 (CEST)
Received: from [192.168.0.98] (unknown [93.83.142.38])
        by bsmtp2.bon.at (Postfix) with ESMTPSA id 4QrWPX4SFvz5tlD;
        Wed, 28 Jun 2023 08:09:20 +0200 (CEST)
Message-ID: <0cb94aa5-726f-a57f-858c-b29764c63ce7@kdbg.org>
Date:   Wed, 28 Jun 2023 08:09:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/9] gitk: improve keyboard support
Content-Language: en-US
To:     Jens Lidestrom via GitGitGadget <gitgitgadget@gmail.com>
Cc:     "Paul Mackerras [ ]" <paulus@ozlabs.org>,
        Jens Lidestrom <jens@lidestrom.se>, git@vger.kernel.org
References: <pull.1551.git.1687876884.gitgitgadget@gmail.com>
From:   Johannes Sixt <j6t@kdbg.org>
In-Reply-To: <pull.1551.git.1687876884.gitgitgadget@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Am 27.06.23 um 16:41 schrieb Jens Lidestrom via GitGitGadget:
> It is often convenient to use the keyboard to navigate the gitk GUI and
> there are keyboard shortcut bindings for many operations such as searching
> and scrolling. There is however no keyboard binding for the most common
> operations on branches and commits: Check out, reset, cherry-pick, create
> and delete branches.
> 
> This PR adds keyboard bindings for these 5 commands. It also adjusts some
> GUI focus defaults to simplify keyboard navigation.
> 
> Some refactoring of the command implementation has been necessary.
> Originally the commands was using the mouse context menu to get info about
> the head and commit to act on. When using keyboard binds this information
> isn't available so instead the row that is selected in the GUI is used. By
> adding procedures for doing this the PR lays the groundwork for more similar
> keyboard binds in the future.

I like it when an application can be navigated with the keyboard. These
changes are very much appreciated.

I've left some comments on individual commits. The important one is that
I think it makes the Reset dialog way too easy to destroy uncommitted work.

Please note that gitk-git directory is in its own repository that is
only subtree-merged into the Git repository. You should generate patches
against git://git.ozlabs.org/~paulus/gitk (I don't know how difficult it
would be for Paul to integrate patches that were generated by gitgitgadget).

-- Hannes

> 
> I'm including Paul Mackerras because he seems to be the maintainer of gitk.
> Can you review, Paul?
> 
> Jens Lidestrom (9):
>   gitk: add procedures to get commit info from selected row
>   gitk: use term "current branch" in gui
>   gitk: add keyboard bind for reset
>   gitk: show branch name in reset dialog
>   gitk: add keyboard bind for checkout
>   gitk: add keyboard bind for create and remove branch
>   gitk: add keyboard bind to cherry-pick
>   gitk: focus ok button in reset dialog
>   gitk: default select reset hard in dialog
> 
>  gitk-git/gitk | 132 ++++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 96 insertions(+), 36 deletions(-)
> 
> 
> base-commit: 94486b6763c29144c60932829a65fec0597e17b3
> Published-As: https://github.com/gitgitgadget/git/releases/tag/pr-1551%2Fjensli%2Fkeyboard-for-gitk-v1
> Fetch-It-Via: git fetch https://github.com/gitgitgadget/git pr-1551/jensli/keyboard-for-gitk-v1
> Pull-Request: https://github.com/gitgitgadget/git/pull/1551

