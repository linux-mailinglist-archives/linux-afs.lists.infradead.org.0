Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CADCDEF6
	for <lists+linux-afs@lfdr.de>; Mon,  7 Oct 2019 12:16:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4XBH+BLTtkdcmf3L60JDV0bPe+hmxRjAt5KCb5dImxg=; b=KEt4YZ8klmdwsZ
	an/JxZnc7RjeuQlNoDtLCFXFX1nbJFQ9aKN74yU1aiL7ZRUmYBiQCfBktTsPHQCKHgIrotuaa8Q+1
	0wTcahKWYH1lGxn4+aUpXxzSJ6LgK1+ZXhQ72oZPF+dHs2N4RpG/gL45esVuI6sKfphQBFaK0OJRm
	d4OXZae1SPAkXmOpSXCkpL/FQFyldtaXF/OJHMuPp0E8Arjakw+/hWE2Z3G5SGtxPsstHrwkTZN9J
	FIkBlDavA7WiRPArESXQzz/vc/AjPuk/ErbIXub50gN830SbPsUUAIWPibZWSSOmPfMf3Ul2yeabL
	wkkejsJszCpJHnv3B8/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHQ3f-000298-3A; Mon, 07 Oct 2019 10:16:03 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHQ3W-00021b-Pb
 for linux-afs@lists.infradead.org; Mon, 07 Oct 2019 10:15:56 +0000
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 623BA18C4275;
 Mon,  7 Oct 2019 10:15:53 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-125-72.rdu2.redhat.com
 [10.10.125.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 680706012A;
 Mon,  7 Oct 2019 10:15:51 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 2/6] rxrpc: Fix trace-after-put looking at the put peer
 record
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Mon, 07 Oct 2019 11:15:50 +0100
Message-ID: <157044335082.32635.8374077226326690141.stgit@warthog.procyon.org.uk>
In-Reply-To: <157044333551.32635.10133219357337058780.stgit@warthog.procyon.org.uk>
References: <157044333551.32635.10133219357337058780.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Mon, 07 Oct 2019 10:15:53 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_031554_902457_FE3C5949 
X-CRM114-Status: GOOD (  16.61  )
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
---

 include/trace/events/rxrpc.h |    6 +++---
 net/rxrpc/peer_object.c      |   11 +++++++----
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/trace/events/rxrpc.h b/include/trace/events/rxrpc.h
index edc5c887a44c..45556fe771c3 100644
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
index 9c3ac96f71cb..b700b7ecaa3d 100644
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


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
