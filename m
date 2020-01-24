Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 023C914919B
	for <lists+linux-afs@lfdr.de>; Sat, 25 Jan 2020 00:08:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qnS5b9CnqCh1mtzH1w94GZzcm7WyzHErpno2uUSomxo=; b=m4htqCECSYUxcH
	vu9tjn8k+oYFDJE7lXU73Q/LT9czi4Gya6BKbwuY4/bkHXeFUZvD2HLcRD2DD57pr/fhF9Wp4QOKc
	wS9eAySAQHH/wl76ruZUe0BSE1ArIeeG8/5Qinmj1ojqRSy6wsTiGthi4aMr4v0tT9BH+zHMwpZJz
	yvx/7pBJGs/INAPUiiuR8fvySALnX/4oVUVg/xVQnxs7msbf7yybmquAGRwXAzSeVALbFjBSfVvkF
	kPDt/H5fLuPjCfcK0j8b+FU8SmXmFMVhK6b+1KcBROtLHIsig8AXobybIA3Dc4lUHXy41wx+FgHEF
	6bBSFRuglSkLP4i7e3bw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iv83t-0003CG-3B; Fri, 24 Jan 2020 23:08:25 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iv83o-0003BD-O9
 for linux-afs@lists.infradead.org; Fri, 24 Jan 2020 23:08:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579907295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+pQMYieQNovVhRg3Nj/s2qkdJCjR5iAcrsF/1uR16VA=;
 b=eKe/I+8y496DQTQAEO4HABUd6kSyiUcdJXusf30QQ/Lzca2vCEmjzQmm91koeOH6p9T+qX
 YEfDo4KFc3ZGK0waJ8ZJI4/9J1aSEf6Ugtqv0wswh1omjuw/OlQmdLJL6axnKqAH57uEV2
 nz8rHdojssK6VkpEY8qDI2BtGfHDYAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-gAWFFvPeNi-kbmFD8NKbCw-1; Fri, 24 Jan 2020 18:08:07 -0500
X-MC-Unique: gAWFFvPeNi-kbmFD8NKbCw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA878107ACCD;
 Fri, 24 Jan 2020 23:08:05 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-49.rdu2.redhat.com
 [10.10.120.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F2D33CCA;
 Fri, 24 Jan 2020 23:08:05 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net] rxrpc: Fix use-after-free in rxrpc_receive_data()
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Fri, 24 Jan 2020 23:08:04 +0000
Message-ID: <157990728440.1173687.14473656600696398776.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.19
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200124_150821_083302_B4AF127B 
X-CRM114-Status: GOOD (  16.23  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.120 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [207.211.31.120 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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

The subpacket scanning loop in rxrpc_receive_data() references the
subpacket count in the private data part of the sk_buff in the loop
termination condition.  However, when the final subpacket is pasted into
the ring buffer, the function is no longer has a ref on the sk_buff and
should not be looking at sp->* any more.  This point is actually marked in
the code when skb is cleared (but sp is not - which is an error).

Fix this by caching sp->nr_subpackets in a local variable and using that
instead.

Also clear 'sp' to catch accesses after that point.

This can show up as an oops in rxrpc_get_skb() if sp->nr_subpackets gets
trashed by the sk_buff getting freed and reused in the meantime.

Fixes: e2de6c404898 ("rxrpc: Use info in skbuff instead of reparsing a jumbo packet")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 net/rxrpc/input.c |   12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/net/rxrpc/input.c b/net/rxrpc/input.c
index 86bd133b4fa0..96d54e5bf7bc 100644
--- a/net/rxrpc/input.c
+++ b/net/rxrpc/input.c
@@ -413,7 +413,7 @@ static void rxrpc_input_data(struct rxrpc_call *call, struct sk_buff *skb)
 {
 	struct rxrpc_skb_priv *sp = rxrpc_skb(skb);
 	enum rxrpc_call_state state;
-	unsigned int j;
+	unsigned int j, nr_subpackets;
 	rxrpc_serial_t serial = sp->hdr.serial, ack_serial = 0;
 	rxrpc_seq_t seq0 = sp->hdr.seq, hard_ack;
 	bool immediate_ack = false, jumbo_bad = false;
@@ -457,7 +457,8 @@ static void rxrpc_input_data(struct rxrpc_call *call, struct sk_buff *skb)
 	call->ackr_prev_seq = seq0;
 	hard_ack = READ_ONCE(call->rx_hard_ack);
 
-	if (sp->nr_subpackets > 1) {
+	nr_subpackets = sp->nr_subpackets;
+	if (nr_subpackets > 1) {
 		if (call->nr_jumbo_bad > 3) {
 			ack = RXRPC_ACK_NOSPACE;
 			ack_serial = serial;
@@ -465,11 +466,11 @@ static void rxrpc_input_data(struct rxrpc_call *call, struct sk_buff *skb)
 		}
 	}
 
-	for (j = 0; j < sp->nr_subpackets; j++) {
+	for (j = 0; j < nr_subpackets; j++) {
 		rxrpc_serial_t serial = sp->hdr.serial + j;
 		rxrpc_seq_t seq = seq0 + j;
 		unsigned int ix = seq & RXRPC_RXTX_BUFF_MASK;
-		bool terminal = (j == sp->nr_subpackets - 1);
+		bool terminal = (j == nr_subpackets - 1);
 		bool last = terminal && (sp->rx_flags & RXRPC_SKB_INCL_LAST);
 		u8 flags, annotation = j;
 
@@ -506,7 +507,7 @@ static void rxrpc_input_data(struct rxrpc_call *call, struct sk_buff *skb)
 		}
 
 		if (call->rxtx_buffer[ix]) {
-			rxrpc_input_dup_data(call, seq, sp->nr_subpackets > 1,
+			rxrpc_input_dup_data(call, seq, nr_subpackets > 1,
 					     &jumbo_bad);
 			if (ack != RXRPC_ACK_DUPLICATE) {
 				ack = RXRPC_ACK_DUPLICATE;
@@ -564,6 +565,7 @@ static void rxrpc_input_data(struct rxrpc_call *call, struct sk_buff *skb)
 			 * ring.
 			 */
 			skb = NULL;
+			sp = NULL;
 		}
 
 		if (last) {



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
