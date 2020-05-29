Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ADE1E8AC1
	for <lists+linux-afs@lfdr.de>; Sat, 30 May 2020 00:02:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y0SpE9GNNU5LKE9Vc96Vn4ysH8KgtHcAvZ4JRwKVTOM=; b=JsObXe6uU4AbwG
	ECj7FFRvo/GeXMdn0rl0pjWG2xEkZRqmJVmuekswCKHsyrgOsTQb9n6On3mEjnQXfPTeu5B9vETMA
	lQMzDza3yCcrti4AZu4aWukY5yNAmFrVBCg8P1TuVkc1EacZm9gkGPutVubcilQ6+L+1NABkRhG7a
	Z8CzQq8vj3407PZnfHAH5pEtAYg7n2TcCYM4PxxrxFAZCAKVDf1xAENOxphr/7kMAdz1+eyIJ+3wr
	cltR8Kk2iA6WAKsAAyi5OarIkEdfPzvlg5nN4IR4y5v9bINQQCKTAlWQCoEl1PwrxjwFj8M7L+fgq
	xB0FgvK8/HRoWa6bNKDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jen5K-0002PT-2m; Fri, 29 May 2020 22:02:38 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jen5H-0002O5-Eq
 for linux-afs@lists.infradead.org; Fri, 29 May 2020 22:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590789754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fuuv3sz/GSmrMmZb6ByPJWoMyMT1uK7FLllTftkdgck=;
 b=N2K/a7iOu+7T4ehR78FrKcrnaIEyoovyWulY6d9yp9m93SkALSAPBYx1BSNApLHkD/MR6o
 hRhi7ehRvnN66GcmuHmMLsq9YJmdRo/rYMZIY1Yrmb5ux1ZaHo0NgTBjwf6D6W4+LrWYM3
 Obrzgzit/q/swPKkXX1xWdCB913rigM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-wwG90mg_OYy0l5mMoSxtJQ-1; Fri, 29 May 2020 18:02:32 -0400
X-MC-Unique: wwG90mg_OYy0l5mMoSxtJQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1259F18A8228;
 Fri, 29 May 2020 22:02:31 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42E26100164C;
 Fri, 29 May 2020 22:02:30 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 20/27] afs: Detect cell aliases 3 - YFS Cells with a canonical
 cell name op
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 29 May 2020 23:02:29 +0100
Message-ID: <159078974944.679399.18369764508535302163.stgit@warthog.procyon.org.uk>
In-Reply-To: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
References: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_150235_570143_69AC31DA 
X-CRM114-Status: GOOD (  13.62  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.61 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
 information
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
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

YFS Volume Location servers have an operation by which the cell name may be
queried.  Use this to find out what a YFS server thinks the canonical cell
name should be.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/vl_alias.c  |   60 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/afs/vl_rotate.c |    4 +++
 2 files changed, 64 insertions(+)

diff --git a/fs/afs/vl_alias.c b/fs/afs/vl_alias.c
index 76bfa4dde4a4..1fcb63c65ba9 100644
--- a/fs/afs/vl_alias.c
+++ b/fs/afs/vl_alias.c
@@ -268,12 +268,72 @@ static int afs_query_for_alias(struct afs_cell *cell, struct key *key)
 	return 1;
 }
 
+/*
+ * Look up a VLDB record for a volume.
+ */
+static char *afs_vl_get_cell_name(struct afs_cell *cell, struct key *key)
+{
+	struct afs_vl_cursor vc;
+	char *cell_name = ERR_PTR(-EDESTADDRREQ);
+	bool skipped = false, not_skipped = false;
+	int ret;
+
+	if (!afs_begin_vlserver_operation(&vc, cell, key))
+		return ERR_PTR(-ERESTARTSYS);
+
+	while (afs_select_vlserver(&vc)) {
+		if (!test_bit(AFS_VLSERVER_FL_IS_YFS, &vc.server->flags)) {
+			vc.ac.error = -EOPNOTSUPP;
+			skipped = true;
+			continue;
+		}
+		not_skipped = true;
+		cell_name = afs_yfsvl_get_cell_name(&vc);
+	}
+
+	ret = afs_end_vlserver_operation(&vc);
+	if (skipped && !not_skipped)
+		ret = -EOPNOTSUPP;
+	return ret < 0 ? ERR_PTR(ret) : cell_name;
+}
+
+static int yfs_check_canonical_cell_name(struct afs_cell *cell, struct key *key)
+{
+	struct afs_cell *master;
+	char *cell_name;
+
+	cell_name = afs_vl_get_cell_name(cell, key);
+	if (IS_ERR(cell_name))
+		return PTR_ERR(cell_name);
+
+	if (strcmp(cell_name, cell->name) == 0) {
+		kfree(cell_name);
+		return 0;
+	}
+
+	master = afs_lookup_cell(cell->net, cell_name, strlen(cell_name),
+				 NULL, false);
+	kfree(cell_name);
+	if (IS_ERR(master)) {
+		kfree(cell_name);
+		return PTR_ERR(master);
+	}
+
+	cell->alias_of = master; /* Transfer our ref */
+	return 1;
+}
+
 static int afs_do_cell_detect_alias(struct afs_cell *cell, struct key *key)
 {
 	struct afs_volume *root_volume;
+	int ret;
 
 	_enter("%s", cell->name);
 
+	ret = yfs_check_canonical_cell_name(cell, key);
+	if (ret != -EOPNOTSUPP)
+		return ret;
+
 	/* Try and get the root.cell volume for comparison with other cells */
 	root_volume = afs_sample_volume(cell, key, "root.cell", 9);
 	if (!IS_ERR(root_volume)) {
diff --git a/fs/afs/vl_rotate.c b/fs/afs/vl_rotate.c
index 72eacc14e6e1..f405ca8b240a 100644
--- a/fs/afs/vl_rotate.c
+++ b/fs/afs/vl_rotate.c
@@ -151,6 +151,10 @@ bool afs_select_vlserver(struct afs_vl_cursor *vc)
 		vc->error = error;
 		vc->flags |= AFS_VL_CURSOR_RETRY;
 		goto next_server;
+
+	case -EOPNOTSUPP:
+		_debug("notsupp");
+		goto next_server;
 	}
 
 restart_from_beginning:



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
