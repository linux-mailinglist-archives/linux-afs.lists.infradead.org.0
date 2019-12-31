Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9791A12D9C8
	for <lists+linux-afs@lfdr.de>; Tue, 31 Dec 2019 16:25:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4M9b3x5/lNz+15RrLBpyT0u3A7DVfXb6VCNXWUsi1vM=; b=FkYK1u0pleWiSZ
	pgWreygxgdIgjTzIYoJeWIdwvfI1P5gFzar1I/zom+opBjvs5INvMZD83cprZJ7t+mvBiej8VZduj
	eSqX6fuWBE4jBGMStMbNhFeYplFuoIYqGlc0UL1mIW239pAHCJgpAt5tiFzVyhJjFNnZ3naqcE8aH
	lioRsZ4m39fd6mxvKUIT+1NWAfXDMbXE9Wu1klgnWOspDWcNC9QkU3mE4PaAgJ0HRaHz8TfZoviPM
	74i+EpzdJp0W9nAaA86W/VurrGkfs2ezUC0Sci3gQlfnClyZxzjqrfHWQ0R4qyoG8wVLYrXDsRIXy
	JiwazB7I/AICd+wibSiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imJOS-0003LR-0x; Tue, 31 Dec 2019 15:25:12 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imJOP-0002tb-Az
 for linux-afs@lists.infradead.org; Tue, 31 Dec 2019 15:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577805907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MmNBZkwBy1szGWacQmXBphuROcFRHJi+XYFCIYFXOoM=;
 b=V3jYoeeDvknBM4VJW7Qn+UATFyNzKMZEJSTTA96facuVXO940E1shTtyH0rI8oBMoUUz5w
 tnssvq6H3ldHFnBQfxYyNUMiFS35X94ZmFEiRgIICT0ipMXfeQzY9KnzYt05BIi8qeDrmd
 Y2Zqi9RyiqOPtmaxE5rgjE8BCEYJNVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-2Js2s053NvmFzobCKbM2CA-1; Tue, 31 Dec 2019 10:25:05 -0500
X-MC-Unique: 2Js2s053NvmFzobCKbM2CA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62D2D1800D4E;
 Tue, 31 Dec 2019 15:25:04 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-52.rdu2.redhat.com
 [10.10.120.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57F7B5D9E1;
 Tue, 31 Dec 2019 15:25:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 3/3] afs: Fix afs_lookup() to not clobber the version on a
 new dentry
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Tue, 31 Dec 2019 15:25:02 +0000
Message-ID: <157780590246.25571.8995170375088979996.stgit@warthog.procyon.org.uk>
In-Reply-To: <157780588822.25571.7926816048227538205.stgit@warthog.procyon.org.uk>
References: <157780588822.25571.7926816048227538205.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191231_072509_473504_B5C8881F 
X-CRM114-Status: GOOD (  13.23  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: linux-fsdevel@vger.kernel.org, dhowells@redhat.com,
 keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Fix afs_lookup() to not clobber the version set on a new dentry by
afs_do_lookup() - especially as it's using the wrong version of the version
(we need to use the one given to us by whatever op the dir contents
correspond to rather than what's in the afs_vnode).

Fixes: 9dd0b82ef530 ("afs: Fix missing dentry data version updating")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/dir.c |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index 813db1708494..5c794f4b051a 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -952,12 +952,8 @@ static struct dentry *afs_lookup(struct inode *dir, struct dentry *dentry,
 	afs_stat_v(dvnode, n_lookup);
 	inode = afs_do_lookup(dir, dentry, key);
 	key_put(key);
-	if (inode == ERR_PTR(-ENOENT)) {
+	if (inode == ERR_PTR(-ENOENT))
 		inode = afs_try_auto_mntpt(dentry, dir);
-	} else {
-		dentry->d_fsdata =
-			(void *)(unsigned long)dvnode->status.data_version;
-	}
 
 	if (!IS_ERR_OR_NULL(inode))
 		fid = AFS_FS_I(inode)->fid;


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
