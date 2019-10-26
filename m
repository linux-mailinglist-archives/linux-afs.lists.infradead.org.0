Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F841E5AAA
	for <lists+linux-afs@lfdr.de>; Sat, 26 Oct 2019 15:16:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RoyUerwOi1dRk4O5wOgHAl0sbu+Go8tMvG4a0nZxPQQ=; b=oUvf1LXoV7dsy+
	LXmmkTvfGJTKNxq51FZSGGuKuKey+Y62kO//cu/sy7HJccgN+yGDdU6FbrwIIqwMgszSJX0eraSkI
	pEAHBa4v3MhYqTTBlISDGc0XpLr05hOgK3aH3YrpUJ1/LqFvexf/dhBt3wwIZxf8uYSGbveXdnXLM
	tY9nC7wKPtgAPkGwNSc1UjMMn/Ats91np1xryhe+ROIHphgMdsUevnD/6XtTkomMJ83vTSaXEWs+Z
	kw4uWwaLJfyorBqxjFl9j0aL2TI9aDa03qQk9UN4Rh4h7JS2afyB63xpyrkxzyvTupmajlzdCuiL9
	xY4HngpDBwUfAhWlqfew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOLw6-0006zR-7E; Sat, 26 Oct 2019 13:16:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOLvm-0006fi-50
 for linux-afs@lists.infradead.org; Sat, 26 Oct 2019 13:16:36 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 52572222C2;
 Sat, 26 Oct 2019 13:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572095793;
 bh=i6OBQan2kKE6S0mHWye64Z4OOzcnSu3pGuUf59jIpnk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2bcGXzL6cq8pZ6bVAOo8c0vufFvwq1Ikxk3/qZ1RjIFPKPMCW37yWS1lUrIoGS/rF
 36gANyfgfVzm3BoBj3ULSRy786R/3QZRdz/aPjd05+ATLCQtFRS+K4ThpmNjY6ck14
 9RZznq7F5yWCymqmzveYRVgve6wqBbLXgiZqQsLY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 20/99] rxrpc: rxrpc_peer needs to hold a ref on
 the rxrpc_local record
Date: Sat, 26 Oct 2019 09:14:41 -0400
Message-Id: <20191026131600.2507-20-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191026131600.2507-1-sashal@kernel.org>
References: <20191026131600.2507-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191026_061634_315536_D1B3F054 
X-CRM114-Status: GOOD (  12.52  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
Cc: David Howells <dhowells@redhat.com>, Sasha Levin <sashal@kernel.org>,
 netdev@vger.kernel.org, syzbot+b9be979c55f2bea8ed30@syzkaller.appspotmail.com,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit 9ebeddef58c41bd700419cdcece24cf64ce32276 ]

The rxrpc_peer record needs to hold a reference on the rxrpc_local record
it points as the peer is used as a base to access information in the
rxrpc_local record.

This can cause problems in __rxrpc_put_peer(), where we need the network
namespace pointer, and in rxrpc_send_keepalive(), where we need to access
the UDP socket, leading to symptoms like:

    BUG: KASAN: use-after-free in __rxrpc_put_peer net/rxrpc/peer_object.c:411
    [inline]
    BUG: KASAN: use-after-free in rxrpc_put_peer+0x685/0x6a0
    net/rxrpc/peer_object.c:435
    Read of size 8 at addr ffff888097ec0058 by task syz-executor823/24216

Fix this by taking a ref on the local record for the peer record.

Fixes: ace45bec6d77 ("rxrpc: Fix firewall route keepalive")
Fixes: 2baec2c3f854 ("rxrpc: Support network namespacing")
Reported-by: syzbot+b9be979c55f2bea8ed30@syzkaller.appspotmail.com
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/rxrpc/peer_object.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/rxrpc/peer_object.c b/net/rxrpc/peer_object.c
index b700b7ecaa3d8..64830d8c1fdb5 100644
--- a/net/rxrpc/peer_object.c
+++ b/net/rxrpc/peer_object.c
@@ -216,7 +216,7 @@ struct rxrpc_peer *rxrpc_alloc_peer(struct rxrpc_local *local, gfp_t gfp)
 	peer = kzalloc(sizeof(struct rxrpc_peer), gfp);
 	if (peer) {
 		atomic_set(&peer->usage, 1);
-		peer->local = local;
+		peer->local = rxrpc_get_local(local);
 		INIT_HLIST_HEAD(&peer->error_targets);
 		peer->service_conns = RB_ROOT;
 		seqlock_init(&peer->service_conn_lock);
@@ -307,7 +307,6 @@ void rxrpc_new_incoming_peer(struct rxrpc_sock *rx, struct rxrpc_local *local,
 	unsigned long hash_key;
 
 	hash_key = rxrpc_peer_hash_key(local, &peer->srx);
-	peer->local = local;
 	rxrpc_init_peer(rx, peer, hash_key);
 
 	spin_lock(&rxnet->peer_hash_lock);
@@ -417,6 +416,7 @@ static void __rxrpc_put_peer(struct rxrpc_peer *peer)
 	list_del_init(&peer->keepalive_link);
 	spin_unlock_bh(&rxnet->peer_hash_lock);
 
+	rxrpc_put_local(peer->local);
 	kfree_rcu(peer, rcu);
 }
 
@@ -453,6 +453,7 @@ void rxrpc_put_peer_locked(struct rxrpc_peer *peer)
 	if (n == 0) {
 		hash_del_rcu(&peer->hash_link);
 		list_del_init(&peer->keepalive_link);
+		rxrpc_put_local(peer->local);
 		kfree_rcu(peer, rcu);
 	}
 }
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
