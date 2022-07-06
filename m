Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91DF7C43334
	for <git@archiver.kernel.org>; Wed,  6 Jul 2022 16:59:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233460AbiGFQ7C (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 6 Jul 2022 12:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233620AbiGFQ6m (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 6 Jul 2022 12:58:42 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86AAC2A948
        for <git@vger.kernel.org>; Wed,  6 Jul 2022 09:57:59 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-31c8a5d51adso67571707b3.14
        for <git@vger.kernel.org>; Wed, 06 Jul 2022 09:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=Vs7zK2uHXiubmfUMg5QHxyeVHCADXsbuw5KNp9Zvolo=;
        b=T9SedqEh58+7xZ3Y2hTkMIyjihVhOx/JvUTlC210i8mLKDqHKkFPMk0zyqTqEGur2l
         p1Va8HQ9uXt8cUe0IjJN4YT765sH0JGBYHCIWhflM2uP+b2bFVTB9CP4q3NCp83UaTbu
         JmIh2JoSUV8PFZp8dRxAEMrOGLmfDuegsVkBlV3CUrjRwbwNVIrBbV4h4UeebyEFZv3D
         rESsc7oGCwk+lvWKSn9uYON7V4Ww3Vyh3DqZeVFcU3bMLgtwpyw3k8qWUj2Zw/MB02uG
         ZmUNyVxSa9GuiSejoWk//M4PAI4pJ0pAltOa39G7N3Fz84agu3TACi+dGGn/MVcjIMAc
         z5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=Vs7zK2uHXiubmfUMg5QHxyeVHCADXsbuw5KNp9Zvolo=;
        b=6rGQEepBaPfyno5lTHiDPulqvDjyvNs2oDhOqMAKuqC9j8RUsoP8k5aMvHE6XsCvOO
         D8PKOiWVPS6JujHrVXHbW1HIbHQAS5Ym6rSXV2iM831vfNOojaxOQGbPIqdWxaN0FMwG
         1G6f2iyOAGlq7gzgJ9GhGN8LG5M5sZ3x6Q5rponm1RWKcN3UDlOlHwrsgNWV7+TBRhVl
         EmySRHkCHN4xurKZAS8wAJEC74FZ99XCOdloDjMe/ul0mRA+h4T4PS6Travz+OdCXXpv
         1xBpDc5TUK8JKCt6x5e7CkrVDPeGbXAY2jAKfHdXF/VKJqE8KHgVsfFXx9YVegZzpHb6
         r1dg==
X-Gm-Message-State: AJIora9xGIYCyVvqo2PXKHqP5HAuJh+0LNt+bWGrqrDtN8Ua6EGu1mFa
        g1H/Bit1PgVxD9pjXZ6ibESLXY5xe5Rv4g==
X-Google-Smtp-Source: AGRyM1uI5mXBbe96LaL0oZnm+veTQiDduQaUs/Ngd+HqI7zxkKqyDh9V+Ds8z1nbYeCm449E6nAWeDht7Zv4Hg==
X-Received: from chooglen.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:26d9])
 (user=chooglen job=sendgmr) by 2002:a05:6902:90e:b0:669:5bfb:9877 with SMTP
 id bu14-20020a056902090e00b006695bfb9877mr45133306ybb.323.1657126678814; Wed,
 06 Jul 2022 09:57:58 -0700 (PDT)
Date:   Wed, 06 Jul 2022 09:57:56 -0700
In-Reply-To: <220704.8635fhb84h.gmgdl@evledraar.gmail.com>
Message-Id: <kl6lo7y2rxez.fsf@chooglen-macbookpro.roam.corp.google.com>
Mime-Version: 1.0
References: <xmqqo7y85t44.fsf@gitster.g> <220704.8635fhb84h.gmgdl@evledraar.gmail.com>
Subject: Re: gc/submodule-use-super-prefix & ab/submodule-cleanup (was: What's
 cooking in git.git (Jul 2022, #01; Fri, 1))
From:   Glen Choo <chooglen@google.com>
To:     "=?utf-8?B?w4Z2YXIgQXJuZmrDtnLDsA==?= Bjarmason" <avarab@gmail.com>,
        Junio C Hamano <gitster@pobox.com>
Cc:     git@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

=C3=86var Arnfj=C3=B6r=C3=B0 Bjarmason <avarab@gmail.com> writes:

> On Fri, Jul 01 2022, Junio C Hamano wrote:
>
>> * gc/submodule-use-super-prefix (2022-06-30) 8 commits
>>  - submodule--helper: remove display path helper
>>  - submodule--helper update: use --super-prefix
>>  - submodule--helper: remove unused SUPPORT_SUPER_PREFIX flags
>>  - submodule--helper: use correct display path helper
>>  - submodule--helper: don't recreate recursive prefix
>>  - submodule--helper update: use display path helper
>>  - submodule--helper tests: add missing "display path" coverage
>>  - Merge branch 'ab/submodule-cleanup' into gc/submodule-use-super-prefi=
x
>>  (this branch uses ab/submodule-cleanup.)
>>
>>  Another step to rewrite more parts of "git submodule" in C.
>>
>>  Will merge to 'next'?
>>  source: <20220701021157.88858-1-chooglen@google.com>
>
> [...]
>
>> * ab/submodule-cleanup (2022-06-28) 12 commits
>>  - git-sh-setup.sh: remove "say" function, change last users
>>  - git-submodule.sh: use "$quiet", not "$GIT_QUIET"
>>  - submodule--helper: eliminate internal "--update" option
>>  - submodule--helper: understand --checkout, --merge and --rebase synony=
ms
>>  - submodule--helper: report "submodule" as our name in some "-h" output
>>  - submodule--helper: rename "absorb-git-dirs" to "absorbgitdirs"
>>  - submodule update: remove "-v" option
>>  - submodule--helper: have --require-init imply --init
>>  - git-submodule.sh: remove unused top-level "--branch" argument
>>  - git-submodule.sh: make the "$cached" variable a boolean
>>  - git-submodule.sh: remove unused $prefix variable
>>  - git-submodule.sh: remove unused sanitize_submodule_env()
>>  (this branch is used by gc/submodule-use-super-prefix.)
>>
>>  Further preparation to turn git-submodule.sh into a builtin.
>>
>>  Will merge to 'next'.
>>  source: <cover-v4-00.12-00000000000-20220628T095914Z-avarab@gmail.com>
>
> Thanks, with regards to gc/submodule-use-super-prefix that series gets
> my enthusiastic (if it helps):
>
> 	Reviewed-by: =C3=86var Arnfj=C3=B6r=C3=B0 Bjarmason <avarab@gmail.com>
>
> Likewise the ab/submodule-cleanup parent topic has Glen's:
>
> 	Reviewed-by: Glen Choo <chooglen@google.com>
>
> Per [1] and [2]. I.e. the latest is the v4, but the Reviewed-By was
> given to v3 in [1], and [4] notes on v4 that the one remaining concern
> was addressed.
>
> Thanks both, it's great to see us this close to getting rid of another
> *.sh built-in. I plan to submit the migration to the builtin/submodule.c
> after these two land, possibly after some memory leak fixes to
> builtin/submodule--helper.c.
>
> 1. https://lore.kernel.org/git/kl6lh74aivc6.fsf@chooglen-macbookpro.roam.=
corp.google.com/
> 2. https://lore.kernel.org/git/kl6l1qv8ivcs.fsf@chooglen-macbookpro.roam.=
corp.google.com/

Yup, I think this is an accurate summary of both topics.

Likewise, I'm really excited to get rid of another *.sh built-in.
Thanks!
