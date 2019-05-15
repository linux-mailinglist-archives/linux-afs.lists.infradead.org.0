Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 797C01F896
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 18:27:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6VB1T66l0hjA7E3unj5WINb2YhLrZO8W50AKTKmATWk=; b=rWjs6sNVzhU5Ao
	xv8BbKmg07ljZNQVsUXeBShjHy0MQ1qVeOVkLNzuID4LubIf8Wgn7piCk7Zm6mlz5JP3fmjDyo/AX
	cr7Vtot4UhvJpZj87S+nlJEzwVugYH1RVfdLhDw2Sb4eD6QoiBvcPZJ4ZJt4S+n4MiBvWcz41P/sr
	qoqzm5ZHqniufU4UrVbK/0KPwf3HiV58pUVQMM7KFCAmUeZyJS0AeNuiBjnXZRW8THAK8M6m3M2r3
	KwIsDEkNBgcEILxgt0LPu57yakQ8yKCtI11i5Zj/i/8zDakfA78WzJwLsYn6TedNNvUJo0GF4CKKq
	3t9O3w83JYto+KP34eYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQwke-0001vU-Az; Wed, 15 May 2019 16:27:32 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQwkb-0001v6-RG
 for linux-afs@lists.infradead.org; Wed, 15 May 2019 16:27:31 +0000
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 99C0F30821B2;
 Wed, 15 May 2019 16:27:29 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDAC45D9C2;
 Wed, 15 May 2019 16:27:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 15/15] afs: Fix double inc of vnode->cb_break
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 15 May 2019 17:27:28 +0100
Message-ID: <155793764807.31671.15353972412997485464.stgit@warthog.procyon.org.uk>
In-Reply-To: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
References: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Wed, 15 May 2019 16:27:29 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_092729_900544_5978AA17 
X-CRM114-Status: GOOD (  14.16  )
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

When __afs_break_callback() clears the CB_PROMISED flag, it increments
vnode->cb_break to trigger a future refetch of the status and callback -
however it also calls afs_clear_permits(), which also increments
vnode->cb_break.

Fix this by removing the increment from afs_clear_permits().

Whilst we're at it, fix the conditional call to afs_put_permits() as the
function checks to see if the argument is NULL, so the check is redundant.

Fixes: be080a6f43c4 ("afs: Overhaul permit caching");
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/security.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/afs/security.c b/fs/afs/security.c
index 5f58a9a17e69..db5529e47eb8 100644
--- a/fs/afs/security.c
+++ b/fs/afs/security.c
@@ -87,11 +87,9 @@ void afs_clear_permits(struct afs_vnode *vnode)
 	permits = rcu_dereference_protected(vnode->permit_cache,
 					    lockdep_is_held(&vnode->lock));
 	RCU_INIT_POINTER(vnode->permit_cache, NULL);
-	vnode->cb_break++;
 	spin_unlock(&vnode->lock);
 
-	if (permits)
-		afs_put_permits(permits);
+	afs_put_permits(permits);
 }
 
 /*


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
