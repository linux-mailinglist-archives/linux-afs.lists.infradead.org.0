Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A89E0A2371
	for <lists+linux-afs@lfdr.de>; Thu, 29 Aug 2019 20:15:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=77T3A0ko6svXRXLAFPi/d9o8AYpRBPEhg34weSIfWgw=; b=AGi+Y2/Gmn+unZ
	8h4G8OUwKYWxNy3s8u889RwA6Ve8wrpFO0SVYiBIvpEmCrx36Wj0XztaOs8cbafDIn9xcsrAg50wv
	WZsS91K4RzFc0qwhpEP3u9PJ+7XF//5Ij7P35GMAwCndKc2wEKxJ31jnF8cs8idPWpSKdmkV+CThw
	KUbcOn89PJ5f2O2tbfMaeWS4mhRIUlJcgqCo47WpNLbTLz1Yz0pQerQLvMsM19Nm/P/Xm1VZqVNMF
	ZYklSBT2T4lxZEzc9iyi6Cw7V0xRIQkSAvcV87Zm8aMB24NfvbqFmd0ewuIhmTaQm36JlYiMd7ZPp
	kjJ8yVQM5LJ5Y9aLGDug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3OxR-00078J-RR; Thu, 29 Aug 2019 18:15:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3OxN-00075F-VI
 for linux-afs@lists.infradead.org; Thu, 29 Aug 2019 18:15:39 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EDED023427;
 Thu, 29 Aug 2019 18:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567102537;
 bh=pbhhtTjqHGaVTb6b/qL8/sUcq+cEXuTLSfp3vcATJdY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dzsb+bDuGpQ76IWR2il2hw5XYHgeKCuTHhmUj4+ZW9+jEU8nLrHVq2M/nLOh5muM2
 f6c9IYLMVVPzL1u1qIRVwrnjpN26ZuzYJK31KfEVRlt1i3OjAsteOi+1Xf8x+EbCFe
 of3y+X9jUvS0eekvpVyvsycqqQblAF2O8WJbQsjs=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 72/76] afs: use correct afs_call_type in
 yfs_fs_store_opaque_acl2
Date: Thu, 29 Aug 2019 14:13:07 -0400
Message-Id: <20190829181311.7562-72-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190829181311.7562-1-sashal@kernel.org>
References: <20190829181311.7562-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_111538_090355_6EC38EBB 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: David Howells <dhowells@redhat.com>, Sasha Levin <sashal@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: YueHaibing <yuehaibing@huawei.com>

[ Upstream commit 7533be858f5b9a036b9f91556a3ed70786abca8e ]

It seems that 'yfs_RXYFSStoreOpaqueACL2' should be use in
yfs_fs_store_opaque_acl2().

Fixes: f5e4546347bc ("afs: Implement YFS ACL setting")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/afs/yfsclient.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index 18722aaeda33a..a1baf3f1f14d1 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -2155,7 +2155,7 @@ int yfs_fs_store_opaque_acl2(struct afs_fs_cursor *fc, const struct afs_acl *acl
 	       key_serial(fc->key), vnode->fid.vid, vnode->fid.vnode);
 
 	size = round_up(acl->size, 4);
-	call = afs_alloc_flat_call(net, &yfs_RXYFSStoreStatus,
+	call = afs_alloc_flat_call(net, &yfs_RXYFSStoreOpaqueACL2,
 				   sizeof(__be32) * 2 +
 				   sizeof(struct yfs_xdr_YFSFid) +
 				   sizeof(__be32) + size,
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
