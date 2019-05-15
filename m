Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E401FC1B
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 23:09:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7LsHC8Hrdx7P0FGBKfPRJttDsguRuAaq5kV0zdEas6Y=; b=plch3IVKbL95S0
	wEF/KwX45PWh5NUqhIlljf+O9MDVDiNPtTXyp4NTsiqBhtJJid2GmcLyH0UCGjkMgnLFh179hpAxn
	dSqgGmpvNO09OrJlqEe4LrN6XIs4pKe5NqdAN7/79y1/M8IJBsdosP2ujCqcFeQ5NcPNBFLSjSwgF
	3re/uNiOuXFIHM18TVV8f3dHID+UbEN6f1G8NJCrkvOlk4KQ0guWspIFSQYAG9JA7m6NfsVhWXGbA
	v0/GlDg4dLGen54xTYiCdHU+uK3fLGODUzZ2oOgEyKHSDOd70JGg4417/Sl5JjQO3JQ3Dq9nXnlsA
	ENDRGW2WJmBhNn4O+MXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hR19L-0006aD-VA; Wed, 15 May 2019 21:09:19 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hR0zL-0002sl-St
 for linux-afs@lists.infradead.org; Wed, 15 May 2019 20:59:07 +0000
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A6E4E307D98D;
 Wed, 15 May 2019 20:58:59 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 851145C5B0;
 Wed, 15 May 2019 20:58:56 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 05/12] afs: Fix application of status and callback to be
 under same lock
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 15 May 2019 21:58:55 +0100
Message-ID: <155795393576.28355.3267369888059455909.stgit@warthog.procyon.org.uk>
In-Reply-To: <155795389933.28355.4028912870853910492.stgit@warthog.procyon.org.uk>
References: <155795389933.28355.4028912870853910492.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Wed, 15 May 2019 20:58:59 +0000 (UTC)
X-Spam-Note: CRM114 run bypassed due to message size (138669 bytes)
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Mailman-Approved-At: Wed, 15 May 2019 14:09:18 -0700
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

When applying the status and callback in the response of an operation,
apply them in the same critical section so that there's no race between
checking the callback state and checking status-dependent state (such as
the data version).

Fix this by:

 (1) Allocating a joint {status,callback} record (afs_status_cb) before
     calling the RPC function for each vnode for which the RPC reply
     contains a status or a status plus a callback.  A flag is set in the
     record to indicate if a callback was actually received.

 (2) These records are passed into the RPC functions to be filled in.  The
     afs_decode_status() and yfs_decode_status() functions are removed and
     the cb_lock is no longer taken.

 (3) xdr_decode_AFSFetchStatus() and xdr_decode_YFSFetchStatus() no longer
     update the vnode.

 (4) xdr_decode_AFSCallBack() and xdr_decode_YFSCallBack() no longer update
     the vnode.

 (5) vnodes, expected data-version numbers and callback break counters
     (cb_break) no longer need to be passed to the reply delivery
     functions.

     Note that, for the moment, the file locking functions still need
     access to both the call and the vnode at the same time.

 (6) afs_vnode_commit_status() is now given the cb_break value and the
     expected data_version and the task of applying the status and the
     callback to the vnode are now done here.

     This is done under a single taking of vnode->cb_lock.

 (7) afs_pages_written_back() is now called by afs_store_data() rather than
     by the reply delivery function.

     afs_pages_written_back() has been moved to before the call point and
     is now given the first and last page numbers rather than a pointer to
     the call.

 (8) The indicator from YFS.RemoveFile2 as to whether the target file
     actually got removed (status.abort_code == VNOVNODE) rather than
     merely dropping a link is now checked in afs_unlink rather than in
     xdr_decode_YFSFetchStatus().

Supplementary fixes:

 (*) afs_cache_permit() now gets the caller_access mask from the
     afs_status_cb object rather than picking it out of the vnode's status
     record.  afs_fetch_status() returns caller_access through its argument
     list for this purpose also.

 (*) afs_inode_init_from_status() now uses a write lock on cb_lock rather
     than a read lock and now sets the callback inside the same critical
     section.

Fixes: c435ee34551e ("afs: Overhaul the callback handling")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/dir.c       |  204 ++++++++++++++------
 fs/afs/dir_silly.c |   31 ++-
 fs/afs/file.c      |   20 +-
 fs/afs/flock.c     |   13 -
 fs/afs/fsclient.c  |  449 ++++++++++++---------------------------------
 fs/afs/inode.c     |  285 +++++++++++++++++++++++-----
 fs/afs/internal.h  |  122 ++++++------
 fs/afs/security.c  |    7 -
 fs/afs/super.c     |    3 
 fs/afs/write.c     |   98 +++++-----
 fs/afs/xattr.c     |  103 +++++++---
 fs/afs/yfsclient.c |  524 ++++++++++++++--------------------------------------
 12 files changed, 873 insertions(+), 986 deletions(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index 0f14bcfe233d..f7344b045799 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -18,6 +18,7 @@
 #include <linux/sched.h>
 #include <linux/task_io_accounting_ops.h>
 #include "internal.h"
+#include "afs_fs.h"
 #include "xdr_fs.h"
 
 static struct dentry *afs_lookup(struct inode *dir, struct dentry *dentry,
@@ -739,8 +740,7 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 			afs_fs_fetch_status(&fc,
 					    afs_v2net(dvnode),
 					    cookie->fids,
-					    &scb->status,
-					    &scb->callback,
+					    scb,
 					    NULL);
 		}
 
@@ -771,9 +771,7 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 			continue;
 
 		ti = afs_iget(dir->i_sb, key, &cookie->fids[i],
-			      &scb->status,
-			      &scb->callback,
-			      cbi, dvnode);
+			      scb, cbi, dvnode);
 		if (i == 0) {
 			inode = ti;
 		} else {
@@ -1110,8 +1108,7 @@ void afs_d_release(struct dentry *dentry)
 static void afs_vnode_new_inode(struct afs_fs_cursor *fc,
 				struct dentry *new_dentry,
 				struct afs_fid *newfid,
-				struct afs_file_status *newstatus,
-				struct afs_callback *newcb)
+				struct afs_status_cb *new_scb)
 {
 	struct afs_vnode *vnode;
 	struct inode *inode;
@@ -1120,7 +1117,7 @@ static void afs_vnode_new_inode(struct afs_fs_cursor *fc,
 		return;
 
 	inode = afs_iget(fc->vnode->vfs_inode.i_sb, fc->key,
-			 newfid, newstatus, newcb, fc->cbi, fc->vnode);
+			 newfid, new_scb, fc->cbi, fc->vnode);
 	if (IS_ERR(inode)) {
 		/* ENOMEM or EINTR at a really inconvenient time - just abandon
 		 * the new directory on the server.
@@ -1131,7 +1128,8 @@ static void afs_vnode_new_inode(struct afs_fs_cursor *fc,
 
 	vnode = AFS_FS_I(inode);
 	set_bit(AFS_VNODE_NEW_CONTENT, &vnode->flags);
-	afs_vnode_commit_status(fc, vnode, 0);
+	if (fc->ac.error == 0)
+		afs_cache_permit(vnode, fc->key, vnode->cb_break, new_scb);
 	d_instantiate(new_dentry, inode);
 }
 
@@ -1140,13 +1138,11 @@ static void afs_vnode_new_inode(struct afs_fs_cursor *fc,
  */
 static int afs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 {
-	struct afs_file_status newstatus;
+	struct afs_status_cb *scb;
 	struct afs_fs_cursor fc;
-	struct afs_callback newcb;
 	struct afs_vnode *dvnode = AFS_FS_I(dir);
 	struct afs_fid newfid;
 	struct key *key;
-	u64 data_version = dvnode->status.data_version;
 	int ret;
 
 	mode |= S_IFDIR;
@@ -1154,23 +1150,31 @@ static int afs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 	_enter("{%llx:%llu},{%pd},%ho",
 	       dvnode->fid.vid, dvnode->fid.vnode, dentry, mode);
 
+	ret = -ENOMEM;
+	scb = kcalloc(2, sizeof(struct afs_status_cb), GFP_KERNEL);
+	if (!scb)
+		goto error;
+
 	key = afs_request_key(dvnode->volume->cell);
 	if (IS_ERR(key)) {
 		ret = PTR_ERR(key);
-		goto error;
+		goto error_scb;
 	}
 
 	ret = -ERESTARTSYS;
 	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
+		afs_dataversion_t data_version = dvnode->status.data_version + 1;
+
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
-			afs_fs_create(&fc, dentry->d_name.name, mode, data_version,
-				      &newfid, &newstatus, &newcb);
+			afs_fs_create(&fc, dentry->d_name.name, mode,
+				      &scb[0], &newfid, &scb[1]);
 		}
 
-		afs_check_for_remote_deletion(&fc, fc.vnode);
-		afs_vnode_commit_status(&fc, dvnode, fc.cb_break);
-		afs_vnode_new_inode(&fc, dentry, &newfid, &newstatus, &newcb);
+		afs_check_for_remote_deletion(&fc, dvnode);
+		afs_vnode_commit_status(&fc, dvnode, fc.cb_break,
+					&data_version, &scb[0]);
+		afs_vnode_new_inode(&fc, dentry, &newfid, &scb[1]);
 		ret = afs_end_vnode_operation(&fc);
 		if (ret < 0)
 			goto error_key;
@@ -1184,11 +1188,14 @@ static int afs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 				 afs_edit_dir_for_create);
 
 	key_put(key);
+	kfree(scb);
 	_leave(" = 0");
 	return 0;
 
 error_key:
 	key_put(key);
+error_scb:
+	kfree(scb);
 error:
 	d_drop(dentry);
 	_leave(" = %d", ret);
@@ -1215,15 +1222,19 @@ static void afs_dir_remove_subdir(struct dentry *dentry)
  */
 static int afs_rmdir(struct inode *dir, struct dentry *dentry)
 {
+	struct afs_status_cb *scb;
 	struct afs_fs_cursor fc;
 	struct afs_vnode *dvnode = AFS_FS_I(dir), *vnode = NULL;
 	struct key *key;
-	u64 data_version = dvnode->status.data_version;
 	int ret;
 
 	_enter("{%llx:%llu},{%pd}",
 	       dvnode->fid.vid, dvnode->fid.vnode, dentry);
 
+	scb = kzalloc(sizeof(struct afs_status_cb), GFP_KERNEL);
+	if (!scb)
+		return -ENOMEM;
+
 	key = afs_request_key(dvnode->volume->cell);
 	if (IS_ERR(key)) {
 		ret = PTR_ERR(key);
@@ -1246,13 +1257,15 @@ static int afs_rmdir(struct inode *dir, struct dentry *dentry)
 
 	ret = -ERESTARTSYS;
 	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
+		afs_dataversion_t data_version = dvnode->status.data_version + 1;
+
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
-			afs_fs_remove(&fc, vnode, dentry->d_name.name, true,
-				      data_version);
+			afs_fs_remove(&fc, vnode, dentry->d_name.name, true, scb);
 		}
 
-		afs_vnode_commit_status(&fc, dvnode, fc.cb_break);
+		afs_vnode_commit_status(&fc, dvnode, fc.cb_break,
+					&data_version, scb);
 		ret = afs_end_vnode_operation(&fc);
 		if (ret == 0) {
 			afs_dir_remove_subdir(dentry);
@@ -1267,6 +1280,7 @@ static int afs_rmdir(struct inode *dir, struct dentry *dentry)
 error_key:
 	key_put(key);
 error:
+	kfree(scb);
 	return ret;
 }
 
@@ -1326,11 +1340,11 @@ int afs_dir_remove_link(struct dentry *dentry, struct key *key,
 static int afs_unlink(struct inode *dir, struct dentry *dentry)
 {
 	struct afs_fs_cursor fc;
+	struct afs_status_cb *scb;
 	struct afs_vnode *dvnode = AFS_FS_I(dir), *vnode = NULL;
 	struct key *key;
 	unsigned long d_version = (unsigned long)dentry->d_fsdata;
 	bool need_rehash = false;
-	u64 data_version = dvnode->status.data_version;
 	int ret;
 
 	_enter("{%llx:%llu},{%pd}",
@@ -1339,10 +1353,15 @@ static int afs_unlink(struct inode *dir, struct dentry *dentry)
 	if (dentry->d_name.len >= AFSNAMEMAX)
 		return -ENAMETOOLONG;
 
+	ret = -ENOMEM;
+	scb = kcalloc(2, sizeof(struct afs_status_cb), GFP_KERNEL);
+	if (!scb)
+		goto error;
+
 	key = afs_request_key(dvnode->volume->cell);
 	if (IS_ERR(key)) {
 		ret = PTR_ERR(key);
-		goto error;
+		goto error_scb;
 	}
 
 	/* Try to make sure we have a callback promise on the victim. */
@@ -1370,24 +1389,32 @@ static int afs_unlink(struct inode *dir, struct dentry *dentry)
 
 	ret = -ERESTARTSYS;
 	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
+		afs_dataversion_t data_version = dvnode->status.data_version + 1;
+
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
 
 			if (test_bit(AFS_SERVER_FL_IS_YFS, &fc.cbi->server->flags) &&
 			    !test_bit(AFS_SERVER_FL_NO_RM2, &fc.cbi->server->flags)) {
 				yfs_fs_remove_file2(&fc, vnode, dentry->d_name.name,
-						    data_version);
+						    &scb[0], &scb[1]);
+				if (fc.ac.error == 0 &&
+				    scb[1].status.abort_code == VNOVNODE) {
+					set_bit(AFS_VNODE_DELETED, &vnode->flags);
+					afs_break_callback(vnode);
+				}
+
 				if (fc.ac.error != -ECONNABORTED ||
 				    fc.ac.abort_code != RXGEN_OPCODE)
 					continue;
 				set_bit(AFS_SERVER_FL_NO_RM2, &fc.cbi->server->flags);
 			}
 
-			afs_fs_remove(&fc, vnode, dentry->d_name.name, false,
-				      data_version);
+			afs_fs_remove(&fc, vnode, dentry->d_name.name, false, &scb[0]);
 		}
 
-		afs_vnode_commit_status(&fc, dvnode, fc.cb_break);
+		afs_vnode_commit_status(&fc, dvnode, fc.cb_break,
+					&data_version, &scb[0]);
 		ret = afs_end_vnode_operation(&fc);
 		if (ret == 0)
 			ret = afs_dir_remove_link(
@@ -1404,6 +1431,8 @@ static int afs_unlink(struct inode *dir, struct dentry *dentry)
 
 error_key:
 	key_put(key);
+error_scb:
+	kfree(scb);
 error:
 	_leave(" = %d", ret);
 	return ret;
@@ -1416,12 +1445,10 @@ static int afs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 		      bool excl)
 {
 	struct afs_fs_cursor fc;
-	struct afs_file_status newstatus;
-	struct afs_callback newcb;
+	struct afs_status_cb *scb;
 	struct afs_vnode *dvnode = AFS_FS_I(dir);
 	struct afs_fid newfid;
 	struct key *key;
-	u64 data_version = dvnode->status.data_version;
 	int ret;
 
 	mode |= S_IFREG;
@@ -1439,17 +1466,25 @@ static int afs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 		goto error;
 	}
 
+	ret = -ENOMEM;
+	scb = kcalloc(2, sizeof(struct afs_status_cb), GFP_KERNEL);
+	if (!scb)
+		goto error_scb;
+
 	ret = -ERESTARTSYS;
 	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
+		afs_dataversion_t data_version = dvnode->status.data_version + 1;
+
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
-			afs_fs_create(&fc, dentry->d_name.name, mode, data_version,
-				      &newfid, &newstatus, &newcb);
+			afs_fs_create(&fc, dentry->d_name.name, mode,
+				      &scb[0], &newfid, &scb[1]);
 		}
 
-		afs_check_for_remote_deletion(&fc, fc.vnode);
-		afs_vnode_commit_status(&fc, dvnode, fc.cb_break);
-		afs_vnode_new_inode(&fc, dentry, &newfid, &newstatus, &newcb);
+		afs_check_for_remote_deletion(&fc, dvnode);
+		afs_vnode_commit_status(&fc, dvnode, fc.cb_break,
+					&data_version, &scb[0]);
+		afs_vnode_new_inode(&fc, dentry, &newfid, &scb[1]);
 		ret = afs_end_vnode_operation(&fc);
 		if (ret < 0)
 			goto error_key;
@@ -1461,10 +1496,13 @@ static int afs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 		afs_edit_dir_add(dvnode, &dentry->d_name, &newfid,
 				 afs_edit_dir_for_create);
 
+	kfree(scb);
 	key_put(key);
 	_leave(" = 0");
 	return 0;
 
+error_scb:
+	kfree(scb);
 error_key:
 	key_put(key);
 error:
@@ -1480,15 +1518,12 @@ static int afs_link(struct dentry *from, struct inode *dir,
 		    struct dentry *dentry)
 {
 	struct afs_fs_cursor fc;
-	struct afs_vnode *dvnode, *vnode;
+	struct afs_status_cb *scb;
+	struct afs_vnode *dvnode = AFS_FS_I(dir);
+	struct afs_vnode *vnode = AFS_FS_I(d_inode(from));
 	struct key *key;
-	u64 data_version;
 	int ret;
 
-	vnode = AFS_FS_I(d_inode(from));
-	dvnode = AFS_FS_I(dir);
-	data_version = dvnode->status.data_version;
-
 	_enter("{%llx:%llu},{%llx:%llu},{%pd}",
 	       vnode->fid.vid, vnode->fid.vnode,
 	       dvnode->fid.vid, dvnode->fid.vnode,
@@ -1498,14 +1533,21 @@ static int afs_link(struct dentry *from, struct inode *dir,
 	if (dentry->d_name.len >= AFSNAMEMAX)
 		goto error;
 
+	ret = -ENOMEM;
+	scb = kcalloc(2, sizeof(struct afs_status_cb), GFP_KERNEL);
+	if (!scb)
+		goto error;
+
 	key = afs_request_key(dvnode->volume->cell);
 	if (IS_ERR(key)) {
 		ret = PTR_ERR(key);
-		goto error;
+		goto error_scb;
 	}
 
 	ret = -ERESTARTSYS;
 	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
+		afs_dataversion_t data_version = dvnode->status.data_version + 1;
+
 		if (mutex_lock_interruptible_nested(&vnode->io_lock, 1) < 0) {
 			afs_end_vnode_operation(&fc);
 			goto error_key;
@@ -1514,11 +1556,14 @@ static int afs_link(struct dentry *from, struct inode *dir,
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
 			fc.cb_break_2 = afs_calc_vnode_cb_break(vnode);
-			afs_fs_link(&fc, vnode, dentry->d_name.name, data_version);
+			afs_fs_link(&fc, vnode, dentry->d_name.name,
+				    &scb[0], &scb[1]);
 		}
 
-		afs_vnode_commit_status(&fc, dvnode, fc.cb_break);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break_2);
+		afs_vnode_commit_status(&fc, dvnode, fc.cb_break,
+					&data_version, &scb[0]);
+		afs_vnode_commit_status(&fc, vnode, fc.cb_break_2,
+					NULL, &scb[1]);
 		ihold(&vnode->vfs_inode);
 		d_instantiate(dentry, &vnode->vfs_inode);
 
@@ -1535,11 +1580,14 @@ static int afs_link(struct dentry *from, struct inode *dir,
 				 afs_edit_dir_for_link);
 
 	key_put(key);
+	kfree(scb);
 	_leave(" = 0");
 	return 0;
 
 error_key:
 	key_put(key);
+error_scb:
+	kfree(scb);
 error:
 	d_drop(dentry);
 	_leave(" = %d", ret);
@@ -1553,11 +1601,10 @@ static int afs_symlink(struct inode *dir, struct dentry *dentry,
 		       const char *content)
 {
 	struct afs_fs_cursor fc;
-	struct afs_file_status newstatus;
+	struct afs_status_cb *scb;
 	struct afs_vnode *dvnode = AFS_FS_I(dir);
 	struct afs_fid newfid;
 	struct key *key;
-	u64 data_version = dvnode->status.data_version;
 	int ret;
 
 	_enter("{%llx:%llu},{%pd},%s",
@@ -1572,24 +1619,31 @@ static int afs_symlink(struct inode *dir, struct dentry *dentry,
 	if (strlen(content) >= AFSPATHMAX)
 		goto error;
 
+	ret = -ENOMEM;
+	scb = kcalloc(2, sizeof(struct afs_status_cb), GFP_KERNEL);
+	if (!scb)
+		goto error;
+
 	key = afs_request_key(dvnode->volume->cell);
 	if (IS_ERR(key)) {
 		ret = PTR_ERR(key);
-		goto error;
+		goto error_scb;
 	}
 
 	ret = -ERESTARTSYS;
 	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
+		afs_dataversion_t data_version = dvnode->status.data_version + 1;
+
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
-			afs_fs_symlink(&fc, dentry->d_name.name,
-				       content, data_version,
-				       &newfid, &newstatus);
+			afs_fs_symlink(&fc, dentry->d_name.name, content,
+				       &scb[0], &newfid, &scb[1]);
 		}
 
-		afs_check_for_remote_deletion(&fc, fc.vnode);
-		afs_vnode_commit_status(&fc, dvnode, fc.cb_break);
-		afs_vnode_new_inode(&fc, dentry, &newfid, &newstatus, NULL);
+		afs_check_for_remote_deletion(&fc, dvnode);
+		afs_vnode_commit_status(&fc, dvnode, fc.cb_break,
+					&data_version, &scb[0]);
+		afs_vnode_new_inode(&fc, dentry, &newfid, &scb[1]);
 		ret = afs_end_vnode_operation(&fc);
 		if (ret < 0)
 			goto error_key;
@@ -1602,11 +1656,14 @@ static int afs_symlink(struct inode *dir, struct dentry *dentry,
 				 afs_edit_dir_for_symlink);
 
 	key_put(key);
+	kfree(scb);
 	_leave(" = 0");
 	return 0;
 
 error_key:
 	key_put(key);
+error_scb:
+	kfree(scb);
 error:
 	d_drop(dentry);
 	_leave(" = %d", ret);
@@ -1621,11 +1678,11 @@ static int afs_rename(struct inode *old_dir, struct dentry *old_dentry,
 		      unsigned int flags)
 {
 	struct afs_fs_cursor fc;
+	struct afs_status_cb *scb;
 	struct afs_vnode *orig_dvnode, *new_dvnode, *vnode;
 	struct dentry *tmp = NULL, *rehash = NULL;
 	struct inode *new_inode;
 	struct key *key;
-	u64 orig_data_version, new_data_version;
 	bool new_negative = d_is_negative(new_dentry);
 	int ret;
 
@@ -1639,8 +1696,6 @@ static int afs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	vnode = AFS_FS_I(d_inode(old_dentry));
 	orig_dvnode = AFS_FS_I(old_dir);
 	new_dvnode = AFS_FS_I(new_dir);
-	orig_data_version = orig_dvnode->status.data_version;
-	new_data_version = new_dvnode->status.data_version;
 
 	_enter("{%llx:%llu},{%llx:%llu},{%llx:%llu},{%pd}",
 	       orig_dvnode->fid.vid, orig_dvnode->fid.vnode,
@@ -1648,10 +1703,15 @@ static int afs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	       new_dvnode->fid.vid, new_dvnode->fid.vnode,
 	       new_dentry);
 
+	ret = -ENOMEM;
+	scb = kcalloc(2, sizeof(struct afs_status_cb), GFP_KERNEL);
+	if (!scb)
+		goto error;
+
 	key = afs_request_key(orig_dvnode->volume->cell);
 	if (IS_ERR(key)) {
 		ret = PTR_ERR(key);
-		goto error;
+		goto error_scb;
 	}
 
 	/* For non-directories, check whether the target is busy and if so,
@@ -1685,31 +1745,43 @@ static int afs_rename(struct inode *old_dir, struct dentry *old_dentry,
 			new_dentry = tmp;
 			rehash = NULL;
 			new_negative = true;
-			orig_data_version = orig_dvnode->status.data_version;
-			new_data_version = new_dvnode->status.data_version;
 		}
 	}
 
 	ret = -ERESTARTSYS;
 	if (afs_begin_vnode_operation(&fc, orig_dvnode, key, true)) {
+		afs_dataversion_t orig_data_version;
+		afs_dataversion_t new_data_version;
+		struct afs_status_cb *new_scb = &scb[1];
+
+		orig_data_version = orig_dvnode->status.data_version + 1;
+
 		if (orig_dvnode != new_dvnode) {
 			if (mutex_lock_interruptible_nested(&new_dvnode->io_lock, 1) < 0) {
 				afs_end_vnode_operation(&fc);
 				goto error_rehash;
 			}
+			new_data_version = new_dvnode->status.data_version;
+		} else {
+			new_data_version = orig_data_version;
+			new_scb = &scb[0];
 		}
+
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(orig_dvnode);
 			fc.cb_break_2 = afs_calc_vnode_cb_break(new_dvnode);
 			afs_fs_rename(&fc, old_dentry->d_name.name,
 				      new_dvnode, new_dentry->d_name.name,
-				      orig_data_version, new_data_version);
+				      &scb[0], new_scb);
 		}
 
-		afs_vnode_commit_status(&fc, orig_dvnode, fc.cb_break);
-		afs_vnode_commit_status(&fc, new_dvnode, fc.cb_break_2);
-		if (orig_dvnode != new_dvnode)
+		afs_vnode_commit_status(&fc, orig_dvnode, fc.cb_break,
+					&orig_data_version, &scb[0]);
+		if (new_dvnode != orig_dvnode) {
+			afs_vnode_commit_status(&fc, new_dvnode, fc.cb_break_2,
+						&new_data_version, &scb[1]);
 			mutex_unlock(&new_dvnode->io_lock);
+		}
 		ret = afs_end_vnode_operation(&fc);
 		if (ret < 0)
 			goto error_rehash;
@@ -1749,6 +1821,8 @@ static int afs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	if (tmp)
 		dput(tmp);
 	key_put(key);
+error_scb:
+	kfree(scb);
 error:
 	_leave(" = %d", ret);
 	return ret;
diff --git a/fs/afs/dir_silly.c b/fs/afs/dir_silly.c
index fbc2d301ffe8..41360608a124 100644
--- a/fs/afs/dir_silly.c
+++ b/fs/afs/dir_silly.c
@@ -24,21 +24,28 @@ static int afs_do_silly_rename(struct afs_vnode *dvnode, struct afs_vnode *vnode
 			       struct key *key)
 {
 	struct afs_fs_cursor fc;
-	u64 dir_data_version = dvnode->status.data_version;
+	struct afs_status_cb *scb;
 	int ret = -ERESTARTSYS;
 
 	_enter("%pd,%pd", old, new);
 
+	scb = kzalloc(sizeof(struct afs_status_cb), GFP_KERNEL);
+	if (!scb)
+		return -ENOMEM;
+	
 	trace_afs_silly_rename(vnode, false);
 	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
+		afs_dataversion_t dir_data_version = dvnode->status.data_version + 1;
+
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
 			afs_fs_rename(&fc, old->d_name.name,
 				      dvnode, new->d_name.name,
-				      dir_data_version, dir_data_version);
+				      scb, scb);
 		}
 
-		afs_vnode_commit_status(&fc, dvnode, fc.cb_break);
+		afs_vnode_commit_status(&fc, dvnode, fc.cb_break,
+					&dir_data_version, scb);
 		ret = afs_end_vnode_operation(&fc);
 	}
 
@@ -64,6 +71,7 @@ static int afs_do_silly_rename(struct afs_vnode *dvnode, struct afs_vnode *vnode
 		fsnotify_nameremove(old, 0);
 	}
 
+	kfree(scb);
 	_leave(" = %d", ret);
 	return ret;
 }
@@ -143,31 +151,37 @@ static int afs_do_silly_unlink(struct afs_vnode *dvnode, struct afs_vnode *vnode
 			       struct dentry *dentry, struct key *key)
 {
 	struct afs_fs_cursor fc;
-	u64 dir_data_version = dvnode->status.data_version;
+	struct afs_status_cb *scb;
 	int ret = -ERESTARTSYS;
 
 	_enter("");
 
+	scb = kcalloc(2, sizeof(struct afs_status_cb), GFP_KERNEL);
+	if (!scb)
+		return -ENOMEM;
+
 	trace_afs_silly_rename(vnode, true);
 	if (afs_begin_vnode_operation(&fc, dvnode, key, false)) {
+		afs_dataversion_t dir_data_version = dvnode->status.data_version + 1;
+
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
 
 			if (test_bit(AFS_SERVER_FL_IS_YFS, &fc.cbi->server->flags) &&
 			    !test_bit(AFS_SERVER_FL_NO_RM2, &fc.cbi->server->flags)) {
 				yfs_fs_remove_file2(&fc, vnode, dentry->d_name.name,
-						    dir_data_version);
+						    &scb[0], &scb[1]);
 				if (fc.ac.error != -ECONNABORTED ||
 				    fc.ac.abort_code != RXGEN_OPCODE)
 					continue;
 				set_bit(AFS_SERVER_FL_NO_RM2, &fc.cbi->server->flags);
 			}
 
-			afs_fs_remove(&fc, vnode, dentry->d_name.name, false,
-				      dir_data_version);
+			afs_fs_remove(&fc, vnode, dentry->d_name.name, false, &scb[0]);
 		}
 
-		afs_vnode_commit_status(&fc, dvnode, fc.cb_break);
+		afs_vnode_commit_status(&fc, dvnode, fc.cb_break,
+					&dir_data_version, &scb[0]);
 		ret = afs_end_vnode_operation(&fc);
 		if (ret == 0) {
 			drop_nlink(&vnode->vfs_inode);
@@ -182,6 +196,7 @@ static int afs_do_silly_unlink(struct afs_vnode *dvnode, struct afs_vnode *vnode
 					    afs_edit_dir_for_unlink);
 	}
 
+	kfree(scb);
 	_leave(" = %d", ret);
 	return ret;
 }
diff --git a/fs/afs/file.c b/fs/afs/file.c
index 415c84dddb89..0fe55688f6b4 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -228,6 +228,7 @@ static void afs_file_readpage_read_complete(struct page *page,
 int afs_fetch_data(struct afs_vnode *vnode, struct key *key, struct afs_read *desc)
 {
 	struct afs_fs_cursor fc;
+	struct afs_status_cb *scb;
 	int ret;
 
 	_enter("%s{%llx:%llu.%u},%x,,,",
@@ -237,15 +238,22 @@ int afs_fetch_data(struct afs_vnode *vnode, struct key *key, struct afs_read *de
 	       vnode->fid.unique,
 	       key_serial(key));
 
+	scb = kzalloc(sizeof(struct afs_status_cb), GFP_KERNEL);
+	if (!scb)
+		return -ENOMEM;
+	
 	ret = -ERESTARTSYS;
 	if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
+		afs_dataversion_t data_version = vnode->status.data_version;
+
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(vnode);
-			afs_fs_fetch_data(&fc, desc);
+			afs_fs_fetch_data(&fc, scb, desc);
 		}
 
-		afs_check_for_remote_deletion(&fc, fc.vnode);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break);
+		afs_check_for_remote_deletion(&fc, vnode);
+		afs_vnode_commit_status(&fc, vnode, fc.cb_break,
+					&data_version, scb);
 		ret = afs_end_vnode_operation(&fc);
 	}
 
@@ -255,6 +263,7 @@ int afs_fetch_data(struct afs_vnode *vnode, struct key *key, struct afs_read *de
 				&afs_v2net(vnode)->n_fetch_bytes);
 	}
 
+	kfree(scb);
 	_leave(" = %d", ret);
 	return ret;
 }
@@ -405,10 +414,10 @@ static int afs_readpage(struct file *file, struct page *page)
 /*
  * Make pages available as they're filled.
  */
-static void afs_readpages_page_done(struct afs_call *call, struct afs_read *req)
+static void afs_readpages_page_done(struct afs_read *req)
 {
 #ifdef CONFIG_AFS_FSCACHE
-	struct afs_vnode *vnode = call->xvnode;
+	struct afs_vnode *vnode = req->vnode;
 #endif
 	struct page *page = req->pages[req->index];
 
@@ -462,6 +471,7 @@ static int afs_readpages_one(struct file *file, struct address_space *mapping,
 		return -ENOMEM;
 
 	refcount_set(&req->usage, 1);
+	req->vnode = vnode;
 	req->page_done = afs_readpages_page_done;
 	req->pos = first->index;
 	req->pos <<= PAGE_SHIFT;
diff --git a/fs/afs/flock.c b/fs/afs/flock.c
index ce8275940b99..f86ceab22e9b 100644
--- a/fs/afs/flock.c
+++ b/fs/afs/flock.c
@@ -74,7 +74,7 @@ static void afs_schedule_lock_extension(struct afs_vnode *vnode)
  */
 void afs_lock_op_done(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->xvnode;
+	struct afs_vnode *vnode = call->lvnode;
 
 	if (call->error == 0) {
 		spin_lock(&vnode->lock);
@@ -199,8 +199,7 @@ static int afs_set_lock(struct afs_vnode *vnode, struct key *key,
 			afs_fs_set_lock(&fc, type);
 		}
 
-		afs_check_for_remote_deletion(&fc, fc.vnode);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break);
+		afs_check_for_remote_deletion(&fc, vnode);
 		ret = afs_end_vnode_operation(&fc);
 	}
 
@@ -230,8 +229,7 @@ static int afs_extend_lock(struct afs_vnode *vnode, struct key *key)
 			afs_fs_extend_lock(&fc);
 		}
 
-		afs_check_for_remote_deletion(&fc, fc.vnode);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break);
+		afs_check_for_remote_deletion(&fc, vnode);
 		ret = afs_end_vnode_operation(&fc);
 	}
 
@@ -261,8 +259,7 @@ static int afs_release_lock(struct afs_vnode *vnode, struct key *key)
 			afs_fs_release_lock(&fc);
 		}
 
-		afs_check_for_remote_deletion(&fc, fc.vnode);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break);
+		afs_check_for_remote_deletion(&fc, vnode);
 		ret = afs_end_vnode_operation(&fc);
 	}
 
@@ -733,7 +730,7 @@ static int afs_do_getlk(struct file *file, struct file_lock *fl)
 	posix_test_lock(file, fl);
 	if (fl->fl_type == F_UNLCK) {
 		/* no local locks; consult the server */
-		ret = afs_fetch_status(vnode, key, false);
+		ret = afs_fetch_status(vnode, key, false, NULL);
 		if (ret < 0)
 			goto error;
 
diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index 8f06ab42442a..24ed4049ff67 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -59,79 +59,18 @@ static void xdr_dump_bad(const __be32 *bp)
 	pr_notice("0x50: %08x\n", ntohl(x[0]));
 }
 
-/*
- * Update the core inode struct from a returned status record.
- */
-void afs_update_inode_from_status(struct afs_vnode *vnode,
-				  struct afs_file_status *status,
-				  const afs_dataversion_t *expected_version,
-				  u8 flags)
-{
-	struct timespec64 t;
-	umode_t mode;
-
-	t = status->mtime_client;
-	vnode->vfs_inode.i_ctime = t;
-	vnode->vfs_inode.i_mtime = t;
-	vnode->vfs_inode.i_atime = t;
-
-	if (flags & (AFS_VNODE_META_CHANGED | AFS_VNODE_NOT_YET_SET)) {
-		vnode->vfs_inode.i_uid = make_kuid(&init_user_ns, status->owner);
-		vnode->vfs_inode.i_gid = make_kgid(&init_user_ns, status->group);
-		set_nlink(&vnode->vfs_inode, status->nlink);
-
-		mode = vnode->vfs_inode.i_mode;
-		mode &= ~S_IALLUGO;
-		mode |= status->mode;
-		barrier();
-		vnode->vfs_inode.i_mode = mode;
-	}
-
-	if (!(flags & AFS_VNODE_NOT_YET_SET)) {
-		if (expected_version &&
-		    *expected_version != status->data_version) {
-			_debug("vnode modified %llx on {%llx:%llu} [exp %llx]",
-			       (unsigned long long) status->data_version,
-			       vnode->fid.vid, vnode->fid.vnode,
-			       (unsigned long long) *expected_version);
-			vnode->invalid_before = status->data_version;
-			if (vnode->status.type == AFS_FTYPE_DIR) {
-				if (test_and_clear_bit(AFS_VNODE_DIR_VALID, &vnode->flags))
-					afs_stat_v(vnode, n_inval);
-			} else {
-				set_bit(AFS_VNODE_ZAP_DATA, &vnode->flags);
-			}
-		} else if (vnode->status.type == AFS_FTYPE_DIR) {
-			/* Expected directory change is handled elsewhere so
-			 * that we can locally edit the directory and save on a
-			 * download.
-			 */
-			if (test_bit(AFS_VNODE_DIR_VALID, &vnode->flags))
-				flags &= ~AFS_VNODE_DATA_CHANGED;
-		}
-	}
-
-	if (flags & (AFS_VNODE_DATA_CHANGED | AFS_VNODE_NOT_YET_SET)) {
-		inode_set_iversion_raw(&vnode->vfs_inode, status->data_version);
-		i_size_write(&vnode->vfs_inode, status->size);
-	}
-}
-
 /*
  * decode an AFSFetchStatus block
  */
-static int xdr_decode_AFSFetchStatus(struct afs_call *call,
-				     const __be32 **_bp,
-				     struct afs_file_status *status,
-				     struct afs_vnode *vnode,
-				     const afs_dataversion_t *expected_version,
-				     struct afs_read *read_req)
+static int xdr_decode_AFSFetchStatus(const __be32 **_bp,
+				     struct afs_call *call,
+				     struct afs_status_cb *scb)
 {
 	const struct afs_xdr_AFSFetchStatus *xdr = (const void *)*_bp;
+	struct afs_file_status *status = &scb->status;
 	bool inline_error = (call->operation_ID == afs_FS_InlineBulkStatus);
 	u64 data_version, size;
 	u32 type, abort_code;
-	u8 flags = 0;
 
 	abort_code = ntohl(xdr->abort_code);
 
@@ -161,44 +100,25 @@ static int xdr_decode_AFSFetchStatus(struct afs_call *call,
 	case AFS_FTYPE_FILE:
 	case AFS_FTYPE_DIR:
 	case AFS_FTYPE_SYMLINK:
-		if (type != status->type &&
-		    vnode &&
-		    !test_bit(AFS_VNODE_UNSET, &vnode->flags)) {
-			pr_warning("Vnode %llx:%llx:%x changed type %u to %u\n",
-				   vnode->fid.vid,
-				   vnode->fid.vnode,
-				   vnode->fid.unique,
-				   status->type, type);
-			goto bad;
-		}
 		status->type = type;
 		break;
 	default:
 		goto bad;
 	}
 
-#define EXTRACT_M(FIELD)					\
-	do {							\
-		u32 x = ntohl(xdr->FIELD);			\
-		if (status->FIELD != x) {			\
-			flags |= AFS_VNODE_META_CHANGED;	\
-			status->FIELD = x;			\
-		}						\
-	} while (0)
-
-	EXTRACT_M(nlink);
-	EXTRACT_M(author);
-	EXTRACT_M(owner);
-	EXTRACT_M(caller_access); /* call ticket dependent */
-	EXTRACT_M(anon_access);
-	EXTRACT_M(mode);
-	EXTRACT_M(group);
+	status->nlink		= ntohl(xdr->nlink);
+	status->author		= ntohl(xdr->author);
+	status->owner		= ntohl(xdr->owner);
+	status->caller_access	= ntohl(xdr->caller_access); /* Ticket dependent */
+	status->anon_access	= ntohl(xdr->anon_access);
+	status->mode		= ntohl(xdr->mode) & S_IALLUGO;
+	status->group		= ntohl(xdr->group);
+	status->lock_count	= ntohl(xdr->lock_count);
 
 	status->mtime_client.tv_sec = ntohl(xdr->mtime_client);
 	status->mtime_client.tv_nsec = 0;
 	status->mtime_server.tv_sec = ntohl(xdr->mtime_server);
 	status->mtime_server.tv_nsec = 0;
-	status->lock_count   = ntohl(xdr->lock_count);
 
 	size  = (u64)ntohl(xdr->size_lo);
 	size |= (u64)ntohl(xdr->size_hi) << 32;
@@ -206,25 +126,9 @@ static int xdr_decode_AFSFetchStatus(struct afs_call *call,
 
 	data_version  = (u64)ntohl(xdr->data_version_lo);
 	data_version |= (u64)ntohl(xdr->data_version_hi) << 32;
-	if (data_version != status->data_version) {
-		status->data_version = data_version;
-		flags |= AFS_VNODE_DATA_CHANGED;
-	}
-
-	if (read_req) {
-		read_req->data_version = data_version;
-		read_req->file_size = size;
-	}
+	status->data_version = data_version;
 
 	*_bp = (const void *)*_bp + sizeof(*xdr);
-
-	if (vnode) {
-		if (test_bit(AFS_VNODE_UNSET, &vnode->flags))
-			flags |= AFS_VNODE_NOT_YET_SET;
-		afs_update_inode_from_status(vnode, status, expected_version,
-					     flags);
-	}
-
 	return 0;
 
 bad:
@@ -232,77 +136,25 @@ static int xdr_decode_AFSFetchStatus(struct afs_call *call,
 	return afs_protocol_error(call, -EBADMSG, afs_eproto_bad_status);
 }
 
-/*
- * Decode the file status.  We need to lock the target vnode if we're going to
- * update its status so that stat() sees the attributes update atomically.
- */
-static int afs_decode_status(struct afs_call *call,
-			     const __be32 **_bp,
-			     struct afs_file_status *status,
-			     struct afs_vnode *vnode,
-			     const afs_dataversion_t *expected_version,
-			     struct afs_read *read_req)
-{
-	int ret;
-
-	if (!vnode)
-		return xdr_decode_AFSFetchStatus(call, _bp, status, vnode,
-						 expected_version, read_req);
-
-	write_seqlock(&vnode->cb_lock);
-	ret = xdr_decode_AFSFetchStatus(call, _bp, status, vnode,
-					expected_version, read_req);
-	write_sequnlock(&vnode->cb_lock);
-	return ret;
-}
-
 static time64_t xdr_decode_expiry(struct afs_call *call, u32 expiry)
 {
 	return ktime_divns(call->reply_time, NSEC_PER_SEC) + expiry;
 }
 
-static void xdr_decode_AFSCallBack_raw(struct afs_call *call,
-				       struct afs_callback *cb,
-				       const __be32 **_bp)
+static void xdr_decode_AFSCallBack(const __be32 **_bp,
+				   struct afs_call *call,
+				   struct afs_status_cb *scb)
 {
+	struct afs_callback *cb = &scb->callback;
 	const __be32 *bp = *_bp;
 
 	cb->version	= ntohl(*bp++);
 	cb->expires_at	= xdr_decode_expiry(call, ntohl(*bp++));
 	cb->type	= ntohl(*bp++);
+	scb->have_cb	= true;
 	*_bp = bp;
 }
 
-/*
- * decode an AFSCallBack block
- */
-static void xdr_decode_AFSCallBack(struct afs_call *call,
-				   struct afs_vnode *vnode,
-				   const __be32 **_bp)
-{
-	struct afs_cb_interest *old, *cbi = call->cbi;
-	struct afs_callback cb;
-
-	xdr_decode_AFSCallBack_raw(call, &cb, _bp);
-
-	write_seqlock(&vnode->cb_lock);
-
-	if (!afs_cb_is_broken(call->cb_break, vnode, cbi)) {
-		vnode->cb_version	= cb.version;
-		vnode->cb_type		= cb.type;
-		vnode->cb_expires_at	= cb.expires_at;
-		old = vnode->cb_interest;
-		if (old != call->cbi) {
-			vnode->cb_interest = cbi;
-			cbi = old;
-		}
-		set_bit(AFS_VNODE_CB_PROMISED, &vnode->flags);
-	}
-
-	write_sequnlock(&vnode->cb_lock);
-	call->cbi = cbi;
-}
-
 /*
  * decode an AFSVolSync block
  */
@@ -392,7 +244,6 @@ static void xdr_decode_AFSFetchVolumeStatus(const __be32 **_bp,
  */
 static int afs_deliver_fs_fetch_status_vnode(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->xvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -400,15 +251,12 @@ static int afs_deliver_fs_fetch_status_vnode(struct afs_call *call)
 	if (ret < 0)
 		return ret;
 
-	_enter("{%llx:%llu}", vnode->fid.vid, vnode->fid.vnode);
-
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	ret = afs_decode_status(call, &bp, &vnode->status, vnode,
-				&call->expected_version, NULL);
+	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
 	if (ret < 0)
 		return ret;
-	xdr_decode_AFSCallBack(call, vnode, &bp);
+	xdr_decode_AFSCallBack(&bp, call, call->out_scb);
 	xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
@@ -428,8 +276,8 @@ static const struct afs_call_type afs_RXFSFetchStatus_vnode = {
 /*
  * fetch the status information for a file
  */
-int afs_fs_fetch_file_status(struct afs_fs_cursor *fc, struct afs_volsync *volsync,
-			     bool new_inode)
+int afs_fs_fetch_file_status(struct afs_fs_cursor *fc, struct afs_status_cb *scb,
+			     struct afs_volsync *volsync)
 {
 	struct afs_vnode *vnode = fc->vnode;
 	struct afs_call *call;
@@ -437,7 +285,7 @@ int afs_fs_fetch_file_status(struct afs_fs_cursor *fc, struct afs_volsync *volsy
 	__be32 *bp;
 
 	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
-		return yfs_fs_fetch_file_status(fc, volsync, new_inode);
+		return yfs_fs_fetch_file_status(fc, scb, volsync);
 
 	_enter(",%x,{%llx:%llu},,",
 	       key_serial(fc->key), vnode->fid.vid, vnode->fid.vnode);
@@ -450,9 +298,8 @@ int afs_fs_fetch_file_status(struct afs_fs_cursor *fc, struct afs_volsync *volsy
 	}
 
 	call->key = fc->key;
-	call->xvnode = vnode;
+	call->out_scb = scb;
 	call->out_volsync = volsync;
-	call->expected_version = new_inode ? 1 : vnode->status.data_version;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -461,7 +308,6 @@ int afs_fs_fetch_file_status(struct afs_fs_cursor *fc, struct afs_volsync *volsy
 	bp[2] = htonl(vnode->fid.vnode);
 	bp[3] = htonl(vnode->fid.unique);
 
-	call->cb_break = fc->cb_break;
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
 
@@ -475,7 +321,6 @@ int afs_fs_fetch_file_status(struct afs_fs_cursor *fc, struct afs_volsync *volsy
  */
 static int afs_deliver_fs_fetch_data(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->xvnode;
 	struct afs_read *req = call->read_request;
 	const __be32 *bp;
 	unsigned int size;
@@ -538,7 +383,7 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 		if (req->offset == PAGE_SIZE) {
 			req->offset = 0;
 			if (req->page_done)
-				req->page_done(call, req);
+				req->page_done(req);
 			req->index++;
 			if (req->remain > 0)
 				goto begin_page;
@@ -572,13 +417,15 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 			return ret;
 
 		bp = call->buffer;
-		ret = afs_decode_status(call, &bp, &vnode->status, vnode,
-					&vnode->status.data_version, req);
+		ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
 		if (ret < 0)
 			return ret;
-		xdr_decode_AFSCallBack(call, vnode, &bp);
+		xdr_decode_AFSCallBack(&bp, call, call->out_scb);
 		xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
+		req->data_version = call->out_scb->status.data_version;
+		req->file_size = call->out_scb->status.size;
+
 		call->unmarshall++;
 
 	case 5:
@@ -590,7 +437,7 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 			zero_user_segment(req->pages[req->index],
 					  req->offset, PAGE_SIZE);
 		if (req->page_done)
-			req->page_done(call, req);
+			req->page_done(req);
 		req->offset = 0;
 	}
 
@@ -626,7 +473,9 @@ static const struct afs_call_type afs_RXFSFetchData64 = {
 /*
  * fetch data from a very large file
  */
-static int afs_fs_fetch_data64(struct afs_fs_cursor *fc, struct afs_read *req)
+static int afs_fs_fetch_data64(struct afs_fs_cursor *fc,
+			       struct afs_status_cb *scb,
+			       struct afs_read *req)
 {
 	struct afs_vnode *vnode = fc->vnode;
 	struct afs_call *call;
@@ -640,10 +489,9 @@ static int afs_fs_fetch_data64(struct afs_fs_cursor *fc, struct afs_read *req)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->xvnode = vnode;
+	call->out_scb = scb;
 	call->out_volsync = NULL;
 	call->read_request = req;
-	call->expected_version = vnode->status.data_version;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -657,7 +505,6 @@ static int afs_fs_fetch_data64(struct afs_fs_cursor *fc, struct afs_read *req)
 	bp[7] = htonl(lower_32_bits(req->len));
 
 	refcount_inc(&req->usage);
-	call->cb_break = fc->cb_break;
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
 	afs_set_fc_call(call, fc);
@@ -668,7 +515,9 @@ static int afs_fs_fetch_data64(struct afs_fs_cursor *fc, struct afs_read *req)
 /*
  * fetch data from a file
  */
-int afs_fs_fetch_data(struct afs_fs_cursor *fc, struct afs_read *req)
+int afs_fs_fetch_data(struct afs_fs_cursor *fc,
+		      struct afs_status_cb *scb,
+		      struct afs_read *req)
 {
 	struct afs_vnode *vnode = fc->vnode;
 	struct afs_call *call;
@@ -676,12 +525,12 @@ int afs_fs_fetch_data(struct afs_fs_cursor *fc, struct afs_read *req)
 	__be32 *bp;
 
 	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
-		return yfs_fs_fetch_data(fc, req);
+		return yfs_fs_fetch_data(fc, scb, req);
 
 	if (upper_32_bits(req->pos) ||
 	    upper_32_bits(req->len) ||
 	    upper_32_bits(req->pos + req->len))
-		return afs_fs_fetch_data64(fc, req);
+		return afs_fs_fetch_data64(fc, scb, req);
 
 	_enter("");
 
@@ -690,10 +539,9 @@ int afs_fs_fetch_data(struct afs_fs_cursor *fc, struct afs_read *req)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->xvnode = vnode;
+	call->out_scb = scb;
 	call->out_volsync = NULL;
 	call->read_request = req;
-	call->expected_version = vnode->status.data_version;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -705,7 +553,6 @@ int afs_fs_fetch_data(struct afs_fs_cursor *fc, struct afs_read *req)
 	bp[5] = htonl(lower_32_bits(req->len));
 
 	refcount_inc(&req->usage);
-	call->cb_break = fc->cb_break;
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
 	afs_set_fc_call(call, fc);
@@ -718,12 +565,9 @@ int afs_fs_fetch_data(struct afs_fs_cursor *fc, struct afs_read *req)
  */
 static int afs_deliver_fs_create_vnode(struct afs_call *call)
 {
-	struct afs_vnode *dvnode = call->dvnode;
 	const __be32 *bp;
 	int ret;
 
-	_enter("{%u}", call->unmarshall);
-
 	ret = afs_transfer_reply(call);
 	if (ret < 0)
 		return ret;
@@ -731,14 +575,13 @@ static int afs_deliver_fs_create_vnode(struct afs_call *call)
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
 	xdr_decode_AFSFid(&bp, call->out_fid);
-	ret = afs_decode_status(call, &bp, call->out_extra_status, NULL, NULL, NULL);
+	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
 	if (ret < 0)
 		return ret;
-	ret = afs_decode_status(call, &bp, &dvnode->status, dvnode,
-				&call->expected_version, NULL);
+	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_dir_scb);
 	if (ret < 0)
 		return ret;
-	xdr_decode_AFSCallBack_raw(call, call->out_cb, &bp);
+	xdr_decode_AFSCallBack(&bp, call, call->out_scb);
 	xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
@@ -768,10 +611,9 @@ static const struct afs_call_type afs_RXFSMakeDir = {
 int afs_fs_create(struct afs_fs_cursor *fc,
 		  const char *name,
 		  umode_t mode,
-		  u64 current_data_version,
+		  struct afs_status_cb *dvnode_scb,
 		  struct afs_fid *newfid,
-		  struct afs_file_status *newstatus,
-		  struct afs_callback *newcb)
+		  struct afs_status_cb *new_scb)
 {
 	struct afs_vnode *dvnode = fc->vnode;
 	struct afs_call *call;
@@ -781,11 +623,11 @@ int afs_fs_create(struct afs_fs_cursor *fc,
 
 	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags)){
 		if (S_ISDIR(mode))
-			return yfs_fs_make_dir(fc, name, mode, current_data_version,
-					       newfid, newstatus, newcb);
+			return yfs_fs_make_dir(fc, name, mode, dvnode_scb,
+					       newfid, new_scb);
 		else
-			return yfs_fs_create_file(fc, name, mode, current_data_version,
-						  newfid, newstatus, newcb);
+			return yfs_fs_create_file(fc, name, mode, dvnode_scb,
+						  newfid, new_scb);
 	}
 
 	_enter("");
@@ -801,11 +643,9 @@ int afs_fs_create(struct afs_fs_cursor *fc,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->dvnode = dvnode;
+	call->out_dir_scb = dvnode_scb;
 	call->out_fid = newfid;
-	call->out_extra_status = newstatus;
-	call->out_cb = newcb;
-	call->expected_version = current_data_version + 1;
+	call->out_scb = new_scb;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -840,20 +680,16 @@ int afs_fs_create(struct afs_fs_cursor *fc,
  */
 static int afs_deliver_fs_dir_status_and_vol(struct afs_call *call)
 {
-	struct afs_vnode *dvnode = call->dvnode;
 	const __be32 *bp;
 	int ret;
 
-	_enter("{%u}", call->unmarshall);
-
 	ret = afs_transfer_reply(call);
 	if (ret < 0)
 		return ret;
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	ret = afs_decode_status(call, &bp, &dvnode->status, dvnode,
-				&call->expected_version, NULL);
+	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_dir_scb);
 	if (ret < 0)
 		return ret;
 	xdr_decode_AFSVolSync(&bp, call->out_volsync);
@@ -883,7 +719,7 @@ static const struct afs_call_type afs_RXFSRemoveDir = {
  * remove a file or directory
  */
 int afs_fs_remove(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
-		  const char *name, bool isdir, u64 current_data_version)
+		  const char *name, bool isdir, struct afs_status_cb *dvnode_scb)
 {
 	struct afs_vnode *dvnode = fc->vnode;
 	struct afs_call *call;
@@ -892,7 +728,7 @@ int afs_fs_remove(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
 	__be32 *bp;
 
 	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
-		return yfs_fs_remove(fc, vnode, name, isdir, current_data_version);
+		return yfs_fs_remove(fc, vnode, name, isdir, dvnode_scb);
 
 	_enter("");
 
@@ -907,9 +743,7 @@ int afs_fs_remove(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->dvnode = dvnode;
-	call->xvnode = vnode;
-	call->expected_version = current_data_version + 1;
+	call->out_dir_scb = dvnode_scb;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -937,7 +771,6 @@ int afs_fs_remove(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
  */
 static int afs_deliver_fs_link(struct afs_call *call)
 {
-	struct afs_vnode *dvnode = call->dvnode, *vnode = call->xvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -949,11 +782,10 @@ static int afs_deliver_fs_link(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	ret = afs_decode_status(call, &bp, &vnode->status, vnode, NULL, NULL);
+	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
 	if (ret < 0)
 		return ret;
-	ret = afs_decode_status(call, &bp, &dvnode->status, dvnode,
-				&call->expected_version, NULL);
+	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_dir_scb);
 	if (ret < 0)
 		return ret;
 	xdr_decode_AFSVolSync(&bp, call->out_volsync);
@@ -976,7 +808,9 @@ static const struct afs_call_type afs_RXFSLink = {
  * make a hard link
  */
 int afs_fs_link(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
-		const char *name, u64 current_data_version)
+		const char *name,
+		struct afs_status_cb *dvnode_scb,
+		struct afs_status_cb *vnode_scb)
 {
 	struct afs_vnode *dvnode = fc->vnode;
 	struct afs_call *call;
@@ -985,7 +819,7 @@ int afs_fs_link(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
 	__be32 *bp;
 
 	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
-		return yfs_fs_link(fc, vnode, name, current_data_version);
+		return yfs_fs_link(fc, vnode, name, dvnode_scb, vnode_scb);
 
 	_enter("");
 
@@ -998,9 +832,8 @@ int afs_fs_link(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->dvnode = dvnode;
-	call->xvnode = vnode;
-	call->expected_version = current_data_version + 1;
+	call->out_dir_scb = dvnode_scb;
+	call->out_scb = vnode_scb;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -1031,7 +864,6 @@ int afs_fs_link(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
  */
 static int afs_deliver_fs_symlink(struct afs_call *call)
 {
-	struct afs_vnode *dvnode = call->dvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -1044,11 +876,10 @@ static int afs_deliver_fs_symlink(struct afs_call *call)
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
 	xdr_decode_AFSFid(&bp, call->out_fid);
-	ret = afs_decode_status(call, &bp, call->out_extra_status, NULL, NULL, NULL);
+	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
 	if (ret < 0)
 		return ret;
-	ret = afs_decode_status(call, &bp, &dvnode->status, dvnode,
-				&call->expected_version, NULL);
+	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_dir_scb);
 	if (ret < 0)
 		return ret;
 	xdr_decode_AFSVolSync(&bp, call->out_volsync);
@@ -1073,9 +904,9 @@ static const struct afs_call_type afs_RXFSSymlink = {
 int afs_fs_symlink(struct afs_fs_cursor *fc,
 		   const char *name,
 		   const char *contents,
-		   u64 current_data_version,
+		   struct afs_status_cb *dvnode_scb,
 		   struct afs_fid *newfid,
-		   struct afs_file_status *newstatus)
+		   struct afs_status_cb *new_scb)
 {
 	struct afs_vnode *dvnode = fc->vnode;
 	struct afs_call *call;
@@ -1084,8 +915,8 @@ int afs_fs_symlink(struct afs_fs_cursor *fc,
 	__be32 *bp;
 
 	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
-		return yfs_fs_symlink(fc, name, contents, current_data_version,
-				      newfid, newstatus);
+		return yfs_fs_symlink(fc, name, contents, dvnode_scb,
+				      newfid, new_scb);
 
 	_enter("");
 
@@ -1103,10 +934,9 @@ int afs_fs_symlink(struct afs_fs_cursor *fc,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->dvnode = dvnode;
+	call->out_dir_scb = dvnode_scb;
 	call->out_fid = newfid;
-	call->out_extra_status = newstatus;
-	call->expected_version = current_data_version + 1;
+	call->out_scb = new_scb;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -1147,25 +977,20 @@ int afs_fs_symlink(struct afs_fs_cursor *fc,
  */
 static int afs_deliver_fs_rename(struct afs_call *call)
 {
-	struct afs_vnode *orig_dvnode = call->dvnode, *new_dvnode = call->xvnode;
 	const __be32 *bp;
 	int ret;
 
-	_enter("{%u}", call->unmarshall);
-
 	ret = afs_transfer_reply(call);
 	if (ret < 0)
 		return ret;
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	ret = afs_decode_status(call, &bp, &orig_dvnode->status, orig_dvnode,
-				&call->expected_version, NULL);
+	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_dir_scb);
 	if (ret < 0)
 		return ret;
-	if (new_dvnode != orig_dvnode) {
-		ret = afs_decode_status(call, &bp, &new_dvnode->status, new_dvnode,
-					&call->expected_version_2, NULL);
+	if (call->out_dir_scb != call->out_scb) {
+		ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
 		if (ret < 0)
 			return ret;
 	}
@@ -1186,14 +1011,14 @@ static const struct afs_call_type afs_RXFSRename = {
 };
 
 /*
- * create a symbolic link
+ * Rename/move a file or directory.
  */
 int afs_fs_rename(struct afs_fs_cursor *fc,
 		  const char *orig_name,
 		  struct afs_vnode *new_dvnode,
 		  const char *new_name,
-		  u64 current_orig_data_version,
-		  u64 current_new_data_version)
+		  struct afs_status_cb *orig_dvnode_scb,
+		  struct afs_status_cb *new_dvnode_scb)
 {
 	struct afs_vnode *orig_dvnode = fc->vnode;
 	struct afs_call *call;
@@ -1204,8 +1029,8 @@ int afs_fs_rename(struct afs_fs_cursor *fc,
 	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
 		return yfs_fs_rename(fc, orig_name,
 				     new_dvnode, new_name,
-				     current_orig_data_version,
-				     current_new_data_version);
+				     orig_dvnode_scb,
+				     new_dvnode_scb);
 
 	_enter("");
 
@@ -1225,10 +1050,8 @@ int afs_fs_rename(struct afs_fs_cursor *fc,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->dvnode = orig_dvnode;
-	call->xvnode = new_dvnode;
-	call->expected_version = current_orig_data_version + 1;
-	call->expected_version_2 = current_new_data_version + 1;
+	call->out_dir_scb = orig_dvnode_scb;
+	call->out_scb = new_dvnode_scb;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -1267,7 +1090,6 @@ int afs_fs_rename(struct afs_fs_cursor *fc,
  */
 static int afs_deliver_fs_store_data(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->xvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -1279,14 +1101,11 @@ static int afs_deliver_fs_store_data(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	ret = afs_decode_status(call, &bp, &vnode->status, vnode,
-				&call->expected_version, NULL);
+	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
 	if (ret < 0)
 		return ret;
 	xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
-	afs_pages_written_back(vnode, call);
-
 	_leave(" = 0 [done]");
 	return 0;
 }
@@ -1315,7 +1134,8 @@ static int afs_fs_store_data64(struct afs_fs_cursor *fc,
 			       struct address_space *mapping,
 			       pgoff_t first, pgoff_t last,
 			       unsigned offset, unsigned to,
-			       loff_t size, loff_t pos, loff_t i_size)
+			       loff_t size, loff_t pos, loff_t i_size,
+			       struct afs_status_cb *scb)
 {
 	struct afs_vnode *vnode = fc->vnode;
 	struct afs_call *call;
@@ -1333,13 +1153,12 @@ static int afs_fs_store_data64(struct afs_fs_cursor *fc,
 
 	call->key = fc->key;
 	call->mapping = mapping;
-	call->xvnode = vnode;
 	call->first = first;
 	call->last = last;
 	call->first_offset = offset;
 	call->last_to = to;
 	call->send_pages = true;
-	call->expected_version = vnode->status.data_version + 1;
+	call->out_scb = scb;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -1373,7 +1192,8 @@ static int afs_fs_store_data64(struct afs_fs_cursor *fc,
  */
 int afs_fs_store_data(struct afs_fs_cursor *fc, struct address_space *mapping,
 		      pgoff_t first, pgoff_t last,
-		      unsigned offset, unsigned to)
+		      unsigned offset, unsigned to,
+		      struct afs_status_cb *scb)
 {
 	struct afs_vnode *vnode = fc->vnode;
 	struct afs_call *call;
@@ -1382,7 +1202,7 @@ int afs_fs_store_data(struct afs_fs_cursor *fc, struct address_space *mapping,
 	__be32 *bp;
 
 	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
-		return yfs_fs_store_data(fc, mapping, first, last, offset, to);
+		return yfs_fs_store_data(fc, mapping, first, last, offset, to, scb);
 
 	_enter(",%x,{%llx:%llu},,",
 	       key_serial(fc->key), vnode->fid.vid, vnode->fid.vnode);
@@ -1403,7 +1223,7 @@ int afs_fs_store_data(struct afs_fs_cursor *fc, struct address_space *mapping,
 
 	if (pos >> 32 || i_size >> 32 || size >> 32 || (pos + size) >> 32)
 		return afs_fs_store_data64(fc, mapping, first, last, offset, to,
-					   size, pos, i_size);
+					   size, pos, i_size, scb);
 
 	call = afs_alloc_flat_call(net, &afs_RXFSStoreData,
 				   (4 + 6 + 3) * 4,
@@ -1413,13 +1233,12 @@ int afs_fs_store_data(struct afs_fs_cursor *fc, struct address_space *mapping,
 
 	call->key = fc->key;
 	call->mapping = mapping;
-	call->xvnode = vnode;
 	call->first = first;
 	call->last = last;
 	call->first_offset = offset;
 	call->last_to = to;
 	call->send_pages = true;
-	call->expected_version = vnode->status.data_version + 1;
+	call->out_scb = scb;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -1451,7 +1270,6 @@ int afs_fs_store_data(struct afs_fs_cursor *fc, struct address_space *mapping,
  */
 static int afs_deliver_fs_store_status(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->xvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -1463,8 +1281,7 @@ static int afs_deliver_fs_store_status(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	ret = afs_decode_status(call, &bp, &vnode->status, vnode,
-				&call->expected_version, NULL);
+	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
 	if (ret < 0)
 		return ret;
 	xdr_decode_AFSVolSync(&bp, call->out_volsync);
@@ -1501,7 +1318,8 @@ static const struct afs_call_type afs_RXFSStoreData64_as_Status = {
  * set the attributes on a very large file, using FS.StoreData rather than
  * FS.StoreStatus so as to alter the file size also
  */
-static int afs_fs_setattr_size64(struct afs_fs_cursor *fc, struct iattr *attr)
+static int afs_fs_setattr_size64(struct afs_fs_cursor *fc, struct iattr *attr,
+				 struct afs_status_cb *scb)
 {
 	struct afs_vnode *vnode = fc->vnode;
 	struct afs_call *call;
@@ -1520,8 +1338,7 @@ static int afs_fs_setattr_size64(struct afs_fs_cursor *fc, struct iattr *attr)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->xvnode = vnode;
-	call->expected_version = vnode->status.data_version + 1;
+	call->out_scb = scb;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -1550,7 +1367,8 @@ static int afs_fs_setattr_size64(struct afs_fs_cursor *fc, struct iattr *attr)
  * set the attributes on a file, using FS.StoreData rather than FS.StoreStatus
  * so as to alter the file size also
  */
-static int afs_fs_setattr_size(struct afs_fs_cursor *fc, struct iattr *attr)
+static int afs_fs_setattr_size(struct afs_fs_cursor *fc, struct iattr *attr,
+			       struct afs_status_cb *scb)
 {
 	struct afs_vnode *vnode = fc->vnode;
 	struct afs_call *call;
@@ -1562,7 +1380,7 @@ static int afs_fs_setattr_size(struct afs_fs_cursor *fc, struct iattr *attr)
 
 	ASSERT(attr->ia_valid & ATTR_SIZE);
 	if (attr->ia_size >> 32)
-		return afs_fs_setattr_size64(fc, attr);
+		return afs_fs_setattr_size64(fc, attr, scb);
 
 	call = afs_alloc_flat_call(net, &afs_RXFSStoreData_as_Status,
 				   (4 + 6 + 3) * 4,
@@ -1571,8 +1389,7 @@ static int afs_fs_setattr_size(struct afs_fs_cursor *fc, struct iattr *attr)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->xvnode = vnode;
-	call->expected_version = vnode->status.data_version + 1;
+	call->out_scb = scb;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -1598,7 +1415,8 @@ static int afs_fs_setattr_size(struct afs_fs_cursor *fc, struct iattr *attr)
  * set the attributes on a file, using FS.StoreData if there's a change in file
  * size, and FS.StoreStatus otherwise
  */
-int afs_fs_setattr(struct afs_fs_cursor *fc, struct iattr *attr)
+int afs_fs_setattr(struct afs_fs_cursor *fc, struct iattr *attr,
+		   struct afs_status_cb *scb)
 {
 	struct afs_vnode *vnode = fc->vnode;
 	struct afs_call *call;
@@ -1606,10 +1424,10 @@ int afs_fs_setattr(struct afs_fs_cursor *fc, struct iattr *attr)
 	__be32 *bp;
 
 	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
-		return yfs_fs_setattr(fc, attr);
+		return yfs_fs_setattr(fc, attr, scb);
 
 	if (attr->ia_valid & ATTR_SIZE)
-		return afs_fs_setattr_size(fc, attr);
+		return afs_fs_setattr_size(fc, attr, scb);
 
 	_enter(",%x,{%llx:%llu},,",
 	       key_serial(fc->key), vnode->fid.vid, vnode->fid.vnode);
@@ -1621,8 +1439,7 @@ int afs_fs_setattr(struct afs_fs_cursor *fc, struct iattr *attr)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->xvnode = vnode;
-	call->expected_version = vnode->status.data_version;
+	call->out_scb = scb;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -1882,7 +1699,7 @@ int afs_fs_set_lock(struct afs_fs_cursor *fc, afs_lock_type_t type)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->xvnode = vnode;
+	call->lvnode = vnode;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -1919,7 +1736,7 @@ int afs_fs_extend_lock(struct afs_fs_cursor *fc)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->xvnode = vnode;
+	call->lvnode = vnode;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -1955,7 +1772,7 @@ int afs_fs_release_lock(struct afs_fs_cursor *fc)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->xvnode = vnode;
+	call->lvnode = vnode;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -2112,10 +1929,6 @@ struct afs_call *afs_fs_get_capabilities(struct afs_net *net,
  */
 static int afs_deliver_fs_fetch_status(struct afs_call *call)
 {
-	struct afs_file_status *status = call->out_vnode_status;
-	struct afs_callback *callback = call->out_cb;
-	struct afs_volsync *volsync = call->out_volsync;
-	struct afs_fid *fid = call->out_fid;
 	const __be32 *bp;
 	int ret;
 
@@ -2123,16 +1936,13 @@ static int afs_deliver_fs_fetch_status(struct afs_call *call)
 	if (ret < 0)
 		return ret;
 
-	_enter("{%llx:%llu}", fid->vid, fid->vnode);
-
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	ret = afs_decode_status(call, &bp, status, NULL,
-				&call->expected_version, NULL);
+	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
 	if (ret < 0)
 		return ret;
-	xdr_decode_AFSCallBack_raw(call, callback, &bp);
-	xdr_decode_AFSVolSync(&bp, volsync);
+	xdr_decode_AFSCallBack(&bp, call, call->out_scb);
+	xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -2154,15 +1964,14 @@ static const struct afs_call_type afs_RXFSFetchStatus = {
 int afs_fs_fetch_status(struct afs_fs_cursor *fc,
 			struct afs_net *net,
 			struct afs_fid *fid,
-			struct afs_file_status *status,
-			struct afs_callback *callback,
+			struct afs_status_cb *scb,
 			struct afs_volsync *volsync)
 {
 	struct afs_call *call;
 	__be32 *bp;
 
 	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
-		return yfs_fs_fetch_status(fc, net, fid, status, callback, volsync);
+		return yfs_fs_fetch_status(fc, net, fid, scb, volsync);
 
 	_enter(",%x,{%llx:%llu},,",
 	       key_serial(fc->key), fid->vid, fid->vnode);
@@ -2175,10 +1984,8 @@ int afs_fs_fetch_status(struct afs_fs_cursor *fc,
 
 	call->key = fc->key;
 	call->out_fid = fid;
-	call->out_vnode_status = status;
-	call->out_cb = callback;
+	call->out_scb = scb;
 	call->out_volsync = volsync;
-	call->expected_version = 1; /* vnode->status.data_version */
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -2187,7 +1994,6 @@ int afs_fs_fetch_status(struct afs_fs_cursor *fc,
 	bp[2] = htonl(fid->vnode);
 	bp[3] = htonl(fid->unique);
 
-	call->cb_break = fc->cb_break;
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, fid);
 	afs_set_fc_call(call, fc);
@@ -2240,8 +2046,7 @@ static int afs_deliver_fs_inline_bulk_status(struct afs_call *call)
 
 		bp = call->buffer;
 		scb = &call->out_scb[call->count];
-		ret = afs_decode_status(call, &bp, &scb->status,
-					NULL, NULL, NULL);
+		ret = xdr_decode_AFSFetchStatus(&bp, call, scb);
 		if (ret < 0)
 			return ret;
 
@@ -2281,8 +2086,7 @@ static int afs_deliver_fs_inline_bulk_status(struct afs_call *call)
 		_debug("unmarshall CB array");
 		bp = call->buffer;
 		scb = &call->out_scb[call->count];
-		xdr_decode_AFSCallBack_raw(call, &scb->callback, &bp);
-		scb->have_cb = true;
+		xdr_decode_AFSCallBack(&bp, call, scb);
 		call->count++;
 		if (call->count < call->count2)
 			goto more_cbs;
@@ -2363,7 +2167,6 @@ int afs_fs_inline_bulk_status(struct afs_fs_cursor *fc,
 		*bp++ = htonl(fids[i].unique);
 	}
 
-	call->cb_break = fc->cb_break;
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &fids[0]);
 	afs_set_fc_call(call, fc);
@@ -2376,7 +2179,6 @@ int afs_fs_inline_bulk_status(struct afs_fs_cursor *fc,
  */
 static int afs_deliver_fs_fetch_acl(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->xvnode;
 	struct afs_acl *acl;
 	const __be32 *bp;
 	unsigned int size;
@@ -2422,8 +2224,7 @@ static int afs_deliver_fs_fetch_acl(struct afs_call *call)
 			return ret;
 
 		bp = call->buffer;
-		ret = afs_decode_status(call, &bp, &vnode->status, vnode,
-					&vnode->status.data_version, NULL);
+		ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
 		if (ret < 0)
 			return ret;
 		xdr_decode_AFSVolSync(&bp, call->out_volsync);
@@ -2457,7 +2258,8 @@ static const struct afs_call_type afs_RXFSFetchACL = {
 /*
  * Fetch the ACL for a file.
  */
-struct afs_acl *afs_fs_fetch_acl(struct afs_fs_cursor *fc)
+struct afs_acl *afs_fs_fetch_acl(struct afs_fs_cursor *fc,
+				 struct afs_status_cb *scb)
 {
 	struct afs_vnode *vnode = fc->vnode;
 	struct afs_call *call;
@@ -2475,7 +2277,7 @@ struct afs_acl *afs_fs_fetch_acl(struct afs_fs_cursor *fc)
 
 	call->key = fc->key;
 	call->ret_acl = NULL;
-	call->xvnode = vnode;
+	call->out_scb = scb;
 	call->out_volsync = NULL;
 
 	/* marshall the parameters */
@@ -2485,7 +2287,6 @@ struct afs_acl *afs_fs_fetch_acl(struct afs_fs_cursor *fc)
 	bp[2] = htonl(vnode->fid.vnode);
 	bp[3] = htonl(vnode->fid.unique);
 
-	call->cb_break = fc->cb_break;
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
 	afs_make_call(&fc->ac, call, GFP_KERNEL);
@@ -2498,20 +2299,15 @@ struct afs_acl *afs_fs_fetch_acl(struct afs_fs_cursor *fc)
  */
 static int afs_deliver_fs_file_status_and_vol(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->xvnode;
 	const __be32 *bp;
 	int ret;
 
-	_enter("{%u}", call->unmarshall);
-
 	ret = afs_transfer_reply(call);
 	if (ret < 0)
 		return ret;
 
-	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	ret = afs_decode_status(call, &bp, &vnode->status, vnode,
-				&call->expected_version, NULL);
+	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
 	if (ret < 0)
 		return ret;
 	xdr_decode_AFSVolSync(&bp, call->out_volsync);
@@ -2533,7 +2329,8 @@ static const struct afs_call_type afs_RXFSStoreACL = {
 /*
  * Fetch the ACL for a file.
  */
-int afs_fs_store_acl(struct afs_fs_cursor *fc, const struct afs_acl *acl)
+int afs_fs_store_acl(struct afs_fs_cursor *fc, const struct afs_acl *acl,
+		     struct afs_status_cb *scb)
 {
 	struct afs_vnode *vnode = fc->vnode;
 	struct afs_call *call;
@@ -2553,7 +2350,7 @@ int afs_fs_store_acl(struct afs_fs_cursor *fc, const struct afs_acl *acl)
 	}
 
 	call->key = fc->key;
-	call->xvnode = vnode;
+	call->out_scb = scb;
 	call->out_volsync = NULL;
 
 	/* marshall the parameters */
diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index bf8f56e851df..f54b6d7ebab8 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -58,38 +58,50 @@ static noinline void dump_vnode(struct afs_vnode *vnode, struct afs_vnode *paren
  * Initialise an inode from the vnode status.
  */
 static int afs_inode_init_from_status(struct afs_vnode *vnode, struct key *key,
-				      struct afs_vnode *parent_vnode)
+				      struct afs_cb_interest *cbi,
+				      struct afs_vnode *parent_vnode,
+				      struct afs_status_cb *scb)
 {
+	struct afs_cb_interest *old_cbi = NULL;
+	struct afs_file_status *status = &scb->status;
 	struct inode *inode = AFS_VNODE_TO_I(vnode);
+	struct timespec64 t;
 
 	_debug("FS: ft=%d lk=%d sz=%llu ver=%Lu mod=%hu",
-	       vnode->status.type,
-	       vnode->status.nlink,
-	       (unsigned long long) vnode->status.size,
-	       vnode->status.data_version,
-	       vnode->status.mode);
+	       status->type,
+	       status->nlink,
+	       (unsigned long long) status->size,
+	       status->data_version,
+	       status->mode);
 
-	read_seqlock_excl(&vnode->cb_lock);
+	write_seqlock(&vnode->cb_lock);
+
+	vnode->status = *status;
 
-	afs_update_inode_from_status(vnode, &vnode->status, NULL,
-				     AFS_VNODE_NOT_YET_SET);
+	t = status->mtime_client;
+	inode->i_ctime = t;
+	inode->i_mtime = t;
+	inode->i_atime = t;
+	inode->i_uid = make_kuid(&init_user_ns, status->owner);
+	inode->i_gid = make_kgid(&init_user_ns, status->group);
+	set_nlink(&vnode->vfs_inode, status->nlink);
 
-	switch (vnode->status.type) {
+	switch (status->type) {
 	case AFS_FTYPE_FILE:
-		inode->i_mode	= S_IFREG | vnode->status.mode;
+		inode->i_mode	= S_IFREG | status->mode;
 		inode->i_op	= &afs_file_inode_operations;
 		inode->i_fop	= &afs_file_operations;
 		inode->i_mapping->a_ops	= &afs_fs_aops;
 		break;
 	case AFS_FTYPE_DIR:
-		inode->i_mode	= S_IFDIR | vnode->status.mode;
+		inode->i_mode	= S_IFDIR | status->mode;
 		inode->i_op	= &afs_dir_inode_operations;
 		inode->i_fop	= &afs_dir_file_operations;
 		inode->i_mapping->a_ops	= &afs_dir_aops;
 		break;
 	case AFS_FTYPE_SYMLINK:
 		/* Symlinks with a mode of 0644 are actually mountpoints. */
-		if ((vnode->status.mode & 0777) == 0644) {
+		if ((status->mode & 0777) == 0644) {
 			inode->i_flags |= S_AUTOMOUNT;
 
 			set_bit(AFS_VNODE_MOUNTPOINT, &vnode->flags);
@@ -99,7 +111,7 @@ static int afs_inode_init_from_status(struct afs_vnode *vnode, struct key *key,
 			inode->i_fop	= &afs_mntpt_file_operations;
 			inode->i_mapping->a_ops	= &afs_fs_aops;
 		} else {
-			inode->i_mode	= S_IFLNK | vnode->status.mode;
+			inode->i_mode	= S_IFLNK | status->mode;
 			inode->i_op	= &afs_symlink_inode_operations;
 			inode->i_mapping->a_ops	= &afs_fs_aops;
 		}
@@ -107,7 +119,7 @@ static int afs_inode_init_from_status(struct afs_vnode *vnode, struct key *key,
 		break;
 	default:
 		dump_vnode(vnode, parent_vnode);
-		read_sequnlock_excl(&vnode->cb_lock);
+		write_sequnlock(&vnode->cb_lock);
 		return afs_protocol_error(NULL, -EBADMSG, afs_eproto_file_type);
 	}
 
@@ -116,17 +128,170 @@ static int afs_inode_init_from_status(struct afs_vnode *vnode, struct key *key,
 	 * for consistency with other AFS clients.
 	 */
 	inode->i_blocks		= ((i_size_read(inode) + 1023) >> 10) << 1;
-	vnode->invalid_before	= vnode->status.data_version;
+	i_size_write(&vnode->vfs_inode, status->size);
 
-	read_sequnlock_excl(&vnode->cb_lock);
+	vnode->invalid_before	= status->data_version;
+	inode_set_iversion_raw(&vnode->vfs_inode, status->data_version);
+
+	if (!scb->have_cb) {
+		/* it's a symlink we just created (the fileserver
+		 * didn't give us a callback) */
+		vnode->cb_version = 0;
+		vnode->cb_type = 0;
+		vnode->cb_expires_at = ktime_get_real_seconds();
+	} else {
+		vnode->cb_version = scb->callback.version;
+		vnode->cb_type = scb->callback.type;
+		vnode->cb_expires_at = scb->callback.expires_at;
+		old_cbi = vnode->cb_interest;
+		if (cbi != old_cbi)
+			vnode->cb_interest = afs_get_cb_interest(cbi);
+		else
+			old_cbi = NULL;
+		set_bit(AFS_VNODE_CB_PROMISED, &vnode->flags);
+	}
+
+	write_sequnlock(&vnode->cb_lock);
+	afs_put_cb_interest(afs_v2net(vnode), old_cbi);
 	return 0;
 }
 
+/*
+ * Update the core inode struct from a returned status record.
+ */
+static void afs_apply_status(struct afs_fs_cursor *fc,
+			     struct afs_vnode *vnode,
+			     struct afs_status_cb *scb,
+			     const afs_dataversion_t *expected_version)
+{
+	struct afs_file_status *status = &scb->status;
+	struct timespec64 t;
+	umode_t mode;
+	bool data_changed = false;
+
+	BUG_ON(test_bit(AFS_VNODE_UNSET, &vnode->flags));
+
+	if (status->type != vnode->status.type) {
+		pr_warning("Vnode %llx:%llx:%x changed type %u to %u\n",
+			   vnode->fid.vid,
+			   vnode->fid.vnode,
+			   vnode->fid.unique,
+			   status->type, vnode->status.type);
+		afs_protocol_error(NULL, -EBADMSG, afs_eproto_bad_status);
+		return;
+	}
+
+	if (status->nlink != vnode->status.nlink)
+		set_nlink(&vnode->vfs_inode, status->nlink);
+
+	if (status->owner != vnode->status.owner)
+		vnode->vfs_inode.i_uid = make_kuid(&init_user_ns, status->owner);
+
+	if (status->group != vnode->status.group)
+		vnode->vfs_inode.i_gid = make_kgid(&init_user_ns, status->group);
+
+	if (status->mode != vnode->status.mode) {
+		mode = vnode->vfs_inode.i_mode;
+		mode &= ~S_IALLUGO;
+		mode |= status->mode;
+		WRITE_ONCE(vnode->vfs_inode.i_mode, mode);
+	}
+
+	t = status->mtime_client;
+	vnode->vfs_inode.i_ctime = t;
+	vnode->vfs_inode.i_mtime = t;
+	vnode->vfs_inode.i_atime = t;
+
+	if (vnode->status.data_version != status->data_version)
+		data_changed = true;
+
+	vnode->status = *status;
+
+	if (expected_version &&
+	    *expected_version != status->data_version) {
+		kdebug("vnode modified %llx on {%llx:%llu} [exp %llx] %s",
+		       (unsigned long long) status->data_version,
+		       vnode->fid.vid, vnode->fid.vnode,
+		       (unsigned long long) *expected_version,
+		       fc->type ? fc->type->name : "???");
+		vnode->invalid_before = status->data_version;
+		if (vnode->status.type == AFS_FTYPE_DIR) {
+			if (test_and_clear_bit(AFS_VNODE_DIR_VALID, &vnode->flags))
+				afs_stat_v(vnode, n_inval);
+		} else {
+			set_bit(AFS_VNODE_ZAP_DATA, &vnode->flags);
+		}
+	} else if (vnode->status.type == AFS_FTYPE_DIR) {
+		/* Expected directory change is handled elsewhere so
+		 * that we can locally edit the directory and save on a
+		 * download.
+		 */
+		if (test_bit(AFS_VNODE_DIR_VALID, &vnode->flags))
+			data_changed = false;
+	}
+
+	if (data_changed) {
+		inode_set_iversion_raw(&vnode->vfs_inode, status->data_version);
+		i_size_write(&vnode->vfs_inode, status->size);
+	}
+}
+
+/*
+ * Apply a callback to a vnode.
+ */
+static void afs_apply_callback(struct afs_fs_cursor *fc,
+			       struct afs_vnode *vnode,
+			       struct afs_status_cb *scb,
+			       unsigned int cb_break)
+{
+	struct afs_cb_interest *old;
+	struct afs_callback *cb = &scb->callback;
+
+	if (!afs_cb_is_broken(cb_break, vnode, fc->cbi)) {
+		vnode->cb_version	= cb->version;
+		vnode->cb_type		= cb->type;
+		vnode->cb_expires_at	= cb->expires_at;
+		old = vnode->cb_interest;
+		if (old != fc->cbi) {
+			vnode->cb_interest = afs_get_cb_interest(fc->cbi);
+			afs_put_cb_interest(afs_v2net(vnode), old);
+		}
+		set_bit(AFS_VNODE_CB_PROMISED, &vnode->flags);
+	}
+}
+
+/*
+ * Apply the received status and callback to an inode all in the same critical
+ * section to avoid races with afs_validate().
+ */
+void afs_vnode_commit_status(struct afs_fs_cursor *fc,
+			     struct afs_vnode *vnode,
+			     unsigned int cb_break,
+			     const afs_dataversion_t *expected_version,
+			     struct afs_status_cb *scb)
+{
+	if (fc->ac.error != 0)
+		return;
+
+	write_seqlock(&vnode->cb_lock);
+
+	afs_apply_status(fc, vnode, scb, expected_version);
+	if (scb->have_cb)
+		afs_apply_callback(fc, vnode, scb, cb_break);
+
+	write_sequnlock(&vnode->cb_lock);
+
+	if (fc->ac.error == 0)
+		afs_cache_permit(vnode, fc->key, cb_break, scb);
+}
+
 /*
  * Fetch file status from the volume.
  */
-int afs_fetch_status(struct afs_vnode *vnode, struct key *key, bool new_inode)
+int afs_fetch_status(struct afs_vnode *vnode, struct key *key, bool is_new,
+		     afs_access_t *_caller_access)
 {
+	struct afs_status_cb *scb;
 	struct afs_fs_cursor fc;
 	int ret;
 
@@ -135,18 +300,37 @@ int afs_fetch_status(struct afs_vnode *vnode, struct key *key, bool new_inode)
 	       vnode->fid.vid, vnode->fid.vnode, vnode->fid.unique,
 	       vnode->flags);
 
+	scb = kzalloc(sizeof(struct afs_status_cb), GFP_KERNEL);
+	if (!scb)
+		return -ENOMEM;
+
 	ret = -ERESTARTSYS;
 	if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
+		afs_dataversion_t data_version = vnode->status.data_version;
+
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(vnode);
-			afs_fs_fetch_file_status(&fc, NULL, new_inode);
+			afs_fs_fetch_file_status(&fc, scb, NULL);
 		}
 
-		afs_check_for_remote_deletion(&fc, fc.vnode);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break);
+		if (is_new) {
+			ret = afs_inode_init_from_status(vnode, key, fc.cbi,
+							 NULL, scb);
+			if (ret < 0)
+				fc.ac.error = ret;
+			if (fc.ac.error == 0)
+				afs_cache_permit(vnode, key, fc.cb_break, scb);
+		} else {
+			afs_vnode_commit_status(&fc, vnode, fc.cb_break,
+						&data_version, scb);
+		}
+		afs_check_for_remote_deletion(&fc, vnode);
 		ret = afs_end_vnode_operation(&fc);
 	}
 
+	if (ret == 0 && _caller_access)
+		*_caller_access = scb->status.caller_access;
+	kfree(scb);
 	_leave(" = %d", ret);
 	return ret;
 }
@@ -299,8 +483,8 @@ static void afs_get_inode_cache(struct afs_vnode *vnode)
  * inode retrieval
  */
 struct inode *afs_iget(struct super_block *sb, struct key *key,
-		       struct afs_fid *fid, struct afs_file_status *status,
-		       struct afs_callback *cb, struct afs_cb_interest *cbi,
+		       struct afs_fid *fid, struct afs_status_cb *scb,
+		       struct afs_cb_interest *cbi,
 		       struct afs_vnode *parent_vnode)
 {
 	struct afs_iget_data data = { .fid = *fid };
@@ -332,36 +516,18 @@ struct inode *afs_iget(struct super_block *sb, struct key *key,
 		return inode;
 	}
 
-	if (!status) {
+	if (!scb) {
 		/* it's a remotely extant inode */
-		ret = afs_fetch_status(vnode, key, true);
+		ret = afs_fetch_status(vnode, key, true, NULL);
 		if (ret < 0)
 			goto bad_inode;
 	} else {
-		/* it's an inode we just created */
-		memcpy(&vnode->status, status, sizeof(vnode->status));
-
-		if (!cb) {
-			/* it's a symlink we just created (the fileserver
-			 * didn't give us a callback) */
-			vnode->cb_version = 0;
-			vnode->cb_type = 0;
-			vnode->cb_expires_at = ktime_get();
-		} else {
-			vnode->cb_version = cb->version;
-			vnode->cb_type = cb->type;
-			vnode->cb_expires_at = cb->expires_at;
-			vnode->cb_interest = afs_get_cb_interest(cbi);
-			set_bit(AFS_VNODE_CB_PROMISED, &vnode->flags);
-		}
-
-		vnode->cb_expires_at += ktime_get_real_seconds();
+		ret = afs_inode_init_from_status(vnode, key, cbi, parent_vnode,
+						 scb);
+		if (ret < 0)
+			goto bad_inode;
 	}
 
-	ret = afs_inode_init_from_status(vnode, key, parent_vnode);
-	if (ret < 0)
-		goto bad_inode;
-
 	afs_get_inode_cache(vnode);
 
 	/* success */
@@ -460,7 +626,7 @@ int afs_validate(struct afs_vnode *vnode, struct key *key)
 	 * access */
 	if (!test_bit(AFS_VNODE_CB_PROMISED, &vnode->flags)) {
 		_debug("not promised");
-		ret = afs_fetch_status(vnode, key, false);
+		ret = afs_fetch_status(vnode, key, false, NULL);
 		if (ret < 0) {
 			if (ret == -ENOENT) {
 				set_bit(AFS_VNODE_DELETED, &vnode->flags);
@@ -585,9 +751,10 @@ void afs_evict_inode(struct inode *inode)
 int afs_setattr(struct dentry *dentry, struct iattr *attr)
 {
 	struct afs_fs_cursor fc;
+	struct afs_status_cb *scb;
 	struct afs_vnode *vnode = AFS_FS_I(d_inode(dentry));
 	struct key *key;
-	int ret;
+	int ret = -ENOMEM;
 
 	_enter("{%llx:%llu},{n=%pd},%x",
 	       vnode->fid.vid, vnode->fid.vnode, dentry,
@@ -599,6 +766,10 @@ int afs_setattr(struct dentry *dentry, struct iattr *attr)
 		return 0;
 	}
 
+	scb = kzalloc(sizeof(struct afs_status_cb), GFP_KERNEL);
+	if (!scb)
+		goto error;
+
 	/* flush any dirty data outstanding on a regular file */
 	if (S_ISREG(vnode->vfs_inode.i_mode))
 		filemap_write_and_wait(vnode->vfs_inode.i_mapping);
@@ -609,25 +780,33 @@ int afs_setattr(struct dentry *dentry, struct iattr *attr)
 		key = afs_request_key(vnode->volume->cell);
 		if (IS_ERR(key)) {
 			ret = PTR_ERR(key);
-			goto error;
+			goto error_scb;
 		}
 	}
 
 	ret = -ERESTARTSYS;
 	if (afs_begin_vnode_operation(&fc, vnode, key, false)) {
+		afs_dataversion_t data_version = vnode->status.data_version;
+
+		if (attr->ia_valid & ATTR_SIZE)
+			data_version++;
+
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(vnode);
-			afs_fs_setattr(&fc, attr);
+			afs_fs_setattr(&fc, attr, scb);
 		}
 
-		afs_check_for_remote_deletion(&fc, fc.vnode);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break);
+		afs_check_for_remote_deletion(&fc, vnode);
+		afs_vnode_commit_status(&fc, vnode, fc.cb_break,
+					&data_version, scb);
 		ret = afs_end_vnode_operation(&fc);
 	}
 
 	if (!(attr->ia_valid & ATTR_FILE))
 		key_put(key);
 
+error_scb:
+	kfree(scb);
 error:
 	_leave(" = %d", ret);
 	return ret;
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 69582e746a9f..ed2f92f9d705 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -116,8 +116,7 @@ struct afs_call {
 		struct afs_vlserver	*vlserver;
 	};
 	struct afs_cb_interest	*cbi;		/* Callback interest for server used */
-	struct afs_vnode	*dvnode;	/* Directory vnode of call */
-	struct afs_vnode	*xvnode;	/* Other vnode of call */
+	struct afs_vnode	*lvnode;	/* vnode being locked */
 	void			*request;	/* request data (first part) */
 	struct address_space	*mapping;	/* Pages being written from */
 	struct iov_iter		iter;		/* Buffer iterator */
@@ -134,9 +133,7 @@ struct afs_call {
 		struct afs_acl		*ret_acl;
 	};
 	struct afs_fid		*out_fid;
-	struct afs_file_status	*out_vnode_status;
-	struct afs_file_status	*out_extra_status;
-	struct afs_callback	*out_cb;
+	struct afs_status_cb	*out_dir_scb;
 	struct afs_status_cb	*out_scb;
 	struct yfs_acl		*out_yacl;
 	struct afs_volsync	*out_volsync;
@@ -154,7 +151,6 @@ struct afs_call {
 	unsigned		request_size;	/* size of request data */
 	unsigned		reply_max;	/* maximum size of reply */
 	unsigned		first_offset;	/* offset into mapping[first] */
-	unsigned int		cb_break;	/* cb_break + cb_s_break before the call */
 	union {
 		unsigned	last_to;	/* amount of mapping[last] */
 		unsigned	count2;		/* count used in unmarshalling */
@@ -179,8 +175,6 @@ struct afs_call {
 		} __attribute__((packed));
 		__be64		tmp64;
 	};
-	afs_dataversion_t	expected_version; /* Updated version expected from store */
-	afs_dataversion_t	expected_version_2; /* 2nd updated version expected from store */
 	ktime_t			reply_time;	/* Time of first reply packet */
 };
 
@@ -241,7 +235,8 @@ struct afs_read {
 	unsigned int		index;		/* Which page we're reading into */
 	unsigned int		nr_pages;
 	unsigned int		offset;		/* offset into current page */
-	void (*page_done)(struct afs_call *, struct afs_read *);
+	struct afs_vnode	*vnode;
+	void (*page_done)(struct afs_read *);
 	struct page		**pages;
 	struct page		*array[];
 };
@@ -775,6 +770,7 @@ struct afs_vl_cursor {
  * Cursor for iterating over a set of fileservers.
  */
 struct afs_fs_cursor {
+	const struct afs_call_type *type;	/* Type of call done */
 	struct afs_addr_cursor	ac;
 	struct afs_vnode	*vnode;
 	struct afs_server_list	*server_list;	/* Current server list (pins ref) */
@@ -961,26 +957,24 @@ extern int afs_flock(struct file *, int, struct file_lock *);
 /*
  * fsclient.c
  */
-#define AFS_VNODE_NOT_YET_SET	0x01
-#define AFS_VNODE_META_CHANGED	0x02
-#define AFS_VNODE_DATA_CHANGED	0x04
-extern void afs_update_inode_from_status(struct afs_vnode *, struct afs_file_status *,
-					 const afs_dataversion_t *, u8);
-
-extern int afs_fs_fetch_file_status(struct afs_fs_cursor *, struct afs_volsync *, bool);
+extern int afs_fs_fetch_file_status(struct afs_fs_cursor *, struct afs_status_cb *,
+				    struct afs_volsync *);
 extern int afs_fs_give_up_callbacks(struct afs_net *, struct afs_server *);
-extern int afs_fs_fetch_data(struct afs_fs_cursor *, struct afs_read *);
-extern int afs_fs_create(struct afs_fs_cursor *, const char *, umode_t, u64,
-			 struct afs_fid *, struct afs_file_status *, struct afs_callback *);
-extern int afs_fs_remove(struct afs_fs_cursor *, struct afs_vnode *, const char *, bool, u64);
-extern int afs_fs_link(struct afs_fs_cursor *, struct afs_vnode *, const char *, u64);
-extern int afs_fs_symlink(struct afs_fs_cursor *, const char *, const char *, u64,
-			  struct afs_fid *, struct afs_file_status *);
+extern int afs_fs_fetch_data(struct afs_fs_cursor *, struct afs_status_cb *, struct afs_read *);
+extern int afs_fs_create(struct afs_fs_cursor *, const char *, umode_t,
+			 struct afs_status_cb *, struct afs_fid *, struct afs_status_cb *);
+extern int afs_fs_remove(struct afs_fs_cursor *, struct afs_vnode *, const char *, bool,
+			 struct afs_status_cb *);
+extern int afs_fs_link(struct afs_fs_cursor *, struct afs_vnode *, const char *,
+		       struct afs_status_cb *, struct afs_status_cb *);
+extern int afs_fs_symlink(struct afs_fs_cursor *, const char *, const char *,
+			  struct afs_status_cb *, struct afs_fid *, struct afs_status_cb *);
 extern int afs_fs_rename(struct afs_fs_cursor *, const char *,
-			 struct afs_vnode *, const char *, u64, u64);
+			 struct afs_vnode *, const char *,
+			 struct afs_status_cb *, struct afs_status_cb *);
 extern int afs_fs_store_data(struct afs_fs_cursor *, struct address_space *,
-			     pgoff_t, pgoff_t, unsigned, unsigned);
-extern int afs_fs_setattr(struct afs_fs_cursor *, struct iattr *);
+			     pgoff_t, pgoff_t, unsigned, unsigned, struct afs_status_cb *);
+extern int afs_fs_setattr(struct afs_fs_cursor *, struct iattr *, struct afs_status_cb *);
 extern int afs_fs_get_volume_status(struct afs_fs_cursor *, struct afs_volume_status *);
 extern int afs_fs_set_lock(struct afs_fs_cursor *, afs_lock_type_t);
 extern int afs_fs_extend_lock(struct afs_fs_cursor *);
@@ -994,16 +988,17 @@ extern int afs_fs_inline_bulk_status(struct afs_fs_cursor *, struct afs_net *,
 				     struct afs_fid *, struct afs_status_cb *,
 				     unsigned int, struct afs_volsync *);
 extern int afs_fs_fetch_status(struct afs_fs_cursor *, struct afs_net *,
-			       struct afs_fid *, struct afs_file_status *,
-			       struct afs_callback *, struct afs_volsync *);
+			       struct afs_fid *, struct afs_status_cb *,
+			       struct afs_volsync *);
 
 struct afs_acl {
 	u32	size;
 	u8	data[];
 };
 
-extern struct afs_acl *afs_fs_fetch_acl(struct afs_fs_cursor *);
-extern int afs_fs_store_acl(struct afs_fs_cursor *, const struct afs_acl *);
+extern struct afs_acl *afs_fs_fetch_acl(struct afs_fs_cursor *, struct afs_status_cb *);
+extern int afs_fs_store_acl(struct afs_fs_cursor *, const struct afs_acl *,
+			    struct afs_status_cb *);
 
 /*
  * fs_probe.c
@@ -1015,12 +1010,16 @@ extern int afs_wait_for_fs_probes(struct afs_server_list *, unsigned long);
 /*
  * inode.c
  */
-extern int afs_fetch_status(struct afs_vnode *, struct key *, bool);
+extern void afs_vnode_commit_status(struct afs_fs_cursor *,
+				    struct afs_vnode *,
+				    unsigned int,
+				    const afs_dataversion_t *,
+				    struct afs_status_cb *);
+extern int afs_fetch_status(struct afs_vnode *, struct key *, bool, afs_access_t *);
 extern int afs_iget5_test(struct inode *, void *);
 extern struct inode *afs_iget_pseudo_dir(struct super_block *, bool);
 extern struct inode *afs_iget(struct super_block *, struct key *,
-			      struct afs_fid *, struct afs_file_status *,
-			      struct afs_callback *,
+			      struct afs_fid *, struct afs_status_cb *,
 			      struct afs_cb_interest *,
 			      struct afs_vnode *);
 extern void afs_zap_data(struct afs_vnode *);
@@ -1144,6 +1143,7 @@ extern int afs_protocol_error(struct afs_call *, int, enum afs_eproto_cause);
 static inline void afs_set_fc_call(struct afs_call *call, struct afs_fs_cursor *fc)
 {
 	call->intr = fc->flags & AFS_FS_CURSOR_INTR;
+	fc->type = call->type;
 }
 
 static inline void afs_extract_begin(struct afs_call *call, void *buf, size_t size)
@@ -1226,7 +1226,8 @@ static inline void afs_set_call_complete(struct afs_call *call,
  */
 extern void afs_put_permits(struct afs_permits *);
 extern void afs_clear_permits(struct afs_vnode *);
-extern void afs_cache_permit(struct afs_vnode *, struct key *, unsigned int);
+extern void afs_cache_permit(struct afs_vnode *, struct key *, unsigned int,
+			     struct afs_status_cb *);
 extern void afs_zap_permits(struct rcu_head *);
 extern struct key *afs_request_key(struct afs_cell *);
 extern int afs_check_permit(struct afs_vnode *, struct key *, afs_access_t *);
@@ -1352,7 +1353,6 @@ extern int afs_write_end(struct file *file, struct address_space *mapping,
 			struct page *page, void *fsdata);
 extern int afs_writepage(struct page *, struct writeback_control *);
 extern int afs_writepages(struct address_space *, struct writeback_control *);
-extern void afs_pages_written_back(struct afs_vnode *, struct afs_call *);
 extern ssize_t afs_file_write(struct kiocb *, struct iov_iter *);
 extern int afs_fsync(struct file *, loff_t, loff_t, int);
 extern vm_fault_t afs_page_mkwrite(struct vm_fault *vmf);
@@ -1368,29 +1368,33 @@ extern ssize_t afs_listxattr(struct dentry *, char *, size_t);
 /*
  * yfsclient.c
  */
-extern int yfs_fs_fetch_file_status(struct afs_fs_cursor *, struct afs_volsync *, bool);
-extern int yfs_fs_fetch_data(struct afs_fs_cursor *, struct afs_read *);
-extern int yfs_fs_create_file(struct afs_fs_cursor *, const char *, umode_t, u64,
-			      struct afs_fid *, struct afs_file_status *, struct afs_callback *);
-extern int yfs_fs_make_dir(struct afs_fs_cursor *, const char *, umode_t, u64,
-			 struct afs_fid *, struct afs_file_status *, struct afs_callback *);
-extern int yfs_fs_remove_file2(struct afs_fs_cursor *, struct afs_vnode *, const char *, u64);
-extern int yfs_fs_remove(struct afs_fs_cursor *, struct afs_vnode *, const char *, bool, u64);
-extern int yfs_fs_link(struct afs_fs_cursor *, struct afs_vnode *, const char *, u64);
-extern int yfs_fs_symlink(struct afs_fs_cursor *, const char *, const char *, u64,
-			  struct afs_fid *, struct afs_file_status *);
-extern int yfs_fs_rename(struct afs_fs_cursor *, const char *,
-			 struct afs_vnode *, const char *, u64, u64);
+extern int yfs_fs_fetch_file_status(struct afs_fs_cursor *, struct afs_status_cb *,
+				    struct afs_volsync *);
+extern int yfs_fs_fetch_data(struct afs_fs_cursor *, struct afs_status_cb *, struct afs_read *);
+extern int yfs_fs_create_file(struct afs_fs_cursor *, const char *, umode_t, struct afs_status_cb *,
+			      struct afs_fid *, struct afs_status_cb *);
+extern int yfs_fs_make_dir(struct afs_fs_cursor *, const char *, umode_t, struct afs_status_cb *,
+			   struct afs_fid *, struct afs_status_cb *);
+extern int yfs_fs_remove_file2(struct afs_fs_cursor *, struct afs_vnode *, const char *,
+			       struct afs_status_cb *, struct afs_status_cb *);
+extern int yfs_fs_remove(struct afs_fs_cursor *, struct afs_vnode *, const char *, bool,
+			 struct afs_status_cb *);
+extern int yfs_fs_link(struct afs_fs_cursor *, struct afs_vnode *, const char *,
+		       struct afs_status_cb *, struct afs_status_cb *);
+extern int yfs_fs_symlink(struct afs_fs_cursor *, const char *, const char *,
+			  struct afs_status_cb *, struct afs_fid *, struct afs_status_cb *);
+extern int yfs_fs_rename(struct afs_fs_cursor *, const char *, struct afs_vnode *, const char *,
+			 struct afs_status_cb *, struct afs_status_cb *);
 extern int yfs_fs_store_data(struct afs_fs_cursor *, struct address_space *,
-			     pgoff_t, pgoff_t, unsigned, unsigned);
-extern int yfs_fs_setattr(struct afs_fs_cursor *, struct iattr *);
+			     pgoff_t, pgoff_t, unsigned, unsigned, struct afs_status_cb *);
+extern int yfs_fs_setattr(struct afs_fs_cursor *, struct iattr *, struct afs_status_cb *);
 extern int yfs_fs_get_volume_status(struct afs_fs_cursor *, struct afs_volume_status *);
 extern int yfs_fs_set_lock(struct afs_fs_cursor *, afs_lock_type_t);
 extern int yfs_fs_extend_lock(struct afs_fs_cursor *);
 extern int yfs_fs_release_lock(struct afs_fs_cursor *);
 extern int yfs_fs_fetch_status(struct afs_fs_cursor *, struct afs_net *,
-			       struct afs_fid *, struct afs_file_status *,
-			       struct afs_callback *, struct afs_volsync *);
+			       struct afs_fid *, struct afs_status_cb *,
+			       struct afs_volsync *);
 extern int yfs_fs_inline_bulk_status(struct afs_fs_cursor *, struct afs_net *,
 				     struct afs_fid *, struct afs_status_cb *,
 				     unsigned int, struct afs_volsync *);
@@ -1406,8 +1410,10 @@ struct yfs_acl {
 };
 
 extern void yfs_free_opaque_acl(struct yfs_acl *);
-extern struct yfs_acl *yfs_fs_fetch_opaque_acl(struct afs_fs_cursor *, struct yfs_acl *);
-extern int yfs_fs_store_opaque_acl2(struct afs_fs_cursor *, const struct afs_acl *);
+extern struct yfs_acl *yfs_fs_fetch_opaque_acl(struct afs_fs_cursor *, struct yfs_acl *,
+					       struct afs_status_cb *);
+extern int yfs_fs_store_opaque_acl2(struct afs_fs_cursor *, const struct afs_acl *,
+				    struct afs_status_cb *);
 
 /*
  * Miscellaneous inline functions.
@@ -1422,14 +1428,6 @@ static inline struct inode *AFS_VNODE_TO_I(struct afs_vnode *vnode)
 	return &vnode->vfs_inode;
 }
 
-static inline void afs_vnode_commit_status(struct afs_fs_cursor *fc,
-					   struct afs_vnode *vnode,
-					   unsigned int cb_break)
-{
-	if (fc->ac.error == 0)
-		afs_cache_permit(vnode, fc->key, cb_break);
-}
-
 static inline void afs_check_for_remote_deletion(struct afs_fs_cursor *fc,
 						 struct afs_vnode *vnode)
 {
diff --git a/fs/afs/security.c b/fs/afs/security.c
index db5529e47eb8..857f09d09ee9 100644
--- a/fs/afs/security.c
+++ b/fs/afs/security.c
@@ -116,10 +116,10 @@ static void afs_hash_permits(struct afs_permits *permits)
  * as the ACL *may* have changed.
  */
 void afs_cache_permit(struct afs_vnode *vnode, struct key *key,
-		      unsigned int cb_break)
+		      unsigned int cb_break, struct afs_status_cb *scb)
 {
 	struct afs_permits *permits, *xpermits, *replacement, *zap, *new = NULL;
-	afs_access_t caller_access = READ_ONCE(vnode->status.caller_access);
+	afs_access_t caller_access = scb->status.caller_access;
 	size_t size = 0;
 	bool changed = false;
 	int i, j;
@@ -320,13 +320,12 @@ int afs_check_permit(struct afs_vnode *vnode, struct key *key,
 		 */
 		_debug("no valid permit");
 
-		ret = afs_fetch_status(vnode, key, false);
+		ret = afs_fetch_status(vnode, key, false, _access);
 		if (ret < 0) {
 			*_access = 0;
 			_leave(" = %d", ret);
 			return ret;
 		}
-		*_access = vnode->status.caller_access;
 	}
 
 	_leave(" = 0 [access %x]", *_access);
diff --git a/fs/afs/super.c b/fs/afs/super.c
index 3df11eede7f4..f45a95eea237 100644
--- a/fs/afs/super.c
+++ b/fs/afs/super.c
@@ -455,7 +455,7 @@ static int afs_fill_super(struct super_block *sb, struct afs_fs_context *ctx)
 		fid.vnode	= 1;
 		fid.vnode_hi	= 0;
 		fid.unique	= 1;
-		inode = afs_iget(sb, ctx->key, &fid, NULL, NULL, NULL, NULL);
+		inode = afs_iget(sb, ctx->key, &fid, NULL, NULL, NULL);
 	}
 
 	if (IS_ERR(inode))
@@ -749,7 +749,6 @@ static int afs_statfs(struct dentry *dentry, struct kstatfs *buf)
 		}
 
 		afs_check_for_remote_deletion(&fc, fc.vnode);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break);
 		ret = afs_end_vnode_operation(&fc);
 	}
 
diff --git a/fs/afs/write.c b/fs/afs/write.c
index e669f2fae873..8bcab95f1127 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -313,6 +313,46 @@ static void afs_redirty_pages(struct writeback_control *wbc,
 	_leave("");
 }
 
+/*
+ * completion of write to server
+ */
+static void afs_pages_written_back(struct afs_vnode *vnode,
+				   pgoff_t first, pgoff_t last)
+{
+	struct pagevec pv;
+	unsigned long priv;
+	unsigned count, loop;
+
+	_enter("{%llx:%llu},{%lx-%lx}",
+	       vnode->fid.vid, vnode->fid.vnode, first, last);
+
+	pagevec_init(&pv);
+
+	do {
+		_debug("done %lx-%lx", first, last);
+
+		count = last - first + 1;
+		if (count > PAGEVEC_SIZE)
+			count = PAGEVEC_SIZE;
+		pv.nr = find_get_pages_contig(vnode->vfs_inode.i_mapping,
+					      first, count, pv.pages);
+		ASSERTCMP(pv.nr, ==, count);
+
+		for (loop = 0; loop < count; loop++) {
+			priv = page_private(pv.pages[loop]);
+			trace_afs_page_dirty(vnode, tracepoint_string("clear"),
+					     pv.pages[loop]->index, priv);
+			set_page_private(pv.pages[loop], 0);
+			end_page_writeback(pv.pages[loop]);
+		}
+		first += count;
+		__pagevec_release(&pv);
+	} while (first <= last);
+
+	afs_prune_wb_keys(vnode);
+	_leave("");
+}
+
 /*
  * write to a file
  */
@@ -322,6 +362,7 @@ static int afs_store_data(struct address_space *mapping,
 {
 	struct afs_vnode *vnode = AFS_FS_I(mapping->host);
 	struct afs_fs_cursor fc;
+	struct afs_status_cb *scb;
 	struct afs_wb_key *wbk = NULL;
 	struct list_head *p;
 	int ret = -ENOKEY, ret2;
@@ -333,6 +374,10 @@ static int afs_store_data(struct address_space *mapping,
 	       vnode->fid.unique,
 	       first, last, offset, to);
 
+	scb = kzalloc(sizeof(struct afs_status_cb), GFP_NOFS);
+	if (!scb)
+		return -ENOMEM;
+
 	spin_lock(&vnode->wb_lock);
 	p = vnode->wb_keys.next;
 
@@ -351,6 +396,7 @@ static int afs_store_data(struct address_space *mapping,
 
 	spin_unlock(&vnode->wb_lock);
 	afs_put_wb_key(wbk);
+	kfree(scb);
 	_leave(" = %d [no keys]", ret);
 	return ret;
 
@@ -362,13 +408,18 @@ static int afs_store_data(struct address_space *mapping,
 
 	ret = -ERESTARTSYS;
 	if (afs_begin_vnode_operation(&fc, vnode, wbk->key, false)) {
+		afs_dataversion_t data_version = vnode->status.data_version + 1;
+
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(vnode);
-			afs_fs_store_data(&fc, mapping, first, last, offset, to);
+			afs_fs_store_data(&fc, mapping, first, last, offset, to, scb);
 		}
 
-		afs_check_for_remote_deletion(&fc, fc.vnode);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break);
+		afs_check_for_remote_deletion(&fc, vnode);
+		afs_vnode_commit_status(&fc, vnode, fc.cb_break,
+					&data_version, scb);
+		if (fc.ac.error == 0)
+			afs_pages_written_back(vnode, first, last);
 		ret = afs_end_vnode_operation(&fc);
 	}
 
@@ -393,6 +444,7 @@ static int afs_store_data(struct address_space *mapping,
 	}
 
 	afs_put_wb_key(wbk);
+	kfree(scb);
 	_leave(" = %d", ret);
 	return ret;
 }
@@ -678,46 +730,6 @@ int afs_writepages(struct address_space *mapping,
 	return ret;
 }
 
-/*
- * completion of write to server
- */
-void afs_pages_written_back(struct afs_vnode *vnode, struct afs_call *call)
-{
-	struct pagevec pv;
-	unsigned long priv;
-	unsigned count, loop;
-	pgoff_t first = call->first, last = call->last;
-
-	_enter("{%llx:%llu},{%lx-%lx}",
-	       vnode->fid.vid, vnode->fid.vnode, first, last);
-
-	pagevec_init(&pv);
-
-	do {
-		_debug("done %lx-%lx", first, last);
-
-		count = last - first + 1;
-		if (count > PAGEVEC_SIZE)
-			count = PAGEVEC_SIZE;
-		pv.nr = find_get_pages_contig(vnode->vfs_inode.i_mapping,
-					      first, count, pv.pages);
-		ASSERTCMP(pv.nr, ==, count);
-
-		for (loop = 0; loop < count; loop++) {
-			priv = page_private(pv.pages[loop]);
-			trace_afs_page_dirty(vnode, tracepoint_string("clear"),
-					     pv.pages[loop]->index, priv);
-			set_page_private(pv.pages[loop], 0);
-			end_page_writeback(pv.pages[loop]);
-		}
-		first += count;
-		__pagevec_release(&pv);
-	} while (first <= last);
-
-	afs_prune_wb_keys(vnode);
-	_leave("");
-}
-
 /*
  * write to an AFS file
  */
diff --git a/fs/afs/xattr.c b/fs/afs/xattr.c
index e13b005fac42..17f58fea7ec1 100644
--- a/fs/afs/xattr.c
+++ b/fs/afs/xattr.c
@@ -47,24 +47,34 @@ static int afs_xattr_get_acl(const struct xattr_handler *handler,
 			     void *buffer, size_t size)
 {
 	struct afs_fs_cursor fc;
+	struct afs_status_cb *scb;
 	struct afs_vnode *vnode = AFS_FS_I(inode);
 	struct afs_acl *acl = NULL;
 	struct key *key;
-	int ret;
+	int ret = -ENOMEM;
+
+	scb = kzalloc(sizeof(struct afs_status_cb), GFP_NOFS);
+	if (!scb)
+		goto error;
 
 	key = afs_request_key(vnode->volume->cell);
-	if (IS_ERR(key))
-		return PTR_ERR(key);
+	if (IS_ERR(key)) {
+		ret = PTR_ERR(key);
+		goto error_scb;
+	}
 
 	ret = -ERESTARTSYS;
 	if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
+		afs_dataversion_t data_version = vnode->status.data_version;
+
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(vnode);
-			acl = afs_fs_fetch_acl(&fc);
+			acl = afs_fs_fetch_acl(&fc, scb);
 		}
 
 		afs_check_for_remote_deletion(&fc, fc.vnode);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break);
+		afs_vnode_commit_status(&fc, vnode, fc.cb_break,
+					&data_version, scb);
 		ret = afs_end_vnode_operation(&fc);
 	}
 
@@ -80,6 +90,9 @@ static int afs_xattr_get_acl(const struct xattr_handler *handler,
 	}
 
 	key_put(key);
+error_scb:
+	kfree(scb);
+error:
 	return ret;
 }
 
@@ -92,22 +105,27 @@ static int afs_xattr_set_acl(const struct xattr_handler *handler,
                              const void *buffer, size_t size, int flags)
 {
 	struct afs_fs_cursor fc;
+	struct afs_status_cb *scb;
 	struct afs_vnode *vnode = AFS_FS_I(inode);
 	struct afs_acl *acl = NULL;
 	struct key *key;
-	int ret;
+	int ret = -ENOMEM;
 
 	if (flags == XATTR_CREATE)
 		return -EINVAL;
 
-	key = afs_request_key(vnode->volume->cell);
-	if (IS_ERR(key))
-		return PTR_ERR(key);
+	scb = kzalloc(sizeof(struct afs_status_cb), GFP_NOFS);
+	if (!scb)
+		goto error;
 
 	acl = kmalloc(sizeof(*acl) + size, GFP_KERNEL);
-	if (!acl) {
-		key_put(key);
-		return -ENOMEM;
+	if (!acl)
+		goto error_scb;
+
+	key = afs_request_key(vnode->volume->cell);
+	if (IS_ERR(key)) {
+		ret = PTR_ERR(key);
+		goto error_acl;
 	}
 
 	acl->size = size;
@@ -115,18 +133,25 @@ static int afs_xattr_set_acl(const struct xattr_handler *handler,
 
 	ret = -ERESTARTSYS;
 	if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
+		afs_dataversion_t data_version = vnode->status.data_version;
+
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(vnode);
-			afs_fs_store_acl(&fc, acl);
+			afs_fs_store_acl(&fc, acl, scb);
 		}
 
 		afs_check_for_remote_deletion(&fc, fc.vnode);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break);
+		afs_vnode_commit_status(&fc, vnode, fc.cb_break,
+					&data_version, scb);
 		ret = afs_end_vnode_operation(&fc);
 	}
 
-	kfree(acl);
 	key_put(key);
+error_acl:
+	kfree(acl);
+error_scb:
+	kfree(scb);
+error:
 	return ret;
 }
 
@@ -145,6 +170,7 @@ static int afs_xattr_get_yfs(const struct xattr_handler *handler,
 			     void *buffer, size_t size)
 {
 	struct afs_fs_cursor fc;
+	struct afs_status_cb *scb;
 	struct afs_vnode *vnode = AFS_FS_I(inode);
 	struct yfs_acl *yacl = NULL;
 	struct key *key;
@@ -171,21 +197,28 @@ static int afs_xattr_get_yfs(const struct xattr_handler *handler,
 	else if (which == 3)
 		yacl->flags |= YFS_ACL_WANT_VOL_ACL;
 
+	scb = kzalloc(sizeof(struct afs_status_cb), GFP_NOFS);
+	if (!scb)
+		goto error_yacl;
+
 	key = afs_request_key(vnode->volume->cell);
 	if (IS_ERR(key)) {
 		ret = PTR_ERR(key);
-		goto error_yacl;
+		goto error_scb;
 	}
 
 	ret = -ERESTARTSYS;
 	if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
+		afs_dataversion_t data_version = vnode->status.data_version;
+
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(vnode);
-			yfs_fs_fetch_opaque_acl(&fc, yacl);
+			yfs_fs_fetch_opaque_acl(&fc, yacl, scb);
 		}
 
 		afs_check_for_remote_deletion(&fc, fc.vnode);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break);
+		afs_vnode_commit_status(&fc, vnode, fc.cb_break,
+					&data_version, scb);
 		ret = afs_end_vnode_operation(&fc);
 	}
 
@@ -225,6 +258,8 @@ static int afs_xattr_get_yfs(const struct xattr_handler *handler,
 
 error_key:
 	key_put(key);
+error_scb:
+	kfree(scb);
 error_yacl:
 	yfs_free_opaque_acl(yacl);
 error:
@@ -240,42 +275,54 @@ static int afs_xattr_set_yfs(const struct xattr_handler *handler,
                              const void *buffer, size_t size, int flags)
 {
 	struct afs_fs_cursor fc;
+	struct afs_status_cb *scb;
 	struct afs_vnode *vnode = AFS_FS_I(inode);
 	struct afs_acl *acl = NULL;
 	struct key *key;
-	int ret;
+	int ret = -ENOMEM;
 
 	if (flags == XATTR_CREATE ||
 	    strcmp(name, "acl") != 0)
 		return -EINVAL;
 
-	key = afs_request_key(vnode->volume->cell);
-	if (IS_ERR(key))
-		return PTR_ERR(key);
+	scb = kzalloc(sizeof(struct afs_status_cb), GFP_NOFS);
+	if (!scb)
+		goto error;
 
 	acl = kmalloc(sizeof(*acl) + size, GFP_KERNEL);
-	if (!acl) {
-		key_put(key);
-		return -ENOMEM;
-	}
+	if (!acl)
+		goto error_scb;
 
 	acl->size = size;
 	memcpy(acl->data, buffer, size);
 
+	key = afs_request_key(vnode->volume->cell);
+	if (IS_ERR(key)) {
+		ret = PTR_ERR(key);
+		goto error_acl;
+	}
+
 	ret = -ERESTARTSYS;
 	if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
+		afs_dataversion_t data_version = vnode->status.data_version;
+
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(vnode);
-			yfs_fs_store_opaque_acl2(&fc, acl);
+			yfs_fs_store_opaque_acl2(&fc, acl, scb);
 		}
 
 		afs_check_for_remote_deletion(&fc, fc.vnode);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break);
+		afs_vnode_commit_status(&fc, vnode, fc.cb_break,
+					&data_version, scb);
 		ret = afs_end_vnode_operation(&fc);
 	}
 
+error_acl:
 	kfree(acl);
 	key_put(key);
+error_scb:
+	kfree(scb);
+error:
 	return ret;
 }
 
diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index b3ee99972d2f..701b6ee4ce10 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -183,24 +183,18 @@ static void xdr_dump_bad(const __be32 *bp)
 /*
  * Decode a YFSFetchStatus block
  */
-static int xdr_decode_YFSFetchStatus(struct afs_call *call,
-				     const __be32 **_bp,
-				     struct afs_file_status *status,
-				     struct afs_vnode *vnode,
-				     const afs_dataversion_t *expected_version,
-				     struct afs_read *read_req)
+static int xdr_decode_YFSFetchStatus(const __be32 **_bp,
+				     struct afs_call *call,
+				     struct afs_status_cb *scb)
 {
 	const struct yfs_xdr_YFSFetchStatus *xdr = (const void *)*_bp;
+	struct afs_file_status *status = &scb->status;
 	u32 type;
-	u8 flags = 0;
 
 	status->abort_code = ntohl(xdr->abort_code);
 	if (status->abort_code != 0) {
-		if (vnode && status->abort_code == VNOVNODE) {
-			set_bit(AFS_VNODE_DELETED, &vnode->flags);
+		if (status->abort_code == VNOVNODE)
 			status->nlink = 0;
-			__afs_break_callback(vnode);
-		}
 		return 0;
 	}
 
@@ -209,77 +203,27 @@ static int xdr_decode_YFSFetchStatus(struct afs_call *call,
 	case AFS_FTYPE_FILE:
 	case AFS_FTYPE_DIR:
 	case AFS_FTYPE_SYMLINK:
-		if (type != status->type &&
-		    vnode &&
-		    !test_bit(AFS_VNODE_UNSET, &vnode->flags)) {
-			pr_warning("Vnode %llx:%llx:%x changed type %u to %u\n",
-				   vnode->fid.vid,
-				   vnode->fid.vnode,
-				   vnode->fid.unique,
-				   status->type, type);
-			goto bad;
-		}
 		status->type = type;
 		break;
 	default:
 		goto bad;
 	}
 
-#define EXTRACT_M4(FIELD)					\
-	do {							\
-		u32 x = ntohl(xdr->FIELD);			\
-		if (status->FIELD != x) {			\
-			flags |= AFS_VNODE_META_CHANGED;	\
-			status->FIELD = x;			\
-		}						\
-	} while (0)
-
-#define EXTRACT_M8(FIELD)					\
-	do {							\
-		u64 x = xdr_to_u64(xdr->FIELD);			\
-		if (status->FIELD != x) {			\
-			flags |= AFS_VNODE_META_CHANGED;	\
-			status->FIELD = x;			\
-		}						\
-	} while (0)
-
-#define EXTRACT_D8(FIELD)					\
-	do {							\
-		u64 x = xdr_to_u64(xdr->FIELD);			\
-		if (status->FIELD != x) {			\
-			flags |= AFS_VNODE_DATA_CHANGED;	\
-			status->FIELD = x;			\
-		}						\
-	} while (0)
-
-	EXTRACT_M4(nlink);
-	EXTRACT_D8(size);
-	EXTRACT_D8(data_version);
-	EXTRACT_M8(author);
-	EXTRACT_M8(owner);
-	EXTRACT_M8(group);
-	EXTRACT_M4(mode);
-	EXTRACT_M4(caller_access); /* call ticket dependent */
-	EXTRACT_M4(anon_access);
-
-	status->mtime_client = xdr_to_time(xdr->mtime_client);
-	status->mtime_server = xdr_to_time(xdr->mtime_server);
-	status->lock_count   = ntohl(xdr->lock_count);
-
-	if (read_req) {
-		read_req->data_version = status->data_version;
-		read_req->file_size = status->size;
-	}
-
-	*_bp += xdr_size(xdr);
+	status->nlink		= ntohl(xdr->nlink);
+	status->author		= xdr_to_u64(xdr->author);
+	status->owner		= xdr_to_u64(xdr->owner);
+	status->caller_access	= ntohl(xdr->caller_access); /* Ticket dependent */
+	status->anon_access	= ntohl(xdr->anon_access);
+	status->mode		= ntohl(xdr->mode) & S_IALLUGO;
+	status->group		= xdr_to_u64(xdr->group);
+	status->lock_count	= ntohl(xdr->lock_count);
 
-	if (vnode) {
-		if (test_bit(AFS_VNODE_UNSET, &vnode->flags))
-			flags |= AFS_VNODE_NOT_YET_SET;
-		afs_update_inode_from_status(vnode, status, expected_version,
-					     flags);
-	}
+	status->mtime_client	= xdr_to_time(xdr->mtime_client);
+	status->mtime_server	= xdr_to_time(xdr->mtime_server);
+	status->size		= xdr_to_u64(xdr->size);
+	status->data_version	= xdr_to_u64(xdr->data_version);
 
+	*_bp += xdr_size(xdr);
 	return 0;
 
 bad:
@@ -288,34 +232,14 @@ static int xdr_decode_YFSFetchStatus(struct afs_call *call,
 }
 
 /*
- * Decode the file status.  We need to lock the target vnode if we're going to
- * update its status so that stat() sees the attributes update atomically.
+ * Decode a YFSCallBack block
  */
-static int yfs_decode_status(struct afs_call *call,
-			     const __be32 **_bp,
-			     struct afs_file_status *status,
-			     struct afs_vnode *vnode,
-			     const afs_dataversion_t *expected_version,
-			     struct afs_read *read_req)
-{
-	int ret;
-
-	if (!vnode)
-		return xdr_decode_YFSFetchStatus(call, _bp, status, vnode,
-						 expected_version, read_req);
-
-	write_seqlock(&vnode->cb_lock);
-	ret = xdr_decode_YFSFetchStatus(call, _bp, status, vnode,
-					expected_version, read_req);
-	write_sequnlock(&vnode->cb_lock);
-	return ret;
-}
-
-static void xdr_decode_YFSCallBack_raw(struct afs_call *call,
-				       struct afs_callback *cb,
-				       const __be32 **_bp)
+static void xdr_decode_YFSCallBack(const __be32 **_bp,
+				   struct afs_call *call,
+				   struct afs_status_cb *scb)
 {
 	struct yfs_xdr_YFSCallBack *x = (void *)*_bp;
+	struct afs_callback *cb = &scb->callback;
 	ktime_t cb_expiry;
 
 	cb_expiry = call->reply_time;
@@ -323,40 +247,10 @@ static void xdr_decode_YFSCallBack_raw(struct afs_call *call,
 	cb->expires_at	= ktime_divns(cb_expiry, NSEC_PER_SEC);
 	cb->version	= ntohl(x->version);
 	cb->type	= ntohl(x->type);
-
+	scb->have_cb	= true;
 	*_bp += xdr_size(x);
 }
 
-/*
- * Decode a YFSCallBack block
- */
-static void xdr_decode_YFSCallBack(struct afs_call *call,
-				   struct afs_vnode *vnode,
-				   const __be32 **_bp)
-{
-	struct afs_cb_interest *old, *cbi = call->cbi;
-	struct afs_callback cb;
-
-	xdr_decode_YFSCallBack_raw(call, &cb, _bp);
-	
-	write_seqlock(&vnode->cb_lock);
-
-	if (!afs_cb_is_broken(call->cb_break, vnode, cbi)) {
-		vnode->cb_version	= cb.version;
-		vnode->cb_type		= cb.type;
-		vnode->cb_expires_at	= cb.expires_at;
-		old = vnode->cb_interest;
-		if (old != call->cbi) {
-			vnode->cb_interest = cbi;
-			cbi = old;
-		}
-		set_bit(AFS_VNODE_CB_PROMISED, &vnode->flags);
-	}
-
-	write_sequnlock(&vnode->cb_lock);
-	call->cbi = cbi;
-}
-
 /*
  * Decode a YFSVolSync block
  */
@@ -441,11 +335,10 @@ static void xdr_decode_YFSFetchVolumeStatus(const __be32 **_bp,
 }
 
 /*
- * deliver reply data to an FS.FetchStatus
+ * Deliver a reply that's a status, callback and volsync.
  */
-static int yfs_deliver_fs_fetch_status_vnode(struct afs_call *call)
+static int yfs_deliver_fs_status_cb_and_volsync(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->xvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -453,15 +346,35 @@ static int yfs_deliver_fs_fetch_status_vnode(struct afs_call *call)
 	if (ret < 0)
 		return ret;
 
-	_enter("{%llx:%llu}", vnode->fid.vid, vnode->fid.vnode);
-
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	ret = yfs_decode_status(call, &bp, &vnode->status, vnode,
-				&call->expected_version, NULL);
+	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
+	if (ret < 0)
+		return ret;
+	xdr_decode_YFSCallBack(&bp, call, call->out_scb);
+	xdr_decode_YFSVolSync(&bp, call->out_volsync);
+
+	_leave(" = 0 [done]");
+	return 0;
+}
+
+/*
+ * Deliver reply data to operations that just return a file status and a volume
+ * sync record.
+ */
+static int yfs_deliver_status_and_volsync(struct afs_call *call)
+{
+	const __be32 *bp;
+	int ret;
+
+	ret = afs_transfer_reply(call);
+	if (ret < 0)
+		return ret;
+
+	bp = call->buffer;
+	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
 	if (ret < 0)
 		return ret;
-	xdr_decode_YFSCallBack(call, vnode, &bp);
 	xdr_decode_YFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
@@ -474,15 +387,15 @@ static int yfs_deliver_fs_fetch_status_vnode(struct afs_call *call)
 static const struct afs_call_type yfs_RXYFSFetchStatus_vnode = {
 	.name		= "YFS.FetchStatus(vnode)",
 	.op		= yfs_FS_FetchStatus,
-	.deliver	= yfs_deliver_fs_fetch_status_vnode,
+	.deliver	= yfs_deliver_fs_status_cb_and_volsync,
 	.destructor	= afs_flat_call_destructor,
 };
 
 /*
  * Fetch the status information for a file.
  */
-int yfs_fs_fetch_file_status(struct afs_fs_cursor *fc, struct afs_volsync *volsync,
-			     bool new_inode)
+int yfs_fs_fetch_file_status(struct afs_fs_cursor *fc, struct afs_status_cb *scb,
+			     struct afs_volsync *volsync)
 {
 	struct afs_vnode *vnode = fc->vnode;
 	struct afs_call *call;
@@ -504,9 +417,8 @@ int yfs_fs_fetch_file_status(struct afs_fs_cursor *fc, struct afs_volsync *volsy
 	}
 
 	call->key = fc->key;
-	call->xvnode = vnode;
+	call->out_scb = scb;
 	call->out_volsync = volsync;
-	call->expected_version = new_inode ? 1 : vnode->status.data_version;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -515,7 +427,6 @@ int yfs_fs_fetch_file_status(struct afs_fs_cursor *fc, struct afs_volsync *volsy
 	bp = xdr_encode_YFSFid(bp, &vnode->fid);
 	yfs_check_req(call, bp);
 
-	call->cb_break = fc->cb_break;
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
 	afs_set_fc_call(call, fc);
@@ -528,7 +439,6 @@ int yfs_fs_fetch_file_status(struct afs_fs_cursor *fc, struct afs_volsync *volsy
  */
 static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->xvnode;
 	struct afs_read *req = call->read_request;
 	const __be32 *bp;
 	unsigned int size;
@@ -586,7 +496,7 @@ static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 		if (req->offset == PAGE_SIZE) {
 			req->offset = 0;
 			if (req->page_done)
-				req->page_done(call, req);
+				req->page_done(req);
 			req->index++;
 			if (req->remain > 0)
 				goto begin_page;
@@ -623,13 +533,15 @@ static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 			return ret;
 
 		bp = call->buffer;
-		ret = yfs_decode_status(call, &bp, &vnode->status, vnode,
-					&vnode->status.data_version, req);
+		ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
 		if (ret < 0)
 			return ret;
-		xdr_decode_YFSCallBack(call, vnode, &bp);
+		xdr_decode_YFSCallBack(&bp, call, call->out_scb);
 		xdr_decode_YFSVolSync(&bp, call->out_volsync);
 
+		req->data_version = call->out_scb->status.data_version;
+		req->file_size = call->out_scb->status.size;
+
 		call->unmarshall++;
 
 		/* Fall through */
@@ -642,7 +554,7 @@ static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 			zero_user_segment(req->pages[req->index],
 					  req->offset, PAGE_SIZE);
 		if (req->page_done)
-			req->page_done(call, req);
+			req->page_done(req);
 		req->offset = 0;
 	}
 
@@ -669,7 +581,8 @@ static const struct afs_call_type yfs_RXYFSFetchData64 = {
 /*
  * Fetch data from a file.
  */
-int yfs_fs_fetch_data(struct afs_fs_cursor *fc, struct afs_read *req)
+int yfs_fs_fetch_data(struct afs_fs_cursor *fc, struct afs_status_cb *scb,
+		      struct afs_read *req)
 {
 	struct afs_vnode *vnode = fc->vnode;
 	struct afs_call *call;
@@ -691,10 +604,9 @@ int yfs_fs_fetch_data(struct afs_fs_cursor *fc, struct afs_read *req)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->xvnode = vnode;
+	call->out_scb = scb;
 	call->out_volsync = NULL;
 	call->read_request = req;
-	call->expected_version = vnode->status.data_version;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -706,7 +618,6 @@ int yfs_fs_fetch_data(struct afs_fs_cursor *fc, struct afs_read *req)
 	yfs_check_req(call, bp);
 
 	refcount_inc(&req->usage);
-	call->cb_break = fc->cb_break;
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
 	afs_set_fc_call(call, fc);
@@ -719,7 +630,6 @@ int yfs_fs_fetch_data(struct afs_fs_cursor *fc, struct afs_read *req)
  */
 static int yfs_deliver_fs_create_vnode(struct afs_call *call)
 {
-	struct afs_vnode *dvnode = call->dvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -732,15 +642,14 @@ static int yfs_deliver_fs_create_vnode(struct afs_call *call)
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
 	xdr_decode_YFSFid(&bp, call->out_fid);
-	ret = yfs_decode_status(call, &bp, call->out_extra_status, NULL, NULL, NULL);
+	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
 	if (ret < 0)
 		return ret;
-	ret = yfs_decode_status(call, &bp, &dvnode->status, dvnode,
-				&call->expected_version, NULL);
+	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
 	if (ret < 0)
 		return ret;
-	xdr_decode_YFSCallBack_raw(call, call->out_cb, &bp);
-	xdr_decode_YFSVolSync(&bp, NULL);
+	xdr_decode_YFSCallBack(&bp, call, call->out_scb);
+	xdr_decode_YFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -762,10 +671,9 @@ static const struct afs_call_type afs_RXFSCreateFile = {
 int yfs_fs_create_file(struct afs_fs_cursor *fc,
 		       const char *name,
 		       umode_t mode,
-		       u64 current_data_version,
+		       struct afs_status_cb *dvnode_scb,
 		       struct afs_fid *newfid,
-		       struct afs_file_status *newstatus,
-		       struct afs_callback *newcb)
+		       struct afs_status_cb *new_scb)
 {
 	struct afs_vnode *dvnode = fc->vnode;
 	struct afs_call *call;
@@ -793,11 +701,9 @@ int yfs_fs_create_file(struct afs_fs_cursor *fc,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->dvnode = dvnode;
+	call->out_dir_scb = dvnode_scb;
 	call->out_fid = newfid;
-	call->out_extra_status = newstatus;
-	call->out_cb = newcb;
-	call->expected_version = current_data_version + 1;
+	call->out_scb = new_scb;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -829,10 +735,9 @@ static const struct afs_call_type yfs_RXFSMakeDir = {
 int yfs_fs_make_dir(struct afs_fs_cursor *fc,
 		    const char *name,
 		    umode_t mode,
-		    u64 current_data_version,
+		    struct afs_status_cb *dvnode_scb,
 		    struct afs_fid *newfid,
-		    struct afs_file_status *newstatus,
-		    struct afs_callback *newcb)
+		    struct afs_status_cb *new_scb)
 {
 	struct afs_vnode *dvnode = fc->vnode;
 	struct afs_call *call;
@@ -859,11 +764,9 @@ int yfs_fs_make_dir(struct afs_fs_cursor *fc,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->dvnode = dvnode;
+	call->out_dir_scb = dvnode_scb;
 	call->out_fid = newfid;
-	call->out_extra_status = newstatus;
-	call->out_cb = newcb;
-	call->expected_version = current_data_version + 1;
+	call->out_scb = new_scb;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -886,8 +789,6 @@ int yfs_fs_make_dir(struct afs_fs_cursor *fc,
  */
 static int yfs_deliver_fs_remove_file2(struct afs_call *call)
 {
-	struct afs_vnode *dvnode = call->dvnode;
-	struct afs_vnode *vnode = call->xvnode;
 	struct afs_fid fid;
 	const __be32 *bp;
 	int ret;
@@ -898,20 +799,18 @@ static int yfs_deliver_fs_remove_file2(struct afs_call *call)
 	if (ret < 0)
 		return ret;
 
-	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	ret = yfs_decode_status(call, &bp, &dvnode->status, dvnode,
-				&call->expected_version, NULL);
+	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
 	if (ret < 0)
 		return ret;
 
 	xdr_decode_YFSFid(&bp, &fid);
-	ret = yfs_decode_status(call, &bp, &vnode->status, vnode, NULL, NULL);
+	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
 	if (ret < 0)
 		return ret;
 	/* Was deleted if vnode->status.abort_code == VNOVNODE. */
 
-	xdr_decode_YFSVolSync(&bp, NULL);
+	xdr_decode_YFSVolSync(&bp, call->out_volsync);
 	return 0;
 }
 
@@ -929,7 +828,8 @@ static const struct afs_call_type yfs_RXYFSRemoveFile2 = {
  * Remove a file and retrieve new file status.
  */
 int yfs_fs_remove_file2(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
-			const char *name, u64 current_data_version)
+			const char *name, struct afs_status_cb *dvnode_scb,
+			struct afs_status_cb *vnode_scb)
 {
 	struct afs_vnode *dvnode = fc->vnode;
 	struct afs_call *call;
@@ -954,9 +854,8 @@ int yfs_fs_remove_file2(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->dvnode = dvnode;
-	call->xvnode = vnode;
-	call->expected_version = current_data_version + 1;
+	call->out_dir_scb = dvnode_scb;
+	call->out_scb = vnode_scb;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -978,7 +877,6 @@ int yfs_fs_remove_file2(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
  */
 static int yfs_deliver_fs_remove(struct afs_call *call)
 {
-	struct afs_vnode *dvnode = call->dvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -988,14 +886,12 @@ static int yfs_deliver_fs_remove(struct afs_call *call)
 	if (ret < 0)
 		return ret;
 
-	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	ret = yfs_decode_status(call, &bp, &dvnode->status, dvnode,
-				&call->expected_version, NULL);
+	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
 	if (ret < 0)
 		return ret;
 
-	xdr_decode_YFSVolSync(&bp, NULL);
+	xdr_decode_YFSVolSync(&bp, call->out_volsync);
 	return 0;
 }
 
@@ -1020,7 +916,8 @@ static const struct afs_call_type yfs_RXYFSRemoveDir = {
  * remove a file or directory
  */
 int yfs_fs_remove(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
-		  const char *name, bool isdir, u64 current_data_version)
+		  const char *name, bool isdir,
+		  struct afs_status_cb *dvnode_scb)
 {
 	struct afs_vnode *dvnode = fc->vnode;
 	struct afs_call *call;
@@ -1043,9 +940,7 @@ int yfs_fs_remove(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->dvnode = dvnode;
-	call->xvnode = vnode;
-	call->expected_version = current_data_version + 1;
+	call->out_dir_scb = dvnode_scb;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -1067,7 +962,6 @@ int yfs_fs_remove(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
  */
 static int yfs_deliver_fs_link(struct afs_call *call)
 {
-	struct afs_vnode *dvnode = call->dvnode, *vnode = call->xvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -1077,16 +971,14 @@ static int yfs_deliver_fs_link(struct afs_call *call)
 	if (ret < 0)
 		return ret;
 
-	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	ret = yfs_decode_status(call, &bp, &vnode->status, vnode, NULL, NULL);
+	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
 	if (ret < 0)
 		return ret;
-	ret = yfs_decode_status(call, &bp, &dvnode->status, dvnode,
-				&call->expected_version, NULL);
+	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
 	if (ret < 0)
 		return ret;
-	xdr_decode_YFSVolSync(&bp, NULL);
+	xdr_decode_YFSVolSync(&bp, call->out_volsync);
 	_leave(" = 0 [done]");
 	return 0;
 }
@@ -1105,7 +997,9 @@ static const struct afs_call_type yfs_RXYFSLink = {
  * Make a hard link.
  */
 int yfs_fs_link(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
-		const char *name, u64 current_data_version)
+		const char *name,
+		struct afs_status_cb *dvnode_scb,
+		struct afs_status_cb *vnode_scb)
 {
 	struct afs_vnode *dvnode = fc->vnode;
 	struct afs_call *call;
@@ -1129,9 +1023,8 @@ int yfs_fs_link(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->dvnode = dvnode;
-	call->xvnode = vnode;
-	call->expected_version = current_data_version + 1;
+	call->out_dir_scb = dvnode_scb;
+	call->out_scb = vnode_scb;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -1154,7 +1047,6 @@ int yfs_fs_link(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
  */
 static int yfs_deliver_fs_symlink(struct afs_call *call)
 {
-	struct afs_vnode *dvnode = call->dvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -1167,14 +1059,13 @@ static int yfs_deliver_fs_symlink(struct afs_call *call)
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
 	xdr_decode_YFSFid(&bp, call->out_fid);
-	ret = yfs_decode_status(call, &bp, call->out_extra_status, NULL, NULL, NULL);
+	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
 	if (ret < 0)
 		return ret;
-	ret = yfs_decode_status(call, &bp, &dvnode->status, dvnode,
-				&call->expected_version, NULL);
+	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
 	if (ret < 0)
 		return ret;
-	xdr_decode_YFSVolSync(&bp, NULL);
+	xdr_decode_YFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -1196,9 +1087,9 @@ static const struct afs_call_type yfs_RXYFSSymlink = {
 int yfs_fs_symlink(struct afs_fs_cursor *fc,
 		   const char *name,
 		   const char *contents,
-		   u64 current_data_version,
+		   struct afs_status_cb *dvnode_scb,
 		   struct afs_fid *newfid,
-		   struct afs_file_status *newstatus)
+		   struct afs_status_cb *vnode_scb)
 {
 	struct afs_vnode *dvnode = fc->vnode;
 	struct afs_call *call;
@@ -1225,10 +1116,9 @@ int yfs_fs_symlink(struct afs_fs_cursor *fc,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->dvnode = dvnode;
+	call->out_dir_scb = dvnode_scb;
 	call->out_fid = newfid;
-	call->out_extra_status = newstatus;
-	call->expected_version = current_data_version + 1;
+	call->out_scb = vnode_scb;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -1252,8 +1142,6 @@ int yfs_fs_symlink(struct afs_fs_cursor *fc,
  */
 static int yfs_deliver_fs_rename(struct afs_call *call)
 {
-	struct afs_vnode *orig_dvnode = call->dvnode;
-	struct afs_vnode *new_dvnode = call->xvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -1263,20 +1151,17 @@ static int yfs_deliver_fs_rename(struct afs_call *call)
 	if (ret < 0)
 		return ret;
 
-	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	ret = yfs_decode_status(call, &bp, &orig_dvnode->status, orig_dvnode,
-				&call->expected_version, NULL);
+	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
 	if (ret < 0)
 		return ret;
-	if (new_dvnode != orig_dvnode) {
-		ret = yfs_decode_status(call, &bp, &new_dvnode->status, new_dvnode,
-					&call->expected_version_2, NULL);
+	if (call->out_dir_scb != call->out_scb) {
+		ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
 		if (ret < 0)
 			return ret;
 	}
 
-	xdr_decode_YFSVolSync(&bp, NULL);
+	xdr_decode_YFSVolSync(&bp, call->out_volsync);
 	_leave(" = 0 [done]");
 	return 0;
 }
@@ -1298,8 +1183,8 @@ int yfs_fs_rename(struct afs_fs_cursor *fc,
 		  const char *orig_name,
 		  struct afs_vnode *new_dvnode,
 		  const char *new_name,
-		  u64 current_orig_data_version,
-		  u64 current_new_data_version)
+		  struct afs_status_cb *orig_dvnode_scb,
+		  struct afs_status_cb *new_dvnode_scb)
 {
 	struct afs_vnode *orig_dvnode = fc->vnode;
 	struct afs_call *call;
@@ -1325,10 +1210,8 @@ int yfs_fs_rename(struct afs_fs_cursor *fc,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->dvnode = orig_dvnode;
-	call->xvnode = new_dvnode;
-	call->expected_version = current_orig_data_version + 1;
-	call->expected_version_2 = current_new_data_version + 1;
+	call->out_dir_scb = orig_dvnode_scb;
+	call->out_scb = new_dvnode_scb;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -1347,42 +1230,13 @@ int yfs_fs_rename(struct afs_fs_cursor *fc,
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
 
-/*
- * Deliver reply data to a YFS.StoreData64 operation.
- */
-static int yfs_deliver_fs_store_data(struct afs_call *call)
-{
-	struct afs_vnode *vnode = call->xvnode;
-	const __be32 *bp;
-	int ret;
-
-	_enter("");
-
-	ret = afs_transfer_reply(call);
-	if (ret < 0)
-		return ret;
-
-	/* unmarshall the reply once we've received all of it */
-	bp = call->buffer;
-	ret = yfs_decode_status(call, &bp, &vnode->status, vnode,
-				&call->expected_version, NULL);
-	if (ret < 0)
-		return ret;
-	xdr_decode_YFSVolSync(&bp, NULL);
-
-	afs_pages_written_back(vnode, call);
-
-	_leave(" = 0 [done]");
-	return 0;
-}
-
 /*
  * YFS.StoreData64 operation type.
  */
 static const struct afs_call_type yfs_RXYFSStoreData64 = {
 	.name		= "YFS.StoreData64",
 	.op		= yfs_FS_StoreData64,
-	.deliver	= yfs_deliver_fs_store_data,
+	.deliver	= yfs_deliver_status_and_volsync,
 	.destructor	= afs_flat_call_destructor,
 };
 
@@ -1391,7 +1245,8 @@ static const struct afs_call_type yfs_RXYFSStoreData64 = {
  */
 int yfs_fs_store_data(struct afs_fs_cursor *fc, struct address_space *mapping,
 		      pgoff_t first, pgoff_t last,
-		      unsigned offset, unsigned to)
+		      unsigned offset, unsigned to,
+		      struct afs_status_cb *scb)
 {
 	struct afs_vnode *vnode = fc->vnode;
 	struct afs_call *call;
@@ -1429,13 +1284,12 @@ int yfs_fs_store_data(struct afs_fs_cursor *fc, struct address_space *mapping,
 
 	call->key = fc->key;
 	call->mapping = mapping;
-	call->xvnode = vnode;
 	call->first = first;
 	call->last = last;
 	call->first_offset = offset;
 	call->last_to = to;
 	call->send_pages = true;
-	call->expected_version = vnode->status.data_version + 1;
+	call->out_scb = scb;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -1455,47 +1309,20 @@ int yfs_fs_store_data(struct afs_fs_cursor *fc, struct address_space *mapping,
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
 
-/*
- * deliver reply data to an FS.StoreStatus
- */
-static int yfs_deliver_fs_store_status(struct afs_call *call)
-{
-	struct afs_vnode *vnode = call->xvnode;
-	const __be32 *bp;
-	int ret;
-
-	_enter("");
-
-	ret = afs_transfer_reply(call);
-	if (ret < 0)
-		return ret;
-
-	/* unmarshall the reply once we've received all of it */
-	bp = call->buffer;
-	ret = yfs_decode_status(call, &bp, &vnode->status, vnode,
-				&call->expected_version, NULL);
-	if (ret < 0)
-		return ret;
-	xdr_decode_YFSVolSync(&bp, NULL);
-
-	_leave(" = 0 [done]");
-	return 0;
-}
-
 /*
  * YFS.StoreStatus operation type
  */
 static const struct afs_call_type yfs_RXYFSStoreStatus = {
 	.name		= "YFS.StoreStatus",
 	.op		= yfs_FS_StoreStatus,
-	.deliver	= yfs_deliver_fs_store_status,
+	.deliver	= yfs_deliver_status_and_volsync,
 	.destructor	= afs_flat_call_destructor,
 };
 
 static const struct afs_call_type yfs_RXYFSStoreData64_as_Status = {
 	.name		= "YFS.StoreData64",
 	.op		= yfs_FS_StoreData64,
-	.deliver	= yfs_deliver_fs_store_status,
+	.deliver	= yfs_deliver_status_and_volsync,
 	.destructor	= afs_flat_call_destructor,
 };
 
@@ -1503,7 +1330,8 @@ static const struct afs_call_type yfs_RXYFSStoreData64_as_Status = {
  * Set the attributes on a file, using YFS.StoreData64 rather than
  * YFS.StoreStatus so as to alter the file size also.
  */
-static int yfs_fs_setattr_size(struct afs_fs_cursor *fc, struct iattr *attr)
+static int yfs_fs_setattr_size(struct afs_fs_cursor *fc, struct iattr *attr,
+			       struct afs_status_cb *scb)
 {
 	struct afs_vnode *vnode = fc->vnode;
 	struct afs_call *call;
@@ -1524,8 +1352,7 @@ static int yfs_fs_setattr_size(struct afs_fs_cursor *fc, struct iattr *attr)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->xvnode = vnode;
-	call->expected_version = vnode->status.data_version + 1;
+	call->out_scb = scb;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -1549,7 +1376,8 @@ static int yfs_fs_setattr_size(struct afs_fs_cursor *fc, struct iattr *attr)
  * Set the attributes on a file, using YFS.StoreData64 if there's a change in
  * file size, and YFS.StoreStatus otherwise.
  */
-int yfs_fs_setattr(struct afs_fs_cursor *fc, struct iattr *attr)
+int yfs_fs_setattr(struct afs_fs_cursor *fc, struct iattr *attr,
+		   struct afs_status_cb *scb)
 {
 	struct afs_vnode *vnode = fc->vnode;
 	struct afs_call *call;
@@ -1557,7 +1385,7 @@ int yfs_fs_setattr(struct afs_fs_cursor *fc, struct iattr *attr)
 	__be32 *bp;
 
 	if (attr->ia_valid & ATTR_SIZE)
-		return yfs_fs_setattr_size(fc, attr);
+		return yfs_fs_setattr_size(fc, attr, scb);
 
 	_enter(",%x,{%llx:%llu},,",
 	       key_serial(fc->key), vnode->fid.vid, vnode->fid.vnode);
@@ -1572,8 +1400,7 @@ int yfs_fs_setattr(struct afs_fs_cursor *fc, struct iattr *attr)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->xvnode = vnode;
-	call->expected_version = vnode->status.data_version;
+	call->out_scb = scb;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -1763,34 +1590,6 @@ int yfs_fs_get_volume_status(struct afs_fs_cursor *fc,
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
 
-/*
- * Deliver reply data to operations that just return a file status and a volume
- * sync record.
- */
-static int yfs_deliver_status_and_volsync(struct afs_call *call)
-{
-	struct afs_vnode *vnode = call->xvnode;
-	const __be32 *bp;
-	int ret;
-
-	_enter("{%u}", call->unmarshall);
-
-	ret = afs_transfer_reply(call);
-	if (ret < 0)
-		return ret;
-
-	/* unmarshall the reply once we've received all of it */
-	bp = call->buffer;
-	ret = yfs_decode_status(call, &bp, &vnode->status, vnode,
-				&call->expected_version, NULL);
-	if (ret < 0)
-		return ret;
-	xdr_decode_YFSVolSync(&bp, NULL);
-
-	_leave(" = 0 [done]");
-	return 0;
-}
-
 /*
  * YFS.SetLock operation type
  */
@@ -1845,7 +1644,7 @@ int yfs_fs_set_lock(struct afs_fs_cursor *fc, afs_lock_type_t type)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->xvnode = vnode;
+	call->lvnode = vnode;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -1883,7 +1682,7 @@ int yfs_fs_extend_lock(struct afs_fs_cursor *fc)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->xvnode = vnode;
+	call->lvnode = vnode;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -1920,7 +1719,7 @@ int yfs_fs_release_lock(struct afs_fs_cursor *fc)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->xvnode = vnode;
+	call->lvnode = vnode;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -1936,43 +1735,13 @@ int yfs_fs_release_lock(struct afs_fs_cursor *fc)
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
 
-/*
- * Deliver reply data to an FS.FetchStatus with no vnode.
- */
-static int yfs_deliver_fs_fetch_status(struct afs_call *call)
-{
-	struct afs_file_status *status = call->out_extra_status;
-	struct afs_callback *callback = call->out_cb;
-	struct afs_volsync *volsync = call->out_volsync;
-	const __be32 *bp;
-	int ret;
-
-	ret = afs_transfer_reply(call);
-	if (ret < 0)
-		return ret;
-
-	_enter("");
-
-	/* unmarshall the reply once we've received all of it */
-	bp = call->buffer;
-	ret = yfs_decode_status(call, &bp, status, NULL,
-				&call->expected_version, NULL);
-	if (ret < 0)
-		return ret;
-	xdr_decode_YFSCallBack_raw(call, callback, &bp);
-	xdr_decode_YFSVolSync(&bp, volsync);
-
-	_leave(" = 0 [done]");
-	return 0;
-}
-
 /*
  * YFS.FetchStatus operation type
  */
 static const struct afs_call_type yfs_RXYFSFetchStatus = {
 	.name		= "YFS.FetchStatus",
 	.op		= yfs_FS_FetchStatus,
-	.deliver	= yfs_deliver_fs_fetch_status,
+	.deliver	= yfs_deliver_fs_status_cb_and_volsync,
 	.destructor	= afs_flat_call_destructor,
 };
 
@@ -1982,8 +1751,7 @@ static const struct afs_call_type yfs_RXYFSFetchStatus = {
 int yfs_fs_fetch_status(struct afs_fs_cursor *fc,
 			struct afs_net *net,
 			struct afs_fid *fid,
-			struct afs_file_status *status,
-			struct afs_callback *callback,
+			struct afs_status_cb *scb,
 			struct afs_volsync *volsync)
 {
 	struct afs_call *call;
@@ -2004,10 +1772,8 @@ int yfs_fs_fetch_status(struct afs_fs_cursor *fc,
 	}
 
 	call->key = fc->key;
-	call->out_extra_status = status;
-	call->out_cb = callback;
+	call->out_scb = scb;
 	call->out_volsync = volsync;
-	call->expected_version = 1; /* vnode->status.data_version */
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -2016,7 +1782,6 @@ int yfs_fs_fetch_status(struct afs_fs_cursor *fc,
 	bp = xdr_encode_YFSFid(bp, fid);
 	yfs_check_req(call, bp);
 
-	call->cb_break = fc->cb_break;
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, fid);
 	afs_set_fc_call(call, fc);
@@ -2069,8 +1834,7 @@ static int yfs_deliver_fs_inline_bulk_status(struct afs_call *call)
 
 		bp = call->buffer;
 		scb = &call->out_scb[call->count];
-		ret = yfs_decode_status(call, &bp, &scb->status,
-					NULL, NULL, NULL);
+		ret = xdr_decode_YFSFetchStatus(&bp, call, scb);
 		if (ret < 0)
 			return ret;
 
@@ -2110,8 +1874,7 @@ static int yfs_deliver_fs_inline_bulk_status(struct afs_call *call)
 		_debug("unmarshall CB array");
 		bp = call->buffer;
 		scb = &call->out_scb[call->count];
-		xdr_decode_YFSCallBack_raw(call, &scb->callback, &bp);
-		scb->have_cb = true;
+		xdr_decode_YFSCallBack(&bp, call, scb);
 		call->count++;
 		if (call->count < call->count2)
 			goto more_cbs;
@@ -2191,7 +1954,6 @@ int yfs_fs_inline_bulk_status(struct afs_fs_cursor *fc,
 		bp = xdr_encode_YFSFid(bp, &fids[i]);
 	yfs_check_req(call, bp);
 
-	call->cb_break = fc->cb_break;
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &fids[0]);
 	afs_set_fc_call(call, fc);
@@ -2204,8 +1966,6 @@ int yfs_fs_inline_bulk_status(struct afs_fs_cursor *fc,
  */
 static int yfs_deliver_fs_fetch_opaque_acl(struct afs_call *call)
 {
-	struct afs_volsync *volsync = call->out_volsync;
-	struct afs_vnode *vnode = call->xvnode;
 	struct yfs_acl *yacl = call->out_yacl;
 	struct afs_acl *acl;
 	const __be32 *bp;
@@ -2291,11 +2051,10 @@ static int yfs_deliver_fs_fetch_opaque_acl(struct afs_call *call)
 		bp = call->buffer;
 		yacl->inherit_flag = ntohl(*bp++);
 		yacl->num_cleaned = ntohl(*bp++);
-		ret = yfs_decode_status(call, &bp, &vnode->status, vnode,
-					&call->expected_version, NULL);
+		ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
 		if (ret < 0)
 			return ret;
-		xdr_decode_YFSVolSync(&bp, volsync);
+		xdr_decode_YFSVolSync(&bp, call->out_volsync);
 
 		call->unmarshall++;
 
@@ -2330,7 +2089,8 @@ static const struct afs_call_type yfs_RXYFSFetchOpaqueACL = {
  * Fetch the YFS advanced ACLs for a file.
  */
 struct yfs_acl *yfs_fs_fetch_opaque_acl(struct afs_fs_cursor *fc,
-					struct yfs_acl *yacl)
+					struct yfs_acl *yacl,
+					struct afs_status_cb *scb)
 {
 	struct afs_vnode *vnode = fc->vnode;
 	struct afs_call *call;
@@ -2353,8 +2113,8 @@ struct yfs_acl *yfs_fs_fetch_opaque_acl(struct afs_fs_cursor *fc,
 
 	call->key = fc->key;
 	call->out_yacl = yacl;
-	call->xvnode = vnode;
-	call->out_volsync = NULL; /* volsync */
+	call->out_scb = scb;
+	call->out_volsync = NULL;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -2363,7 +2123,6 @@ struct yfs_acl *yfs_fs_fetch_opaque_acl(struct afs_fs_cursor *fc,
 	bp = xdr_encode_YFSFid(bp, &vnode->fid);
 	yfs_check_req(call, bp);
 
-	call->cb_break = fc->cb_break;
 	afs_use_fs_server(call, fc->cbi);
 	trace_afs_make_fs_call(call, &vnode->fid);
 	afs_make_call(&fc->ac, call, GFP_KERNEL);
@@ -2383,7 +2142,8 @@ static const struct afs_call_type yfs_RXYFSStoreOpaqueACL2 = {
 /*
  * Fetch the YFS ACL for a file.
  */
-int yfs_fs_store_opaque_acl2(struct afs_fs_cursor *fc, const struct afs_acl *acl)
+int yfs_fs_store_opaque_acl2(struct afs_fs_cursor *fc, const struct afs_acl *acl,
+			     struct afs_status_cb *scb)
 {
 	struct afs_vnode *vnode = fc->vnode;
 	struct afs_call *call;
@@ -2407,7 +2167,7 @@ int yfs_fs_store_opaque_acl2(struct afs_fs_cursor *fc, const struct afs_acl *acl
 	}
 
 	call->key = fc->key;
-	call->xvnode = vnode;
+	call->out_scb = scb;
 	call->out_volsync = NULL;
 
 	/* marshall the parameters */


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
