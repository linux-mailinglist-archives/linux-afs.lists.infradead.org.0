Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8A91F892
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 18:27:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5SNhqrABJvEX3oHoB51T49Yh3sI6JNtDlBe2npzTITw=; b=NM0R9nPvhru6GO
	ByjoAvFLJzSXHetpkSR89+TEicDcgib/0abBpvMGiHHugiK27iJGrcAS0sujBPR96nGi446o8n/kt
	wle9uv+yJio6e9YQeH8RMbYUQ0Jo6sDvmdwljD1Lv2UGS9mkZtBhUAGgG0cUAefGqmGlf823AdlSM
	8PZdo1PUq2p0n7/RDMTeBNngJDZAnNMlxL4rJieqUblVALuXtVBGMFeieBLS4J0bVKAW57VV+fJU4
	i9xX5Yrez8VS6vxp236V9yF1qfeRBPld33D5SlO+7nev/DPdve8zQ4BOt+ofY1aPg80vItlBnC9v8
	LJf8Zy4J506djDryUUOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQwkA-0001ot-Aa; Wed, 15 May 2019 16:27:02 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQwk7-0001oI-R5
 for linux-afs@lists.infradead.org; Wed, 15 May 2019 16:27:01 +0000
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 976F53082A99;
 Wed, 15 May 2019 16:26:59 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDFD47D561;
 Wed, 15 May 2019 16:26:58 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 11/15] afs: Make dynamic root population wait
 uninterruptibly for proc_cells_lock
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 15 May 2019 17:26:58 +0100
Message-ID: <155793761800.31671.11168968011155587642.stgit@warthog.procyon.org.uk>
In-Reply-To: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
References: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Wed, 15 May 2019 16:26:59 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_092659_893706_69CEAAA3 
X-CRM114-Status: GOOD (  13.52  )
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
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Cc: dhowells@redhat.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Make dynamic root population wait uninterruptibly for proc_cells_lock.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/dynroot.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/afs/dynroot.c b/fs/afs/dynroot.c
index 07484b5a3bbb..af1689d1f32e 100644
--- a/fs/afs/dynroot.c
+++ b/fs/afs/dynroot.c
@@ -261,8 +261,7 @@ int afs_dynroot_populate(struct super_block *sb)
 	struct afs_net *net = afs_sb2net(sb);
 	int ret;
 
-	if (mutex_lock_interruptible(&net->proc_cells_lock) < 0)
-		return -ERESTARTSYS;
+	mutex_lock(&net->proc_cells_lock);
 
 	net->dynroot_sb = sb;
 	hlist_for_each_entry(cell, &net->proc_cells, proc_link) {


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
