Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C42361E8A98
	for <lists+linux-afs@lfdr.de>; Sat, 30 May 2020 00:00:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rw2F9xrIrN7VpWtxNfWMW3Cn3tfDP34Aj1o7ygw2TDg=; b=BspZa4+AVNTqny
	fCRoKiw/0Ss7cGqu1n/n4b1y/C5fsy9OW92ElSxzrAgx6SiG5XMQ30zKwEU/J58iarRdDmL7+xCSj
	MEfZ5tPDCw9hePSUQQCEoG3CeEb9N4wBzNHzac5J8UgBdDJodrBUxa8ApjYQ9aR3b6tT8TP8sMRdg
	loh1TBfU1fnYdvoxIBrN3lY59dTOyet0sMdBq+jIiNCSvmUChnKWlr0Y02NoVtkPkglh8Amg4MVcQ
	w+rRiIir4KZV80pjZUqEEcgihSLTP7parLBOSGrAP2ipBPpBW45qKqHAZ+nXOjGGODh6VbtIlm31K
	iES03jO/fCDQZ602t3/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jen3T-0001SG-13; Fri, 29 May 2020 22:00:43 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jen3Q-0001RF-9d
 for linux-afs@lists.infradead.org; Fri, 29 May 2020 22:00:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590789639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=70IZFh5behlXRlJRSzDmC2eijLSegUZJ/U/xqyRcr80=;
 b=aS3gJFcmSQ57fecA4XBbuToULOH3cdYy6QSceFAKrvd8FvMbc+2rgnt5ZtBD0/0r3ztcWE
 +FgR1WAlCdQDgpaVU26DZo6sYwtWxQQCRv806inboEVq9LtpTyxhbIjrf8v6L5O+wKSgdz
 fykfXrw9/+wMaQvDg7GQPLS/6n0551o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-xRgIiA0lNIeErHdBr19dRg-1; Fri, 29 May 2020 18:00:30 -0400
X-MC-Unique: xRgIiA0lNIeErHdBr19dRg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D471218A8221;
 Fri, 29 May 2020 22:00:29 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16A097B91C;
 Fri, 29 May 2020 22:00:23 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 03/27] rxrpc: Adjust /proc/net/rxrpc/calls to display
 call->debug_id not user_ID
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 29 May 2020 23:00:23 +0100
Message-ID: <159078962321.679399.13472724526939818025.stgit@warthog.procyon.org.uk>
In-Reply-To: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
References: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_150040_409650_14A0AF9D 
X-CRM114-Status: GOOD (  12.52  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.61 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

The user ID value isn't actually much use - and leaks a kernel pointer or a
userspace value - so replace it with the call debug ID, which appears in trace
points.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 net/rxrpc/proc.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/rxrpc/proc.c b/net/rxrpc/proc.c
index 8b179e3c802a..543afd9bd664 100644
--- a/net/rxrpc/proc.c
+++ b/net/rxrpc/proc.c
@@ -68,7 +68,7 @@ static int rxrpc_call_seq_show(struct seq_file *seq, void *v)
 			 "Proto Local                                          "
 			 " Remote                                         "
 			 " SvID ConnID   CallID   End Use State    Abort   "
-			 " UserID           TxSeq    TW RxSeq    RW RxSerial RxTimo\n");
+			 " DebugId  TxSeq    TW RxSeq    RW RxSerial RxTimo\n");
 		return 0;
 	}
 
@@ -100,7 +100,7 @@ static int rxrpc_call_seq_show(struct seq_file *seq, void *v)
 	rx_hard_ack = READ_ONCE(call->rx_hard_ack);
 	seq_printf(seq,
 		   "UDP   %-47.47s %-47.47s %4x %08x %08x %s %3u"
-		   " %-8.8s %08x %lx %08x %02x %08x %02x %08x %06lx\n",
+		   " %-8.8s %08x %08x %08x %02x %08x %02x %08x %06lx\n",
 		   lbuff,
 		   rbuff,
 		   call->service_id,
@@ -110,7 +110,7 @@ static int rxrpc_call_seq_show(struct seq_file *seq, void *v)
 		   atomic_read(&call->usage),
 		   rxrpc_call_states[call->state],
 		   call->abort_code,
-		   call->user_call_ID,
+		   call->debug_id,
 		   tx_hard_ack, READ_ONCE(call->tx_top) - tx_hard_ack,
 		   rx_hard_ack, READ_ONCE(call->rx_top) - rx_hard_ack,
 		   call->rx_serial,



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
