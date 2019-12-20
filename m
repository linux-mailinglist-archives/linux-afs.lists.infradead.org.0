Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 329EF12855A
	for <lists+linux-afs@lfdr.de>; Sat, 21 Dec 2019 00:06:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dbKB2LsmQQztgkhu16F2hNu/g7JMrYl0BpNadmn1p4M=; b=nvLe6gfQcMUu5+
	F/8EA1q8bZOYPKA7OcQcO4odLaStjWDE9CE/EPLDG7HrmZlR3Npb/A8CF0brPf+TdGm2vK2vAFnLq
	4c/s7ra5lwavDNgkl7YacLkMUe2EAWDlYjsqHDjvOm+DfVprkx28U4ZuB0m/ZBiUkD+QOXDCWM+ix
	uuvMuw0w7APvP5oIKZ/E8Jt6RxZ9heZ4WFAlVot4c5JyF/4y+vyBkHOtSkhddEIN8ePTf+HtwbXPE
	eVQIqQq9WgkgUJAofpNFUGK632YV7DQo0VaYYyd9vbCGgek+UV5ny0rlOf0Cr9oiFSjh11EzXSQCp
	vK3EXpxCBkC8i2WClfUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiRLH-0000Vf-BV; Fri, 20 Dec 2019 23:05:55 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiRLC-0000Up-Ph
 for linux-afs@lists.infradead.org; Fri, 20 Dec 2019 23:05:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576883149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RugIUnrT0IXWZEDpFCX6NMbBXs18nsIOXN5XADogx9Q=;
 b=NbcgFAeG0Yjqrd8sgKivNwkytvzxQgyl2odYdUJYFNAQ6LdIQUyr8JyovYHAhuy7w4pFKI
 vLiYvOQydfepO9xRSknOPeodIIqBpIcsAUr86nC1Gji6pSybzQmZEB/w/B/nSi4zp8Pstt
 TGwUsg4ptG4Hm7QDAgYb8dx8PxWrs5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-y-riA9GkPD6PfsQqTLJmoQ-1; Fri, 20 Dec 2019 18:05:44 -0500
X-MC-Unique: y-riA9GkPD6PfsQqTLJmoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B31A61856A61;
 Fri, 20 Dec 2019 23:05:43 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-52.rdu2.redhat.com
 [10.10.120.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C882D5DA60;
 Fri, 20 Dec 2019 23:05:42 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 1/3] rxrpc: Unlock new call in rxrpc_new_incoming_call()
 rather than the caller
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Fri, 20 Dec 2019 23:05:42 +0000
Message-ID: <157688314212.18782.6418636287725528268.stgit@warthog.procyon.org.uk>
In-Reply-To: <157688313527.18782.11664545318996365146.stgit@warthog.procyon.org.uk>
References: <157688313527.18782.11664545318996365146.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_150550_911102_F5D1C114 
X-CRM114-Status: GOOD (  14.26  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [207.211.31.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Move the unlock and the ping transmission for a new incoming call into
rxrpc_new_incoming_call() rather than doing it in the caller.  This makes
it clearer to see what's going on.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: David Howells <dhowells@redhat.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
cc: Ingo Molnar <mingo@redhat.com>
cc: Will Deacon <will@kernel.org>
cc: Davidlohr Bueso <dave@stgolabs.net>
---

 net/rxrpc/call_accept.c |   36 ++++++++++++++++++++++++++++--------
 net/rxrpc/input.c       |   18 ------------------
 2 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/net/rxrpc/call_accept.c b/net/rxrpc/call_accept.c
index 135bf5cd8dd5..3685b1732f65 100644
--- a/net/rxrpc/call_accept.c
+++ b/net/rxrpc/call_accept.c
@@ -239,6 +239,22 @@ void rxrpc_discard_prealloc(struct rxrpc_sock *rx)
 	kfree(b);
 }
 
+/*
+ * Ping the other end to fill our RTT cache and to retrieve the rwind
+ * and MTU parameters.
+ */
+static void rxrpc_send_ping(struct rxrpc_call *call, struct sk_buff *skb)
+{
+	struct rxrpc_skb_priv *sp = rxrpc_skb(skb);
+	ktime_t now = skb->tstamp;
+
+	if (call->peer->rtt_usage < 3 ||
+	    ktime_before(ktime_add_ms(call->peer->rtt_last_req, 1000), now))
+		rxrpc_propose_ACK(call, RXRPC_ACK_PING, sp->hdr.serial,
+				  true, true,
+				  rxrpc_propose_ack_ping_for_params);
+}
+
 /*
  * Allocate a new incoming call from the prealloc pool, along with a connection
  * and a peer as necessary.
@@ -346,9 +362,7 @@ struct rxrpc_call *rxrpc_new_incoming_call(struct rxrpc_local *local,
 				  sp->hdr.seq, RX_INVALID_OPERATION, ESHUTDOWN);
 		skb->mark = RXRPC_SKB_MARK_REJECT_ABORT;
 		skb->priority = RX_INVALID_OPERATION;
-		_leave(" = NULL [close]");
-		call = NULL;
-		goto out;
+		goto no_call;
 	}
 
 	/* The peer, connection and call may all have sprung into existence due
@@ -361,9 +375,7 @@ struct rxrpc_call *rxrpc_new_incoming_call(struct rxrpc_local *local,
 	call = rxrpc_alloc_incoming_call(rx, local, peer, conn, skb);
 	if (!call) {
 		skb->mark = RXRPC_SKB_MARK_REJECT_BUSY;
-		_leave(" = NULL [busy]");
-		call = NULL;
-		goto out;
+		goto no_call;
 	}
 
 	trace_rxrpc_receive(call, rxrpc_receive_incoming,
@@ -432,10 +444,18 @@ struct rxrpc_call *rxrpc_new_incoming_call(struct rxrpc_local *local,
 	 */
 	rxrpc_put_call(call, rxrpc_call_put);
 
-	_leave(" = %p{%d}", call, call->debug_id);
-out:
 	spin_unlock(&rx->incoming_lock);
+
+	rxrpc_send_ping(call, skb);
+	mutex_unlock(&call->user_mutex);
+
+	_leave(" = %p{%d}", call, call->debug_id);
 	return call;
+
+no_call:
+	spin_unlock(&rx->incoming_lock);
+	_leave(" = NULL [%u]", skb->mark);
+	return NULL;
 }
 
 /*
diff --git a/net/rxrpc/input.c b/net/rxrpc/input.c
index 157be1ff8697..86bd133b4fa0 100644
--- a/net/rxrpc/input.c
+++ b/net/rxrpc/input.c
@@ -192,22 +192,6 @@ static void rxrpc_congestion_management(struct rxrpc_call *call,
 	goto out_no_clear_ca;
 }
 
-/*
- * Ping the other end to fill our RTT cache and to retrieve the rwind
- * and MTU parameters.
- */
-static void rxrpc_send_ping(struct rxrpc_call *call, struct sk_buff *skb)
-{
-	struct rxrpc_skb_priv *sp = rxrpc_skb(skb);
-	ktime_t now = skb->tstamp;
-
-	if (call->peer->rtt_usage < 3 ||
-	    ktime_before(ktime_add_ms(call->peer->rtt_last_req, 1000), now))
-		rxrpc_propose_ACK(call, RXRPC_ACK_PING, sp->hdr.serial,
-				  true, true,
-				  rxrpc_propose_ack_ping_for_params);
-}
-
 /*
  * Apply a hard ACK by advancing the Tx window.
  */
@@ -1396,8 +1380,6 @@ int rxrpc_input_packet(struct sock *udp_sk, struct sk_buff *skb)
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
