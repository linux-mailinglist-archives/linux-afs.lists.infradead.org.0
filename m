Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 66761A1AD1
	for <lists+linux-afs@lfdr.de>; Thu, 29 Aug 2019 15:06:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YamVLywvr0EMI0VL59kIBFz2GRPWwybWKbgHlW47In4=; b=Egck+15qUAAH5w
	ZHFmD745FQzIlvQ0HAMwWxlgNQzSHG7wTtsVjl6dyiR8Odh5gWLwbLOUUu9kx7fHXIiJGDvwayxa0
	V2cC9IDoj9DQKbJBg+Nb1LMio7pkgCeTKxVEC8mZ5zpMadXLk/TF5yyAyImYXbFmPHTc/I3axkyZy
	4zf5PGvzKCXxfSTDbk/i+Us1IfxzCi+VyzHbHLAbCg6PFr6dxhXhxtfI5TcMeitbr0CzIrXSjQGPh
	2qHSJ//myJbH7Wn9vx+Xt9O7BJAaGK5ibdJoMjCJVxwa86FcPLgUbI/naYdaJzArkhlO1ceZ8xKnU
	x4xk1DAU54HDnEwl922w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3K8L-0000xh-Kz; Thu, 29 Aug 2019 13:06:37 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3K8J-0000xI-Cf
 for linux-afs@lists.infradead.org; Thu, 29 Aug 2019 13:06:36 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2B67A30842B0;
 Thu, 29 Aug 2019 13:06:35 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43D891001938;
 Thu, 29 Aug 2019 13:06:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 3/5] rxrpc: Add a private skb flag to indicate
 transmission-phase skbs
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 29 Aug 2019 14:06:33 +0100
Message-ID: <156708399348.25861.7642868902963020846.stgit@warthog.procyon.org.uk>
In-Reply-To: <156708397261.25861.2158085372781699276.stgit@warthog.procyon.org.uk>
References: <156708397261.25861.2158085372781699276.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 29 Aug 2019 13:06:35 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_060635_444147_32FB4006 
X-CRM114-Status: GOOD (  14.95  )
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

Add a flag in the private data on an skbuff to indicate that this is a
transmission-phase buffer rather than a receive-phase buffer.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 net/rxrpc/ar-internal.h |    1 +
 net/rxrpc/sendmsg.c     |    3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index 20d7907a5bc6..63d3a91ce5e9 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -188,6 +188,7 @@ struct rxrpc_skb_priv {
 	u8		nr_subpackets;		/* Number of subpackets */
 	u8		rx_flags;		/* Received packet flags */
 #define RXRPC_SKB_INCL_LAST	0x01		/* - Includes last packet */
+#define RXRPC_SKB_TX_BUFFER	0x02		/* - Is transmit buffer */
 	union {
 		int		remain;		/* amount of space remaining for next write */
 
diff --git a/net/rxrpc/sendmsg.c b/net/rxrpc/sendmsg.c
index bae14438f869..472dc3b7d91f 100644
--- a/net/rxrpc/sendmsg.c
+++ b/net/rxrpc/sendmsg.c
@@ -336,6 +336,8 @@ static int rxrpc_send_data(struct rxrpc_sock *rx,
 			if (!skb)
 				goto maybe_error;
 
+			sp = rxrpc_skb(skb);
+			sp->rx_flags |= RXRPC_SKB_TX_BUFFER;
 			rxrpc_new_skb(skb, rxrpc_skb_tx_new);
 
 			_debug("ALLOC SEND %p", skb);
@@ -346,7 +348,6 @@ static int rxrpc_send_data(struct rxrpc_sock *rx,
 			skb_reserve(skb, call->conn->security_size);
 			skb->len += call->conn->security_size;
 
-			sp = rxrpc_skb(skb);
 			sp->remain = chunk;
 			if (sp->remain > skb_tailroom(skb))
 				sp->remain = skb_tailroom(skb);


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
