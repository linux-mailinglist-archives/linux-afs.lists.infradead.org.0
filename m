Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E658F1F895
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 18:27:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qNTO+blAnfw/U02mKLzrT4T81j74MpLwbSR36UhqTF8=; b=d4CfnHUJpGgWLb
	WEE+cHmZzcoS0uQBUhvWErzL3p7U7/u1FOHORQnMFLZkUP7fVz1AIlOyKLgGpoZ3YwMKShPRzDpZd
	KZCgpunAgwFpKtR6IAOr/F6no6THxxyha5UCajkGIYi2kQ/pfeYyvxb9ICn6FIiIphaq3PXlE/+R7
	x4atGDRlgG6Fq/Yx/Os1kP2iGLk/Q7MT74GLyvvgS0vMKc5z2L8iY6aPx+JcoUp4lxmCsMkRWpp/T
	l5ZH/kGePo+YRnuwNfzopObR22golQStPwvGUamIp2Tm0VqquN50efo8TSW5/46SlJg+WaS0Z0rwV
	NU0YJRuzK7R72lPvYt0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQwkY-0001tz-4V; Wed, 15 May 2019 16:27:26 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQwkV-0001te-3t
 for linux-afs@lists.infradead.org; Wed, 15 May 2019 16:27:24 +0000
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D1F26308123F;
 Wed, 15 May 2019 16:27:22 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E2A95D71E;
 Wed, 15 May 2019 16:27:19 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 14/15] afs: Fix lock-wait/callback-break double locking
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 15 May 2019 17:27:18 +0100
Message-ID: <155793763869.31671.8230708692054953179.stgit@warthog.procyon.org.uk>
In-Reply-To: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
References: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Wed, 15 May 2019 16:27:22 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_092723_177771_7386057E 
X-CRM114-Status: GOOD (  13.05  )
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

__afs_break_callback() holds vnode->lock around its call of
afs_lock_may_be_available() - which also takes that lock.

Fix this by not taking the lock in __afs_break_callback().

Also, there's no point checking the granted_locks and pending_locks queues;
it's sufficient to check lock_state, so move that check out of
afs_lock_may_be_available() into __afs_break_callback() to replace the
queue checks.

Fixes: e8d6c554126b ("AFS: implement file locking")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/callback.c |    8 +-------
 fs/afs/flock.c    |    3 ---
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/fs/afs/callback.c b/fs/afs/callback.c
index 128f2dbe256a..4876079aa643 100644
--- a/fs/afs/callback.c
+++ b/fs/afs/callback.c
@@ -218,14 +218,8 @@ void __afs_break_callback(struct afs_vnode *vnode)
 		vnode->cb_break++;
 		afs_clear_permits(vnode);
 
-		spin_lock(&vnode->lock);
-
-		_debug("break callback");
-
-		if (list_empty(&vnode->granted_locks) &&
-		    !list_empty(&vnode->pending_locks))
+		if (vnode->lock_state == AFS_VNODE_LOCK_WAITING_FOR_CB)
 			afs_lock_may_be_available(vnode);
-		spin_unlock(&vnode->lock);
 	}
 }
 
diff --git a/fs/afs/flock.c b/fs/afs/flock.c
index 3501ef7ddbb4..c91cd201013f 100644
--- a/fs/afs/flock.c
+++ b/fs/afs/flock.c
@@ -41,9 +41,6 @@ void afs_lock_may_be_available(struct afs_vnode *vnode)
 {
 	_enter("{%llx:%llu}", vnode->fid.vid, vnode->fid.vnode);
 
-	if (vnode->lock_state != AFS_VNODE_LOCK_WAITING_FOR_CB)
-		return;
-
 	spin_lock(&vnode->lock);
 	if (vnode->lock_state == AFS_VNODE_LOCK_WAITING_FOR_CB)
 		afs_next_locker(vnode, 0);


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
