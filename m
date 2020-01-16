Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA1113ED4D
	for <lists+linux-afs@lfdr.de>; Thu, 16 Jan 2020 19:02:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RU/9Mt2q6HKGhXCe1ksrXYNfv62QwL83WIEixZ7DLcA=; b=o7QaqevPrvSPQz
	JiAuGm7wysVu5P4e71us4koameILLnOcWE803H1/GtX3/dsCVVoEnvaj12WtZeWuse1QS4sI3qOo2
	sjlAQ82/5hS1n+S5CWhTuwYMxG2pSYGXZaHHUyWkxTdA6lPsl3nOf0LjHzYzY3EmRcsObQ1N3pqwA
	ZDNdWbvuH2BmLXDGpUK4zpNsOFf25spzyq6pH6VmengyozWUM8sTd8SMrwE5S7dE8EFarm2pJ7cUv
	gLej3eLwOrmexByFeR08Wpo2s2pHCF2VZFVS603NG3bwny8YlhVjJ+ASvF+/niK/eortLdvAfpV8U
	Y2ap+HBAj9kdZAaxPqFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is9Sz-0007Gh-BW; Thu, 16 Jan 2020 18:02:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is8v3-0004WR-Bn
 for linux-afs@lists.infradead.org; Thu, 16 Jan 2020 17:27:03 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 244FA246C8;
 Thu, 16 Jan 2020 17:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579195616;
 bh=mHu7FcEcH7ZTqsu4AfsnGL48Fe7PrHeLWBDhrp1hE4s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c9ve+a8GcQcMxsTJ9NUJASM9OE4EUwX5ipK0z2tS64mcrHxuPACc1CKBGp4uBJKOs
 wui7F0JZQ2Yb6k+Sak18AE/t9lPYCckS1N3tr4Y+t1WZIwrQsu9VeK56lDO35B2+L2
 SMFgi6pN/+K/DmQ7yUiWyhJrduxjVhVKjuB2JNmo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 189/371] afs: Fix the afs.cell and afs.volume
 xattr handlers
Date: Thu, 16 Jan 2020 12:21:01 -0500
Message-Id: <20200116172403.18149-132-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116172403.18149-1-sashal@kernel.org>
References: <20200116172403.18149-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_092657_542585_A19DBC46 
X-CRM114-Status: GOOD (  10.51  )
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

[ Upstream commit c73aa4102f5b9f261a907c3b3df94cd2c478504d ]

Fix the ->get handlers for the afs.cell and afs.volume xattrs to pass the
source data size to memcpy() rather than target buffer size.

Overcopying the source data occasionally causes the kernel to oops.

Fixes: d3e3b7eac886 ("afs: Add metadata xattrs")
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/afs/xattr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/afs/xattr.c b/fs/afs/xattr.c
index 2830e4f48d85..7c6b62a94e7e 100644
--- a/fs/afs/xattr.c
+++ b/fs/afs/xattr.c
@@ -50,7 +50,7 @@ static int afs_xattr_get_cell(const struct xattr_handler *handler,
 		return namelen;
 	if (namelen > size)
 		return -ERANGE;
-	memcpy(buffer, cell->name, size);
+	memcpy(buffer, cell->name, namelen);
 	return namelen;
 }
 
@@ -104,7 +104,7 @@ static int afs_xattr_get_volume(const struct xattr_handler *handler,
 		return namelen;
 	if (namelen > size)
 		return -ERANGE;
-	memcpy(buffer, volname, size);
+	memcpy(buffer, volname, namelen);
 	return namelen;
 }
 
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
