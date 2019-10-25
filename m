Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F09E4CBF
	for <lists+linux-afs@lfdr.de>; Fri, 25 Oct 2019 15:55:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pij5kyfr9Bm3sOYmcXgCuWDPZ2/ixMNpibecrc+igOM=; b=HRu3uvNGQTzL2K
	P2ITtYuG8jcolURSC+WH5rC8pWIErd6DDaOG1NxpMRuf8UbCyHh7FP6Nm6Clo0Rm/3Qv6fnDuIF27
	1q22bNYMQq9m9O5aSOQs6yVTMFOxgOseUh54XT19BsGvUk162j5a19YXgsOg9ElOVDeW5K0Ol+HSV
	IPwWoWRck7V9ibXnMTGccrwdpwFjjWNjTMcnzfAD/oZeLpeytN2RYbuQt3rXxml/Q2p8e1pFKVt7p
	ULwXsQnkAGmNUYcDih9CyEzkuu2tGMO6YDitIQwESmPx4pHpfH+A/DnNMMus/FuCzVrJyCh2OW2FN
	RtLJMkU7IpOzc7zwBOZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iO03g-00027A-16; Fri, 25 Oct 2019 13:55:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iO03c-000250-Km
 for linux-afs@lists.infradead.org; Fri, 25 Oct 2019 13:55:14 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 94DA9222C4;
 Fri, 25 Oct 2019 13:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572011712;
 bh=6aVhr7608eofXvvGSLtA+juskwIu+HL1BwWnA/CWjJE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qN5x0aE3abSCYCAOkHFGy7fnLYXy+ED0xGmFF1tHDmJ9bATfkIpMZW5MkEonoL4Jr
 EWDhVO4MLMeKMnhBukRmEUkbFt+m4JyumsiLxftWHGhhfdSeDHKZHlw+BvQyY4RpTJ
 e3kY5qcrCzy8+Ampbrc+sVTl730uvDwmIBymQoNg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 05/33] rxrpc: Fix trace-after-put looking at the
 put peer record
Date: Fri, 25 Oct 2019 09:54:37 -0400
Message-Id: <20191025135505.24762-5-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025135505.24762-1-sashal@kernel.org>
References: <20191025135505.24762-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191025_065512_721065_C4351327 
X-CRM114-Status: GOOD (  13.26  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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

[ Upstream commit 55f6c98e3674ce16038a1949c3f9ca5a9a99f289 ]

rxrpc_put_peer() calls trace_rxrpc_peer() after it has done the decrement
of the refcount - which looks at the debug_id in the peer record.  But
unless the refcount was reduced to zero, we no longer have the right to
look in the record and, indeed, it may be deleted by some other thread.

Fix this by getting the debug_id out before decrementing the refcount and
then passing that into the tracepoint.

This can cause the following symptoms:

    BUG: KASAN: use-after-free in __rxrpc_put_peer net/rxrpc/peer_object.c:411
    [inline]
    BUG: KASAN: use-after-free in rxrpc_put_peer+0x685/0x6a0
    net/rxrpc/peer_object.c:435
    Read of size 8 at addr ffff888097ec0058 by task syz-executor823/24216

Fixes: 1159d4b496f5 ("rxrpc: Add a tracepoint to track rxrpc_peer refcounting")
Reported-by: syzbot+b9be979c55f2bea8ed30@syzkaller.appspotmail.com
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/trace/events/rxrpc.h |  6 +++---
 net/rxrpc/peer_object.c      | 11 +++++++----
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/trace/events/rxrpc.h b/include/trace/events/rxrpc.h
index edc5c887a44c8..45556fe771c36 100644
--- a/include/trace/events/rxrpc.h
+++ b/include/trace/events/rxrpc.h
@@ -519,10 +519,10 @@ TRACE_EVENT(rxrpc_local,
 	    );
 
 TRACE_EVENT(rxrpc_peer,
-	    TP_PROTO(struct rxrpc_peer *peer, enum rxrpc_peer_trace op,
+	    TP_PROTO(unsigned int peer_debug_id, enum rxrpc_peer_trace op,
 		     int usage, const void *where),
 
-	    TP_ARGS(peer, op, usage, where),
+	    TP_ARGS(peer_debug_id, op, usage, where),
 
 	    TP_STRUCT__entry(
 		    __field(unsigned int,	peer		)
@@ -532,7 +532,7 @@ TRACE_EVENT(rxrpc_peer,
 			     ),
 
 	    TP_fast_assign(
-		    __entry->peer = peer->debug_id;
+		    __entry->peer = peer_debug_id;
 		    __entry->op = op;
 		    __entry->usage = usage;
 		    __entry->where = where;
diff --git a/net/rxrpc/peer_object.c b/net/rxrpc/peer_object.c
index 9c3ac96f71cbf..b700b7ecaa3d8 100644
--- a/net/rxrpc/peer_object.c
+++ b/net/rxrpc/peer_object.c
@@ -382,7 +382,7 @@ struct rxrpc_peer *rxrpc_get_peer(struct rxrpc_peer *peer)
 	int n;
 
 	n = atomic_inc_return(&peer->usage);
-	trace_rxrpc_peer(peer, rxrpc_peer_got, n, here);
+	trace_rxrpc_peer(peer->debug_id, rxrpc_peer_got, n, here);
 	return peer;
 }
 
@@ -396,7 +396,7 @@ struct rxrpc_peer *rxrpc_get_peer_maybe(struct rxrpc_peer *peer)
 	if (peer) {
 		int n = atomic_fetch_add_unless(&peer->usage, 1, 0);
 		if (n > 0)
-			trace_rxrpc_peer(peer, rxrpc_peer_got, n + 1, here);
+			trace_rxrpc_peer(peer->debug_id, rxrpc_peer_got, n + 1, here);
 		else
 			peer = NULL;
 	}
@@ -426,11 +426,13 @@ static void __rxrpc_put_peer(struct rxrpc_peer *peer)
 void rxrpc_put_peer(struct rxrpc_peer *peer)
 {
 	const void *here = __builtin_return_address(0);
+	unsigned int debug_id;
 	int n;
 
 	if (peer) {
+		debug_id = peer->debug_id;
 		n = atomic_dec_return(&peer->usage);
-		trace_rxrpc_peer(peer, rxrpc_peer_put, n, here);
+		trace_rxrpc_peer(debug_id, rxrpc_peer_put, n, here);
 		if (n == 0)
 			__rxrpc_put_peer(peer);
 	}
@@ -443,10 +445,11 @@ void rxrpc_put_peer(struct rxrpc_peer *peer)
 void rxrpc_put_peer_locked(struct rxrpc_peer *peer)
 {
 	const void *here = __builtin_return_address(0);
+	unsigned int debug_id = peer->debug_id;
 	int n;
 
 	n = atomic_dec_return(&peer->usage);
-	trace_rxrpc_peer(peer, rxrpc_peer_put, n, here);
+	trace_rxrpc_peer(debug_id, rxrpc_peer_put, n, here);
 	if (n == 0) {
 		hash_del_rcu(&peer->hash_link);
 		list_del_init(&peer->keepalive_link);
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
