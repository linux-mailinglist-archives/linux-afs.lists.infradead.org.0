Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A52A21E5A46
	for <lists+linux-afs@lfdr.de>; Thu, 28 May 2020 10:04:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LnhPeQSx19/yyBIOGRdDNFo1WiceMbgJefxB4bHDcno=; b=WC9DK6phjGeems
	NwjaID03Mf7ePZwNUgz8xKw/9NUCA61HXaBLxMvkOin7JnETa80c3FAGVi1TUexYFNg3JXHvTIAOW
	EShLmWEaf2di4Yja/oL40YXtbMzCZ24wkD+e3ITfQQ87ehwHtgZ57Rx97RkYYc1JY+ibHGGD+U0O4
	3yJOc4moP6aFbG5Pf55NmYdbzIYfeucCVVCawYbn0zUG8ELCR4gwW5sFqfERPZ313CvfjgSEeDnc6
	YTJLqZOX2V6x2VRgrJpzcGiZyN/1whtb90jxZAEgPoaVlXUTZKhEU+nNwCKecghFx1DdHcHNlqFlR
	nNHEDC5fATAxZepYaF5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeDWr-0005xW-Nb; Thu, 28 May 2020 08:04:41 +0000
Received: from p4fdb1ad2.dip0.t-ipconnect.de ([79.219.26.210] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jeAr8-00021k-Jk; Thu, 28 May 2020 05:13:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 14/28] tcp: add tcp_sock_set_user_timeout
Date: Thu, 28 May 2020 07:12:22 +0200
Message-Id: <20200528051236.620353-15-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200528051236.620353-1-hch@lst.de>
References: <20200528051236.620353-1-hch@lst.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 01:04:27 -0700
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
Cc: linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
 cluster-devel@redhat.com, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, Jon Maloy <jmaloy@redhat.com>,
 linux-rdma@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-nfs@vger.kernel.org, Ying Xue <ying.xue@windriver.com>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Add a helper to directly set the TCP_USER_TIMEOUT sockopt from kernel
space without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ocfs2/cluster/tcp.c | 22 ++--------------------
 include/linux/tcp.h    |  1 +
 net/ipv4/tcp.c         |  8 ++++++++
 net/sunrpc/xprtsock.c  |  3 +--
 4 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/fs/ocfs2/cluster/tcp.c b/fs/ocfs2/cluster/tcp.c
index 4c70fe9d19ab2..79a2317194600 100644
--- a/fs/ocfs2/cluster/tcp.c
+++ b/fs/ocfs2/cluster/tcp.c
@@ -1441,14 +1441,6 @@ static void o2net_rx_until_empty(struct work_struct *work)
 	sc_put(sc);
 }
 
-static int o2net_set_usertimeout(struct socket *sock)
-{
-	int user_timeout = O2NET_TCP_USER_TIMEOUT;
-
-	return kernel_setsockopt(sock, SOL_TCP, TCP_USER_TIMEOUT,
-				(void *)&user_timeout, sizeof(user_timeout));
-}
-
 static void o2net_initialize_handshake(void)
 {
 	o2net_hand->o2hb_heartbeat_timeout_ms = cpu_to_be32(
@@ -1629,12 +1621,7 @@ static void o2net_start_connect(struct work_struct *work)
 	}
 
 	tcp_sock_set_nodelay(sc->sc_sock->sk);
-
-	ret = o2net_set_usertimeout(sock);
-	if (ret) {
-		mlog(ML_ERROR, "set TCP_USER_TIMEOUT failed with %d\n", ret);
-		goto out;
-	}
+	tcp_sock_set_user_timeout(sock->sk, O2NET_TCP_USER_TIMEOUT);
 
 	o2net_register_callbacks(sc->sc_sock->sk, sc);
 
@@ -1821,12 +1808,7 @@ static int o2net_accept_one(struct socket *sock, int *more)
 	new_sock->sk->sk_allocation = GFP_ATOMIC;
 
 	tcp_sock_set_nodelay(new_sock->sk);
-
-	ret = o2net_set_usertimeout(new_sock);
-	if (ret) {
-		mlog(ML_ERROR, "set TCP_USER_TIMEOUT failed with %d\n", ret);
-		goto out;
-	}
+	tcp_sock_set_user_timeout(new_sock->sk, O2NET_TCP_USER_TIMEOUT);
 
 	ret = new_sock->ops->getname(new_sock, (struct sockaddr *) &sin, 1);
 	if (ret < 0)
diff --git a/include/linux/tcp.h b/include/linux/tcp.h
index 6aa4ae5ebf3d5..de682143efe4d 100644
--- a/include/linux/tcp.h
+++ b/include/linux/tcp.h
@@ -501,5 +501,6 @@ void tcp_sock_set_cork(struct sock *sk, bool on);
 void tcp_sock_set_nodelay(struct sock *sk);
 void tcp_sock_set_quickack(struct sock *sk, int val);
 int tcp_sock_set_syncnt(struct sock *sk, int val);
+void tcp_sock_set_user_timeout(struct sock *sk, u32 val);
 
 #endif	/* _LINUX_TCP_H */
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index d2c67ae1da07a..0004bd9ae7b0a 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2893,6 +2893,14 @@ int tcp_sock_set_syncnt(struct sock *sk, int val)
 }
 EXPORT_SYMBOL(tcp_sock_set_syncnt);
 
+void tcp_sock_set_user_timeout(struct sock *sk, u32 val)
+{
+	lock_sock(sk);
+	inet_csk(sk)->icsk_user_timeout = val;
+	release_sock(sk);
+}
+EXPORT_SYMBOL(tcp_sock_set_user_timeout);
+
 /*
  *	Socket option code for TCP.
  */
diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index 399848c2bcb29..231fd6162f68d 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -2115,8 +2115,7 @@ static void xs_tcp_set_socket_timeouts(struct rpc_xprt *xprt,
 			(char *)&keepcnt, sizeof(keepcnt));
 
 	/* TCP user timeout (see RFC5482) */
-	kernel_setsockopt(sock, SOL_TCP, TCP_USER_TIMEOUT,
-			(char *)&timeo, sizeof(timeo));
+	tcp_sock_set_user_timeout(sock->sk, timeo);
 }
 
 static void xs_tcp_set_connect_timeout(struct rpc_xprt *xprt,
-- 
2.26.2


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
