Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 549578D13A
	for <lists+linux-afs@lfdr.de>; Wed, 14 Aug 2019 12:48:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cKIuQ0DJZfCv/bayDt99WKzSjfk5iR6hC8QoHbO3k2I=; b=AoBbM3iXxsAXtw
	HCc3T49d5QYwNG0UpqzTMjV9lMVg2apXAAWzmd3KadcP7QQup/Eq1kbOBsZM4Davh2w9zIhXGMwbD
	KeoKW7dq5qmF91HgjrSsR5wtDAcpaFu3UT2f7DFJ4Uw/Xq7yvIuedQY+UOMjAmhnoA188ewPJ3U83
	S0clLPMtZudRJe0uDJqMxmWGhv68XNgm9U0muhjrOEhKp0PZfu17hgcjSz1LfVl+Nxa4ykbdIh4H2
	RWcWbU5XsDh214HznIbfjiyf1fGUbTWDOBpSSWIHmFdup1YGO0fKNiVBCflcrEiWFr+KRi2Gd9byg
	pLNpVtlWGHY4XM5eyreA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxqp8-0003Q7-Gu; Wed, 14 Aug 2019 10:48:10 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxqp5-0003Pk-El
 for linux-afs@lists.infradead.org; Wed, 14 Aug 2019 10:48:08 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2FBE6302C066;
 Wed, 14 Aug 2019 10:48:07 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C39D1001B35;
 Wed, 14 Aug 2019 10:48:06 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 2/2] rxrpc: Fix read-after-free in rxrpc_queue_local()
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Wed, 14 Aug 2019 11:48:05 +0100
Message-ID: <156577968542.1405.1844096159304543778.stgit@warthog.procyon.org.uk>
In-Reply-To: <156577967167.1405.3581547705200268244.stgit@warthog.procyon.org.uk>
References: <156577967167.1405.3581547705200268244.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Wed, 14 Aug 2019 10:48:07 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_034807_532314_DEAAC5FB 
X-CRM114-Status: GOOD (  18.61  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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

rxrpc_queue_local() attempts to queue the local endpoint it is given and
then, if successful, prints a trace line.  The trace line includes the
current usage count - but we're not allowed to look at the local endpoint
at this point as we passed our ref on it to the workqueue.

Fix this by reading the usage count before queuing the work item.

Also fix the reading of local->debug_id for trace lines, which must be done
with the same consideration as reading the usage count.

Fixes: 09d2bf595db4 ("rxrpc: Add a tracepoint to track rxrpc_local refcounting")
Reported-by: syzbot+78e71c5bab4f76a6a719@syzkaller.appspotmail.com
Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/trace/events/rxrpc.h |    6 +++---
 net/rxrpc/local_object.c     |   19 ++++++++++---------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/include/trace/events/rxrpc.h b/include/trace/events/rxrpc.h
index cc1d060cbf13..fa06b528c73c 100644
--- a/include/trace/events/rxrpc.h
+++ b/include/trace/events/rxrpc.h
@@ -498,10 +498,10 @@ rxrpc_tx_points;
 #define E_(a, b)	{ a, b }
 
 TRACE_EVENT(rxrpc_local,
-	    TP_PROTO(struct rxrpc_local *local, enum rxrpc_local_trace op,
+	    TP_PROTO(unsigned int local_debug_id, enum rxrpc_local_trace op,
 		     int usage, const void *where),
 
-	    TP_ARGS(local, op, usage, where),
+	    TP_ARGS(local_debug_id, op, usage, where),
 
 	    TP_STRUCT__entry(
 		    __field(unsigned int,	local		)
@@ -511,7 +511,7 @@ TRACE_EVENT(rxrpc_local,
 			     ),
 
 	    TP_fast_assign(
-		    __entry->local = local->debug_id;
+		    __entry->local = local_debug_id;
 		    __entry->op = op;
 		    __entry->usage = usage;
 		    __entry->where = where;
diff --git a/net/rxrpc/local_object.c b/net/rxrpc/local_object.c
index c45765b7263e..72a6e12a9304 100644
--- a/net/rxrpc/local_object.c
+++ b/net/rxrpc/local_object.c
@@ -93,7 +93,7 @@ static struct rxrpc_local *rxrpc_alloc_local(struct rxrpc_net *rxnet,
 		local->debug_id = atomic_inc_return(&rxrpc_debug_id);
 		memcpy(&local->srx, srx, sizeof(*srx));
 		local->srx.srx_service = 0;
-		trace_rxrpc_local(local, rxrpc_local_new, 1, NULL);
+		trace_rxrpc_local(local->debug_id, rxrpc_local_new, 1, NULL);
 	}
 
 	_leave(" = %p", local);
@@ -321,7 +321,7 @@ struct rxrpc_local *rxrpc_get_local(struct rxrpc_local *local)
 	int n;
 
 	n = atomic_inc_return(&local->usage);
-	trace_rxrpc_local(local, rxrpc_local_got, n, here);
+	trace_rxrpc_local(local->debug_id, rxrpc_local_got, n, here);
 	return local;
 }
 
@@ -335,7 +335,8 @@ struct rxrpc_local *rxrpc_get_local_maybe(struct rxrpc_local *local)
 	if (local) {
 		int n = atomic_fetch_add_unless(&local->usage, 1, 0);
 		if (n > 0)
-			trace_rxrpc_local(local, rxrpc_local_got, n + 1, here);
+			trace_rxrpc_local(local->debug_id, rxrpc_local_got,
+					  n + 1, here);
 		else
 			local = NULL;
 	}
@@ -343,16 +344,16 @@ struct rxrpc_local *rxrpc_get_local_maybe(struct rxrpc_local *local)
 }
 
 /*
- * Queue a local endpoint unless it has become unreferenced and pass the
- * caller's reference to the work item.
+ * Queue a local endpoint and pass the caller's reference to the work item.
  */
 void rxrpc_queue_local(struct rxrpc_local *local)
 {
 	const void *here = __builtin_return_address(0);
+	unsigned int debug_id = local->debug_id;
+	int n = atomic_read(&local->usage);
 
 	if (rxrpc_queue_work(&local->processor))
-		trace_rxrpc_local(local, rxrpc_local_queued,
-				  atomic_read(&local->usage), here);
+		trace_rxrpc_local(debug_id, rxrpc_local_queued, n, here);
 	else
 		rxrpc_put_local(local);
 }
@@ -367,7 +368,7 @@ void rxrpc_put_local(struct rxrpc_local *local)
 
 	if (local) {
 		n = atomic_dec_return(&local->usage);
-		trace_rxrpc_local(local, rxrpc_local_put, n, here);
+		trace_rxrpc_local(local->debug_id, rxrpc_local_put, n, here);
 
 		if (n == 0)
 			call_rcu(&local->rcu, rxrpc_local_rcu);
@@ -456,7 +457,7 @@ static void rxrpc_local_processor(struct work_struct *work)
 		container_of(work, struct rxrpc_local, processor);
 	bool again;
 
-	trace_rxrpc_local(local, rxrpc_local_processing,
+	trace_rxrpc_local(local->debug_id, rxrpc_local_processing,
 			  atomic_read(&local->usage), NULL);
 
 	do {


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
