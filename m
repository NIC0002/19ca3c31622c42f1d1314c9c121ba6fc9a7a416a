Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A908C38145
	for <git@archiver.kernel.org>; Tue,  6 Sep 2022 19:33:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbiIFTdr (ORCPT <rfc822;git@archiver.kernel.org>);
        Tue, 6 Sep 2022 15:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiIFTdq (ORCPT <rfc822;git@vger.kernel.org>);
        Tue, 6 Sep 2022 15:33:46 -0400
Received: from us-smtp-delivery-120.mimecast.com (us-smtp-delivery-120.mimecast.com [170.10.129.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ADB595AC0
        for <git@vger.kernel.org>; Tue,  6 Sep 2022 12:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mathworks.com;
        s=mimecast20180117; t=1662492822;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gR+bKDDYC3axiWpEVli5V2npNwJUi9kujcKjCuQI9rQ=;
        b=DBxrCzJWhvyxrQ6hJ84JBPGvqZwlkV60siKSr/Kc+pDc0Qz3sgx32jzqynnZoRysEsh9iN
        /xNX4NKaRzDiK9iv4ugA6N7vgdWksJINaTV0iT4KIvaBFdTt2MlZdbh3Q70Trvh4ve13L0
        aLjQGI6oaT3SMDzR9sPVrYzepHJ6Q4U=
Received: from na01-obe.outbound.protection.outlook.com
 (mail-westcentralusazlp17010003.outbound.protection.outlook.com
 [40.93.6.3]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-m6Ac0QkANK-53gJPGKPfVQ-1; Tue, 06 Sep 2022 15:33:41 -0400
X-MC-Unique: m6Ac0QkANK-53gJPGKPfVQ-1
Received: from BL0PR05MB5571.namprd05.prod.outlook.com (2603:10b6:208:2f::17)
 by MW4PR05MB8716.namprd05.prod.outlook.com (2603:10b6:303:12b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.5; Tue, 6 Sep
 2022 19:33:38 +0000
Received: from BL0PR05MB5571.namprd05.prod.outlook.com
 ([fe80::86c9:5cc7:6693:d9f7]) by BL0PR05MB5571.namprd05.prod.outlook.com
 ([fe80::86c9:5cc7:6693:d9f7%6]) with mapi id 15.20.5612.007; Tue, 6 Sep 2022
 19:33:38 +0000
From:   Eric DeCosta <edecosta@mathworks.com>
To:     Jeff Hostetler <git@jeffhostetler.com>,
        Eric DeCosta via GitGitGadget <gitgitgadget@gmail.com>,
        "git@vger.kernel.org" <git@vger.kernel.org>
Subject: RE: [PATCH v4 4/4] fsmonitor: normalize FSEvents event paths to the
 real path
Thread-Topic: [PATCH v4 4/4] fsmonitor: normalize FSEvents event paths to the
 real path
Thread-Index: AQHYvVQH5djpr+NntUyFzNLwjYXiEq3LAbkAgAFSbnCABlkzAIAAGvZQgAALwjA=
Date:   Tue, 6 Sep 2022 19:33:37 +0000
Message-ID: <BL0PR05MB55712AAD73E0B82B84AC9640D97E9@BL0PR05MB5571.namprd05.prod.outlook.com>
References: <pull.1326.v3.git.1661280941.gitgitgadget@gmail.com>
 <pull.1326.v4.git.1661962145.gitgitgadget@gmail.com>
 <56cabf3be3b9e228bc948da372db4c9d11fd3926.1661962145.git.gitgitgadget@gmail.com>
 <bdf26d53-7068-87a6-484b-aeef99be35bd@jeffhostetler.com>
 <BYAPR05MB5573B477ED53CBC4C996729DD97A9@BYAPR05MB5573.namprd05.prod.outlook.com>
 <a583a787-1f54-74ba-add1-61f9e30d5c2a@jeffhostetler.com>
 <BL0PR05MB5571765C903A82FDD990956AD97E9@BL0PR05MB5571.namprd05.prod.outlook.com>
In-Reply-To: <BL0PR05MB5571765C903A82FDD990956AD97E9@BL0PR05MB5571.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR05MB5571:EE_|MW4PR05MB8716:EE_
x-ms-office365-filtering-correlation-id: 9be57c89-6b37-42d0-352b-08da903eb258
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: CAKFMfaopazDPQJy0OO3wAxyaegsktzht0QCpeK8+SMAmHhrL2eQfH9R+2hh2V36qp+g8tKeLEc2Tdwgz7p5cwdtWLn6MqMP9kOdTmqAQo7CnEEk6ap2ayjVd+9AiudGe5WnL2SIUuauMA4aouJp/EQE0Bk8Xp3pBgqg72EPSQCWWtGadI1wPa7JteVQ32iyhUsxFcJL9hsJQQDfeq20vlPNoKEu305UDuEk0E1F0LLIZSfqqQyUsf985S+CvsM+DR3wWQUcK9ECBTqrLFEZmE+eJKAiU0qkS9dp0bOgvJYLHb2g6CHsjpt8pcNhujN++i0Lifv5x+rWfUppFW7ESABGXKuHqZJVWVWu/KgXY+LFBehdSZpH0Bqd+7a+LhFFFq24j/Q2A014Xo7QDVf5Ew2erXMMDTNKaPBFaf5LkEyX1P2jN0qcPnV9/rgdlTGQ8xqKiut0BSGHRTOlmkpdrDzVCg3+eoRswns+q1QCogMCRcIPyLwES5wmFs+MkfxBPWxQTIqFj0u2b7TSHLyL3BTNnRKTJQzZeZ2jqt6yBwzQizYRDITGzHa9CFlIlfDZAADAr5YyTHAPMEaUohkkFPN8BIvzqbEs8GWa76Bm9vqmjEfhOOn89pxahLSL5P4sbbeM/XKN+WuxcyLAFPwf1BO4V0lfiSxsjV0Tn8Hwu4eilnh7HE0Wsi7jgP0hs9TMicMJnqR3o8vwJO0O/Z3mzftac7UwOy1ygChlTaPVJjyYXNIOzTkr3qfxhBqLX1oVqtZZLarshPNb2QvlPAaj9uySEYM3p+MdMd90R9m+kJY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR05MB5571.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(8676002)(8936002)(66556008)(83380400001)(33656002)(66446008)(66946007)(76116006)(66476007)(52536014)(5660300002)(7696005)(6506007)(26005)(53546011)(478600001)(41300700001)(71200400001)(64756008)(186003)(966005)(2940100002)(19627235002)(316002)(110136005)(55016003)(86362001)(2906002)(38100700002)(84970400001)(122000001)(38070700005)(9686003);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LzNGUHFZdDJJYkVldEZZNlhvVVBaOGd2ZVAvUmwrUTFMeVdiZWV0N005L1BT?=
 =?utf-8?B?WDJEdmthWnZOeGw5ald3TzkrNGVSQzZ2YmFLUGdmanVadkc1WGdwRjNlTkIw?=
 =?utf-8?B?SVdFYkJPNXNHUkpyRERKZGhQWUw1RVJLc21CUHp3Sjh5R3hKcWEyWnhuRmpp?=
 =?utf-8?B?cUtONmtVOCtXNUhZbk9lUElqSDBudTNDWTh3cUx6b20zZnRzdnd0eVRENTZm?=
 =?utf-8?B?ZmlGWHFBdkFOMkRqbXA1NFNtYUgzbDAvMFZoZkhZTEVvdFd5V1lCU2g3QnRB?=
 =?utf-8?B?cTdBbjBCdityZVRTaGtZc2E3b2hRMEMzTnBzMDVRS2wzcERRdzZBNDA1U2ta?=
 =?utf-8?B?T3g1ZlVVMWl0S0JXMjN1U2ZqcmFoVjB1Rk1jR3gwNmJUUnlkZEdqNnVxc01S?=
 =?utf-8?B?TDc2ZDBocFVrS0M3dVZKTnNFb04zczUxbTNhNDBGWlhhaEErNjcyNDA3aCs2?=
 =?utf-8?B?YnBzWG5LVmNaRTQwYUFGbTRwVFpDYXFqTlRWUDU4b29VQlMyaE9nYWRxT2dZ?=
 =?utf-8?B?VzNmbUIzZXlyWkhhN2orYXh1d1d4dkVaY2xsODgwL0JJeWpEeUlxQWQ0ZHdK?=
 =?utf-8?B?V0VlbmlkdkUyb3ozVFRvWDlnM1Z6K3NvWngyZDlDbmZTYU83WXZ4VFVXUEJa?=
 =?utf-8?B?MkFGazJLRjJYb1IwS0p0dXd6UWlaVjlhWFpZSkNXbHZMK2dienlOaWRZNEs0?=
 =?utf-8?B?ekdOMjdwRlBEazlFbEtqZ3ZtSE56d05abGVXYlJHZnA5OWFwQXlkN09VRHBh?=
 =?utf-8?B?VlpORXcxSXJLeGcyQ1l2dm1tMlJ2WGRSdWJXMEd3dE9VZTJsYU5DTWY4L2JE?=
 =?utf-8?B?WmZHYkkvZFh4c2pFUnRVWEZ6eEJnZW9XbTkwZzNub1QyeHZkYSs2cVozKzVJ?=
 =?utf-8?B?QkNHQkYwNENiQTlvN09nMG5MQmhWMUlVTXp2WVorT2Z2cEZmVU9xWEpQRzJQ?=
 =?utf-8?B?cjR5dnNmbHRHd2pzUGhndW44UmxPRERiMTUvMk9CdHpyV01DcFZZMjJneVA2?=
 =?utf-8?B?MEc0SlhONHVZcFNNczFxeFBmVUJTY3VJblkwTGRVdy9NN25YWkhDaUFLNlN2?=
 =?utf-8?B?TVNXdW93TElzVnpyckNLL3U2SVlXL2ZaMkJOVkFBZzRHQytncjMzRjZ3bVdI?=
 =?utf-8?B?WEx6MEM4ZnBlNmlyQk5RTXNLZjgxRXZwanJuQ3lRdXBXSDFqMFpKcnFRTUpX?=
 =?utf-8?B?eVdGOHMzVWs4bFpWcG15OC8vTHN1T1cySEZrcExQYi9jck9sSm5tVDlzRlVQ?=
 =?utf-8?B?RDczNHBRMUhnSXROdUxzQXZnK2R6QW9IbGkxQ2ZCcWNSU2dYMkprSVJodkpW?=
 =?utf-8?B?QVllYnA5TUVtOVE0WmtLbDdGSjRJU3dBMGVSNTc1clJJaXhNY3JiWlhNQStQ?=
 =?utf-8?B?c0tRM251dDRKUTRTM2pKa2hyRlY3akFDWDJXT1hJUi9kRk5jTlNrMmlKcU96?=
 =?utf-8?B?Mzdua1Rid3Fscmh0YndVcHp3Vml4T0hTaGN3MlBubHFhRm1EKzRqanZFRWpY?=
 =?utf-8?B?RmJMZHBiMHNjcVJxSjJmR0JpTUIwRmplM1pxWXJQdHdnelRNR01adkQyenZs?=
 =?utf-8?B?akwwK3N0U0JxeW90M3FzWWx5c0lJYUNKYWJCYjdLWks4a3NJWE45eW9xVXNR?=
 =?utf-8?B?cXByOHloUXFWekE2ZG1kTUpoMUMyLzhsMHVRdmpNbDB6ZUJWYXRXK2VYK2gy?=
 =?utf-8?B?eVlzejNlc1F0eW5ZWXprcUd6UWtnVTVEU3R5NXJqeHlNdlZkME9JR0x1NUxC?=
 =?utf-8?B?dmN5NWZZTGp4aXVhNWVWcFljRjUzZjFNcFpQZzJ1OHlKWFR4SWlnUzZtNVkx?=
 =?utf-8?B?bjhHMnRzUWZVK1puSDJhbDg4V3VXdllab0tIYjFGRmtwRTFtT0ZhNTIraERR?=
 =?utf-8?B?OTNBN1lhVzlnSEpCOFBzOU4zWHFPWjI5QmVwRHQ4STk3aFd2YnJialdjS2RL?=
 =?utf-8?B?Znk5ckdTdDJ5OUphUXJTeXNycFdwZ2dYd1FrL3RLOWUySDNaUmtjVld4d2Jk?=
 =?utf-8?B?bXk4K1RFNHNPNC94WVc3RzkzTi9kaTQ4azJYVTRmY3M4dWVFQ291ZFdCZG9p?=
 =?utf-8?B?b2JiT0c2YUg1b1l1RGN6RzFRTE9Ra0RxUUhoejY1Z2ZxWEk1RzlWbFBBejE3?=
 =?utf-8?Q?E9qzOUJcdhy411XK7FsIAqxrB?=
MIME-Version: 1.0
X-OriginatorOrg: mathworks.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR05MB8716
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: mathworks.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRXJpYyBEZUNvc3RhDQo+
IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciA2LCAyMDIyIDM6MDIgUE0NCj4gVG86IEplZmYgSG9z
dGV0bGVyIDxnaXRAamVmZmhvc3RldGxlci5jb20+OyBFcmljIERlQ29zdGEgdmlhIEdpdEdpdEdh
ZGdldA0KPiA8Z2l0Z2l0Z2FkZ2V0QGdtYWlsLmNvbT47IGdpdEB2Z2VyLmtlcm5lbC5vcmcNCj4g
U3ViamVjdDogUkU6IFtQQVRDSCB2NCA0LzRdIGZzbW9uaXRvcjogbm9ybWFsaXplIEZTRXZlbnRz
IGV2ZW50IHBhdGhzIHRvIHRoZQ0KPiByZWFsIHBhdGgNCj4gDQo+IA0KPiANCj4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IEplZmYgSG9zdGV0bGVyIDxnaXRAamVmZmhv
c3RldGxlci5jb20+DQo+ID4gU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDYsIDIwMjIgMToxNCBQ
TQ0KPiA+IFRvOiBFcmljIERlQ29zdGEgPGVkZWNvc3RhQG1hdGh3b3Jrcy5jb20+OyBFcmljIERl
Q29zdGEgdmlhDQo+ID4gR2l0R2l0R2FkZ2V0IDxnaXRnaXRnYWRnZXRAZ21haWwuY29tPjsgZ2l0
QHZnZXIua2VybmVsLm9yZw0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgNC80XSBmc21vbml0
b3I6IG5vcm1hbGl6ZSBGU0V2ZW50cyBldmVudCBwYXRocw0KPiA+IHRvIHRoZSByZWFsIHBhdGgN
Cj4gPg0KPiA+DQo+ID4NCj4gPiBPbiA5LzIvMjIgMTI6MzUgUE0sIEVyaWMgRGVDb3N0YSB3cm90
ZToNCj4gPiA+DQo+ID4gPg0KPiA+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4g
Pj4gRnJvbTogSmVmZiBIb3N0ZXRsZXIgPGdpdEBqZWZmaG9zdGV0bGVyLmNvbT4NCj4gPiA+PiBT
ZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDEsIDIwMjIgNDowNiBQTQ0KPiA+ID4+IFRvOiBFcmlj
IERlQ29zdGEgdmlhIEdpdEdpdEdhZGdldCA8Z2l0Z2l0Z2FkZ2V0QGdtYWlsLmNvbT47DQo+ID4g
Pj4gZ2l0QHZnZXIua2VybmVsLm9yZw0KPiA+ID4+IENjOiBFcmljIERlQ29zdGEgPGVkZWNvc3Rh
QG1hdGh3b3Jrcy5jb20+DQo+ID4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCA0LzRdIGZzbW9u
aXRvcjogbm9ybWFsaXplIEZTRXZlbnRzIGV2ZW50DQo+ID4gPj4gcGF0aHMgdG8gdGhlIHJlYWwg
cGF0aA0KPiA+ID4+DQo+ID4gPj4NCj4gPiA+Pg0KPiA+ID4+IE9uIDgvMzEvMjIgMTI6MDkgUE0s
IEVyaWMgRGVDb3N0YSB2aWEgR2l0R2l0R2FkZ2V0IHdyb3RlOg0KPiA+ID4+PiBGcm9tOiBFcmlj
IERlQ29zdGEgPGVkZWNvc3RhQG1hdGh3b3Jrcy5jb20+DQo+ID4gPj4+DQo+ID4gPj4+IENvbnNp
ZGVyIHRoZSBmb2xsb3dpbmcgbmV0d29yayB3b3JraW5nIGRpcmVjdG9yeSB0aGF0IGlzIG1vdW50
ZWQNCj4gPiA+Pj4gdW5kZXINCj4gPiA+Pj4gL1N5c3RlbS9Wb2x1bWVzL0RhdGE6DQo+ID4gPj4+
DQo+ID4gPj4+IC9uZXR3b3JrL3dvcmtpbmcvZGlyZWN0b3J5DQo+ID4gPj4+DQo+ID4gPj4+IFRo
ZSBnaXQgd29ya2luZyBkaXJlY3RvcnkgcGF0aCBpczoNCj4gPiA+Pj4NCj4gPiA+Pj4gL1N5c3Rl
bS9Wb2x1bWVzL0RhdGEvbmV0d29yay93b3JraW5nL2RpcmVjdG9yeQ0KPiA+ID4+Pg0KPiA+ID4+
PiBUaGUgcGF0aHMgcmVwb3J0ZWQgYnkgRlNFdmVudHMgYWx3YXlzIHN0YXJ0IHdpdGggL25ldHdv
cmsuDQo+ID4gPj4+IGZzbW9uaXRvciBleHBlY3RzIHBhdGhzIHRvIGJlIHVuZGVyIHRoZSB3b3Jr
aW5nIGRpcmVjdG9yeTsNCj4gPiA+Pj4gdGhlcmVmb3JlIGl0IGZhaWxzIHRvIG1hdGNoIC9uZXR3
b3JrLy4uLiBhbmQgaWdub3JlcyB0aGUgY2hhbmdlLg0KPiA+ID4+DQo+ID4gPj4gSSdtIG5vdCBz
dXJlIEkgdW5kZXJzdGFuZCB3aGF0J3MgZ29pbmcgb24gaGVyZS4NCj4gPiA+PiBBcmUgeW91IHNh
eWluZyB0aGF0IEZTRXZlbnRzIHJlcG9ydHMgbmV0d29yayBtb3VudGVkIGRpcmVjdG9yaWVzDQo+
ID4gPj4gd2l0aCBhIHBhdGggcmVsYXRpdmUgdG8gdGhlIG1vdW50LXBvaW50IHJhdGhlciB0aGFu
IGFuIGFic29sdXRlIHBhdGg/DQo+ID4gPj4NCj4gPiA+DQo+ID4gPiBZZXMNCj4gPiA+DQo+ID4g
Pj4gSW4geW91ciBleGFtcGxlLCBpcyAiL25ldHdvcmsvd29ya2luZy9kaXJlY3RvcnkiIGEgdmFs
aWQgcGF0aCBvbg0KPiA+ID4+IHlvdXIgc3lzdGVtICh0aGF0IGFsc28gaGFwcGVucyB0byBiZSB0
aGUgc2FtZSBkaXJlY3RvcnkgYXMNCj4gPiA+PiAiL1N5c3RlbS9Wb2x1bWVzLy4uLiIpDQo+ID4g
Pj4NCj4gPiA+PiBUaGF0IGlzLCBkbyB5b3UgaGF2ZSBzb21lIGFsaWFzaW5nIGdvaW5nIG9uIHdo
ZXJlIGJvdGggcGF0aHMgYXJlDQo+ID4gPj4gdmFsaWQgLS0gbGlrZSBhIHBhaXIgb2YgaGFyZC1s
aW5rZWQgZGlyZWN0b3JpZXM/DQo+ID4gPj4gT3IsIGlzIHRoZXJlIHNvbWV0aGluZyBzcGVjaWFs
IGFib3V0IGEgbmV0d29yayBtb3VudCBwb2ludD8NCj4gPiA+Pg0KPiA+ID4+DQo+ID4gPj4gRGlk
IHlvdSBoYXZlIHRvICJjZCAvU3lzdGVtL1ZvbHVtZXMvLi4uIiB0byBnZXQgR2l0IHRvIGhhdmUg
dGhlDQo+ID4gPj4gYWJzb2x1dGUgcGF0aCBiZSB0aGlzPyBPciB3ZXJlIHlvdSBkb2luZyBhICJj
ZCAvbmV0d29yay8uLi4iPw0KPiA+ID4+IChTb3JyeSB0byBhc2sgc28gbWFueSBxdWVzdGlvbnMg
YnV0IEkgZG9uJ3QgaGF2ZSBhIHBhaXIgb2Ygc3lzdGVtcw0KPiA+ID4+IHRvIHRlc3QgYW55IG9m
IHRoaXMgb24gcmlnaHQgbm93LikNCj4gPiA+Pg0KPiA+ID4NCj4gPiA+ICIvbmV0d29yay93b3Jr
aW5nL2RpcmVjdG9yeSIgaXMgbW91bnRlZCB1bmRlcg0KPiA+ID4gIi9TeXN0ZW0vVm9sdW1lcy9E
YXRhL25ldHdvcmsvd29ya2luZy9kaXJlY3RvcnkiDQo+ID4gPg0KPiA+ID4gVGhlcmUgaXMgYWxz
byBhIHN5bWxpbms6DQo+ID4gPg0KPiA+ID4gIi9uZXR3b3JrIiAtPiAiL1N5c3RlbS9Wb2x1bWVz
L0RhdGEvbmV0d29yayINCj4gPiA+DQo+ID4gPiBObyBtYXR0ZXIgaWYgSSAiY2QgL1N5c3RlbS9W
b2x1bWVzL0RhdGEvbmV0d29yay93b3JraW5nL2RpcmVjdG9yeSINCj4gPiA+IG9yICJjZCAvbmV0
d29yay93b3JraW5nL2RpcmVjdG9yeSIgdGhlIHBhdGhzIHJlcG9ydGVkIGJ5IEZTRXZlbnRzDQo+
ID4gPiBhbHdheXMgc3RhcnQgd2l0aCAiL25ldHdvcmsvd29ya2luZy9kaXJlY3RvcnkiDQo+ID4g
Pg0KPiA+ID4gSWYgSSBkbyBhIHNpbWlsYXIgc3ltbGluayB3aXRoIGxvY2FsIGRpcmVjdG9yaWVz
LCBJIGRvIG5vdCBnZXQgdGhpcw0KPiA+ID4gdW5leHBlY3RlZCBiZWhhdmlvci4NCj4gPiA+DQo+
ID4gPiBJIG5lZWQgdG8gcmVtb3ZlIHRoZSBzeW1saW5rIGFuZCB0cnkgaXQgdGhhdCB3YXksIGJ1
dCBJIG5lZWQgdG8NCj4gPiA+IGNvb3JkaW5hdGUgd2l0aCB0aGUgbWFjaGluZSdzIG93bmVyLg0K
PiA+DQo+ID4NCj4gPiBJIHRoaW5rIHlvdSBoYXZlIHN0dW1ibGVkIHVwb24gYSByZWNlbnQgTWFj
T1MgZmVhdHVyZSBjYWxsZWQgImZpcm1saW5rcyIuDQo+ID4gSSdtIGp1c3QgcmVhZGluZyB1cCBv
biBpdCBteXNlbGYsIHNvIEkgc2hvdWxkbid0IHNwZWN1bGF0ZSBoZXJlICh5ZXQpLA0KPiA+IGJ1
dCBtYXliZSB5b3UgdG9vIGNvdWxkIGRvIHNvbWUgcmVhZGluZyBvbiB0aGUgc3ViamVjdC4NCj4g
Pg0KPiA+IFRoaXMgbWFrZXMgbWUgd29uZGVyIGlmIHRoZSBzeW1saW5rIGlzIGhpc3RvcmljYWwu
IFRoZSByZWFsIG1hZ2ljIGlzDQo+ID4gaW4gdGhlIGZpcm1saW5rcy4gRm9yIGV4YW1wbGUsIGlm
IEkgZG86DQo+ID4NCj4gPiAkIChjZCAvIDsgbHMgLWwgfCBncmVwIFVzZXJzKQ0KPiA+IGRyd3hy
LXhyLXggNiByb290IGFkbWluIDE5MiBBcHIgNiAyMDIwIFVzZXJzDQo+ID4NCj4gPiAkIChjZCAv
VXNlcnMgOyBkZiAuKQ0KPiA+IEZpbGVzeXN0ZW0gNTEyLWJsb2NrcyBVc2VkIEF2YWlsYWJsZSBD
YXBhY2l0eSBpdXNlZCBpZnJlZSAlaXVzZWQNCj4gPiBNb3VudGVkIG9uDQo+ID4gL2Rldi9kaXNr
MXMxIDk3NjQ5MDU3NiA2MDg5NTQzNDQgMzM4ODUwNDg4IDY1JSA0MTgxMzIzIDQ4NzgyNzE1NTcg
MCUNCj4gPiAvU3lzdGVtL1ZvbHVtZXMvRGF0YQ0KPiA+DQo+ID4gd2UgY2FuIHNlZSB0aGF0IC9V
c2VycyBpcyBvbiAvU3lzdGVtL1ZvbHVtZXMvRGF0YSAoYW5kIHRoZXJlIGlzIGENCj4gPiAvU3lz
dGVtL1ZvbHVtZXMvRGF0YS9Vc2VycyBkaXJlY3Rvcnkgd2l0aCB0aGUgc2FtZSBtZXRhZGF0YSks
IGJ1dCBpdA0KPiA+IGlzIG5vdCBhIHN5bWxpbmsuDQo+ID4NCj4gPg0KPiA+IFNlZSBbMV0gZm9y
IG1vcmUgaW5mby4NCj4gPg0KPiA+IFsxXQ0KPiA+IGh0dHA6Ly93d3cuc3dpZnRmb3JlbnNpY3Mu
Y29tLzIwMTkvMTAvbWFjb3MtMTAxNS12b2x1bWVzLWZpcm1saW5rLQ0KPiA+IG1hZ2ljLmh0bWwg
PGh0dHBzOi8vcHJvdGVjdC0NCj4gPg0KPiB1cy5taW1lY2FzdC5jb20vcy9RTjRxQ1lFWkIyaDFw
N2pXY0cxQ2J3P2RvbWFpbj1zd2lmdGZvcmVuc2ljcy5jbw0KPiA+IG0+DQo+ID4NCj4gPg0KPiAN
Cj4gSG1tLCBJIGRvbid0IHNlZSBhbnl0aGluZyB0aGF0IHN1Z2dlc3RzIGEgZmlybWxpbmsgaXMg
aW52b2x2ZWQgYnV0IHRoaXMgaXMgbmV3DQo+IHRvIG1lIHNvIG1heWJlIEkganVzdCBkb24ndCBz
ZWUgaXQuIFRoZXJlIGlzIGFuIGF1dG9tb3VudCBpbiBhZGRpdGlvbiB0byB0aGUNCj4gc3ltbGlu
ayB0aG91Z2guDQo+IA0KPiBTbywgZGlzcGVuc2luZyB3aXRoIHRoZSBhYnN0cmFjdCAiL25ldHdv
cmsiIHBhdGgsIGFuZCBnZXR0aW5nIHRvIHRoZSBkZXRhaWxzDQo+IG9mIG15IGVudmlyb25tZW50
Og0KPiANCj4gJSBtb3VudCB8IGdyZXAgL21hdGh3b3Jrcw0KPiBtYXAgYXV0by5zZnMuc29sMi5t
YXRod29ya3Mgb24gL1N5c3RlbS9Wb2x1bWVzL0RhdGEvbWF0aHdvcmtzDQo+IChhdXRvZnMsIGF1
dG9tb3VudGVkLCBub2Jyb3dzZSkgdHJpZ2dlcmVkIG1hcCBhdXRvLnNmcy5zb2wyLmRldmVsIG9u
DQo+IC9TeXN0ZW0vVm9sdW1lcy9EYXRhL21hdGh3b3Jrcy9kZXZlbCAoYXV0b2ZzLCBhdXRvbW91
bnRlZCwNCj4gbm9icm93c2UpIHRyaWdnZXJlZCBtYXAgc2ZzLndvcmxkd2lkZS5VUy1OYXRpY2su
c29sMi5kZXZlbC5zYnMgb24NCj4gL1N5c3RlbS9Wb2x1bWVzL0RhdGEvbWF0aHdvcmtzL2RldmVs
L3NicyAoYXV0b2ZzLCBhdXRvbW91bnRlZCwNCj4gbm9icm93c2UpIHRyaWdnZXJlZCBtYXAgc2Zz
Lndvcmxkd2lkZS5VUy1OYXRpY2suZGV2ZWwuc2JzLjI5IG9uDQo+IC9TeXN0ZW0vVm9sdW1lcy9E
YXRhL21hdGh3b3Jrcy9kZXZlbC9zYnMvMjkgKGF1dG9mcywgYXV0b21vdW50ZWQsDQo+IG5vYnJv
d3NlKQ0KPiBiYXRmcy1zYjI5LW5mczovdm1nci9zYnMyOS9lZGVjb3N0YS5CYmFzaHByb2QxLmox
OTI4NTYwLjIgb24NCj4gL1N5c3RlbS9Wb2x1bWVzL0RhdGEvbWF0aHdvcmtzL2RldmVsL3Nicy8y
OS9lZGVjb3N0YS5CYmFzaHByb2QxLmoxOQ0KPiAyODU2MC4yIChuZnMsIG5vZGV2LCBhdXRvbW91
bnRlZCwgbm9hdGltZSwgbm9icm93c2UpIC4uLg0KPiANCj4gJSBscyAtbCAvIHwgZ3JlcCBtYXRo
d29ya3MNCj4gbHJ3eHIteHIteCAgIDEgcm9vdCAgd2hlZWwgICAgMzUgQXVnIDI5IDEwOjI1IGhv
bWVAIC0+DQo+IC9TeXN0ZW0vVm9sdW1lcy9EYXRhL21hdGh3b3Jrcy9ob21lDQo+IGxyd3hyLXhy
LXggICAxIHJvb3QgIHdoZWVsICAgIDMwIEF1ZyAyOSAxMDoyNSBtYXRod29ya3NAIC0+DQo+IC9T
eXN0ZW0vVm9sdW1lcy9EYXRhL21hdGh3b3Jrcw0KPiANCj4gTXkgd29ya3RyZWUgaXM6DQo+IC9T
eXN0ZW0vVm9sdW1lcy9EYXRhL21hdGh3b3Jrcy9kZXZlbC9zYnMvMjkvZWRlY29zdGEuQmJhc2hw
cm9kMS5qMTkNCj4gMjg1NjAuMg0KPiBvciwgZXF1aXZhbGVudGx5IHZpYSB0aGUgc3ltbGluayBq
dXN0Og0KPiAvbWF0aHdvcmtzL2RldmVsL3Nicy8yOS9lZGVjb3N0YS5CYmFzaHByb2QxLmoxOTI4
NTYwLjINCj4gDQo+IEkgaGF2ZSBzdWRvJ2VycyBhY2Nlc3Mgbm93OyBzbyBJIGNhbiB0cnkgbW91
bnRpbmcgdGhpbmdzIG1hbnVhbGx5LCBtZXNzDQo+IGFib3V0IHdpdGggc3ltbGlua3MgYW5kIHNl
ZSB3aGF0IEkgZ2V0Lg0KPiANCj4gPiBbLi4uXQ0KPiA+ID4+PiBAQCAtMjA5LDcgKzIwOSwxMiBA
QCBzdGF0aWMgdm9pZA0KPiA+ID4+IGZzZXZlbnRfY2FsbGJhY2soQ29uc3RGU0V2ZW50U3RyZWFt
UmVmIHN0cmVhbVJlZiwNCj4gPiA+Pj4gLyoNCj4gPiA+Pj4gKiBPbiBNYWMsIHdlIHJlY2VpdmUg
YW4gYXJyYXkgb2YgYWJzb2x1dGUgcGF0aHMuDQo+ID4gPj4+ICovDQo+ID4gPj4+IC0gcGF0aF9r
ID0gcGF0aHNba107DQo+ID4gPj4+ICsgaWYgKGZzbV9zZXR0aW5nc19fZ2V0X2FsbG93X3JlbW90
ZSh0aGVfcmVwb3NpdG9yeSkgPiAwKSB7DQo+ID4gPj4+ICsgc3RyYnVmX3Jlc2V0KCZ0bXApOyBz
dHJidWZfcmVhbHBhdGhfZm9yZ2l2aW5nKCZ0bXAsIHBhdGhzW2tdLA0KPiA+ID4+PiArIDApOyBw
YXRoX2sgPSB0bXAuYnVmOyB9IGVsc2UgcGF0aF9rID0gcGF0aHNba107DQo+ID4gPj4NCj4gPiA+
PiBUaGlzIGZlZWxzIHdyb25nLg0KPiA+ID4+DQo+ID4gPj4gSXQgaXMgbm90IHRoYXQgZnNtb25p
dG9yLmFsbG93UmVtb3RlIGlzIHRydWUsIGJ1dCB3aGV0aGVyIG9yIG5vdA0KPiA+ID4+IHRoaXMg
cGFydGljdWxhciBmaWxlIHN5c3RlbSAqSVMqIHJlbW90ZSwgcmlnaHQ/DQo+ID4gPg0KPiA+ID4g
VHJ1ZS4gSSBzdXBwb3NlIGVhY2ggcGF0aCBjb3VsZCBiZSBjaGVja2VkLCBvciBzb21lIGJpdCBj
b3VsZCBiZSBzZXQNCj4gPiA+IGlmIHRoZSB3b3JraW5nIGRpcmVjdG9yeSBpcyByZW1vdGUsIHBl
cmhhcHMgYWxvbmcgdGhlIGxpbmVzIG9mDQo+ID4gPiBmc21vbml0b3JfaXBjX19nZXRfcGF0aC4g
VGhlbiB0aGUgZGV0ZXJtaW5hdGlvbiBvZiB0aGUgSVBDIHBhdGggYW5kDQo+ID4gPiB3aGV0aGVy
IGl0IGlzIHJlbW90ZSB3b3VsZCBiZSBpbiBvbmUgcGxhY2UuIGZzbS1zZXR0aW5ncy0qIHdvdWxk
DQo+ID4gPiB0aGVuIGp1c3QgZ2V0IHRoYXQgYml0IGFuZCBjaGVjayBpdCBhZ2FpbnN0IGFsbG93
UmVtb3RlLg0KPiA+ID4NCj4gPiA+IFRob3VnaHRzPw0KPiA+DQo+ID4gSSdsbCBkbyBzb21lIGRp
Z2dpbmcgaGVyZS4gVGhlcmUgb3VnaHQgdG8gYmUgYSB3YXkgdG8gdGVsbCBpZiBhDQo+ID4gY29t
cG9uZW50IGRpcmVjdG9yeSBpbiBhIHBhdGhuYW1lIGhhcyBhIGZpcm1saW5rIHBlZXIuIChCdXQg
SSdtDQo+ID4gdHJhdmVsaW5nIGZvciBHaXRNZXJnZSwgc28gSSBtaWdodCBub3QgaGF2ZSB0aW1l
IHRvIGxvb2sgYXQgdGhpcyB1bnRpbA0KPiA+IGFmdGVyd2FyZHMuKQ0KPiA+DQo+ID4gVGhpcyB3
b3VsZCBpbmRpY2F0ZSB0aGF0IGEgImJpLWRpcmVjdGlvbmFsIHdvcm1ob2xlIiAodGhlaXIgd29y
ZHMpDQo+ID4gYWxpYXMgaXMgYXZhaWxhYmxlIChhbmQgaG9wZWZ1bGx5LCBhIHdheSB0byBjb21w
dXRlciB0aGUgb3RoZXINCj4gPiBwZWVyLi4uLikNCj4gPg0KPiA+IEknbSB0aGlua2luZyB0aGF0
IHRoZSAiL25ldHdvcmsvLi4uIiBwYXRoIGluIHRoZSBGU0V2ZW50cyBpcyBiZWNhdXNlDQo+ID4g
RlNFdmVudEQgaXMgdXNpbmcgYSBwYXJ0aWN1bGFyIHBlZXIgc3BlbGxpbmcgKHRoYXQgd2Ugd2Vy
ZW4ndA0KPiA+IGV4cGVjdGluZykuDQo+ID4NCj4gPiBJZiB3ZSBjYW4gY29tcHV0ZSB0aGUgc3Bl
bGxpbmdzIG9mIHRoZSBwZWVycyBvbmNlIHdoZW4gdGhlIGRhZW1vbg0KPiA+IHN0YXJ0cyB1cCAo
YW5kIG1heWJlIG1ha2UgYSBsaXR0bGUgZGljdGlvbmFyeSksIHRoZW4gd2UgY2FuIGRvIHByZWZp
eA0KPiA+IHRyaWNrcyBvbiB0aGUgYWJzb2x1dGUgcGF0aCBhZnRlciB0aGUgcGF0aF9rID0gcGF0
aHNba107IHN0ZXAgaW4NCj4gPiBmc2V2ZW50X2NhbGxiYWNrKCkgdG8gZXh0cmFjdCBhIHJlbGF0
aXZlIHBhdGggcmF0aGVyIHRoYW4gYW4gYWJzb2x1dGUNCj4gPiBwYXRoLg0KPiA+DQo+ID4gVGhl
biBjYWxsIGZzbW9uaXRvcl9jbGFzc2lmeV9wYXRoX3JlbGF0aXZlKCkgaW5zdGVhZCBvZiBfYWJz
b2x1dGUoKS4NCj4gPg0KPiA+IFdhdGNoIG91dCB0aG91Z2gsIHRoZXJlIGFyZSBzZXZlcmFsIHBs
YWNlcyB0aGF0IGRvIHJlbCA9IHBhdGgrayArDQo+ID4gLi4uc3RhdGUtPnBhdGhfd29ya3RyZWVf
d2F0Y2gubGVuLi4uDQo+ID4gdGhhdCB3b3VsZCBuZWVkIHRvIGJlIGFkanVzdGVkLg0KPiA+DQo+
ID4gSG9wZSB0aGlzIGhlbHBzLA0KPiA+IEplZmYNCj4gPg0KPiA+DQo+IFRoYW5rcyBmb3IgdGhl
IGluc2lnaHRzLCBJJ2xsIGRpZyBhcm91bmQgYW5kIHRlc3QgdGhpbmdzIG91dCBzb21lIG1vcmUu
DQo+IA0KPiAtRXJpYw0KDQpUaGlzIGlzIGluZm9ybWF0aXZlOg0KDQpodHRwczovL2RldmVsb3Bl
ci5hcHBsZS5jb20vZm9ydW1zL3RocmVhZC8xMjA2NjUNCg0KLUVyaWMNCg0KDQo=

