Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE3D1E5A50
	for <lists+linux-afs@lfdr.de>; Thu, 28 May 2020 10:05:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nSXGNigSAbmsYcoezUYHEvHO4xxBslKHYVrxcZftY5Q=; b=YGsWMAyWJRaTxr
	L5AzR0NBzl1d5p3uAizZaMh7lOqlSZMRit6mwkzi0f/Y84hbSbwZnMkIOJFBAuP06JycjWgvoyCpe
	ZG1z05hiCCpO1zu+UAxkN1UFE4XuBrEj0Jkr5VbWzQJmDCHRRr1RFeQRiu0snp7Fizfw9QcS1sYWA
	GoNqbAN4SBMzSUFXiBJeLmt5yPqUSfF8Iw/ksNiF+aNtPk578AILwcMRcY+D7OIbk5fg+Zy2gX2o5
	XyqBmJv5x2uPUMEX+nJeV9LP6/T4HQx7mF38TAAqchsqhqDDpH2/thmwH648DQVQEwdGhbLBU3iNH
	NTaznKbtN+0MGOLU8Dlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeDX3-0006Bc-R0; Thu, 28 May 2020 08:04:53 +0000
Received: from p4fdb1ad2.dip0.t-ipconnect.de ([79.219.26.210] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jeArh-0002Z7-IZ; Thu, 28 May 2020 05:14:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 25/28] ipv6: add ip6_sock_set_addr_preferences
Date: Thu, 28 May 2020 07:12:33 +0200
Message-Id: <20200528051236.620353-26-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200528051236.620353-1-hch@lst.de>
References: <20200528051236.620353-1-hch@lst.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 01:04:28 -0700
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

Add a helper to directly set the IPV6_ADD_PREFERENCES sockopt from kernel
space without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/net/ipv6.h       | 67 ++++++++++++++++++++++++++++++++++++++++
 net/ipv6/ipv6_sockglue.c | 59 +----------------------------------
 net/sunrpc/xprtsock.c    |  7 +++--
 3 files changed, 72 insertions(+), 61 deletions(-)

diff --git a/include/net/ipv6.h b/include/net/ipv6.h
index 49c4abf991489..9a90759830162 100644
--- a/include/net/ipv6.h
+++ b/include/net/ipv6.h
@@ -1195,4 +1195,71 @@ static inline void ip6_sock_set_recverr(struct sock *sk)
 	release_sock(sk);
 }
 
+static inline int __ip6_sock_set_addr_preferences(struct sock *sk, int val)
+{
+	unsigned int pref = 0;
+	unsigned int prefmask = ~0;
+
+	/* check PUBLIC/TMP/PUBTMP_DEFAULT conflicts */
+	switch (val & (IPV6_PREFER_SRC_PUBLIC |
+		       IPV6_PREFER_SRC_TMP |
+		       IPV6_PREFER_SRC_PUBTMP_DEFAULT)) {
+	case IPV6_PREFER_SRC_PUBLIC:
+		pref |= IPV6_PREFER_SRC_PUBLIC;
+		prefmask &= ~(IPV6_PREFER_SRC_PUBLIC |
+			      IPV6_PREFER_SRC_TMP);
+		break;
+	case IPV6_PREFER_SRC_TMP:
+		pref |= IPV6_PREFER_SRC_TMP;
+		prefmask &= ~(IPV6_PREFER_SRC_PUBLIC |
+			      IPV6_PREFER_SRC_TMP);
+		break;
+	case IPV6_PREFER_SRC_PUBTMP_DEFAULT:
+		prefmask &= ~(IPV6_PREFER_SRC_PUBLIC |
+			      IPV6_PREFER_SRC_TMP);
+		break;
+	case 0:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* check HOME/COA conflicts */
+	switch (val & (IPV6_PREFER_SRC_HOME | IPV6_PREFER_SRC_COA)) {
+	case IPV6_PREFER_SRC_HOME:
+		prefmask &= ~IPV6_PREFER_SRC_COA;
+		break;
+	case IPV6_PREFER_SRC_COA:
+		pref |= IPV6_PREFER_SRC_COA;
+		break;
+	case 0:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* check CGA/NONCGA conflicts */
+	switch (val & (IPV6_PREFER_SRC_CGA|IPV6_PREFER_SRC_NONCGA)) {
+	case IPV6_PREFER_SRC_CGA:
+	case IPV6_PREFER_SRC_NONCGA:
+	case 0:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	inet6_sk(sk)->srcprefs = (inet6_sk(sk)->srcprefs & prefmask) | pref;
+	return 0;
+}
+
+static inline int ip6_sock_set_addr_preferences(struct sock *sk, bool val)
+{
+	int ret;
+
+	lock_sock(sk);
+	ret = __ip6_sock_set_addr_preferences(sk, val);
+	release_sock(sk);
+	return ret;
+}
+
 #endif /* _NET_IPV6_H */
diff --git a/net/ipv6/ipv6_sockglue.c b/net/ipv6/ipv6_sockglue.c
index e10258c2210e8..adbfed6adf11c 100644
--- a/net/ipv6/ipv6_sockglue.c
+++ b/net/ipv6/ipv6_sockglue.c
@@ -845,67 +845,10 @@ static int do_ipv6_setsockopt(struct sock *sk, int level, int optname,
 		break;
 
 	case IPV6_ADDR_PREFERENCES:
-	    {
-		unsigned int pref = 0;
-		unsigned int prefmask = ~0;
-
 		if (optlen < sizeof(int))
 			goto e_inval;
-
-		retv = -EINVAL;
-
-		/* check PUBLIC/TMP/PUBTMP_DEFAULT conflicts */
-		switch (val & (IPV6_PREFER_SRC_PUBLIC|
-			       IPV6_PREFER_SRC_TMP|
-			       IPV6_PREFER_SRC_PUBTMP_DEFAULT)) {
-		case IPV6_PREFER_SRC_PUBLIC:
-			pref |= IPV6_PREFER_SRC_PUBLIC;
-			break;
-		case IPV6_PREFER_SRC_TMP:
-			pref |= IPV6_PREFER_SRC_TMP;
-			break;
-		case IPV6_PREFER_SRC_PUBTMP_DEFAULT:
-			break;
-		case 0:
-			goto pref_skip_pubtmp;
-		default:
-			goto e_inval;
-		}
-
-		prefmask &= ~(IPV6_PREFER_SRC_PUBLIC|
-			      IPV6_PREFER_SRC_TMP);
-pref_skip_pubtmp:
-
-		/* check HOME/COA conflicts */
-		switch (val & (IPV6_PREFER_SRC_HOME|IPV6_PREFER_SRC_COA)) {
-		case IPV6_PREFER_SRC_HOME:
-			break;
-		case IPV6_PREFER_SRC_COA:
-			pref |= IPV6_PREFER_SRC_COA;
-		case 0:
-			goto pref_skip_coa;
-		default:
-			goto e_inval;
-		}
-
-		prefmask &= ~IPV6_PREFER_SRC_COA;
-pref_skip_coa:
-
-		/* check CGA/NONCGA conflicts */
-		switch (val & (IPV6_PREFER_SRC_CGA|IPV6_PREFER_SRC_NONCGA)) {
-		case IPV6_PREFER_SRC_CGA:
-		case IPV6_PREFER_SRC_NONCGA:
-		case 0:
-			break;
-		default:
-			goto e_inval;
-		}
-
-		np->srcprefs = (np->srcprefs & prefmask) | pref;
-		retv = 0;
-
+		retv = __ip6_sock_set_addr_preferences(sk, val);
 		break;
-	    }
 	case IPV6_MINHOPCOUNT:
 		if (optlen < sizeof(int))
 			goto e_inval;
diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index 0d3ec055bc12f..3a143e250b9ac 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -2150,7 +2150,6 @@ static int xs_tcp_finish_connecting(struct rpc_xprt *xprt, struct socket *sock)
 
 	if (!transport->inet) {
 		struct sock *sk = sock->sk;
-		unsigned int addr_pref = IPV6_PREFER_SRC_PUBLIC;
 
 		/* Avoid temporary address, they are bad for long-lived
 		 * connections such as NFS mounts.
@@ -2159,8 +2158,10 @@ static int xs_tcp_finish_connecting(struct rpc_xprt *xprt, struct socket *sock)
 		 *    knowledge about the normal duration of connections,
 		 *    MAY override this as appropriate.
 		 */
-		kernel_setsockopt(sock, SOL_IPV6, IPV6_ADDR_PREFERENCES,
-				(char *)&addr_pref, sizeof(addr_pref));
+		if (xs_addr(xprt)->sa_family == PF_INET6) {
+			ip6_sock_set_addr_preferences(sk,
+				IPV6_PREFER_SRC_PUBLIC);
+		}
 
 		xs_tcp_set_socket_timeouts(xprt, sock);
 
-- 
2.26.2


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
