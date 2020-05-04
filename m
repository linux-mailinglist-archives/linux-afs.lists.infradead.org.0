Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2E51C4297
	for <lists+linux-afs@lfdr.de>; Mon,  4 May 2020 19:24:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ix3AqKnkD15hMzVhBcXQaHsC9sM1+5bqjQmPbjE0dtc=; b=QHRfj0pBnjDesr
	HOhYBZ4mc7eDGTXH4g7AHkfsbo2J0tVXzIJaDJABExrh72XmUnRhV8deYqlwkkKel0zDL5GCod0pv
	aOrRb01HRhIbYStxrRTO8ievG3x/lwmYT9xUeVpAzMjXtt4UDJVI5E6ZW5jqPP2sIqa9HRZz6Qek/
	4/pCVc6pfnLWpHfBj3AWiZQSB4GLtevsM7FLnKlrXcGQ2gDbV6kBheNS5/jruW+iowq5NAYE9N1cF
	NbuhBagH+fsCuJE8muzk5mYRH54CV7TI6rVLTytT1DNZIHcvKFBsswtjDAfd2n3bZzTdeWq4PGyMv
	KmFGN5Zi23KnEKnxCCgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVeop-0000qE-05; Mon, 04 May 2020 17:23:51 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVefr-0007Pc-7i
 for linux-afs@lists.infradead.org; Mon, 04 May 2020 17:14:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588612474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e4U4fcN/pK7N2vY4Mne5ej9n14XUHHEQ4OsRfDbqy0E=;
 b=E8uXRnE+PXcgNrFQDf8fohk2vlu2IjJdCx/zD6utyvj/j/DGcJXWzKnOhi8nDHWXP08R0O
 fjGBKODsF9syeDGumSgJN5xlY19wwNgAOOHVzNImvP5n4xcQdf+ixxPdTk2n7RWR2vwfUW
 9IEkLfQVRiLhxyCFA1JbR26PSIvGL3E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-u8C8a5BLMmaTOqWvrjo2nA-1; Mon, 04 May 2020 13:14:31 -0400
X-MC-Unique: u8C8a5BLMmaTOqWvrjo2nA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0E9C835B40;
 Mon,  4 May 2020 17:14:29 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-118-225.rdu2.redhat.com
 [10.10.118.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1704760F8D;
 Mon,  4 May 2020 17:14:26 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [RFC PATCH 46/61] cachefiles: Shape write requests
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
 Anna Schumaker <anna.schumaker@netapp.com>, Steve French <sfrench@samba.org>, 
 Jeff Layton <jlayton@redhat.com>
Date: Mon, 04 May 2020 18:14:26 +0100
Message-ID: <158861246621.340223.9118210695394840507.stgit@warthog.procyon.org.uk>
In-Reply-To: <158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk>
References: <158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_101435_354316_F5A5CBC8 
X-CRM114-Status: GOOD (  16.12  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
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
X-Mailman-Approved-At: Mon, 04 May 2020 10:23:02 -0700
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 dhowells@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

In cachefiles_shape_extent(), shape a write request to always write to the
cache.  The assumption is made that the caller has read the entire cache
granule beforehand if necessary.

Possibly this should be amended so that writes will only take place to
granules that are marked present and granules that lie beyond the EOF.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/content-map.c |   22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/fs/cachefiles/content-map.c b/fs/cachefiles/content-map.c
index 13632c097248..2c45092465b6 100644
--- a/fs/cachefiles/content-map.c
+++ b/fs/cachefiles/content-map.c
@@ -71,7 +71,8 @@ static unsigned int cachefiles_shape_single(struct fscache_object *obj,
 
 	extent->dio_block_size = CACHEFILES_DIO_BLOCK_SIZE;
 
-	if (object->content_info == CACHEFILES_CONTENT_SINGLE) {
+	if (!for_write &&
+	    object->content_info == CACHEFILES_CONTENT_SINGLE) {
 		ret = FSCACHE_READ_FROM_CACHE;
 	} else {
 		eof = (i_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
@@ -128,13 +129,20 @@ unsigned int cachefiles_shape_extent(struct fscache_object *obj,
 
 	granule = start / CACHEFILES_GRAN_PAGES;
 
-	/* If the content map didn't get expanded for some reason - simply
-	 * ignore this granule.
-	 */
-	if (granule / 8 >= object->content_map_size)
-		return 0;
+	if (granule / 8 >= object->content_map_size) {
+		cachefiles_expand_content_map(object, i_size);
+		if (granule / 8 >= object->content_map_size)
+			return 0;
+	}
 
-	if (cachefiles_granule_is_present(object, granule)) {
+	if (for_write) {
+		/* Assume that the preparation to write involved preloading any
+		 * bits of the cache that weren't to be written and filling any
+		 * gaps that didn't end up being written.
+		 */
+		bend = end;
+		ret = FSCACHE_WRITE_TO_CACHE;
+	} else if (cachefiles_granule_is_present(object, granule)) {
 		/* The start of the requested extent is present in the cache -
 		 * restrict the returned extent to the maximum length of what's
 		 * available.



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
