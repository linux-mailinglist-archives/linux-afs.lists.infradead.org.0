Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 57513127CBB
	for <lists+linux-afs@lfdr.de>; Fri, 20 Dec 2019 15:31:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q6FDxt/FZtDBb2/6/jS4YxWdl83ow430hE99MUX5amQ=; b=g9+1PGXhwWoB5+
	mAO7sqa0WgBA9Pcwjdmm5q3fh24b3MLE7NTO+8n2MBc03+yybC39nQ1Jsz2ywHRWmUs68AxOrQhrk
	KeTc0vPoiT+p4P1wOa26Pne3uFqJSdDrU56deMVglkSxMrh0Cq05Qn2k63YC16GC8qjWPH1vmijAY
	/4bVoRaO/m6ThoxwG1sMMA9bDEvjP/87E1pSi+SNlMm8CoK2Ecx4aD+YQqRmq9XHnV5uLEchSDGLb
	eHdlfygLPuQkmdMdjJp0SpNtTzKA+zlvdgNHZ6i+zU5fvhfKiYC2F4fFwmHzH/BhmPHxth6GynPMu
	kwlGUfNY65/II7B9UEPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiJIy-0002Cy-VN; Fri, 20 Dec 2019 14:31:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiJIL-0001df-LD
 for linux-afs@lists.infradead.org; Fri, 20 Dec 2019 14:30:26 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0308624687;
 Fri, 20 Dec 2019 14:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576852220;
 bh=qv6nHl3U2UK+MBIiMPGf+saM44ZLTVoUgETDroEouvg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=llPaCHswqe3qEvERiZkulS07251d66u9HyzKRBd4RMzR7Zo1eUbFwpWvuamflQf65
 SkXYtj0FTksciTxi+82CgtNyg6b+g2ba/pXxX1s1VScpNsiAxYIwR/WKH7FPhl8+pU
 Vmt9FPw2VTQA0gyZneCXLTzYDgzb6iHRHXPdWwzA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 19/52] afs: Fix afs_find_server lookups for ipv4
 peers
Date: Fri, 20 Dec 2019 09:29:21 -0500
Message-Id: <20191220142954.9500-19-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220142954.9500-1-sashal@kernel.org>
References: <20191220142954.9500-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_063021_762675_123A4582 
X-CRM114-Status: GOOD (  14.07  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: Marc Dionne <marc.dionne@auristor.com>, David Howells <dhowells@redhat.com>,
 linux-afs@lists.infradead.org, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: Marc Dionne <marc.dionne@auristor.com>

[ Upstream commit 9bd0160d12370a076e44f8d1320cde9c83f2c647 ]

afs_find_server tries to find a server that has an address that
matches the transport address of an rxrpc peer.  The code assumes
that the transport address is always ipv6, with ipv4 represented
as ipv4 mapped addresses, but that's not the case.  If the transport
family is AF_INET, srx->transport.sin6.sin6_addr.s6_addr32[] will
be beyond the actual ipv4 address and will always be 0, and all
ipv4 addresses will be seen as matching.

As a result, the first ipv4 address seen on any server will be
considered a match, and the server returned may be the wrong one.

One of the consequences is that callbacks received over ipv4 will
only be correctly applied for the server that happens to have the
first ipv4 address on the fs_addresses4 list.  Callbacks over ipv4
from all other servers are dropped, causing the client to serve stale
data.

This is fixed by looking at the transport family, and comparing ipv4
addresses based on a sockaddr_in structure rather than a sockaddr_in6.

Fixes: d2ddc776a458 ("afs: Overhaul volume and server record caching and fileserver rotation")
Signed-off-by: Marc Dionne <marc.dionne@auristor.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/afs/server.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/fs/afs/server.c b/fs/afs/server.c
index 64d440aaabc04..ca8115ba1724b 100644
--- a/fs/afs/server.c
+++ b/fs/afs/server.c
@@ -32,18 +32,11 @@ static void afs_dec_servers_outstanding(struct afs_net *net)
 struct afs_server *afs_find_server(struct afs_net *net,
 				   const struct sockaddr_rxrpc *srx)
 {
-	const struct sockaddr_in6 *a = &srx->transport.sin6, *b;
 	const struct afs_addr_list *alist;
 	struct afs_server *server = NULL;
 	unsigned int i;
-	bool ipv6 = true;
 	int seq = 0, diff;
 
-	if (srx->transport.sin6.sin6_addr.s6_addr32[0] == 0 ||
-	    srx->transport.sin6.sin6_addr.s6_addr32[1] == 0 ||
-	    srx->transport.sin6.sin6_addr.s6_addr32[2] == htonl(0xffff))
-		ipv6 = false;
-
 	rcu_read_lock();
 
 	do {
@@ -52,7 +45,8 @@ struct afs_server *afs_find_server(struct afs_net *net,
 		server = NULL;
 		read_seqbegin_or_lock(&net->fs_addr_lock, &seq);
 
-		if (ipv6) {
+		if (srx->transport.family == AF_INET6) {
+			const struct sockaddr_in6 *a = &srx->transport.sin6, *b;
 			hlist_for_each_entry_rcu(server, &net->fs_addresses6, addr6_link) {
 				alist = rcu_dereference(server->addresses);
 				for (i = alist->nr_ipv4; i < alist->nr_addrs; i++) {
@@ -68,15 +62,16 @@ struct afs_server *afs_find_server(struct afs_net *net,
 				}
 			}
 		} else {
+			const struct sockaddr_in *a = &srx->transport.sin, *b;
 			hlist_for_each_entry_rcu(server, &net->fs_addresses4, addr4_link) {
 				alist = rcu_dereference(server->addresses);
 				for (i = 0; i < alist->nr_ipv4; i++) {
-					b = &alist->addrs[i].transport.sin6;
-					diff = ((u16 __force)a->sin6_port -
-						(u16 __force)b->sin6_port);
+					b = &alist->addrs[i].transport.sin;
+					diff = ((u16 __force)a->sin_port -
+						(u16 __force)b->sin_port);
 					if (diff == 0)
-						diff = ((u32 __force)a->sin6_addr.s6_addr32[3] -
-							(u32 __force)b->sin6_addr.s6_addr32[3]);
+						diff = ((u32 __force)a->sin_addr.s_addr -
+							(u32 __force)b->sin_addr.s_addr);
 					if (diff == 0)
 						goto found;
 				}
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
