Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AD01E8B1E
	for <lists+linux-afs@lfdr.de>; Sat, 30 May 2020 00:16:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VkTZpoYQW6sKSyJjniqDRDihactSzuV6q0RbDh8jdrs=; b=HXn59t0dQZHaQr
	WMHBa/5o1uEGY9BCpke3KVZRfOg/wGIM852N/YtV5xTUhtSnx5hwFCpGRIenKauChiSuxUqBPj7T0
	Ux8WstNYpy5+5KLwhgKsbkFr12oKbiaZYWbs3j+QK38G8sq+aNDvTYWPmZpRIod49w7O5b/zZyi1T
	2w6tTxxGrqDOSmw/AzQAGVp3+hcBAjTosvUPlsKY0odfFKFkw0W3j4Q80PE94fqBRMrmBjNs9xMIp
	+/Rifz3+FBIGezR/xepfroz1LbsAOdSU0xuzew1fm0HYfmTA+ms52gU23e3Gtml2ntM4brkV+vU8t
	BTHlt/zbfP6GBi+rDH+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jenIw-00030t-J2; Fri, 29 May 2020 22:16:42 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jen4W-000225-Pj
 for linux-afs@lists.infradead.org; Fri, 29 May 2020 22:01:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590789707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l6oENBJvGnroIEYGF28LRJEAbObuEsymhxKGJyKBb6k=;
 b=RxjwN8UUPzuiwP4isO2ZSXiRJ3Wh60WBKaHF//zCjqfsii/em7qOxTA4wMrxYP9H9ZdWDo
 GVZn4w8TOKYF1hRp1LBbM965Ni5cJC/xDBtP34AG/9FMaeM0JX4T09OYVmuoHYtXYlA6FH
 krpPtnEtOE7193jgR5EAV1p/+TnmYLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-UvZD5JjlMi62oYYCcKrAGw-1; Fri, 29 May 2020 18:01:43 -0400
X-MC-Unique: UvZD5JjlMi62oYYCcKrAGw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20A3C18A8220;
 Fri, 29 May 2020 22:01:42 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5744B60BF1;
 Fri, 29 May 2020 22:01:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 13/27] afs: Build an abstraction around an "operation" concept
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 29 May 2020 23:01:39 +0100
Message-ID: <159078969953.679399.8030241834698618651.stgit@warthog.procyon.org.uk>
In-Reply-To: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
References: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Spam-Note: CRM114 run bypassed due to message size (268321 bytes)
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.61 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
 information
X-Mailman-Approved-At: Fri, 29 May 2020 15:16:40 -0700
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
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Turn the afs_operation struct into the main way that most fileserver
operations are managed.  Various things are added to the struct, including
the following:

 (1) All the parameters and results of the relevant operations are moved
     into it, removing corresponding fields from the afs_call struct.
     afs_call gets a pointer to the op.

 (2) The target volume is made the main focus of the operation, rather than
     the target vnode(s), and a bunch of op->vnode->volume are made
     op->volume instead.

 (3) Two vnode records are defined (op->file[]) for the vnode(s) involved
     in most operations.  The vnode record (struct afs_vnode_param)
     contains:

	- The vnode pointer.

	- The fid of the vnode to be included in the parameters or that was
          returned in the reply (eg. FS.MakeDir).

	- The status and callback information that may be returned in the
     	  reply about the vnode.

	- Callback break and data version tracking for detecting
          simultaneous third-parth changes.

 (4) Pointers to dentries to be updated with new inodes.

 (5) An operations table pointer.  The table includes pointers to functions
     for issuing AFS and YFS-variant RPCs, handling the success and abort
     of an operation and handling post-I/O-lock local editing of a
     directory.

To make this work, the following function restructuring is made:

 (A) The rotation loop that issues calls to fileservers that can be found
     in each function that wants to issue an RPC (such as afs_mkdir()) is
     extracted out into common code, in a new file called fs_operation.c.

 (B) The rotation loops, such as the one in afs_mkdir(), are replaced with
     a much smaller piece of code that allocates an operation, sets the
     parameters and then calls out to the common code to do the actual
     work.

 (C) The code for handling the success and failure of an operation are
     moved into operation functions (as (5) above) and these are called
     from the core code at appropriate times.

 (D) The pseudo inode getting stuff used by the dynamic root code is moved
     over into dynroot.c.

 (E) struct afs_iget_data is absorbed into the operation struct and
     afs_iget() expects to be given an op pointer and a vnode record.

 (F) Point (E) doesn't work for the root dir of a volume, but we know the
     FID in advance (it's always vnode 1, unique 1), so a separate inode
     getter, afs_root_iget(), is provided to special-case that.

 (G) The inode status init/update functions now also take an op and a vnode
     record.

 (H) The RPC marshalling functions now, for the most part, just take an
     afs_operation struct as their only argument.  All the data they need
     is held there.  The result delivery functions write their answers
     there as well.

 (I) The call is attached to the operation and then the operation core does
     the waiting.

And then the new operation code is, for the moment, made to just initialise
the operation, get the appropriate vnode I/O locks and do the same rotation
loop as before.

This lays the foundation for the following changes in the future:

 (*) Overhauling the rotation (again).

 (*) Support for asynchronous I/O, where the fileserver rotation must be
     done asynchronously also.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/Makefile            |    1 
 fs/afs/afs.h               |    1 
 fs/afs/callback.c          |    7 
 fs/afs/dir.c               | 1211 ++++++++++++++++++++------------------------
 fs/afs/dir_silly.c         |  190 ++++---
 fs/afs/dynroot.c           |   93 +++
 fs/afs/file.c              |   62 +-
 fs/afs/flock.c             |  114 ++--
 fs/afs/fs_operation.c      |  246 +++++++++
 fs/afs/fsclient.c          | 1192 ++++++++++++++++++-------------------------
 fs/afs/inode.c             |  440 +++++++---------
 fs/afs/internal.h          |  313 +++++++----
 fs/afs/rotate.c            |  126 +----
 fs/afs/rxrpc.c             |   28 +
 fs/afs/server.c            |   37 +
 fs/afs/super.c             |   77 +--
 fs/afs/volume.c            |   12 
 fs/afs/write.c             |  148 +++--
 fs/afs/xattr.c             |  300 +++++------
 fs/afs/yfsclient.c         |  844 +++++++++++++------------------
 include/trace/events/afs.h |   19 -
 21 files changed, 2646 insertions(+), 2815 deletions(-)
 create mode 100644 fs/afs/fs_operation.c

diff --git a/fs/afs/Makefile b/fs/afs/Makefile
index 10359bea7070..924f02e9d7e7 100644
--- a/fs/afs/Makefile
+++ b/fs/afs/Makefile
@@ -18,6 +18,7 @@ kafs-y := \
 	file.o \
 	flock.o \
 	fsclient.o \
+	fs_operation.o \
 	fs_probe.o \
 	inode.o \
 	main.o \
diff --git a/fs/afs/afs.h b/fs/afs/afs.h
index b6d49d646ade..f8e34406243e 100644
--- a/fs/afs/afs.h
+++ b/fs/afs/afs.h
@@ -146,7 +146,6 @@ struct afs_file_status {
 struct afs_status_cb {
 	struct afs_file_status	status;
 	struct afs_callback	callback;
-	unsigned int		cb_break;	/* Pre-op callback break counter */
 	bool			have_status;	/* True if status record was retrieved */
 	bool			have_cb;	/* True if cb record was retrieved */
 	bool			have_error;	/* True if status.abort_code indicates an error */
diff --git a/fs/afs/callback.c b/fs/afs/callback.c
index b16781e1683e..282dbac84435 100644
--- a/fs/afs/callback.c
+++ b/fs/afs/callback.c
@@ -46,7 +46,6 @@ static struct afs_cb_interest *afs_create_interest(struct afs_server *server,
 
 	refcount_set(&new->usage, 1);
 	new->sb = vnode->vfs_inode.i_sb;
-	new->vid = vnode->volume->vid;
 	new->server = afs_get_server(server, afs_server_trace_get_new_cbi);
 	INIT_HLIST_NODE(&new->cb_vlink);
 
@@ -286,7 +285,6 @@ static void afs_break_one_callback(struct afs_server *server,
 				   struct afs_vol_interest *vi)
 {
 	struct afs_cb_interest *cbi;
-	struct afs_iget_data data;
 	struct afs_vnode *vnode;
 	struct inode *inode;
 
@@ -305,15 +303,12 @@ static void afs_break_one_callback(struct afs_server *server,
 					   afs_cb_break_for_volume_callback, false);
 			write_unlock(&volume->cb_v_break_lock);
 		} else {
-			data.volume = NULL;
-			data.fid = *fid;
-
 			/* See if we can find a matching inode - even an I_NEW
 			 * inode needs to be marked as it can have its callback
 			 * broken before we finish setting up the local inode.
 			 */
 			inode = find_inode_rcu(cbi->sb, fid->vnode,
-					       afs_iget5_test, &data);
+					       afs_ilookup5_test_by_fid, fid);
 			if (inode) {
 				vnode = AFS_FS_I(inode);
 				afs_break_callback(vnode, afs_cb_break_for_callback);
diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index ff421db40cf2..3bc970598851 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -99,8 +99,6 @@ struct afs_lookup_cookie {
 	bool			found;
 	bool			one_only;
 	unsigned short		nr_fids;
-	struct inode		**inodes;
-	struct afs_status_cb	*statuses;
 	struct afs_fid		fids[50];
 };
 
@@ -618,8 +616,8 @@ static int afs_lookup_filldir(struct dir_context *ctx, const char *name,
 		}
 	} else if (cookie->name.len == nlen &&
 		   memcmp(cookie->name.name, name, nlen) == 0) {
-		cookie->fids[0].vnode	= ino;
-		cookie->fids[0].unique	= dtype;
+		cookie->fids[1].vnode	= ino;
+		cookie->fids[1].unique	= dtype;
 		cookie->found = 1;
 		if (cookie->one_only)
 			return -1;
@@ -630,6 +628,80 @@ static int afs_lookup_filldir(struct dir_context *ctx, const char *name,
 	return ret;
 }
 
+/*
+ * Deal with the result of a successful lookup operation.  Turn all the files
+ * into inodes and save the first one - which is the one we actually want.
+ */
+static void afs_do_lookup_success(struct afs_operation *op)
+{
+	struct afs_vnode_param *vp;
+	struct afs_vnode *vnode;
+	struct inode *inode;
+	u32 abort_code;
+	int i;
+
+	_enter("");
+
+	for (i = 0; i < op->nr_files; i++) {
+		switch (i) {
+		case 0:
+			vp = &op->file[0];
+			abort_code = vp->scb.status.abort_code;
+			if (abort_code != 0) {
+				op->abort_code = abort_code;
+				op->error = afs_abort_to_error(abort_code);
+			}
+			break;
+
+		case 1:
+			vp = &op->file[1];
+			break;
+
+		default:
+			vp = &op->more_files[i - 2];
+			break;
+		}
+
+		if (!vp->scb.have_status && !vp->scb.have_error)
+			continue;
+
+		_debug("do [%u]", i);
+		if (vp->vnode) {
+			if (!test_bit(AFS_VNODE_UNSET, &vp->vnode->flags))
+				afs_vnode_commit_status(op, vp);
+		} else if (vp->scb.status.abort_code == 0) {
+			inode = afs_iget(op, vp);
+			if (!IS_ERR(inode)) {
+				vnode = AFS_FS_I(inode);
+				afs_cache_permit(vnode, op->key,
+						 0 /* Assume vnode->cb_break is 0 */ +
+						 op->cb_v_break,
+						 &vp->scb);
+				vp->vnode = vnode;
+				vp->put_vnode = true;
+			}
+		} else {
+			_debug("- abort %d %llx:%llx.%x",
+			       vp->scb.status.abort_code,
+			       vp->fid.vid, vp->fid.vnode, vp->fid.unique);
+		}
+	}
+
+	_leave("");
+}
+
+static const struct afs_operation_ops afs_inline_bulk_status_operation = {
+	.issue_afs_rpc	= afs_fs_inline_bulk_status,
+	.issue_yfs_rpc	= yfs_fs_inline_bulk_status,
+	.success	= afs_do_lookup_success,
+};
+
+static const struct afs_operation_ops afs_fetch_status_operation = {
+	.issue_afs_rpc	= afs_fs_fetch_status,
+	.issue_yfs_rpc	= yfs_fs_fetch_status,
+	.success	= afs_do_lookup_success,
+};
+
 /*
  * Do a lookup in a directory.  We make use of bulk lookup to query a slew of
  * files in one go and create inodes for them.  The inode of the file we were
@@ -639,16 +711,15 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 				   struct key *key)
 {
 	struct afs_lookup_cookie *cookie;
-	struct afs_cb_interest *dcbi, *cbi = NULL;
-	struct afs_super_info *as = dir->i_sb->s_fs_info;
-	struct afs_status_cb *scb;
-	struct afs_iget_data iget_data;
-	struct afs_operation fc;
+	struct afs_cb_interest *dcbi;
+	struct afs_vnode_param *vp;
+	struct afs_operation *op;
 	struct afs_server *server;
 	struct afs_vnode *dvnode = AFS_FS_I(dir), *vnode;
 	struct inode *inode = NULL, *ti;
 	afs_dataversion_t data_version = READ_ONCE(dvnode->status.data_version);
-	int ret, i;
+	long ret;
+	int i;
 
 	_enter("{%lu},%p{%pd},", dir->i_ino, dentry, dentry);
 
@@ -656,6 +727,8 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 	if (!cookie)
 		return ERR_PTR(-ENOMEM);
 
+	for (i = 0; i < ARRAY_SIZE(cookie->fids); i++)
+		cookie->fids[i].vid = dvnode->fid.vid;
 	cookie->ctx.actor = afs_lookup_filldir;
 	cookie->name = dentry->d_name;
 	cookie->nr_fids = 2; /* slot 0 is saved for the fid we actually want
@@ -672,61 +745,64 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 	}
 	read_sequnlock_excl(&dvnode->cb_lock);
 
-	for (i = 0; i < 50; i++)
-		cookie->fids[i].vid = as->volume->vid;
-
 	/* search the directory */
 	ret = afs_dir_iterate(dir, &cookie->ctx, key, &data_version);
-	if (ret < 0) {
-		inode = ERR_PTR(ret);
+	if (ret < 0)
 		goto out;
-	}
 
 	dentry->d_fsdata = (void *)(unsigned long)data_version;
 
-	inode = ERR_PTR(-ENOENT);
+	ret = -ENOENT;
 	if (!cookie->found)
 		goto out;
 
 	/* Check to see if we already have an inode for the primary fid. */
-	iget_data.fid = cookie->fids[0];
-	iget_data.volume = dvnode->volume;
-	iget_data.cb_v_break = dvnode->volume->cb_v_break;
-	iget_data.cb_s_break = 0;
-	inode = ilookup5(dir->i_sb, cookie->fids[0].vnode,
-			 afs_iget5_test, &iget_data);
+	inode = ilookup5(dir->i_sb, cookie->fids[1].vnode,
+			 afs_ilookup5_test_by_fid, &cookie->fids[1]);
 	if (inode)
-		goto out;
+		goto out; /* We do */
 
-	/* Need space for examining all the selected files */
-	inode = ERR_PTR(-ENOMEM);
-	cookie->statuses = kvcalloc(cookie->nr_fids, sizeof(struct afs_status_cb),
-				    GFP_KERNEL);
-	if (!cookie->statuses)
+	/* Okay, we didn't find it.  We need to query the server - and whilst
+	 * we're doing that, we're going to attempt to look up a bunch of other
+	 * vnodes also.
+	 */
+	op = afs_alloc_operation(NULL, dvnode->volume);
+	if (IS_ERR(op)) {
+		ret = PTR_ERR(op);
 		goto out;
+	}
 
-	cookie->inodes = kcalloc(cookie->nr_fids, sizeof(struct inode *),
-				 GFP_KERNEL);
-	if (!cookie->inodes)
-		goto out_s;
-
-	cookie->fids[1] = dvnode->fid;
-	cookie->statuses[1].cb_break = afs_calc_vnode_cb_break(dvnode);
-	cookie->inodes[1] = igrab(&dvnode->vfs_inode);
+	afs_op_set_vnode(op, 0, dvnode);
+	afs_op_set_fid(op, 1, &cookie->fids[1]);
 
-	for (i = 2; i < cookie->nr_fids; i++) {
-		scb = &cookie->statuses[i];
+	op->nr_files = cookie->nr_fids;
+	_debug("nr_files %u", op->nr_files);
 
-		/* Find any inodes that already exist and get their
-		 * callback counters.
-		 */
-		iget_data.fid = cookie->fids[i];
-		ti = ilookup5_nowait(dir->i_sb, iget_data.fid.vnode,
-				     afs_iget5_test, &iget_data);
-		if (!IS_ERR_OR_NULL(ti)) {
-			vnode = AFS_FS_I(ti);
-			scb->cb_break = afs_calc_vnode_cb_break(vnode);
-			cookie->inodes[i] = ti;
+	/* Need space for examining all the selected files */
+	op->error = -ENOMEM;
+	if (op->nr_files > 2) {
+		op->more_files = kvcalloc(op->nr_files - 2,
+					  sizeof(struct afs_vnode_param),
+					  GFP_KERNEL);
+		if (!op->more_files)
+			goto out_op;
+
+		for (i = 2; i < op->nr_files; i++) {
+			vp = &op->more_files[i - 2];
+			vp->fid = cookie->fids[i];
+
+			/* Find any inodes that already exist and get their
+			 * callback counters.
+			 */
+			ti = ilookup5_nowait(dir->i_sb, vp->fid.vnode,
+					     afs_ilookup5_test_by_fid, &vp->fid);
+			if (!IS_ERR_OR_NULL(ti)) {
+				vnode = AFS_FS_I(ti);
+				vp->dv_before = vnode->status.data_version;
+				vp->cb_break_before = afs_calc_vnode_cb_break(vnode);
+				vp->vnode = vnode;
+				vp->put_vnode = true;
+			}
 		}
 	}
 
@@ -734,120 +810,40 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 	 * lookups contained therein are stored in the reply without aborting
 	 * the whole operation.
 	 */
-	if (cookie->one_only)
-		goto no_inline_bulk_status;
-
-	inode = ERR_PTR(-ERESTARTSYS);
-	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
-		while (afs_select_fileserver(&fc)) {
-			if (test_bit(AFS_SERVER_FL_NO_IBULK,
-				      &fc.cbi->server->flags)) {
-				fc.ac.abort_code = RX_INVALID_OPERATION;
-				fc.ac.error = -ECONNABORTED;
-				break;
-			}
-			iget_data.cb_v_break = dvnode->volume->cb_v_break;
-			iget_data.cb_s_break = fc.cbi->server->cb_s_break;
-			afs_fs_inline_bulk_status(&fc,
-						  afs_v2net(dvnode),
-						  cookie->fids,
-						  cookie->statuses,
-						  cookie->nr_fids, NULL);
-		}
-
-		if (fc.ac.error == 0)
-			cbi = afs_get_cb_interest(fc.cbi);
-		if (fc.ac.abort_code == RX_INVALID_OPERATION)
-			set_bit(AFS_SERVER_FL_NO_IBULK, &fc.cbi->server->flags);
-		inode = ERR_PTR(afs_end_vnode_operation(&fc));
+	op->error = -ENOTSUPP;
+	if (!cookie->one_only) {
+		op->ops = &afs_inline_bulk_status_operation;
+		afs_begin_vnode_operation(op);
+		afs_wait_for_operation(op);
 	}
 
-	if (!IS_ERR(inode))
-		goto success;
-	if (fc.ac.abort_code != RX_INVALID_OPERATION)
-		goto out_c;
-
-no_inline_bulk_status:
-	/* We could try FS.BulkStatus next, but this aborts the entire op if
-	 * any of the lookups fails - so, for the moment, revert to
-	 * FS.FetchStatus for just the primary fid.
-	 */
-	inode = ERR_PTR(-ERESTARTSYS);
-	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
-		while (afs_select_fileserver(&fc)) {
-			iget_data.cb_v_break = dvnode->volume->cb_v_break;
-			iget_data.cb_s_break = fc.cbi->server->cb_s_break;
-			scb = &cookie->statuses[0];
-			afs_fs_fetch_status(&fc,
-					    afs_v2net(dvnode),
-					    cookie->fids,
-					    scb,
-					    NULL);
-		}
-
-		if (fc.ac.error == 0)
-			cbi = afs_get_cb_interest(fc.cbi);
-		inode = ERR_PTR(afs_end_vnode_operation(&fc));
+	if (op->error == -ENOTSUPP) {
+		/* We could try FS.BulkStatus next, but this aborts the entire
+		 * op if any of the lookups fails - so, for the moment, revert
+		 * to FS.FetchStatus for op->file[1].
+		 */
+		op->fetch_status.which = 1;
+		op->ops = &afs_fetch_status_operation;
+		afs_begin_vnode_operation(op);
+		afs_wait_for_operation(op);
 	}
+	inode = ERR_PTR(op->error);
 
-	if (IS_ERR(inode))
-		goto out_c;
-
-success:
-	/* Turn all the files into inodes and save the first one - which is the
-	 * one we actually want.
-	 */
-	scb = &cookie->statuses[0];
-	if (scb->status.abort_code != 0)
-		inode = ERR_PTR(afs_abort_to_error(scb->status.abort_code));
-
-	for (i = 0; i < cookie->nr_fids; i++) {
-		struct afs_status_cb *scb = &cookie->statuses[i];
-
-		if (!scb->have_status && !scb->have_error)
-			continue;
-
-		if (cookie->inodes[i]) {
-			struct afs_vnode *iv = AFS_FS_I(cookie->inodes[i]);
-
-			if (test_bit(AFS_VNODE_UNSET, &iv->flags))
-				continue;
-
-			afs_vnode_commit_status(&fc, iv,
-						scb->cb_break, NULL, scb);
-			continue;
-		}
-
-		if (scb->status.abort_code != 0)
-			continue;
-
-		iget_data.fid = cookie->fids[i];
-		ti = afs_iget(dir->i_sb, key, &iget_data, scb, cbi, dvnode);
-		if (!IS_ERR(ti))
-			afs_cache_permit(AFS_FS_I(ti), key,
-					 0 /* Assume vnode->cb_break is 0 */ +
-					 iget_data.cb_v_break,
-					 scb);
-		if (i == 0) {
-			inode = ti;
-		} else {
-			if (!IS_ERR(ti))
-				iput(ti);
-		}
+out_op:
+	if (op->error == 0) {
+		inode = &op->file[1].vnode->vfs_inode;
+		op->file[1].vnode = NULL;
 	}
 
-out_c:
-	afs_put_cb_interest(afs_v2net(dvnode), cbi);
-	if (cookie->inodes) {
-		for (i = 0; i < cookie->nr_fids; i++)
-			iput(cookie->inodes[i]);
-		kfree(cookie->inodes);
-	}
-out_s:
-	kvfree(cookie->statuses);
+	if (op->file[0].scb.have_status)
+		dentry->d_fsdata = (void *)(unsigned long)op->file[0].scb.status.data_version;
+	else
+		dentry->d_fsdata = (void *)(unsigned long)op->file[0].dv_before;
+	ret = afs_put_operation(op);
 out:
 	kfree(cookie);
-	return inode;
+	_leave("");
+	return inode ?: ERR_PTR(ret);
 }
 
 /*
@@ -963,6 +959,7 @@ static struct dentry *afs_lookup(struct inode *dir, struct dentry *dentry,
 	if (!IS_ERR_OR_NULL(inode))
 		fid = AFS_FS_I(inode)->fid;
 
+	_debug("splice %px", dentry->d_inode);
 	d = d_splice_alias(inode, dentry);
 	if (!IS_ERR_OR_NULL(d)) {
 		d->d_fsdata = dentry->d_fsdata;
@@ -970,6 +967,7 @@ static struct dentry *afs_lookup(struct inode *dir, struct dentry *dentry,
 	} else {
 		trace_afs_lookup(dvnode, &dentry->d_name, &fid);
 	}
+	_leave("");
 	return d;
 }
 
@@ -1220,130 +1218,97 @@ void afs_d_release(struct dentry *dentry)
 /*
  * Create a new inode for create/mkdir/symlink
  */
-static void afs_vnode_new_inode(struct afs_operation *fc,
-				struct dentry *new_dentry,
-				struct afs_iget_data *new_data,
-				struct afs_status_cb *new_scb)
+static void afs_vnode_new_inode(struct afs_operation *op)
 {
+	struct afs_vnode_param *vp = &op->file[1];
 	struct afs_vnode *vnode;
 	struct inode *inode;
 
-	if (fc->ac.error < 0)
-		return;
+	_enter("");
+
+	ASSERTCMP(op->error, ==, 0);
 
-	inode = afs_iget(fc->vnode->vfs_inode.i_sb, fc->key,
-			 new_data, new_scb, fc->cbi, fc->vnode);
+	inode = afs_iget(op, vp);
 	if (IS_ERR(inode)) {
 		/* ENOMEM or EINTR at a really inconvenient time - just abandon
 		 * the new directory on the server.
 		 */
-		fc->ac.error = PTR_ERR(inode);
+		op->error = PTR_ERR(inode);
 		return;
 	}
 
 	vnode = AFS_FS_I(inode);
 	set_bit(AFS_VNODE_NEW_CONTENT, &vnode->flags);
-	if (fc->ac.error == 0)
-		afs_cache_permit(vnode, fc->key, vnode->cb_break, new_scb);
-	d_instantiate(new_dentry, inode);
+	if (!op->error)
+		afs_cache_permit(vnode, op->key, vnode->cb_break, &vp->scb);
+	d_instantiate(op->dentry, inode);
 }
 
-static void afs_prep_for_new_inode(struct afs_operation *fc,
-				   struct afs_iget_data *iget_data)
+static void afs_create_success(struct afs_operation *op)
 {
-	iget_data->volume = fc->vnode->volume;
-	iget_data->cb_v_break = fc->vnode->volume->cb_v_break;
-	iget_data->cb_s_break = fc->cbi->server->cb_s_break;
+	_enter("op=%08x", op->debug_id);
+	afs_check_for_remote_deletion(op, op->file[0].vnode);
+	afs_vnode_commit_status(op, &op->file[0]);
+	afs_update_dentry_version(op, &op->file[0], op->dentry);
+	afs_vnode_new_inode(op);
 }
 
-/*
- * Note that a dentry got changed.  We need to set d_fsdata to the data version
- * number derived from the result of the operation.  It doesn't matter if
- * d_fsdata goes backwards as we'll just revalidate.
- */
-static void afs_update_dentry_version(struct afs_operation *fc,
-				      struct dentry *dentry,
-				      struct afs_status_cb *scb)
+static void afs_create_edit_dir(struct afs_operation *op)
 {
-	if (fc->ac.error == 0)
-		dentry->d_fsdata =
-			(void *)(unsigned long)scb->status.data_version;
+	struct afs_vnode_param *dvp = &op->file[0];
+	struct afs_vnode_param *vp = &op->file[1];
+	struct afs_vnode *dvnode = dvp->vnode;
+
+	_enter("op=%08x", op->debug_id);
+
+	down_write(&dvnode->validate_lock);
+	if (test_bit(AFS_VNODE_DIR_VALID, &dvnode->flags) &&
+	    dvnode->status.data_version == dvp->dv_before + dvp->dv_delta)
+		afs_edit_dir_add(dvnode, &op->dentry->d_name, &vp->fid,
+				 op->create.reason);
+	up_write(&dvnode->validate_lock);
 }
 
+static void afs_create_put(struct afs_operation *op)
+{
+	_enter("op=%08x", op->debug_id);
+
+	if (op->error)
+		d_drop(op->dentry);
+}
+
+static const struct afs_operation_ops afs_mkdir_operation = {
+	.issue_afs_rpc	= afs_fs_make_dir,
+	.issue_yfs_rpc	= yfs_fs_make_dir,
+	.success	= afs_create_success,
+	.edit_dir	= afs_create_edit_dir,
+	.put		= afs_create_put,
+};
+
 /*
  * create a directory on an AFS filesystem
  */
 static int afs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 {
-	struct afs_iget_data iget_data;
-	struct afs_status_cb *scb;
-	struct afs_operation fc;
+	struct afs_operation *op;
 	struct afs_vnode *dvnode = AFS_FS_I(dir);
-	struct key *key;
-	afs_dataversion_t data_version;
-	int ret;
-
-	mode |= S_IFDIR;
 
 	_enter("{%llx:%llu},{%pd},%ho",
 	       dvnode->fid.vid, dvnode->fid.vnode, dentry, mode);
 
-	ret = -ENOMEM;
-	scb = kcalloc(2, sizeof(struct afs_status_cb), GFP_KERNEL);
-	if (!scb)
-		goto error;
-
-	key = afs_request_key(dvnode->volume->cell);
-	if (IS_ERR(key)) {
-		ret = PTR_ERR(key);
-		goto error_scb;
-	}
-
-	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
-		data_version = dvnode->status.data_version + 1;
-
-		while (afs_select_fileserver(&fc)) {
-			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
-			afs_prep_for_new_inode(&fc, &iget_data);
-			afs_fs_create(&fc, dentry->d_name.name, mode,
-				      &scb[0], &iget_data.fid, &scb[1]);
-		}
-
-		afs_check_for_remote_deletion(&fc, dvnode);
-		afs_vnode_commit_status(&fc, dvnode, fc.cb_break,
-					&data_version, &scb[0]);
-		afs_update_dentry_version(&fc, dentry, &scb[0]);
-		afs_vnode_new_inode(&fc, dentry, &iget_data, &scb[1]);
-		ret = afs_end_vnode_operation(&fc);
-		if (ret < 0)
-			goto error_key;
-	} else {
-		goto error_key;
-	}
-
-	if (ret == 0) {
-		down_write(&dvnode->validate_lock);
-		if (test_bit(AFS_VNODE_DIR_VALID, &dvnode->flags) &&
-		    dvnode->status.data_version == data_version)
-			afs_edit_dir_add(dvnode, &dentry->d_name, &iget_data.fid,
-					 afs_edit_dir_for_create);
-		up_write(&dvnode->validate_lock);
+	op = afs_alloc_operation(NULL, dvnode->volume);
+	if (IS_ERR(op)) {
+		d_drop(op->dentry);
+		return PTR_ERR(op);
 	}
 
-	key_put(key);
-	kfree(scb);
-	_leave(" = 0");
-	return 0;
-
-error_key:
-	key_put(key);
-error_scb:
-	kfree(scb);
-error:
-	d_drop(dentry);
-	_leave(" = %d", ret);
-	return ret;
+	afs_op_set_vnode(op, 0, dvnode);
+	op->file[0].dv_delta = 1;
+	op->dentry	= dentry;
+	op->create.mode	= S_IFDIR | mode;
+	op->create.reason = afs_edit_dir_for_mkdir;
+	op->ops		= &afs_mkdir_operation;
+	return afs_do_sync_operation(op);
 }
 
 /*
@@ -1361,76 +1326,86 @@ static void afs_dir_remove_subdir(struct dentry *dentry)
 	}
 }
 
+static void afs_rmdir_success(struct afs_operation *op)
+{
+	_enter("op=%08x", op->debug_id);
+	afs_check_for_remote_deletion(op, op->file[0].vnode);
+	afs_vnode_commit_status(op, &op->file[0]);
+	afs_update_dentry_version(op, &op->file[0], op->dentry);
+}
+
+static void afs_rmdir_edit_dir(struct afs_operation *op)
+{
+	struct afs_vnode_param *dvp = &op->file[0];
+	struct afs_vnode *dvnode = dvp->vnode;
+
+	_enter("op=%08x", op->debug_id);
+	afs_dir_remove_subdir(op->dentry);
+
+	down_write(&dvnode->validate_lock);
+	if (test_bit(AFS_VNODE_DIR_VALID, &dvnode->flags) &&
+	    dvnode->status.data_version == dvp->dv_before + dvp->dv_delta)
+		afs_edit_dir_remove(dvnode, &op->dentry->d_name,
+				    afs_edit_dir_for_rmdir);
+	up_write(&dvnode->validate_lock);
+}
+
+static void afs_rmdir_put(struct afs_operation *op)
+{
+	_enter("op=%08x", op->debug_id);
+	if (op->file[1].vnode)
+		up_write(&op->file[1].vnode->rmdir_lock);
+}
+
+static const struct afs_operation_ops afs_rmdir_operation = {
+	.issue_afs_rpc	= afs_fs_remove_dir,
+	.issue_yfs_rpc	= yfs_fs_remove_dir,
+	.success	= afs_rmdir_success,
+	.edit_dir	= afs_rmdir_edit_dir,
+	.put		= afs_rmdir_put,
+};
+
 /*
  * remove a directory from an AFS filesystem
  */
 static int afs_rmdir(struct inode *dir, struct dentry *dentry)
 {
-	struct afs_status_cb *scb;
-	struct afs_operation fc;
+	struct afs_operation *op;
 	struct afs_vnode *dvnode = AFS_FS_I(dir), *vnode = NULL;
-	struct key *key;
-	afs_dataversion_t data_version;
 	int ret;
 
 	_enter("{%llx:%llu},{%pd}",
 	       dvnode->fid.vid, dvnode->fid.vnode, dentry);
 
-	scb = kzalloc(sizeof(struct afs_status_cb), GFP_KERNEL);
-	if (!scb)
-		return -ENOMEM;
+	op = afs_alloc_operation(NULL, dvnode->volume);
+	if (IS_ERR(op))
+		return PTR_ERR(op);
 
-	key = afs_request_key(dvnode->volume->cell);
-	if (IS_ERR(key)) {
-		ret = PTR_ERR(key);
-		goto error;
-	}
+	afs_op_set_vnode(op, 0, dvnode);
+	op->file[0].dv_delta = 1;
+
+	op->dentry	= dentry;
+	op->ops		= &afs_rmdir_operation;
 
 	/* Try to make sure we have a callback promise on the victim. */
 	if (d_really_is_positive(dentry)) {
 		vnode = AFS_FS_I(d_inode(dentry));
-		ret = afs_validate(vnode, key);
+		ret = afs_validate(vnode, op->key);
 		if (ret < 0)
-			goto error_key;
+			goto error;
 	}
 
 	if (vnode) {
 		ret = down_write_killable(&vnode->rmdir_lock);
 		if (ret < 0)
-			goto error_key;
+			goto error;
+		op->file[1].vnode = vnode;
 	}
 
-	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
-		data_version = dvnode->status.data_version + 1;
-
-		while (afs_select_fileserver(&fc)) {
-			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
-			afs_fs_remove(&fc, vnode, dentry->d_name.name, true, scb);
-		}
-
-		afs_vnode_commit_status(&fc, dvnode, fc.cb_break,
-					&data_version, scb);
-		afs_update_dentry_version(&fc, dentry, scb);
-		ret = afs_end_vnode_operation(&fc);
-		if (ret == 0) {
-			afs_dir_remove_subdir(dentry);
-			down_write(&dvnode->validate_lock);
-			if (test_bit(AFS_VNODE_DIR_VALID, &dvnode->flags) &&
-			    dvnode->status.data_version == data_version)
-				afs_edit_dir_remove(dvnode, &dentry->d_name,
-						    afs_edit_dir_for_rmdir);
-			up_write(&dvnode->validate_lock);
-		}
-	}
+	return afs_do_sync_operation(op);
 
-	if (vnode)
-		up_write(&vnode->rmdir_lock);
-error_key:
-	key_put(key);
 error:
-	kfree(scb);
-	return ret;
+	return afs_put_operation(op);
 }
 
 /*
@@ -1443,52 +1418,90 @@ static int afs_rmdir(struct inode *dir, struct dentry *dentry)
  * However, if we didn't have a callback promise outstanding, or it was
  * outstanding on a different server, then it won't break it either...
  */
-static int afs_dir_remove_link(struct afs_vnode *dvnode, struct dentry *dentry,
-			       struct key *key)
+static void afs_dir_remove_link(struct afs_operation *op)
 {
-	int ret = 0;
+	struct afs_vnode *dvnode = op->file[0].vnode;
+	struct afs_vnode *vnode = op->file[1].vnode;
+	struct dentry *dentry = op->dentry;
+	int ret;
 
-	if (d_really_is_positive(dentry)) {
-		struct afs_vnode *vnode = AFS_FS_I(d_inode(dentry));
+	if (op->error != 0 ||
+	    (op->file[1].scb.have_status && op->file[1].scb.have_error))
+		return;
+	if (d_really_is_positive(dentry))
+		return;
 
-		if (test_bit(AFS_VNODE_DELETED, &vnode->flags)) {
-			/* Already done */
-		} else if (test_bit(AFS_VNODE_DIR_VALID, &dvnode->flags)) {
-			write_seqlock(&vnode->cb_lock);
-			drop_nlink(&vnode->vfs_inode);
-			if (vnode->vfs_inode.i_nlink == 0) {
-				set_bit(AFS_VNODE_DELETED, &vnode->flags);
-				__afs_break_callback(vnode, afs_cb_break_for_unlink);
-			}
-			write_sequnlock(&vnode->cb_lock);
-			ret = 0;
-		} else {
-			afs_break_callback(vnode, afs_cb_break_for_unlink);
+	if (test_bit(AFS_VNODE_DELETED, &vnode->flags)) {
+		/* Already done */
+	} else if (test_bit(AFS_VNODE_DIR_VALID, &dvnode->flags)) {
+		write_seqlock(&vnode->cb_lock);
+		drop_nlink(&vnode->vfs_inode);
+		if (vnode->vfs_inode.i_nlink == 0) {
+			set_bit(AFS_VNODE_DELETED, &vnode->flags);
+			__afs_break_callback(vnode, afs_cb_break_for_unlink);
+		}
+		write_sequnlock(&vnode->cb_lock);
+	} else {
+		afs_break_callback(vnode, afs_cb_break_for_unlink);
 
-			if (test_bit(AFS_VNODE_DELETED, &vnode->flags))
-				kdebug("AFS_VNODE_DELETED");
+		if (test_bit(AFS_VNODE_DELETED, &vnode->flags))
+			_debug("AFS_VNODE_DELETED");
 
-			ret = afs_validate(vnode, key);
-			if (ret == -ESTALE)
-				ret = 0;
-		}
-		_debug("nlink %d [val %d]", vnode->vfs_inode.i_nlink, ret);
+		ret = afs_validate(vnode, op->key);
+		if (ret != -ESTALE)
+			op->error = ret;
 	}
 
-	return ret;
+	_debug("nlink %d [val %d]", vnode->vfs_inode.i_nlink, op->error);
+}
+
+static void afs_unlink_success(struct afs_operation *op)
+{
+	_enter("op=%08x", op->debug_id);
+	afs_check_for_remote_deletion(op, op->file[0].vnode);
+	afs_vnode_commit_status(op, &op->file[0]);
+	afs_vnode_commit_status(op, &op->file[1]);
+	afs_update_dentry_version(op, &op->file[0], op->dentry);
+	afs_dir_remove_link(op);
+}
+
+static void afs_unlink_edit_dir(struct afs_operation *op)
+{
+	struct afs_vnode_param *dvp = &op->file[0];
+	struct afs_vnode *dvnode = dvp->vnode;
+
+	_enter("op=%08x", op->debug_id);
+	down_write(&dvnode->validate_lock);
+	if (test_bit(AFS_VNODE_DIR_VALID, &dvnode->flags) &&
+	    dvnode->status.data_version == dvp->dv_before + dvp->dv_delta)
+		afs_edit_dir_remove(dvnode, &op->dentry->d_name,
+				    afs_edit_dir_for_unlink);
+	up_write(&dvnode->validate_lock);
 }
 
+static void afs_unlink_put(struct afs_operation *op)
+{
+	_enter("op=%08x", op->debug_id);
+	if (op->unlink.need_rehash && op->error < 0 && op->error != -ENOENT)
+		d_rehash(op->dentry);
+}
+
+static const struct afs_operation_ops afs_unlink_operation = {
+	.issue_afs_rpc	= afs_fs_remove_file,
+	.issue_yfs_rpc	= yfs_fs_remove_file,
+	.success	= afs_unlink_success,
+	.edit_dir	= afs_unlink_edit_dir,
+	.put		= afs_unlink_put,
+};
+
 /*
  * Remove a file or symlink from an AFS filesystem.
  */
 static int afs_unlink(struct inode *dir, struct dentry *dentry)
 {
-	struct afs_operation fc;
-	struct afs_status_cb *scb;
+	struct afs_operation *op;
 	struct afs_vnode *dvnode = AFS_FS_I(dir);
 	struct afs_vnode *vnode = AFS_FS_I(d_inode(dentry));
-	struct key *key;
-	bool need_rehash = false;
 	int ret;
 
 	_enter("{%llx:%llu},{%pd}",
@@ -1497,269 +1510,176 @@ static int afs_unlink(struct inode *dir, struct dentry *dentry)
 	if (dentry->d_name.len >= AFSNAMEMAX)
 		return -ENAMETOOLONG;
 
-	ret = -ENOMEM;
-	scb = kcalloc(2, sizeof(struct afs_status_cb), GFP_KERNEL);
-	if (!scb)
-		goto error;
+	op = afs_alloc_operation(NULL, dvnode->volume);
+	if (IS_ERR(op))
+		return PTR_ERR(op);
 
-	key = afs_request_key(dvnode->volume->cell);
-	if (IS_ERR(key)) {
-		ret = PTR_ERR(key);
-		goto error_scb;
-	}
+	afs_op_set_vnode(op, 0, dvnode);
+	op->file[0].dv_delta = 1;
 
 	/* Try to make sure we have a callback promise on the victim. */
-	ret = afs_validate(vnode, key);
-	if (ret < 0)
-		goto error_key;
+	ret = afs_validate(vnode, op->key);
+	if (ret < 0) {
+		op->error = ret;
+		goto error;
+	}
 
 	spin_lock(&dentry->d_lock);
 	if (d_count(dentry) > 1) {
 		spin_unlock(&dentry->d_lock);
 		/* Start asynchronous writeout of the inode */
 		write_inode_now(d_inode(dentry), 0);
-		ret = afs_sillyrename(dvnode, vnode, dentry, key);
-		goto error_key;
+		op->error = afs_sillyrename(dvnode, vnode, dentry, op->key);
+		goto error;
 	}
 	if (!d_unhashed(dentry)) {
 		/* Prevent a race with RCU lookup. */
 		__d_drop(dentry);
-		need_rehash = true;
+		op->unlink.need_rehash = true;
 	}
 	spin_unlock(&dentry->d_lock);
 
-	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
-		afs_dataversion_t data_version = dvnode->status.data_version + 1;
-		afs_dataversion_t data_version_2 = vnode->status.data_version;
-
-		while (afs_select_fileserver(&fc)) {
-			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
-			fc.cb_break_2 = afs_calc_vnode_cb_break(vnode);
-
-			if (test_bit(AFS_SERVER_FL_IS_YFS, &fc.cbi->server->flags) &&
-			    !test_bit(AFS_SERVER_FL_NO_RM2, &fc.cbi->server->flags)) {
-				yfs_fs_remove_file2(&fc, vnode, dentry->d_name.name,
-						    &scb[0], &scb[1]);
-				if (fc.ac.error != -ECONNABORTED ||
-				    fc.ac.abort_code != RXGEN_OPCODE)
-					continue;
-				set_bit(AFS_SERVER_FL_NO_RM2, &fc.cbi->server->flags);
-			}
-
-			afs_fs_remove(&fc, vnode, dentry->d_name.name, false, &scb[0]);
-		}
-
-		afs_vnode_commit_status(&fc, dvnode, fc.cb_break,
-					&data_version, &scb[0]);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break_2,
-					&data_version_2, &scb[1]);
-		afs_update_dentry_version(&fc, dentry, &scb[0]);
-		ret = afs_end_vnode_operation(&fc);
-		if (ret == 0 && !(scb[1].have_status || scb[1].have_error))
-			ret = afs_dir_remove_link(dvnode, dentry, key);
-
-		if (ret == 0) {
-			down_write(&dvnode->validate_lock);
-			if (test_bit(AFS_VNODE_DIR_VALID, &dvnode->flags) &&
-			    dvnode->status.data_version == data_version)
-				afs_edit_dir_remove(dvnode, &dentry->d_name,
-						    afs_edit_dir_for_unlink);
-			up_write(&dvnode->validate_lock);
-		}
-	}
-
-	if (need_rehash && ret < 0 && ret != -ENOENT)
-		d_rehash(dentry);
+	op->file[1].vnode = vnode;
+	op->dentry	= dentry;
+	op->ops		= &afs_unlink_operation;
+	return afs_do_sync_operation(op);
 
-error_key:
-	key_put(key);
-error_scb:
-	kfree(scb);
 error:
-	_leave(" = %d", ret);
-	return ret;
+	return afs_put_operation(op);
 }
 
+static const struct afs_operation_ops afs_create_operation = {
+	.issue_afs_rpc	= afs_fs_create_file,
+	.issue_yfs_rpc	= yfs_fs_create_file,
+	.success	= afs_create_success,
+	.edit_dir	= afs_create_edit_dir,
+	.put		= afs_create_put,
+};
+
 /*
  * create a regular file on an AFS filesystem
  */
 static int afs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 		      bool excl)
 {
-	struct afs_iget_data iget_data;
-	struct afs_operation fc;
-	struct afs_status_cb *scb;
+	struct afs_operation *op;
 	struct afs_vnode *dvnode = AFS_FS_I(dir);
-	struct key *key;
-	afs_dataversion_t data_version;
-	int ret;
-
-	mode |= S_IFREG;
+	int ret = -ENAMETOOLONG;
 
-	_enter("{%llx:%llu},{%pd},%ho,",
+	_enter("{%llx:%llu},{%pd},%ho",
 	       dvnode->fid.vid, dvnode->fid.vnode, dentry, mode);
 
-	ret = -ENAMETOOLONG;
 	if (dentry->d_name.len >= AFSNAMEMAX)
 		goto error;
 
-	key = afs_request_key(dvnode->volume->cell);
-	if (IS_ERR(key)) {
-		ret = PTR_ERR(key);
+	op = afs_alloc_operation(NULL, dvnode->volume);
+	if (IS_ERR(op)) {
+		ret = PTR_ERR(op);
 		goto error;
 	}
 
-	ret = -ENOMEM;
-	scb = kcalloc(2, sizeof(struct afs_status_cb), GFP_KERNEL);
-	if (!scb)
-		goto error_scb;
-
-	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
-		data_version = dvnode->status.data_version + 1;
-
-		while (afs_select_fileserver(&fc)) {
-			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
-			afs_prep_for_new_inode(&fc, &iget_data);
-			afs_fs_create(&fc, dentry->d_name.name, mode,
-				      &scb[0], &iget_data.fid, &scb[1]);
-		}
-
-		afs_check_for_remote_deletion(&fc, dvnode);
-		afs_vnode_commit_status(&fc, dvnode, fc.cb_break,
-					&data_version, &scb[0]);
-		afs_update_dentry_version(&fc, dentry, &scb[0]);
-		afs_vnode_new_inode(&fc, dentry, &iget_data, &scb[1]);
-		ret = afs_end_vnode_operation(&fc);
-		if (ret < 0)
-			goto error_key;
-	} else {
-		goto error_key;
-	}
-
-	down_write(&dvnode->validate_lock);
-	if (test_bit(AFS_VNODE_DIR_VALID, &dvnode->flags) &&
-	    dvnode->status.data_version == data_version)
-		afs_edit_dir_add(dvnode, &dentry->d_name, &iget_data.fid,
-				 afs_edit_dir_for_create);
-	up_write(&dvnode->validate_lock);
+	afs_op_set_vnode(op, 0, dvnode);
+	op->file[0].dv_delta = 1;
 
-	kfree(scb);
-	key_put(key);
-	_leave(" = 0");
-	return 0;
+	op->dentry	= dentry;
+	op->create.mode	= S_IFREG | mode;
+	op->create.reason = afs_edit_dir_for_create;
+	op->ops		= &afs_create_operation;
+	return afs_do_sync_operation(op);
 
-error_scb:
-	kfree(scb);
-error_key:
-	key_put(key);
 error:
 	d_drop(dentry);
 	_leave(" = %d", ret);
 	return ret;
 }
 
+static void afs_link_success(struct afs_operation *op)
+{
+	struct afs_vnode_param *dvp = &op->file[0];
+	struct afs_vnode_param *vp = &op->file[1];
+
+	_enter("op=%08x", op->debug_id);
+	afs_vnode_commit_status(op, dvp);
+	afs_vnode_commit_status(op, vp);
+	afs_update_dentry_version(op, dvp, op->dentry);
+	if (op->dentry_2->d_parent == op->dentry->d_parent)
+		afs_update_dentry_version(op, dvp, op->dentry_2);
+	ihold(&vp->vnode->vfs_inode);
+	d_instantiate(op->dentry, &vp->vnode->vfs_inode);
+}
+
+static void afs_link_put(struct afs_operation *op)
+{
+	_enter("op=%08x", op->debug_id);
+	if (op->error)
+		d_drop(op->dentry);
+}
+
+static const struct afs_operation_ops afs_link_operation = {
+	.issue_afs_rpc	= afs_fs_link,
+	.issue_yfs_rpc	= yfs_fs_link,
+	.success	= afs_link_success,
+	.edit_dir	= afs_create_edit_dir,
+	.put		= afs_link_put,
+};
+
 /*
  * create a hard link between files in an AFS filesystem
  */
 static int afs_link(struct dentry *from, struct inode *dir,
 		    struct dentry *dentry)
 {
-	struct afs_operation fc;
-	struct afs_status_cb *scb;
+	struct afs_operation *op;
 	struct afs_vnode *dvnode = AFS_FS_I(dir);
 	struct afs_vnode *vnode = AFS_FS_I(d_inode(from));
-	struct key *key;
-	afs_dataversion_t data_version;
-	int ret;
+	int ret = -ENAMETOOLONG;
 
 	_enter("{%llx:%llu},{%llx:%llu},{%pd}",
 	       vnode->fid.vid, vnode->fid.vnode,
 	       dvnode->fid.vid, dvnode->fid.vnode,
 	       dentry);
 
-	ret = -ENAMETOOLONG;
 	if (dentry->d_name.len >= AFSNAMEMAX)
 		goto error;
 
-	ret = -ENOMEM;
-	scb = kcalloc(2, sizeof(struct afs_status_cb), GFP_KERNEL);
-	if (!scb)
+	op = afs_alloc_operation(NULL, dvnode->volume);
+	if (IS_ERR(op)) {
+		ret = PTR_ERR(op);
 		goto error;
-
-	key = afs_request_key(dvnode->volume->cell);
-	if (IS_ERR(key)) {
-		ret = PTR_ERR(key);
-		goto error_scb;
 	}
 
-	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
-		data_version = dvnode->status.data_version + 1;
-
-		if (mutex_lock_interruptible_nested(&vnode->io_lock, 1) < 0) {
-			afs_end_vnode_operation(&fc);
-			goto error_key;
-		}
-
-		while (afs_select_fileserver(&fc)) {
-			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
-			fc.cb_break_2 = afs_calc_vnode_cb_break(vnode);
-			afs_fs_link(&fc, vnode, dentry->d_name.name,
-				    &scb[0], &scb[1]);
-		}
-
-		afs_vnode_commit_status(&fc, dvnode, fc.cb_break,
-					&data_version, &scb[0]);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break_2,
-					NULL, &scb[1]);
-		ihold(&vnode->vfs_inode);
-		afs_update_dentry_version(&fc, dentry, &scb[0]);
-		d_instantiate(dentry, &vnode->vfs_inode);
-
-		mutex_unlock(&vnode->io_lock);
-		ret = afs_end_vnode_operation(&fc);
-		if (ret < 0)
-			goto error_key;
-	} else {
-		goto error_key;
-	}
+	afs_op_set_vnode(op, 0, dvnode);
+	afs_op_set_vnode(op, 1, vnode);
+	op->file[0].dv_delta = 1;
 
-	down_write(&dvnode->validate_lock);
-	if (test_bit(AFS_VNODE_DIR_VALID, &dvnode->flags) &&
-	    dvnode->status.data_version == data_version)
-		afs_edit_dir_add(dvnode, &dentry->d_name, &vnode->fid,
-				 afs_edit_dir_for_link);
-	up_write(&dvnode->validate_lock);
+	op->dentry		= dentry;
+	op->dentry_2		= from;
+	op->ops			= &afs_link_operation;
+	op->create.reason	= afs_edit_dir_for_link;
+	return afs_do_sync_operation(op);
 
-	key_put(key);
-	kfree(scb);
-	_leave(" = 0");
-	return 0;
-
-error_key:
-	key_put(key);
-error_scb:
-	kfree(scb);
 error:
 	d_drop(dentry);
 	_leave(" = %d", ret);
 	return ret;
 }
 
+static const struct afs_operation_ops afs_symlink_operation = {
+	.issue_afs_rpc	= afs_fs_symlink,
+	.issue_yfs_rpc	= yfs_fs_symlink,
+	.success	= afs_create_success,
+	.edit_dir	= afs_create_edit_dir,
+	.put		= afs_create_put,
+};
+
 /*
  * create a symlink in an AFS filesystem
  */
 static int afs_symlink(struct inode *dir, struct dentry *dentry,
 		       const char *content)
 {
-	struct afs_iget_data iget_data;
-	struct afs_operation fc;
-	struct afs_status_cb *scb;
+	struct afs_operation *op;
 	struct afs_vnode *dvnode = AFS_FS_I(dir);
-	struct key *key;
-	afs_dataversion_t data_version;
 	int ret;
 
 	_enter("{%llx:%llu},{%pd},%s",
@@ -1774,62 +1694,115 @@ static int afs_symlink(struct inode *dir, struct dentry *dentry,
 	if (strlen(content) >= AFSPATHMAX)
 		goto error;
 
-	ret = -ENOMEM;
-	scb = kcalloc(2, sizeof(struct afs_status_cb), GFP_KERNEL);
-	if (!scb)
+	op = afs_alloc_operation(NULL, dvnode->volume);
+	if (IS_ERR(op)) {
+		ret = PTR_ERR(op);
 		goto error;
-
-	key = afs_request_key(dvnode->volume->cell);
-	if (IS_ERR(key)) {
-		ret = PTR_ERR(key);
-		goto error_scb;
 	}
 
-	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
-		data_version = dvnode->status.data_version + 1;
-
-		while (afs_select_fileserver(&fc)) {
-			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
-			afs_prep_for_new_inode(&fc, &iget_data);
-			afs_fs_symlink(&fc, dentry->d_name.name, content,
-				       &scb[0], &iget_data.fid, &scb[1]);
-		}
+	afs_op_set_vnode(op, 0, dvnode);
+	op->file[0].dv_delta = 1;
 
-		afs_check_for_remote_deletion(&fc, dvnode);
-		afs_vnode_commit_status(&fc, dvnode, fc.cb_break,
-					&data_version, &scb[0]);
-		afs_update_dentry_version(&fc, dentry, &scb[0]);
-		afs_vnode_new_inode(&fc, dentry, &iget_data, &scb[1]);
-		ret = afs_end_vnode_operation(&fc);
-		if (ret < 0)
-			goto error_key;
-	} else {
-		goto error_key;
-	}
-
-	down_write(&dvnode->validate_lock);
-	if (test_bit(AFS_VNODE_DIR_VALID, &dvnode->flags) &&
-	    dvnode->status.data_version == data_version)
-		afs_edit_dir_add(dvnode, &dentry->d_name, &iget_data.fid,
-				 afs_edit_dir_for_symlink);
-	up_write(&dvnode->validate_lock);
-
-	key_put(key);
-	kfree(scb);
-	_leave(" = 0");
-	return 0;
+	op->dentry		= dentry;
+	op->ops			= &afs_symlink_operation;
+	op->create.reason	= afs_edit_dir_for_symlink;
+	op->create.symlink	= content;
+	return afs_do_sync_operation(op);
 
-error_key:
-	key_put(key);
-error_scb:
-	kfree(scb);
 error:
 	d_drop(dentry);
 	_leave(" = %d", ret);
 	return ret;
 }
 
+static void afs_rename_success(struct afs_operation *op)
+{
+	_enter("op=%08x", op->debug_id);
+
+	afs_vnode_commit_status(op, &op->file[0]);
+	if (op->file[1].vnode != op->file[0].vnode)
+		afs_vnode_commit_status(op, &op->file[1]);
+}
+
+static void afs_rename_edit_dir(struct afs_operation *op)
+{
+	struct afs_vnode_param *orig_dvp = &op->file[0];
+	struct afs_vnode_param *new_dvp = &op->file[1];
+	struct afs_vnode *orig_dvnode = orig_dvp->vnode;
+	struct afs_vnode *new_dvnode = new_dvp->vnode;
+	struct afs_vnode *vnode = AFS_FS_I(d_inode(op->dentry));
+	struct dentry *old_dentry = op->dentry;
+	struct dentry *new_dentry = op->dentry_2;
+	struct inode *new_inode;
+
+	_enter("op=%08x", op->debug_id);
+
+	if (op->rename.rehash) {
+		d_rehash(op->rename.rehash);
+		op->rename.rehash = NULL;
+	}
+
+	down_write(&orig_dvnode->validate_lock);
+	if (test_bit(AFS_VNODE_DIR_VALID, &orig_dvnode->flags) &&
+	    orig_dvnode->status.data_version == orig_dvp->dv_before + orig_dvp->dv_delta)
+		afs_edit_dir_remove(orig_dvnode, &old_dentry->d_name,
+				    afs_edit_dir_for_rename_0);
+
+	if (new_dvnode != orig_dvnode) {
+		up_write(&orig_dvnode->validate_lock);
+		down_write(&new_dvnode->validate_lock);
+	}
+
+	if (test_bit(AFS_VNODE_DIR_VALID, &new_dvnode->flags) &&
+	    new_dvnode->status.data_version == new_dvp->dv_before + new_dvp->dv_delta) {
+		if (!op->rename.new_negative)
+			afs_edit_dir_remove(new_dvnode, &new_dentry->d_name,
+					    afs_edit_dir_for_rename_1);
+
+		afs_edit_dir_add(new_dvnode, &new_dentry->d_name,
+				 &vnode->fid, afs_edit_dir_for_rename_2);
+	}
+
+	new_inode = d_inode(new_dentry);
+	if (new_inode) {
+		spin_lock(&new_inode->i_lock);
+		if (new_inode->i_nlink > 0)
+			drop_nlink(new_inode);
+		spin_unlock(&new_inode->i_lock);
+	}
+
+	/* Now we can update d_fsdata on the dentries to reflect their
+	 * new parent's data_version.
+	 *
+	 * Note that if we ever implement RENAME_EXCHANGE, we'll have
+	 * to update both dentries with opposing dir versions.
+	 */
+	afs_update_dentry_version(op, new_dvp, op->dentry);
+	afs_update_dentry_version(op, new_dvp, op->dentry_2);
+
+	d_move(old_dentry, new_dentry);
+
+	up_write(&new_dvnode->validate_lock);
+}
+
+static void afs_rename_put(struct afs_operation *op)
+{
+	_enter("op=%08x", op->debug_id);
+	if (op->rename.rehash)
+		d_rehash(op->rename.rehash);
+	dput(op->rename.tmp);
+	if (op->error)
+		d_rehash(op->dentry);
+}
+
+static const struct afs_operation_ops afs_rename_operation = {
+	.issue_afs_rpc	= afs_fs_rename,
+	.issue_yfs_rpc	= yfs_fs_rename,
+	.success	= afs_rename_success,
+	.edit_dir	= afs_rename_edit_dir,
+	.put		= afs_rename_put,
+};
+
 /*
  * rename a file in an AFS filesystem and/or move it between directories
  */
@@ -1837,15 +1810,8 @@ static int afs_rename(struct inode *old_dir, struct dentry *old_dentry,
 		      struct inode *new_dir, struct dentry *new_dentry,
 		      unsigned int flags)
 {
-	struct afs_operation fc;
-	struct afs_status_cb *scb;
+	struct afs_operation *op;
 	struct afs_vnode *orig_dvnode, *new_dvnode, *vnode;
-	struct dentry *tmp = NULL, *rehash = NULL;
-	struct inode *new_inode;
-	struct key *key;
-	afs_dataversion_t orig_data_version;
-	afs_dataversion_t new_data_version;
-	bool new_negative = d_is_negative(new_dentry);
 	int ret;
 
 	if (flags)
@@ -1865,16 +1831,19 @@ static int afs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	       new_dvnode->fid.vid, new_dvnode->fid.vnode,
 	       new_dentry);
 
-	ret = -ENOMEM;
-	scb = kcalloc(2, sizeof(struct afs_status_cb), GFP_KERNEL);
-	if (!scb)
-		goto error;
+	op = afs_alloc_operation(NULL, orig_dvnode->volume);
+	if (IS_ERR(op))
+		return PTR_ERR(op);
 
-	key = afs_request_key(orig_dvnode->volume->cell);
-	if (IS_ERR(key)) {
-		ret = PTR_ERR(key);
-		goto error_scb;
-	}
+	afs_op_set_vnode(op, 0, orig_dvnode);
+	afs_op_set_vnode(op, 1, new_dvnode); /* May be same as orig_dvnode */
+	op->file[0].dv_delta = 1;
+	op->file[1].dv_delta = 1;
+
+	op->dentry		= old_dentry;
+	op->dentry_2		= new_dentry;
+	op->rename.new_negative	= d_is_negative(new_dentry);
+	op->ops			= &afs_rename_operation;
 
 	/* For non-directories, check whether the target is busy and if so,
 	 * make a copy of the dentry and then do a silly-rename.  If the
@@ -1887,26 +1856,26 @@ static int afs_rename(struct inode *old_dir, struct dentry *old_dentry,
 		 */
 		if (!d_unhashed(new_dentry)) {
 			d_drop(new_dentry);
-			rehash = new_dentry;
+			op->rename.rehash = new_dentry;
 		}
 
 		if (d_count(new_dentry) > 2) {
 			/* copy the target dentry's name */
 			ret = -ENOMEM;
-			tmp = d_alloc(new_dentry->d_parent,
-				      &new_dentry->d_name);
-			if (!tmp)
-				goto error_rehash;
+			op->rename.tmp = d_alloc(new_dentry->d_parent,
+						 &new_dentry->d_name);
+			if (!op->rename.tmp)
+				goto error;
 
 			ret = afs_sillyrename(new_dvnode,
 					      AFS_FS_I(d_inode(new_dentry)),
-					      new_dentry, key);
+					      new_dentry, op->key);
 			if (ret)
-				goto error_rehash;
+				goto error;
 
-			new_dentry = tmp;
-			rehash = NULL;
-			new_negative = true;
+			op->dentry_2 = op->rename.tmp;
+			op->rename.rehash = NULL;
+			op->rename.new_negative = true;
 		}
 	}
 
@@ -1921,98 +1890,10 @@ static int afs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	 */
 	d_drop(old_dentry);
 
-	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, orig_dvnode, key, true)) {
-		orig_data_version = orig_dvnode->status.data_version + 1;
-
-		if (orig_dvnode != new_dvnode) {
-			if (mutex_lock_interruptible_nested(&new_dvnode->io_lock, 1) < 0) {
-				afs_end_vnode_operation(&fc);
-				goto error_rehash_old;
-			}
-			new_data_version = new_dvnode->status.data_version + 1;
-		} else {
-			new_data_version = orig_data_version;
-		}
-
-		while (afs_select_fileserver(&fc)) {
-			fc.cb_break = afs_calc_vnode_cb_break(orig_dvnode);
-			fc.cb_break_2 = afs_calc_vnode_cb_break(new_dvnode);
-			afs_fs_rename(&fc, old_dentry->d_name.name,
-				      new_dvnode, new_dentry->d_name.name,
-				      &scb[0], &scb[1]);
-		}
-
-		afs_vnode_commit_status(&fc, orig_dvnode, fc.cb_break,
-					&orig_data_version, &scb[0]);
-		if (new_dvnode != orig_dvnode) {
-			afs_vnode_commit_status(&fc, new_dvnode, fc.cb_break_2,
-						&new_data_version, &scb[1]);
-			mutex_unlock(&new_dvnode->io_lock);
-		}
-		ret = afs_end_vnode_operation(&fc);
-		if (ret < 0)
-			goto error_rehash_old;
-	}
-
-	if (ret == 0) {
-		if (rehash)
-			d_rehash(rehash);
-		down_write(&orig_dvnode->validate_lock);
-		if (test_bit(AFS_VNODE_DIR_VALID, &orig_dvnode->flags) &&
-		    orig_dvnode->status.data_version == orig_data_version)
-			afs_edit_dir_remove(orig_dvnode, &old_dentry->d_name,
-					    afs_edit_dir_for_rename_0);
-		if (orig_dvnode != new_dvnode) {
-			up_write(&orig_dvnode->validate_lock);
-
-			down_write(&new_dvnode->validate_lock);
-		}
-		if (test_bit(AFS_VNODE_DIR_VALID, &new_dvnode->flags) &&
-		    orig_dvnode->status.data_version == new_data_version) {
-			if (!new_negative)
-				afs_edit_dir_remove(new_dvnode, &new_dentry->d_name,
-						    afs_edit_dir_for_rename_1);
-
-			afs_edit_dir_add(new_dvnode, &new_dentry->d_name,
-					 &vnode->fid, afs_edit_dir_for_rename_2);
-		}
-
-		new_inode = d_inode(new_dentry);
-		if (new_inode) {
-			spin_lock(&new_inode->i_lock);
-			if (new_inode->i_nlink > 0)
-				drop_nlink(new_inode);
-			spin_unlock(&new_inode->i_lock);
-		}
-
-		/* Now we can update d_fsdata on the dentries to reflect their
-		 * new parent's data_version.
-		 *
-		 * Note that if we ever implement RENAME_EXCHANGE, we'll have
-		 * to update both dentries with opposing dir versions.
-		 */
-		afs_update_dentry_version(&fc, old_dentry, &scb[1]);
-		afs_update_dentry_version(&fc, new_dentry, &scb[1]);
-		d_move(old_dentry, new_dentry);
-		up_write(&new_dvnode->validate_lock);
-		goto error_tmp;
-	}
+	return afs_do_sync_operation(op);
 
-error_rehash_old:
-	d_rehash(new_dentry);
-error_rehash:
-	if (rehash)
-		d_rehash(rehash);
-error_tmp:
-	if (tmp)
-		dput(tmp);
-	key_put(key);
-error_scb:
-	kfree(scb);
 error:
-	_leave(" = %d", ret);
-	return ret;
+	return afs_put_operation(op);
 }
 
 /*
diff --git a/fs/afs/dir_silly.c b/fs/afs/dir_silly.c
index 0a82b134aa0d..b14e3d9a25e2 100644
--- a/fs/afs/dir_silly.c
+++ b/fs/afs/dir_silly.c
@@ -12,6 +12,47 @@
 #include <linux/fsnotify.h>
 #include "internal.h"
 
+static void afs_silly_rename_success(struct afs_operation *op)
+{
+	_enter("op=%08x", op->debug_id);
+
+	afs_vnode_commit_status(op, &op->file[0]);
+}
+
+static void afs_silly_rename_edit_dir(struct afs_operation *op)
+{
+	struct afs_vnode_param *dvp = &op->file[0];
+	struct afs_vnode *dvnode = dvp->vnode;
+	struct afs_vnode *vnode = AFS_FS_I(d_inode(op->dentry));
+	struct dentry *old = op->dentry;
+	struct dentry *new = op->dentry_2;
+
+	spin_lock(&old->d_lock);
+	old->d_flags |= DCACHE_NFSFS_RENAMED;
+	spin_unlock(&old->d_lock);
+	if (dvnode->silly_key != op->key) {
+		key_put(dvnode->silly_key);
+		dvnode->silly_key = key_get(op->key);
+	}
+
+	down_write(&dvnode->validate_lock);
+	if (test_bit(AFS_VNODE_DIR_VALID, &dvnode->flags) &&
+	    dvnode->status.data_version == dvp->dv_before + dvp->dv_delta) {
+		afs_edit_dir_remove(dvnode, &old->d_name,
+				    afs_edit_dir_for_silly_0);
+		afs_edit_dir_add(dvnode, &new->d_name,
+				 &vnode->fid, afs_edit_dir_for_silly_1);
+	}
+	up_write(&dvnode->validate_lock);
+}
+
+static const struct afs_operation_ops afs_silly_rename_operation = {
+	.issue_afs_rpc	= afs_fs_rename,
+	.issue_yfs_rpc	= yfs_fs_rename,
+	.success	= afs_silly_rename_success,
+	.edit_dir	= afs_silly_rename_edit_dir,
+};
+
 /*
  * Actually perform the silly rename step.
  */
@@ -19,56 +60,22 @@ static int afs_do_silly_rename(struct afs_vnode *dvnode, struct afs_vnode *vnode
 			       struct dentry *old, struct dentry *new,
 			       struct key *key)
 {
-	struct afs_operation fc;
-	struct afs_status_cb *scb;
-	afs_dataversion_t dir_data_version;
-	int ret = -ERESTARTSYS;
+	struct afs_operation *op;
 
 	_enter("%pd,%pd", old, new);
 
-	scb = kzalloc(sizeof(struct afs_status_cb), GFP_KERNEL);
-	if (!scb)
-		return -ENOMEM;
+	op = afs_alloc_operation(key, dvnode->volume);
+	if (IS_ERR(op))
+		return PTR_ERR(op);
 
-	trace_afs_silly_rename(vnode, false);
-	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
-		dir_data_version = dvnode->status.data_version + 1;
-
-		while (afs_select_fileserver(&fc)) {
-			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
-			afs_fs_rename(&fc, old->d_name.name,
-				      dvnode, new->d_name.name,
-				      scb, scb);
-		}
-
-		afs_vnode_commit_status(&fc, dvnode, fc.cb_break,
-					&dir_data_version, scb);
-		ret = afs_end_vnode_operation(&fc);
-	}
+	afs_op_set_vnode(op, 0, dvnode);
 
-	if (ret == 0) {
-		spin_lock(&old->d_lock);
-		old->d_flags |= DCACHE_NFSFS_RENAMED;
-		spin_unlock(&old->d_lock);
-		if (dvnode->silly_key != key) {
-			key_put(dvnode->silly_key);
-			dvnode->silly_key = key_get(key);
-		}
-
-		down_write(&dvnode->validate_lock);
-		if (test_bit(AFS_VNODE_DIR_VALID, &dvnode->flags) &&
-		    dvnode->status.data_version == dir_data_version) {
-			afs_edit_dir_remove(dvnode, &old->d_name,
-					    afs_edit_dir_for_silly_0);
-			afs_edit_dir_add(dvnode, &new->d_name,
-					 &vnode->fid, afs_edit_dir_for_silly_1);
-		}
-		up_write(&dvnode->validate_lock);
-	}
+	op->dentry		= old;
+	op->dentry_2		= new;
+	op->ops			= &afs_silly_rename_operation;
 
-	kfree(scb);
-	_leave(" = %d", ret);
-	return ret;
+	trace_afs_silly_rename(vnode, false);
+	return afs_do_sync_operation(op);
 }
 
 /**
@@ -139,65 +146,66 @@ int afs_sillyrename(struct afs_vnode *dvnode, struct afs_vnode *vnode,
 	return ret;
 }
 
+static void afs_silly_unlink_success(struct afs_operation *op)
+{
+	struct afs_vnode *vnode = op->file[1].vnode;
+
+	_enter("op=%08x", op->debug_id);
+	afs_check_for_remote_deletion(op, op->file[0].vnode);
+	afs_vnode_commit_status(op, &op->file[0]);
+	afs_vnode_commit_status(op, &op->file[1]);
+	afs_update_dentry_version(op, &op->file[0], op->dentry);
+
+	drop_nlink(&vnode->vfs_inode);
+	if (vnode->vfs_inode.i_nlink == 0) {
+		set_bit(AFS_VNODE_DELETED, &vnode->flags);
+		clear_bit(AFS_VNODE_CB_PROMISED, &vnode->flags);
+	}
+}
+
+static void afs_silly_unlink_edit_dir(struct afs_operation *op)
+{
+	struct afs_vnode_param *dvp = &op->file[0];
+	struct afs_vnode *dvnode = dvp->vnode;
+
+	_enter("op=%08x", op->debug_id);
+	down_write(&dvnode->validate_lock);
+	if (test_bit(AFS_VNODE_DIR_VALID, &dvnode->flags) &&
+	    dvnode->status.data_version == dvp->dv_before + dvp->dv_delta)
+		afs_edit_dir_remove(dvnode, &op->dentry->d_name,
+				    afs_edit_dir_for_unlink);
+	up_write(&dvnode->validate_lock);
+}
+
+static const struct afs_operation_ops afs_silly_unlink_operation = {
+	.issue_afs_rpc	= afs_fs_remove_file,
+	.issue_yfs_rpc	= yfs_fs_remove_file,
+	.success	= afs_silly_unlink_success,
+	.edit_dir	= afs_silly_unlink_edit_dir,
+};
+
 /*
  * Tell the server to remove a sillyrename file.
  */
 static int afs_do_silly_unlink(struct afs_vnode *dvnode, struct afs_vnode *vnode,
 			       struct dentry *dentry, struct key *key)
 {
-	struct afs_operation fc;
-	struct afs_status_cb *scb;
-	int ret = -ERESTARTSYS;
+	struct afs_operation *op;
 
 	_enter("");
 
-	scb = kcalloc(2, sizeof(struct afs_status_cb), GFP_KERNEL);
-	if (!scb)
-		return -ENOMEM;
+	op = afs_alloc_operation(NULL, dvnode->volume);
+	if (IS_ERR(op))
+		return PTR_ERR(op);
 
-	trace_afs_silly_rename(vnode, true);
-	if (afs_begin_vnode_operation(&fc, dvnode, key, false)) {
-		afs_dataversion_t dir_data_version = dvnode->status.data_version + 1;
-
-		while (afs_select_fileserver(&fc)) {
-			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
-
-			if (test_bit(AFS_SERVER_FL_IS_YFS, &fc.cbi->server->flags) &&
-			    !test_bit(AFS_SERVER_FL_NO_RM2, &fc.cbi->server->flags)) {
-				yfs_fs_remove_file2(&fc, vnode, dentry->d_name.name,
-						    &scb[0], &scb[1]);
-				if (fc.ac.error != -ECONNABORTED ||
-				    fc.ac.abort_code != RXGEN_OPCODE)
-					continue;
-				set_bit(AFS_SERVER_FL_NO_RM2, &fc.cbi->server->flags);
-			}
-
-			afs_fs_remove(&fc, vnode, dentry->d_name.name, false, &scb[0]);
-		}
+	afs_op_set_vnode(op, 0, dvnode);
+	afs_op_set_vnode(op, 1, vnode);
 
-		afs_vnode_commit_status(&fc, dvnode, fc.cb_break,
-					&dir_data_version, &scb[0]);
-		ret = afs_end_vnode_operation(&fc);
-		if (ret == 0) {
-			drop_nlink(&vnode->vfs_inode);
-			if (vnode->vfs_inode.i_nlink == 0) {
-				set_bit(AFS_VNODE_DELETED, &vnode->flags);
-				clear_bit(AFS_VNODE_CB_PROMISED, &vnode->flags);
-			}
-		}
-		if (ret == 0) {
-			down_write(&dvnode->validate_lock);
-			if (test_bit(AFS_VNODE_DIR_VALID, &dvnode->flags) &&
-			    dvnode->status.data_version == dir_data_version)
-				afs_edit_dir_remove(dvnode, &dentry->d_name,
-						    afs_edit_dir_for_unlink);
-			up_write(&dvnode->validate_lock);
-		}
-	}
+	op->dentry	= dentry;
+	op->ops		= &afs_silly_unlink_operation;
 
-	kfree(scb);
-	_leave(" = %d", ret);
-	return ret;
+	trace_afs_silly_rename(vnode, true);
+	return afs_do_sync_operation(op);
 }
 
 /*
diff --git a/fs/afs/dynroot.c b/fs/afs/dynroot.c
index 7503899c0a1b..b79879aacc02 100644
--- a/fs/afs/dynroot.c
+++ b/fs/afs/dynroot.c
@@ -10,6 +10,99 @@
 #include <linux/dns_resolver.h>
 #include "internal.h"
 
+static atomic_t afs_autocell_ino;
+
+/*
+ * iget5() comparator for inode created by autocell operations
+ *
+ * These pseudo inodes don't match anything.
+ */
+static int afs_iget5_pseudo_test(struct inode *inode, void *opaque)
+{
+	return 0;
+}
+
+/*
+ * iget5() inode initialiser
+ */
+static int afs_iget5_pseudo_set(struct inode *inode, void *opaque)
+{
+	struct afs_super_info *as = AFS_FS_S(inode->i_sb);
+	struct afs_vnode *vnode = AFS_FS_I(inode);
+	struct afs_fid *fid = opaque;
+
+	vnode->volume		= as->volume;
+	vnode->fid		= *fid;
+	inode->i_ino		= fid->vnode;
+	inode->i_generation	= fid->unique;
+	return 0;
+}
+
+/*
+ * Create an inode for a dynamic root directory or an autocell dynamic
+ * automount dir.
+ */
+struct inode *afs_iget_pseudo_dir(struct super_block *sb, bool root)
+{
+	struct afs_super_info *as = AFS_FS_S(sb);
+	struct afs_vnode *vnode;
+	struct inode *inode;
+	struct afs_fid fid = {};
+
+	_enter("");
+
+	if (as->volume)
+		fid.vid = as->volume->vid;
+	if (root) {
+		fid.vnode = 1;
+		fid.unique = 1;
+	} else {
+		fid.vnode = atomic_inc_return(&afs_autocell_ino);
+		fid.unique = 0;
+	}
+
+	inode = iget5_locked(sb, fid.vnode,
+			     afs_iget5_pseudo_test, afs_iget5_pseudo_set, &fid);
+	if (!inode) {
+		_leave(" = -ENOMEM");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	_debug("GOT INODE %p { ino=%lu, vl=%llx, vn=%llx, u=%x }",
+	       inode, inode->i_ino, fid.vid, fid.vnode, fid.unique);
+
+	vnode = AFS_FS_I(inode);
+
+	/* there shouldn't be an existing inode */
+	BUG_ON(!(inode->i_state & I_NEW));
+
+	inode->i_size		= 0;
+	inode->i_mode		= S_IFDIR | S_IRUGO | S_IXUGO;
+	if (root) {
+		inode->i_op	= &afs_dynroot_inode_operations;
+		inode->i_fop	= &simple_dir_operations;
+	} else {
+		inode->i_op	= &afs_autocell_inode_operations;
+	}
+	set_nlink(inode, 2);
+	inode->i_uid		= GLOBAL_ROOT_UID;
+	inode->i_gid		= GLOBAL_ROOT_GID;
+	inode->i_ctime = inode->i_atime = inode->i_mtime = current_time(inode);
+	inode->i_blocks		= 0;
+	inode->i_generation	= 0;
+
+	set_bit(AFS_VNODE_PSEUDODIR, &vnode->flags);
+	if (!root) {
+		set_bit(AFS_VNODE_MOUNTPOINT, &vnode->flags);
+		inode->i_flags |= S_AUTOMOUNT;
+	}
+
+	inode->i_flags |= S_NOATIME;
+	unlock_new_inode(inode);
+	_leave(" = %p", inode);
+	return inode;
+}
+
 /*
  * Probe to see if a cell may exist.  This prevents positive dentries from
  * being created unnecessarily.
diff --git a/fs/afs/file.c b/fs/afs/file.c
index 0c0ccc1412ee..506c47471b42 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -69,7 +69,7 @@ static const struct vm_operations_struct afs_vm_ops = {
  */
 void afs_put_wb_key(struct afs_wb_key *wbk)
 {
-	if (refcount_dec_and_test(&wbk->usage)) {
+	if (wbk && refcount_dec_and_test(&wbk->usage)) {
 		key_put(wbk->key);
 		kfree(wbk);
 	}
@@ -220,14 +220,35 @@ static void afs_file_readpage_read_complete(struct page *page,
 }
 #endif
 
+static void afs_fetch_data_success(struct afs_operation *op)
+{
+	struct afs_vnode *vnode = op->file[0].vnode;
+
+	_enter("op=%08x", op->debug_id);
+	afs_check_for_remote_deletion(op, vnode);
+	afs_vnode_commit_status(op, &op->file[0]);
+	afs_stat_v(vnode, n_fetches);
+	atomic_long_add(op->fetch.req->actual_len, &op->net->n_fetch_bytes);
+}
+
+static void afs_fetch_data_put(struct afs_operation *op)
+{
+	afs_put_read(op->fetch.req);
+}
+
+static const struct afs_operation_ops afs_fetch_data_operation = {
+	.issue_afs_rpc	= afs_fs_fetch_data,
+	.issue_yfs_rpc	= yfs_fs_fetch_data,
+	.success	= afs_fetch_data_success,
+	.put		= afs_fetch_data_put,
+};
+
 /*
  * Fetch file data from the volume.
  */
 int afs_fetch_data(struct afs_vnode *vnode, struct key *key, struct afs_read *req)
 {
-	struct afs_operation fc;
-	struct afs_status_cb *scb;
-	int ret;
+	struct afs_operation *op;
 
 	_enter("%s{%llx:%llu.%u},%x,,,",
 	       vnode->volume->name,
@@ -236,34 +257,15 @@ int afs_fetch_data(struct afs_vnode *vnode, struct key *key, struct afs_read *re
 	       vnode->fid.unique,
 	       key_serial(key));
 
-	scb = kzalloc(sizeof(struct afs_status_cb), GFP_KERNEL);
-	if (!scb)
-		return -ENOMEM;
-
-	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
-		afs_dataversion_t data_version = vnode->status.data_version;
+	op = afs_alloc_operation(key, vnode->volume);
+	if (IS_ERR(op))
+		return PTR_ERR(op);
 
-		while (afs_select_fileserver(&fc)) {
-			fc.cb_break = afs_calc_vnode_cb_break(vnode);
-			afs_fs_fetch_data(&fc, scb, req);
-		}
-
-		afs_check_for_remote_deletion(&fc, vnode);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break,
-					&data_version, scb);
-		ret = afs_end_vnode_operation(&fc);
-	}
+	afs_op_set_vnode(op, 0, vnode);
 
-	if (ret == 0) {
-		afs_stat_v(vnode, n_fetches);
-		atomic_long_add(req->actual_len,
-				&afs_v2net(vnode)->n_fetch_bytes);
-	}
-
-	kfree(scb);
-	_leave(" = %d", ret);
-	return ret;
+	op->fetch.req	= afs_get_read(req);
+	op->ops		= &afs_fetch_data_operation;
+	return afs_do_sync_operation(op);
 }
 
 /*
diff --git a/fs/afs/flock.c b/fs/afs/flock.c
index 682fe745f10e..70e518f7bc19 100644
--- a/fs/afs/flock.c
+++ b/fs/afs/flock.c
@@ -70,7 +70,8 @@ static void afs_schedule_lock_extension(struct afs_vnode *vnode)
  */
 void afs_lock_op_done(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->lvnode;
+	struct afs_operation *op = call->op;
+	struct afs_vnode *vnode = op->lock.lvnode;
 
 	if (call->error == 0) {
 		spin_lock(&vnode->lock);
@@ -172,15 +173,28 @@ static void afs_kill_lockers_enoent(struct afs_vnode *vnode)
 	vnode->lock_key = NULL;
 }
 
+static void afs_lock_success(struct afs_operation *op)
+{
+	struct afs_vnode *vnode = op->file[0].vnode;
+
+	_enter("op=%08x", op->debug_id);
+	afs_check_for_remote_deletion(op, vnode);
+	afs_vnode_commit_status(op, &op->file[0]);
+}
+
+static const struct afs_operation_ops afs_set_lock_operation = {
+	.issue_afs_rpc	= afs_fs_set_lock,
+	.issue_yfs_rpc	= yfs_fs_set_lock,
+	.success	= afs_lock_success,
+};
+
 /*
  * Get a lock on a file
  */
 static int afs_set_lock(struct afs_vnode *vnode, struct key *key,
 			afs_lock_type_t type)
 {
-	struct afs_status_cb *scb;
-	struct afs_operation fc;
-	int ret;
+	struct afs_operation *op;
 
 	_enter("%s{%llx:%llu.%u},%x,%u",
 	       vnode->volume->name,
@@ -189,35 +203,29 @@ static int afs_set_lock(struct afs_vnode *vnode, struct key *key,
 	       vnode->fid.unique,
 	       key_serial(key), type);
 
-	scb = kzalloc(sizeof(struct afs_status_cb), GFP_KERNEL);
-	if (!scb)
-		return -ENOMEM;
+	op = afs_alloc_operation(key, vnode->volume);
+	if (IS_ERR(op))
+		return PTR_ERR(op);
 
-	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
-		while (afs_select_fileserver(&fc)) {
-			fc.cb_break = afs_calc_vnode_cb_break(vnode);
-			afs_fs_set_lock(&fc, type, scb);
-		}
-
-		afs_check_for_remote_deletion(&fc, vnode);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break, NULL, scb);
-		ret = afs_end_vnode_operation(&fc);
-	}
+	afs_op_set_vnode(op, 0, vnode);
 
-	kfree(scb);
-	_leave(" = %d", ret);
-	return ret;
+	op->lock.type	= type;
+	op->ops		= &afs_set_lock_operation;
+	return afs_do_sync_operation(op);
 }
 
+static const struct afs_operation_ops afs_extend_lock_operation = {
+	.issue_afs_rpc	= afs_fs_extend_lock,
+	.issue_yfs_rpc	= yfs_fs_extend_lock,
+	.success	= afs_lock_success,
+};
+
 /*
  * Extend a lock on a file
  */
 static int afs_extend_lock(struct afs_vnode *vnode, struct key *key)
 {
-	struct afs_status_cb *scb;
-	struct afs_operation fc;
-	int ret;
+	struct afs_operation *op;
 
 	_enter("%s{%llx:%llu.%u},%x",
 	       vnode->volume->name,
@@ -226,35 +234,29 @@ static int afs_extend_lock(struct afs_vnode *vnode, struct key *key)
 	       vnode->fid.unique,
 	       key_serial(key));
 
-	scb = kzalloc(sizeof(struct afs_status_cb), GFP_KERNEL);
-	if (!scb)
-		return -ENOMEM;
-
-	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, key, false)) {
-		while (afs_select_current_fileserver(&fc)) {
-			fc.cb_break = afs_calc_vnode_cb_break(vnode);
-			afs_fs_extend_lock(&fc, scb);
-		}
+	op = afs_alloc_operation(key, vnode->volume);
+	if (IS_ERR(op))
+		return PTR_ERR(op);
 
-		afs_check_for_remote_deletion(&fc, vnode);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break, NULL, scb);
-		ret = afs_end_vnode_operation(&fc);
-	}
+	afs_op_set_vnode(op, 0, vnode);
 
-	kfree(scb);
-	_leave(" = %d", ret);
-	return ret;
+	op->flags	|= AFS_OPERATION_UNINTR;
+	op->ops		= &afs_extend_lock_operation;
+	return afs_do_sync_operation(op);
 }
 
+static const struct afs_operation_ops afs_release_lock_operation = {
+	.issue_afs_rpc	= afs_fs_release_lock,
+	.issue_yfs_rpc	= yfs_fs_release_lock,
+	.success	= afs_lock_success,
+};
+
 /*
  * Release a lock on a file
  */
 static int afs_release_lock(struct afs_vnode *vnode, struct key *key)
 {
-	struct afs_status_cb *scb;
-	struct afs_operation fc;
-	int ret;
+	struct afs_operation *op;
 
 	_enter("%s{%llx:%llu.%u},%x",
 	       vnode->volume->name,
@@ -263,25 +265,15 @@ static int afs_release_lock(struct afs_vnode *vnode, struct key *key)
 	       vnode->fid.unique,
 	       key_serial(key));
 
-	scb = kzalloc(sizeof(struct afs_status_cb), GFP_KERNEL);
-	if (!scb)
-		return -ENOMEM;
+	op = afs_alloc_operation(key, vnode->volume);
+	if (IS_ERR(op))
+		return PTR_ERR(op);
 
-	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, key, false)) {
-		while (afs_select_current_fileserver(&fc)) {
-			fc.cb_break = afs_calc_vnode_cb_break(vnode);
-			afs_fs_release_lock(&fc, scb);
-		}
+	afs_op_set_vnode(op, 0, vnode);
 
-		afs_check_for_remote_deletion(&fc, vnode);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break, NULL, scb);
-		ret = afs_end_vnode_operation(&fc);
-	}
-
-	kfree(scb);
-	_leave(" = %d", ret);
-	return ret;
+	op->flags	|= AFS_OPERATION_UNINTR;
+	op->ops		= &afs_release_lock_operation;
+	return afs_do_sync_operation(op);
 }
 
 /*
diff --git a/fs/afs/fs_operation.c b/fs/afs/fs_operation.c
new file mode 100644
index 000000000000..f7a768d12141
--- /dev/null
+++ b/fs/afs/fs_operation.c
@@ -0,0 +1,246 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Fileserver-directed operation handling.
+ *
+ * Copyright (C) 2020 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/fs.h>
+#include "internal.h"
+
+static atomic_t afs_operation_debug_counter;
+
+/*
+ * Create an operation against a volume.
+ */
+struct afs_operation *afs_alloc_operation(struct key *key, struct afs_volume *volume)
+{
+	struct afs_operation *op;
+
+	_enter("");
+
+	op = kzalloc(sizeof(*op), GFP_KERNEL);
+	if (!op)
+		return ERR_PTR(-ENOMEM);
+
+	if (!key) {
+		key = afs_request_key(volume->cell);
+		if (IS_ERR(key)) {
+			kfree(op);
+			return ERR_CAST(key);
+		}
+	} else {
+		key_get(key);
+	}
+
+	op->key		= key;
+	op->volume	= afs_get_volume(volume);
+	op->net		= volume->cell->net;
+	op->cb_v_break	= volume->cb_v_break;
+	op->debug_id	= atomic_inc_return(&afs_operation_debug_counter);
+	op->error	= -EDESTADDRREQ;
+	op->ac.error	= SHRT_MAX;
+
+	_leave(" = [op=%08x]", op->debug_id);
+	return op;
+}
+
+/*
+ * Lock the vnode(s) being operated upon.
+ */
+static bool afs_get_io_locks(struct afs_operation *op)
+{
+	struct afs_vnode *vnode = op->file[0].vnode;
+	struct afs_vnode *vnode2 = op->file[1].vnode;
+
+	_enter("");
+
+	if (op->flags & AFS_OPERATION_UNINTR) {
+		mutex_lock(&vnode->io_lock);
+		op->flags |= AFS_OPERATION_LOCK_0;
+		_leave(" = t [1]");
+		return true;
+	}
+
+	if (!vnode2 || !op->file[1].need_io_lock || vnode == vnode2)
+		vnode2 = NULL;
+
+	if (vnode2 > vnode)
+		swap(vnode, vnode2);
+
+	if (mutex_lock_interruptible(&vnode->io_lock) < 0) {
+		op->error = -EINTR;
+		op->flags |= AFS_OPERATION_STOP;
+		_leave(" = f [I 0]");
+		return false;
+	}
+	op->flags |= AFS_OPERATION_LOCK_0;
+
+	if (vnode2) {
+		if (mutex_lock_interruptible_nested(&vnode2->io_lock, 1) < 0) {
+			op->error = -EINTR;
+			op->flags |= AFS_OPERATION_STOP;
+			mutex_unlock(&vnode->io_lock);
+			op->flags &= ~AFS_OPERATION_LOCK_0;
+			_leave(" = f [I 1]");
+			return false;
+		}
+		op->flags |= AFS_OPERATION_LOCK_1;
+	}
+
+	_leave(" = t [2]");
+	return true;
+}
+
+static void afs_drop_io_locks(struct afs_operation *op)
+{
+	struct afs_vnode *vnode = op->file[0].vnode;
+	struct afs_vnode *vnode2 = op->file[1].vnode;
+
+	_enter("");
+
+	if (op->flags & AFS_OPERATION_LOCK_1)
+		mutex_unlock(&vnode2->io_lock);
+	if (op->flags & AFS_OPERATION_LOCK_0)
+		mutex_unlock(&vnode->io_lock);
+}
+
+static void afs_prepare_vnode(struct afs_operation *op, struct afs_vnode_param *vp,
+			      unsigned int index)
+{
+	struct afs_vnode *vnode = vp->vnode;
+
+	if (vnode) {
+		vp->fid			= vnode->fid;
+		vp->dv_before		= vnode->status.data_version;
+		vp->cb_break_before	= afs_calc_vnode_cb_break(vnode);
+		if (vnode->lock_state != AFS_VNODE_LOCK_NONE)
+			op->flags	|= AFS_OPERATION_CUR_ONLY;
+	}
+
+	if (vp->fid.vnode)
+		_debug("PREP[%u] {%llx:%llu.%u}",
+		       index, vp->fid.vid, vp->fid.vnode, vp->fid.unique);
+}
+
+/*
+ * Begin an operation on the fileserver.
+ *
+ * Fileserver operations are serialised on the server by vnode, so we serialise
+ * them here also using the io_lock.
+ */
+bool afs_begin_vnode_operation(struct afs_operation *op)
+{
+	struct afs_vnode *vnode = op->file[0].vnode;
+
+	ASSERT(vnode);
+
+	_enter("");
+
+	if (op->file[0].need_io_lock)
+		if (!afs_get_io_locks(op))
+			return false;
+
+	read_seqlock_excl(&vnode->cb_lock);
+	op->cbi = afs_get_cb_interest(
+		rcu_dereference_protected(vnode->cb_interest,
+					  lockdep_is_held(&vnode->cb_lock.lock)));
+	read_sequnlock_excl(&vnode->cb_lock);
+
+	afs_prepare_vnode(op, &op->file[0], 0);
+	afs_prepare_vnode(op, &op->file[1], 1);
+	op->cb_v_break = op->volume->cb_v_break;
+	_leave(" = true");
+	return true;
+}
+
+/*
+ * Tidy up a filesystem cursor and unlock the vnode.
+ */
+static void afs_end_vnode_operation(struct afs_operation *op)
+{
+	_enter("");
+
+	if (op->error == -EDESTADDRREQ ||
+	    op->error == -EADDRNOTAVAIL ||
+	    op->error == -ENETUNREACH ||
+	    op->error == -EHOSTUNREACH)
+		afs_dump_edestaddrreq(op);
+
+	afs_drop_io_locks(op);
+
+	if (op->error == -ECONNABORTED)
+		op->error = afs_abort_to_error(op->ac.abort_code);
+}
+
+/*
+ * Wait for an in-progress operation to complete.
+ */
+void afs_wait_for_operation(struct afs_operation *op)
+{
+	_enter("");
+
+	while (afs_select_fileserver(op)) {
+		op->cb_s_break = op->cbi->server->cb_s_break;
+		if (test_bit(AFS_SERVER_FL_IS_YFS, &op->cbi->server->flags) &&
+		    op->ops->issue_yfs_rpc)
+			op->ops->issue_yfs_rpc(op);
+		else
+			op->ops->issue_afs_rpc(op);
+
+		op->error = afs_wait_for_call_to_complete(op->call, &op->ac);
+	}
+
+	if (op->error == 0) {
+		_debug("success");
+		op->ops->success(op);
+	}
+
+	afs_end_vnode_operation(op);
+
+	if (op->error == 0 && op->ops->edit_dir) {
+		_debug("edit_dir");
+		op->ops->edit_dir(op);
+	}
+	_leave("");
+}
+
+/*
+ * Dispose of an operation.
+ */
+int afs_put_operation(struct afs_operation *op)
+{
+	int i, ret = op->error;
+
+	_enter("op=%08x,%d", op->debug_id, ret);
+
+	if (op->ops && op->ops->put)
+		op->ops->put(op);
+	if (op->file[0].put_vnode)
+		iput(&op->file[0].vnode->vfs_inode);
+	if (op->file[1].put_vnode)
+		iput(&op->file[1].vnode->vfs_inode);
+
+	if (op->more_files) {
+		for (i = 0; i < op->nr_files - 2; i++)
+			if (op->more_files[i].put_vnode)
+				iput(&op->more_files[i].vnode->vfs_inode);
+		kfree(op->more_files);
+	}
+
+	afs_end_cursor(&op->ac);
+	afs_put_cb_interest(op->net, op->cbi);
+	afs_put_serverlist(op->net, op->server_list);
+	afs_put_volume(op->net, op->volume);
+	kfree(op);
+	return ret;
+}
+
+int afs_do_sync_operation(struct afs_operation *op)
+{
+	afs_begin_vnode_operation(op);
+	afs_wait_for_operation(op);
+	return afs_put_operation(op);
+}
diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index 3e423e9daa24..24a880a8d64c 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -13,7 +13,6 @@
 #include "internal.h"
 #include "afs_fs.h"
 #include "xdr_fs.h"
-#include "protocol_yfs.h"
 
 static inline void afs_use_fs_server(struct afs_call *call, struct afs_cb_interest *cbi)
 {
@@ -240,8 +239,10 @@ static void xdr_decode_AFSFetchVolumeStatus(const __be32 **_bp,
 /*
  * deliver reply data to an FS.FetchStatus
  */
-static int afs_deliver_fs_fetch_status_vnode(struct afs_call *call)
+static int afs_deliver_fs_fetch_status(struct afs_call *call)
 {
+	struct afs_operation *op = call->op;
+	struct afs_vnode_param *vp = &op->file[op->fetch_status.which];
 	const __be32 *bp;
 	int ret;
 
@@ -251,9 +252,9 @@ static int afs_deliver_fs_fetch_status_vnode(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
-	xdr_decode_AFSCallBack(&bp, call, call->out_scb);
-	xdr_decode_AFSVolSync(&bp, call->out_volsync);
+	xdr_decode_AFSFetchStatus(&bp, call, &vp->scb);
+	xdr_decode_AFSCallBack(&bp, call, &vp->scb);
+	xdr_decode_AFSVolSync(&bp, &op->volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -265,51 +266,36 @@ static int afs_deliver_fs_fetch_status_vnode(struct afs_call *call)
 static const struct afs_call_type afs_RXFSFetchStatus_vnode = {
 	.name		= "FS.FetchStatus(vnode)",
 	.op		= afs_FS_FetchStatus,
-	.deliver	= afs_deliver_fs_fetch_status_vnode,
+	.deliver	= afs_deliver_fs_fetch_status,
 	.destructor	= afs_flat_call_destructor,
 };
 
 /*
  * fetch the status information for a file
  */
-int afs_fs_fetch_file_status(struct afs_operation *fc, struct afs_status_cb *scb,
-			     struct afs_volsync *volsync)
+void afs_fs_fetch_status(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[op->fetch_status.which];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
 	__be32 *bp;
 
-	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
-		return yfs_fs_fetch_file_status(fc, scb, volsync);
-
 	_enter(",%x,{%llx:%llu},,",
-	       key_serial(fc->key), vnode->fid.vid, vnode->fid.vnode);
+	       key_serial(op->key), vp->fid.vid, vp->fid.vnode);
 
-	call = afs_alloc_flat_call(net, &afs_RXFSFetchStatus_vnode,
+	call = afs_alloc_flat_call(op->net, &afs_RXFSFetchStatus_vnode,
 				   16, (21 + 3 + 6) * 4);
-	if (!call) {
-		fc->ac.error = -ENOMEM;
-		return -ENOMEM;
-	}
-
-	call->key = fc->key;
-	call->out_scb = scb;
-	call->out_volsync = volsync;
+	if (!call)
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp[0] = htonl(FSFETCHSTATUS);
-	bp[1] = htonl(vnode->fid.vid);
-	bp[2] = htonl(vnode->fid.vnode);
-	bp[3] = htonl(vnode->fid.unique);
+	bp[1] = htonl(vp->fid.vid);
+	bp[2] = htonl(vp->fid.vnode);
+	bp[3] = htonl(vp->fid.unique);
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, &vnode->fid);
-
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -317,7 +303,9 @@ int afs_fs_fetch_file_status(struct afs_operation *fc, struct afs_status_cb *scb
  */
 static int afs_deliver_fs_fetch_data(struct afs_call *call)
 {
-	struct afs_read *req = call->read_request;
+	struct afs_operation *op = call->op;
+	struct afs_vnode_param *vp = &op->file[0];
+	struct afs_read *req = op->fetch.req;
 	const __be32 *bp;
 	unsigned int size;
 	int ret;
@@ -414,12 +402,12 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 			return ret;
 
 		bp = call->buffer;
-		xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
-		xdr_decode_AFSCallBack(&bp, call, call->out_scb);
-		xdr_decode_AFSVolSync(&bp, call->out_volsync);
+		xdr_decode_AFSFetchStatus(&bp, call, &vp->scb);
+		xdr_decode_AFSCallBack(&bp, call, &vp->scb);
+		xdr_decode_AFSVolSync(&bp, &op->volsync);
 
-		req->data_version = call->out_scb->status.data_version;
-		req->file_size = call->out_scb->status.size;
+		req->data_version = vp->scb.status.data_version;
+		req->file_size = vp->scb.status.size;
 
 		call->unmarshall++;
 
@@ -442,14 +430,6 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 	return 0;
 }
 
-static void afs_fetch_data_destructor(struct afs_call *call)
-{
-	struct afs_read *req = call->read_request;
-
-	afs_put_read(req);
-	afs_flat_call_destructor(call);
-}
-
 /*
  * FS.FetchData operation type
  */
@@ -457,102 +437,79 @@ static const struct afs_call_type afs_RXFSFetchData = {
 	.name		= "FS.FetchData",
 	.op		= afs_FS_FetchData,
 	.deliver	= afs_deliver_fs_fetch_data,
-	.destructor	= afs_fetch_data_destructor,
+	.destructor	= afs_flat_call_destructor,
 };
 
 static const struct afs_call_type afs_RXFSFetchData64 = {
 	.name		= "FS.FetchData64",
 	.op		= afs_FS_FetchData64,
 	.deliver	= afs_deliver_fs_fetch_data,
-	.destructor	= afs_fetch_data_destructor,
+	.destructor	= afs_flat_call_destructor,
 };
 
 /*
  * fetch data from a very large file
  */
-static int afs_fs_fetch_data64(struct afs_operation *fc,
-			       struct afs_status_cb *scb,
-			       struct afs_read *req)
+static void afs_fs_fetch_data64(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
+	struct afs_read *req = op->fetch.req;
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
 	__be32 *bp;
 
 	_enter("");
 
-	call = afs_alloc_flat_call(net, &afs_RXFSFetchData64, 32, (21 + 3 + 6) * 4);
+	call = afs_alloc_flat_call(op->net, &afs_RXFSFetchData64, 32, (21 + 3 + 6) * 4);
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->out_scb = scb;
-	call->out_volsync = NULL;
-	call->read_request = afs_get_read(req);
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp[0] = htonl(FSFETCHDATA64);
-	bp[1] = htonl(vnode->fid.vid);
-	bp[2] = htonl(vnode->fid.vnode);
-	bp[3] = htonl(vnode->fid.unique);
+	bp[1] = htonl(vp->fid.vid);
+	bp[2] = htonl(vp->fid.vnode);
+	bp[3] = htonl(vp->fid.unique);
 	bp[4] = htonl(upper_32_bits(req->pos));
 	bp[5] = htonl(lower_32_bits(req->pos));
 	bp[6] = 0;
 	bp[7] = htonl(lower_32_bits(req->len));
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, &vnode->fid);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
  * fetch data from a file
  */
-int afs_fs_fetch_data(struct afs_operation *fc,
-		      struct afs_status_cb *scb,
-		      struct afs_read *req)
+void afs_fs_fetch_data(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
+	struct afs_read *req = op->fetch.req;
 	__be32 *bp;
 
-	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
-		return yfs_fs_fetch_data(fc, scb, req);
-
 	if (upper_32_bits(req->pos) ||
 	    upper_32_bits(req->len) ||
 	    upper_32_bits(req->pos + req->len))
-		return afs_fs_fetch_data64(fc, scb, req);
+		return afs_fs_fetch_data64(op);
 
 	_enter("");
 
-	call = afs_alloc_flat_call(net, &afs_RXFSFetchData, 24, (21 + 3 + 6) * 4);
+	call = afs_alloc_flat_call(op->net, &afs_RXFSFetchData, 24, (21 + 3 + 6) * 4);
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->out_scb = scb;
-	call->out_volsync = NULL;
-	call->read_request = afs_get_read(req);
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp[0] = htonl(FSFETCHDATA);
-	bp[1] = htonl(vnode->fid.vid);
-	bp[2] = htonl(vnode->fid.vnode);
-	bp[3] = htonl(vnode->fid.unique);
+	bp[1] = htonl(vp->fid.vid);
+	bp[2] = htonl(vp->fid.vnode);
+	bp[3] = htonl(vp->fid.unique);
 	bp[4] = htonl(lower_32_bits(req->pos));
 	bp[5] = htonl(lower_32_bits(req->len));
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, &vnode->fid);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -560,6 +517,9 @@ int afs_fs_fetch_data(struct afs_operation *fc,
  */
 static int afs_deliver_fs_create_vnode(struct afs_call *call)
 {
+	struct afs_operation *op = call->op;
+	struct afs_vnode_param *dvp = &op->file[0];
+	struct afs_vnode_param *vp = &op->file[1];
 	const __be32 *bp;
 	int ret;
 
@@ -569,11 +529,11 @@ static int afs_deliver_fs_create_vnode(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	xdr_decode_AFSFid(&bp, call->out_fid);
-	xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
-	xdr_decode_AFSFetchStatus(&bp, call, call->out_dir_scb);
-	xdr_decode_AFSCallBack(&bp, call, call->out_scb);
-	xdr_decode_AFSVolSync(&bp, call->out_volsync);
+	xdr_decode_AFSFid(&bp, &op->file[1].fid);
+	xdr_decode_AFSFetchStatus(&bp, call, &vp->scb);
+	xdr_decode_AFSFetchStatus(&bp, call, &dvp->scb);
+	xdr_decode_AFSCallBack(&bp, call, &vp->scb);
+	xdr_decode_AFSVolSync(&bp, &op->volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -589,6 +549,52 @@ static const struct afs_call_type afs_RXFSCreateFile = {
 	.destructor	= afs_flat_call_destructor,
 };
 
+/*
+ * Create a file.
+ */
+void afs_fs_create_file(struct afs_operation *op)
+{
+	const struct qstr *name = &op->dentry->d_name;
+	struct afs_vnode_param *dvp = &op->file[0];
+	struct afs_call *call;
+	size_t namesz, reqsz, padsz;
+	__be32 *bp;
+
+	_enter("");
+
+	namesz = name->len;
+	padsz = (4 - (namesz & 3)) & 3;
+	reqsz = (5 * 4) + namesz + padsz + (6 * 4);
+
+	call = afs_alloc_flat_call(op->net, &afs_RXFSCreateFile,
+				   reqsz, (3 + 21 + 21 + 3 + 6) * 4);
+	if (!call)
+		return afs_op_nomem(op);
+
+	/* marshall the parameters */
+	bp = call->request;
+	*bp++ = htonl(FSCREATEFILE);
+	*bp++ = htonl(dvp->fid.vid);
+	*bp++ = htonl(dvp->fid.vnode);
+	*bp++ = htonl(dvp->fid.unique);
+	*bp++ = htonl(namesz);
+	memcpy(bp, name->name, namesz);
+	bp = (void *) bp + namesz;
+	if (padsz > 0) {
+		memset(bp, 0, padsz);
+		bp = (void *) bp + padsz;
+	}
+	*bp++ = htonl(AFS_SET_MODE | AFS_SET_MTIME);
+	*bp++ = htonl(op->mtime.tv_sec); /* mtime */
+	*bp++ = 0; /* owner */
+	*bp++ = 0; /* group */
+	*bp++ = htonl(op->create.mode & S_IALLUGO); /* unix mode */
+	*bp++ = 0; /* segment size */
+
+	trace_afs_make_fs_call1(call, &dvp->fid, name);
+	afs_make_op_call(op, call, GFP_NOFS);
+}
+
 static const struct afs_call_type afs_RXFSMakeDir = {
 	.name		= "FS.MakeDir",
 	.op		= afs_FS_MakeDir,
@@ -597,80 +603,58 @@ static const struct afs_call_type afs_RXFSMakeDir = {
 };
 
 /*
- * create a file or make a directory
- */
-int afs_fs_create(struct afs_operation *fc,
-		  const char *name,
-		  umode_t mode,
-		  struct afs_status_cb *dvnode_scb,
-		  struct afs_fid *newfid,
-		  struct afs_status_cb *new_scb)
+ * Create a new directory
+ */
+void afs_fs_make_dir(struct afs_operation *op)
 {
-	struct afs_vnode *dvnode = fc->vnode;
+	const struct qstr *name = &op->dentry->d_name;
+	struct afs_vnode_param *dvp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(dvnode);
 	size_t namesz, reqsz, padsz;
 	__be32 *bp;
 
-	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags)){
-		if (S_ISDIR(mode))
-			return yfs_fs_make_dir(fc, name, mode, dvnode_scb,
-					       newfid, new_scb);
-		else
-			return yfs_fs_create_file(fc, name, mode, dvnode_scb,
-						  newfid, new_scb);
-	}
-
 	_enter("");
 
-	namesz = strlen(name);
+	namesz = name->len;
 	padsz = (4 - (namesz & 3)) & 3;
 	reqsz = (5 * 4) + namesz + padsz + (6 * 4);
 
-	call = afs_alloc_flat_call(
-		net, S_ISDIR(mode) ? &afs_RXFSMakeDir : &afs_RXFSCreateFile,
-		reqsz, (3 + 21 + 21 + 3 + 6) * 4);
+	call = afs_alloc_flat_call(op->net, &afs_RXFSMakeDir,
+				   reqsz, (3 + 21 + 21 + 3 + 6) * 4);
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->out_dir_scb = dvnode_scb;
-	call->out_fid = newfid;
-	call->out_scb = new_scb;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
-	*bp++ = htonl(S_ISDIR(mode) ? FSMAKEDIR : FSCREATEFILE);
-	*bp++ = htonl(dvnode->fid.vid);
-	*bp++ = htonl(dvnode->fid.vnode);
-	*bp++ = htonl(dvnode->fid.unique);
+	*bp++ = htonl(FSMAKEDIR);
+	*bp++ = htonl(dvp->fid.vid);
+	*bp++ = htonl(dvp->fid.vnode);
+	*bp++ = htonl(dvp->fid.unique);
 	*bp++ = htonl(namesz);
-	memcpy(bp, name, namesz);
+	memcpy(bp, name->name, namesz);
 	bp = (void *) bp + namesz;
 	if (padsz > 0) {
 		memset(bp, 0, padsz);
 		bp = (void *) bp + padsz;
 	}
 	*bp++ = htonl(AFS_SET_MODE | AFS_SET_MTIME);
-	*bp++ = htonl(dvnode->vfs_inode.i_mtime.tv_sec); /* mtime */
+	*bp++ = htonl(op->mtime.tv_sec); /* mtime */
 	*bp++ = 0; /* owner */
 	*bp++ = 0; /* group */
-	*bp++ = htonl(mode & S_IALLUGO); /* unix mode */
+	*bp++ = htonl(op->create.mode & S_IALLUGO); /* unix mode */
 	*bp++ = 0; /* segment size */
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call1(call, &dvnode->fid, name);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call1(call, &dvp->fid, name);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
- * Deliver reply data to any operation that returns directory status and volume
- * sync.
+ * Deliver reply data to any operation that returns status and volume sync.
  */
-static int afs_deliver_fs_dir_status_and_vol(struct afs_call *call)
+static int afs_deliver_fs_file_status_and_vol(struct afs_call *call)
 {
+	struct afs_operation *op = call->op;
+	struct afs_vnode_param *vp = &op->file[0];
 	const __be32 *bp;
 	int ret;
 
@@ -680,79 +664,108 @@ static int afs_deliver_fs_dir_status_and_vol(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	xdr_decode_AFSFetchStatus(&bp, call, call->out_dir_scb);
-	xdr_decode_AFSVolSync(&bp, call->out_volsync);
+	xdr_decode_AFSFetchStatus(&bp, call, &vp->scb);
+	xdr_decode_AFSVolSync(&bp, &op->volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
 }
 
 /*
- * FS.RemoveDir/FS.RemoveFile operation type
+ * FS.RemoveFile operation type
  */
 static const struct afs_call_type afs_RXFSRemoveFile = {
 	.name		= "FS.RemoveFile",
 	.op		= afs_FS_RemoveFile,
-	.deliver	= afs_deliver_fs_dir_status_and_vol,
+	.deliver	= afs_deliver_fs_file_status_and_vol,
 	.destructor	= afs_flat_call_destructor,
 };
 
+/*
+ * Remove a file.
+ */
+void afs_fs_remove_file(struct afs_operation *op)
+{
+	const struct qstr *name = &op->dentry->d_name;
+	struct afs_vnode_param *dvp = &op->file[0];
+	struct afs_call *call;
+	size_t namesz, reqsz, padsz;
+	__be32 *bp;
+
+	_enter("");
+
+	namesz = name->len;
+	padsz = (4 - (namesz & 3)) & 3;
+	reqsz = (5 * 4) + namesz + padsz;
+
+	call = afs_alloc_flat_call(op->net, &afs_RXFSRemoveFile,
+				   reqsz, (21 + 6) * 4);
+	if (!call)
+		return afs_op_nomem(op);
+
+	/* marshall the parameters */
+	bp = call->request;
+	*bp++ = htonl(FSREMOVEFILE);
+	*bp++ = htonl(dvp->fid.vid);
+	*bp++ = htonl(dvp->fid.vnode);
+	*bp++ = htonl(dvp->fid.unique);
+	*bp++ = htonl(namesz);
+	memcpy(bp, name->name, namesz);
+	bp = (void *) bp + namesz;
+	if (padsz > 0) {
+		memset(bp, 0, padsz);
+		bp = (void *) bp + padsz;
+	}
+
+	trace_afs_make_fs_call1(call, &dvp->fid, name);
+	afs_make_op_call(op, call, GFP_NOFS);
+}
+
 static const struct afs_call_type afs_RXFSRemoveDir = {
 	.name		= "FS.RemoveDir",
 	.op		= afs_FS_RemoveDir,
-	.deliver	= afs_deliver_fs_dir_status_and_vol,
+	.deliver	= afs_deliver_fs_file_status_and_vol,
 	.destructor	= afs_flat_call_destructor,
 };
 
 /*
- * remove a file or directory
+ * Remove a directory.
  */
-int afs_fs_remove(struct afs_operation *fc, struct afs_vnode *vnode,
-		  const char *name, bool isdir, struct afs_status_cb *dvnode_scb)
+void afs_fs_remove_dir(struct afs_operation *op)
 {
-	struct afs_vnode *dvnode = fc->vnode;
+	const struct qstr *name = &op->dentry->d_name;
+	struct afs_vnode_param *dvp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(dvnode);
 	size_t namesz, reqsz, padsz;
 	__be32 *bp;
 
-	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
-		return yfs_fs_remove(fc, vnode, name, isdir, dvnode_scb);
-
 	_enter("");
 
-	namesz = strlen(name);
+	namesz = name->len;
 	padsz = (4 - (namesz & 3)) & 3;
 	reqsz = (5 * 4) + namesz + padsz;
 
-	call = afs_alloc_flat_call(
-		net, isdir ? &afs_RXFSRemoveDir : &afs_RXFSRemoveFile,
-		reqsz, (21 + 6) * 4);
+	call = afs_alloc_flat_call(op->net, &afs_RXFSRemoveDir,
+				   reqsz, (21 + 6) * 4);
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->out_dir_scb = dvnode_scb;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
-	*bp++ = htonl(isdir ? FSREMOVEDIR : FSREMOVEFILE);
-	*bp++ = htonl(dvnode->fid.vid);
-	*bp++ = htonl(dvnode->fid.vnode);
-	*bp++ = htonl(dvnode->fid.unique);
+	*bp++ = htonl(FSREMOVEDIR);
+	*bp++ = htonl(dvp->fid.vid);
+	*bp++ = htonl(dvp->fid.vnode);
+	*bp++ = htonl(dvp->fid.unique);
 	*bp++ = htonl(namesz);
-	memcpy(bp, name, namesz);
+	memcpy(bp, name->name, namesz);
 	bp = (void *) bp + namesz;
 	if (padsz > 0) {
 		memset(bp, 0, padsz);
 		bp = (void *) bp + padsz;
 	}
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call1(call, &dvnode->fid, name);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call1(call, &dvp->fid, name);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -760,6 +773,9 @@ int afs_fs_remove(struct afs_operation *fc, struct afs_vnode *vnode,
  */
 static int afs_deliver_fs_link(struct afs_call *call)
 {
+	struct afs_operation *op = call->op;
+	struct afs_vnode_param *dvp = &op->file[0];
+	struct afs_vnode_param *vp = &op->file[1];
 	const __be32 *bp;
 	int ret;
 
@@ -771,9 +787,9 @@ static int afs_deliver_fs_link(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
-	xdr_decode_AFSFetchStatus(&bp, call, call->out_dir_scb);
-	xdr_decode_AFSVolSync(&bp, call->out_volsync);
+	xdr_decode_AFSFetchStatus(&bp, call, &vp->scb);
+	xdr_decode_AFSFetchStatus(&bp, call, &dvp->scb);
+	xdr_decode_AFSVolSync(&bp, &op->volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -792,56 +808,44 @@ static const struct afs_call_type afs_RXFSLink = {
 /*
  * make a hard link
  */
-int afs_fs_link(struct afs_operation *fc, struct afs_vnode *vnode,
-		const char *name,
-		struct afs_status_cb *dvnode_scb,
-		struct afs_status_cb *vnode_scb)
+void afs_fs_link(struct afs_operation *op)
 {
-	struct afs_vnode *dvnode = fc->vnode;
+	const struct qstr *name = &op->dentry->d_name;
+	struct afs_vnode_param *dvp = &op->file[0];
+	struct afs_vnode_param *vp = &op->file[1];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
 	size_t namesz, reqsz, padsz;
 	__be32 *bp;
 
-	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
-		return yfs_fs_link(fc, vnode, name, dvnode_scb, vnode_scb);
-
 	_enter("");
 
-	namesz = strlen(name);
+	namesz = name->len;
 	padsz = (4 - (namesz & 3)) & 3;
 	reqsz = (5 * 4) + namesz + padsz + (3 * 4);
 
-	call = afs_alloc_flat_call(net, &afs_RXFSLink, reqsz, (21 + 21 + 6) * 4);
+	call = afs_alloc_flat_call(op->net, &afs_RXFSLink, reqsz, (21 + 21 + 6) * 4);
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->out_dir_scb = dvnode_scb;
-	call->out_scb = vnode_scb;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	*bp++ = htonl(FSLINK);
-	*bp++ = htonl(dvnode->fid.vid);
-	*bp++ = htonl(dvnode->fid.vnode);
-	*bp++ = htonl(dvnode->fid.unique);
+	*bp++ = htonl(dvp->fid.vid);
+	*bp++ = htonl(dvp->fid.vnode);
+	*bp++ = htonl(dvp->fid.unique);
 	*bp++ = htonl(namesz);
-	memcpy(bp, name, namesz);
+	memcpy(bp, name->name, namesz);
 	bp = (void *) bp + namesz;
 	if (padsz > 0) {
 		memset(bp, 0, padsz);
 		bp = (void *) bp + padsz;
 	}
-	*bp++ = htonl(vnode->fid.vid);
-	*bp++ = htonl(vnode->fid.vnode);
-	*bp++ = htonl(vnode->fid.unique);
-
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call1(call, &vnode->fid, name);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	*bp++ = htonl(vp->fid.vid);
+	*bp++ = htonl(vp->fid.vnode);
+	*bp++ = htonl(vp->fid.unique);
+
+	trace_afs_make_fs_call1(call, &vp->fid, name);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -849,6 +853,9 @@ int afs_fs_link(struct afs_operation *fc, struct afs_vnode *vnode,
  */
 static int afs_deliver_fs_symlink(struct afs_call *call)
 {
+	struct afs_operation *op = call->op;
+	struct afs_vnode_param *dvp = &op->file[0];
+	struct afs_vnode_param *vp = &op->file[1];
 	const __be32 *bp;
 	int ret;
 
@@ -860,10 +867,10 @@ static int afs_deliver_fs_symlink(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	xdr_decode_AFSFid(&bp, call->out_fid);
-	xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
-	xdr_decode_AFSFetchStatus(&bp, call, call->out_dir_scb);
-	xdr_decode_AFSVolSync(&bp, call->out_volsync);
+	xdr_decode_AFSFid(&bp, &vp->fid);
+	xdr_decode_AFSFetchStatus(&bp, call, &vp->scb);
+	xdr_decode_AFSFetchStatus(&bp, call, &dvp->scb);
+	xdr_decode_AFSVolSync(&bp, &op->volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -882,75 +889,58 @@ static const struct afs_call_type afs_RXFSSymlink = {
 /*
  * create a symbolic link
  */
-int afs_fs_symlink(struct afs_operation *fc,
-		   const char *name,
-		   const char *contents,
-		   struct afs_status_cb *dvnode_scb,
-		   struct afs_fid *newfid,
-		   struct afs_status_cb *new_scb)
+void afs_fs_symlink(struct afs_operation *op)
 {
-	struct afs_vnode *dvnode = fc->vnode;
+	const struct qstr *name = &op->dentry->d_name;
+	struct afs_vnode_param *dvp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(dvnode);
 	size_t namesz, reqsz, padsz, c_namesz, c_padsz;
 	__be32 *bp;
 
-	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
-		return yfs_fs_symlink(fc, name, contents, dvnode_scb,
-				      newfid, new_scb);
-
 	_enter("");
 
-	namesz = strlen(name);
+	namesz = name->len;
 	padsz = (4 - (namesz & 3)) & 3;
 
-	c_namesz = strlen(contents);
+	c_namesz = strlen(op->create.symlink);
 	c_padsz = (4 - (c_namesz & 3)) & 3;
 
 	reqsz = (6 * 4) + namesz + padsz + c_namesz + c_padsz + (6 * 4);
 
-	call = afs_alloc_flat_call(net, &afs_RXFSSymlink, reqsz,
+	call = afs_alloc_flat_call(op->net, &afs_RXFSSymlink, reqsz,
 				   (3 + 21 + 21 + 6) * 4);
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->out_dir_scb = dvnode_scb;
-	call->out_fid = newfid;
-	call->out_scb = new_scb;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	*bp++ = htonl(FSSYMLINK);
-	*bp++ = htonl(dvnode->fid.vid);
-	*bp++ = htonl(dvnode->fid.vnode);
-	*bp++ = htonl(dvnode->fid.unique);
+	*bp++ = htonl(dvp->fid.vid);
+	*bp++ = htonl(dvp->fid.vnode);
+	*bp++ = htonl(dvp->fid.unique);
 	*bp++ = htonl(namesz);
-	memcpy(bp, name, namesz);
+	memcpy(bp, name->name, namesz);
 	bp = (void *) bp + namesz;
 	if (padsz > 0) {
 		memset(bp, 0, padsz);
 		bp = (void *) bp + padsz;
 	}
 	*bp++ = htonl(c_namesz);
-	memcpy(bp, contents, c_namesz);
+	memcpy(bp, op->create.symlink, c_namesz);
 	bp = (void *) bp + c_namesz;
 	if (c_padsz > 0) {
 		memset(bp, 0, c_padsz);
 		bp = (void *) bp + c_padsz;
 	}
 	*bp++ = htonl(AFS_SET_MODE | AFS_SET_MTIME);
-	*bp++ = htonl(dvnode->vfs_inode.i_mtime.tv_sec); /* mtime */
+	*bp++ = htonl(op->mtime.tv_sec); /* mtime */
 	*bp++ = 0; /* owner */
 	*bp++ = 0; /* group */
 	*bp++ = htonl(S_IRWXUGO); /* unix mode */
 	*bp++ = 0; /* segment size */
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call1(call, &dvnode->fid, name);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call1(call, &dvp->fid, name);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -958,6 +948,9 @@ int afs_fs_symlink(struct afs_operation *fc,
  */
 static int afs_deliver_fs_rename(struct afs_call *call)
 {
+	struct afs_operation *op = call->op;
+	struct afs_vnode_param *orig_dvp = &op->file[0];
+	struct afs_vnode_param *new_dvp = &op->file[1];
 	const __be32 *bp;
 	int ret;
 
@@ -969,9 +962,9 @@ static int afs_deliver_fs_rename(struct afs_call *call)
 	/* If the two dirs are the same, we have two copies of the same status
 	 * report, so we just decode it twice.
 	 */
-	xdr_decode_AFSFetchStatus(&bp, call, call->out_dir_scb);
-	xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
-	xdr_decode_AFSVolSync(&bp, call->out_volsync);
+	xdr_decode_AFSFetchStatus(&bp, call, &orig_dvp->scb);
+	xdr_decode_AFSFetchStatus(&bp, call, &new_dvp->scb);
+	xdr_decode_AFSVolSync(&bp, &op->volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -990,31 +983,22 @@ static const struct afs_call_type afs_RXFSRename = {
 /*
  * Rename/move a file or directory.
  */
-int afs_fs_rename(struct afs_operation *fc,
-		  const char *orig_name,
-		  struct afs_vnode *new_dvnode,
-		  const char *new_name,
-		  struct afs_status_cb *orig_dvnode_scb,
-		  struct afs_status_cb *new_dvnode_scb)
+void afs_fs_rename(struct afs_operation *op)
 {
-	struct afs_vnode *orig_dvnode = fc->vnode;
+	struct afs_vnode_param *orig_dvp = &op->file[0];
+	struct afs_vnode_param *new_dvp = &op->file[1];
+	const struct qstr *orig_name = &op->dentry->d_name;
+	const struct qstr *new_name = &op->dentry_2->d_name;
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(orig_dvnode);
 	size_t reqsz, o_namesz, o_padsz, n_namesz, n_padsz;
 	__be32 *bp;
 
-	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
-		return yfs_fs_rename(fc, orig_name,
-				     new_dvnode, new_name,
-				     orig_dvnode_scb,
-				     new_dvnode_scb);
-
 	_enter("");
 
-	o_namesz = strlen(orig_name);
+	o_namesz = orig_name->len;
 	o_padsz = (4 - (o_namesz & 3)) & 3;
 
-	n_namesz = strlen(new_name);
+	n_namesz = new_name->len;
 	n_padsz = (4 - (n_namesz & 3)) & 3;
 
 	reqsz = (4 * 4) +
@@ -1022,51 +1006,46 @@ int afs_fs_rename(struct afs_operation *fc,
 		(3 * 4) +
 		4 + n_namesz + n_padsz;
 
-	call = afs_alloc_flat_call(net, &afs_RXFSRename, reqsz, (21 + 21 + 6) * 4);
+	call = afs_alloc_flat_call(op->net, &afs_RXFSRename, reqsz, (21 + 21 + 6) * 4);
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->out_dir_scb = orig_dvnode_scb;
-	call->out_scb = new_dvnode_scb;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	*bp++ = htonl(FSRENAME);
-	*bp++ = htonl(orig_dvnode->fid.vid);
-	*bp++ = htonl(orig_dvnode->fid.vnode);
-	*bp++ = htonl(orig_dvnode->fid.unique);
+	*bp++ = htonl(orig_dvp->fid.vid);
+	*bp++ = htonl(orig_dvp->fid.vnode);
+	*bp++ = htonl(orig_dvp->fid.unique);
 	*bp++ = htonl(o_namesz);
-	memcpy(bp, orig_name, o_namesz);
+	memcpy(bp, orig_name->name, o_namesz);
 	bp = (void *) bp + o_namesz;
 	if (o_padsz > 0) {
 		memset(bp, 0, o_padsz);
 		bp = (void *) bp + o_padsz;
 	}
 
-	*bp++ = htonl(new_dvnode->fid.vid);
-	*bp++ = htonl(new_dvnode->fid.vnode);
-	*bp++ = htonl(new_dvnode->fid.unique);
+	*bp++ = htonl(new_dvp->fid.vid);
+	*bp++ = htonl(new_dvp->fid.vnode);
+	*bp++ = htonl(new_dvp->fid.unique);
 	*bp++ = htonl(n_namesz);
-	memcpy(bp, new_name, n_namesz);
+	memcpy(bp, new_name->name, n_namesz);
 	bp = (void *) bp + n_namesz;
 	if (n_padsz > 0) {
 		memset(bp, 0, n_padsz);
 		bp = (void *) bp + n_padsz;
 	}
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call2(call, &orig_dvnode->fid, orig_name, new_name);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call2(call, &orig_dvp->fid, orig_name, new_name);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
- * deliver reply data to an FS.StoreData
+ * Deliver reply data to FS.StoreData or FS.StoreStatus
  */
 static int afs_deliver_fs_store_data(struct afs_call *call)
 {
+	struct afs_operation *op = call->op;
+	struct afs_vnode_param *vp = &op->file[0];
 	const __be32 *bp;
 	int ret;
 
@@ -1078,8 +1057,8 @@ static int afs_deliver_fs_store_data(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
-	xdr_decode_AFSVolSync(&bp, call->out_volsync);
+	xdr_decode_AFSFetchStatus(&bp, call, &vp->scb);
+	xdr_decode_AFSVolSync(&bp, &op->volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -1105,90 +1084,69 @@ static const struct afs_call_type afs_RXFSStoreData64 = {
 /*
  * store a set of pages to a very large file
  */
-static int afs_fs_store_data64(struct afs_operation *fc,
-			       struct address_space *mapping,
-			       pgoff_t first, pgoff_t last,
-			       unsigned offset, unsigned to,
-			       loff_t size, loff_t pos, loff_t i_size,
-			       struct afs_status_cb *scb)
+static void afs_fs_store_data64(struct afs_operation *op,
+				loff_t pos, loff_t size, loff_t i_size)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
 	__be32 *bp;
 
 	_enter(",%x,{%llx:%llu},,",
-	       key_serial(fc->key), vnode->fid.vid, vnode->fid.vnode);
+	       key_serial(op->key), vp->fid.vid, vp->fid.vnode);
 
-	call = afs_alloc_flat_call(net, &afs_RXFSStoreData64,
+	call = afs_alloc_flat_call(op->net, &afs_RXFSStoreData64,
 				   (4 + 6 + 3 * 2) * 4,
 				   (21 + 6) * 4);
 	if (!call)
-		return -ENOMEM;
+		return afs_op_nomem(op);
 
-	call->key = fc->key;
-	call->mapping = mapping;
-	call->first = first;
-	call->last = last;
-	call->first_offset = offset;
-	call->last_to = to;
 	call->send_pages = true;
-	call->out_scb = scb;
 
 	/* marshall the parameters */
 	bp = call->request;
 	*bp++ = htonl(FSSTOREDATA64);
-	*bp++ = htonl(vnode->fid.vid);
-	*bp++ = htonl(vnode->fid.vnode);
-	*bp++ = htonl(vnode->fid.unique);
+	*bp++ = htonl(vp->fid.vid);
+	*bp++ = htonl(vp->fid.vnode);
+	*bp++ = htonl(vp->fid.unique);
 
 	*bp++ = htonl(AFS_SET_MTIME); /* mask */
-	*bp++ = htonl(vnode->vfs_inode.i_mtime.tv_sec); /* mtime */
+	*bp++ = htonl(op->mtime.tv_sec); /* mtime */
 	*bp++ = 0; /* owner */
 	*bp++ = 0; /* group */
 	*bp++ = 0; /* unix mode */
 	*bp++ = 0; /* segment size */
 
-	*bp++ = htonl(pos >> 32);
-	*bp++ = htonl((u32) pos);
-	*bp++ = htonl(size >> 32);
-	*bp++ = htonl((u32) size);
-	*bp++ = htonl(i_size >> 32);
-	*bp++ = htonl((u32) i_size);
-
-	trace_afs_make_fs_call(call, &vnode->fid);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	*bp++ = htonl(upper_32_bits(pos));
+	*bp++ = htonl(lower_32_bits(pos));
+	*bp++ = htonl(upper_32_bits(size));
+	*bp++ = htonl(lower_32_bits(size));
+	*bp++ = htonl(upper_32_bits(i_size));
+	*bp++ = htonl(lower_32_bits(i_size));
+
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
  * store a set of pages
  */
-int afs_fs_store_data(struct afs_operation *fc, struct address_space *mapping,
-		      pgoff_t first, pgoff_t last,
-		      unsigned offset, unsigned to,
-		      struct afs_status_cb *scb)
+void afs_fs_store_data(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
 	loff_t size, pos, i_size;
 	__be32 *bp;
 
-	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
-		return yfs_fs_store_data(fc, mapping, first, last, offset, to, scb);
-
 	_enter(",%x,{%llx:%llu},,",
-	       key_serial(fc->key), vnode->fid.vid, vnode->fid.vnode);
+	       key_serial(op->key), vp->fid.vid, vp->fid.vnode);
 
-	size = (loff_t)to - (loff_t)offset;
-	if (first != last)
-		size += (loff_t)(last - first) << PAGE_SHIFT;
-	pos = (loff_t)first << PAGE_SHIFT;
-	pos += offset;
+	size = (loff_t)op->store.last_to - (loff_t)op->store.first_offset;
+	if (op->store.first != op->store.last)
+		size += (loff_t)(op->store.last - op->store.first) << PAGE_SHIFT;
+	pos = (loff_t)op->store.first << PAGE_SHIFT;
+	pos += op->store.first_offset;
 
-	i_size = i_size_read(&vnode->vfs_inode);
+	i_size = i_size_read(&vp->vnode->vfs_inode);
 	if (pos + size > i_size)
 		i_size = size + pos;
 
@@ -1196,71 +1154,38 @@ int afs_fs_store_data(struct afs_operation *fc, struct address_space *mapping,
 	       (unsigned long long) size, (unsigned long long) pos,
 	       (unsigned long long) i_size);
 
-	if (pos >> 32 || i_size >> 32 || size >> 32 || (pos + size) >> 32)
-		return afs_fs_store_data64(fc, mapping, first, last, offset, to,
-					   size, pos, i_size, scb);
+	if (upper_32_bits(pos) || upper_32_bits(i_size) || upper_32_bits(size) ||
+	    upper_32_bits(pos + size))
+		return afs_fs_store_data64(op, pos, size, i_size);
 
-	call = afs_alloc_flat_call(net, &afs_RXFSStoreData,
+	call = afs_alloc_flat_call(op->net, &afs_RXFSStoreData,
 				   (4 + 6 + 3) * 4,
 				   (21 + 6) * 4);
 	if (!call)
-		return -ENOMEM;
+		return afs_op_nomem(op);
 
-	call->key = fc->key;
-	call->mapping = mapping;
-	call->first = first;
-	call->last = last;
-	call->first_offset = offset;
-	call->last_to = to;
 	call->send_pages = true;
-	call->out_scb = scb;
 
 	/* marshall the parameters */
 	bp = call->request;
 	*bp++ = htonl(FSSTOREDATA);
-	*bp++ = htonl(vnode->fid.vid);
-	*bp++ = htonl(vnode->fid.vnode);
-	*bp++ = htonl(vnode->fid.unique);
+	*bp++ = htonl(vp->fid.vid);
+	*bp++ = htonl(vp->fid.vnode);
+	*bp++ = htonl(vp->fid.unique);
 
 	*bp++ = htonl(AFS_SET_MTIME); /* mask */
-	*bp++ = htonl(vnode->vfs_inode.i_mtime.tv_sec); /* mtime */
+	*bp++ = htonl(op->mtime.tv_sec); /* mtime */
 	*bp++ = 0; /* owner */
 	*bp++ = 0; /* group */
 	*bp++ = 0; /* unix mode */
 	*bp++ = 0; /* segment size */
 
-	*bp++ = htonl(pos);
-	*bp++ = htonl(size);
-	*bp++ = htonl(i_size);
+	*bp++ = htonl(lower_32_bits(pos));
+	*bp++ = htonl(lower_32_bits(size));
+	*bp++ = htonl(lower_32_bits(i_size));
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, &vnode->fid);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
-}
-
-/*
- * deliver reply data to an FS.StoreStatus
- */
-static int afs_deliver_fs_store_status(struct afs_call *call)
-{
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
-	xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
-	xdr_decode_AFSVolSync(&bp, call->out_volsync);
-
-	_leave(" = 0 [done]");
-	return 0;
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -1269,21 +1194,21 @@ static int afs_deliver_fs_store_status(struct afs_call *call)
 static const struct afs_call_type afs_RXFSStoreStatus = {
 	.name		= "FS.StoreStatus",
 	.op		= afs_FS_StoreStatus,
-	.deliver	= afs_deliver_fs_store_status,
+	.deliver	= afs_deliver_fs_store_data,
 	.destructor	= afs_flat_call_destructor,
 };
 
 static const struct afs_call_type afs_RXFSStoreData_as_Status = {
 	.name		= "FS.StoreData",
 	.op		= afs_FS_StoreData,
-	.deliver	= afs_deliver_fs_store_status,
+	.deliver	= afs_deliver_fs_store_data,
 	.destructor	= afs_flat_call_destructor,
 };
 
 static const struct afs_call_type afs_RXFSStoreData64_as_Status = {
 	.name		= "FS.StoreData64",
 	.op		= afs_FS_StoreData64,
-	.deliver	= afs_deliver_fs_store_status,
+	.deliver	= afs_deliver_fs_store_data,
 	.destructor	= afs_flat_call_destructor,
 };
 
@@ -1291,85 +1216,74 @@ static const struct afs_call_type afs_RXFSStoreData64_as_Status = {
  * set the attributes on a very large file, using FS.StoreData rather than
  * FS.StoreStatus so as to alter the file size also
  */
-static int afs_fs_setattr_size64(struct afs_operation *fc, struct iattr *attr,
-				 struct afs_status_cb *scb)
+static void afs_fs_setattr_size64(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
+	struct iattr *attr = op->setattr.attr;
 	__be32 *bp;
 
 	_enter(",%x,{%llx:%llu},,",
-	       key_serial(fc->key), vnode->fid.vid, vnode->fid.vnode);
+	       key_serial(op->key), vp->fid.vid, vp->fid.vnode);
 
 	ASSERT(attr->ia_valid & ATTR_SIZE);
 
-	call = afs_alloc_flat_call(net, &afs_RXFSStoreData64_as_Status,
+	call = afs_alloc_flat_call(op->net, &afs_RXFSStoreData64_as_Status,
 				   (4 + 6 + 3 * 2) * 4,
 				   (21 + 6) * 4);
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->out_scb = scb;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	*bp++ = htonl(FSSTOREDATA64);
-	*bp++ = htonl(vnode->fid.vid);
-	*bp++ = htonl(vnode->fid.vnode);
-	*bp++ = htonl(vnode->fid.unique);
+	*bp++ = htonl(vp->fid.vid);
+	*bp++ = htonl(vp->fid.vnode);
+	*bp++ = htonl(vp->fid.unique);
 
 	xdr_encode_AFS_StoreStatus(&bp, attr);
 
-	*bp++ = htonl(attr->ia_size >> 32);	/* position of start of write */
-	*bp++ = htonl((u32) attr->ia_size);
-	*bp++ = 0;				/* size of write */
+	*bp++ = htonl(upper_32_bits(attr->ia_size));	/* position of start of write */
+	*bp++ = htonl(lower_32_bits(attr->ia_size));
+	*bp++ = 0;					/* size of write */
 	*bp++ = 0;
-	*bp++ = htonl(attr->ia_size >> 32);	/* new file length */
-	*bp++ = htonl((u32) attr->ia_size);
-
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, &vnode->fid);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	*bp++ = htonl(upper_32_bits(attr->ia_size));	/* new file length */
+	*bp++ = htonl(lower_32_bits(attr->ia_size));
+
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
  * set the attributes on a file, using FS.StoreData rather than FS.StoreStatus
  * so as to alter the file size also
  */
-static int afs_fs_setattr_size(struct afs_operation *fc, struct iattr *attr,
-			       struct afs_status_cb *scb)
+static void afs_fs_setattr_size(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
+	struct iattr *attr = op->setattr.attr;
 	__be32 *bp;
 
 	_enter(",%x,{%llx:%llu},,",
-	       key_serial(fc->key), vnode->fid.vid, vnode->fid.vnode);
+	       key_serial(op->key), vp->fid.vid, vp->fid.vnode);
 
 	ASSERT(attr->ia_valid & ATTR_SIZE);
-	if (attr->ia_size >> 32)
-		return afs_fs_setattr_size64(fc, attr, scb);
+	if (upper_32_bits(attr->ia_size))
+		return afs_fs_setattr_size64(op);
 
-	call = afs_alloc_flat_call(net, &afs_RXFSStoreData_as_Status,
+	call = afs_alloc_flat_call(op->net, &afs_RXFSStoreData_as_Status,
 				   (4 + 6 + 3) * 4,
 				   (21 + 6) * 4);
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->out_scb = scb;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	*bp++ = htonl(FSSTOREDATA);
-	*bp++ = htonl(vnode->fid.vid);
-	*bp++ = htonl(vnode->fid.vnode);
-	*bp++ = htonl(vnode->fid.unique);
+	*bp++ = htonl(vp->fid.vid);
+	*bp++ = htonl(vp->fid.vnode);
+	*bp++ = htonl(vp->fid.unique);
 
 	xdr_encode_AFS_StoreStatus(&bp, attr);
 
@@ -1377,57 +1291,44 @@ static int afs_fs_setattr_size(struct afs_operation *fc, struct iattr *attr,
 	*bp++ = 0;				/* size of write */
 	*bp++ = htonl(attr->ia_size);		/* new file length */
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, &vnode->fid);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
  * set the attributes on a file, using FS.StoreData if there's a change in file
  * size, and FS.StoreStatus otherwise
  */
-int afs_fs_setattr(struct afs_operation *fc, struct iattr *attr,
-		   struct afs_status_cb *scb)
+void afs_fs_setattr(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
+	struct iattr *attr = op->setattr.attr;
 	__be32 *bp;
 
-	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
-		return yfs_fs_setattr(fc, attr, scb);
-
 	if (attr->ia_valid & ATTR_SIZE)
-		return afs_fs_setattr_size(fc, attr, scb);
+		return afs_fs_setattr_size(op);
 
 	_enter(",%x,{%llx:%llu},,",
-	       key_serial(fc->key), vnode->fid.vid, vnode->fid.vnode);
+	       key_serial(op->key), vp->fid.vid, vp->fid.vnode);
 
-	call = afs_alloc_flat_call(net, &afs_RXFSStoreStatus,
+	call = afs_alloc_flat_call(op->net, &afs_RXFSStoreStatus,
 				   (4 + 6) * 4,
 				   (21 + 6) * 4);
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->out_scb = scb;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	*bp++ = htonl(FSSTORESTATUS);
-	*bp++ = htonl(vnode->fid.vid);
-	*bp++ = htonl(vnode->fid.vnode);
-	*bp++ = htonl(vnode->fid.unique);
+	*bp++ = htonl(vp->fid.vid);
+	*bp++ = htonl(vp->fid.vnode);
+	*bp++ = htonl(vp->fid.unique);
 
-	xdr_encode_AFS_StoreStatus(&bp, attr);
+	xdr_encode_AFS_StoreStatus(&bp, op->setattr.attr);
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, &vnode->fid);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -1435,6 +1336,7 @@ int afs_fs_setattr(struct afs_operation *fc, struct iattr *attr,
  */
 static int afs_deliver_fs_get_volume_status(struct afs_call *call)
 {
+	struct afs_operation *op = call->op;
 	const __be32 *bp;
 	char *p;
 	u32 size;
@@ -1456,7 +1358,7 @@ static int afs_deliver_fs_get_volume_status(struct afs_call *call)
 			return ret;
 
 		bp = call->buffer;
-		xdr_decode_AFSFetchVolumeStatus(&bp, call->out_volstatus);
+		xdr_decode_AFSFetchVolumeStatus(&bp, &op->volstatus.vs);
 		call->unmarshall++;
 		afs_extract_to_tmp(call);
 		/* Fall through */
@@ -1569,37 +1471,26 @@ static const struct afs_call_type afs_RXFSGetVolumeStatus = {
 /*
  * fetch the status of a volume
  */
-int afs_fs_get_volume_status(struct afs_operation *fc,
-			     struct afs_volume_status *vs)
+void afs_fs_get_volume_status(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
 	__be32 *bp;
 
-	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
-		return yfs_fs_get_volume_status(fc, vs);
-
 	_enter("");
 
-	call = afs_alloc_flat_call(net, &afs_RXFSGetVolumeStatus, 2 * 4,
+	call = afs_alloc_flat_call(op->net, &afs_RXFSGetVolumeStatus, 2 * 4,
 				   max(12 * 4, AFSOPAQUEMAX + 1));
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->out_volstatus = vs;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp[0] = htonl(FSGETVOLUMESTATUS);
-	bp[1] = htonl(vnode->fid.vid);
+	bp[1] = htonl(vp->fid.vid);
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, &vnode->fid);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -1607,6 +1498,7 @@ int afs_fs_get_volume_status(struct afs_operation *fc,
  */
 static int afs_deliver_fs_xxxx_lock(struct afs_call *call)
 {
+	struct afs_operation *op = call->op;
 	const __be32 *bp;
 	int ret;
 
@@ -1618,7 +1510,7 @@ static int afs_deliver_fs_xxxx_lock(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	xdr_decode_AFSVolSync(&bp, call->out_volsync);
+	xdr_decode_AFSVolSync(&bp, &op->volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -1659,114 +1551,80 @@ static const struct afs_call_type afs_RXFSReleaseLock = {
 /*
  * Set a lock on a file
  */
-int afs_fs_set_lock(struct afs_operation *fc, afs_lock_type_t type,
-		    struct afs_status_cb *scb)
+void afs_fs_set_lock(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
 	__be32 *bp;
 
-	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
-		return yfs_fs_set_lock(fc, type, scb);
-
 	_enter("");
 
-	call = afs_alloc_flat_call(net, &afs_RXFSSetLock, 5 * 4, 6 * 4);
+	call = afs_alloc_flat_call(op->net, &afs_RXFSSetLock, 5 * 4, 6 * 4);
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->lvnode = vnode;
-	call->out_scb = scb;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	*bp++ = htonl(FSSETLOCK);
-	*bp++ = htonl(vnode->fid.vid);
-	*bp++ = htonl(vnode->fid.vnode);
-	*bp++ = htonl(vnode->fid.unique);
-	*bp++ = htonl(type);
-
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_calli(call, &vnode->fid, type);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	*bp++ = htonl(vp->fid.vid);
+	*bp++ = htonl(vp->fid.vnode);
+	*bp++ = htonl(vp->fid.unique);
+	*bp++ = htonl(op->lock.type);
+
+	trace_afs_make_fs_calli(call, &vp->fid, op->lock.type);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
  * extend a lock on a file
  */
-int afs_fs_extend_lock(struct afs_operation *fc, struct afs_status_cb *scb)
+void afs_fs_extend_lock(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
 	__be32 *bp;
 
-	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
-		return yfs_fs_extend_lock(fc, scb);
-
 	_enter("");
 
-	call = afs_alloc_flat_call(net, &afs_RXFSExtendLock, 4 * 4, 6 * 4);
+	call = afs_alloc_flat_call(op->net, &afs_RXFSExtendLock, 4 * 4, 6 * 4);
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->lvnode = vnode;
-	call->out_scb = scb;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	*bp++ = htonl(FSEXTENDLOCK);
-	*bp++ = htonl(vnode->fid.vid);
-	*bp++ = htonl(vnode->fid.vnode);
-	*bp++ = htonl(vnode->fid.unique);
-
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, &vnode->fid);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	*bp++ = htonl(vp->fid.vid);
+	*bp++ = htonl(vp->fid.vnode);
+	*bp++ = htonl(vp->fid.unique);
+
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
  * release a lock on a file
  */
-int afs_fs_release_lock(struct afs_operation *fc, struct afs_status_cb *scb)
+void afs_fs_release_lock(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
 	__be32 *bp;
 
-	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
-		return yfs_fs_release_lock(fc, scb);
-
 	_enter("");
 
-	call = afs_alloc_flat_call(net, &afs_RXFSReleaseLock, 4 * 4, 6 * 4);
+	call = afs_alloc_flat_call(op->net, &afs_RXFSReleaseLock, 4 * 4, 6 * 4);
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->lvnode = vnode;
-	call->out_scb = scb;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	*bp++ = htonl(FSRELEASELOCK);
-	*bp++ = htonl(vnode->fid.vid);
-	*bp++ = htonl(vnode->fid.vnode);
-	*bp++ = htonl(vnode->fid.unique);
-
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, &vnode->fid);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	*bp++ = htonl(vp->fid.vid);
+	*bp++ = htonl(vp->fid.vnode);
+	*bp++ = htonl(vp->fid.unique);
+
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -1906,28 +1764,6 @@ bool afs_fs_get_capabilities(struct afs_net *net, struct afs_server *server,
 	return true;
 }
 
-/*
- * Deliver reply data to an FS.FetchStatus with no vnode.
- */
-static int afs_deliver_fs_fetch_status(struct afs_call *call)
-{
-	const __be32 *bp;
-	int ret;
-
-	ret = afs_transfer_reply(call);
-	if (ret < 0)
-		return ret;
-
-	/* unmarshall the reply once we've received all of it */
-	bp = call->buffer;
-	xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
-	xdr_decode_AFSCallBack(&bp, call, call->out_scb);
-	xdr_decode_AFSVolSync(&bp, call->out_volsync);
-
-	_leave(" = 0 [done]");
-	return 0;
-}
-
 /*
  * FS.FetchStatus operation type
  */
@@ -1938,54 +1774,12 @@ static const struct afs_call_type afs_RXFSFetchStatus = {
 	.destructor	= afs_flat_call_destructor,
 };
 
-/*
- * Fetch the status information for a fid without needing a vnode handle.
- */
-int afs_fs_fetch_status(struct afs_operation *fc,
-			struct afs_net *net,
-			struct afs_fid *fid,
-			struct afs_status_cb *scb,
-			struct afs_volsync *volsync)
-{
-	struct afs_call *call;
-	__be32 *bp;
-
-	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
-		return yfs_fs_fetch_status(fc, net, fid, scb, volsync);
-
-	_enter(",%x,{%llx:%llu},,",
-	       key_serial(fc->key), fid->vid, fid->vnode);
-
-	call = afs_alloc_flat_call(net, &afs_RXFSFetchStatus, 16, (21 + 3 + 6) * 4);
-	if (!call) {
-		fc->ac.error = -ENOMEM;
-		return -ENOMEM;
-	}
-
-	call->key = fc->key;
-	call->out_fid = fid;
-	call->out_scb = scb;
-	call->out_volsync = volsync;
-
-	/* marshall the parameters */
-	bp = call->request;
-	bp[0] = htonl(FSFETCHSTATUS);
-	bp[1] = htonl(fid->vid);
-	bp[2] = htonl(fid->vnode);
-	bp[3] = htonl(fid->unique);
-
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, fid);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
-}
-
 /*
  * Deliver reply data to an FS.InlineBulkStatus call
  */
 static int afs_deliver_fs_inline_bulk_status(struct afs_call *call)
 {
+	struct afs_operation *op = call->op;
 	struct afs_status_cb *scb;
 	const __be32 *bp;
 	u32 tmp;
@@ -2007,8 +1801,8 @@ static int afs_deliver_fs_inline_bulk_status(struct afs_call *call)
 			return ret;
 
 		tmp = ntohl(call->tmp);
-		_debug("status count: %u/%u", tmp, call->count2);
-		if (tmp != call->count2)
+		_debug("status count: %u/%u", tmp, op->nr_files);
+		if (tmp != op->nr_files)
 			return afs_protocol_error(call, afs_eproto_ibulkst_count);
 
 		call->count = 0;
@@ -2023,11 +1817,23 @@ static int afs_deliver_fs_inline_bulk_status(struct afs_call *call)
 		if (ret < 0)
 			return ret;
 
+		switch (call->count) {
+		case 0:
+			scb = &op->file[0].scb;
+			break;
+		case 1:
+			scb = &op->file[1].scb;
+			break;
+		default:
+			scb = &op->more_files[call->count - 2].scb;
+			break;
+		}
+
 		bp = call->buffer;
-		scb = &call->out_scb[call->count];
 		xdr_decode_AFSFetchStatus(&bp, call, scb);
+
 		call->count++;
-		if (call->count < call->count2)
+		if (call->count < op->nr_files)
 			goto more_counts;
 
 		call->count = 0;
@@ -2044,7 +1850,7 @@ static int afs_deliver_fs_inline_bulk_status(struct afs_call *call)
 
 		tmp = ntohl(call->tmp);
 		_debug("CB count: %u", tmp);
-		if (tmp != call->count2)
+		if (tmp != op->nr_files)
 			return afs_protocol_error(call, afs_eproto_ibulkst_cb_count);
 		call->count = 0;
 		call->unmarshall++;
@@ -2059,11 +1865,22 @@ static int afs_deliver_fs_inline_bulk_status(struct afs_call *call)
 			return ret;
 
 		_debug("unmarshall CB array");
+		switch (call->count) {
+		case 0:
+			scb = &op->file[0].scb;
+			break;
+		case 1:
+			scb = &op->file[1].scb;
+			break;
+		default:
+			scb = &op->more_files[call->count - 2].scb;
+			break;
+		}
+
 		bp = call->buffer;
-		scb = &call->out_scb[call->count];
 		xdr_decode_AFSCallBack(&bp, call, scb);
 		call->count++;
-		if (call->count < call->count2)
+		if (call->count < op->nr_files)
 			goto more_cbs;
 
 		afs_extract_to_buf(call, 6 * sizeof(__be32));
@@ -2076,7 +1893,7 @@ static int afs_deliver_fs_inline_bulk_status(struct afs_call *call)
 			return ret;
 
 		bp = call->buffer;
-		xdr_decode_AFSVolSync(&bp, call->out_volsync);
+		xdr_decode_AFSVolSync(&bp, &op->volsync);
 
 		call->unmarshall++;
 
@@ -2088,6 +1905,13 @@ static int afs_deliver_fs_inline_bulk_status(struct afs_call *call)
 	return 0;
 }
 
+static void afs_done_fs_inline_bulk_status(struct afs_call *call)
+{
+	if (call->error == -ECONNABORTED &&
+	    call->abort_code == RX_INVALID_OPERATION)
+		set_bit(AFS_SERVER_FL_NO_IBULK, &call->server->flags);
+}
+
 /*
  * FS.InlineBulkStatus operation type
  */
@@ -2095,58 +1919,53 @@ static const struct afs_call_type afs_RXFSInlineBulkStatus = {
 	.name		= "FS.InlineBulkStatus",
 	.op		= afs_FS_InlineBulkStatus,
 	.deliver	= afs_deliver_fs_inline_bulk_status,
+	.done		= afs_done_fs_inline_bulk_status,
 	.destructor	= afs_flat_call_destructor,
 };
 
 /*
  * Fetch the status information for up to 50 files
  */
-int afs_fs_inline_bulk_status(struct afs_operation *fc,
-			      struct afs_net *net,
-			      struct afs_fid *fids,
-			      struct afs_status_cb *statuses,
-			      unsigned int nr_fids,
-			      struct afs_volsync *volsync)
+void afs_fs_inline_bulk_status(struct afs_operation *op)
 {
+	struct afs_vnode_param *dvp = &op->file[0];
+	struct afs_vnode_param *vp = &op->file[1];
 	struct afs_call *call;
 	__be32 *bp;
 	int i;
 
-	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
-		return yfs_fs_inline_bulk_status(fc, net, fids, statuses,
-						 nr_fids, volsync);
+	if (test_bit(AFS_SERVER_FL_NO_IBULK, &op->cbi->server->flags)) {
+		op->error = -ENOTSUPP;
+		return;
+	}
 
 	_enter(",%x,{%llx:%llu},%u",
-	       key_serial(fc->key), fids[0].vid, fids[1].vnode, nr_fids);
+	       key_serial(op->key), vp->fid.vid, vp->fid.vnode, op->nr_files);
 
-	call = afs_alloc_flat_call(net, &afs_RXFSInlineBulkStatus,
-				   (2 + nr_fids * 3) * 4,
+	call = afs_alloc_flat_call(op->net, &afs_RXFSInlineBulkStatus,
+				   (2 + op->nr_files * 3) * 4,
 				   21 * 4);
-	if (!call) {
-		fc->ac.error = -ENOMEM;
-		return -ENOMEM;
-	}
-
-	call->key = fc->key;
-	call->out_scb = statuses;
-	call->out_volsync = volsync;
-	call->count2 = nr_fids;
+	if (!call)
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	*bp++ = htonl(FSINLINEBULKSTATUS);
-	*bp++ = htonl(nr_fids);
-	for (i = 0; i < nr_fids; i++) {
-		*bp++ = htonl(fids[i].vid);
-		*bp++ = htonl(fids[i].vnode);
-		*bp++ = htonl(fids[i].unique);
+	*bp++ = htonl(op->nr_files);
+	*bp++ = htonl(dvp->fid.vid);
+	*bp++ = htonl(dvp->fid.vnode);
+	*bp++ = htonl(dvp->fid.unique);
+	*bp++ = htonl(vp->fid.vid);
+	*bp++ = htonl(vp->fid.vnode);
+	*bp++ = htonl(vp->fid.unique);
+	for (i = 0; i < op->nr_files - 2; i++) {
+		*bp++ = htonl(op->more_files[i].fid.vid);
+		*bp++ = htonl(op->more_files[i].fid.vnode);
+		*bp++ = htonl(op->more_files[i].fid.unique);
 	}
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, &fids[0]);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -2154,6 +1973,8 @@ int afs_fs_inline_bulk_status(struct afs_operation *fc,
  */
 static int afs_deliver_fs_fetch_acl(struct afs_call *call)
 {
+	struct afs_operation *op = call->op;
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_acl *acl;
 	const __be32 *bp;
 	unsigned int size;
@@ -2179,7 +2000,7 @@ static int afs_deliver_fs_fetch_acl(struct afs_call *call)
 		acl = kmalloc(struct_size(acl, data, size), GFP_KERNEL);
 		if (!acl)
 			return -ENOMEM;
-		call->ret_acl = acl;
+		op->acl = acl;
 		acl->size = call->count2;
 		afs_extract_begin(call, acl->data, size);
 		call->unmarshall++;
@@ -2202,8 +2023,8 @@ static int afs_deliver_fs_fetch_acl(struct afs_call *call)
 			return ret;
 
 		bp = call->buffer;
-		xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
-		xdr_decode_AFSVolSync(&bp, call->out_volsync);
+		xdr_decode_AFSFetchStatus(&bp, call, &vp->scb);
+		xdr_decode_AFSVolSync(&bp, &op->volsync);
 
 		call->unmarshall++;
 
@@ -2215,12 +2036,6 @@ static int afs_deliver_fs_fetch_acl(struct afs_call *call)
 	return 0;
 }
 
-static void afs_destroy_fs_fetch_acl(struct afs_call *call)
-{
-	kfree(call->ret_acl);
-	afs_flat_call_destructor(call);
-}
-
 /*
  * FS.FetchACL operation type
  */
@@ -2228,66 +2043,33 @@ static const struct afs_call_type afs_RXFSFetchACL = {
 	.name		= "FS.FetchACL",
 	.op		= afs_FS_FetchACL,
 	.deliver	= afs_deliver_fs_fetch_acl,
-	.destructor	= afs_destroy_fs_fetch_acl,
 };
 
 /*
  * Fetch the ACL for a file.
  */
-struct afs_acl *afs_fs_fetch_acl(struct afs_operation *fc,
-				 struct afs_status_cb *scb)
+void afs_fs_fetch_acl(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
 	__be32 *bp;
 
 	_enter(",%x,{%llx:%llu},,",
-	       key_serial(fc->key), vnode->fid.vid, vnode->fid.vnode);
+	       key_serial(op->key), vp->fid.vid, vp->fid.vnode);
 
-	call = afs_alloc_flat_call(net, &afs_RXFSFetchACL, 16, (21 + 6) * 4);
-	if (!call) {
-		fc->ac.error = -ENOMEM;
-		return ERR_PTR(-ENOMEM);
-	}
-
-	call->key = fc->key;
-	call->ret_acl = NULL;
-	call->out_scb = scb;
-	call->out_volsync = NULL;
+	call = afs_alloc_flat_call(op->net, &afs_RXFSFetchACL, 16, (21 + 6) * 4);
+	if (!call)
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp[0] = htonl(FSFETCHACL);
-	bp[1] = htonl(vnode->fid.vid);
-	bp[2] = htonl(vnode->fid.vnode);
-	bp[3] = htonl(vnode->fid.unique);
-
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, &vnode->fid);
-	afs_make_call(&fc->ac, call, GFP_KERNEL);
-	return (struct afs_acl *)afs_wait_for_call_to_complete(call, &fc->ac);
-}
+	bp[1] = htonl(vp->fid.vid);
+	bp[2] = htonl(vp->fid.vnode);
+	bp[3] = htonl(vp->fid.unique);
 
-/*
- * Deliver reply data to any operation that returns file status and volume
- * sync.
- */
-static int afs_deliver_fs_file_status_and_vol(struct afs_call *call)
-{
-	const __be32 *bp;
-	int ret;
-
-	ret = afs_transfer_reply(call);
-	if (ret < 0)
-		return ret;
-
-	bp = call->buffer;
-	xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
-	xdr_decode_AFSVolSync(&bp, call->out_volsync);
-
-	_leave(" = 0 [done]");
-	return 0;
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_KERNEL);
 }
 
 /*
@@ -2303,42 +2085,34 @@ static const struct afs_call_type afs_RXFSStoreACL = {
 /*
  * Fetch the ACL for a file.
  */
-int afs_fs_store_acl(struct afs_operation *fc, const struct afs_acl *acl,
-		     struct afs_status_cb *scb)
+void afs_fs_store_acl(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
+	const struct afs_acl *acl = op->acl;
 	size_t size;
 	__be32 *bp;
 
 	_enter(",%x,{%llx:%llu},,",
-	       key_serial(fc->key), vnode->fid.vid, vnode->fid.vnode);
+	       key_serial(op->key), vp->fid.vid, vp->fid.vnode);
 
 	size = round_up(acl->size, 4);
-	call = afs_alloc_flat_call(net, &afs_RXFSStoreACL,
+	call = afs_alloc_flat_call(op->net, &afs_RXFSStoreACL,
 				   5 * 4 + size, (21 + 6) * 4);
-	if (!call) {
-		fc->ac.error = -ENOMEM;
-		return -ENOMEM;
-	}
-
-	call->key = fc->key;
-	call->out_scb = scb;
-	call->out_volsync = NULL;
+	if (!call)
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp[0] = htonl(FSSTOREACL);
-	bp[1] = htonl(vnode->fid.vid);
-	bp[2] = htonl(vnode->fid.vnode);
-	bp[3] = htonl(vnode->fid.unique);
+	bp[1] = htonl(vp->fid.vid);
+	bp[2] = htonl(vp->fid.vnode);
+	bp[3] = htonl(vp->fid.unique);
 	bp[4] = htonl(acl->size);
 	memcpy(&bp[5], acl->data, acl->size);
 	if (acl->size != size)
 		memset((void *)&bp[5] + acl->size, 0, size - acl->size);
 
-	trace_afs_make_fs_call(call, &vnode->fid);
-	afs_make_call(&fc->ac, call, GFP_KERNEL);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_KERNEL);
 }
diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index d2dbb3aef611..94675acb6a3a 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -67,16 +67,19 @@ static void afs_set_i_size(struct afs_vnode *vnode, u64 size)
 /*
  * Initialise an inode from the vnode status.
  */
-static int afs_inode_init_from_status(struct afs_vnode *vnode, struct key *key,
-				      struct afs_cb_interest *cbi,
-				      struct afs_vnode *parent_vnode,
-				      struct afs_status_cb *scb)
+static int afs_inode_init_from_status(struct afs_operation *op,
+				      struct afs_vnode_param *vp,
+				      struct afs_vnode *vnode)
 {
 	struct afs_cb_interest *old_cbi = NULL;
-	struct afs_file_status *status = &scb->status;
+	struct afs_file_status *status = &vp->scb.status;
 	struct inode *inode = AFS_VNODE_TO_I(vnode);
 	struct timespec64 t;
 
+	_enter("{%llx:%llu.%u} %s",
+	       vp->fid.vid, vp->fid.vnode, vp->fid.unique,
+	       op->type ? op->type->name : "???");
+
 	_debug("FS: ft=%d lk=%d sz=%llu ver=%Lu mod=%hu",
 	       status->type,
 	       status->nlink,
@@ -86,12 +89,15 @@ static int afs_inode_init_from_status(struct afs_vnode *vnode, struct key *key,
 
 	write_seqlock(&vnode->cb_lock);
 
+	vnode->cb_v_break = op->cb_v_break;
+	vnode->cb_s_break = op->cb_s_break;
 	vnode->status = *status;
 
 	t = status->mtime_client;
 	inode->i_ctime = t;
 	inode->i_mtime = t;
 	inode->i_atime = t;
+	inode->i_flags |= S_NOATIME;
 	inode->i_uid = make_kuid(&init_user_ns, status->owner);
 	inode->i_gid = make_kgid(&init_user_ns, status->group);
 	set_nlink(&vnode->vfs_inode, status->nlink);
@@ -128,7 +134,7 @@ static int afs_inode_init_from_status(struct afs_vnode *vnode, struct key *key,
 		inode_nohighmem(inode);
 		break;
 	default:
-		dump_vnode(vnode, parent_vnode);
+		dump_vnode(vnode, op->file[0].vnode != vnode ? op->file[0].vnode : NULL);
 		write_sequnlock(&vnode->cb_lock);
 		return afs_protocol_error(NULL, afs_eproto_file_type);
 	}
@@ -138,16 +144,17 @@ static int afs_inode_init_from_status(struct afs_vnode *vnode, struct key *key,
 	vnode->invalid_before	= status->data_version;
 	inode_set_iversion_raw(&vnode->vfs_inode, status->data_version);
 
-	if (!scb->have_cb) {
+	if (!vp->scb.have_cb) {
 		/* it's a symlink we just created (the fileserver
 		 * didn't give us a callback) */
 		vnode->cb_expires_at = ktime_get_real_seconds();
 	} else {
-		vnode->cb_expires_at = scb->callback.expires_at;
+		vnode->cb_expires_at = vp->scb.callback.expires_at;
 		old_cbi = rcu_dereference_protected(vnode->cb_interest,
 						    lockdep_is_held(&vnode->cb_lock.lock));
-		if (cbi != old_cbi)
-			rcu_assign_pointer(vnode->cb_interest, afs_get_cb_interest(cbi));
+		if (op->cbi != old_cbi)
+			rcu_assign_pointer(vnode->cb_interest,
+					   afs_get_cb_interest(op->cbi));
 		else
 			old_cbi = NULL;
 		set_bit(AFS_VNODE_CB_PROMISED, &vnode->flags);
@@ -161,16 +168,19 @@ static int afs_inode_init_from_status(struct afs_vnode *vnode, struct key *key,
 /*
  * Update the core inode struct from a returned status record.
  */
-static void afs_apply_status(struct afs_operation *fc,
-			     struct afs_vnode *vnode,
-			     struct afs_status_cb *scb,
-			     const afs_dataversion_t *expected_version)
+static void afs_apply_status(struct afs_operation *op,
+			     struct afs_vnode_param *vp)
 {
-	struct afs_file_status *status = &scb->status;
+	struct afs_file_status *status = &vp->scb.status;
+	struct afs_vnode *vnode = vp->vnode;
 	struct timespec64 t;
 	umode_t mode;
 	bool data_changed = false;
 
+	_enter("{%llx:%llu.%u} %s",
+	       vp->fid.vid, vp->fid.vnode, vp->fid.unique,
+	       op->type ? op->type->name : "???");
+
 	BUG_ON(test_bit(AFS_VNODE_UNSET, &vnode->flags));
 
 	if (status->type != vnode->status.type) {
@@ -209,14 +219,13 @@ static void afs_apply_status(struct afs_operation *fc,
 
 	vnode->status = *status;
 
-	if (expected_version &&
-	    *expected_version != status->data_version) {
+	if (vp->dv_before + vp->dv_delta != status->data_version) {
 		if (test_bit(AFS_VNODE_CB_PROMISED, &vnode->flags))
 			pr_warn("kAFS: vnode modified {%llx:%llu} %llx->%llx %s\n",
 				vnode->fid.vid, vnode->fid.vnode,
-				(unsigned long long)*expected_version,
+				(unsigned long long)vp->dv_before + vp->dv_delta,
 				(unsigned long long)status->data_version,
-				fc->type ? fc->type->name : "???");
+				op->type ? op->type->name : "???");
 
 		vnode->invalid_before = status->data_version;
 		if (vnode->status.type == AFS_FTYPE_DIR) {
@@ -243,20 +252,19 @@ static void afs_apply_status(struct afs_operation *fc,
 /*
  * Apply a callback to a vnode.
  */
-static void afs_apply_callback(struct afs_operation *fc,
-			       struct afs_vnode *vnode,
-			       struct afs_status_cb *scb,
-			       unsigned int cb_break)
+static void afs_apply_callback(struct afs_operation *op,
+			       struct afs_vnode_param *vp)
 {
 	struct afs_cb_interest *old;
-	struct afs_callback *cb = &scb->callback;
+	struct afs_callback *cb = &vp->scb.callback;
+	struct afs_vnode *vnode = vp->vnode;
 
-	if (!afs_cb_is_broken(cb_break, vnode, fc->cbi)) {
+	if (!afs_cb_is_broken(vp->cb_break_before, vnode, op->cbi)) {
 		vnode->cb_expires_at	= cb->expires_at;
 		old = rcu_dereference_protected(vnode->cb_interest,
 						lockdep_is_held(&vnode->cb_lock.lock));
-		if (old != fc->cbi) {
-			rcu_assign_pointer(vnode->cb_interest, afs_get_cb_interest(fc->cbi));
+		if (old != op->cbi) {
+			rcu_assign_pointer(vnode->cb_interest, afs_get_cb_interest(op->cbi));
 			afs_put_cb_interest(afs_v2net(vnode), old);
 		}
 		set_bit(AFS_VNODE_CB_PROMISED, &vnode->flags);
@@ -267,106 +275,108 @@ static void afs_apply_callback(struct afs_operation *fc,
  * Apply the received status and callback to an inode all in the same critical
  * section to avoid races with afs_validate().
  */
-void afs_vnode_commit_status(struct afs_operation *fc,
-			     struct afs_vnode *vnode,
-			     unsigned int cb_break,
-			     const afs_dataversion_t *expected_version,
-			     struct afs_status_cb *scb)
+void afs_vnode_commit_status(struct afs_operation *op, struct afs_vnode_param *vp)
 {
-	if (fc->ac.error != 0)
-		return;
+	struct afs_vnode *vnode = vp->vnode;
+
+	_enter("");
+
+	ASSERTCMP(op->error, ==, 0);
 
 	write_seqlock(&vnode->cb_lock);
 
-	if (scb->have_error) {
-		if (scb->status.abort_code == VNOVNODE) {
+	if (vp->scb.have_error) {
+		if (vp->scb.status.abort_code == VNOVNODE) {
 			set_bit(AFS_VNODE_DELETED, &vnode->flags);
 			clear_nlink(&vnode->vfs_inode);
 			__afs_break_callback(vnode, afs_cb_break_for_deleted);
 		}
 	} else {
-		if (scb->have_status)
-			afs_apply_status(fc, vnode, scb, expected_version);
-		if (scb->have_cb)
-			afs_apply_callback(fc, vnode, scb, cb_break);
+		if (vp->scb.have_status)
+			afs_apply_status(op, vp);
+		if (vp->scb.have_cb)
+			afs_apply_callback(op, vp);
 	}
 
 	write_sequnlock(&vnode->cb_lock);
 
-	if (fc->ac.error == 0 && scb->have_status)
-		afs_cache_permit(vnode, fc->key, cb_break, scb);
+	if (op->error == 0 && vp->scb.have_status)
+		afs_cache_permit(vnode, op->key, vp->cb_break_before, &vp->scb);
 }
 
+static void afs_fetch_status_success(struct afs_operation *op)
+{
+	struct afs_vnode_param *vp = &op->file[0];
+	struct afs_vnode *vnode = vp->vnode;
+	int ret;
+
+	if (vnode->vfs_inode.i_state & I_NEW) {
+		ret = afs_inode_init_from_status(op, vp, vnode);
+		op->error = ret;
+		if (ret == 0)
+			afs_cache_permit(vnode, op->key, vp->cb_break_before, &vp->scb);
+	} else {
+		afs_vnode_commit_status(op, vp);
+	}
+}
+
+static const struct afs_operation_ops afs_fetch_status_operation = {
+	.issue_afs_rpc	= afs_fs_fetch_status,
+	.issue_yfs_rpc	= yfs_fs_fetch_status,
+	.success	= afs_fetch_status_success,
+};
+
 /*
  * Fetch file status from the volume.
  */
 int afs_fetch_status(struct afs_vnode *vnode, struct key *key, bool is_new,
 		     afs_access_t *_caller_access)
 {
-	struct afs_status_cb *scb;
-	struct afs_operation fc;
-	int ret;
+	struct afs_operation *op;
 
 	_enter("%s,{%llx:%llu.%u,S=%lx}",
 	       vnode->volume->name,
 	       vnode->fid.vid, vnode->fid.vnode, vnode->fid.unique,
 	       vnode->flags);
 
-	scb = kzalloc(sizeof(struct afs_status_cb), GFP_KERNEL);
-	if (!scb)
-		return -ENOMEM;
+	op = afs_alloc_operation(key, vnode->volume);
+	if (IS_ERR(op))
+		return PTR_ERR(op);
 
-	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
-		afs_dataversion_t data_version = vnode->status.data_version;
+	afs_op_set_vnode(op, 0, vnode);
 
-		while (afs_select_fileserver(&fc)) {
-			fc.cb_break = afs_calc_vnode_cb_break(vnode);
-			afs_fs_fetch_file_status(&fc, scb, NULL);
-		}
-
-		if (fc.error) {
-			/* Do nothing. */
-		} else if (is_new) {
-			ret = afs_inode_init_from_status(vnode, key, fc.cbi,
-							 NULL, scb);
-			fc.error = ret;
-			if (ret == 0)
-				afs_cache_permit(vnode, key, fc.cb_break, scb);
-		} else {
-			afs_vnode_commit_status(&fc, vnode, fc.cb_break,
-						&data_version, scb);
-		}
-		afs_check_for_remote_deletion(&fc, vnode);
-		ret = afs_end_vnode_operation(&fc);
-	}
+	op->nr_files	= 1;
+	op->ops		= &afs_fetch_status_operation;
+	afs_begin_vnode_operation(op);
+	afs_wait_for_operation(op);
 
-	if (ret == 0 && _caller_access)
-		*_caller_access = scb->status.caller_access;
-	kfree(scb);
-	_leave(" = %d", ret);
-	return ret;
+	if (_caller_access)
+		*_caller_access = op->file[0].scb.status.caller_access;
+	return afs_put_operation(op);
 }
 
 /*
- * iget5() comparator
+ * ilookup() comparator
  */
-int afs_iget5_test(struct inode *inode, void *opaque)
+int afs_ilookup5_test_by_fid(struct inode *inode, void *opaque)
 {
-	struct afs_iget_data *iget_data = opaque;
 	struct afs_vnode *vnode = AFS_FS_I(inode);
+	struct afs_fid *fid = opaque;
 
-	return memcmp(&vnode->fid, &iget_data->fid, sizeof(iget_data->fid)) == 0;
+	return (fid->vnode == vnode->fid.vnode &&
+		fid->vnode_hi == vnode->fid.vnode_hi &&
+		fid->unique == vnode->fid.unique);
 }
 
 /*
- * iget5() comparator for inode created by autocell operations
- *
- * These pseudo inodes don't match anything.
+ * iget5() comparator
  */
-static int afs_iget5_pseudo_dir_test(struct inode *inode, void *opaque)
+static int afs_iget5_test(struct inode *inode, void *opaque)
 {
-	return 0;
+	struct afs_vnode_param *vp = opaque;
+	//struct afs_vnode *vnode = AFS_FS_I(inode);
+
+	return afs_ilookup5_test_by_fid(inode, &vp->fid);
 }
 
 /*
@@ -374,98 +384,21 @@ static int afs_iget5_pseudo_dir_test(struct inode *inode, void *opaque)
  */
 static int afs_iget5_set(struct inode *inode, void *opaque)
 {
-	struct afs_iget_data *iget_data = opaque;
+	struct afs_vnode_param *vp = opaque;
+	struct afs_super_info *as = AFS_FS_S(inode->i_sb);
 	struct afs_vnode *vnode = AFS_FS_I(inode);
 
-	vnode->fid		= iget_data->fid;
-	vnode->volume		= iget_data->volume;
-	vnode->cb_v_break	= iget_data->cb_v_break;
-	vnode->cb_s_break	= iget_data->cb_s_break;
+	vnode->volume		= as->volume;
+	vnode->fid		= vp->fid;
 
 	/* YFS supports 96-bit vnode IDs, but Linux only supports
 	 * 64-bit inode numbers.
 	 */
-	inode->i_ino		= iget_data->fid.vnode;
-	inode->i_generation	= iget_data->fid.unique;
+	inode->i_ino		= vnode->fid.vnode;
+	inode->i_generation	= vnode->fid.unique;
 	return 0;
 }
 
-/*
- * Create an inode for a dynamic root directory or an autocell dynamic
- * automount dir.
- */
-struct inode *afs_iget_pseudo_dir(struct super_block *sb, bool root)
-{
-	struct afs_super_info *as;
-	struct afs_vnode *vnode;
-	struct inode *inode;
-	static atomic_t afs_autocell_ino;
-
-	struct afs_iget_data iget_data = {
-		.cb_v_break = 0,
-		.cb_s_break = 0,
-	};
-
-	_enter("");
-
-	as = sb->s_fs_info;
-	if (as->volume) {
-		iget_data.volume = as->volume;
-		iget_data.fid.vid = as->volume->vid;
-	}
-	if (root) {
-		iget_data.fid.vnode = 1;
-		iget_data.fid.unique = 1;
-	} else {
-		iget_data.fid.vnode = atomic_inc_return(&afs_autocell_ino);
-		iget_data.fid.unique = 0;
-	}
-
-	inode = iget5_locked(sb, iget_data.fid.vnode,
-			     afs_iget5_pseudo_dir_test, afs_iget5_set,
-			     &iget_data);
-	if (!inode) {
-		_leave(" = -ENOMEM");
-		return ERR_PTR(-ENOMEM);
-	}
-
-	_debug("GOT INODE %p { ino=%lu, vl=%llx, vn=%llx, u=%x }",
-	       inode, inode->i_ino, iget_data.fid.vid, iget_data.fid.vnode,
-	       iget_data.fid.unique);
-
-	vnode = AFS_FS_I(inode);
-
-	/* there shouldn't be an existing inode */
-	BUG_ON(!(inode->i_state & I_NEW));
-
-	inode->i_size		= 0;
-	inode->i_mode		= S_IFDIR | S_IRUGO | S_IXUGO;
-	if (root) {
-		inode->i_op	= &afs_dynroot_inode_operations;
-		inode->i_fop	= &simple_dir_operations;
-	} else {
-		inode->i_op	= &afs_autocell_inode_operations;
-	}
-	set_nlink(inode, 2);
-	inode->i_uid		= GLOBAL_ROOT_UID;
-	inode->i_gid		= GLOBAL_ROOT_GID;
-	inode->i_ctime = inode->i_atime = inode->i_mtime = current_time(inode);
-	inode->i_blocks		= 0;
-	inode_set_iversion_raw(inode, 0);
-	inode->i_generation	= 0;
-
-	set_bit(AFS_VNODE_PSEUDODIR, &vnode->flags);
-	if (!root) {
-		set_bit(AFS_VNODE_MOUNTPOINT, &vnode->flags);
-		inode->i_flags |= S_AUTOMOUNT;
-	}
-
-	inode->i_flags |= S_NOATIME;
-	unlock_new_inode(inode);
-	_leave(" = %p", inode);
-	return inode;
-}
-
 /*
  * Get a cache cookie for an inode.
  */
@@ -501,58 +434,41 @@ static void afs_get_inode_cache(struct afs_vnode *vnode)
 /*
  * inode retrieval
  */
-struct inode *afs_iget(struct super_block *sb, struct key *key,
-		       struct afs_iget_data *iget_data,
-		       struct afs_status_cb *scb,
-		       struct afs_cb_interest *cbi,
-		       struct afs_vnode *parent_vnode)
+struct inode *afs_iget(struct afs_operation *op, struct afs_vnode_param *vp)
 {
-	struct afs_super_info *as;
+	struct afs_vnode_param *dvp = &op->file[0];
+	struct super_block *sb = dvp->vnode->vfs_inode.i_sb;
 	struct afs_vnode *vnode;
-	struct afs_fid *fid = &iget_data->fid;
 	struct inode *inode;
 	int ret;
 
-	_enter(",{%llx:%llu.%u},,", fid->vid, fid->vnode, fid->unique);
+	_enter(",{%llx:%llu.%u},,", vp->fid.vid, vp->fid.vnode, vp->fid.unique);
 
-	as = sb->s_fs_info;
-	iget_data->volume = as->volume;
-
-	inode = iget5_locked(sb, fid->vnode, afs_iget5_test, afs_iget5_set,
-			     iget_data);
+	inode = iget5_locked(sb, vp->fid.vnode, afs_iget5_test, afs_iget5_set, vp);
 	if (!inode) {
 		_leave(" = -ENOMEM");
 		return ERR_PTR(-ENOMEM);
 	}
 
-	_debug("GOT INODE %p { vl=%llx vn=%llx, u=%x }",
-	       inode, fid->vid, fid->vnode, fid->unique);
-
 	vnode = AFS_FS_I(inode);
 
+	_debug("GOT INODE %p { vl=%llx vn=%llx, u=%x }",
+	       inode, vnode->fid.vid, vnode->fid.vnode, vnode->fid.unique);
+
 	/* deal with an existing inode */
 	if (!(inode->i_state & I_NEW)) {
 		_leave(" = %p", inode);
 		return inode;
 	}
 
-	if (!scb) {
-		/* it's a remotely extant inode */
-		ret = afs_fetch_status(vnode, key, true, NULL);
-		if (ret < 0)
-			goto bad_inode;
-	} else {
-		ret = afs_inode_init_from_status(vnode, key, cbi, parent_vnode,
-						 scb);
-		if (ret < 0)
-			goto bad_inode;
-	}
+	ret = afs_inode_init_from_status(op, vp, vnode);
+	if (ret < 0)
+		goto bad_inode;
 
 	afs_get_inode_cache(vnode);
 
 	/* success */
 	clear_bit(AFS_VNODE_UNSET, &vnode->flags);
-	inode->i_flags |= S_NOATIME;
 	unlock_new_inode(inode);
 	_leave(" = %p", inode);
 	return inode;
@@ -564,6 +480,74 @@ struct inode *afs_iget(struct super_block *sb, struct key *key,
 	return ERR_PTR(ret);
 }
 
+static int afs_iget5_set_root(struct inode *inode, void *opaque)
+{
+	struct afs_super_info *as = AFS_FS_S(inode->i_sb);
+	struct afs_vnode *vnode = AFS_FS_I(inode);
+
+	vnode->volume		= as->volume;
+	vnode->fid.vid		= as->volume->vid,
+	vnode->fid.vnode	= 1;
+	vnode->fid.unique	= 1;
+	inode->i_ino		= 1;
+	inode->i_generation	= 1;
+	return 0;
+}
+
+/*
+ * Set up the root inode for a volume.  This is always vnode 1, unique 1 within
+ * the volume.
+ */
+struct inode *afs_root_iget(struct super_block *sb, struct key *key)
+{
+	struct afs_super_info *as = AFS_FS_S(sb);
+	struct afs_operation *op;
+	struct afs_vnode *vnode;
+	struct inode *inode;
+	int ret;
+
+	_enter(",{%llx},,", as->volume->vid);
+
+	inode = iget5_locked(sb, 1, NULL, afs_iget5_set_root, NULL);
+	if (!inode) {
+		_leave(" = -ENOMEM");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	_debug("GOT ROOT INODE %p { vl=%llx }", inode, as->volume->vid);
+
+	BUG_ON(!(inode->i_state & I_NEW));
+
+	vnode = AFS_FS_I(inode);
+	vnode->cb_v_break = as->volume->cb_v_break,
+
+	op = afs_alloc_operation(key, as->volume);
+	if (IS_ERR(op)) {
+		ret = PTR_ERR(op);
+		goto error;
+	}
+
+	afs_op_set_vnode(op, 0, vnode);
+
+	op->nr_files	= 1;
+	op->ops		= &afs_fetch_status_operation;
+	ret = afs_do_sync_operation(op);
+	if (ret < 0)
+		goto error;
+
+	afs_get_inode_cache(vnode);
+
+	clear_bit(AFS_VNODE_UNSET, &vnode->flags);
+	unlock_new_inode(inode);
+	_leave(" = %p", inode);
+	return inode;
+
+error:
+	iget_failed(inode);
+	_leave(" = %d [bad]", ret);
+	return ERR_PTR(ret);
+}
+
 /*
  * mark the data attached to an inode as obsolete due to a write on the server
  * - might also want to ditch all the outstanding writes and dirty pages
@@ -808,16 +792,24 @@ void afs_evict_inode(struct inode *inode)
 	_leave("");
 }
 
+static void afs_setattr_success(struct afs_operation *op)
+{
+	afs_vnode_commit_status(op, &op->file[0]);
+}
+
+static const struct afs_operation_ops afs_setattr_operation = {
+	.issue_afs_rpc	= afs_fs_setattr,
+	.issue_yfs_rpc	= yfs_fs_setattr,
+	.success	= afs_setattr_success,
+};
+
 /*
  * set the attributes of an inode
  */
 int afs_setattr(struct dentry *dentry, struct iattr *attr)
 {
-	struct afs_operation fc;
-	struct afs_status_cb *scb;
+	struct afs_operation *op;
 	struct afs_vnode *vnode = AFS_FS_I(d_inode(dentry));
-	struct key *key;
-	int ret = -ENOMEM;
 
 	_enter("{%llx:%llu},{n=%pd},%x",
 	       vnode->fid.vid, vnode->fid.vnode, dentry,
@@ -829,48 +821,22 @@ int afs_setattr(struct dentry *dentry, struct iattr *attr)
 		return 0;
 	}
 
-	scb = kzalloc(sizeof(struct afs_status_cb), GFP_KERNEL);
-	if (!scb)
-		goto error;
-
 	/* flush any dirty data outstanding on a regular file */
 	if (S_ISREG(vnode->vfs_inode.i_mode))
 		filemap_write_and_wait(vnode->vfs_inode.i_mapping);
 
-	if (attr->ia_valid & ATTR_FILE) {
-		key = afs_file_key(attr->ia_file);
-	} else {
-		key = afs_request_key(vnode->volume->cell);
-		if (IS_ERR(key)) {
-			ret = PTR_ERR(key);
-			goto error_scb;
-		}
-	}
-
-	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, key, false)) {
-		afs_dataversion_t data_version = vnode->status.data_version;
-
-		if (attr->ia_valid & ATTR_SIZE)
-			data_version++;
-
-		while (afs_select_fileserver(&fc)) {
-			fc.cb_break = afs_calc_vnode_cb_break(vnode);
-			afs_fs_setattr(&fc, attr, scb);
-		}
+	op = afs_alloc_operation(((attr->ia_valid & ATTR_FILE) ?
+				  afs_file_key(attr->ia_file) : NULL),
+				 vnode->volume);
+	if (IS_ERR(op))
+		return PTR_ERR(op);
 
-		afs_check_for_remote_deletion(&fc, vnode);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break,
-					&data_version, scb);
-		ret = afs_end_vnode_operation(&fc);
-	}
+	afs_op_set_vnode(op, 0, vnode);
+	op->setattr.attr = attr;
 
-	if (!(attr->ia_valid & ATTR_FILE))
-		key_put(key);
+	if (attr->ia_valid & ATTR_SIZE)
+		op->file[0].dv_delta = 1;
 
-error_scb:
-	kfree(scb);
-error:
-	_leave(" = %d", ret);
-	return ret;
+	op->ops = &afs_setattr_operation;
+	return afs_do_sync_operation(op);
 }
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 0551dedb0371..4b8ac049fc17 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -59,13 +59,6 @@ struct afs_fs_context {
 	struct key		*key;		/* key to use for secure mounting */
 };
 
-struct afs_iget_data {
-	struct afs_fid		fid;
-	struct afs_volume	*volume;	/* volume on which resides */
-	unsigned int		cb_v_break;	/* Pre-fetch volume break count */
-	unsigned int		cb_s_break;	/* Pre-fetch server break count */
-};
-
 enum afs_call_state {
 	AFS_CALL_CL_REQUESTING,		/* Client: Request is being sent */
 	AFS_CALL_CL_AWAIT_REPLY,	/* Client: Awaiting reply */
@@ -111,9 +104,7 @@ struct afs_call {
 	struct afs_server	*server;	/* The fileserver record if fs op (pins ref) */
 	struct afs_vlserver	*vlserver;	/* The vlserver record if vl op */
 	struct afs_cb_interest	*cbi;		/* Callback interest for server used */
-	struct afs_vnode	*lvnode;	/* vnode being locked */
 	void			*request;	/* request data (first part) */
-	struct address_space	*mapping;	/* Pages being written from */
 	struct iov_iter		def_iter;	/* Default buffer/data iterator */
 	struct iov_iter		*iter;		/* Iterator currently in use */
 	union {	/* Convenience for ->def_iter */
@@ -125,18 +116,9 @@ struct afs_call {
 		long			ret0;	/* Value to reply with instead of 0 */
 		struct afs_addr_list	*ret_alist;
 		struct afs_vldb_entry	*ret_vldb;
-		struct afs_acl		*ret_acl;
 	};
-	struct afs_fid		*out_fid;
-	struct afs_status_cb	*out_dir_scb;
-	struct afs_status_cb	*out_scb;
-	struct yfs_acl		*out_yacl;
-	struct afs_volsync	*out_volsync;
-	struct afs_volume_status *out_volstatus;
-	struct afs_read		*read_request;
+	struct afs_operation	*op;
 	unsigned int		server_index;
-	pgoff_t			first;		/* first page in mapping to deal with */
-	pgoff_t			last;		/* last page in mapping to deal with */
 	atomic_t		usage;
 	enum afs_call_state	state;
 	spinlock_t		state_lock;
@@ -146,11 +128,7 @@ struct afs_call {
 	unsigned int		max_lifespan;	/* Maximum lifespan to set if not 0 */
 	unsigned		request_size;	/* size of request data */
 	unsigned		reply_max;	/* maximum size of reply */
-	unsigned		first_offset;	/* offset into mapping[first] */
-	union {
-		unsigned	last_to;	/* amount of mapping[last] */
-		unsigned	count2;		/* count used in unmarshalling */
-	};
+	unsigned		count2;		/* count used in unmarshalling */
 	unsigned char		unmarshall;	/* unmarshalling phase */
 	unsigned char		addr_ix;	/* Address in ->alist */
 	bool			drop_ref;	/* T if need to drop ref for incoming call */
@@ -570,10 +548,7 @@ struct afs_cb_interest {
 	struct afs_vol_interest	*vol_interest;
 	struct afs_server	*server;	/* Server on which this interest resides */
 	struct super_block	*sb;		/* Superblock on which inodes reside */
-	union {
-		struct rcu_head	rcu;
-		afs_volid_t	vid;		/* Volume ID to match */
-	};
+	struct rcu_head		rcu;
 	refcount_t		usage;
 };
 
@@ -764,29 +739,116 @@ struct afs_vl_cursor {
 };
 
 /*
- * Cursor for iterating over a set of fileservers.
+ * Fileserver operation methods.
+ */
+struct afs_operation_ops {
+	void (*issue_afs_rpc)(struct afs_operation *op);
+	void (*issue_yfs_rpc)(struct afs_operation *op);
+	void (*success)(struct afs_operation *op);
+	void (*aborted)(struct afs_operation *op);
+	void (*edit_dir)(struct afs_operation *op);
+	void (*put)(struct afs_operation *op);
+};
+
+struct afs_vnode_param {
+	struct afs_vnode	*vnode;
+	struct afs_fid		fid;		/* Fid to access */
+	struct afs_status_cb	scb;		/* Returned status and callback promise */
+	afs_dataversion_t	dv_before;	/* Data version before the call */
+	unsigned int		cb_break_before; /* cb_break + cb_s_break before the call */
+	u8			dv_delta;	/* Expected change in data version */
+	bool			put_vnode;	/* T if we have a ref on the vnode */
+	bool			need_io_lock;	/* T if we need the I/O lock on this */
+};
+
+/*
+ * Fileserver operation wrapper, handling server and address rotation
+ * asynchronously.  May make simultaneous calls to multiple servers.
  */
 struct afs_operation {
+	struct afs_net		*net;		/* Network namespace */
+	struct key		*key;		/* Key for the cell */
 	const struct afs_call_type *type;	/* Type of call done */
+	const struct afs_operation_ops *ops;
+
+	/* Parameters/results for the operation */
+	struct afs_volume	*volume;	/* Volume being accessed */
+	struct afs_vnode_param	file[2];
+	struct afs_vnode_param	*more_files;
+	struct afs_volsync	volsync;
+	struct dentry		*dentry;	/* Dentry to be altered */
+	struct dentry		*dentry_2;	/* Second dentry to be altered */
+	struct timespec64	mtime;		/* Modification time to record */
+	short			nr_files;	/* Number of entries in file[], more_files */
+	short			error;
+	unsigned int		abort_code;
+	unsigned int		debug_id;
+
+	unsigned int		cb_v_break;	/* Volume break counter before op */
+	unsigned int		cb_s_break;	/* Server break counter before op */
+
+	union {
+		struct {
+			int	which;		/* Which ->file[] to fetch for */
+		} fetch_status;
+		struct {
+			int	reason;		/* enum afs_edit_dir_reason */
+			mode_t	mode;
+			const char *symlink;
+		} create;
+		struct {
+			bool	need_rehash;
+		} unlink;
+		struct {
+			struct dentry *rehash;
+			struct dentry *tmp;
+			bool	new_negative;
+		} rename;
+		struct {
+			struct afs_read *req;
+		} fetch;
+		struct {
+			struct afs_vnode *lvnode;	/* vnode being locked */
+			afs_lock_type_t type;
+		} lock;
+		struct {
+			struct address_space *mapping;	/* Pages being written from */
+			pgoff_t		first;		/* first page in mapping to deal with */
+			pgoff_t		last;		/* last page in mapping to deal with */
+			unsigned	first_offset;	/* offset into mapping[first] */
+			unsigned	last_to;	/* amount of mapping[last] */
+		} store;
+		struct {
+			struct iattr	*attr;
+		} setattr;
+		struct afs_acl	*acl;
+		struct yfs_acl	*yacl;
+		struct {
+			struct afs_volume_status vs;
+			struct kstatfs		*buf;
+		} volstatus;
+	};
+
+	/* Fileserver iteration state */
 	struct afs_addr_cursor	ac;
-	struct afs_vnode	*vnode;
 	struct afs_server_list	*server_list;	/* Current server list (pins ref) */
 	struct afs_cb_interest	*cbi;		/* Server on which this resides (pins ref) */
-	struct key		*key;		/* Key for the server */
+	struct afs_call		*call;
 	unsigned long		untried;	/* Bitmask of untried servers */
-	unsigned int		cb_break;	/* cb_break + cb_s_break before the call */
-	unsigned int		cb_break_2;	/* cb_break + cb_s_break (2nd vnode) */
 	short			index;		/* Current server */
-	short			error;
-	unsigned short		flags;
+	unsigned short		nr_iterations;	/* Number of server iterations */
+
+	unsigned int		flags;
 #define AFS_OPERATION_STOP	0x0001		/* Set to cease iteration */
 #define AFS_OPERATION_VBUSY	0x0002		/* Set if seen VBUSY */
 #define AFS_OPERATION_VMOVED	0x0004		/* Set if seen VMOVED */
 #define AFS_OPERATION_VNOVOL	0x0008		/* Set if seen VNOVOL */
 #define AFS_OPERATION_CUR_ONLY	0x0010		/* Set if current server only (file lock held) */
 #define AFS_OPERATION_NO_VSLEEP	0x0020		/* Set to prevent sleep on VBUSY, VOFFLINE, ... */
-#define AFS_OPERATION_INTR	0x0040		/* Set if op is interruptible */
-	unsigned short		nr_iterations;	/* Number of server iterations */
+#define AFS_OPERATION_UNINTR	0x0040		/* Set if op is uninterruptible */
+#define AFS_OPERATION_DOWNGRADE	0x0080		/* Set to retry with downgraded opcode */
+#define AFS_OPERATION_LOCK_0	0x0100		/* Set if have io_lock on file[0] */
+#define AFS_OPERATION_LOCK_1	0x0200		/* Set if have io_lock on file[1] */
 };
 
 /*
@@ -958,46 +1020,61 @@ extern int afs_flock(struct file *, int, struct file_lock *);
 /*
  * fsclient.c
  */
-extern int afs_fs_fetch_file_status(struct afs_operation *, struct afs_status_cb *,
-				    struct afs_volsync *);
-extern int afs_fs_fetch_data(struct afs_operation *, struct afs_status_cb *, struct afs_read *);
-extern int afs_fs_create(struct afs_operation *, const char *, umode_t,
-			 struct afs_status_cb *, struct afs_fid *, struct afs_status_cb *);
-extern int afs_fs_remove(struct afs_operation *, struct afs_vnode *, const char *, bool,
-			 struct afs_status_cb *);
-extern int afs_fs_link(struct afs_operation *, struct afs_vnode *, const char *,
-		       struct afs_status_cb *, struct afs_status_cb *);
-extern int afs_fs_symlink(struct afs_operation *, const char *, const char *,
-			  struct afs_status_cb *, struct afs_fid *, struct afs_status_cb *);
-extern int afs_fs_rename(struct afs_operation *, const char *,
-			 struct afs_vnode *, const char *,
-			 struct afs_status_cb *, struct afs_status_cb *);
-extern int afs_fs_store_data(struct afs_operation *, struct address_space *,
-			     pgoff_t, pgoff_t, unsigned, unsigned, struct afs_status_cb *);
-extern int afs_fs_setattr(struct afs_operation *, struct iattr *, struct afs_status_cb *);
-extern int afs_fs_get_volume_status(struct afs_operation *, struct afs_volume_status *);
-extern int afs_fs_set_lock(struct afs_operation *, afs_lock_type_t, struct afs_status_cb *);
-extern int afs_fs_extend_lock(struct afs_operation *, struct afs_status_cb *);
-extern int afs_fs_release_lock(struct afs_operation *, struct afs_status_cb *);
+extern void afs_fs_fetch_status(struct afs_operation *);
+extern void afs_fs_fetch_data(struct afs_operation *);
+extern void afs_fs_create_file(struct afs_operation *);
+extern void afs_fs_make_dir(struct afs_operation *);
+extern void afs_fs_remove_file(struct afs_operation *);
+extern void afs_fs_remove_dir(struct afs_operation *);
+extern void afs_fs_link(struct afs_operation *);
+extern void afs_fs_symlink(struct afs_operation *);
+extern void afs_fs_rename(struct afs_operation *);
+extern void afs_fs_store_data(struct afs_operation *);
+extern void afs_fs_setattr(struct afs_operation *);
+extern void afs_fs_get_volume_status(struct afs_operation *);
+extern void afs_fs_set_lock(struct afs_operation *);
+extern void afs_fs_extend_lock(struct afs_operation *);
+extern void afs_fs_release_lock(struct afs_operation *);
 extern int afs_fs_give_up_all_callbacks(struct afs_net *, struct afs_server *,
 					struct afs_addr_cursor *, struct key *);
 extern bool afs_fs_get_capabilities(struct afs_net *, struct afs_server *,
 				    struct afs_addr_cursor *, struct key *);
-extern int afs_fs_inline_bulk_status(struct afs_operation *, struct afs_net *,
-				     struct afs_fid *, struct afs_status_cb *,
-				     unsigned int, struct afs_volsync *);
-extern int afs_fs_fetch_status(struct afs_operation *, struct afs_net *,
-			       struct afs_fid *, struct afs_status_cb *,
-			       struct afs_volsync *);
+extern void afs_fs_inline_bulk_status(struct afs_operation *);
 
 struct afs_acl {
 	u32	size;
 	u8	data[];
 };
 
-extern struct afs_acl *afs_fs_fetch_acl(struct afs_operation *, struct afs_status_cb *);
-extern int afs_fs_store_acl(struct afs_operation *, const struct afs_acl *,
-			    struct afs_status_cb *);
+extern void afs_fs_fetch_acl(struct afs_operation *);
+extern void afs_fs_store_acl(struct afs_operation *);
+
+/*
+ * fs_operation.c
+ */
+extern struct afs_operation *afs_alloc_operation(struct key *, struct afs_volume *);
+extern int afs_put_operation(struct afs_operation *);
+extern bool afs_begin_vnode_operation(struct afs_operation *);
+extern void afs_wait_for_operation(struct afs_operation *);
+extern int afs_do_sync_operation(struct afs_operation *);
+
+static inline void afs_op_nomem(struct afs_operation *op)
+{
+	op->error = -ENOMEM;
+}
+
+static inline void afs_op_set_vnode(struct afs_operation *op, unsigned int n,
+				    struct afs_vnode *vnode)
+{
+	op->file[n].vnode = vnode;
+	op->file[n].need_io_lock = true;
+}
+
+static inline void afs_op_set_fid(struct afs_operation *op, unsigned int n,
+				  const struct afs_fid *fid)
+{
+	op->file[n].fid = *fid;
+}
 
 /*
  * fs_probe.c
@@ -1010,18 +1087,12 @@ extern void afs_fs_probe_dispatcher(struct work_struct *);
 /*
  * inode.c
  */
-extern void afs_vnode_commit_status(struct afs_operation *,
-				    struct afs_vnode *,
-				    unsigned int,
-				    const afs_dataversion_t *,
-				    struct afs_status_cb *);
+extern void afs_vnode_commit_status(struct afs_operation *, struct afs_vnode_param *);
 extern int afs_fetch_status(struct afs_vnode *, struct key *, bool, afs_access_t *);
-extern int afs_iget5_test(struct inode *, void *);
+extern int afs_ilookup5_test_by_fid(struct inode *, void *);
 extern struct inode *afs_iget_pseudo_dir(struct super_block *, bool);
-extern struct inode *afs_iget(struct super_block *, struct key *,
-			      struct afs_iget_data *, struct afs_status_cb *,
-			      struct afs_cb_interest *,
-			      struct afs_vnode *);
+extern struct inode *afs_iget(struct afs_operation *, struct afs_vnode_param *);
+extern struct inode *afs_root_iget(struct super_block *, struct key *);
 extern void afs_zap_data(struct afs_vnode *);
 extern bool afs_check_validity(struct afs_vnode *);
 extern int afs_validate(struct afs_vnode *, struct key *);
@@ -1109,11 +1180,9 @@ static inline void afs_put_sysnames(struct afs_sysnames *sysnames) {}
 /*
  * rotate.c
  */
-extern bool afs_begin_vnode_operation(struct afs_operation *, struct afs_vnode *,
-				      struct key *, bool);
 extern bool afs_select_fileserver(struct afs_operation *);
 extern bool afs_select_current_fileserver(struct afs_operation *);
-extern int afs_end_vnode_operation(struct afs_operation *);
+extern void afs_dump_edestaddrreq(const struct afs_operation *);
 
 /*
  * rxrpc.c
@@ -1135,10 +1204,16 @@ extern void afs_send_simple_reply(struct afs_call *, const void *, size_t);
 extern int afs_extract_data(struct afs_call *, bool);
 extern int afs_protocol_error(struct afs_call *, enum afs_eproto_cause);
 
-static inline void afs_set_fc_call(struct afs_call *call, struct afs_operation *op)
+static inline void afs_make_op_call(struct afs_operation *op, struct afs_call *call,
+				    gfp_t gfp)
 {
-	call->intr = op->flags & AFS_OPERATION_INTR;
+	op->call = call;
 	op->type = call->type;
+	call->op = op;
+	call->key = op->key;
+	call->cbi = afs_get_cb_interest(op->cbi);
+	call->intr = !(op->flags & AFS_OPERATION_UNINTR);
+	afs_make_call(&op->ac, call, gfp);
 }
 
 static inline void afs_extract_begin(struct afs_call *call, void *buf, size_t size)
@@ -1347,7 +1422,7 @@ extern struct afs_vlserver_list *afs_extract_vlserver_list(struct afs_cell *,
 /*
  * volume.c
  */
-static inline struct afs_volume *__afs_get_volume(struct afs_volume *volume)
+static inline struct afs_volume *afs_get_volume(struct afs_volume *volume)
 {
 	if (volume)
 		atomic_inc(&volume->usage);
@@ -1357,7 +1432,7 @@ static inline struct afs_volume *__afs_get_volume(struct afs_volume *volume)
 extern struct afs_volume *afs_create_volume(struct afs_fs_context *);
 extern void afs_activate_volume(struct afs_volume *);
 extern void afs_deactivate_volume(struct afs_volume *);
-extern void afs_put_volume(struct afs_cell *, struct afs_volume *);
+extern void afs_put_volume(struct afs_net *, struct afs_volume *);
 extern int afs_check_volume_status(struct afs_volume *, struct afs_operation *);
 
 /*
@@ -1387,36 +1462,24 @@ extern ssize_t afs_listxattr(struct dentry *, char *, size_t);
 /*
  * yfsclient.c
  */
-extern int yfs_fs_fetch_file_status(struct afs_operation *, struct afs_status_cb *,
-				    struct afs_volsync *);
-extern int yfs_fs_fetch_data(struct afs_operation *, struct afs_status_cb *, struct afs_read *);
-extern int yfs_fs_create_file(struct afs_operation *, const char *, umode_t, struct afs_status_cb *,
-			      struct afs_fid *, struct afs_status_cb *);
-extern int yfs_fs_make_dir(struct afs_operation *, const char *, umode_t, struct afs_status_cb *,
-			   struct afs_fid *, struct afs_status_cb *);
-extern int yfs_fs_remove_file2(struct afs_operation *, struct afs_vnode *, const char *,
-			       struct afs_status_cb *, struct afs_status_cb *);
-extern int yfs_fs_remove(struct afs_operation *, struct afs_vnode *, const char *, bool,
-			 struct afs_status_cb *);
-extern int yfs_fs_link(struct afs_operation *, struct afs_vnode *, const char *,
-		       struct afs_status_cb *, struct afs_status_cb *);
-extern int yfs_fs_symlink(struct afs_operation *, const char *, const char *,
-			  struct afs_status_cb *, struct afs_fid *, struct afs_status_cb *);
-extern int yfs_fs_rename(struct afs_operation *, const char *, struct afs_vnode *, const char *,
-			 struct afs_status_cb *, struct afs_status_cb *);
-extern int yfs_fs_store_data(struct afs_operation *, struct address_space *,
-			     pgoff_t, pgoff_t, unsigned, unsigned, struct afs_status_cb *);
-extern int yfs_fs_setattr(struct afs_operation *, struct iattr *, struct afs_status_cb *);
-extern int yfs_fs_get_volume_status(struct afs_operation *, struct afs_volume_status *);
-extern int yfs_fs_set_lock(struct afs_operation *, afs_lock_type_t, struct afs_status_cb *);
-extern int yfs_fs_extend_lock(struct afs_operation *, struct afs_status_cb *);
-extern int yfs_fs_release_lock(struct afs_operation *, struct afs_status_cb *);
-extern int yfs_fs_fetch_status(struct afs_operation *, struct afs_net *,
-			       struct afs_fid *, struct afs_status_cb *,
-			       struct afs_volsync *);
-extern int yfs_fs_inline_bulk_status(struct afs_operation *, struct afs_net *,
-				     struct afs_fid *, struct afs_status_cb *,
-				     unsigned int, struct afs_volsync *);
+extern void yfs_fs_fetch_file_status(struct afs_operation *);
+extern void yfs_fs_fetch_data(struct afs_operation *);
+extern void yfs_fs_create_file(struct afs_operation *);
+extern void yfs_fs_make_dir(struct afs_operation *);
+extern void yfs_fs_remove_file2(struct afs_operation *);
+extern void yfs_fs_remove_file(struct afs_operation *);
+extern void yfs_fs_remove_dir(struct afs_operation *);
+extern void yfs_fs_link(struct afs_operation *);
+extern void yfs_fs_symlink(struct afs_operation *);
+extern void yfs_fs_rename(struct afs_operation *);
+extern void yfs_fs_store_data(struct afs_operation *);
+extern void yfs_fs_setattr(struct afs_operation *);
+extern void yfs_fs_get_volume_status(struct afs_operation *);
+extern void yfs_fs_set_lock(struct afs_operation *);
+extern void yfs_fs_extend_lock(struct afs_operation *);
+extern void yfs_fs_release_lock(struct afs_operation *);
+extern void yfs_fs_fetch_status(struct afs_operation *);
+extern void yfs_fs_inline_bulk_status(struct afs_operation *);
 
 struct yfs_acl {
 	struct afs_acl	*acl;		/* Dir/file/symlink ACL */
@@ -1429,10 +1492,8 @@ struct yfs_acl {
 };
 
 extern void yfs_free_opaque_acl(struct yfs_acl *);
-extern struct yfs_acl *yfs_fs_fetch_opaque_acl(struct afs_operation *, struct yfs_acl *,
-					       struct afs_status_cb *);
-extern int yfs_fs_store_opaque_acl2(struct afs_operation *, const struct afs_acl *,
-				    struct afs_status_cb *);
+extern void yfs_fs_fetch_opaque_acl(struct afs_operation *);
+extern void yfs_fs_store_opaque_acl2(struct afs_operation *);
 
 /*
  * Miscellaneous inline functions.
@@ -1450,12 +1511,26 @@ static inline struct inode *AFS_VNODE_TO_I(struct afs_vnode *vnode)
 static inline void afs_check_for_remote_deletion(struct afs_operation *op,
 						 struct afs_vnode *vnode)
 {
-	if (op->ac.error == -ENOENT) {
+	if (op->error == -ENOENT) {
 		set_bit(AFS_VNODE_DELETED, &vnode->flags);
 		afs_break_callback(vnode, afs_cb_break_for_deleted);
 	}
 }
 
+/*
+ * Note that a dentry got changed.  We need to set d_fsdata to the data version
+ * number derived from the result of the operation.  It doesn't matter if
+ * d_fsdata goes backwards as we'll just revalidate.
+ */
+static inline void afs_update_dentry_version(struct afs_operation *op,
+					     struct afs_vnode_param *dir_vp,
+					     struct dentry *dentry)
+{
+	if (!op->error)
+		dentry->d_fsdata =
+			(void *)(unsigned long)dir_vp->scb.status.data_version;
+}
+
 static inline int afs_io_error(struct afs_call *call, enum afs_io_error where)
 {
 	trace_afs_io_error(call->debug_id, -EIO, where);
diff --git a/fs/afs/rotate.c b/fs/afs/rotate.c
index c930033473f6..e667145335d9 100644
--- a/fs/afs/rotate.c
+++ b/fs/afs/rotate.c
@@ -14,37 +14,6 @@
 #include "internal.h"
 #include "afs_fs.h"
 
-/*
- * Begin an operation on the fileserver.
- *
- * Fileserver operations are serialised on the server by vnode, so we serialise
- * them here also using the io_lock.
- */
-bool afs_begin_vnode_operation(struct afs_operation *op, struct afs_vnode *vnode,
-			       struct key *key, bool intr)
-{
-	memset(op, 0, sizeof(*op));
-	op->vnode = vnode;
-	op->key = key;
-	op->ac.error = SHRT_MAX;
-	op->error = -EDESTADDRREQ;
-
-	if (intr) {
-		op->flags |= AFS_OPERATION_INTR;
-		if (mutex_lock_interruptible(&vnode->io_lock) < 0) {
-			op->error = -EINTR;
-			op->flags |= AFS_OPERATION_STOP;
-			return false;
-		}
-	} else {
-		mutex_lock(&vnode->io_lock);
-	}
-
-	if (vnode->lock_state != AFS_VNODE_LOCK_NONE)
-		op->flags |= AFS_OPERATION_CUR_ONLY;
-	return true;
-}
-
 /*
  * Begin iteration through a server list, starting with the vnode's last used
  * server if possible, or the last recorded good server if not.
@@ -55,9 +24,9 @@ static bool afs_start_fs_iteration(struct afs_operation *op,
 	struct afs_cb_interest *cbi;
 	int i;
 
-	read_lock(&vnode->volume->servers_lock);
-	op->server_list = afs_get_serverlist(vnode->volume->servers);
-	read_unlock(&vnode->volume->servers_lock);
+	read_lock(&op->volume->servers_lock);
+	op->server_list = afs_get_serverlist(op->volume->servers);
+	read_unlock(&op->volume->servers_lock);
 
 	op->untried = (1UL << op->server_list->nr_servers) - 1;
 	op->index = READ_ONCE(op->server_list->preferred);
@@ -90,7 +59,7 @@ static bool afs_start_fs_iteration(struct afs_operation *op,
 			vnode->cb_break++;
 		write_sequnlock(&vnode->cb_lock);
 
-		afs_put_cb_interest(afs_v2net(vnode), cbi);
+		afs_put_cb_interest(op->net, cbi);
 		cbi = NULL;
 	}
 
@@ -120,7 +89,7 @@ static void afs_busy(struct afs_volume *volume, u32 abort_code)
  */
 static bool afs_sleep_and_retry(struct afs_operation *op)
 {
-	if (op->flags & AFS_OPERATION_INTR) {
+	if (!(op->flags & AFS_OPERATION_UNINTR)) {
 		msleep_interruptible(1000);
 		if (signal_pending(current)) {
 			op->error = -ERESTARTSYS;
@@ -141,7 +110,7 @@ bool afs_select_fileserver(struct afs_operation *op)
 {
 	struct afs_addr_list *alist;
 	struct afs_server *server;
-	struct afs_vnode *vnode = op->vnode;
+	struct afs_vnode *vnode = op->file[0].vnode;
 	struct afs_error e;
 	u32 rtt;
 	int error = op->ac.error, i;
@@ -187,16 +156,16 @@ bool afs_select_fileserver(struct afs_operation *op)
 				goto next_server;
 			}
 
-			write_lock(&vnode->volume->servers_lock);
+			write_lock(&op->volume->servers_lock);
 			op->server_list->vnovol_mask |= 1 << op->index;
-			write_unlock(&vnode->volume->servers_lock);
+			write_unlock(&op->volume->servers_lock);
 
-			set_bit(AFS_VOLUME_NEEDS_UPDATE, &vnode->volume->flags);
-			error = afs_check_volume_status(vnode->volume, op);
+			set_bit(AFS_VOLUME_NEEDS_UPDATE, &op->volume->flags);
+			error = afs_check_volume_status(op->volume, op);
 			if (error < 0)
 				goto failed_set_error;
 
-			if (test_bit(AFS_VOLUME_DELETED, &vnode->volume->flags)) {
+			if (test_bit(AFS_VOLUME_DELETED, &op->volume->flags)) {
 				op->error = -ENOMEDIUM;
 				goto failed;
 			}
@@ -204,7 +173,7 @@ bool afs_select_fileserver(struct afs_operation *op)
 			/* If the server list didn't change, then assume that
 			 * it's the fileserver having trouble.
 			 */
-			if (vnode->volume->servers == op->server_list) {
+			if (op->volume->servers == op->server_list) {
 				op->error = -EREMOTEIO;
 				goto next_server;
 			}
@@ -224,9 +193,9 @@ bool afs_select_fileserver(struct afs_operation *op)
 			goto next_server;
 
 		case VOFFLINE:
-			if (!test_and_set_bit(AFS_VOLUME_OFFLINE, &vnode->volume->flags)) {
-				afs_busy(vnode->volume, op->ac.abort_code);
-				clear_bit(AFS_VOLUME_BUSY, &vnode->volume->flags);
+			if (!test_and_set_bit(AFS_VOLUME_OFFLINE, &op->volume->flags)) {
+				afs_busy(op->volume, op->ac.abort_code);
+				clear_bit(AFS_VOLUME_BUSY, &op->volume->flags);
 			}
 			if (op->flags & AFS_OPERATION_NO_VSLEEP) {
 				op->error = -EADV;
@@ -248,9 +217,9 @@ bool afs_select_fileserver(struct afs_operation *op)
 				op->error = -EBUSY;
 				goto failed;
 			}
-			if (!test_and_set_bit(AFS_VOLUME_BUSY, &vnode->volume->flags)) {
-				afs_busy(vnode->volume, op->ac.abort_code);
-				clear_bit(AFS_VOLUME_OFFLINE, &vnode->volume->flags);
+			if (!test_and_set_bit(AFS_VOLUME_BUSY, &op->volume->flags)) {
+				afs_busy(op->volume, op->ac.abort_code);
+				clear_bit(AFS_VOLUME_OFFLINE, &op->volume->flags);
 			}
 		busy:
 			if (op->flags & AFS_OPERATION_CUR_ONLY) {
@@ -279,9 +248,9 @@ bool afs_select_fileserver(struct afs_operation *op)
 			}
 			op->flags |= AFS_OPERATION_VMOVED;
 
-			set_bit(AFS_VOLUME_WAIT, &vnode->volume->flags);
-			set_bit(AFS_VOLUME_NEEDS_UPDATE, &vnode->volume->flags);
-			error = afs_check_volume_status(vnode->volume, op);
+			set_bit(AFS_VOLUME_WAIT, &op->volume->flags);
+			set_bit(AFS_VOLUME_NEEDS_UPDATE, &op->volume->flags);
+			error = afs_check_volume_status(op->volume, op);
 			if (error < 0)
 				goto failed_set_error;
 
@@ -294,7 +263,7 @@ bool afs_select_fileserver(struct afs_operation *op)
 			 *
 			 * TODO: Retry a few times with sleeps.
 			 */
-			if (vnode->volume->servers == op->server_list) {
+			if (op->volume->servers == op->server_list) {
 				op->error = -ENOMEDIUM;
 				goto failed;
 			}
@@ -302,8 +271,8 @@ bool afs_select_fileserver(struct afs_operation *op)
 			goto restart_from_beginning;
 
 		default:
-			clear_bit(AFS_VOLUME_OFFLINE, &vnode->volume->flags);
-			clear_bit(AFS_VOLUME_BUSY, &vnode->volume->flags);
+			clear_bit(AFS_VOLUME_OFFLINE, &op->volume->flags);
+			clear_bit(AFS_VOLUME_BUSY, &op->volume->flags);
 			op->error = afs_abort_to_error(op->ac.abort_code);
 			goto failed;
 		}
@@ -332,23 +301,23 @@ bool afs_select_fileserver(struct afs_operation *op)
 restart_from_beginning:
 	_debug("restart");
 	afs_end_cursor(&op->ac);
-	afs_put_cb_interest(afs_v2net(vnode), op->cbi);
+	afs_put_cb_interest(op->net, op->cbi);
 	op->cbi = NULL;
-	afs_put_serverlist(afs_v2net(vnode), op->server_list);
+	afs_put_serverlist(op->net, op->server_list);
 	op->server_list = NULL;
 start:
 	_debug("start");
 	/* See if we need to do an update of the volume record.  Note that the
 	 * volume may have moved or even have been deleted.
 	 */
-	error = afs_check_volume_status(vnode->volume, op);
+	error = afs_check_volume_status(op->volume, op);
 	if (error < 0)
 		goto failed_set_error;
 
 	if (!afs_start_fs_iteration(op, vnode))
 		goto failed;
 
-	_debug("__ VOL %llx __", vnode->volume->vid);
+	_debug("__ VOL %llx __", op->volume->vid);
 
 pick_server:
 	_debug("pick [%lx]", op->untried);
@@ -364,7 +333,7 @@ bool afs_select_fileserver(struct afs_operation *op)
 		_debug("cbi %u", op->index);
 		if (test_bit(op->index, &op->untried))
 			goto selected_server;
-		afs_put_cb_interest(afs_v2net(vnode), op->cbi);
+		afs_put_cb_interest(op->net, op->cbi);
 		op->cbi = NULL;
 		_debug("nocbi");
 	}
@@ -482,26 +451,21 @@ bool afs_select_fileserver(struct afs_operation *op)
  */
 bool afs_select_current_fileserver(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = op->vnode;
 	struct afs_cb_interest *cbi;
 	struct afs_addr_list *alist;
 	int error = op->ac.error;
 
 	_enter("");
 
-	cbi = rcu_dereference_protected(vnode->cb_interest,
-					lockdep_is_held(&vnode->io_lock));
-
 	switch (error) {
 	case SHRT_MAX:
+		cbi = op->cbi;
 		if (!cbi) {
 			op->error = -ESTALE;
 			op->flags |= AFS_OPERATION_STOP;
 			return false;
 		}
 
-		op->cbi = afs_get_cb_interest(cbi);
-
 		read_lock(&cbi->server->fs_lock);
 		alist = rcu_dereference_protected(cbi->server->addresses,
 						  lockdep_is_held(&cbi->server->fs_lock));
@@ -561,7 +525,7 @@ bool afs_select_current_fileserver(struct afs_operation *op)
 /*
  * Dump cursor state in the case of the error being EDESTADDRREQ.
  */
-static void afs_dump_edestaddrreq(const struct afs_operation *op)
+void afs_dump_edestaddrreq(const struct afs_operation *op)
 {
 	static int count;
 	int i;
@@ -574,7 +538,8 @@ static void afs_dump_edestaddrreq(const struct afs_operation *op)
 
 	pr_notice("EDESTADDR occurred\n");
 	pr_notice("FC: cbb=%x cbb2=%x fl=%hx err=%hd\n",
-		  op->cb_break, op->cb_break_2, op->flags, op->error);
+		  op->file[0].cb_break_before,
+		  op->file[1].cb_break_before, op->flags, op->error);
 	pr_notice("FC: ut=%lx ix=%d ni=%u\n",
 		  op->untried, op->index, op->nr_iterations);
 
@@ -606,28 +571,3 @@ static void afs_dump_edestaddrreq(const struct afs_operation *op)
 		  op->ac.responded, op->ac.nr_iterations);
 	rcu_read_unlock();
 }
-
-/*
- * Tidy up a filesystem cursor and unlock the vnode.
- */
-int afs_end_vnode_operation(struct afs_operation *op)
-{
-	struct afs_net *net = afs_v2net(op->vnode);
-
-	if (op->error == -EDESTADDRREQ ||
-	    op->error == -EADDRNOTAVAIL ||
-	    op->error == -ENETUNREACH ||
-	    op->error == -EHOSTUNREACH)
-		afs_dump_edestaddrreq(op);
-
-	mutex_unlock(&op->vnode->io_lock);
-
-	afs_end_cursor(&op->ac);
-	afs_put_cb_interest(net, op->cbi);
-	afs_put_serverlist(net, op->server_list);
-
-	if (op->error == -ECONNABORTED)
-		op->error = afs_abort_to_error(op->ac.abort_code);
-
-	return op->error;
-}
diff --git a/fs/afs/rxrpc.c b/fs/afs/rxrpc.c
index 00b87bac4fec..bd4d8e5efe59 100644
--- a/fs/afs/rxrpc.c
+++ b/fs/afs/rxrpc.c
@@ -283,18 +283,19 @@ static void afs_load_bvec(struct afs_call *call, struct msghdr *msg,
 			  struct bio_vec *bv, pgoff_t first, pgoff_t last,
 			  unsigned offset)
 {
+	struct afs_operation *op = call->op;
 	struct page *pages[AFS_BVEC_MAX];
 	unsigned int nr, n, i, to, bytes = 0;
 
 	nr = min_t(pgoff_t, last - first + 1, AFS_BVEC_MAX);
-	n = find_get_pages_contig(call->mapping, first, nr, pages);
+	n = find_get_pages_contig(op->store.mapping, first, nr, pages);
 	ASSERTCMP(n, ==, nr);
 
 	msg->msg_flags |= MSG_MORE;
 	for (i = 0; i < nr; i++) {
 		to = PAGE_SIZE;
 		if (first + i >= last) {
-			to = call->last_to;
+			to = op->store.last_to;
 			msg->msg_flags &= ~MSG_MORE;
 		}
 		bv[i].bv_page = pages[i];
@@ -324,13 +325,14 @@ static void afs_notify_end_request_tx(struct sock *sock,
  */
 static int afs_send_pages(struct afs_call *call, struct msghdr *msg)
 {
+	struct afs_operation *op = call->op;
 	struct bio_vec bv[AFS_BVEC_MAX];
 	unsigned int bytes, nr, loop, offset;
-	pgoff_t first = call->first, last = call->last;
+	pgoff_t first = op->store.first, last = op->store.last;
 	int ret;
 
-	offset = call->first_offset;
-	call->first_offset = 0;
+	offset = op->store.first_offset;
+	op->store.first_offset = 0;
 
 	do {
 		afs_load_bvec(call, msg, bv, first, last, offset);
@@ -340,7 +342,7 @@ static int afs_send_pages(struct afs_call *call, struct msghdr *msg)
 		bytes = msg->msg_iter.count;
 		nr = msg->msg_iter.nr_segs;
 
-		ret = rxrpc_kernel_send_data(call->net->socket, call->rxcall, msg,
+		ret = rxrpc_kernel_send_data(op->net->socket, call->rxcall, msg,
 					     bytes, afs_notify_end_request_tx);
 		for (loop = 0; loop < nr; loop++)
 			put_page(bv[loop].bv_page);
@@ -350,7 +352,7 @@ static int afs_send_pages(struct afs_call *call, struct msghdr *msg)
 		first += nr;
 	} while (first <= last);
 
-	trace_afs_sent_pages(call, call->first, last, first, ret);
+	trace_afs_sent_pages(call, op->store.first, last, first, ret);
 	return ret;
 }
 
@@ -385,16 +387,18 @@ void afs_make_call(struct afs_addr_cursor *ac, struct afs_call *call, gfp_t gfp)
 	 */
 	tx_total_len = call->request_size;
 	if (call->send_pages) {
-		if (call->last == call->first) {
-			tx_total_len += call->last_to - call->first_offset;
+		struct afs_operation *op = call->op;
+
+		if (op->store.last == op->store.first) {
+			tx_total_len += op->store.last_to - op->store.first_offset;
 		} else {
 			/* It looks mathematically like you should be able to
 			 * combine the following lines with the ones above, but
 			 * unsigned arithmetic is fun when it wraps...
 			 */
-			tx_total_len += PAGE_SIZE - call->first_offset;
-			tx_total_len += call->last_to;
-			tx_total_len += (call->last - call->first - 1) * PAGE_SIZE;
+			tx_total_len += PAGE_SIZE - op->store.first_offset;
+			tx_total_len += op->store.last_to;
+			tx_total_len += (op->store.last - op->store.first - 1) * PAGE_SIZE;
 		}
 	}
 
diff --git a/fs/afs/server.c b/fs/afs/server.c
index 3008f2ecfeee..1c1e315094ae 100644
--- a/fs/afs/server.c
+++ b/fs/afs/server.c
@@ -424,10 +424,7 @@ static void __afs_put_server(struct afs_net *net, struct afs_server *server)
 	afs_dec_servers_outstanding(net);
 }
 
-/*
- * destroy a dead server
- */
-static void afs_destroy_server(struct afs_net *net, struct afs_server *server)
+static void afs_give_up_callbacks(struct afs_net *net, struct afs_server *server)
 {
 	struct afs_addr_list *alist = rcu_access_pointer(server->addresses);
 	struct afs_addr_cursor ac = {
@@ -436,8 +433,16 @@ static void afs_destroy_server(struct afs_net *net, struct afs_server *server)
 		.error	= 0,
 	};
 
+	afs_fs_give_up_all_callbacks(net, server, &ac, NULL);
+}
+
+/*
+ * destroy a dead server
+ */
+static void afs_destroy_server(struct afs_net *net, struct afs_server *server)
+{
 	if (test_bit(AFS_SERVER_FL_MAY_HAVE_CB, &server->flags))
-		afs_fs_give_up_all_callbacks(net, server, &ac, NULL);
+		afs_give_up_callbacks(net, server);
 
 	afs_put_server(net, server, afs_server_trace_destroy);
 }
@@ -571,7 +576,8 @@ void afs_purge_servers(struct afs_net *net)
 /*
  * Get an update for a server's address list.
  */
-static noinline bool afs_update_server_record(struct afs_operation *fc, struct afs_server *server)
+static noinline bool afs_update_server_record(struct afs_operation *op,
+					      struct afs_server *server)
 {
 	struct afs_addr_list *alist, *discard;
 
@@ -580,18 +586,17 @@ static noinline bool afs_update_server_record(struct afs_operation *fc, struct a
 	trace_afs_server(server, atomic_read(&server->ref), atomic_read(&server->active),
 			 afs_server_trace_update);
 
-	alist = afs_vl_lookup_addrs(fc->vnode->volume->cell, fc->key,
-				    &server->uuid);
+	alist = afs_vl_lookup_addrs(op->volume->cell, op->key, &server->uuid);
 	if (IS_ERR(alist)) {
 		if ((PTR_ERR(alist) == -ERESTARTSYS ||
 		     PTR_ERR(alist) == -EINTR) &&
-		    !(fc->flags & AFS_OPERATION_INTR) &&
+		    (op->flags & AFS_OPERATION_UNINTR) &&
 		    server->addresses) {
 			_leave(" = t [intr]");
 			return true;
 		}
-		fc->error = PTR_ERR(alist);
-		_leave(" = f [%d]", fc->error);
+		op->error = PTR_ERR(alist);
+		_leave(" = f [%d]", op->error);
 		return false;
 	}
 
@@ -613,7 +618,7 @@ static noinline bool afs_update_server_record(struct afs_operation *fc, struct a
 /*
  * See if a server's address list needs updating.
  */
-bool afs_check_server_record(struct afs_operation *fc, struct afs_server *server)
+bool afs_check_server_record(struct afs_operation *op, struct afs_server *server)
 {
 	bool success;
 	int ret, retries = 0;
@@ -633,7 +638,7 @@ bool afs_check_server_record(struct afs_operation *fc, struct afs_server *server
 update:
 	if (!test_and_set_bit_lock(AFS_SERVER_FL_UPDATING, &server->flags)) {
 		clear_bit(AFS_SERVER_FL_NEEDS_UPDATE, &server->flags);
-		success = afs_update_server_record(fc, server);
+		success = afs_update_server_record(op, server);
 		clear_bit_unlock(AFS_SERVER_FL_UPDATING, &server->flags);
 		wake_up_bit(&server->flags, AFS_SERVER_FL_UPDATING);
 		_leave(" = %d", success);
@@ -642,10 +647,10 @@ bool afs_check_server_record(struct afs_operation *fc, struct afs_server *server
 
 wait:
 	ret = wait_on_bit(&server->flags, AFS_SERVER_FL_UPDATING,
-			  (fc->flags & AFS_OPERATION_INTR) ?
-			  TASK_INTERRUPTIBLE : TASK_UNINTERRUPTIBLE);
+			  (op->flags & AFS_OPERATION_UNINTR) ?
+			  TASK_UNINTERRUPTIBLE : TASK_INTERRUPTIBLE);
 	if (ret == -ERESTARTSYS) {
-		fc->error = ret;
+		op->error = ret;
 		_leave(" = f [intr]");
 		return false;
 	}
diff --git a/fs/afs/super.c b/fs/afs/super.c
index 9f412d7e7edf..c4bb314a22ae 100644
--- a/fs/afs/super.c
+++ b/fs/afs/super.c
@@ -373,7 +373,7 @@ static int afs_validate_fc(struct fs_context *fc)
 		ctx->key = key;
 
 		if (ctx->volume) {
-			afs_put_volume(ctx->cell, ctx->volume);
+			afs_put_volume(ctx->net, ctx->volume);
 			ctx->volume = NULL;
 		}
 
@@ -421,7 +421,6 @@ static int afs_set_super(struct super_block *sb, struct fs_context *fc)
 static int afs_fill_super(struct super_block *sb, struct afs_fs_context *ctx)
 {
 	struct afs_super_info *as = AFS_FS_S(sb);
-	struct afs_iget_data iget_data;
 	struct inode *inode = NULL;
 	int ret;
 
@@ -446,13 +445,7 @@ static int afs_fill_super(struct super_block *sb, struct afs_fs_context *ctx)
 	} else {
 		sprintf(sb->s_id, "%llu", as->volume->vid);
 		afs_activate_volume(as->volume);
-		iget_data.fid.vid	= as->volume->vid;
-		iget_data.fid.vnode	= 1;
-		iget_data.fid.vnode_hi	= 0;
-		iget_data.fid.unique	= 1;
-		iget_data.cb_v_break	= as->volume->cb_v_break;
-		iget_data.cb_s_break	= 0;
-		inode = afs_iget(sb, ctx->key, &iget_data, NULL, NULL, NULL);
+		inode = afs_root_iget(sb, ctx->key);
 	}
 
 	if (IS_ERR(inode))
@@ -496,7 +489,7 @@ static struct afs_super_info *afs_alloc_sbi(struct fs_context *fc)
 			as->dyn_root = true;
 		} else {
 			as->cell = afs_get_cell(ctx->cell);
-			as->volume = __afs_get_volume(ctx->volume);
+			as->volume = afs_get_volume(ctx->volume);
 		}
 	}
 	return as;
@@ -505,8 +498,9 @@ static struct afs_super_info *afs_alloc_sbi(struct fs_context *fc)
 static void afs_destroy_sbi(struct afs_super_info *as)
 {
 	if (as) {
-		afs_put_volume(as->cell, as->volume);
-		afs_put_cell(afs_net(as->net_ns), as->cell);
+		struct afs_net *net = afs_net(as->net_ns);
+		afs_put_volume(net, as->volume);
+		afs_put_cell(net, as->cell);
 		put_net(as->net_ns);
 		kfree(as);
 	}
@@ -592,7 +586,7 @@ static void afs_free_fc(struct fs_context *fc)
 	struct afs_fs_context *ctx = fc->fs_private;
 
 	afs_destroy_sbi(fc->s_fs_info);
-	afs_put_volume(ctx->cell, ctx->volume);
+	afs_put_volume(ctx->net, ctx->volume);
 	afs_put_cell(ctx->net, ctx->cell);
 	key_put(ctx->key);
 	kfree(ctx);
@@ -709,17 +703,32 @@ static void afs_destroy_inode(struct inode *inode)
 	atomic_dec(&afs_count_active_inodes);
 }
 
+static void afs_get_volume_status_success(struct afs_operation *op)
+{
+	struct afs_volume_status *vs = &op->volstatus.vs;
+	struct kstatfs *buf = op->volstatus.buf;
+
+	if (vs->max_quota == 0)
+		buf->f_blocks = vs->part_max_blocks;
+	else
+		buf->f_blocks = vs->max_quota;
+	buf->f_bavail = buf->f_bfree = buf->f_blocks - vs->blocks_in_use;
+}
+
+static const struct afs_operation_ops afs_get_volume_status_operation = {
+	.issue_afs_rpc	= afs_fs_get_volume_status,
+	.issue_yfs_rpc	= yfs_fs_get_volume_status,
+	.success	= afs_get_volume_status_success,
+};
+
 /*
  * return information about an AFS volume
  */
 static int afs_statfs(struct dentry *dentry, struct kstatfs *buf)
 {
 	struct afs_super_info *as = AFS_FS_S(dentry->d_sb);
-	struct afs_operation fc;
-	struct afs_volume_status vs;
+	struct afs_operation *op;
 	struct afs_vnode *vnode = AFS_FS_I(d_inode(dentry));
-	struct key *key;
-	int ret;
 
 	buf->f_type	= dentry->d_sb->s_magic;
 	buf->f_bsize	= AFS_BLOCK_SIZE;
@@ -732,31 +741,13 @@ static int afs_statfs(struct dentry *dentry, struct kstatfs *buf)
 		return 0;
 	}
 
-	key = afs_request_key(vnode->volume->cell);
-	if (IS_ERR(key))
-		return PTR_ERR(key);
+	op = afs_alloc_operation(NULL, as->volume);
+	if (IS_ERR(op))
+		return PTR_ERR(op);
 
-	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
-		fc.flags |= AFS_OPERATION_NO_VSLEEP;
-		while (afs_select_fileserver(&fc)) {
-			fc.cb_break = afs_calc_vnode_cb_break(vnode);
-			afs_fs_get_volume_status(&fc, &vs);
-		}
-
-		afs_check_for_remote_deletion(&fc, fc.vnode);
-		ret = afs_end_vnode_operation(&fc);
-	}
-
-	key_put(key);
-
-	if (ret == 0) {
-		if (vs.max_quota == 0)
-			buf->f_blocks = vs.part_max_blocks;
-		else
-			buf->f_blocks = vs.max_quota;
-		buf->f_bavail = buf->f_bfree = buf->f_blocks - vs.blocks_in_use;
-	}
-
-	return ret;
+	afs_op_set_vnode(op, 0, vnode);
+	op->nr_files		= 1;
+	op->volstatus.buf	= buf;
+	op->ops			= &afs_get_volume_status_operation;
+	return afs_do_sync_operation(op);
 }
diff --git a/fs/afs/volume.c b/fs/afs/volume.c
index 96351088a578..57d0509f7353 100644
--- a/fs/afs/volume.c
+++ b/fs/afs/volume.c
@@ -166,13 +166,13 @@ static void afs_destroy_volume(struct afs_net *net, struct afs_volume *volume)
 /*
  * Drop a reference on a volume record.
  */
-void afs_put_volume(struct afs_cell *cell, struct afs_volume *volume)
+void afs_put_volume(struct afs_net *net, struct afs_volume *volume)
 {
 	if (volume) {
 		_enter("%s", volume->name);
 
 		if (atomic_dec_and_test(&volume->usage))
-			afs_destroy_volume(cell->net, volume);
+			afs_destroy_volume(net, volume);
 	}
 }
 
@@ -280,7 +280,7 @@ static int afs_update_volume_status(struct afs_volume *volume, struct key *key)
 /*
  * Make sure the volume record is up to date.
  */
-int afs_check_volume_status(struct afs_volume *volume, struct afs_operation *fc)
+int afs_check_volume_status(struct afs_volume *volume, struct afs_operation *op)
 {
 	int ret, retries = 0;
 
@@ -298,7 +298,7 @@ int afs_check_volume_status(struct afs_volume *volume, struct afs_operation *fc)
 update:
 	if (!test_and_set_bit_lock(AFS_VOLUME_UPDATING, &volume->flags)) {
 		clear_bit(AFS_VOLUME_NEEDS_UPDATE, &volume->flags);
-		ret = afs_update_volume_status(volume, fc->key);
+		ret = afs_update_volume_status(volume, op->key);
 		if (ret < 0)
 			set_bit(AFS_VOLUME_NEEDS_UPDATE, &volume->flags);
 		clear_bit_unlock(AFS_VOLUME_WAIT, &volume->flags);
@@ -315,8 +315,8 @@ int afs_check_volume_status(struct afs_volume *volume, struct afs_operation *fc)
 	}
 
 	ret = wait_on_bit(&volume->flags, AFS_VOLUME_WAIT,
-			  (fc->flags & AFS_OPERATION_INTR) ?
-			  TASK_INTERRUPTIBLE : TASK_UNINTERRUPTIBLE);
+			  (op->flags & AFS_OPERATION_UNINTR) ?
+			  TASK_UNINTERRUPTIBLE : TASK_INTERRUPTIBLE);
 	if (ret == -ERESTARTSYS) {
 		_leave(" = %d", ret);
 		return ret;
diff --git a/fs/afs/write.c b/fs/afs/write.c
index 1a8af44ea36b..97bccde3298b 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -349,82 +349,111 @@ static void afs_pages_written_back(struct afs_vnode *vnode,
 }
 
 /*
- * write to a file
+ * Find a key to use for the writeback.  We cached the keys used to author the
+ * writes on the vnode.  *_wbk will contain the last writeback key used or NULL
+ * and we need to start from there if it's set.
  */
-static int afs_store_data(struct address_space *mapping,
-			  pgoff_t first, pgoff_t last,
-			  unsigned offset, unsigned to)
+static int afs_get_writeback_key(struct afs_vnode *vnode,
+				 struct afs_wb_key **_wbk)
 {
-	struct afs_vnode *vnode = AFS_FS_I(mapping->host);
-	struct afs_operation fc;
-	struct afs_status_cb *scb;
 	struct afs_wb_key *wbk = NULL;
 	struct list_head *p;
 	int ret = -ENOKEY, ret2;
 
-	_enter("%s{%llx:%llu.%u},%lx,%lx,%x,%x",
-	       vnode->volume->name,
-	       vnode->fid.vid,
-	       vnode->fid.vnode,
-	       vnode->fid.unique,
-	       first, last, offset, to);
-
-	scb = kzalloc(sizeof(struct afs_status_cb), GFP_NOFS);
-	if (!scb)
-		return -ENOMEM;
-
 	spin_lock(&vnode->wb_lock);
-	p = vnode->wb_keys.next;
+	if (*_wbk)
+		p = (*_wbk)->vnode_link.next;
+	else
+		p = vnode->wb_keys.next;
 
-	/* Iterate through the list looking for a valid key to use. */
-try_next_key:
 	while (p != &vnode->wb_keys) {
 		wbk = list_entry(p, struct afs_wb_key, vnode_link);
 		_debug("wbk %u", key_serial(wbk->key));
 		ret2 = key_validate(wbk->key);
-		if (ret2 == 0)
-			goto found_key;
+		if (ret2 == 0) {
+			refcount_inc(&wbk->usage);
+			_debug("USE WB KEY %u", key_serial(wbk->key));
+			break;
+		}
+
+		wbk = NULL;
 		if (ret == -ENOKEY)
 			ret = ret2;
 		p = p->next;
 	}
 
 	spin_unlock(&vnode->wb_lock);
-	afs_put_wb_key(wbk);
-	kfree(scb);
-	_leave(" = %d [no keys]", ret);
-	return ret;
+	if (*_wbk)
+		afs_put_wb_key(*_wbk);
+	*_wbk = wbk;
+	return 0;
+}
 
-found_key:
-	refcount_inc(&wbk->usage);
-	spin_unlock(&vnode->wb_lock);
+static void afs_store_data_success(struct afs_operation *op)
+{
+	struct afs_vnode *vnode = op->file[0].vnode;
 
-	_debug("USE WB KEY %u", key_serial(wbk->key));
+	afs_vnode_commit_status(op, &op->file[0]);
+	if (op->error == 0) {
+		afs_pages_written_back(vnode, op->store.first, op->store.last);
+		afs_stat_v(vnode, n_stores);
+		atomic_long_add((op->store.last * PAGE_SIZE + op->store.last_to) -
+				(op->store.first * PAGE_SIZE + op->store.first_offset),
+				&afs_v2net(vnode)->n_store_bytes);
+	}
+}
 
-	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, wbk->key, false)) {
-		afs_dataversion_t data_version = vnode->status.data_version + 1;
+static const struct afs_operation_ops afs_store_data_operation = {
+	.issue_afs_rpc	= afs_fs_store_data,
+	.issue_yfs_rpc	= yfs_fs_store_data,
+	.success	= afs_store_data_success,
+};
 
-		while (afs_select_fileserver(&fc)) {
-			fc.cb_break = afs_calc_vnode_cb_break(vnode);
-			afs_fs_store_data(&fc, mapping, first, last, offset, to, scb);
-		}
+/*
+ * write to a file
+ */
+static int afs_store_data(struct address_space *mapping,
+			  pgoff_t first, pgoff_t last,
+			  unsigned offset, unsigned to)
+{
+	struct afs_vnode *vnode = AFS_FS_I(mapping->host);
+	struct afs_operation *op;
+	struct afs_wb_key *wbk = NULL;
+	int ret;
 
-		afs_check_for_remote_deletion(&fc, vnode);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break,
-					&data_version, scb);
-		if (fc.ac.error == 0)
-			afs_pages_written_back(vnode, first, last);
-		ret = afs_end_vnode_operation(&fc);
+	_enter("%s{%llx:%llu.%u},%lx,%lx,%x,%x",
+	       vnode->volume->name,
+	       vnode->fid.vid,
+	       vnode->fid.vnode,
+	       vnode->fid.unique,
+	       first, last, offset, to);
+
+	ret = afs_get_writeback_key(vnode, &wbk);
+	if (ret) {
+		_leave(" = %d [no keys]", ret);
+		return ret;
 	}
 
-	switch (ret) {
-	case 0:
-		afs_stat_v(vnode, n_stores);
-		atomic_long_add((last * PAGE_SIZE + to) -
-				(first * PAGE_SIZE + offset),
-				&afs_v2net(vnode)->n_store_bytes);
-		break;
+	op = afs_alloc_operation(wbk->key, vnode->volume);
+	if (IS_ERR(op)) {
+		afs_put_wb_key(wbk);
+		return -ENOMEM;
+	}
+
+	afs_op_set_vnode(op, 0, vnode);
+	op->file[0].dv_delta = 1;
+	op->store.mapping = mapping;
+	op->store.first = first;
+	op->store.last = last;
+	op->store.first_offset = offset;
+	op->store.last_to = to;
+	op->ops = &afs_store_data_operation;
+
+try_next_key:
+	afs_begin_vnode_operation(op);
+	afs_wait_for_operation(op);
+
+	switch (op->error) {
 	case -EACCES:
 	case -EPERM:
 	case -ENOKEY:
@@ -432,16 +461,19 @@ static int afs_store_data(struct address_space *mapping,
 	case -EKEYREJECTED:
 	case -EKEYREVOKED:
 		_debug("next");
-		spin_lock(&vnode->wb_lock);
-		p = wbk->vnode_link.next;
-		afs_put_wb_key(wbk);
-		goto try_next_key;
+
+		ret = afs_get_writeback_key(vnode, &wbk);
+		if (ret == 0) {
+			key_put(op->key);
+			op->key = key_get(wbk->key);
+			goto try_next_key;
+		}
+		break;
 	}
 
 	afs_put_wb_key(wbk);
-	kfree(scb);
-	_leave(" = %d", ret);
-	return ret;
+	_leave(" = %d", op->error);
+	return afs_put_operation(op);
 }
 
 /*
diff --git a/fs/afs/xattr.c b/fs/afs/xattr.c
index bf645f1c90b0..84f3c4f57531 100644
--- a/fs/afs/xattr.c
+++ b/fs/afs/xattr.c
@@ -34,6 +34,25 @@ ssize_t afs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 	return sizeof(afs_xattr_list);
 }
 
+/*
+ * Deal with the result of a successful fetch ACL operation.
+ */
+static void afs_acl_success(struct afs_operation *op)
+{
+	afs_vnode_commit_status(op, &op->file[0]);
+}
+
+static void afs_acl_put(struct afs_operation *op)
+{
+	kfree(op->acl);
+}
+
+static const struct afs_operation_ops afs_fetch_acl_operation = {
+	.issue_afs_rpc	= afs_fs_fetch_acl,
+	.success	= afs_acl_success,
+	.put		= afs_acl_put,
+};
+
 /*
  * Get a file's ACL.
  */
@@ -42,37 +61,23 @@ static int afs_xattr_get_acl(const struct xattr_handler *handler,
 			     struct inode *inode, const char *name,
 			     void *buffer, size_t size)
 {
-	struct afs_operation fc;
-	struct afs_status_cb *scb;
+	struct afs_operation *op;
 	struct afs_vnode *vnode = AFS_FS_I(inode);
 	struct afs_acl *acl = NULL;
-	struct key *key;
-	int ret = -ENOMEM;
+	int ret;
 
-	scb = kzalloc(sizeof(struct afs_status_cb), GFP_NOFS);
-	if (!scb)
-		goto error;
-
-	key = afs_request_key(vnode->volume->cell);
-	if (IS_ERR(key)) {
-		ret = PTR_ERR(key);
-		goto error_scb;
-	}
+	op = afs_alloc_operation(NULL, vnode->volume);
+	if (IS_ERR(op))
+		return -ENOMEM;
 
-	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
-		afs_dataversion_t data_version = vnode->status.data_version;
-
-		while (afs_select_fileserver(&fc)) {
-			fc.cb_break = afs_calc_vnode_cb_break(vnode);
-			acl = afs_fs_fetch_acl(&fc, scb);
-		}
+	afs_op_set_vnode(op, 0, vnode);
+	op->ops = &afs_fetch_acl_operation;
 
-		afs_check_for_remote_deletion(&fc, fc.vnode);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break,
-					&data_version, scb);
-		ret = afs_end_vnode_operation(&fc);
-	}
+	afs_begin_vnode_operation(op);
+	afs_wait_for_operation(op);
+	acl = op->acl;
+	op->acl = NULL;
+	ret = afs_put_operation(op);
 
 	if (ret == 0) {
 		ret = acl->size;
@@ -80,18 +85,37 @@ static int afs_xattr_get_acl(const struct xattr_handler *handler,
 			if (acl->size <= size)
 				memcpy(buffer, acl->data, acl->size);
 			else
-				ret = -ERANGE;
+				op->error = -ERANGE;
 		}
-		kfree(acl);
 	}
 
-	key_put(key);
-error_scb:
-	kfree(scb);
-error:
+	kfree(acl);
 	return ret;
 }
 
+static bool afs_make_acl(struct afs_operation *op,
+			 const void *buffer, size_t size)
+{
+	struct afs_acl *acl;
+
+	acl = kmalloc(sizeof(*acl) + size, GFP_KERNEL);
+	if (!acl) {
+		afs_op_nomem(op);
+		return false;
+	}
+
+	acl->size = size;
+	memcpy(acl->data, buffer, size);
+	op->acl = acl;
+	return true;
+}
+
+static const struct afs_operation_ops afs_store_acl_operation = {
+	.issue_afs_rpc	= afs_fs_store_acl,
+	.success	= afs_acl_success,
+	.put		= afs_acl_put,
+};
+
 /*
  * Set a file's AFS3 ACL.
  */
@@ -100,55 +124,22 @@ static int afs_xattr_set_acl(const struct xattr_handler *handler,
                              struct inode *inode, const char *name,
                              const void *buffer, size_t size, int flags)
 {
-	struct afs_operation fc;
-	struct afs_status_cb *scb;
+	struct afs_operation *op;
 	struct afs_vnode *vnode = AFS_FS_I(inode);
-	struct afs_acl *acl = NULL;
-	struct key *key;
-	int ret = -ENOMEM;
 
 	if (flags == XATTR_CREATE)
 		return -EINVAL;
 
-	scb = kzalloc(sizeof(struct afs_status_cb), GFP_NOFS);
-	if (!scb)
-		goto error;
-
-	acl = kmalloc(sizeof(*acl) + size, GFP_KERNEL);
-	if (!acl)
-		goto error_scb;
-
-	key = afs_request_key(vnode->volume->cell);
-	if (IS_ERR(key)) {
-		ret = PTR_ERR(key);
-		goto error_acl;
-	}
-
-	acl->size = size;
-	memcpy(acl->data, buffer, size);
-
-	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
-		afs_dataversion_t data_version = vnode->status.data_version;
+	op = afs_alloc_operation(NULL, vnode->volume);
+	if (IS_ERR(op))
+		return -ENOMEM;
 
-		while (afs_select_fileserver(&fc)) {
-			fc.cb_break = afs_calc_vnode_cb_break(vnode);
-			afs_fs_store_acl(&fc, acl, scb);
-		}
+	afs_op_set_vnode(op, 0, vnode);
+	if (!afs_make_acl(op, buffer, size))
+		return afs_put_operation(op);
 
-		afs_check_for_remote_deletion(&fc, fc.vnode);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break,
-					&data_version, scb);
-		ret = afs_end_vnode_operation(&fc);
-	}
-
-	key_put(key);
-error_acl:
-	kfree(acl);
-error_scb:
-	kfree(scb);
-error:
-	return ret;
+	op->ops = &afs_store_acl_operation;
+	return afs_do_sync_operation(op);
 }
 
 static const struct xattr_handler afs_xattr_afs_acl_handler = {
@@ -157,6 +148,17 @@ static const struct xattr_handler afs_xattr_afs_acl_handler = {
 	.set    = afs_xattr_set_acl,
 };
 
+static void yfs_acl_put(struct afs_operation *op)
+{
+	yfs_free_opaque_acl(op->yacl);
+}
+
+static const struct afs_operation_ops yfs_fetch_opaque_acl_operation = {
+	.issue_yfs_rpc	= yfs_fs_fetch_opaque_acl,
+	.success	= afs_acl_success,
+	/* Don't free op->yacl in .put here */
+};
+
 /*
  * Get a file's YFS ACL.
  */
@@ -165,11 +167,9 @@ static int afs_xattr_get_yfs(const struct xattr_handler *handler,
 			     struct inode *inode, const char *name,
 			     void *buffer, size_t size)
 {
-	struct afs_operation fc;
-	struct afs_status_cb *scb;
+	struct afs_operation *op;
 	struct afs_vnode *vnode = AFS_FS_I(inode);
 	struct yfs_acl *yacl = NULL;
-	struct key *key;
 	char buf[16], *data;
 	int which = 0, dsize, ret = -ENOMEM;
 
@@ -193,75 +193,62 @@ static int afs_xattr_get_yfs(const struct xattr_handler *handler,
 	else if (which == 3)
 		yacl->flags |= YFS_ACL_WANT_VOL_ACL;
 
-	scb = kzalloc(sizeof(struct afs_status_cb), GFP_NOFS);
-	if (!scb)
+	op = afs_alloc_operation(NULL, vnode->volume);
+	if (IS_ERR(op))
 		goto error_yacl;
 
-	key = afs_request_key(vnode->volume->cell);
-	if (IS_ERR(key)) {
-		ret = PTR_ERR(key);
-		goto error_scb;
-	}
+	afs_op_set_vnode(op, 0, vnode);
+	op->yacl = yacl;
+	op->ops = &yfs_fetch_opaque_acl_operation;
 
-	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
-		afs_dataversion_t data_version = vnode->status.data_version;
+	afs_begin_vnode_operation(op);
+	afs_wait_for_operation(op);
+	ret = afs_put_operation(op);
 
-		while (afs_select_fileserver(&fc)) {
-			fc.cb_break = afs_calc_vnode_cb_break(vnode);
-			yfs_fs_fetch_opaque_acl(&fc, yacl, scb);
+	if (ret == 0) {
+		switch (which) {
+		case 0:
+			data = yacl->acl->data;
+			dsize = yacl->acl->size;
+			break;
+		case 1:
+			data = buf;
+			dsize = scnprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
+			break;
+		case 2:
+			data = buf;
+			dsize = scnprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
+			break;
+		case 3:
+			data = yacl->vol_acl->data;
+			dsize = yacl->vol_acl->size;
+			break;
+		default:
+			ret = -EOPNOTSUPP;
+			goto error_yacl;
 		}
 
-		afs_check_for_remote_deletion(&fc, fc.vnode);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break,
-					&data_version, scb);
-		ret = afs_end_vnode_operation(&fc);
-	}
-
-	if (ret < 0)
-		goto error_key;
-
-	switch (which) {
-	case 0:
-		data = yacl->acl->data;
-		dsize = yacl->acl->size;
-		break;
-	case 1:
-		data = buf;
-		dsize = scnprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
-		break;
-	case 2:
-		data = buf;
-		dsize = scnprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
-		break;
-	case 3:
-		data = yacl->vol_acl->data;
-		dsize = yacl->vol_acl->size;
-		break;
-	default:
-		ret = -EOPNOTSUPP;
-		goto error_key;
-	}
-
-	ret = dsize;
-	if (size > 0) {
-		if (dsize > size) {
-			ret = -ERANGE;
-			goto error_key;
+		ret = dsize;
+		if (size > 0) {
+			if (dsize <= size)
+				memcpy(buffer, data, dsize);
+			else
+				ret = -ERANGE;
 		}
-		memcpy(buffer, data, dsize);
 	}
 
-error_key:
-	key_put(key);
-error_scb:
-	kfree(scb);
 error_yacl:
 	yfs_free_opaque_acl(yacl);
 error:
 	return ret;
 }
 
+static const struct afs_operation_ops yfs_store_opaque_acl2_operation = {
+	.issue_yfs_rpc	= yfs_fs_store_opaque_acl2,
+	.success	= afs_acl_success,
+	.put		= yfs_acl_put,
+};
+
 /*
  * Set a file's YFS ACL.
  */
@@ -270,56 +257,23 @@ static int afs_xattr_set_yfs(const struct xattr_handler *handler,
                              struct inode *inode, const char *name,
                              const void *buffer, size_t size, int flags)
 {
-	struct afs_operation fc;
-	struct afs_status_cb *scb;
+	struct afs_operation *op;
 	struct afs_vnode *vnode = AFS_FS_I(inode);
-	struct afs_acl *acl = NULL;
-	struct key *key;
-	int ret = -ENOMEM;
 
 	if (flags == XATTR_CREATE ||
 	    strcmp(name, "acl") != 0)
 		return -EINVAL;
 
-	scb = kzalloc(sizeof(struct afs_status_cb), GFP_NOFS);
-	if (!scb)
-		goto error;
-
-	acl = kmalloc(sizeof(*acl) + size, GFP_KERNEL);
-	if (!acl)
-		goto error_scb;
+	op = afs_alloc_operation(NULL, vnode->volume);
+	if (IS_ERR(op))
+		return -ENOMEM;
 
-	acl->size = size;
-	memcpy(acl->data, buffer, size);
+	afs_op_set_vnode(op, 0, vnode);
+	if (!afs_make_acl(op, buffer, size))
+		return afs_put_operation(op);
 
-	key = afs_request_key(vnode->volume->cell);
-	if (IS_ERR(key)) {
-		ret = PTR_ERR(key);
-		goto error_acl;
-	}
-
-	ret = -ERESTARTSYS;
-	if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
-		afs_dataversion_t data_version = vnode->status.data_version;
-
-		while (afs_select_fileserver(&fc)) {
-			fc.cb_break = afs_calc_vnode_cb_break(vnode);
-			yfs_fs_store_opaque_acl2(&fc, acl, scb);
-		}
-
-		afs_check_for_remote_deletion(&fc, fc.vnode);
-		afs_vnode_commit_status(&fc, vnode, fc.cb_break,
-					&data_version, scb);
-		ret = afs_end_vnode_operation(&fc);
-	}
-
-error_acl:
-	kfree(acl);
-	key_put(key);
-error_scb:
-	kfree(scb);
-error:
-	return ret;
+	op->ops = &yfs_store_opaque_acl2_operation;
+	return afs_do_sync_operation(op);
 }
 
 static const struct xattr_handler afs_xattr_yfs_handler = {
diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index 360b4a560ba7..d0cd112a3720 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -17,11 +17,6 @@
 
 static const struct afs_fid afs_zero_fid;
 
-static inline void afs_use_fs_server(struct afs_call *call, struct afs_cb_interest *cbi)
-{
-	call->cbi = afs_get_cb_interest(cbi);
-}
-
 #define xdr_size(x) (sizeof(*x) / sizeof(__be32))
 
 static void xdr_decode_YFSFid(const __be32 **_bp, struct afs_fid *fid)
@@ -79,6 +74,11 @@ static __be32 *xdr_encode_string(__be32 *bp, const char *p, unsigned int len)
 	return bp + len / sizeof(__be32);
 }
 
+static __be32 *xdr_encode_name(__be32 *bp, const struct qstr *p)
+{
+	return xdr_encode_string(bp, p->name, p->len);
+}
+
 static s64 linux_to_yfs_time(const struct timespec64 *t)
 {
 	/* Convert to 100ns intervals. */
@@ -336,6 +336,7 @@ static void xdr_decode_YFSFetchVolumeStatus(const __be32 **_bp,
  */
 static int yfs_deliver_fs_status_cb_and_volsync(struct afs_call *call)
 {
+	struct afs_operation *op = call->op;
 	const __be32 *bp;
 	int ret;
 
@@ -345,9 +346,9 @@ static int yfs_deliver_fs_status_cb_and_volsync(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
-	xdr_decode_YFSCallBack(&bp, call, call->out_scb);
-	xdr_decode_YFSVolSync(&bp, call->out_volsync);
+	xdr_decode_YFSFetchStatus(&bp, call, &op->file[0].scb);
+	xdr_decode_YFSCallBack(&bp, call, &op->file[0].scb);
+	xdr_decode_YFSVolSync(&bp, &op->volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -359,6 +360,7 @@ static int yfs_deliver_fs_status_cb_and_volsync(struct afs_call *call)
  */
 static int yfs_deliver_status_and_volsync(struct afs_call *call)
 {
+	struct afs_operation *op = call->op;
 	const __be32 *bp;
 	int ret;
 
@@ -367,8 +369,8 @@ static int yfs_deliver_status_and_volsync(struct afs_call *call)
 		return ret;
 
 	bp = call->buffer;
-	xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
-	xdr_decode_YFSVolSync(&bp, call->out_volsync);
+	xdr_decode_YFSFetchStatus(&bp, call, &op->file[0].scb);
+	xdr_decode_YFSVolSync(&bp, &op->volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -387,44 +389,33 @@ static const struct afs_call_type yfs_RXYFSFetchStatus_vnode = {
 /*
  * Fetch the status information for a file.
  */
-int yfs_fs_fetch_file_status(struct afs_operation *fc, struct afs_status_cb *scb,
-			     struct afs_volsync *volsync)
+void yfs_fs_fetch_file_status(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
 	__be32 *bp;
 
 	_enter(",%x,{%llx:%llu},,",
-	       key_serial(fc->key), vnode->fid.vid, vnode->fid.vnode);
+	       key_serial(op->key), vp->fid.vid, vp->fid.vnode);
 
-	call = afs_alloc_flat_call(net, &yfs_RXYFSFetchStatus_vnode,
+	call = afs_alloc_flat_call(op->net, &yfs_RXYFSFetchStatus_vnode,
 				   sizeof(__be32) * 2 +
 				   sizeof(struct yfs_xdr_YFSFid),
 				   sizeof(struct yfs_xdr_YFSFetchStatus) +
 				   sizeof(struct yfs_xdr_YFSCallBack) +
 				   sizeof(struct yfs_xdr_YFSVolSync));
-	if (!call) {
-		fc->ac.error = -ENOMEM;
-		return -ENOMEM;
-	}
-
-	call->key = fc->key;
-	call->out_scb = scb;
-	call->out_volsync = volsync;
+	if (!call)
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp = xdr_encode_u32(bp, YFSFETCHSTATUS);
 	bp = xdr_encode_u32(bp, 0); /* RPC flags */
-	bp = xdr_encode_YFSFid(bp, &vnode->fid);
+	bp = xdr_encode_YFSFid(bp, &vp->fid);
 	yfs_check_req(call, bp);
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, &vnode->fid);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -432,7 +423,9 @@ int yfs_fs_fetch_file_status(struct afs_operation *fc, struct afs_status_cb *scb
  */
 static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 {
-	struct afs_read *req = call->read_request;
+	struct afs_operation *op = call->op;
+	struct afs_vnode_param *vp = &op->file[0];
+	struct afs_read *req = op->fetch.req;
 	const __be32 *bp;
 	unsigned int size;
 	int ret;
@@ -527,12 +520,12 @@ static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 			return ret;
 
 		bp = call->buffer;
-		xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
-		xdr_decode_YFSCallBack(&bp, call, call->out_scb);
-		xdr_decode_YFSVolSync(&bp, call->out_volsync);
+		xdr_decode_YFSFetchStatus(&bp, call, &vp->scb);
+		xdr_decode_YFSCallBack(&bp, call, &vp->scb);
+		xdr_decode_YFSVolSync(&bp, &op->volsync);
 
-		req->data_version = call->out_scb->status.data_version;
-		req->file_size = call->out_scb->status.size;
+		req->data_version = vp->scb.status.data_version;
+		req->file_size = vp->scb.status.size;
 
 		call->unmarshall++;
 		/* Fall through */
@@ -556,12 +549,6 @@ static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 	return 0;
 }
 
-static void yfs_fetch_data_destructor(struct afs_call *call)
-{
-	afs_put_read(call->read_request);
-	afs_flat_call_destructor(call);
-}
-
 /*
  * YFS.FetchData64 operation type
  */
@@ -569,25 +556,24 @@ static const struct afs_call_type yfs_RXYFSFetchData64 = {
 	.name		= "YFS.FetchData64",
 	.op		= yfs_FS_FetchData64,
 	.deliver	= yfs_deliver_fs_fetch_data64,
-	.destructor	= yfs_fetch_data_destructor,
+	.destructor	= afs_flat_call_destructor,
 };
 
 /*
  * Fetch data from a file.
  */
-int yfs_fs_fetch_data(struct afs_operation *fc, struct afs_status_cb *scb,
-		      struct afs_read *req)
+void yfs_fs_fetch_data(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
+	struct afs_read *req = op->fetch.req;
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
 	__be32 *bp;
 
 	_enter(",%x,{%llx:%llu},%llx,%llx",
-	       key_serial(fc->key), vnode->fid.vid, vnode->fid.vnode,
+	       key_serial(op->key), vp->fid.vid, vp->fid.vnode,
 	       req->pos, req->len);
 
-	call = afs_alloc_flat_call(net, &yfs_RXYFSFetchData64,
+	call = afs_alloc_flat_call(op->net, &yfs_RXYFSFetchData64,
 				   sizeof(__be32) * 2 +
 				   sizeof(struct yfs_xdr_YFSFid) +
 				   sizeof(struct yfs_xdr_u64) * 2,
@@ -595,27 +581,19 @@ int yfs_fs_fetch_data(struct afs_operation *fc, struct afs_status_cb *scb,
 				   sizeof(struct yfs_xdr_YFSCallBack) +
 				   sizeof(struct yfs_xdr_YFSVolSync));
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->out_scb = scb;
-	call->out_volsync = NULL;
-	call->read_request = afs_get_read(req);
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp = xdr_encode_u32(bp, YFSFETCHDATA64);
 	bp = xdr_encode_u32(bp, 0); /* RPC flags */
-	bp = xdr_encode_YFSFid(bp, &vnode->fid);
+	bp = xdr_encode_YFSFid(bp, &vp->fid);
 	bp = xdr_encode_u64(bp, req->pos);
 	bp = xdr_encode_u64(bp, req->len);
 	yfs_check_req(call, bp);
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, &vnode->fid);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -623,6 +601,9 @@ int yfs_fs_fetch_data(struct afs_operation *fc, struct afs_status_cb *scb,
  */
 static int yfs_deliver_fs_create_vnode(struct afs_call *call)
 {
+	struct afs_operation *op = call->op;
+	struct afs_vnode_param *dvp = &op->file[0];
+	struct afs_vnode_param *vp = &op->file[1];
 	const __be32 *bp;
 	int ret;
 
@@ -634,11 +615,11 @@ static int yfs_deliver_fs_create_vnode(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	xdr_decode_YFSFid(&bp, call->out_fid);
-	xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
-	xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
-	xdr_decode_YFSCallBack(&bp, call, call->out_scb);
-	xdr_decode_YFSVolSync(&bp, call->out_volsync);
+	xdr_decode_YFSFid(&bp, &op->file[1].fid);
+	xdr_decode_YFSFetchStatus(&bp, call, &vp->scb);
+	xdr_decode_YFSFetchStatus(&bp, call, &dvp->scb);
+	xdr_decode_YFSCallBack(&bp, call, &vp->scb);
+	xdr_decode_YFSVolSync(&bp, &op->volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -657,26 +638,20 @@ static const struct afs_call_type afs_RXFSCreateFile = {
 /*
  * Create a file.
  */
-int yfs_fs_create_file(struct afs_operation *fc,
-		       const char *name,
-		       umode_t mode,
-		       struct afs_status_cb *dvnode_scb,
-		       struct afs_fid *newfid,
-		       struct afs_status_cb *new_scb)
+void yfs_fs_create_file(struct afs_operation *op)
 {
-	struct afs_vnode *dvnode = fc->vnode;
+	const struct qstr *name = &op->dentry->d_name;
+	struct afs_vnode_param *dvp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(dvnode);
-	size_t namesz, reqsz, rplsz;
+	size_t reqsz, rplsz;
 	__be32 *bp;
 
 	_enter("");
 
-	namesz = strlen(name);
 	reqsz = (sizeof(__be32) +
 		 sizeof(__be32) +
 		 sizeof(struct yfs_xdr_YFSFid) +
-		 xdr_strlen(namesz) +
+		 xdr_strlen(name->len) +
 		 sizeof(struct yfs_xdr_YFSStoreStatus) +
 		 sizeof(__be32));
 	rplsz = (sizeof(struct yfs_xdr_YFSFid) +
@@ -685,30 +660,22 @@ int yfs_fs_create_file(struct afs_operation *fc,
 		 sizeof(struct yfs_xdr_YFSCallBack) +
 		 sizeof(struct yfs_xdr_YFSVolSync));
 
-	call = afs_alloc_flat_call(net, &afs_RXFSCreateFile, reqsz, rplsz);
+	call = afs_alloc_flat_call(op->net, &afs_RXFSCreateFile, reqsz, rplsz);
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->out_dir_scb = dvnode_scb;
-	call->out_fid = newfid;
-	call->out_scb = new_scb;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp = xdr_encode_u32(bp, YFSCREATEFILE);
 	bp = xdr_encode_u32(bp, 0); /* RPC flags */
-	bp = xdr_encode_YFSFid(bp, &dvnode->fid);
-	bp = xdr_encode_string(bp, name, namesz);
-	bp = xdr_encode_YFSStoreStatus_mode(bp, mode);
+	bp = xdr_encode_YFSFid(bp, &dvp->fid);
+	bp = xdr_encode_name(bp, name);
+	bp = xdr_encode_YFSStoreStatus_mode(bp, op->create.mode);
 	bp = xdr_encode_u32(bp, yfs_LockNone); /* ViceLockType */
 	yfs_check_req(call, bp);
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call1(call, &dvnode->fid, name);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call1(call, &dvp->fid, name);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 static const struct afs_call_type yfs_RXFSMakeDir = {
@@ -721,26 +688,20 @@ static const struct afs_call_type yfs_RXFSMakeDir = {
 /*
  * Make a directory.
  */
-int yfs_fs_make_dir(struct afs_operation *fc,
-		    const char *name,
-		    umode_t mode,
-		    struct afs_status_cb *dvnode_scb,
-		    struct afs_fid *newfid,
-		    struct afs_status_cb *new_scb)
+void yfs_fs_make_dir(struct afs_operation *op)
 {
-	struct afs_vnode *dvnode = fc->vnode;
+	const struct qstr *name = &op->dentry->d_name;
+	struct afs_vnode_param *dvp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(dvnode);
-	size_t namesz, reqsz, rplsz;
+	size_t reqsz, rplsz;
 	__be32 *bp;
 
 	_enter("");
 
-	namesz = strlen(name);
 	reqsz = (sizeof(__be32) +
 		 sizeof(struct yfs_xdr_RPCFlags) +
 		 sizeof(struct yfs_xdr_YFSFid) +
-		 xdr_strlen(namesz) +
+		 xdr_strlen(name->len) +
 		 sizeof(struct yfs_xdr_YFSStoreStatus));
 	rplsz = (sizeof(struct yfs_xdr_YFSFid) +
 		 sizeof(struct yfs_xdr_YFSFetchStatus) +
@@ -748,29 +709,21 @@ int yfs_fs_make_dir(struct afs_operation *fc,
 		 sizeof(struct yfs_xdr_YFSCallBack) +
 		 sizeof(struct yfs_xdr_YFSVolSync));
 
-	call = afs_alloc_flat_call(net, &yfs_RXFSMakeDir, reqsz, rplsz);
+	call = afs_alloc_flat_call(op->net, &yfs_RXFSMakeDir, reqsz, rplsz);
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->out_dir_scb = dvnode_scb;
-	call->out_fid = newfid;
-	call->out_scb = new_scb;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp = xdr_encode_u32(bp, YFSMAKEDIR);
 	bp = xdr_encode_u32(bp, 0); /* RPC flags */
-	bp = xdr_encode_YFSFid(bp, &dvnode->fid);
-	bp = xdr_encode_string(bp, name, namesz);
-	bp = xdr_encode_YFSStoreStatus_mode(bp, mode);
+	bp = xdr_encode_YFSFid(bp, &dvp->fid);
+	bp = xdr_encode_name(bp, name);
+	bp = xdr_encode_YFSStoreStatus_mode(bp, op->create.mode);
 	yfs_check_req(call, bp);
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call1(call, &dvnode->fid, name);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call1(call, &dvp->fid, name);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -778,6 +731,9 @@ int yfs_fs_make_dir(struct afs_operation *fc,
  */
 static int yfs_deliver_fs_remove_file2(struct afs_call *call)
 {
+	struct afs_operation *op = call->op;
+	struct afs_vnode_param *dvp = &op->file[0];
+	struct afs_vnode_param *vp = &op->file[1];
 	struct afs_fid fid;
 	const __be32 *bp;
 	int ret;
@@ -789,15 +745,24 @@ static int yfs_deliver_fs_remove_file2(struct afs_call *call)
 		return ret;
 
 	bp = call->buffer;
-	xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
+	xdr_decode_YFSFetchStatus(&bp, call, &dvp->scb);
 	xdr_decode_YFSFid(&bp, &fid);
-	xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
+	xdr_decode_YFSFetchStatus(&bp, call, &vp->scb);
 	/* Was deleted if vnode->status.abort_code == VNOVNODE. */
 
-	xdr_decode_YFSVolSync(&bp, call->out_volsync);
+	xdr_decode_YFSVolSync(&bp, &op->volsync);
 	return 0;
 }
 
+static void yfs_done_fs_remove_file2(struct afs_call *call)
+{
+	if (call->error == -ECONNABORTED &&
+	    call->abort_code == RX_INVALID_OPERATION) {
+		set_bit(AFS_SERVER_FL_NO_RM2, &call->server->flags);
+		call->op->flags |= AFS_OPERATION_DOWNGRADE;
+	}
+}
+
 /*
  * YFS.RemoveFile2 operation type.
  */
@@ -805,55 +770,44 @@ static const struct afs_call_type yfs_RXYFSRemoveFile2 = {
 	.name		= "YFS.RemoveFile2",
 	.op		= yfs_FS_RemoveFile2,
 	.deliver	= yfs_deliver_fs_remove_file2,
+	.done		= yfs_done_fs_remove_file2,
 	.destructor	= afs_flat_call_destructor,
 };
 
 /*
  * Remove a file and retrieve new file status.
  */
-int yfs_fs_remove_file2(struct afs_operation *fc, struct afs_vnode *vnode,
-			const char *name, struct afs_status_cb *dvnode_scb,
-			struct afs_status_cb *vnode_scb)
+void yfs_fs_remove_file2(struct afs_operation *op)
 {
-	struct afs_vnode *dvnode = fc->vnode;
+	struct afs_vnode_param *dvp = &op->file[0];
+	const struct qstr *name = &op->dentry->d_name;
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(dvnode);
-	size_t namesz;
 	__be32 *bp;
 
 	_enter("");
 
-	namesz = strlen(name);
-
-	call = afs_alloc_flat_call(net, &yfs_RXYFSRemoveFile2,
+	call = afs_alloc_flat_call(op->net, &yfs_RXYFSRemoveFile2,
 				   sizeof(__be32) +
 				   sizeof(struct yfs_xdr_RPCFlags) +
 				   sizeof(struct yfs_xdr_YFSFid) +
-				   xdr_strlen(namesz),
+				   xdr_strlen(name->len),
 				   sizeof(struct yfs_xdr_YFSFetchStatus) +
 				   sizeof(struct yfs_xdr_YFSFid) +
 				   sizeof(struct yfs_xdr_YFSFetchStatus) +
 				   sizeof(struct yfs_xdr_YFSVolSync));
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->out_dir_scb = dvnode_scb;
-	call->out_scb = vnode_scb;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp = xdr_encode_u32(bp, YFSREMOVEFILE2);
 	bp = xdr_encode_u32(bp, 0); /* RPC flags */
-	bp = xdr_encode_YFSFid(bp, &dvnode->fid);
-	bp = xdr_encode_string(bp, name, namesz);
+	bp = xdr_encode_YFSFid(bp, &dvp->fid);
+	bp = xdr_encode_name(bp, name);
 	yfs_check_req(call, bp);
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call1(call, &dvnode->fid, name);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call1(call, &dvp->fid, name);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -861,6 +815,8 @@ int yfs_fs_remove_file2(struct afs_operation *fc, struct afs_vnode *vnode,
  */
 static int yfs_deliver_fs_remove(struct afs_call *call)
 {
+	struct afs_operation *op = call->op;
+	struct afs_vnode_param *dvp = &op->file[0];
 	const __be32 *bp;
 	int ret;
 
@@ -871,8 +827,8 @@ static int yfs_deliver_fs_remove(struct afs_call *call)
 		return ret;
 
 	bp = call->buffer;
-	xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
-	xdr_decode_YFSVolSync(&bp, call->out_volsync);
+	xdr_decode_YFSFetchStatus(&bp, call, &dvp->scb);
+	xdr_decode_YFSVolSync(&bp, &op->volsync);
 	return 0;
 }
 
@@ -886,6 +842,43 @@ static const struct afs_call_type yfs_RXYFSRemoveFile = {
 	.destructor	= afs_flat_call_destructor,
 };
 
+/*
+ * Remove a file.
+ */
+void yfs_fs_remove_file(struct afs_operation *op)
+{
+	const struct qstr *name = &op->dentry->d_name;
+	struct afs_vnode_param *dvp = &op->file[0];
+	struct afs_call *call;
+	__be32 *bp;
+
+	_enter("");
+
+	if (!test_bit(AFS_SERVER_FL_NO_RM2, &op->cbi->server->flags))
+		return yfs_fs_remove_file2(op);
+
+	call = afs_alloc_flat_call(op->net, &yfs_RXYFSRemoveFile,
+				   sizeof(__be32) +
+				   sizeof(struct yfs_xdr_RPCFlags) +
+				   sizeof(struct yfs_xdr_YFSFid) +
+				   xdr_strlen(name->len),
+				   sizeof(struct yfs_xdr_YFSFetchStatus) +
+				   sizeof(struct yfs_xdr_YFSVolSync));
+	if (!call)
+		return afs_op_nomem(op);
+
+	/* marshall the parameters */
+	bp = call->request;
+	bp = xdr_encode_u32(bp, YFSREMOVEFILE);
+	bp = xdr_encode_u32(bp, 0); /* RPC flags */
+	bp = xdr_encode_YFSFid(bp, &dvp->fid);
+	bp = xdr_encode_name(bp, name);
+	yfs_check_req(call, bp);
+
+	trace_afs_make_fs_call1(call, &dvp->fid, name);
+	afs_make_op_call(op, call, GFP_NOFS);
+}
+
 static const struct afs_call_type yfs_RXYFSRemoveDir = {
 	.name		= "YFS.RemoveDir",
 	.op		= yfs_FS_RemoveDir,
@@ -894,48 +887,37 @@ static const struct afs_call_type yfs_RXYFSRemoveDir = {
 };
 
 /*
- * remove a file or directory
+ * Remove a directory.
  */
-int yfs_fs_remove(struct afs_operation *fc, struct afs_vnode *vnode,
-		  const char *name, bool isdir,
-		  struct afs_status_cb *dvnode_scb)
+void yfs_fs_remove_dir(struct afs_operation *op)
 {
-	struct afs_vnode *dvnode = fc->vnode;
+	const struct qstr *name = &op->dentry->d_name;
+	struct afs_vnode_param *dvp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(dvnode);
-	size_t namesz;
 	__be32 *bp;
 
 	_enter("");
 
-	namesz = strlen(name);
-	call = afs_alloc_flat_call(
-		net, isdir ? &yfs_RXYFSRemoveDir : &yfs_RXYFSRemoveFile,
-		sizeof(__be32) +
-		sizeof(struct yfs_xdr_RPCFlags) +
-		sizeof(struct yfs_xdr_YFSFid) +
-		xdr_strlen(namesz),
-		sizeof(struct yfs_xdr_YFSFetchStatus) +
-		sizeof(struct yfs_xdr_YFSVolSync));
+	call = afs_alloc_flat_call(op->net, &yfs_RXYFSRemoveDir,
+				   sizeof(__be32) +
+				   sizeof(struct yfs_xdr_RPCFlags) +
+				   sizeof(struct yfs_xdr_YFSFid) +
+				   xdr_strlen(name->len),
+				   sizeof(struct yfs_xdr_YFSFetchStatus) +
+				   sizeof(struct yfs_xdr_YFSVolSync));
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->out_dir_scb = dvnode_scb;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
-	bp = xdr_encode_u32(bp, isdir ? YFSREMOVEDIR : YFSREMOVEFILE);
+	bp = xdr_encode_u32(bp, YFSREMOVEDIR);
 	bp = xdr_encode_u32(bp, 0); /* RPC flags */
-	bp = xdr_encode_YFSFid(bp, &dvnode->fid);
-	bp = xdr_encode_string(bp, name, namesz);
+	bp = xdr_encode_YFSFid(bp, &dvp->fid);
+	bp = xdr_encode_name(bp, name);
 	yfs_check_req(call, bp);
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call1(call, &dvnode->fid, name);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call1(call, &dvp->fid, name);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -943,6 +925,9 @@ int yfs_fs_remove(struct afs_operation *fc, struct afs_vnode *vnode,
  */
 static int yfs_deliver_fs_link(struct afs_call *call)
 {
+	struct afs_operation *op = call->op;
+	struct afs_vnode_param *dvp = &op->file[0];
+	struct afs_vnode_param *vp = &op->file[1];
 	const __be32 *bp;
 	int ret;
 
@@ -953,9 +938,9 @@ static int yfs_deliver_fs_link(struct afs_call *call)
 		return ret;
 
 	bp = call->buffer;
-	xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
-	xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
-	xdr_decode_YFSVolSync(&bp, call->out_volsync);
+	xdr_decode_YFSFetchStatus(&bp, call, &vp->scb);
+	xdr_decode_YFSFetchStatus(&bp, call, &dvp->scb);
+	xdr_decode_YFSVolSync(&bp, &op->volsync);
 	_leave(" = 0 [done]");
 	return 0;
 }
@@ -973,50 +958,39 @@ static const struct afs_call_type yfs_RXYFSLink = {
 /*
  * Make a hard link.
  */
-int yfs_fs_link(struct afs_operation *fc, struct afs_vnode *vnode,
-		const char *name,
-		struct afs_status_cb *dvnode_scb,
-		struct afs_status_cb *vnode_scb)
+void yfs_fs_link(struct afs_operation *op)
 {
-	struct afs_vnode *dvnode = fc->vnode;
+	const struct qstr *name = &op->dentry->d_name;
+	struct afs_vnode_param *dvp = &op->file[0];
+	struct afs_vnode_param *vp = &op->file[1];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
-	size_t namesz;
 	__be32 *bp;
 
 	_enter("");
 
-	namesz = strlen(name);
-	call = afs_alloc_flat_call(net, &yfs_RXYFSLink,
+	call = afs_alloc_flat_call(op->net, &yfs_RXYFSLink,
 				   sizeof(__be32) +
 				   sizeof(struct yfs_xdr_RPCFlags) +
 				   sizeof(struct yfs_xdr_YFSFid) +
-				   xdr_strlen(namesz) +
+				   xdr_strlen(name->len) +
 				   sizeof(struct yfs_xdr_YFSFid),
 				   sizeof(struct yfs_xdr_YFSFetchStatus) +
 				   sizeof(struct yfs_xdr_YFSFetchStatus) +
 				   sizeof(struct yfs_xdr_YFSVolSync));
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->out_dir_scb = dvnode_scb;
-	call->out_scb = vnode_scb;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp = xdr_encode_u32(bp, YFSLINK);
 	bp = xdr_encode_u32(bp, 0); /* RPC flags */
-	bp = xdr_encode_YFSFid(bp, &dvnode->fid);
-	bp = xdr_encode_string(bp, name, namesz);
-	bp = xdr_encode_YFSFid(bp, &vnode->fid);
+	bp = xdr_encode_YFSFid(bp, &dvp->fid);
+	bp = xdr_encode_name(bp, name);
+	bp = xdr_encode_YFSFid(bp, &vp->fid);
 	yfs_check_req(call, bp);
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call1(call, &vnode->fid, name);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call1(call, &vp->fid, name);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -1024,6 +998,9 @@ int yfs_fs_link(struct afs_operation *fc, struct afs_vnode *vnode,
  */
 static int yfs_deliver_fs_symlink(struct afs_call *call)
 {
+	struct afs_operation *op = call->op;
+	struct afs_vnode_param *dvp = &op->file[0];
+	struct afs_vnode_param *vp = &op->file[1];
 	const __be32 *bp;
 	int ret;
 
@@ -1035,10 +1012,10 @@ static int yfs_deliver_fs_symlink(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	xdr_decode_YFSFid(&bp, call->out_fid);
-	xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
-	xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
-	xdr_decode_YFSVolSync(&bp, call->out_volsync);
+	xdr_decode_YFSFid(&bp, &vp->fid);
+	xdr_decode_YFSFetchStatus(&bp, call, &vp->scb);
+	xdr_decode_YFSFetchStatus(&bp, call, &dvp->scb);
+	xdr_decode_YFSVolSync(&bp, &op->volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -1057,28 +1034,22 @@ static const struct afs_call_type yfs_RXYFSSymlink = {
 /*
  * Create a symbolic link.
  */
-int yfs_fs_symlink(struct afs_operation *fc,
-		   const char *name,
-		   const char *contents,
-		   struct afs_status_cb *dvnode_scb,
-		   struct afs_fid *newfid,
-		   struct afs_status_cb *vnode_scb)
+void yfs_fs_symlink(struct afs_operation *op)
 {
-	struct afs_vnode *dvnode = fc->vnode;
+	const struct qstr *name = &op->dentry->d_name;
+	struct afs_vnode_param *dvp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(dvnode);
-	size_t namesz, contents_sz;
+	size_t contents_sz;
 	__be32 *bp;
 
 	_enter("");
 
-	namesz = strlen(name);
-	contents_sz = strlen(contents);
-	call = afs_alloc_flat_call(net, &yfs_RXYFSSymlink,
+	contents_sz = strlen(op->create.symlink);
+	call = afs_alloc_flat_call(op->net, &yfs_RXYFSSymlink,
 				   sizeof(__be32) +
 				   sizeof(struct yfs_xdr_RPCFlags) +
 				   sizeof(struct yfs_xdr_YFSFid) +
-				   xdr_strlen(namesz) +
+				   xdr_strlen(name->len) +
 				   xdr_strlen(contents_sz) +
 				   sizeof(struct yfs_xdr_YFSStoreStatus),
 				   sizeof(struct yfs_xdr_YFSFid) +
@@ -1086,28 +1057,20 @@ int yfs_fs_symlink(struct afs_operation *fc,
 				   sizeof(struct yfs_xdr_YFSFetchStatus) +
 				   sizeof(struct yfs_xdr_YFSVolSync));
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->out_dir_scb = dvnode_scb;
-	call->out_fid = newfid;
-	call->out_scb = vnode_scb;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp = xdr_encode_u32(bp, YFSSYMLINK);
 	bp = xdr_encode_u32(bp, 0); /* RPC flags */
-	bp = xdr_encode_YFSFid(bp, &dvnode->fid);
-	bp = xdr_encode_string(bp, name, namesz);
-	bp = xdr_encode_string(bp, contents, contents_sz);
+	bp = xdr_encode_YFSFid(bp, &dvp->fid);
+	bp = xdr_encode_name(bp, name);
+	bp = xdr_encode_string(bp, op->create.symlink, contents_sz);
 	bp = xdr_encode_YFSStoreStatus_mode(bp, S_IRWXUGO);
 	yfs_check_req(call, bp);
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call1(call, &dvnode->fid, name);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call1(call, &dvp->fid, name);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -1115,6 +1078,9 @@ int yfs_fs_symlink(struct afs_operation *fc,
  */
 static int yfs_deliver_fs_rename(struct afs_call *call)
 {
+	struct afs_operation *op = call->op;
+	struct afs_vnode_param *orig_dvp = &op->file[0];
+	struct afs_vnode_param *new_dvp = &op->file[1];
 	const __be32 *bp;
 	int ret;
 
@@ -1128,9 +1094,9 @@ static int yfs_deliver_fs_rename(struct afs_call *call)
 	/* If the two dirs are the same, we have two copies of the same status
 	 * report, so we just decode it twice.
 	 */
-	xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
-	xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
-	xdr_decode_YFSVolSync(&bp, call->out_volsync);
+	xdr_decode_YFSFetchStatus(&bp, call, &orig_dvp->scb);
+	xdr_decode_YFSFetchStatus(&bp, call, &new_dvp->scb);
+	xdr_decode_YFSVolSync(&bp, &op->volsync);
 	_leave(" = 0 [done]");
 	return 0;
 }
@@ -1148,55 +1114,42 @@ static const struct afs_call_type yfs_RXYFSRename = {
 /*
  * Rename a file or directory.
  */
-int yfs_fs_rename(struct afs_operation *fc,
-		  const char *orig_name,
-		  struct afs_vnode *new_dvnode,
-		  const char *new_name,
-		  struct afs_status_cb *orig_dvnode_scb,
-		  struct afs_status_cb *new_dvnode_scb)
+void yfs_fs_rename(struct afs_operation *op)
 {
-	struct afs_vnode *orig_dvnode = fc->vnode;
+	struct afs_vnode_param *orig_dvp = &op->file[0];
+	struct afs_vnode_param *new_dvp = &op->file[1];
+	const struct qstr *orig_name = &op->dentry->d_name;
+	const struct qstr *new_name = &op->dentry_2->d_name;
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(orig_dvnode);
-	size_t o_namesz, n_namesz;
 	__be32 *bp;
 
 	_enter("");
 
-	o_namesz = strlen(orig_name);
-	n_namesz = strlen(new_name);
-	call = afs_alloc_flat_call(net, &yfs_RXYFSRename,
+	call = afs_alloc_flat_call(op->net, &yfs_RXYFSRename,
 				   sizeof(__be32) +
 				   sizeof(struct yfs_xdr_RPCFlags) +
 				   sizeof(struct yfs_xdr_YFSFid) +
-				   xdr_strlen(o_namesz) +
+				   xdr_strlen(orig_name->len) +
 				   sizeof(struct yfs_xdr_YFSFid) +
-				   xdr_strlen(n_namesz),
+				   xdr_strlen(new_name->len),
 				   sizeof(struct yfs_xdr_YFSFetchStatus) +
 				   sizeof(struct yfs_xdr_YFSFetchStatus) +
 				   sizeof(struct yfs_xdr_YFSVolSync));
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->out_dir_scb = orig_dvnode_scb;
-	call->out_scb = new_dvnode_scb;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp = xdr_encode_u32(bp, YFSRENAME);
 	bp = xdr_encode_u32(bp, 0); /* RPC flags */
-	bp = xdr_encode_YFSFid(bp, &orig_dvnode->fid);
-	bp = xdr_encode_string(bp, orig_name, o_namesz);
-	bp = xdr_encode_YFSFid(bp, &new_dvnode->fid);
-	bp = xdr_encode_string(bp, new_name, n_namesz);
+	bp = xdr_encode_YFSFid(bp, &orig_dvp->fid);
+	bp = xdr_encode_name(bp, orig_name);
+	bp = xdr_encode_YFSFid(bp, &new_dvp->fid);
+	bp = xdr_encode_name(bp, new_name);
 	yfs_check_req(call, bp);
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call2(call, &orig_dvnode->fid, orig_name, new_name);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call2(call, &orig_dvp->fid, orig_name, new_name);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -1212,27 +1165,23 @@ static const struct afs_call_type yfs_RXYFSStoreData64 = {
 /*
  * Store a set of pages to a large file.
  */
-int yfs_fs_store_data(struct afs_operation *fc, struct address_space *mapping,
-		      pgoff_t first, pgoff_t last,
-		      unsigned offset, unsigned to,
-		      struct afs_status_cb *scb)
+void yfs_fs_store_data(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
 	loff_t size, pos, i_size;
 	__be32 *bp;
 
 	_enter(",%x,{%llx:%llu},,",
-	       key_serial(fc->key), vnode->fid.vid, vnode->fid.vnode);
+	       key_serial(op->key), vp->fid.vid, vp->fid.vnode);
 
-	size = (loff_t)to - (loff_t)offset;
-	if (first != last)
-		size += (loff_t)(last - first) << PAGE_SHIFT;
-	pos = (loff_t)first << PAGE_SHIFT;
-	pos += offset;
+	size = (loff_t)op->store.last_to - (loff_t)op->store.first_offset;
+	if (op->store.first != op->store.last)
+		size += (loff_t)(op->store.last - op->store.first) << PAGE_SHIFT;
+	pos = (loff_t)op->store.first << PAGE_SHIFT;
+	pos += op->store.first_offset;
 
-	i_size = i_size_read(&vnode->vfs_inode);
+	i_size = i_size_read(&vp->vnode->vfs_inode);
 	if (pos + size > i_size)
 		i_size = size + pos;
 
@@ -1240,7 +1189,7 @@ int yfs_fs_store_data(struct afs_operation *fc, struct address_space *mapping,
 	       (unsigned long long)size, (unsigned long long)pos,
 	       (unsigned long long)i_size);
 
-	call = afs_alloc_flat_call(net, &yfs_RXYFSStoreData64,
+	call = afs_alloc_flat_call(op->net, &yfs_RXYFSStoreData64,
 				   sizeof(__be32) +
 				   sizeof(__be32) +
 				   sizeof(struct yfs_xdr_YFSFid) +
@@ -1249,33 +1198,24 @@ int yfs_fs_store_data(struct afs_operation *fc, struct address_space *mapping,
 				   sizeof(struct yfs_xdr_YFSFetchStatus) +
 				   sizeof(struct yfs_xdr_YFSVolSync));
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->mapping = mapping;
-	call->first = first;
-	call->last = last;
-	call->first_offset = offset;
-	call->last_to = to;
+		return afs_op_nomem(op);
+
+	call->key = op->key;
 	call->send_pages = true;
-	call->out_scb = scb;
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp = xdr_encode_u32(bp, YFSSTOREDATA64);
 	bp = xdr_encode_u32(bp, 0); /* RPC flags */
-	bp = xdr_encode_YFSFid(bp, &vnode->fid);
-	bp = xdr_encode_YFSStoreStatus_mtime(bp, &vnode->vfs_inode.i_mtime);
+	bp = xdr_encode_YFSFid(bp, &vp->fid);
+	bp = xdr_encode_YFSStoreStatus_mtime(bp, &op->mtime);
 	bp = xdr_encode_u64(bp, pos);
 	bp = xdr_encode_u64(bp, size);
 	bp = xdr_encode_u64(bp, i_size);
 	yfs_check_req(call, bp);
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, &vnode->fid);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -1299,18 +1239,17 @@ static const struct afs_call_type yfs_RXYFSStoreData64_as_Status = {
  * Set the attributes on a file, using YFS.StoreData64 rather than
  * YFS.StoreStatus so as to alter the file size also.
  */
-static int yfs_fs_setattr_size(struct afs_operation *fc, struct iattr *attr,
-			       struct afs_status_cb *scb)
+static void yfs_fs_setattr_size(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
+	struct iattr *attr = op->setattr.attr;
 	__be32 *bp;
 
 	_enter(",%x,{%llx:%llu},,",
-	       key_serial(fc->key), vnode->fid.vid, vnode->fid.vnode);
+	       key_serial(op->key), vp->fid.vid, vp->fid.vnode);
 
-	call = afs_alloc_flat_call(net, &yfs_RXYFSStoreData64_as_Status,
+	call = afs_alloc_flat_call(op->net, &yfs_RXYFSStoreData64_as_Status,
 				   sizeof(__be32) * 2 +
 				   sizeof(struct yfs_xdr_YFSFid) +
 				   sizeof(struct yfs_xdr_YFSStoreStatus) +
@@ -1318,72 +1257,59 @@ static int yfs_fs_setattr_size(struct afs_operation *fc, struct iattr *attr,
 				   sizeof(struct yfs_xdr_YFSFetchStatus) +
 				   sizeof(struct yfs_xdr_YFSVolSync));
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->out_scb = scb;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp = xdr_encode_u32(bp, YFSSTOREDATA64);
 	bp = xdr_encode_u32(bp, 0); /* RPC flags */
-	bp = xdr_encode_YFSFid(bp, &vnode->fid);
+	bp = xdr_encode_YFSFid(bp, &vp->fid);
 	bp = xdr_encode_YFS_StoreStatus(bp, attr);
 	bp = xdr_encode_u64(bp, attr->ia_size);	/* position of start of write */
 	bp = xdr_encode_u64(bp, 0);		/* size of write */
 	bp = xdr_encode_u64(bp, attr->ia_size);	/* new file length */
 	yfs_check_req(call, bp);
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, &vnode->fid);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
  * Set the attributes on a file, using YFS.StoreData64 if there's a change in
  * file size, and YFS.StoreStatus otherwise.
  */
-int yfs_fs_setattr(struct afs_operation *fc, struct iattr *attr,
-		   struct afs_status_cb *scb)
+void yfs_fs_setattr(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
+	struct iattr *attr = op->setattr.attr;
 	__be32 *bp;
 
 	if (attr->ia_valid & ATTR_SIZE)
-		return yfs_fs_setattr_size(fc, attr, scb);
+		return yfs_fs_setattr_size(op);
 
 	_enter(",%x,{%llx:%llu},,",
-	       key_serial(fc->key), vnode->fid.vid, vnode->fid.vnode);
+	       key_serial(op->key), vp->fid.vid, vp->fid.vnode);
 
-	call = afs_alloc_flat_call(net, &yfs_RXYFSStoreStatus,
+	call = afs_alloc_flat_call(op->net, &yfs_RXYFSStoreStatus,
 				   sizeof(__be32) * 2 +
 				   sizeof(struct yfs_xdr_YFSFid) +
 				   sizeof(struct yfs_xdr_YFSStoreStatus),
 				   sizeof(struct yfs_xdr_YFSFetchStatus) +
 				   sizeof(struct yfs_xdr_YFSVolSync));
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->out_scb = scb;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp = xdr_encode_u32(bp, YFSSTORESTATUS);
 	bp = xdr_encode_u32(bp, 0); /* RPC flags */
-	bp = xdr_encode_YFSFid(bp, &vnode->fid);
+	bp = xdr_encode_YFSFid(bp, &vp->fid);
 	bp = xdr_encode_YFS_StoreStatus(bp, attr);
 	yfs_check_req(call, bp);
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, &vnode->fid);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -1391,6 +1317,7 @@ int yfs_fs_setattr(struct afs_operation *fc, struct iattr *attr,
  */
 static int yfs_deliver_fs_get_volume_status(struct afs_call *call)
 {
+	struct afs_operation *op = call->op;
 	const __be32 *bp;
 	char *p;
 	u32 size;
@@ -1412,7 +1339,7 @@ static int yfs_deliver_fs_get_volume_status(struct afs_call *call)
 			return ret;
 
 		bp = call->buffer;
-		xdr_decode_YFSFetchVolumeStatus(&bp, call->out_volstatus);
+		xdr_decode_YFSFetchVolumeStatus(&bp, &op->volstatus.vs);
 		call->unmarshall++;
 		afs_extract_to_tmp(call);
 		/* Fall through */
@@ -1526,17 +1453,15 @@ static const struct afs_call_type yfs_RXYFSGetVolumeStatus = {
 /*
  * fetch the status of a volume
  */
-int yfs_fs_get_volume_status(struct afs_operation *fc,
-			     struct afs_volume_status *vs)
+void yfs_fs_get_volume_status(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
 	__be32 *bp;
 
 	_enter("");
 
-	call = afs_alloc_flat_call(net, &yfs_RXYFSGetVolumeStatus,
+	call = afs_alloc_flat_call(op->net, &yfs_RXYFSGetVolumeStatus,
 				   sizeof(__be32) * 2 +
 				   sizeof(struct yfs_xdr_u64),
 				   max_t(size_t,
@@ -1544,23 +1469,17 @@ int yfs_fs_get_volume_status(struct afs_operation *fc,
 					 sizeof(__be32),
 					 AFSOPAQUEMAX + 1));
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->out_volstatus = vs;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp = xdr_encode_u32(bp, YFSGETVOLUMESTATUS);
 	bp = xdr_encode_u32(bp, 0); /* RPC flags */
-	bp = xdr_encode_u64(bp, vnode->fid.vid);
+	bp = xdr_encode_u64(bp, vp->fid.vid);
 	yfs_check_req(call, bp);
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, &vnode->fid);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -1598,118 +1517,93 @@ static const struct afs_call_type yfs_RXYFSReleaseLock = {
 /*
  * Set a lock on a file
  */
-int yfs_fs_set_lock(struct afs_operation *fc, afs_lock_type_t type,
-		    struct afs_status_cb *scb)
+void yfs_fs_set_lock(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
 	__be32 *bp;
 
 	_enter("");
 
-	call = afs_alloc_flat_call(net, &yfs_RXYFSSetLock,
+	call = afs_alloc_flat_call(op->net, &yfs_RXYFSSetLock,
 				   sizeof(__be32) * 2 +
 				   sizeof(struct yfs_xdr_YFSFid) +
 				   sizeof(__be32),
 				   sizeof(struct yfs_xdr_YFSFetchStatus) +
 				   sizeof(struct yfs_xdr_YFSVolSync));
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->lvnode = vnode;
-	call->out_scb = scb;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp = xdr_encode_u32(bp, YFSSETLOCK);
 	bp = xdr_encode_u32(bp, 0); /* RPC flags */
-	bp = xdr_encode_YFSFid(bp, &vnode->fid);
-	bp = xdr_encode_u32(bp, type);
+	bp = xdr_encode_YFSFid(bp, &vp->fid);
+	bp = xdr_encode_u32(bp, op->lock.type);
 	yfs_check_req(call, bp);
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_calli(call, &vnode->fid, type);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_calli(call, &vp->fid, op->lock.type);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
  * extend a lock on a file
  */
-int yfs_fs_extend_lock(struct afs_operation *fc, struct afs_status_cb *scb)
+void yfs_fs_extend_lock(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
 	__be32 *bp;
 
 	_enter("");
 
-	call = afs_alloc_flat_call(net, &yfs_RXYFSExtendLock,
+	call = afs_alloc_flat_call(op->net, &yfs_RXYFSExtendLock,
 				   sizeof(__be32) * 2 +
 				   sizeof(struct yfs_xdr_YFSFid),
 				   sizeof(struct yfs_xdr_YFSFetchStatus) +
 				   sizeof(struct yfs_xdr_YFSVolSync));
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->lvnode = vnode;
-	call->out_scb = scb;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp = xdr_encode_u32(bp, YFSEXTENDLOCK);
 	bp = xdr_encode_u32(bp, 0); /* RPC flags */
-	bp = xdr_encode_YFSFid(bp, &vnode->fid);
+	bp = xdr_encode_YFSFid(bp, &vp->fid);
 	yfs_check_req(call, bp);
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, &vnode->fid);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
  * release a lock on a file
  */
-int yfs_fs_release_lock(struct afs_operation *fc, struct afs_status_cb *scb)
+void yfs_fs_release_lock(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
 	__be32 *bp;
 
 	_enter("");
 
-	call = afs_alloc_flat_call(net, &yfs_RXYFSReleaseLock,
+	call = afs_alloc_flat_call(op->net, &yfs_RXYFSReleaseLock,
 				   sizeof(__be32) * 2 +
 				   sizeof(struct yfs_xdr_YFSFid),
 				   sizeof(struct yfs_xdr_YFSFetchStatus) +
 				   sizeof(struct yfs_xdr_YFSVolSync));
 	if (!call)
-		return -ENOMEM;
-
-	call->key = fc->key;
-	call->lvnode = vnode;
-	call->out_scb = scb;
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp = xdr_encode_u32(bp, YFSRELEASELOCK);
 	bp = xdr_encode_u32(bp, 0); /* RPC flags */
-	bp = xdr_encode_YFSFid(bp, &vnode->fid);
+	bp = xdr_encode_YFSFid(bp, &vp->fid);
 	yfs_check_req(call, bp);
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, &vnode->fid);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -1725,45 +1619,33 @@ static const struct afs_call_type yfs_RXYFSFetchStatus = {
 /*
  * Fetch the status information for a fid without needing a vnode handle.
  */
-int yfs_fs_fetch_status(struct afs_operation *fc,
-			struct afs_net *net,
-			struct afs_fid *fid,
-			struct afs_status_cb *scb,
-			struct afs_volsync *volsync)
+void yfs_fs_fetch_status(struct afs_operation *op)
 {
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
 	__be32 *bp;
 
 	_enter(",%x,{%llx:%llu},,",
-	       key_serial(fc->key), fid->vid, fid->vnode);
+	       key_serial(op->key), vp->fid.vid, vp->fid.vnode);
 
-	call = afs_alloc_flat_call(net, &yfs_RXYFSFetchStatus,
+	call = afs_alloc_flat_call(op->net, &yfs_RXYFSFetchStatus,
 				   sizeof(__be32) * 2 +
 				   sizeof(struct yfs_xdr_YFSFid),
 				   sizeof(struct yfs_xdr_YFSFetchStatus) +
 				   sizeof(struct yfs_xdr_YFSCallBack) +
 				   sizeof(struct yfs_xdr_YFSVolSync));
-	if (!call) {
-		fc->ac.error = -ENOMEM;
-		return -ENOMEM;
-	}
-
-	call->key = fc->key;
-	call->out_scb = scb;
-	call->out_volsync = volsync;
+	if (!call)
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp = xdr_encode_u32(bp, YFSFETCHSTATUS);
 	bp = xdr_encode_u32(bp, 0); /* RPC flags */
-	bp = xdr_encode_YFSFid(bp, fid);
+	bp = xdr_encode_YFSFid(bp, &vp->fid);
 	yfs_check_req(call, bp);
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, fid);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -1771,6 +1653,7 @@ int yfs_fs_fetch_status(struct afs_operation *fc,
  */
 static int yfs_deliver_fs_inline_bulk_status(struct afs_call *call)
 {
+	struct afs_operation *op = call->op;
 	struct afs_status_cb *scb;
 	const __be32 *bp;
 	u32 tmp;
@@ -1792,8 +1675,8 @@ static int yfs_deliver_fs_inline_bulk_status(struct afs_call *call)
 			return ret;
 
 		tmp = ntohl(call->tmp);
-		_debug("status count: %u/%u", tmp, call->count2);
-		if (tmp != call->count2)
+		_debug("status count: %u/%u", tmp, op->nr_files);
+		if (tmp != op->nr_files)
 			return afs_protocol_error(call, afs_eproto_ibulkst_count);
 
 		call->count = 0;
@@ -1808,12 +1691,23 @@ static int yfs_deliver_fs_inline_bulk_status(struct afs_call *call)
 		if (ret < 0)
 			return ret;
 
+		switch (call->count) {
+		case 0:
+			scb = &op->file[0].scb;
+			break;
+		case 1:
+			scb = &op->file[1].scb;
+			break;
+		default:
+			scb = &op->more_files[call->count - 2].scb;
+			break;
+		}
+
 		bp = call->buffer;
-		scb = &call->out_scb[call->count];
 		xdr_decode_YFSFetchStatus(&bp, call, scb);
 
 		call->count++;
-		if (call->count < call->count2)
+		if (call->count < op->nr_files)
 			goto more_counts;
 
 		call->count = 0;
@@ -1830,7 +1724,7 @@ static int yfs_deliver_fs_inline_bulk_status(struct afs_call *call)
 
 		tmp = ntohl(call->tmp);
 		_debug("CB count: %u", tmp);
-		if (tmp != call->count2)
+		if (tmp != op->nr_files)
 			return afs_protocol_error(call, afs_eproto_ibulkst_cb_count);
 		call->count = 0;
 		call->unmarshall++;
@@ -1845,11 +1739,22 @@ static int yfs_deliver_fs_inline_bulk_status(struct afs_call *call)
 			return ret;
 
 		_debug("unmarshall CB array");
+		switch (call->count) {
+		case 0:
+			scb = &op->file[0].scb;
+			break;
+		case 1:
+			scb = &op->file[1].scb;
+			break;
+		default:
+			scb = &op->more_files[call->count - 2].scb;
+			break;
+		}
+
 		bp = call->buffer;
-		scb = &call->out_scb[call->count];
 		xdr_decode_YFSCallBack(&bp, call, scb);
 		call->count++;
-		if (call->count < call->count2)
+		if (call->count < op->nr_files)
 			goto more_cbs;
 
 		afs_extract_to_buf(call, sizeof(struct yfs_xdr_YFSVolSync));
@@ -1862,7 +1767,7 @@ static int yfs_deliver_fs_inline_bulk_status(struct afs_call *call)
 			return ret;
 
 		bp = call->buffer;
-		xdr_decode_YFSVolSync(&bp, call->out_volsync);
+		xdr_decode_YFSVolSync(&bp, &op->volsync);
 
 		call->unmarshall++;
 		/* Fall through */
@@ -1888,50 +1793,39 @@ static const struct afs_call_type yfs_RXYFSInlineBulkStatus = {
 /*
  * Fetch the status information for up to 1024 files
  */
-int yfs_fs_inline_bulk_status(struct afs_operation *fc,
-			      struct afs_net *net,
-			      struct afs_fid *fids,
-			      struct afs_status_cb *statuses,
-			      unsigned int nr_fids,
-			      struct afs_volsync *volsync)
+void yfs_fs_inline_bulk_status(struct afs_operation *op)
 {
+	struct afs_vnode_param *dvp = &op->file[0];
+	struct afs_vnode_param *vp = &op->file[1];
 	struct afs_call *call;
 	__be32 *bp;
 	int i;
 
 	_enter(",%x,{%llx:%llu},%u",
-	       key_serial(fc->key), fids[0].vid, fids[1].vnode, nr_fids);
+	       key_serial(op->key), vp->fid.vid, vp->fid.vnode, op->nr_files);
 
-	call = afs_alloc_flat_call(net, &yfs_RXYFSInlineBulkStatus,
+	call = afs_alloc_flat_call(op->net, &yfs_RXYFSInlineBulkStatus,
 				   sizeof(__be32) +
 				   sizeof(__be32) +
 				   sizeof(__be32) +
-				   sizeof(struct yfs_xdr_YFSFid) * nr_fids,
+				   sizeof(struct yfs_xdr_YFSFid) * op->nr_files,
 				   sizeof(struct yfs_xdr_YFSFetchStatus));
-	if (!call) {
-		fc->ac.error = -ENOMEM;
-		return -ENOMEM;
-	}
-
-	call->key = fc->key;
-	call->out_scb = statuses;
-	call->out_volsync = volsync;
-	call->count2 = nr_fids;
+	if (!call)
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp = xdr_encode_u32(bp, YFSINLINEBULKSTATUS);
 	bp = xdr_encode_u32(bp, 0); /* RPCFlags */
-	bp = xdr_encode_u32(bp, nr_fids);
-	for (i = 0; i < nr_fids; i++)
-		bp = xdr_encode_YFSFid(bp, &fids[i]);
+	bp = xdr_encode_u32(bp, op->nr_files);
+	bp = xdr_encode_YFSFid(bp, &dvp->fid);
+	bp = xdr_encode_YFSFid(bp, &vp->fid);
+	for (i = 0; i < op->nr_files - 2; i++)
+		bp = xdr_encode_YFSFid(bp, &op->more_files[i].fid);
 	yfs_check_req(call, bp);
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, &fids[0]);
-	afs_set_fc_call(call, fc);
-	afs_make_call(&fc->ac, call, GFP_NOFS);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_NOFS);
 }
 
 /*
@@ -1939,7 +1833,9 @@ int yfs_fs_inline_bulk_status(struct afs_operation *fc,
  */
 static int yfs_deliver_fs_fetch_opaque_acl(struct afs_call *call)
 {
-	struct yfs_acl *yacl = call->out_yacl;
+	struct afs_operation *op = call->op;
+	struct afs_vnode_param *vp = &op->file[0];
+	struct yfs_acl *yacl = op->yacl;
 	struct afs_acl *acl;
 	const __be32 *bp;
 	unsigned int size;
@@ -2029,8 +1925,8 @@ static int yfs_deliver_fs_fetch_opaque_acl(struct afs_call *call)
 		bp = call->buffer;
 		yacl->inherit_flag = ntohl(*bp++);
 		yacl->num_cleaned = ntohl(*bp++);
-		xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
-		xdr_decode_YFSVolSync(&bp, call->out_volsync);
+		xdr_decode_YFSFetchStatus(&bp, call, &vp->scb);
+		xdr_decode_YFSVolSync(&bp, &op->volsync);
 
 		call->unmarshall++;
 		/* Fall through */
@@ -2065,45 +1961,33 @@ static const struct afs_call_type yfs_RXYFSFetchOpaqueACL = {
 /*
  * Fetch the YFS advanced ACLs for a file.
  */
-struct yfs_acl *yfs_fs_fetch_opaque_acl(struct afs_operation *fc,
-					struct yfs_acl *yacl,
-					struct afs_status_cb *scb)
+void yfs_fs_fetch_opaque_acl(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
 	__be32 *bp;
 
 	_enter(",%x,{%llx:%llu},,",
-	       key_serial(fc->key), vnode->fid.vid, vnode->fid.vnode);
+	       key_serial(op->key), vp->fid.vid, vp->fid.vnode);
 
-	call = afs_alloc_flat_call(net, &yfs_RXYFSFetchOpaqueACL,
+	call = afs_alloc_flat_call(op->net, &yfs_RXYFSFetchOpaqueACL,
 				   sizeof(__be32) * 2 +
 				   sizeof(struct yfs_xdr_YFSFid),
 				   sizeof(__be32) * 2 +
 				   sizeof(struct yfs_xdr_YFSFetchStatus) +
 				   sizeof(struct yfs_xdr_YFSVolSync));
-	if (!call) {
-		fc->ac.error = -ENOMEM;
-		return ERR_PTR(-ENOMEM);
-	}
-
-	call->key = fc->key;
-	call->out_yacl = yacl;
-	call->out_scb = scb;
-	call->out_volsync = NULL;
+	if (!call)
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp = xdr_encode_u32(bp, YFSFETCHOPAQUEACL);
 	bp = xdr_encode_u32(bp, 0); /* RPC flags */
-	bp = xdr_encode_YFSFid(bp, &vnode->fid);
+	bp = xdr_encode_YFSFid(bp, &vp->fid);
 	yfs_check_req(call, bp);
 
-	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call(call, &vnode->fid);
-	afs_make_call(&fc->ac, call, GFP_KERNEL);
-	return (struct yfs_acl *)afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_KERNEL);
 }
 
 /*
@@ -2119,46 +2003,38 @@ static const struct afs_call_type yfs_RXYFSStoreOpaqueACL2 = {
 /*
  * Fetch the YFS ACL for a file.
  */
-int yfs_fs_store_opaque_acl2(struct afs_operation *fc, const struct afs_acl *acl,
-			     struct afs_status_cb *scb)
+void yfs_fs_store_opaque_acl2(struct afs_operation *op)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode_param *vp = &op->file[0];
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
+	struct afs_acl *acl = op->acl;
 	size_t size;
 	__be32 *bp;
 
 	_enter(",%x,{%llx:%llu},,",
-	       key_serial(fc->key), vnode->fid.vid, vnode->fid.vnode);
+	       key_serial(op->key), vp->fid.vid, vp->fid.vnode);
 
 	size = round_up(acl->size, 4);
-	call = afs_alloc_flat_call(net, &yfs_RXYFSStoreOpaqueACL2,
+	call = afs_alloc_flat_call(op->net, &yfs_RXYFSStoreOpaqueACL2,
 				   sizeof(__be32) * 2 +
 				   sizeof(struct yfs_xdr_YFSFid) +
 				   sizeof(__be32) + size,
 				   sizeof(struct yfs_xdr_YFSFetchStatus) +
 				   sizeof(struct yfs_xdr_YFSVolSync));
-	if (!call) {
-		fc->ac.error = -ENOMEM;
-		return -ENOMEM;
-	}
-
-	call->key = fc->key;
-	call->out_scb = scb;
-	call->out_volsync = NULL;
+	if (!call)
+		return afs_op_nomem(op);
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp = xdr_encode_u32(bp, YFSSTOREOPAQUEACL2);
 	bp = xdr_encode_u32(bp, 0); /* RPC flags */
-	bp = xdr_encode_YFSFid(bp, &vnode->fid);
+	bp = xdr_encode_YFSFid(bp, &vp->fid);
 	bp = xdr_encode_u32(bp, acl->size);
 	memcpy(bp, acl->data, acl->size);
 	if (acl->size != size)
 		memset((void *)bp + acl->size, 0, size - acl->size);
 	yfs_check_req(call, bp);
 
-	trace_afs_make_fs_call(call, &vnode->fid);
-	afs_make_call(&fc->ac, call, GFP_KERNEL);
-	return afs_wait_for_call_to_complete(call, &fc->ac);
+	trace_afs_make_fs_call(call, &vp->fid);
+	afs_make_op_call(op, call, GFP_KERNEL);
 }
diff --git a/include/trace/events/afs.h b/include/trace/events/afs.h
index a6d8a9891164..f4d66919fb22 100644
--- a/include/trace/events/afs.h
+++ b/include/trace/events/afs.h
@@ -642,7 +642,7 @@ TRACE_EVENT(afs_make_fs_calli,
 
 TRACE_EVENT(afs_make_fs_call1,
 	    TP_PROTO(struct afs_call *call, const struct afs_fid *fid,
-		     const char *name),
+		     const struct qstr *name),
 
 	    TP_ARGS(call, fid, name),
 
@@ -654,8 +654,7 @@ TRACE_EVENT(afs_make_fs_call1,
 			     ),
 
 	    TP_fast_assign(
-		    int __len = strlen(name);
-		    __len = min(__len, 23);
+		    unsigned int __len = min_t(unsigned int, name->len, 23);
 		    __entry->call = call->debug_id;
 		    __entry->op = call->operation_ID;
 		    if (fid) {
@@ -665,7 +664,7 @@ TRACE_EVENT(afs_make_fs_call1,
 			    __entry->fid.vnode = 0;
 			    __entry->fid.unique = 0;
 		    }
-		    memcpy(__entry->name, name, __len);
+		    memcpy(__entry->name, name->name, __len);
 		    __entry->name[__len] = 0;
 			   ),
 
@@ -680,7 +679,7 @@ TRACE_EVENT(afs_make_fs_call1,
 
 TRACE_EVENT(afs_make_fs_call2,
 	    TP_PROTO(struct afs_call *call, const struct afs_fid *fid,
-		     const char *name, const char *name2),
+		     const struct qstr *name, const struct qstr *name2),
 
 	    TP_ARGS(call, fid, name, name2),
 
@@ -693,10 +692,8 @@ TRACE_EVENT(afs_make_fs_call2,
 			     ),
 
 	    TP_fast_assign(
-		    int __len = strlen(name);
-		    int __len2 = strlen(name2);
-		    __len = min(__len, 23);
-		    __len2 = min(__len2, 23);
+		    unsigned int __len = min_t(unsigned int, name->len, 23);
+		    unsigned int __len2 = min_t(unsigned int, name2->len, 23);
 		    __entry->call = call->debug_id;
 		    __entry->op = call->operation_ID;
 		    if (fid) {
@@ -706,9 +703,9 @@ TRACE_EVENT(afs_make_fs_call2,
 			    __entry->fid.vnode = 0;
 			    __entry->fid.unique = 0;
 		    }
-		    memcpy(__entry->name, name, __len);
+		    memcpy(__entry->name, name->name, __len);
 		    __entry->name[__len] = 0;
-		    memcpy(__entry->name2, name2, __len2);
+		    memcpy(__entry->name2, name2->name, __len2);
 		    __entry->name2[__len2] = 0;
 			   ),
 



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
