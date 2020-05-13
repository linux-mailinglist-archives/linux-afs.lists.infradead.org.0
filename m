Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C735B1D13D2
	for <lists+linux-afs@lfdr.de>; Wed, 13 May 2020 15:01:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/MdrhM6qD7nM5gUoxLJ1URFQ/4WT8G1yIuVNlWZUdU=; b=BOFvGKlSeTHxvL
	fmhwOUPfjU60c6JKUkWAlxtS+q+V5P6VJgBlpSdKBehZT1QJ1BxTSE9bF4cBIDIJ5aMGwBW4QFFJf
	sBzv+d+uta+qr+C3gaNfddnvFrdzkGt+kS51ogzXiLDrlyrggKgxpTWSZdEBD7dMbPztnfMwNRT7d
	ES8Ojwoaib6c1IxAvHRTrPHk71khh+wAd7JiRbB7aVqeY3pgyw5r/gxpW5B4SvLwSjsj4O1D+N4nE
	JAiYdvL7PBO4IuPfssvvZQB7xyTmUb9DKe4HLT1V4QFOZHnELY1UgPObAJ3g6lqsLd6JDWrJdvdGn
	yn7qzAcKreN6WY4NvwzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYr0Y-0008L6-TJ; Wed, 13 May 2020 13:01:11 +0000
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYkrr-0004ay-Lb; Wed, 13 May 2020 06:27:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 19/33] ipv4: add ip_sock_set_freebind
Date: Wed, 13 May 2020 08:26:34 +0200
Message-Id: <20200513062649.2100053-20-hch@lst.de>
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

Add a helper to directly set the IP_FREEBIND sockopt from kernel space
without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/target/iscsi/iscsi_target_login.c | 13 +++----------
 include/net/ip.h                          |  1 +
 net/ipv4/ip_sockglue.c                    |  8 ++++++++
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/target/iscsi/iscsi_target_login.c b/drivers/target/iscsi/iscsi_target_login.c
index 165fa573bcb29..9f69e16cfef5f 100644
--- a/drivers/target/iscsi/iscsi_target_login.c
+++ b/drivers/target/iscsi/iscsi_target_login.c
@@ -15,6 +15,7 @@
 #include <linux/sched/signal.h>
 #include <linux/idr.h>
 #include <linux/tcp.h>        /* TCP_NODELAY */
+#include <net/ip.h>
 #include <net/ipv6.h>         /* ipv6_addr_v4mapped() */
 #include <scsi/iscsi_proto.h>
 #include <target/target_core_base.h>
@@ -855,7 +856,7 @@ int iscsit_setup_np(
 	struct sockaddr_storage *sockaddr)
 {
 	struct socket *sock = NULL;
-	int backlog = ISCSIT_TCP_BACKLOG, ret, opt = 0, len;
+	int backlog = ISCSIT_TCP_BACKLOG, ret, len;
 
 	switch (np->np_network_transport) {
 	case ISCSI_TCP:
@@ -900,15 +901,7 @@ int iscsit_setup_np(
 	if (np->np_network_transport == ISCSI_TCP)
 		tcp_sock_set_nodelay(sock->sk, true);
 	sock_set_reuseaddr(sock->sk, SK_CAN_REUSE);
-
-	opt = 1;
-	ret = kernel_setsockopt(sock, IPPROTO_IP, IP_FREEBIND,
-			(char *)&opt, sizeof(opt));
-	if (ret < 0) {
-		pr_err("kernel_setsockopt() for IP_FREEBIND"
-			" failed\n");
-		goto fail;
-	}
+	ip_sock_set_freebind(sock->sk, true);
 
 	ret = kernel_bind(sock, (struct sockaddr *)&np->np_sockaddr, len);
 	if (ret < 0) {
diff --git a/include/net/ip.h b/include/net/ip.h
index 2fc52e26fa88b..1e2feca8630d0 100644
--- a/include/net/ip.h
+++ b/include/net/ip.h
@@ -766,5 +766,6 @@ static inline bool inetdev_valid_mtu(unsigned int mtu)
 }
 
 void ip_sock_set_tos(struct sock *sk, int val);
+void ip_sock_set_freebind(struct sock *sk, bool val);
 
 #endif	/* _IP_H */
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index 1733ac78c21aa..0c40887a817f8 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -581,6 +581,14 @@ void ip_sock_set_tos(struct sock *sk, int val)
 }
 EXPORT_SYMBOL(ip_sock_set_tos);
 
+void ip_sock_set_freebind(struct sock *sk, bool val)
+{
+	lock_sock(sk);
+	inet_sk(sk)->freebind = val;
+	release_sock(sk);
+}
+EXPORT_SYMBOL(ip_sock_set_freebind);
+
 /*
  *	Socket option code for IP. This is the end of the line after any
  *	TCP,UDP etc options on an IP socket.
-- 
2.26.2


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
