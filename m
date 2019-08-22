Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BB64F99354
	for <lists+linux-afs@lfdr.de>; Thu, 22 Aug 2019 14:24:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hVkUlx1wLZneSGf8BJCL+0GL7/BuI2IPMo7Mpep/LNU=; b=jPW4VCjvH+DP+R
	hxK0LmH87H/8QQIhvOslLSZ/V+QH+HBnLHq+OmxW3qTGyB7PN/zzC05DSBm1E51bPD1Kf6KEQi7hg
	R6pcW0zR6X8lQqoYpUFyswxuCADoRUUfZtilrfvDa6y+mWHB54g+BOB5m7v2UOhyO3KCAbo3oVRKR
	vmPR9pR9tEzaNKlKhQlyLIvwLj2+IArvWFE0KOu9yhZy5gQJ8iv/3SMT4YKzImsqYYq7978mwBCN1
	X0jNd5IC6GwGskkV2l/rxyuAyYj38nW68GNlphN5yIgUHjXvFizLteBVJlle5CJ3hqlfYPLGch60m
	K1i5oKaeWPGmUc3b2Pug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0m8p-0006nR-Le; Thu, 22 Aug 2019 12:24:35 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0m8m-0006ll-7h
 for linux-afs@lists.infradead.org; Thu, 22 Aug 2019 12:24:33 +0000
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 023AA308427C;
 Thu, 22 Aug 2019 12:24:31 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F382C60BF3;
 Thu, 22 Aug 2019 12:24:30 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 9/9] rxrpc: Only call skb_cow_data() once per packet
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 22 Aug 2019 13:24:30 +0100
Message-ID: <156647667024.11061.16703783428256799077.stgit@warthog.procyon.org.uk>
In-Reply-To: <156647659913.11061.13764606104739742865.stgit@warthog.procyon.org.uk>
References: <156647659913.11061.13764606104739742865.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 22 Aug 2019 12:24:32 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190822_052432_309113_AC72BBC4 
X-CRM114-Status: GOOD (  19.12  )
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

Move the call of skb_cow_data() from rxkad into rxrpc_recvmsg_data() and do
it as soon as the packet is first seen.  This means that we only call this
function once per packet, even for a jumbo packet with a bunch of
subpackets.

In rxkad, we then have to guess how large a scatter-gather table we need
for decryption, particularly in rxkad_verify_packet_2().  We do this either
by creating an sg table that should be large enough, or by looking at
nr_frags on the skb.

Fixes: 17926a79320a ("[AF_RXRPC]: Provide secure RxRPC sockets for use by userspace and kernel both")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 net/rxrpc/ar-internal.h |    1 +
 net/rxrpc/input.c       |    1 +
 net/rxrpc/recvmsg.c     |   11 ++++++++++-
 net/rxrpc/rxkad.c       |   32 +++++++++-----------------------
 4 files changed, 21 insertions(+), 24 deletions(-)

diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index d784d58e0a0d..a42d6b833675 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -190,6 +190,7 @@ struct rxrpc_skb_priv {
 	u8		rx_flags;		/* Received packet flags */
 #define RXRPC_SKB_INCL_LAST	0x01		/* - Includes last packet */
 #define RXRPC_SKB_TX_BUFFER	0x02		/* - Is transmit buffer */
+#define RXRPC_SKB_NEEDS_COW	0x04		/* - Needs skb_cow_data() calling */
 	union {
 		int		remain;		/* amount of space remaining for next write */
 
diff --git a/net/rxrpc/input.c b/net/rxrpc/input.c
index 660b7eed39b7..4df39f391e9d 100644
--- a/net/rxrpc/input.c
+++ b/net/rxrpc/input.c
@@ -448,6 +448,7 @@ static void rxrpc_input_data(struct rxrpc_call *call, struct sk_buff *skb)
 	}
 
 	atomic_set(&sp->nr_ring_pins, 1);
+	sp->rx_flags |= RXRPC_SKB_NEEDS_COW;
 
 	if (call->state == RXRPC_CALL_SERVER_RECV_REQUEST) {
 		unsigned long timo = READ_ONCE(call->next_req_timo);
diff --git a/net/rxrpc/recvmsg.c b/net/rxrpc/recvmsg.c
index 82bb48d96526..ef50580b5295 100644
--- a/net/rxrpc/recvmsg.c
+++ b/net/rxrpc/recvmsg.c
@@ -305,7 +305,7 @@ static int rxrpc_recvmsg_data(struct socket *sock, struct rxrpc_call *call,
 			      size_t len, int flags, size_t *_offset)
 {
 	struct rxrpc_skb_priv *sp;
-	struct sk_buff *skb;
+	struct sk_buff *skb, *trailer;
 	rxrpc_serial_t serial;
 	rxrpc_seq_t hard_ack, top, seq;
 	size_t remain;
@@ -343,6 +343,15 @@ static int rxrpc_recvmsg_data(struct socket *sock, struct rxrpc_call *call,
 		rxrpc_see_skb(skb, rxrpc_skb_seen);
 		sp = rxrpc_skb(skb);
 
+		if (sp->rx_flags & RXRPC_SKB_NEEDS_COW) {
+			ret2 = skb_cow_data(skb, 0, &trailer);
+			if (ret2 < 0) {
+				ret = ret2;
+				goto out;
+			}
+			sp->rx_flags &= ~RXRPC_SKB_NEEDS_COW;
+		}
+
 		if (!(flags & MSG_PEEK)) {
 			serial = sp->hdr.serial;
 			serial += call->rxtx_annotations[ix] & RXRPC_RX_ANNO_SUBPACKET;
diff --git a/net/rxrpc/rxkad.c b/net/rxrpc/rxkad.c
index ae8cd8926456..c60c520fde7c 100644
--- a/net/rxrpc/rxkad.c
+++ b/net/rxrpc/rxkad.c
@@ -187,10 +187,8 @@ static int rxkad_secure_packet_encrypt(const struct rxrpc_call *call,
 	struct rxrpc_skb_priv *sp;
 	struct rxrpc_crypt iv;
 	struct scatterlist sg[16];
-	struct sk_buff *trailer;
 	unsigned int len;
 	u16 check;
-	int nsg;
 	int err;
 
 	sp = rxrpc_skb(skb);
@@ -214,15 +212,14 @@ static int rxkad_secure_packet_encrypt(const struct rxrpc_call *call,
 	crypto_skcipher_encrypt(req);
 
 	/* we want to encrypt the skbuff in-place */
-	nsg = skb_cow_data(skb, 0, &trailer);
-	err = -ENOMEM;
-	if (nsg < 0 || nsg > 16)
+	err = -EMSGSIZE;
+	if (skb_shinfo(skb)->nr_frags > 16)
 		goto out;
 
 	len = data_size + call->conn->size_align - 1;
 	len &= ~(call->conn->size_align - 1);
 
-	sg_init_table(sg, nsg);
+	sg_init_table(sg, ARRAY_SIZE(sg));
 	err = skb_to_sgvec(skb, sg, 0, len);
 	if (unlikely(err < 0))
 		goto out;
@@ -319,11 +316,10 @@ static int rxkad_verify_packet_1(struct rxrpc_call *call, struct sk_buff *skb,
 	struct rxkad_level1_hdr sechdr;
 	struct rxrpc_crypt iv;
 	struct scatterlist sg[16];
-	struct sk_buff *trailer;
 	bool aborted;
 	u32 data_size, buf;
 	u16 check;
-	int nsg, ret;
+	int ret;
 
 	_enter("");
 
@@ -336,11 +332,7 @@ static int rxkad_verify_packet_1(struct rxrpc_call *call, struct sk_buff *skb,
 	/* Decrypt the skbuff in-place.  TODO: We really want to decrypt
 	 * directly into the target buffer.
 	 */
-	nsg = skb_cow_data(skb, 0, &trailer);
-	if (nsg < 0 || nsg > 16)
-		goto nomem;
-
-	sg_init_table(sg, nsg);
+	sg_init_table(sg, ARRAY_SIZE(sg));
 	ret = skb_to_sgvec(skb, sg, offset, 8);
 	if (unlikely(ret < 0))
 		return ret;
@@ -388,10 +380,6 @@ static int rxkad_verify_packet_1(struct rxrpc_call *call, struct sk_buff *skb,
 	if (aborted)
 		rxrpc_send_abort_packet(call);
 	return -EPROTO;
-
-nomem:
-	_leave(" = -ENOMEM");
-	return -ENOMEM;
 }
 
 /*
@@ -406,7 +394,6 @@ static int rxkad_verify_packet_2(struct rxrpc_call *call, struct sk_buff *skb,
 	struct rxkad_level2_hdr sechdr;
 	struct rxrpc_crypt iv;
 	struct scatterlist _sg[4], *sg;
-	struct sk_buff *trailer;
 	bool aborted;
 	u32 data_size, buf;
 	u16 check;
@@ -423,12 +410,11 @@ static int rxkad_verify_packet_2(struct rxrpc_call *call, struct sk_buff *skb,
 	/* Decrypt the skbuff in-place.  TODO: We really want to decrypt
 	 * directly into the target buffer.
 	 */
-	nsg = skb_cow_data(skb, 0, &trailer);
-	if (nsg < 0)
-		goto nomem;
-
 	sg = _sg;
-	if (unlikely(nsg > 4)) {
+	nsg = skb_shinfo(skb)->nr_frags;
+	if (nsg <= 4) {
+		nsg = 4;
+	} else {
 		sg = kmalloc_array(nsg, sizeof(*sg), GFP_NOIO);
 		if (!sg)
 			goto nomem;


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
