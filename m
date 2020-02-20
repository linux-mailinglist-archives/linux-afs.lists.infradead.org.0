Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 666F0165362
	for <lists+linux-afs@lfdr.de>; Thu, 20 Feb 2020 01:11:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fQvHnDRYHxO82cZrEAz+dKDEz0JHjIRsJsEoSzbBFD4=; b=Y8+iMKwPxO8W9z
	komtxSJ4VsEBP3we7Va+/kg1qB3ss2Sx0h2AaXF297XlNbLm1epS3Yy9cHgc0IqV0NPP5WNb0pytW
	mJpS1BtjsKfrmqCsWkxFIc0wa1VM5tKkp2ki6GUnui1RGLtrWc1ChZBtVcuZfF7dNJXQQbPbW+QF3
	J/ltzf5VaB74yXn0qC+1Ymrk1vJxlUa2MlDO0Rob3M9gLK32fi77pI5nI2SDs6/8u5+VbuVQZLyDn
	2e/qePMdkwBfu3tvOKe3XfU82lUNgLW6eWPOubzuduAax41SaGyA2iD3xGMkLZFAFYAAW/yS+HV0m
	VizLxuXoRwFdYM7kpIaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4ZQw-0001u9-SY; Thu, 20 Feb 2020 00:11:14 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4ZQs-0001tC-FQ
 for linux-afs@lists.infradead.org; Thu, 20 Feb 2020 00:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582157467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=F3SsN6p+uNC4ethAO9147Q7uUF+qPSk/DZbzWS2Tjtw=;
 b=h5H5rY0IJNqLM3hkd2ubof4ayc4CRYUNCbLfs2TOLrVoyXazkf47JlKnH9KcX8QumtZXY6
 7J+e9bIcVOE20ngeTzRWRzddzwUBKA/0QwqjtTEgmcQ+2Z+/1MJew4lmxsV4xGy9YPweqo
 HY0bMSzkwpAgKF6i8JFXFcdg3SXWQH4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-r0mgnpazMIGOgXNGS-i7Fw-1; Wed, 19 Feb 2020 19:11:01 -0500
X-MC-Unique: r0mgnpazMIGOgXNGS-i7Fw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3F671922981;
 Thu, 20 Feb 2020 00:10:59 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-122-163.rdu2.redhat.com
 [10.10.122.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 455BB8AC5B;
 Thu, 20 Feb 2020 00:10:58 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [RFC PATCH] afs: Create a mountpoint through symlink() and remove
 through rmdir()
From: David Howells <dhowells@redhat.com>
To: viro@zeniv.linux.org.uk
Date: Thu, 20 Feb 2020 00:10:57 +0000
Message-ID: <158215745745.386537.12978619503606431141.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_161110_595961_D5C5B08B 
X-CRM114-Status: GOOD (  23.54  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
Cc: dhowells@redhat.com, torvalds@linux-foundation.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

If symlink() is given a magic prefix in the target string, turn it into a
mountpoint instead.

The prefix is "//_afs3_mount:".  POSIX says that a double slash at the
beginning of a filename is special:

    A pathname consisting of a single slash shall resolve to the root
    directory of the process.  A null pathname shall not be successfully
    resolved.  A pathname that begins with two successive slashes may be
    interpreted in an implementation-defined manner, although more than two
    leading slashes shall be treated as a single slash.

however, that might be validly interpreted by Windows as a UNC name.  So
the prefix is made a bit more than that to make that less likely.  The
prefix is then stripped off and a "." is added for transmission to the
server.

afs_mntpt_lookup() is removed so that the new dentry is marked as being an
autodir type.  afs_rmdir() then checks for this and switches over to
afs_unlink() to remove a mountpoint (as far as the server is concerned,
it's not a directory).  The unlink() system call can't be used to remove
the mountpoint without alteration to the core VFS as may_delete() throws an
error.  This allows rmdir() to remove an automount point (provided it's not
mounted over).

Note that this behaviour varies from other AFS implementations in that the
proposed symlink *could* be valid content (though it seems unlikely) and in
those implementations rmdir can't remove a mountpoint.  Since the Linux
symlink() system can handle a target string of 4095 characters, but AFS can
only handle a symlink of 1024 chars, it might be better to make the magic
prefix large enough to force the target string length over the server
limit.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/dir.c       |   38 +++++++++++++++++++++++++++++++++++---
 fs/afs/fsclient.c  |    9 +++++----
 fs/afs/internal.h  |    6 ++++--
 fs/afs/mntpt.c     |   15 ---------------
 fs/afs/yfsclient.c |    7 ++++---
 5 files changed, 48 insertions(+), 27 deletions(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index 5c794f4b051a..40552036cd6a 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -1365,6 +1365,9 @@ static int afs_rmdir(struct inode *dir, struct dentry *dentry)
 	_enter("{%llx:%llu},{%pd}",
 	       dvnode->fid.vid, dvnode->fid.vnode, dentry);
 
+	if (d_is_autodir(dentry))
+		return afs_unlink(dir, dentry);
+
 	scb = kzalloc(sizeof(struct afs_status_cb), GFP_KERNEL);
 	if (!scb)
 		return -ENOMEM;
@@ -1721,17 +1724,21 @@ static int afs_link(struct dentry *from, struct inode *dir,
 	return ret;
 }
 
+static const char afs_mount_prefix[] = "//_afs3_mount:";
+
 /*
- * create a symlink in an AFS filesystem
+ * create a symlink or a mountpoint in an AFS filesystem
  */
 static int afs_symlink(struct inode *dir, struct dentry *dentry,
-		       const char *content)
+		       const char *specified_content)
 {
 	struct afs_iget_data iget_data;
 	struct afs_fs_cursor fc;
 	struct afs_status_cb *scb;
 	struct afs_vnode *dvnode = AFS_FS_I(dir);
 	struct key *key;
+	char *content = (char *)specified_content;
+	bool is_mountpoint = false;
 	int ret;
 
 	_enter("{%llx:%llu},{%pd},%s",
@@ -1746,6 +1753,28 @@ static int afs_symlink(struct inode *dir, struct dentry *dentry,
 	if (strlen(content) >= AFSPATHMAX)
 		goto error;
 
+	if (memcmp(content, afs_mount_prefix,
+		   sizeof(afs_mount_prefix) - 1) == 0) {
+		/* This is going to be a mountpoint. */
+		char *p = content + sizeof(afs_mount_prefix) - 1, *c;
+		size_t clen = strlen(p);
+
+		if (clen < 2 ||
+		    (p[0] != '%' && p[0] != '#'))
+			goto error;
+
+		/* Snip off the prefix and append a dot */
+		ret = -ENOMEM;
+		c = kmalloc(clen + 2, GFP_KERNEL);
+		if (!c)
+			goto error;
+		memcpy(c, p, clen);
+		c[clen] = '.';
+		c[clen + 1] = 0;
+		content = c;
+		is_mountpoint = true;
+	}
+
 	ret = -ENOMEM;
 	scb = kcalloc(2, sizeof(struct afs_status_cb), GFP_KERNEL);
 	if (!scb)
@@ -1765,7 +1794,8 @@ static int afs_symlink(struct inode *dir, struct dentry *dentry,
 			fc.cb_break = afs_calc_vnode_cb_break(dvnode);
 			afs_prep_for_new_inode(&fc, &iget_data);
 			afs_fs_symlink(&fc, dentry->d_name.name, content,
-				       &scb[0], &iget_data.fid, &scb[1]);
+				       &scb[0], &iget_data.fid, &scb[1],
+				       is_mountpoint);
 		}
 
 		afs_check_for_remote_deletion(&fc, dvnode);
@@ -1794,6 +1824,8 @@ static int afs_symlink(struct inode *dir, struct dentry *dentry,
 error_scb:
 	kfree(scb);
 error:
+	if (content != specified_content)
+		kfree(content);
 	d_drop(dentry);
 	_leave(" = %d", ret);
 	return ret;
diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index 1f9c5d8e6fe5..e2a2abe3a9aa 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -896,14 +896,15 @@ static const struct afs_call_type afs_RXFSSymlink = {
 };
 
 /*
- * create a symbolic link
+ * Create a symbolic link or a mountpoint (differentiated by mode).
  */
 int afs_fs_symlink(struct afs_fs_cursor *fc,
 		   const char *name,
 		   const char *contents,
 		   struct afs_status_cb *dvnode_scb,
 		   struct afs_fid *newfid,
-		   struct afs_status_cb *new_scb)
+		   struct afs_status_cb *new_scb,
+		   bool is_mountpoint)
 {
 	struct afs_vnode *dvnode = fc->vnode;
 	struct afs_call *call;
@@ -913,7 +914,7 @@ int afs_fs_symlink(struct afs_fs_cursor *fc,
 
 	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
 		return yfs_fs_symlink(fc, name, contents, dvnode_scb,
-				      newfid, new_scb);
+				      newfid, new_scb, is_mountpoint);
 
 	_enter("");
 
@@ -959,7 +960,7 @@ int afs_fs_symlink(struct afs_fs_cursor *fc,
 	*bp++ = htonl(dvnode->vfs_inode.i_mtime.tv_sec); /* mtime */
 	*bp++ = 0; /* owner */
 	*bp++ = 0; /* group */
-	*bp++ = htonl(S_IRWXUGO); /* unix mode */
+	*bp++ = htonl(is_mountpoint ? 0644 : S_IRWXUGO); /* unix mode */
 	*bp++ = 0; /* segment size */
 
 	afs_use_fs_server(call, fc->cbi);
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 1d81fc4c3058..70509f2ddd00 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -965,7 +965,8 @@ extern int afs_fs_remove(struct afs_fs_cursor *, struct afs_vnode *, const char
 extern int afs_fs_link(struct afs_fs_cursor *, struct afs_vnode *, const char *,
 		       struct afs_status_cb *, struct afs_status_cb *);
 extern int afs_fs_symlink(struct afs_fs_cursor *, const char *, const char *,
-			  struct afs_status_cb *, struct afs_fid *, struct afs_status_cb *);
+			  struct afs_status_cb *, struct afs_fid *, struct afs_status_cb *,
+			  bool);
 extern int afs_fs_rename(struct afs_fs_cursor *, const char *,
 			 struct afs_vnode *, const char *,
 			 struct afs_status_cb *, struct afs_status_cb *);
@@ -1370,7 +1371,8 @@ extern int yfs_fs_remove(struct afs_fs_cursor *, struct afs_vnode *, const char
 extern int yfs_fs_link(struct afs_fs_cursor *, struct afs_vnode *, const char *,
 		       struct afs_status_cb *, struct afs_status_cb *);
 extern int yfs_fs_symlink(struct afs_fs_cursor *, const char *, const char *,
-			  struct afs_status_cb *, struct afs_fid *, struct afs_status_cb *);
+			  struct afs_status_cb *, struct afs_fid *, struct afs_status_cb *,
+			  bool);
 extern int yfs_fs_rename(struct afs_fs_cursor *, const char *, struct afs_vnode *, const char *,
 			 struct afs_status_cb *, struct afs_status_cb *);
 extern int yfs_fs_store_data(struct afs_fs_cursor *, struct address_space *,
diff --git a/fs/afs/mntpt.c b/fs/afs/mntpt.c
index 79bc5f1338ed..b06ceed9b8f5 100644
--- a/fs/afs/mntpt.c
+++ b/fs/afs/mntpt.c
@@ -17,9 +17,6 @@
 #include "internal.h"
 
 
-static struct dentry *afs_mntpt_lookup(struct inode *dir,
-				       struct dentry *dentry,
-				       unsigned int flags);
 static int afs_mntpt_open(struct inode *inode, struct file *file);
 static void afs_mntpt_expiry_timed_out(struct work_struct *work);
 
@@ -29,7 +26,6 @@ const struct file_operations afs_mntpt_file_operations = {
 };
 
 const struct inode_operations afs_mntpt_inode_operations = {
-	.lookup		= afs_mntpt_lookup,
 	.readlink	= page_readlink,
 	.getattr	= afs_getattr,
 	.listxattr	= afs_listxattr,
@@ -46,17 +42,6 @@ static unsigned long afs_mntpt_expiry_timeout = 10 * 60;
 
 static const char afs_root_volume[] = "root.cell";
 
-/*
- * no valid lookup procedure on this sort of dir
- */
-static struct dentry *afs_mntpt_lookup(struct inode *dir,
-				       struct dentry *dentry,
-				       unsigned int flags)
-{
-	_enter("%p,%p{%pd2}", dir, dentry, dentry);
-	return ERR_PTR(-EREMOTE);
-}
-
 /*
  * no valid open procedure on this sort of dir
  */
diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index a26126ac7bf1..5ff95d5643f5 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -1080,14 +1080,15 @@ static const struct afs_call_type yfs_RXYFSSymlink = {
 };
 
 /*
- * Create a symbolic link.
+ * Create a symbolic link or a mountpoint (differentiated by mode).
  */
 int yfs_fs_symlink(struct afs_fs_cursor *fc,
 		   const char *name,
 		   const char *contents,
 		   struct afs_status_cb *dvnode_scb,
 		   struct afs_fid *newfid,
-		   struct afs_status_cb *vnode_scb)
+		   struct afs_status_cb *vnode_scb,
+		   bool is_mountpoint)
 {
 	struct afs_vnode *dvnode = fc->vnode;
 	struct afs_call *call;
@@ -1125,7 +1126,7 @@ int yfs_fs_symlink(struct afs_fs_cursor *fc,
 	bp = xdr_encode_YFSFid(bp, &dvnode->fid);
 	bp = xdr_encode_string(bp, name, namesz);
 	bp = xdr_encode_string(bp, contents, contents_sz);
-	bp = xdr_encode_YFSStoreStatus_mode(bp, S_IRWXUGO);
+	bp = xdr_encode_YFSStoreStatus_mode(bp, is_mountpoint ? 0644 : S_IRWXUGO);
 	yfs_check_req(call, bp);
 
 	afs_use_fs_server(call, fc->cbi);



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
