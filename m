Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1979605B
	for <lists+linux-afs@lfdr.de>; Tue, 20 Aug 2019 15:41:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Noc6Fkj3EzADtcqgI2/egplN2WE6aU0FzB5iQDv26o8=; b=VsYT5CrC/qrnLj
	Lrz4c9IwbgdHGfXHkXK2HW3VQd4bJjc02eUYVlEk1d2Tx8NsKZxW3C3j93S0SNRNe0u0E6t8u0KXx
	0FcLDIJp1Jy6evBQ90ijqx4R3D8KjsPyV4zEaCjkTT5SRuP49Pgxqx2CAtQF+iVs0eP6sZz3MrOj8
	X7a2JNFrqcdrmfpkxtVHKe5BhKcLa04h14VRZ7cysZO/prJkQocNm0HyInDM2Lc3h5+0F33ebe2r8
	rwedhAdm3YIZGmklgfSPj4Jgf4mQ77O+QVv2f0hzZ8DHYnj2qMjZtf2cdE9zfquSB86ccRM+sFydH
	Vrll1ZNJsbnAtb92EwCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i04Nv-000396-Go; Tue, 20 Aug 2019 13:41:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i04NH-0002j9-Rp
 for linux-afs@lists.infradead.org; Tue, 20 Aug 2019 13:40:37 +0000
Received: from sasha-vm.mshome.net (unknown [12.236.144.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1FEAE230F2;
 Tue, 20 Aug 2019 13:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566308435;
 bh=B/hLYc7cxxyJ07aBCg1qJhDQzflRg5gX4K4s5PkaqLQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fzUqS5DmbY3mSkYW32zqkfshDdDxiSpWaWtZ1SoeLxaOngchoE+SiY8eD1t7TDGnr
 V8rKQRtijMV5sqLrjOTT4XhhUEiR3KF4AdMZgpzbINbuiYdZqpSuTPwYAXjiSaDzuI
 hoNl58xwGi9vs8AvD/i1KFRtpV5ykY4Sk7wlIWWo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 07/44] afs: Only update d_fsdata if different in
 afs_d_revalidate()
Date: Tue, 20 Aug 2019 09:39:51 -0400
Message-Id: <20190820134028.10829-7-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190820134028.10829-1-sashal@kernel.org>
References: <20190820134028.10829-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_064035_915927_DAD16F80 
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
index 9750ac70f8ffb..b87b41721eaa8 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -1018,7 +1018,7 @@ static int afs_d_revalidate(struct dentry *dentry, unsigned int flags)
 	dir_version = (long)dir->status.data_version;
 	de_version = (long)dentry->d_fsdata;
 	if (de_version == dir_version)
-		goto out_valid;
+		goto out_valid_noupdate;
 
 	dir_version = (long)dir->invalid_before;
 	if (de_version - dir_version >= 0)
@@ -1082,6 +1082,7 @@ static int afs_d_revalidate(struct dentry *dentry, unsigned int flags)
 
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
