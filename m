Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B46CDF01
	for <lists+linux-afs@lfdr.de>; Mon,  7 Oct 2019 12:16:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PEiVzWANPoDzP/3K9EkJDq7O9tUNCQrrlk8sx1UQ3f8=; b=tbmT+YWsKdLazn
	ExdXzAIrC+3d8AcaLz1b+6reAgihgl3JWoEPyNEmn7vNDOz6MO2v5ZeW2kS62fthyc6c5lGUTH1/H
	3cdnJPOpQC/swkZcaot/IOnDUK9YsN7x4iNp3CQ11i1wm8wT19jKHhxVYj106zLHxynEFC1DXxV8t
	YJ3Uaku66re3+/oxYrxZGxjyGYeeUKiHZ22xn36NmseZhFz8n6DJBbSwtvNfCCKJ0yS3FgzWtIsEp
	mNW6QgUSq8NCDORn3u38hcigc+lNmYkJ4zTnmO1nd68pUGrTGWECg07y6Guf7mAp9x2mJe+caeuoZ
	qCaNMOL0jRDxHV/Sxekw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHQ41-0002Kw-0V; Mon, 07 Oct 2019 10:16:25 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHQ3x-0002K8-Ek
 for linux-afs@lists.infradead.org; Mon, 07 Oct 2019 10:16:23 +0000
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2EB3618C8907;
 Mon,  7 Oct 2019 10:16:21 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-125-72.rdu2.redhat.com
 [10.10.125.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 313F35D9CC;
 Mon,  7 Oct 2019 10:16:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 6/6] rxrpc: Fix call crypto state cleanup
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Mon, 07 Oct 2019 11:16:19 +0100
Message-ID: <157044337944.32635.18243892067759177258.stgit@warthog.procyon.org.uk>
In-Reply-To: <157044333551.32635.10133219357337058780.stgit@warthog.procyon.org.uk>
References: <157044333551.32635.10133219357337058780.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Mon, 07 Oct 2019 10:16:21 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_031621_546545_8334C3E8 
X-CRM114-Status: GOOD (  18.95  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Fix the cleanup of the crypto state on a call after the call has been
disconnected.  As the call has been disconnected, its connection ref has
been discarded and so we can't go through that to get to the security ops
table.

Fix this by caching the security ops pointer in the rxrpc_call struct and
using that when freeing the call security state.  Also use this in other
places we're dealing with call-specific security.

The symptoms look like:

    BUG: KASAN: use-after-free in rxrpc_release_call+0xb2d/0xb60
    net/rxrpc/call_object.c:481
    Read of size 8 at addr ffff888062ffeb50 by task syz-executor.5/4764

Fixes: 1db88c534371 ("rxrpc: Fix -Wframe-larger-than= warnings from on-stack crypto")
Reported-by: syzbot+eed305768ece6682bb7f@syzkaller.appspotmail.com
Signed-off-by: David Howells <dhowells@redhat.com>
---

 net/rxrpc/ar-internal.h |    1 +
 net/rxrpc/call_accept.c |    1 +
 net/rxrpc/call_object.c |    6 +++---
 net/rxrpc/conn_client.c |    3 +++
 net/rxrpc/recvmsg.c     |    6 +++---
 net/rxrpc/sendmsg.c     |    2 +-
 6 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index 1091bf35a199..ecc17dabec8f 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -556,6 +556,7 @@ struct rxrpc_call {
 	struct rxrpc_peer	*peer;		/* Peer record for remote address */
 	struct rxrpc_sock __rcu	*socket;	/* socket responsible */
 	struct rxrpc_net	*rxnet;		/* Network namespace to which call belongs */
+	const struct rxrpc_security *security;	/* applied security module */
 	struct mutex		user_mutex;	/* User access mutex */
 	unsigned long		ack_at;		/* When deferred ACK needs to happen */
 	unsigned long		ack_lost_at;	/* When ACK is figured as lost */
diff --git a/net/rxrpc/call_accept.c b/net/rxrpc/call_accept.c
index 1f778102ed8d..135bf5cd8dd5 100644
--- a/net/rxrpc/call_accept.c
+++ b/net/rxrpc/call_accept.c
@@ -307,6 +307,7 @@ static struct rxrpc_call *rxrpc_alloc_incoming_call(struct rxrpc_sock *rx,
 
 	rxrpc_see_call(call);
 	call->conn = conn;
+	call->security = conn->security;
 	call->peer = rxrpc_get_peer(conn->params.peer);
 	call->cong_cwnd = call->peer->cong_cwnd;
 	return call;
diff --git a/net/rxrpc/call_object.c b/net/rxrpc/call_object.c
index 6dace078971a..a31c18c09894 100644
--- a/net/rxrpc/call_object.c
+++ b/net/rxrpc/call_object.c
@@ -493,10 +493,10 @@ void rxrpc_release_call(struct rxrpc_sock *rx, struct rxrpc_call *call)
 
 	_debug("RELEASE CALL %p (%d CONN %p)", call, call->debug_id, conn);
 
-	if (conn) {
+	if (conn)
 		rxrpc_disconnect_call(call);
-		conn->security->free_call_crypto(call);
-	}
+	if (call->security)
+		call->security->free_call_crypto(call);
 
 	rxrpc_cleanup_ring(call);
 	_leave("");
diff --git a/net/rxrpc/conn_client.c b/net/rxrpc/conn_client.c
index 700eb77173fc..376370cd9285 100644
--- a/net/rxrpc/conn_client.c
+++ b/net/rxrpc/conn_client.c
@@ -353,6 +353,7 @@ static int rxrpc_get_client_conn(struct rxrpc_sock *rx,
 
 	if (cp->exclusive) {
 		call->conn = candidate;
+		call->security = candidate->security;
 		call->security_ix = candidate->security_ix;
 		call->service_id = candidate->service_id;
 		_leave(" = 0 [exclusive %d]", candidate->debug_id);
@@ -404,6 +405,7 @@ static int rxrpc_get_client_conn(struct rxrpc_sock *rx,
 candidate_published:
 	set_bit(RXRPC_CONN_IN_CLIENT_CONNS, &candidate->flags);
 	call->conn = candidate;
+	call->security = candidate->security;
 	call->security_ix = candidate->security_ix;
 	call->service_id = candidate->service_id;
 	spin_unlock(&local->client_conns_lock);
@@ -426,6 +428,7 @@ static int rxrpc_get_client_conn(struct rxrpc_sock *rx,
 
 	spin_lock(&conn->channel_lock);
 	call->conn = conn;
+	call->security = conn->security;
 	call->security_ix = conn->security_ix;
 	call->service_id = conn->service_id;
 	list_add_tail(&call->chan_wait_link, &conn->waiting_calls);
diff --git a/net/rxrpc/recvmsg.c b/net/rxrpc/recvmsg.c
index 3b0becb12041..a4090797c9b2 100644
--- a/net/rxrpc/recvmsg.c
+++ b/net/rxrpc/recvmsg.c
@@ -251,8 +251,8 @@ static int rxrpc_verify_packet(struct rxrpc_call *call, struct sk_buff *skb,
 		seq += subpacket;
 	}
 
-	return call->conn->security->verify_packet(call, skb, offset, len,
-						   seq, cksum);
+	return call->security->verify_packet(call, skb, offset, len,
+					     seq, cksum);
 }
 
 /*
@@ -291,7 +291,7 @@ static int rxrpc_locate_data(struct rxrpc_call *call, struct sk_buff *skb,
 
 	*_offset = offset;
 	*_len = len;
-	call->conn->security->locate_data(call, skb, _offset, _len);
+	call->security->locate_data(call, skb, _offset, _len);
 	return 0;
 }
 
diff --git a/net/rxrpc/sendmsg.c b/net/rxrpc/sendmsg.c
index 22f51a7e356e..813fd6888142 100644
--- a/net/rxrpc/sendmsg.c
+++ b/net/rxrpc/sendmsg.c
@@ -419,7 +419,7 @@ static int rxrpc_send_data(struct rxrpc_sock *rx,
 				 call->tx_winsize)
 				sp->hdr.flags |= RXRPC_MORE_PACKETS;
 
-			ret = conn->security->secure_packet(
+			ret = call->security->secure_packet(
 				call, skb, skb->mark, skb->head);
 			if (ret < 0)
 				goto out;


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
