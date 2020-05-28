Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C61E41E5A3E
	for <lists+linux-afs@lfdr.de>; Thu, 28 May 2020 10:04:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E5Bji0OxbJi9NFcAKs+bplgQgi4jUHCKPAv/kYvKq+I=; b=jid8EDITXAsoxG
	fzmjQPBrm6p9pChXe9KTAuQGt6zfT76NnR098zZXV2X3gj8pi4ZkAZs5m/1UCq2WdBt4NguVOkNa2
	D0z8mm/nj0K2uZ8L45ZsoeNDNyxmqWyiqJ1UROBTxGEa/Rb1Exp25j1bi7lm9Ak9bX+Nwk/JvZjWd
	IYp3ldx5wHYz2Xs6qOuViXYt2ZkhN7RZ0PhW6+XeuVSam3Y/s4DNMx8nlw6WlF28GYvGylxgwA8zP
	5YqGJk+GBZbrC34ZGsuLi21XCl8RnR//BhsBfl23V3us4nMGuhaEctSItPgDk/UqbMlnJ4eG2wEzp
	Uucx0etgexD0M9ecwcSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeDWh-0005mz-2p; Thu, 28 May 2020 08:04:31 +0000
Received: from p4fdb1ad2.dip0.t-ipconnect.de ([79.219.26.210] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jeAqg-0001fT-LD; Thu, 28 May 2020 05:13:00 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 06/28] net: add sock_enable_timestamps
Date: Thu, 28 May 2020 07:12:14 +0200
Message-Id: <20200528051236.620353-7-hch@lst.de>
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

Add a helper to directly enable timestamps instead of setting the
SO_TIMESTAMP* sockopts from kernel space and going through a fake
uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/net/sock.h       |  1 +
 net/core/sock.c          | 47 +++++++++++++++++++++++++---------------
 net/rxrpc/local_object.c |  8 +------
 3 files changed, 31 insertions(+), 25 deletions(-)

diff --git a/include/net/sock.h b/include/net/sock.h
index cdec7bc055d5b..99ef43508d2b5 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2689,6 +2689,7 @@ static inline bool sk_dev_equal_l3scope(struct sock *sk, int dif)
 void sock_def_readable(struct sock *sk);
 
 int sock_bindtoindex(struct sock *sk, int ifindex);
+void sock_enable_timestamps(struct sock *sk);
 void sock_no_linger(struct sock *sk);
 void sock_set_priority(struct sock *sk, u32 priority);
 void sock_set_reuseaddr(struct sock *sk);
diff --git a/net/core/sock.c b/net/core/sock.c
index 23f80880fbb2c..e4a4dd2b3d8b3 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -757,6 +757,28 @@ void sock_set_sndtimeo(struct sock *sk, s64 secs)
 }
 EXPORT_SYMBOL(sock_set_sndtimeo);
 
+static void __sock_set_timestamps(struct sock *sk, bool val, bool new, bool ns)
+{
+	if (val)  {
+		sock_valbool_flag(sk, SOCK_TSTAMP_NEW, new);
+		sock_valbool_flag(sk, SOCK_RCVTSTAMPNS, ns);
+		sock_set_flag(sk, SOCK_RCVTSTAMP);
+		sock_enable_timestamp(sk, SOCK_TIMESTAMP);
+	} else {
+		sock_reset_flag(sk, SOCK_RCVTSTAMP);
+		sock_reset_flag(sk, SOCK_RCVTSTAMPNS);
+		sock_reset_flag(sk, SOCK_TSTAMP_NEW);
+	}
+}
+
+void sock_enable_timestamps(struct sock *sk)
+{
+	lock_sock(sk);
+	__sock_set_timestamps(sk, true, false, true);
+	release_sock(sk);
+}
+EXPORT_SYMBOL(sock_enable_timestamps);
+
 /*
  *	This is meant for all protocols to use and covers goings on
  *	at the socket level. Everything here is generic.
@@ -948,28 +970,17 @@ int sock_setsockopt(struct socket *sock, int level, int optname,
 		break;
 
 	case SO_TIMESTAMP_OLD:
+		__sock_set_timestamps(sk, valbool, false, false);
+		break;
 	case SO_TIMESTAMP_NEW:
+		__sock_set_timestamps(sk, valbool, true, false);
+		break;
 	case SO_TIMESTAMPNS_OLD:
+		__sock_set_timestamps(sk, valbool, false, true);
+		break;
 	case SO_TIMESTAMPNS_NEW:
-		if (valbool)  {
-			if (optname == SO_TIMESTAMP_NEW || optname == SO_TIMESTAMPNS_NEW)
-				sock_set_flag(sk, SOCK_TSTAMP_NEW);
-			else
-				sock_reset_flag(sk, SOCK_TSTAMP_NEW);
-
-			if (optname == SO_TIMESTAMP_OLD || optname == SO_TIMESTAMP_NEW)
-				sock_reset_flag(sk, SOCK_RCVTSTAMPNS);
-			else
-				sock_set_flag(sk, SOCK_RCVTSTAMPNS);
-			sock_set_flag(sk, SOCK_RCVTSTAMP);
-			sock_enable_timestamp(sk, SOCK_TIMESTAMP);
-		} else {
-			sock_reset_flag(sk, SOCK_RCVTSTAMP);
-			sock_reset_flag(sk, SOCK_RCVTSTAMPNS);
-			sock_reset_flag(sk, SOCK_TSTAMP_NEW);
-		}
+		__sock_set_timestamps(sk, valbool, true, true);
 		break;
-
 	case SO_TIMESTAMPING_NEW:
 		sock_set_flag(sk, SOCK_TSTAMP_NEW);
 		/* fall through */
diff --git a/net/rxrpc/local_object.c b/net/rxrpc/local_object.c
index 01135e54d95d2..5ea2bd01fdd59 100644
--- a/net/rxrpc/local_object.c
+++ b/net/rxrpc/local_object.c
@@ -189,13 +189,7 @@ static int rxrpc_open_socket(struct rxrpc_local *local, struct net *net)
 		}
 
 		/* We want receive timestamps. */
-		opt = 1;
-		ret = kernel_setsockopt(local->socket, SOL_SOCKET, SO_TIMESTAMPNS_OLD,
-					(char *)&opt, sizeof(opt));
-		if (ret < 0) {
-			_debug("setsockopt failed");
-			goto error;
-		}
+		sock_enable_timestamps(local->socket->sk);
 		break;
 
 	default:
-- 
2.26.2


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
