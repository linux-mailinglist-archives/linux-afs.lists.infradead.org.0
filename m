Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4651DC233
	for <lists+linux-afs@lfdr.de>; Thu, 21 May 2020 00:38:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rtFP37rv7Rikv4KUtxy5z/E1jHcbgbhn2KB7RbkZjSw=; b=BoRwzwbMU/yTxN
	cFPD9VzTMxPsBpdPGaLhQuRuUTwqx6ICWrq3VkClnthtMJesbYUff7lpzcaENTd0emyu9SHzffaja
	UhoKfqjxwCNrKpEeWxsMDg9yDWrmp6FlseeXHhVDzhIi9cXnQ65deq67JwmyV3i/r5YzhIGTB7x8+
	rTnCBFaO6FbCrjTWdCrn4iT0EqUhP5ZemC+mX/y2XDTvQGf9l+xwIvaQGSuRITs7AmbOfY+SOn8Sl
	Q1scur2RVEO7PwjgHvr6i/9jMaqE3y73kNSFsEaSeykxTIwklxy+PqSnzYtzLr002XRY6ybhtcyVN
	IijIo2cA4wo5P/rJPDtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbXLp-000088-Eu; Wed, 20 May 2020 22:38:13 +0000
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbUoi-0002iL-W4; Wed, 20 May 2020 19:55:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 15/33] tcp: add tcp_sock_set_syncnt
Date: Wed, 20 May 2020 21:54:51 +0200
Message-Id: <20200520195509.2215098-16-hch@lst.de>
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

Add a helper to directly set the TCP_SYNCNT sockopt from kernel space
without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/host/tcp.c |  9 +--------
 include/linux/tcp.h     |  1 +
 net/ipv4/tcp.c          | 12 ++++++++++++
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 4e4a750ecdb97..2872584f52f63 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1336,14 +1336,7 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl,
 	}
 
 	/* Single syn retry */
-	opt = 1;
-	ret = kernel_setsockopt(queue->sock, IPPROTO_TCP, TCP_SYNCNT,
-			(char *)&opt, sizeof(opt));
-	if (ret) {
-		dev_err(nctrl->device,
-			"failed to set TCP_SYNCNT sock opt %d\n", ret);
-		goto err_sock;
-	}
+	tcp_sock_set_syncnt(queue->sock->sk, 1);
 
 	/* Set TCP no delay */
 	tcp_sock_set_nodelay(queue->sock->sk);
diff --git a/include/linux/tcp.h b/include/linux/tcp.h
index 2eaf8320b9db0..6aa4ae5ebf3d5 100644
--- a/include/linux/tcp.h
+++ b/include/linux/tcp.h
@@ -500,5 +500,6 @@ int tcp_skb_shift(struct sk_buff *to, struct sk_buff *from, int pcount,
 void tcp_sock_set_cork(struct sock *sk, bool on);
 void tcp_sock_set_nodelay(struct sock *sk);
 void tcp_sock_set_quickack(struct sock *sk, int val);
+int tcp_sock_set_syncnt(struct sock *sk, int val);
 
 #endif	/* _LINUX_TCP_H */
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 27b5e7a4e2ef9..d2c67ae1da07a 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2881,6 +2881,18 @@ void tcp_sock_set_quickack(struct sock *sk, int val)
 }
 EXPORT_SYMBOL(tcp_sock_set_quickack);
 
+int tcp_sock_set_syncnt(struct sock *sk, int val)
+{
+	if (val < 1 || val > MAX_TCP_SYNCNT)
+		return -EINVAL;
+
+	lock_sock(sk);
+	inet_csk(sk)->icsk_syn_retries = val;
+	release_sock(sk);
+	return 0;
+}
+EXPORT_SYMBOL(tcp_sock_set_syncnt);
+
 /*
  *	Socket option code for TCP.
  */
-- 
2.26.2


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
