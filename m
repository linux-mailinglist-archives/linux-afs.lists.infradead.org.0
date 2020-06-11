Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E20A11F6F14
	for <lists+linux-afs@lfdr.de>; Thu, 11 Jun 2020 22:57:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NYXNpz4kqzVZiZ6gGulan0OhT3xOqJvan4iy79R1GAQ=; b=ZQfui12HE/Ss7M
	oC4dH0cJ2gRYunZ3V6cIMRSuZPDM+9G+2sUJtCmkw8P/xB28m0O6lJBmrRZUHo4JkRV5KLqt2lgPy
	dD61EiYJCbsImyYnuV1S8n+J3BqHiwu2fx9SNzMAJN6k5CLd1pLr6qqdbci2USms9pvag2AODqtUw
	Q3/5g3R2GHnVzMJM93DsN/00mKARac0kksxbOdJilURatQgOncef3ecyKp7bJ6XKSUSxr+DXoGi8N
	f4yg/ODVIr9bC+QRG5fVBxcKa0u2YiTGwBEK7W18DkJudv8M8cEuFfhyhzCufqlFJ5umwTbdfEcdd
	UExy+Vh18b1I+Y/pVn6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjUG9-0006RS-2N; Thu, 11 Jun 2020 20:57:13 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjUG6-0006Ph-74
 for linux-afs@lists.infradead.org; Thu, 11 Jun 2020 20:57:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591909027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=stO8jQvqNcwOWNIQtMJm8gAm7jWS/z8vF2BB4pQqyOU=;
 b=JltqDSWPq2N8AExk7pW+v7KeJfDH632DhXajz2vzdM5KtJ2f53gasBjr4dbVj9soeLxzGx
 bs4jsLYkvcB13yKmw2GU3ss1+vooyzc3ljwVkt8hD6yVbrcCA4/Z+Rk7WVBMPCHKl9Bl+d
 zTKa4NrS2LGgbUSvcgAa9aVdwAF3K+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-avyxs7TKMRShXit6EtYNNQ-1; Thu, 11 Jun 2020 16:57:03 -0400
X-MC-Unique: avyxs7TKMRShXit6EtYNNQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F229A107ACCA;
 Thu, 11 Jun 2020 20:57:01 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C5367F4DB;
 Thu, 11 Jun 2020 20:57:01 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net] rxrpc: Fix race between incoming ACK parser and
 retransmitter
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 11 Jun 2020 21:57:00 +0100
Message-ID: <159190902048.3557242.17524953697020439394.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_135710_328595_C541DA17 
X-CRM114-Status: GOOD (  15.67  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.139.110.61 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

There's a race between the retransmission code and the received ACK parser.
The problem is that the retransmission loop has to drop the lock under
which it is iterating through the transmission buffer in order to transmit
a packet, but whilst the lock is dropped, the ACK parser can crank the Tx
window round and discard the packets from the buffer.

The retransmission code then updated the annotations for the wrong packet
and a later retransmission thought it had to retransmit a packet that
wasn't there, leading to a NULL pointer dereference.

Fix this by:

 (1) Moving the annotation change to before we drop the lock prior to
     transmission.  This means we can't vary the annotation depending on
     the outcome of the transmission, but that's fine - we'll retransmit
     again later if it failed now.

 (2) Skipping the packet if the skb pointer is NULL.

The following oops was seen:

	BUG: kernel NULL pointer dereference, address: 000000000000002d
	Workqueue: krxrpcd rxrpc_process_call
	RIP: 0010:rxrpc_get_skb+0x14/0x8a
	...
	Call Trace:
	 rxrpc_resend+0x331/0x41e
	 ? get_vtime_delta+0x13/0x20
	 rxrpc_process_call+0x3c0/0x4ac
	 process_one_work+0x18f/0x27f
	 worker_thread+0x1a3/0x247
	 ? create_worker+0x17d/0x17d
	 kthread+0xe6/0xeb
	 ? kthread_delayed_work_timer_fn+0x83/0x83
	 ret_from_fork+0x1f/0x30

Fixes: 248f219cb8bc ("rxrpc: Rewrite the data and ack handling code")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 net/rxrpc/call_event.c |   29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/net/rxrpc/call_event.c b/net/rxrpc/call_event.c
index 61a51c251e1b..aa1c8eee6557 100644
--- a/net/rxrpc/call_event.c
+++ b/net/rxrpc/call_event.c
@@ -248,7 +248,18 @@ static void rxrpc_resend(struct rxrpc_call *call, unsigned long now_j)
 		if (anno_type != RXRPC_TX_ANNO_RETRANS)
 			continue;
 
+		/* We need to reset the retransmission state, but we need to do
+		 * so before we drop the lock as a new ACK/NAK may come in and
+		 * confuse things
+		 */
+		annotation &= ~RXRPC_TX_ANNO_MASK;
+		annotation |= RXRPC_TX_ANNO_RESENT;
+		call->rxtx_annotations[ix] = annotation;
+
 		skb = call->rxtx_buffer[ix];
+		if (!skb)
+			continue;
+
 		rxrpc_get_skb(skb, rxrpc_skb_got);
 		spin_unlock_bh(&call->lock);
 
@@ -262,24 +273,6 @@ static void rxrpc_resend(struct rxrpc_call *call, unsigned long now_j)
 
 		rxrpc_free_skb(skb, rxrpc_skb_freed);
 		spin_lock_bh(&call->lock);
-
-		/* We need to clear the retransmit state, but there are two
-		 * things we need to be aware of: A new ACK/NAK might have been
-		 * received and the packet might have been hard-ACK'd (in which
-		 * case it will no longer be in the buffer).
-		 */
-		if (after(seq, call->tx_hard_ack)) {
-			annotation = call->rxtx_annotations[ix];
-			anno_type = annotation & RXRPC_TX_ANNO_MASK;
-			if (anno_type == RXRPC_TX_ANNO_RETRANS ||
-			    anno_type == RXRPC_TX_ANNO_NAK) {
-				annotation &= ~RXRPC_TX_ANNO_MASK;
-				annotation |= RXRPC_TX_ANNO_UNACK;
-			}
-			annotation |= RXRPC_TX_ANNO_RESENT;
-			call->rxtx_annotations[ix] = annotation;
-		}
-
 		if (after(call->tx_hard_ack, seq))
 			seq = call->tx_hard_ack;
 	}



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
