Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 54578E1D68
	for <lists+linux-afs@lfdr.de>; Wed, 23 Oct 2019 15:54:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ckePqqbMXMWiXwbZaxVKAr2mGVZGV1anmAyWPs6G1aU=; b=ugpd5/1MfReJ8J
	4tWu+tAlEdzw/4MehzuTkeBC/3sKY1TEwspgTSxR0jyRaQjQ3+T6A5cG0DN4TXqez8fqR6bN86PFW
	NrkcuIB8GL4PXtV7y/HX2Aqr20la9NNUMt77Yy1mTQH7ve9L+CshcT0sm8f8ujGZolETLRkaJy+dF
	YJ8Jin+RwVMHoX/cY+eSEqx2lfaUm4jRPDCEycmyTvNoKACzy9nx0p4+fXwedTCo9LKTyMivhDFB4
	VF0ramU0YQI5FU8SEgQ1H7AHqoLnPYlWpC3uZVSxFS3A87kuI6DtFjdG2uEiZmySRwvOCDRzyKby6
	cvlIc+9ugyUvyTlDnV7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNH5y-0008F6-CQ; Wed, 23 Oct 2019 13:54:38 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNH5v-0008Ay-6j
 for linux-afs@lists.infradead.org; Wed, 23 Oct 2019 13:54:36 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1A8149213314023501A7;
 Wed, 23 Oct 2019 21:54:27 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Wed, 23 Oct 2019
 21:54:17 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <dhowells@redhat.com>
Subject: [PATCH -next] afs: remove unused variable 'afs_zero_fid'
Date: Wed, 23 Oct 2019 21:54:08 +0800
Message-ID: <20191023135408.32932-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_065435_437632_CBD68C13 
X-CRM114-Status: UNSURE (   6.02  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.190 listed in list.dnswl.org]
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
Cc: pmladek@suse.com, sergey.senozhatsky@gmail.com,
 YueHaibing <yuehaibing@huawei.com>, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

fs/afs/fsclient.c:18:29: warning:
 afs_zero_fid defined but not used [-Wunused-const-variable=]

It is never used since commit 025db80c9e42 ("afs: Trace
the initiation and completion of client calls")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/afs/yfsclient.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index 9ac035c..46c679e 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -15,8 +15,6 @@
 #include "xdr_fs.h"
 #include "protocol_yfs.h"
 
-static const struct afs_fid afs_zero_fid;
-
 static inline void afs_use_fs_server(struct afs_call *call, struct afs_cb_interest *cbi)
 {
 	call->cbi = afs_get_cb_interest(cbi);
-- 
2.7.4



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
