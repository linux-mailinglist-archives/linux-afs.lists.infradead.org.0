Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C20E1F4070
	for <lists+linux-afs@lfdr.de>; Tue,  9 Jun 2020 18:14:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4IjEqgjm4+WJqKy5RAAVUMc4hV82Rr6dkYYcjuml9cU=; b=Qd/bIjm7scSNFi
	Aw0Wq2fQvZVxN7UVQBM7f3gM+CJ7jewqMGqRfE5AhbZw0g0MA/U9qSSm5BUZ6W5/YqvknI1pF0pBy
	EA5w4NfoU3BUaTF3n4kCR5zCUxF+3Bb4KwAHqc7sBnr0gQS6uAU3Kq3t8AHp8eLxU4xB0ZbSZbxMm
	wNnquiODc6glhGLXTeondTL43B6vUuLVH+L07mwtBUrdgQsaj6+ffDzFFqloYvzkP5QetupVuqhQy
	N/JY3XEJaKdwcaKzlX0hP9q3PR5fynZttXGla6Abwq3NJI8XjQZgoLQUiWsGTjYw9Ghxafqbdtxxx
	dBhaJ5FOyGlIJMIxDT6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jigsv-0000WX-0i; Tue, 09 Jun 2020 16:13:57 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jigsq-0000VJ-VO
 for linux-afs@lists.infradead.org; Tue, 09 Jun 2020 16:13:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591719232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+NfdDHd048erz6t6tm56S9vVVu/IFfv0ONqlf8UAtGg=;
 b=PfQZFkGiW2tZC5sP4z0/tICrRx3zmvtOZ5EZ3/WX/CM7PCBYNvxzL/Sxk4exeGax5TlCq7
 5WKNwc6hVyP2BktD3t8mPRK56dAoCx69gWEKFqITb/NOr3/p8UDOl71DdkQTcVG4GAubIh
 xJUSdv//qVtzyAZBJknro6gUda2B1vU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-5lTf6LqqNgSq2fj980Vfrw-1; Tue, 09 Jun 2020 12:13:49 -0400
X-MC-Unique: 5lTf6LqqNgSq2fj980Vfrw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E159C107ACF2;
 Tue,  9 Jun 2020 16:13:48 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13DA01001281;
 Tue,  9 Jun 2020 16:13:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 6/6] afs: Make afs_zap_data() static
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Tue, 09 Jun 2020 17:13:47 +0100
Message-ID: <159171922724.3038039.13172044294369425099.stgit@warthog.procyon.org.uk>
In-Reply-To: <159171918506.3038039.10915051218779105094.stgit@warthog.procyon.org.uk>
References: <159171918506.3038039.10915051218779105094.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_091353_082116_9F8886CB 
X-CRM114-Status: GOOD (  12.70  )
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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

Make afs_zap_data() static as it's only used in the file in which it is
defined.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/inode.c    |    2 +-
 fs/afs/internal.h |    1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 7dde703df40c..cd0a0060950b 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -538,7 +538,7 @@ struct inode *afs_root_iget(struct super_block *sb, struct key *key)
  * mark the data attached to an inode as obsolete due to a write on the server
  * - might also want to ditch all the outstanding writes and dirty pages
  */
-void afs_zap_data(struct afs_vnode *vnode)
+static void afs_zap_data(struct afs_vnode *vnode)
 {
 	_enter("{%llx:%llu}", vnode->fid.vid, vnode->fid.vnode);
 
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 519ffb104616..0c9806ef2a19 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -1069,7 +1069,6 @@ extern int afs_ilookup5_test_by_fid(struct inode *, void *);
 extern struct inode *afs_iget_pseudo_dir(struct super_block *, bool);
 extern struct inode *afs_iget(struct afs_operation *, struct afs_vnode_param *);
 extern struct inode *afs_root_iget(struct super_block *, struct key *);
-extern void afs_zap_data(struct afs_vnode *);
 extern bool afs_check_validity(struct afs_vnode *);
 extern int afs_validate(struct afs_vnode *, struct key *);
 extern int afs_getattr(const struct path *, struct kstat *, u32, unsigned int);



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
