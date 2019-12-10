Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 846CB119099
	for <lists+linux-afs@lfdr.de>; Tue, 10 Dec 2019 20:30:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxRJjF5AK3WF3Qb13V/T/ujmjzYKO8R6cDpig0zgUFs=; b=g4QHJlC4SqGdXI
	7yqSQYGuZ+AqpyIY4AxQX7Ej//8t5qnXNiGCPGygglbByvPTolpMbcwPrZeaGGrXbXSC1Xf6/2lHk
	QPlGFlWMC1GeiOV8opUegcUyw/aUJctTBCJIuGRx/KIsb84KmRdRKC6eiTI6JjG1yAHpQJtVAesyO
	vDvD+Sq6kYgcp2I/gyZrwLP2w3btM3XyS562Gnt6actLxenfX9zPivohwzI2cvet9Lo+SVEHuv8u/
	9YDVUv0QYN/yFh8PwVzkIm/wmJ4QoNk+l2Y7bMFR47uSiGUVUy+E6nkU8XCIgdR+jc0842uFlNW+C
	9nMRuNSi5X7DG8o1iHiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ielD8-0004qt-44; Tue, 10 Dec 2019 19:30:18 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ielD5-0004qe-T8
 for linux-afs@bombadil.infradead.org; Tue, 10 Dec 2019 19:30:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tw2JPIMYDsfgukvM8WXHM1nu5JQP5vubIup8mX2xa3Y=; b=OHQtieOKJ3KsSxH0XLa2EtTsh
 XAnLaFDGOgNiQCq63QIcZzsCqoyHH0w0ataQ3lJhpbatDvRxXkLrFwL/6ycEWDG1V5dUNk1p+rbBx
 RsHnzwKVc/XXESf1jD+CW2exZ3u5t3U5A/mxjfmN+ZM/GMa8zYBIN1oLTXlW+pHEY2ykRHxACV1G+
 bfpGOMKesC5bHP/dr8uU4QVWUPHfvlSja7190Ge7YmC/iJJNGu3mM7KMSLwIe4Ezpz8mU8kvPgaFf
 X/YQHWctWfaPlrTclyGn4vRJTXPbKpNacgsXe7mGLBIn5pyzi368hMnchEhtTcf+Qq4DZZFKsuE3e
 Ud3Unr15g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ielD3-0002k5-Kt; Tue, 10 Dec 2019 19:30:14 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id CC80F980D21; Tue, 10 Dec 2019 20:30:11 +0100 (CET)
Date: Tue, 10 Dec 2019 20:30:11 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH] rxrpc: Mutexes are unusable from softirq context, so use
 rwsem instead
Message-ID: <20191210193011.GA11802@worktop.programming.kicks-ass.net>
References: <157599917879.6327.69195741890962065.stgit@warthog.procyon.org.uk>
 <20191210191009.GA11457@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210191009.GA11457@worktop.programming.kicks-ass.net>
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
Cc: Davidlohr Bueso <dave@stgolabs.net>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-fsdevel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Tue, Dec 10, 2019 at 08:10:09PM +0100, Peter Zijlstra wrote:
> On Tue, Dec 10, 2019 at 05:32:58PM +0000, David Howells wrote:
> > rxrpc_call::user_mutex is of type struct mutex, but it's required to start
> > off locked on an incoming call as it is being set up in softirq context to
> > prevent sendmsg and recvmsg interfering with it until it is ready.  It is
> > then unlocked in rxrpc_input_packet() to make the call live.
> > 
> > Unfortunately, commit a0855d24fc22d49cdc25664fb224caee16998683
> > ("locking/mutex: Complain upon mutex API misuse in IRQ contexts") causes
> > big warnings to be splashed in dmesg for each a new call that comes in from
> > the server.
> > 
> > It *seems* like it should be okay, since the accept path trylocks the mutex
> > when no one else can see it and drops the mutex before it leaves softirq
> > context.
> > 
> > Fix this by switching to using an rw_semaphore instead as that is permitted
> > to be used in softirq context.
> 
> This really has the very same problem. It just avoids the WARN. We do PI
> boosting for rwsem write side identical to what we do for mutexes.
> 
> I would rather we revert David's patch for now and more carefully
> consider what to do about this.

To clarify (I only just reliazed David is a bit ambiguous here), take
this patch out for now:

  a0855d24fc22 ("locking/mutex: Complain upon mutex API misuse in IRQ contexts")

The RXRPC code has been there for a while... and like I wrote, both
mutex and rwsem have the exact same issue, the rwsem code just doesn't
have a WARN on it.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
