Return-Path: <git-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30AEAC7619A
	for <git@archiver.kernel.org>; Fri, 31 Mar 2023 03:22:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjCaDWy (ORCPT <rfc822;git@archiver.kernel.org>);
        Thu, 30 Mar 2023 23:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjCaDWx (ORCPT <rfc822;git@vger.kernel.org>);
        Thu, 30 Mar 2023 23:22:53 -0400
Received: from m13112.mail.163.com (m13112.mail.163.com [220.181.13.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B192F12CE6
        for <git@vger.kernel.org>; Thu, 30 Mar 2023 20:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
        Message-ID; bh=tgk8VRcOdaVKPk24lRJ/6gVFxXWsgZbTQDgunpPikhc=; b=O
        asTbn6vhB0TGKqqJ0FrKdBQKEB7yiwisGlfLnILefCqwSZkCIffhVKAapbQJWFAv
        6tlnMpUm7oDimaKjvx3uhsW1lVc4mkPIcgwkJ2YBHX6VwmwaSbecF+ibEaBMIW4d
        uK195/LdNGTVoRn/+rJdtWxR9mbGX5LglyQsE7zynI=
Received: from 18994118902$163.com ( [153.0.171.49] ) by
 ajax-webmail-wmsvr112 (Coremail) ; Fri, 31 Mar 2023 11:22:42 +0800 (CST)
X-Originating-IP: [153.0.171.49]
Date:   Fri, 31 Mar 2023 11:22:42 +0800 (CST)
From:   "Zhang Yi" <18994118902@163.com>
To:     "Zhang Yi" <18994118902@163.com>, git@vger.kernel.org,
        christian.couder@gmail.com, hariom18599@gmail.com
Subject: [GSOC] [PROPOSAL v2] Draft of proposal for "Unify ref-filter
 formats with other pretty formats"
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2023 www.mailtech.cn 163com
X-NTES-SC: AL_QuyTAv6YvUEt5CSQYukXn0oVgu88UcCzvPok34ZQOZk0pivJ2gc/W0NHG3Lc0sGXEQmyjCS7fDdJ2shrZLtYe6W5yd8h3Cgtu711bP0hyzd5
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <100814d1.2603.18735b059bb.Coremail.18994118902@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cMGowAC3E8wCUiZkz50BAA--.17672W
X-CM-SenderInfo: zprymmqurrmmmqsbiqqrwthudrp/1tbiYwJD-laEOYVAfgAAsM
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

SSBoYXZlIGNoYW5nZWQgbXkgcHJvcG9zYWwgYWNjb3JkaW5nIHRvIHRoZSBjb21tZW50cyBieSBI
YXJpb20gVmVybWEuCgpJbXByb3ZlbWVudCB2cyB2MToKMS4gUHV0IG1vcmUgZWZmb3J0IGludG8g
cmVsYXRlZCB3b3JrIGFuZCBncmFzcCBhIGxvdCBmcm9tIHRoZW0uCjIuIE1vcmUgZGV0YWlscyBh
Ym91dCB0aW1lbGluZS4KMy4gTW9yZSBkZXRhaWxzIGFib3V0IG15IHBsYW4uCjQuIFNvbWUgdGlu
eSBjaGFuZ2VzIGluIG90aGVyIGNvbnRlbnQuCgpPcGVuIHRvIG1vcmUgZ3VpZGFuY2VzLiBUaGFu
a3MgZm9yIHN1Z2dlc3Rpb25zLgoKCiogVW5pZnkgcmVmLWZpbHRlciBmb3JtYXRzIHdpdGggb3Ro
ZXIgcHJldHR5IGZvcm1hdHMKCiogUGVyc29uYWwgSW5mb3JtYXRpb24KCkZ1bGwgbmFtZTogWmhh
bmcgWWkKCkUtbWFpbDogMTg5OTQxMTg5MDJAMTYzLmNvbQpUZWw6ICgrODYpMTg5OTQxMTg5MDIK
CkVkdWNhdGlvbjogV3VoYW4gVW5pdmVyc2l0eSBvZiBUZWNobm9sb2d5IChDaGluYSkKTWFqb3I6
IENvbXB1dGVyIGVuZ2luZWVyaW5nIApZZWFyOiBGaXJzdC15ZWFyIHBvc3RncmFkdWF0ZSBzdHVk
ZW50CgpHaXRodWI6IGh0dHBzOi8vZ2l0aHViLmNvbS96aGFueWkyMjMzMwoKKiAgU3lub3BzaXMK
CioqIE1vdGl2YXRpb24KCkdpdCBoYXMgZGlmZmVyZW50IGltcGxlbWVudHMgdG8gZm9ybWF0IGNv
bW1hbmQgb3V0cHV0LCB3aGljaCBtYWtlcyBjaGFvcyBhbmQKaGluZGVyIGltcHJvdmVtZW50IG9m
IGNvZGUgcXVhbGl0eS4KCkFpbSB0byB1bmlmeSB0aGUgZGlmZmVyZW50IGltcGxlbWVudGF0aW9u
cyB0byBmb3JtYXQgb3V0cHV0IGZvciBkaWZmZXJlbnQKY29tbWFuZHMsIHdlIHdhbnQgdG8gdHJh
bnNmb3JtIHByZXR0eSBpbnRvIHJlZi1maWx0ZXIgZm9ybWF0dGluZyBsb2dpYy4gQWNjb3JkaW5n
CnRvIHRoZSBwcmVzZW50IHNpdHVhdGlvbiwgSSBuZWVkIHRvIGFkZCBtb3JlIHJlZi1maWx0ZXIg
YXRvbXMgdG8gcmVwbGFjZQpwcmV0dHkuCgoqKiBQcmV2aW91cyBXb3JrCgogIC0gYGdpdCBmb3It
ZWFjaC1yZWZgLCBgZ2l0IGJyYW5jaGAgYW5kIGBnaXQgdGFnYCBmb3JtYXRzIGludG8gdGhlCnJl
Zi1maWx0ZXIgZm9ybWF0czoKCmRvbmUgYnkgS2FydGhpayBOYXlhayAoR1NvQyAyMDE1KQoKICAt
ICBgZ2l0IGNhdC1maWxlYCBmb3JtYXRzIGFuZCB0aGUgcmVmLWZpbHRlciBmb3JtYXRzOgoKc3Rh
cnRlZCBieSBPbGdhIFRlbGV6aG5heWEgKE91dHJlYWNoeSAyMDE3LTIwMTgpLApjb250aW51ZWQg
YnkgWmhlTmluZyBIdSAoR1NvQyAyMDIxKSwKICAgIFRoZXJlIGFyZSBhIGxvdCBvZiBwYXRjaGVz
IHdoaWNoIGFyZSBjb25jbHVkZWQgaW4gaGlzIGZpbmFsIGJsb2cgWzFdCmJ1dCBzdGlsbCBub3Qg
ZmluaXNoZWQgZHVlIHRvIHRyaWNreSBwZXJmb3JtYW5jZSBpc3N1ZXMKCiAgLSByZWYtZmlsdGVy
IGZvcm1hdHMgYW5kIHByZXR0eSBmb3JtYXRzOgoKc3RhcnRlZCBieSBIYXJpb20gVmVybWEgKEdT
b0MgMjAyMCkKICAgIFRoZXJlIGFyZSBhbHNvIGEgbG90IG9mIHBhdGNoZXMgd2hpY2ggYXJlIGNv
bmNsdWRlZCBpbiBoaXMgZmluYWwgYmxvZyBbMl0KY29udGludWVkIGEgYml0IGJ5IEpheWRlZXAg
RGFzIChHU29DIDIwMjIpCiAgICBQYXRjaDogZ3BnLWludGVyZmFjZTogYWRkIGZ1bmN0aW9uIGZv
ciBjb252ZXJ0aW5nIHRydXN0IGxldmVsIHRvIHN0cmluZyBbM10KYW5kIGNvbnRpbnVlZCBieSBO
c2VuZ2l5dW12YSBXaWxiZXJmb3JjZSBhbmQgaGlzICB3b3JrIG9uIHRoZSAic2lnbmF0dXJlIiBh
dG9tcwpzaG91bGQgYmUgbW9zdGx5IG92ZXIgd2hlbiB0aGUgR1NvQyBzdGFydHMuIChPdXRyZWFj
aHkgMjAyMi0yMDIzKQogICAgUGF0Y2g6IHJlZi1maWx0ZXI6IGFkZCBuZXcgYXRvbSAic2lnbmF0
dXJlIiBhdG9tIFs0XQoKcHM6IFRoZXJlIHNlZW1zIG5vIGNvbmNsdXNpb24gYXJ0aWNsZXMgb2Yg
S2FydGhpayBOYXlhaydzIGFuZCBPbGdhIFRlbGV6aG5hdmEncwp3b3Jrcy4KCioqIFdoYXQgaXMg
bGVmdAoKU2luY2UgdGhlIHdvcmsgb2YgInNpZ25hdHVyZSIgYXRvbXMgd2lsbCBiZSBmaW5pc2hl
ZCBieSBOc2VuZ2l5dW12YSBXaWxiZXJmb3JjZSwKVGhlcmUgbWF5IGJlIHNvbWUgb3RoZXIgYXRv
bXMgbGVmdCBmb3IgcmVmLWZpbHRlciBmb3JtYXRzIGFuZCBwcmV0dHkgZm9ybWF0cy4KQnV0IEkg
c3RpbGwgbmVlZCB0byBjaGVjay4KCklmIHRoZXJlIGlzIG5vIHdvcmsgbGVmdCBmb3IgZm9yIHJl
Zi1maWx0ZXIgZm9ybWF0cyBhbmQgcHJldHR5IGZvcm1hdHMsIHRoZW4KdGhlcmUgbWF5IGJlIGFu
b3RoZXIgY29tbWFuZCB3aGljaCBoYXMgYSBkaWZmZXJlbnQgZm9ybWF0IGltcGxlbWVudCB3aXRo
CnJlZi1maWx0ZXIuCgoqKiBTdGVwcwoKSW4gbXkgbWluZCwgdGhlcmUgYXJlIDQgc3RlcHMgbG9n
aWNhbGx5OgoxLiBDaGVjayBhbmQgZmluZCBhIHByZXR0eSBhdG9tIHdoaWNoIGhhcyBubyBzdWJz
dGl0dXRlIGluIHJlZi1maWx0ZXIuCiAgIFRoaXMgc3RlcCBpcyB0byBkZWNpZGUgdGhlIHdob2xl
IGRpcmVjdGlvbiBvZiB0aGUgbmV4dCB3b3JrLgogICBDaHJpc3RpYW4gQ291ZGVyIGluZm9ybWVk
IG1lIHRoYXQgSSBjYW4gZG8gdGhpbmdzIGxpa2UgdGhlIGZvbGxvd2luZzoKICAgLSBtYWtpbmcg
c3VyZSB0aGF0IGFsbCB0aGUgYXRvbXMgaW4gdGhlIHByZXR0eSBmb3JtYXRzIGhhdmUgc2ltaWxh
cgogICBhdG9tcyBpbXBsZW1lbnRlZCBpbiB0aGUgcmVmLWZpbHRlciBmb3JtYXRzCiAgIC0gZmlu
ZCBhIHdheSB0byBjb252ZXJ0IGFueSBzdHJpbmcgY29udGFpbmluZyBwcmV0dHkgZm9ybWF0IGF0
b21zIHRvCiAgIGEgc3RyaW5nIGNvbnRhaW5pbmcgb25seSByZWYtZmlsdGVyIGZvcm1hdCBhdG9t
cwogICAtIGZpbmQgYSB3YXkgdG8gcGx1Zy1pbiB0aGUgcmVmLWZpbHRlciBjb2RlIGludG8gdGhl
IHByZXR0eSBjb2RlLCBzbwogICB0aGF0IGNhbGxlcnMgb2YgdGhlIHByZXR0eSBjb2RlIHdvdWxk
IG5vdCBuZWVkIHRvIGJlIGNoYW5nZWQgbXVjaC4KMi4gQWRkIHJlYXNvbmFibGUgdGVzdCBzY3Jp
cHRzIGFuZCBtYXliZSBkb2N1bWVudHMgaW4gYWR2YW5jZS4KICAgSW4gbXkgb3BpbmlvbiwgbWFr
aW5nIGEgZHJhZnQgb2YgdGVzdCBzY3JpcHRzIGFuZCBkb2N1bWVudHMgaW4gYWR2YW5jZSBjYW4K
ICAgaGVscCBtZSBoYXZlIGEgZGVlcCB1bmRlcnN0YW5kaW5nIG9mIHRoZSBiZWhhdmlvciB0aGF0
IEkgbmVlZCB0byBjb2RlLiBJIGxlYXJuCiAgIHRoaXMgZGV2ZWxvcG1lbnQgbW9kZSBmcm9tIGJv
b2suIEFuZCBJIGhhdmUgcmVhbGx5IG1ldCBwcm9ibGVtcyByaXNpbmcgZnJvbQogICB0aGUgbWlz
dW5kZXJzdGFuZGluZyBvZiBuZWVkZWQgYmVoYXZpb3Igd2hpY2ggd2lsbCByZXN1bHQgaW4gYSBs
b3Qgb2YgcmV3b3Jrcy4KMy4gQ2hhbmdlIGNvZGUuCiAgIEluc3BpcmVkIGJ5IEhhcmlvbSBWZXJt
YSdzIHByb3Bvc2FsLCBJIGNhbiAgc3RhcnQgYnkgZmlyc3QgbG9va2luZyBhdCB3aGF0CiAgIGFj
dHVhbGx5IG5lZWRlZCB0byBiZSByZXBsYWNlZCAoZm9yIGV4YW1wbGUgYnkgc3R1ZHlpbmcgdGhl
IFBSRVRUWSBGT1JNQVRTCiAgIHNlY3Rpb24gaW4gJ21hbiBnaXQtbG9nJywgd2hhdCB3aGljaCB2
ZXJicyB5b3UgY2FuIHVzZSBpbiB0aGUgcmVmLWZpbHRlcgogICAoJ21hbiBnaXQtZm9yLWVhY2gt
cmVmJykgdG8gYWNoaWV2ZSB0aGUgc2FtZSB0aGluZy4gVGhlbiBJIGNhbiByZXNlYXJjaCBob3cK
ICAgb25lIGZvcm1hdCBpcyBpbXBsZW1lbnRlZCBpbiAncHJldHR5LmMnLCBhbmQgc2VlIGhvdyBh
IHNpbWlsYXIgdGhpbmcgdXNpbmcKICAgdGhlIHJlZi1maWx0ZXIgaXMgaW1wbGVtZW50ZWQgaW4g
J3JlZi1maWx0ZXIuYycuCjQuIFJlY2hlY2sgZG9jdW1lbnRzIGFuZCBydW4gdGVzdCBzY3JpcHRz
LgogICBOZWNlc3Nhcnkgc3RlcCB0byBjaGVjayB0aGUgYmVoYXZpb3Igb2YgY29kZS4KCgoqIEJl
bmVmaXRzIHRvIENvbW11bml0eQoKSSdtIHdpbGxpbmcgdG8gc3RheSBhcm91bmQgYWZ0ZXIgdGhl
IHByb2plY3QuIEJ5IHRoYXQgdGltZSwgSSB3aWxsIGJlIGluIG15CnNlY29uZCB5ZWFyIHdpdGhv
dXQgY2xhc3Nlcy4gQW5kIG15IHR1dG9yIGhhcyBhbiBvcGVuIG1pbmQgYWJvdXQgbXkgcmVxdWVz
dCB0bwppbnZvbHZlIGluIGFuIG9wZW4gc291cmNlIHByb2plY3QgYnkgbm93LiBDb25zaWRlcmlu
ZyB0aGUgc3ViamVjdGl2ZSBhbmQKb2JqZWN0aXZlIGNvbmRpdGlvbnMsIEkgdGhpbmsgdGhlcmUg
aXMgYSBoaWdoIHBvc3NpYmlsaXR5IHRoYXQgSSB3aWxsIHN0YXkKYXJvdW5kLgoKUGFydGljdWxh
cmx5LCBJIHdpc2ggdG8gYmUgYSBjby1tZW50b3IgaWYgSSBoYXZlIHRoZSBhYmlsaXR5LiBUaGVy
ZSBtYXkgYmUgc29tZQpkaWZmaWN1bHRpZXMuIEJ1dCB3aGF0IEkgbGVhcm4gZnJvbSBteSBmaW5p
dGUgZXhwZXJpZW5jZSBpcyB0aGF0IHlvdSBzaG91bGQgbm90CnJlZnVzZSBzb21ldGhpbmcgcG9z
aXRpdmUganVzdCBiZWNhdXNlIG9mIHRoZSBkaWZmaWN1bHRpZXMgaW4gdGhlIG1pbmQuIEEKZnJl
c2ggbmV3IGpvYiBtYXkgYmUgZGlmZmljdWx0LCBidXQgaXQgY2FuIHNob3cgbWUgdGhlIHBvc3Np
YmlsaXRpZXMgb2YgdGhlCndvcmxkLCB3aGljaCBtZWFucyBjaGFuZ2luZyBteSBtaW5kLgoKV2hh
dCdzIG1vcmUsIEkgdHJpZWQgdG8gcGVyc3VhZGUgYSBzY2hvb2xtYXRlIHdobyBJIHRoaW5rIGlz
IGtpbmQgb2Ygb2JzZXNzZWQKd2l0aCB0ZWNobm9sb2d5IHRvIHRha2UgcGFydCBpbiBhbiBvcGVu
IHNvdXJjZSBjb21tdW5pdHkgZm9yIGJvdGggc2VsZi1ncm93dGggYW5kCmNvbXBhbmlvbi4gQW5k
IEkgZmFpbGVkLCBiZWNhdXNlIGhlIHRoaW5rcyBpdCBpcyBoYXJkLiAgSXQncyBhbHdheXMgaGFy
ZCB0bwpjaGFuZ2UgT3RoZXJzJyBkZWVwLXJvb3RlZCBpZGVhcyBieSB3b3JkLiBCdXQgSSB0aGlu
ayB0aGUgYWN0aW9ucyBzcGVhayBsb3VkZXIKdGhhbiB3b3Jkcy4gTWF5YmUgYWZ0ZXIgdGhlIHBy
b2plY3QsIEkgY2FuIGNoYW5nZSB0aGUgbWluZHMgb2YgcGVvcGxlIGFyb3VuZCBtZQphYm91dCBq
b2luaW5nIGFuIG9wZW4gc291cmNlIGNvbW11bml0eS4gVGhlcmUgbWF5IGJlIG5vIHZpc3VhbCBi
ZW5lZml0cyB0byB0aGUKR2l0IENvbW11bml0eSBidXQgc2hvdWxkIGJlIGJlbmVmaWNpYWwgdG8g
dGhlIHdob2xlIG9wZW4gc291cmNlIGNvbW11bml0eS4KCiogTWljcm9wcm9qZWN0Cgp0OTcwMDog
bW9kZXJuaXplIHRlc3Qgc2NyaXB0cyBbNV0KClRoZSBtaWNyb3Byb2plY3QgcGF0Y2hlcyBoYXZl
IGJlZW4gbWVyZ2VkLiBUaGUgbWVyZ2UgaW5mbyBpcyBhcyBiZWxvdzoKCmNvbW1pdCA4NzYwYTJi
M2M2MzQ3OGU4NzY2YjdmZjQ1ZDc5OGJkMWJlNDdmNTJkCk1lcmdlOiBhMmQyYjUyMjllIDUwOWQz
ZjUxMDMKQXV0aG9yOiBKdW5pbyBDIEhhbWFubyA8Z2l0c3RlckBwb2JveC5jb20+CkRhdGU6ICAg
VHVlIEZlYiAyOCAxNjozODo0NyAyMDIzIC0wODAwCgogICAgTWVyZ2UgYnJhbmNoICd6eS90OTcw
MC1zdHlsZScKCiAgICBUZXN0IHN0eWxlIGZpeGVzLgoKICAgICogenkvdDk3MDAtc3R5bGU6CiAg
ICAgIHQ5NzAwOiBtb2Rlcm5pemUgdGVzdCBzY3JpcHRzCgoqIFBsYW4KCioqIFRpbWVsaW5lIGFu
ZCBkZWxpdmVyYWJsZXMKClRoZSBvZmZpY2lhbCBHU09DIGNvZGUgdGltZSBzdGFydCBmcm9tIDA1
LTI5IHRvIDA4LTI4LCB3aGljaCBpcyAxMyB3ZWVrcy4KVGhlIHBlcmlvZCBmcm9tIDA2LTA1IHRv
IDA2fjMwIGlzIG5lYXIgdGhlIGVuZCBvZiB0aGUgc2VtZXN0ZXIuIFRoZXJlIGFyZSBtYW55CmNs
YXNzZXMgZm9yIG1lLiBTbyBJIGd1ZXNzIEkgbWF5IGJlIG5vdCBwcm9kdWN0aXZlIGR1cmluZyB0
aGlzIHBlcmlvZC4KSSB0aGluayBpdCBpcyBhIGJpdCB0aW1lLWxpbWl0ZWQgaWYgSSBmb2xsb3cg
dGhlIG9mZmljaWFsIHRpbWVsaW5lLiBJdCBzZWVtcwpuZWNlc3NhcnkgdG8gZG8gc29tZSB3b3Jr
IGluIGFkdmFuY2UuCgoxLiBwcmVwYXJhdG9yeSB3b3JrOgogUGVyaW9kOgogIDA0LTAxIH4gMDUt
MjgKICBhYm91dCA4IHdlZWtzCiBUYXNrczoKICAxLiBEZWNpZGUgd2hpY2ggcGFydHMgbmVlZCB0
byB3b3JrIGFuZCB3aGljaCBoYXMgcHJpb3JpdHkuCiAgMi4gUmVhZCBIYXJpb20ncyBibG9ncy4K
ICAzLiBUcnlpbmcgdG8gdW5kZXJzdGFuZCB0aGUgZm9ybWF0dGluZyBsb2dpYyBiZWhpbmQgcHJl
dHR5IGFuZCByZWYtZmlsdGVyLgogIChNYXliZSB0cnkgZ2RiPykKICA0LiBUcnkgdG8gbWFrZSBz
b21lIHRyaWFsIGNoYW5nZQoKMi4gV3JpdGUgZHJhZnQgb2YgZG9jdW1lbnRzIGFuZCB0ZXN0IHNj
cmlwdHMuCiBQZXJpb2Q6CiAgMDUtMjkgfiAwNi0wMgogIHdlZWsgMQogVGFza3M6CiAgQmFzZWQg
b24gdGhlIHByZXBhcmF0b3J5IHdvcmssIHdyaXRlIGRyYWZ0cyBvZiBkb2MgYW5kIHRlc3QuCiBE
ZWxpdmVyYWJsZXM6CiAgRHJhZnRzIG9mIGRvY3VtZW50cyBhbmQgdGVzdCBzY3JpcHRzCjMuIElu
YWN0aXZlIFBlcmlvZAogUGVyaW9kOgogIDA2LTA1IH4gMDYtMzAKICB3ZWVrIDJ+NQogIDQgd2Vl
a3MKIFRhc2tzOgogIDEuIEJ1aWxkIHRoZSBiYXNlIG9mIG90aGVyIHdvcmtzIGxpa2UgYXRvbXMu
CiAgMi4gU2hvdWxkIHBhc3Mgc29tZSBzcGVjaWFsIHRlc3RzLgogRGVsaXZlcmFibGVzOgogIEEg
bmV3IGF0b21zCgo0LiBBY3RpdmUgY29kZSBwZXJpb2QgMQogUGVyaW9kOgogIDA3LTAzIH4gMDct
MDcKICB3ZWVrIDYKIFRhc2tzOgogIDEuIEFkZCBhIG5ldyBhcmd1bWVudCBhbmQgZ3JhYiBmdW5j
dGlvbnMgZm9yIHRoZSBhdG9tcwogIDIuIE5lZWQgdG8gcGFzcyB0ZXN0cyBhbmQgaW4gc2FtZSB3
aXRoIGRvY3VtZW50cwogRGVsaXZlcmFibGVzOgogIEEgbmV3IGFyZ3VtZW50IGFuZCBpdHMgZ3Jh
YiBmdW5jdGlvbgo1LiBNaWR0ZXJtIGV2YWx1YXRpb24KIFBlcmlvZDoKICAwNy0xMCB+IDA3LTE0
CiAgd2VlayA3CiBUYXNrczoKICAxLiBTdWJtaXR0aW5nIG1pZHRlcm0gZXZhbHVhdGlvbnMKICAy
LiBNYXliZSBuZWVkIHRvIGNvbnRpbnVlIHRoZSB3b3JrIGxlZnQgZnJvbSBsYXN0IHdlZWsKIERl
bGl2ZXJhYmxlczoKICBtaWR0ZXJtIGV2YWx1YXRpb24KCjYuIEFjdGl2ZSBjb2RlIHBlcmlvZCAy
CiBQZXJpb2Q6CiAgMDctMTcgfiAwOC0wNAogIHdlZWsgOH4xMAogIDMgd2Vla3MKIFRhc2tzOgog
IDEuIEFkZCAyfjMgbmV3IGFyZ3VtZW50cwogIDIuIEFsc28gbmVlZCB0byBwYXNzIHRlc3RzIGFu
ZCBpbiBzYW1lIHdpdGggZG9jdW1lbnRzLgogIDMuIERyYWZ0cyBvZiBkb2N1bWVudHMgYW5kIHRl
c3Qgc2NyaXB0cyBzaG91bGQgYmUgdXBkYXRlZC4KIERlbGl2ZXJhYmxlczoKICAxLiBOZXcgYXJn
dW1lbnRzCiAgMi4gRG9jdW1lbnRzCiAgMy4gdGVzdCBzY3JpcHRzCgo3LiBGaW5pc2hpbmcgdG91
Y2hlcwogUGVyaW9kOgogIDA4LTA3IH4gMDgtMjYKICB3ZWVrIDExfjEzCiAgMyB3ZWVrcwogVGFz
a3M6CiAgMS4gVGhlcmUgc2hvdWxkIGJlIHNvbWUgYnVncyB0byBmaXggb3Igd29yayBsZWZ0Lgog
IDIuIFRoaXMgcGVyaW9kIGlzIGFsc28gbGVmdCBmb3IgdW5leHBlY3RlZCBldmVudHMuCiAgMy4g
U3VibWl0IGZpbmFsIHdvcmsgcHJvZHVjdCBhbmQgZmluYWwgbWVudG9yIGV2YWx1YXRpb24uCiBE
ZWxpdmVyYWJsZXM6CiAgMS4gZmluYWwgd29yayBwcm9kdWN0CiAgMi4gZmluYWwgbWVudG9yIGV2
YWx1YXRpb24KCgoqIEdyYXNwIGZyb20gcmVsYXRlZCB3b3JrCioqIEZyb20gSGFyaW9tIFZlcm1h
J3MgYmxvZwpXYWxraW5nIHRocm91Z2ggdGhlIGJsb2dzIG9mIEhhcmlvbSBWZXJtYSwgSSBmaW5k
IG1hbnkgdGhpbmdzIHVzZWZ1bC4KCioqKiBEZWJ1Z2dpbmcKCkFuIGV4dHJlbWVseSBpbmZvcm1h
dGl2ZShzdGVwLWJ5LXN0ZXApIGRlYnVnZ2luZyBndWlkZSBieSBDaHJpc3RpYW4uIFs2XQoKKioq
IDExIHF1ZXN0aW9ucyBmb3IgdW5kZXJzdGFuZGluZyBzb21lb25lJ3Mgd29yay4gWzddCgoxLiBX
aGF0IHdhcyB0aGUgZ29hbCBvZiBlYWNoIHBhdGNoPwoyLiB3aGljaCBhcHByb2FjaCBkaWQgc2hl
IHRvb2sgdG8gYWNoaWV2ZSB0aGUgZ29hbD8KMy4gd2hhdCB3ZXJlIHRoZSBnb2FscyBvZiB0aGUg
cGF0Y2ggc2VyaWVzPwo0LiB3aGljaCBhcHByb2FjaCBkaWQgc2hlIHRvb2sgdG8gYWNoaWV2ZSB0
aGUgZ29hbHM/CjUuIHdoYXQgd2FzIHRoZSBnb2FsIG9mIGhlciBwcmV2aW91cyBwYXRjaCBzZXJp
ZXM/CjYuIHdoYXQgd2FzIHRoZSBnZW5lcmFsIGRpcmVjdGlvbiBoZXIgcGF0Y2ggc2VyaWVzIHdl
cmUgZ29pbmc/CjcuIHdoeSBkaWQgc2hlIHRvb2sgdGhhdCBkaXJlY3Rpb24/CjguIGFyZSB0aGVy
ZSB3YXlzIHRvIGNvbnRpbnVlIGluIHRoZSBzYW1lIGRpcmVjdGlvbj8KOS4gYXJlIHRoZXJlIHdh
eXMgdG8gYWNoaWV2ZSBzaW1pbGFyIGdvYWxzPwoxMC4gaG93IHdlcmUgaGVyIGdvYWxzIHNpbWls
YXIgYW5kIGRpZmZlcmVudCBmcm9tIHRoZSBnb2FscyBpbiBteSBwcm9wb3NhbD8KMTEuIGlzIGl0
IHBvc3NpYmxlIHRvIHVzZSB0aGUgc2FtZSBhcHByb2FjaD8KCioqKiBFbHNlCgpUaGVyZSBhcmUg
bWFueSBkZXRhaWxzIGFib3V0IGhpcyB3b3JrIHByb2dyZXNzLiBJIGNhbiByZWZlciB0byB0aGVt
IHdoZW4gSSBhbSBpbgpzaW1pbGFyIHNpdHVhdGlvbnMuCgoqKiBGcm9tIFpoZU5pbmcgSHUncyBi
bG9nCgoqKiogVGltZSBhbmFseXppbmcKClVzZSBwZXJmb3JtYW5jZSB0ZXN0aW5nIHRvb2xzIHRv
IGFuYWx5emUgdGhlIHRpbWUtY29uc3VtaW5nIHN0ZXBzIG9mCmBnaXQgY2F0LWZpbGUgLS1iYXRj
aGAuCgogVXNpbmcgR29vZ2xlJ3MgYGdwZXJmdG9vbHNgOgoxLiBBZGQgdGhlIGxpbmsgcGFyYW1l
dGVyIGAtbHByb2ZpbGVyYCBpbiBgY29uZmlnLm1ha2A6IGBDRkxBR1MgKz0gLWxwcm9maWxlcmAu
CjIuIGBtYWtlYC4KMy4gVXNlIGBDUFVQUk9GSUxFPS90bXAvcHJvZi5vdXQgLzxwYXRoPi9naXQg
Y2F0LWZpbGUgLS1iYXRjaC1jaGVjawotLWJhdGNoLWFsbC1vYmplY3RzYAp0byBydW4gdGhlIGdp
dCBhbmQgZ2VuZXJhbCBgcHJvZi5vdXRgLCB3aGljaCBjb250YWlucyB0aGUgcmVzdWx0cyBvZgpw
ZXJmb3JtYW5jZSBhbmFseXNpcy4KNC4gVXNlIGBwcHJvZiAtLXRleHQgLzxwYXRoPi9naXQgL3Rt
cC9wcm9mLm91dGAgdG8gZGlzcGxheSB0aGUgcmVzdWx0CmluIHRoZSB0ZXJtaW5hbC4KCioqKiBB
Ym91dCBHaXRodWIgQ0kKCiJHaXRIdWItVHJhdmlzIENJIGhpbnRzIiBpbiBEb2N1bWVudGF0aW9u
L1N1Ym1pdHRpbmdQYXRjaGVzCgoqKiogRWxzZQoKSGUgYWxzbyB3cml0ZXMgaGlzIHByb2Nlc3Mg
b2YgZGVidWdnaW5nIGFuZCBvcHRpbWl6YXRpb24gaW4gZGV0YWlsLiBJdCdzIHdvcnRoCmRlZXBl
bmluZyBpbnRvIHdoZW4gSSBuZWVkIHRoZW0uCgpUaGlzIHByb3Bvc2FsIGRyYWZ0IGJlbmVmaXRz
IGZyb20gdGhlIHdvcmtzIG9mIHByZWRlY2Vzc29ycyBtdWNoLiBUaGFua3MuCgoqIEJpb2dyYWhp
Y2FsIGluZm9ybWF0aW9uCgpJdCBpcyBhbHdheXMgZnVubnkgdG8gcmVjYWxsIHRoYXQgSSBmaXJz
dCBsZWFybmVkIGFib3V0IExpbnV4IGluIGEgc3RpbXVsYXRlZApoYWNrZXIgZ2FtZSBpbiBteSBm
cmVzaCB5ZWFyIGluIGNvbGxlZ2UuIEFmdGVyIHRoYXQsIEkgdHJpZWQgdG8gdGVhY2ggbXlzZWxm
CkxpbnV4IGFuZCBzdGFydGVkIHRvIGtub3cgb3BlbiBzb3VyY2UgcHJvamVjdHMuIE92ZXJjb21l
IG1hbnkgZGlmZmljdWx0aWVzIGFuZCBJCmZpbmFsbHkga25vdyBzb21ldGhpbmcgc2hhbGxvdyBh
Ym91dCBMaW51eC4gQXMgYSBzaWRlIGVmZmVjdCwgSSBhbSBtb3JlCmVudGh1c2lhc3RpYyBhbmQg
YmV0dGVyIGF0IHByb2dyYW1taW5nIGNvbXBhcmVkIHdpdGggbXkgc2Nob29sbWF0ZXMuIEJ1dCB0
aGUKcGVyaW9kIG9mIHN0YWduYXRpb24gY2FtZSwgSSBiZWdhbiB0byB3cml0ZSBzb21lIG1lYW5p
bmdsZXNzIHByb2plY3RzIGZvciBzY2hvb2wKdGFza3MgYW5kIHJlcGVhdGVkIG15c2VsZiB3aXRo
b3V0IHByb2dyZXNzLiBUaGUgYmVzdCBvdXQgb2YgdGhlIHdvcnN0LCBJIHRvdWNoZWQKZXhjZWxs
ZW50IG9wZW4gc291cmNlIHNvZnR3YXJlIGR1cmluZyB0aGUgdGltZSwgc3VjaCBhcyB2aW0sIGVt
YWNzLCB2aXN1YWwKc3R1ZGlvIGNvZGUsIFF0LCBWTEMgYW5kLCBvZiBjb3Vyc2UsIGdpdC4gTmVh
ciB0aGUgZW5kIG9mIG15IGp1bmlvciB5ZWFyLCBJIHJlYWQKYW4gYXJ0aWNsZSBhYm91dCBsZWFy
bmluZyBieSBjb250cmlidXRpbmcgdG8gYW4gb3BlbiBzb3VyY2UgcHJvamVjdCBieSBhIGdlZWsK
aW4gdGhlIGNvbW11bml0eSBvZiBlbWFjcy4gQWxtb3N0IGF0IHRoZSBzYW1lIHRpbWUsIEkga25l
dyB0aGUgR1NPQyBhbmQgcHJlZmVycmVkCnRvIHRha2UgcGFydCBpbiBnaXQuIEJ1dCBpdCB3YXMg
bmVhciB0aGUgc3RhcnQgZGF0ZSBvZiBteSBwbGFuIGZvciBwb3N0Z3JhZHVhdGUKcXVhbGlmeWlu
ZyBleGFtaW5hdGlvbi4gU28gSSBqdXN0IHBvc3Rwb25lZCB0aGUgc3R1ZmYgZm9yIEdTT0MuICBM
dWNraWx5LCBJCnBhc3NlZCB0aGUgZXhhbWluYXRpb24uIEFmdGVyIEkgZ290IHVzZWQgdG8gbGlm
ZSBhcyBhIHBvc3RncmFkdWF0ZSBzdHVkZW50LCBJCmZlbHQgdGhlIG1vdGl2YXRpb24gdG8gcHJv
Z3Jlc3MgYWdhaW4uIFRoZW4gSSB0cmllZCB0byBjb250cmlidXRlIGZvciBnaXQuIE5vdyBJCmp1
c3QgZmluaXNoZWQgYSBtaWNybyBwcm9qZWN0LCB3aGljaCBzZWVtcyB0cml2aWFsLiBCdXQgaXQg
cmVhbGx5IGxldCBtZSBoYXZlIGEKZGVlcGVyIHVuZGVyc3RhbmRpbmcgb2Ygb3BlbiBzb3VyY2Ug
YW5kIGZyZWUgc29mdHdhcmUgYW5kIG1vcmUgbW90aXZhdGlvbiB0bwpjb250cmlidXRlLiBJIGhv
cGUgSSBjYW4gc3RheSBoZXJlIGEgbG9uZyB0aW1lIGJlZm9yZSBiZWluZyBpbnZvbHZlZCB3aXRo
IG90aGVyCmludGVyZXN0aW5nIHByb2plY3RzIHNpbmNlIHRoZSBxdWFsaXR5IGlzIG1vcmUgaW1w
b3J0YW50IHRoYW4gdGhlIHF1YW50aXR5LgpJIGtub3cgaXQgc2VlbXMgYSBiaXQgc3R1YmJvcm4g
dG8gYmVsaWV2ZSB0aGF0IGNvbnRyaWJ1dGluZyB3aWxsIGxlYWQgdG8KcHJvZ3Jlc3MsIHdoaWNo
IGlzIGFsc28gaW5mbHVlbmNlZCBieSBteSBsZWFybmluZyBhdHRpdHVkZS4gQnV0IHdpdGhvdXQg
YWN0aW9uLApJIGNhbiBub3QgdmVyaWZ5IHRoZSBiZWxpZWYuICBTb29hdCBsZWFzdCBJIHdpbGwg
dHJ5IHRvIGNvbnRyaWJ1dGUgZm9yIG9uZSB5ZWFyLgpBZnRlciB0aGF0LCBJIGhvcGUgSSBjYW4g
aGF2ZSBhIGJldHRlciB1bmRlcnN0YW5kaW5nLgoKU29ycnksIHRoZSBhYm92ZSB0ZXh0IG1heSBi
ZSBtZXNzaW5nLiBJbiBzaG9ydCwgSSB3aWxsIHRyeSB0byBjb250cmlidXRlIGZvcgpnaXQgZm9y
IGF0IGxlYXN0IG9uZSB5ZWFyLgoKKiBDbG9zaW5nIHJlbWFya3MKCkl0IHNlZW1zIGJsb2dzIHdp
bGwgaGVscCBtdWNoIGZvciBsYXRlciB3b3JrLiBJIHRoaW5rIEl0IHdvcnRoIHJlYnVpbGRpbmcg
bXkKYmxvZyBzaXRlIG9uIGdpdGh1Yi4KClRoYW5rcyBmb3IgQ2hyaXN0aWFuIENvdWRlcidzIGFu
ZCBIYXJpb20gVmVybWEncyBoZWxwLgoKClsxXSBodHRwczovL3B1YmxpYy1pbmJveC5vcmcvZ2l0
L0NBT0xUVDhTeEh1SDJFYmlTd1FYNnB5SkpzNUt5VnVLeDZaT1B4cHpXTEgrVGJ6NUYrQUBtYWls
LmdtYWlsLmNvbS8KWzJdIGh0dHBzOi8vaGFycnktaG92LmdpdGh1Yi5pby9ibG9ncy9wb3N0cy90
aGUtZmluYWwtcmVwb3J0ClszXSBodHRwczovL3B1YmxpYy1pbmJveC5vcmcvZ2l0L3B1bGwuMTI4
MS5naXQuMTY1NzIwMjI2NTA0OC5naXRnaXRnYWRnZXRAZ21haWwuY29tLwpbNF0gaHR0cHM6Ly9w
dWJsaWMtaW5ib3gub3JnL2dpdC9wdWxsLjE0NTIuZ2l0LjE2NzIxMDI1MjM5MDIuZ2l0Z2l0Z2Fk
Z2V0QGdtYWlsLmNvbS8jdApbNV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZ2l0LzIwMjMwMjIy
MDQwNzQ1LjE1MTEyMDUtMS0xODk5NDExODkwMkAxNjMuY29tLwpbNl0gaHR0cHM6Ly9wdWJsaWMt
aW5ib3gub3JnL2dpdC9DQVA4VUZEM0JkNEFmMVhaMDBWeXVIblFzPU1GcmRVdWZLZWVQTzF0eWVk
V29SZVJqd1FAbWFpbC5nbWFpbC5jb20vCls3XSBodHRwczovL2hhcnJ5LWhvdi5naXRodWIuaW8v
YmxvZ3MvcG9zdHMvd2VlazEtdGhlLXRlbi1xdWVzdGlvbnMK
