Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id AD00C11905B
	for <lists+linux-afs@lfdr.de>; Tue, 10 Dec 2019 20:10:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UnKOfxlHXYxwXlwvz2bXfy2jHNwY9woreKDCJu2XBI0=; b=bg+w8jxcPdyOWb
	FgXYoB8N+BPuLqKTsjXQOII3ZE/jIEUyfd30EKRH48Gvl6MTH7kGgvaJwMzzdbSAFuumA8TMvokO7
	UCWl8XI/EfC45qKu3bL+smajF2zHlWCZuuBO+RvdcNGrrMnyP4IWE8ZX7MZ4RhE4vnBTcX5dDKV0D
	mS1q4v7xj6QZJLg8udxzSVsb0JiUVqdCzTloEGWu8X6RnjArRy4E0+qZtpaq4APnKIUJTG6lsekKr
	Ia3DnmbyGCPPfy+3DDWWP+3a6EKD8XwqLvZqnaNFnF9FZ/cFC0WcBgoTEuBhSihfvv2O1xJH3wWSB
	QK749uBPOQsfs7q3dxCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iektq-0006ir-Un; Tue, 10 Dec 2019 19:10:22 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iektp-0006iZ-3M
 for linux-afs@bombadil.infradead.org; Tue, 10 Dec 2019 19:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a35QQIVRZAfUwW6/AE1+O5h1J9PVr+kiDXT0hU/xuAk=; b=u5Y4Sp2rJd5Pz1+Bj6lrdl5xF
 PQ06SchtmJ7RQjs3rGJMHTxj9dXHoD/8ZRpyGq4dGZgtyY5TueTqrttP69kNFYkpWKPINZpfYufrY
 YZ8f/h7dRzikcn1LFfFXkmn7zUWjbkAs0HhNRJmV2zDndEmqItPhGAEwAXoZm/6+wwTFHTEBHLKiG
 97wqZtBKAhLKnXngCYvueNY6Nv6WFBa07xKvXoNyfstlzJCbD5Ejgmxdf7IQWayLj8jzgmBW7/6tN
 MdTBGGWBZwgViaJgaZFJc3+PSN45AWuZs7q3WmyCn9yrr9dtxWSNYjLBw0qerEDjx4Iu8LeIUg6iZ
 9uc8hrtQg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iektm-0002Sn-3z; Tue, 10 Dec 2019 19:10:18 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 2C1F3980D21; Tue, 10 Dec 2019 20:10:09 +0100 (CET)
Date: Tue, 10 Dec 2019 20:10:09 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH] rxrpc: Mutexes are unusable from softirq context, so use
 rwsem instead
Message-ID: <20191210191009.GA11457@worktop.programming.kicks-ass.net>
References: <157599917879.6327.69195741890962065.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157599917879.6327.69195741890962065.stgit@warthog.procyon.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-fsdevel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Tue, Dec 10, 2019 at 05:32:58PM +0000, David Howells wrote:
> rxrpc_call::user_mutex is of type struct mutex, but it's required to start
> off locked on an incoming call as it is being set up in softirq context to
> prevent sendmsg and recvmsg interfering with it until it is ready.  It is
> then unlocked in rxrpc_input_packet() to make the call live.
> 
> Unfortunately, commit a0855d24fc22d49cdc25664fb224caee16998683
> ("locking/mutex: Complain upon mutex API misuse in IRQ contexts") causes
> big warnings to be splashed in dmesg for each a new call that comes in from
> the server.
> 
> It *seems* like it should be okay, since the accept path trylocks the mutex
> when no one else can see it and drops the mutex before it leaves softirq
> context.
> 
> Fix this by switching to using an rw_semaphore instead as that is permitted
> to be used in softirq context.

This really has the very same problem. It just avoids the WARN. We do PI
boosting for rwsem write side identical to what we do for mutexes.

I would rather we revert David's patch for now and more carefully
consider what to do about this.


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
