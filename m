Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 73083FCDF4
	for <lists+linux-afs@lfdr.de>; Thu, 14 Nov 2019 19:41:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fHVwPDCVO8pwyZCKhK7A6OsBtTXk0HXZs1v7cuU0fXY=; b=UT8j5c3FohHKrB
	jnJSsDRPvmEAzhsJfrQzga7AsLIzwfgNdyPhMuWi7IzCS5+6cqcvY2mj4y9wUvKiGY41HXG/2eYJt
	sNXw7hpcrXA+Qjh/rBlKSCbIpZcAmEbQTvPISvyuoUnIw8xbZX1bCzUJT1QGWX/l9I/n8KKyB4Qaq
	qsU4nzptmAqbVfqo6TlGBgSIc8WyAgkCSttdFjQgJUKnJ1AMh7s2BOSnJZUhBCJKiEnplwEYiwBXP
	l+b83VNuvOm14NUos4bVdEzI7Mo+YLZZJEBhpLxqYERE7vCC5jXhsGlQ4ohg/JjMH49sgI2J7PYza
	Toq+mozlaqZN57SFqo0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVK3R-0007tZ-Ba; Thu, 14 Nov 2019 18:41:17 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVK3O-0007sJ-JB
 for linux-afs@lists.infradead.org; Thu, 14 Nov 2019 18:41:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573756871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UgtGbn1eYbgjdPbHsvL18nU6iPqWM6qO3qr2Grv4XiM=;
 b=Emp3Rpx/gDAwpEohUrp9ksH1hc2eSvC9nT7R7OPCsTMRhYLqQYws+JLkwGPyM08tFe1Iv3
 cQh+Olw4OLJspw0pZeHFkuSA+80W5n0k7E4g+er/SA8e3WvqE6Cowq5AB517wDUCXayWsk
 j9bB7VTr6z1VXeccCqm1R4INDPlGJu0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-mUKNquzEO-ewlXXwfAUERw-1; Thu, 14 Nov 2019 13:41:07 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4ECA31005500;
 Thu, 14 Nov 2019 18:41:06 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-254.rdu2.redhat.com
 [10.10.120.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 956A45C219;
 Thu, 14 Nov 2019 18:41:04 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] afs: Fix race in commit bulk status fetch
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Date: Thu, 14 Nov 2019 18:41:03 +0000
Message-ID: <157375686331.16781.5317786612607603165.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: mUKNquzEO-ewlXXwfAUERw-1
X-Mimecast-Spam-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_104114_705223_A1733764 
X-CRM114-Status: GOOD (  12.51  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [205.139.110.120 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: dhowells@redhat.com, marc.dionne@auristor.com,
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

When a lookup is done, the afs filesystem will perform a bulk status-fetch
operation on the requested vnode (file) plus the next 49 other vnodes from
the directory list (in AFS, directory contents are downloaded as blobs and
parsed locally).  When the results are received, it will speculatively
populate the inode cache from the extra data.

However, if the lookup races with another lookup on the same directory, but
for a different file - one that's in the 49 extra fetches, then if the bulk
status-fetch operation finishes first, it will try and update the inode
from the other lookup.

If this other inode is still in the throes of being created, however, this
will cause an assertion failure in afs_apply_status():

	BUG_ON(test_bit(AFS_VNODE_UNSET, &vnode->flags));

on or about fs/afs/inode.c:175 because it expects data to be there already
that it can compare to.

Fix this by skipping the update if the inode is being created as the
creator will presumably set up the inode with the same information.

Fixes: 39db9815da48 ("afs: Fix application of the results of a inline bulk status fetch")
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Marc Dionne <marc.dionne@auristor.com>
---

 fs/afs/dir.c |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index cc12772d0a4d..497f979018c2 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -803,7 +803,12 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 			continue;
 
 		if (cookie->inodes[i]) {
-			afs_vnode_commit_status(&fc, AFS_FS_I(cookie->inodes[i]),
+			struct afs_vnode *iv = AFS_FS_I(cookie->inodes[i]);
+
+			if (test_bit(AFS_VNODE_UNSET, &iv->flags))
+				continue;
+
+			afs_vnode_commit_status(&fc, iv,
 						scb->cb_break, NULL, scb);
 			continue;
 		}


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
