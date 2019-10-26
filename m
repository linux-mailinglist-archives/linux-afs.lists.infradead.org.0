Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC19E5AA8
	for <lists+linux-afs@lfdr.de>; Sat, 26 Oct 2019 15:16:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfFwA3TuKDJ3YJiFDc8qgLzKpCGm/ulETYe/lm0ZL7c=; b=Po9gdPaTPFnUnY
	X0COma33K2vs1BUluxcswht0mxGOZEhQsCMufK6tNJyc9cdq8SYc0T8+/S+CmYPG9CvAUZUB4S+61
	DW9Dncuj1tnCSpLO3UGzOqvWLErN7HQzGGwzen9Hkplr02J6kiiTr9Ngyg36td+WBUY4ZG9tyXFmc
	GSzlWXJjLgktM6hmN14+y639qdZyLWs3JBWA6/Qf0n0vmQR/5g5BKQFbf18RhsCOe3YmHwcRcT43k
	G0CD1KgOobLcZ/0nGRKvhWcJPjoG8f/bercbvLt3wy1p6A940ARkKQWlCF02Wa6c9nc9edzy8vq3Q
	JspwLKRYqkWaaKa/SmfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOLw0-0006wa-UX; Sat, 26 Oct 2019 13:16:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOLvj-0006dD-Iy
 for linux-afs@lists.infradead.org; Sat, 26 Oct 2019 13:16:34 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2588721E6F;
 Sat, 26 Oct 2019 13:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572095790;
 bh=txrikZKfy/zqUfENYOJ6HzBdcxX4mTCtb9sHONKfPog=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zFDJa4Ik81zSsBQ5o8xk4CEeGLRkTDk/tvBAy7zfAmuFI3QkpXGbVAvdFQkYyr9tX
 V0TZ2HwPg7mfF1xRojSLjajnwfjSUFkL58DLltlugaU32QmSvd1t+DN0rgD0l8Cx6/
 4J539hiYnMkENGhudPboP8XkeC0J1AwayD+8CORM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 18/99] rxrpc: Fix trace-after-put looking at the
 put connection record
Date: Sat, 26 Oct 2019 09:14:39 -0400
Message-Id: <20191026131600.2507-18-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191026131600.2507-1-sashal@kernel.org>
References: <20191026131600.2507-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191026_061631_793922_C484FB02 
X-CRM114-Status: GOOD (  14.34  )
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
 linux-afs@lists.infradead.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit 4c1295dccc0afe0905b6ca4c62ade7f2406f2cfb ]

rxrpc_put_*conn() calls trace_rxrpc_conn() after they have done the
decrement of the refcount - which looks at the debug_id in the connection
record.  But unless the refcount was reduced to zero, we no longer have the
right to look in the record and, indeed, it may be deleted by some other
thread.

Fix this by getting the debug_id out before decrementing the refcount and
then passing that into the tracepoint.

Fixes: 363deeab6d0f ("rxrpc: Add connection tracepoint and client conn state tracepoint")
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/trace/events/rxrpc.h |  6 +++---
 net/rxrpc/call_accept.c      |  2 +-
 net/rxrpc/conn_client.c      |  6 ++++--
 net/rxrpc/conn_object.c      | 13 +++++++------
 net/rxrpc/conn_service.c     |  2 +-
 5 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/include/trace/events/rxrpc.h b/include/trace/events/rxrpc.h
index 45556fe771c36..38a97e890cb67 100644
--- a/include/trace/events/rxrpc.h
+++ b/include/trace/events/rxrpc.h
@@ -546,10 +546,10 @@ TRACE_EVENT(rxrpc_peer,
 	    );
 
 TRACE_EVENT(rxrpc_conn,
-	    TP_PROTO(struct rxrpc_connection *conn, enum rxrpc_conn_trace op,
+	    TP_PROTO(unsigned int conn_debug_id, enum rxrpc_conn_trace op,
 		     int usage, const void *where),
 
-	    TP_ARGS(conn, op, usage, where),
+	    TP_ARGS(conn_debug_id, op, usage, where),
 
 	    TP_STRUCT__entry(
 		    __field(unsigned int,	conn		)
@@ -559,7 +559,7 @@ TRACE_EVENT(rxrpc_conn,
 			     ),
 
 	    TP_fast_assign(
-		    __entry->conn = conn->debug_id;
+		    __entry->conn = conn_debug_id;
 		    __entry->op = op;
 		    __entry->usage = usage;
 		    __entry->where = where;
diff --git a/net/rxrpc/call_accept.c b/net/rxrpc/call_accept.c
index 00c095d74145d..c1b1b7dd29245 100644
--- a/net/rxrpc/call_accept.c
+++ b/net/rxrpc/call_accept.c
@@ -84,7 +84,7 @@ static int rxrpc_service_prealloc_one(struct rxrpc_sock *rx,
 		smp_store_release(&b->conn_backlog_head,
 				  (head + 1) & (size - 1));
 
-		trace_rxrpc_conn(conn, rxrpc_conn_new_service,
+		trace_rxrpc_conn(conn->debug_id, rxrpc_conn_new_service,
 				 atomic_read(&conn->usage), here);
 	}
 
diff --git a/net/rxrpc/conn_client.c b/net/rxrpc/conn_client.c
index 3f1da1b49f690..700eb77173fcb 100644
--- a/net/rxrpc/conn_client.c
+++ b/net/rxrpc/conn_client.c
@@ -212,7 +212,8 @@ rxrpc_alloc_client_connection(struct rxrpc_conn_parameters *cp, gfp_t gfp)
 	rxrpc_get_local(conn->params.local);
 	key_get(conn->params.key);
 
-	trace_rxrpc_conn(conn, rxrpc_conn_new_client, atomic_read(&conn->usage),
+	trace_rxrpc_conn(conn->debug_id, rxrpc_conn_new_client,
+			 atomic_read(&conn->usage),
 			 __builtin_return_address(0));
 	trace_rxrpc_client(conn, -1, rxrpc_client_alloc);
 	_leave(" = %p", conn);
@@ -985,11 +986,12 @@ rxrpc_put_one_client_conn(struct rxrpc_connection *conn)
 void rxrpc_put_client_conn(struct rxrpc_connection *conn)
 {
 	const void *here = __builtin_return_address(0);
+	unsigned int debug_id = conn->debug_id;
 	int n;
 
 	do {
 		n = atomic_dec_return(&conn->usage);
-		trace_rxrpc_conn(conn, rxrpc_conn_put_client, n, here);
+		trace_rxrpc_conn(debug_id, rxrpc_conn_put_client, n, here);
 		if (n > 0)
 			return;
 		ASSERTCMP(n, >=, 0);
diff --git a/net/rxrpc/conn_object.c b/net/rxrpc/conn_object.c
index ed05b69221322..38d718e90dc69 100644
--- a/net/rxrpc/conn_object.c
+++ b/net/rxrpc/conn_object.c
@@ -269,7 +269,7 @@ bool rxrpc_queue_conn(struct rxrpc_connection *conn)
 	if (n == 0)
 		return false;
 	if (rxrpc_queue_work(&conn->processor))
-		trace_rxrpc_conn(conn, rxrpc_conn_queued, n + 1, here);
+		trace_rxrpc_conn(conn->debug_id, rxrpc_conn_queued, n + 1, here);
 	else
 		rxrpc_put_connection(conn);
 	return true;
@@ -284,7 +284,7 @@ void rxrpc_see_connection(struct rxrpc_connection *conn)
 	if (conn) {
 		int n = atomic_read(&conn->usage);
 
-		trace_rxrpc_conn(conn, rxrpc_conn_seen, n, here);
+		trace_rxrpc_conn(conn->debug_id, rxrpc_conn_seen, n, here);
 	}
 }
 
@@ -296,7 +296,7 @@ void rxrpc_get_connection(struct rxrpc_connection *conn)
 	const void *here = __builtin_return_address(0);
 	int n = atomic_inc_return(&conn->usage);
 
-	trace_rxrpc_conn(conn, rxrpc_conn_got, n, here);
+	trace_rxrpc_conn(conn->debug_id, rxrpc_conn_got, n, here);
 }
 
 /*
@@ -310,7 +310,7 @@ rxrpc_get_connection_maybe(struct rxrpc_connection *conn)
 	if (conn) {
 		int n = atomic_fetch_add_unless(&conn->usage, 1, 0);
 		if (n > 0)
-			trace_rxrpc_conn(conn, rxrpc_conn_got, n + 1, here);
+			trace_rxrpc_conn(conn->debug_id, rxrpc_conn_got, n + 1, here);
 		else
 			conn = NULL;
 	}
@@ -333,10 +333,11 @@ static void rxrpc_set_service_reap_timer(struct rxrpc_net *rxnet,
 void rxrpc_put_service_conn(struct rxrpc_connection *conn)
 {
 	const void *here = __builtin_return_address(0);
+	unsigned int debug_id = conn->debug_id;
 	int n;
 
 	n = atomic_dec_return(&conn->usage);
-	trace_rxrpc_conn(conn, rxrpc_conn_put_service, n, here);
+	trace_rxrpc_conn(debug_id, rxrpc_conn_put_service, n, here);
 	ASSERTCMP(n, >=, 0);
 	if (n == 1)
 		rxrpc_set_service_reap_timer(conn->params.local->rxnet,
@@ -420,7 +421,7 @@ void rxrpc_service_connection_reaper(struct work_struct *work)
 		 */
 		if (atomic_cmpxchg(&conn->usage, 1, 0) != 1)
 			continue;
-		trace_rxrpc_conn(conn, rxrpc_conn_reap_service, 0, NULL);
+		trace_rxrpc_conn(conn->debug_id, rxrpc_conn_reap_service, 0, NULL);
 
 		if (rxrpc_conn_is_client(conn))
 			BUG();
diff --git a/net/rxrpc/conn_service.c b/net/rxrpc/conn_service.c
index b30e13f6d95fd..123d6ceab15cb 100644
--- a/net/rxrpc/conn_service.c
+++ b/net/rxrpc/conn_service.c
@@ -134,7 +134,7 @@ struct rxrpc_connection *rxrpc_prealloc_service_connection(struct rxrpc_net *rxn
 		list_add_tail(&conn->proc_link, &rxnet->conn_proc_list);
 		write_unlock(&rxnet->conn_lock);
 
-		trace_rxrpc_conn(conn, rxrpc_conn_new_service,
+		trace_rxrpc_conn(conn->debug_id, rxrpc_conn_new_service,
 				 atomic_read(&conn->usage),
 				 __builtin_return_address(0));
 	}
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
