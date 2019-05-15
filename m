Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C6D1FBF4
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 22:59:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XHfBgHZwFojUNrBDtoWS1tnzjS1uK3ghv+QhWvMuEKo=; b=RUWvojnocgN+o0
	gAM57cPJ9TSzd1q7bb9YNAen+hEUh9LheO80LUewYfoJV5NBud2btA8Bjc2bmuCZpusUxWy2s84bR
	dEg9ec8A5uB9Vr0pols1Pbkm8B6OEvBDA8WycYJHrrqF8U1fMKcUjieg6opMH5KeS2axfMfh3QdZS
	mO1rE5Y3LaUw5FJTZRiAWoS0c4J/Ul5VHyM1ga+38zHCZ4+hJ5T4vSxKgMy+d1SUI3eul5VOwaR9E
	4lmQjvpEQAYXkraAVcq9joPqvjACvHQ3pMFY37GyemRToY1I+yu+TyyvUaIMSg/EVfUzICUMmafhU
	q79PnvALQD3qqyBMcw3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hR0zs-0002zF-Df; Wed, 15 May 2019 20:59:32 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hR0zp-0002yl-EL
 for linux-afs@lists.infradead.org; Wed, 15 May 2019 20:59:30 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 38C41A971A;
 Wed, 15 May 2019 20:59:29 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A30851001DE1;
 Wed, 15 May 2019 20:59:26 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 09/12] afs: Clear AFS_VNODE_CB_PROMISED if we detect
 callback expiry
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 15 May 2019 21:59:25 +0100
Message-ID: <155795396583.28355.9474445071052662182.stgit@warthog.procyon.org.uk>
In-Reply-To: <155795389933.28355.4028912870853910492.stgit@warthog.procyon.org.uk>
References: <155795389933.28355.4028912870853910492.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Wed, 15 May 2019 20:59:29 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_135929_501940_C955D432 
X-CRM114-Status: GOOD (  14.07  )
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
Cc: Marc Dionne <marc.dionne@auristor.com>, dhowells@redhat.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Fix afs_validate() to clear AFS_VNODE_CB_PROMISED on a vnode if we detect
any condition that causes the callback promise to be broken implicitly,
including server break (cb_s_break), volume break (cb_v_break) or callback
expiry.

Fixes: ae3b7361dc0e ("afs: Fix validation/callback interaction")
Reported-by: Marc Dionne <marc.dionne@auristor.com>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/inode.c |   14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 3633703dbc0c..866d3575c5de 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -570,7 +570,7 @@ bool afs_check_validity(struct afs_vnode *vnode)
 	struct afs_server *server;
 	struct afs_volume *volume = vnode->volume;
 	time64_t now = ktime_get_real_seconds();
-	bool valid;
+	bool valid, need_clear = false;
 	unsigned int cb_break, cb_s_break, cb_v_break;
 	int seq = 0;
 
@@ -588,10 +588,13 @@ bool afs_check_validity(struct afs_vnode *vnode)
 			    vnode->cb_v_break != cb_v_break) {
 				vnode->cb_s_break = cb_s_break;
 				vnode->cb_v_break = cb_v_break;
+				need_clear = true;
 				valid = false;
 			} else if (test_bit(AFS_VNODE_ZAP_DATA, &vnode->flags)) {
+				need_clear = true;
 				valid = false;
 			} else if (vnode->cb_expires_at - 10 <= now) {
+				need_clear = true;
 				valid = false;
 			} else {
 				valid = true;
@@ -606,6 +609,15 @@ bool afs_check_validity(struct afs_vnode *vnode)
 	} while (need_seqretry(&vnode->cb_lock, seq));
 
 	done_seqretry(&vnode->cb_lock, seq);
+
+	if (need_clear) {
+		write_seqlock(&vnode->cb_lock);
+		if (cb_break == vnode->cb_break)
+			__afs_break_callback(vnode);
+		write_sequnlock(&vnode->cb_lock);
+		valid = false;
+	}
+
 	return valid;
 }
 


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
