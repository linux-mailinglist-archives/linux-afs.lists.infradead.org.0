Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4C71C428D
	for <lists+linux-afs@lfdr.de>; Mon,  4 May 2020 19:23:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hOehOITYfllyPKrRFJ4C2GaMc6GB6A+/K3o/ZGKt1kA=; b=WV697MCCNnbGXt
	zbyhU35iq4Nf2IChENo5GgmgtPR/V+EVK+7nndYQfVJx743U+Ag9NrRfwKpu8+KAK+XOds5j4MU3M
	VUM/7XNLuY2tZP/LA2ZPiSihx6Uze1fLWY4noDj4x7EvEs08Nq84Xqxmv6pG/piRjczePX2AahjTE
	WckSPaZpL4u1+JlJjBBZCLI8VJ+YXaL1+tJmXV7MSn+V37hw4dI8d/GY1570KtYLWmhU7iCqX3Svl
	g958cjX9Fg9mApen9j2ppnTwcr3409YC6KB0BNZKtJxjEaMxCqNWnnPWtFyUfGL3ud2EY36r9jpF2
	HPamvzSDjCvGy7xlcduA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVeoc-0000cr-02; Mon, 04 May 2020 17:23:38 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVee4-0006kn-5I
 for linux-afs@lists.infradead.org; Mon, 04 May 2020 17:12:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588612363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1LIqJioCt/bQ3aA4wfoDzrQ9ou/6K5JTNdA0JbBgpJw=;
 b=Rs5jUyFk089FpHRBsFSkGHpEyBqdrYjfQQyn7lP7p5fLjpISNjgqmy+f+VD3uzx8ls15XD
 RVp7izNBIVodMhpMnGJnYe/REVGgQoN1fhyvEunwRGwm7IugVBqLy0EcNnnxGURIsD/rwp
 Qywuq7PoDN8cUCa6vf39VVPqUaQYt5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-WgTZ8USzPfaRHJXzweAtEw-1; Mon, 04 May 2020 13:12:41 -0400
X-MC-Unique: WgTZ8USzPfaRHJXzweAtEw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E03BCA0C02;
 Mon,  4 May 2020 17:12:39 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-118-225.rdu2.redhat.com
 [10.10.118.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11D6E6FDAB;
 Mon,  4 May 2020 17:12:36 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [RFC PATCH 34/61] cachefiles: Implement extent shaper
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
 Anna Schumaker <anna.schumaker@netapp.com>, Steve French <sfrench@samba.org>, 
 Jeff Layton <jlayton@redhat.com>
Date: Mon, 04 May 2020 18:12:36 +0100
Message-ID: <158861235619.340223.16395929645492372171.stgit@warthog.procyon.org.uk>
In-Reply-To: <158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk>
References: <158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_101244_356568_1D8C283F 
X-CRM114-Status: GOOD (  28.50  )
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

Implement the function that shapes extents to map onto the granules in a
cache file.

When setting to fetch data from the server to be cached, the extent will be
expanded to align with granule size and cut down so that it doesn't cross
the boundary between a non-present extent and a present extent.

When setting to read data from the cache, the extent will be cut down so
that it doesn't cross the boundary between a present extent and a
non-present extent.

If no caching is taking place, whatever was requested goes.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/content-map.c |  229 ++++++++++++++++++++++++++++++++++++-------
 fs/cachefiles/internal.h    |    6 +
 fs/cachefiles/io.c          |   11 --
 3 files changed, 197 insertions(+), 49 deletions(-)

diff --git a/fs/cachefiles/content-map.c b/fs/cachefiles/content-map.c
index 594624cb1cb9..dea28948f006 100644
--- a/fs/cachefiles/content-map.c
+++ b/fs/cachefiles/content-map.c
@@ -15,6 +15,31 @@
 static const char cachefiles_xattr_content_map[] =
 	XATTR_USER_PREFIX "CacheFiles.content";
 
+/*
+ * Determine the map size for a granulated object.
+ *
+ * There's one bit per granule.  We size it in terms of 8-byte chunks, where a
+ * 64-bit span * 256KiB bytes granules covers 16MiB of file space.  At that,
+ * 512B will cover 1GiB.
+ */
+static size_t cachefiles_map_size(loff_t i_size)
+{
+	loff_t size;
+	size_t granules, bits, bytes, map_size;
+
+	if (i_size <= CACHEFILES_GRAN_SIZE * 64)
+		return 8;
+
+	size = i_size + CACHEFILES_GRAN_SIZE - 1;
+	granules = size / CACHEFILES_GRAN_SIZE;
+	bits = granules + (64 - 1);
+	bits &= ~(64 - 1);
+	bytes = bits / 8;
+	map_size = roundup_pow_of_two(bytes);
+	_leave(" = %zx [i=%llx g=%zu b=%zu]", map_size, i_size, granules, bits);
+	return map_size;
+}
+
 static bool cachefiles_granule_is_present(struct cachefiles_object *object,
 					  size_t granule)
 {
@@ -28,6 +53,157 @@ static bool cachefiles_granule_is_present(struct cachefiles_object *object,
 	return res;
 }
 
+/*
+ * Shape the extent of a single-chunk data object.
+ */
+static unsigned int cachefiles_shape_single(struct fscache_object *obj,
+					    struct fscache_extent *extent,
+					    loff_t i_size, bool for_write)
+{
+	struct cachefiles_object *object =
+		container_of(obj, struct cachefiles_object, fscache);
+	unsigned int ret;
+	pgoff_t eof;
+
+	_enter("{%lx,%lx,%lx},%llx,%d",
+	       extent->start, extent->block_end, extent->limit,
+	       i_size, for_write);
+
+	extent->dio_block_size = CACHEFILES_DIO_BLOCK_SIZE;
+
+	if (object->content_info == CACHEFILES_CONTENT_SINGLE) {
+		ret = FSCACHE_READ_FROM_CACHE;
+	} else {
+		eof = (i_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
+
+		extent->start = 0;
+		extent->block_end = eof;
+		extent->limit = eof;
+		ret = FSCACHE_WRITE_TO_CACHE;
+	}
+
+	_leave(" = %u", ret);
+	return ret;
+}
+
+/*
+ * Determine the size of a data extent in a cache object.
+ *
+ * In cachefiles, a data cache object is divided into granules of 256KiB, each
+ * of which must be written as a whole unit when the cache is being loaded.
+ * Data may be read out piecemeal.
+ *
+ * The extent is resized, but the result will always contain the starting page
+ * from the extent.
+ *
+ * If the granule does not exist in the cachefile, the start may be brought
+ * forward to align with the beginning of a granule boundary, and the end may be
+ * moved either way to align also.  The extent will be cut off it it would cross
+ * over the boundary between what's cached and what's not.
+ *
+ * If the starting granule does exist in the cachefile, the extent will be
+ * shortened, if necessary, so that it doesn't cross over into a region that is
+ * not present.
+ *
+ * If the granule does not exist and we cannot cache it for lack of space, the
+ * requested extent is left unaltered.
+ */
+unsigned int cachefiles_shape_extent(struct fscache_object *obj,
+				     struct fscache_extent *extent,
+				     loff_t i_size, bool for_write)
+{
+	struct cachefiles_object *object =
+		container_of(obj, struct cachefiles_object, fscache);
+	unsigned int ret = 0;
+	pgoff_t start, end, limit, eof, bend;
+	size_t granule;
+
+	if (object->fscache.cookie->advice & FSCACHE_ADV_SINGLE_CHUNK)
+		return cachefiles_shape_single(obj, extent, i_size, for_write);
+
+	start = extent->start;
+	end   = extent->block_end;
+	limit = extent->limit;
+	_enter("{%lx,%lx,%lx},%llx,%d", start, end, limit, i_size, for_write);
+
+	granule = start / CACHEFILES_GRAN_PAGES;
+
+	/* If the content map didn't get expanded for some reason - simply
+	 * ignore this granule.
+	 */
+	if (granule / 8 >= object->content_map_size)
+		return 0;
+
+	if (cachefiles_granule_is_present(object, granule)) {
+		/* The start of the requested extent is present in the cache -
+		 * restrict the returned extent to the maximum length of what's
+		 * available.
+		 */
+		bend = round_up(start + 1, CACHEFILES_GRAN_PAGES);
+		while (bend < end) {
+			pgoff_t i = round_up(bend + 1, CACHEFILES_GRAN_PAGES);
+			granule = i / CACHEFILES_GRAN_PAGES;
+			if (!cachefiles_granule_is_present(object, granule))
+				break;
+			bend = i;
+		}
+
+		if (bend > end)
+			bend = end;
+		end = bend;
+		ret = FSCACHE_READ_FROM_CACHE;
+	} else {
+		/* Otherwise expand the extent in both directions to cover what
+		 * we want for caching purposes.
+		 */
+		start = round_down(start, CACHEFILES_GRAN_PAGES);
+		end   = round_up(end, CACHEFILES_GRAN_PAGES);
+
+		if (limit != ULONG_MAX) {
+			limit = round_down(limit, CACHEFILES_GRAN_PAGES);
+			if (end > limit) {
+				end = limit;
+				if (end <= start) {
+					_leave(" = don't");
+					return 0;
+				}
+			}
+		}
+
+		/* But trim to the end of the file and the starting page */
+		eof = (i_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
+		if (eof <= extent->start)
+			eof = extent->start + 1;
+		if (end > eof)
+			end = eof;
+
+		if ((start << PAGE_SHIFT) >= object->fscache.cookie->zero_point) {
+			/* The start of the requested extent is beyond the
+			 * original EOF of the file on the server - therefore
+			 * it's not going to be found on the server.
+			 */
+			bend = round_up(start + 1, CACHEFILES_GRAN_PAGES);
+			end = bend;
+			ret = FSCACHE_FILL_WITH_ZERO;
+		} else {
+			bend = start + CACHEFILES_GRAN_PAGES;
+			if (bend > eof)
+				bend = eof;
+			ret = FSCACHE_WRITE_TO_CACHE;
+		}
+
+		/* TODO: Check we have space in the cache */
+	}
+
+	extent->start = start;
+	extent->block_end = bend;
+	extent->limit = end;
+	extent->dio_block_size = CACHEFILES_DIO_BLOCK_SIZE;
+
+	_leave(" = %u {%lx,%lx,%lx}", ret, start, bend, end);
+	return ret;
+}
+
 /*
  * Mark the content map to indicate stored granule.
  */
@@ -74,23 +250,14 @@ void cachefiles_mark_content_map(struct fscache_io_request *req)
 /*
  * Expand the content map to a larger file size.
  */
-void cachefiles_expand_content_map(struct cachefiles_object *object, loff_t size)
+void cachefiles_expand_content_map(struct cachefiles_object *object, loff_t i_size)
 {
+	size_t size;
 	u8 *map, *zap;
 
-	/* Determine the size.  There's one bit per granule.  We size it in
-	 * terms of 8-byte chunks, where a 64-bit span * 256KiB bytes granules
-	 * covers 16MiB of file space.  At that, 512B will cover 1GiB.
-	 */
-	if (size > 0) {
-		size += CACHEFILES_GRAN_SIZE - 1;
-		size /= CACHEFILES_GRAN_SIZE;
-		size += 8 - 1;
-		size /= 8;
-		size = roundup_pow_of_two(size);
-	} else {
-		size = 8;
-	}
+	size = cachefiles_map_size(i_size);
+
+	_enter("%llx,%lx,%x", i_size, size, object->content_map_size);
 
 	if (size <= object->content_map_size)
 		return;
@@ -122,7 +289,7 @@ void cachefiles_shorten_content_map(struct cachefiles_object *object,
 				    loff_t new_size)
 {
 	struct fscache_cookie *cookie = object->fscache.cookie;
-	loff_t granule, o_granule;
+	size_t granule, tmp, bytes;
 
 	if (object->fscache.cookie->advice & FSCACHE_ADV_SINGLE_CHUNK)
 		return;
@@ -137,12 +304,16 @@ void cachefiles_shorten_content_map(struct cachefiles_object *object,
 		granule += CACHEFILES_GRAN_SIZE - 1;
 		granule /= CACHEFILES_GRAN_SIZE;
 
-		o_granule = cookie->object_size;
-		o_granule += CACHEFILES_GRAN_SIZE - 1;
-		o_granule /= CACHEFILES_GRAN_SIZE;
+		tmp = granule;
+		tmp = round_up(granule, 64);
+		bytes = tmp / 8;
+		if (bytes < object->content_map_size)
+			memset(object->content_map + bytes, 0,
+			       object->content_map_size - bytes);
 
-		for (; o_granule > granule; o_granule--)
-			clear_bit_le(o_granule, object->content_map);
+		if (tmp > granule)
+			for (tmp--; tmp > granule; tmp--)
+				clear_bit_le(tmp, object->content_map);
 	}
 
 	write_unlock_bh(&object->content_map_lock);
@@ -157,7 +328,7 @@ bool cachefiles_load_content_map(struct cachefiles_object *object)
 						      struct cachefiles_cache, cache);
 	const struct cred *saved_cred;
 	ssize_t got;
-	loff_t size;
+	size_t size;
 	u8 *map = NULL;
 
 	_enter("c=%08x,%llx",
@@ -176,19 +347,7 @@ bool cachefiles_load_content_map(struct cachefiles_object *object)
 		 * bytes granules covers 16MiB of file space.  At that, 512B
 		 * will cover 1GiB.
 		 */
-		size = object->fscache.cookie->object_size;
-		if (size > 0) {
-			size += CACHEFILES_GRAN_SIZE - 1;
-			size /= CACHEFILES_GRAN_SIZE;
-			size += 8 - 1;
-			size /= 8;
-			if (size < 8)
-				size = 8;
-			size = roundup_pow_of_two(size);
-		} else {
-			size = 8;
-		}
-
+		size = cachefiles_map_size(object->fscache.cookie->object_size);
 		map = kzalloc(size, GFP_KERNEL);
 		if (!map)
 			return false;
@@ -212,7 +371,7 @@ bool cachefiles_load_content_map(struct cachefiles_object *object)
 		object->content_map = map;
 		object->content_map_size = size;
 		object->content_info = CACHEFILES_CONTENT_MAP;
-		_leave(" = t [%zd/%llu %*phN]", got, size, (int)size, map);
+		_leave(" = t [%zd/%zu %*phN]", got, size, (int)size, map);
 	}
 
 	return true;
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index c7a2a3442061..43f8e71136dd 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -125,6 +125,9 @@ extern void cachefiles_daemon_unbind(struct cachefiles_cache *cache);
 /*
  * content-map.c
  */
+extern unsigned int cachefiles_shape_extent(struct fscache_object *object,
+					    struct fscache_extent *extent,
+					    loff_t i_size, bool for_write);
 extern void cachefiles_mark_content_map(struct fscache_io_request *req);
 extern void cachefiles_expand_content_map(struct cachefiles_object *object, loff_t size);
 extern void cachefiles_shorten_content_map(struct cachefiles_object *object, loff_t new_size);
@@ -149,9 +152,6 @@ extern struct fscache_object *cachefiles_grab_object(struct fscache_object *_obj
 /*
  * io.c
  */
-extern unsigned int cachefiles_shape_extent(struct fscache_object *object,
-					    struct fscache_extent *extent,
-					    loff_t i_size, bool for_write);
 extern int cachefiles_read(struct fscache_object *object,
 			   struct fscache_io_request *req,
 			   struct iov_iter *iter);
diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 642c3fd34809..ddb44ec5a199 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -12,17 +12,6 @@
 #include <linux/xattr.h>
 #include "internal.h"
 
-/*
- * Determine the size of a data extent in a cache object.  This must be written
- * as a whole unit, but can be read piecemeal.
- */
-unsigned int cachefiles_shape_extent(struct fscache_object *object,
-				     struct fscache_extent *extent,
-				     loff_t i_size, bool for_write)
-{
-	return 0;
-}
-
 /*
  * Initiate a read from the cache.
  */



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
