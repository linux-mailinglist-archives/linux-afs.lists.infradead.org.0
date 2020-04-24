Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 678F71B73CB
	for <lists+linux-afs@lfdr.de>; Fri, 24 Apr 2020 14:22:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bDORujp19jR2MHsFWjlcA4KDXBT191ZMkvIVBTDLG64=; b=MqE/L/bgFKuBkL
	GCPK9GHa8550GuLFY+RrCLoSSLArXAEMgjcOPh1aj762KKeW29+Jk72vr0v2ypy45azLe/1hiDhEZ
	ENAJYWRVioRUwGn2kM9EBO+P8+wBcwCcMpHeDsIOYzFFReHBn/5SYsyuLuuapcw1q0dcBEq0ig5mQ
	nB1/Yyh6j4dCKII4OsdnJEJ+HBk7LkSxF/bnylQE+y4S7E6X2x8rm2w4swlXQKfLQSAKuJ8iDoTHA
	UGCX4Rwiav/CuoiFFYj2npIKqkADKxvtSz30rBLSP0yMCbriFmYSRQjfO6yYXqFy7e0D4tPgSIIsG
	1n9X0Rth3mkyfWyqe1Vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRxM1-0004WE-0f
	for lists+linux-afs@lfdr.de; Fri, 24 Apr 2020 12:22:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRxLy-0004V6-De
 for linux-afs@lists.infradead.org; Fri, 24 Apr 2020 12:22:47 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA27E20776;
 Fri, 24 Apr 2020 12:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587730965;
 bh=d9R2OtnCbzy2kZlftOg/kItqCRyQPnSNX2spNt3uGCI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MqJ0s99ZS279dLxcwdms5uvcXgUfu4GJPPgBfkymBsFQYgt8j2qrEOOP7hNC+92H9
 SEj9++lzEgaHUhojmgeS1IJoGNaA1k72bfk5cFacVB4/OnTwM4wF04OZiE485vIvO0
 7b0ziFaYt1OpJ5ktteVpiOJacRuFtGQ2xGNgQaMU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 07/38] afs: Fix length of dump of bad
 YFSFetchStatus record
Date: Fri, 24 Apr 2020 08:22:05 -0400
Message-Id: <20200424122237.9831-7-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424122237.9831-1-sashal@kernel.org>
References: <20200424122237.9831-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_052246_481276_7287EED8 
X-CRM114-Status: GOOD (  10.97  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
Cc: David Howells <dhowells@redhat.com>, Sasha Levin <sashal@kernel.org>,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit 3efe55b09a92a59ed8214db801683cf13c9742c4 ]

Fix the length of the dump of a bad YFSFetchStatus record.  The function
was copied from the AFS version, but the YFS variant contains bigger fields
and extra information, so expand the dump to match.

Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/afs/yfsclient.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index 83b6d67325f6c..b5b45c57e1b1d 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -165,15 +165,15 @@ static void xdr_dump_bad(const __be32 *bp)
 	int i;
 
 	pr_notice("YFS XDR: Bad status record\n");
-	for (i = 0; i < 5 * 4 * 4; i += 16) {
+	for (i = 0; i < 6 * 4 * 4; i += 16) {
 		memcpy(x, bp, 16);
 		bp += 4;
 		pr_notice("%03x: %08x %08x %08x %08x\n",
 			  i, ntohl(x[0]), ntohl(x[1]), ntohl(x[2]), ntohl(x[3]));
 	}
 
-	memcpy(x, bp, 4);
-	pr_notice("0x50: %08x\n", ntohl(x[0]));
+	memcpy(x, bp, 8);
+	pr_notice("0x60: %08x %08x\n", ntohl(x[0]), ntohl(x[1]));
 }
 
 /*
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
