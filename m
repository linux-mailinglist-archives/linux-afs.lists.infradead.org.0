Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D0513E6C7
	for <lists+linux-afs@lfdr.de>; Thu, 16 Jan 2020 18:22:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ATvafI2M/LuIp4RA7v3Nu168EY1BCtiB/xuYtiFm3I=; b=UUoFESMpstefMc
	af9zJewODMajfeyZHcTg8AjrvWiKRfcyeCBQr6xrUjg4qJUSwsVriIE/leR81JRFYXHALYyQMdiiQ
	yDJGa/HjUQxRjpQTNYywWamuXI4J19MuwF4AiAz/6c+XHfnniINktkS+y7/ogBUnQpyV7l6GAs9wM
	kM7HEVaOUPsmejDZuEb+ZVv2bCZgEhBAFk3j4FCvjl2gEpuyu4KsRNj/IO8qw2AKs31zGS63EL9Gn
	13jfJExJho64qYgIiFR0A3K5zn4zp0ZGdXxOpXmGrvEuxMcrQ6HHHEfIygUD9DWsmOPPuUiPrQ2ls
	WXqZY1Gw7pknrTOjFXcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is8qs-00006y-Mb; Thu, 16 Jan 2020 17:22:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is8cE-0000Zr-Lt
 for linux-afs@lists.infradead.org; Thu, 16 Jan 2020 17:07:38 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 69DD32081E;
 Thu, 16 Jan 2020 17:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194450;
 bh=9e5byxJIih88ju7Q5B5t6AA+zLK+ZzuP/KEvyl4o2mQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NjAHG8TUPKQ6ek3lDq8+EyVOwHb8G3C1NKEMFCaqib7D7MfUgpKrsgpglIxBYmBpS
 AYnTmMshOI9F2E4FJYUGpMVX+pv1G4ij+p+iMuGraHMzv/XIDdFpNmTvWav3MDp3i8
 NPM88Drkm274Yc5ag0McSrO/UrRqeM3qcad4tM78=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 360/671] afs: Fix key leak in afs_release() and
 afs_evict_inode()
Date: Thu, 16 Jan 2020 11:59:58 -0500
Message-Id: <20200116170509.12787-97-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116170509.12787-1-sashal@kernel.org>
References: <20200116170509.12787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_090730_796554_618C9FA4 
X-CRM114-Status: GOOD (  11.77  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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

[ Upstream commit a1b879eefc2b34cd3f17187ef6fc1cf3960e9518 ]

Fix afs_release() to go through the cleanup part of the function if
FMODE_WRITE is set rather than exiting through vfs_fsync() (which skips the
cleanup).  The cleanup involves discarding the refs on the key used for
file ops and the writeback key record.

Also fix afs_evict_inode() to clean up any left over wb keys attached to
the inode/vnode when it is removed.

Fixes: 5a8132761609 ("afs: Do better accretion of small writes on newly created content")
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/afs/file.c  | 7 ++++---
 fs/afs/inode.c | 1 +
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index 843d3b970b84..0bd78df6a64e 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -169,11 +169,12 @@ int afs_release(struct inode *inode, struct file *file)
 {
 	struct afs_vnode *vnode = AFS_FS_I(inode);
 	struct afs_file *af = file->private_data;
+	int ret = 0;
 
 	_enter("{%x:%u},", vnode->fid.vid, vnode->fid.vnode);
 
 	if ((file->f_mode & FMODE_WRITE))
-		return vfs_fsync(file, 0);
+		ret = vfs_fsync(file, 0);
 
 	file->private_data = NULL;
 	if (af->wb)
@@ -181,8 +182,8 @@ int afs_release(struct inode *inode, struct file *file)
 	key_put(af->key);
 	kfree(af);
 	afs_prune_wb_keys(vnode);
-	_leave(" = 0");
-	return 0;
+	_leave(" = %d", ret);
+	return ret;
 }
 
 /*
diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 0726e40db0f8..718fab2f151a 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -541,6 +541,7 @@ void afs_evict_inode(struct inode *inode)
 	}
 #endif
 
+	afs_prune_wb_keys(vnode);
 	afs_put_permits(rcu_access_pointer(vnode->permit_cache));
 	key_put(vnode->lock_key);
 	vnode->lock_key = NULL;
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
