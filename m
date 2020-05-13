Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BF61D13CF
	for <lists+linux-afs@lfdr.de>; Wed, 13 May 2020 15:01:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ys4cQlf7dXyo37rh75REYQTBQgGp7B3j73xOfHyU/wE=; b=mixsjN+2ilCJf7
	QBdCx8PdL+FCX+pODWa93Oqm6j7+Lhm32wFZi8lIWLp0PazIqNy3q8SKOcx6wwsoD98vP4bVShYUu
	oAFJFY7qG5q7SutjEHpqtfY28RCxoKNugEw+rArIjcV2zh1Jn1AcPT1yesDGdVy8+Ou+OHnHV0dhL
	BUZVEvpBFagAV5BFRKkat/NFbkWvAFne0sea2N5WILml9pJsWW29tLHwVIYQoSZ4e45HdaoXoE8J+
	3JU4ygJv1TbfMdv86DSbiu21lR3aRHUP8GoOPT+mVbVhG94qbEaGEw3Lif722QbWNYIQJCrpDWivi
	JRwxJDxOoTeab29DrFiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYr0X-0008Ft-Gb; Wed, 13 May 2020 13:01:09 +0000
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYkro-0004YK-Ju; Wed, 13 May 2020 06:27:45 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 18/33] ipv4: add ip_sock_set_tos
Date: Wed, 13 May 2020 08:26:33 +0200
Message-Id: <20200513062649.2100053-19-hch@lst.de>
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

Add a helper to directly set the IP_TOS sockopt from kernel space without
going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/tcp.c   | 14 +++-----------
 drivers/nvme/target/tcp.c | 10 ++--------
 include/net/ip.h          |  2 ++
 net/ipv4/ip_sockglue.c    | 30 +++++++++++++++++++++---------
 4 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 8417eeb83fcd2..6c069e982989e 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1313,7 +1313,7 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl,
 {
 	struct nvme_tcp_ctrl *ctrl = to_tcp_ctrl(nctrl);
 	struct nvme_tcp_queue *queue = &ctrl->queues[qid];
-	int ret, opt, rcv_pdu_size;
+	int ret, rcv_pdu_size;
 
 	queue->ctrl = ctrl;
 	INIT_LIST_HEAD(&queue->send_list);
@@ -1352,16 +1352,8 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl,
 		sock_set_priority(queue->sock->sk, so_priority);
 
 	/* Set socket type of service */
-	if (nctrl->opts->tos >= 0) {
-		opt = nctrl->opts->tos;
-		ret = kernel_setsockopt(queue->sock, SOL_IP, IP_TOS,
-				(char *)&opt, sizeof(opt));
-		if (ret) {
-			dev_err(nctrl->device,
-				"failed to set IP_TOS sock opt %d\n", ret);
-			goto err_sock;
-		}
-	}
+	if (nctrl->opts->tos >= 0)
+		ip_sock_set_tos(queue->sock->sk, nctrl->opts->tos);
 
 	queue->sock->sk->sk_allocation = GFP_ATOMIC;
 	nvme_tcp_set_queue_io_cpu(queue);
diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index b2bfa791c5cb2..4296fe3c745bf 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -1452,14 +1452,8 @@ static int nvmet_tcp_set_queue_sock(struct nvmet_tcp_queue *queue)
 		sock_set_priority(sock->sk, so_priority);
 
 	/* Set socket type of service */
-	if (inet->rcv_tos > 0) {
-		int tos = inet->rcv_tos;
-
-		ret = kernel_setsockopt(sock, SOL_IP, IP_TOS,
-				(char *)&tos, sizeof(tos));
-		if (ret)
-			return ret;
-	}
+	if (inet->rcv_tos > 0)
+		ip_sock_set_tos(sock->sk, inet->rcv_tos);
 
 	write_lock_bh(&sock->sk->sk_callback_lock);
 	sock->sk->sk_user_data = queue;
diff --git a/include/net/ip.h b/include/net/ip.h
index 5b317c9f4470a..2fc52e26fa88b 100644
--- a/include/net/ip.h
+++ b/include/net/ip.h
@@ -765,4 +765,6 @@ static inline bool inetdev_valid_mtu(unsigned int mtu)
 	return likely(mtu >= IPV4_MIN_MTU);
 }
 
+void ip_sock_set_tos(struct sock *sk, int val);
+
 #endif	/* _IP_H */
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index 8206047d70b6b..1733ac78c21aa 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -560,6 +560,26 @@ int ip_recv_error(struct sock *sk, struct msghdr *msg, int len, int *addr_len)
 	return err;
 }
 
+static void __ip_sock_set_tos(struct sock *sk, int val)
+{
+	if (sk->sk_type == SOCK_STREAM) {
+		val &= ~INET_ECN_MASK;
+		val |= inet_sk(sk)->tos & INET_ECN_MASK;
+	}
+	if (inet_sk(sk)->tos != val) {
+		inet_sk(sk)->tos = val;
+		sk->sk_priority = rt_tos2priority(val);
+		sk_dst_reset(sk);
+	}
+}
+
+void ip_sock_set_tos(struct sock *sk, int val)
+{
+	lock_sock(sk);
+	__ip_sock_set_tos(sk, val);
+	release_sock(sk);
+}
+EXPORT_SYMBOL(ip_sock_set_tos);
 
 /*
  *	Socket option code for IP. This is the end of the line after any
@@ -743,15 +763,7 @@ static int do_ip_setsockopt(struct sock *sk, int level,
 			inet->cmsg_flags &= ~IP_CMSG_RECVFRAGSIZE;
 		break;
 	case IP_TOS:	/* This sets both TOS and Precedence */
-		if (sk->sk_type == SOCK_STREAM) {
-			val &= ~INET_ECN_MASK;
-			val |= inet->tos & INET_ECN_MASK;
-		}
-		if (inet->tos != val) {
-			inet->tos = val;
-			sk->sk_priority = rt_tos2priority(val);
-			sk_dst_reset(sk);
-		}
+		__ip_sock_set_tos(sk, val);
 		break;
 	case IP_TTL:
 		if (optlen < 1)
-- 
2.26.2


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
