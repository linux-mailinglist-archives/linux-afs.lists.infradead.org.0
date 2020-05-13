Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D471D13C2
	for <lists+linux-afs@lfdr.de>; Wed, 13 May 2020 15:01:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ySU96d7KsufAcc/2G7XEhN2YE67fuQiYWeNTH+cH3h8=; b=kMjuAgzZvACwcs
	qUDDcj96TSEmdUA7XAB0HAn4hyu59JdSaD7nnkbui7GvU034zO5rZTn8dKi1vQDnzK5QCHYNTQKLJ
	q+Chebs+j1KzJRcDWgq1tR5muxZulPgz+MFSIjXKj3zRKQK1KoM0kjGPkzL/VE+YMCIughGqc5Tv1
	+BHyhUXOZwoolABD8JCrGgh1ir3scylYAK6okrnR1Y51GtZ9o/y3LBVVMp5R1SZ4zMxrBZze9rNQr
	zsy/MUkVixWysFoYJCs5TfO53mOsEBjvv0J0HWHtgH0CQHL4PA7KEACfTWl//7F/VP+lbqhDegqdJ
	Rf6DC6p7qPCYRM5PQesQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYr0H-0007vE-H3; Wed, 13 May 2020 13:00:53 +0000
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYkr8-0003s6-TG; Wed, 13 May 2020 06:27:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 04/33] net: add sock_set_sndtimeo
Date: Wed, 13 May 2020 08:26:19 +0200
Message-Id: <20200513062649.2100053-5-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513062649.2100053-1-hch@lst.de>
References: <20200513062649.2100053-1-hch@lst.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 May 2020 05:59:43 -0700
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

Add a helper to directly set the SO_SNDTIMEO_NEW sockopt from kernel
space without going through a fake uaccess.  The interface is
simplified to only pass the seconds value, as that is the only
thing needed at the moment.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/dlm/lowcomms.c  |  8 ++------
 include/net/sock.h |  1 +
 net/core/sock.c    | 11 +++++++++++
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 48e7ba796c6fb..0c0a6413fdfcc 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1035,7 +1035,6 @@ static void sctp_connect_to_sock(struct connection *con)
 	int result;
 	int addr_len;
 	struct socket *sock;
-	struct __kernel_sock_timeval tv = { .tv_sec = 5, .tv_usec = 0 };
 
 	if (con->nodeid == 0) {
 		log_print("attempt to connect sock 0 foiled");
@@ -1087,13 +1086,10 @@ static void sctp_connect_to_sock(struct connection *con)
 	 * since O_NONBLOCK argument in connect() function does not work here,
 	 * then, we should restore the default value of this attribute.
 	 */
-	kernel_setsockopt(sock, SOL_SOCKET, SO_SNDTIMEO_NEW, (char *)&tv,
-			  sizeof(tv));
+	sock_set_sndtimeo(sock->sk, 5);
 	result = sock->ops->connect(sock, (struct sockaddr *)&daddr, addr_len,
 				   0);
-	memset(&tv, 0, sizeof(tv));
-	kernel_setsockopt(sock, SOL_SOCKET, SO_SNDTIMEO_NEW, (char *)&tv,
-			  sizeof(tv));
+	sock_set_sndtimeo(sock->sk, 0);
 
 	if (result == -EINPROGRESS)
 		result = 0;
diff --git a/include/net/sock.h b/include/net/sock.h
index cce11782dc295..809596ffd32d2 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2690,5 +2690,6 @@ void sock_def_readable(struct sock *sk);
 void sock_set_reuseaddr(struct sock *sk, unsigned char reuse);
 void sock_set_linger(struct sock *sk, bool onoff, unsigned int linger);
 void sock_set_priority(struct sock *sk, u32 priority);
+void sock_set_sndtimeo(struct sock *sk, unsigned int secs);
 
 #endif	/* _SOCK_H */
diff --git a/net/core/sock.c b/net/core/sock.c
index e9f1e2247b004..76527681e50b9 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -752,6 +752,17 @@ void sock_set_priority(struct sock *sk, u32 priority)
 }
 EXPORT_SYMBOL(sock_set_priority);
 
+void sock_set_sndtimeo(struct sock *sk, unsigned int secs)
+{
+	lock_sock(sk);
+	if (secs && secs < MAX_SCHEDULE_TIMEOUT / HZ - 1)
+		sk->sk_sndtimeo = secs * HZ;
+	else
+		sk->sk_sndtimeo = MAX_SCHEDULE_TIMEOUT;
+	release_sock(sk);
+}
+EXPORT_SYMBOL(sock_set_sndtimeo);
+
 /*
  *	This is meant for all protocols to use and covers goings on
  *	at the socket level. Everything here is generic.
-- 
2.26.2


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
