Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6D6B7F18
	for <lists+linux-afs@lfdr.de>; Thu, 19 Sep 2019 18:30:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHd39OeoQdYLGqOnzLzj7Iz4C7ETJ90pu4GFThwqP+w=; b=dGLFYwYAx9JnYV
	hvWi0tXz8kx3ZN2SfKcqfdhdvzaFiAD5WyNz5R+IhPMQWqwRrZGg3QyZbb7tpLJSRLpIxA3TkSxZi
	zTtYGonnv5FstgTRtHKC7+L7LSeZBugvDkmfBUwobtrX7Q7fw6gXN8TtDP5KWrhxt6rtZfel2KivC
	hLJx7Hb4GKOlewqrr2MSjZ7km6bKVfbS7GgWfCq2Ib61jgS+yJXL0mzRoH327IzHNR1Wruwe6hO/k
	BpuJv49bWLuN5z2BrIktX8q7qS0QedifleIqJjdElRMyNMLNRf7wjovT9FgpcZdP87VaNJ7ljArFe
	blyTuO1pRl5BfAed9NbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAzJj-00061c-TE; Thu, 19 Sep 2019 16:30:04 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAzJg-0005hP-1t
 for linux-afs@lists.infradead.org; Thu, 19 Sep 2019 16:30:01 +0000
Received: by mail-lj1-x244.google.com with SMTP id y3so2848684ljj.6
 for <linux-afs@lists.infradead.org>; Thu, 19 Sep 2019 09:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yOeYjhY2TaFJW9wyBh4aTYbME8oCFKdq0q4U7z5/glg=;
 b=fANktzJy2S3Kc/Mm9Tv5QoHvYpucXsOuKEmCGX95UhOvTtrVw5xZLOL8D7SbT7J7zp
 q+wtuj988DKgYQxlWbNSygEa2IyFNISOALjUyMsG5jZ8BlpqlP7BCkXN9vlUCPzen3oH
 MZUBRP7j1WuGyLw3Kl49isvHiIAcdB2Y/jIdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yOeYjhY2TaFJW9wyBh4aTYbME8oCFKdq0q4U7z5/glg=;
 b=fKupE7uCrt2hH6pO86RNEs8OqIFt8rcxVZb3bkbcmR15KNyXtcJH4/B8/VJwm/qYdr
 +4rb0flw7AZ6xs9a75aIGuvhbzwYNAgxEDfd7eXdMc0Nq3bliNOUYVrk4llTFUhMv/m4
 gV9eiusOkMlzrPKWg9GO2zN1m9kGKAa/EfIMcipp6B/iIaHYJuLnAfcD0VuGTFxdDa9m
 Y8EIRttff6nhwiqhhgjnfev3hE+LQA4phwdECzQ5t+T0A50p11TUsd5sM8xqvDNtI9np
 Tns9YqfApcPu+LUPFkmK+doX8T+IYONls3FfMRz3HcRQGVbl3YBQXFwmDEE1YkgGm3ZA
 dFHQ==
X-Gm-Message-State: APjAAAXxsGDN+YcQ7UooYzaXpyFaXBa6jtzuK2UCMn7nZ/ccg1xcjLV7
 oTmUkaKrTOtJw6lcoikjgDRWR237QVM=
X-Google-Smtp-Source: APXvYqxozcXNUkbDrEOTJaJQYD/P6VANA5K7uGnz9/TTFNtgoRWSDQWbadyPcH4GoaU16rT2i/H74A==
X-Received: by 2002:a2e:890c:: with SMTP id d12mr2580253lji.85.1568910596742; 
 Thu, 19 Sep 2019 09:29:56 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
 [209.85.208.178])
 by smtp.gmail.com with ESMTPSA id 207sm1911800lfn.0.2019.09.19.09.29.55
 for <linux-afs@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2019 09:29:55 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id m7so4264899lji.2
 for <linux-afs@lists.infradead.org>; Thu, 19 Sep 2019 09:29:55 -0700 (PDT)
X-Received: by 2002:a2e:9854:: with SMTP id e20mr6081705ljj.72.1568910595160; 
 Thu, 19 Sep 2019 09:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wgJx0FKq5FUP85Os1HjTPds4B3aQwumnRJDp+XHEbVjfA@mail.gmail.com>
 <16147.1568632167@warthog.procyon.org.uk>
 <28368.1568875207@warthog.procyon.org.uk>
 <16257.1568886562@warthog.procyon.org.uk>
In-Reply-To: <16257.1568886562@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 19 Sep 2019 09:29:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgmbGSxdJDMjtGNqFs+r0Z62xv_i_5TBRPECuqXN-ax9g@mail.gmail.com>
Message-ID: <CAHk-=wgmbGSxdJDMjtGNqFs+r0Z62xv_i_5TBRPECuqXN-ax9g@mail.gmail.com>
Subject: Re: [GIT PULL afs: Development for 5.4
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_093000_119631_1587E78C 
X-CRM114-Status: GOOD (  15.71  )
X-Spam-Score: 0.1 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2a00:1450:4864:20:0:0:0:244 listed in]
 [list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-BeenThere: linux-afs@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Cc: Marc Dionne <marc.dionne@auristor.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, linux-afs@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Thu, Sep 19, 2019 at 2:49 AM David Howells <dhowells@redhat.com> wrote:
>
> Actually, waiting for all outstanding fixes to get merged and then rebasing
> might not be the right thing here.  The problem is that there are fixes in
> both trees: afs fixes go directly into yours whereas rxrpc fixes go via
> networking and I would prefer to base my patches on both of them for testing
> purposes.  What's the preferred method for dealing with that?  Base on a merge
> of the lastest of those fixes in each tree?

If you absolutely *have* to have something from another development
tree, that's generally a sign that something is screwed up with the
model in the first place, but when it happens,  you should make sure
that you have a stable point in that development tree.

You might ask the upstream developer (ie Davem, in the case of the
network tree) what would be a good point, for example. Don't just pick
a random "tree of the day".

The same very much goes for my tree, btw. You should simply never just
pick a random tree of the day as your base for work if you start with
my tree. That's true whether you do a merge or just start new
development on top of some point, or anything else, for that matter.

Generally, you should never merge other peoples code without having
them _tell_ you that some particular point is a good thing to merge.
Releases are obviously implicitly such points, but generally
cross-tree merges need communication (a pull request to upstream is
the obvious such communication, but not necessarily the only one:
we've had cross-tree development that has involved separate branches
and just various synchronization emails between the two groups).

Looking at rxrpc in particular - if that is what you were waiting for
- it looks more like you should just had an rxrpc branch, and asked
David to pull it for the 5.4 merge window. Then you could have used
that branch itself, as a starting point, perhaps. Or - better yet,
perhaps - merged it into your development tree based on a good AFS
starting point, with a *big* merge message explaining what you are
merging and why.

Right now there is a merge with absolutely no explanation for why the
merge exists at all, and with some very non-obvious bases that really
look like they are just random points of development for both me and
for Davem.

              Linus

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
