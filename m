Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01137C433EF
	for <git@archiver.kernel.org>; Mon, 11 Jul 2022 21:08:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbiGKVIS (ORCPT <rfc822;git@archiver.kernel.org>);
        Mon, 11 Jul 2022 17:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiGKVIQ (ORCPT <rfc822;git@vger.kernel.org>);
        Mon, 11 Jul 2022 17:08:16 -0400
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC3E5A451
        for <git@vger.kernel.org>; Mon, 11 Jul 2022 14:08:16 -0700 (PDT)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id 60FEE135E2D;
        Mon, 11 Jul 2022 17:08:15 -0400 (EDT)
        (envelope-from junio@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
        :subject:references:date:in-reply-to:message-id:mime-version
        :content-type; s=sasl; bh=/bycJ1cKdh1oXD9uK+Exo0oa6ETs/tLdsde8Xg
        j5FLQ=; b=uEhdhMQ7EIpT3ITrZ97OFLgOtue3WXPkc0mFUfpMQAAbhuLs+aEvMo
        U4ZJDrMzS0oUSDh5BEVKZHLR4Q5FNWekt0MpVeCkFmNAJwWAX3CWhemJLwSHIyW+
        nGPWUtIYzZi3wSScLeqLIvLIFgEw1Nnwdt3BkVVk6xKBCFC+SyXa8=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id 58745135E2C;
        Mon, 11 Jul 2022 17:08:15 -0400 (EDT)
        (envelope-from junio@pobox.com)
Received: from pobox.com (unknown [34.83.92.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp2.pobox.com (Postfix) with ESMTPSA id BAFE9135E2B;
        Mon, 11 Jul 2022 17:08:14 -0400 (EDT)
        (envelope-from junio@pobox.com)
From:   Junio C Hamano <gitster@pobox.com>
To:     Teng Long <dyroneteng@gmail.com>
Cc:     avarab@gmail.com, derrickstolee@github.com, git@jeffhostetler.com,
        git@vger.kernel.org, me@ttaylorr.com, tenglong.tl@alibaba-inc.com
Subject: Re: [PATCH v6 1/7] clean: fixed issues related to text output format
References: <cover.1657540174.git.dyroneteng@gmail.com>
        <94a64ba895a8eb9eb7d502e94cf3d9fdfb9d2887.1657540174.git.dyroneteng@gmail.com>
Date:   Mon, 11 Jul 2022 14:08:13 -0700
In-Reply-To: <94a64ba895a8eb9eb7d502e94cf3d9fdfb9d2887.1657540174.git.dyroneteng@gmail.com>
        (Teng Long's message of "Mon, 11 Jul 2022 20:43:57 +0800")
Message-ID: <xmqqwncjmk76.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Pobox-Relay-ID: 942BA0A2-015D-11ED-AEC2-CB998F0A682E-77302942!pb-smtp2.pobox.com
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Teng Long <dyroneteng@gmail.com> writes:

> Subject: Re: [PATCH v6 1/7] clean: fixed issues related to text output format

This does not seem to be about "git clean".  Mistitled?

pack-bitmap.c: fix formatting of error messages

perhaps?
