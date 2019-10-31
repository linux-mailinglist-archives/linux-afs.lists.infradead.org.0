Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A75F5EAFF4
	for <lists+linux-afs@lfdr.de>; Thu, 31 Oct 2019 13:14:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6KfVit6WEDRd/Hw19ywFXxTHG9V5co7H2gzljJZyQA4=; b=fgd7ZH5VaixlH6
	3ZlAXyRc7FO1ybbjcjR4UIPpR5bLIzLm9tZFNs1sISogcP+RYbPfgn5e/yEJ/cbsyrk+aAaMq0K66
	RYqaW0/Z5RLenLO/vvPHrpD7g1OTkasAoK4NGa5677zG9R96M620diWCP4V7gugsrWxU4px8B/luc
	59fR9tMpHUy8DBmvwHE+tva8rKc3mvgsfFHdKAcEmfM1HcaLCL99zUAzKgzgxXhRHuv8THdyzNaj7
	+scGXSg8feejabttqOesmstigsvSPpOXfZxAOtT6TuRofKkGDQkotgbrdZPnfIVXKRQdPcI7wki9J
	wAHoDgxggR5DVY3VTG3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQ9Kx-0000dG-Uo; Thu, 31 Oct 2019 12:13:59 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQ9Kt-0000YM-G4
 for linux-afs@lists.infradead.org; Thu, 31 Oct 2019 12:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572524033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Mpaz5iScARrazdtK8hPiRCxl6YGYTd9auym8Ja22A8M=;
 b=i4WhJYrJvIa+M8XWOoqfuJ1hFiG4ZeWVlFawGWpQEJt7q/hHzSdNWrbVQafAs1WIQareit
 62xdUXC5ULVOR5RQEc3ZjRnsMuc0OCZymGSJ032ys3U/dk/dmrf4h7fvNU4uOXOCTXSNlx
 y36rcCDxCEXcihJdWfOesLX6L2bjXrc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-S5GbFTSyPsCvpNbgGufomQ-1; Thu, 31 Oct 2019 08:13:49 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A4811005500;
 Thu, 31 Oct 2019 12:13:48 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-40.rdu2.redhat.com
 [10.10.121.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 876905DA7B;
 Thu, 31 Oct 2019 12:13:46 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net] rxrpc: Fix handling of last subpacket of jumbo packet
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 31 Oct 2019 12:13:46 +0000
Message-ID: <157252402623.30237.12555934347853871645.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: S5GbFTSyPsCvpNbgGufomQ-1
X-Mimecast-Spam-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_051355_651854_3943E742 
X-CRM114-Status: GOOD (  14.05  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [205.139.110.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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

When rxrpc_recvmsg_data() sets the return value to 1 because it's drained
all the data for the last packet, it checks the last-packet flag on the
whole packet - but this is wrong, since the last-packet flag is only set on
the final subpacket of the last jumbo packet.  This means that a call that
receives its last packet in a jumbo packet won't complete properly.

Fix this by having rxrpc_locate_data() determine the last-packet state of
the subpacket it's looking at and passing that back to the caller rather
than having the caller look in the packet header.  The caller then needs to
cache this in the rxrpc_call struct as rxrpc_locate_data() isn't then
called again for this packet.

Fixes: 248f219cb8bc ("rxrpc: Rewrite the data and ack handling code")
Fixes: e2de6c404898 ("rxrpc: Use info in skbuff instead of reparsing a jumbo packet")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 net/rxrpc/ar-internal.h |    1 +
 net/rxrpc/recvmsg.c     |   18 +++++++++++++-----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index ecc17dabec8f..7c7d10f2e0c1 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -601,6 +601,7 @@ struct rxrpc_call {
 	int			debug_id;	/* debug ID for printks */
 	unsigned short		rx_pkt_offset;	/* Current recvmsg packet offset */
 	unsigned short		rx_pkt_len;	/* Current recvmsg packet len */
+	bool			rx_pkt_last;	/* Current recvmsg packet is last */
 
 	/* Rx/Tx circular buffer, depending on phase.
 	 *
diff --git a/net/rxrpc/recvmsg.c b/net/rxrpc/recvmsg.c
index a4090797c9b2..8578c39ec839 100644
--- a/net/rxrpc/recvmsg.c
+++ b/net/rxrpc/recvmsg.c
@@ -267,11 +267,13 @@ static int rxrpc_verify_packet(struct rxrpc_call *call, struct sk_buff *skb,
  */
 static int rxrpc_locate_data(struct rxrpc_call *call, struct sk_buff *skb,
 			     u8 *_annotation,
-			     unsigned int *_offset, unsigned int *_len)
+			     unsigned int *_offset, unsigned int *_len,
+			     bool *_last)
 {
 	struct rxrpc_skb_priv *sp = rxrpc_skb(skb);
 	unsigned int offset = sizeof(struct rxrpc_wire_header);
 	unsigned int len;
+	bool last = false;
 	int ret;
 	u8 annotation = *_annotation;
 	u8 subpacket = annotation & RXRPC_RX_ANNO_SUBPACKET;
@@ -281,6 +283,8 @@ static int rxrpc_locate_data(struct rxrpc_call *call, struct sk_buff *skb,
 	len = skb->len - offset;
 	if (subpacket < sp->nr_subpackets - 1)
 		len = RXRPC_JUMBO_DATALEN;
+	else if (sp->rx_flags & RXRPC_SKB_INCL_LAST)
+		last = true;
 
 	if (!(annotation & RXRPC_RX_ANNO_VERIFIED)) {
 		ret = rxrpc_verify_packet(call, skb, annotation, offset, len);
@@ -291,6 +295,7 @@ static int rxrpc_locate_data(struct rxrpc_call *call, struct sk_buff *skb,
 
 	*_offset = offset;
 	*_len = len;
+	*_last = last;
 	call->security->locate_data(call, skb, _offset, _len);
 	return 0;
 }
@@ -309,7 +314,7 @@ static int rxrpc_recvmsg_data(struct socket *sock, struct rxrpc_call *call,
 	rxrpc_serial_t serial;
 	rxrpc_seq_t hard_ack, top, seq;
 	size_t remain;
-	bool last;
+	bool rx_pkt_last;
 	unsigned int rx_pkt_offset, rx_pkt_len;
 	int ix, copy, ret = -EAGAIN, ret2;
 
@@ -319,6 +324,7 @@ static int rxrpc_recvmsg_data(struct socket *sock, struct rxrpc_call *call,
 
 	rx_pkt_offset = call->rx_pkt_offset;
 	rx_pkt_len = call->rx_pkt_len;
+	rx_pkt_last = call->rx_pkt_last;
 
 	if (call->state >= RXRPC_CALL_SERVER_ACK_REQUEST) {
 		seq = call->rx_hard_ack;
@@ -329,6 +335,7 @@ static int rxrpc_recvmsg_data(struct socket *sock, struct rxrpc_call *call,
 	/* Barriers against rxrpc_input_data(). */
 	hard_ack = call->rx_hard_ack;
 	seq = hard_ack + 1;
+
 	while (top = smp_load_acquire(&call->rx_top),
 	       before_eq(seq, top)
 	       ) {
@@ -356,7 +363,8 @@ static int rxrpc_recvmsg_data(struct socket *sock, struct rxrpc_call *call,
 		if (rx_pkt_offset == 0) {
 			ret2 = rxrpc_locate_data(call, skb,
 						 &call->rxtx_annotations[ix],
-						 &rx_pkt_offset, &rx_pkt_len);
+						 &rx_pkt_offset, &rx_pkt_len,
+						 &rx_pkt_last);
 			trace_rxrpc_recvmsg(call, rxrpc_recvmsg_next, seq,
 					    rx_pkt_offset, rx_pkt_len, ret2);
 			if (ret2 < 0) {
@@ -396,13 +404,12 @@ static int rxrpc_recvmsg_data(struct socket *sock, struct rxrpc_call *call,
 		}
 
 		/* The whole packet has been transferred. */
-		last = sp->hdr.flags & RXRPC_LAST_PACKET;
 		if (!(flags & MSG_PEEK))
 			rxrpc_rotate_rx_window(call);
 		rx_pkt_offset = 0;
 		rx_pkt_len = 0;
 
-		if (last) {
+		if (rx_pkt_last) {
 			ASSERTCMP(seq, ==, READ_ONCE(call->rx_top));
 			ret = 1;
 			goto out;
@@ -415,6 +422,7 @@ static int rxrpc_recvmsg_data(struct socket *sock, struct rxrpc_call *call,
 	if (!(flags & MSG_PEEK)) {
 		call->rx_pkt_offset = rx_pkt_offset;
 		call->rx_pkt_len = rx_pkt_len;
+		call->rx_pkt_last = rx_pkt_last;
 	}
 done:
 	trace_rxrpc_recvmsg(call, rxrpc_recvmsg_data_return, seq,


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
