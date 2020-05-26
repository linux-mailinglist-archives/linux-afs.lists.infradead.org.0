Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A256E1D13C5
	for <lists+linux-afs@lfdr.de>; Wed, 13 May 2020 15:01:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVi0I6Hbc+x+kAAHWO6VTCQVlSoCz2oIHIfpu7FDbYI=; b=VIARrCFm00C1XA
	/wHEIyg+PjMHA+5Ucn1TioilApHiwMdfg/LrPM1I1vmAxE1osZmpSvdSR3PbFzQlY3csJeALnjFP4
	Yhv+UGXBuP7umesEU6bcsmjYzHSS4S9ck9Z21O8uym9f5qUV8LloHpg+phJWvafHa38Q9ghfub5aC
	Q/qo0KfDXVEZssrin5aWQqn4xqjI3ITP8A3aalrNDDK4xKc6onhaLHpmxrTx4kYlgXiSjq2FKLrZF
	yeS7oJSMiz5QL8jw8CsLyD22Q0KF16s2ACYHf1/VkWt2fb+GbkzmGQYFoRC9qtDlOIYGzQ0zoXFJg
	ful7S+pboLdadHK/5WaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYr0M-00082b-Vf; Wed, 13 May 2020 13:00:59 +0000
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYkrR-0004D8-Jl; Wed, 13 May 2020 06:27:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 10/33] tcp: add tcp_sock_set_cork
Date: Wed, 13 May 2020 08:26:25 +0200
Message-Id: <20200513062649.2100053-11-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513062649.2100053-1-hch@lst.de>
References: <20200513062649.2100053-1-hch@lst.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 May 2020 05:59:44 -0700
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
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Eric Dumazet <edumazet@google.com>, linux-nvme@lists.infradead.org,
 linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-afs@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, cluster-devel@redhat.com,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, linux-block@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 Neil Horman <nhorman@tuxdriver.com>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org,
 Vlad Yasevich <vyasevich@gmail.com>, linux-kernel@vger.kernel.org,
 Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Add a helper to directly set the TCP_CORK sockopt from kernel space
without going through a fake uaccess.  Cleanup the callers to avoid
pointless wrappers now that this is a simple function call.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_int.h      | 14 --------
 drivers/block/drbd/drbd_receiver.c |  4 +--
 drivers/block/drbd/drbd_worker.c   |  6 ++--
 fs/cifs/transport.c                |  8 ++---
 include/linux/tcp.h                |  2 ++
 net/ipv4/tcp.c                     | 51 +++++++++++++++++++-----------
 net/rds/tcp_send.c                 |  9 ++----
 7 files changed, 43 insertions(+), 51 deletions(-)

diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index aae99a2d7bd40..3550adc93c68b 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -1570,20 +1570,6 @@ extern void drbd_set_recv_tcq(struct drbd_device *device, int tcq_enabled);
 extern void _drbd_clear_done_ee(struct drbd_device *device, struct list_head *to_be_freed);
 extern int drbd_connected(struct drbd_peer_device *);
 
-static inline void drbd_tcp_cork(struct socket *sock)
-{
-	int val = 1;
-	(void) kernel_setsockopt(sock, SOL_TCP, TCP_CORK,
-			(char*)&val, sizeof(val));
-}
-
-static inline void drbd_tcp_uncork(struct socket *sock)
-{
-	int val = 0;
-	(void) kernel_setsockopt(sock, SOL_TCP, TCP_CORK,
-			(char*)&val, sizeof(val));
-}
-
 static inline void drbd_tcp_nodelay(struct socket *sock)
 {
 	int val = 1;
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index c15e7083b13a6..55ea907ad33cb 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -6162,7 +6162,7 @@ void drbd_send_acks_wf(struct work_struct *ws)
 	rcu_read_unlock();
 
 	if (tcp_cork)
-		drbd_tcp_cork(connection->meta.socket);
+		tcp_sock_set_cork(connection->meta.socket->sk, true);
 
 	err = drbd_finish_peer_reqs(device);
 	kref_put(&device->kref, drbd_destroy_device);
@@ -6175,7 +6175,7 @@ void drbd_send_acks_wf(struct work_struct *ws)
 	}
 
 	if (tcp_cork)
-		drbd_tcp_uncork(connection->meta.socket);
+		tcp_sock_set_cork(connection->meta.socket->sk, false);
 
 	return;
 }
diff --git a/drivers/block/drbd/drbd_worker.c b/drivers/block/drbd/drbd_worker.c
index 0dc019da1f8d0..2b89c9f2ca707 100644
--- a/drivers/block/drbd/drbd_worker.c
+++ b/drivers/block/drbd/drbd_worker.c
@@ -2098,7 +2098,7 @@ static void wait_for_work(struct drbd_connection *connection, struct list_head *
 	if (uncork) {
 		mutex_lock(&connection->data.mutex);
 		if (connection->data.socket)
-			drbd_tcp_uncork(connection->data.socket);
+			tcp_sock_set_cork(connection->data.socket->sk, false);
 		mutex_unlock(&connection->data.mutex);
 	}
 
@@ -2153,9 +2153,9 @@ static void wait_for_work(struct drbd_connection *connection, struct list_head *
 	mutex_lock(&connection->data.mutex);
 	if (connection->data.socket) {
 		if (cork)
-			drbd_tcp_cork(connection->data.socket);
+			tcp_sock_set_cork(connection->data.socket->sk, true);
 		else if (!uncork)
-			drbd_tcp_uncork(connection->data.socket);
+			tcp_sock_set_cork(connection->data.socket->sk, false);
 	}
 	mutex_unlock(&connection->data.mutex);
 }
diff --git a/fs/cifs/transport.c b/fs/cifs/transport.c
index c97570eb2c180..99760063e0006 100644
--- a/fs/cifs/transport.c
+++ b/fs/cifs/transport.c
@@ -325,7 +325,6 @@ __smb_send_rqst(struct TCP_Server_Info *server, int num_rqst,
 	size_t total_len = 0, sent, size;
 	struct socket *ssocket = server->ssocket;
 	struct msghdr smb_msg;
-	int val = 1;
 	__be32 rfc1002_marker;
 
 	if (cifs_rdma_enabled(server)) {
@@ -345,8 +344,7 @@ __smb_send_rqst(struct TCP_Server_Info *server, int num_rqst,
 	}
 
 	/* cork the socket */
-	kernel_setsockopt(ssocket, SOL_TCP, TCP_CORK,
-				(char *)&val, sizeof(val));
+	tcp_sock_set_cork(ssocket->sk, true);
 
 	for (j = 0; j < num_rqst; j++)
 		send_length += smb_rqst_len(server, &rqst[j]);
@@ -435,9 +433,7 @@ __smb_send_rqst(struct TCP_Server_Info *server, int num_rqst,
 	}
 
 	/* uncork it */
-	val = 0;
-	kernel_setsockopt(ssocket, SOL_TCP, TCP_CORK,
-				(char *)&val, sizeof(val));
+	tcp_sock_set_cork(ssocket->sk, false);
 
 	if ((total_len > 0) && (total_len != send_length)) {
 		cifs_dbg(FYI, "partial send (wanted=%u sent=%zu): terminating session\n",
diff --git a/include/linux/tcp.h b/include/linux/tcp.h
index e60db06ec28d7..7ef0f975a7658 100644
--- a/include/linux/tcp.h
+++ b/include/linux/tcp.h
@@ -494,4 +494,6 @@ static inline u16 tcp_mss_clamp(const struct tcp_sock *tp, u16 mss)
 int tcp_skb_shift(struct sk_buff *to, struct sk_buff *from, int pcount,
 		  int shiftlen);
 
+void tcp_sock_set_cork(struct sock *sk, bool on);
+
 #endif	/* _LINUX_TCP_H */
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 8c1250103959a..e11ba10b90d4c 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2790,6 +2790,37 @@ static void tcp_enable_tx_delay(void)
 	}
 }
 
+/* When set indicates to always queue non-full frames.  Later the user clears
+ * this option and we transmit any pending partial frames in the queue.  This is
+ * meant to be used alongside sendfile() to get properly filled frames when the
+ * user (for example) must write out headers with a write() call first and then
+ * use sendfile to send out the data parts.
+ *
+ * TCP_CORK can be set together with TCP_NODELAY and it is stronger than
+ * TCP_NODELAY.
+ */
+static void __tcp_sock_set_cork(struct sock *sk, bool on)
+{
+	struct tcp_sock *tp = tcp_sk(sk);
+
+	if (on) {
+		tp->nonagle |= TCP_NAGLE_CORK;
+	} else {
+		tp->nonagle &= ~TCP_NAGLE_CORK;
+		if (tp->nonagle & TCP_NAGLE_OFF)
+			tp->nonagle |= TCP_NAGLE_PUSH;
+		tcp_push_pending_frames(sk);
+	}
+}
+
+void tcp_sock_set_cork(struct sock *sk, bool on)
+{
+	lock_sock(sk);
+	__tcp_sock_set_cork(sk, on);
+	release_sock(sk);
+}
+EXPORT_SYMBOL(tcp_sock_set_cork);
+
 /*
  *	Socket option code for TCP.
  */
@@ -2968,25 +2999,7 @@ static int do_tcp_setsockopt(struct sock *sk, int level,
 		break;
 
 	case TCP_CORK:
-		/* When set indicates to always queue non-full frames.
-		 * Later the user clears this option and we transmit
-		 * any pending partial frames in the queue.  This is
-		 * meant to be used alongside sendfile() to get properly
-		 * filled frames when the user (for example) must write
-		 * out headers with a write() call first and then use
-		 * sendfile to send out the data parts.
-		 *
-		 * TCP_CORK can be set together with TCP_NODELAY and it is
-		 * stronger than TCP_NODELAY.
-		 */
-		if (val) {
-			tp->nonagle |= TCP_NAGLE_CORK;
-		} else {
-			tp->nonagle &= ~TCP_NAGLE_CORK;
-			if (tp->nonagle&TCP_NAGLE_OFF)
-				tp->nonagle |= TCP_NAGLE_PUSH;
-			tcp_push_pending_frames(sk);
-		}
+		__tcp_sock_set_cork(sk, val);
 		break;
 
 	case TCP_KEEPIDLE:
diff --git a/net/rds/tcp_send.c b/net/rds/tcp_send.c
index 78a2554a44979..8c4d1d6e9249d 100644
--- a/net/rds/tcp_send.c
+++ b/net/rds/tcp_send.c
@@ -38,23 +38,18 @@
 #include "rds.h"
 #include "tcp.h"
 
-static void rds_tcp_cork(struct socket *sock, int val)
-{
-	kernel_setsockopt(sock, SOL_TCP, TCP_CORK, (void *)&val, sizeof(val));
-}
-
 void rds_tcp_xmit_path_prepare(struct rds_conn_path *cp)
 {
 	struct rds_tcp_connection *tc = cp->cp_transport_data;
 
-	rds_tcp_cork(tc->t_sock, 1);
+	tcp_sock_set_cork(tc->t_sock->sk, true);
 }
 
 void rds_tcp_xmit_path_complete(struct rds_conn_path *cp)
 {
 	struct rds_tcp_connection *tc = cp->cp_transport_data;
 
-	rds_tcp_cork(tc->t_sock, 0);
+	tcp_sock_set_cork(tc->t_sock->sk, false);
 }
 
 /* the core send_sem serializes this with other xmit and shutdown */
-- 
2.26.2


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
