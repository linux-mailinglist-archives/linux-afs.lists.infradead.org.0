Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3555913E6EB
	for <lists+linux-afs@lfdr.de>; Thu, 16 Jan 2020 18:22:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JSZauXwidTVNS/QRU0ofMaPuPhEClONZFw+DmL65lgY=; b=B7qpXMGPs9KbPs
	uZAonT3r40TemkNcU2roZQt9YrDMpbgo3Icthja5GtCcJrovyl0g1ssLOK1Hs3vYPEi7XOQnxpTOb
	F9Y00gJ0nQ2hdZCaXTwUO471XEQY6tZoYNRYb5FkoCX/sr8gb14uyqnwtRA1cWoN6eS1El7J0+4+f
	tBl4AffjTWDkOdbrmskoILBX+0HDn6XPz9dmD4lnwN8Z9Ntnbbl7EiWYq4LA1R+VmEOJxaMNFqCp0
	AzJKJjlLa5UyLrXGimrVEMNLmXoKwC4PI84CEwGNGFFLRVwaqTR36YpAfvLmgmtGdE9N+IEkVK6zl
	aWN2eEXHNH/o6o9KsY+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is8r5-0000Nn-Ud; Thu, 16 Jan 2020 17:22:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is8cG-0000c0-V2
 for linux-afs@lists.infradead.org; Thu, 16 Jan 2020 17:07:40 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8897821582;
 Thu, 16 Jan 2020 17:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194452;
 bh=9ffIg72vfAL9XOeRGbQvUSJeUprb7SNydkmcRf2SO2o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0XcO2XazkZ77b+AhN+4jzVvtfR5ZJ4h3cWJh9X/76aBXYTLBtCfQgGb50/lHAgomB
 vyRVb24VOqQtTSGa+uRFDyrXjJ6BhlNrHslsjHE0NaK0G07r9MeyB9r/uuB+YrUFPF
 HywCBsxzMjrk4YJMFUKqJQJlLV+UDpPcj+S492LA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 362/671] afs: Fix lock-wait/callback-break double
 locking
Date: Thu, 16 Jan 2020 12:00:00 -0500
Message-Id: <20200116170509.12787-99-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116170509.12787-1-sashal@kernel.org>
References: <20200116170509.12787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_090733_169356_FDEDA7DE 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

[ Upstream commit c7226e407b6065d3bda8bd9dc627663d2c505ea3 ]

__afs_break_callback() holds vnode->lock around its call of
afs_lock_may_be_available() - which also takes that lock.

Fix this by not taking the lock in __afs_break_callback().

Also, there's no point checking the granted_locks and pending_locks queues;
it's sufficient to check lock_state, so move that check out of
afs_lock_may_be_available() into __afs_break_callback() to replace the
queue checks.

Fixes: e8d6c554126b ("AFS: implement file locking")
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/afs/callback.c | 8 +-------
 fs/afs/flock.c    | 3 ---
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/fs/afs/callback.c b/fs/afs/callback.c
index 4ad701250299..97283b04fa6f 100644
--- a/fs/afs/callback.c
+++ b/fs/afs/callback.c
@@ -221,14 +221,8 @@ void afs_break_callback(struct afs_vnode *vnode)
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
 
 	write_sequnlock(&vnode->cb_lock);
diff --git a/fs/afs/flock.c b/fs/afs/flock.c
index 075fe7f94810..457ce62e5c0f 100644
--- a/fs/afs/flock.c
+++ b/fs/afs/flock.c
@@ -39,9 +39,6 @@ void afs_lock_may_be_available(struct afs_vnode *vnode)
 {
 	_enter("{%x:%u}", vnode->fid.vid, vnode->fid.vnode);
 
-	if (vnode->lock_state != AFS_VNODE_LOCK_WAITING_FOR_CB)
-		return;
-
 	spin_lock(&vnode->lock);
 	if (vnode->lock_state == AFS_VNODE_LOCK_WAITING_FOR_CB)
 		afs_next_locker(vnode, 0);
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
