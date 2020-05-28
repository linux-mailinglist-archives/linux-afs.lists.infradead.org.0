Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D6E1E5A4F
	for <lists+linux-afs@lfdr.de>; Thu, 28 May 2020 10:05:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bUaV6F2eECzGM8wjIF7gKm/LQn9w70/7F6nKg6y/H1E=; b=ao+2eVHMqUSoct
	5kNbCIeq0UECOMuhLRbo7jIosUx0v3bUGAm3FqErM6ZVzoWe//DDxWn4C7OYFvpIr4mFDWCV6Glt9
	88Hu7dAo5e4j4SNGo4zPm971bt/JGgff1rMX13k0ckvnvPxs+g+OlEZhgrztAosHenVyKAU8amz8b
	kKFsbCMm9frDwPSUK0yI8AdUkH29b7N4L6p6YkORLmPJyn5MsnL/9Tce9eX6H+6puU7gmLm39dEKZ
	XIksOsehHt3a9QJ4LoWI34H9qkqsNAaYM9KnZJVGGC7DAP3Za9wP16n+9ZlkKfQHhv9pmw4Is/dYl
	9GhvYiBrXJOSnbuJNCvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeDX0-00066s-Fh; Thu, 28 May 2020 08:04:50 +0000
Received: from p4fdb1ad2.dip0.t-ipconnect.de ([79.219.26.210] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jeArY-0002SN-1s; Thu, 28 May 2020 05:13:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 22/28] ipv4: add ip_sock_set_pktinfo
Date: Thu, 28 May 2020 07:12:30 +0200
Message-Id: <20200528051236.620353-23-hch@lst.de>
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

Add a helper to directly set the IP_PKTINFO sockopt from kernel
space without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/net/ip.h       | 1 +
 net/ipv4/ip_sockglue.c | 8 ++++++++
 net/sunrpc/svcsock.c   | 5 ++---
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/net/ip.h b/include/net/ip.h
index d3649c49dd333..04ebe7bf54c6a 100644
--- a/include/net/ip.h
+++ b/include/net/ip.h
@@ -767,6 +767,7 @@ static inline bool inetdev_valid_mtu(unsigned int mtu)
 
 void ip_sock_set_freebind(struct sock *sk);
 int ip_sock_set_mtu_discover(struct sock *sk, int val);
+void ip_sock_set_pktinfo(struct sock *sk);
 void ip_sock_set_recverr(struct sock *sk);
 void ip_sock_set_tos(struct sock *sk, int val);
 
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index aa115be11dcfb..84ec3703c9091 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -608,6 +608,14 @@ int ip_sock_set_mtu_discover(struct sock *sk, int val)
 }
 EXPORT_SYMBOL(ip_sock_set_mtu_discover);
 
+void ip_sock_set_pktinfo(struct sock *sk)
+{
+	lock_sock(sk);
+	inet_sk(sk)->cmsg_flags |= IP_CMSG_PKTINFO;
+	release_sock(sk);
+}
+EXPORT_SYMBOL(ip_sock_set_pktinfo);
+
 /*
  *	Socket option code for IP. This is the end of the line after any
  *	TCP,UDP etc options on an IP socket.
diff --git a/net/sunrpc/svcsock.c b/net/sunrpc/svcsock.c
index 6773dacc64d8e..7a805d165689c 100644
--- a/net/sunrpc/svcsock.c
+++ b/net/sunrpc/svcsock.c
@@ -616,9 +616,8 @@ static void svc_udp_init(struct svc_sock *svsk, struct svc_serv *serv)
 	/* make sure we get destination address info */
 	switch (svsk->sk_sk->sk_family) {
 	case AF_INET:
-		level = SOL_IP;
-		optname = IP_PKTINFO;
-		break;
+		ip_sock_set_pktinfo(svsk->sk_sock->sk);
+		return;
 	case AF_INET6:
 		level = SOL_IPV6;
 		optname = IPV6_RECVPKTINFO;
-- 
2.26.2


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
