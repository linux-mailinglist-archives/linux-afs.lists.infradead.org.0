Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 950E61F88A
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 18:26:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1xzW63BwhH1pGsQPtOfRFOhlR3ULEfQ5MV+YO/FZQKQ=; b=B1BmYnh9PX6riq
	8cnPPIyHSLrhKU9+DAkcGmh5bhmIBmaCmfWfKOLt07qdBYz1+aNJZ99v3oESjL41G+d0iUjsTS4J7
	5sa/T+3pAWpqQmZT/nG9MmVY3yF+XBYJw5viX5AeIrFce6EeD2ZTlUv+3hdGNLFUsDn9j7t4KnNHG
	fHDXO3bodLlP2Nx7SAGXN6/pECoWYgNkMnJKhCVTaWeVWW0IkVoUIBfEkSkGZhi4zbc5t7YcTRKKB
	MobG4834FwqMqCpo5zmC1Z7xrbiG9y293kVPMVs3oUX50r7Ul+yEKI/ZTS6fjLzOS/5Na9FgMxq1K
	9QyA09J/I0BT2XfuIKug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQwjw-0001kj-04; Wed, 15 May 2019 16:26:48 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQwjt-0001jy-EH
 for linux-afs@lists.infradead.org; Wed, 15 May 2019 16:26:46 +0000
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 347F03082162;
 Wed, 15 May 2019 16:26:45 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C79D5D73F;
 Wed, 15 May 2019 16:26:43 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 09/15] rxrpc: Allow the kernel to mark a call as being
 non-interruptible
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 15 May 2019 17:26:42 +0100
Message-ID: <155793760271.31671.13683321275878281873.stgit@warthog.procyon.org.uk>
In-Reply-To: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
References: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Wed, 15 May 2019 16:26:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_092645_522260_81D916D2 
X-CRM114-Status: GOOD (  23.88  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-BeenThere: linux-afs@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Cc: dhowells@redhat.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Allow kernel services using AF_RXRPC to indicate that a call should be
non-interruptible.  This allows kafs to make things like lock-extension and
writeback data storage calls non-interruptible.

If this is set, signals will be ignored for operations on that call where
possible - such as waiting to get a call channel on an rxrpc connection.

It doesn't prevent UDP sendmsg from being interrupted, but that will be
handled by packet retransmission.

rxrpc_kernel_recv_data() isn't affected by this since that never waits,
preferring instead to return -EAGAIN and leave the waiting to the caller.

Userspace initiated calls can't be set to be uninterruptible at this time.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 Documentation/networking/rxrpc.txt |   11 ++++++++++-
 fs/afs/rxrpc.c                     |    1 +
 include/net/af_rxrpc.h             |    1 +
 net/rxrpc/af_rxrpc.c               |    3 +++
 net/rxrpc/ar-internal.h            |    2 ++
 net/rxrpc/call_object.c            |    2 ++
 net/rxrpc/conn_client.c            |    8 ++++++--
 net/rxrpc/sendmsg.c                |    4 +++-
 8 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/Documentation/networking/rxrpc.txt b/Documentation/networking/rxrpc.txt
index cd7303d7fa25..2e059e832034 100644
--- a/Documentation/networking/rxrpc.txt
+++ b/Documentation/networking/rxrpc.txt
@@ -796,7 +796,9 @@ The kernel interface functions are as follows:
 				s64 tx_total_len,
 				gfp_t gfp,
 				rxrpc_notify_rx_t notify_rx,
-				bool upgrade);
+				bool upgrade,
+				bool intr,
+				unsigned int debug_id);
 
      This allocates the infrastructure to make a new RxRPC call and assigns
      call and connection numbers.  The call will be made on the UDP port that
@@ -824,6 +826,13 @@ The kernel interface functions are as follows:
      the server upgrade the service to a better one.  The resultant service ID
      is returned by rxrpc_kernel_recv_data().
 
+     intr should be set to true if the call should be interruptible.  If this
+     is not set, this function may not return until a channel has been
+     allocated; if it is set, the function may return -ERESTARTSYS.
+
+     debug_id is the call debugging ID to be used for tracing.  This can be
+     obtained by atomically incrementing rxrpc_debug_id.
+
      If this function is successful, an opaque reference to the RxRPC call is
      returned.  The caller now holds a reference on this and it must be
      properly ended.
diff --git a/fs/afs/rxrpc.c b/fs/afs/rxrpc.c
index a34a89c75c6a..47cb5e6ef9bd 100644
--- a/fs/afs/rxrpc.c
+++ b/fs/afs/rxrpc.c
@@ -417,6 +417,7 @@ void afs_make_call(struct afs_addr_cursor *ac, struct afs_call *call, gfp_t gfp)
 					  afs_wake_up_async_call :
 					  afs_wake_up_call_waiter),
 					 call->upgrade,
+					 true,
 					 call->debug_id);
 	if (IS_ERR(rxcall)) {
 		ret = PTR_ERR(rxcall);
diff --git a/include/net/af_rxrpc.h b/include/net/af_rxrpc.h
index 78c856cba4f5..e4d322c7dee6 100644
--- a/include/net/af_rxrpc.h
+++ b/include/net/af_rxrpc.h
@@ -45,6 +45,7 @@ struct rxrpc_call *rxrpc_kernel_begin_call(struct socket *,
 					   gfp_t,
 					   rxrpc_notify_rx_t,
 					   bool,
+					   bool,
 					   unsigned int);
 int rxrpc_kernel_send_data(struct socket *, struct rxrpc_call *,
 			   struct msghdr *, size_t,
diff --git a/net/rxrpc/af_rxrpc.c b/net/rxrpc/af_rxrpc.c
index ae8c5d7f3bf1..22760f4b5d17 100644
--- a/net/rxrpc/af_rxrpc.c
+++ b/net/rxrpc/af_rxrpc.c
@@ -270,6 +270,7 @@ static int rxrpc_listen(struct socket *sock, int backlog)
  * @gfp: The allocation constraints
  * @notify_rx: Where to send notifications instead of socket queue
  * @upgrade: Request service upgrade for call
+ * @intr: The call is interruptible
  * @debug_id: The debug ID for tracing to be assigned to the call
  *
  * Allow a kernel service to begin a call on the nominated socket.  This just
@@ -287,6 +288,7 @@ struct rxrpc_call *rxrpc_kernel_begin_call(struct socket *sock,
 					   gfp_t gfp,
 					   rxrpc_notify_rx_t notify_rx,
 					   bool upgrade,
+					   bool intr,
 					   unsigned int debug_id)
 {
 	struct rxrpc_conn_parameters cp;
@@ -311,6 +313,7 @@ struct rxrpc_call *rxrpc_kernel_begin_call(struct socket *sock,
 	memset(&p, 0, sizeof(p));
 	p.user_call_ID = user_call_ID;
 	p.tx_total_len = tx_total_len;
+	p.intr = intr;
 
 	memset(&cp, 0, sizeof(cp));
 	cp.local		= rx->local;
diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index 062ca9dc29b8..07fc1dfa4878 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -482,6 +482,7 @@ enum rxrpc_call_flag {
 	RXRPC_CALL_BEGAN_RX_TIMER,	/* We began the expect_rx_by timer */
 	RXRPC_CALL_RX_HEARD,		/* The peer responded at least once to this call */
 	RXRPC_CALL_RX_UNDERRUN,		/* Got data underrun */
+	RXRPC_CALL_IS_INTR,		/* The call is interruptible */
 };
 
 /*
@@ -711,6 +712,7 @@ struct rxrpc_call_params {
 		u32		normal;		/* Max time since last call packet (msec) */
 	} timeouts;
 	u8			nr_timeouts;	/* Number of timeouts specified */
+	bool			intr;		/* The call is interruptible */
 };
 
 struct rxrpc_send_params {
diff --git a/net/rxrpc/call_object.c b/net/rxrpc/call_object.c
index fe96881a334d..d0ca98d7aef5 100644
--- a/net/rxrpc/call_object.c
+++ b/net/rxrpc/call_object.c
@@ -241,6 +241,8 @@ struct rxrpc_call *rxrpc_new_client_call(struct rxrpc_sock *rx,
 		return call;
 	}
 
+	if (p->intr)
+		__set_bit(RXRPC_CALL_IS_INTR, &call->flags);
 	call->tx_total_len = p->tx_total_len;
 	trace_rxrpc_call(call, rxrpc_call_new_client, atomic_read(&call->usage),
 			 here, (const void *)p->user_call_ID);
diff --git a/net/rxrpc/conn_client.c b/net/rxrpc/conn_client.c
index 83797b3949e2..5cf5595a14d8 100644
--- a/net/rxrpc/conn_client.c
+++ b/net/rxrpc/conn_client.c
@@ -656,10 +656,14 @@ static int rxrpc_wait_for_channel(struct rxrpc_call *call, gfp_t gfp)
 
 		add_wait_queue_exclusive(&call->waitq, &myself);
 		for (;;) {
-			set_current_state(TASK_INTERRUPTIBLE);
+			if (test_bit(RXRPC_CALL_IS_INTR, &call->flags))
+				set_current_state(TASK_INTERRUPTIBLE);
+			else
+				set_current_state(TASK_UNINTERRUPTIBLE);
 			if (call->call_id)
 				break;
-			if (signal_pending(current)) {
+			if (test_bit(RXRPC_CALL_IS_INTR, &call->flags) &&
+			    signal_pending(current)) {
 				ret = -ERESTARTSYS;
 				break;
 			}
diff --git a/net/rxrpc/sendmsg.c b/net/rxrpc/sendmsg.c
index bec64deb7b0a..45a05d9a27fa 100644
--- a/net/rxrpc/sendmsg.c
+++ b/net/rxrpc/sendmsg.c
@@ -80,7 +80,8 @@ static int rxrpc_wait_for_tx_window_nonintr(struct rxrpc_sock *rx,
 		if (call->state >= RXRPC_CALL_COMPLETE)
 			return call->error;
 
-		if (timeout == 0 &&
+		if (test_bit(RXRPC_CALL_IS_INTR, &call->flags) &&
+		    timeout == 0 &&
 		    tx_win == tx_start && signal_pending(current))
 			return -EINTR;
 
@@ -620,6 +621,7 @@ int rxrpc_do_sendmsg(struct rxrpc_sock *rx, struct msghdr *msg, size_t len)
 		.call.tx_total_len	= -1,
 		.call.user_call_ID	= 0,
 		.call.nr_timeouts	= 0,
+		.call.intr		= true,
 		.abort_code		= 0,
 		.command		= RXRPC_CMD_SEND_DATA,
 		.exclusive		= false,


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
