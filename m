Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 611F118B2B9
	for <lists+linux-afs@lfdr.de>; Thu, 19 Mar 2020 12:54:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGC2CIo5LfWR24wa9SB0LhknBJUTlgsLocUGF/pMXA8=; b=erubir/x6WIzlt
	ByTHBZCCEK6wxnFvA5q9mTtDxgvPZKADeGz0U7odFCbrJIkDXwTZPbeLMmCAuM9pYkEBX36usBTqQ
	TA6VAI02+T0sw2zj9NCewBG9t1sZ6c/QgDH8mjHPD6h/vbjLkEMVbydjRle8CvSezkYtmqdQsKO3h
	PluSsjf0ZHiEjVMqSkO1lxAE4rGQyLYZrfbgblWn35YYLxYRg9LpnV7jGPpq1rvWb6S0fc+C3pIph
	xfjCIMvTA9PBNcR27pdeX0ikziQZA1YPVRfiYdM6Xa5LSUPtDf9zJuXElI1C5Qn0mSag/YDWonMPD
	pwgBIaKxJO8yGlEtKXGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEtkk-0007X7-9g; Thu, 19 Mar 2020 11:54:22 +0000
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEtkg-0007W3-Tn
 for linux-afs@lists.infradead.org; Thu, 19 Mar 2020 11:54:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584618858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rfvOuZmYPPi4oHcTlbLwuIRBNB4NZg4BmdQ1Q3rzHik=;
 b=fEIn4q0T+AZCwwR029ZbmANa8OLTqO4zECMM27na538d3AxRzIzx25lghK8xOC5aNa5DBj
 JuR3IOXCjJEWXzqw4so+1b2DXzY9mjFREIIB2FqHvze9HU8tN8P0LYxedDp184qKSzyYpH
 iPfAdLSiN3WNSnD0JtGpbk5cveuD6G4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-gLwI5eWdPLu38qGYwNUEhA-1; Thu, 19 Mar 2020 07:54:14 -0400
X-MC-Unique: gLwI5eWdPLu38qGYwNUEhA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D958D101FC60;
 Thu, 19 Mar 2020 11:54:12 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-126.rdu2.redhat.com
 [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0EB260BF7;
 Thu, 19 Mar 2020 11:54:11 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 6/6] afs: Fix client call Rx-phase signal handling
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 19 Mar 2020 11:54:11 +0000
Message-ID: <158461885129.3094720.6262740540849421125.stgit@warthog.procyon.org.uk>
In-Reply-To: <158461880968.3094720.5019510060910604912.stgit@warthog.procyon.org.uk>
References: <158461880968.3094720.5019510060910604912.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_045419_036055_581AF22D 
X-CRM114-Status: GOOD (  20.34  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [63.128.21.74 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Fix the handling of signals in client rxrpc calls made by the afs
filesystem.  Ignore signals completely, leaving call abandonment or
connection loss to be detected by timeouts inside AF_RXRPC.

Allowing a filesystem call to be interrupted after the entire request has
been transmitted and an abort sent means that the server may or may not
have done the action - and we don't know.  It may even be worse than that
for older servers.

Fixes: bc5e3a546d55 ("rxrpc: Use MSG_WAITALL to tell sendmsg() to temporarily ignore signals")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/rxrpc.c          |   34 ++--------------------------------
 include/net/af_rxrpc.h  |    4 +---
 net/rxrpc/af_rxrpc.c    |   33 +++------------------------------
 net/rxrpc/ar-internal.h |    1 -
 net/rxrpc/input.c       |    1 -
 5 files changed, 6 insertions(+), 67 deletions(-)

diff --git a/fs/afs/rxrpc.c b/fs/afs/rxrpc.c
index 972e3aafa361..1ecc67da6c1a 100644
--- a/fs/afs/rxrpc.c
+++ b/fs/afs/rxrpc.c
@@ -604,11 +604,7 @@ static void afs_deliver_to_call(struct afs_call *call)
 long afs_wait_for_call_to_complete(struct afs_call *call,
 				   struct afs_addr_cursor *ac)
 {
-	signed long rtt2, timeout;
 	long ret;
-	bool stalled = false;
-	u64 rtt;
-	u32 life, last_life;
 	bool rxrpc_complete = false;
 
 	DECLARE_WAITQUEUE(myself, current);
@@ -619,14 +615,6 @@ long afs_wait_for_call_to_complete(struct afs_call *call,
 	if (ret < 0)
 		goto out;
 
-	rtt = rxrpc_kernel_get_rtt(call->net->socket, call->rxcall);
-	rtt2 = nsecs_to_jiffies64(rtt) * 2;
-	if (rtt2 < 2)
-		rtt2 = 2;
-
-	timeout = rtt2;
-	rxrpc_kernel_check_life(call->net->socket, call->rxcall, &last_life);
-
 	add_wait_queue(&call->waitq, &myself);
 	for (;;) {
 		set_current_state(TASK_UNINTERRUPTIBLE);
@@ -637,37 +625,19 @@ long afs_wait_for_call_to_complete(struct afs_call *call,
 			call->need_attention = false;
 			__set_current_state(TASK_RUNNING);
 			afs_deliver_to_call(call);
-			timeout = rtt2;
 			continue;
 		}
 
 		if (afs_check_call_state(call, AFS_CALL_COMPLETE))
 			break;
 
-		if (!rxrpc_kernel_check_life(call->net->socket, call->rxcall, &life)) {
+		if (!rxrpc_kernel_check_life(call->net->socket, call->rxcall)) {
 			/* rxrpc terminated the call. */
 			rxrpc_complete = true;
 			break;
 		}
 
-		if (call->intr && timeout == 0 &&
-		    life == last_life && signal_pending(current)) {
-			if (stalled)
-				break;
-			__set_current_state(TASK_RUNNING);
-			rxrpc_kernel_probe_life(call->net->socket, call->rxcall);
-			timeout = rtt2;
-			stalled = true;
-			continue;
-		}
-
-		if (life != last_life) {
-			timeout = rtt2;
-			last_life = life;
-			stalled = false;
-		}
-
-		timeout = schedule_timeout(timeout);
+		schedule();
 	}
 
 	remove_wait_queue(&call->waitq, &myself);
diff --git a/include/net/af_rxrpc.h b/include/net/af_rxrpc.h
index 8e547b4d88c8..04e97bab6f28 100644
--- a/include/net/af_rxrpc.h
+++ b/include/net/af_rxrpc.h
@@ -64,9 +64,7 @@ int rxrpc_kernel_charge_accept(struct socket *, rxrpc_notify_rx_t,
 			       rxrpc_user_attach_call_t, unsigned long, gfp_t,
 			       unsigned int);
 void rxrpc_kernel_set_tx_length(struct socket *, struct rxrpc_call *, s64);
-bool rxrpc_kernel_check_life(const struct socket *, const struct rxrpc_call *,
-			     u32 *);
-void rxrpc_kernel_probe_life(struct socket *, struct rxrpc_call *);
+bool rxrpc_kernel_check_life(const struct socket *, const struct rxrpc_call *);
 u32 rxrpc_kernel_get_epoch(struct socket *, struct rxrpc_call *);
 bool rxrpc_kernel_get_reply_time(struct socket *, struct rxrpc_call *,
 				 ktime_t *);
diff --git a/net/rxrpc/af_rxrpc.c b/net/rxrpc/af_rxrpc.c
index 7603cf811f75..15ee92d79581 100644
--- a/net/rxrpc/af_rxrpc.c
+++ b/net/rxrpc/af_rxrpc.c
@@ -371,44 +371,17 @@ EXPORT_SYMBOL(rxrpc_kernel_end_call);
  * rxrpc_kernel_check_life - Check to see whether a call is still alive
  * @sock: The socket the call is on
  * @call: The call to check
- * @_life: Where to store the life value
  *
- * Allow a kernel service to find out whether a call is still alive - ie. we're
- * getting ACKs from the server.  Passes back in *_life a number representing
- * the life state which can be compared to that returned by a previous call and
- * return true if the call is still alive.
- *
- * If the life state stalls, rxrpc_kernel_probe_life() should be called and
- * then 2RTT waited.
+ * Allow a kernel service to find out whether a call is still alive -
+ * ie. whether it has completed.
  */
 bool rxrpc_kernel_check_life(const struct socket *sock,
-			     const struct rxrpc_call *call,
-			     u32 *_life)
+			     const struct rxrpc_call *call)
 {
-	*_life = call->acks_latest;
 	return call->state != RXRPC_CALL_COMPLETE;
 }
 EXPORT_SYMBOL(rxrpc_kernel_check_life);
 
-/**
- * rxrpc_kernel_probe_life - Poke the peer to see if it's still alive
- * @sock: The socket the call is on
- * @call: The call to check
- *
- * In conjunction with rxrpc_kernel_check_life(), allow a kernel service to
- * find out whether a call is still alive by pinging it.  This should cause the
- * life state to be bumped in about 2*RTT.
- *
- * The must be called in TASK_RUNNING state on pain of might_sleep() objecting.
- */
-void rxrpc_kernel_probe_life(struct socket *sock, struct rxrpc_call *call)
-{
-	rxrpc_propose_ACK(call, RXRPC_ACK_PING, 0, true, false,
-			  rxrpc_propose_ack_ping_for_check_life);
-	rxrpc_send_ack_packet(call, true, NULL);
-}
-EXPORT_SYMBOL(rxrpc_kernel_probe_life);
-
 /**
  * rxrpc_kernel_get_epoch - Retrieve the epoch value from a call.
  * @sock: The socket the call is on
diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index 1f72f43b082d..3eb1ab40ca5c 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -675,7 +675,6 @@ struct rxrpc_call {
 
 	/* transmission-phase ACK management */
 	ktime_t			acks_latest_ts;	/* Timestamp of latest ACK received */
-	rxrpc_serial_t		acks_latest;	/* serial number of latest ACK received */
 	rxrpc_seq_t		acks_lowest_nak; /* Lowest NACK in the buffer (or ==tx_hard_ack) */
 	rxrpc_seq_t		acks_lost_top;	/* tx_top at the time lost-ack ping sent */
 	rxrpc_serial_t		acks_lost_ping;	/* Serial number of probe ACK */
diff --git a/net/rxrpc/input.c b/net/rxrpc/input.c
index ef10fbf71b15..69e09d69c896 100644
--- a/net/rxrpc/input.c
+++ b/net/rxrpc/input.c
@@ -882,7 +882,6 @@ static void rxrpc_input_ack(struct rxrpc_call *call, struct sk_buff *skb)
 	    before(prev_pkt, call->ackr_prev_seq))
 		goto out;
 	call->acks_latest_ts = skb->tstamp;
-	call->acks_latest = sp->hdr.serial;
 
 	call->ackr_first_seq = first_soft_ack;
 	call->ackr_prev_seq = prev_pkt;



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
