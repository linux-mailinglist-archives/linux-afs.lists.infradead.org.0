Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 39148125395
	for <lists+linux-afs@lfdr.de>; Wed, 18 Dec 2019 21:39:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gAT7HMch56knaezqQRDQHzndgpeBCFw8k0GN04LQJDs=; b=KYOyLsArRQDTCk
	b2zjT16phWSJW0eMb/RT1xg3jMCVkKWaBJ+gCp0lK/xNIF96FZ41IAm6wS/YiOCIIHDYchTTKg6TP
	bxgzPXyp8Qh5SIsRElUJ8ngxl2fmajQNIRz4erdhqj2lzwqnoGHQzIQihWAkVmPBhwfgypQsCuIaS
	WRms1IUptWNjyHYwr/VxSycnY6Oca+i14gCeM2nVOscGWew3TJV7kTejrxjq7UUCs9seG5et8t7Zs
	3k/gPvOSzr95mvL8toamGD4XM5QgG2FhFxZPndUIR2JRYADziPx80ZgqzCutFOxIudZORFgf727Go
	EomtDY+p27kL5vgUG9GA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihg6p-0002vg-Dl; Wed, 18 Dec 2019 20:39:51 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihg6m-0002vS-Tm; Wed, 18 Dec 2019 20:39:49 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id E8D47980E35; Wed, 18 Dec 2019 21:39:46 +0100 (CET)
Date: Wed, 18 Dec 2019 21:39:46 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH] rxrpc: struct mutex cannot be used for
 rxrpc_call::user_mutex
Message-ID: <20191218203946.GL11457@worktop.programming.kicks-ass.net>
References: <157659672074.19580.11641288666811539040.stgit@warthog.procyon.org.uk>
 <20191218135047.GS2844@hirez.programming.kicks-ass.net>
 <20191218190833.ufpxjrvin5jvp3m5@linux-p48b>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218190833.ufpxjrvin5jvp3m5@linux-p48b>
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
Cc: linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, linux-fsdevel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, Dec 18, 2019 at 11:08:33AM -0800, Davidlohr Bueso wrote:
> On Wed, 18 Dec 2019, Peter Zijlstra wrote:
> 
> > On Tue, Dec 17, 2019 at 03:32:00PM +0000, David Howells wrote:
> > > Standard kernel mutexes cannot be used in any way from interrupt or softirq
> > > context, so the user_mutex which manages access to a call cannot be a mutex
> > > since on a new call the mutex must start off locked and be unlocked within
> > > the softirq handler to prevent userspace interfering with a call we're
> > > setting up.
> > > 
> > > Commit a0855d24fc22d49cdc25664fb224caee16998683 ("locking/mutex: Complain
> > > upon mutex API misuse in IRQ contexts") causes big warnings to be splashed
> > > in dmesg for each a new call that comes in from the server.
> > 
> > FYI that patch has currently been reverted.
> > 
> > commit c571b72e2b845ca0519670cb7c4b5fe5f56498a5 (tip/locking/urgent, tip/locking-urgent-for-linus)
> 
> Will we ever want to re-add this warning (along with writer rwsems) at some point?

Yes, we can try again for the next cycle.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
