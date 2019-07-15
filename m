Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CC16569132
	for <lists+linux-afs@lfdr.de>; Mon, 15 Jul 2019 16:27:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q7p6vyr0md5JMP9dOpq3aOulCjYVANQl3Xi+Hwlls4k=; b=aPEg+4JC60CjNC
	52/J8ALek3NN0jlIsGbuOllpwdRo4R+CXFEWtd1ukHagu+gLuxHniQXLpZbZOMexE4hePRr3qlYKb
	8QK546u/aPgoOQh+FnkOkjiehkJmUszAGWDhtcJeoDk9GjtDwu8Ob/e3r88bURFjH3TY+pPwa1Hf/
	R+ogJKXoTaU2a345K/JjvWp0FbBy+0GZ0Bu6K7GgT3rP5o0ERxP6p8nhasLQ4Sp94+KWmMkLYuuh8
	yv0u++Y3+u+oyhOxLMQiN3vD926+gseOqsBpWavK+0ZtgpOMjY/wKFAjj/oKrketNckCBmMOPuwPU
	MH7cNMSLY1/uDC4erG4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hn1wj-0001ge-8u; Mon, 15 Jul 2019 14:27:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hn1wh-0001fM-99
 for linux-afs@lists.infradead.org; Mon, 15 Jul 2019 14:27:16 +0000
Received: from sasha-vm.mshome.net (unknown [73.61.17.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B72D21537;
 Mon, 15 Jul 2019 14:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563200834;
 bh=+l+RU1EN+SlH9uWGDITQYS+b2sZ/zrMGsEGFPYX/EXc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dlq5t2jV5oaDcgL1vhUfyrWSi+7MG68ZRZ6nj1HKNwT07j4DbcIMalQZVyslNQq8f
 XXaMnd8Nf0eFURpd2ColMadyFg4d00P1Ugz+0/cpDesZux9ptY718aLZjeUNCaF4Hv
 3kyR83QXFYVGKsKLbjXKYd+IjRm/gprWtyPzrkLM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 140/158] rxrpc: Fix oops in tracepoint
Date: Mon, 15 Jul 2019 10:17:51 -0400
Message-Id: <20190715141809.8445-140-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715141809.8445-1-sashal@kernel.org>
References: <20190715141809.8445-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190715_072715_352603_B634674A 
X-CRM114-Status: GOOD (  14.30  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 linux-afs@lists.infradead.org, "David S . Miller" <davem@davemloft.net>,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit 99f0eae653b2db64917d0b58099eb51e300b311d ]

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
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/trace/events/rxrpc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/trace/events/rxrpc.h b/include/trace/events/rxrpc.h
index 6d182746afab..147546e0c11b 100644
--- a/include/trace/events/rxrpc.h
+++ b/include/trace/events/rxrpc.h
@@ -1381,7 +1381,7 @@ TRACE_EVENT(rxrpc_rx_eproto,
 			     ),
 
 	    TP_fast_assign(
-		    __entry->call = call->debug_id;
+		    __entry->call = call ? call->debug_id : 0;
 		    __entry->serial = serial;
 		    __entry->why = why;
 			   ),
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
