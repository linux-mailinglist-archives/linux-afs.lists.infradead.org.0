Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3186D1F893
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 18:27:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9oiduusBDE2Egg0tV9D7Vf0VHqDcQTCLFN8zpYlpZs=; b=DgCUZssqJ4hIXj
	LZnxC3sfMOnvqIdlhM9Dg0fDwK0KomXa4eUA3AlLzX2UOIJKX+Nx9TU6enzmjTjHlxbgZ3R4cwxGz
	St/NpnDUVXE4SG5uodU/U2DpRN+EscL8cP+iWpbL2a7O3wvtJnaYD6csPLYD6AmpGbudkAXhX/Pa7
	2XsQBBUp9ufAY4l4KuAoIiBJ8INUGnlNJGmW5sGZz3SVFc+IvorvZiauY9ucM6nydY4YSn6JIsy8o
	72E04HnWBlBKQ80Qo+BfUSMJNMeD5AuRHTcNoxJvDkjU2KLoHk6WnNeRaiK6NfCMdx7XAXhvjYrqP
	TfY099cG+PinImdVD9lw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQwkH-0001qg-JQ; Wed, 15 May 2019 16:27:09 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQwkE-0001qB-Qs
 for linux-afs@lists.infradead.org; Wed, 15 May 2019 16:27:08 +0000
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8E0E2316D8E9;
 Wed, 15 May 2019 16:27:06 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7D9960F91;
 Wed, 15 May 2019 16:27:05 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 12/15] afs: Fix calculation of callback expiry time
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 15 May 2019 17:27:04 +0100
Message-ID: <155793762485.31671.9601704687231766116.stgit@warthog.procyon.org.uk>
In-Reply-To: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
References: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Wed, 15 May 2019 16:27:06 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_092706_911529_B4CF04B3 
X-CRM114-Status: GOOD (  15.57  )
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

Fix the calculation of the expiry time of a callback promise, as obtained
from operations like FS.FetchStatus and FS.FetchData.

The time should be based on the timestamp of the first DATA packet in the
reply and the calculation needs to turn the ktime_t timestamp into a
time64_t.

Fixes: c435ee34551e ("afs: Overhaul the callback handling")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/fsclient.c  |   57 ++++++++++++++++++++++++----------------------------
 fs/afs/yfsclient.c |   51 +++++++++++++++++++++++------------------------
 2 files changed, 51 insertions(+), 57 deletions(-)

diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index c43301b5eea4..721ff8d04401 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -256,6 +256,23 @@ static int afs_decode_status(struct afs_call *call,
 	return ret;
 }
 
+static time64_t xdr_decode_expiry(struct afs_call *call, u32 expiry)
+{
+	return ktime_divns(call->reply_time, NSEC_PER_SEC) + expiry;
+}
+
+static void xdr_decode_AFSCallBack_raw(struct afs_call *call,
+				       struct afs_callback *cb,
+				       const __be32 **_bp)
+{
+	const __be32 *bp = *_bp;
+
+	cb->version	= ntohl(*bp++);
+	cb->expires_at	= xdr_decode_expiry(call, ntohl(*bp++));
+	cb->type	= ntohl(*bp++);
+	*_bp = bp;
+}
+
 /*
  * decode an AFSCallBack block
  */
@@ -264,46 +281,26 @@ static void xdr_decode_AFSCallBack(struct afs_call *call,
 				   const __be32 **_bp)
 {
 	struct afs_cb_interest *old, *cbi = call->cbi;
-	const __be32 *bp = *_bp;
-	u32 cb_expiry;
+	struct afs_callback cb;
+
+	xdr_decode_AFSCallBack_raw(call, &cb, _bp);
 
 	write_seqlock(&vnode->cb_lock);
 
 	if (!afs_cb_is_broken(call->cb_break, vnode, cbi)) {
-		vnode->cb_version	= ntohl(*bp++);
-		cb_expiry		= ntohl(*bp++);
-		vnode->cb_type		= ntohl(*bp++);
-		vnode->cb_expires_at	= cb_expiry + ktime_get_real_seconds();
+		vnode->cb_version	= cb.version;
+		vnode->cb_type		= cb.type;
+		vnode->cb_expires_at	= cb.expires_at;
 		old = vnode->cb_interest;
 		if (old != call->cbi) {
 			vnode->cb_interest = cbi;
 			cbi = old;
 		}
 		set_bit(AFS_VNODE_CB_PROMISED, &vnode->flags);
-	} else {
-		bp += 3;
 	}
 
 	write_sequnlock(&vnode->cb_lock);
 	call->cbi = cbi;
-	*_bp = bp;
-}
-
-static ktime_t xdr_decode_expiry(struct afs_call *call, u32 expiry)
-{
-	return ktime_add_ns(call->reply_time, expiry * NSEC_PER_SEC);
-}
-
-static void xdr_decode_AFSCallBack_raw(struct afs_call *call,
-				       const __be32 **_bp,
-				       struct afs_callback *cb)
-{
-	const __be32 *bp = *_bp;
-
-	cb->version	= ntohl(*bp++);
-	cb->expires_at	= xdr_decode_expiry(call, ntohl(*bp++));
-	cb->type	= ntohl(*bp++);
-	*_bp = bp;
 }
 
 /*
@@ -744,7 +741,7 @@ static int afs_deliver_fs_create_vnode(struct afs_call *call)
 				&call->expected_version, NULL);
 	if (ret < 0)
 		return ret;
-	xdr_decode_AFSCallBack_raw(call, &bp, call->reply[3]);
+	xdr_decode_AFSCallBack_raw(call, call->reply[3], &bp);
 	/* xdr_decode_AFSVolSync(&bp, call->reply[X]); */
 
 	_leave(" = 0 [done]");
@@ -2167,7 +2164,7 @@ static int afs_deliver_fs_fetch_status(struct afs_call *call)
 				&call->expected_version, NULL);
 	if (ret < 0)
 		return ret;
-	xdr_decode_AFSCallBack_raw(call, &bp, callback);
+	xdr_decode_AFSCallBack_raw(call, callback, &bp);
 	xdr_decode_AFSVolSync(&bp, volsync);
 
 	_leave(" = 0 [done]");
@@ -2321,9 +2318,7 @@ static int afs_deliver_fs_inline_bulk_status(struct afs_call *call)
 		_debug("unmarshall CB array");
 		bp = call->buffer;
 		callbacks = call->reply[2];
-		callbacks[call->count].version	= ntohl(bp[0]);
-		callbacks[call->count].expires_at = xdr_decode_expiry(call, ntohl(bp[1]));
-		callbacks[call->count].type	= ntohl(bp[2]);
+		xdr_decode_AFSCallBack_raw(call, &callbacks[call->count], &bp);
 		statuses = call->reply[1];
 		if (call->count == 0 && vnode && statuses[0].abort_code == 0)
 			xdr_decode_AFSCallBack(call, vnode, &bp);
diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index 3ba33d415a74..b42bd412dba1 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -311,6 +311,22 @@ static int yfs_decode_status(struct afs_call *call,
 	return ret;
 }
 
+static void xdr_decode_YFSCallBack_raw(struct afs_call *call,
+				       struct afs_callback *cb,
+				       const __be32 **_bp)
+{
+	struct yfs_xdr_YFSCallBack *x = (void *)*_bp;
+	ktime_t cb_expiry;
+
+	cb_expiry = call->reply_time;
+	cb_expiry = ktime_add(cb_expiry, xdr_to_u64(x->expiration_time) * 100);
+	cb->expires_at	= ktime_divns(cb_expiry, NSEC_PER_SEC);
+	cb->version	= ntohl(x->version);
+	cb->type	= ntohl(x->type);
+
+	*_bp += xdr_size(x);
+}
+
 /*
  * Decode a YFSCallBack block
  */
@@ -318,18 +334,17 @@ static void xdr_decode_YFSCallBack(struct afs_call *call,
 				   struct afs_vnode *vnode,
 				   const __be32 **_bp)
 {
-	struct yfs_xdr_YFSCallBack *xdr = (void *)*_bp;
 	struct afs_cb_interest *old, *cbi = call->cbi;
-	u64 cb_expiry;
+	struct afs_callback cb;
+
+	xdr_decode_YFSCallBack_raw(call, &cb, _bp);
 
 	write_seqlock(&vnode->cb_lock);
 
 	if (!afs_cb_is_broken(call->cb_break, vnode, cbi)) {
-		cb_expiry = xdr_to_u64(xdr->expiration_time);
-		do_div(cb_expiry, 10 * 1000 * 1000);
-		vnode->cb_version	= ntohl(xdr->version);
-		vnode->cb_type		= ntohl(xdr->type);
-		vnode->cb_expires_at	= cb_expiry + ktime_get_real_seconds();
+		vnode->cb_version	= cb.version;
+		vnode->cb_type		= cb.type;
+		vnode->cb_expires_at	= cb.expires_at;
 		old = vnode->cb_interest;
 		if (old != call->cbi) {
 			vnode->cb_interest = cbi;
@@ -340,22 +355,6 @@ static void xdr_decode_YFSCallBack(struct afs_call *call,
 
 	write_sequnlock(&vnode->cb_lock);
 	call->cbi = cbi;
-	*_bp += xdr_size(xdr);
-}
-
-static void xdr_decode_YFSCallBack_raw(const __be32 **_bp,
-				       struct afs_callback *cb)
-{
-	struct yfs_xdr_YFSCallBack *x = (void *)*_bp;
-	u64 cb_expiry;
-
-	cb_expiry = xdr_to_u64(x->expiration_time);
-	do_div(cb_expiry, 10 * 1000 * 1000);
-	cb->version	= ntohl(x->version);
-	cb->type	= ntohl(x->type);
-	cb->expires_at	= cb_expiry + ktime_get_real_seconds();
-
-	*_bp += xdr_size(x);
 }
 
 /*
@@ -743,7 +742,7 @@ static int yfs_deliver_fs_create_vnode(struct afs_call *call)
 				&call->expected_version, NULL);
 	if (ret < 0)
 		return ret;
-	xdr_decode_YFSCallBack_raw(&bp, call->reply[3]);
+	xdr_decode_YFSCallBack_raw(call, call->reply[3], &bp);
 	xdr_decode_YFSVolSync(&bp, NULL);
 
 	_leave(" = 0 [done]");
@@ -1983,7 +1982,7 @@ static int yfs_deliver_fs_fetch_status(struct afs_call *call)
 				&call->expected_version, NULL);
 	if (ret < 0)
 		return ret;
-	xdr_decode_YFSCallBack_raw(&bp, callback);
+	xdr_decode_YFSCallBack_raw(call, callback, &bp);
 	xdr_decode_YFSVolSync(&bp, volsync);
 
 	_leave(" = 0 [done]");
@@ -2138,7 +2137,7 @@ static int yfs_deliver_fs_inline_bulk_status(struct afs_call *call)
 		_debug("unmarshall CB array");
 		bp = call->buffer;
 		callbacks = call->reply[2];
-		xdr_decode_YFSCallBack_raw(&bp, &callbacks[call->count]);
+		xdr_decode_YFSCallBack_raw(call, &callbacks[call->count], &bp);
 		statuses = call->reply[1];
 		if (call->count == 0 && vnode && statuses[0].abort_code == 0) {
 			bp = call->buffer;


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
