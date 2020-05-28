Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8A01E5A40
	for <lists+linux-afs@lfdr.de>; Thu, 28 May 2020 10:04:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lg+DWDllbxt5LRQKYpPj3sos6upWKQT3IELOp6k7LrI=; b=jG29+DS17Cc1h8
	TCyPQzI4LrebCaTPNNKS0b6RdsGFxq/DEc3wCba8TAMGP1tW3PS4iWUqQHDFhMIiKFLmv6E+JH7US
	oEbIBM9wdTlao7YEH0txYlIGzLYIeQths8+goCDZksMPEm/OCEGihYca89NyM2QuQigfRpCf26s6f
	nocglhE3iYb9cYFesAOuxaOHej89c+TLutYQO/iObKQf19jdKrFh8agFbZiy7o3w6WuEicbbydwY6
	1egRtOTZcOncIShapSsIgUXdqvND0DOTVjxWxKCBze2xLT5vIPRP5rK5Gy6C/0yDxyAXLDV8jR5sb
	1HAaDQk6QraZIbennUyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeDWf-0005lW-Um; Thu, 28 May 2020 08:04:29 +0000
Received: from p4fdb1ad2.dip0.t-ipconnect.de ([79.219.26.210] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jeAqZ-0001VO-HO; Thu, 28 May 2020 05:12:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 04/28] net: add sock_set_sndtimeo
Date: Thu, 28 May 2020 07:12:12 +0200
Message-Id: <20200528051236.620353-5-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200528051236.620353-1-hch@lst.de>
References: <20200528051236.620353-1-hch@lst.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 01:04:27 -0700
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
index b801e77e3e596..b4d491122814b 100644
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
index a3a43141a4be2..9a7b9e98685ac 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2691,5 +2691,6 @@ void sock_def_readable(struct sock *sk);
 void sock_no_linger(struct sock *sk);
 void sock_set_priority(struct sock *sk, u32 priority);
 void sock_set_reuseaddr(struct sock *sk);
+void sock_set_sndtimeo(struct sock *sk, s64 secs);
 
 #endif	/* _SOCK_H */
diff --git a/net/core/sock.c b/net/core/sock.c
index ceda1a9248b3e..d3b1d61e4f768 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -737,6 +737,17 @@ void sock_set_priority(struct sock *sk, u32 priority)
 }
 EXPORT_SYMBOL(sock_set_priority);
 
+void sock_set_sndtimeo(struct sock *sk, s64 secs)
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
