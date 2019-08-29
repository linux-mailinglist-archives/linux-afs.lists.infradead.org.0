Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8A6A1ADC
	for <lists+linux-afs@lfdr.de>; Thu, 29 Aug 2019 15:07:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZqHJqDpgK9JxBFawJoe34XZ4ASYcI9J/8hE5FSuV4Ko=; b=C9gPR2cf3KRPed
	O6aqIy1c8CUJUFD8k0QobqI4UYCIk8hfK7h647Tp46q/RsELrNzqz0IntoXPal8VA8f+AJxO92T0G
	tia5zirefc2ARhXDx7DcEfT5a8twAi7FioJEx6XpqwqDIK2Dbeo1eEXspzNrFC7qP9lBkhhgzZhsE
	6FjokzCOvMEhTGle2uGbZYD86TiWZ1dkS4UCpNwjCavJd8XxtAYzaAxnCVtwlx7CWr9VeWUM7eKm0
	QFxNRdVg+8JU/P8sexxBPyVkYByKrVSggRaYCm385uXnuIeKSVsz8ye3hv4YnkJFH4GDYfLKeiHbZ
	uro9k1WMnJg+4HdQwU3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3K9Q-000163-S2; Thu, 29 Aug 2019 13:07:44 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3K9O-00015F-4v
 for linux-afs@lists.infradead.org; Thu, 29 Aug 2019 13:07:43 +0000
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D6E0018012CA;
 Thu, 29 Aug 2019 13:07:41 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D25B84116;
 Thu, 29 Aug 2019 13:07:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 1/7] rxrpc: Improve jumbo packet counting
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 29 Aug 2019 14:07:40 +0100
Message-ID: <156708406010.26102.14441247200172165798.stgit@warthog.procyon.org.uk>
In-Reply-To: <156708405310.26102.7954021163316252673.stgit@warthog.procyon.org.uk>
References: <156708405310.26102.7954021163316252673.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Thu, 29 Aug 2019 13:07:41 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_060742_228851_80B66225 
X-CRM114-Status: GOOD (  18.12  )
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

Improve the information stored about jumbo packets so that we don't need to
reparse them so much later.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeffrey Altman <jaltman@auristor.com>
---

 net/rxrpc/ar-internal.h |   10 +++++++---
 net/rxrpc/input.c       |   23 ++++++++++++++---------
 net/rxrpc/protocol.h    |    9 +++++++++
 3 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index 145335611af6..87cff6c218b6 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -185,11 +185,15 @@ struct rxrpc_host_header {
  * - max 48 bytes (struct sk_buff::cb)
  */
 struct rxrpc_skb_priv {
-	union {
-		u8		nr_jumbo;	/* Number of jumbo subpackets */
-	};
+	u8		nr_subpackets;		/* Number of subpackets */
+	u8		rx_flags;		/* Received packet flags */
+#define RXRPC_SKB_INCL_LAST	0x01		/* - Includes last packet */
 	union {
 		int		remain;		/* amount of space remaining for next write */
+
+		/* List of requested ACKs on subpackets */
+		unsigned long	rx_req_ack[(RXRPC_MAX_NR_JUMBO + BITS_PER_LONG - 1) /
+					   BITS_PER_LONG];
 	};
 
 	struct rxrpc_host_header hdr;		/* RxRPC packet header from this packet */
diff --git a/net/rxrpc/input.c b/net/rxrpc/input.c
index dd47d465d1d3..ffcec5117954 100644
--- a/net/rxrpc/input.c
+++ b/net/rxrpc/input.c
@@ -347,7 +347,7 @@ static bool rxrpc_receiving_reply(struct rxrpc_call *call)
 }
 
 /*
- * Scan a jumbo packet to validate its structure and to work out how many
+ * Scan a data packet to validate its structure and to work out how many
  * subpackets it contains.
  *
  * A jumbo packet is a collection of consecutive packets glued together with
@@ -358,16 +358,21 @@ static bool rxrpc_receiving_reply(struct rxrpc_call *call)
  * the last are RXRPC_JUMBO_DATALEN in size.  The last subpacket may be of any
  * size.
  */
-static bool rxrpc_validate_jumbo(struct sk_buff *skb)
+static bool rxrpc_validate_data(struct sk_buff *skb)
 {
 	struct rxrpc_skb_priv *sp = rxrpc_skb(skb);
 	unsigned int offset = sizeof(struct rxrpc_wire_header);
 	unsigned int len = skb->len;
-	int nr_jumbo = 1;
 	u8 flags = sp->hdr.flags;
 
-	do {
-		nr_jumbo++;
+	for (;;) {
+		if (flags & RXRPC_REQUEST_ACK)
+			__set_bit(sp->nr_subpackets, sp->rx_req_ack);
+		sp->nr_subpackets++;
+
+		if (!(flags & RXRPC_JUMBO_PACKET))
+			break;
+
 		if (len - offset < RXRPC_JUMBO_SUBPKTLEN)
 			goto protocol_error;
 		if (flags & RXRPC_LAST_PACKET)
@@ -376,9 +381,10 @@ static bool rxrpc_validate_jumbo(struct sk_buff *skb)
 		if (skb_copy_bits(skb, offset, &flags, 1) < 0)
 			goto protocol_error;
 		offset += sizeof(struct rxrpc_jumbo_header);
-	} while (flags & RXRPC_JUMBO_PACKET);
+	}
 
-	sp->nr_jumbo = nr_jumbo;
+	if (flags & RXRPC_LAST_PACKET)
+		sp->rx_flags |= RXRPC_SKB_INCL_LAST;
 	return true;
 
 protocol_error:
@@ -1237,8 +1243,7 @@ int rxrpc_input_packet(struct sock *udp_sk, struct sk_buff *skb)
 		if (sp->hdr.callNumber == 0 ||
 		    sp->hdr.seq == 0)
 			goto bad_message;
-		if (sp->hdr.flags & RXRPC_JUMBO_PACKET &&
-		    !rxrpc_validate_jumbo(skb))
+		if (!rxrpc_validate_data(skb))
 			goto bad_message;
 		break;
 
diff --git a/net/rxrpc/protocol.h b/net/rxrpc/protocol.h
index 99ce322d7caa..49bb972539aa 100644
--- a/net/rxrpc/protocol.h
+++ b/net/rxrpc/protocol.h
@@ -89,6 +89,15 @@ struct rxrpc_jumbo_header {
 #define RXRPC_JUMBO_DATALEN	1412	/* non-terminal jumbo packet data length */
 #define RXRPC_JUMBO_SUBPKTLEN	(RXRPC_JUMBO_DATALEN + sizeof(struct rxrpc_jumbo_header))
 
+/*
+ * The maximum number of subpackets that can possibly fit in a UDP packet is:
+ *
+ *	((max_IP - IP_hdr - UDP_hdr) / RXRPC_JUMBO_SUBPKTLEN) + 1
+ *	= ((65535 - 28 - 28) / 1416) + 1
+ *	= 46 non-terminal packets and 1 terminal packet.
+ */
+#define RXRPC_MAX_NR_JUMBO	47
+
 /*****************************************************************************/
 /*
  * on-the-wire Rx ACK packet data payload


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
