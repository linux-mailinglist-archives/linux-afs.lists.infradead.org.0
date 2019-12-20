Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 80344127D1C
	for <lists+linux-afs@lfdr.de>; Fri, 20 Dec 2019 15:33:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=98IkPO/Hs197DT3FkseAYt/+6/ywHJRwrh/ffO74P7o=; b=KK+kilg3Dutzul
	XlPfNJPwep1CUz2s0k5g3olKq+rZ+PaVydr0i0fihJQkvQQu8v7IHmLqw2n51+e2tos5XnWTKcL43
	bjImpZUaVRJFFTRHAV8YLFW8vL4YzEXw7ANxhDA+8AerfU4hvEEn1P6demzxJLkXQ3OHUGYoiOSR0
	5eR/J48VedBdggKD31v/V7Rb6h0M79K4MMyOLlLt/lyzat170sZB4u+bJA5MH+ciiM+6nblXmssJR
	UGo7F4BJeUvRtp01FiycO5tphkgbCaE+fo4f6snae35GH/BZqz1+VYY0EeIiZmFOPXHRoIJfgD7nl
	TeNT4W4DjjJUB5ZbV9PQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiJL4-0004B2-FJ; Fri, 20 Dec 2019 14:33:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiJIo-00026k-Su
 for linux-afs@lists.infradead.org; Fri, 20 Dec 2019 14:31:12 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 36D3A24691;
 Fri, 20 Dec 2019 14:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576852250;
 bh=yncMnTIlVeBDgGpkBuy+C4FVdWGC/AeEWtvv41q7wLc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J2T2anbFEL1ePDhmZx6qaxnIV+KNSwX6EEoMRjs9RWcnNL+bkxcR7ny043G4KSgzY
 w9Q05dZ+ikQ3IWadl1iA8B7BM1v0+QZfOi+h8Km+ICdvULsBOEmfaVbYFy5hnW+9Wg
 p0HMroSpZ3w2SntZdLTfiw5bsQ4Q3SybtZ5tSAoE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 41/52] afs: Fix mountpoint parsing
Date: Fri, 20 Dec 2019 09:29:43 -0500
Message-Id: <20191220142954.9500-41-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220142954.9500-1-sashal@kernel.org>
References: <20191220142954.9500-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_063051_181263_59E7BAEA 
X-CRM114-Status: GOOD (  15.26  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 linux-afs@lists.infradead.org, Sasha Levin <sashal@kernel.org>,
 Jonathan Billings <jsbillings@jsbillings.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit 158d58335393af3956a9c06f0816ee75ed1f1447 ]

Each AFS mountpoint has strings that define the target to be mounted.  This
is required to end in a dot that is supposed to be stripped off.  The
string can include suffixes of ".readonly" or ".backup" - which are
supposed to come before the terminal dot.  To add to the confusion, the "fs
lsmount" afs utility does not show the terminal dot when displaying the
string.

The kernel mount source string parser, however, assumes that the terminal
dot marks the suffix and that the suffix is always "" and is thus ignored.
In most cases, there is no suffix and this is not a problem - but if there
is a suffix, it is lost and this affects the ability to mount the correct
volume.

The command line mount command, on the other hand, is expected not to
include a terminal dot - so the problem doesn't arise there.

Fix this by making sure that the dot exists and then stripping it when
passing the string to the mount configuration.

Fixes: bec5eb614130 ("AFS: Implement an autocell mount capability [ver #2]")
Reported-by: Jonathan Billings <jsbillings@jsbillings.org>
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Marc Dionne <marc.dionne@auristor.com>
Tested-by: Jonathan Billings <jsbillings@jsbillings.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/afs/mntpt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/afs/mntpt.c b/fs/afs/mntpt.c
index f532d6d3bd28c..79bc5f1338edf 100644
--- a/fs/afs/mntpt.c
+++ b/fs/afs/mntpt.c
@@ -126,7 +126,7 @@ static int afs_mntpt_set_params(struct fs_context *fc, struct dentry *mntpt)
 		if (src_as->cell)
 			ctx->cell = afs_get_cell(src_as->cell);
 
-		if (size > PAGE_SIZE - 1)
+		if (size < 2 || size > PAGE_SIZE - 1)
 			return -EINVAL;
 
 		page = read_mapping_page(d_inode(mntpt)->i_mapping, 0, NULL);
@@ -140,7 +140,9 @@ static int afs_mntpt_set_params(struct fs_context *fc, struct dentry *mntpt)
 		}
 
 		buf = kmap(page);
-		ret = vfs_parse_fs_string(fc, "source", buf, size);
+		ret = -EINVAL;
+		if (buf[size - 1] == '.')
+			ret = vfs_parse_fs_string(fc, "source", buf, size - 1);
 		kunmap(page);
 		put_page(page);
 		if (ret < 0)
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
