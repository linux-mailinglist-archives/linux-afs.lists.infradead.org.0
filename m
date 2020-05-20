Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4141DC230
	for <lists+linux-afs@lfdr.de>; Thu, 21 May 2020 00:38:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cAHyJi0Yc/Z+hlnWjRHziQ3NDaxAjaq2Plck62n9Szo=; b=H1HlPS/sqTPZ7t
	u2yKHxu/PSHMcCI/IJn4yGCx86g/rI8ZkxwYqq4VJBGgnum1n6+52RZFXCnxD4OaBFhe4KQVhNLDN
	20NUd/naagFVWc+meH6aoZ23lUgZgvVNqqv2wTJW2JUzYJMaWz8bUTVP9DrD9mUfOv7miipnUCVKG
	NlQNjLLQ2MTSYJntApqHTTItasvCPkd5tzB/6VeCAICBboquDp5fP0HspIYNsO/RVjp1PcHMZ0qnS
	LmW075nZB2yoil/v8CqEdITplR39enmhIaRp6e8335V+ZIkfDiCnkeV4/WEpAgt4cBwg/r4WbzP1r
	Z2LzYWYK3dcAIBcGAdSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbXLn-00006V-VA; Wed, 20 May 2020 22:38:11 +0000
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbUog-0002eo-6k; Wed, 20 May 2020 19:55:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 14/33] tcp: add tcp_sock_set_quickack
Date: Wed, 20 May 2020 21:54:50 +0200
Message-Id: <20200520195509.2215098-15-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520195509.2215098-1-hch@lst.de>
References: <20200520195509.2215098-1-hch@lst.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 May 2020 15:38:04 -0700
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
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, Neil Horman <nhorman@tuxdriver.com>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org,
 Vlad Yasevich <vyasevich@gmail.com>, linux-kernel@vger.kernel.org,
 Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Add a helper to directly set the TCP_QUICKACK sockopt from kernel space
without going through a fake uaccess.  Cleanup the callers to avoid
pointless wrappers now that this is a simple function call.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_int.h      |  7 ------
 drivers/block/drbd/drbd_receiver.c |  5 ++--
 include/linux/tcp.h                |  1 +
 net/ipv4/tcp.c                     | 39 ++++++++++++++++++++----------
 4 files changed, 29 insertions(+), 23 deletions(-)

diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index e24bba87c8e02..14345a87c7cc5 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -1570,13 +1570,6 @@ extern void drbd_set_recv_tcq(struct drbd_device *device, int tcq_enabled);
 extern void _drbd_clear_done_ee(struct drbd_device *device, struct list_head *to_be_freed);
 extern int drbd_connected(struct drbd_peer_device *);
 
-static inline void drbd_tcp_quickack(struct socket *sock)
-{
-	int val = 2;
-	(void) kernel_setsockopt(sock, SOL_TCP, TCP_QUICKACK,
-			(char*)&val, sizeof(val));
-}
-
 /* sets the number of 512 byte sectors of our virtual device */
 void drbd_set_my_capacity(struct drbd_device *device, sector_t size);
 
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 20a5e94494acd..3a3f2b6a821f3 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -1223,7 +1223,7 @@ static int drbd_recv_header_maybe_unplug(struct drbd_connection *connection, str
 		 * quickly as possible, and let remote TCP know what we have
 		 * received so far. */
 		if (err == -EAGAIN) {
-			drbd_tcp_quickack(connection->data.socket);
+			tcp_sock_set_quickack(connection->data.socket->sk, 2);
 			drbd_unplug_all_devices(connection);
 		}
 		if (err > 0) {
@@ -4959,8 +4959,7 @@ static int receive_UnplugRemote(struct drbd_connection *connection, struct packe
 {
 	/* Make sure we've acked all the TCP data associated
 	 * with the data requests being unplugged */
-	drbd_tcp_quickack(connection->data.socket);
-
+	tcp_sock_set_quickack(connection->data.socket->sk, 2);
 	return 0;
 }
 
diff --git a/include/linux/tcp.h b/include/linux/tcp.h
index 9e42c7fe50a8b..2eaf8320b9db0 100644
--- a/include/linux/tcp.h
+++ b/include/linux/tcp.h
@@ -499,5 +499,6 @@ int tcp_skb_shift(struct sk_buff *to, struct sk_buff *from, int pcount,
 
 void tcp_sock_set_cork(struct sock *sk, bool on);
 void tcp_sock_set_nodelay(struct sock *sk);
+void tcp_sock_set_quickack(struct sock *sk, int val);
 
 #endif	/* _LINUX_TCP_H */
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index a65f293a19fac..27b5e7a4e2ef9 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2856,6 +2856,31 @@ void tcp_sock_set_nodelay(struct sock *sk)
 }
 EXPORT_SYMBOL(tcp_sock_set_nodelay);
 
+static void __tcp_sock_set_quickack(struct sock *sk, int val)
+{
+	if (!val) {
+		inet_csk_enter_pingpong_mode(sk);
+		return;
+	}
+
+	inet_csk_exit_pingpong_mode(sk);
+	if ((1 << sk->sk_state) & (TCPF_ESTABLISHED | TCPF_CLOSE_WAIT) &&
+	    inet_csk_ack_scheduled(sk)) {
+		inet_csk(sk)->icsk_ack.pending |= ICSK_ACK_PUSHED;
+		tcp_cleanup_rbuf(sk, 1);
+		if (!(val & 1))
+			inet_csk_enter_pingpong_mode(sk);
+	}
+}
+
+void tcp_sock_set_quickack(struct sock *sk, int val)
+{
+	lock_sock(sk);
+	__tcp_sock_set_quickack(sk, val);
+	release_sock(sk);
+}
+EXPORT_SYMBOL(tcp_sock_set_quickack);
+
 /*
  *	Socket option code for TCP.
  */
@@ -3096,19 +3121,7 @@ static int do_tcp_setsockopt(struct sock *sk, int level,
 		break;
 
 	case TCP_QUICKACK:
-		if (!val) {
-			inet_csk_enter_pingpong_mode(sk);
-		} else {
-			inet_csk_exit_pingpong_mode(sk);
-			if ((1 << sk->sk_state) &
-			    (TCPF_ESTABLISHED | TCPF_CLOSE_WAIT) &&
-			    inet_csk_ack_scheduled(sk)) {
-				icsk->icsk_ack.pending |= ICSK_ACK_PUSHED;
-				tcp_cleanup_rbuf(sk, 1);
-				if (!(val & 1))
-					inet_csk_enter_pingpong_mode(sk);
-			}
-		}
+		__tcp_sock_set_quickack(sk, val);
 		break;
 
 #ifdef CONFIG_TCP_MD5SIG
-- 
2.26.2


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
