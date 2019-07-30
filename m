Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E2E7AB6E
	for <lists+linux-afs@lfdr.de>; Tue, 30 Jul 2019 16:50:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qRN8+oqgdfVI9SKAvUfYVXy6uAeWAsC7KAa7Pl/NhQ=; b=uFEVxKvj6WTEEQ
	72KPyv7a9BCLnP3VWyl6eAt94oR710AtEdPsRHIdCjov11fzP+vzF0YqJpi+0wyIvraFId7gD4qgs
	Pv2n/94ADHTMYakhmDNhxlaMWjl4VNgvaqXdTST4000E5vx9T8Yyh5jj+f5rz3NDFY7e+/0C1VnOU
	4VDpH84rO5gPzJLqfSrf9hGkYdT3qzh6w67V292Z0JYhQVsvVbmGhHXVTQoywDbq/g8UcWMZJG3mS
	j1E6si6YPsNfVJDzO58fKQ6U+PXVx9sUJIdvECtuNEdTpEyqWZCWVEi6qeu3XBQ9cUOOQgMhMRppo
	Cm7fl+Ntqtu4G0WNM9aQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsTSN-0008S9-Tq; Tue, 30 Jul 2019 14:50:27 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsTSK-0008Rf-Up
 for linux-afs@lists.infradead.org; Tue, 30 Jul 2019 14:50:26 +0000
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AAC50C049E17;
 Tue, 30 Jul 2019 14:50:24 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99C2B60623;
 Tue, 30 Jul 2019 14:50:18 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 1/2] rxrpc: Fix potential deadlock
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Tue, 30 Jul 2019 15:50:18 +0100
Message-ID: <156449821803.9558.698598559203701656.stgit@warthog.procyon.org.uk>
In-Reply-To: <156449821120.9558.2821927090314866621.stgit@warthog.procyon.org.uk>
References: <156449821120.9558.2821927090314866621.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 30 Jul 2019 14:50:24 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_075025_037741_5119A77B 
X-CRM114-Status: GOOD (  18.54  )
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

There is a potential deadlock in rxrpc_peer_keepalive_dispatch() whereby
rxrpc_put_peer() is called with the peer_hash_lock held, but if it reduces
the peer's refcount to 0, rxrpc_put_peer() calls __rxrpc_put_peer() - which
the tries to take the already held lock.

Fix this by providing a version of rxrpc_put_peer() that can be called in
situations where the lock is already held.

The bug may produce the following lockdep report:

============================================
WARNING: possible recursive locking detected
5.2.0-next-20190718 #41 Not tainted
--------------------------------------------
kworker/0:3/21678 is trying to acquire lock:
00000000aa5eecdf (&(&rxnet->peer_hash_lock)->rlock){+.-.}, at: spin_lock_bh
/./include/linux/spinlock.h:343 [inline]
00000000aa5eecdf (&(&rxnet->peer_hash_lock)->rlock){+.-.}, at:
__rxrpc_put_peer /net/rxrpc/peer_object.c:415 [inline]
00000000aa5eecdf (&(&rxnet->peer_hash_lock)->rlock){+.-.}, at:
rxrpc_put_peer+0x2d3/0x6a0 /net/rxrpc/peer_object.c:435

but task is already holding lock:
00000000aa5eecdf (&(&rxnet->peer_hash_lock)->rlock){+.-.}, at: spin_lock_bh
/./include/linux/spinlock.h:343 [inline]
00000000aa5eecdf (&(&rxnet->peer_hash_lock)->rlock){+.-.}, at:
rxrpc_peer_keepalive_dispatch /net/rxrpc/peer_event.c:378 [inline]
00000000aa5eecdf (&(&rxnet->peer_hash_lock)->rlock){+.-.}, at:
rxrpc_peer_keepalive_worker+0x6b3/0xd02 /net/rxrpc/peer_event.c:430

Fixes: 330bdcfadcee ("rxrpc: Fix the keepalive generator [ver #2]")
Reported-by: syzbot+72af434e4b3417318f84@syzkaller.appspotmail.com
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Marc Dionne <marc.dionne@auristor.com>
Reviewed-by: Jeffrey Altman <jaltman@auristor.com>
---

 net/rxrpc/ar-internal.h |    1 +
 net/rxrpc/peer_event.c  |    2 +-
 net/rxrpc/peer_object.c |   18 ++++++++++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index 80335b4ee4fd..822f45386e31 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -1061,6 +1061,7 @@ void rxrpc_destroy_all_peers(struct rxrpc_net *);
 struct rxrpc_peer *rxrpc_get_peer(struct rxrpc_peer *);
 struct rxrpc_peer *rxrpc_get_peer_maybe(struct rxrpc_peer *);
 void rxrpc_put_peer(struct rxrpc_peer *);
+void rxrpc_put_peer_locked(struct rxrpc_peer *);
 
 /*
  * proc.c
diff --git a/net/rxrpc/peer_event.c b/net/rxrpc/peer_event.c
index 9f2f45c09e58..7666ec72d37e 100644
--- a/net/rxrpc/peer_event.c
+++ b/net/rxrpc/peer_event.c
@@ -378,7 +378,7 @@ static void rxrpc_peer_keepalive_dispatch(struct rxrpc_net *rxnet,
 		spin_lock_bh(&rxnet->peer_hash_lock);
 		list_add_tail(&peer->keepalive_link,
 			      &rxnet->peer_keepalive[slot & mask]);
-		rxrpc_put_peer(peer);
+		rxrpc_put_peer_locked(peer);
 	}
 
 	spin_unlock_bh(&rxnet->peer_hash_lock);
diff --git a/net/rxrpc/peer_object.c b/net/rxrpc/peer_object.c
index 9d3ce81cf8ae..9c3ac96f71cb 100644
--- a/net/rxrpc/peer_object.c
+++ b/net/rxrpc/peer_object.c
@@ -436,6 +436,24 @@ void rxrpc_put_peer(struct rxrpc_peer *peer)
 	}
 }
 
+/*
+ * Drop a ref on a peer record where the caller already holds the
+ * peer_hash_lock.
+ */
+void rxrpc_put_peer_locked(struct rxrpc_peer *peer)
+{
+	const void *here = __builtin_return_address(0);
+	int n;
+
+	n = atomic_dec_return(&peer->usage);
+	trace_rxrpc_peer(peer, rxrpc_peer_put, n, here);
+	if (n == 0) {
+		hash_del_rcu(&peer->hash_link);
+		list_del_init(&peer->keepalive_link);
+		kfree_rcu(peer, rcu);
+	}
+}
+
 /*
  * Make sure all peer records have been discarded.
  */


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
