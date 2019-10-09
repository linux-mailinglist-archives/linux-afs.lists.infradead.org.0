Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB5FD0742
	for <lists+linux-afs@lfdr.de>; Wed,  9 Oct 2019 08:32:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lWLm5lnxMvZz5RC8O1N6LW3RkD8NMzBEnojwiFPWK+0=; b=qBxsEyEJN0Kyx1
	7zqs9dKxCMff5IGG9D7/bscktJb/WXH4aSbHpCquy4asaoCMci5pfonJFUYAI8prj7IP4ULjetGDZ
	HWRtRo270szZ0plnDu3jJbnrR6jUF7RxnXofBM+33gdxDtTm9kHu6TQIE+vRdi7gpilwlQcTNedSB
	JP0vpd/YSaHpi37yE19sOc7HBdynjbc5ddxNpATodAxBYL7pIQHweoeL/oYjsaIGxq1H2km5SBxjj
	JvqmtWqJdYn3ayrKr7MwhrrPXJa+oyPUqvn70cmT4kj0p7KLPLaxP6w1B5I5vaUyUQN9ofmQIIPFG
	h/JaFKjnS5RCAHJQ/Luw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iI5WU-0003JA-W0; Wed, 09 Oct 2019 06:32:34 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iI5WS-000385-5Q
 for linux-afs@lists.infradead.org; Wed, 09 Oct 2019 06:32:33 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2EAE040AB19E99A0E089;
 Wed,  9 Oct 2019 14:32:22 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Wed, 9 Oct 2019
 14:32:12 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <dhowells@redhat.com>, <linux-afs@lists.infradead.org>
Subject: [PATCH 1/2] afs: Remove set but not used variable 'ret'
Date: Wed, 9 Oct 2019 14:39:22 +0800
Message-ID: <1570603163-117062-2-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570603163-117062-1-git-send-email-zhengbin13@huawei.com>
References: <1570603163-117062-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191008_233232_375811_B1D47E4C 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.32 listed in list.dnswl.org]
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Fixes gcc '-Wunused-but-set-variable' warning:

fs/afs/server.c: In function afs_install_server:
fs/afs/server.c:157:6: warning: variable ret set but not used [-Wunused-but-set-variable]

It is not used since commit d2ddc776a458 ("afs:
Overhaul volume and server record caching and fileserver rotation")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 fs/afs/server.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/afs/server.c b/fs/afs/server.c
index 64d440a..1686bf1 100644
--- a/fs/afs/server.c
+++ b/fs/afs/server.c
@@ -151,7 +151,7 @@ static struct afs_server *afs_install_server(struct afs_net *net,
 	const struct afs_addr_list *alist;
 	struct afs_server *server;
 	struct rb_node **pp, *p;
-	int ret = -EEXIST, diff;
+	int diff;

 	_enter("%p", candidate);

@@ -196,7 +196,6 @@ static struct afs_server *afs_install_server(struct afs_net *net,
 		hlist_add_head_rcu(&server->addr6_link, &net->fs_addresses6);

 	write_sequnlock(&net->fs_addr_lock);
-	ret = 0;

 exists:
 	afs_get_server(server, afs_server_trace_get_install);
--
2.7.4


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
