Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4346C54EBE
	for <git@archiver.kernel.org>; Fri, 13 Jan 2023 16:21:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjAMQVW (ORCPT <rfc822;git@archiver.kernel.org>);
        Fri, 13 Jan 2023 11:21:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbjAMQUw (ORCPT <rfc822;git@vger.kernel.org>);
        Fri, 13 Jan 2023 11:20:52 -0500
X-Greylist: delayed 2626 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 13 Jan 2023 08:14:24 PST
Received: from fallback25.mail.ru (fallback25.m.smailru.net [94.100.189.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 817BE69B24
        for <git@vger.kernel.org>; Fri, 13 Jan 2023 08:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bswap.ru; s=mailru;
        h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=Wg8nK7oQg8pPmAl9oBIsmYRiajhL2vOOm3mz+9W3OmU=;
        t=1673626464;x=1673716464; 
        b=GpTPgTBuF9V2LCF10+GVKdsQm4ed3JfnICtbO02MBKZkV2J1UmY3+6aoGPvTEapOVKto3MsbCNjq95L5S2SXIvbW0MPdnMlQ7Fvue6eAyjdiR+ynFile1m56RUXE0n/5IBrDC31xxEg1qhi/5d5HdBxrgjpoh+ElfFvJWiJnLxo=;
Received: from [10.161.25.36] (port=33816 helo=smtp59.i.mail.ru)
        by fallback25.m.smailru.net with esmtp (envelope-from <kostix@bswap.ru>)
        id 1pGM0f-0001kP-O1
        for git@vger.kernel.org; Fri, 13 Jan 2023 18:30:26 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bswap.ru; s=mailru;
        h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=Wg8nK7oQg8pPmAl9oBIsmYRiajhL2vOOm3mz+9W3OmU=;
        t=1673623825;x=1673713825; 
        b=Pi8PJw+ca7G6Tv9M5rXLmZ07fEWm5OIMxZrKf3Catocam1kdvuXIJFIPHfMXoXskFSP5lkqpbGtxGLc20ntDHdGwNiNC/vRFZBT0x+Y9Ukn3fkPQd5rPpXXBizSYDtTqK3d0qlNDsljv9ioHqcB2SUmomiw6OKXjsAa1VKJM/g4=;
Received: by smtp59.i.mail.ru with esmtpa (envelope-from <kostix@bswap.ru>)
        id 1pGM0M-0005mk-7D; Fri, 13 Jan 2023 18:30:06 +0300
Date:   Fri, 13 Jan 2023 19:30:04 +0400
From:   Konstantin Khomoutov <kostix@bswap.ru>
To:     git@vger.kernel.org
Cc:     Hans Petter Selasky <hps@selasky.org>
Subject: Re: Gitorious should use CRC128 / 256 / 512 instead of SHA-1
Message-ID: <20230113153004.l3crds3db74ffnis@carbon>
Mail-Followup-To: git@vger.kernel.org,
        Hans Petter Selasky <hps@selasky.org>
References: <39dd1a00-786b-acf5-8a40-2425f7dab6cc@selasky.org>
 <20230113133059.snyjblh3sz2wzcnd@carbon>
 <446984f6-0d2e-04da-11a3-8b1481fac953@selasky.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <446984f6-0d2e-04da-11a3-8b1481fac953@selasky.org>
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD90D1502B3BE350FE4802EF3079F824E05475DC4DB6367263200894C459B0CD1B9D490577CBAFF3F9A031C1E29304DF1569C2C162ED4D8ACD5F77FB8B1A9589EDD
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE74EC61905B8C6A847EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063745476ED688D943148638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8E45E6955175B03737895D09AC396A406117882F4460429724CE54428C33FAD305F5C1EE8F4F765FC3A703B70628EAD7BA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F4460429728776938767073520902A1BE408319B292CC0D3CB04F14752D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EED76C6ED7039589DE302FCEF25BFAB3454AD6D5ED66289B52698AB9A7B718F8C46E0066C2D8992A16725E5C173C3A84C392AF71FE74A2456CBA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE7588D3C263EAE74EA731C566533BA786AA5CC5B56E945C8DA
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34EC58E35A639A2471781F684B9AFDEB9110EC3A183C60AF993C52DD8350BE081ED0AEC8583207AB5F1D7E09C32AA3244C2C6B0F048A570A9828A554745216459E725D5B54B2FE4575729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj4ZlsFbC/htUgnNm/EBOXRQ==
X-Mailru-Sender: 53225E476262CDFB75EED519089A678517B115F2D51B8308B6005DF31A302BEEBF0F014DE95EE42D13BA5AC085B0DF3CFD8FF98A8691EE7BAAB64A3C2C77197FCA12F3F80FA6A2FFE7D80B0F635B57EC5FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B41CF11DA7185A12D6378943F3AA328DD1BEFFBB2294D1F2F068F3CF0E9FE49B69832D7811781C4C74D0AF1F255F5F9AC3E3CAFF6A9AF93140C3D6742C86EBB13C
X-7FA49CB5: 0D63561A33F958A548D4C8E4C9FDD2D1E5F04C20E1FA1F42D82399AE838F212A8941B15DA834481FA18204E546F3947CB6FBD635917D924DF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006370A32D918A17158F1389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F790063776C4598447C51BFFD81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636AAAE862A0553A39223F8577A6DFFEA7CDDB9BF3B882869D543847C11F186F3C59DAA53EE0834AAEE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj4ZlsFbC/htWcdXuXaHS1wA==
X-Mailru-MI: 800
X-Mras: Ok
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

On Fri, Jan 13, 2023 at 02:39:37PM +0100, Hans Petter Selasky wrote:

[...]
> > It's not clear why are you referring to Gitorious in your mail's subject and
> > then talk about Git.
[...]
> I thought that Git was short for Gitorious? My bad.

No, unless you're late to the Git party ;-)
Old-timers do remember Gitorious as a software project [1] which is closely
related to Git but was a totally separate project.

  1. https://en.wikipedia.org/wiki/Gitorious

