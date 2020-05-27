Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2CC1E41DA
	for <lists+linux-afs@lfdr.de>; Wed, 27 May 2020 14:17:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gfx1hxTNvm/XtHEjynNHCFB9aElkHijeqnnekLal0wY=; b=l/sFidMAzWTu1r
	3KWmzIa8/X1NA5EJUZOs2qCb557rTn6YSuM9xN9kVYT0mZSyykKTO+j9hNZ6KwkvT9+dBQUEtDCAs
	cto70JwDIOSHS0fF3e9xS4vq8JP1WUEIEk5lEcoU8bw0VJwYtYsB8yzxD4JFhVNXDlAXMeXguBmL6
	Iav8caWZN698tf26VpCYd0TJzTufXxHE0fbzem2IpXdf2IQaGIUKNXB/gdgSEG5Y2SF6UjPpzzI4y
	+UhYgoeLuDDmh4qT31tisIIu+Sh2J3cF1WrYbFGSONyyew+Sj4CXCHSPE6EFubxKp7ZHpiEIMVcuH
	RJY3tIQVUsws6EyoMbeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jduz6-0003MT-8B; Wed, 27 May 2020 12:16:36 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdup6-0006ED-CO
 for linux-afs@lists.infradead.org; Wed, 27 May 2020 12:06:18 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1jdup3-0003ka-CY; Wed, 27 May 2020 12:06:13 +0000
From: Colin King <colin.king@canonical.com>
To: David Howells <dhowells@redhat.com>,
	linux-afs@lists.infradead.org
Subject: [PATCH] afs: remove redundant assignment to variable ret
Date: Wed, 27 May 2020 13:06:13 +0100
Message-Id: <20200527120613.172967-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_050616_556284_E0181B4C 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [91.189.89.112 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [91.189.89.112 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being assigned a value that is never read. The
assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/afs/dir.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index d1e1caa23c8b..5608665ccb71 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -579,7 +579,6 @@ static int afs_do_lookup_one(struct inode *dir, struct dentry *dentry,
 		return ret;
 	}
 
-	ret = -ENOENT;
 	if (!cookie.found) {
 		_leave(" = -ENOENT [not found]");
 		return -ENOENT;
-- 
2.25.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
