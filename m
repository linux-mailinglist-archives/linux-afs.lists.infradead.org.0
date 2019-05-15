Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id EF82C1FBF1
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 22:59:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHXvs1ZXCVH+NnDFbupvoVDz8j0qqzXaieSgOogMHxA=; b=ZMb7LQrlb8xNn3
	DSgcbup6EvK4jyYpMQBjRWrdXS99C3N+y6Bz9Z5qmuSFGvv2Sh/9BeI5m6rgNjdBNHvWIgvCyV7Cu
	+QHR/EdhYaBwOJKNurBWLA9xtDIIRdSrmhIiao491HNNllawb6SeWjyXcq9yU91sBZuYYDKOPiUrF
	gnIHfvY9VJbfIuidel1z66w1ASiU9slCykmt8PqMLjp6xjuNOAMG4UMDgr6OIImqx52pcAXqu+t4W
	rfeENjMkabygL175s9yQmhca2EyXnMFQeZxTIeMf8b+u0gyJ/vicC0oqioW/OacRp9mQRIHnggOgO
	oigX2YeoyW4Sl5drQJxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hR0zW-0002tv-GP; Wed, 15 May 2019 20:59:10 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hR0zS-0002tK-Rf
 for linux-afs@lists.infradead.org; Wed, 15 May 2019 20:59:08 +0000
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9AAF5307CB5E;
 Wed, 15 May 2019 20:59:06 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5AAA600C4;
 Wed, 15 May 2019 20:59:05 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 06/12] afs: Don't save callback version and type fields
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 15 May 2019 21:59:04 +0100
Message-ID: <155795394490.28355.6322009407676698775.stgit@warthog.procyon.org.uk>
In-Reply-To: <155795389933.28355.4028912870853910492.stgit@warthog.procyon.org.uk>
References: <155795389933.28355.4028912870853910492.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 15 May 2019 20:59:06 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_135906_936073_E509C3FC 
X-CRM114-Status: GOOD (  18.42  )
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

Don't save callback version and type fields as the version is about the
format of the callback information and the type is relative to the
particular RPC call.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/afs.h       |    4 ++--
 fs/afs/fsclient.c  |    4 ++--
 fs/afs/inode.c     |    8 +-------
 fs/afs/internal.h  |    2 --
 fs/afs/super.c     |    1 -
 fs/afs/yfsclient.c |    2 --
 6 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/fs/afs/afs.h b/fs/afs/afs.h
index bcdab0a7fb01..ed9569fccb76 100644
--- a/fs/afs/afs.h
+++ b/fs/afs/afs.h
@@ -69,8 +69,8 @@ typedef enum {
 
 struct afs_callback {
 	time64_t		expires_at;	/* Time at which expires */
-	unsigned		version;	/* Callback version */
-	afs_callback_type_t	type;		/* Type of callback */
+	//unsigned		version;	/* Callback version */
+	//afs_callback_type_t	type;		/* Type of callback */
 };
 
 struct afs_callback_break {
diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index 24ed4049ff67..86c88babe0fe 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -148,9 +148,9 @@ static void xdr_decode_AFSCallBack(const __be32 **_bp,
 	struct afs_callback *cb = &scb->callback;
 	const __be32 *bp = *_bp;
 
-	cb->version	= ntohl(*bp++);
+	bp++; /* version */
 	cb->expires_at	= xdr_decode_expiry(call, ntohl(*bp++));
-	cb->type	= ntohl(*bp++);
+	bp++; /* type */
 	scb->have_cb	= true;
 	*_bp = bp;
 }
diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index f54b6d7ebab8..b644f3d5e4e9 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -136,12 +136,8 @@ static int afs_inode_init_from_status(struct afs_vnode *vnode, struct key *key,
 	if (!scb->have_cb) {
 		/* it's a symlink we just created (the fileserver
 		 * didn't give us a callback) */
-		vnode->cb_version = 0;
-		vnode->cb_type = 0;
 		vnode->cb_expires_at = ktime_get_real_seconds();
 	} else {
-		vnode->cb_version = scb->callback.version;
-		vnode->cb_type = scb->callback.type;
 		vnode->cb_expires_at = scb->callback.expires_at;
 		old_cbi = vnode->cb_interest;
 		if (cbi != old_cbi)
@@ -248,8 +244,6 @@ static void afs_apply_callback(struct afs_fs_cursor *fc,
 	struct afs_callback *cb = &scb->callback;
 
 	if (!afs_cb_is_broken(cb_break, vnode, fc->cbi)) {
-		vnode->cb_version	= cb->version;
-		vnode->cb_type		= cb->type;
 		vnode->cb_expires_at	= cb->expires_at;
 		old = vnode->cb_interest;
 		if (old != fc->cbi) {
@@ -534,7 +528,7 @@ struct inode *afs_iget(struct super_block *sb, struct key *key,
 	clear_bit(AFS_VNODE_UNSET, &vnode->flags);
 	inode->i_flags |= S_NOATIME;
 	unlock_new_inode(inode);
-	_leave(" = %p [CB { v=%u t=%u }]", inode, vnode->cb_version, vnode->cb_type);
+	_leave(" = %p", inode);
 	return inode;
 
 	/* failure */
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index ed2f92f9d705..175501a7cf8b 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -682,8 +682,6 @@ struct afs_vnode {
 	seqlock_t		cb_lock;	/* Lock for ->cb_interest, ->status, ->cb_*break */
 
 	time64_t		cb_expires_at;	/* time at which callback expires */
-	unsigned		cb_version;	/* callback version */
-	afs_callback_type_t	cb_type;	/* type of callback */
 };
 
 static inline struct fscache_cookie *afs_vnode_cache(struct afs_vnode *vnode)
diff --git a/fs/afs/super.c b/fs/afs/super.c
index f45a95eea237..a81c235f8c57 100644
--- a/fs/afs/super.c
+++ b/fs/afs/super.c
@@ -683,7 +683,6 @@ static struct inode *afs_alloc_inode(struct super_block *sb)
 #endif
 
 	vnode->flags		= 1 << AFS_VNODE_UNSET;
-	vnode->cb_type		= 0;
 	vnode->lock_state	= AFS_VNODE_LOCK_NONE;
 
 	init_rwsem(&vnode->rmdir_lock);
diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index 701b6ee4ce10..ffbec5acbd76 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -245,8 +245,6 @@ static void xdr_decode_YFSCallBack(const __be32 **_bp,
 	cb_expiry = call->reply_time;
 	cb_expiry = ktime_add(cb_expiry, xdr_to_u64(x->expiration_time) * 100);
 	cb->expires_at	= ktime_divns(cb_expiry, NSEC_PER_SEC);
-	cb->version	= ntohl(x->version);
-	cb->type	= ntohl(x->type);
 	scb->have_cb	= true;
 	*_bp += xdr_size(x);
 }


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
