Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0582F1E8ABD
	for <lists+linux-afs@lfdr.de>; Sat, 30 May 2020 00:02:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIBQ40hnGWT39DWfGcUi2t4/IlMfOMnF1AgOWkQ/DPg=; b=uYlAitVu5U3L+r
	Ylg+psCbgHlnGyxrNJChyywhCSblQZao47lQpYBX1zXdk3YgqkDhkjAyxjzODJG2Uakx2XK+BjjmR
	ClYvDzsBSvNDQHy4m8/ybj7YdfmsWLeEV/l9jU2bf4sqE7AbaOPY1EZjILG/Cu67LIcgfWFzM6rfa
	6SPPUiddrUw7eXPgKg5v0Ld5PtAP/hk2G4u0SXnTqY9gNWIKiXYqpGE/bvNcUtEZz8ii6s4auHDft
	fhl8cp9/BvJ50LWcUu4RfHOJoK9+yCLkZR/kzfVmbiUWvkYRm9lQxLkjrST4lkUyeoU1OQjmBJyn2
	vS0cP+4A2xvScEaM9NWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jen4v-0002BN-U7; Fri, 29 May 2020 22:02:13 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jen4t-00028w-9h
 for linux-afs@lists.infradead.org; Fri, 29 May 2020 22:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590789730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cJO7tftuTzicPpFhRijSDm1G6EQS7i0R6RgRJY1TUdc=;
 b=UUaLc/cF6C7KlyCeMQ84fDAxunyt87exGasPDEKu+7YBgBNaacJHFRV6E77sANzYTZAEmw
 4ou7r7glRjAnA4YQOyNB5pXqtGtSggqW1O/hI71YEBfBlwpBEogqTjC6j0r85sWP4GKg/4
 bhJuDnaNBO0ZwTAY++K4o0cGZuXV5KQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-7_Ex-LhYONmqAXWDnZ5y9A-1; Fri, 29 May 2020 18:02:06 -0400
X-MC-Unique: 7_Ex-LhYONmqAXWDnZ5y9A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E647C1005512;
 Fri, 29 May 2020 22:02:02 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1717C5C1B5;
 Fri, 29 May 2020 22:02:01 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 16/27] afs: Retain more of the VLDB record for alias detection
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 29 May 2020 23:02:01 +0100
Message-ID: <159078972121.679399.17300781032376177951.stgit@warthog.procyon.org.uk>
In-Reply-To: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
References: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_150211_410851_FED2D232 
X-CRM114-Status: GOOD (  12.65  )
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

Save more bits from the volume location database record obtained for a
server so that we can use this information in cell alias detection.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/internal.h    |    3 ++-
 fs/afs/server_list.c |    3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 9f024c1bd650..dce03e068cab 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -546,7 +546,7 @@ struct afs_cb_interest {
 };
 
 /*
- * Replaceable server list.
+ * Replaceable volume server list.
  */
 struct afs_server_entry {
 	struct afs_server	*server;
@@ -554,6 +554,7 @@ struct afs_server_entry {
 };
 
 struct afs_server_list {
+	afs_volid_t		vids[AFS_MAXTYPES]; /* Volume IDs */
 	refcount_t		usage;
 	unsigned char		nr_servers;
 	unsigned char		preferred;	/* Preferred server */
diff --git a/fs/afs/server_list.c b/fs/afs/server_list.c
index b77e50f62459..a35f6951a74a 100644
--- a/fs/afs/server_list.c
+++ b/fs/afs/server_list.c
@@ -46,6 +46,9 @@ struct afs_server_list *afs_alloc_server_list(struct afs_cell *cell,
 	refcount_set(&slist->usage, 1);
 	rwlock_init(&slist->lock);
 
+	for (i = 0; i < AFS_MAXTYPES; i++)
+		slist->vids[i] = vldb->vid[i];
+
 	/* Make sure a records exists for each server in the list. */
 	for (i = 0; i < vldb->nr_servers; i++) {
 		if (!(vldb->fs_mask[i] & type_mask))



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
