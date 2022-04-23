Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD6C0C433F5
	for <git@archiver.kernel.org>; Sat, 23 Apr 2022 16:10:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236350AbiDWQNJ (ORCPT <rfc822;git@archiver.kernel.org>);
        Sat, 23 Apr 2022 12:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235036AbiDWQNF (ORCPT <rfc822;git@vger.kernel.org>);
        Sat, 23 Apr 2022 12:13:05 -0400
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDBE410A4
        for <git@vger.kernel.org>; Sat, 23 Apr 2022 09:10:06 -0700 (PDT)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 0430C18983F;
        Sat, 23 Apr 2022 12:10:06 -0400 (EDT)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
        :subject:references:date:in-reply-to:message-id:mime-version
        :content-type; s=sasl; bh=XrwVpa1seBNHnj1ZBSIdyxCxLuzhzUd5tG+wDQ
        9pUJc=; b=vX3TeWrmO58Bn3Xvz2fAgllQ7X5+n39WCA5V9lqO1Rv52V7xp2N9Y/
        wjrR5mHPH+OBV2TBC8XTxvbaUPjHPURp6D4h2MIOVg78SVWeyP4w+M8J4rP5+Tr9
        6tT2edHaqpDMVDzZkhbQkRqVx8tW/JQ1Mm3a1UGOMlHbwSlGCyj5M=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id F131B18983D;
        Sat, 23 Apr 2022 12:10:05 -0400 (EDT)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [34.105.84.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 3EC73189837;
        Sat, 23 Apr 2022 12:10:01 -0400 (EDT)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     Philip Oakley <philipoakley@iee.email>,
        Johannes Schindelin <johannes.schindelin@gmx.de>
Cc:     Guy Maurel <guy.j@maurel.de>, git@vger.kernel.org
Subject: Re: a problem with git describe
References: <4ef9287b-6260-9538-7c89-cffb611520ee@maurel.de>
        <3d762060-b817-0246-c4a2-8eb35096cb7f@iee.email>
Date:   Sat, 23 Apr 2022 09:09:59 -0700
In-Reply-To: <3d762060-b817-0246-c4a2-8eb35096cb7f@iee.email> (Philip Oakley's
        message of "Sat, 23 Apr 2022 12:27:40 +0100")
Message-ID: <xmqqczh73hns.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID: D42D4D44-C31F-11EC-BB51-CBA7845BAAA9-77302942!pb-smtp21.pobox.com
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Philip Oakley <philipoakley@iee.email> writes:

>> guy@renard ~/Software/uncrustify $ sudo git describe --always --dirty
> ...
> There has also been added an escape hatch of allowing "*" for the
> permitted safe directories. but do check the updated manuals, and the
> git mailing list archive (update the search in the above link).

In this particular case, I do not think '*' is needed, but you need
to be careful here.  Whose configuration are you suggesting to add
such an entry?  Yourself?  ~root/.gitconfig?

I wonder if we should loosen "the same owner" check somewhat to
cover this situation better.  I expect people also run the
installation in repositories they own with "sudo make install",
and complaining "euid does not own that repository" when it is
merely because they are running as root (and their real identity
is still in ruid) feels a bit too strict to be useful.

Dscho, what do you think?

