Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D4818B2B8
	for <lists+linux-afs@lfdr.de>; Thu, 19 Mar 2020 12:54:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UjTTeOo5+G/VaU1/XMjeCG6bHSRHpLoV1NQRAqvhVMY=; b=MQbVh95IEQ8JBa
	1YHK1NDw9EtTk8vOICvrPup1luRAYrwZkEK0A+N8O0zlpOQj5sAKgMMcEdOed6rmwfkodnFAXD+WS
	WoXImH3gqS/K/7APXTZGEAQWF/wsaao41sNM0ONmhNJcgr9WvUc4E3toGU363TxZNHhOfaVxtmYUf
	W0jvRmQ79WoW9t+P1a1FBODEIbw7Dy/AjiHLZUQDVWO8pPmR0okR8ugTuUve+rZbhRtNgkJZNuMsG
	O/79QcxnE4P/168BbMn3+28+iPeO0mRkBqLOA23e4jGIlLTJL831nML0O77fJ+j8Nrp6WgXHvdtOr
	eo6DqqKmlzSMA2qHrPEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEtkb-0007Ua-2k; Thu, 19 Mar 2020 11:54:13 +0000
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEtkX-0007Tp-Pk
 for linux-afs@lists.infradead.org; Thu, 19 Mar 2020 11:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584618848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b41CsivdEiQpC8fxQjrbad7a2DRP09muo7ottoiNViU=;
 b=BNJ1pPrzu+gInn7N8kS6I6NSSNmeiqjOpAiZyDOMFkg5LGwawJyZBOtiLdsW7eVCdZx0xb
 heozEnDn/e6I7/Vy+cA7ACZxmicvOctl9M32znd0q0deABHWyT/WwmZ8ZBIUoZwnOdDegh
 mI1KLSRrymtdNWabYSEOSxBTtQZ45Zc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-CXJFkQ6hOI6eDzSXLvcBeA-1; Thu, 19 Mar 2020 07:54:07 -0400
X-MC-Unique: CXJFkQ6hOI6eDzSXLvcBeA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1723D800D53;
 Thu, 19 Mar 2020 11:54:06 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-126.rdu2.redhat.com
 [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D8A75D9E2;
 Thu, 19 Mar 2020 11:54:05 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 5/6] afs: Fix handling of an abort from a service handler
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 19 Mar 2020 11:54:04 +0000
Message-ID: <158461884448.3094720.5553566691376139509.stgit@warthog.procyon.org.uk>
In-Reply-To: <158461880968.3094720.5019510060910604912.stgit@warthog.procyon.org.uk>
References: <158461880968.3094720.5019510060910604912.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_045409_968506_810B2D2C 
X-CRM114-Status: GOOD (  22.77  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [63.128.21.74 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

When an AFS service handler function aborts a call, AF_RXRPC marks the call
as complete - which means that it's not going to get any more packets from
the receiver.  This is a problem because reception of the final ACK is what
triggers afs_deliver_to_call() to drop the final ref on the afs_call
object.

Instead, aborted AFS service calls may then just sit around waiting for
ever or until they're displaced by a new call on the same connection
channel or a connection-level abort.

Fix this by calling afs_set_call_complete() to finalise the afs_call struct
representing the call.

However, we then need to drop the ref that stops the call from being
deallocated.  We can do this in afs_set_call_complete(), as the work queue
is holding a separate ref of its own, but then we shouldn't do it in
afs_process_async_call() and afs_delete_async_call().

call->drop_ref is set to indicate that a ref needs dropping for a call and
this is dealt with when we transition a call to AFS_CALL_COMPLETE.

But then we also need to get rid of the ref that pins an asynchronous
client call.  We can do this by the same mechanism, setting call->drop_ref
for an async client call too.

We can also get rid of call->incoming since nothing ever sets it and only
one thing ever checks it (futilely).


A trace of the rxrpc_call and afs_call struct ref counting looks like:

          <idle>-0     [001] ..s5   164.764892: rxrpc_call: c=00000002 SEE u=3 sp=rxrpc_new_incoming_call+0x473/0xb34 a=00000000442095b5
          <idle>-0     [001] .Ns5   164.766001: rxrpc_call: c=00000002 QUE u=4 sp=rxrpc_propose_ACK+0xbe/0x551 a=00000000442095b5
          <idle>-0     [001] .Ns4   164.766005: rxrpc_call: c=00000002 PUT u=3 sp=rxrpc_new_incoming_call+0xa3f/0xb34 a=00000000442095b5
          <idle>-0     [001] .Ns7   164.766433: afs_call: c=00000002 WAKE  u=2 o=11 sp=rxrpc_notify_socket+0x196/0x33c
     kworker/1:2-1810  [001] ...1   164.768409: rxrpc_call: c=00000002 SEE u=3 sp=rxrpc_process_call+0x25/0x7ae a=00000000442095b5
     kworker/1:2-1810  [001] ...1   164.769439: rxrpc_tx_packet: c=00000002 e9f1a7a8:95786a88:00000008:09c5 00000001 00000000 02 22 ACK CallAck
     kworker/1:2-1810  [001] ...1   164.769459: rxrpc_call: c=00000002 PUT u=2 sp=rxrpc_process_call+0x74f/0x7ae a=00000000442095b5
     kworker/1:2-1810  [001] ...1   164.770794: afs_call: c=00000002 QUEUE u=3 o=12 sp=afs_deliver_to_call+0x449/0x72c
     kworker/1:2-1810  [001] ...1   164.770829: afs_call: c=00000002 PUT   u=2 o=12 sp=afs_process_async_call+0xdb/0x11e
     kworker/1:2-1810  [001] ...2   164.771084: rxrpc_abort: c=00000002 95786a88:00000008 s=0 a=1 e=1 K-1
     kworker/1:2-1810  [001] ...1   164.771461: rxrpc_tx_packet: c=00000002 e9f1a7a8:95786a88:00000008:09c5 00000002 00000000 04 00 ABORT CallAbort
     kworker/1:2-1810  [001] ...1   164.771466: afs_call: c=00000002 PUT   u=1 o=12 sp=SRXAFSCB_ProbeUuid+0xc1/0x106

The abort generated in SRXAFSCB_ProbeUuid(), labelled "K-1", indicates that
the local filesystem/cache manager didn't recognise the UUID as its own.

Fixes: 2067b2b3f484 ("afs: Fix the CB.ProbeUuid service handler to reply correctly")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/cmservice.c |   14 ++++++++++++--
 fs/afs/internal.h  |   12 ++++++++++--
 fs/afs/rxrpc.c     |   33 ++++-----------------------------
 3 files changed, 26 insertions(+), 33 deletions(-)

diff --git a/fs/afs/cmservice.c b/fs/afs/cmservice.c
index ff3994a6be23..6765949b3aab 100644
--- a/fs/afs/cmservice.c
+++ b/fs/afs/cmservice.c
@@ -243,6 +243,17 @@ static void afs_cm_destructor(struct afs_call *call)
 	call->buffer = NULL;
 }
 
+/*
+ * Abort a service call from within an action function.
+ */
+static void afs_abort_service_call(struct afs_call *call, u32 abort_code, int error,
+				   const char *why)
+{
+	rxrpc_kernel_abort_call(call->net->socket, call->rxcall,
+				abort_code, error, why);
+	afs_set_call_complete(call, error, 0);
+}
+
 /*
  * The server supplied a list of callbacks that it wanted to break.
  */
@@ -510,8 +521,7 @@ static void SRXAFSCB_ProbeUuid(struct work_struct *work)
 	if (memcmp(r, &call->net->uuid, sizeof(call->net->uuid)) == 0)
 		afs_send_empty_reply(call);
 	else
-		rxrpc_kernel_abort_call(call->net->socket, call->rxcall,
-					1, 1, "K-1");
+		afs_abort_service_call(call, 1, 1, "K-1");
 
 	afs_put_call(call);
 	_leave("");
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 1d81fc4c3058..52de2112e1b1 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -154,7 +154,7 @@ struct afs_call {
 	};
 	unsigned char		unmarshall;	/* unmarshalling phase */
 	unsigned char		addr_ix;	/* Address in ->alist */
-	bool			incoming;	/* T if incoming call */
+	bool			drop_ref;	/* T if need to drop ref for incoming call */
 	bool			send_pages;	/* T if data from mapping should be sent */
 	bool			need_attention;	/* T if RxRPC poked us */
 	bool			async;		/* T if asynchronous */
@@ -1209,8 +1209,16 @@ static inline void afs_set_call_complete(struct afs_call *call,
 		ok = true;
 	}
 	spin_unlock_bh(&call->state_lock);
-	if (ok)
+	if (ok) {
 		trace_afs_call_done(call);
+
+		/* Asynchronous calls have two refs to release - one from the alloc and
+		 * one queued with the work item - and we can't just deallocate the
+		 * call because the work item may be queued again.
+		 */
+		if (call->drop_ref)
+			afs_put_call(call);
+	}
 }
 
 /*
diff --git a/fs/afs/rxrpc.c b/fs/afs/rxrpc.c
index 907d5948564a..972e3aafa361 100644
--- a/fs/afs/rxrpc.c
+++ b/fs/afs/rxrpc.c
@@ -18,7 +18,6 @@ struct workqueue_struct *afs_async_calls;
 
 static void afs_wake_up_call_waiter(struct sock *, struct rxrpc_call *, unsigned long);
 static void afs_wake_up_async_call(struct sock *, struct rxrpc_call *, unsigned long);
-static void afs_delete_async_call(struct work_struct *);
 static void afs_process_async_call(struct work_struct *);
 static void afs_rx_new_call(struct sock *, struct rxrpc_call *, unsigned long);
 static void afs_rx_discard_new_call(struct rxrpc_call *, unsigned long);
@@ -402,8 +401,10 @@ void afs_make_call(struct afs_addr_cursor *ac, struct afs_call *call, gfp_t gfp)
 	/* If the call is going to be asynchronous, we need an extra ref for
 	 * the call to hold itself so the caller need not hang on to its ref.
 	 */
-	if (call->async)
+	if (call->async) {
 		afs_get_call(call, afs_call_trace_get);
+		call->drop_ref = true;
+	}
 
 	/* create a call */
 	rxcall = rxrpc_kernel_begin_call(call->net->socket, srx, call->key,
@@ -585,8 +586,6 @@ static void afs_deliver_to_call(struct afs_call *call)
 done:
 	if (call->type->done)
 		call->type->done(call);
-	if (state == AFS_CALL_COMPLETE && call->incoming)
-		afs_put_call(call);
 out:
 	_leave("");
 	return;
@@ -745,21 +744,6 @@ static void afs_wake_up_async_call(struct sock *sk, struct rxrpc_call *rxcall,
 	}
 }
 
-/*
- * Delete an asynchronous call.  The work item carries a ref to the call struct
- * that we need to release.
- */
-static void afs_delete_async_call(struct work_struct *work)
-{
-	struct afs_call *call = container_of(work, struct afs_call, async_work);
-
-	_enter("");
-
-	afs_put_call(call);
-
-	_leave("");
-}
-
 /*
  * Perform I/O processing on an asynchronous call.  The work item carries a ref
  * to the call struct that we either need to release or to pass on.
@@ -775,16 +759,6 @@ static void afs_process_async_call(struct work_struct *work)
 		afs_deliver_to_call(call);
 	}
 
-	if (call->state == AFS_CALL_COMPLETE) {
-		/* We have two refs to release - one from the alloc and one
-		 * queued with the work item - and we can't just deallocate the
-		 * call because the work item may be queued again.
-		 */
-		call->async_work.func = afs_delete_async_call;
-		if (!queue_work(afs_async_calls, &call->async_work))
-			afs_put_call(call);
-	}
-
 	afs_put_call(call);
 	_leave("");
 }
@@ -811,6 +785,7 @@ void afs_charge_preallocation(struct work_struct *work)
 			if (!call)
 				break;
 
+			call->drop_ref = true;
 			call->async = true;
 			call->state = AFS_CALL_SV_AWAIT_OP_ID;
 			init_waitqueue_head(&call->waitq);



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
