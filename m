Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CFD1FBF2
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 22:59:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24xQx1b9927qYXd93vIpuK9tzKwnDyJMpEm/ef2Bp1U=; b=VwvBVm353Ktuoi
	czdJjMLFoYRAOogK313SupUH3qUo1QP/dsj4bxBtQ749GVeEmETY4fvxHvk2VNeXVO7AVjthdPDfq
	ORaDx6vJY/PukyoyOZsLBO8ZDuyCQRClbAb7WCRYiWrIZ4mnoCpz/xUD5uEbH5rFqb7O+UKCyUheq
	GUuIzrFNzt8cQiPrKG/QRmEGUDSdSF4H7N/9pXZt1ZhSCOGB9FWMgCsd3RB4N/0H7O//Jhw1BHihs
	SEy81t79Z5G2jNvMgIW2ng3VP8tDsvK0oLm1co9oAmI8Ko+5M/hAWai12dOcSfaSf9o3GBLc9dFxe
	lfGLt//30aqeeBvvN1sA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hR0zb-0002vR-N8; Wed, 15 May 2019 20:59:15 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hR0zZ-0002v3-Hg
 for linux-afs@lists.infradead.org; Wed, 15 May 2019 20:59:14 +0000
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5181D307CB5E;
 Wed, 15 May 2019 20:59:13 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EF056A23C;
 Wed, 15 May 2019 20:59:12 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 07/12] afs: Split afs_validate() so first part can be used
 under LOOKUP_RCU
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 15 May 2019 21:59:11 +0100
Message-ID: <155795395185.28355.325602097001672205.stgit@warthog.procyon.org.uk>
In-Reply-To: <155795389933.28355.4028912870853910492.stgit@warthog.procyon.org.uk>
References: <155795389933.28355.4028912870853910492.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 15 May 2019 20:59:13 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_135913_621697_F509D774 
X-CRM114-Status: GOOD (  14.80  )
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

Split afs_validate() so that the part that decides if the vnode is still
valid can be used under LOOKUP_RCU conditions from afs_d_revalidate().

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/inode.c    |   37 ++++++++++++++++++++++++-------------
 fs/afs/internal.h |    1 +
 2 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index b644f3d5e4e9..a89948a9dd0d 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -560,23 +560,12 @@ void afs_zap_data(struct afs_vnode *vnode)
 }
 
 /*
- * validate a vnode/inode
- * - there are several things we need to check
- *   - parent dir data changes (rm, rmdir, rename, mkdir, create, link,
- *     symlink)
- *   - parent dir metadata changed (security changes)
- *   - dentry data changed (write, truncate)
- *   - dentry metadata changed (security changes)
+ * Check the validity of a vnode/inode.
  */
-int afs_validate(struct afs_vnode *vnode, struct key *key)
+bool afs_check_validity(struct afs_vnode *vnode)
 {
 	time64_t now = ktime_get_real_seconds();
 	bool valid;
-	int ret;
-
-	_enter("{v={%llx:%llu} fl=%lx},%x",
-	       vnode->fid.vid, vnode->fid.vnode, vnode->flags,
-	       key_serial(key));
 
 	/* Quickly check the callback state.  Ideally, we'd use read_seqbegin
 	 * here, but we have no way to pass the net namespace to the RCU
@@ -605,6 +594,28 @@ int afs_validate(struct afs_vnode *vnode, struct key *key)
 	}
 
 	read_sequnlock_excl(&vnode->cb_lock);
+	return valid;
+}
+
+/*
+ * validate a vnode/inode
+ * - there are several things we need to check
+ *   - parent dir data changes (rm, rmdir, rename, mkdir, create, link,
+ *     symlink)
+ *   - parent dir metadata changed (security changes)
+ *   - dentry data changed (write, truncate)
+ *   - dentry metadata changed (security changes)
+ */
+int afs_validate(struct afs_vnode *vnode, struct key *key)
+{
+	bool valid;
+	int ret;
+
+	_enter("{v={%llx:%llu} fl=%lx},%x",
+	       vnode->fid.vid, vnode->fid.vnode, vnode->flags,
+	       key_serial(key));
+
+	valid = afs_check_validity(vnode);
 
 	if (test_bit(AFS_VNODE_DELETED, &vnode->flags))
 		clear_nlink(&vnode->vfs_inode);
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 175501a7cf8b..d19182e9c15c 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -1021,6 +1021,7 @@ extern struct inode *afs_iget(struct super_block *, struct key *,
 			      struct afs_cb_interest *,
 			      struct afs_vnode *);
 extern void afs_zap_data(struct afs_vnode *);
+extern bool afs_check_validity(struct afs_vnode *);
 extern int afs_validate(struct afs_vnode *, struct key *);
 extern int afs_getattr(const struct path *, struct kstat *, u32, unsigned int);
 extern int afs_setattr(struct dentry *, struct iattr *);


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
