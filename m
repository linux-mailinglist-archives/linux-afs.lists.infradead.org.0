Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 21166210E2
	for <lists+linux-afs@lfdr.de>; Fri, 17 May 2019 01:02:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OcA0YVtUMM/A8IGgA1Av8iOE46Z2yOvkmI34LDlByjM=; b=edeRBojw7AEkwV
	1CEFGNO8qWpSK8V6S+DRLqZYt1ou6B404vIl2LHUauD4FVbAwJoOTw222+bHdx6zR4OId8mnZXNuE
	uNlN/KH/OgJt5UsF31N+zz/kPtY1z9DCmIAYj1f3UGKNqhoghUrTlj0XKSMLOGRwSJ0rvCbz3OVu2
	FH49Fj6o769h+stuXK+02QBtlJAD2GsiiTGYD4vBYXjxpUncEjYeM2ykNQ5LSpJJICZRPivV/uOJm
	GVuWMXr75dRz0hfz/9iXA/kwwe2b4A1XsP/uyXzM6wzpVwgakGfsvzov58mdypwZQrE/6UuqjSSfy
	JJVoRwRHGNjyuoSbL83w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRPOB-0004Q7-US; Thu, 16 May 2019 23:02:15 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRPO8-0004Pa-H0
 for linux-afs@lists.infradead.org; Thu, 16 May 2019 23:02:14 +0000
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 45C62305B16F;
 Thu, 16 May 2019 23:02:07 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB9C45D6A9;
 Thu, 16 May 2019 23:02:04 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] afs: Fix callback promise handling
MIME-Version: 1.0
Content-ID: <14597.1558047724.1@warthog.procyon.org.uk>
Date: Fri, 17 May 2019 00:02:04 +0100
Message-ID: <14598.1558047724@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 16 May 2019 23:02:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_160212_601189_BA1C99C4 
X-CRM114-Status: GOOD (  21.30  )
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
Cc: Marc Dionne <marc.dionne@auristor.com>, dhowells@redhat.com,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonathan Billings <jsbillings@jsbillings.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi Linus,

Could you pull this series on top of the "afs: Miscellaneous fixes" series
please?  The two are consecutive on the same branch.

This series fixes a bunch of problems in callback promise handling, where a
callback promise indicates a promise on the part of the server to notify
the client in the event of some sort of change to a file or volume.  In the
event of a break, the client has to go and refetch the client status from
the server and discard any cached permission information as the ACL might
have changed.

The problem in the current code is that changes made by other clients
aren't always noticed, primarily because the file status information and
the callback information aren't updated in the same critical section, even
if these are carried in the same reply from an RPC operation, and so the
AFS_VNODE_CB_PROMISED flag is unreliable.

Arranging for them to be done in the same critical section during reply
decoding is tricky because of the FS.InlineBulkStatus op - which has all
the statuses in the reply arriving and then all the callbacks, so they have
to be buffered.  It simplifies things a lot to move the critical section
out of the decode phase and do it after the RPC function returns.

Also new inodes (either newly fetched or newly created) aren't properly
managed against a callback break happening before we get the local inode up
and running.

Fix this by:

 (1) There's now a combined file status and callback record (struct
     afs_status_cb) to carry both plus some flags.

 (2) Each operation wrapper function allocates sufficient afs_status_cb
     records for all the vnodes it is interested in and passes them into
     RPC operations to be filled in from the reply.

 (3) The FileStatus and CallBack record decoders no longer apply the
     new/revised status and callback information to the inode/vnode at the
     point of decoding and instead store the information into the record
     from (2).

 (4) afs_vnode_commit_status() then revises the file status, detects
     deletion and notes callback information inside of a single critical
     section.  It also checks the callback break counters and cancels the
     callback promise if they changed during the operation.

     [*] Note that "callback break counters" are counters of server events
     that cancel one or more callback promises that the client thinks it
     has.  The client counts the events and compares the counters before
     and after an operation to see if the callback promise it thinks it
     just got evaporated before it got recorded under lock.

 (5) Volume and server callback break counters are passed into afs_iget()
     allowing callback breaks concurrent with inode set up to be detected
     and the callback promise thence to be cancelled.

 (6) AFS validation checks are now done under RCU conditions using a read
     lock on cb_lock.  This requires vnode->cb_interest to be made RCU
     safe.

 (7) If the checks in (6) fail, the callback breaker is then called under
     write lock on the cb_lock - but only if the callback break counter
     didn't change from the value read before the checks were made.

 (8) Results from FS.InlineBulkStatus that correspond to inodes we
     currently have in memory are now used to update those inodes' status
     and callback information rather than being discarded.  This requires
     those inodes to be looked up before the RPC op is made and all their
     callback break values saved.

To aid in this, the following changes have also been made:

 (A) Don't pass the vnode into the reply delivery functions or the
     decoders.  The vnode shouldn't be altered anywhere in those paths.
     The only exception, for the moment, is for the call done hook for file
     lock ops that wants access to both the vnode and the call - this can
     be fixed at a later time.

 (B) Get rid of the call->reply[] void* array and replace it with named and
     typed members.  This avoids confusion since different ops were mapping
     different reply[] members to different things.

 (C) Fix an order-1 kmalloc allocation in afs_do_lookup() and replace it
     with kvcalloc().

 (D) Always get the reply time.  Since callback, lock and fileserver record
     expiry times are calculated for several RPCs, make this mandatory.

 (E) Call afs_pages_written_back() from the operation wrapper rather than
     from the delivery function.

 (F) Don't store the version and type from a callback promise in a reply as
     the information in them is of very limited use.

Signed-off-by: David Howells <dhowells@redhat.com>
Tested-by: Marc Dionne <marc.dionne@auristor.com>
---
The following changes since commit fd711586bb7d63f257da5eff234e68c446ac35ea:

  afs: Fix double inc of vnode->cb_break (2019-05-16 16:25:21 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-fixes-b-20190516

for you to fetch changes up to 39db9815da489b47b50b8e6e4fc7566a77bd18bf:

  afs: Fix application of the results of a inline bulk status fetch (2019-05-16 22:23:21 +0100)

----------------------------------------------------------------
AFS fixes

----------------------------------------------------------------
David Howells (12):
      afs: Don't pass the vnode pointer through into the inline bulk status op
      afs: Get rid of afs_call::reply[]
      afs: Fix order-1 allocation in afs_do_lookup()
      afs: Always get the reply time
      afs: Fix application of status and callback to be under same lock
      afs: Don't save callback version and type fields
      afs: Split afs_validate() so first part can be used under LOOKUP_RCU
      afs: Make vnode->cb_interest RCU safe
      afs: Clear AFS_VNODE_CB_PROMISED if we detect callback expiry
      afs: Fix unlink to handle YFS.RemoveFile2 better
      afs: Pass pre-fetch server and volume break counts into afs_iget5_set()
      afs: Fix application of the results of a inline bulk status fetch

 fs/afs/afs.h       |  13 +-
 fs/afs/callback.c  |  21 +-
 fs/afs/cmservice.c |  14 +-
 fs/afs/dir.c       | 357 ++++++++++++++++++----------
 fs/afs/dir_silly.c |  31 ++-
 fs/afs/file.c      |  20 +-
 fs/afs/flock.c     |  40 +++-
 fs/afs/fs_probe.c  |   4 +-
 fs/afs/fsclient.c  | 673 ++++++++++++++++++-----------------------------------
 fs/afs/inode.c     | 445 ++++++++++++++++++++++++++---------
 fs/afs/internal.h  | 179 +++++++-------
 fs/afs/rotate.c    |  18 +-
 fs/afs/rxrpc.c     |  13 +-
 fs/afs/security.c  |  15 +-
 fs/afs/super.c     |  20 +-
 fs/afs/vl_probe.c  |   4 +-
 fs/afs/vlclient.c  |  34 ++-
 fs/afs/write.c     |  98 ++++----
 fs/afs/xattr.c     | 103 +++++---
 fs/afs/yfsclient.c | 662 ++++++++++++++++------------------------------------
 20 files changed, 1383 insertions(+), 1381 deletions(-)

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
