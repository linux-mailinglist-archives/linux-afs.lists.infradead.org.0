Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7D51F28E9
	for <lists+linux-afs@lfdr.de>; Tue,  9 Jun 2020 01:58:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Gm/Ec3yaaFgXJIKg5X5xUoe0n26A8Oxv+HMjqWPAhY=; b=cKNVaa7K9Onu1b
	dwZk7R9Ns3rS/gB42julpIaroUXomai7iTGQtiDBi5TNdTlzcmujocTkMShUX0uIsHwgSTmYKA2Db
	Mofl2YNo1VVCin8wure9bfcmh2H7jvM2lyCPyMhJ/px7Y/QVgqeoj8Nt0/VUcSNexuCVOJy75VN+N
	aqTw8ZZ+S02qBeIBH9iQyyc3tYGa1n+1cdGOIYzmqRxOu+LIp8rNetZHUT072a02Mq4YVlXpUikKg
	yfP336thw654eLWlIcs38mtMak8+Wmr3auubeMViUmqOropalQOxgDQrVhz7vDDJAlk0LKuHfSUjb
	tNBzWG27jUc2Kj4rxo7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiReM-0008Td-2Z; Mon, 08 Jun 2020 23:57:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiRLt-000727-Oh
 for linux-afs@bombadil.infradead.org; Mon, 08 Jun 2020 23:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=G7nMCOwuVHjRPS3Jz+mKz178Evd8XxPd4uTBJABMgM4=; b=M0bHjs4T99X0fyvZBDGM3ukZzL
 YzqZxoc+Nmj7bnsIiljV/g4TSt95x3wsx5HvzaL0+2kA3hSAr6c91l/TpzhuAaSoSqcJo32JIQ3vM
 cJWmRr7sOjCNJJA/wTeSvJrT/bXszX1Tsh5YmjS2w+ZGUac9ouwovx6QX9DANDO+H82j0OUTOicZf
 gY3bwUh8Jt/kmbGhHNtL81kgrUD3N4jK+9drvLdMwkrj2X0mpYMwgj+aEFFONYRVsk73ZynSjq287
 1V8TwuDVIS6ZF+BoacNXKjou7Kn0WU6IkGO1gpi+JC5l0NX/CfsBStmhECoHq/gyBE0H6aKs/YpuR
 yQdy18sA==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiR08-00085X-5P
 for linux-afs@lists.infradead.org; Mon, 08 Jun 2020 23:16:23 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 70A1C2085B;
 Mon,  8 Jun 2020 23:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658175;
 bh=RjmHMWWe8YXSrJwNZvIfEJBZB1lX6YjjRZ3JJxhnAPI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G+AwPl7sFXa84HUzLn/HMKrHySf/UhQCaUlBfCXqX9V8GJ4cdqQgWTT10zKKJYYFM
 Rw6OfiVPiBS8+L1H29vKdlNNAZ1xJ/UHcloa7MtKdR3hZrivL05uSuM+aen/EYdR7g
 J0SJhXlZAf8c46/Z8qtZ7dTZhmyMDHzQKGtw5BbA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 201/606] rxrpc: Fix ack discard
Date: Mon,  8 Jun 2020 19:05:26 -0400
Message-Id: <20200608231211.3363633-201-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_001620_776118_6FCBB615 
X-CRM114-Status: GOOD (  26.85  )
X-Spam-Score: -7.1 (-------)
X-Spam-Report: SpamAssassin version 3.4.4 on casper.infradead.org summary:
 Content analysis details:   (-7.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.9 BAYES_00               BODY: Bayes spam probability is 0 to 1%
 [score: 0.0000]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: David Howells <dhowells@redhat.com>, netdev@vger.kernel.org,
 linux-afs@lists.infradead.org, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit 441fdee1eaf050ef0040bde0d7af075c1c6a6d8b ]

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
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/rxrpc/input.c | 30 ++++++++++++++++++++++++++----
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
-- 
2.25.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
