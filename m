Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F93AC433F5
	for <git@archiver.kernel.org>; Fri, 22 Apr 2022 14:29:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1445426AbiDVOcu convert rfc822-to-8bit (ORCPT
        <rfc822;git@archiver.kernel.org>); Fri, 22 Apr 2022 10:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448697AbiDVOcn (ORCPT <rfc822;git@vger.kernel.org>);
        Fri, 22 Apr 2022 10:32:43 -0400
Received: from elephants.elehost.com (elephants.elehost.com [216.66.27.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C7E5BD1A
        for <git@vger.kernel.org>; Fri, 22 Apr 2022 07:29:49 -0700 (PDT)
Received: from Mazikeen (cpe00fc8d49d843-cm00fc8d49d840.cpe.net.cable.rogers.com [174.119.96.21] (may be forged))
        (authenticated bits=0)
        by elephants.elehost.com (8.16.1/8.16.1) with ESMTPSA id 23METgQd054347
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 22 Apr 2022 10:29:42 -0400 (EDT)
        (envelope-from rsbecker@nexbridge.com)
Reply-To: <rsbecker@nexbridge.com>
From:   <rsbecker@nexbridge.com>
To:     "'Jeff Hostetler'" <git@jeffhostetler.com>,
        "'brian m. carlson'" <sandals@crustytoothpaste.net>,
        "'Jason Morgan'" <jasomorg@qti.qualcomm.com>, <git@vger.kernel.org>
References: <BN0PR02MB79194599872BD3693CD72CF4F2F49@BN0PR02MB7919.namprd02.prod.outlook.com> <BN0PR02MB79195847F60CA239AE9F5CE3F2F49@BN0PR02MB7919.namprd02.prod.outlook.com> <YmIFeIrTBx6yghwn@camp.crustytoothpaste.net> <fee354b5-e343-c997-b75a-63cf785b5337@jeffhostetler.com>
In-Reply-To: <fee354b5-e343-c997-b75a-63cf785b5337@jeffhostetler.com>
Subject: RE: git push locks up forever, file protocol
Date:   Fri, 22 Apr 2022 10:29:37 -0400
Organization: Nexbridge Inc.
Message-ID: <02b301d85655$6881b710$39852530$@nexbridge.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQE4kVsCyE70WYpBNVv8xXQVbBZyJQF6qSlrAO0fsZsB9h5zDa4YmBvg
Content-Language: en-ca
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

On April 22, 2022 10:17 AM, Jeff Hostetler wrote:
>On 4/21/22 9:31 PM, brian m. carlson wrote:
>> On 2022-04-21 at 08:30:50, Jason Morgan wrote:
>>> Hi,
>>>
>>> We have a remote repo accessed using the 'file:' protocol, mounted over
>Samba using drvfs into a WSL2 instance of Ubuntu 20.04.
>>>
>>> We find a 'git push' waits forever. git version 2.25.1
>>
>> I seem to recall that we've fixed some various issues with protocol
>> handling in the 2.29 timeframe.  Is it possible you could try 2.36.0
>> to see if you can reproduce it there?
>>
>> Also, it would be interesting to see if there's a difference in
>> behaviour between setting protocol.version to 0 and setting it to 2.
>> That might tell us something that would help tracking this down.
>>
>>> Over a local LAN this works fine, but over a VPN this fails, hinting at some sort
>of race condition.
>>>
>>> Output from strace hints that git is trying (and failing) to read from a closed file
>handle.
>>
>> I don't think this is the case.  If Git were trying to read from a
>> closed file handle, the kernel would immediately return -1 with errno
>> set to EBADF.  Those operations won't block because there's nothing to
>> read.
>>
>>> Final output from strace:
>>>
>>> -----------
>>> openat(AT_FDCWD,
>>> ".git/objects/ad/065dad4384ae8c81c120c562985078d1f7b34b",
>>> O_RDONLY|O_CLOEXEC) = 3 fstat(3, {st_mode=S_IFREG|0444, st_size=152,
>>> ...}) = 0 mmap(NULL, 152, PROT_READ, MAP_PRIVATE, 3, 0) =
>>> 0x7f3e0e4af000
>>> close(3)                                = 0 munmap(0x7f3e0e4af000,
>>> 152)             = 0 openat(AT_FDCWD,
>>> ".git/objects/30/2508dfe5201db6c000ebf17b0c69e3afb31218",
>>> O_RDONLY|O_CLOEXEC) = 3 fstat(3, {st_mode=S_IFREG|0555, st_size=214,
>>> ...}) = 0 mmap(NULL, 214, PROT_READ, MAP_PRIVATE, 3, 0) =
>>> 0x7f3e0e4af000
>>> close(3)                                = 0 munmap(0x7f3e0e4af000,
>>> 214)             = 0 openat(AT_FDCWD,
>>> ".git/objects/d2/2323ec2ec40a74fbd519509662254c3cfda206",
>>> O_RDONLY|O_CLOEXEC) = 3 fstat(3, {st_mode=S_IFREG|0444, st_size=161,
>>> ...}) = 0 mmap(NULL, 161, PROT_READ, MAP_PRIVATE, 3, 0) =
>>> 0x7f3e0e4af000
>>> close(3)                                = 0
>>
>> FD 3 is closed here...
>>
>>> munmap(0x7f3e0e4af000, 161)             = 0
>>> access(".git/hooks/pre-push", X_OK)     = -1 ENOENT (No such file or
>>> directory) write(4, "00953ea50e3c1f49c33f7dbbb5e3a310"..., 149) = 149
>>> write(4, "0000", 4)                     = 4 pipe([3, 6])
>>> = 0
>>
>> And then it's recreated here as one part of a pipe, so it isn't closed.
>>
>>> fcntl(6, F_GETFD)                       = 0 fcntl(6, F_SETFD,
>>> FD_CLOEXEC)           = 0 mmap(NULL, 8392704, PROT_NONE,
>>> MAP_PRIVATE|MAP_ANONYMOUS|MAP_STACK, -1, 0) = 0x7f3e0d641000
>>> mprotect(0x7f3e0d642000, 8388608, PROT_READ|PROT_WRITE) = 0
>>> clone(child_stack=0x7f3e0de40fb0,
>>>
>flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|C
>LONE_
>>> SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID,
>>> parent_tid=[12802], tls=0x7f3e0de41700, child_tidptr=0x7f3e0de419d0)
>>> = 12802
>>
>> My guess is that in the child (which isn't shown here) that FD 6 is
>> hooked up to either standard output or standard error.  You'd need to
>> follow children to see.
>>
>>> pipe([7, 8])                            = 0
>>> stat("/usr/lib/git-core/git", {st_mode=S_IFREG|0755, st_size=3093072,
>>> ...}) = 0 pipe([9, 10])                           = 0
>>> rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], [], 8) = 0
>>> clone(child_stack=NULL,
>>> flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD,
>>> child_tidptr=0x7f3e0e1dae50) = 12803 rt_sigprocmask(SIG_SETMASK, [],
>>> NULL, 8) = 0
>>> close(10)                               = 0 read(9, "", 8)
>>> = 0
>>> close(9)                                = 0
>>> close(7)                                = 0
>>> close(4)                                = 0 fcntl(8, F_GETFL)
>>> = 0x1 (flags O_WRONLY) openat(AT_FDCWD, ".git/objects/3e",
>>> O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 4 fstat(4,
>>> {st_mode=S_IFDIR|0777, st_size=4096, ...}) = 0 getdents64(4, /* 22
>>> entries */, 32768)  = 1328 getdents64(4, /* 0 entries */, 32768)   =
>>> 0
>>> close(4)                                = 0 fstat(8,
>>> {st_mode=S_IFIFO|0600, st_size=0, ...}) = 0 write(8,
>>> "^3ea50e3c1f49c33f7dbbb5e3a31017f"..., 83) = 83
>>> close(8)                                = 0 Enumerating objects: 31,
>>> done.ts: 1 Counting objects: 100% (31/31), done.
>>> Delta compression using up to 8 threads Compressing objects: 100%
>>> (23/23), done.
>>> Writing objects: 100% (23/23), 5.60 KiB | 212.00 KiB/s, done.
>>> Total 23 (delta 14), reused 0 (delta 0)
>>> [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 12803
>>> --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=12803,
>>> si_uid=1000, si_status=0, si_utime=2, si_stime=6} --- read(3,
>>
>> If FD 6 were wired up to something in the child and the child exited
>> (which, having received SIGCHLD, is a safe bet), then we'd expect this
>> to see this process get EOF.
>>
>> It's not clear to me what's going on here, but I think this code is
>> ending up in connect.c (search for "transport/file").  Maybe someone
>> else has an idea?
>>
>
>Not sure I can add anything here to what Brian has already said, but you might try
>setting GIT_TRACE2_PERF to an absolute path of a file or an existing directory.
>That'll give you tracing around the child.

The only time I've seen something like this was when we had a poll issue setting a continuation after a non-block condition with no data that caused the stack to get confused. IIRC it was about 4 years ago and one of my first contributions. I don't think this is the same thing because poll does not seem to be involved.
--Randall

