Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCCB11A8E5
	for <lists+linux-afs@lfdr.de>; Wed, 11 Dec 2019 11:28:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HQsAuFb8WSI0lduEAs5VnolLruN6Bt6ZW85Fspy9+O4=; b=K2QVI1VCCPgvPY
	sq+bdkSbcdTv42gfzhgHwWcqjUyTYSgdIwn3KGv3ewD4CX3EI33zZlDM1PCmSPVMPDsF0VSeGgXW1
	JpiZDmnNuifPd3tmcY5E1fN6GebHbdz86r8yy3G2LKvJF8bfO1qPQhtOl1HhaPWdClXD5Etuat+wc
	eT9OR9JbqOeGzfa5sfK8HlKoPa0ic0LZm1WkOe2FkAj7L7EgjkP3Bvv2fID6hIR1QbcQBkKctQXLE
	1TyQiKqYuEoSXx4jVqFlxozk5TsiJIF6FOWouMj+3xbKaYoOZifZ9Aj0swQmdO6rOsuLoU9O65CV/
	8wiXwvyxqeK/YBoVc1Gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iezEL-0007h5-7U; Wed, 11 Dec 2019 10:28:29 +0000
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iezEH-0007gL-VG
 for linux-afs@lists.infradead.org; Wed, 11 Dec 2019 10:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576060105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q8VK18VbM01RyEH5l1k8xiCnGZu1te8fRW4/R0Vh7d0=;
 b=HdybYVKwcFDuIpQuIdJxJPHmMy7MTMvKpBjg0jLQX2CZeu7DxcHlaqbvNs2TS9bUACuwDF
 IlALIDOPJ2I2iayZL+aVAGU5DPNsZQNVVQ4LZnSYY1SzLqbuR6HCnxPEwgRo0eAFQwVoir
 q1Pvz9KWUYyUGVzYRhFOV7WNct6A44o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-7WUFU5DQOoy5b7oEoqrwXA-1; Wed, 11 Dec 2019 05:28:23 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 618B41005502
 for <linux-afs@lists.infradead.org>; Wed, 11 Dec 2019 10:28:22 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-52.rdu2.redhat.com
 [10.10.120.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE54060BE2;
 Wed, 11 Dec 2019 10:28:21 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 7/8] afs: Show volume name in /proc/net/cells/<cell>/volumes
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 11 Dec 2019 10:28:21 +0000
Message-ID: <157606010119.21869.2211958863590349080.stgit@warthog.procyon.org.uk>
In-Reply-To: <157606006065.21869.6615813521356169209.stgit@warthog.procyon.org.uk>
References: <157606006065.21869.6615813521356169209.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 7WUFU5DQOoy5b7oEoqrwXA-1
X-Mimecast-Spam-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_022826_080609_14FD6E37 
X-CRM114-Status: GOOD (  12.17  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [207.211.31.81 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: dhowells@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Show the name of each volume in /proc/net/cells/<cell>/volumes to make it
easier to work out the name corresponding to a volume ID.  This makes it
easier to work out which mounts in /proc/mounts correspond to which volume
ID.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/proc.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/afs/proc.c b/fs/afs/proc.c
index fba2ec3a3a9c..468e1713bce1 100644
--- a/fs/afs/proc.c
+++ b/fs/afs/proc.c
@@ -213,13 +213,14 @@ static int afs_proc_cell_volumes_show(struct seq_file *m, void *v)
 
 	/* Display header on line 1 */
 	if (v == &cell->proc_volumes) {
-		seq_puts(m, "USE VID      TY\n");
+		seq_puts(m, "USE VID      TY NAME\n");
 		return 0;
 	}
 
-	seq_printf(m, "%3d %08llx %s\n",
+	seq_printf(m, "%3d %08llx %s %s\n",
 		   atomic_read(&vol->usage), vol->vid,
-		   afs_vol_types[vol->type]);
+		   afs_vol_types[vol->type],
+		   vol->name);
 
 	return 0;
 }


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
