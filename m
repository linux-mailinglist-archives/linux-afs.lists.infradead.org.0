Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6454F960CE
	for <lists+linux-afs@lfdr.de>; Tue, 20 Aug 2019 15:43:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MWeK+3tDvudLVRlPmFvB6onH0eOownlDihouRXcwc9g=; b=Mdr9AogBgdnJZa
	pIUTXeut5799S+0UwiwksI7wiumTuVxe0/gkr14uBmb+cT+7/nDWr9ZghreERplqxMScb6IzhtoQu
	0grgtWTAwWU5Q09SklUTlDDn6aPmZGJRBmFQbIP8u06WRdqDhf9f3svCuash50gO1gb3GshBEt9ts
	KQC8XUUeXvih6Jy5/VZn8OTUHlYLpqvW4vCegPDoWBgimJ1izB0l6FGaabdZkyZSmt9HMw9Pr7VSe
	6ZHFeyIeEW+qTYrJxJkWKE6zWuN0Hj975ieI+YvDBlN9nMTygQUK+mQ9eRsDP6jiiVRdO5vgUo955
	lpgrmLTGeWCL55qhZoNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i04Q7-00057I-OL; Tue, 20 Aug 2019 13:43:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i04Ox-000466-Sh
 for linux-afs@lists.infradead.org; Tue, 20 Aug 2019 13:42:24 +0000
Received: from sasha-vm.mshome.net (unknown [12.236.144.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CA1F82332B;
 Tue, 20 Aug 2019 13:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566308539;
 bh=U1wmmqt8IFCCBee96fUQLklIQ9/Yo6GEXftgBp6Hmrw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VDbCA0OHHzSjVMSCVxjueD0FjeJ1oRRwRhEl6v6DUOQg+ZJVBajG06xh3H3vZJ1+7
 Io0UCQmJHm4Hu97vduBJxQng1RaWjKy0RguzfPPeQuYcg6xyHRZroX41vX1lj4uagh
 ekKaLy0acvmwaWcLl9OM+vXmgff7GYBNzhBK/MGo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 06/27] afs: Only update d_fsdata if different in
 afs_d_revalidate()
Date: Tue, 20 Aug 2019 09:41:52 -0400
Message-Id: <20190820134213.11279-6-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190820134213.11279-1-sashal@kernel.org>
References: <20190820134213.11279-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_064219_972814_EBF26C98 
X-CRM114-Status: GOOD (  14.05  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: David Howells <dhowells@redhat.com>, Sasha Levin <sashal@kernel.org>,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit 5dc84855b0fc7e1db182b55c5564fd539d6eff92 ]

In the in-kernel afs filesystem, d_fsdata is set with the data version of
the parent directory.  afs_d_revalidate() will update this to the current
directory version, but it shouldn't do this if it the value it read from
d_fsdata is the same as no lock is held and cmpxchg() is not used.

Fix the code to only change the value if it is different from the current
directory version.

Fixes: 260a980317da ("[AFS]: Add "directory write" support.")
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/afs/dir.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index 855bf2b79fed4..54e7f6f1405e2 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -937,7 +937,7 @@ static int afs_d_revalidate(struct dentry *dentry, unsigned int flags)
 	dir_version = (long)dir->status.data_version;
 	de_version = (long)dentry->d_fsdata;
 	if (de_version == dir_version)
-		goto out_valid;
+		goto out_valid_noupdate;
 
 	dir_version = (long)dir->invalid_before;
 	if (de_version - dir_version >= 0)
@@ -1001,6 +1001,7 @@ static int afs_d_revalidate(struct dentry *dentry, unsigned int flags)
 
 out_valid:
 	dentry->d_fsdata = (void *)dir_version;
+out_valid_noupdate:
 	dput(parent);
 	key_put(key);
 	_leave(" = 1 [valid]");
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
