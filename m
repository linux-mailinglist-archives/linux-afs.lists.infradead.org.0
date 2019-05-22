Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5991026B11
	for <lists+linux-afs@lfdr.de>; Wed, 22 May 2019 21:23:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QK3d1Mv5baigzuI/iA4LCoq8Mbwc9MDxg22vGZ+rjgA=; b=Kt+gDLqaqjOZl7
	jEUJPSeaEWQ/h+PpRjU/inMgm3b6T6ri1pXt7ecF5wnWN9t6QVBHyLij27FAmnn7Pq0khhP/wDnS4
	UJgJAhrA1zqyAX1RUVZ5VlpRDBI8ciR+VftM1gtHZo2vYT/3oeotlNZh/beV3B+XtTBMuM3C14MNb
	eFpRGGzEEwAbdyCz3QWsNSRiy0vqTSUK19rGgJHlhslw1wzRxuP/yvzgMb0FEfnTk/Rbem1J6zrKG
	IrzQX5WOJk3MVjhPwrAmUIc08lOfc/ZE2fYmvsCuCA5MCJH5QjS22Cb9mKg194je26MqpOEdJXp5+
	tGmpaVcb640v3GTGvWFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTWq0-0001qe-Vv; Wed, 22 May 2019 19:23:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTWpy-0001pv-Eo
 for linux-afs@lists.infradead.org; Wed, 22 May 2019 19:23:43 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 98F792184E;
 Wed, 22 May 2019 19:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558553022;
 bh=lOAMxzkToxe3qagEy8KPYQKMxFkKtyRzcd+10Z2xQgw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b3IahR/yeCE9IL2D+0OU/CTJjEg7aLswhJvbFeRsagErzDwZ7jpcwhQwVdnvXv02b
 RtqAhTxy65j2ZRbWLVHyJlZncv3+qHOBUImlzbjKr6NCAsBvByBwr4FLKXFpFoQwsJ
 i/hJO89EUTyQ+oCOCSCDuZgZKetEx6DNthu74fyw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 003/317] afs: Fix getting the afs.fid xattr
Date: Wed, 22 May 2019 15:18:24 -0400
Message-Id: <20190522192338.23715-3-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522192338.23715-1-sashal@kernel.org>
References: <20190522192338.23715-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_122342_513121_E346F903 
X-CRM114-Status: GOOD (  13.47  )
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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
Cc: David Howells <dhowells@redhat.com>, Sasha Levin <sashal@kernel.org>,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit a2f611a3dc317d8ea1c98ad6c54b911cf7f93193 ]

The AFS3 FID is three 32-bit unsigned numbers and is represented as three
up-to-8-hex-digit numbers separated by colons to the afs.fid xattr.
However, with the advent of support for YFS, the FID is now a 64-bit volume
number, a 96-bit vnode/inode number and a 32-bit uniquifier (as before).
Whilst the sprintf in afs_xattr_get_fid() has been partially updated (it
currently ignores the upper 32 bits of the 96-bit vnode number), the size
of the stack-based buffer has not been increased to match, thereby allowing
stack corruption to occur.

Fix this by increasing the buffer size appropriately and conditionally
including the upper part of the vnode number if it is non-zero.  The latter
requires the lower part to be zero-padded if the upper part is non-zero.

Fixes: 3b6492df4153 ("afs: Increase to 64-bit volume ID and 96-bit vnode ID for YFS")
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/afs/xattr.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/afs/xattr.c b/fs/afs/xattr.c
index a2cdf25573e24..706801c6c4c4c 100644
--- a/fs/afs/xattr.c
+++ b/fs/afs/xattr.c
@@ -69,11 +69,20 @@ static int afs_xattr_get_fid(const struct xattr_handler *handler,
 			     void *buffer, size_t size)
 {
 	struct afs_vnode *vnode = AFS_FS_I(inode);
-	char text[8 + 1 + 8 + 1 + 8 + 1];
+	char text[16 + 1 + 24 + 1 + 8 + 1];
 	size_t len;
 
-	len = sprintf(text, "%llx:%llx:%x",
-		      vnode->fid.vid, vnode->fid.vnode, vnode->fid.unique);
+	/* The volume ID is 64-bit, the vnode ID is 96-bit and the
+	 * uniquifier is 32-bit.
+	 */
+	len = sprintf(text, "%llx:", vnode->fid.vid);
+	if (vnode->fid.vnode_hi)
+		len += sprintf(text + len, "%x%016llx",
+			       vnode->fid.vnode_hi, vnode->fid.vnode);
+	else
+		len += sprintf(text + len, "%llx", vnode->fid.vnode);
+	len += sprintf(text + len, ":%x", vnode->fid.unique);
+
 	if (size == 0)
 		return len;
 	if (len > size)
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
