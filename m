Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A16765D24D
	for <lists+linux-afs@lfdr.de>; Tue,  2 Jul 2019 17:04:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I4xjbCLKXJ2Wwl9cQt12seMFqp/gt/zvT1lB9ptE17c=; b=W9XNrWqd3nvhQg
	YqhcGGFZq4CCMfepNddOvKoSGsOTda3ydxI1U4FztRvtG5BPTQVRwhjxV0q0nFCGA3NCCuhupv4kI
	FlM17STB0xOnEH6yZZembgM8A+rfyAxNWHj36edNJPn788EggfD37W1l0EwQdfs+4tuL5KIPTAVva
	cokGHI+a/qxcnFV6vJUOps/njjL5K95jn/9D0YKxERWwQT/UQsH1V6aqugOZBRolKsQD4ARdKFg8N
	dEfrDtal5hzjvsb0irTnKEQtRMtYzFxnzpjygnbOw8yMGuW399ka60DVBpvn98xevWV1ehnva1ytU
	ebWfoMOCNKkF4pX/NbMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiKKg-0007gu-Eb; Tue, 02 Jul 2019 15:04:34 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiKKe-0007gR-Df
 for linux-afs@lists.infradead.org; Tue, 02 Jul 2019 15:04:33 +0000
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1B47730860B0;
 Tue,  2 Jul 2019 15:04:22 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-219.rdu2.redhat.com
 [10.10.120.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFFD978361;
 Tue,  2 Jul 2019 15:04:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net] rxrpc: Fix oops in tracepoint
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Tue, 02 Jul 2019 16:04:19 +0100
Message-ID: <156207985906.2089.12488693451155589820.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 02 Jul 2019 15:04:22 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_080432_500855_B643DFCD 
X-CRM114-Status: GOOD (  16.27  )
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
Cc: Marc Dionne <marc.dionne@auristor.com>, dhowells@redhat.com,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

If the rxrpc_eproto tracepoint is enabled, an oops will be cause by the
trace line that rxrpc_extract_header() tries to emit when a protocol error
occurs (typically because the packet is short) because the call argument is
NULL.

Fix this by using ?: to assume 0 as the debug_id if call is NULL.

This can then be induced by:

	echo -e '\0\0\0\0\0\0\0\0' | ncat -4u --send-only <addr> 20001

where addr has the following program running on it:

	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include <unistd.h>
	#include <sys/socket.h>
	#include <arpa/inet.h>
	#include <linux/rxrpc.h>
	int main(void)
	{
		struct sockaddr_rxrpc srx;
		int fd;
		memset(&srx, 0, sizeof(srx));
		srx.srx_family			= AF_RXRPC;
		srx.srx_service			= 0;
		srx.transport_type		= AF_INET;
		srx.transport_len		= sizeof(srx.transport.sin);
		srx.transport.sin.sin_family	= AF_INET;
		srx.transport.sin.sin_port	= htons(0x4e21);
		fd = socket(AF_RXRPC, SOCK_DGRAM, AF_INET6);
		bind(fd, (struct sockaddr *)&srx, sizeof(srx));
		sleep(20);
		return 0;
	}

It results in the following oops.

	BUG: kernel NULL pointer dereference, address: 0000000000000340
	#PF: supervisor read access in kernel mode
	#PF: error_code(0x0000) - not-present page
	...
	RIP: 0010:trace_event_raw_event_rxrpc_rx_eproto+0x47/0xac
	...
	Call Trace:
	 <IRQ>
	 rxrpc_extract_header+0x86/0x171
	 ? rcu_read_lock_sched_held+0x5d/0x63
	 ? rxrpc_new_skb+0xd4/0x109
	 rxrpc_input_packet+0xef/0x14fc
	 ? rxrpc_input_data+0x986/0x986
	 udp_queue_rcv_one_skb+0xbf/0x3d0
	 udp_unicast_rcv_skb.isra.8+0x64/0x71
	 ip_protocol_deliver_rcu+0xe4/0x1b4
	 ip_local_deliver+0xf0/0x154
	 __netif_receive_skb_one_core+0x50/0x6c
	 netif_receive_skb_internal+0x26b/0x2e9
	 napi_gro_receive+0xf8/0x1da
	 rtl8169_poll+0x303/0x4c4
	 net_rx_action+0x10e/0x333
	 __do_softirq+0x1a5/0x38f
	 irq_exit+0x54/0xc4
	 do_IRQ+0xda/0xf8
	 common_interrupt+0xf/0xf
	 </IRQ>
	 ...
	 ? cpuidle_enter_state+0x23c/0x34d
	 cpuidle_enter+0x2a/0x36
	 do_idle+0x163/0x1ea
	 cpu_startup_entry+0x1d/0x1f
	 start_secondary+0x157/0x172
	 secondary_startup_64+0xa4/0xb0

Fixes: a25e21f0bcd2 ("rxrpc, afs: Use debug_ids rather than pointers in traces")
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Marc Dionne <marc.dionne@auristor.com>
---

 include/trace/events/rxrpc.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/trace/events/rxrpc.h b/include/trace/events/rxrpc.h
index d85816878a52..cc1d060cbf13 100644
--- a/include/trace/events/rxrpc.h
+++ b/include/trace/events/rxrpc.h
@@ -1379,7 +1379,7 @@ TRACE_EVENT(rxrpc_rx_eproto,
 			     ),
 
 	    TP_fast_assign(
-		    __entry->call = call->debug_id;
+		    __entry->call = call ? call->debug_id : 0;
 		    __entry->serial = serial;
 		    __entry->why = why;
 			   ),


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
