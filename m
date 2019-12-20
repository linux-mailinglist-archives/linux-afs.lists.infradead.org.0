Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E421127E66
	for <lists+linux-afs@lfdr.de>; Fri, 20 Dec 2019 15:47:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MvRh91vylQvImAo2kBu0PzyMVpFtXVPwAsuETyykSSU=; b=sZyu+HAY+svEHs
	lzleVAfy9I9vmnFO+dmAd6tCnaQ7vMU69y26xHU/nNQ/PjsyQq18qv7j8PVIrlw0uAWbbMRSyJdIN
	DQSIDpntNDUp1eoFVFmHcNwCAdZqEDgzbvlgUgRHU65FpyVzcfm5JUvuVboWRL0CLRE+TZrVWrzRN
	3Kx461M0yYBKrWmhV/UQ7xiJQPfZmtvBzHPi9qAQvxPf6zyfl5Trx0eAKFV7TZYzIiq+pZcpLZPbc
	gJ0JPwSNGhXybWpxcd4ev6RdNzD6R4+aahw+SDzxeLdSyDcAqgc5nMZxKJVHxioOxNDvFO6JRZ3V2
	CBqQg1rsHwBmI1cxluoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiJYX-0003Pq-5f; Fri, 20 Dec 2019 14:47:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiJYW-00037q-1P
 for linux-afs@bombadil.infradead.org; Fri, 20 Dec 2019 14:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pwHlVzff1GWcftHffX+wUfkUQY8ko21MNCt+pXyzjOc=; b=mgzgEYUJdlRICiGUE3cHIl6CLx
 LDCJV9SMYbx+XeWDL+qGwI2NXfNvy81LdIRvK37v9mH0yzdSmYnX1jsY5eGlulADPQta9TfRjN24Z
 WUXLKGVPtUH3ty3qbsaO54QQYlGUa0EtXtNooRiWoacnxjE74uqnREwLutztFdm2nByl1YzgceXWW
 jl/qTyJbPGlLl43aKfQP0qqLcZzMQEuN+cIUy2YTfy4LVGOTwEZYNpqhQMMMGOpWQ4IGZkqSCYECf
 gHygoQtSSFpvARupYZ2CztEiAPAbW1FoNnZJq4+KtfbF1+P+GGkFtyFZh6XZpAiY8Ok63g6Cm1hc4
 arCMlLqQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiJNS-0003O3-9c
 for linux-afs@lists.infradead.org; Fri, 20 Dec 2019 14:35:40 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13E8424680;
 Fri, 20 Dec 2019 14:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576852507;
 bh=YCDTaLPBYm/FSHUKf5B+vQAhJ61Kj7eBRk7Oijl1now=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZR6FoVSBN7FouFkxRJKlx0qHpeRvhq+7MV+FYQYRRvfxVB8Di0mnSueObm/iOvf+y
 pwqhBH2IE2yYeeJa/KMGNDdrPwRvAf8xUbEZTkB+lF8FKNFKXlv512lUs2IU66w3LN
 dpCDUZb0cLFTplqd85Yk8mkFs5WlYk3eLrCEmACI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 26/34] afs: Fix creation calls in the dynamic
 root to fail with EOPNOTSUPP
Date: Fri, 20 Dec 2019 09:34:25 -0500
Message-Id: <20191220143433.9922-26-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220143433.9922-1-sashal@kernel.org>
References: <20191220143433.9922-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_143538_492147_C3A4B90E 
X-CRM114-Status: GOOD (  12.32  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on casper.infradead.org summary:
 Content analysis details:   (-5.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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

[ Upstream commit 1da4bd9f9d187f53618890d7b66b9628bbec3c70 ]

Fix the lookup method on the dynamic root directory such that creation
calls, such as mkdir, open(O_CREAT), symlink, etc. fail with EOPNOTSUPP
rather than failing with some odd error (such as EEXIST).

lookup() itself tries to create automount directories when it is invoked.
These are cached locally in RAM and not committed to storage.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Marc Dionne <marc.dionne@auristor.com>
Tested-by: Jonathan Billings <jsbillings@jsbillings.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/afs/dynroot.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/afs/dynroot.c b/fs/afs/dynroot.c
index f29c6dade7f62..069273a2483f9 100644
--- a/fs/afs/dynroot.c
+++ b/fs/afs/dynroot.c
@@ -145,6 +145,9 @@ static struct dentry *afs_dynroot_lookup(struct inode *dir, struct dentry *dentr
 
 	ASSERTCMP(d_inode(dentry), ==, NULL);
 
+	if (flags & LOOKUP_CREATE)
+		return ERR_PTR(-EOPNOTSUPP);
+
 	if (dentry->d_name.len >= AFSNAMEMAX) {
 		_leave(" = -ENAMETOOLONG");
 		return ERR_PTR(-ENAMETOOLONG);
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
