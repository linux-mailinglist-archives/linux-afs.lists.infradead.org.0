Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D6B8C61C
	for <lists+linux-afs@lfdr.de>; Wed, 14 Aug 2019 04:13:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MWrdMdwEsE2fcJLUqg5WU9HPnWYiiIkwrUoVNHTXSe4=; b=j4Bf66SJx/UxAq
	8Rmmx5m5aDxnTaiohjrkSmWt6rVbtFlqt++MOx6JqpQTiAiVoXpZDIB3fbeTQh3pts2V4GgzA40nT
	0yXX59hUgO+fy5Bvlp8Rs+VA5PS1FZtcaNPK+5omCVybPG8M8hNsNLTaL6N9ZW9X9u2daNwVA1q08
	IvhPejKr+w90epEuXDVA23mhulGSlxyciUxk1sHYkA2AimfYU6M8YurNWWk2YxTOLxMXTQiJV/QxW
	1/JXFaH6JL8RrpDHHJ2BYVuKJoXNMEr5Jrv1ncJH0FEI5E3czIcs+TKcIGuwvcZIam1aXqA7u0SEq
	PDbBYqlBFjnlMteGMDbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hximV-0006gt-F2; Wed, 14 Aug 2019 02:12:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hximR-0006fs-Sq
 for linux-afs@lists.infradead.org; Wed, 14 Aug 2019 02:12:53 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AAF19208C2;
 Wed, 14 Aug 2019 02:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565748771;
 bh=6Y7v6No6PsmmDaWMBYx4jzdQPDqHWu5vByZImdbGZVE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JgfMegnP3+BdDLmXms7CBAyPgm/7c428ELyyDVUv5EKaGRzJ3N7SYbK12rqs2IGXi
 xqGC7jA+vaDrRsEfBiOVxz+Cd+dXrFBlfDd12nIM62CYHftwAhMxO2mdkgaHAltSOz
 VKK+V6UYuRH+HKdRC8LaLqWs5plG95YozbgO8k48=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 059/123] rxrpc: Fix potential deadlock
Date: Tue, 13 Aug 2019 22:09:43 -0400
Message-Id: <20190814021047.14828-59-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814021047.14828-1-sashal@kernel.org>
References: <20190814021047.14828-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_191252_013063_687F3EEE 
X-CRM114-Status: GOOD (  15.06  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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
Cc: Sasha Levin <sashal@kernel.org>,
 syzbot+72af434e4b3417318f84@syzkaller.appspotmail.com, netdev@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit 60034d3d146b11922ab1db613bce062dddc0327a ]

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
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/rxrpc/ar-internal.h |  1 +
 net/rxrpc/peer_event.c  |  2 +-
 net/rxrpc/peer_object.c | 18 ++++++++++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index 80335b4ee4fd6..822f45386e311 100644
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
index 9f2f45c09e583..7666ec72d37e5 100644
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
index 9d3ce81cf8ae8..9c3ac96f71cbf 100644
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
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
