Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F0BD2CEB
	for <lists+linux-afs@lfdr.de>; Thu, 10 Oct 2019 16:52:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0E9Vq74JxWodo/pKteaU56EsiRb3RxYBhQVsl9nlv2Q=; b=Mwo3wjEoXf6zcN
	j8BdZJXY9sIhcUMe4cx5pU6xiAF5Bn1bE0Vjc6PIrXJOWr/8XbifSLLb4oSbqVGRKZGDC5tUGfZbf
	6j284wnbqkQ8W7F7De4gLrOIFeZNMX+l7omW80l1TnZ4ZP5moANZZJBHbnObMMORULThmx69Uy+lN
	Sa7ypw9Shl5s+v2TxwVKHdEfXWtjACH3fvf3IuYAB3o0QBAnnc0qTABzQbpGTLgz69ciGFH2cmcrI
	iLj2BVFC0DQKOodUfcLVTLmVYR1VgJOJoYc6gaD1qzKIlgFjqAsCffAgaphDR72Ax0v2q4kWpQI5w
	xAY/KLhPvmtUNPXrcT5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iIZnz-0008Ms-0q; Thu, 10 Oct 2019 14:52:39 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIZnw-0008MT-J8
 for linux-afs@lists.infradead.org; Thu, 10 Oct 2019 14:52:38 +0000
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0458A64467;
 Thu, 10 Oct 2019 14:52:36 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-84.rdu2.redhat.com
 [10.10.121.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BB4A196B2;
 Thu, 10 Oct 2019 14:52:35 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net] rxrpc: Fix possible NULL pointer access in ICMP handling
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 10 Oct 2019 15:52:34 +0100
Message-ID: <157071915431.29197.5055122258964729288.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 10 Oct 2019 14:52:36 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191010_075236_642843_7DB77039 
X-CRM114-Status: GOOD (  12.83  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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

If an ICMP packet comes in on the UDP socket backing an AF_RXRPC socket as
the UDP socket is being shut down, rxrpc_error_report() may get called to
deal with it after sk_user_data on the UDP socket has been cleared, leading
to a NULL pointer access when this local endpoint record gets accessed.

Fix this by just returning immediately if sk_user_data was NULL.

The oops looks like the following:

#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
...
RIP: 0010:rxrpc_error_report+0x1bd/0x6a9
...
Call Trace:
 ? sock_queue_err_skb+0xbd/0xde
 ? __udp4_lib_err+0x313/0x34d
 __udp4_lib_err+0x313/0x34d
 icmp_unreach+0x1ee/0x207
 icmp_rcv+0x25b/0x28f
 ip_protocol_deliver_rcu+0x95/0x10e
 ip_local_deliver+0xe9/0x148
 __netif_receive_skb_one_core+0x52/0x6e
 process_backlog+0xdc/0x177
 net_rx_action+0xf9/0x270
 __do_softirq+0x1b6/0x39a
 ? smpboot_register_percpu_thread+0xce/0xce
 run_ksoftirqd+0x1d/0x42
 smpboot_thread_fn+0x19e/0x1b3
 kthread+0xf1/0xf6
 ? kthread_delayed_work_timer_fn+0x83/0x83
 ret_from_fork+0x24/0x30

Fixes: 17926a79320a ("[AF_RXRPC]: Provide secure RxRPC sockets for use by userspace and kernel both")
Reported-by: syzbot+611164843bd48cc2190c@syzkaller.appspotmail.com
Signed-off-by: David Howells <dhowells@redhat.com>
---

 net/rxrpc/peer_event.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/rxrpc/peer_event.c b/net/rxrpc/peer_event.c
index c97ebdc043e4..61451281d74a 100644
--- a/net/rxrpc/peer_event.c
+++ b/net/rxrpc/peer_event.c
@@ -151,6 +151,9 @@ void rxrpc_error_report(struct sock *sk)
 	struct rxrpc_peer *peer;
 	struct sk_buff *skb;
 
+	if (unlikely(!local))
+		return;
+
 	_enter("%p{%d}", sk, local->debug_id);
 
 	/* Clear the outstanding error value on the socket so that it doesn't


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
