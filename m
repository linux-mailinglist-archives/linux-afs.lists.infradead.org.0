Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C811FBE6
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 22:58:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CfZg0X4LF6zN9D/29vtDoEFYFs0mlmyrmayvPUn4KTo=; b=bTUx6DjHMtrC7V
	CgURVdTQiF0YGxErOS2RW8n+LekkOaulO902kuWyDqfI1RJlOxkdGN21WuVX5Tc0uQtACMjC1Qf/3
	8hOR2RBf0fuWXHQpdzN1aXPmkd72uB/F6LQO9vRmNQ1YRJGPZr2O5bEd4GhVs5Pt4pFHt3zM+S2l8
	pe2KUSF51V7/vEwCqigpUOiBozKsC9BPpudSpia7TL+/s4aHDWDSvWc3ALSRgGuiVhTqZ8pPSqZR1
	c25vFC1ptijc8slEziNXTfCUAQMt0U9NU1KN9qzvwC1IYmpVlLXSsY63oDYmk4qBaWEUnaxeY2bPR
	QRCSRa2QFuI8/mmlDntA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hR0yt-0002n3-NF; Wed, 15 May 2019 20:58:31 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hR0yr-0002mY-4s
 for linux-afs@lists.infradead.org; Wed, 15 May 2019 20:58:30 +0000
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E637D8553A;
 Wed, 15 May 2019 20:58:28 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4027260BF7;
 Wed, 15 May 2019 20:58:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 01/12] afs: Don't pass the vnode pointer through into the
 inline bulk status op
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 15 May 2019 21:58:27 +0100
Message-ID: <155795390751.28355.1045942367260377574.stgit@warthog.procyon.org.uk>
In-Reply-To: <155795389933.28355.4028912870853910492.stgit@warthog.procyon.org.uk>
References: <155795389933.28355.4028912870853910492.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Wed, 15 May 2019 20:58:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_135829_223422_B3918851 
X-CRM114-Status: GOOD (  12.87  )
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

Don't pass the vnode pointer through into the inline bulk status op.  We
want to process the status records outside of it anyway.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/fsclient.c  |    7 +------
 fs/afs/yfsclient.c |   10 +---------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index 721ff8d04401..80948af115d4 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -2236,7 +2236,6 @@ static int afs_deliver_fs_inline_bulk_status(struct afs_call *call)
 {
 	struct afs_file_status *statuses;
 	struct afs_callback *callbacks;
-	struct afs_vnode *vnode = call->reply[0];
 	const __be32 *bp;
 	u32 tmp;
 	int ret;
@@ -2277,8 +2276,7 @@ static int afs_deliver_fs_inline_bulk_status(struct afs_call *call)
 		bp = call->buffer;
 		statuses = call->reply[1];
 		ret = afs_decode_status(call, &bp, &statuses[call->count],
-					call->count == 0 ? vnode : NULL,
-					NULL, NULL);
+					NULL, NULL, NULL);
 		if (ret < 0)
 			return ret;
 
@@ -2320,8 +2318,6 @@ static int afs_deliver_fs_inline_bulk_status(struct afs_call *call)
 		callbacks = call->reply[2];
 		xdr_decode_AFSCallBack_raw(call, &callbacks[call->count], &bp);
 		statuses = call->reply[1];
-		if (call->count == 0 && vnode && statuses[0].abort_code == 0)
-			xdr_decode_AFSCallBack(call, vnode, &bp);
 		call->count++;
 		if (call->count < call->count2)
 			goto more_cbs;
@@ -2389,7 +2385,6 @@ int afs_fs_inline_bulk_status(struct afs_fs_cursor *fc,
 	}
 
 	call->key = fc->key;
-	call->reply[0] = NULL; /* vnode for fid[0] */
 	call->reply[1] = statuses;
 	call->reply[2] = callbacks;
 	call->reply[3] = volsync;
diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index b42bd412dba1..3f6d50edf498 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -2055,7 +2055,6 @@ static int yfs_deliver_fs_inline_bulk_status(struct afs_call *call)
 {
 	struct afs_file_status *statuses;
 	struct afs_callback *callbacks;
-	struct afs_vnode *vnode = call->reply[0];
 	const __be32 *bp;
 	u32 tmp;
 	int ret;
@@ -2096,8 +2095,7 @@ static int yfs_deliver_fs_inline_bulk_status(struct afs_call *call)
 		bp = call->buffer;
 		statuses = call->reply[1];
 		ret = yfs_decode_status(call, &bp, &statuses[call->count],
-					call->count == 0 ? vnode : NULL,
-					NULL, NULL);
+					NULL, NULL, NULL);
 		if (ret < 0)
 			return ret;
 
@@ -2138,11 +2136,6 @@ static int yfs_deliver_fs_inline_bulk_status(struct afs_call *call)
 		bp = call->buffer;
 		callbacks = call->reply[2];
 		xdr_decode_YFSCallBack_raw(call, &callbacks[call->count], &bp);
-		statuses = call->reply[1];
-		if (call->count == 0 && vnode && statuses[0].abort_code == 0) {
-			bp = call->buffer;
-			xdr_decode_YFSCallBack(call, vnode, &bp);
-		}
 		call->count++;
 		if (call->count < call->count2)
 			goto more_cbs;
@@ -2210,7 +2203,6 @@ int yfs_fs_inline_bulk_status(struct afs_fs_cursor *fc,
 	}
 
 	call->key = fc->key;
-	call->reply[0] = NULL; /* vnode for fid[0] */
 	call->reply[1] = statuses;
 	call->reply[2] = callbacks;
 	call->reply[3] = volsync;


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
