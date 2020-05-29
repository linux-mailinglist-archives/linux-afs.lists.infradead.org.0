Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA521E8AC0
	for <lists+linux-afs@lfdr.de>; Sat, 30 May 2020 00:02:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lo99mh8u3Jeji3r+aVt58oBPMxO1JhSU0hwXto+2Vtk=; b=PHgLTOdhJpYXFt
	ZujwG+cpE/b0WyF2yc651F/dOgUaMx610dxcEmgz3Jz+O4skfLSCmvCuAPO77eeEBT/F49Tvywe5Y
	dxl8S9kifDjpRr/Qm2umZrzeXXahf4XRVxy86+yqoXhl9J9nIiVykSr5whMUIw0TRXRBpZkd7Xjdm
	Djx6vjdl6rAHWEhSXD7M6RyHcDi7VkLBUpmW9DhKhwQE/Hay9vKDwVyOSX3Y2QZypPs8w9vas/AVe
	4j89tPZK5RsPkwPqEzJFsdt1B0o3pvWJnS0GUG0Y/Tn2duiuyc8u8bvAzrzJzfcIRdAh4YCeTpCmJ
	ieI6eZqloF5SJe1pjv9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jen5C-0002MO-Ow; Fri, 29 May 2020 22:02:30 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jen59-0002Kk-Qe
 for linux-afs@lists.infradead.org; Fri, 29 May 2020 22:02:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590789746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S6iq26DTUp2Z1AJJIG5b7C5kCeJcVWYfJVluYMMNUBA=;
 b=R0YKfUK+3X8fQuCj/x5/TeOKYLb9YxFqSB+3nhPhOBoA+WlDTMRboc7fwF9SzDTDjNTwCJ
 8348j8yt76groMGw42Bhcv+Dm0i818UamfCsYPvjM+uXTHHhI4qqVPEoARGhE0uVnRFkRH
 2q7DRdvJlsvl5L7k9vDnT/9o1jYWtWM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-DYmdLWXcNgSk9QadL8mm5A-1; Fri, 29 May 2020 18:02:25 -0400
X-MC-Unique: DYmdLWXcNgSk9QadL8mm5A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 352E780B712;
 Fri, 29 May 2020 22:02:24 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31E4510013D4;
 Fri, 29 May 2020 22:02:23 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 19/27] afs: Detect cell aliases 2 - Cells with no root volumes
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 29 May 2020 23:02:22 +0100
Message-ID: <159078974233.679399.3000438365720326961.stgit@warthog.procyon.org.uk>
In-Reply-To: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
References: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_150227_940764_AB7457AE 
X-CRM114-Status: GOOD (  18.46  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.139.110.120 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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

Implement the second phase of cell alias detection.  This part handles
alias detection for cells that don't have root.cell volumes and so we have
to find some other volume or fileserver to query.

We take the first volume from each such cell and attempt to look it up in
the new cell.  If found, we compare the records, if they are the same, we
judge the cell names to be aliases.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/vl_alias.c |   90 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 89 insertions(+), 1 deletion(-)

diff --git a/fs/afs/vl_alias.c b/fs/afs/vl_alias.c
index d1d91a25fbe0..76bfa4dde4a4 100644
--- a/fs/afs/vl_alias.c
+++ b/fs/afs/vl_alias.c
@@ -180,6 +180,94 @@ static int afs_compare_cell_roots(struct afs_cell *cell)
 	return 1;
 }
 
+/*
+ * Query the new cell for a volume from a cell we're already using.
+ */
+static int afs_query_for_alias_one(struct afs_cell *cell, struct key *key,
+				   struct afs_cell *p)
+{
+	struct afs_volume *volume, *pvol = NULL;
+	int ret;
+
+	/* Arbitrarily pick the first volume in the list. */
+	read_lock(&p->proc_lock);
+	if (!list_empty(&p->proc_volumes))
+		pvol = afs_get_volume(list_first_entry(&p->proc_volumes,
+						       struct afs_volume, proc_link));
+	read_unlock(&p->proc_lock);
+	if (!pvol)
+		return 0;
+
+	_enter("%s:%s", cell->name, pvol->name);
+
+	/* And see if it's in the new cell. */
+	volume = afs_sample_volume(cell, key, pvol->name, pvol->name_len);
+	if (IS_ERR(volume)) {
+		afs_put_volume(cell->net, pvol);
+		if (PTR_ERR(volume) != -ENOMEDIUM)
+			return PTR_ERR(volume);
+		/* That volume is not in the new cell, so not an alias */
+		return 0;
+	}
+
+	/* The new cell has a like-named volume also - compare volume ID,
+	 * server and address lists.
+	 */
+	ret = 0;
+	if (pvol->vid == volume->vid) {
+		rcu_read_lock();
+		if (afs_compare_volume_slists(volume, pvol))
+			ret = 1;
+		rcu_read_unlock();
+	}
+
+	afs_put_volume(cell->net, volume);
+	afs_put_volume(cell->net, pvol);
+	return ret;
+}
+
+/*
+ * Query the new cell for volumes we know exist in cells we're already using.
+ */
+static int afs_query_for_alias(struct afs_cell *cell, struct key *key)
+{
+	struct afs_cell *p;
+
+	_enter("%s", cell->name);
+
+	if (mutex_lock_interruptible(&cell->net->proc_cells_lock) < 0)
+		return -ERESTARTSYS;
+
+	hlist_for_each_entry(p, &cell->net->proc_cells, proc_link) {
+		if (p == cell || p->alias_of)
+			continue;
+		if (list_empty(&p->proc_volumes))
+			continue;
+		if (p->root_volume)
+			continue; /* Ignore cells that have a root.cell volume. */
+		afs_get_cell(p);
+		mutex_unlock(&cell->net->proc_cells_lock);
+
+		if (afs_query_for_alias_one(cell, key, p) != 0)
+			goto is_alias;
+
+		if (mutex_lock_interruptible(&cell->net->proc_cells_lock) < 0) {
+			afs_put_cell(cell->net, p);
+			return -ERESTARTSYS;
+		}
+
+		afs_put_cell(cell->net, p);
+	}
+
+	mutex_unlock(&cell->net->proc_cells_lock);
+	_leave(" = 0");
+	return 0;
+
+is_alias:
+	cell->alias_of = p; /* Transfer our ref */
+	return 1;
+}
+
 static int afs_do_cell_detect_alias(struct afs_cell *cell, struct key *key)
 {
 	struct afs_volume *root_volume;
@@ -199,7 +287,7 @@ static int afs_do_cell_detect_alias(struct afs_cell *cell, struct key *key)
 	/* Okay, this cell doesn't have an root.cell volume.  We need to
 	 * locate some other random volume and use that to check.
 	 */
-	return -ENOMEDIUM;
+	return afs_query_for_alias(cell, key);
 }
 
 /*



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
