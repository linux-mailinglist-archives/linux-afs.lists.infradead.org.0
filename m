Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6865F9BF
	for <lists+linux-afs@lfdr.de>; Thu,  4 Jul 2019 16:08:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5ELHOOGMDkl8NUU2UIFeczGkya8dvmqyRC3KQpE+WJ0=; b=vApWeQz/cZsCNG
	PE6iYDeQ1o/QhmEHYnA2fKrYt9MC2+VRIEnirzV/mXvT1yfImKJUUtUcYq+UG06iE3uPEFU8C9eBF
	5KyQ7SPhDx7rbw4if+qTplIbGwBDp42KqDcO/aEdsxVJNnMCuk+N3Mc+cGOjZ8Eq17A3O7Kjb81Ve
	gOqylZjMVeG0qlxMpKvBvoj+iNgLWzLAZuUrh8ukyvzj/xAVhPCOhWFNBg+x+ZoW7MSfP9gawh2E0
	IUKXYoTVoW0LS6MyRV2fFfiSjl/ler1t+u8wDKGXki4vwOEjppnniGRsKnImi0xM4KId84zMsrATL
	Sp8ym0TRmUxRb9HFS0lw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hj2PM-0006dZ-EZ; Thu, 04 Jul 2019 14:08:20 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hj2PG-0006Y3-1y
 for linux-afs@lists.infradead.org; Thu, 04 Jul 2019 14:08:15 +0000
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E4B12308219E
 for <linux-afs@lists.infradead.org>; Thu,  4 Jul 2019 14:08:12 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-9.rdu2.redhat.com
 [10.10.120.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FAC97D57C;
 Thu,  4 Jul 2019 14:08:12 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] afs: Fix the CB.ProbeUuid service handler to reply correctly
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Thu, 04 Jul 2019 15:08:11 +0100
Message-ID: <156224929148.4295.3289261191449003741.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 04 Jul 2019 14:08:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190704_070814_190307_34DB34D9 
X-CRM114-Status: GOOD (  14.52  )
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
Cc: dhowells@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Fix the service handler function for the CB.ProbeUuid RPC call so that it
replies in the correct manner - that is an empty reply for success and an
abort of 1 for failure.

Putting 0 or 1 in an integer in the body of the reply can result in the
fileserver throwing an RX_PROTOCOL_ERROR abort, and if it doesn't, the
fileserver may think it's got a positive response when that wasn't
intended.

Fixes: 9396d496d745 ("afs: support the CB.ProbeUuid RPC op")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/cmservice.c |   10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/fs/afs/cmservice.c b/fs/afs/cmservice.c
index e114d6be0c2b..8bd3d1d67343 100644
--- a/fs/afs/cmservice.c
+++ b/fs/afs/cmservice.c
@@ -509,18 +509,14 @@ static void SRXAFSCB_ProbeUuid(struct work_struct *work)
 	struct afs_call *call = container_of(work, struct afs_call, work);
 	struct afs_uuid *r = call->request;
 
-	struct {
-		__be32	match;
-	} reply;
-
 	_enter("");
 
 	if (memcmp(r, &call->net->uuid, sizeof(call->net->uuid)) == 0)
-		reply.match = htonl(0);
+		afs_send_empty_reply(call);
 	else
-		reply.match = htonl(1);
+		rxrpc_kernel_abort_call(call->net->socket, call->rxcall,
+					1, 1, "K-1");
 
-	afs_send_simple_reply(call, &reply, sizeof(reply));
 	afs_put_call(call);
 	_leave("");
 }


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
