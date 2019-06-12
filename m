Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B9C41C18
	for <lists+linux-afs@lfdr.de>; Wed, 12 Jun 2019 08:18:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=POPoBbVcH4gxHdRE1Mb5zZmP3QCd7lxtMfzzDdJDEUM=; b=DCQ
	RM1mKwu/cCyGu8I3vQ8N229O+rbbJwbwKkVgaEhH1F1cJUxFAv8coC/U+XSpPoIuswKGlTRvKx9Qg
	EWK0DfreRQZjo6PxOSxt5C9H6niQ5gJSv3Q0zHfvybE6uFgeUpA7pPmd3ztoOghk3gg14uWJEGxbs
	gTl+Q9rTnDibpoWCMmXB5V8UAojnGoyByegxafTBHCDYdtF0GHALHoWt/888UlSjCLD1iplG9A4IL
	+WsWgwXh8beP2ozGys+GzRwVESuEQ8O7vFWDtj9ExMKWQgPHNRve1wPY0NfK1c/XCAun1mrNC88gt
	Uotad+D9CoBGxkXH0D+uVrIVRYJzo3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hawaG-0004hS-Bg; Wed, 12 Jun 2019 06:18:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hawaE-0004hM-Sh
 for linux-afs@bombadil.infradead.org; Wed, 12 Jun 2019 06:18:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uzSW3C4nrlpVdn47FQcMuKOP27ogwmRJXeEXw0eAJDM=; b=KraNIHRSVNdbpsUhoYU3eQ6pF
 SDsgtXht4llLnYNc7xCu7Fc4yMy2s33NTLC93uqUI51AGOTA0bhQhTw+/WiwhRKtEFwW1sXK5FGDk
 mRQi/qrIx47LK4jyoM9IrbWoLl6LKPRU08uJQ+7+ZsiqMnTfGI6Kt/3kCbZdJb+ed1Sde/3z677IE
 bepbjKTsQgGHGC9Yhaq12IkZr3DDpW6hYbV0YE2YmAzXi63HJms7+o15llxWjAyaayv2joLSMuIuP
 UVu+E97CXbqlbZDb9Tv589bPBPEqTeeQtExcjv5z38TsIxZwmwp91tyaEPyJa6hSf3MkjSlvUDrmv
 B0jgx0dhg==;
Received: from smtpbg297.qq.com ([184.105.67.100] helo=smtpproxy21.qq.com)
 by casper.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hawa9-0006MM-1k
 for linux-afs@lists.infradead.org; Wed, 12 Jun 2019 06:18:04 +0000
X-QQ-mid: bizesmtp19t1560320243t5gkepwg
Received: from lzy-H3050.localdomain (unknown [218.76.23.26])
 by esmtp10.qq.com (ESMTP) with 
 id ; Wed, 12 Jun 2019 14:17:18 +0800 (CST)
X-QQ-SSF: 01400000000000H0ZG31000A0000000
X-QQ-FEAT: lm51M56XDGzBZCu1IDtEKDDpBxp6+lfqQbuv2BRQIrPth9zTcL3lpp6IY4DTY
 0QlMNubuWVl0wBMpK5KmMndNQYw9kJussD4bLhOD9ueUC0mJfR4e2QVZaf6UgUOlPG/rF9n
 CLV2lwN35inlqGYiKmSPyiSM48ZmLPJmKjHef+l5pb1xQQuEYNjSRQa7LlocE346hn0/A8j
 Yraj5J1LrqNqdSpXQ7hGo6vmiXG6DBdFc0DV2UtUMKMlwAeI2KtaO6ztqJmxn8cS6GM1j8u
 TCs9sUtpLeK/nC0vrqgQYg13WXo1Te6N9rCGbmBIMfAWQj6wEx9uN110wFpxwydgoKhbWM3
 Dmygoqnt+HqU/Wyjww=
X-QQ-GoodBg: 2
From: Zhengyuan Liu <liuzhengyuan@kylinos.cn>
To: dhowells@redhat.com
Subject: [PATCH 1/2] fs/afs: use struct_size() in kzalloc()
Date: Wed, 12 Jun 2019 14:17:17 +0800
Message-Id: <1560320237-14367-1-git-send-email-liuzhengyuan@kylinos.cn>
X-Mailer: git-send-email 2.7.4
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:kylinos.cn:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190612_071801_370995_2697B474 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on casper.infradead.org summary:
 Content analysis details:   (-0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [184.105.67.100 listed in list.dnswl.org]
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
Cc: linux-afs@lists.infradead.org, Zhengyuan Liu <liuzhengyuan@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

As Gustavo said in other patches doing the same replace, we can now
use the new struct_size() helper to avoid leaving these open-coded and
prone to type mistake.

Signed-off-by: Zhengyuan Liu <liuzhengyuan@kylinos.cn>
---
 fs/afs/dir.c   | 3 +--
 fs/afs/file.c  | 6 ++----
 fs/afs/write.c | 3 +--
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index da9563d..85c2420 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -238,8 +238,7 @@ static struct afs_read *afs_read_dir(struct afs_vnode *dvnode, struct key *key)
 	if (nr_inline > (PAGE_SIZE - sizeof(*req)) / sizeof(struct page *))
 		nr_inline = 0;
 
-	req = kzalloc(sizeof(*req) + sizeof(struct page *) * nr_inline,
-		      GFP_KERNEL);
+	req = kzalloc(struct_size(req, array, nr_inline), GFP_KERNEL);
 	if (!req)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/fs/afs/file.c b/fs/afs/file.c
index 8fd7d3b..56b6957 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -310,8 +310,7 @@ int afs_page_filler(void *data, struct page *page)
 		/* fall through */
 	default:
 	go_on:
-		req = kzalloc(sizeof(struct afs_read) + sizeof(struct page *),
-			      GFP_KERNEL);
+		req = kzalloc(struct_size(req, array, 1), GFP_KERNEL);
 		if (!req)
 			goto enomem;
 
@@ -461,8 +460,7 @@ static int afs_readpages_one(struct file *file, struct address_space *mapping,
 		n++;
 	}
 
-	req = kzalloc(sizeof(struct afs_read) + sizeof(struct page *) * n,
-		      GFP_NOFS);
+	req = kzalloc(struct_size(req, array, n), GFP_NOFS);
 	if (!req)
 		return -ENOMEM;
 
diff --git a/fs/afs/write.c b/fs/afs/write.c
index 98eb7ad..cb76566 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -44,8 +44,7 @@ static int afs_fill_page(struct afs_vnode *vnode, struct key *key,
 		return 0;
 	}
 
-	req = kzalloc(sizeof(struct afs_read) + sizeof(struct page *),
-		      GFP_KERNEL);
+	req = kzalloc(struct_size(req, array, 1), GFP_KERNEL);
 	if (!req)
 		return -ENOMEM;
 
-- 
2.7.4




_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
