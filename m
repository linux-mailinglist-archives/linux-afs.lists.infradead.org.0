Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD2F210DC
	for <lists+linux-afs@lfdr.de>; Fri, 17 May 2019 01:00:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kmzg7PUR1519h8VfhJTghO3tPJl6nMoD+gZHKPse1pI=; b=Y1WB+7XW8wLOMd
	nC9mTFB6roPesbux4dGibMtpfR+UUkrBNtbKUFoq51i86+vA6cextIOEdAi7SszFefulNQ4K2UseN
	yxh0on0wYboR0+FISSd3AOm7G0u4PmEozU5gQEI74598+DaTBIMzkcPIOUJZTdjjkvXBWxaKcG3tK
	/AyabS56Melru8oZj4jANJdSuAJwTl1gh6bpcKI/Xc2CGQBc0qlEBFDzZIHlOsehBW5DEAmJXy6dN
	JiR48mY9bLTjhLifIiF+l2wxxpvAtHj/uWKw1DL/NvlnUiwGX3Ysg13kUj9UGao3DBimEy49TRUS4
	qrLsN8NCuGReBTfbADzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRPMi-00044n-Uk; Thu, 16 May 2019 23:00:44 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRPMd-00043z-NJ
 for linux-afs@lists.infradead.org; Thu, 16 May 2019 23:00:43 +0000
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 71D033082E46;
 Thu, 16 May 2019 23:00:28 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C18A95E1A2;
 Thu, 16 May 2019 23:00:22 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] afs: Miscellaneous fixes
MIME-Version: 1.0
Content-ID: <14410.1558047621.1@warthog.procyon.org.uk>
Date: Fri, 17 May 2019 00:00:21 +0100
Message-ID: <14411.1558047621@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 16 May 2019 23:00:33 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_160039_918326_9B043AAB 
X-CRM114-Status: GOOD (  17.27  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-BeenThere: linux-afs@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, Joe Perches <joe@perches.com>,
 Jonathan Billings <jsbillings@jsbillings.org>,
 Marc Dionne <marc.dionne@auristor.com>,
 Colin Ian King <colin.king@canonical.com>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi Linus,

Could you pull this series please?  It fixes a set of miscellaneous issues
in the afs filesystem, including:

 (1) Leak of keys on file close.

 (2) Broken error handling in xattr functions.

 (3) Missing locking when updating VL server list.

 (4) Volume location server DNS lookup whereby preloaded cells may not ever
     get a lookup and regular DNS lookups to maintain server lists consume
     power unnecessarily.

 (5) Incorrect error propagation and handling in the fileserver iteration
     code causes operations to sometimes apparently succeed.

 (6) Interruption of server record check/update side op during fileserver
     iteration causes uninterruptible main operations to fail unexpectedly.

 (7) Callback promise expiry time miscalculation.

 (8) Over invalidation of the callback promise on directories.

 (9) Double locking on callback break waking up file locking waiters.

(10) Double increment of the vnode callback break counter.

Note that it makes some changes outside of the afs code, including:

 (A) Adding an extra parameter to dns_query() to allow the dns_resolver key
     just accessed to be immediately invalidated.  AFS is caching the
     results itself, so the key can be discarded.

 (B) Adding an interruptible version of wait_var_event().

 (C) Adding an rxrpc function to allow the maximum lifespan to be set on a
     call.

 (D) Adding a way for an rxrpc call to be marked as non-interruptible.

Signed-off-by: David Howells <dhowells@redhat.com>
Tested-by: Marc Dionne <marc.dionne@auristor.com>
---
The following changes since commit 80f232121b69cc69a31ccb2b38c1665d770b0710:

  Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next (2019-05-07 22:03:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-fixes-20190516

for you to fetch changes up to fd711586bb7d63f257da5eff234e68c446ac35ea:

  afs: Fix double inc of vnode->cb_break (2019-05-16 16:25:21 +0100)

----------------------------------------------------------------
AFS fixes

----------------------------------------------------------------
David Howells (19):
      afs: Fix key leak in afs_release() and afs_evict_inode()
      afs: Fix incorrect error handling in afs_xattr_get_acl()
      afs: Fix afs_xattr_get_yfs() to not try freeing an error value
      afs: Fix missing lock when replacing VL server list
      afs: Fix afs_cell records to always have a VL server list record
      dns_resolver: Allow used keys to be invalidated
      Add wait_var_event_interruptible()
      afs: Fix cell DNS lookup
      afs: Fix "kAFS: AFS vnode with undefined type 0"
      rxrpc: Provide kernel interface to set max lifespan on a call
      afs: Fix the maximum lifespan of VL and probe calls
      afs: Fix error propagation from server record check/update
      rxrpc: Allow the kernel to mark a call as being non-interruptible
      afs: Make some RPC operations non-interruptible
      afs: Make dynamic root population wait uninterruptibly for proc_cells_lock
      afs: Fix calculation of callback expiry time
      afs: Don't invalidate callback if AFS_VNODE_DIR_VALID not set
      afs: Fix lock-wait/callback-break double locking
      afs: Fix double inc of vnode->cb_break

 Documentation/networking/rxrpc.txt |  21 ++++-
 fs/afs/addr_list.c                 |   2 +-
 fs/afs/afs.h                       |   3 +
 fs/afs/callback.c                  |   8 +-
 fs/afs/cell.c                      | 187 ++++++++++++++++++++++---------------
 fs/afs/dir.c                       |  18 ++--
 fs/afs/dir_silly.c                 |   4 +-
 fs/afs/dynroot.c                   |   5 +-
 fs/afs/file.c                      |   9 +-
 fs/afs/flock.c                     |   9 +-
 fs/afs/fsclient.c                  |  77 +++++++++------
 fs/afs/inode.c                     |  12 +--
 fs/afs/internal.h                  |  22 +++--
 fs/afs/proc.c                      |   8 +-
 fs/afs/rotate.c                    |  29 ++++--
 fs/afs/rxrpc.c                     |   7 +-
 fs/afs/security.c                  |   4 +-
 fs/afs/server.c                    |  17 +++-
 fs/afs/super.c                     |   2 +-
 fs/afs/vl_list.c                   |  20 ++--
 fs/afs/vl_rotate.c                 |  28 +++++-
 fs/afs/vlclient.c                  |   4 +
 fs/afs/write.c                     |   2 +-
 fs/afs/xattr.c                     | 103 ++++++++++----------
 fs/afs/yfsclient.c                 |  98 +++++++++----------
 fs/cifs/dns_resolve.c              |   2 +-
 fs/nfs/dns_resolve.c               |   2 +-
 include/linux/dns_resolver.h       |   3 +-
 include/linux/wait_bit.h           |  13 +++
 include/net/af_rxrpc.h             |   3 +
 net/ceph/messenger.c               |   2 +-
 net/dns_resolver/dns_query.c       |   6 +-
 net/rxrpc/af_rxrpc.c               |  28 ++++++
 net/rxrpc/ar-internal.h            |   2 +
 net/rxrpc/call_object.c            |   2 +
 net/rxrpc/conn_client.c            |   8 +-
 net/rxrpc/sendmsg.c                |   4 +-
 37 files changed, 478 insertions(+), 296 deletions(-)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
