Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7C61DC22B
	for <lists+linux-afs@lfdr.de>; Thu, 21 May 2020 00:38:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+jQojeufzQxZfH+yieKeJKIBGl6xUdIJEntg9fAF25E=; b=mwBobpbN07o7Ap
	vEEtdCiFHcl6O7hUGTDnkX1dmtaWq1iIiiRBbu3D7p5wV3UhlE5vL8867vsjkX+12faMUtnWiaIDk
	ppW3/nSV7MjZK86ycqLUvB8hW14HC8woDm6BQNv/Dcxtbmpwi/7afi1DHapajco3mY4eAG3t/LiPO
	SJLsQntY0EzLTij4jFMyOK2BxZ89m3xGS5Eoj0eOPn9/jxsSDc3NwIaKwHy1e88hWlDfLN/udbm6A
	ds3MTsMHht+WBfR3lQLm4e3THkOSN8EI6cQcAzrh0OhtEdgHrKw4c+wxLB4ZA6Wq2ifhyNmuSSM/2
	bloe2pd8WiaLOdDdtNGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbXLk-0008Sx-C3; Wed, 20 May 2020 22:38:08 +0000
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbUoM-0002DS-V4; Wed, 20 May 2020 19:55:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 07/33] net: add sock_bindtoindex
Date: Wed, 20 May 2020 21:54:43 +0200
Message-Id: <20200520195509.2215098-8-hch@lst.de>
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

Add a helper to directly set the SO_BINDTOIFINDEX sockopt from kernel
space without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/net/sock.h        |  1 +
 net/core/sock.c           | 21 +++++++++++++++------
 net/ipv4/udp_tunnel.c     |  4 +---
 net/ipv6/ip6_udp_tunnel.c |  4 +---
 4 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/include/net/sock.h b/include/net/sock.h
index 9a7b9e98685ac..cdec7bc055d5b 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2688,6 +2688,7 @@ static inline bool sk_dev_equal_l3scope(struct sock *sk, int dif)
 
 void sock_def_readable(struct sock *sk);
 
+int sock_bindtoindex(struct sock *sk, int ifindex);
 void sock_no_linger(struct sock *sk);
 void sock_set_priority(struct sock *sk, u32 priority);
 void sock_set_reuseaddr(struct sock *sk);
diff --git a/net/core/sock.c b/net/core/sock.c
index d3b1d61e4f768..23f80880fbb2c 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -566,7 +566,7 @@ struct dst_entry *sk_dst_check(struct sock *sk, u32 cookie)
 }
 EXPORT_SYMBOL(sk_dst_check);
 
-static int sock_setbindtodevice_locked(struct sock *sk, int ifindex)
+static int sock_bindtoindex_locked(struct sock *sk, int ifindex)
 {
 	int ret = -ENOPROTOOPT;
 #ifdef CONFIG_NETDEVICES
@@ -594,6 +594,18 @@ static int sock_setbindtodevice_locked(struct sock *sk, int ifindex)
 	return ret;
 }
 
+int sock_bindtoindex(struct sock *sk, int ifindex)
+{
+	int ret;
+
+	lock_sock(sk);
+	ret = sock_bindtoindex_locked(sk, ifindex);
+	release_sock(sk);
+
+	return ret;
+}
+EXPORT_SYMBOL(sock_bindtoindex);
+
 static int sock_setbindtodevice(struct sock *sk, char __user *optval,
 				int optlen)
 {
@@ -634,10 +646,7 @@ static int sock_setbindtodevice(struct sock *sk, char __user *optval,
 			goto out;
 	}
 
-	lock_sock(sk);
-	ret = sock_setbindtodevice_locked(sk, index);
-	release_sock(sk);
-
+	return sock_bindtoindex(sk, index);
 out:
 #endif
 
@@ -1216,7 +1225,7 @@ int sock_setsockopt(struct socket *sock, int level, int optname,
 		break;
 
 	case SO_BINDTOIFINDEX:
-		ret = sock_setbindtodevice_locked(sk, val);
+		ret = sock_bindtoindex_locked(sk, val);
 		break;
 
 	default:
diff --git a/net/ipv4/udp_tunnel.c b/net/ipv4/udp_tunnel.c
index 150e6f0fdbf59..2158e8bddf41c 100644
--- a/net/ipv4/udp_tunnel.c
+++ b/net/ipv4/udp_tunnel.c
@@ -22,9 +22,7 @@ int udp_sock_create4(struct net *net, struct udp_port_cfg *cfg,
 		goto error;
 
 	if (cfg->bind_ifindex) {
-		err = kernel_setsockopt(sock, SOL_SOCKET, SO_BINDTOIFINDEX,
-					(void *)&cfg->bind_ifindex,
-					sizeof(cfg->bind_ifindex));
+		err = sock_bindtoindex(sock->sk, cfg->bind_ifindex);
 		if (err < 0)
 			goto error;
 	}
diff --git a/net/ipv6/ip6_udp_tunnel.c b/net/ipv6/ip6_udp_tunnel.c
index 58956a6b66a21..6523609516d25 100644
--- a/net/ipv6/ip6_udp_tunnel.c
+++ b/net/ipv6/ip6_udp_tunnel.c
@@ -33,9 +33,7 @@ int udp_sock_create6(struct net *net, struct udp_port_cfg *cfg,
 			goto error;
 	}
 	if (cfg->bind_ifindex) {
-		err = kernel_setsockopt(sock, SOL_SOCKET, SO_BINDTOIFINDEX,
-					(void *)&cfg->bind_ifindex,
-					sizeof(cfg->bind_ifindex));
+		err = sock_bindtoindex(sock->sk, cfg->bind_ifindex);
 		if (err < 0)
 			goto error;
 	}
-- 
2.26.2


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
