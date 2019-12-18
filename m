Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 923381248B7
	for <lists+linux-afs@lfdr.de>; Wed, 18 Dec 2019 14:51:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kzFNAeIdU9jijd26pwcYcyuhyUwmwqmCBls+mhXeLAU=; b=dKoLdQ7ewoYqJ+
	O++FcFw2xH+22j7a+ze/G2A5Vs4flXBrKT7C2WPVg6dePsBlXf3lHx7WQhDghXUMlXzfQvNCnHrUu
	/XoTqMvAA3k+V6CYzI25Aba7k2/v/63knz0UcrwrYSD2v1d6naiMRp3xXSLcDVwB7AtXDg4fsJzQs
	lh69UM1FrNfGEVIS3iMuGqiJBKQ9WkTh+9hhqf3+5I363j/FOu+x7AubmH6nRpFBTyopQdDG8e1B6
	g3iAwDLGrd2eOr+lqigOEF8TkGfVIPpXVst+FjI8BJ+se1qtSaNIgeY1xoB/WlztCXEoxedBJFAMV
	i9gl/71EoqqrVgilJe1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihZj2-0004e0-1t; Wed, 18 Dec 2019 13:50:52 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihZj0-0004dV-DC; Wed, 18 Dec 2019 13:50:50 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C2D5430038D;
 Wed, 18 Dec 2019 14:49:24 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id D9A792B0D9745; Wed, 18 Dec 2019 14:50:47 +0100 (CET)
Date: Wed, 18 Dec 2019 14:50:47 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH] rxrpc: struct mutex cannot be used for
 rxrpc_call::user_mutex
Message-ID: <20191218135047.GS2844@hirez.programming.kicks-ass.net>
References: <157659672074.19580.11641288666811539040.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157659672074.19580.11641288666811539040.stgit@warthog.procyon.org.uk>
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

On Tue, Dec 17, 2019 at 03:32:00PM +0000, David Howells wrote:
> Standard kernel mutexes cannot be used in any way from interrupt or softirq
> context, so the user_mutex which manages access to a call cannot be a mutex
> since on a new call the mutex must start off locked and be unlocked within
> the softirq handler to prevent userspace interfering with a call we're
> setting up.
> 
> Commit a0855d24fc22d49cdc25664fb224caee16998683 ("locking/mutex: Complain
> upon mutex API misuse in IRQ contexts") causes big warnings to be splashed
> in dmesg for each a new call that comes in from the server.

FYI that patch has currently been reverted.

commit c571b72e2b845ca0519670cb7c4b5fe5f56498a5 (tip/locking/urgent, tip/locking-urgent-for-linus)

> Whilst it *seems* like it should be okay, since the accept path
> trylocks the mutex when no one else can see it and drops the mutex
> before it leaves softirq context, unlocking the mutex causes scheduler
> magic to happen.

Not quite. The problem is that trylock still sets the owner task of the
mutex, and a contending mutex_lock() could end up PI boosting that
owner.

The problem happens when that owner is the idle task, this can happen
when the irq/softirq hits the idle task, in that case the contending
mutex_lock() will try and PI boost the idle task, and that is a big
no-no.

> Fix this by switching to using a locking bit and a waitqueue instead.

So the problem with this approach is that it will create priority
inversions between the sites that had mutex_lock().

Suppose some FIFO-99 task does rxrpc_user_lock_call() and gets to block
because some FIFO-1 task has it. Then an unrelated FIFO-50 task comes
and preempts our FIFO-1 owner, now the FIFO-99 task has unbounded
response time (classic priority inversion).

This is what the PI magic is supposed to fix, it would boost the FIFO-1
owner to FIFO-99 for the duration of the lock, which avoids the FIFO-50
task from being elegible to run and ruin the day.

Anyway, regarding your question on IRC, the lockdep bits look OK.

But looking at this code, reminded me of our earlier discussion, where
you said:

  "I could actually mvoe the rxrpc_send_ping() and the mutex_unlock()
  into rxrpc_new_incoming_call() which would make it clearer to see as
  the lock and unlock would then be in the same function."

Which I think still has merrit; it would make reading this code a whole
lot easier.

Back to the actual problem; how come the rxrpc_call thing can be
accessed before it is 'complete'? Is there something we can possibly do
there?

The comment with the mutex_trylock() in rxrpc_new_incoming_call() has:

	/* Lock the call to prevent rxrpc_kernel_send/recv_data() and
	 * sendmsg()/recvmsg() inconveniently stealing the mutex once the
	 * notification is generated.
	 *
	 * The BUG should never happen because the kernel should be well
	 * behaved enough not to access the call before the first notification
	 * event and userspace is prevented from doing so until the state is
	 * appropriate.
	 */

Why do we have to send this notification so early? Is there anything
else we can do avoid these other users from wanting to prod at our
object for a little while? I'm still properly lost in this code.


---
diff --git a/net/rxrpc/call_accept.c b/net/rxrpc/call_accept.c
index 135bf5cd8dd5..3fec99cc2e4d 100644
--- a/net/rxrpc/call_accept.c
+++ b/net/rxrpc/call_accept.c
@@ -435,6 +435,10 @@ struct rxrpc_call *rxrpc_new_incoming_call(struct rxrpc_local *local,
 	_leave(" = %p{%d}", call, call->debug_id);
 out:
 	spin_unlock(&rx->incoming_lock);
+	if (call) {
+		rxrpc_send_ping(call, skb);
+		mutex_unlock(&call->user_mutex);
+	}
 	return call;
 }
 
diff --git a/net/rxrpc/input.c b/net/rxrpc/input.c
index 157be1ff8697..665a0532a221 100644
--- a/net/rxrpc/input.c
+++ b/net/rxrpc/input.c
@@ -1396,8 +1396,6 @@ int rxrpc_input_packet(struct sock *udp_sk, struct sk_buff *skb)
 		call = rxrpc_new_incoming_call(local, rx, skb);
 		if (!call)
 			goto reject_packet;
-		rxrpc_send_ping(call, skb);
-		mutex_unlock(&call->user_mutex);
 	}
 
 	/* Process a call packet; this either discards or passes on the ref

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
