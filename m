Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 245C499352
	for <lists+linux-afs@lfdr.de>; Thu, 22 Aug 2019 14:24:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ypV1xJCtkipKOUsQgcIkPmS7FeVqkN4VHr2dUpoQ6hE=; b=beBwmiumiIBAWg
	vPdsnskxvf1DzUD1t3yY/uGU2TvWpfmdMXwjt7F3WCukOj8uDHQ/9ELxs4tf44L7xfKkuBkOTs3Ug
	JAqjN9m3WqjVP9CGY+olp92c9bOlPwTQOS5AipE2c3nYnt5kcqquOcOVsyQXHYTj7KBLoxfNLRshE
	JLNltVGOMa1BtZTcoFwujoYWHv9YhjZCbErVb+LjduZy7T0+vCAEUSabbA/40zqQCBsvumTpQSlRg
	zoY/K3eSz6QZtebtswU9hVzEEtd+tEZlepjRBLhMBl6J71fdIdo+HW0iBpvcY7r5Hsu5H0fQdpFjk
	3f0A9/Ld/JfYqBDeYGww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0m8j-0006j8-2i; Thu, 22 Aug 2019 12:24:29 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0m8f-0006fl-7h
 for linux-afs@lists.infradead.org; Thu, 22 Aug 2019 12:24:26 +0000
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 03B2A8980FD;
 Thu, 22 Aug 2019 12:24:25 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 050A360BF3;
 Thu, 22 Aug 2019 12:24:23 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 8/9] rxrpc: Use shadow refcount for packets in the RxTx
 ring
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 22 Aug 2019 13:24:23 +0100
Message-ID: <156647666326.11061.14956300925060774849.stgit@warthog.procyon.org.uk>
In-Reply-To: <156647659913.11061.13764606104739742865.stgit@warthog.procyon.org.uk>
References: <156647659913.11061.13764606104739742865.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Thu, 22 Aug 2019 12:24:25 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190822_052425_368157_9DC4DB7E 
X-CRM114-Status: GOOD (  20.10  )
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

Use the previously added shadow refcount for packets that are in the Rx/Tx
ring so that the ring itself only ever holds a single ref on the skbuff.

This allows skb_cow_data() to be used by the recvmsg code to make the data
modifyable for in-place decryption without triggering the assertion in
pskb_expand_head:

	BUG_ON(skb_shared(skb));

This *should* be okay as:

 (1) Once rxrpc_input_data() starts attaching the sk_buff to the ring, it
     no longer looks inside the packet (all the parsing was done previously
     and notes were taken in struct rxrpc_skb_priv).

 (2) rxrpc_recvmsg_data() may not run in parallel for a particular call.

 (3) rxrpc_recvmsg_data() cow's the sk_buff the first time it sees it and
     then steps through each pointer from the buffer in order, unpinning as
     it goes.

     Each subpacket is individually and sequentially decrypted in place in
     the sk_buff, hence the need for skb_cow_data().

 (4) No one else can be looking in a packet in the Rx ring once it's there.

The problem was occuring because the softirq handler may be holding a ref
or the ring may be holding multiple refs when skb_cow_data() is called in
rxkad_verify_packet(), and so skb_shared() returns true and
__pskb_pull_tail() dislikes that.  If this occurs, something like the
following report will be generated.

	kernel BUG at net/core/skbuff.c:1463!
	...
	RIP: 0010:pskb_expand_head+0x253/0x2b0
	...
	Call Trace:
	 __pskb_pull_tail+0x49/0x460
	 skb_cow_data+0x6f/0x300
	 rxkad_verify_packet+0x18b/0xb10 [rxrpc]
	 rxrpc_recvmsg_data.isra.11+0x4a8/0xa10 [rxrpc]
	 rxrpc_kernel_recv_data+0x126/0x240 [rxrpc]
	 afs_extract_data+0x51/0x2d0 [kafs]
	 afs_deliver_fs_fetch_data+0x188/0x400 [kafs]
	 afs_deliver_to_call+0xac/0x430 [kafs]
	 afs_wait_for_call_to_complete+0x22f/0x3d0 [kafs]
	 afs_make_call+0x282/0x3f0 [kafs]
	 afs_fs_fetch_data+0x164/0x300 [kafs]
	 afs_fetch_data+0x54/0x130 [kafs]
	 afs_readpages+0x20d/0x340 [kafs]
	 read_pages+0x66/0x180
	 __do_page_cache_readahead+0x188/0x1a0
	 ondemand_readahead+0x17d/0x2e0
	 generic_file_read_iter+0x740/0xc10
	 __vfs_read+0x145/0x1a0
	 vfs_read+0x8c/0x140
	 ksys_read+0x4a/0xb0
	 do_syscall_64+0x43/0xf0
	 entry_SYSCALL_64_after_hwframe+0x44/0xa9

Fixes: 248f219cb8bc ("rxrpc: Rewrite the data and ack handling code")
Reported-by: Julian Wollrath <jwollrath@web.de>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 net/rxrpc/call_object.c |    2 +-
 net/rxrpc/input.c       |   22 ++++++++++------------
 net/rxrpc/recvmsg.c     |    2 +-
 net/rxrpc/sendmsg.c     |    1 +
 4 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/net/rxrpc/call_object.c b/net/rxrpc/call_object.c
index 014548c259ce..830b6152dfa3 100644
--- a/net/rxrpc/call_object.c
+++ b/net/rxrpc/call_object.c
@@ -429,7 +429,7 @@ static void rxrpc_cleanup_ring(struct rxrpc_call *call)
 	int i;
 
 	for (i = 0; i < RXRPC_RXTX_BUFF_SIZE; i++) {
-		rxrpc_free_skb(call->rxtx_buffer[i], rxrpc_skb_cleaned);
+		rxrpc_unpin_skb(call->rxtx_buffer[i], rxrpc_skb_cleaned);
 		call->rxtx_buffer[i] = NULL;
 	}
 }
diff --git a/net/rxrpc/input.c b/net/rxrpc/input.c
index 31090bdf1fae..660b7eed39b7 100644
--- a/net/rxrpc/input.c
+++ b/net/rxrpc/input.c
@@ -258,7 +258,7 @@ static bool rxrpc_rotate_tx_window(struct rxrpc_call *call, rxrpc_seq_t to,
 		skb = list;
 		list = skb->next;
 		skb_mark_not_on_list(skb);
-		rxrpc_free_skb(skb, rxrpc_skb_freed);
+		rxrpc_unpin_skb(skb, rxrpc_skb_unpin);
 	}
 
 	return rot_last;
@@ -447,6 +447,8 @@ static void rxrpc_input_data(struct rxrpc_call *call, struct sk_buff *skb)
 		return;
 	}
 
+	atomic_set(&sp->nr_ring_pins, 1);
+
 	if (call->state == RXRPC_CALL_SERVER_RECV_REQUEST) {
 		unsigned long timo = READ_ONCE(call->next_req_timo);
 		unsigned long now, expect_req_by;
@@ -550,6 +552,12 @@ static void rxrpc_input_data(struct rxrpc_call *call, struct sk_buff *skb)
 			ack_serial = serial;
 		}
 
+		/* Each insertion into the rxtx_buffer holds a ring pin.  This
+		 * allows a single ref on the buffer to be shared, thereby
+		 * allowing skb_cow_data() to be used.
+		 */
+		rxrpc_pin_skb(skb, rxrpc_skb_pin);
+
 		/* Queue the packet.  We use a couple of memory barriers here as need
 		 * to make sure that rx_top is perceived to be set after the buffer
 		 * pointer and that the buffer pointer is set after the annotation and
@@ -558,8 +566,6 @@ static void rxrpc_input_data(struct rxrpc_call *call, struct sk_buff *skb)
 		 * Barriers against rxrpc_recvmsg_data() and rxrpc_rotate_rx_window()
 		 * and also rxrpc_fill_out_ack().
 		 */
-		if (!terminal)
-			rxrpc_get_skb(skb, rxrpc_skb_got);
 		call->rxtx_annotations[ix] = annotation;
 		smp_wmb();
 		call->rxtx_buffer[ix] = skb;
@@ -574,14 +580,6 @@ static void rxrpc_input_data(struct rxrpc_call *call, struct sk_buff *skb)
 			immediate_ack = true;
 		}
 
-		if (terminal) {
-			/* From this point on, we're not allowed to touch the
-			 * packet any longer as its ref now belongs to the Rx
-			 * ring.
-			 */
-			skb = NULL;
-		}
-
 		if (last) {
 			set_bit(RXRPC_CALL_RX_LAST, &call->flags);
 			if (!ack) {
@@ -620,7 +618,7 @@ static void rxrpc_input_data(struct rxrpc_call *call, struct sk_buff *skb)
 
 unlock:
 	spin_unlock(&call->input_lock);
-	rxrpc_free_skb(skb, rxrpc_skb_freed);
+	rxrpc_unpin_skb(skb, rxrpc_skb_unpin);
 	_leave(" [queued]");
 }
 
diff --git a/net/rxrpc/recvmsg.c b/net/rxrpc/recvmsg.c
index 3b0becb12041..82bb48d96526 100644
--- a/net/rxrpc/recvmsg.c
+++ b/net/rxrpc/recvmsg.c
@@ -205,7 +205,7 @@ static void rxrpc_rotate_rx_window(struct rxrpc_call *call)
 	/* Barrier against rxrpc_input_data(). */
 	smp_store_release(&call->rx_hard_ack, hard_ack);
 
-	rxrpc_free_skb(skb, rxrpc_skb_freed);
+	rxrpc_unpin_skb(skb, rxrpc_skb_unpin);
 
 	trace_rxrpc_receive(call, rxrpc_receive_rotate, serial, hard_ack);
 	if (last) {
diff --git a/net/rxrpc/sendmsg.c b/net/rxrpc/sendmsg.c
index 6a1547b270fe..ba0e2aa268b1 100644
--- a/net/rxrpc/sendmsg.c
+++ b/net/rxrpc/sendmsg.c
@@ -175,6 +175,7 @@ static int rxrpc_queue_packet(struct rxrpc_sock *rx, struct rxrpc_call *call,
 	 */
 	skb->tstamp = ktime_get_real();
 
+	atomic_set(&sp->nr_ring_pins, 1);
 	ix = seq & RXRPC_RXTX_BUFF_MASK;
 	rxrpc_get_skb(skb, rxrpc_skb_got);
 	call->rxtx_annotations[ix] = annotation;


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
