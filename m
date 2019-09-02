Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C695A5412
	for <lists+linux-afs@lfdr.de>; Mon,  2 Sep 2019 12:34:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=92nZ2W4g5AoEhdAqrJM3k0dNfBoICWwges5hgTJVWU0=; b=JAORNZCFGh4rgM
	mUR/2/vLLeMzHJwA/35hIdnfeilQxnAc2kEZZivaSeGed6LjOQVMGu8LlWf0URdA6fYzGWOJZH32l
	jN/rHvtFfFnEmxYaYEWPv2A5lq3COMmRiQvP0DbAFFOPwYCJT/+9mC7yP3Kb1dcQ0CsK5YwxfXhvb
	6DenrtUjQXeB5OvtVq3poMosgbXcx8G5nWMib2gvQookugawrCTc/AFAp9MdgqzhmnbLtdRqLh4Gw
	R/S8w43r2nbY9+eZmFlnFVNzz2r/ngUtgflerBDGI3wBbb4ifP8EbpZ8uu9++lSnN0ib6FiSDUdU3
	XBJaCyKNCnZ9g4ExGRyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4jf7-0002BP-7A; Mon, 02 Sep 2019 10:34:17 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4jf1-0002Ae-PE
 for linux-afs@lists.infradead.org; Mon, 02 Sep 2019 10:34:13 +0000
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D3FFCC049E23;
 Mon,  2 Sep 2019 10:34:10 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D7D160C05;
 Mon,  2 Sep 2019 10:34:09 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net] rxrpc: Fix misplaced traceline
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Mon, 02 Sep 2019 11:34:08 +0100
Message-ID: <156742044878.3320.3639294965607016931.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Mon, 02 Sep 2019 10:34:10 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190902_033411_887864_0E931ED2 
X-CRM114-Status: GOOD (  13.99  )
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
Cc: dhowells@redhat.com, Hillf Danton <hdanton@sina.com>,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

There's a misplaced traceline in rxrpc_input_packet() which is looking at a
packet that just got released rather than the replacement packet.

Fix this by moving the traceline after the assignment that moves the new
packet pointer to the actual packet pointer.

Fixes: d0d5c0cd1e71 ("rxrpc: Use skb_unshare() rather than skb_cow_data()")
Reported-by: Hillf Danton <hdanton@sina.com>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 net/rxrpc/input.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rxrpc/input.c b/net/rxrpc/input.c
index d122c53c8697..157be1ff8697 100644
--- a/net/rxrpc/input.c
+++ b/net/rxrpc/input.c
@@ -1262,8 +1262,8 @@ int rxrpc_input_packet(struct sock *udp_sk, struct sk_buff *skb)
 
 			if (nskb != skb) {
 				rxrpc_eaten_skb(skb, rxrpc_skb_received);
-				rxrpc_new_skb(skb, rxrpc_skb_unshared);
 				skb = nskb;
+				rxrpc_new_skb(skb, rxrpc_skb_unshared);
 				sp = rxrpc_skb(skb);
 			}
 		}


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
