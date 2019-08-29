Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id AF122A1AE7
	for <lists+linux-afs@lfdr.de>; Thu, 29 Aug 2019 15:08:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iw5lGbKZR+89c7iJaZRXcEe1yiUWBDNVFojRlYRqcho=; b=dbGrKKH8heNzy5
	WdH654C0nNpKK5K5uT14KG73BnI7NQ/9G95weC8drorN1vbPldhzdiznggnHkKwxac5AlhvjA6DDw
	BnOoBl/UQoaX2G7jh0BEcGBuctLexj9J5e/Z1f+qjwfQwe5Atk8HBrXD+KE63t9XO8UrjJSMGy7k5
	mMNIxz88IsvBwYz68iDOHFLw68nFiG1HFRtCYqXc4Br84ELjhHap6jlmdNFpvrvfgZvNN1OJa1DU0
	SKQoqQgJvW+dtXxLmePBuU9b3F10K95KDXp2OaajASygrLUafozq/HEHYkjpkSkr0rIeDOSZmC+3s
	7aqxWkQkzjkcsxHhLp3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3K9l-0001BL-MT; Thu, 29 Aug 2019 13:08:05 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3K9j-0001Ap-06
 for linux-afs@lists.infradead.org; Thu, 29 Aug 2019 13:08:04 +0000
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C21BB7F746;
 Thu, 29 Aug 2019 13:08:02 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6A335C21E;
 Thu, 29 Aug 2019 13:08:01 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 4/7] rxrpc: Abstract out rxtx ring cleanup
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 29 Aug 2019 14:08:01 +0100
Message-ID: <156708408120.26102.7710356156597753765.stgit@warthog.procyon.org.uk>
In-Reply-To: <156708405310.26102.7954021163316252673.stgit@warthog.procyon.org.uk>
References: <156708405310.26102.7954021163316252673.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Thu, 29 Aug 2019 13:08:02 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_060803_055965_EE3C8327 
X-CRM114-Status: GOOD (  15.27  )
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

Abstract out rxtx ring cleanup into its own function from its two callers.
This makes it easier to apply the same changes to both.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 net/rxrpc/call_object.c |   33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/net/rxrpc/call_object.c b/net/rxrpc/call_object.c
index 217b12be9e08..c9ab2da957fe 100644
--- a/net/rxrpc/call_object.c
+++ b/net/rxrpc/call_object.c
@@ -421,6 +421,21 @@ void rxrpc_get_call(struct rxrpc_call *call, enum rxrpc_call_trace op)
 	trace_rxrpc_call(call, op, n, here, NULL);
 }
 
+/*
+ * Clean up the RxTx skb ring.
+ */
+static void rxrpc_cleanup_ring(struct rxrpc_call *call)
+{
+	int i;
+
+	for (i = 0; i < RXRPC_RXTX_BUFF_SIZE; i++) {
+		rxrpc_free_skb(call->rxtx_buffer[i],
+			       (call->tx_phase ? rxrpc_skb_tx_cleaned :
+				rxrpc_skb_rx_cleaned));
+		call->rxtx_buffer[i] = NULL;
+	}
+}
+
 /*
  * Detach a call from its owning socket.
  */
@@ -429,7 +444,6 @@ void rxrpc_release_call(struct rxrpc_sock *rx, struct rxrpc_call *call)
 	const void *here = __builtin_return_address(0);
 	struct rxrpc_connection *conn = call->conn;
 	bool put = false;
-	int i;
 
 	_enter("{%d,%d}", call->debug_id, atomic_read(&call->usage));
 
@@ -479,13 +493,7 @@ void rxrpc_release_call(struct rxrpc_sock *rx, struct rxrpc_call *call)
 	if (conn)
 		rxrpc_disconnect_call(call);
 
-	for (i = 0; i < RXRPC_RXTX_BUFF_SIZE; i++) {
-		rxrpc_free_skb(call->rxtx_buffer[i],
-			       (call->tx_phase ? rxrpc_skb_tx_cleaned :
-				rxrpc_skb_rx_cleaned));
-		call->rxtx_buffer[i] = NULL;
-	}
-
+	rxrpc_cleanup_ring(call);
 	_leave("");
 }
 
@@ -568,8 +576,6 @@ static void rxrpc_rcu_destroy_call(struct rcu_head *rcu)
  */
 void rxrpc_cleanup_call(struct rxrpc_call *call)
 {
-	int i;
-
 	_net("DESTROY CALL %d", call->debug_id);
 
 	memset(&call->sock_node, 0xcd, sizeof(call->sock_node));
@@ -580,12 +586,7 @@ void rxrpc_cleanup_call(struct rxrpc_call *call)
 	ASSERT(test_bit(RXRPC_CALL_RELEASED, &call->flags));
 	ASSERTCMP(call->conn, ==, NULL);
 
-	/* Clean up the Rx/Tx buffer */
-	for (i = 0; i < RXRPC_RXTX_BUFF_SIZE; i++)
-		rxrpc_free_skb(call->rxtx_buffer[i],
-			       (call->tx_phase ? rxrpc_skb_tx_cleaned :
-				rxrpc_skb_rx_cleaned));
-
+	rxrpc_cleanup_ring(call);
 	rxrpc_free_skb(call->tx_pending, rxrpc_skb_tx_cleaned);
 
 	call_rcu(&call->rcu, rxrpc_rcu_destroy_call);


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
