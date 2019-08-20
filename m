Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id ED94F961A8
	for <lists+linux-afs@lfdr.de>; Tue, 20 Aug 2019 15:54:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O9OhI7tR04WtlbtItv0iX9fGhUn0Y82YPslil4zMK+I=; b=THZTN7htpYw1rt
	VBh5nyE14dO5vF218DJYRRmx3qppmNTHAEIM9dDABYfVsR2erM9P21wfFQbsexZTx9mLgnkTBgtr7
	Tv5qPd0nShbbdHKz8AKIcKC1kxRqwd/ewV7akeztf+5ci1D8KrhxnfXROaVPq2Zpw5FFzOdjYyosC
	O1TXlD0wW0YdORTKpcS8ZUis09bUkpvbJZwhPjEiNWS6pkZ9dGElpRjHypfV7oH6Q2Ws72k1DbEL8
	qMLTPyNI0kZfGwn86eqpxFsheHc45N6Zd9ZoNs7eezX5P/MWmiFK8iPXzeLKEeDuuwGOjz33DMn/C
	m6A24t8K5+1m1a74QUJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i04aq-00010g-BQ; Tue, 20 Aug 2019 13:54:36 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i04am-0000zt-Rk
 for linux-afs@lists.infradead.org; Tue, 20 Aug 2019 13:54:34 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2652498BCF12A9E50356;
 Tue, 20 Aug 2019 21:54:23 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Tue, 20 Aug 2019
 21:54:14 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <dhowells@redhat.com>, <linux-afs@lists.infradead.org>
Subject: [PATCH] afs: remove unused variable
Date: Tue, 20 Aug 2019 22:00:45 +0800
Message-ID: <1566309645-67287-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_065433_067620_A5655327 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.32 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
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
Cc: zhengbin13@huawei.com, yi.zhang@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

In afs_set_contig_bits & afs_clear_contig_bits, variable before & after
set but not used, remove it.
In afs_install_server, variable ret set but not used, remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 fs/afs/dir_edit.c | 12 ++----------
 fs/afs/server.c   |  3 +--
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/fs/afs/dir_edit.c b/fs/afs/dir_edit.c
index d4fbe5f..b108528 100644
--- a/fs/afs/dir_edit.c
+++ b/fs/afs/dir_edit.c
@@ -68,13 +68,11 @@ static int afs_find_contig_bits(union afs_xdr_dir_block *block, unsigned int nr_
 static void afs_set_contig_bits(union afs_xdr_dir_block *block,
 				int bit, unsigned int nr_slots)
 {
-	u64 mask, before, after;
+	u64 mask;

 	mask = (1 << nr_slots) - 1;
 	mask <<= bit;

-	before = *(u64 *)block->hdr.bitmap;
-
 	block->hdr.bitmap[0] |= (u8)(mask >> 0 * 8);
 	block->hdr.bitmap[1] |= (u8)(mask >> 1 * 8);
 	block->hdr.bitmap[2] |= (u8)(mask >> 2 * 8);
@@ -83,8 +81,6 @@ static void afs_set_contig_bits(union afs_xdr_dir_block *block,
 	block->hdr.bitmap[5] |= (u8)(mask >> 5 * 8);
 	block->hdr.bitmap[6] |= (u8)(mask >> 6 * 8);
 	block->hdr.bitmap[7] |= (u8)(mask >> 7 * 8);
-
-	after = *(u64 *)block->hdr.bitmap;
 }

 /*
@@ -93,13 +89,11 @@ static void afs_set_contig_bits(union afs_xdr_dir_block *block,
 static void afs_clear_contig_bits(union afs_xdr_dir_block *block,
 				  int bit, unsigned int nr_slots)
 {
-	u64 mask, before, after;
+	u64 mask;

 	mask = (1 << nr_slots) - 1;
 	mask <<= bit;

-	before = *(u64 *)block->hdr.bitmap;
-
 	block->hdr.bitmap[0] &= ~(u8)(mask >> 0 * 8);
 	block->hdr.bitmap[1] &= ~(u8)(mask >> 1 * 8);
 	block->hdr.bitmap[2] &= ~(u8)(mask >> 2 * 8);
@@ -108,8 +102,6 @@ static void afs_clear_contig_bits(union afs_xdr_dir_block *block,
 	block->hdr.bitmap[5] &= ~(u8)(mask >> 5 * 8);
 	block->hdr.bitmap[6] &= ~(u8)(mask >> 6 * 8);
 	block->hdr.bitmap[7] &= ~(u8)(mask >> 7 * 8);
-
-	after = *(u64 *)block->hdr.bitmap;
 }

 /*
diff --git a/fs/afs/server.c b/fs/afs/server.c
index 64d440a..1686bf1 100644
--- a/fs/afs/server.c
+++ b/fs/afs/server.c
@@ -151,7 +151,7 @@ static struct afs_server *afs_install_server(struct afs_net *net,
 	const struct afs_addr_list *alist;
 	struct afs_server *server;
 	struct rb_node **pp, *p;
-	int ret = -EEXIST, diff;
+	int diff;

 	_enter("%p", candidate);

@@ -196,7 +196,6 @@ static struct afs_server *afs_install_server(struct afs_net *net,
 		hlist_add_head_rcu(&server->addr6_link, &net->fs_addresses6);

 	write_sequnlock(&net->fs_addr_lock);
-	ret = 0;

 exists:
 	afs_get_server(server, afs_server_trace_get_install);
--
2.7.4


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
