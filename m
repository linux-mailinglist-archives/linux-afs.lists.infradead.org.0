Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4281DC231
	for <lists+linux-afs@lfdr.de>; Thu, 21 May 2020 00:38:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=szYjJ+DsEeVf3t+bvHZ8AzNDbypuDSBKYwwgrFMop6Q=; b=XApHAZWatJquxj
	d3/rCEKWnPnDnvkqKhwxjs2NCunCD68W4HGqus/0+euPyrBAf4XCLQHkRtItILukm51r/8ck25f2Z
	Wrr52CftldGS1Ex0hMVbB+caHxOLQE5dxKgfJJGhpTpX/aVcaq4bxr7LT3APKLSaEa+7KGqFyX/GI
	mgFbtWD9hlWHmAk5LgQG5p8foUcw0IVOXDUvyqd5GOxfvPBjJPqh9t5qOO8TxylTW3PO1rybczX98
	zbExi4JJLItHNDfr9KqmhWliNsMDW+XDC2wX3PLohWGjpR1wI3UyVlv/9fL7VmbLel55yDWdiejFp
	OgRgfHT6i9b5TCXq7xjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbXLs-0000B8-FC; Wed, 20 May 2020 22:38:16 +0000
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbUor-0002sW-0Y; Wed, 20 May 2020 19:56:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 18/33] tcp: add tcp_sock_set_keepintvl
Date: Wed, 20 May 2020 21:54:54 +0200
Message-Id: <20200520195509.2215098-19-hch@lst.de>
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

Add a helper to directly set the TCP_KEEPINTVL sockopt from kernel space
without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/tcp.h   |  1 +
 net/ipv4/tcp.c        | 12 ++++++++++++
 net/rds/tcp_listen.c  |  4 +---
 net/sunrpc/xprtsock.c |  3 +--
 4 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/include/linux/tcp.h b/include/linux/tcp.h
index 5724dd84a85ed..1f9bada00faab 100644
--- a/include/linux/tcp.h
+++ b/include/linux/tcp.h
@@ -499,6 +499,7 @@ int tcp_skb_shift(struct sk_buff *to, struct sk_buff *from, int pcount,
 
 void tcp_sock_set_cork(struct sock *sk, bool on);
 int tcp_sock_set_keepidle(struct sock *sk, int val);
+int tcp_sock_set_keepintvl(struct sock *sk, int val);
 void tcp_sock_set_nodelay(struct sock *sk);
 void tcp_sock_set_quickack(struct sock *sk, int val);
 int tcp_sock_set_syncnt(struct sock *sk, int val);
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index bdf0ff9333514..7eb083e09786a 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2934,6 +2934,18 @@ int tcp_sock_set_keepidle(struct sock *sk, int val)
 }
 EXPORT_SYMBOL(tcp_sock_set_keepidle);
 
+int tcp_sock_set_keepintvl(struct sock *sk, int val)
+{
+	if (val < 1 || val > MAX_TCP_KEEPINTVL)
+		return -EINVAL;
+
+	lock_sock(sk);
+	tcp_sk(sk)->keepalive_intvl = val * HZ;
+	release_sock(sk);
+	return 0;
+}
+EXPORT_SYMBOL(tcp_sock_set_keepintvl);
+
 /*
  *	Socket option code for TCP.
  */
diff --git a/net/rds/tcp_listen.c b/net/rds/tcp_listen.c
index 79f9adc008114..9ad555c48d15d 100644
--- a/net/rds/tcp_listen.c
+++ b/net/rds/tcp_listen.c
@@ -53,12 +53,10 @@ int rds_tcp_keepalive(struct socket *sock)
 		goto bail;
 
 	tcp_sock_set_keepidle(sock->sk, keepidle);
-
 	/* KEEPINTVL is the interval between successive probes. We follow
 	 * the model in xs_tcp_finish_connecting() and re-use keepidle.
 	 */
-	ret = kernel_setsockopt(sock, IPPROTO_TCP, TCP_KEEPINTVL,
-				(char *)&keepidle, sizeof(keepidle));
+	tcp_sock_set_keepintvl(sock->sk, keepidle);
 bail:
 	return ret;
 }
diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index 473290f7c5c0a..5ca64e12af0c5 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -2108,8 +2108,7 @@ static void xs_tcp_set_socket_timeouts(struct rpc_xprt *xprt,
 	/* TCP Keepalive options */
 	sock_set_keepalive(sock->sk);
 	tcp_sock_set_keepidle(sock->sk, keepidle);
-	kernel_setsockopt(sock, SOL_TCP, TCP_KEEPINTVL,
-			(char *)&keepidle, sizeof(keepidle));
+	tcp_sock_set_keepintvl(sock->sk, keepidle);
 	kernel_setsockopt(sock, SOL_TCP, TCP_KEEPCNT,
 			(char *)&keepcnt, sizeof(keepcnt));
 
-- 
2.26.2


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
