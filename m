Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02214C4332F
	for <git@archiver.kernel.org>; Sat, 31 Dec 2022 00:25:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235818AbiLaAZt convert rfc822-to-8bit (ORCPT
        <rfc822;git@archiver.kernel.org>); Fri, 30 Dec 2022 19:25:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235760AbiLaAZs (ORCPT <rfc822;git@vger.kernel.org>);
        Fri, 30 Dec 2022 19:25:48 -0500
Received: from elephants.elehost.com (elephants.elehost.com [216.66.27.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7681B82
        for <git@vger.kernel.org>; Fri, 30 Dec 2022 16:25:46 -0800 (PST)
Received: from Mazikeen (cpebc4dfb928313-cmbc4dfb928310.cpe.net.cable.rogers.com [99.228.251.108] (may be forged))
        (authenticated bits=0)
        by elephants.elehost.com (8.16.1/8.16.1) with ESMTPSA id 2BV0Pi40018600
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 30 Dec 2022 19:25:45 -0500 (EST)
        (envelope-from rsbecker@nexbridge.com)
Reply-To: <rsbecker@nexbridge.com>
From:   <rsbecker@nexbridge.com>
To:     "'Samuel Wales'" <samologist@gmail.com>, <git@vger.kernel.org>
References: <CAJcAo8tjMLFisK5_13iD_JGo2xVQDJRX3wAC7wRD_V2GKFGevQ@mail.gmail.com>
In-Reply-To: <CAJcAo8tjMLFisK5_13iD_JGo2xVQDJRX3wAC7wRD_V2GKFGevQ@mail.gmail.com>
Subject: RE: is this data corruption?
Date:   Fri, 30 Dec 2022 19:25:39 -0500
Organization: Nexbridge Inc.
Message-ID: <000701d91cae$6c8cbbf0$45a633d0$@nexbridge.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-ca
Thread-Index: AQJfTdAf9wTtVvgxX7DGtZat0jQBW616wCVA
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

On December 30, 2022 7:18 PM, Samuel Wales wrote:
>i am not subscribed, but am of the impression that's ok.  please copy me directly.
>
>
>tldr: git diff is showing differences that do not exist in the files themselves.
>
>i have nothing staged, nothing fancy like stashing, etc.  this is a repo of mostly
>emacs org mode files.  mostly ascii text.
>
>git status and these commands show nothing unusual:
>
>    git fsck --strict --no-dangling
>    git gc --prune="0 days"
>
>
>the problem that seems like data corruption is that a few lines appear twice as -
>and once as +.  but in the current version of the files, those lines exist only once.
>here are the lines.  there are 2 - versions and one + version:
>
>+***************** REF bigpart is a partition biglike and homelike are
>+distracting nonsense i think except to describe inferior filesets.
>+anomalous subset of home might be called homelike or so.
>
>
>emacs magit shows the same problem.  however, it shows a slightly different diff.
>i did a meta-diff on git diff vs. magit, and there are about 800 + real-content lines
>that magit shows but git diff does not.  i do not know what this means.  wc -l is like
>
>  62540 aaa.diff
>  62965 bbb--magit.txt
>
>idk why a diff would be different with only + lines being different?
>
>
>in summary, what is wrong with my repo, if anything, and what can i do about it?
>nothing on the web for git corruption seems to say much, other than pull from
>github or whatever.  this is my own repo, the original repo, so i cannot do that.  org
>annex has an uncorrupt tool of some kind, but it did not seem relevant.  i do have
>rsnapshot [basically rsync] backups of the repo and the most significant files and
>dirs, but i do not know what one does to use that to repair any issues.  i won't get
>into why, but changes were made over months.
>
>is there a protocol for this?
>
>would git fsck have balked?
>
>thank you!
>
>
>p.s.
>
>i have no reason to believe this is related, but git diff has intermingled emacs org
>mode entries.  but i don't have to talk about it in org terms; in generic text terms, it
>has intermingled parts of different paragraphs.  as a user, i'd prefer that
>completely unrelated paragraphs not be mingled, regardless of minimality.  if
>possible.
>
>with respect to the intermingling only, unless this is related to the possible
>corruption, i will presume the diff is correct, in that a patch from it would produce
>the same result as a patch that does not intermingle.  i believe this intermingling is
>because diff does not understand org, or paragraphs for that matter.  in org, an
>entry starts with "^[*]+ " and ends at the beginning of another entry or at eof.
>they consist in my case mostly of ascii text paragraphs.  just as with paragraphs, if
>you move an entry, you don't expect it to be mingled with a different one in the
>diff.
>
>i have been told that this cannot be fixed by merely telling a slightly improved
>differ that stuff between stars is worth preserving, but that a parser, not merely a
>couple of regexps, is needed to reduce this intermingling.  i have also been told
>that difftastic uses tree-sitter, which might get such a syntax for emacs org mode.
>and so maybe at some point git diff can use that.  idk.
>
>idk if any of this is related but i include it for completeness.
>
>also, please don't laugh, but i am using git version 2.11.0.  i will upgrade pending
>various library and os stuff but my main concern is not for git, but for possible
>corruption in the repo and what is possible to do, at least given rsnapshot, to fix it.

I cannot account for your emacs issues, but have a question. Have you done any git add operations? Git diff is subject to what specifically is staged. So you might be comparing your file with partially staged content that could account for partial diffs. See if diff --cached makes a difference. Also try different algorithms, like --patience or --diff-algorithm=histogram.

--Randall

