Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C3E99338
	for <lists+linux-afs@lfdr.de>; Thu, 22 Aug 2019 14:23:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4NfhGCAOMAMio12KMJ14QYV/JgWp6pL3UVReZMn3Xo=; b=jSkSNN/MKVTg9S
	SWm+UWSSQk4/c+YT3WhqgP5ym0Tum0ZFHFGU2aA9L1l/UX86a7c1WCDNDeCYZLmXx9kT/RduIlUl+
	wdyY+05wdXWG1Uu/XCrOnr9M5Nc87BYZK+94LfOFZVJwM1PkgK6FhphsB+f2h9RDy5af4TIDc9EV8
	B9QPjIbbmvbdq/X98D2aOmBBJayq42F21rj3jL2WOKnvM8lKeDb5RBzPsD1WX6/7SFZzHOf9tOKjF
	WxpHV96Iojg7ulgLuM53a4qZdZHso3APLZyDSTz08H51NQ0pqy0MTqWSQcCBTL5gV4jMTW91JI0Se
	lbhSHWRvdFId1EYM1PUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0m7p-0006Lm-Mq; Thu, 22 Aug 2019 12:23:33 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0m7m-0006LI-Cc
 for linux-afs@lists.infradead.org; Thu, 22 Aug 2019 12:23:31 +0000
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 25193693E7;
 Thu, 22 Aug 2019 12:23:30 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2332D5DAA0;
 Thu, 22 Aug 2019 12:23:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 1/9] rxrpc: Pass the input handler's data skb reference
 to the Rx ring
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 22 Aug 2019 13:23:28 +0100
Message-ID: <156647660836.11061.3521782307257461575.stgit@warthog.procyon.org.uk>
In-Reply-To: <156647659913.11061.13764606104739742865.stgit@warthog.procyon.org.uk>
References: <156647659913.11061.13764606104739742865.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 22 Aug 2019 12:23:30 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190822_052330_472435_024F6D18 
X-CRM114-Status: GOOD (  19.43  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
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

Pass the reference held on a DATA skb in the rxrpc input handler into the
Rx ring rather than getting an additional ref for this and then dropping
the original ref at the end.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 net/rxrpc/input.c |   48 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/net/rxrpc/input.c b/net/rxrpc/input.c
index dd47d465d1d3..5789ec5ad54f 100644
--- a/net/rxrpc/input.c
+++ b/net/rxrpc/input.c
@@ -416,7 +416,8 @@ static void rxrpc_input_dup_data(struct rxrpc_call *call, rxrpc_seq_t seq,
 }
 
 /*
- * Process a DATA packet, adding the packet to the Rx ring.
+ * Process a DATA packet, adding the packet to the Rx ring.  The caller's
+ * packet ref must be passed on or discarded.
  */
 static void rxrpc_input_data(struct rxrpc_call *call, struct sk_buff *skb)
 {
@@ -425,20 +426,22 @@ static void rxrpc_input_data(struct rxrpc_call *call, struct sk_buff *skb)
 	unsigned int offset = sizeof(struct rxrpc_wire_header);
 	unsigned int ix;
 	rxrpc_serial_t serial = sp->hdr.serial, ack_serial = 0;
-	rxrpc_seq_t seq = sp->hdr.seq, hard_ack;
+	rxrpc_seq_t seq0 = sp->hdr.seq, seq, hard_ack;
 	bool immediate_ack = false, jumbo_bad = false, queued;
 	u16 len;
-	u8 ack = 0, flags, annotation = 0;
+	u8 ack = 0, flags, jumbo_flags, annotation = 0;
 
 	_enter("{%u,%u},{%u,%u}",
 	       call->rx_hard_ack, call->rx_top, skb->len, seq);
 
 	_proto("Rx DATA %%%u { #%u f=%02x }",
-	       sp->hdr.serial, seq, sp->hdr.flags);
+	       sp->hdr.serial, seq0, sp->hdr.flags);
 
 	state = READ_ONCE(call->state);
-	if (state >= RXRPC_CALL_COMPLETE)
+	if (state >= RXRPC_CALL_COMPLETE) {
+		rxrpc_free_skb(skb, rxrpc_skb_rx_freed);
 		return;
+	}
 
 	if (call->state == RXRPC_CALL_SERVER_RECV_REQUEST) {
 		unsigned long timo = READ_ONCE(call->next_req_timo);
@@ -463,7 +466,8 @@ static void rxrpc_input_data(struct rxrpc_call *call, struct sk_buff *skb)
 	    !rxrpc_receiving_reply(call))
 		goto unlock;
 
-	call->ackr_prev_seq = seq;
+	call->ackr_prev_seq = seq0;
+	seq = seq0;
 
 	hard_ack = READ_ONCE(call->rx_hard_ack);
 	if (after(seq, hard_ack + call->rx_winsize)) {
@@ -533,12 +537,25 @@ static void rxrpc_input_data(struct rxrpc_call *call, struct sk_buff *skb)
 	 * Barriers against rxrpc_recvmsg_data() and rxrpc_rotate_rx_window()
 	 * and also rxrpc_fill_out_ack().
 	 */
-	rxrpc_get_skb(skb, rxrpc_skb_rx_got);
+	if (flags & RXRPC_JUMBO_PACKET) {
+		rxrpc_get_skb(skb, rxrpc_skb_rx_got);
+		if (skb_copy_bits(skb, offset, &jumbo_flags, 1) < 0) {
+			rxrpc_proto_abort("XJF", call, seq);
+			goto unlock;
+		}
+	}
 	call->rxtx_annotations[ix] = annotation;
 	smp_wmb();
 	call->rxtx_buffer[ix] = skb;
 	if (after(seq, call->rx_top)) {
 		smp_store_release(&call->rx_top, seq);
+		if (!(flags & RXRPC_JUMBO_PACKET)) {
+			/* From this point on, we're not allowed to touch the
+			 * packet any longer as its ref now belongs to the Rx
+			 * ring.
+			 */
+			skb = NULL;
+		}
 	} else if (before(seq, call->rx_top)) {
 		/* Send an immediate ACK if we fill in a hole */
 		if (!ack) {
@@ -567,10 +584,7 @@ static void rxrpc_input_data(struct rxrpc_call *call, struct sk_buff *skb)
 skip:
 	offset += len;
 	if (flags & RXRPC_JUMBO_PACKET) {
-		if (skb_copy_bits(skb, offset, &flags, 1) < 0) {
-			rxrpc_proto_abort("XJF", call, seq);
-			goto unlock;
-		}
+		flags = jumbo_flags;
 		offset += sizeof(struct rxrpc_jumbo_header);
 		seq++;
 		serial++;
@@ -606,13 +620,14 @@ static void rxrpc_input_data(struct rxrpc_call *call, struct sk_buff *skb)
 				  false, true,
 				  rxrpc_propose_ack_input_data);
 
-	if (sp->hdr.seq == READ_ONCE(call->rx_hard_ack) + 1) {
+	if (seq0 == READ_ONCE(call->rx_hard_ack) + 1) {
 		trace_rxrpc_notify_socket(call->debug_id, serial);
 		rxrpc_notify_socket(call);
 	}
 
 unlock:
 	spin_unlock(&call->input_lock);
+	rxrpc_free_skb(skb, rxrpc_skb_rx_freed);
 	_leave(" [queued]");
 }
 
@@ -1021,7 +1036,7 @@ static void rxrpc_input_call_packet(struct rxrpc_call *call,
 	switch (sp->hdr.type) {
 	case RXRPC_PACKET_TYPE_DATA:
 		rxrpc_input_data(call, skb);
-		break;
+		goto no_free;
 
 	case RXRPC_PACKET_TYPE_ACK:
 		rxrpc_input_ack(call, skb);
@@ -1048,6 +1063,8 @@ static void rxrpc_input_call_packet(struct rxrpc_call *call,
 		break;
 	}
 
+	rxrpc_free_skb(skb, rxrpc_skb_rx_freed);
+no_free:
 	_leave("");
 }
 
@@ -1373,8 +1390,11 @@ int rxrpc_input_packet(struct sock *udp_sk, struct sk_buff *skb)
 		mutex_unlock(&call->user_mutex);
 	}
 
+	/* Process a call packet; this either discards or passes on the ref
+	 * elsewhere.
+	 */
 	rxrpc_input_call_packet(call, skb);
-	goto discard;
+	goto out;
 
 discard:
 	rxrpc_free_skb(skb, rxrpc_skb_rx_freed);


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
