Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9AC1FBFC
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 22:59:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E5NR+vAARFyZ7IEUs4r6oQKr8WgyMihEosQrAcHpW/o=; b=c8xal1jyIMuOzG
	IRokIFCPkMSNrTtiO8AzZjqUQgRvppRE6Lt2ySGMkRYdtTQ3kQO7WXEkMovFntypEzU52hHDNl89y
	boe/WNsfU2pGnXuEH/byevX5syE9I+ZS95R6hHM4pXEK1J/zpPwKlO/NGzsAs4mKjT1Duv9R9yTRA
	p9nK2v8qegmx/KKDdTogY9bFt0R/pymIxBCPGN8Y2uhS6P7SMrAa4nN2VPY8EfK1HdQJqPBphdMJs
	3LVZGj8JXe6g/yMfcpGaoTbZDStc7cMomEgd55AGIWrPn45RxU2dMS2PJdfqDQRejZEKnQBpVaBNT
	JYgS0KaaX1BGyzlT2Srg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hR107-00032R-Qu; Wed, 15 May 2019 20:59:47 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hR104-00031s-9l
 for linux-afs@lists.infradead.org; Wed, 15 May 2019 20:59:46 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 16DEE30001EB;
 Wed, 15 May 2019 20:59:44 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0002D1001943;
 Wed, 15 May 2019 20:59:42 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 11/12] afs: Pass pre-fetch server and volume break counts
 into afs_iget5_set()
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 15 May 2019 21:59:42 +0100
Message-ID: <155795398223.28355.14958676531935720902.stgit@warthog.procyon.org.uk>
In-Reply-To: <155795389933.28355.4028912870853910492.stgit@warthog.procyon.org.uk>
References: <155795389933.28355.4028912870853910492.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Wed, 15 May 2019 20:59:44 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_135944_376102_613A4389 
X-CRM114-Status: GOOD (  19.43  )
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

Pass the server and volume break counts from before the status fetch
operation that queried the attributes of a file into afs_iget5_set() so
that the new vnode's break counters can be initialised appropriately.

This allows detection of a volume or server break that happened whilst we
were fetching the status or setting up the vnode.

Fixes: c435ee34551e ("afs: Overhaul the callback handling")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/dir.c      |   58 +++++++++++++++++++++++++++++++++++------------------
 fs/afs/inode.c    |   51 +++++++++++++++++++++++++++--------------------
 fs/afs/internal.h |    4 +++-
 fs/afs/super.c    |   14 +++++++------
 4 files changed, 78 insertions(+), 49 deletions(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index d1b3736a3bbd..9e42f6c75747 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -641,7 +641,7 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 	struct afs_cb_interest *dcbi, *cbi = NULL;
 	struct afs_super_info *as = dir->i_sb->s_fs_info;
 	struct afs_status_cb *scb;
-	struct afs_iget_data data;
+	struct afs_iget_data iget_data;
 	struct afs_fs_cursor fc;
 	struct afs_server *server;
 	struct afs_vnode *dvnode = AFS_FS_I(dir);
@@ -684,9 +684,12 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 		goto out;
 
 	/* Check to see if we already have an inode for the primary fid. */
-	data.volume = dvnode->volume;
-	data.fid = cookie->fids[0];
-	inode = ilookup5(dir->i_sb, cookie->fids[0].vnode, afs_iget5_test, &data);
+	iget_data.fid = cookie->fids[0];
+	iget_data.volume = dvnode->volume;
+	iget_data.cb_v_break = dvnode->volume->cb_v_break;
+	iget_data.cb_s_break = 0;
+	inode = ilookup5(dir->i_sb, cookie->fids[0].vnode,
+			 afs_iget5_test, &iget_data);
 	if (inode)
 		goto out;
 
@@ -713,6 +716,8 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 				fc.ac.error = -ECONNABORTED;
 				break;
 			}
+			iget_data.cb_v_break = dvnode->volume->cb_v_break;
+			iget_data.cb_s_break = fc.cbi->server->cb_s_break;
 			afs_fs_inline_bulk_status(&fc,
 						  afs_v2net(dvnode),
 						  cookie->fids,
@@ -741,6 +746,8 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 	inode = ERR_PTR(-ERESTARTSYS);
 	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
 		while (afs_select_fileserver(&fc)) {
+			iget_data.cb_v_break = dvnode->volume->cb_v_break;
+			iget_data.cb_s_break = fc.cbi->server->cb_s_break;
 			scb = &cookie->statuses[0];
 			afs_fs_fetch_status(&fc,
 					    afs_v2net(dvnode),
@@ -775,8 +782,8 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 		if (scb->status.abort_code != 0)
 			continue;
 
-		ti = afs_iget(dir->i_sb, key, &cookie->fids[i],
-			      scb, cbi, dvnode);
+		iget_data.fid = cookie->fids[i];
+		ti = afs_iget(dir->i_sb, key, &iget_data, scb, cbi, dvnode);
 		if (i == 0) {
 			inode = ti;
 		} else {
@@ -1112,7 +1119,7 @@ void afs_d_release(struct dentry *dentry)
  */
 static void afs_vnode_new_inode(struct afs_fs_cursor *fc,
 				struct dentry *new_dentry,
-				struct afs_fid *newfid,
+				struct afs_iget_data *new_data,
 				struct afs_status_cb *new_scb)
 {
 	struct afs_vnode *vnode;
@@ -1122,7 +1129,7 @@ static void afs_vnode_new_inode(struct afs_fs_cursor *fc,
 		return;
 
 	inode = afs_iget(fc->vnode->vfs_inode.i_sb, fc->key,
-			 newfid, new_scb, fc->cbi, fc->vnode);
+			 new_data, new_scb, fc->cbi, fc->vnode);
 	if (IS_ERR(inode)) {
 		/* ENOMEM or EINTR at a really inconvenient time - just abandon
 		 * the new directory on the server.
@@ -1138,15 +1145,23 @@ static void afs_vnode_new_inode(struct afs_fs_cursor *fc,
 	d_instantiate(new_dentry, inode);
 }
 
+static void afs_prep_for_new_inode(struct afs_fs_cursor *fc,
+				   struct afs_iget_data *iget_data)
+{
+	iget_data->volume = fc->vnode->volume;
+	iget_data->cb_v_break = fc->vnode->volume->cb_v_break;
+	iget_data->cb_s_break = fc->cbi->server->cb_s_break;
+}
+
 /*
  * create a directory on an AFS filesystem
  */
 static int afs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 {
+	struct afs_iget_data iget_data;
 	struct afs_status_cb *scb;
 	struct afs_fs_cursor fc;
 	struct afs_vnode *dvnode = AFS_FS_I(dir);
-	struct afs_fid newfid;
 	struct key *key;
 	int ret;
 
@@ -1172,14 +1187,15 @@ static int afs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
+			afs_prep_for_new_inode(&fc, &iget_data);
 			afs_fs_create(&fc, dentry->d_name.name, mode,
-				      &scb[0], &newfid, &scb[1]);
+				      &scb[0], &iget_data.fid, &scb[1]);
 		}
 
 		afs_check_for_remote_deletion(&fc, dvnode);
 		afs_vnode_commit_status(&fc, dvnode, fc.cb_break,
 					&data_version, &scb[0]);
-		afs_vnode_new_inode(&fc, dentry, &newfid, &scb[1]);
+		afs_vnode_new_inode(&fc, dentry, &iget_data, &scb[1]);
 		ret = afs_end_vnode_operation(&fc);
 		if (ret < 0)
 			goto error_key;
@@ -1189,7 +1205,7 @@ static int afs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 
 	if (ret == 0 &&
 	    test_bit(AFS_VNODE_DIR_VALID, &dvnode->flags))
-		afs_edit_dir_add(dvnode, &dentry->d_name, &newfid,
+		afs_edit_dir_add(dvnode, &dentry->d_name, &iget_data.fid,
 				 afs_edit_dir_for_create);
 
 	key_put(key);
@@ -1439,10 +1455,10 @@ static int afs_unlink(struct inode *dir, struct dentry *dentry)
 static int afs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 		      bool excl)
 {
+	struct afs_iget_data iget_data;
 	struct afs_fs_cursor fc;
 	struct afs_status_cb *scb;
 	struct afs_vnode *dvnode = AFS_FS_I(dir);
-	struct afs_fid newfid;
 	struct key *key;
 	int ret;
 
@@ -1472,14 +1488,15 @@ static int afs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
+			afs_prep_for_new_inode(&fc, &iget_data);
 			afs_fs_create(&fc, dentry->d_name.name, mode,
-				      &scb[0], &newfid, &scb[1]);
+				      &scb[0], &iget_data.fid, &scb[1]);
 		}
 
 		afs_check_for_remote_deletion(&fc, dvnode);
 		afs_vnode_commit_status(&fc, dvnode, fc.cb_break,
 					&data_version, &scb[0]);
-		afs_vnode_new_inode(&fc, dentry, &newfid, &scb[1]);
+		afs_vnode_new_inode(&fc, dentry, &iget_data, &scb[1]);
 		ret = afs_end_vnode_operation(&fc);
 		if (ret < 0)
 			goto error_key;
@@ -1488,7 +1505,7 @@ static int afs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 	}
 
 	if (test_bit(AFS_VNODE_DIR_VALID, &dvnode->flags))
-		afs_edit_dir_add(dvnode, &dentry->d_name, &newfid,
+		afs_edit_dir_add(dvnode, &dentry->d_name, &iget_data.fid,
 				 afs_edit_dir_for_create);
 
 	kfree(scb);
@@ -1595,10 +1612,10 @@ static int afs_link(struct dentry *from, struct inode *dir,
 static int afs_symlink(struct inode *dir, struct dentry *dentry,
 		       const char *content)
 {
+	struct afs_iget_data iget_data;
 	struct afs_fs_cursor fc;
 	struct afs_status_cb *scb;
 	struct afs_vnode *dvnode = AFS_FS_I(dir);
-	struct afs_fid newfid;
 	struct key *key;
 	int ret;
 
@@ -1631,14 +1648,15 @@ static int afs_symlink(struct inode *dir, struct dentry *dentry,
 
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
+			afs_prep_for_new_inode(&fc, &iget_data);
 			afs_fs_symlink(&fc, dentry->d_name.name, content,
-				       &scb[0], &newfid, &scb[1]);
+				       &scb[0], &iget_data.fid, &scb[1]);
 		}
 
 		afs_check_for_remote_deletion(&fc, dvnode);
 		afs_vnode_commit_status(&fc, dvnode, fc.cb_break,
 					&data_version, &scb[0]);
-		afs_vnode_new_inode(&fc, dentry, &newfid, &scb[1]);
+		afs_vnode_new_inode(&fc, dentry, &iget_data, &scb[1]);
 		ret = afs_end_vnode_operation(&fc);
 		if (ret < 0)
 			goto error_key;
@@ -1647,7 +1665,7 @@ static int afs_symlink(struct inode *dir, struct dentry *dentry,
 	}
 
 	if (test_bit(AFS_VNODE_DIR_VALID, &dvnode->flags))
-		afs_edit_dir_add(dvnode, &dentry->d_name, &newfid,
+		afs_edit_dir_add(dvnode, &dentry->d_name, &iget_data.fid,
 				 afs_edit_dir_for_symlink);
 
 	key_put(key);
diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 031fe9cb5ccb..70d8c02d69ca 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -346,10 +346,10 @@ int afs_fetch_status(struct afs_vnode *vnode, struct key *key, bool is_new,
  */
 int afs_iget5_test(struct inode *inode, void *opaque)
 {
-	struct afs_iget_data *data = opaque;
+	struct afs_iget_data *iget_data = opaque;
 	struct afs_vnode *vnode = AFS_FS_I(inode);
 
-	return memcmp(&vnode->fid, &data->fid, sizeof(data->fid)) == 0;
+	return memcmp(&vnode->fid, &iget_data->fid, sizeof(iget_data->fid)) == 0;
 }
 
 /*
@@ -367,17 +367,19 @@ static int afs_iget5_pseudo_dir_test(struct inode *inode, void *opaque)
  */
 static int afs_iget5_set(struct inode *inode, void *opaque)
 {
-	struct afs_iget_data *data = opaque;
+	struct afs_iget_data *iget_data = opaque;
 	struct afs_vnode *vnode = AFS_FS_I(inode);
 
-	vnode->fid = data->fid;
-	vnode->volume = data->volume;
+	vnode->fid		= iget_data->fid;
+	vnode->volume		= iget_data->volume;
+	vnode->cb_v_break	= iget_data->cb_v_break;
+	vnode->cb_s_break	= iget_data->cb_s_break;
 
 	/* YFS supports 96-bit vnode IDs, but Linux only supports
 	 * 64-bit inode numbers.
 	 */
-	inode->i_ino = data->fid.vnode;
-	inode->i_generation = data->fid.unique;
+	inode->i_ino		= iget_data->fid.vnode;
+	inode->i_generation	= iget_data->fid.unique;
 	return 0;
 }
 
@@ -387,38 +389,42 @@ static int afs_iget5_set(struct inode *inode, void *opaque)
  */
 struct inode *afs_iget_pseudo_dir(struct super_block *sb, bool root)
 {
-	struct afs_iget_data data;
 	struct afs_super_info *as;
 	struct afs_vnode *vnode;
 	struct inode *inode;
 	static atomic_t afs_autocell_ino;
 
+	struct afs_iget_data iget_data = {
+		.cb_v_break = 0,
+		.cb_s_break = 0,
+	};
+
 	_enter("");
 
 	as = sb->s_fs_info;
 	if (as->volume) {
-		data.volume = as->volume;
-		data.fid.vid = as->volume->vid;
+		iget_data.volume = as->volume;
+		iget_data.fid.vid = as->volume->vid;
 	}
 	if (root) {
-		data.fid.vnode = 1;
-		data.fid.unique = 1;
+		iget_data.fid.vnode = 1;
+		iget_data.fid.unique = 1;
 	} else {
-		data.fid.vnode = atomic_inc_return(&afs_autocell_ino);
-		data.fid.unique = 0;
+		iget_data.fid.vnode = atomic_inc_return(&afs_autocell_ino);
+		iget_data.fid.unique = 0;
 	}
 
-	inode = iget5_locked(sb, data.fid.vnode,
+	inode = iget5_locked(sb, iget_data.fid.vnode,
 			     afs_iget5_pseudo_dir_test, afs_iget5_set,
-			     &data);
+			     &iget_data);
 	if (!inode) {
 		_leave(" = -ENOMEM");
 		return ERR_PTR(-ENOMEM);
 	}
 
 	_debug("GOT INODE %p { ino=%lu, vl=%llx, vn=%llx, u=%x }",
-	       inode, inode->i_ino, data.fid.vid, data.fid.vnode,
-	       data.fid.unique);
+	       inode, inode->i_ino, iget_data.fid.vid, iget_data.fid.vnode,
+	       iget_data.fid.unique);
 
 	vnode = AFS_FS_I(inode);
 
@@ -489,23 +495,24 @@ static void afs_get_inode_cache(struct afs_vnode *vnode)
  * inode retrieval
  */
 struct inode *afs_iget(struct super_block *sb, struct key *key,
-		       struct afs_fid *fid, struct afs_status_cb *scb,
+		       struct afs_iget_data *iget_data,
+		       struct afs_status_cb *scb,
 		       struct afs_cb_interest *cbi,
 		       struct afs_vnode *parent_vnode)
 {
-	struct afs_iget_data data = { .fid = *fid };
 	struct afs_super_info *as;
 	struct afs_vnode *vnode;
+	struct afs_fid *fid = &iget_data->fid;
 	struct inode *inode;
 	int ret;
 
 	_enter(",{%llx:%llu.%u},,", fid->vid, fid->vnode, fid->unique);
 
 	as = sb->s_fs_info;
-	data.volume = as->volume;
+	iget_data->volume = as->volume;
 
 	inode = iget5_locked(sb, fid->vnode, afs_iget5_test, afs_iget5_set,
-			     &data);
+			     iget_data);
 	if (!inode) {
 		_leave(" = -ENOMEM");
 		return ERR_PTR(-ENOMEM);
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 1ce3dd9f81e3..9d246ada6ab5 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -66,6 +66,8 @@ struct afs_fs_context {
 struct afs_iget_data {
 	struct afs_fid		fid;
 	struct afs_volume	*volume;	/* volume on which resides */
+	unsigned int		cb_v_break;	/* Pre-fetch volume break count */
+	unsigned int		cb_s_break;	/* Pre-fetch server break count */
 };
 
 enum afs_call_state {
@@ -1022,7 +1024,7 @@ extern int afs_fetch_status(struct afs_vnode *, struct key *, bool, afs_access_t
 extern int afs_iget5_test(struct inode *, void *);
 extern struct inode *afs_iget_pseudo_dir(struct super_block *, bool);
 extern struct inode *afs_iget(struct super_block *, struct key *,
-			      struct afs_fid *, struct afs_status_cb *,
+			      struct afs_iget_data *, struct afs_status_cb *,
 			      struct afs_cb_interest *,
 			      struct afs_vnode *);
 extern void afs_zap_data(struct afs_vnode *);
diff --git a/fs/afs/super.c b/fs/afs/super.c
index f76473ad7bbb..f18911e8d770 100644
--- a/fs/afs/super.c
+++ b/fs/afs/super.c
@@ -426,7 +426,7 @@ static int afs_set_super(struct super_block *sb, struct fs_context *fc)
 static int afs_fill_super(struct super_block *sb, struct afs_fs_context *ctx)
 {
 	struct afs_super_info *as = AFS_FS_S(sb);
-	struct afs_fid fid;
+	struct afs_iget_data iget_data;
 	struct inode *inode = NULL;
 	int ret;
 
@@ -451,11 +451,13 @@ static int afs_fill_super(struct super_block *sb, struct afs_fs_context *ctx)
 	} else {
 		sprintf(sb->s_id, "%llu", as->volume->vid);
 		afs_activate_volume(as->volume);
-		fid.vid		= as->volume->vid;
-		fid.vnode	= 1;
-		fid.vnode_hi	= 0;
-		fid.unique	= 1;
-		inode = afs_iget(sb, ctx->key, &fid, NULL, NULL, NULL);
+		iget_data.fid.vid	= as->volume->vid;
+		iget_data.fid.vnode	= 1;
+		iget_data.fid.vnode_hi	= 0;
+		iget_data.fid.unique	= 1;
+		iget_data.cb_v_break	= as->volume->cb_v_break;
+		iget_data.cb_s_break	= 0;
+		inode = afs_iget(sb, ctx->key, &iget_data, NULL, NULL, NULL);
 	}
 
 	if (IS_ERR(inode))


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
