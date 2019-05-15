Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E41601F87A
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 18:25:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xoDG0lJzysrTuATzhZqSZA9nD8RVjeNWVo3tx+YAa2c=; b=Fm2SmSRpLSxU+k
	dBULFCeaFUOO9teuwcahenfH7zbB7zR5nPGlLxEDilnMp79q0TIQf3BuEczZuwz7N44PAvwypAAoe
	AVdAicN0g+IF3smHiYDE0rftLvodB53LvNd7UV2bkHvvoIfjdygtSUHRMVn/nVrPERxPyDIjO3zbU
	jtU0Db3Mfmc86doXDf2okKeq9iuu7soOoER6n9xxK/XbJMoK9Ovx9SRvAjATazS22NyDdw1Gv1mQF
	RZX44S9dVYBl0btWKT+JfJjGGvmNFJuD6GmuS9E6vTZ452tdYOI00+Z5BrzEKOLDuVDXyjKby1KOR
	2OOgFVa67RmmkMONWNdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQwj0-0001WK-6k; Wed, 15 May 2019 16:25:50 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQwiw-0001Vh-TS
 for linux-afs@lists.infradead.org; Wed, 15 May 2019 16:25:48 +0000
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A974F81F12;
 Wed, 15 May 2019 16:25:46 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A9D3608A6;
 Wed, 15 May 2019 16:25:45 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 01/15] afs: Fix key leak in afs_release() and afs_evict_inode()
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 15 May 2019 17:25:45 +0100
Message-ID: <155793754533.31671.10385071394174622444.stgit@warthog.procyon.org.uk>
In-Reply-To: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
References: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 15 May 2019 16:25:46 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_092546_991716_D4DEE974 
X-CRM114-Status: GOOD (  15.27  )
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

Fix afs_release() to go through the cleanup part of the function if
FMODE_WRITE is set rather than exiting through vfs_fsync() (which skips the
cleanup).  The cleanup involves discarding the refs on the key used for
file ops and the writeback key record.

Also fix afs_evict_inode() to clean up any left over wb keys attached to
the inode/vnode when it is removed.

Fixes: 5a8132761609 ("afs: Do better accretion of small writes on newly created content")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/file.c  |    7 ++++---
 fs/afs/inode.c |    1 +
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index e8d6619890a9..eee2b5663b92 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -170,11 +170,12 @@ int afs_release(struct inode *inode, struct file *file)
 {
 	struct afs_vnode *vnode = AFS_FS_I(inode);
 	struct afs_file *af = file->private_data;
+	int ret;
 
 	_enter("{%llx:%llu},", vnode->fid.vid, vnode->fid.vnode);
 
 	if ((file->f_mode & FMODE_WRITE))
-		return vfs_fsync(file, 0);
+		ret = vfs_fsync(file, 0);
 
 	file->private_data = NULL;
 	if (af->wb)
@@ -182,8 +183,8 @@ int afs_release(struct inode *inode, struct file *file)
 	key_put(af->key);
 	kfree(af);
 	afs_prune_wb_keys(vnode);
-	_leave(" = 0");
-	return 0;
+	_leave(" = %d", ret);
+	return ret;
 }
 
 /*
diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index c4652b42d545..f30aa5eacd39 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -573,6 +573,7 @@ void afs_evict_inode(struct inode *inode)
 	}
 #endif
 
+	afs_prune_wb_keys(vnode);
 	afs_put_permits(rcu_access_pointer(vnode->permit_cache));
 	key_put(vnode->silly_key);
 	vnode->silly_key = NULL;


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
