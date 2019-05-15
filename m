Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DC02F1F87D
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 18:26:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BW/jl5wwPY7Ktkf8Eyg/Xi/V4Pz3CBj5rto2QatUJ8s=; b=D4EvQvtnIgWv+1
	WNYNiUnPXWHxfW26jHTfpY0kcBWK7b2+0s+LRdNC9FAEwYjFetN57v+SN56sho8FEAOM4YMNTTTRj
	Lp45oRCJMW02Uk3YmGYv9N+7DuHLbIqvnG0WZDM5qKnVwifk/ESUc2zKrgFBYXaUOjxtBvipjnKuR
	zCXVfQjXmDA5prXGh8tRQ6+npy8NBUXT61w65qndF5s6Qya1CqcSyg/qm20aMrxWqM01kLaSG3tXl
	3At+EpsxzElb72FGZUvAFQGu6kSJ1qLIfWoQ3vfuFSOZKnjjmZDt8VX3C/+UGxnEJwuzT5oJ4+h9t
	b9gEr96o9Odf1vMM6KWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQwj8-0001YQ-CS; Wed, 15 May 2019 16:25:58 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQwj5-0001Xb-3D
 for linux-afs@lists.infradead.org; Wed, 15 May 2019 16:25:56 +0000
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C9A5730018F6;
 Wed, 15 May 2019 16:25:54 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B91B419C7E;
 Wed, 15 May 2019 16:25:53 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 02/15] afs: Fix incorrect error handling in afs_xattr_get_acl()
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 15 May 2019 17:25:51 +0100
Message-ID: <155793755188.31671.13175909085892285666.stgit@warthog.procyon.org.uk>
In-Reply-To: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
References: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Wed, 15 May 2019 16:25:54 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_092555_155508_2CD53F4A 
X-CRM114-Status: GOOD (  15.86  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
Cc: Joe Perches <joe@perches.com>, Colin Ian King <colin.king@canonical.com>,
 dhowells@redhat.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Fix incorrect error handling in afs_xattr_get_acl() where there appears to
be a redundant assignment before return, but in fact the return should be a
goto to the error handling at the end of the function.

Fixes: 260f082bae6d ("afs: Get an AFS3 ACL as an xattr")
Addresses-Coverity: ("Unused Value")
Reported-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Joe Perches <joe@perches.com>
---

 fs/afs/xattr.c |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/afs/xattr.c b/fs/afs/xattr.c
index c81f85003fc7..b6c44e75b361 100644
--- a/fs/afs/xattr.c
+++ b/fs/afs/xattr.c
@@ -71,11 +71,10 @@ static int afs_xattr_get_acl(const struct xattr_handler *handler,
 	if (ret == 0) {
 		ret = acl->size;
 		if (size > 0) {
-			ret = -ERANGE;
-			if (acl->size > size)
-				return -ERANGE;
-			memcpy(buffer, acl->data, acl->size);
-			ret = acl->size;
+			if (acl->size <= size)
+				memcpy(buffer, acl->data, acl->size);
+			else
+				ret = -ERANGE;
 		}
 		kfree(acl);
 	}


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
