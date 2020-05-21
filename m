Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B40F31DC731
	for <lists+linux-afs@lfdr.de>; Thu, 21 May 2020 08:57:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yo0iZtrmaXTZcTRLqkleQxHkKWYxMF/xntxIEz+lZUc=; b=kVka6JHuj/RQSg
	A6XQboi0gySfaujUk3BlrbBXl/XG2XxEJKdc4838vPr9uoK8IeUK58W9SL4hGLiT0T4zBZbFUipQz
	q6b6TrjPOXwjFeEbK8cPs/mvFADvw8q5MUOSkXwzT5iuiUHHR62hQVMyzRGGY4u2PdAzwRg31h/Rh
	Zf0s3p+qa0qW+V0vLMltOwgXm4ivNU2jlY7Hn9pvPnct+mkcuqqOdv/vvuYciWnvB+zD3kNhRhH2Q
	mxZ56E4QHQhAQolfaTt5embZMd0n6XGVlQa+ziHtX+YkeXZqAgTKFKz2txqcw3JwKeICf/fZE4c+6
	vuJGfC+jgsyb5V2rjkZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbf8b-0004Hc-UQ; Thu, 21 May 2020 06:57:05 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbf8Z-0004G1-0P
 for linux-afs@lists.infradead.org; Thu, 21 May 2020 06:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590044222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wIIcferyx3v8iJv6FNcaMyU6kKt78I4hYTeWRH84Yak=;
 b=YMD2t/tHDGsjZj+V0JYAtxzOldTkgowto6JkpByzDK3AzLvOfberKIsPIJvzcFgORFUXr7
 jObaulsg0pXcgk22xW5PMz/V1y7u3cp08IAj11uyr5MDW6NOK7elXzTZhkpTugORK/iMXy
 1TnR6Omk2jZm9wNJqmL9K9SE4FcpySI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-qpCS5VBUPNKSoQODLCurxw-1; Thu, 21 May 2020 02:57:00 -0400
X-MC-Unique: qpCS5VBUPNKSoQODLCurxw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6353387300F;
 Thu, 21 May 2020 06:56:59 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93DDE2E163;
 Thu, 21 May 2020 06:56:58 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 2/3] rxrpc: Trace discarded ACKs [ver #2]
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 21 May 2020 07:56:57 +0100
Message-ID: <159004421780.66254.7006799870996502371.stgit@warthog.procyon.org.uk>
In-Reply-To: <159004420353.66254.3034741691675793468.stgit@warthog.procyon.org.uk>
References: <159004420353.66254.3034741691675793468.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_235703_123606_F5A2752E 
X-CRM114-Status: GOOD (  11.73  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.61 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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

Add a tracepoint to track received ACKs that are discarded due to being
outside of the Tx window.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/trace/events/rxrpc.h |   35 +++++++++++++++++++++++++++++++++++
 net/rxrpc/input.c            |   12 ++++++++++--
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/include/trace/events/rxrpc.h b/include/trace/events/rxrpc.h
index ab75f261f04a..ba9efdc848f9 100644
--- a/include/trace/events/rxrpc.h
+++ b/include/trace/events/rxrpc.h
@@ -1541,6 +1541,41 @@ TRACE_EVENT(rxrpc_notify_socket,
 		      __entry->serial)
 	    );
 
+TRACE_EVENT(rxrpc_rx_discard_ack,
+	    TP_PROTO(unsigned int debug_id, rxrpc_serial_t serial,
+		     rxrpc_seq_t first_soft_ack, rxrpc_seq_t call_ackr_first,
+		     rxrpc_seq_t prev_pkt, rxrpc_seq_t call_ackr_prev),
+
+	    TP_ARGS(debug_id, serial, first_soft_ack, call_ackr_first,
+		    prev_pkt, call_ackr_prev),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,	debug_id	)
+		    __field(rxrpc_serial_t,	serial		)
+		    __field(rxrpc_seq_t,	first_soft_ack)
+		    __field(rxrpc_seq_t,	call_ackr_first)
+		    __field(rxrpc_seq_t,	prev_pkt)
+		    __field(rxrpc_seq_t,	call_ackr_prev)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->debug_id		= debug_id;
+		    __entry->serial		= serial;
+		    __entry->first_soft_ack	= first_soft_ack;
+		    __entry->call_ackr_first	= call_ackr_first;
+		    __entry->prev_pkt		= prev_pkt;
+		    __entry->call_ackr_prev	= call_ackr_prev;
+			   ),
+
+	    TP_printk("c=%08x r=%08x %08x<%08x %08x<%08x",
+		      __entry->debug_id,
+		      __entry->serial,
+		      __entry->first_soft_ack,
+		      __entry->call_ackr_first,
+		      __entry->prev_pkt,
+		      __entry->call_ackr_prev)
+	    );
+
 #endif /* _TRACE_RXRPC_H */
 
 /* This part must be outside protection */
diff --git a/net/rxrpc/input.c b/net/rxrpc/input.c
index e438bfd3fdf5..2f22f082a66c 100644
--- a/net/rxrpc/input.c
+++ b/net/rxrpc/input.c
@@ -866,8 +866,12 @@ static void rxrpc_input_ack(struct rxrpc_call *call, struct sk_buff *skb)
 
 	/* Discard any out-of-order or duplicate ACKs (outside lock). */
 	if (before(first_soft_ack, call->ackr_first_seq) ||
-	    before(prev_pkt, call->ackr_prev_seq))
+	    before(prev_pkt, call->ackr_prev_seq)) {
+		trace_rxrpc_rx_discard_ack(call->debug_id, sp->hdr.serial,
+					   first_soft_ack, call->ackr_first_seq,
+					   prev_pkt, call->ackr_prev_seq);
 		return;
+	}
 
 	buf.info.rxMTU = 0;
 	ioffset = offset + nr_acks + 3;
@@ -879,8 +883,12 @@ static void rxrpc_input_ack(struct rxrpc_call *call, struct sk_buff *skb)
 
 	/* Discard any out-of-order or duplicate ACKs (inside lock). */
 	if (before(first_soft_ack, call->ackr_first_seq) ||
-	    before(prev_pkt, call->ackr_prev_seq))
+	    before(prev_pkt, call->ackr_prev_seq)) {
+		trace_rxrpc_rx_discard_ack(call->debug_id, sp->hdr.serial,
+					   first_soft_ack, call->ackr_first_seq,
+					   prev_pkt, call->ackr_prev_seq);
 		goto out;
+	}
 	call->acks_latest_ts = skb->tstamp;
 
 	call->ackr_first_seq = first_soft_ack;



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
