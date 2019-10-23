Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BE4E1D6B
	for <lists+linux-afs@lfdr.de>; Wed, 23 Oct 2019 15:55:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/K64Mb4NDW58VqlBcGykhwQjUAmRMqREIrS5yJ/scFA=; b=FoNNrbG7CiFBtl
	Stw/6P2qnTra0uqLK1ri57Wg86f6LkUkFYWJFdIL9Lo+PJGrXo+Af4KFR0Zok7TjVC1I/l8GX90pc
	jQDjHEenbO6b3YukbbRz61oP147pQEBOR9hkFN2uHCLXkVGt2haf81oNcP+SZnG6TiNH/Psaj1b7r
	0gDYvKEayqHKqJTHeA09jaBA4CT6y9OZb6YNDOzjzTzwaD9zVXExjKIs8rYn08/O+INe8KKc7hrSt
	rdviFlTJUKCaDiC2bF8BAvGz9phxcKUNenGwaiJzNZ/fAlceXkCkR/Jf6M7HD6vBjSmUwYNFcWvb3
	bYuXxWVdmQjqiWAS2d3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNH6k-0001Lq-7b; Wed, 23 Oct 2019 13:55:26 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNH6h-0001Kd-K4
 for linux-afs@lists.infradead.org; Wed, 23 Oct 2019 13:55:25 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id DF8D6737947E4BB780F8;
 Wed, 23 Oct 2019 21:55:18 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Wed, 23 Oct 2019
 21:55:12 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <dhowells@redhat.com>
Subject: [PATCH -next] afs: remove set but not used variables 'before' and
 'after'
Date: Wed, 23 Oct 2019 21:55:06 +0800
Message-ID: <20191023135506.13924-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_065524_286932_80329563 
X-CRM114-Status: UNSURE (   7.26  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.191 listed in list.dnswl.org]
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
Cc: pmladek@suse.com, sergey.senozhatsky@gmail.com,
 YueHaibing <yuehaibing@huawei.com>, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

fs/afs/dir_edit.c:71:12: warning: variable before set but not used [-Wunused-but-set-variable]
fs/afs/dir_edit.c:71:20: warning: variable after set but not used [-Wunused-but-set-variable]
fs/afs/dir_edit.c:96:12: warning: variable before set but not used [-Wunused-but-set-variable]
fs/afs/dir_edit.c:96:20: warning: variable after set but not used [-Wunused-but-set-variable]

They are never used, so can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/afs/dir_edit.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

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
-- 
2.7.4



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
