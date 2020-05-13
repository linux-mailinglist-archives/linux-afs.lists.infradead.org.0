Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B651D13D9
	for <lists+linux-afs@lfdr.de>; Wed, 13 May 2020 15:01:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7iKXjQ4Sd3WFruIjYaM9PRar2YOL1VE5h4tnHntXwmE=; b=KxsxiGHVqj1oc2
	eGa5ZiczZXFsGjbx0P79E4pbzjP3OrKC4b02HQwP7xFXtW5vjxvbrz30wrlAZ1AM4JtsBQpdXLWkJ
	sKHPR4EIDrS4vNJ5sp8aD2TyUHT1ZCFD2kXxO41MERusDdjzdJ+akAQfQTe8koBW7wpSlf6Oub9fB
	tuK2IsNMbgmPQDIjUbhHILxvnMGOvlC1uJxJbvQQo4Gq4zenqqQyebX2l0qL8LYKiXG+Ey7USQ0jR
	pg0kmQ0BZi3v1gSSt8KuX4cJlyvUb+13frd3kLZxHKjR4i7L3YHYeqO6Kqbzmf7JEo0kISU5vEAdI
	lhk0apzCOmb/DRlbrouw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYr0h-0008Vk-FJ; Wed, 13 May 2020 13:01:19 +0000
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYksI-000522-Iw; Wed, 13 May 2020 06:28:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 27/33] sctp: export sctp_setsockopt_bindx
Date: Wed, 13 May 2020 08:26:42 +0200
Message-Id: <20200513062649.2100053-28-hch@lst.de>
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

And call it directly from dlm instead of going through kernel_setsockopt.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/dlm/lowcomms.c       | 13 ++++++++-----
 include/net/sctp/sctp.h |  3 +++
 net/sctp/socket.c       |  5 +++--
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index b722a09a7ca05..e4939d770df53 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1005,14 +1005,17 @@ static int sctp_bind_addrs(struct connection *con, uint16_t port)
 		memcpy(&localaddr, dlm_local_addr[i], sizeof(localaddr));
 		make_sockaddr(&localaddr, port, &addr_len);
 
-		if (!i)
+		if (!i) {
 			result = kernel_bind(con->sock,
 					     (struct sockaddr *)&localaddr,
 					     addr_len);
-		else
-			result = kernel_setsockopt(con->sock, SOL_SCTP,
-						   SCTP_SOCKOPT_BINDX_ADD,
-						   (char *)&localaddr, addr_len);
+		} else {
+			lock_sock(con->sock->sk);
+			result = sctp_setsockopt_bindx(con->sock->sk,
+					(struct sockaddr *)&localaddr, addr_len,
+					SCTP_BINDX_ADD_ADDR);
+			release_sock(con->sock->sk);
+		}
 
 		if (result < 0) {
 			log_print("Can't bind to %d addr number %d, %d.\n",
diff --git a/include/net/sctp/sctp.h b/include/net/sctp/sctp.h
index 3ab5c6bbb90bd..f702b14d768ba 100644
--- a/include/net/sctp/sctp.h
+++ b/include/net/sctp/sctp.h
@@ -615,4 +615,7 @@ static inline bool sctp_newsk_ready(const struct sock *sk)
 	return sock_flag(sk, SOCK_DEAD) || sk->sk_socket;
 }
 
+int sctp_setsockopt_bindx(struct sock *sk, struct sockaddr *kaddrs,
+		int addrs_size, int op);
+
 #endif /* __net_sctp_h__ */
diff --git a/net/sctp/socket.c b/net/sctp/socket.c
index 1c96b52c4aa28..30c981d9f6158 100644
--- a/net/sctp/socket.c
+++ b/net/sctp/socket.c
@@ -979,8 +979,8 @@ int sctp_asconf_mgmt(struct sctp_sock *sp, struct sctp_sockaddr_entry *addrw)
  *
  * Returns 0 if ok, <0 errno code on error.
  */
-static int sctp_setsockopt_bindx(struct sock *sk, struct sockaddr *kaddrs,
-				 int addrs_size, int op)
+int sctp_setsockopt_bindx(struct sock *sk, struct sockaddr *kaddrs,
+		int addrs_size, int op)
 {
 	int err;
 	int addrcnt = 0;
@@ -1032,6 +1032,7 @@ static int sctp_setsockopt_bindx(struct sock *sk, struct sockaddr *kaddrs,
 		return -EINVAL;
 	}
 }
+EXPORT_SYMBOL(sctp_setsockopt_bindx);
 
 static int sctp_connect_new_asoc(struct sctp_endpoint *ep,
 				 const union sctp_addr *daddr,
-- 
2.26.2


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
