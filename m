Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 534F51DC23C
	for <lists+linux-afs@lfdr.de>; Thu, 21 May 2020 00:38:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f7p0j0BsDCpf1NzLwOtJjYKnXb57pr7lEfTQI9tseG4=; b=rintkTFlYB4s6A
	ll0tVRe7um1xG2khUJnjIhmc7NWAc40cNpDC1DvtJuM4Y64q/eHQsjCGVMvfzUazHNi46n3cTuqEz
	bjDQ4E3ZhdkUzo+qbUHbP/k3Q+7yXukEl8ya0KjW4YVLYYXIeN+kKExodlb+EX0ufyKiRBBy+sDYh
	s1sVee1xY7F2nPeFWseveOLxTRQpbT4PqSYmoXWPzIRYrElM0De5o6FCgF3JpMi6ZtNCwMQLro2sJ
	tqjk72xteOwSPh7JRrDioOnpuDXqLlMINMo+UFBwHqJ49jcJItOGt9YgumWbl9WL1TvcaHPI8ajt4
	KZ7kdq+CugAj4v8gp52g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbXLz-0000Gc-9x; Wed, 20 May 2020 22:38:23 +0000
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbUp0-0002zZ-TE; Wed, 20 May 2020 19:56:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 21/33] ipv4: add ip_sock_set_freebind
Date: Wed, 20 May 2020 21:54:57 +0200
Message-Id: <20200520195509.2215098-22-hch@lst.de>
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

Add a helper to directly set the IP_FREEBIND sockopt from kernel space
without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/target/iscsi/iscsi_target_login.c | 13 +++----------
 include/net/ip.h                          |  1 +
 net/ipv4/ip_sockglue.c                    |  8 ++++++++
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/target/iscsi/iscsi_target_login.c b/drivers/target/iscsi/iscsi_target_login.c
index b561b07a869a0..85748e3388582 100644
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
 		tcp_sock_set_nodelay(sock->sk);
 	sock_set_reuseaddr(sock->sk);
-
-	opt = 1;
-	ret = kernel_setsockopt(sock, IPPROTO_IP, IP_FREEBIND,
-			(char *)&opt, sizeof(opt));
-	if (ret < 0) {
-		pr_err("kernel_setsockopt() for IP_FREEBIND"
-			" failed\n");
-		goto fail;
-	}
+	ip_sock_set_freebind(sock->sk);
 
 	ret = kernel_bind(sock, (struct sockaddr *)&np->np_sockaddr, len);
 	if (ret < 0) {
diff --git a/include/net/ip.h b/include/net/ip.h
index 2fc52e26fa88b..5f5d8226b6abc 100644
--- a/include/net/ip.h
+++ b/include/net/ip.h
@@ -765,6 +765,7 @@ static inline bool inetdev_valid_mtu(unsigned int mtu)
 	return likely(mtu >= IPV4_MIN_MTU);
 }
 
+void ip_sock_set_freebind(struct sock *sk);
 void ip_sock_set_tos(struct sock *sk, int val);
 
 #endif	/* _IP_H */
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index 1733ac78c21aa..62e642ab80126 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -581,6 +581,14 @@ void ip_sock_set_tos(struct sock *sk, int val)
 }
 EXPORT_SYMBOL(ip_sock_set_tos);
 
+void ip_sock_set_freebind(struct sock *sk)
+{
+	lock_sock(sk);
+	inet_sk(sk)->freebind = true;
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
