Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBE0124FE0
	for <lists+linux-afs@lfdr.de>; Wed, 18 Dec 2019 18:55:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zHmiDREgjjXsUdwsUn12l7D161WU+xVkt9B9JScFwqY=; b=SK2GwKkO+BshX0
	3SaO0jYxPA1FSzUUw79LlmqMGVLpGSqYOOAoI0zwEA8yNy5touN+DJrqZgEtFEHGX5CmKpbyXYYap
	SpHBwvdLnBgdys/G7nLxgP1j6DQi7B4TAe+8kGiWW+/xDCE/hWJEM+REZBgC6wTPBnMj+ZK3LBQ8q
	6MhQNsKuuEV4MJU9+E41aUSYbYBssVR4JUTQ5Qp+ct7he2DqMDc94gBaEfZGJ8QrWYXpQh6vkL31O
	3i6AkjbndTV1amLEbCudUa8dvxAFceZ7KP6AZfIKhsZVRrQk/zWf9LEYotZ05iitFSOZkYD9tInr5
	ZfcH5R1GwdRyjl4HMRKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihdXK-0002ES-Jc; Wed, 18 Dec 2019 17:55:02 +0000
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihdXH-0002CE-Ok
 for linux-afs@lists.infradead.org; Wed, 18 Dec 2019 17:55:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576691697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=x/mlg4GGa2aCtPbSlBatjfyqFvuYzfdyE66T7sANnY0=;
 b=bxtG3SUi71oMqF3J0YApbtu0tH2bo+ZRuiVeqPS1oepo1EwgFetObL1MxLyUGfrs11ebVp
 h1abA5PF/Hs/tai2aH9ZnnzGAI15x1+BWTZkgk4vszDboTTXw//Ikb2x1LHgRfd4DtjRtz
 woNk9evu/wqev7AglJkpeRbDi4hG5wI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-cGKh1adtPNKbKudn6dcr4A-1; Wed, 18 Dec 2019 12:54:54 -0500
X-MC-Unique: cGKh1adtPNKbKudn6dcr4A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D69D18557C2;
 Wed, 18 Dec 2019 17:54:53 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-52.rdu2.redhat.com
 [10.10.120.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 793127C82A;
 Wed, 18 Dec 2019 17:54:51 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 1/2] rxrpc: Unlock new call in rxrpc_new_incoming_call()
 rather than the caller
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 18 Dec 2019 17:54:50 +0000
Message-ID: <157669169065.21991.15207045893761573624.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_095459_880239_AB55DBEC 
X-CRM114-Status: GOOD (  13.93  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [207.211.31.81 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [207.211.31.81 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: Davidlohr Bueso <dave@stgolabs.net>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, dhowells@redhat.com,
 Ingo Molnar <mingo@redhat.com>, linux-fsdevel@vger.kernel.org,
 Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Move the unlock and the ping transmission for a new incoming call into
rxrpc_new_incoming_call() rather than doing it in the caller.  This makes
it clearer to see what's going on.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Peter Zijlstra <peterz@infradead.org>
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
