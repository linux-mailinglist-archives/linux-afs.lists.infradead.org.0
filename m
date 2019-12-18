Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6BC1251A9
	for <lists+linux-afs@lfdr.de>; Wed, 18 Dec 2019 20:16:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RH4RNzsjhwN+rz1pGul3pdS4HAZ9ZLajqkPiFhckoe0=; b=CyMYsgHwXf49ur
	vS0tnsVytZ+U+6yAIHjS7ZrIUJ8fzD5XxNpgFxbhm4iLyMu08lFfWKTWhl4WOH6Kt8Lb4lKUPEMuC
	oH0p7zS8gE0JZnZyTujOvazA5BSUYse7LPQBYieyzcWSSiFkz99fubtOMxmIX2PvbXOTc8k520b+H
	9jnjGklk0oe44qy0RbPXVedrzFd1R8IH8ZHAIq3UPlQKoXoijFatCtUOf6AZvdRJJ8XQNQKjcGP+2
	m7vyW3APRFdlbb4S7kVS4JdzrVxy7S7ynlWA3VPc3XmYLoGmDgyO8c9Vl2KKbxyff6UWQ3WWgG3rY
	MaPcZcjHeaaiaegqPbyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iheo0-0004oB-FR; Wed, 18 Dec 2019 19:16:20 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihenq-0004dy-6L; Wed, 18 Dec 2019 19:16:10 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 174F6980E35; Wed, 18 Dec 2019 20:16:08 +0100 (CET)
Date: Wed, 18 Dec 2019 20:16:08 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 2/2] rxrpc: Don't take call->user_mutex in
 rxrpc_new_incoming_call()
Message-ID: <20191218191608.GG11457@worktop.programming.kicks-ass.net>
References: <157669169065.21991.15207045893761573624.stgit@warthog.procyon.org.uk>
 <157669169826.21991.16708899415880562587.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157669169826.21991.16708899415880562587.stgit@warthog.procyon.org.uk>
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
 Will Deacon <will@kernel.org>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, Dec 18, 2019 at 05:54:58PM +0000, David Howells wrote:
> Standard kernel mutexes cannot be used in any way from interrupt or softirq
> context, so the user_mutex which manages access to a call cannot be a mutex
> since on a new call the mutex must start off locked and be unlocked within
> the softirq handler to prevent userspace interfering with a call we're
> setting up.
> 
> Commit a0855d24fc22d49cdc25664fb224caee16998683 ("locking/mutex: Complain
> upon mutex API misuse in IRQ contexts") causes big warnings to be splashed
> in dmesg for each a new call that comes in from the server.  Whilst it
> *seems* like it should be okay, since the accept path uses trylock, there
> are issues with PI boosting and marking the wrong task as the owner.
> 
> Fix this by not taking the mutex in the softirq path at all.  It's not
> obvious that there should be any need for it as the state is set before the
> first notification is generated for the new call.
> 
> There's also no particular reason why the link-assessing ping should be
> triggered inside the mutex.  It's not actually transmitted there anyway,
> but rather it has to be deferred to a workqueue.
> 
> Further, I don't think that there's any particular reason that the socket
> notification needs to be done from within rx->incoming_lock, so the amount
> of time that lock is held can be shortened too and the ping prepared before
> the new call notification is sent.
> 

Assuming this works, this is the best solution possible! Excellent work.

(I was about to suggest something based on wait_var_event() inside each
mutex_lock(), but this is _much_ nicer)

Thanks!

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
