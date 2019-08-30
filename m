Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DFCA2C73
	for <lists+linux-afs@lfdr.de>; Fri, 30 Aug 2019 03:40:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nV6MlGXCCGZiKblHn+Lgda81R6p4r8OZnXixhfj1qqE=; b=t/vj45ZOnltiKr
	BwHBF9ifoRLq8nJ6bMp2t88ml769hAgDFZ7Ar83IhO2j6xRRMOtmm8KaHMEzwOrB+7JiwJO3oWHlA
	JkDXdfVjRaxpmy7U+fokJKry/Kl9OXBqCssmrP37tcmh56+amC+JGi052XIwW0Z5kTF7fqQrJKRY5
	lfv+Ux7ejcQpeEU0zLn0sI7Xt/4Mfvg3Asld802SrOUrPCSr+7grkvNIktOeP81/3KHa3tzcnvYO5
	L+APb9P9FpW+lBNMZ9TbLMwrXTr1MIWlmPqFhiqjLlfwWyk4f86hqSD+p8rxoE/0EmDjQryex68PM
	V/fnsdId6mZCFDiwLKbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3Vts-0004OL-VU; Fri, 30 Aug 2019 01:40:29 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3Vtn-0004MA-0N
 for linux-afs@lists.infradead.org; Fri, 30 Aug 2019 01:40:25 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C7E09EF464446FC75463;
 Fri, 30 Aug 2019 09:40:11 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Fri, 30 Aug 2019
 09:40:03 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <dhowells@redhat.com>, <linux-afs@lists.infradead.org>
Subject: [PATCH 2/2] afs: remove unused variables 'before','after'
Date: Fri, 30 Aug 2019 09:46:45 +0800
Message-ID: <1567129605-142022-3-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567129605-142022-1-git-send-email-zhengbin13@huawei.com>
References: <1567129605-142022-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_184023_207052_7201B79D 
X-CRM114-Status: UNSURE (   7.67  )
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Fixes gcc '-Wunused-but-set-variable' warning:

fs/afs/dir_edit.c: In function afs_set_contig_bits:
fs/afs/dir_edit.c:75:20: warning: variable after set but not used [-Wunused-but-set-variable]
fs/afs/dir_edit.c: In function afs_set_contig_bits:
fs/afs/dir_edit.c:75:12: warning: variable before set but not used [-Wunused-but-set-variable]
fs/afs/dir_edit.c: In function afs_clear_contig_bits:
fs/afs/dir_edit.c:100:20: warning: variable after set but not used [-Wunused-but-set-variable]
fs/afs/dir_edit.c: In function afs_clear_contig_bits:
fs/afs/dir_edit.c:100:12: warning: variable before set but not used [-Wunused-but-set-variable]

Fixes: 63a4681ff39c ("afs: Locally edit directory data for mkdir/create/unlink/...")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
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
