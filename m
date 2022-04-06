Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCEDC433F5
	for <git@archiver.kernel.org>; Wed,  6 Apr 2022 21:32:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236184AbiDFVe3 (ORCPT <rfc822;git@archiver.kernel.org>);
        Wed, 6 Apr 2022 17:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232753AbiDFVeC (ORCPT <rfc822;git@vger.kernel.org>);
        Wed, 6 Apr 2022 17:34:02 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82DF62C1
        for <git@vger.kernel.org>; Wed,  6 Apr 2022 13:46:18 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id k2so4047868edj.9
        for <git@vger.kernel.org>; Wed, 06 Apr 2022 13:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=8yDyDDgmavbbsG+qIfNBD8Ux0gS5R+4Jdnj+m8XWCrY=;
        b=Iohqq/nz+5BbPf6xvVgYQPxWC6FjoN+J3MIHzpt3mFVBD3hwhxdxCg3YbqYMmeZG2q
         dWOgN9ASg9u2prgWAxDu3a84q/9nNKS1shBqb06m12ANH/GeEVHo4xULp/ZwcIbGltuh
         oegwhirIbeuetv0XQQMr3oi4ifXfAkO7WLC/8JL4W4zhb0pKlHRmNMJZSds4kXgmyVOs
         UnhwAfzWxGAl/clZ7ZFXthYYJBWRb+ki6pH3JoXjnE/Q3Z1uAsqiOSVHuZvPbtdpOtd2
         rIGvEy6rB0XW1I3N0MWq9N65YRL8bjvIZxwM6F5e8MRhSqgoGUMwnXVxGpqdZSkYa+04
         LTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=8yDyDDgmavbbsG+qIfNBD8Ux0gS5R+4Jdnj+m8XWCrY=;
        b=bwHZu12p2iwJheudI1TfXzzCnnkNCOH/X8QUEJfaowdiU78Ts+UZUw7ulGGOXQvBWv
         wGFeBXqfQS+qEZJR+OzsfucAB0M0GXbkfvBH1idWve4BsNaTOnKYWh137czACKutLdwJ
         Pcy+wK0xu8KpAkzl+XVB9L0GKyx0CElnlXIOgHgSLYIp7pebojK2hyqXoXRdDEuS/2Y5
         n4Lztltm3Zezbc1nTR/7A/EY+21mNR1yQiCbglgBtsPY+NRrVOiyLztQqXdATPatLxpD
         8Lec2f41aDMZ4MDL73xWnIex/wHDm/aCOSHYtOLKY+NpmxgTfEQyw+FVRo3z0BANi6kA
         BNdw==
X-Gm-Message-State: AOAM532iiTi0H55lyz01wv0PS+4fQ8BlACTlPWv2Uq6XtjTV2/ZTfp4n
        OHT8T6LizoDjPNf3Ar68ETxYjsMdJnmpZg4opYF5/2UA1I0=
X-Google-Smtp-Source: ABdhPJzeTuWYaKWU/wrlOy3MIYqvpgc8wfkps3Q8+4KKnVLM+gUj2WAUJDsZOj7UQnRP/TCZxsWocHUxxOurrAZRxOs=
X-Received: by 2002:a05:6402:274b:b0:41c:dc34:32fc with SMTP id
 z11-20020a056402274b00b0041cdc3432fcmr10857744edd.355.1649277976203; Wed, 06
 Apr 2022 13:46:16 -0700 (PDT)
MIME-Version: 1.0
From:   Abhradeep Chakraborty <chakrabortyabhradeep79@gmail.com>
Date:   Thu, 7 Apr 2022 02:16:04 +0530
Message-ID: <CAPOJW5xMOfq4fCR8iYLkizbW=ajv7W9fffgQfkeN3qVKh1wOvA@mail.gmail.com>
Subject: [GSoC][RFC][PROPOSAL] Reachability bitmap improvements
To:     git <git@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org

Hello everyone,

Here is the initial version of my proposal on "Reachability bitmap
improvements". I would really love to have comments on it. If you
find any mistakes please notify me about that.

The proposal template is inspired by Hariom Verma's (This year's
GSoC mentor) previous year's gsoc proposal.

Thanks :)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

View on Docs: https://docs.google.com/document/d/15tZ5QbMtYN41No5wdMw-2Ilp6=
3vquB7OqAwBCLl_0n0/edit?usp=3Dsharing

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

**Reachability bitmap improvements**

Name  :  Abhradeep Chakraborty
Major : Information Technology
Mobile No. : [ ... ]
Email : chakrabortyabhradeep79@gmail.com
GitHub Profile: (Abhra303)[https://github.com/Abhra303]
LinkedIn : www.linkedin.com/in/abhradeep-chakraborty-b36426201
Time Zone : Indian Standard Time ( IST ) ( UTC +05:30 )

## About Me

I am Abhradeep Chakraborty, currently pursuing B.Tech in Information
Technology (now in my 3rd year) at Jalpaiguri Government Engineering
College, India.

In the last two years, I mainly concentrated on learning and building
web development things. I mainly use Django, React for my projects. But
for the past 6 months, I have been learning about devops, cloud technologie=
s
( e.g. docker, Kubernetes, AWS etc.), computer networking and core
technologies (such as git, linux, gcc etc.). I also have an interest in
some research based technologies like WebRTC, Web3 etc.

My ultimate objective is to be a dedicated and active contributor to all
of these technologies. So, I want to start this contribution journey with
`git` and therefore I want to be a part of this GSoC program.

## Me & Git

I have started exploring the Git codebase since Sept 2021. At first, I
mainly focused on knowing the git internals. During this time I read
documentations (Under `Documentation` directory). `MyFirstContribution.txt`=
[1],
`MyFirstObjectWalk.txt`[2] and `Hacking Git`[3] helped me to learn about th=
e git
contribution workflow, how `git log` ( in other words `object walk`) works
internally.

Though I had read many documentations, I was still not able to fully
understand the terminologies (like `refs`, `packfiles`, `blobs`, `trees`
etc.). (ProGit)[https://git-scm.com/book/en/v2] helped me tremendously here=
.
I read the full book and it cleared almost every doubt that came into my mi=
nd.

I have provided my git involvement history below. Activities are sorted
by timeline from top to bottom.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
PRs, Commits & Discussion Participations
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

---------------------------------
[patch] Amend error messages that violate git coding style convention
Github link : https://github.com/gitgitgadget/git/pull/1062
Status : Not Merged/ PR
Description : There are many error strings which do not follow coding
style guides. This PR was to fix those. There is a ticket dedicated to
this ( github Issue - (#635)[https://github.com/gitgitgadget/git/issues/635=
]).
The author of this issue said it would be better to manually correct
these things.
Outcome : As this was my first PR, I made many mistakes and I faced
difficulties. Though this was not merged, I learned tremendous new
things. These violating strings were in many files ( nearly 200 files).
At first, I fixed all the files at once manually. I fixed errors
generated by those changes. Ultimately, I learned about overall git
structures, how to fix errors etc.

---------------------------------
[RFC PATCH 0/1] making set-upstream have default arguments
Mailing List : https://lore.kernel.org/git/20211202144354.17416-1-chakrabor=
tyabhradeep79@gmail.com/
Status : Not Merged/ Closed
Description : `git push -u` generally ( if `push.default` not set)
throws an error if no arguments are provided. This patch request was to
teach `git push -u` to push and set a default upstream if no arguments
are provided. There is a github
(issue)[https://github.com/gitgitgadget/git/issues/1061]
also.
Outcome : This PR let `git push -u` to push to a default branch and
set that as the upstream irrespective of `push.default` configuration.
I realized it was badly affecting the reason `push.default` is built
for ( See this (comment)[https://lore.kernel.org/git/20220104132839.1209-1-=
chakrabortyabhradeep79@gmail.com/]).
So, I intentionally stopped working on it.

----------------------------------
Avoid checking for -h in commands that already use parse-options API ( Issu=
e)
Github Issue Link : https://github.com/gitgitgadget/git/issues/1125
Status : Closed

----------------------------------
[PATCH] Add usage strings ci check and amend remaining usage strings
Github PR Link : https://github.com/gitgitgadget/git/pull/1147
Mailing List Link :
https://lore.kernel.org/git/pull.1147.git.1645030949730.gitgitgadget@gmail.=
com/
Status : Merged into Master
Description : According to dscho=E2=80=99s
(comment)[https://github.com/gitgitgadget/git/issues/636#issuecomment-10186=
60439],
There were still some usage strings that violated the style guide.
So, this patch request fixed those strings and added a CI check to
verify all the usage strings are passing the style check. In the first
version, I built a shell script to check the validity of strings.
Outcome : The first commit was merged into master. There were some
contradictions about the different approaches suggested by reviewers
in the discussion about the last commit i.e. whether the check should
be static check or runtime check, whether I should use `parse options`
method or coccinelle etc (see the (mailing
list)[https://lore.kernel.org/git/nycvar.QRO.7.76.6.2202251632320.11118@tvg=
sbejvaqbjf.bet/]).
Lastly, it was decided that I should try the `coccinelle` method first
and check if it is better ( see this
(comment)[https://lore.kernel.org/git/20220304142154.2350-1-chakrabortyabhr=
adeep79@gmail.com/]).
I will try to submit a PR regarding this before April 19.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
MicroProject
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D

[PATCH] Partial-Clone : add a partial-clone test case
Github PR Link : https://github.com/gitgitgadget/git/pull/1175
Status : Merged into Master
Github Issue : https://github.com/gitgitgadget/git/issues/827
Description : In a blobless-cloned repo, `git log =E2=80=93follow =E2=80=93=
 <path>`
(`<path>` have an exact OID rename) shouldn=E2=80=99t download blobs of the
file from where the new file is renamed. This patch added a test case
to verify it.
Outcome : The test was added to the master branch. Moreover, another
issue was discovered while discussing the patch request. Junio discovered
that the test helper function `test_subcommand_inexact` was poorly designed=
.
Later Derrick submitted a (PR)[https://github.com/gitgitgadget/git/pull/118=
5]
to fix it ( now merged).

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
Review
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
[PATCH] test-lib-functions : fix test_subcommand_inexact
Github PR Link : https://github.com/gitgitgadget/git/pull/1185
Description : Junio discovered that the `test_subcommand_inexact` function
(test-helper function) is poorly designed. This PR addresses that.
My comment : Though I placed it under the `Review` section; but I didn=E2=
=80=99t
review the code here. Instead I gave my opinion regarding this in
(this comment)[https://lore.kernel.org/git/20220324181056.53824-1-chakrabor=
tyabhradeep79@gmail.com/].

## Proposed Project

### Abstract

While sending large repositories, git has to decide what needs to be
sent, how to be sent. For large repositories, git creates pack files
where it packs all the related commits, trees, blobs( in the form of
deltas and bases ), tags etc. Now, finding the related objects among
all the objects might be very expensive.

As git only knows about the branch tips, it is very expensive to find
the related objects from all the objects if we try to traverse down
from the branch tips to all their respective related objects. It becomes
more expensive as the number of objects (i.e. commits, trees, blobs
etc.) increases. Ultimately resulting in slow fetching from the git
daemon.

To counter that, reachability bitmaps were introduced. It uses bitmap
data structure (an array of bits) to detect if an object is reachable
from a particular commit or not. The commit messages of this
(patch series)[https://lore.kernel.org/git/1372116193-32762-1-git-send-emai=
l-tanoku@gmail.com/]
are itself a documentation of how it is achieved. All the bitmap
indexes for selected commits (in a EWAH compressed form) are stored in
a `.bitmap` file which has the same name of its respective packfile.

The current task is to improve the performance of this bitmap approach.
There are three points that we need to work on -

1. Decompression of bitmaps is slow with EWAH. To know if an object is
   related to a particular commit, we have to decompress the whole thing.
   So, we have to consider other alternative techniques besides EWAH.

2. Loading a `.bitmap` file can be slow for large bitmaps. This is because
   we need to read the file sequentially in order to discover the offset of
   each bitmap within the file. It would be better if we can create a `tabl=
e
   of contents` for these bitmaps.

3. Regenerating bitmaps can take a long time. One possible approach is to
   add a new mode which only adds new bitmaps for commits introduced betwee=
n
   successive bitmap generations.

4. If we solve the above points, we would think of other aspects like
   rethinking how we select which commit receives bitmaps etc.

### Previous Work

I didn=E2=80=99t find any previous patches regarding point no. 1. But there=
 were
some discussions about this. Derrick=E2=80=99s
(comment)[https://lore.kernel.org/git/1685a358-f033-64e0-2e12-df3a1c10af19@=
gmail.com/]
suggested considering the
(Roaring+Run)[https://roaringbitmap.org/about/]
technique. It is much faster than the currently implemented
(EWAH)[https://arxiv.org/abs/0901.3751].

Taylor initiated the `developing a table of contents for bitmap` work
by creating a
(branch and committing some
patches)[https://github.com/git/git/compare/master...ttaylorr:tb/bitmap-com=
mit-table]
in that branch. From the
(discussion)[https://lore.kernel.org/git/YNuiM8TR5evSeNsN@nand.local/]
and the performance test results provided in that discussion,  it seems
that it would improve overall performance. So, this would work as a
reference for me while developing the table of contents for bitmaps
(obviously after running performance tests and discussing the best
approach).

### Potential Problem

The biggest difficulty of this project would be to replace the EWAH
compression/decompression altogether with better techniques like the
Roaring+Run method. I have to be aware of it so that it doesn=E2=80=99t
generate any unintentional behavior or bugs.

### The plan

As this project includes three ( actually four) sub projects, I would
address them one by one -
1. Firstly I will understand the working of EWAH compression better.
   I have gone through their documentation and have seen git=E2=80=99s
   implementation code for it. The commit messages were really helpful
   here. But I think I should research more. After that,  I can compare
   (and discuss) each approach with respect to the EWAH approach on
   some parameters (like amount of computation in each approach,
   simplicity, memory usage, correctness i.e. does it always give the
   correct output etc.). This comparison would lead me to take the
   most ideal approach in this case. There are several techniques which
   may work/perform better than the current EWAH implementation. I
   have researched some of these techniques. One of them is obviously
   the Roaring+Run method. I have gone through their
   (research paper)[https://arxiv.org/pdf/1709.07821v6.pdf]
   on this technique; it seems like a good approach to me. Other than
   that, there is a golang package called
   (sroar)[https://dgraph.io/blog/post/serialized-roaring-bitmaps-golang/]
   (i.e. Serialized Roaring bitmaps), which is an open source package
   ( mainly built for (Dgraph)[https://dgraph.io/])
   and the creator of this package claims it is
   (7x faster using 15x less
memory)[https://github.com/dgraph-io/sroar#benchmarks].
   It doesn=E2=80=99t require any encoding/decoding step. I would look into
   it ( It needs to be implemented in C language though). I have also
   looked into approaches like
   (bloom filter)[https://en.wikipedia.org/wiki/Bloom_filter],
   (Hyperloglog)[https://en.wikipedia.org/wiki/HyperLogLog]. These are
   very fast and use very less memory. But they give probabilistic
   answers and sometimes they may give wrong answers. So, those
   would not be a good fit for us I guess.
2. I will understand the bitmap related files such as
   `pack-bitmap-write.c`[4], `pack-bitmap.c`[5] etc. It would
   help me to decide where and how I can add the code related to
   `table of contents` for bitmap.
   Taylor=E2=80=99s (branch
work)[https://github.com/git/git/compare/master...ttaylorr:tb/bitmap-commit=
-table]
   would work as a reference for me. As the Project idea section
   suggests, I would also include performance tests to continuously
   check whether my approach is really improving the performance or
   not.
3. As I understand more about bitmap related files, I will surely
   be able to think whether `adding a new mode` is really necessary
   or not (It is conceptually a good idea though). If necessary,
   then I would first make the flow design and discuss it with the
   community. If all is good, I will start working on it. Creating
   and running performance tests is a must.
4. While developing all of these, my understanding of bitmap and
   its implementation will get better. So, that would help me to
   think more practically about the questions provided in the `Project
   Idea` section. Then I would work on it accordingly.

## Estimated Timeline

My Semester exams will most probably start from May last week. So,
I may be inactive (or less active) that time.
(Smart India Hackathon)[https://www.sih.gov.in]
(semi finals and finals) may also be held during the GSoC event.
I will get you notified about that.

--> Period
- Pre GSoC Period
- Till May 20
--> Tasks
- Research more on the bitmap files, compression techniques etc.
- See if there are any other (better) techniques for it.

--> Period
- Community Bonding
- May 20 - June 12
--> Tasks
- Discussion on the project started
- Decide which approach is better for compression/decompression of
  bitmaps.
- If a decision is not taken, create branches for each approach.
- Create branches for each sub project and make skeletons for them.

--> Period
- Coding Phase 1
- June 13 - July 25
--> Tasks
- Start working on sub-project no. 1 (i.e. bitmap compression
  technique)
- Add Performance test
- If multiple branch are create for this sub-project, compare
  the test results
- Take the best performing approach, delete other branches.
- Update documentation accordingly
- Fix bugs
- Finish sub-project 1

--> Period
- Coding Phase 2
- July 25 - Sept 4
--> Tasks
- Fix sub-project-1 related small bugs
- Start working on sub-project-2 (i.e. adding
  `table of content` for bitmap files)
- Add Performance test
- Add Documentation
- Fix bugs
- If finished, start working on sub-project-3 (i.e. adding a
  `new mode`)
- Try to finish it with documentation and performance tests

--> Period
- Final Week 1
- Sept 5 - Sept 12
--> Tasks
- If both are finished, fix bugs and test overall performance.
  Else extend the period.
- Discuss about the last sub project (i.e. questions )
- If anything needs to be changed/modified or added, extend the
  GSoC Period

--> Period
- Coding Phase 3
- Sept 13 - Nov 13
--> Tasks
- Finish code related to all sub projects
- Add overall documentation
- Add overall performance tests


## Blogging about Git

I love to write blogs and technical articles. Those are my ways to
connect and communicate with the developers community. I have
previously written articles about Django in a portal named
(GeeksForGeeks)[https://auth.geeksforgeeks.org/user/riter79/articles].
Recently I started writing  blogs on
(Medium platform)[https://medium.com/@abhra303].

During the GSoC event, I will frequently write blogs about my
progress. I will also share the problems I face and the solutions
of those problems that I consider.

I got interested in git by reading Olga=E2=80=99s GSoC blogs. That led me
to contribute to this codebase. So, someone like me will hopefully
be motivated by seeing my blogs ;-)

## Availability

I intentionally freed my summer slot for GSoC. So, there wouldn=E2=80=99t
be much disturbance/inactive days while working on my project.
Generally, I can spend nearly 35-40 hours a week on this project.
If the college gets closed for some reason, then the amount of
available time will increase. Smart India Hackathon finale would
be held in July. So, I may be inactive for a few days. But overall,
I will be available most of the time.

## Post GSoC

Once the GSoC finishes, I would look into other issues/tickets and
would send PRs solving those issues. As I said before, I want to
be a long term contributor to git - I would definitely maintain the
flow and continue to work on improving the overall git tool.

## Experience with Open Source

I have a pretty good contribution history in open source. The
organizations/tools where I contributed to are -

 - Mozilla/bedrock - written mainly in Python Django and javaScript
   link - https://github.com/mozilla/bedrock/commits?author=3DAbhra303

 - Datree - a Kubernetes misconfiguration checker tool written mainly
   in golang
   link - https://github.com/datreeio/datree/commits?author=3DAbhra303

 - KubeBuilder - A tool to extend the Kubernetes API by creating custom
   CRDs - written mainly in golang. I recently started looking into it.
   link : https://github.com/kubernetes-sigs/kubebuilder/issues/2567

## Motivation

I always wanted to develop/contribute to projects that affect millions
of people. Git is a tool that most ( or maybe every) developers
use for their daily work. Contributing to it means my written code
will be used behind the scenes in every developer=E2=80=99s machine. That=
=E2=80=99s my
motivation.

## Closing Remarks

Lastly, I want to say that I am a dedicated, research preferred quick
learner. I am always ready to solve real world problems and learn
required skills for them. For example, I recently took part in a
hackathon called =E2=80=9CCloud Native Hackathon=E2=80=9D and won 1st place=
 in the
category of =E2=80=9Cbest use of Datree=E2=80=9D. I knew nothing about
(Datree)[https://datree.io/] ( and (Kubernetes)[https://kubernetes.io]
partially) before this hackathon and the hackathon was only 2 days
long. But I researched hard ( to know the Kubernetes misconfigurations)
and learned  jsonSchema ( Here is my
(blog link)[https://medium.com/@abhra303/how-i-won-cloud-native-hackathon-2=
021-4b1f5b2a84f2]
if you want to know my full experience).

I hope you=E2=80=99ll give me a chance to make an impact among the develope=
rs
community by considering my application.

Thanks & Regards,

Abhradeep Chakraborty


[1] https://github.com/gitgitgadget/git/blob/master/Documentation/MyFirstCo=
ntribution.txt
[2] https://github.com/gitgitgadget/git/blob/master/Documentation/MyFirstOb=
jectWalk.txt
[3] https://git-scm.com/docs/user-manual#hacking-git
[4] https://github.com/git/git/blob/master/pack-bitmap-write.c
[5] https://github.com/git/git/blob/master/pack-bitmap.c
