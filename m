Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C511A3536
	for <lists+linux-afs@lfdr.de>; Fri, 30 Aug 2019 12:49:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4xEYlJv3MhGN0++Oq3zuyIXGdzP5KDeJMrc1kiLfZYw=; b=i6b8gZ1lnQ0K7F
	OCopLq37+ZADTn2COAdYo6FTNawtkFlWWb5Cyavx2rDElEnpE930BY4aJSiTuBgwXkS/jNgAUiLKd
	RcakDtaW/38wJPeMRFUk/6zQ9JTOEtVP//zG55TWrejXiFv4+Y6IVW0qTwCh+xrkpzz+fs8VR3qs8
	Q7bTIHEtZvlq/SL4CwHlEIlMM557TNI2kl746ER554elfXET/69GBBIBzI1NT2O2z243f+MiUzsNO
	jODIgld2sWwnhm/0MsK2sJ8hsrz4xmbDYfVnf7BJxfx5gifyEQnt8BPd31pV7HiZUSL8ypyr+vazC
	C2ZsfLUN22boZ2qU9Evg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3eT1-00049v-UL; Fri, 30 Aug 2019 10:49:19 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3eSz-00049T-2m
 for linux-afs@lists.infradead.org; Fri, 30 Aug 2019 10:49:18 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1i3eSv-0008Tr-6K; Fri, 30 Aug 2019 10:49:13 +0000
From: Colin King <colin.king@canonical.com>
To: David Howells <dhowells@redhat.com>,
	linux-afs@lists.infradead.org
Subject: [PATCH] afs: use BIT_ULL for shifting to fix integer overflow
Date: Fri, 30 Aug 2019 11:49:12 +0100
Message-Id: <20190830104912.1090-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190830_034917_255722_1B88C502 
X-CRM114-Status: GOOD (  10.11  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [91.189.89.112 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

The expression 1 << nr_slots is evaluated with 32 bit integer arithmetic
and can overflow before it is widened. Instead, use BIT_ULL to avoid
overflow.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: 63a4681ff39c ("afs: Locally edit directory data for mkdir/create/unlink/...")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/afs/dir_edit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/afs/dir_edit.c b/fs/afs/dir_edit.c
index d4fbe5f85f1b..f360119923aa 100644
--- a/fs/afs/dir_edit.c
+++ b/fs/afs/dir_edit.c
@@ -36,7 +36,7 @@ static int afs_find_contig_bits(union afs_xdr_dir_block *block, unsigned int nr_
 	bitmap |= (u64)block->hdr.bitmap[7] << 7 * 8;
 	bitmap >>= 1; /* The first entry is metadata */
 	bit = 1;
-	mask = (1 << nr_slots) - 1;
+	mask = BIT_ULL(nr_slots) - 1;
 
 	do {
 		if (sizeof(unsigned long) == 8)
@@ -70,7 +70,7 @@ static void afs_set_contig_bits(union afs_xdr_dir_block *block,
 {
 	u64 mask, before, after;
 
-	mask = (1 << nr_slots) - 1;
+	mask = BIT_ULL(nr_slots) - 1;
 	mask <<= bit;
 
 	before = *(u64 *)block->hdr.bitmap;
@@ -95,7 +95,7 @@ static void afs_clear_contig_bits(union afs_xdr_dir_block *block,
 {
 	u64 mask, before, after;
 
-	mask = (1 << nr_slots) - 1;
+	mask = BIT_ULL(nr_slots) - 1;
 	mask <<= bit;
 
 	before = *(u64 *)block->hdr.bitmap;
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
