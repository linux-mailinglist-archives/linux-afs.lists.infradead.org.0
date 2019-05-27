Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B669A2B93E
	for <lists+linux-afs@lfdr.de>; Mon, 27 May 2019 18:54:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LwHtb73ewaxTKncugPZmrCr14o3ic/jbixvzDG4oemM=; b=HnWPbqhoeWHMSE
	8tm2q1F3GnugX9gYgGpqh4F4BalMFTtK1yaj5ZuGhEumogGUXZMTc5IOTk1S2aTkLq3T21jpmIvg9
	t/44kdVb97noxwiwbBV2hJq8jX2Rdvnb2Lxn28INoaH21wi/WO76RoDSJOsui6IhozpE68BB5EEsF
	4dtzOeaDtHeRTsXc+h9FwUgNpJP89EhH6h2sox4sFFVP6aCBGQaRxvoDPH17xrGsFGJmxJFpg6XmO
	3hgH6S7mvwznGxA2OC5Sc/V2Th5erRo8AF0ESY1REVgscC63MRWW35nQ2SoCa0Hx5LKq4Vvb8UQCe
	4QiVBL7lp38ySHBB43RQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVItL-0007QW-Jj; Mon, 27 May 2019 16:54:31 +0000
Received: from gateway34.websitewelcome.com ([192.185.148.119])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVItI-0007PJ-2H
 for linux-afs@lists.infradead.org; Mon, 27 May 2019 16:54:29 +0000
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway34.websitewelcome.com (Postfix) with ESMTP id 9966716E10
 for <linux-afs@lists.infradead.org>; Mon, 27 May 2019 11:54:15 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id VIt5hlHbBYTGMVIt5hl6tZ; Mon, 27 May 2019 11:54:15 -0500
X-Authority-Reason: nr=8
Received: from [189.250.47.159] (port=34508 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hVIt4-002E4y-E6; Mon, 27 May 2019 11:54:14 -0500
Date: Mon, 27 May 2019 11:54:13 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: David Howells <dhowells@redhat.com>
Subject: [PATCH] afs: Fix logically dead code in afs_update_cell
Message-ID: <20190527165413.GA26714@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.47.159
X-Source-L: No
X-Exim-ID: 1hVIt4-002E4y-E6
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.47.159]:34508
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 11
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_095428_151272_B111CC8C 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [192.185.148.119 listed in list.dnswl.org]
 0.0 T_SPF_PERMERROR        SPF: test of record failed (permerror)
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
X-BeenThere: linux-afs@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Fix logically dead code in switch statement.

Notice that *ret* is updated with -ENOMEM before the switch statement
at 395:

395                 switch (ret) {
396                 case -ENODATA:
397                 case -EDESTADDRREQ:
398                         vllist->status = DNS_LOOKUP_GOT_NOT_FOUND;
399                         break;
400                 case -EAGAIN:
401                 case -ECONNREFUSED:
402                         vllist->status = DNS_LOOKUP_GOT_TEMP_FAILURE;
403                         break;
404                 default:
405                         vllist->status = DNS_LOOKUP_GOT_LOCAL_FAILURE;
406                         break;
407                 }

hence, the code in the switch (except for the default case) makes
no sense and is logically dead.

Fix this by removing the *ret* assignment at 390:

390	ret = -ENOMEM;

which is apparently wrong.

Addresses-Coverity-ID: 1445439 ("Logically dead code")
Fixes: d5c32c89b208 ("afs: Fix cell DNS lookup")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 fs/afs/cell.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/afs/cell.c b/fs/afs/cell.c
index 9c3b07ba2222..980de60bf060 100644
--- a/fs/afs/cell.c
+++ b/fs/afs/cell.c
@@ -387,7 +387,6 @@ static int afs_update_cell(struct afs_cell *cell)
 		if (ret == -ENOMEM)
 			goto out_wake;
 
-		ret = -ENOMEM;
 		vllist = afs_alloc_vlserver_list(0);
 		if (!vllist)
 			goto out_wake;
-- 
2.21.0


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
