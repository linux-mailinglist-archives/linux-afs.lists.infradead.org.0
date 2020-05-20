Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 435741DC228
	for <lists+linux-afs@lfdr.de>; Thu, 21 May 2020 00:38:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L+7NuxU9X83GOsSF8c8nQtBDVXrZXc/yq3TLWcg03z0=; b=X0hTL4Ybdg6ur7
	RlJsfB1hfi0ByNrJCan7eT7JibaWjWNUrhcFMbRzoqXDAXYRTAWHU4vNoyTG8oakMCjR0CVJ2EElQ
	g/JFjGJurUkw9sxaz5dv/HAgHz1qDltKeItN8VJcSHpOGC4x1QNc9DA27oR1urKvXw04j54vjX90l
	yBFkRI+96iOWVJVrSBe9YdEqrI9c2eK8x2jkmj7Td7wf0Bvo7eKGKjWT38hO/yxfGts0TUdN/oW2a
	ZRh7hOvz+OsRfJRj1u182+a2AnNOYw4nYsYb3BpkyjyLWjUJYbjcIdEVJF05g6F1XzjRI/0DlhOcS
	xyfOi3HUTJnzynMHDWkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbXLj-0008Ps-Cd; Wed, 20 May 2020 22:38:07 +0000
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbUoG-00023x-Po; Wed, 20 May 2020 19:55:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 05/33] net: add sock_set_priority
Date: Wed, 20 May 2020 21:54:41 +0200
Message-Id: <20200520195509.2215098-6-hch@lst.de>
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
 Sagi Grimberg <sagi@grimberg.me>, linux-rdma@vger.kernel.org,
 cluster-devel@redhat.com, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
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

Add a helper to directly set the SO_PRIORITY sockopt from kernel space
without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/host/tcp.c   | 12 ++----------
 drivers/nvme/target/tcp.c | 18 ++++--------------
 include/net/sock.h        |  1 +
 net/core/sock.c           |  8 ++++++++
 4 files changed, 15 insertions(+), 24 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index e72d87482eb78..a307972d33a02 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1362,16 +1362,8 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl,
 	 */
 	sock_no_linger(queue->sock->sk);
 
-	if (so_priority > 0) {
-		ret = kernel_setsockopt(queue->sock, SOL_SOCKET, SO_PRIORITY,
-				(char *)&so_priority, sizeof(so_priority));
-		if (ret) {
-			dev_err(ctrl->ctrl.device,
-				"failed to set SO_PRIORITY sock opt, ret %d\n",
-				ret);
-			goto err_sock;
-		}
-	}
+	if (so_priority > 0)
+		sock_set_priority(queue->sock->sk, so_priority);
 
 	/* Set socket type of service */
 	if (nctrl->opts->tos >= 0) {
diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index e0801494b097f..f3088156d01da 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -1448,12 +1448,8 @@ static int nvmet_tcp_set_queue_sock(struct nvmet_tcp_queue *queue)
 	 */
 	sock_no_linger(sock->sk);
 
-	if (so_priority > 0) {
-		ret = kernel_setsockopt(sock, SOL_SOCKET, SO_PRIORITY,
-				(char *)&so_priority, sizeof(so_priority));
-		if (ret)
-			return ret;
-	}
+	if (so_priority > 0)
+		sock_set_priority(sock->sk, so_priority);
 
 	/* Set socket type of service */
 	if (inet->rcv_tos > 0) {
@@ -1638,14 +1634,8 @@ static int nvmet_tcp_add_port(struct nvmet_port *nport)
 		goto err_sock;
 	}
 
-	if (so_priority > 0) {
-		ret = kernel_setsockopt(port->sock, SOL_SOCKET, SO_PRIORITY,
-				(char *)&so_priority, sizeof(so_priority));
-		if (ret) {
-			pr_err("failed to set SO_PRIORITY sock opt %d\n", ret);
-			goto err_sock;
-		}
-	}
+	if (so_priority > 0)
+		sock_set_priority(port->sock->sk, so_priority);
 
 	ret = kernel_bind(port->sock, (struct sockaddr *)&port->addr,
 			sizeof(port->addr));
diff --git a/include/net/sock.h b/include/net/sock.h
index 6ed00bf009bbe..a3a43141a4be2 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2689,6 +2689,7 @@ static inline bool sk_dev_equal_l3scope(struct sock *sk, int dif)
 void sock_def_readable(struct sock *sk);
 
 void sock_no_linger(struct sock *sk);
+void sock_set_priority(struct sock *sk, u32 priority);
 void sock_set_reuseaddr(struct sock *sk);
 
 #endif	/* _SOCK_H */
diff --git a/net/core/sock.c b/net/core/sock.c
index f0f09524911c8..ceda1a9248b3e 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -729,6 +729,14 @@ void sock_no_linger(struct sock *sk)
 }
 EXPORT_SYMBOL(sock_no_linger);
 
+void sock_set_priority(struct sock *sk, u32 priority)
+{
+	lock_sock(sk);
+	sk->sk_priority = priority;
+	release_sock(sk);
+}
+EXPORT_SYMBOL(sock_set_priority);
+
 /*
  *	This is meant for all protocols to use and covers goings on
  *	at the socket level. Everything here is generic.
-- 
2.26.2


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
