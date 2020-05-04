Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA3D1C428A
	for <lists+linux-afs@lfdr.de>; Mon,  4 May 2020 19:23:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=la/Z+gpfGXsHiNjPpESW+nG8dxUB9elmdu7fRklyiwI=; b=ZyRJB3N8NT8fSE
	CS4X1N1hHzYW+T2Q7kPgmYh23mZQQMVTimyYkU9k8ApfhtBJolFQ0Etui+xo9yoAhW4JxAWOLVD1U
	KtINPLuaXEe22FHO7heaAfifatFsFFpdAHKt46u9IJmLx6OCEVEqlGDdey61TvIGwOhV8Vctf0fnR
	r7nOaoXEkpRsBnwt5mEQO7JMPXCg4mtVZ0PAdyLnF6yq0fVL6WUZ3vuMKab714E3Zv/irQF2wlJ3l
	IqrM2qzzEQ1lvYHFUWBqmknaNSrir3d7xkCJPrNu3CWNNOtvFf1ntf3Dl/sZndY6dzuANILnr96Uq
	AMZlyAC3UKCKyllW1m4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVeoY-0000a8-Qc; Mon, 04 May 2020 17:23:34 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVedg-0006ay-AV
 for linux-afs@lists.infradead.org; Mon, 04 May 2020 17:12:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588612339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8tpLo+3a8muKcubONIVwEpKqqU8oLu9wirDilBZsCq4=;
 b=AUFptcATkuzVeSsiqcHIiBJNBbm1qmZcxYQHcNw/j0dapEfx/4LwsCaoBl9cuBN9jJoCuX
 lf9pCCuHdIZgeNxusSuKevBJMOxn5GdVnrl5vvs+nnYMSdi1aKfZtcfyDTPlr6PcUbUYAu
 Sdndn5fBOGSqql2DzJ4AZxTBaFLJw5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-zuUImBPONrG6TGboFCcfdA-1; Mon, 04 May 2020 13:12:15 -0400
X-MC-Unique: zuUImBPONrG6TGboFCcfdA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A9A18014D7;
 Mon,  4 May 2020 17:12:13 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-118-225.rdu2.redhat.com
 [10.10.118.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C5182C264;
 Mon,  4 May 2020 17:12:10 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [RFC PATCH 31/61] cachefiles: Implement new fscache I/O backend API
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
 Anna Schumaker <anna.schumaker@netapp.com>, Steve French <sfrench@samba.org>, 
 Jeff Layton <jlayton@redhat.com>
Date: Mon, 04 May 2020 18:12:09 +0100
Message-ID: <158861232949.340223.21702873867667105.stgit@warthog.procyon.org.uk>
In-Reply-To: <158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk>
References: <158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_101220_442210_B91A17AC 
X-CRM114-Status: GOOD (  17.82  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [207.211.31.81 listed in wl.mailspike.net]
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

Implement the new fscache I/O backend API in cachefiles.  The
cachefiles_object struct carries a non-accounted file to the cachefiles
object (so that it doesn't cause ENFILE).

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/Makefile    |    1 +
 fs/cachefiles/interface.c |    3 ++
 fs/cachefiles/internal.h  |   14 +++++++
 fs/cachefiles/io.c        |   88 +++++++++++++++++++++++++++++++++++++++++++++
 fs/cachefiles/namei.c     |    3 ++
 5 files changed, 109 insertions(+)
 create mode 100644 fs/cachefiles/io.c

diff --git a/fs/cachefiles/Makefile b/fs/cachefiles/Makefile
index 3455d3646547..d894d317d6e7 100644
--- a/fs/cachefiles/Makefile
+++ b/fs/cachefiles/Makefile
@@ -7,6 +7,7 @@ cachefiles-y := \
 	bind.o \
 	daemon.o \
 	interface.o \
+	io.o \
 	key.o \
 	main.o \
 	namei.o \
diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index 47596b58c2da..747211363ae0 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -469,4 +469,7 @@ const struct fscache_cache_ops cachefiles_cache_ops = {
 	.put_object		= cachefiles_put_object,
 	.get_object_usage	= cachefiles_get_object_usage,
 	.sync_cache		= cachefiles_sync_cache,
+	.shape_extent		= cachefiles_shape_extent,
+	.read			= cachefiles_read,
+	.write			= cachefiles_write,
 };
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 16d15291a629..9f9e33893b4f 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -115,6 +115,20 @@ extern const struct fscache_cache_ops cachefiles_cache_ops;
 extern struct fscache_object *cachefiles_grab_object(struct fscache_object *_object,
 						     enum fscache_obj_ref_trace why);
 
+/*
+ * io.c
+ */
+extern unsigned int cachefiles_shape_extent(struct fscache_object *object,
+					    struct fscache_extent *extent,
+					    loff_t i_size, bool for_write);
+extern int cachefiles_read(struct fscache_object *object,
+			   struct fscache_io_request *req,
+			   struct iov_iter *iter);
+extern int cachefiles_write(struct fscache_object *object,
+			    struct fscache_io_request *req,
+			    struct iov_iter *iter);
+extern bool cachefiles_open_object(struct cachefiles_object *obj);
+
 /*
  * key.c
  */
diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
new file mode 100644
index 000000000000..d472e9d9173c
--- /dev/null
+++ b/fs/cachefiles/io.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Data I/O routines
+ *
+ * Copyright (C) 2020 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#include <linux/mount.h>
+#include <linux/slab.h>
+#include <linux/file.h>
+#include <linux/uio.h>
+#include <linux/xattr.h>
+#include "internal.h"
+
+/*
+ * Determine the size of a data extent in a cache object.  This must be written
+ * as a whole unit, but can be read piecemeal.
+ */
+unsigned int cachefiles_shape_extent(struct fscache_object *object,
+				     struct fscache_extent *extent,
+				     loff_t i_size, bool for_write)
+{
+	return 0;
+}
+
+/*
+ * Initiate a read from the cache.
+ */
+int cachefiles_read(struct fscache_object *object,
+		    struct fscache_io_request *req,
+		    struct iov_iter *iter)
+{
+	req->error = -ENODATA;
+	if (req->io_done)
+		req->io_done(req);
+	return -ENODATA;
+}
+
+/*
+ * Initiate a write to the cache.
+ */
+int cachefiles_write(struct fscache_object *object,
+		     struct fscache_io_request *req,
+		     struct iov_iter *iter)
+{
+	req->error = -ENOBUFS;
+	if (req->io_done)
+		req->io_done(req);
+	return -ENOBUFS;
+}
+
+/*
+ * Open a cache object.
+ */
+bool cachefiles_open_object(struct cachefiles_object *object)
+{
+	struct cachefiles_cache *cache =
+		container_of(object->fscache.cache, struct cachefiles_cache, cache);
+	struct file *file;
+	struct path path;
+
+	path.mnt = cache->mnt;
+	path.dentry = object->backer;
+
+	file = open_with_fake_path(&path,
+				   O_RDWR | O_LARGEFILE | O_DIRECT,
+				   d_backing_inode(object->backer),
+				   cache->cache_cred);
+	if (IS_ERR(file))
+		goto error;
+
+	if (!S_ISREG(file_inode(file)->i_mode))
+		goto error_file;
+
+	if (unlikely(!file->f_op->read_iter) ||
+	    unlikely(!file->f_op->write_iter)) {
+		pr_notice("Cache does not support read_iter and write_iter\n");
+		goto error_file;
+	}
+
+	object->backing_file = file;
+	return true;
+
+error_file:
+	fput(file);
+error:
+	return false;
+}
diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index ad7edd41ce27..c33b5ee65ac1 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -492,6 +492,9 @@ bool cachefiles_walk_to_object(struct cachefiles_object *parent,
 		} else {
 			BUG(); // TODO: open file in data-class subdir
 		}
+
+		if (!cachefiles_open_object(object))
+			goto check_error;
 	}
 
 	if (object->new)



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
