Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 87736CA5A4
	for <lists+linux-afs@lfdr.de>; Thu,  3 Oct 2019 18:46:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+qoMVGS4JiMqvZZdk6VcVZgrdgGsdjwePuO1TUtniNE=; b=E32XRJ0kUGHATG
	JIgdXzwJpF2L2J5YOB3g0XKqwJS9oq4kOrHBl43ITU06Oh3vqztjs6C7U+VsIArQAo0NYgtCGDzDf
	Lc8SkFyYy5fA/BOgfz38ro4Vx1MfOwM2gFWsrOTUygrFL7pG954jj6vsz99u7FycaqMgs/Ol1YCPG
	668uXydDXCzH1BZ522KPspc06KyzsXljq5wyF24sOWA7yccs6gT6Qx5NkGjqPH2XuLQiomuDmeV9t
	V7exw1dOZ2tcHu2JbdIc4W0zCgU9YT6H8NvFAheNg33sSF7RaoavNHbh4MLIr9oBEQzTPq1SegdZw
	95olDK4HT5iAuuwMUiCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iG4Er-0001Gk-VL; Thu, 03 Oct 2019 16:46:01 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iG4Ep-0001FZ-0d
 for linux-afs@lists.infradead.org; Thu, 03 Oct 2019 16:46:00 +0000
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C648065998;
 Thu,  3 Oct 2019 16:45:58 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-125-72.rdu2.redhat.com
 [10.10.125.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD3CE46;
 Thu,  3 Oct 2019 16:45:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net-next] rxrpc: Add missing "new peer" trace
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 03 Oct 2019 17:45:57 +0100
Message-ID: <157012115701.21124.13973726693523106899.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Thu, 03 Oct 2019 16:45:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191003_094559_076744_3C102765 
X-CRM114-Status: GOOD (  12.44  )
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

There was supposed to be a trace indicating that a new peer had been
created.  Add it.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 net/rxrpc/peer_object.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/rxrpc/peer_object.c b/net/rxrpc/peer_object.c
index 9c3ac96f71cb..bf4dd6cf79a0 100644
--- a/net/rxrpc/peer_object.c
+++ b/net/rxrpc/peer_object.c
@@ -209,6 +209,7 @@ static void rxrpc_assess_MTU_size(struct rxrpc_sock *rx,
  */
 struct rxrpc_peer *rxrpc_alloc_peer(struct rxrpc_local *local, gfp_t gfp)
 {
+	const void *here = __builtin_return_address(0);
 	struct rxrpc_peer *peer;
 
 	_enter("");
@@ -230,6 +231,7 @@ struct rxrpc_peer *rxrpc_alloc_peer(struct rxrpc_local *local, gfp_t gfp)
 			peer->cong_cwnd = 3;
 		else
 			peer->cong_cwnd = 4;
+		trace_rxrpc_peer(peer, rxrpc_peer_new, 1, here);
 	}
 
 	_leave(" = %p", peer);


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
