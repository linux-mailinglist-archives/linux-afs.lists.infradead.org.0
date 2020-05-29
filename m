Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5151E8A99
	for <lists+linux-afs@lfdr.de>; Sat, 30 May 2020 00:00:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CEH34bXenqq3DBSmGXEf3AWLoYr+qN9VIxsxLb7UX10=; b=bWeqdgxeBSq9sg
	PwqponYHSWPUGVgj3YZPdaeM8qBf24XXPuUasG7up37gsxpO86nZ3XamzKJKG2mJzEsL2ArY4zpmU
	rbX4hBFUo+Ggk6a77Tk3p5nqrE7NnZl61EDdDNFlcXhadA/HbQYLPM+ZNijg9aDfEiaelpuWnRVGg
	/YX9PEeCJjc6H1zTXF+XMKtW16SSpEJh6OmI56mjo/LPlrdp711onxbRoKWRaTuOBch9EKvhFJiPa
	Pqg1mTigjtyfxPQSRBDCEwkFi10zqUQ4ITK2F11LjO2kXhP7p8aIFNKaEaTCF//7ZkaN4api0BJc9
	7LNYi87rNRWnbFX6EK4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jen3V-0001U6-El; Fri, 29 May 2020 22:00:45 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jen3S-0001RX-00
 for linux-afs@lists.infradead.org; Fri, 29 May 2020 22:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590789641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Z+Gadu21Z2xRE8cYGvxOo9yHCfq6rp1d/CEGZW+78A=;
 b=VfJOVHJjDxEQVOBQJOBRGp2k0xrlRl0neE4lB1SP+vu5/iFkxeEuhFBL6WWZHAFw5FgY1Q
 ouc8mNvM4D4QqLMlbawnZQvlArkYSn9yW7HIPo+VnVyfYV2HY2aTkrJ06Nr0/lyKrKd7Tp
 qArEF041sA1b9UcGuv+KPu3UW4NWNhM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-XcEcBHW0OdCgj8IYgyOT5w-1; Fri, 29 May 2020 18:00:38 -0400
X-MC-Unique: XcEcBHW0OdCgj8IYgyOT5w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01EDD107ACF7;
 Fri, 29 May 2020 22:00:37 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC9545D9D7;
 Fri, 29 May 2020 22:00:35 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 04/27] afs: Always include dir in bulk status fetch from
 afs_do_lookup()
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 29 May 2020 23:00:35 +0100
Message-ID: <159078963510.679399.16104194195445298436.stgit@warthog.procyon.org.uk>
In-Reply-To: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
References: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_150042_107858_00E9020F 
X-CRM114-Status: GOOD (  13.23  )
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

When a lookup is done in an AFS directory, the filesystem will speculate
and fetch up to 49 other statuses for files in the same directory and fetch
those as well, turning them into inodes or updating inodes that already
exist.

However, occasionally, a callback break might go missing due to NAT timing
out, but the afs filesystem doesn't then realise that the directory is not
up to date.

Alleviate this by using one of the status slots to check the directory in
which the lookup is being done.

Reported-by: Dave Botsch <botsch@cnf.cornell.edu>
Suggested-by: Jeffrey Altman <jaltman@auristor.com>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/dir.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index d1e1caa23c8b..3c486340b220 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -658,7 +658,8 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 
 	cookie->ctx.actor = afs_lookup_filldir;
 	cookie->name = dentry->d_name;
-	cookie->nr_fids = 1; /* slot 0 is saved for the fid we actually want */
+	cookie->nr_fids = 2; /* slot 0 is saved for the fid we actually want
+			      * and slot 1 for the directory */
 
 	read_seqlock_excl(&dvnode->cb_lock);
 	dcbi = rcu_dereference_protected(dvnode->cb_interest,
@@ -709,7 +710,11 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 	if (!cookie->inodes)
 		goto out_s;
 
-	for (i = 1; i < cookie->nr_fids; i++) {
+	cookie->fids[1] = dvnode->fid;
+	cookie->statuses[1].cb_break = afs_calc_vnode_cb_break(dvnode);
+	cookie->inodes[1] = igrab(&dvnode->vfs_inode);
+
+	for (i = 2; i < cookie->nr_fids; i++) {
 		scb = &cookie->statuses[i];
 
 		/* Find any inodes that already exist and get their



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
