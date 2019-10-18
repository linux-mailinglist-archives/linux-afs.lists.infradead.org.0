Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3AEDBB9E
	for <lists+linux-afs@lfdr.de>; Fri, 18 Oct 2019 05:19:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/pK/u/m57/KzEeCylB/Ge9lda4VSp55HGhvvOxb8O68=; b=ZaVc513Bkxy+h+
	Bx2FRxglmsrJDqbJJowV8kmuf2aipQWqWf6pid0v7ToE/pXI1d9wbXMsnTxcYbVDjyfZTrClOr8Ot
	iQ532tmg3zWlXLKkobtcZjc+E9i5vdjUz3N6TomLEcd1Z3NCcgJKPysaBXriYtO3Mv6FcHTAUDK8Z
	eTTgXgrcWf4QXsvrj4m+rfBYamB1c71BuvQUhcfyVQWGKgnjlf6myVf581pbERfj1TWDjBlb0BBvh
	ma3LhwBD49spKmmwlf5qLcTzClzvcrs7G7xvqePLjADQgH+AtZnyXfvQdPuNjKKgFHxUzEr+r/vZG
	ZeaibiiMoRHXIgp9Mjqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLInq-0001pC-Qe; Fri, 18 Oct 2019 03:19:46 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLInn-0001oe-Ty
 for linux-afs@lists.infradead.org; Fri, 18 Oct 2019 03:19:45 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id ECBBA6BC8956766E9295;
 Fri, 18 Oct 2019 11:19:40 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Fri, 18 Oct 2019 11:19:33 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Petr Mladek <pmladek@suse.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 23/33] fs: afs: Use pr_warn instead of pr_warning
Date: Fri, 18 Oct 2019 11:18:40 +0800
Message-ID: <20191018031850.48498-23-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191018031850.48498-1-wangkefeng.wang@huawei.com>
References: <20191018031710.41052-1-wangkefeng.wang@huawei.com>
 <20191018031850.48498-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_201944_136480_700DC210 
X-CRM114-Status: GOOD (  10.20  )
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.35 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
Cc: David Howells <dhowells@redhat.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

As said in commit f2c2cbcc35d4 ("powerpc: Use pr_warn instead of
pr_warning"), removing pr_warning so all logging messages use a
consistent <prefix>_warn style. Let's do it.

Cc: David Howells <dhowells@redhat.com>
Cc: linux-afs@lists.infradead.org
Reviewed-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 fs/afs/flock.c     |  4 ++--
 fs/afs/inode.c     | 13 ++++++-------
 fs/afs/yfsclient.c |  4 ++--
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/fs/afs/flock.c b/fs/afs/flock.c
index d5e5a6ddc847..0f2a94ba73cb 100644
--- a/fs/afs/flock.c
+++ b/fs/afs/flock.c
@@ -346,8 +346,8 @@ void afs_lock_work(struct work_struct *work)
 		if (ret < 0) {
 			trace_afs_flock_ev(vnode, NULL, afs_flock_extend_fail,
 					   ret);
-			pr_warning("AFS: Failed to extend lock on {%llx:%llx} error %d\n",
-				   vnode->fid.vid, vnode->fid.vnode, ret);
+			pr_warn("AFS: Failed to extend lock on {%llx:%llx} error %d\n",
+				vnode->fid.vid, vnode->fid.vnode, ret);
 		}
 
 		spin_lock(&vnode->lock);
diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 46d2d7cb461d..281470fe1183 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -34,8 +34,7 @@ static noinline void dump_vnode(struct afs_vnode *vnode, struct afs_vnode *paren
 {
 	static unsigned long once_only;
 
-	pr_warn("kAFS: AFS vnode with undefined type %u\n",
-		vnode->status.type);
+	pr_warn("kAFS: AFS vnode with undefined type %u\n", vnode->status.type);
 	pr_warn("kAFS: A=%d m=%o s=%llx v=%llx\n",
 		vnode->status.abort_code,
 		vnode->status.mode,
@@ -175,11 +174,11 @@ static void afs_apply_status(struct afs_fs_cursor *fc,
 	BUG_ON(test_bit(AFS_VNODE_UNSET, &vnode->flags));
 
 	if (status->type != vnode->status.type) {
-		pr_warning("Vnode %llx:%llx:%x changed type %u to %u\n",
-			   vnode->fid.vid,
-			   vnode->fid.vnode,
-			   vnode->fid.unique,
-			   status->type, vnode->status.type);
+		pr_warn("Vnode %llx:%llx:%x changed type %u to %u\n",
+			vnode->fid.vid,
+			vnode->fid.vnode,
+			vnode->fid.unique,
+			status->type, vnode->status.type);
 		afs_protocol_error(NULL, -EBADMSG, afs_eproto_bad_status);
 		return;
 	}
diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index 3ee7abf4b2d0..9ac035c17dc4 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -152,8 +152,8 @@ static void yfs_check_req(struct afs_call *call, __be32 *bp)
 		pr_err("kAFS: %s: Request buffer overflow (%zu>%u)\n",
 		       call->type->name, len, call->request_size);
 	else if (len < call->request_size)
-		pr_warning("kAFS: %s: Request buffer underflow (%zu<%u)\n",
-			   call->type->name, len, call->request_size);
+		pr_warn("kAFS: %s: Request buffer underflow (%zu<%u)\n",
+			call->type->name, len, call->request_size);
 }
 
 /*
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
