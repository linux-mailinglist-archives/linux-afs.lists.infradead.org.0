Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D561F891
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 18:27:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFDLdZiW5uraoBbuAXyjIfiAn4tCQvP+OHVFYp/u9/s=; b=B5B5aaxYhZczhM
	JXhVAB6O7YewzVZlMVy2wgKQfxGJ9c+meNVMpBR5rT2B4nC4wynhjR/faKLK7QsPdcc1qILOFVLd3
	hClLeJ4zs5de+XR9aO74JPJa2df8+lkCgTr8vnzTGz4vSNVVekNstrGqexZFZrHgJbJ/a1dUYgIDk
	VD+MqR4Q+0MyBAq2V9NnyjZSF7myooU/sum/3ezlj/WyAjKHs765IjEnCc0gYTBZ4D+hvy5smIM0+
	2bkHmFFJzI2wTrwOt+oxNHBiNKjsvs6LhL/8xW8kFzDN2atsBvPl1O56KJkAhTN6rSTqTjAdAbU1A
	hT7JGOYlcGStS46ckbsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQwk6-0001mK-3T; Wed, 15 May 2019 16:26:58 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQwk1-0001lw-2G
 for linux-afs@lists.infradead.org; Wed, 15 May 2019 16:26:55 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C0C2D85A03;
 Wed, 15 May 2019 16:26:52 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A4DA10021B5;
 Wed, 15 May 2019 16:26:51 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 10/15] afs: Make some RPC operations non-interruptible
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 15 May 2019 17:26:50 +0100
Message-ID: <155793761043.31671.16067883995369536491.stgit@warthog.procyon.org.uk>
In-Reply-To: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
References: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Wed, 15 May 2019 16:26:52 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_092653_150627_CDCE4C85 
X-CRM114-Status: GOOD (  17.76  )
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
Cc: Marc Dionne <marc.dionne@auristor.com>, dhowells@redhat.com,
 linux-kernel@vger.kernel.org, Jonathan Billings <jsbillings@jsbillings.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Make certain RPC operations non-interruptible, including:

 (*) Set attributes
 (*) Store data

     We don't want to get interrupted during a flush on close, flush on
     unlock, writeback or an inode update, leaving us in a state where we
     still need to do the writeback or update.

 (*) Extend lock
 (*) Release lock

     We don't want to get lock extension interrupted as the file locks on
     the server are time-limited.  Interruption during lock release is less
     of an issue since the lock is time-limited, but it's better to
     complete the release to avoid a several-minute wait to recover it.

     *Setting* the lock isn't a problem if it's interrupted since we can
      just return to the user and tell them they were interrupted - at
      which point they can elect to retry.

 (*) Silly unlink

     We want to remove silly unlink files if we can, rather than leaving
     them for the salvager to clear up.

Note that whilst these calls are no longer interruptible, they do have
timeouts on them, so if the server stops responding the call will fail with
something like ETIME or ECONNRESET.

Without this, the following:

	kAFS: Unexpected error from FS.StoreData -512

appears in dmesg when a pending store data gets interrupted and some
processes may just hang.

Fixes: d2ddc776a458 ("afs: Overhaul volume and server record caching and fileserver rotation")
Reported-by: Jonathan Billings <jsbillings@jsbillings.org>
Reported-by: Marc Dionne <marc.dionne@auristor.com>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/dir.c       |   18 +++++++++---------
 fs/afs/dir_silly.c |    4 ++--
 fs/afs/file.c      |    2 +-
 fs/afs/flock.c     |    6 +++---
 fs/afs/fsclient.c  |   19 +++++++++++++++++++
 fs/afs/inode.c     |    4 ++--
 fs/afs/internal.h  |    9 ++++++++-
 fs/afs/rotate.c    |   27 ++++++++++++++++++---------
 fs/afs/rxrpc.c     |    4 ++--
 fs/afs/super.c     |    2 +-
 fs/afs/write.c     |    2 +-
 fs/afs/xattr.c     |    8 ++++----
 fs/afs/yfsclient.c |   18 ++++++++++++++++++
 13 files changed, 88 insertions(+), 35 deletions(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index 9a466be583d2..c15550310f62 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -704,7 +704,7 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 		goto no_inline_bulk_status;
 
 	inode = ERR_PTR(-ERESTARTSYS);
-	if (afs_begin_vnode_operation(&fc, dvnode, key)) {
+	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
 		while (afs_select_fileserver(&fc)) {
 			if (test_bit(AFS_SERVER_FL_NO_IBULK,
 				      &fc.cbi->server->flags)) {
@@ -739,7 +739,7 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 	 */
 	cookie->nr_fids = 1;
 	inode = ERR_PTR(-ERESTARTSYS);
-	if (afs_begin_vnode_operation(&fc, dvnode, key)) {
+	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
 		while (afs_select_fileserver(&fc)) {
 			afs_fs_fetch_status(&fc,
 					    afs_v2net(dvnode),
@@ -1166,7 +1166,7 @@ static int afs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 	}
 
 	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, dvnode, key)) {
+	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
 			afs_fs_create(&fc, dentry->d_name.name, mode, data_version,
@@ -1250,7 +1250,7 @@ static int afs_rmdir(struct inode *dir, struct dentry *dentry)
 	}
 
 	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, dvnode, key)) {
+	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
 			afs_fs_remove(&fc, vnode, dentry->d_name.name, true,
@@ -1374,7 +1374,7 @@ static int afs_unlink(struct inode *dir, struct dentry *dentry)
 	spin_unlock(&dentry->d_lock);
 
 	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, dvnode, key)) {
+	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
 
@@ -1445,7 +1445,7 @@ static int afs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 	}
 
 	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, dvnode, key)) {
+	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
 			afs_fs_create(&fc, dentry->d_name.name, mode, data_version,
@@ -1510,7 +1510,7 @@ static int afs_link(struct dentry *from, struct inode *dir,
 	}
 
 	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, dvnode, key)) {
+	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
 		if (mutex_lock_interruptible_nested(&vnode->io_lock, 1) < 0) {
 			afs_end_vnode_operation(&fc);
 			goto error_key;
@@ -1584,7 +1584,7 @@ static int afs_symlink(struct inode *dir, struct dentry *dentry,
 	}
 
 	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, dvnode, key)) {
+	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
 			afs_fs_symlink(&fc, dentry->d_name.name,
@@ -1696,7 +1696,7 @@ static int afs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	}
 
 	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, orig_dvnode, key)) {
+	if (afs_begin_vnode_operation(&fc, orig_dvnode, key, true)) {
 		if (orig_dvnode != new_dvnode) {
 			if (mutex_lock_interruptible_nested(&new_dvnode->io_lock, 1) < 0) {
 				afs_end_vnode_operation(&fc);
diff --git a/fs/afs/dir_silly.c b/fs/afs/dir_silly.c
index f6f89fdab6b2..fbc2d301ffe8 100644
--- a/fs/afs/dir_silly.c
+++ b/fs/afs/dir_silly.c
@@ -30,7 +30,7 @@ static int afs_do_silly_rename(struct afs_vnode *dvnode, struct afs_vnode *vnode
 	_enter("%pd,%pd", old, new);
 
 	trace_afs_silly_rename(vnode, false);
-	if (afs_begin_vnode_operation(&fc, dvnode, key)) {
+	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
 			afs_fs_rename(&fc, old->d_name.name,
@@ -149,7 +149,7 @@ static int afs_do_silly_unlink(struct afs_vnode *dvnode, struct afs_vnode *vnode
 	_enter("");
 
 	trace_afs_silly_rename(vnode, true);
-	if (afs_begin_vnode_operation(&fc, dvnode, key)) {
+	if (afs_begin_vnode_operation(&fc, dvnode, key, false)) {
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
 
diff --git a/fs/afs/file.c b/fs/afs/file.c
index eee2b5663b92..a9fdae6dd1cc 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -238,7 +238,7 @@ int afs_fetch_data(struct afs_vnode *vnode, struct key *key, struct afs_read *de
 	       key_serial(key));
 
 	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, key)) {
+	if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(vnode);
 			afs_fs_fetch_data(&fc, desc);
diff --git a/fs/afs/flock.c b/fs/afs/flock.c
index adc88eff7849..3501ef7ddbb4 100644
--- a/fs/afs/flock.c
+++ b/fs/afs/flock.c
@@ -196,7 +196,7 @@ static int afs_set_lock(struct afs_vnode *vnode, struct key *key,
 	       key_serial(key), type);
 
 	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, key)) {
+	if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(vnode);
 			afs_fs_set_lock(&fc, type);
@@ -227,7 +227,7 @@ static int afs_extend_lock(struct afs_vnode *vnode, struct key *key)
 	       key_serial(key));
 
 	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, key)) {
+	if (afs_begin_vnode_operation(&fc, vnode, key, false)) {
 		while (afs_select_current_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(vnode);
 			afs_fs_extend_lock(&fc);
@@ -258,7 +258,7 @@ static int afs_release_lock(struct afs_vnode *vnode, struct key *key)
 	       key_serial(key));
 
 	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, key)) {
+	if (afs_begin_vnode_operation(&fc, vnode, key, false)) {
 		while (afs_select_current_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(vnode);
 			afs_fs_release_lock(&fc);
diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index 1296f5dc4c1e..c43301b5eea4 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -469,6 +469,7 @@ int afs_fs_fetch_file_status(struct afs_fs_cursor *fc, struct afs_volsync *volsy
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
 
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -664,6 +665,7 @@ static int afs_fs_fetch_data64(struct afs_fs_cursor *fc, struct afs_read *req)
 	call->cb_break = fc->cb_break;
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -712,6 +714,7 @@ int afs_fs_fetch_data(struct afs_fs_cursor *fc, struct afs_read *req)
 	call->cb_break = fc->cb_break;
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -833,6 +836,7 @@ int afs_fs_create(struct afs_fs_cursor *fc,
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call1(call, &vnode->fid, name);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -930,6 +934,7 @@ int afs_fs_remove(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call1(call, &dvnode->fid, name);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -1023,6 +1028,7 @@ int afs_fs_link(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call1(call, &vnode->fid, name);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -1138,6 +1144,7 @@ int afs_fs_symlink(struct afs_fs_cursor *fc,
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call1(call, &vnode->fid, name);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -1257,6 +1264,7 @@ int afs_fs_rename(struct afs_fs_cursor *fc,
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call2(call, &orig_dvnode->fid, orig_name, new_name);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -1362,6 +1370,7 @@ static int afs_fs_store_data64(struct afs_fs_cursor *fc,
 	*bp++ = htonl((u32) i_size);
 
 	trace_afs_make_fs_call(call, &vnode->fid);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -1439,6 +1448,7 @@ int afs_fs_store_data(struct afs_fs_cursor *fc, struct address_space *mapping,
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -1538,6 +1548,7 @@ static int afs_fs_setattr_size64(struct afs_fs_cursor *fc, struct iattr *attr)
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -1585,6 +1596,7 @@ static int afs_fs_setattr_size(struct afs_fs_cursor *fc, struct iattr *attr)
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -1630,6 +1642,7 @@ int afs_fs_setattr(struct afs_fs_cursor *fc, struct iattr *attr)
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -1815,6 +1828,7 @@ int afs_fs_get_volume_status(struct afs_fs_cursor *fc,
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -1906,6 +1920,7 @@ int afs_fs_set_lock(struct afs_fs_cursor *fc, afs_lock_type_t type)
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_calli(call, &vnode->fid, type);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -1942,6 +1957,7 @@ int afs_fs_extend_lock(struct afs_fs_cursor *fc)
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -1977,6 +1993,7 @@ int afs_fs_release_lock(struct afs_fs_cursor *fc)
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -2210,6 +2227,7 @@ int afs_fs_fetch_status(struct afs_fs_cursor *fc,
 	call->cb_break = fc->cb_break;
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, fid);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -2396,6 +2414,7 @@ int afs_fs_inline_bulk_status(struct afs_fs_cursor *fc,
 	call->cb_break = fc->cb_break;
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &fids[0]);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index f30aa5eacd39..1e630f016dc5 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -136,7 +136,7 @@ int afs_fetch_status(struct afs_vnode *vnode, struct key *key, bool new_inode)
 	       vnode->flags);
 
 	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, key)) {
+	if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(vnode);
 			afs_fs_fetch_file_status(&fc, NULL, new_inode);
@@ -617,7 +617,7 @@ int afs_setattr(struct dentry *dentry, struct iattr *attr)
 	}
 
 	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, key)) {
+	if (afs_begin_vnode_operation(&fc, vnode, key, false)) {
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(vnode);
 			afs_fs_setattr(&fc, attr);
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 50d925f0a556..d58544d03bae 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -148,6 +148,7 @@ struct afs_call {
 	bool			ret_reply0;	/* T if should return reply[0] on success */
 	bool			upgrade;	/* T to request service upgrade */
 	bool			want_reply_time; /* T if want reply_time */
+	bool			intr;		/* T if interruptible */
 	u16			service_id;	/* Actual service ID (after upgrade) */
 	unsigned int		debug_id;	/* Trace ID */
 	u32			operation_ID;	/* operation ID for an incoming call */
@@ -772,6 +773,7 @@ struct afs_fs_cursor {
 #define AFS_FS_CURSOR_VNOVOL	0x0008		/* Set if seen VNOVOL */
 #define AFS_FS_CURSOR_CUR_ONLY	0x0010		/* Set if current server only (file lock held) */
 #define AFS_FS_CURSOR_NO_VSLEEP	0x0020		/* Set to prevent sleep on VBUSY, VOFFLINE, ... */
+#define AFS_FS_CURSOR_INTR	0x0040		/* Set if op is interruptible */
 	unsigned short		nr_iterations;	/* Number of server iterations */
 };
 
@@ -1096,7 +1098,7 @@ static inline void afs_put_sysnames(struct afs_sysnames *sysnames) {}
  * rotate.c
  */
 extern bool afs_begin_vnode_operation(struct afs_fs_cursor *, struct afs_vnode *,
-				      struct key *);
+				      struct key *, bool);
 extern bool afs_select_fileserver(struct afs_fs_cursor *);
 extern bool afs_select_current_fileserver(struct afs_fs_cursor *);
 extern int afs_end_vnode_operation(struct afs_fs_cursor *);
@@ -1121,6 +1123,11 @@ extern void afs_send_simple_reply(struct afs_call *, const void *, size_t);
 extern int afs_extract_data(struct afs_call *, bool);
 extern int afs_protocol_error(struct afs_call *, int, enum afs_eproto_cause);
 
+static inline void afs_set_fc_call(struct afs_call *call, struct afs_fs_cursor *fc)
+{
+	call->intr = fc->flags & AFS_FS_CURSOR_INTR;
+}
+
 static inline void afs_extract_begin(struct afs_call *call, void *buf, size_t size)
 {
 	call->kvec[0].iov_base = buf;
diff --git a/fs/afs/rotate.c b/fs/afs/rotate.c
index c3ae324781f8..cb47f45c9681 100644
--- a/fs/afs/rotate.c
+++ b/fs/afs/rotate.c
@@ -25,7 +25,7 @@
  * them here also using the io_lock.
  */
 bool afs_begin_vnode_operation(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
-			       struct key *key)
+			       struct key *key, bool intr)
 {
 	memset(fc, 0, sizeof(*fc));
 	fc->vnode = vnode;
@@ -33,10 +33,15 @@ bool afs_begin_vnode_operation(struct afs_fs_cursor *fc, struct afs_vnode *vnode
 	fc->ac.error = SHRT_MAX;
 	fc->error = -EDESTADDRREQ;
 
-	if (mutex_lock_interruptible(&vnode->io_lock) < 0) {
-		fc->error = -EINTR;
-		fc->flags |= AFS_FS_CURSOR_STOP;
-		return false;
+	if (intr) {
+		fc->flags |= AFS_FS_CURSOR_INTR;
+		if (mutex_lock_interruptible(&vnode->io_lock) < 0) {
+			fc->error = -EINTR;
+			fc->flags |= AFS_FS_CURSOR_STOP;
+			return false;
+		}
+	} else {
+		mutex_lock(&vnode->io_lock);
 	}
 
 	if (vnode->lock_state != AFS_VNODE_LOCK_NONE)
@@ -118,10 +123,14 @@ static void afs_busy(struct afs_volume *volume, u32 abort_code)
  */
 static bool afs_sleep_and_retry(struct afs_fs_cursor *fc)
 {
-	msleep_interruptible(1000);
-	if (signal_pending(current)) {
-		fc->error = -ERESTARTSYS;
-		return false;
+	if (fc->flags & AFS_FS_CURSOR_INTR) {
+		msleep_interruptible(1000);
+		if (signal_pending(current)) {
+			fc->error = -ERESTARTSYS;
+			return false;
+		}
+	} else {
+		msleep(1000);
 	}
 
 	return true;
diff --git a/fs/afs/rxrpc.c b/fs/afs/rxrpc.c
index 47cb5e6ef9bd..bd17c0267094 100644
--- a/fs/afs/rxrpc.c
+++ b/fs/afs/rxrpc.c
@@ -417,7 +417,7 @@ void afs_make_call(struct afs_addr_cursor *ac, struct afs_call *call, gfp_t gfp)
 					  afs_wake_up_async_call :
 					  afs_wake_up_call_waiter),
 					 call->upgrade,
-					 true,
+					 call->intr,
 					 call->debug_id);
 	if (IS_ERR(rxcall)) {
 		ret = PTR_ERR(rxcall);
@@ -649,7 +649,7 @@ long afs_wait_for_call_to_complete(struct afs_call *call,
 			break;
 		}
 
-		if (timeout == 0 &&
+		if (call->intr && timeout == 0 &&
 		    life == last_life && signal_pending(current)) {
 			if (stalled)
 				break;
diff --git a/fs/afs/super.c b/fs/afs/super.c
index 783c68cd1a35..3df11eede7f4 100644
--- a/fs/afs/super.c
+++ b/fs/afs/super.c
@@ -741,7 +741,7 @@ static int afs_statfs(struct dentry *dentry, struct kstatfs *buf)
 		return PTR_ERR(key);
 
 	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, key)) {
+	if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
 		fc.flags |= AFS_FS_CURSOR_NO_VSLEEP;
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(vnode);
diff --git a/fs/afs/write.c b/fs/afs/write.c
index 0122d7445fba..e669f2fae873 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -361,7 +361,7 @@ static int afs_store_data(struct address_space *mapping,
 	_debug("USE WB KEY %u", key_serial(wbk->key));
 
 	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, wbk->key)) {
+	if (afs_begin_vnode_operation(&fc, vnode, wbk->key, false)) {
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(vnode);
 			afs_fs_store_data(&fc, mapping, first, last, offset, to);
diff --git a/fs/afs/xattr.c b/fs/afs/xattr.c
index d12bcda911e1..e13b005fac42 100644
--- a/fs/afs/xattr.c
+++ b/fs/afs/xattr.c
@@ -57,7 +57,7 @@ static int afs_xattr_get_acl(const struct xattr_handler *handler,
 		return PTR_ERR(key);
 
 	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, key)) {
+	if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(vnode);
 			acl = afs_fs_fetch_acl(&fc);
@@ -114,7 +114,7 @@ static int afs_xattr_set_acl(const struct xattr_handler *handler,
 	memcpy(acl->data, buffer, size);
 
 	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, key)) {
+	if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(vnode);
 			afs_fs_store_acl(&fc, acl);
@@ -178,7 +178,7 @@ static int afs_xattr_get_yfs(const struct xattr_handler *handler,
 	}
 
 	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, key)) {
+	if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(vnode);
 			yfs_fs_fetch_opaque_acl(&fc, yacl);
@@ -263,7 +263,7 @@ static int afs_xattr_set_yfs(const struct xattr_handler *handler,
 	memcpy(acl->data, buffer, size);
 
 	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, key)) {
+	if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(vnode);
 			yfs_fs_store_opaque_acl2(&fc, acl);
diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index d3e9e3fe0b58..3ba33d415a74 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -519,6 +519,7 @@ int yfs_fs_fetch_file_status(struct afs_fs_cursor *fc, struct afs_volsync *volsy
 	call->cb_break = fc->cb_break;
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -712,6 +713,7 @@ int yfs_fs_fetch_data(struct afs_fs_cursor *fc, struct afs_read *req)
 	call->cb_break = fc->cb_break;
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -813,6 +815,7 @@ int yfs_fs_create_file(struct afs_fs_cursor *fc,
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call1(call, &vnode->fid, name);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -877,6 +880,7 @@ int yfs_fs_make_dir(struct afs_fs_cursor *fc,
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call1(call, &vnode->fid, name);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -968,6 +972,7 @@ int yfs_fs_remove_file2(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call1(call, &dvnode->fid, name);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -1056,6 +1061,7 @@ int yfs_fs_remove(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call1(call, &dvnode->fid, name);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -1142,6 +1148,7 @@ int yfs_fs_link(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call1(call, &vnode->fid, name);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -1239,6 +1246,7 @@ int yfs_fs_symlink(struct afs_fs_cursor *fc,
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call1(call, &dvnode->fid, name);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -1338,6 +1346,7 @@ int yfs_fs_rename(struct afs_fs_cursor *fc,
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call2(call, &orig_dvnode->fid, orig_name, new_name);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -1445,6 +1454,7 @@ int yfs_fs_store_data(struct afs_fs_cursor *fc, struct address_space *mapping,
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -1534,6 +1544,7 @@ static int yfs_fs_setattr_size(struct afs_fs_cursor *fc, struct iattr *attr)
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -1578,6 +1589,7 @@ int yfs_fs_setattr(struct afs_fs_cursor *fc, struct iattr *attr)
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -1767,6 +1779,7 @@ int yfs_fs_get_volume_status(struct afs_fs_cursor *fc,
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -1866,6 +1879,7 @@ int yfs_fs_set_lock(struct afs_fs_cursor *fc, afs_lock_type_t type)
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_calli(call, &vnode->fid, type);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -1903,6 +1917,7 @@ int yfs_fs_extend_lock(struct afs_fs_cursor *fc)
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -1939,6 +1954,7 @@ int yfs_fs_release_lock(struct afs_fs_cursor *fc)
 
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -2028,6 +2044,7 @@ int yfs_fs_fetch_status(struct afs_fs_cursor *fc,
 	call->cb_break = fc->cb_break;
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, fid);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
@@ -2212,6 +2229,7 @@ int yfs_fs_inline_bulk_status(struct afs_fs_cursor *fc,
 	call->cb_break = fc->cb_break;
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &fids[0]);
+	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
