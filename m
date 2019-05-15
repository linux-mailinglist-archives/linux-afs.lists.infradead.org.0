Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F5A1F894
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 18:27:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wQKES5DkShkd+QpeoOllZ+EqkviHTybW9A3B2/B25Fc=; b=IzlmG3l6/V0mqI
	BWxltXU/jTyNNxoAIDfknYwPHUm9FJXP+0gPRP4+eGEURLMVR6B/dAjnXdms4lfXEL0J9CaQ5fKtz
	Z3TOcyE6P3nDKZ+gkCv3qh8r6lO2pySSOUC9tnND+4HUXL/UBRPv6HZdkB7WZ/CcZpRQn6B61YKK+
	qP8SkHQuq3QRPQsBXhzHF4dLa/AsdA7SS5XNsoyMMnXARLCZlngyH0VrYPG0BOkOCN9i4lJJ7/iag
	F2vtsVVbqx1URbau2InWsB6nSC1GHFnW6yffMICIfMVKQLps1WZ0ffMu6/5BAIMTiwWZ8owD0Q2DW
	N7rv/jVLYDewX86wDliA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQwkO-0001sO-Rt; Wed, 15 May 2019 16:27:16 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQwkL-0001rv-MC
 for linux-afs@lists.infradead.org; Wed, 15 May 2019 16:27:14 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 72C645D5FE;
 Wed, 15 May 2019 16:27:13 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B67921084261;
 Wed, 15 May 2019 16:27:12 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 13/15] afs: Don't invalidate callback if AFS_VNODE_DIR_VALID
 not set
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 15 May 2019 17:27:11 +0100
Message-ID: <155793763180.31671.1818998763349462440.stgit@warthog.procyon.org.uk>
In-Reply-To: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
References: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Wed, 15 May 2019 16:27:13 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_092713_775576_1D49EE93 
X-CRM114-Status: GOOD (  13.54  )
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

Don't invalidate the callback promise on a directory if the
AFS_VNODE_DIR_VALID flag is not set (which indicates that the directory
contents are invalid, due to edit failure, callback break, page reclaim).

The directory will be reloaded next time the directory is accessed, so
clearing the callback flag at this point may race with a reload of the
directory and cancel it's recorded callback promise.

Fixes: f3ddee8dc4e2 ("afs: Fix directory handling")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/inode.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 1e630f016dc5..bf8f56e851df 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -430,12 +430,9 @@ int afs_validate(struct afs_vnode *vnode, struct key *key)
 			vnode->cb_s_break = vnode->cb_interest->server->cb_s_break;
 			vnode->cb_v_break = vnode->volume->cb_v_break;
 			valid = false;
-		} else if (vnode->status.type == AFS_FTYPE_DIR &&
-			   (!test_bit(AFS_VNODE_DIR_VALID, &vnode->flags) ||
-			    vnode->cb_expires_at - 10 <= now)) {
+		} else if (test_bit(AFS_VNODE_ZAP_DATA, &vnode->flags)) {
 			valid = false;
-		} else if (test_bit(AFS_VNODE_ZAP_DATA, &vnode->flags) ||
-			   vnode->cb_expires_at - 10 <= now) {
+		} else if (vnode->cb_expires_at - 10 <= now) {
 			valid = false;
 		} else {
 			valid = true;


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
