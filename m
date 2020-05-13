Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 447731D13CC
	for <lists+linux-afs@lfdr.de>; Wed, 13 May 2020 15:01:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WvzeuGL++s5IaoUQ5/pCwM44mczS3l3a6JytyieNrG8=; b=EOWqj1eRak6KFS
	c3ahlElVOVjDmlrVEuGmZRRRpTk3Op8thP5oLy/XHRCg9EhRr/G9snM3iO0kHnq652mC1S6W0+jOI
	fRc57vYWcTJmPwVb6p7s1wumhwIwDZE5Dds35mjvjyCQ2JIoZihj3lV81PI0e02iajacNoSxL7whD
	SL5uzip5yh3V1il7Nwo5ORccdbiBIrNEVP7Z/+dhirIRuC/lCMhGUMnxvpG0ISOI0T6n+H4162HtK
	TyoELhTSrPrWsYJ6zH/I3Cxkq/rndnlWpTdmIykKOD/yz0gazregbLhodfqRA69XCFELSouW+CmKL
	HAaAUSz0tCvMa62ygdvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYr0T-0008BQ-Rl; Wed, 13 May 2020 13:01:05 +0000
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYkri-0004T2-Vl; Wed, 13 May 2020 06:27:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 16/33] tcp: add tcp_sock_set_keepintvl
Date: Wed, 13 May 2020 08:26:31 +0200
Message-Id: <20200513062649.2100053-17-hch@lst.de>
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
index 4d3a3e959e45b..dad18ca361c01 100644
--- a/include/linux/tcp.h
+++ b/include/linux/tcp.h
@@ -500,5 +500,6 @@ void tcp_sock_set_quickack(struct sock *sk, int val);
 int tcp_sock_set_syncnt(struct sock *sk, int val);
 void tcp_sock_set_user_timeout(struct sock *sk, u32 val);
 int tcp_sock_set_keepidle(struct sock *sk, int val);
+int tcp_sock_set_keepintvl(struct sock *sk, int val);
 
 #endif	/* _LINUX_TCP_H */
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 22eb9159c7d05..b714f2b2fa54e 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2923,6 +2923,18 @@ int tcp_sock_set_keepidle(struct sock *sk, int val)
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
index 8c76969d8c878..a5db2f8bb7339 100644
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
index ea79446789c69..e20de4a52edb7 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -2108,8 +2108,7 @@ static void xs_tcp_set_socket_timeouts(struct rpc_xprt *xprt,
 	/* TCP Keepalive options */
 	sock_set_keepalive(sock->sk, 1);
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
