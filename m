Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8854671235
	for <lists+linux-afs@lfdr.de>; Tue, 23 Jul 2019 08:58:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HlW1f7HmaHZZJpIJtc7EKt17u3PAFRfl7DpObTR4Bz0=; b=bg3pUZJzzotspZ
	X1DhZ4FLIQNfGBBW7vdOes7YFG+POHGw7hvsv0/kx3oJFSUpIbYudYR6vWcyZAe5RrAXn1qLeFW4h
	5TqVTq0rfRNssx4CML+f3kAdXk4VYMKcPm+cX+Y9FaOAgEPPkY/MI8cmlhP/GkmBJz8Tk9MSHQXjU
	hSj7iDHKoyexuyM+6lLobi1BXHF/q0gNoLN93DbrgJL5SUd2b2O29FVccLmGpJJBeZ3gHGzbejyzy
	zfiqmwlzxcpsLBGk0jFcmzUw6Dma5Mht6pBiio9Drg29VdnQl0ofOgZ431hwtHU4ieX01JueI+Mpy
	J6O0cf6uoNd68AB1H2YA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpol5-00087Y-4R; Tue, 23 Jul 2019 06:58:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hlIXo-0004WN-RC
 for linux-afs@lists.infradead.org; Wed, 10 Jul 2019 19:46:26 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D847E20645;
 Wed, 10 Jul 2019 19:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562787984;
 bh=8Wheg7fkojhFCTFeSxARuXmwozeoF6si9Jhn2gqN/jE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U8yQ5jzmPYkedYE9eKLlK6r/w0o6fbkuw6aQbZ32bajHQdbDyDuiA98yJfeBrTJ6G
 9t9iwMUnGVGtKgkQyIGsGEnGkWyMLrzPLRQ7tkqlMCE404ujVuWcrSKTBrGV8qg0JS
 ijG3JQaD52WEZZHNznlcoOP7z3WhRvagWtC/zdtE=
Date: Wed, 10 Jul 2019 12:46:22 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] Keys: Set 4 - Key ACLs for 5.3
Message-ID: <20190710194620.GA83443@gmail.com>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 David Howells <dhowells@redhat.com>,
 James Morris James Morris <jmorris@namei.org>,
 keyrings@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 linux-nfs@vger.kernel.org, CIFS <linux-cifs@vger.kernel.org>,
 linux-afs@lists.infradead.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-integrity@vger.kernel.org,
 LSM List <linux-security-module@vger.kernel.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
References: <28477.1562362239@warthog.procyon.org.uk>
 <CAHk-=wjxoeMJfeBahnWH=9zShKp2bsVy527vo3_y8HfOdhwAAw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wjxoeMJfeBahnWH=9zShKp2bsVy527vo3_y8HfOdhwAAw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190710_124624_911031_C0D9F379 
X-CRM114-Status: GOOD (  25.16  )
X-Spam-Score: -2.0 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 3.2 FSL_HELO_FAKE          No description available.
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Mon, 22 Jul 2019 23:58:43 -0700
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
Cc: CIFS <linux-cifs@vger.kernel.org>, linux-nfs@vger.kernel.org,
 Netdev <netdev@vger.kernel.org>, James Morris James Morris <jmorris@namei.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 LSM List <linux-security-module@vger.kernel.org>, keyrings@vger.kernel.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-integrity@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, Jul 10, 2019 at 11:35:07AM -0700, Linus Torvalds wrote:
> On Fri, Jul 5, 2019 at 2:30 PM David Howells <dhowells@redhat.com> wrote:
> >
> > Here's my fourth block of keyrings changes for the next merge window.  They
> > change the permissions model used by keys and keyrings to be based on an
> > internal ACL by the following means:
> 
> It turns out that this is broken, and I'll probably have to revert the
> merge entirely.
> 
> With this merge in place, I can't boot any of the machines that have
> an encrypted disk setup. The boot just stops at
> 
>   systemd[1]: Started Forward Password Requests to Plymouth Directory Watch.
>   systemd[1]: Reached target Paths.
> 
> and never gets any further. I never get the prompt for a passphrase
> for the disk encryption.
> 
> Apparently not a lot of developers are using encrypted volumes for
> their development machines.
> 
> I'm not sure if the only requirement is an encrypted volume, or if
> this is also particular to a F30 install in case you need to be able
> to reproduce. But considering that you have a redhat email address,
> I'm sure you can find a F30 install somewhere with an encrypted disk.
> 
> David, if you can fix this quickly, I'll hold off on the revert of it
> all, but I can wait only so long. I've stopped merging stuff since I
> noticed my machines don't work (this merge window has not been
> pleasant so far - in addition to this issue I had another entirely
> unrelated boot failure which made bisecting this one even more fun).
> 
> So if I don't see a quick fix, I'll just revert in order to then
> continue to do pull requests later today. Because I do not want to do
> further pulls with something that I can't boot as a base.
> 
>                  Linus

This also broke 'keyctl new_session' and hence all the fscrypt tests
(https://lkml.kernel.org/lkml/20190710011559.GA7973@sol.localdomain/), and it
also broke loading in-kernel X.509 certificates
(https://lore.kernel.org/lkml/27671.1562384658@turing-police/T/#u).

I'm *guessing* these are all some underlying issue where keyrings aren't being
given all the needed permissions anymore.

But just FYI, David had said he's on vacation with no laptop or email access for
2 weeks starting from Sunday (3 days ago).  So I don't think you can expect a
quick fix from him.

I was planning to look into this to fix the fscrypt tests, but it might be a few
days before I get to it.  And while I'm *guessing* it will be a simple fix, it
might not be.  So I can't speak for David, but personally I'm fine with the
commits being reverted for now.

I'm also unhappy that the new keyctl KEYCTL_GRANT_PERMISSION doesn't have any
documentation or tests.  (Which seems to be a common problem with David's
work...  None of the new mount syscalls in v5.2 have any tests, for example, and
the man pages are still work-in-progress and last sent out for review a year
ago, despite API changes that occurred before the syscalls were merged.)

- Eric

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
