Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 078BB13E6C9
	for <lists+linux-afs@lfdr.de>; Thu, 16 Jan 2020 18:22:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1la00WKnfIHKKCSVH4oPnfTGYVCntcJgnrsUrvwWwM=; b=BhqdFJh149rlQN
	RuyV3FxSUdk5whSEjVkR7fKTzjNZ4BgAT6KHbIY09xn1h54GgEzZ231UoIZVf7g4KSjYj1DzquWhH
	bReblGCdDcBqZTE4wdkAUDgyskvC7Suk2qVDnu968BU6M5YXS6cQWsXbHceM3p1EonWFZSrFXr5On
	6Kj6YO3bJzjMZRhdYpAoTYVwPu3Axhq0Jar+BQf0feGHNxOf0xvA7y2e0CIpiBdonKHDhKK2HXcPE
	YexG7KbkATJy2rcYlwKv6hidu+/UdtJGDCyXpyTtlogJvLhklRoDk7sNAXVj6M5hWm+CK23Omfjt+
	KdbMTVmhGZ8cJLjcL9MA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is8qs-000061-DE; Thu, 16 Jan 2020 17:22:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is8cF-0000ak-Ib
 for linux-afs@lists.infradead.org; Thu, 16 Jan 2020 17:07:38 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 64D7820663;
 Thu, 16 Jan 2020 17:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194451;
 bh=IaqOLNm/i0yLc3Jpw9UIY1y+vn8BKJAc9Js6nsMGAnU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YHnU4ku9U560EOzCo3C39yibbBSRpxNCriJ9t9O2WljHTbFxPbsMPM/kZ2vRSAYEh
 2h/wXPiPCt8/VuBvJ+fVdQKVujXJcWNllD9Ql8rc9bySUPIp4wnXX4MS/S5bnQnB1b
 dz23RhC5/7ro5SiIscEZqLdW0QNDSSUWlJBqwFmM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 361/671] afs: Don't invalidate callback if
 AFS_VNODE_DIR_VALID not set
Date: Thu, 16 Jan 2020 11:59:59 -0500
Message-Id: <20200116170509.12787-98-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116170509.12787-1-sashal@kernel.org>
References: <20200116170509.12787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_090731_646199_2D242C52 
X-CRM114-Status: GOOD (  10.31  )
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

[ Upstream commit d9052dda8a39069312218f913d22d99c48d90004 ]

Don't invalidate the callback promise on a directory if the
AFS_VNODE_DIR_VALID flag is not set (which indicates that the directory
contents are invalid, due to edit failure, callback break, page reclaim).

The directory will be reloaded next time the directory is accessed, so
clearing the callback flag at this point may race with a reload of the
directory and cancel it's recorded callback promise.

Fixes: f3ddee8dc4e2 ("afs: Fix directory handling")
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/afs/inode.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 718fab2f151a..e6f11da5461b 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -398,12 +398,9 @@ int afs_validate(struct afs_vnode *vnode, struct key *key)
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
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
