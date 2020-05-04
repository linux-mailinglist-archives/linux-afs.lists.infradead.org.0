Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 853F01C429E
	for <lists+linux-afs@lfdr.de>; Mon,  4 May 2020 19:24:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8HFBXnocQsXnMOmReADsksPdjyZ8eeU202UvNd25hMs=; b=TAZC0YLQoxYrCc
	mWJrxg9UOysgLmW2J30SCvtTZlQf5lRUyEZqYCZzbq1mIelDCfvx98Jj72aMGBp6nRJC8lk9JTUoX
	mDkAwKhx/6qY5GPbd2ROyAux4w1fuKvaMSALidV80wJLtIosH0cK/ykzp+th1ehMua5BMYzRlzBq3
	nmR/LlhRn9+b9l+RasoDbJpsQXsJiHNAwOUMwMADrcqMH13Q/DPr62pukwSKnrLIcE4N2ab4NUPPj
	3sHI5MVk25NQJK17JxnbaK71zIVfCjNaBXo9aGHJIiN5xCYLHF5bazszXLbDrOSItvB6Ya/fK7l8S
	XHAnKiC9Bat5e+O8/ZBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVeov-0000xU-Tu; Mon, 04 May 2020 17:23:57 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVehd-0002in-8v
 for linux-afs@lists.infradead.org; Mon, 04 May 2020 17:16:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588612584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LhWlx2Ll5MCOg+oPWlbdnb6jX8iPT9XI75bmO3tipj0=;
 b=YlKfCjXPamyY83UjGpMF3TNXFRqkEu8MLXeZV9HdS+Feq+UVOq6CecCtf6NkGd+Vtp9RVe
 VjgFd+IgplQC2u66rclYpjtkbJn87ZLuuOGUdSAo4Xdo6fKiqe7KqM+E7qwOZB71IrWvLc
 S5Zs5ifzPs7V6Iln6t+Blsgq3wVj/Sw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-EGtm6iJ_NgCUhQWQql-cVA-1; Mon, 04 May 2020 13:16:20 -0400
X-MC-Unique: EGtm6iJ_NgCUhQWQql-cVA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C188B107B270;
 Mon,  4 May 2020 17:16:18 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-118-225.rdu2.redhat.com
 [10.10.118.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 700715C1B2;
 Mon,  4 May 2020 17:16:08 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [RFC PATCH 57/61] afs: Invoke fscache_resize_cookie() when handling
 ATTR_SIZE for setattr
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
 Anna Schumaker <anna.schumaker@netapp.com>, Steve French <sfrench@samba.org>, 
 Jeff Layton <jlayton@redhat.com>
Date: Mon, 04 May 2020 18:16:07 +0100
Message-ID: <158861256762.340223.10583346645344676649.stgit@warthog.procyon.org.uk>
In-Reply-To: <158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk>
References: <158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_101625_386469_219D533E 
X-CRM114-Status: GOOD (  13.54  )
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

Invoke fscache_resize_cookie() to adjust the size of the backing cache
object when setattr is called with ATTR_SIZE.  This discards any data that
then lies beyond the revised EOF and frees up space.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/inode.c |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 59dc179b40cb..21a48ab74d2b 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -838,6 +838,8 @@ int afs_setattr(struct dentry *dentry, struct iattr *attr)
 	if (!scb)
 		goto error;
 
+	fscache_use_cookie(afs_vnode_cache(vnode), true);
+
 	/* flush any dirty data outstanding on a regular file */
 	if (S_ISREG(vnode->vfs_inode.i_mode))
 		filemap_write_and_wait(vnode->vfs_inode.i_mapping);
@@ -848,7 +850,7 @@ int afs_setattr(struct dentry *dentry, struct iattr *attr)
 		key = afs_request_key(vnode->volume->cell);
 		if (IS_ERR(key)) {
 			ret = PTR_ERR(key);
-			goto error_scb;
+			goto error_unuse;
 		}
 	}
 
@@ -873,7 +875,11 @@ int afs_setattr(struct dentry *dentry, struct iattr *attr)
 	if (!(attr->ia_valid & ATTR_FILE))
 		key_put(key);
 
-error_scb:
+	if ((attr->ia_valid & ATTR_SIZE) && ret == 0)
+		fscache_resize_cookie(afs_vnode_cache(vnode), scb->status.size);
+
+error_unuse:
+	fscache_unuse_cookie(afs_vnode_cache(vnode), NULL, NULL);
 	kfree(scb);
 error:
 	_leave(" = %d", ret);



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
