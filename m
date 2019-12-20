Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 50124127E67
	for <lists+linux-afs@lfdr.de>; Fri, 20 Dec 2019 15:47:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2pUZM4vZL0IOdlogpCRCzLnRekk4hFEXn46afgmgn00=; b=sZYuFWk+ECxuzj
	HnorbfaVxrjxXA4YAmMXRGwaN+nu5XV02GirixvTCgy0Law7BMxfHasahx78au6vl/M1Td/XD+ivD
	jxWEjjNZA1j0fpsKSqNqPY4qdsW8KWYvbB61uEAa+rJlS613s92ncJe3q9x+h5sj6Z7DW4U/03MAs
	aN5w8sJ0xISel4ky1Zuv9i9i8ssdCMhXaebP2eagzP5MDtcIqh6LMBSSYt7JAH7/GtOqoH1eRRBuk
	Ryar76Rt5gX/bycsOCXk0RxUv+Yw7y9NySn6c4sF9CS6i0RRfPIhqCZ2jKFNy/Y408ZZ4Y6pTLaAL
	dELu9ClqXPcAPGKYQNdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiJYZ-0003Te-LR; Fri, 20 Dec 2019 14:47:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiJYY-00033y-BR
 for linux-afs@bombadil.infradead.org; Fri, 20 Dec 2019 14:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mVBI40fOs2ylSbNpXeW1qamlPf2zR3efxIaJ2qIHXAo=; b=jRcESvmwzJkdnE4f/NDU5TEUHZ
 4SGALQgDP7PrM+EO2rxagZh1kXqOlUt+TLcahw1gWNrSUqJE0PRpjSYDDQL/8OsRvHYqjHJ7+kT/v
 kFDg2/EX1Mm0Ip9jyVn6b3X6wyXeycRM4v+0XPjZYBpK1kuasuaBwHuhGqQxE+goRW4sPO1lp5DN8
 gAbF31T9HcFLZ9+oE2MG7CY68tsg61FhK/c+zJ2kHwgNaPFEhlNrJtT60GSvCXCipPrtZM1/y2/5N
 hQIChM4Gjz57W4G++Srvz9aLyK3G6APS78p63PBLUINHT+nkthYIacnzXJH8TzW2dEbXAcRxfm7Ky
 /yKcT/DA==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiJN8-0003Jz-Hm
 for linux-afs@lists.infradead.org; Fri, 20 Dec 2019 14:35:21 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A22F24695;
 Fri, 20 Dec 2019 14:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576852488;
 bh=zUpkqMwan0EDcea0gZWwUYSw2llqaLgxDSihAC5ohjM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FwImDSxoLbj3h6CuG7ZCkpl86R0B7B5YMiJzvj7+KlRVg8MQAvzIr8Q6sOcPu2+36
 2htUAMkhIXr7wvO9UIVe4GsVAZ9U9GP5Ogaft8oAV/JbzpL9MIWl+he+QFIWltbmYI
 NZrINpiyOTyMLpJ2byn4dp3pfXESjEjrn7UKA2+I=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 11/34] afs: Fix SELinux setting security label on
 /afs
Date: Fri, 20 Dec 2019 09:34:10 -0500
Message-Id: <20191220143433.9922-11-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220143433.9922-1-sashal@kernel.org>
References: <20191220143433.9922-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_143518_731509_E8DBB3B6 
X-CRM114-Status: GOOD (  12.76  )
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
Cc: Sasha Levin <sashal@kernel.org>, selinux@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-security-module@vger.kernel.org,
 Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit bcbccaf2edcf1b76f73f890e968babef446151a4 ]

Make the AFS dynamic root superblock R/W so that SELinux can set the
security label on it.  Without this, upgrades to, say, the Fedora
filesystem-afs RPM fail if afs is mounted on it because the SELinux label
can't be (re-)applied.

It might be better to make it possible to bypass the R/O check for LSM
label application through setxattr.

Fixes: 4d673da14533 ("afs: Support the AFS dynamic root")
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Marc Dionne <marc.dionne@auristor.com>
cc: selinux@vger.kernel.org
cc: linux-security-module@vger.kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/afs/super.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/afs/super.c b/fs/afs/super.c
index 4d3e274207fb7..bd26082974732 100644
--- a/fs/afs/super.c
+++ b/fs/afs/super.c
@@ -404,7 +404,6 @@ static int afs_fill_super(struct super_block *sb,
 	/* allocate the root inode and dentry */
 	if (as->dyn_root) {
 		inode = afs_iget_pseudo_dir(sb, true);
-		sb->s_flags	|= SB_RDONLY;
 	} else {
 		sprintf(sb->s_id, "%u", as->volume->vid);
 		afs_activate_volume(as->volume);
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
