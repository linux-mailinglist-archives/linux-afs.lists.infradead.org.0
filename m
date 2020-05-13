Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E26C21D1747
	for <lists+linux-afs@lfdr.de>; Wed, 13 May 2020 16:15:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=knFu4DEeiJknBXf+I9/AK9qvZFxMuHTYRRTVHE0v5MY=; b=m/vg8LR5ZsVBsE
	QMA6qOlQr2yGJQB54+6/EdTzwbLw4m6msHDQr2MJ58U1vw5leBUl93i3tuAPpnHX4QdT0mrHxiO4Q
	PdghCvl0tsKqZgwBeHCG6lTOnLgrZp5F4XmEufdZ9CraMXu1ahk3eeAThjyNhr2x18ewfYF/Td2UL
	2r0qPbA+kzMVJFpSc9OS8Sn6n7ecKyLO03LAgZ/sgluAENTHYgt+39WH1P+VE7zkzONdSlXBre5Eh
	ndS32wfojI0zH19ACo7NBxD4uHgHSpSpKfyHeQ72tCPx2SApZxebJ4CsB1WIIxSfJwI/lRi4nP++a
	DsGa1z58M70GY1UX6+PA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYsAi-0006WA-R2; Wed, 13 May 2020 14:15:44 +0000
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYksU-0005Dh-Pl; Wed, 13 May 2020 06:28:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 31/33] net: remove kernel_setsockopt
Date: Wed, 13 May 2020 08:26:46 +0200
Message-Id: <20200513062649.2100053-32-hch@lst.de>
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

No users left.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/net.h |  2 --
 net/socket.c        | 31 -------------------------------
 2 files changed, 33 deletions(-)

diff --git a/include/linux/net.h b/include/linux/net.h
index 6451425e828f5..ece7513326293 100644
--- a/include/linux/net.h
+++ b/include/linux/net.h
@@ -305,8 +305,6 @@ int kernel_getsockname(struct socket *sock, struct sockaddr *addr);
 int kernel_getpeername(struct socket *sock, struct sockaddr *addr);
 int kernel_getsockopt(struct socket *sock, int level, int optname, char *optval,
 		      int *optlen);
-int kernel_setsockopt(struct socket *sock, int level, int optname, char *optval,
-		      unsigned int optlen);
 int kernel_sendpage(struct socket *sock, struct page *page, int offset,
 		    size_t size, int flags);
 int kernel_sendpage_locked(struct sock *sk, struct page *page, int offset,
diff --git a/net/socket.c b/net/socket.c
index 1c9a7260a41de..f37c3ef508691 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -3749,37 +3749,6 @@ int kernel_getsockopt(struct socket *sock, int level, int optname,
 }
 EXPORT_SYMBOL(kernel_getsockopt);
 
-/**
- *	kernel_setsockopt - set a socket option (kernel space)
- *	@sock: socket
- *	@level: API level (SOL_SOCKET, ...)
- *	@optname: option tag
- *	@optval: option value
- *	@optlen: option length
- *
- *	Returns 0 or an error.
- */
-
-int kernel_setsockopt(struct socket *sock, int level, int optname,
-			char *optval, unsigned int optlen)
-{
-	mm_segment_t oldfs = get_fs();
-	char __user *uoptval;
-	int err;
-
-	uoptval = (char __user __force *) optval;
-
-	set_fs(KERNEL_DS);
-	if (level == SOL_SOCKET)
-		err = sock_setsockopt(sock, level, optname, uoptval, optlen);
-	else
-		err = sock->ops->setsockopt(sock, level, optname, uoptval,
-					    optlen);
-	set_fs(oldfs);
-	return err;
-}
-EXPORT_SYMBOL(kernel_setsockopt);
-
 /**
  *	kernel_sendpage - send a &page through a socket (kernel space)
  *	@sock: socket
-- 
2.26.2


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
