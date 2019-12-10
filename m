Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E62118F12
	for <lists+linux-afs@lfdr.de>; Tue, 10 Dec 2019 18:33:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SCfDYvk/s8Eb7l5sPPLOdaw4J/nkTD/x6EAvEbk/AQA=; b=XFoqyGbzIHR1w7
	GUo4/0673tiFfabqFv7S563WpAruTrW+f9tj9x/PB1hI09KUhRs+nnMxodfonrG+aTPN7m0fL064J
	KfdhEAZpa270YpnN+FseOn+q4OF8Q9Cy5zhj/L27YnGpQ8WdmVaL4mH2DrwYBlNx+h1CuRR7oriMo
	fi14+pmj2PZ1QfI6ZRyKrYPB/Bpz8uUNYu15N5Bo4N4W4onZ5tWS+YdufyRTY5d0quT/ugbQmCpm3
	6cLPjdBsMDEMr4J392Tgti1cSpAvxEG0R3V0u8498nsDZ2m81tduJrYhxvKtN8E2LxxgWrcxauWiD
	pYTLZQPoXoZJ67ryBY5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iejNn-0000n8-Sk; Tue, 10 Dec 2019 17:33:11 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iejNk-0000m6-IW
 for linux-afs@lists.infradead.org; Tue, 10 Dec 2019 17:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575999186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Mc+1ZWYckmEINCQCi8L572ppP+X1bue4gLkgV0ncgKQ=;
 b=KWC1d+e70wGoxXlXfNUXioX9ZAhNzXI/fcPmsZBMjoP9NOJH7ueC5TcpjqabA905tCnDnE
 4dkIqZVXegudtoiDJiXjg5VsLbncimhJfDyq5l0chwqfzaeA+i7DbXxgtVTJ0G/muNwpSr
 ruJ/SjmrJUwgZeM5+jgXd9tCiEJHTj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-XlJrKLk6NwqwirH8g0hjEQ-1; Tue, 10 Dec 2019 12:33:02 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 197EC1005512;
 Tue, 10 Dec 2019 17:33:01 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-250.rdu2.redhat.com
 [10.10.120.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A5821001B09;
 Tue, 10 Dec 2019 17:32:59 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] rxrpc: Mutexes are unusable from softirq context,
 so use rwsem instead
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Tue, 10 Dec 2019 17:32:58 +0000
Message-ID: <157599917879.6327.69195741890962065.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: XlJrKLk6NwqwirH8g0hjEQ-1
X-Mimecast-Spam-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_093308_698377_358D3B5E 
X-CRM114-Status: GOOD (  19.63  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [207.211.31.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, Ingo Molnar <mingo@redhat.com>,
 linux-fsdevel@vger.kernel.org, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

rxrpc_call::user_mutex is of type struct mutex, but it's required to start
off locked on an incoming call as it is being set up in softirq context to
prevent sendmsg and recvmsg interfering with it until it is ready.  It is
then unlocked in rxrpc_input_packet() to make the call live.

Unfortunately, commit a0855d24fc22d49cdc25664fb224caee16998683
("locking/mutex: Complain upon mutex API misuse in IRQ contexts") causes
big warnings to be splashed in dmesg for each a new call that comes in from
the server.

It *seems* like it should be okay, since the accept path trylocks the mutex
when no one else can see it and drops the mutex before it leaves softirq
context.

Fix this by switching to using an rw_semaphore instead as that is permitted
to be used in softirq context.

Fixes: 540b1c48c37a ("rxrpc: Fix deadlock between call creation and sendmsg/recvmsg")
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Peter Zijlstra <peterz@infradead.org>
cc: Ingo Molnar <mingo@redhat.com>
cc: Will Deacon <will@kernel.org>
---

 net/rxrpc/af_rxrpc.c    |   10 +++++-----
 net/rxrpc/ar-internal.h |    2 +-
 net/rxrpc/call_accept.c |    4 ++--
 net/rxrpc/call_object.c |    6 +++---
 net/rxrpc/input.c       |    2 +-
 net/rxrpc/recvmsg.c     |   14 +++++++-------
 net/rxrpc/sendmsg.c     |   16 ++++++++--------
 7 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/net/rxrpc/af_rxrpc.c b/net/rxrpc/af_rxrpc.c
index d72ddb67bb74..17e55e12376c 100644
--- a/net/rxrpc/af_rxrpc.c
+++ b/net/rxrpc/af_rxrpc.c
@@ -322,7 +322,7 @@ struct rxrpc_call *rxrpc_kernel_begin_call(struct socket *sock,
 	/* The socket has been unlocked. */
 	if (!IS_ERR(call)) {
 		call->notify_rx = notify_rx;
-		mutex_unlock(&call->user_mutex);
+		up_write(&call->user_mutex);
 	}
 
 	rxrpc_put_peer(cp.peer);
@@ -351,7 +351,7 @@ void rxrpc_kernel_end_call(struct socket *sock, struct rxrpc_call *call)
 {
 	_enter("%d{%d}", call->debug_id, atomic_read(&call->usage));
 
-	mutex_lock(&call->user_mutex);
+	down_write(&call->user_mutex);
 	rxrpc_release_call(rxrpc_sk(sock->sk), call);
 
 	/* Make sure we're not going to call back into a kernel service */
@@ -361,7 +361,7 @@ void rxrpc_kernel_end_call(struct socket *sock, struct rxrpc_call *call)
 		spin_unlock_bh(&call->notify_lock);
 	}
 
-	mutex_unlock(&call->user_mutex);
+	up_write(&call->user_mutex);
 	rxrpc_put_call(call, rxrpc_call_put_kernel);
 }
 EXPORT_SYMBOL(rxrpc_kernel_end_call);
@@ -456,14 +456,14 @@ void rxrpc_kernel_set_max_life(struct socket *sock, struct rxrpc_call *call,
 {
 	unsigned long now;
 
-	mutex_lock(&call->user_mutex);
+	down_write(&call->user_mutex);
 
 	now = jiffies;
 	hard_timeout += now;
 	WRITE_ONCE(call->expect_term_by, hard_timeout);
 	rxrpc_reduce_call_timer(call, hard_timeout, now, rxrpc_timer_set_for_hard);
 
-	mutex_unlock(&call->user_mutex);
+	up_write(&call->user_mutex);
 }
 EXPORT_SYMBOL(rxrpc_kernel_set_max_life);
 
diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index 7c7d10f2e0c1..1701f2406463 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -557,7 +557,7 @@ struct rxrpc_call {
 	struct rxrpc_sock __rcu	*socket;	/* socket responsible */
 	struct rxrpc_net	*rxnet;		/* Network namespace to which call belongs */
 	const struct rxrpc_security *security;	/* applied security module */
-	struct mutex		user_mutex;	/* User access mutex */
+	struct rw_semaphore	user_mutex;	/* User access mutex */
 	unsigned long		ack_at;		/* When deferred ACK needs to happen */
 	unsigned long		ack_lost_at;	/* When ACK is figured as lost */
 	unsigned long		resend_at;	/* When next resend needs to happen */
diff --git a/net/rxrpc/call_accept.c b/net/rxrpc/call_accept.c
index 135bf5cd8dd5..fb9a751e3c35 100644
--- a/net/rxrpc/call_accept.c
+++ b/net/rxrpc/call_accept.c
@@ -378,7 +378,7 @@ struct rxrpc_call *rxrpc_new_incoming_call(struct rxrpc_local *local,
 	 * event and userspace is prevented from doing so until the state is
 	 * appropriate.
 	 */
-	if (!mutex_trylock(&call->user_mutex))
+	if (!down_write_trylock(&call->user_mutex))
 		BUG();
 
 	/* Make the call live. */
@@ -493,7 +493,7 @@ struct rxrpc_call *rxrpc_accept_call(struct rxrpc_sock *rx,
 	 * We are, however, still holding the socket lock, so other accepts
 	 * must wait for us and no one can add the user ID behind our backs.
 	 */
-	if (mutex_lock_interruptible(&call->user_mutex) < 0) {
+	if (down_write_killable(&call->user_mutex) < 0) {
 		release_sock(&rx->sk);
 		kleave(" = -ERESTARTSYS");
 		return ERR_PTR(-ERESTARTSYS);
diff --git a/net/rxrpc/call_object.c b/net/rxrpc/call_object.c
index a31c18c09894..7a5d48b23fce 100644
--- a/net/rxrpc/call_object.c
+++ b/net/rxrpc/call_object.c
@@ -115,7 +115,7 @@ struct rxrpc_call *rxrpc_alloc_call(struct rxrpc_sock *rx, gfp_t gfp,
 	if (!call->rxtx_annotations)
 		goto nomem_2;
 
-	mutex_init(&call->user_mutex);
+	init_rwsem(&call->user_mutex);
 
 	/* Prevent lockdep reporting a deadlock false positive between the afs
 	 * filesystem and sys_sendmsg() via the mmap sem.
@@ -247,7 +247,7 @@ struct rxrpc_call *rxrpc_new_client_call(struct rxrpc_sock *rx,
 	/* We need to protect a partially set up call against the user as we
 	 * will be acting outside the socket lock.
 	 */
-	mutex_lock(&call->user_mutex);
+	down_write(&call->user_mutex);
 
 	/* Publish the call, even though it is incompletely set up as yet */
 	write_lock(&rx->call_lock);
@@ -317,7 +317,7 @@ struct rxrpc_call *rxrpc_new_client_call(struct rxrpc_sock *rx,
 	trace_rxrpc_call(call->debug_id, rxrpc_call_error,
 			 atomic_read(&call->usage), here, ERR_PTR(ret));
 	rxrpc_release_call(rx, call);
-	mutex_unlock(&call->user_mutex);
+	up_write(&call->user_mutex);
 	rxrpc_put_call(call, rxrpc_call_put);
 	_leave(" = %d", ret);
 	return ERR_PTR(ret);
diff --git a/net/rxrpc/input.c b/net/rxrpc/input.c
index 157be1ff8697..6955ad66433b 100644
--- a/net/rxrpc/input.c
+++ b/net/rxrpc/input.c
@@ -1397,7 +1397,7 @@ int rxrpc_input_packet(struct sock *udp_sk, struct sk_buff *skb)
 		if (!call)
 			goto reject_packet;
 		rxrpc_send_ping(call, skb);
-		mutex_unlock(&call->user_mutex);
+		up_write(&call->user_mutex);
 	}
 
 	/* Process a call packet; this either discards or passes on the ref
diff --git a/net/rxrpc/recvmsg.c b/net/rxrpc/recvmsg.c
index 8578c39ec839..e6bf52fb0ad8 100644
--- a/net/rxrpc/recvmsg.c
+++ b/net/rxrpc/recvmsg.c
@@ -511,12 +511,12 @@ int rxrpc_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
 	/* We're going to drop the socket lock, so we need to lock the call
 	 * against interference by sendmsg.
 	 */
-	if (!mutex_trylock(&call->user_mutex)) {
+	if (!down_write_trylock(&call->user_mutex)) {
 		ret = -EWOULDBLOCK;
 		if (flags & MSG_DONTWAIT)
 			goto error_requeue_call;
 		ret = -ERESTARTSYS;
-		if (mutex_lock_interruptible(&call->user_mutex) < 0)
+		if (down_write_killable(&call->user_mutex) < 0)
 			goto error_requeue_call;
 	}
 
@@ -591,7 +591,7 @@ int rxrpc_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
 	ret = copied;
 
 error_unlock_call:
-	mutex_unlock(&call->user_mutex);
+	up_write(&call->user_mutex);
 	rxrpc_put_call(call, rxrpc_call_put);
 	trace_rxrpc_recvmsg(call, rxrpc_recvmsg_return, 0, 0, 0, ret);
 	return ret;
@@ -651,7 +651,7 @@ int rxrpc_kernel_recv_data(struct socket *sock, struct rxrpc_call *call,
 
 	ASSERTCMP(call->state, !=, RXRPC_CALL_SERVER_ACCEPTING);
 
-	mutex_lock(&call->user_mutex);
+	down_write(&call->user_mutex);
 
 	switch (READ_ONCE(call->state)) {
 	case RXRPC_CALL_CLIENT_RECV_REPLY:
@@ -704,7 +704,7 @@ int rxrpc_kernel_recv_data(struct socket *sock, struct rxrpc_call *call,
 
 	if (_service)
 		*_service = call->service_id;
-	mutex_unlock(&call->user_mutex);
+	up_write(&call->user_mutex);
 	_leave(" = %d [%zu,%d]", ret, iov_iter_count(iter), *_abort);
 	return ret;
 
@@ -744,7 +744,7 @@ bool rxrpc_kernel_get_reply_time(struct socket *sock, struct rxrpc_call *call,
 	rxrpc_seq_t hard_ack, top, seq;
 	bool success = false;
 
-	mutex_lock(&call->user_mutex);
+	down_write(&call->user_mutex);
 
 	if (READ_ONCE(call->state) != RXRPC_CALL_CLIENT_RECV_REPLY)
 		goto out;
@@ -766,7 +766,7 @@ bool rxrpc_kernel_get_reply_time(struct socket *sock, struct rxrpc_call *call,
 	success = true;
 
 out:
-	mutex_unlock(&call->user_mutex);
+	up_write(&call->user_mutex);
 	return success;
 }
 EXPORT_SYMBOL(rxrpc_kernel_get_reply_time);
diff --git a/net/rxrpc/sendmsg.c b/net/rxrpc/sendmsg.c
index 813fd6888142..d3a4749a2f8a 100644
--- a/net/rxrpc/sendmsg.c
+++ b/net/rxrpc/sendmsg.c
@@ -38,9 +38,9 @@ static int rxrpc_wait_for_tx_window_intr(struct rxrpc_sock *rx,
 			return sock_intr_errno(*timeo);
 
 		trace_rxrpc_transmit(call, rxrpc_transmit_wait);
-		mutex_unlock(&call->user_mutex);
+		up_write(&call->user_mutex);
 		*timeo = schedule_timeout(*timeo);
-		if (mutex_lock_interruptible(&call->user_mutex) < 0)
+		if (down_write_killable(&call->user_mutex) < 0)
 			return sock_intr_errno(*timeo);
 	}
 }
@@ -668,7 +668,7 @@ int rxrpc_do_sendmsg(struct rxrpc_sock *rx, struct msghdr *msg, size_t len)
 			break;
 		}
 
-		ret = mutex_lock_interruptible(&call->user_mutex);
+		ret = down_write_killable_nested(&call->user_mutex, 1);
 		release_sock(&rx->sk);
 		if (ret < 0) {
 			ret = -ERESTARTSYS;
@@ -737,7 +737,7 @@ int rxrpc_do_sendmsg(struct rxrpc_sock *rx, struct msghdr *msg, size_t len)
 	}
 
 out_put_unlock:
-	mutex_unlock(&call->user_mutex);
+	up_write(&call->user_mutex);
 error_put:
 	rxrpc_put_call(call, rxrpc_call_put);
 	_leave(" = %d", ret);
@@ -772,7 +772,7 @@ int rxrpc_kernel_send_data(struct socket *sock, struct rxrpc_call *call,
 	ASSERTCMP(msg->msg_name, ==, NULL);
 	ASSERTCMP(msg->msg_control, ==, NULL);
 
-	mutex_lock(&call->user_mutex);
+	down_write(&call->user_mutex);
 
 	_debug("CALL %d USR %lx ST %d on CONN %p",
 	       call->debug_id, call->user_call_ID, call->state, call->conn);
@@ -796,7 +796,7 @@ int rxrpc_kernel_send_data(struct socket *sock, struct rxrpc_call *call,
 		break;
 	}
 
-	mutex_unlock(&call->user_mutex);
+	up_write(&call->user_mutex);
 	_leave(" = %d", ret);
 	return ret;
 }
@@ -820,13 +820,13 @@ bool rxrpc_kernel_abort_call(struct socket *sock, struct rxrpc_call *call,
 
 	_enter("{%d},%d,%d,%s", call->debug_id, abort_code, error, why);
 
-	mutex_lock(&call->user_mutex);
+	down_write(&call->user_mutex);
 
 	aborted = rxrpc_abort_call(why, call, 0, abort_code, error);
 	if (aborted)
 		rxrpc_send_abort_packet(call);
 
-	mutex_unlock(&call->user_mutex);
+	up_write(&call->user_mutex);
 	return aborted;
 }
 EXPORT_SYMBOL(rxrpc_kernel_abort_call);


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
