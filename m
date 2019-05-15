Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEE91FBFE
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 23:00:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=01txU4SJnBwvINPwA2a8n3GR3LY/rEZhPTL25WBkyPU=; b=hkq4mSpxC2q8Bg
	LI9AisKqqYVXFsUnKJJ2iUt6v6OxiiLHOzAe+/H7ieKb4D2STJK/fJQ97Iph41DZTEgqcpjEzFIwD
	BRWps+HnVfdEWrlqVZw1nKi4Z6vDDHtYe8Z+KCDVMHcVJWfgnX1ATEk0j047niA11mRFL3RWw3RUN
	oPnDK9lGq0mhzYmnmCbf02Q6rYRb630EBkKLu/oSrQd3LAPgw2j3IUOeDVJ3PIdl77BcYIQxo3H2H
	t4K3vDaopyvmFTXJNy2/8/hrZ2U24DBpN7pv7pZkf5A46O5Mo+AaAvLTjBRMwrC/ctjlww5Lq/rDz
	pgff2+djfS+dejXyrWjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hR10D-00033z-WB; Wed, 15 May 2019 20:59:54 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hR10B-00033Z-75
 for linux-afs@lists.infradead.org; Wed, 15 May 2019 20:59:52 +0000
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 019FC3E2B7;
 Wed, 15 May 2019 20:59:51 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E89860928;
 Wed, 15 May 2019 20:59:49 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 12/12] afs: Fix application of the results of a inline bulk
 status fetch
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 15 May 2019 21:59:49 +0100
Message-ID: <155795398929.28355.11912045949014606560.stgit@warthog.procyon.org.uk>
In-Reply-To: <155795389933.28355.4028912870853910492.stgit@warthog.procyon.org.uk>
References: <155795389933.28355.4028912870853910492.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Wed, 15 May 2019 20:59:51 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_135951_293263_15827806 
X-CRM114-Status: GOOD (  20.41  )
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

Fix afs_do_lookup() such that when it does an inline bulk status fetch op,
it will update inodes that are already extant (something that afs_iget()
doesn't do) and to cache permits for each inode created (thereby avoiding a
follow up FS.FetchStatus call to determine this).

Extant inodes need looking up in advance so that their cb_break counters
before and after the operation can be compared.  To this end, the inode
pointers are cached so that they don't need looking up again after the op.

Fixes: 5cf9dd55a0ec ("afs: Prospectively look up extra files when doing a single lookup")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/afs.h |    1 +
 fs/afs/dir.c |   51 ++++++++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/fs/afs/afs.h b/fs/afs/afs.h
index 4d41c8966c59..27911a57db4f 100644
--- a/fs/afs/afs.h
+++ b/fs/afs/afs.h
@@ -147,6 +147,7 @@ struct afs_file_status {
 struct afs_status_cb {
 	struct afs_file_status	status;
 	struct afs_callback	callback;
+	unsigned int		cb_break;	/* Pre-op callback break counter */
 	bool			have_status;	/* True if status record was retrieved */
 	bool			have_cb;	/* True if cb record was retrieved */
 	bool			have_error;	/* True if status.abort_code indicates an error */
diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index 9e42f6c75747..79d93a26759a 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -103,6 +103,7 @@ struct afs_lookup_cookie {
 	bool			found;
 	bool			one_only;
 	unsigned short		nr_fids;
+	struct inode		**inodes;
 	struct afs_status_cb	*statuses;
 	struct afs_fid		fids[50];
 };
@@ -644,8 +645,8 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 	struct afs_iget_data iget_data;
 	struct afs_fs_cursor fc;
 	struct afs_server *server;
-	struct afs_vnode *dvnode = AFS_FS_I(dir);
-	struct inode *inode = NULL;
+	struct afs_vnode *dvnode = AFS_FS_I(dir), *vnode;
+	struct inode *inode = NULL, *ti;
 	int ret, i;
 
 	_enter("{%lu},%p{%pd},", dir->i_ino, dentry, dentry);
@@ -700,6 +701,27 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 	if (!cookie->statuses)
 		goto out;
 
+	cookie->inodes = kcalloc(cookie->nr_fids, sizeof(struct inode *),
+				 GFP_KERNEL);
+	if (!cookie->inodes)
+		goto out_s;
+
+	for (i = 1; i < cookie->nr_fids; i++) {
+		scb = &cookie->statuses[i];
+
+		/* Find any inodes that already exist and get their
+		 * callback counters.
+		 */
+		iget_data.fid = cookie->fids[i];
+		ti = ilookup5_nowait(dir->i_sb, iget_data.fid.vnode,
+				     afs_iget5_test, &iget_data);
+		if (!IS_ERR_OR_NULL(ti)) {
+			vnode = AFS_FS_I(ti);
+			scb->cb_break = afs_calc_vnode_cb_break(vnode);
+			cookie->inodes[i] = ti;
+		}
+	}
+
 	/* Try FS.InlineBulkStatus first.  Abort codes for the individual
 	 * lookups contained therein are stored in the reply without aborting
 	 * the whole operation.
@@ -742,7 +764,6 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 	 * any of the lookups fails - so, for the moment, revert to
 	 * FS.FetchStatus for just the primary fid.
 	 */
-	cookie->nr_fids = 1;
 	inode = ERR_PTR(-ERESTARTSYS);
 	if (afs_begin_vnode_operation(&fc, dvnode, key, true)) {
 		while (afs_select_fileserver(&fc)) {
@@ -764,9 +785,6 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 	if (IS_ERR(inode))
 		goto out_c;
 
-	for (i = 0; i < cookie->nr_fids; i++)
-		cookie->statuses[i].status.abort_code = 0;
-
 success:
 	/* Turn all the files into inodes and save the first one - which is the
 	 * one we actually want.
@@ -777,13 +795,26 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 
 	for (i = 0; i < cookie->nr_fids; i++) {
 		struct afs_status_cb *scb = &cookie->statuses[i];
-		struct inode *ti;
+
+		if (!scb->have_status && !scb->have_error)
+			continue;
+
+		if (cookie->inodes[i]) {
+			afs_vnode_commit_status(&fc, AFS_FS_I(cookie->inodes[i]),
+						scb->cb_break, NULL, scb);
+			continue;
+		}
 
 		if (scb->status.abort_code != 0)
 			continue;
 
 		iget_data.fid = cookie->fids[i];
 		ti = afs_iget(dir->i_sb, key, &iget_data, scb, cbi, dvnode);
+		if (!IS_ERR(ti))
+			afs_cache_permit(AFS_FS_I(ti), key,
+					 0 /* Assume vnode->cb_break is 0 */ +
+					 iget_data.cb_v_break,
+					 scb);
 		if (i == 0) {
 			inode = ti;
 		} else {
@@ -794,6 +825,12 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 
 out_c:
 	afs_put_cb_interest(afs_v2net(dvnode), cbi);
+	if (cookie->inodes) {
+		for (i = 0; i < cookie->nr_fids; i++)
+			iput(cookie->inodes[i]);
+		kfree(cookie->inodes);
+	}
+out_s:
 	kvfree(cookie->statuses);
 out:
 	kfree(cookie);


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
