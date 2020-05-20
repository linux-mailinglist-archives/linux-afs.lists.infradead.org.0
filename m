Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D42311DC2CE
	for <lists+linux-afs@lfdr.de>; Thu, 21 May 2020 01:22:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7HMvIIOT4/TrTWnLXTAPhlHAK35cVpMMOcjIXpfPtSs=; b=m9mZtw8Gqw/Upv
	6bev4nALsXr+f0QY2IuDI1aSSDGyE+n6ARKTZzdja0zsTMNAVlsd+U9UB0M/KnpDfBxcR8S67cpLO
	lfEEarJGA4IhBS+gTi6wuO0IyLvs5Lm7gzueoo2GG4nYgwglJjLgmY3D0You+e+UNNvEMvpvnL1M0
	5kZJiWy1tNLl1KokpvzQGmfhCETPnBKCsj03lLGyzYxzQnf2KCsWxaT+HFDXXLK0LRjWqCIHrzNM9
	UKdxIhh+G3NjJIe/aIUhfyQkTVk1TL4nnA/Dy6aKC9zFJAhbVVcV7w/LPfNJFfDMiMm+rMLK7er6d
	eJe4mLD/qUio+qWOt0CQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbY2N-0005eM-Oa; Wed, 20 May 2020 23:22:11 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbY2K-0005cx-QF
 for linux-afs@lists.infradead.org; Wed, 20 May 2020 23:22:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590016927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9+Mv5i8MSKtHCvpHZZreAZlo0OINtZUjUsAoIOF5LUM=;
 b=Dx9edPWaNFKRa/43+X5Qz842Zimz/r1ApEf4A+wC/UINBtx9NLqa0dJ//XQ483qJmcXaR9
 zSjkmGR05PZRa8FmYIT69xdYUBCn8+KjUXAMQ9GJokh7hXhlgCPgXxHbYg2+kpl0n+8yoO
 g8AO437cZeH1VL6DoEXJ3SWim6gUnnw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-8fUOUOb2Oyi-IJNDdaVw5w-1; Wed, 20 May 2020 19:22:06 -0400
X-MC-Unique: 8fUOUOb2Oyi-IJNDdaVw5w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BB54835B40;
 Wed, 20 May 2020 23:22:05 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18D1D6EA26;
 Wed, 20 May 2020 23:22:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 3/3] rxrpc: Fix ack discard
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 21 May 2020 00:22:03 +0100
Message-ID: <159001692327.18663.7422193729175092836.stgit@warthog.procyon.org.uk>
In-Reply-To: <159001690181.18663.663730118645460940.stgit@warthog.procyon.org.uk>
References: <159001690181.18663.663730118645460940.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_162208_926230_AB6268FB 
X-CRM114-Status: GOOD (  21.38  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.61 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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

The Rx protocol has a "previousPacket" field in it that is not handled in
the same way by all protocol implementations.  Sometimes it contains the
serial number of the last DATA packet received, sometimes the sequence
number of the last DATA packet received and sometimes the highest sequence
number so far received.

AF_RXRPC is using this to weed out ACKs that are out of date (it's possible
for ACK packets to get reordered on the wire), but this does not work with
OpenAFS which will just stick the sequence number of the last packet seen
into previousPacket.

The issue being seen is that big AFS FS.StoreData RPC (eg. of ~256MiB) are
timing out when partly sent.  A trace was captured, with an additional
tracepoint to show ACKs being discarded in rxrpc_input_ack().  Here's an
excerpt showing the problem.

 52873.203230: rxrpc_tx_data: c=000004ae DATA ed1a3584:00000002 0002449c q=00024499 fl=09

A DATA packet with sequence number 00024499 has been transmitted (the "q="
field).

 ...
 52873.243296: rxrpc_rx_ack: c=000004ae 00012a2b DLY r=00024499 f=00024497 p=00024496 n=0
 52873.243376: rxrpc_rx_ack: c=000004ae 00012a2c IDL r=0002449b f=00024499 p=00024498 n=0
 52873.243383: rxrpc_rx_ack: c=000004ae 00012a2d OOS r=0002449d f=00024499 p=0002449a n=2

The Out-Of-Sequence ACK indicates that the server didn't see DATA sequence
number 00024499, but did see seq 0002449a (previousPacket, shown as "p=",
skipped the number, but firstPacket, "f=", which shows the bottom of the
window is set at that point).

 52873.252663: rxrpc_retransmit: c=000004ae q=24499 a=02 xp=14581537
 52873.252664: rxrpc_tx_data: c=000004ae DATA ed1a3584:00000002 000244bc q=00024499 fl=0b *RETRANS*

The packet has been retransmitted.  Retransmission recurs until the peer
says it got the packet.

 52873.271013: rxrpc_rx_ack: c=000004ae 00012a31 OOS r=000244a1 f=00024499 p=0002449e n=6

More OOS ACKs indicate that the other packets that are already in the
transmission pipeline are being received.  The specific-ACK list is up to 6
ACKs and NAKs.

 ...
 52873.284792: rxrpc_rx_ack: c=000004ae 00012a49 OOS r=000244b9 f=00024499 p=000244b6 n=30
 52873.284802: rxrpc_retransmit: c=000004ae q=24499 a=0a xp=63505500
 52873.284804: rxrpc_tx_data: c=000004ae DATA ed1a3584:00000002 000244c2 q=00024499 fl=0b *RETRANS*
 52873.287468: rxrpc_rx_ack: c=000004ae 00012a4a OOS r=000244ba f=00024499 p=000244b7 n=31
 52873.287478: rxrpc_rx_ack: c=000004ae 00012a4b OOS r=000244bb f=00024499 p=000244b8 n=32

At this point, the server's receive window is full (n=32) with presumably 1
NAK'd packet and 31 ACK'd packets.  We can't transmit any more packets.

 52873.287488: rxrpc_retransmit: c=000004ae q=24499 a=0a xp=61327980
 52873.287489: rxrpc_tx_data: c=000004ae DATA ed1a3584:00000002 000244c3 q=00024499 fl=0b *RETRANS*
 52873.293850: rxrpc_rx_ack: c=000004ae 00012a4c DLY r=000244bc f=000244a0 p=00024499 n=25

And now we've received an ACK indicating that a DATA retransmission was
received.  7 packets have been processed (the occupied part of the window
moved, as indicated by f= and n=).

 52873.293853: rxrpc_rx_discard_ack: c=000004ae r=00012a4c 000244a0<00024499 00024499<000244b8

However, the DLY ACK gets discarded because its previousPacket has gone
backwards (from p=000244b8, in the ACK at 52873.287478 to p=00024499 in the
ACK at 52873.293850).

We then end up in a continuous cycle of retransmit/discard.  kafs fails to
update its window because it's discarding the ACKs and can't transmit an
extra packet that would clear the issue because the window is full.
OpenAFS doesn't change the previousPacket value in the ACKs because no new
DATA packets are received with a different previousPacket number.

Fix this by altering the discard check to only discard an ACK based on
previousPacket if there was no advance in the firstPacket.  This allows us
to transmit a new packet which will cause previousPacket to advance in the
next ACK.

The check, however, needs to allow for the possibility that previousPacket
may actually have had the serial number placed in it instead - in which
case it will go outside the window and we should ignore it.

Fixes: 1a2391c30c0b ("rxrpc: Fix detection of out of order acks")
Reported-by: Dave Botsch <botsch@cnf.cornell.edu>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 net/rxrpc/input.c |   30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/net/rxrpc/input.c b/net/rxrpc/input.c
index 2f22f082a66c..3be4177baf70 100644
--- a/net/rxrpc/input.c
+++ b/net/rxrpc/input.c
@@ -802,6 +802,30 @@ static void rxrpc_input_soft_acks(struct rxrpc_call *call, u8 *acks,
 	}
 }
 
+/*
+ * Return true if the ACK is valid - ie. it doesn't appear to have regressed
+ * with respect to the ack state conveyed by preceding ACKs.
+ */
+static bool rxrpc_is_ack_valid(struct rxrpc_call *call,
+			       rxrpc_seq_t first_pkt, rxrpc_seq_t prev_pkt)
+{
+	rxrpc_seq_t base = READ_ONCE(call->ackr_first_seq);
+
+	if (after(first_pkt, base))
+		return true; /* The window advanced */
+
+	if (before(first_pkt, base))
+		return false; /* firstPacket regressed */
+
+	if (after_eq(prev_pkt, call->ackr_prev_seq))
+		return true; /* previousPacket hasn't regressed. */
+
+	/* Some rx implementations put a serial number in previousPacket. */
+	if (after_eq(prev_pkt, base + call->tx_winsize))
+		return false;
+	return true;
+}
+
 /*
  * Process an ACK packet.
  *
@@ -865,8 +889,7 @@ static void rxrpc_input_ack(struct rxrpc_call *call, struct sk_buff *skb)
 	}
 
 	/* Discard any out-of-order or duplicate ACKs (outside lock). */
-	if (before(first_soft_ack, call->ackr_first_seq) ||
-	    before(prev_pkt, call->ackr_prev_seq)) {
+	if (!rxrpc_is_ack_valid(call, first_soft_ack, prev_pkt)) {
 		trace_rxrpc_rx_discard_ack(call->debug_id, sp->hdr.serial,
 					   first_soft_ack, call->ackr_first_seq,
 					   prev_pkt, call->ackr_prev_seq);
@@ -882,8 +905,7 @@ static void rxrpc_input_ack(struct rxrpc_call *call, struct sk_buff *skb)
 	spin_lock(&call->input_lock);
 
 	/* Discard any out-of-order or duplicate ACKs (inside lock). */
-	if (before(first_soft_ack, call->ackr_first_seq) ||
-	    before(prev_pkt, call->ackr_prev_seq)) {
+	if (!rxrpc_is_ack_valid(call, first_soft_ack, prev_pkt)) {
 		trace_rxrpc_rx_discard_ack(call->debug_id, sp->hdr.serial,
 					   first_soft_ack, call->ackr_first_seq,
 					   prev_pkt, call->ackr_prev_seq);



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
