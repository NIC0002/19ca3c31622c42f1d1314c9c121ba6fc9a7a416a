Return-Path: <git-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7E1C4332F
	for <git@archiver.kernel.org>; Thu,  3 Nov 2022 09:48:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiKCJsC (ORCPT <rfc822;git@archiver.kernel.org>);
        Thu, 3 Nov 2022 05:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbiKCJr7 (ORCPT <rfc822;git@vger.kernel.org>);
        Thu, 3 Nov 2022 05:47:59 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B05F595
        for <git@vger.kernel.org>; Thu,  3 Nov 2022 02:47:57 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 21so2148806edv.3
        for <git@vger.kernel.org>; Thu, 03 Nov 2022 02:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:message-id:in-reply-to:user-agent:references:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f2GJ2KVNrCW5aDBaTEyJJGVQ9RvS/q+f0bUCnj9GtIk=;
        b=nPGm1VnFZjCP9svpCMX5Pmpx4/ZrF8fTalLzU4iYk0tosRkGfasqo6MO1ujjJqV6gL
         FN0n7cn137tYaUIeiotDHGA8KkrS8Ak8aMiR+8y21+sqI/2VVMbWpsEIQ7ve6gJSF0mu
         dY4Z6Rtl+7df7bvWQb9OEoQO6+bOmFgNZLW+E0wHu4urWjN1oqJyDfPt4BsXNHgPelkW
         XtPmyn8lsiq9xZh/UEfNM8GT6GIUjBe9mpaf5ERhaX/A0KmazThTvGjWJLH1oI6zVWPW
         etEfL+XDgNEbNRFwFcFYtmW8yJTolZmeKFuYpNcim5T+gZM5J6NcKpk6y5iyEdDcLeC+
         CQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:user-agent:references:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2GJ2KVNrCW5aDBaTEyJJGVQ9RvS/q+f0bUCnj9GtIk=;
        b=Jrj0dsH94ZvgX6prhV1D/Udr4lwElU4UpUUF58lzh1MSoLcyep2woYF4HPK2bA8hi8
         /MRmZNGkidYc8N0zCeiABCIZLt/M2AOQTsgvzwB4GGSMj1DrKcQ9saT140EVC5hl75M3
         eL60JjG/Rc9UmyQQjRstg6hCgDGrZsKb7ldkKazngVbOq/urugo7Ay4x7C/uI9vtLy30
         08r94AF9UJnbn/4155pqRnu9l3JXiCXVvxi6e3OOJ0nkiAItlG9YeDRIN6QkEKl7K/jR
         F//FqSVyeDC5/ntikNa4I2EkAPztUDfkXCUS+ka0NPKHn1r35IqrdlXb5dJkwKaXFnQY
         Hsmw==
X-Gm-Message-State: ACrzQf1VvIQeCzwUxBG28KLP5J7HcFO+D6xhJsXLwijgiGZURGw2CAa9
        w7Jpe367W4HHDQvUMxwkNGJqP1id2TA=
X-Google-Smtp-Source: AMsMyM6ZmZ9tmnrt0YPdiK5Ri7PBOh7bdz+bY//K3uVSsDwHw9+iwUfR6u5R9SQZM5gkOd+q3PpB+A==
X-Received: by 2002:a05:6402:ca8:b0:463:53d7:ac5 with SMTP id cn8-20020a0564020ca800b0046353d70ac5mr21318545edb.15.1667468876210;
        Thu, 03 Nov 2022 02:47:56 -0700 (PDT)
Received: from gmgdl (dhcp-077-248-183-071.chello.nl. [77.248.183.71])
        by smtp.gmail.com with ESMTPSA id g16-20020a170906539000b007ad98918743sm294436ejo.1.2022.11.03.02.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 02:47:55 -0700 (PDT)
Received: from avar by gmgdl with local (Exim 4.96)
        (envelope-from <avarab@gmail.com>)
        id 1oqWpG-00CMWY-1z;
        Thu, 03 Nov 2022 10:47:54 +0100
From:   =?utf-8?B?w4Z2YXIgQXJuZmrDtnLDsA==?= Bjarmason <avarab@gmail.com>
To:     Philip Oakley <philipoakley@iee.email>
Cc:     GitList <git@vger.kernel.org>, Junio C Hamano <gitster@pobox.com>,
        Taylor Blau <me@ttaylorr.com>
Subject: Re: [RFC/PoC 1/5] doc: provide DocBundles design document
Date:   Thu, 03 Nov 2022 10:19:47 +0100
References: <20221102224843.2104-1-philipoakley@iee.email>
 <20221102224843.2104-2-philipoakley@iee.email>
User-agent: Debian GNU/Linux bookworm/sid; Emacs 27.1; mu4e 1.9.0
In-reply-to: <20221102224843.2104-2-philipoakley@iee.email>
Message-ID: <221103.86mt981i9h.gmgdl@evledraar.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <git.vger.kernel.org>
X-Mailing-List: git@vger.kernel.org


On Wed, Nov 02 2022, Philip Oakley wrote:

> [...]
> diff --git a/Documentation/technical/docbundle.txt b/Documentation/technical/docbundle.txt
> new file mode 100644
> index 0000000000..8c17a7847f
> --- /dev/null
> +++ b/Documentation/technical/docbundle.txt
> @@ -0,0 +1,97 @@
> +docbundle Design Document
> +=========================
> +
> +The Git man pages contain many example setups to demonstrate aspects
> +of the related Git commands, such as history simplification in the `log`
> +and `show commands. However, while illustrative, these are not
> +accessible, as example repositories, to regular, potentially confused,
> +users who may need to understand the set up of the examples.
> +
> +The docbundle concept is that for each of these examples there is a
> +matching `bundle` file, provided with the Documentation, which can be
> +simply cloned to provide an example repository containing the example.
> +
> +There are also many example repositories in the Git `/t` test system
> +that could be exposed to users which already demonstrate some important
> +testable aspect of Git within a carefully constructed repository.
> +
> +
> +This proposal is to provide DocBundles to users via the Git project.
> +
> +
> +Firstly, it should be reasonably self-evident that the man page examples
> +should, in themselves, be tested for accuracy, especially if provided
> +to users.
> +
> +Secondly, the existing test system is the proper place to setup and
> +test any such docbundle repositories.
> +
> +Third, that the bundle is an obvious pre-existing mechanism for
> +transporting repositories (see also the Bundle-URI proposals).
> +
> +Fourthly, the preparation and distribution of the docbundle should
> +require minimal maintainer effort, preferably being integrated into
> +the existing automation for Documentation preparation and distribution.
> +
> +Fifthly, the docbudles themselves should not to be part of the git.git
> +repo. They are prepared via the test suite and should be stored (locally)
> +in a designated Git_DocBundle_Dir, and be .gitignored. The DocBundles
> +are transferred to the maintainer's Doc repo via the automation.
> +
> +Sixthly, the docbundles to be named based on their `tnnnn` test number
> +and a (short) descriptive name.
> +
> +Seven, (dev) start with an existing test, rather than add a test (most
> +doc/man examples aren't tested!). Add tests for missing examples later.
> +
> +Eight, (option) add a `git docbundle` command to assist in locating and
> +listing the docbundle examples. It also provides place to explain their
> +purpose as "Tutorial Examples" (Note, many existing examples are to
> +illustrate complex/difficult scenarios where the wording was insufficient;
> +the docbudles are minimal examples).
> +
> +
> +Status
> +======
> +
> +This is an RFC/PoC (Request for Comment / Proof of Concept).
> +
> +The attached commits establish:
> +
> +Set out this design in the Documentation/technical directory.
> +
> +A default location for the docbundles and an env variable to allow
> +flexibility by extending test-lib.
> +
> +The docbundles are ignored, as is the default directory.
> +
> +Two docbundles are generated from a 'random' test that I happened to
> +have open in my editor (t6102 rev-list-simplify).
> +
> +The docbundle creation is protected by `test_expect_success` wrappers.
> +
> +ToDo
> +====
> +
> +DocBundles - Is this the best name, or just a convenient way of
> +indicating the delivery mechanism?
> +
> +Add Prerequisite to control if docbundles are generated (don't waste
> +maintainers PC time when not needed).
> +
> +CI integration (i.e. whether to test the bundling aspect - should be
> +reliable).
> +
> +How to update the man pages, perhaps by inclusion of the test comment
> +(exported?), and distinguish between man page descriptions (being
> +packaged by the test suite) and tests which offer users insight into
> +Git operations, usually with 'interesting' commit-graph set-ups.
> +
> +Claim t999x as the man doc bundle test sequence ('999' is the UK
> +emergency ("Help!") number; 911, 101 and 102 are taken test areas.
> +
> +Other stuff implicit in the eight point list

I've skimmed this, and provided some rough comments inline.

I think the core idea sounds nice, if I'm getting it right. Let me see
if I can rephrase it, and you can point out where I'm wrong/didn't get
it:

We have stuff in our docs like e.g. this, at the top of git-rebase(1);

       Assume the following history exists and the current branch is "topic":

                     A---B---C topic
                    /
               D---E---F---G master

It would be nice if for that and other things we could add a blurb like:

	To play around with this history, do:

		git clone git-doc://git-rebase/description-1.bndl && cd description-1

Or whatever, this POC doesn't fleshen that out, but the idea is that
through <some mechanism> we would bridge the gap such that the user
could be looking at and playing with the history we're describing in our
docs.

The above assumes we'd ship those with installed git, but these could
also be hosted online, e.g.:

	git clone https://git-scm.com/test-bundles/git-rebase/description-1.bdl

So as an end-goal you could both run these locally, and we could imagine
that e.g. git-scm.com could eventually have UX similar to Redis's
website: https://redis.io/commands/hgetall/

I.e. where it drops you into a shell to play with the command.

In reply to 3/5 I said I had some "local patches", but I forgot the
relevant part was on master already (the whole subsequent leak analysis
is local): 366bd129dc3 (test-lib: add a SANITIZE=leak logging mode,
2022-07-28)

So I think you're making the whole "have the test suite make these" part
of this too complex, i.e. with a minor variation of that you can do this
in test-lib.sh:

	TEST_RESULTS_BDL_DIR="$TEST_RESULTS_DIR/$TEST_NAME.test-bdl"

Then have a helper like:

	do_my_test_bundle_stuff () {
		local name="$1" &&
		shift &&
		git bundle create "$TEST_RESULTS_BDL_DIR/$name.bdl" "$@"
	}

Then all you need to make these is:

	make test GIT_TEST_OPTS=--debug

And then:

	ls -l t/test-results/*.bdl/*

Will give you all the bundles you want.

We're then missing the "connect it with the docs" part, but that part
would be e.g.:

- Have a validation target for it that depends on such a "make test" run
- Sanity check that we did create the ones the docs expect

Anyway.

I like the end-goals, but I can't help think that bundles are the wrong
direction to go in, as opposed to:

1. We could have "make install" ship test-lib{,-functions}.sh along
   with git itself
2. Have e.g. t/doc-setup/*.sh with the snippets to set up these test
   demos, which we'd also ship.

And you'd then do e.g.:

	git test-case rebase/description-1

Which would just be a thin wrapper around (pseudocode):

	dir=$(git test--helper get-tempdir) &&
	(
		cd "$dir" &&
                # And whatever else we need to set up to say "use this local installed git"
		GIT_TEST_INSTALLED=[...] &&
		. "$(git --test-dir)"/test-lib.sh
		. "$(git --test-dir)"/doc-setup/rebase-description-1.sh"

		# This would run test_commit, and any other arbitrary setup code
		setup_rebase_description_1()
	) &&
	echo "Go play with '$dir', and have fun"

The big advantage of that is:

 1. It ships with git, so it works offline, and we won't get into the
    inevitable confusion of the user reading v2.40 docs locally, but the
    online url tracking a v2.50 example or whatever.
 2. We can represent whatever arbitrary repo state, e.g. drop the user
    into a merge conflict that's already happening.
 3. We can also represent "repo-extra" state, e.g. imagine the
    "git-gc/git-repack" docs discussing loose objects, and wanting to
    get you into some arbitrary state with regards to your loose objects
    etc.
