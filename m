Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D635A1ACC
	for <lists+linux-afs@lfdr.de>; Thu, 29 Aug 2019 15:06:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bIyXPOawNf39TEkmeYspT1qR1smicqAoeTkGsTZ3GP4=; b=baD+ZL/PUnPTCG
	fjSQ6yPnNtgRG66FkJA2U0bFAmPa4JKO16LvvCyeFbGAFzuaF+3n7YlpaJKtuvnQiQwkB7uXkQbR+
	BqJ0hkbfqYfR1PxIbGo+4pq7pIVvGEcuojCkayjExZQqbec7ob1sE2JfAj26xjzoKu5kcaYuNAok+
	+bLhdB4D+tZQfRb6QPcDI38gPkgH/kfqXWyHNMGQ6OCitBX0olXc+VOW/iDdSClEbvs0P5WGoH1UC
	wZOss+8W1P18Kxwbq15i6sPLXM67IoypkDDHAEQXvVD6TiyTSVz+L4fGaw2xr/c0HAHPZ0t/DRNVZ
	1Aea/mwLNzlTWi7eo4sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3K88-0000rj-3L; Thu, 29 Aug 2019 13:06:24 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3K85-0000r9-LR
 for linux-afs@lists.infradead.org; Thu, 29 Aug 2019 13:06:23 +0000
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6500E308219E;
 Thu, 29 Aug 2019 13:06:21 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80C555C1D6;
 Thu, 29 Aug 2019 13:06:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 1/5] rxrpc: Pass the input handler's data skb reference
 to the Rx ring
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 29 Aug 2019 14:06:19 +0100
Message-ID: <156708397971.25861.1471138213727662062.stgit@warthog.procyon.org.uk>
In-Reply-To: <156708397261.25861.2158085372781699276.stgit@warthog.procyon.org.uk>
References: <156708397261.25861.2158085372781699276.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 29 Aug 2019 13:06:21 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_060621_740724_659FB5C5 
X-CRM114-Status: GOOD (  16.59  )
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

 net/rxrpc/input.c |   20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/net/rxrpc/input.c b/net/rxrpc/input.c
index 35b1a9368d80..140cede77655 100644
--- a/net/rxrpc/input.c
+++ b/net/rxrpc/input.c
@@ -422,7 +422,8 @@ static void rxrpc_input_dup_data(struct rxrpc_call *call, rxrpc_seq_t seq,
 }
 
 /*
- * Process a DATA packet, adding the packet to the Rx ring.
+ * Process a DATA packet, adding the packet to the Rx ring.  The caller's
+ * packet ref must be passed on or discarded.
  */
 static void rxrpc_input_data(struct rxrpc_call *call, struct sk_buff *skb)
 {
@@ -441,8 +442,10 @@ static void rxrpc_input_data(struct rxrpc_call *call, struct sk_buff *skb)
 	       sp->hdr.serial, seq0, sp->hdr.flags, sp->nr_subpackets);
 
 	state = READ_ONCE(call->state);
-	if (state >= RXRPC_CALL_COMPLETE)
+	if (state >= RXRPC_CALL_COMPLETE) {
+		rxrpc_free_skb(skb, rxrpc_skb_rx_freed);
 		return;
+	}
 
 	if (call->state == RXRPC_CALL_SERVER_RECV_REQUEST) {
 		unsigned long timo = READ_ONCE(call->next_req_timo);
@@ -555,7 +558,8 @@ static void rxrpc_input_data(struct rxrpc_call *call, struct sk_buff *skb)
 		 * Barriers against rxrpc_recvmsg_data() and rxrpc_rotate_rx_window()
 		 * and also rxrpc_fill_out_ack().
 		 */
-		rxrpc_get_skb(skb, rxrpc_skb_rx_got);
+		if (!terminal)
+			rxrpc_get_skb(skb, rxrpc_skb_rx_got);
 		call->rxtx_annotations[ix] = annotation;
 		smp_wmb();
 		call->rxtx_buffer[ix] = skb;
@@ -616,6 +620,7 @@ static void rxrpc_input_data(struct rxrpc_call *call, struct sk_buff *skb)
 
 unlock:
 	spin_unlock(&call->input_lock);
+	rxrpc_free_skb(skb, rxrpc_skb_rx_freed);
 	_leave(" [queued]");
 }
 
@@ -1024,7 +1029,7 @@ static void rxrpc_input_call_packet(struct rxrpc_call *call,
 	switch (sp->hdr.type) {
 	case RXRPC_PACKET_TYPE_DATA:
 		rxrpc_input_data(call, skb);
-		break;
+		goto no_free;
 
 	case RXRPC_PACKET_TYPE_ACK:
 		rxrpc_input_ack(call, skb);
@@ -1051,6 +1056,8 @@ static void rxrpc_input_call_packet(struct rxrpc_call *call,
 		break;
 	}
 
+	rxrpc_free_skb(skb, rxrpc_skb_rx_freed);
+no_free:
 	_leave("");
 }
 
@@ -1375,8 +1382,11 @@ int rxrpc_input_packet(struct sock *udp_sk, struct sk_buff *skb)
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
