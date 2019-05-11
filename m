Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D715F1A7D6
	for <lists+linux-afs@lfdr.de>; Sat, 11 May 2019 14:36:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TIlJInV+9hHYMDy3pZ/Zdh6rZtatVKnQQ9f0lgDeqLs=; b=eNlfwOr3KpiU5O
	brfFNlB+Bdmn/TtNDvFLvCLTPwNTETyXpOPv49bBGZ6DIJk7ez7qzv8HkxlOmFKs45CaiSC6GC0AR
	vZP2TS1laoAPu1t3oF0rGmvR/+ApueNUywtFqGGerYBcLdu7tG9LaLtkCcmeqCFGWeaKg+fAIvOqY
	v0EExnbv6L38LMTJh+Ycc90nkxJQy2wZqno1ZRAov9Vf1uIhfMQlSUl7x71K4nN9y8eyF/f/LD8z2
	nczFihQxv+/uokjxWUzxroRvoA/25FEqRKyd74ckxsgW7YNGf9yOJfGYFz60qySOxSCTfU855kQJj
	s4AyTixphjphy8GXmtYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPREb-0000IE-BD; Sat, 11 May 2019 12:36:13 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPREX-0000HV-OY
 for linux-afs@lists.infradead.org; Sat, 11 May 2019 12:36:11 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hPRES-000895-A7; Sat, 11 May 2019 12:36:04 +0000
From: Colin King <colin.king@canonical.com>
To: David Howells <dhowells@redhat.com>,
	linux-afs@lists.infradead.org
Subject: [PATCH] afs: remove redundant assignment to variable ret
Date: Sat, 11 May 2019 13:36:03 +0100
Message-Id: <20190511123603.3265-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190511_053609_934094_8BCFE05C 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [91.189.89.112 listed in list.dnswl.org]
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being assigned a value however this is never
read and later it is being reassigned to a new value. The assignment
is redundant and hence can be removed.

Addresses-Coverity: ("Unused Value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/afs/xattr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/afs/xattr.c b/fs/afs/xattr.c
index c81f85003fc7..25cb7ad4fca3 100644
--- a/fs/afs/xattr.c
+++ b/fs/afs/xattr.c
@@ -71,7 +71,6 @@ static int afs_xattr_get_acl(const struct xattr_handler *handler,
 	if (ret == 0) {
 		ret = acl->size;
 		if (size > 0) {
-			ret = -ERANGE;
 			if (acl->size > size)
 				return -ERANGE;
 			memcpy(buffer, acl->data, acl->size);
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
