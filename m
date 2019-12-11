Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FEC11A8DF
	for <lists+linux-afs@lfdr.de>; Wed, 11 Dec 2019 11:27:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fKLG/AI+M9BF3CXn3W2lBYENHk5x+FImcamEtlWvji0=; b=YQrGYlfJQVhc2x
	8MY4wDiLtWUYuGR6hw4u+mJ9ssy8F8sD/F2Vd32P7mBsRF8zZg6/4g2giWdO/R5SoawQuVEwHyjrP
	pQuSVkloyxB9aKhiUNDP+zW6mKD1IgYRIhb+0uRur4ZprV144+MO8aHJu3MJ52dUSDQV1gzz4eiAx
	c3dPzNSl5fkX2KL0OSj+VuB1LbNmL1F2mwJKQbvI09Yz9i/5ohwBB0BcfTrJaeaUw2z3lZeGatp8g
	CDccKR6Z1MSBSxLyB4m9/yIlvxyR4w4nP3f7pB9kbws17JAsrRJRuefwRdjOes+HaNcanzKDF7fps
	AqChWgQPiYU0JPcyD3AA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iezDl-0007XA-0I; Wed, 11 Dec 2019 10:27:53 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iezDh-0007WY-Op
 for linux-afs@lists.infradead.org; Wed, 11 Dec 2019 10:27:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576060068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DKeUKtE0Ve2BZI7qkxyJ3rAA4tHGE9ytXjGgY4FRRW0=;
 b=C2OP0AF1NTi7MHqXxd2TsqRqncKDDfDWwu+0e1v+SeQhgsLZoQjI5CxeohfhsNYpKgtwAx
 FghNq2Q41pHh1tw22a+jIStRtv74vHR6civJS60zvcBCK7ZwEq1RgDFk1wM46Npgz7gOUb
 q0gSVxWmXEV/Yhgf6SkyiOy4fKSB1ZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-cN_S5mPsPxWV4O0c0QHzQQ-1; Wed, 11 Dec 2019 05:27:43 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F603100551A;
 Wed, 11 Dec 2019 10:27:42 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-52.rdu2.redhat.com
 [10.10.120.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A42E36A022;
 Wed, 11 Dec 2019 10:27:41 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 1/8] afs: Fix afs_find_server lookups for ipv4 peers
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 11 Dec 2019 10:27:40 +0000
Message-ID: <157606006065.21869.6615813521356169209.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: cN_S5mPsPxWV4O0c0QHzQQ-1
X-Mimecast-Spam-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_022749_879342_0CD40CD4 
X-CRM114-Status: GOOD (  15.42  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [205.139.110.120 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: Marc Dionne <marc.dionne@auristor.com>, dhowells@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: Marc Dionne <marc.dionne@auristor.com>

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
---

 fs/afs/server.c |   21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/fs/afs/server.c b/fs/afs/server.c
index 1686bf188ccd..b7f3cb2130ca 100644
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


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
