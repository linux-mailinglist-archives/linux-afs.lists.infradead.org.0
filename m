Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2A2A236F
	for <lists+linux-afs@lfdr.de>; Thu, 29 Aug 2019 20:15:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DEpV9/u79cy2R/VCjKVEcIT0aVQVmfg2nEvApf3x+h8=; b=Fam3hTCSffDBqB
	GdNEZaf2SbPz4YsbAaYvNIdyjGuV+RUAgDajKrHfEcGApENfSWI8fC1Rfbwracx7sm4mpZ0WmYgyh
	gIgEyOLSHZO0n2xhrOMh6DmvJzKL3jQrKzyX0dh+Gd+YzpzQJq56qBs/PP48mDqhV3Yu+Qvr60mGd
	ueh4EUWUIurVShdlEMQHeehmCY4UIDwPSN25qjrIZGI50TPwUxQcZnKkp4vjNLXTXeMNwe8QXcX9Y
	3T6xNRxrIK1XyksPXXjjjUiLERBwt3yJYkw3oYFApLKtqPe5omT5vIFCHoQAL2bXes4aqO485+02B
	5JVo4aCU+U7pqVebzxzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3OxQ-00076l-Bu; Thu, 29 Aug 2019 18:15:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3OxM-00074Q-SI
 for linux-afs@lists.infradead.org; Thu, 29 Aug 2019 18:15:38 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E59A72342B;
 Thu, 29 Aug 2019 18:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567102536;
 bh=dVA703rK6IxI1rxx+YY4+dmvvsctabIC5SH1lxPtYk8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c01ddU3jx7RgTp3wkQ15q0qg8czrN6kjezGq1bLpOcUGoOpjQ5JcnXaXzf4JxADKH
 3dW6PSIwSx5rHN/V8aPfIBl/BJYXlTbOCpmkk6v3Nb5AFWIc0vdCUvDpRfqP8l95GU
 4OIBm7YsNd67yyvEeyEbsF2bMmCpvXFSgSiSoVNk=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 71/76] afs: Fix possible oops in afs_lookup trace
 event
Date: Thu, 29 Aug 2019 14:13:06 -0400
Message-Id: <20190829181311.7562-71-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190829181311.7562-1-sashal@kernel.org>
References: <20190829181311.7562-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_111536_934430_B5AA9338 
X-CRM114-Status: GOOD (  10.67  )
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
Cc: Marc Dionne <marc.dionne@auristor.com>, David Howells <dhowells@redhat.com>,
 linux-afs@lists.infradead.org, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: Marc Dionne <marc.dionne@auristor.com>

[ Upstream commit c4c613ff08d92e72bf64a65ec35a2c3aa1cfcd06 ]

The afs_lookup trace event can cause the following:

[  216.576777] BUG: kernel NULL pointer dereference, address: 000000000000023b
[  216.576803] #PF: supervisor read access in kernel mode
[  216.576813] #PF: error_code(0x0000) - not-present page
...
[  216.576913] RIP: 0010:trace_event_raw_event_afs_lookup+0x9e/0x1c0 [kafs]

If the inode from afs_do_lookup() is an error other than ENOENT, or if it
is ENOENT and afs_try_auto_mntpt() returns an error, the trace event will
try to dereference the error pointer as a valid pointer.

Use IS_ERR_OR_NULL to only pass a valid pointer for the trace, or NULL.

Ideally the trace would include the error value, but for now just avoid
the oops.

Fixes: 80548b03991f ("afs: Add more tracepoints")
Signed-off-by: Marc Dionne <marc.dionne@auristor.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/afs/dir.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index da9563d62b327..c50cc3f6f4553 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -952,7 +952,8 @@ static struct dentry *afs_lookup(struct inode *dir, struct dentry *dentry,
 				 inode ? AFS_FS_I(inode) : NULL);
 	} else {
 		trace_afs_lookup(dvnode, &dentry->d_name,
-				 inode ? AFS_FS_I(inode) : NULL);
+				 IS_ERR_OR_NULL(inode) ? NULL
+				 : AFS_FS_I(inode));
 	}
 	return d;
 }
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
