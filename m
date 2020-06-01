Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 326A11EA0EB
	for <lists+linux-afs@lfdr.de>; Mon,  1 Jun 2020 11:22:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I1tkW3DKtAWD1xOVO0VN/cvy9STnqdhfEhVPmWeBYmI=; b=XkRkNq3uzneTwE
	Me//KwUo8Oq3eFOvD5Uevs1+kREhhLnem/mLkgR/EaYQ8+AHX3EDVO+AlArA4KzXBwiiuut/5NrVj
	VjW9xKMFbucSRxqyjnuIvBfBhP7E4gh1QANr8SIUDJ7GyOjStxr5enGroi0IuZ3XIlp2uplbglEVF
	iJ0h+ty9/BcI24zqNOGU6OsfCyTaiESqUKtNehSDexEjcMIUM0knz4UmNqaavr566RCLz30yjb1n2
	9DYDaeFaOiJS0DcG99zr7YIdBmmDIpUyS8j6cvXDRtBvoI2JLNpw7sBakItkvtBIbgEiUOP0BAhw0
	fT5mYjHXaKj8dj2I3aoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfgeM-0003m5-RI; Mon, 01 Jun 2020 09:22:30 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfgeJ-0003l5-9z
 for linux-afs@lists.infradead.org; Mon, 01 Jun 2020 09:22:29 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 1631E9C89EA068D77DAA;
 Mon,  1 Jun 2020 17:22:20 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Mon, 1 Jun 2020
 17:22:11 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <linux-afs@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] afs: Fix memory leak in afs_put_sysnames()
Date: Mon, 1 Jun 2020 17:21:50 +0800
Message-ID: <20200601092150.3798343-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_022227_559834_89C1CB41 
X-CRM114-Status: GOOD (  12.38  )
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.35 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
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
Cc: dhowells@redhat.com, yi.zhang@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

sysnames should be freed after refcnt being decreased to zero in
afs_put_sysnames(). Besides, it would be better set net->sysnames
to 'NULL' after net->sysnames being released if afs_put_sysnames()
aims on an afs_sysnames object.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: <Stable@vger.kernel.org> # v4.17+
Fixes: 6f8880d8e681557 ("afs: Implement @sys substitution handling")
---
 fs/afs/dir.c      |  2 +-
 fs/afs/internal.h |  2 ++
 fs/afs/main.c     |  4 ++--
 fs/afs/proc.c     | 25 ++++++++++++++++++++-----
 4 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index d1e1caa23c8b..cb9d8aa91048 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -894,7 +894,7 @@ static struct dentry *afs_lookup_atsys(struct inode *dir, struct dentry *dentry,
 	 */
 	ret = NULL;
 out_s:
-	afs_put_sysnames(subs);
+	afs_put_sysnames_and_null(net);
 	kfree(buf);
 out_p:
 	key_put(key);
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 80255513e230..615dd5f9ad6f 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -1093,12 +1093,14 @@ extern void __net_exit afs_proc_cleanup(struct afs_net *);
 extern int afs_proc_cell_setup(struct afs_cell *);
 extern void afs_proc_cell_remove(struct afs_cell *);
 extern void afs_put_sysnames(struct afs_sysnames *);
+extern void afs_put_sysnames_and_null(struct afs_net *);
 #else
 static inline int afs_proc_init(struct afs_net *net) { return 0; }
 static inline void afs_proc_cleanup(struct afs_net *net) {}
 static inline int afs_proc_cell_setup(struct afs_cell *cell) { return 0; }
 static inline void afs_proc_cell_remove(struct afs_cell *cell) {}
 static inline void afs_put_sysnames(struct afs_sysnames *sysnames) {}
+static inline void afs_put_sysnames_and_null(struct afs_net *net) {}
 #endif
 
 /*
diff --git a/fs/afs/main.c b/fs/afs/main.c
index c9c45d7078bd..6bf73fc65fb5 100644
--- a/fs/afs/main.c
+++ b/fs/afs/main.c
@@ -132,7 +132,7 @@ static int __net_init afs_net_init(struct net *net_ns)
 	net->live = false;
 	afs_proc_cleanup(net);
 error_proc:
-	afs_put_sysnames(net->sysnames);
+	afs_put_sysnames_and_null(net);
 error_sysnames:
 	net->live = false;
 	return ret;
@@ -150,7 +150,7 @@ static void __net_exit afs_net_exit(struct net *net_ns)
 	afs_purge_servers(net);
 	afs_close_socket(net);
 	afs_proc_cleanup(net);
-	afs_put_sysnames(net->sysnames);
+	afs_put_sysnames_and_null(net);
 }
 
 static struct pernet_operations afs_net_ops = {
diff --git a/fs/afs/proc.c b/fs/afs/proc.c
index 468e1713bce1..26e1e73281a6 100644
--- a/fs/afs/proc.c
+++ b/fs/afs/proc.c
@@ -554,15 +554,30 @@ static int afs_proc_sysname_write(struct file *file, char *buf, size_t size)
 	goto out;
 }
 
-void afs_put_sysnames(struct afs_sysnames *sysnames)
+static void afs_free_sysnames(struct afs_sysnames *sysnames)
 {
 	int i;
 
+	for (i = 0; i < sysnames->nr; i++)
+		if (sysnames->subs[i] != afs_init_sysname &&
+		    sysnames->subs[i] != sysnames->blank)
+			kfree(sysnames->subs[i]);
+	kfree(sysnames);
+}
+
+void afs_put_sysnames(struct afs_sysnames *sysnames)
+{
+	if (sysnames && refcount_dec_and_test(&sysnames->usage))
+		afs_free_sysnames(sysnames);
+}
+
+void afs_put_sysnames_and_null(struct afs_net *net)
+{
+	struct afs_sysnames *sysnames = net->sysnames;
+
 	if (sysnames && refcount_dec_and_test(&sysnames->usage)) {
-		for (i = 0; i < sysnames->nr; i++)
-			if (sysnames->subs[i] != afs_init_sysname &&
-			    sysnames->subs[i] != sysnames->blank)
-				kfree(sysnames->subs[i]);
+		afs_free_sysnames(sysnames);
+		net->sysnames = NULL;
 	}
 }
 
-- 
2.25.4


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
