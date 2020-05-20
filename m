Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4401DC23F
	for <lists+linux-afs@lfdr.de>; Thu, 21 May 2020 00:38:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HHzQNvI9kX++NR4arwpS4NfMWTXUXIK2HLmggkasEVk=; b=hrDjg4GB9wIZ6V
	YjimyLlimKgJVN24VCb8zL4JYEZiC+LpSx3SL6getmDxwTcrNo9620Iwu6AooVjSlJqkM+aY/zAWU
	39mZ9hOiRKqMULHKT95+QhiuyZW/xI1nTrGP8VxJZNC3aOjvTkdq5IvFfqh3b3XjLuZUAn2zO03yC
	WzUV/mMybaHMAe7l5Qm7OEXwL/QTCHbVfF0rrVVYwv5O8uK8RstYBOwh56lyXIExgfz1h3dfl6Ty0
	ExvGRuuF8E6deXUSdvOGvp4C7GV8n9+5B/R3/7ZELH1AapQi7p6xxW96emW/G6FaW6RtytDblT7fQ
	xw7l0vnDaV2cByiY0xzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbXM1-0000Jk-OP; Wed, 20 May 2020 22:38:25 +0000
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbUp6-00036I-Rj; Wed, 20 May 2020 19:56:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 23/33] ipv4: add ip_sock_set_mtu_discover
Date: Wed, 20 May 2020 21:54:59 +0200
Message-Id: <20200520195509.2215098-24-hch@lst.de>
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
 David Howells <dhowells@redhat.com>, linux-sctp@vger.kernel.org,
 target-devel@vger.kernel.org, linux-afs@lists.infradead.org,
 drbd-dev@lists.linbit.com, linux-cifs@vger.kernel.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, cluster-devel@redhat.com,
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

Add a helper to directly set the IP_MTU_DISCOVER sockopt from kernel
space without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: David Howells <dhowells@redhat.com> [rxrpc bits]
---
 include/net/ip.h         |  1 +
 net/ipv4/ip_sockglue.c   | 11 +++++++++++
 net/rxrpc/local_object.c |  8 +-------
 net/rxrpc/output.c       | 14 +++++---------
 4 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/include/net/ip.h b/include/net/ip.h
index f063a491b9063..d3649c49dd333 100644
--- a/include/net/ip.h
+++ b/include/net/ip.h
@@ -766,6 +766,7 @@ static inline bool inetdev_valid_mtu(unsigned int mtu)
 }
 
 void ip_sock_set_freebind(struct sock *sk);
+int ip_sock_set_mtu_discover(struct sock *sk, int val);
 void ip_sock_set_recverr(struct sock *sk);
 void ip_sock_set_tos(struct sock *sk, int val);
 
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index 9a6a65b66f9d3..a3c46ec95a756 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -597,6 +597,17 @@ void ip_sock_set_recverr(struct sock *sk)
 }
 EXPORT_SYMBOL(ip_sock_set_recverr);
 
+int ip_sock_set_mtu_discover(struct sock *sk, int val)
+{
+	if (val < IP_PMTUDISC_DONT || val > IP_PMTUDISC_OMIT)
+		return -EINVAL;
+	lock_sock(sk);
+	inet_sk(sk)->pmtudisc = val;
+	release_sock(sk);
+	return 0;
+}
+EXPORT_SYMBOL(ip_sock_set_mtu_discover);
+
 /*
  *	Socket option code for IP. This is the end of the line after any
  *	TCP,UDP etc options on an IP socket.
diff --git a/net/rxrpc/local_object.c b/net/rxrpc/local_object.c
index 4c0e8fe5ec1fb..6f4e6b4817cf2 100644
--- a/net/rxrpc/local_object.c
+++ b/net/rxrpc/local_object.c
@@ -174,13 +174,7 @@ static int rxrpc_open_socket(struct rxrpc_local *local, struct net *net)
 		ip_sock_set_recverr(local->socket->sk);
 
 		/* we want to set the don't fragment bit */
-		opt = IP_PMTUDISC_DO;
-		ret = kernel_setsockopt(local->socket, SOL_IP, IP_MTU_DISCOVER,
-					(char *) &opt, sizeof(opt));
-		if (ret < 0) {
-			_debug("setsockopt failed");
-			goto error;
-		}
+		ip_sock_set_mtu_discover(local->socket->sk, IP_PMTUDISC_DO);
 
 		/* We want receive timestamps. */
 		sock_enable_timestamps(local->socket->sk);
diff --git a/net/rxrpc/output.c b/net/rxrpc/output.c
index 90e263c6aa69e..ad0234e1e1713 100644
--- a/net/rxrpc/output.c
+++ b/net/rxrpc/output.c
@@ -321,7 +321,7 @@ int rxrpc_send_data_packet(struct rxrpc_call *call, struct sk_buff *skb,
 	struct kvec iov[2];
 	rxrpc_serial_t serial;
 	size_t len;
-	int ret, opt;
+	int ret;
 
 	_enter(",{%d}", skb->len);
 
@@ -476,18 +476,14 @@ int rxrpc_send_data_packet(struct rxrpc_call *call, struct sk_buff *skb,
 	switch (conn->params.local->srx.transport.family) {
 	case AF_INET6:
 	case AF_INET:
-		opt = IP_PMTUDISC_DONT;
-		kernel_setsockopt(conn->params.local->socket,
-				  SOL_IP, IP_MTU_DISCOVER,
-				  (char *)&opt, sizeof(opt));
+		ip_sock_set_mtu_discover(conn->params.local->socket->sk,
+				IP_PMTUDISC_DONT);
 		ret = kernel_sendmsg(conn->params.local->socket, &msg,
 				     iov, 2, len);
 		conn->params.peer->last_tx_at = ktime_get_seconds();
 
-		opt = IP_PMTUDISC_DO;
-		kernel_setsockopt(conn->params.local->socket,
-				  SOL_IP, IP_MTU_DISCOVER,
-				  (char *)&opt, sizeof(opt));
+		ip_sock_set_mtu_discover(conn->params.local->socket->sk,
+				IP_PMTUDISC_DO);
 		break;
 
 	default:
-- 
2.26.2


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
