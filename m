Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D73361F879
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 18:25:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FpHMORhM0KjI1HorfI37y73hunzsuQTXI2iEQD0p11k=; b=bd1qlc3GDX23xR
	3qsN8IuTNuSGDm+AI0nYqpnDUOfQNOfuNLFg9blLJwjgD4J5I29y5YDmK0AlwgSbMFDuiCK0RG7+n
	mPIwU/yE9ipgK6VrkWYmCUeh7nJM6tibI0k4kPkuZaDxEHPkcHeWUCxqUU/uNSaUC0OlLxbFVcD7m
	frZN5GUnhqcwxbUKY8R7ky1ZX/2ZjNh+OEuXaGNbMa1TbGx1QDkGFm4mWTUemvnd94sOl4IUtGSgm
	vXI1+uOHTgLoP0tP0QvEsUtNo4mHaRSET0uXzCz73BvLFzQ87jAEGkzcLZtTnqnc2i2cYSfB4HGaY
	7FhZCQcih/dqdArKbNHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQwiu-0001ST-W5; Wed, 15 May 2019 16:25:44 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQwir-0001KC-IK
 for linux-afs@lists.infradead.org; Wed, 15 May 2019 16:25:43 +0000
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1ADE18830A;
 Wed, 15 May 2019 16:25:40 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4164A60F81;
 Wed, 15 May 2019 16:25:38 +0000 (UTC)
Subject: [PATCH 00/15] AFS fixes
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 15 May 2019 17:25:37 +0100
Message-ID: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Wed, 15 May 2019 16:25:40 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_092541_648139_660B904B 
X-CRM114-Status: GOOD (  13.76  )
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
 Colin Ian King <colin.king@canonical.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


Here's a set of patches for AFS that fix the following issues:

 (1) Leak of keys on file close.

 (2) Broken error handling in xattr functions.

 (3) Missing locking when updating VL server list.

 (4) Volume location server DNS lookup whereby preloaded cells may not ever
     get a lookup and regular DNS lookups to maintain server lists consume
     power unnecessarily.

 (5) Callback promise expiry time miscalculation.

 (6) Over invalidation of the callback promise on directories.

 (7) Double locking on callback break waking up file locking waiters.

 (8) Double increment of the vnode callback break counter.

The patches can be found here:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git
	tag afs-fixes-20190515

David
---
David Howells (15):
      afs: Fix key leak in afs_release() and afs_evict_inode()
      afs: Fix incorrect error handling in afs_xattr_get_acl()
      afs: Fix afs_xattr_get_yfs() to not try freeing an error value
      afs: Fix missing lock when replacing VL server list
      afs: Fix afs_cell records to always have a VL server list record
      dns_resolver: Allow used keys to be invalidated
      Add wait_var_event_interruptible()
      afs: Fix cell DNS lookup
      rxrpc: Allow the kernel to mark a call as being non-interruptible
      afs: Make some RPC operations non-interruptible
      afs: Make dynamic root population wait uninterruptibly for proc_cells_lock
      afs: Fix calculation of callback expiry time
      afs: Don't invalidate callback if AFS_VNODE_DIR_VALID not set
      afs: Fix lock-wait/callback-break double locking
      afs: Fix double inc of vnode->cb_break


 Documentation/networking/rxrpc.txt |   11 ++
 fs/afs/addr_list.c                 |    2 
 fs/afs/callback.c                  |    8 --
 fs/afs/cell.c                      |  187 ++++++++++++++++++++++--------------
 fs/afs/dir.c                       |   18 ++-
 fs/afs/dir_silly.c                 |    4 -
 fs/afs/dynroot.c                   |    5 -
 fs/afs/file.c                      |    9 +-
 fs/afs/flock.c                     |    9 +-
 fs/afs/fsclient.c                  |   76 +++++++++------
 fs/afs/inode.c                     |   12 +-
 fs/afs/internal.h                  |   21 +++-
 fs/afs/proc.c                      |    8 +-
 fs/afs/rotate.c                    |   27 +++--
 fs/afs/rxrpc.c                     |    3 -
 fs/afs/security.c                  |    4 -
 fs/afs/super.c                     |    2 
 fs/afs/vl_list.c                   |   20 ++--
 fs/afs/vl_rotate.c                 |   28 ++++-
 fs/afs/write.c                     |    2 
 fs/afs/xattr.c                     |  103 ++++++++++----------
 fs/afs/yfsclient.c                 |   98 +++++++++----------
 fs/cifs/dns_resolve.c              |    2 
 fs/nfs/dns_resolve.c               |    2 
 include/linux/dns_resolver.h       |    3 -
 include/linux/wait_bit.h           |   13 +++
 include/net/af_rxrpc.h             |    1 
 net/ceph/messenger.c               |    2 
 net/dns_resolver/dns_query.c       |    6 +
 net/rxrpc/af_rxrpc.c               |    3 +
 net/rxrpc/ar-internal.h            |    2 
 net/rxrpc/call_object.c            |    2 
 net/rxrpc/conn_client.c            |    8 +-
 net/rxrpc/sendmsg.c                |    4 +
 34 files changed, 412 insertions(+), 293 deletions(-)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
