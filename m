Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DC02E1E5A54
	for <lists+linux-afs@lfdr.de>; Thu, 28 May 2020 10:05:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NqwqeDa1mMybktktvghau3LDnR5ZQ7/D8sQ3CGqxM8Q=; b=Lwa8m3aFIF3DUR
	gBIUsUW2V+1OcIP0NjbLMJuNEBs9iLuzinQ8Qo2wYpgX/tV217Yz3Cs/tV3aj3F3tafHwnqL0vEsG
	m0v+MvqcZQqRZUev8HVzc+9ceeI1P1hslEE7ZG3XKXhm7n2GtkCElAp6JJZht2kQjyeYR/16nMlWu
	S7MvhL9XgaSai2vxE1F2JWKC7bKfR+d/0BVGstSgbxrlb/QOInhek4z7p+ol+RbuVv/N2YkJje3g6
	9m6rEo63ID+X+EdrT4OC4xhPlSORK37wLCOZmO6CsmaSfR42Zi0k4zh8h303UvLSo7da+z2Lusibs
	5OY3EqrGrZMNyC9X3ujQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeDX6-0006Ev-Sa; Thu, 28 May 2020 08:04:56 +0000
Received: from p4fdb1ad2.dip0.t-ipconnect.de ([79.219.26.210] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jeArn-0002d8-7k; Thu, 28 May 2020 05:14:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 27/28] rxrpc: add rxrpc_sock_set_min_security_level
Date: Thu, 28 May 2020 07:12:35 +0200
Message-Id: <20200528051236.620353-28-hch@lst.de>
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
 linux-nfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Ying Xue <ying.xue@windriver.com>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org,
 ocfs2-devel@oss.oracle.com, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Add a helper to directly set the RXRPC_MIN_SECURITY_LEVEL sockopt from
kernel space without going through a fake uaccess.

Thanks to David Howells for the documentation updates.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: David Howells <dhowells@redhat.com>
---
 Documentation/networking/rxrpc.rst | 13 +++++++++++--
 fs/afs/rxrpc.c                     |  6 ++----
 include/net/af_rxrpc.h             |  2 ++
 net/rxrpc/af_rxrpc.c               | 13 +++++++++++++
 4 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/Documentation/networking/rxrpc.rst b/Documentation/networking/rxrpc.rst
index 5ad35113d0f46..68552b92dc442 100644
--- a/Documentation/networking/rxrpc.rst
+++ b/Documentation/networking/rxrpc.rst
@@ -477,7 +477,7 @@ AF_RXRPC sockets support a few socket options at the SOL_RXRPC level:
 	 Encrypted checksum plus packet padded and first eight bytes of packet
 	 encrypted - which includes the actual packet length.
 
-     (c) RXRPC_SECURITY_ENCRYPTED
+     (c) RXRPC_SECURITY_ENCRYPT
 
 	 Encrypted checksum plus entire packet padded and encrypted, including
 	 actual packet length.
@@ -578,7 +578,7 @@ A client would issue an operation by:
      This issues a request_key() to get the key representing the security
      context.  The minimum security level can be set::
 
-	unsigned int sec = RXRPC_SECURITY_ENCRYPTED;
+	unsigned int sec = RXRPC_SECURITY_ENCRYPT;
 	setsockopt(client, SOL_RXRPC, RXRPC_MIN_SECURITY_LEVEL,
 		   &sec, sizeof(sec));
 
@@ -1090,6 +1090,15 @@ The kernel interface functions are as follows:
      jiffies).  In the event of the timeout occurring, the call will be
      aborted and -ETIME or -ETIMEDOUT will be returned.
 
+ (#) Apply the RXRPC_MIN_SECURITY_LEVEL sockopt to a socket from within in the
+     kernel::
+
+       int rxrpc_sock_set_min_security_level(struct sock *sk,
+					     unsigned int val);
+
+     This specifies the minimum security level required for calls on this
+     socket.
+
 
 Configurable Parameters
 =======================
diff --git a/fs/afs/rxrpc.c b/fs/afs/rxrpc.c
index 1ecc67da6c1a4..e313dae01674f 100644
--- a/fs/afs/rxrpc.c
+++ b/fs/afs/rxrpc.c
@@ -37,7 +37,6 @@ int afs_open_socket(struct afs_net *net)
 {
 	struct sockaddr_rxrpc srx;
 	struct socket *socket;
-	unsigned int min_level;
 	int ret;
 
 	_enter("");
@@ -57,9 +56,8 @@ int afs_open_socket(struct afs_net *net)
 	srx.transport.sin6.sin6_family	= AF_INET6;
 	srx.transport.sin6.sin6_port	= htons(AFS_CM_PORT);
 
-	min_level = RXRPC_SECURITY_ENCRYPT;
-	ret = kernel_setsockopt(socket, SOL_RXRPC, RXRPC_MIN_SECURITY_LEVEL,
-				(void *)&min_level, sizeof(min_level));
+	ret = rxrpc_sock_set_min_security_level(socket->sk,
+						RXRPC_SECURITY_ENCRYPT);
 	if (ret < 0)
 		goto error_2;
 
diff --git a/include/net/af_rxrpc.h b/include/net/af_rxrpc.h
index ab988940bf045..91eacbdcf33d2 100644
--- a/include/net/af_rxrpc.h
+++ b/include/net/af_rxrpc.h
@@ -72,4 +72,6 @@ bool rxrpc_kernel_call_is_complete(struct rxrpc_call *);
 void rxrpc_kernel_set_max_life(struct socket *, struct rxrpc_call *,
 			       unsigned long);
 
+int rxrpc_sock_set_min_security_level(struct sock *sk, unsigned int val);
+
 #endif /* _NET_RXRPC_H */
diff --git a/net/rxrpc/af_rxrpc.c b/net/rxrpc/af_rxrpc.c
index 15ee92d795815..394189b81849f 100644
--- a/net/rxrpc/af_rxrpc.c
+++ b/net/rxrpc/af_rxrpc.c
@@ -571,6 +571,19 @@ static int rxrpc_sendmsg(struct socket *sock, struct msghdr *m, size_t len)
 	return ret;
 }
 
+int rxrpc_sock_set_min_security_level(struct sock *sk, unsigned int val)
+{
+	if (sk->sk_state != RXRPC_UNBOUND)
+		return -EISCONN;
+	if (val > RXRPC_SECURITY_MAX)
+		return -EINVAL;
+	lock_sock(sk);
+	rxrpc_sk(sk)->min_sec_level = val;
+	release_sock(sk);
+	return 0;
+}
+EXPORT_SYMBOL(rxrpc_sock_set_min_security_level);
+
 /*
  * set RxRPC socket options
  */
-- 
2.26.2


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
