Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 077F61D13C3
	for <lists+linux-afs@lfdr.de>; Wed, 13 May 2020 15:01:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tz8J4c8jrV7xDBb22p6EcyLrd9PH3GrQZ6tRJMpAFio=; b=Wc8Dnebq1YQ6nF
	mcAO10F7XeOgopuyNsC40qXfOZfmRNai/7INJQkSjNgiMGbhUCuaxQoAzu1mBZAySA13PqKFy3bhJ
	6uPXpWskcg7L+rZMbDztPk989/wP4yKoA/9x+0v3aLgQTU/FW0k978LHSLAjYPhNSMWt3uaYf/cN9
	OIji1jVD3aS7u0gnLSf9OVYtfoj8iGLoG/hdibSMcHDQpPn6MzmvLGgIqPVbtYR1OFDr8UmmEPch0
	pXq5bjC0bzT4U31jkjd3qd7C81KA1fK4X23a+/iEpqb1AadaXn7EU1K05vFuG8s1yZVAmbv7yQtir
	VxqLrjLM5ADhab9NLRDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYr0L-00080Q-6Z; Wed, 13 May 2020 13:00:57 +0000
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYkrL-000471-Cn; Wed, 13 May 2020 06:27:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 08/33] net: add sock_set_rcvbuf
Date: Wed, 13 May 2020 08:26:23 +0200
Message-Id: <20200513062649.2100053-9-hch@lst.de>
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

Add a helper to directly set the SO_RCVBUFFORCE sockopt from kernel space
without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/dlm/lowcomms.c  |  7 +-----
 include/net/sock.h |  1 +
 net/core/sock.c    | 59 +++++++++++++++++++++++++---------------------
 3 files changed, 34 insertions(+), 33 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 16d616c180613..223c185ecd0c7 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1297,7 +1297,6 @@ static int sctp_listen_for_all(void)
 	struct socket *sock = NULL;
 	int result = -EINVAL;
 	struct connection *con = nodeid2con(0, GFP_NOFS);
-	int bufsize = NEEDED_RMEM;
 	int one = 1;
 
 	if (!con)
@@ -1312,11 +1311,7 @@ static int sctp_listen_for_all(void)
 		goto out;
 	}
 
-	result = kernel_setsockopt(sock, SOL_SOCKET, SO_RCVBUFFORCE,
-				 (char *)&bufsize, sizeof(bufsize));
-	if (result)
-		log_print("Error increasing buffer space on socket %d", result);
-
+	sock_set_rcvbuf(sock->sk, NEEDED_RMEM);
 	result = kernel_setsockopt(sock, SOL_SCTP, SCTP_NODELAY, (char *)&one,
 				   sizeof(one));
 	if (result < 0)
diff --git a/include/net/sock.h b/include/net/sock.h
index 4cedde585424f..e1ed40ff01312 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2692,6 +2692,7 @@ void sock_set_linger(struct sock *sk, bool onoff, unsigned int linger);
 void sock_set_priority(struct sock *sk, u32 priority);
 void sock_set_sndtimeo(struct sock *sk, unsigned int secs);
 void sock_set_keepalive(struct sock *sk, bool keepalive);
+void sock_set_rcvbuf(struct sock *sk, int val);
 int sock_bindtoindex(struct sock *sk, int ifindex);
 void sock_set_timestamps(struct sock *sk, bool val, bool new, bool ns);
 
diff --git a/net/core/sock.c b/net/core/sock.c
index dfd2b839f88bb..6af01b757cf24 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -804,6 +804,35 @@ void sock_set_keepalive(struct sock *sk, bool keepalive)
 }
 EXPORT_SYMBOL(sock_set_keepalive);
 
+void __sock_set_rcvbuf(struct sock *sk, int val)
+{
+	/* Ensure val * 2 fits into an int, to prevent max_t() from treating it
+	 * as a negative value.
+	 */
+	val = min_t(int, val, INT_MAX / 2);
+	sk->sk_userlocks |= SOCK_RCVBUF_LOCK;
+
+	/* We double it on the way in to account for "struct sk_buff" etc.
+	 * overhead.   Applications assume that the SO_RCVBUF setting they make
+	 * will allow that much actual data to be received on that socket.
+	 *
+	 * Applications are unaware that "struct sk_buff" and other overheads
+	 * allocate from the receive buffer during socket buffer allocation.
+	 *
+	 * And after considering the possible alternatives, returning the value
+	 * we actually used in getsockopt is the most desirable behavior.
+	 */
+	WRITE_ONCE(sk->sk_rcvbuf, max_t(int, val * 2, SOCK_MIN_RCVBUF));
+}
+
+void sock_set_rcvbuf(struct sock *sk, int val)
+{
+	lock_sock(sk);
+	__sock_set_rcvbuf(sk, val);
+	release_sock(sk);
+}
+EXPORT_SYMBOL(sock_set_rcvbuf);
+
 /*
  *	This is meant for all protocols to use and covers goings on
  *	at the socket level. Everything here is generic.
@@ -900,30 +929,7 @@ int sock_setsockopt(struct socket *sock, int level, int optname,
 		 * play 'guess the biggest size' games. RCVBUF/SNDBUF
 		 * are treated in BSD as hints
 		 */
-		val = min_t(u32, val, sysctl_rmem_max);
-set_rcvbuf:
-		/* Ensure val * 2 fits into an int, to prevent max_t()
-		 * from treating it as a negative value.
-		 */
-		val = min_t(int, val, INT_MAX / 2);
-		sk->sk_userlocks |= SOCK_RCVBUF_LOCK;
-		/*
-		 * We double it on the way in to account for
-		 * "struct sk_buff" etc. overhead.   Applications
-		 * assume that the SO_RCVBUF setting they make will
-		 * allow that much actual data to be received on that
-		 * socket.
-		 *
-		 * Applications are unaware that "struct sk_buff" and
-		 * other overheads allocate from the receive buffer
-		 * during socket buffer allocation.
-		 *
-		 * And after considering the possible alternatives,
-		 * returning the value we actually used in getsockopt
-		 * is the most desirable behavior.
-		 */
-		WRITE_ONCE(sk->sk_rcvbuf,
-			   max_t(int, val * 2, SOCK_MIN_RCVBUF));
+		__sock_set_rcvbuf(sk, min_t(u32, val, sysctl_rmem_max));
 		break;
 
 	case SO_RCVBUFFORCE:
@@ -935,9 +941,8 @@ int sock_setsockopt(struct socket *sock, int level, int optname,
 		/* No negative values (to prevent underflow, as val will be
 		 * multiplied by 2).
 		 */
-		if (val < 0)
-			val = 0;
-		goto set_rcvbuf;
+		__sock_set_rcvbuf(sk, max(val, 0));
+		break;
 
 	case SO_KEEPALIVE:
 		if (sk->sk_prot->keepalive)
-- 
2.26.2


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
