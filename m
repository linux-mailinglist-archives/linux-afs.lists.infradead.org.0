Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C7913E6CA
	for <lists+linux-afs@lfdr.de>; Thu, 16 Jan 2020 18:22:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVJI5RWZc3YW1OZ5uyaQgXFwerDTPKG+99VpoMfvdXo=; b=Zxaf0WBR2r1okF
	Btj766nAVuH+deeOGWOS7Jp2mNqPy+bRU7nroBCXoc9qBX3XsRliuZYo1ZwpEb9WP3tZO9T39n3vh
	Dok5ZYndlYhI/L+5KsBjqxZZOV/nzgWCIf9WJzkHdRtyjxEnGfoDI0h9lm+OLeYhbfNeYYnw5Lrpu
	CFHQFcEtcXzVR0VwuYtl9HQZAKXqZXSCZlVffyC+NvW7L0kuXcdlO647101KHdUxcLyNxdeIbmuyn
	BSUTrt7vpU5HTFV+ONJc2KOJJCvmaO36zXa3NeE2SC+CJ38n28O2dfR6Q1Ji+jobE2JlxoPBBIxGf
	0Wk4YnaK4Sb+rjDWf/ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is8qt-00007N-6S; Thu, 16 Jan 2020 17:22:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is8cI-0000cr-7B
 for linux-afs@lists.infradead.org; Thu, 16 Jan 2020 17:07:40 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D79B24679;
 Thu, 16 Jan 2020 17:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194453;
 bh=eiozgSvE0P6s9NMNgVO9mWYQC/RhfGeUjT37ObuwHHk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DSsw2DKDUjn1Q0RaxXGrVACyeJsqu5aVyzCUMYau2736JUnPJIzOsV/uDluIZ6gz1
 +3aUwsDiS5+TScvU/LEUTAmPy6NBMQPky+TwoGJi401I/e97aMYS0yLrsYkUsyMtz4
 tDW0O72DUPUjIe961O+U7Sb56p1auBKKycCPn71Q=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 363/671] afs: Fix double inc of vnode->cb_break
Date: Thu, 16 Jan 2020 12:00:01 -0500
Message-Id: <20200116170509.12787-100-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116170509.12787-1-sashal@kernel.org>
References: <20200116170509.12787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_090734_312487_7ACE45C1 
X-CRM114-Status: GOOD (  10.65  )
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

[ Upstream commit fd711586bb7d63f257da5eff234e68c446ac35ea ]

When __afs_break_callback() clears the CB_PROMISED flag, it increments
vnode->cb_break to trigger a future refetch of the status and callback -
however it also calls afs_clear_permits(), which also increments
vnode->cb_break.

Fix this by removing the increment from afs_clear_permits().

Whilst we're at it, fix the conditional call to afs_put_permits() as the
function checks to see if the argument is NULL, so the check is redundant.

Fixes: be080a6f43c4 ("afs: Overhaul permit caching");
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/afs/security.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/afs/security.c b/fs/afs/security.c
index 81dfedb7879f..66042b432baa 100644
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
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
