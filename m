Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1C61EE900
	for <lists+linux-afs@lfdr.de>; Thu,  4 Jun 2020 18:58:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UA0rBAUU0KCucHAt0I4P63gTRskJhjs1JzwYgK/9Pnc=; b=LrHedqdAR3xqkC
	TizkaznMe1Oblu0N8OSEfksd0VMAbgqqqnd+B1GfwTyDjzVxsPvYBje3rZy7SHkNkKH1wlDbw7Juy
	Zh6YQU4JoqP6CvS12ZvHp0n6gEd7aa8cq/U8mDvy+TWo7XshaHeYK6Et8xZcc+/NIHwhKcWAHKbfy
	dqJldDSG0reNPDYUkUkSB3mHU73dcUyWoFVTFLvPQqHT1yN7TWJn5xSBema9I4inzKcdOJFTuxn9p
	OAH3aiAYA9E75a0ngVCRfMH3JUd4+qtpk00m+61N31X+DDxCMtj4MKMqkOm/eF6LvR3zafciII0Ya
	lE+YVkLn5uurL1bCouiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgtCN-0001Qy-WA; Thu, 04 Jun 2020 16:58:36 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgtCJ-0001PI-QD
 for linux-afs@lists.infradead.org; Thu, 04 Jun 2020 16:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591289907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ErqaEYtQq+8H+ACe+CCYKF90Lhb/HNJTuhEz/C6gzAU=;
 b=O7EfOuppHUxYZrUq69UuxbCTK06iK7ZPGsGyVFebVKPnUC6unK4/uER/Du4p3qOGPZI6mv
 vOOQLapyo0/37wMqUJla7/vWXTWOgw5p2TqnBL4gHB9Nmz1hG21reqiToR1xEfIaAeQBmN
 8D8pDei0AUWeFWIlDG07vIw5MJQtkJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-7SWia1yiMD-_yMrw-eLbKA-1; Thu, 04 Jun 2020 12:58:23 -0400
X-MC-Unique: 7SWia1yiMD-_yMrw-eLbKA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37CBD1005510;
 Thu,  4 Jun 2020 16:58:22 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFCAF7CCD2;
 Thu,  4 Jun 2020 16:58:19 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] afs: Improvements for v5.8
MIME-Version: 1.0
Content-ID: <2240659.1591289899.1@warthog.procyon.org.uk>
Date: Thu, 04 Jun 2020 17:58:19 +0100
Message-ID: <2240660.1591289899@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_095831_929553_7FF024AB 
X-CRM114-Status: GOOD (  25.07  )
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
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
 linux-kernel@vger.kernel.org, dhowells@redhat.com, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi Linus,

Is it too late to put in a pull request for AFS changes?  Apologies - I was
holding off and hoping that I could get Al to review the changes I made to
the core VFS change commit (first in the series) in response to his earlier
review comments.  I have an ack for the Ext4 changes made, though.  If you
would prefer it to be held off at this point, fair enough.

Note that the series also got rebased to -rc7 to remove the dependency on
fix patches that got merged through the net tree.

---

There's one core VFS change which affects a couple of filesystems:

 (1) Make the inode hash table RCU safe and providing some RCU-safe
     accessor functions.  The search can then be done without taking the
     inode_hash_lock.  Care must be taken because the object may be being
     deleted and no wait is made.

 (2) Allow iunique() to avoid taking the inode_hash_lock.

 (3) Allow AFS's callback processing to avoid taking the inode_hash_lock
     when using the inode table to find an inode to notify.

 (4) Improve Ext4's time updating.  Konstantin Khlebnikov said "For now,
     I've plugged this issue with try-lock in ext4 lazy time update.  This
     solution is much better."

Then there's a set of changes to make a number of improvements to the AFS
driver:

 (1) Improve callback (ie. third party change notification) processing by:

     (a) Relying more on the fact we're doing this under RCU and by using
     	 fewer locks.  This makes use of the RCU-based inode searching
     	 outlined above.

     (b) Moving to keeping volumes in a tree indexed by volume ID rather
     	 than a flat list.

     (c) Making the server and volume records logically part of the cell.
     	 This means that a server record now points directly at the cell
     	 and the tree of volumes is there.  This removes an N:M mapping
     	 table, simplifying things.

 (2) Improve keeping NAT or firewall channels open for the server callbacks
     to reach the client by actively polling the fileserver on a timed
     basis, instead of only doing it when we have an operation to process.

 (3) Improving detection of delayed or lost callbacks by including the
     parent directory in the list of file IDs to be queried when doing a
     bulk status fetch from lookup.  We can then check to see if our copy
     of the directory has changed under us without us getting notified.

 (4) Determine aliasing of cells (such as a cell that is pointed to be a
     DNS alias).  This allows us to avoid having ambiguity due to
     apparently different cells using the same volume and file servers.

 (5) Improve the fileserver rotation to do more probing when it detects
     that all of the addresses to a server are listed as non-responsive.
     It's possible that an address that previously stopped responding has
     become responsive again.

Beyond that, lay some foundations for making some calls asynchronous:

 (1) Turn the fileserver cursor struct into a general operation struct and
     hang the parameters off of that rather than keeping them in local
     variables and hang results off of that rather than the call struct.

 (2) Implement some general operation handling code and simplify the
     callers of operations that affect a volume or a volume component (such
     as a file).  Most of the operation is now done by core code.

 (3) Operations are supplied with a table of operations to issue different
     variants of RPCs and to manage the completion, where all the required
     data is held in the operation object, thereby allowing these to be
     called from a workqueue.

 (4) Put the standard "if (begin), while(select), call op, end" sequence
     into a canned function that just emulates the current behaviour for
     now.

There are also some fixes interspersed:

 (1) Don't let the EACCES from ICMP6 mapping reach the user as such, since
     it's confusing as to whether it's a filesystem error.  Convert it to
     EHOSTUNREACH.

 (2) Don't use the epoch value acquired through probing a server.  If we
     have two servers with the same UUID but in different cells, it's hard
     to draw conclusions from them having different epoch values.

 (3) Don't interpret the argument to the CB.ProbeUuid RPC as a fileserver
     UUID and look up a fileserver from it.

 (4) Deal with servers in different cells having the same UUIDs.  In the
     event that a CB.InitCallBackState3 RPC is received, we have to break
     the callback promises for every server record matching that UUID.

 (5) Don't let afs_statfs return values that go below 0.

 (6) Don't use running fileserver probe state to make server selection and
     address selection decisions on.  Only make decisions on final state as
     the running state is cleared at the start of probing.

Tested-by: Marc Dionne <marc.dionne@auristor.com>

Thanks,
David
---
The following changes since commit 9cb1fd0efd195590b828b9b865421ad345a4a145:

  Linux 5.7-rc7 (2020-05-24 15:32:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-next-20200604

for you to fetch changes up to 8409f67b6437c4b327ee95a71081b9c7bfee0b00:

  afs: Adjust the fileserver rotation algorithm to reprobe/retry more quickly (2020-06-04 15:37:58 +0100)

----------------------------------------------------------------
AFS Changes

----------------------------------------------------------------
David Howells (27):
      vfs, afs, ext4: Make the inode hash table RCU searchable
      rxrpc: Map the EACCES error produced by some ICMP6 to EHOSTUNREACH
      rxrpc: Adjust /proc/net/rxrpc/calls to display call->debug_id not user_ID
      afs: Always include dir in bulk status fetch from afs_do_lookup()
      afs: Use the serverUnique field in the UVLDB record to reduce rpc ops
      afs: Split the usage count on struct afs_server
      afs: Actively poll fileservers to maintain NAT or firewall openings
      afs: Show more information in /proc/net/afs/servers
      afs: Make callback processing more efficient.
      afs: Set error flag rather than return error from file status decode
      afs: Remove the error argument from afs_protocol_error()
      afs: Rename struct afs_fs_cursor to afs_operation
      afs: Build an abstraction around an "operation" concept
      afs: Don't get epoch from a server because it may be ambiguous
      afs: Fix handling of CB.ProbeUuid cache manager op
      afs: Retain more of the VLDB record for alias detection
      afs: Implement client support for the YFSVL.GetCellName RPC op
      afs: Detect cell aliases 1 - Cells with root volumes
      afs: Detect cell aliases 2 - Cells with no root volumes
      afs: Detect cell aliases 3 - YFS Cells with a canonical cell name op
      afs: Add a tracepoint to track the lifetime of the afs_volume struct
      afs: Reorganise volume and server trees to be rooted on the cell
      afs: Fix the by-UUID server tree to allow servers with the same UUID
      afs: Fix afs_statfs() to not let the values go below zero
      afs: Don't use probe running state to make decisions outside probe code
      afs: Show more a bit more server state in /proc/net/afs/servers
      afs: Adjust the fileserver rotation algorithm to reprobe/retry more quickly

 fs/afs/Makefile            |    2 +
 fs/afs/afs.h               |    3 +-
 fs/afs/afs_vl.h            |    1 +
 fs/afs/callback.c          |  345 ++++--------
 fs/afs/cell.c              |   10 +-
 fs/afs/cmservice.c         |   67 +--
 fs/afs/dir.c               | 1253 ++++++++++++++++++++----------------------
 fs/afs/dir_silly.c         |  190 ++++---
 fs/afs/dynroot.c           |   93 ++++
 fs/afs/file.c              |   62 ++-
 fs/afs/flock.c             |  114 ++--
 fs/afs/fs_operation.c      |  239 ++++++++
 fs/afs/fs_probe.c          |  339 +++++++++---
 fs/afs/fsclient.c          | 1305 +++++++++++++++++---------------------------
 fs/afs/inode.c             |  491 ++++++++---------
 fs/afs/internal.h          |  523 ++++++++++--------
 fs/afs/main.c              |    6 +-
 fs/afs/proc.c              |   42 +-
 fs/afs/protocol_yfs.h      |    2 +-
 fs/afs/rotate.c            |  447 ++++++---------
 fs/afs/rxrpc.c             |   45 +-
 fs/afs/security.c          |    8 +-
 fs/afs/server.c            |  299 ++++++----
 fs/afs/server_list.c       |   40 +-
 fs/afs/super.c             |  107 ++--
 fs/afs/vl_alias.c          |  382 +++++++++++++
 fs/afs/vl_rotate.c         |    4 +
 fs/afs/vlclient.c          |  146 ++++-
 fs/afs/volume.c            |  154 ++++--
 fs/afs/write.c             |  148 +++--
 fs/afs/xattr.c             |  300 +++++-----
 fs/afs/yfsclient.c         |  914 +++++++++++++------------------
 fs/ext4/inode.c            |   44 +-
 fs/inode.c                 |  112 +++-
 include/linux/fs.h         |    3 +
 include/trace/events/afs.h |  111 +++-
 net/rxrpc/peer_event.c     |    3 +
 net/rxrpc/proc.c           |    6 +-
 38 files changed, 4437 insertions(+), 3923 deletions(-)
 create mode 100644 fs/afs/fs_operation.c
 create mode 100644 fs/afs/vl_alias.c


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
