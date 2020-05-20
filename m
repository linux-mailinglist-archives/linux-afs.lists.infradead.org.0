Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB7D1DC236
	for <lists+linux-afs@lfdr.de>; Thu, 21 May 2020 00:38:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UtHf1RkxODU6J8AZLJ2foQCt5zjxaG3U/5Wz08FQ2YA=; b=LnysvT3srVLMDK
	0w0Dc3W41qAch2KqLM+YTcXKxChHn39QlBxyMenNW/oE+75I1QzMMWRT5vdlV61ft0XB4vbslTQBJ
	pNq8D/5EX0PoWscxTpn7WL7EGtbubm6Pm2IIzc1DKICdDjRxnP3goHIoOXnYZjiKkOvI5mSU7qB4f
	5hrK+H+N+F3WMMTWSC1nBybMJnAC8M/wqxh4kAMNW9yfmQuBKktI862uICNqseAaU1/+ogVs35qGs
	AjK5wr7EHPqDqPLpbyuyaO4pKSopCWoNOFEaGhi1hVLdIeOlVOfru+0M2XH8EwXpZq5hf2Bl389Xo
	Nx71FZEuSSPRZJZe3Z+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbXM4-0000Mw-8N; Wed, 20 May 2020 22:38:28 +0000
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbUpE-0003GO-Kx; Wed, 20 May 2020 19:56:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 26/33] ipv6: add ip6_sock_set_recverr
Date: Wed, 20 May 2020 21:55:02 +0200
Message-Id: <20200520195509.2215098-27-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520195509.2215098-1-hch@lst.de>
References: <20200520195509.2215098-1-hch@lst.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 May 2020 15:38:05 -0700
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

Add a helper to directly set the IPV6_RECVERR sockopt from kernel space
without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: David Howells <dhowells@redhat.com>
---
 include/net/ipv6.h       |  7 +++++++
 net/rxrpc/local_object.c | 10 ++--------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/net/ipv6.h b/include/net/ipv6.h
index 7d1cb9f0f5388..3b02049d2e582 100644
--- a/include/net/ipv6.h
+++ b/include/net/ipv6.h
@@ -1187,4 +1187,11 @@ static inline int ip6_sock_set_v6only(struct sock *sk)
 	return 0;
 }
 
+static inline void ip6_sock_set_recverr(struct sock *sk)
+{
+	lock_sock(sk);
+	inet6_sk(sk)->recverr = true;
+	release_sock(sk);
+}
+
 #endif /* _NET_IPV6_H */
diff --git a/net/rxrpc/local_object.c b/net/rxrpc/local_object.c
index 6f4e6b4817cf2..c8b2097f499c0 100644
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
+		ip6_sock_set_recverr(local->socket->sk);
 
 		/* Fall through and set IPv4 options too otherwise we don't get
 		 * errors from IPv4 packets sent through the IPv6 socket.
-- 
2.26.2


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
