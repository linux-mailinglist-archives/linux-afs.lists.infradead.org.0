Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BF34C34D43
	for <lists+linux-afs@lfdr.de>; Tue,  4 Jun 2019 18:29:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+OvQjoQ+ZTvX2Fb1c4ToSsZCttsfP3njqom9/YKav74=; b=DQJpX+u913clVc
	MCTTV8Ta1cOmT63NwzmRGgKuXSItUUHSczfrXAvswh+QdBBS2eyWFRMmS6D5V+R4uJpDtkFnlUQVV
	H0Gq1rCRf78xlUmdd6FG76YhSUhZmc6vZe+zPXCYnygpWuvTqOR81e7AA4EcHvcdG0MXlXmY8aEVu
	VUP4vK/EnPqq9rxcnAc3q41VRsmwsJgxf25Oc4bIrJiOAPjtt65lsK8VkAf1IXxJ7DM6N4NKjhm+0
	y4cfvCFGhmIIxZ/zJ9UPbQJeeGf4Km6o6Vok7jZnlGRArXNgAvI43nflAd6a3wyZfLqdcAXpzSKrW
	jADSLMR67AhWXIQ1XyRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYCJh-00055I-NS; Tue, 04 Jun 2019 16:29:41 +0000
Received: from gateway21.websitewelcome.com ([192.185.45.159])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYCJf-00054d-6o
 for linux-afs@lists.infradead.org; Tue, 04 Jun 2019 16:29:40 +0000
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway21.websitewelcome.com (Postfix) with ESMTP id 3880A400D929D
 for <linux-afs@lists.infradead.org>; Tue,  4 Jun 2019 11:29:36 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id YCJchKimj2PzOYCJchfMPg; Tue, 04 Jun 2019 11:29:36 -0500
X-Authority-Reason: nr=8
Received: from [189.250.127.120] (port=39294 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hYCJb-001PBz-5g; Tue, 04 Jun 2019 11:29:35 -0500
Date: Tue, 4 Jun 2019 11:29:28 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: David Howells <dhowells@redhat.com>
Subject: [PATCH] afs: security: Use struct_size() in kzalloc()
Message-ID: <20190604162928.GA12389@embeddedor>
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
X-Source-IP: 189.250.127.120
X-Source-L: No
X-Exim-ID: 1hYCJb-001PBz-5g
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.127.120]:39294
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190604_092939_309013_232B6206 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [192.185.45.159 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 T_SPF_PERMERROR        SPF: test of record failed (permerror)
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

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array. For example:

struct foo {
   int stuff;
   struct boo entry[];
};

instance = kzalloc(sizeof(struct foo) + count * sizeof(struct boo), GFP_KERNEL);

Instead of leaving these open-coded and prone to type mistakes, we can
now use the new struct_size() helper:

instance = kzalloc(struct_size(instance, entry, count), GFP_KERNEL);

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 fs/afs/security.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/afs/security.c b/fs/afs/security.c
index 71e71c07568f..82753f3c097f 100644
--- a/fs/afs/security.c
+++ b/fs/afs/security.c
@@ -191,8 +191,7 @@ void afs_cache_permit(struct afs_vnode *vnode, struct key *key,
 	 * yet.
 	 */
 	size++;
-	new = kzalloc(sizeof(struct afs_permits) +
-		      sizeof(struct afs_permit) * size, GFP_NOFS);
+	new = kzalloc(struct_size(new, permits, size), GFP_NOFS);
 	if (!new)
 		goto out_put;
 
-- 
2.21.0


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
