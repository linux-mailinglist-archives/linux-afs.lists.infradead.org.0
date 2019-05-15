Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1A81FBE5
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 22:58:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i89ne4DZey9fBQRnCFRMXT6FkXIlCxqnU2q061oeGkQ=; b=D6+s85iT/nTSUu
	JHbKdrXMfeJRDPyAo9QNLp0U44CkMK4U7eW1JQ1ui0VgLETTQAfOkRCnyfA6BmMopXd4SqufxMccZ
	pM+k9ShxxqlhcfsPIt4nYpHZ8g9pOXTQkxVzPrvU/K99mozQxVmk7G4pZEsYTJn8rHSlKWeYlh2bw
	Iz9+6n4DTYCoCIY5NtF67Uw6XFtQ4aAkos7gMPL/138CEmJpZBRtWXmsRlnHskXbCTLdMGDTRBCi7
	rSHqUc9yHYT5tyY2ZfiZld60qMQSM/4lpHiova5PZMW+LxiQnfhl+XDYs3UyKy97qDBhSc2DQcQia
	3yiOjl9kaCViFAsHaBrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hR0yo-0002li-Hq; Wed, 15 May 2019 20:58:26 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hR0yk-0002lI-MG
 for linux-afs@lists.infradead.org; Wed, 15 May 2019 20:58:24 +0000
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4B3CD30001EB;
 Wed, 15 May 2019 20:58:22 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D0FF600C4;
 Wed, 15 May 2019 20:58:20 +0000 (UTC)
Subject: [PATCH 00/12] AFS callback handling fixes
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 15 May 2019 21:58:19 +0100
Message-ID: <155795389933.28355.4028912870853910492.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Wed, 15 May 2019 20:58:22 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_135822_765844_07D3852F 
X-CRM114-Status: GOOD (  17.82  )
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
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


Here's a set of patches for AFS that fix callback handling, where a
callback indicates some sort of change to a file or volume.

The problem is that changes made by other clients aren't always noticed,
primarily because the file status information and the callback information
aren't updated in the same critical section, even if these are carried in
the same reply from an RPC operation, and so the AFS_VNODE_CB_PROMISED flag
is unreliable.

Arranging for them to be done in the same critical section for the
FS.InlineBulkStatus op is tricky as all the statuses in the reply arrive
and then all the callbacks.

Also new inodes (either newly fetched or newly created) aren't properly
managed against a callback break happening before we get the local inode up
and running.

[*] Note that callback break counters as mentioned here are counters of
    server events that cancel one or more callback promises that the client
    thinks it has.  A broken promise indicates that the client needs to
    refetch a vnode's status from the server.

    This client counts the events and compares the counters before and
    after the operation to see if the callback promise it thinks it just
    got evaporated before it got recorded.

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

 (4) afs_vnode_commit_status() then detects deletion, revises the file
     status and notes callback information inside of a single critical
     section.  It also checks the callback break counters and cancels the
     callback promise if they changed during the operation.

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


The patches can be found here:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git
	tag afs-fixes-b-20190515

David
---
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


 fs/afs/afs.h       |   13 +
 fs/afs/callback.c  |   21 +-
 fs/afs/cmservice.c |   14 +
 fs/afs/dir.c       |  357 +++++++++++++++++++---------
 fs/afs/dir_silly.c |   31 ++
 fs/afs/file.c      |   20 +-
 fs/afs/flock.c     |   13 -
 fs/afs/fs_probe.c  |    4 
 fs/afs/fsclient.c  |  657 +++++++++++++++++-----------------------------------
 fs/afs/inode.c     |  444 +++++++++++++++++++++++++++--------
 fs/afs/internal.h  |  167 +++++++------
 fs/afs/rotate.c    |   18 +
 fs/afs/rxrpc.c     |   13 -
 fs/afs/security.c  |   15 +
 fs/afs/super.c     |   20 +-
 fs/afs/vl_probe.c  |    4 
 fs/afs/vlclient.c  |   34 +--
 fs/afs/write.c     |   98 ++++----
 fs/afs/xattr.c     |  103 ++++++--
 fs/afs/yfsclient.c |  652 +++++++++++++++-------------------------------------
 20 files changed, 1335 insertions(+), 1363 deletions(-)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
