Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DE40196059
	for <lists+linux-afs@lfdr.de>; Tue, 20 Aug 2019 15:41:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yZ7qN9nhWRblJccEIrc72KP/JUBFcEiflEfiVP+4Zm4=; b=K+xAIhIm9K9NXI
	nibsW/bcufDvAzqBbN8gXl4lhZnvDCow289MXcnyLFNAfvv/oB8nVlhv/gyqx2W1qSTq6x64UWIAz
	CPN8ryThJmCYAD0xlrx2UR3bd3Caq5RODHdvp0TQZnCs4wBJ6zt8GLIQGsPR5gPIZlrTrBg5aPwOa
	bBFSOjQor+W8uwk9URAxD68o2ThyHSfaW9UPdGJNbo/BPAlDYd5xE/LH5o51T9cXtiumqi6A+OtrM
	O2sMubt16fgeV7OygaO53gTRJyZR8LqGJG97ak8mYSOVlppQ0F5lpLbN3MHmVcncj9eEpZsF7waRL
	sV8lzkPU4sU+pTIgz57w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i04Ns-00034g-FW; Tue, 20 Aug 2019 13:41:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i04NH-0002io-3L
 for linux-afs@lists.infradead.org; Tue, 20 Aug 2019 13:40:36 +0000
Received: from sasha-vm.mshome.net (unknown [12.236.144.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 40BC722DA7;
 Tue, 20 Aug 2019 13:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566308434;
 bh=yFL7ImAVG37bqNXnvntkZhTZPNTbT1g7r5HC8Hs6xr0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y45aG5zWjtJzlrSneK2kRWnAYlAvbgpK9Xnp3QUDhTiGxQvHzukhCrAeooLq9tG2f
 VKRr+iMWVlrUTM9q7MiiNAndRi+bgk3mBeIytppPYr+8o8oXrh3z99VuOwDeOuSbz5
 5KGNFT0LkMllFTNpTYMFom/NwSUJhjPkiGyIo4xY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 06/44] afs: Fix off-by-one in afs_rename()
 expected data version calculation
Date: Tue, 20 Aug 2019 09:39:50 -0400
Message-Id: <20190820134028.10829-6-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190820134028.10829-1-sashal@kernel.org>
References: <20190820134028.10829-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_064035_164895_90353566 
X-CRM114-Status: GOOD (  11.78  )
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

[ Upstream commit 37c0bbb3326674940e657118306ac52364314523 ]

When afs_rename() calculates the expected data version of the target
directory in a cross-directory rename, it doesn't increment it as it
should, so it always thinks that the target inode is unexpectedly modified
on the server.

Fixes: a58823ac4589 ("afs: Fix application of status and callback to be under same lock")
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/afs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index da9563d62b327..9750ac70f8ffb 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -1807,7 +1807,7 @@ static int afs_rename(struct inode *old_dir, struct dentry *old_dentry,
 				afs_end_vnode_operation(&fc);
 				goto error_rehash;
 			}
-			new_data_version = new_dvnode->status.data_version;
+			new_data_version = new_dvnode->status.data_version + 1;
 		} else {
 			new_data_version = orig_data_version;
 			new_scb = &scb[0];
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
