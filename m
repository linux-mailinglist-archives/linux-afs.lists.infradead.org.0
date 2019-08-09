Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E1387468
	for <lists+linux-afs@lfdr.de>; Fri,  9 Aug 2019 10:41:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4fTNVk/xmCBlvxqU5ZD3o4B7oozaB0+/Nsdlwv0+jrg=; b=qO2XEYFsgK+w0s
	YKSZ0EPFvxDynPzY9Oo2oLoZ3jYYwLBUW+uxJQJhcRycXQXIMTpY3H72YrZXZ1RL53DpIGs+i1n1l
	FhIHIHEJf4uHqoYS2EvuxqJzzDFw2xRqMqZ2UoXa6hAkx6qCZ6lTOPLkYjLuDh7YvO+iEpZ1C7kBC
	jO/a2FOsMvbyEuUyZTrWkTiC8NdnYFufe0OPIHi4LOfJnGRbiN5rO7VjAe4ewDa9iYXNYNT0IE8ld
	SWg+HzbFMxMpWqpMhhD+QJQ5tCFl6MX6vK2JYHWnb1z0JLT2J5T/GmdBUcP1yzMXw+O+/5bEV6hsl
	1TzrqYrQymbsXZ0QoS3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hw0SM-0001Yh-M3; Fri, 09 Aug 2019 08:41:02 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw0SI-0001Xq-LH
 for linux-afs@lists.infradead.org; Fri, 09 Aug 2019 08:41:01 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 4B0C2AD66DF0B8DD3D71;
 Fri,  9 Aug 2019 16:40:51 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Fri, 9 Aug 2019
 16:40:41 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <dhowells@redhat.com>
Subject: [PATCH -next] afs: remove unused variable 'afs_voltypes'
Date: Fri, 9 Aug 2019 16:40:37 +0800
Message-ID: <20190809084037.68784-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190809_014058_862144_B7FBCE0F 
X-CRM114-Status: UNSURE (   6.45  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.32 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

fs/afs/volume.c:15:26: warning:
 afs_voltypes defined but not used [-Wunused-const-variable=]

It is not used since commit d2ddc776a458 ("afs: Overhaul
volume and server record caching and fileserver rotation")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/afs/volume.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/afs/volume.c b/fs/afs/volume.c
index 1a41430..92ca5e2 100644
--- a/fs/afs/volume.c
+++ b/fs/afs/volume.c
@@ -12,8 +12,6 @@
 unsigned __read_mostly afs_volume_gc_delay = 10;
 unsigned __read_mostly afs_volume_record_life = 60 * 60;
 
-static const char *const afs_voltypes[] = { "R/W", "R/O", "BAK" };
-
 /*
  * Allocate a volume record and load it up from a vldb record.
  */
-- 
2.7.4



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
