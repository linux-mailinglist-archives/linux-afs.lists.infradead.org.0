Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5555714299F
	for <lists+linux-afs@lfdr.de>; Mon, 20 Jan 2020 12:35:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZrhGr/GjjCCAYYHO9Px+WRGeNbgI0kHcgyO3QdBO88A=; b=CDyZfp6SVmhCLz
	Zkw0TUC/IZmXQmRaz/wgF2ZYgnxTUy+BZb9tz2So9zdZQI2bOzKZQ4NGUwYvF7jst8XM8kCcfbnWv
	M8sb62DtttgtHdMYkHcQ0AXssEi68UaoWciwAwdD0dWWK1L+dI164VAIrkMRiZwG+Ut+gMPeMxS69
	ceQUCx0wDEs2yTKW2TC8Y1Gi2LFpXOgR0hGDO8mmu7jp4P0qVUGb+gXGo9+cXPC2bQAZbsfcAm/cT
	awEcoM60BDHd005phI66iPjXN8ZXzFPZ1EC2bKojCpStms/3BgPLlLSw+0lILFNhrxXhZSMB62gw+
	P6Hr3YuygRK4qyUlc82A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itVLR-0000ms-Fv; Mon, 20 Jan 2020 11:35:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iq2PC-0006I0-Ef
 for linux-afs@lists.infradead.org; Fri, 10 Jan 2020 22:05:24 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9EC9520721;
 Fri, 10 Jan 2020 22:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578693921;
 bh=OeYlZmKEnASzxm0ANx4mTtUJ4sWo9i72CGM2hFCS144=;
 h=From:To:Cc:Subject:Date:From;
 b=Sxx7WOWkspGT4EHEBmJMpCUku+EpAF7dxpYIATVkW4Q7DoA3nBKCRjjbA28sPzSwJ
 iEk4tHLJbChh+WB6TWa9aOEoo2igW1V/oHWEVVNEkPlpdS0nykMkzot4QLFoPUyldC
 T5IFcvpxP1bDEKwWlnB1P8ycJztK7z0L3bMtVEk0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 06/26] rxrpc: Unlock new call in
 rxrpc_new_incoming_call() rather than the caller
Date: Fri, 10 Jan 2020 17:04:59 -0500
Message-Id: <20200110220519.28250-1-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_140522_535528_B574796E 
X-CRM114-Status: GOOD (  13.00  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Mon, 20 Jan 2020 03:35:47 -0800
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
Cc: Sasha Levin <sashal@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Peter Zijlstra <peterz@infradead.org>, netdev@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit f33121cbe91973a08e68e4bde8c3f7e6e4e351c1 ]

Move the unlock and the ping transmission for a new incoming call into
rxrpc_new_incoming_call() rather than doing it in the caller.  This makes
it clearer to see what's going on.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: David Howells <dhowells@redhat.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
cc: Ingo Molnar <mingo@redhat.com>
cc: Will Deacon <will@kernel.org>
cc: Davidlohr Bueso <dave@stgolabs.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/rxrpc/call_accept.c | 36 ++++++++++++++++++++++++++++--------
 net/rxrpc/input.c       | 18 ------------------
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
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
