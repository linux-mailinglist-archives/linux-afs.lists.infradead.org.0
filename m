Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D8C9605A
	for <lists+linux-afs@lfdr.de>; Tue, 20 Aug 2019 15:41:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xFq2uHScHFChtMZPCHJ7hqd7rjN9Ub32gMBsHbqej64=; b=eHTSKEu/EKJvlx
	LKRzVvH1PpzqpYOGMrFt0wnTPwBhtky1faaNqWWy/o0bFonXo+h06RHPDFwfqa/JCO5NaIWtDImpJ
	qlwU1EEozdIoZIaSsRiciySzwnWFVcgMYt6bIt2j55fOn3K5cJDz4hO+eKIKTM4rS6SSM0vWF1pr4
	tANyLrSNBWvV40Cu2PiS1oBu8kKVouA/BZviwzvWBwKC0sD/CfoUW9FwXbIAwRhC37a20Fpq6Aw12
	d+nq73g+SK6N6ootIzbKiZk5B3fA2CaExOEz9IKjcMVXbnRgweCltJNebXQk0fVl3vXbb0udhnqEv
	9X7alWGiZoJ6yKvkQJVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i04Nt-00036Q-Dh; Tue, 20 Aug 2019 13:41:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i04NF-0002hP-LE
 for linux-afs@lists.infradead.org; Tue, 20 Aug 2019 13:40:37 +0000
Received: from sasha-vm.mshome.net (unknown [12.236.144.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6938E22DD6;
 Tue, 20 Aug 2019 13:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566308433;
 bh=OgpBk28+OrnHvqPeqzMYl2oZPOYiCQY87GIAvglBGk8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HYToLJxMYU/ARhFt7MMADO7EDBfxUSojHPJK14U3CcjXq77EwHgmYn+GEYwKnEpa1
 YvL30qJBXJ8TYarB96IzTZ047qvZ4vIHGcSg0vIqDMdhBz864eobkxTTzZnNaXYJbU
 Cj764B9NKU7XZDRvaEpDi2nkO7OAZB+JRXr0yy0c=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 04/44] afs: Fix loop index mixup in
 afs_deliver_vl_get_entry_by_name_u()
Date: Tue, 20 Aug 2019 09:39:48 -0400
Message-Id: <20190820134028.10829-4-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190820134028.10829-1-sashal@kernel.org>
References: <20190820134028.10829-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_064033_783339_CF3D66FE 
X-CRM114-Status: GOOD (  12.55  )
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
Cc: Marc Dionne <marc.dionne@auristor.com>, David Howells <dhowells@redhat.com>,
 linux-afs@lists.infradead.org, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: Marc Dionne <marc.dionne@auristor.com>

[ Upstream commit 4a46fdba449a5cd890271df5a9e23927d519ed00 ]

afs_deliver_vl_get_entry_by_name_u() scans through the vl entry
received from the volume location server and builds a return list
containing the sites that are currently valid.  When assigning
values for the return list, the index into the vl entry (i) is used
rather than the one for the new list (entry->nr_server).  If all
sites are usable, this works out fine as the indices will match.
If some sites are not valid, for example if AFS_VLSF_DONTUSE is
set, fs_mask and the uuid will be set for the wrong return site.

Fix this by using entry->nr_server as the index into the arrays
being filled in rather than i.

This can lead to EDESTADDRREQ errors if none of the returned sites
have a valid fs_mask.

Fixes: d2ddc776a458 ("afs: Overhaul volume and server record caching and fileserver rotation")
Signed-off-by: Marc Dionne <marc.dionne@auristor.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeffrey Altman <jaltman@auristor.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/afs/vlclient.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/afs/vlclient.c b/fs/afs/vlclient.c
index d7e0fd3c00df9..cfb0ac4bd039e 100644
--- a/fs/afs/vlclient.c
+++ b/fs/afs/vlclient.c
@@ -56,23 +56,24 @@ static int afs_deliver_vl_get_entry_by_name_u(struct afs_call *call)
 		struct afs_uuid__xdr *xdr;
 		struct afs_uuid *uuid;
 		int j;
+		int n = entry->nr_servers;
 
 		tmp = ntohl(uvldb->serverFlags[i]);
 		if (tmp & AFS_VLSF_DONTUSE ||
 		    (new_only && !(tmp & AFS_VLSF_NEWREPSITE)))
 			continue;
 		if (tmp & AFS_VLSF_RWVOL) {
-			entry->fs_mask[i] |= AFS_VOL_VTM_RW;
+			entry->fs_mask[n] |= AFS_VOL_VTM_RW;
 			if (vlflags & AFS_VLF_BACKEXISTS)
-				entry->fs_mask[i] |= AFS_VOL_VTM_BAK;
+				entry->fs_mask[n] |= AFS_VOL_VTM_BAK;
 		}
 		if (tmp & AFS_VLSF_ROVOL)
-			entry->fs_mask[i] |= AFS_VOL_VTM_RO;
-		if (!entry->fs_mask[i])
+			entry->fs_mask[n] |= AFS_VOL_VTM_RO;
+		if (!entry->fs_mask[n])
 			continue;
 
 		xdr = &uvldb->serverNumber[i];
-		uuid = (struct afs_uuid *)&entry->fs_server[i];
+		uuid = (struct afs_uuid *)&entry->fs_server[n];
 		uuid->time_low			= xdr->time_low;
 		uuid->time_mid			= htons(ntohl(xdr->time_mid));
 		uuid->time_hi_and_version	= htons(ntohl(xdr->time_hi_and_version));
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
