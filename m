Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAB01D13D7
	for <lists+linux-afs@lfdr.de>; Wed, 13 May 2020 15:01:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ber5C8YYvzDRZR4BHuwarW4S+QJOCIB98UismtloF4E=; b=GyzlAKxdfRyBsw
	N81sRMHIsPs2peLGJVFotrm9tO+G74MQve719w5Qi+svEwNTvssE759I4GaKFJWo29oy8U1Q15RqM
	FAGZNFCwbHgrU1ppmdjhpUde3YngQcdM53HWC+Xfpv8yRPQ4nrttAvpg3bK0y0v6WmKOCxm1eU5v1
	HZlbOFHFEzma0VBDy+zZMK7yQHzMSYMnBb8bpYdWvgA5GDYr/P7NB9nKTrJ9k0K8a55bBw9UEW5JO
	jedAxwIQDe4Nda/SdQkit2x9AXnYEV/31EtqDHJgVQ7Cj3a5kBL3ulWGKGBG5FoWPGzc7mSgB5dHF
	+BZWc9m+n4ExXUxkiNow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYr0e-0008Sb-J7; Wed, 13 May 2020 13:01:16 +0000
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYks6-0004pR-63; Wed, 13 May 2020 06:28:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 23/33] ipv6: add ip6_sock_set_recverr
Date: Wed, 13 May 2020 08:26:38 +0200
Message-Id: <20200513062649.2100053-24-hch@lst.de>
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

Add a helper to directly set the IPV6_RECVERR sockopt from kernel space
without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/net/ipv6.h       |  1 +
 net/ipv6/ipv6_sockglue.c | 10 ++++++++++
 net/rxrpc/local_object.c | 10 ++--------
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/include/net/ipv6.h b/include/net/ipv6.h
index e24b59201a00d..69bc1651aaef8 100644
--- a/include/net/ipv6.h
+++ b/include/net/ipv6.h
@@ -1176,5 +1176,6 @@ int ipv6_sock_mc_drop(struct sock *sk, int ifindex,
 		      const struct in6_addr *addr);
 
 int ip6_sock_set_v6only(struct sock *sk, bool val);
+void ip6_sock_set_recverr(struct sock *sk, bool val);
 
 #endif /* _NET_IPV6_H */
diff --git a/net/ipv6/ipv6_sockglue.c b/net/ipv6/ipv6_sockglue.c
index f26224bb3e098..3c67626b6f5a9 100644
--- a/net/ipv6/ipv6_sockglue.c
+++ b/net/ipv6/ipv6_sockglue.c
@@ -147,6 +147,16 @@ int ip6_sock_set_v6only(struct sock *sk, bool val)
 }
 EXPORT_SYMBOL(ip6_sock_set_v6only);
 
+void ip6_sock_set_recverr(struct sock *sk, bool val)
+{
+	lock_sock(sk);
+	inet6_sk(sk)->recverr = val;
+	if (!val)
+		skb_queue_purge(&sk->sk_error_queue);
+	release_sock(sk);
+}
+EXPORT_SYMBOL(ip6_sock_set_recverr);
+
 static int do_ipv6_setsockopt(struct sock *sk, int level, int optname,
 		    char __user *optval, unsigned int optlen)
 {
diff --git a/net/rxrpc/local_object.c b/net/rxrpc/local_object.c
index 20236ddecd2ef..5e356a63aa791 100644
--- a/net/rxrpc/local_object.c
+++ b/net/rxrpc/local_object.c
@@ -107,7 +107,7 @@ static struct rxrpc_local *rxrpc_alloc_local(struct rxrpc_net *rxnet,
 static int rxrpc_open_socket(struct rxrpc_local *local, struct net *net)
 {
 	struct sock *usk;
-	int ret, opt;
+	int ret;
 
 	_enter("%p{%d,%d}",
 	       local, local->srx.transport_type, local->srx.transport.family);
@@ -157,13 +157,7 @@ static int rxrpc_open_socket(struct rxrpc_local *local, struct net *net)
 	switch (local->srx.transport.family) {
 	case AF_INET6:
 		/* we want to receive ICMPv6 errors */
-		opt = 1;
-		ret = kernel_setsockopt(local->socket, SOL_IPV6, IPV6_RECVERR,
-					(char *) &opt, sizeof(opt));
-		if (ret < 0) {
-			_debug("setsockopt failed");
-			goto error;
-		}
+		ip6_sock_set_recverr(local->socket->sk, true);
 
 		/* Fall through and set IPv4 options too otherwise we don't get
 		 * errors from IPv4 packets sent through the IPv6 socket.
-- 
2.26.2


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
