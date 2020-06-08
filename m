Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6681F1F4C
	for <lists+linux-afs@lfdr.de>; Mon,  8 Jun 2020 20:50:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5HEmGNUKh76CL+05NBtSqI0P2/d+9rI1w26Yk8m8gwc=; b=luT36zFf7freaz
	OVGCziQZVycWJ5yefofuehU1VA+DNVACfiQBpTs3CoCyovCd51cpOrOiU8phojpouA3ktVMqjMaE+
	pZJakqWNgPdW1PjD1RwRYb3IGTG7wlSbc7LqeqvntS62OAzhOCwe+G66pVaBHXM9iL9NwuN0QhgR6
	WtIFuMUUqvrbkTdCERlieBctVwmxN3HKnwzFcJXGl27YYgEZEhMQM+M5YApaG2j3iyY8m/diPr5rJ
	3LuZ0JHSDxzkvpyp9sYosFMdBQnW20OCjht1yOyiNkZZ9lA0xByS/ROlgCGcxv3P2fUVXLFNuPSQ5
	gWR9XWg21+HHaEZMfzGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiMqZ-0005zC-Rh; Mon, 08 Jun 2020 18:50:11 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiMqW-0005Bs-1j
 for linux-afs@lists.infradead.org; Mon, 08 Jun 2020 18:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591642207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rH8MpXGVAV4nFViikxVNGQ6cewnlNkwGUrQ6pwHt3dQ=;
 b=bZdnpChFIkeT8EDEpv+ZwlnPRnRxleUsx4L3ysHKHz9zxg9ql8hisGmUOoA57DsgjlngCT
 oDSgJixQW9H9qniCp0Lt2BTXm356pMffOK6AP/hQYuKJi77ZzWxKvB04dlQWLBl+rdm84R
 ZSvDvbmIp/0BROx4SH2JuzbH/4q88VQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-y9DUsuAwMhaWWEpFPB7X8g-1; Mon, 08 Jun 2020 14:50:05 -0400
X-MC-Unique: y9DUsuAwMhaWWEpFPB7X8g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEC4B1005512;
 Mon,  8 Jun 2020 18:50:03 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BB8C100239B;
 Mon,  8 Jun 2020 18:50:02 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 2/2] rxrpc: Fix missing notification
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Mon, 08 Jun 2020 19:50:01 +0100
Message-ID: <159164220145.2758133.3370434050398146640.stgit@warthog.procyon.org.uk>
In-Reply-To: <159164218727.2758133.1046957228494479308.stgit@warthog.procyon.org.uk>
References: <159164218727.2758133.1046957228494479308.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_115008_206294_0FB07057 
X-CRM114-Status: GOOD (  18.92  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.139.110.120 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
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
Cc: Marc Dionne <marc.dionne@auristor.com>, dhowells@redhat.com,
 Gerry Seidman <gerry@auristor.com>, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Under some circumstances, rxrpc will fail a transmit a packet through the
underlying UDP socket (ie. UDP sendmsg returns an error).  This may result
in a call getting stuck.

In the instance being seen, where AFS tries to send a probe to the Volume
Location server, tracepoints show the UDP Tx failure (in this case returing
error 99 EADDRNOTAVAIL) and then nothing more:

 afs_make_vl_call: c=0000015d VL.GetCapabilities
 rxrpc_call: c=0000015d NWc u=1 sp=rxrpc_kernel_begin_call+0x106/0x170 [rxrpc] a=00000000dd89ee8a
 rxrpc_call: c=0000015d Gus u=2 sp=rxrpc_new_client_call+0x14f/0x580 [rxrpc] a=00000000e20e4b08
 rxrpc_call: c=0000015d SEE u=2 sp=rxrpc_activate_one_channel+0x7b/0x1c0 [rxrpc] a=00000000e20e4b08
 rxrpc_call: c=0000015d CON u=2 sp=rxrpc_kernel_begin_call+0x106/0x170 [rxrpc] a=00000000e20e4b08
 rxrpc_tx_fail: c=0000015d r=1 ret=-99 CallDataNofrag

The problem is that if the initial packet fails and the retransmission
timer hasn't been started, the call is set to completed and an error is
returned from rxrpc_send_data_packet() to rxrpc_queue_packet().  Though
rxrpc_instant_resend() is called, this does nothing because the call is
marked completed.

So rxrpc_notify_socket() isn't called and the error is passed back up to
rxrpc_send_data(), rxrpc_kernel_send_data() and thence to afs_make_call()
and afs_vl_get_capabilities() where it is simply ignored because it is
assumed that the result of a probe will be collected asynchronously.

Fileserver probing is similarly affected via afs_fs_get_capabilities().

Fix this by always issuing a notification in __rxrpc_set_call_completion()
if it shifts a call to the completed state, even if an error is also
returned to the caller through the function return value.

Also put in a little bit of optimisation to avoid taking the call
state_lock and disabling softirqs if the call is already in the completed
state and remove some now redundant rxrpc_notify_socket() calls.

Fixes: f5c17aaeb2ae ("rxrpc: Calls should only have one terminal state")
Reported-by: Gerry Seidman <gerry@auristor.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Marc Dionne <marc.dionne@auristor.com>
---

 net/rxrpc/call_event.c |    1 -
 net/rxrpc/conn_event.c |    7 +++----
 net/rxrpc/input.c      |    7 ++-----
 net/rxrpc/peer_event.c |    4 +---
 net/rxrpc/recvmsg.c    |   21 +++++++++++++--------
 net/rxrpc/sendmsg.c    |    6 ++----
 6 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/net/rxrpc/call_event.c b/net/rxrpc/call_event.c
index 2a65ac41055f..61a51c251e1b 100644
--- a/net/rxrpc/call_event.c
+++ b/net/rxrpc/call_event.c
@@ -320,7 +320,6 @@ void rxrpc_process_call(struct work_struct *work)
 
 	if (call->state == RXRPC_CALL_COMPLETE) {
 		del_timer_sync(&call->timer);
-		rxrpc_notify_socket(call);
 		goto out_put;
 	}
 
diff --git a/net/rxrpc/conn_event.c b/net/rxrpc/conn_event.c
index 06fcff2ebbba..447f55ca6886 100644
--- a/net/rxrpc/conn_event.c
+++ b/net/rxrpc/conn_event.c
@@ -173,10 +173,9 @@ static void rxrpc_abort_calls(struct rxrpc_connection *conn,
 			else
 				trace_rxrpc_rx_abort(call, serial,
 						     conn->abort_code);
-			if (rxrpc_set_call_completion(call, compl,
-						      conn->abort_code,
-						      conn->error))
-				rxrpc_notify_socket(call);
+			rxrpc_set_call_completion(call, compl,
+						  conn->abort_code,
+						  conn->error);
 		}
 	}
 
diff --git a/net/rxrpc/input.c b/net/rxrpc/input.c
index 3be4177baf70..299ac98e9754 100644
--- a/net/rxrpc/input.c
+++ b/net/rxrpc/input.c
@@ -275,7 +275,6 @@ static bool rxrpc_end_tx_phase(struct rxrpc_call *call, bool reply_begun,
 
 	case RXRPC_CALL_SERVER_AWAIT_ACK:
 		__rxrpc_call_completed(call);
-		rxrpc_notify_socket(call);
 		state = call->state;
 		break;
 
@@ -1013,9 +1012,8 @@ static void rxrpc_input_abort(struct rxrpc_call *call, struct sk_buff *skb)
 
 	_proto("Rx ABORT %%%u { %x }", sp->hdr.serial, abort_code);
 
-	if (rxrpc_set_call_completion(call, RXRPC_CALL_REMOTELY_ABORTED,
-				      abort_code, -ECONNABORTED))
-		rxrpc_notify_socket(call);
+	rxrpc_set_call_completion(call, RXRPC_CALL_REMOTELY_ABORTED,
+				  abort_code, -ECONNABORTED);
 }
 
 /*
@@ -1102,7 +1100,6 @@ static void rxrpc_input_implicit_end_call(struct rxrpc_sock *rx,
 	spin_lock(&rx->incoming_lock);
 	__rxrpc_disconnect_call(conn, call);
 	spin_unlock(&rx->incoming_lock);
-	rxrpc_notify_socket(call);
 }
 
 /*
diff --git a/net/rxrpc/peer_event.c b/net/rxrpc/peer_event.c
index b1449d971883..4704a8dceced 100644
--- a/net/rxrpc/peer_event.c
+++ b/net/rxrpc/peer_event.c
@@ -289,9 +289,7 @@ static void rxrpc_distribute_error(struct rxrpc_peer *peer, int error,
 
 	hlist_for_each_entry_rcu(call, &peer->error_targets, error_link) {
 		rxrpc_see_call(call);
-		if (call->state < RXRPC_CALL_COMPLETE &&
-		    rxrpc_set_call_completion(call, compl, 0, -error))
-			rxrpc_notify_socket(call);
+		rxrpc_set_call_completion(call, compl, 0, -error);
 	}
 }
 
diff --git a/net/rxrpc/recvmsg.c b/net/rxrpc/recvmsg.c
index 6c4ba4224ddc..2989742a4aa1 100644
--- a/net/rxrpc/recvmsg.c
+++ b/net/rxrpc/recvmsg.c
@@ -73,6 +73,7 @@ bool __rxrpc_set_call_completion(struct rxrpc_call *call,
 		call->state = RXRPC_CALL_COMPLETE;
 		trace_rxrpc_call_complete(call);
 		wake_up(&call->waitq);
+		rxrpc_notify_socket(call);
 		return true;
 	}
 	return false;
@@ -83,11 +84,13 @@ bool rxrpc_set_call_completion(struct rxrpc_call *call,
 			       u32 abort_code,
 			       int error)
 {
-	bool ret;
+	bool ret = false;
 
-	write_lock_bh(&call->state_lock);
-	ret = __rxrpc_set_call_completion(call, compl, abort_code, error);
-	write_unlock_bh(&call->state_lock);
+	if (call->state < RXRPC_CALL_COMPLETE) {
+		write_lock_bh(&call->state_lock);
+		ret = __rxrpc_set_call_completion(call, compl, abort_code, error);
+		write_unlock_bh(&call->state_lock);
+	}
 	return ret;
 }
 
@@ -101,11 +104,13 @@ bool __rxrpc_call_completed(struct rxrpc_call *call)
 
 bool rxrpc_call_completed(struct rxrpc_call *call)
 {
-	bool ret;
+	bool ret = false;
 
-	write_lock_bh(&call->state_lock);
-	ret = __rxrpc_call_completed(call);
-	write_unlock_bh(&call->state_lock);
+	if (call->state < RXRPC_CALL_COMPLETE) {
+		write_lock_bh(&call->state_lock);
+		ret = __rxrpc_call_completed(call);
+		write_unlock_bh(&call->state_lock);
+	}
 	return ret;
 }
 
diff --git a/net/rxrpc/sendmsg.c b/net/rxrpc/sendmsg.c
index 5dd9ba000c00..1304b8608f56 100644
--- a/net/rxrpc/sendmsg.c
+++ b/net/rxrpc/sendmsg.c
@@ -261,10 +261,8 @@ static int rxrpc_queue_packet(struct rxrpc_sock *rx, struct rxrpc_call *call,
 		case -ENETUNREACH:
 		case -EHOSTUNREACH:
 		case -ECONNREFUSED:
-			if (rxrpc_set_call_completion(call,
-						      RXRPC_CALL_LOCAL_ERROR,
-						      0, ret))
-				rxrpc_notify_socket(call);
+			rxrpc_set_call_completion(call, RXRPC_CALL_LOCAL_ERROR,
+						  0, ret);
 			goto out;
 		}
 		_debug("need instant resend %d", ret);



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
