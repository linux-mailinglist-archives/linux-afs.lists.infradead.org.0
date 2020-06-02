Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7C21EBF19
	for <lists+linux-afs@lfdr.de>; Tue,  2 Jun 2020 17:35:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MK4iaAxOYZbm+huvkMc2/vup0OeMubY3tKjizmmXb+Q=; b=Oe9z8+ysEXOKmU
	JLGBsIgeItMYPMTT3C4aI4jUoEj3nAGM8dU1DNLidx9rMB1gseQagy2XrJlzL8DtUj09DTXufdxY4
	LqYbyIClSZSQIBwnX0sLkO83+NSM+McuI0RQIBt2SA6L7WV7SKnYzSed9PYOBshy4sdC8y4asB+ql
	UwubOx12RgGr7Ext8qUjlLa5D5C+R20DAFR/CJKgPWLeZ6Ys1rul5+TlXLY5/LT4mBBrqp+gwZ3hW
	GQagZMNFGKkfdZEGgA2JucFjv6yrmgMxhBXQBS65QaiLb7aB/N7H7lNaFpXON5wq93Md/i/pa8LR7
	GAPFABHjj4nYvaJ5W4tw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg8wb-0005y8-BX; Tue, 02 Jun 2020 15:35:13 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg8wX-0004mm-ST
 for linux-afs@lists.infradead.org; Tue, 02 Jun 2020 15:35:11 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1jg8wU-0004wo-Ar; Tue, 02 Jun 2020 15:35:06 +0000
From: Colin King <colin.king@canonical.com>
To: David Howells <dhowells@redhat.com>, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH][next] afs: fix double kfree on cell_name on error exit path
Date: Tue,  2 Jun 2020 16:35:05 +0100
Message-Id: <20200602153505.64714-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_083510_071063_5DCCBB61 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [91.189.89.112 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [91.189.89.112 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
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
Cc: kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

The error exit path is currently kfree'ing cell_name for a second time,
the previous kfree of this object occurred a statement earlier. Fix this
by removing it.

Addresses-Coverity: ("Double free")
Fixes: 6147fe6b7f8c ("afs: Detect cell aliases 3 - YFS Cells with a canonical cell name op")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/afs/vl_alias.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/afs/vl_alias.c b/fs/afs/vl_alias.c
index 6c1cf702478e..093895c49c21 100644
--- a/fs/afs/vl_alias.c
+++ b/fs/afs/vl_alias.c
@@ -315,10 +315,8 @@ static int yfs_check_canonical_cell_name(struct afs_cell *cell, struct key *key)
 	master = afs_lookup_cell(cell->net, cell_name, strlen(cell_name),
 				 NULL, false);
 	kfree(cell_name);
-	if (IS_ERR(master)) {
-		kfree(cell_name);
+	if (IS_ERR(master))
 		return PTR_ERR(master);
-	}
 
 	cell->alias_of = master; /* Transfer our ref */
 	return 1;
-- 
2.25.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
