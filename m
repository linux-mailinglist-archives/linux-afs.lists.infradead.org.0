Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AAA14ED49
	for <lists+linux-afs@lfdr.de>; Fri, 31 Jan 2020 14:30:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4QFZnW1kemuzVw5RivSLrbtZ9W8RfgztTqj14Ffmkk=; b=q0n7rf7AfIgx5n
	ki7KrKS3lHALG4xbVFiNRMtRClJcW0fekGusxRMeRJ7GR5M2ZKMGV02pKw1gei5ZAZt1O7ededAf9
	McOGbb++HZ26Z6mWtA7v2B959k8DlN0YB/i8dK6Hrwj6JxD993LoA3AeOrqxgpfl8h/B5eGCe5Rdo
	xn3OfGUwkhwhLu8J0JvhMjB7j0QnDCtwYCl6VG3SgkTaiprOdWcITkuWxwQ1R6/0rMys+USq5Zu17
	Ni9owOxBmj8iJruWhY1VazlqxEkZURISylFFrE0X0SQBhm8bY5R5r1jSFDSbx1GELVxuzno/CWk2o
	YcOkKKqRkFnDS/wl0HFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixWMt-0003m4-OH; Fri, 31 Jan 2020 13:29:55 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixWMq-0003kY-9G
 for linux-afs@lists.infradead.org; Fri, 31 Jan 2020 13:29:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580477391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rvNHYAZjYjkV+vkG1tbRc3CJ+s9eRjtdr7RfxMNvBmY=;
 b=iOTVasFpLX9U14pGt8twYvH1GAbp1tjdVOnLmtpRgT3ChBjZam3l96oTy5Vje682Ygw/rY
 D9c1hDSgRz38RVIKdj4GpREhLmABBJkVyBXGh7wR8VCZZKmapylkIEOVh3cnpUSIk9z9gr
 QXIrNh3YUZnSLM7DrmO7nffNATBWCWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-J3wtULvAN3aEPJEfBbi6mQ-1; Fri, 31 Jan 2020 08:29:46 -0500
X-MC-Unique: J3wtULvAN3aEPJEfBbi6mQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96CE5DB61;
 Fri, 31 Jan 2020 13:29:45 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-218.rdu2.redhat.com
 [10.10.120.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1F7387B00;
 Fri, 31 Jan 2020 13:29:44 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 4/4] rxrpc: Fix NULL pointer deref due to call->conn being
 cleared on disconnect
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Fri, 31 Jan 2020 13:29:43 +0000
Message-ID: <158047738381.133127.11667008504250095221.stgit@warthog.procyon.org.uk>
In-Reply-To: <158047735578.133127.17728061182258449164.stgit@warthog.procyon.org.uk>
References: <158047735578.133127.17728061182258449164.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.19
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200131_052952_423055_DFADFCDB 
X-CRM114-Status: GOOD (  18.88  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

When a call is disconnected, the connection pointer from the call is
cleared to make sure it isn't used again and to prevent further attempted
transmission for the call.  Unfortunately, there might be a daemon trying
to use it at the same time to transmit a packet.

Fix this by keeping call->conn set, but setting a flag on the call to
indicate disconnection instead.

Remove also the bits in the transmission functions where the conn pointer is
checked and a ref taken under spinlock as this is now redundant.

Fixes: 8d94aa381dab ("rxrpc: Calls shouldn't hold socket refs")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 net/rxrpc/ar-internal.h |    1 +
 net/rxrpc/call_object.c |    4 ++--
 net/rxrpc/conn_client.c |    3 +--
 net/rxrpc/conn_object.c |    4 ++--
 net/rxrpc/output.c      |   27 +++++++++------------------
 5 files changed, 15 insertions(+), 24 deletions(-)

diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index 94441fee85bc..7d730c438404 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -490,6 +490,7 @@ enum rxrpc_call_flag {
 	RXRPC_CALL_RX_HEARD,		/* The peer responded at least once to this call */
 	RXRPC_CALL_RX_UNDERRUN,		/* Got data underrun */
 	RXRPC_CALL_IS_INTR,		/* The call is interruptible */
+	RXRPC_CALL_DISCONNECTED,	/* The call has been disconnected */
 };
 
 /*
diff --git a/net/rxrpc/call_object.c b/net/rxrpc/call_object.c
index a31c18c09894..dbdbc4f18b5e 100644
--- a/net/rxrpc/call_object.c
+++ b/net/rxrpc/call_object.c
@@ -493,7 +493,7 @@ void rxrpc_release_call(struct rxrpc_sock *rx, struct rxrpc_call *call)
 
 	_debug("RELEASE CALL %p (%d CONN %p)", call, call->debug_id, conn);
 
-	if (conn)
+	if (conn && !test_bit(RXRPC_CALL_DISCONNECTED, &call->flags))
 		rxrpc_disconnect_call(call);
 	if (call->security)
 		call->security->free_call_crypto(call);
@@ -569,6 +569,7 @@ static void rxrpc_rcu_destroy_call(struct rcu_head *rcu)
 	struct rxrpc_call *call = container_of(rcu, struct rxrpc_call, rcu);
 	struct rxrpc_net *rxnet = call->rxnet;
 
+	rxrpc_put_connection(call->conn);
 	rxrpc_put_peer(call->peer);
 	kfree(call->rxtx_buffer);
 	kfree(call->rxtx_annotations);
@@ -590,7 +591,6 @@ void rxrpc_cleanup_call(struct rxrpc_call *call)
 
 	ASSERTCMP(call->state, ==, RXRPC_CALL_COMPLETE);
 	ASSERT(test_bit(RXRPC_CALL_RELEASED, &call->flags));
-	ASSERTCMP(call->conn, ==, NULL);
 
 	rxrpc_cleanup_ring(call);
 	rxrpc_free_skb(call->tx_pending, rxrpc_skb_cleaned);
diff --git a/net/rxrpc/conn_client.c b/net/rxrpc/conn_client.c
index 376370cd9285..ea7d4c21f889 100644
--- a/net/rxrpc/conn_client.c
+++ b/net/rxrpc/conn_client.c
@@ -785,6 +785,7 @@ void rxrpc_disconnect_client_call(struct rxrpc_call *call)
 	u32 cid;
 
 	spin_lock(&conn->channel_lock);
+	set_bit(RXRPC_CALL_DISCONNECTED, &call->flags);
 
 	cid = call->cid;
 	if (cid) {
@@ -792,7 +793,6 @@ void rxrpc_disconnect_client_call(struct rxrpc_call *call)
 		chan = &conn->channels[channel];
 	}
 	trace_rxrpc_client(conn, channel, rxrpc_client_chan_disconnect);
-	call->conn = NULL;
 
 	/* Calls that have never actually been assigned a channel can simply be
 	 * discarded.  If the conn didn't get used either, it will follow
@@ -908,7 +908,6 @@ void rxrpc_disconnect_client_call(struct rxrpc_call *call)
 	spin_unlock(&rxnet->client_conn_cache_lock);
 out_2:
 	spin_unlock(&conn->channel_lock);
-	rxrpc_put_connection(conn);
 	_leave("");
 	return;
 
diff --git a/net/rxrpc/conn_object.c b/net/rxrpc/conn_object.c
index 38d718e90dc6..c0b3154f7a7e 100644
--- a/net/rxrpc/conn_object.c
+++ b/net/rxrpc/conn_object.c
@@ -171,6 +171,8 @@ void __rxrpc_disconnect_call(struct rxrpc_connection *conn,
 
 	_enter("%d,%x", conn->debug_id, call->cid);
 
+	set_bit(RXRPC_CALL_DISCONNECTED, &call->flags);
+
 	if (rcu_access_pointer(chan->call) == call) {
 		/* Save the result of the call so that we can repeat it if necessary
 		 * through the channel, whilst disposing of the actual call record.
@@ -223,9 +225,7 @@ void rxrpc_disconnect_call(struct rxrpc_call *call)
 	__rxrpc_disconnect_call(conn, call);
 	spin_unlock(&conn->channel_lock);
 
-	call->conn = NULL;
 	conn->idle_timestamp = jiffies;
-	rxrpc_put_connection(conn);
 }
 
 /*
diff --git a/net/rxrpc/output.c b/net/rxrpc/output.c
index 935bb60fff56..bad3d2420344 100644
--- a/net/rxrpc/output.c
+++ b/net/rxrpc/output.c
@@ -129,7 +129,7 @@ static size_t rxrpc_fill_out_ack(struct rxrpc_connection *conn,
 int rxrpc_send_ack_packet(struct rxrpc_call *call, bool ping,
 			  rxrpc_serial_t *_serial)
 {
-	struct rxrpc_connection *conn = NULL;
+	struct rxrpc_connection *conn;
 	struct rxrpc_ack_buffer *pkt;
 	struct msghdr msg;
 	struct kvec iov[2];
@@ -139,18 +139,14 @@ int rxrpc_send_ack_packet(struct rxrpc_call *call, bool ping,
 	int ret;
 	u8 reason;
 
-	spin_lock_bh(&call->lock);
-	if (call->conn)
-		conn = rxrpc_get_connection_maybe(call->conn);
-	spin_unlock_bh(&call->lock);
-	if (!conn)
+	if (test_bit(RXRPC_CALL_DISCONNECTED, &call->flags))
 		return -ECONNRESET;
 
 	pkt = kzalloc(sizeof(*pkt), GFP_KERNEL);
-	if (!pkt) {
-		rxrpc_put_connection(conn);
+	if (!pkt)
 		return -ENOMEM;
-	}
+
+	conn = call->conn;
 
 	msg.msg_name	= &call->peer->srx.transport;
 	msg.msg_namelen	= call->peer->srx.transport_len;
@@ -244,7 +240,6 @@ int rxrpc_send_ack_packet(struct rxrpc_call *call, bool ping,
 	}
 
 out:
-	rxrpc_put_connection(conn);
 	kfree(pkt);
 	return ret;
 }
@@ -254,7 +249,7 @@ int rxrpc_send_ack_packet(struct rxrpc_call *call, bool ping,
  */
 int rxrpc_send_abort_packet(struct rxrpc_call *call)
 {
-	struct rxrpc_connection *conn = NULL;
+	struct rxrpc_connection *conn;
 	struct rxrpc_abort_buffer pkt;
 	struct msghdr msg;
 	struct kvec iov[1];
@@ -271,13 +266,11 @@ int rxrpc_send_abort_packet(struct rxrpc_call *call)
 	    test_bit(RXRPC_CALL_TX_LAST, &call->flags))
 		return 0;
 
-	spin_lock_bh(&call->lock);
-	if (call->conn)
-		conn = rxrpc_get_connection_maybe(call->conn);
-	spin_unlock_bh(&call->lock);
-	if (!conn)
+	if (test_bit(RXRPC_CALL_DISCONNECTED, &call->flags))
 		return -ECONNRESET;
 
+	conn = call->conn;
+
 	msg.msg_name	= &call->peer->srx.transport;
 	msg.msg_namelen	= call->peer->srx.transport_len;
 	msg.msg_control	= NULL;
@@ -312,8 +305,6 @@ int rxrpc_send_abort_packet(struct rxrpc_call *call)
 		trace_rxrpc_tx_packet(call->debug_id, &pkt.whdr,
 				      rxrpc_tx_point_call_abort);
 	rxrpc_tx_backoff(call, ret);
-
-	rxrpc_put_connection(conn);
 	return ret;
 }
 



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
