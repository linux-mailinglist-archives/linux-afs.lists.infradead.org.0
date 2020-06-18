Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0533C1FFE6F
	for <lists+linux-afs@lfdr.de>; Fri, 19 Jun 2020 01:01:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lv2xhtkQo2W70tvO4hs3YNxmxO1o9FoGvInBOdb/zCg=; b=CixWU2lNBg3f6m
	ZMRV6OHIT4uJCneUdqId3tVxgSZutXzJ856txxRugUbPEO3BF2G2zJ4vr7jpKwnikV3zFaBCJubm9
	bKXxy5V6xBoVdcXBQNakC7taz+OwY6HxPkX4M+pTEM+M09UQ6VCKzsGSdoM70xgyXxy4aDpq9Jp2A
	E1m7tjhbWV06ch2LxG9rrg3TzPSbaJLDNQE1p+/29REUOmTp/OzI/E0Gz7OUa3PAVITTBg0utJ2j1
	xZvOPqPJqwk8PT/MjyNpQtreKW2rnpthQ+WW55L/jlT5BaOMIJc6835Fzl/fgu7TVe3yTrUszkiWL
	G9ALuYwEYMrso0XofTkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jm3XP-0008VC-Eo; Thu, 18 Jun 2020 23:01:39 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jm3XM-0008Uh-PM
 for linux-afs@lists.infradead.org; Thu, 18 Jun 2020 23:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592521294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fVl7NirlPBDaZbv0g3tbYP7L/Gzjwfxt3r7f0D5EtyA=;
 b=fMHKBye7qMOKzFq+rFofKjt/PWcGai6G+BvQvCxHygpQ+0yg2TmZq4S6dcKhUETjJF/XDi
 aD8NVg5LiE4BHUB1RRVdIdDP/Rhh8bepGR0ZZ8a21v13Kp/qBYkNg4EUWZ6tmv4tVltkA/
 CNLPrqir2ShHtAU2SEtzoaZz1KyrDes=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-I141doS4NfOHr44PF510Eg-1; Thu, 18 Jun 2020 19:01:32 -0400
X-MC-Unique: I141doS4NfOHr44PF510Eg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02636464;
 Thu, 18 Jun 2020 23:01:31 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07EEF5D9C5;
 Thu, 18 Jun 2020 23:01:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] afs: Fix afs_do_lookup() to call correct fetch-status op
 variant
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Date: Fri, 19 Jun 2020 00:01:28 +0100
Message-ID: <159252128817.1594103.7234386826450496394.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_160136_900000_B86000BA 
X-CRM114-Status: GOOD (  16.11  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [207.211.31.81 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Fix afs_do_lookup()'s fallback case for when FS.InlineBulkStatus isn't
supported by the server.  In the fallback, it calls FS.FetchStatus for the
specific vnode it's meant to be looking up.  Commit b6489a49f7b7 broke this
by renaming one of the two identically-named afs_fetch_status_operation
descriptors to something else so that one of them could be made non-static.
The site that used the renamed one, however, wasn't renamed and didn't
produce any warning because the other was declared in a header.

Fix this by making afs_do_lookup() use the renamed variant.

Note that there are two variants of the success method because one is
called from ->lookup() where we may or may not have an inode, but can't
call iget until after we've talked to the server - whereas the other is
called from within iget where we have an inode, but it may or may not be
initialised.

The latter variant expects there to be an inode, but because it's being
called from there former case, there might not be - resulting in an oops
like the following:

 BUG: kernel NULL pointer dereference, address: 00000000000000b0
 ...
 RIP: 0010:afs_fetch_status_success+0x27/0x7e
 ...
 Call Trace:
  ? rxrpc_cleanup_call+0xb5/0xc5
  afs_wait_for_operation+0xda/0x234
  afs_do_lookup+0x2fe/0x3c1
  afs_lookup+0x3c5/0x4bd
  __lookup_slow+0xcd/0x10f
  walk_component+0xa2/0x10c
  ? path_init+0x101/0x2eb
  path_lookupat.isra.0+0x80/0x110
  filename_lookup+0x81/0x104
  ? slab_post_alloc_hook.isra.0+0xa/0x1a
  ? kmem_cache_alloc+0xc3/0x129
  vfs_statx+0x76/0x109
  ? touch_atime+0x33/0xac
  __do_sys_newlstat+0x39/0x6b
  ? ksys_getdents64+0xb9/0xe0
  ? vtime_delta.isra.0+0xe/0x24
  ? vtime_delta.isra.0+0xe/0x24
  ? get_vtime_delta+0x12/0x20
  ? vtime_user_exit+0x21/0x61
  ? __context_tracking_exit+0x3a/0x87
  do_syscall_64+0x4c/0x78
  entry_SYSCALL_64_after_hwframe+0x44/0xa9


Fixes: b6489a49f7b7 ("afs: Fix silly rename")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/dir.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index 3e3c2bf0a722..96757f3abd74 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -845,7 +845,7 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
 		 * to FS.FetchStatus for op->file[1].
 		 */
 		op->fetch_status.which = 1;
-		op->ops = &afs_fetch_status_operation;
+		op->ops = &afs_lookup_fetch_status_operation;
 		afs_begin_vnode_operation(op);
 		afs_wait_for_operation(op);
 	}



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
