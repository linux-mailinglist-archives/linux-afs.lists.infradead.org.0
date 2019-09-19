Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFF4B7A47
	for <lists+linux-afs@lfdr.de>; Thu, 19 Sep 2019 15:15:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kw0Nw46cRRMSadZMU3uoAHL52kqCVBJjNk4kXf+h7Io=; b=YPD/b+6BHzhrgq
	+eOOLC8T4/90t53S95UdyvpjY8d99OvRvaxcKlRC+4i//WH2M+eO96dCDxqsMbgglnFi/XJBQbojF
	PUx8mm6vkZpk98PhnHAYEVzWxNVJuj7QHpmvwwcaqOkAZY4JgOQKDoaRNzJcnNE16QNimRFI5Rr/t
	OW5d+TuIOk+kzrgYFgAXWYn+b0Psy5HVav08XDJVQr5K4nNuX3nNgHM/Bp8XaJHSBTfBAi1URUJvX
	MrDZaVjjqYM2v9EWzUmiH8lMCTZqsnMNfP5CAub9zmPWDUrM+fYh2y6sQGzRNT3JOVeu3M5MQGYMx
	PbEl+pQe8F55sUXiX65A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAwHi-0002us-WA; Thu, 19 Sep 2019 13:15:47 +0000
Received: from willy by bombadil.infradead.org with local (Exim 4.92.2 #3 (Red
 Hat Linux)) id 1iAwHZ-0002qj-HV; Thu, 19 Sep 2019 13:15:39 +0000
Date: Thu, 19 Sep 2019 06:15:37 -0700
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [GIT PULL afs: Development for 5.4
Message-ID: <20190919131537.GA15392@bombadil.infradead.org>
References: <28368.1568875207@warthog.procyon.org.uk>
 <CAHk-=wgJx0FKq5FUP85Os1HjTPds4B3aQwumnRJDp+XHEbVjfA@mail.gmail.com>
 <16147.1568632167@warthog.procyon.org.uk>
 <16257.1568886562@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16257.1568886562@warthog.procyon.org.uk>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: YueHaibing <yuehaibing@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Marc Dionne <marc.dionne@auristor.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Thu, Sep 19, 2019 at 10:49:22AM +0100, David Howells wrote:
> David Howells <dhowells@redhat.com> wrote:
> 
> > > However, I was close to unpulling it again. It has a merge commit with
> > > this merge message:
> > > 
> > >     Merge remote-tracking branch 'net/master' into afs-next
> > > 
> > > and that simply is not acceptable.
> > 
> > Apologies - I meant to rebase that away.  There was a bug fix to rxrpc in
> > net/master that didn't get pulled into your tree until Saturday.
> 
> Actually, waiting for all outstanding fixes to get merged and then rebasing
> might not be the right thing here.  The problem is that there are fixes in
> both trees: afs fixes go directly into yours whereas rxrpc fixes go via
> networking and I would prefer to base my patches on both of them for testing
> purposes.  What's the preferred method for dealing with that?  Base on a merge
> of the lastest of those fixes in each tree?

Why is it organised this way?  I mean, yes, technically, rxrpc is a
generic layer-6 protocol that any blah blah blah, but in practice no
other user has come up in the last 37 years, so why bother pretending
one is going to?  Just git mv net/rxrpc fs/afs/ and merge everything
through your tree.

I feel similarly about net/9p, net/sunrpc and net/ceph.  Every filesystem
comes with its own presentation layer; nobody reuses an existing one.
Just stop pretending they're separate components.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
