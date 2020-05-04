Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4771D1C45F1
	for <lists+linux-afs@lfdr.de>; Mon,  4 May 2020 20:30:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JuER34wYPssJvzMS6t6FDhlElFeD0xa2mw+I55/RWZ8=; b=mlsVLMYZ+Huu7B
	KTvRU4itBpudsKvf8FOhTsemBHLdAMVoaqukdyaAW6S6h7bHiijF45yBT5BKOIT8SaMvWr94GjphM
	d0ghHCV7BMsgd7HUuN9FwZDYKlpGG9vT5V8HUOpko+8UABlyUdZS299F2De+2xLlBl37BxoQTWZYa
	Wj4TyyLk4N9wjFgENfvhfazxe7mfIgLqvZdLiH1Vm2ayo1FFTfoSw11OsiBaAFk8ErT2L6HthbxRj
	IvY58egge0nMZ9+c6wTchARSdjxrvpc2+uEGsvn81lKgqN10XJAQEQZiNkVERWnxR8PADi00JLA4v
	p6uPSt4s4voFBUCaWiYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVfrF-0002RB-5s; Mon, 04 May 2020 18:30:25 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVehM-0002cg-OM
 for linux-afs@lists.infradead.org; Mon, 04 May 2020 17:16:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588612567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZuwzthaQnSNVn03puNWRMvA3AfX1NCjj+U0YsPzF/UI=;
 b=UWrVydk3+/DOTXenC/nhdbfGv2/m1RGEKKdRzbnRdixdF3aQaC3OUDz9QNWyzrXUstKcFy
 Z8bjpp0M/u2Kz+YBu+IYeGXbXwCvU5HgfUyN2VyBaKkK8JHD6vwdK5+6cuQ8+Mlmwi4BQl
 URjrJaWVBS9/LGLuL+SLmvsO+arQAiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-59IuCeZMP6WrTHdqLI9BLg-1; Mon, 04 May 2020 13:16:04 -0400
X-MC-Unique: 59IuCeZMP6WrTHdqLI9BLg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6857119200CD;
 Mon,  4 May 2020 17:16:02 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-118-225.rdu2.redhat.com
 [10.10.118.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADDD35C1B2;
 Mon,  4 May 2020 17:15:58 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [RFC PATCH 56/61] afs: Copy local writes to the cache when writing to
 the server
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
 Anna Schumaker <anna.schumaker@netapp.com>, Steve French <sfrench@samba.org>, 
 Jeff Layton <jlayton@redhat.com>
Date: Mon, 04 May 2020 18:15:57 +0100
Message-ID: <158861255792.340223.1309939976492492377.stgit@warthog.procyon.org.uk>
In-Reply-To: <158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk>
References: <158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_101608_891561_945FAF99 
X-CRM114-Status: GOOD (  19.34  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
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

When writing to the server from afs_writepage() or afs_writepages(), copy
the data to the cache object too.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/write.c |  124 ++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 119 insertions(+), 5 deletions(-)

diff --git a/fs/afs/write.c b/fs/afs/write.c
index 312d8f07533e..38637dc6043c 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -13,6 +13,9 @@
 #include <linux/pagevec.h>
 #include "internal.h"
 
+static void afs_write_to_cache(struct afs_vnode *vnode,
+			       pgoff_t start, pgoff_t end, loff_t a, loff_t b);
+
 /*
  * mark a page as having been made dirty and thus needing writeback
  */
@@ -389,6 +392,8 @@ static int afs_write_back_from_locked_page(struct address_space *mapping,
 	count = 1;
 	if (test_set_page_writeback(primary_page))
 		BUG();
+	if (TestSetPageFsCache(primary_page))
+		BUG();
 
 	/* Find all consecutive lockable dirty pages that have contiguous
 	 * written regions, stopping when we find a page that is not
@@ -437,7 +442,8 @@ static int afs_write_back_from_locked_page(struct address_space *mapping,
 				break;
 			if (!trylock_page(page))
 				break;
-			if (!PageDirty(page) || PageWriteback(page)) {
+			if (!PageDirty(page) || PageWriteback(page) ||
+			    PageFsCache(page)) {
 				unlock_page(page);
 				break;
 			}
@@ -459,6 +465,8 @@ static int afs_write_back_from_locked_page(struct address_space *mapping,
 				BUG();
 			if (test_set_page_writeback(page))
 				BUG();
+			if (TestSetPageFsCache(page))
+				BUG();
 			unlock_page(page);
 			put_page(page);
 		}
@@ -489,8 +497,13 @@ static int afs_write_back_from_locked_page(struct address_space *mapping,
 	b = last;
 	b <<= PAGE_SHIFT;
 	b += to;
-	iov_iter_mapping(&iter, WRITE, mapping, a, b - a);
 
+	/* Speculatively write to the cache.  We have to fix this up later if
+	 * the store fails.
+	 */
+	afs_write_to_cache(vnode, first, last + 1, a, b);
+
+	iov_iter_mapping(&iter, WRITE, mapping, a, b - a);
 	ret = afs_store_data(vnode, &iter, a, first, last);
 	switch (ret) {
 	case 0:
@@ -543,6 +556,10 @@ int afs_writepage(struct page *page, struct writeback_control *wbc)
 
 	_enter("{%lx},", page->index);
 
+#ifdef CONFIG_AFS_FSCACHE
+	wait_on_page_fscache(page);
+#endif
+
 	ret = afs_write_back_from_locked_page(page->mapping, wbc, page,
 					      wbc->range_end >> PAGE_SHIFT);
 	if (ret < 0) {
@@ -570,7 +587,7 @@ static int afs_writepages_region(struct address_space *mapping,
 
 	do {
 		n = find_get_pages_range_tag(mapping, &index, end,
-					PAGECACHE_TAG_DIRTY, 1, &page);
+					     PAGECACHE_TAG_DIRTY, 1, &page);
 		if (!n)
 			break;
 
@@ -595,10 +612,14 @@ static int afs_writepages_region(struct address_space *mapping,
 			continue;
 		}
 
-		if (PageWriteback(page)) {
+		if (PageWriteback(page) || PageFsCache(page)) {
 			unlock_page(page);
-			if (wbc->sync_mode != WB_SYNC_NONE)
+			if (wbc->sync_mode != WB_SYNC_NONE) {
 				wait_on_page_writeback(page);
+#ifdef CONFIG_AFS_FSCACHE
+				wait_on_page_fscache(page);
+#endif
+			}
 			put_page(page);
 			continue;
 		}
@@ -818,3 +839,96 @@ int afs_launder_page(struct page *page)
 	ClearPagePrivate(page);
 	return ret;
 }
+
+/*
+ * Clear the PG_fscache flag from a sequence of pages and wake up anyone who's
+ * waiting.  The last page is included in the sequence.
+ */
+static void afs_clear_fscache_bits(struct address_space *mapping,
+				   pgoff_t start, pgoff_t last)
+{
+	struct page *page;
+
+	XA_STATE(xas, &mapping->i_pages, start);
+
+	rcu_read_lock();
+	xas_for_each(&xas, page, last) {
+		unlock_page_fscache(page);
+	}
+	rcu_read_unlock();
+}
+
+/*
+ * Deal with the completion of writing the data to the cache.
+ */
+static void afs_write_to_cache_done(struct fscache_io_request *_req)
+{
+	struct afs_read *req = container_of(_req, struct afs_read, cache);
+	pgoff_t index = req->cache.pos >> PAGE_SHIFT;
+	pgoff_t last = index + req->cache.nr_pages - 1;
+
+	_enter("%lx,%x,%llx", index, req->cache.nr_pages, req->cache.transferred);
+
+	afs_clear_fscache_bits(req->cache.mapping, index, last);
+
+	if (req->cache.error && req->cache.error != -ENOBUFS) {
+		struct afs_vnode *vnode = req->vnode;
+		struct afs_vnode_cache_aux aux = {
+			.data_version = vnode->status.data_version,
+		};
+		_debug("inval wr %d", req->cache.error);
+		fscache_invalidate(req->cache.cookie, &aux,
+				   i_size_read(&vnode->vfs_inode), 0);
+	}
+}
+
+static const struct fscache_io_request_ops afs_write_req_ops = {
+	.get		= afs_req_get,
+	.put		= afs_req_put,
+};
+
+/*
+ * Save the write to the cache also.
+ */
+static void afs_write_to_cache(struct afs_vnode *vnode,
+			       pgoff_t start, pgoff_t end, loff_t a, loff_t b)
+{
+	struct afs_read *req;
+	struct iov_iter iter;
+	unsigned int x;
+
+	struct fscache_extent extent = {
+		.start		= start,
+		.block_end	= end,
+		.limit		= end,
+	};
+
+	_enter("%lx,%lx,%llx,%llx", start, end, a, b);
+
+	x = fscache_shape_extent(afs_vnode_cache(vnode), &extent,
+				 i_size_read(&vnode->vfs_inode), true);
+	if (!(x & FSCACHE_WRITE_TO_CACHE))
+		goto abandon;
+
+	req = afs_alloc_read(GFP_KERNEL);
+	if (!req)
+		goto abandon;
+
+	fscache_init_io_request(&req->cache, afs_vnode_cache(vnode),
+				&afs_write_req_ops);
+	req->vnode		= vnode;
+	req->cache.pos		= round_down(a, extent.dio_block_size);
+	req->cache.len		= round_up(b, extent.dio_block_size) - req->cache.pos;
+	req->cache.nr_pages	= end - start;
+	req->cache.mapping	= vnode->vfs_inode.i_mapping;
+	req->cache.io_done	= &afs_write_to_cache_done;
+
+	iov_iter_mapping(&iter, WRITE, req->cache.mapping,
+			 req->cache.pos, req->cache.len);
+	fscache_write(&req->cache, &iter);
+	afs_put_read(req);
+	return;
+
+abandon:
+	afs_clear_fscache_bits(vnode->vfs_inode.i_mapping, start, end);
+}



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
