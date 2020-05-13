Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE671D13DC
	for <lists+linux-afs@lfdr.de>; Wed, 13 May 2020 15:01:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AbAVHWt1sAgjiNr0rmIbH0uX9waWn7Dn4ekWOccn/QY=; b=usBxi9tFMdKxUF
	c6W56gRSWFoDiF4Ee1uXutD4JTPyUVGmHLA5Kn+dEEJOE1qaoGHOaehDUAvFQ1Og4bPtb+k1qcy2Y
	tCfmtl/2bQPhwoPW+OLRmSPbymZCfTXbipxGN8Rsh+4mrjEqzGImq8VV5gHFwYyiD7PXrQjN6CZeb
	sj2McKg+zCnOHBy7pvKJ71/yPRlbM4ZvdF9ZV2ksfCu4x1f2sM77GwWh8vmCF4elOkc0bLhTItF4u
	NXE9jNVn3N/w3AQRP1jyFSSsAOZf3Yt8FArIREOSDLthT7DsYyMgJhEsC7YsOxSHid4yQaqFC+1he
	IUTZRny/jmIn9zoU6Mow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYr0g-0008UG-7v; Wed, 13 May 2020 13:01:18 +0000
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYksC-0004vd-Gn; Wed, 13 May 2020 06:28:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 25/33] ipv6: add ip6_sock_set_recvpktinfo
Date: Wed, 13 May 2020 08:26:40 +0200
Message-Id: <20200513062649.2100053-26-hch@lst.de>
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

Add a helper to directly set the IPV6_RECVPKTINFO sockopt from kernel
space without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/net/ipv6.h       |  1 +
 net/ipv6/ipv6_sockglue.c |  8 ++++++++
 net/sunrpc/svcsock.c     | 11 +++--------
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/net/ipv6.h b/include/net/ipv6.h
index 04b2bc1935054..170872bc4e960 100644
--- a/include/net/ipv6.h
+++ b/include/net/ipv6.h
@@ -1178,5 +1178,6 @@ int ipv6_sock_mc_drop(struct sock *sk, int ifindex,
 int ip6_sock_set_v6only(struct sock *sk, bool val);
 void ip6_sock_set_recverr(struct sock *sk, bool val);
 int ip6_sock_set_addr_preferences(struct sock *sk, bool val);
+void ip6_sock_set_recvpktinfo(struct sock *sk, bool val);
 
 #endif /* _NET_IPV6_H */
diff --git a/net/ipv6/ipv6_sockglue.c b/net/ipv6/ipv6_sockglue.c
index c23d42e809d7e..d60adb018d71c 100644
--- a/net/ipv6/ipv6_sockglue.c
+++ b/net/ipv6/ipv6_sockglue.c
@@ -225,6 +225,14 @@ int ip6_sock_set_addr_preferences(struct sock *sk, bool val)
 }
 EXPORT_SYMBOL(ip6_sock_set_addr_preferences);
 
+void ip6_sock_set_recvpktinfo(struct sock *sk, bool val)
+{
+	lock_sock(sk);
+	inet6_sk(sk)->rxopt.bits.rxinfo = val;
+	release_sock(sk);
+}
+EXPORT_SYMBOL(ip6_sock_set_recvpktinfo);
+
 static int do_ipv6_setsockopt(struct sock *sk, int level, int optname,
 		    char __user *optval, unsigned int optlen)
 {
diff --git a/net/sunrpc/svcsock.c b/net/sunrpc/svcsock.c
index 7fa7fedec3c5a..7cf8389b6f46f 100644
--- a/net/sunrpc/svcsock.c
+++ b/net/sunrpc/svcsock.c
@@ -595,8 +595,6 @@ static struct svc_xprt_class svc_udp_class = {
 
 static void svc_udp_init(struct svc_sock *svsk, struct svc_serv *serv)
 {
-	int err, level, optname, one = 1;
-
 	svc_xprt_init(sock_net(svsk->sk_sock->sk), &svc_udp_class,
 		      &svsk->sk_xprt, serv);
 	clear_bit(XPT_CACHE_AUTH, &svsk->sk_xprt.xpt_flags);
@@ -617,17 +615,14 @@ static void svc_udp_init(struct svc_sock *svsk, struct svc_serv *serv)
 	switch (svsk->sk_sk->sk_family) {
 	case AF_INET:
 		ip_sock_set_pktinfo(svsk->sk_sock->sk, true);
-		return;
+		break;
 	case AF_INET6:
-		level = SOL_IPV6;
-		optname = IPV6_RECVPKTINFO;
+		if (IS_REACHABLE(CONFIG_IPV6))
+			ip6_sock_set_recvpktinfo(svsk->sk_sock->sk, true);
 		break;
 	default:
 		BUG();
 	}
-	err = kernel_setsockopt(svsk->sk_sock, level, optname,
-					(char *)&one, sizeof(one));
-	dprintk("svc: kernel_setsockopt returned %d\n", err);
 }
 
 /*
-- 
2.26.2


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
