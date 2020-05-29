Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D981E8A90
	for <lists+linux-afs@lfdr.de>; Sat, 30 May 2020 00:00:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XkFG51tmcOpKW9FE236flsi+WxjmaiscqxCl70Edj10=; b=Zuh5zapZXT6ekr
	SUfCF+Ml2ZVQMA8h9YnrLSYieuAvJz4X+XSpWreRMEhoNaW6zaKUIvN3fLP65pYoExzc1sWkFkt6A
	SU5D1Q7nt2aZnu83ah1/lwQ42SDcMRS+b8ybp4MGmD5XJNHwXQdyLs7y6zSbY9OipeZzfVvN0B/t1
	rgw7XmhvjXoGAy2E3w6K//uRP9HUbfcud9S3q6YVq9xD/dQPmO3cvbdw1/7mECFKpDMHiX/cvFxPu
	H9yjZCUqBltFTTZAe73mbbmuEnaitQTE7MVInMLSj28bb+bG3i6jq+qhCmwlscpkSG+YLjxjJEB8S
	AtlBuHz3h20YlBqKx7ew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jen32-0001Jd-7A; Fri, 29 May 2020 22:00:16 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jen2y-0000VJ-Du
 for linux-afs@lists.infradead.org; Fri, 29 May 2020 22:00:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590789608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pxbvmVbl9lsruKM4AA1eWb8CAia0DHVSFuL5O/ctfrI=;
 b=CHPpi7q6RERdJOM2Xr3ZTsDE2aUj+6qwdTioO1gNFpfhHLa3QOvQpZE8DqYDwZuAHJ0+xg
 EpxSCtucWrPF31QcwCE5SBQNTri9zKdIGm2MJ9FCU+AoObO++D/e9W+KU+q63FTqaNH4VU
 fpFKh9mkDycmDva6IqDgZfSBv2hMg2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-ufnsmF08M5m8DCBHuapQYg-1; Fri, 29 May 2020 18:00:04 -0400
X-MC-Unique: ufnsmF08M5m8DCBHuapQYg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 806BD18A8220;
 Fri, 29 May 2020 22:00:02 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 968BB5C1B5;
 Fri, 29 May 2020 22:00:00 +0000 (UTC)
Subject: [PATCH 00/27] afs: Improvements
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 29 May 2020 22:59:59 +0100
Message-ID: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_150012_546363_41A77D2C 
X-CRM114-Status: GOOD (  18.49  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.61 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
 linux-kernel@vger.kernel.org, dhowells@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


Here's a set of patches to make a number of improvements to the AFS driver:

 (1) Improve callback (ie. third party change notification) processing by:

     (a) Relying more on the fact we're doing this under RCU and by using
     	 fewer locks.

     	 This involves making the inode hash table RCU safe and providing
     	 some RCU-safe accessor functions.  The search can then be done
     	 without taking the inode_hash_lock.  Care must be taken because
     	 the object may be being deleted and no wait is made.

 	 This is also used to improve Ext4's time updating.  Konstantin
     	 Khlebnikov said "For now, I've plugged this issue with try-lock in
     	 ext4 lazy time update.  This solution is much better."

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

The patches are here:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=afs-next

David
---
David Howells (1):
      afs: Adjust the fileserver rotation algorithm to reprobe/retry more quickly


 fs/afs/Makefile            |    2 +
 fs/afs/afs.h               |    3 +-
 fs/afs/afs_vl.h            |    1 +
 fs/afs/callback.c          |  345 ++++--------
 fs/afs/cell.c              |   10 +-
 fs/afs/cmservice.c         |   67 +--
 fs/afs/dir.c               | 1253 ++++++++++++++++++++----------------------
 fs/afs/dir_silly.c         |  190 +++----
 fs/afs/dynroot.c           |   93 ++++
 fs/afs/file.c              |   62 ++-
 fs/afs/flock.c             |  114 ++--
 fs/afs/fs_operation.c      |  239 ++++++++
 fs/afs/fs_probe.c          |  339 +++++++++---
 fs/afs/fsclient.c          | 1295 +++++++++++++++++---------------------------
 fs/afs/inode.c             |  491 ++++++++---------
 fs/afs/internal.h          |  523 ++++++++++--------
 fs/afs/main.c              |    6 +-
 fs/afs/proc.c              |   42 +-
 fs/afs/protocol_yfs.h      |    2 +-
 fs/afs/rotate.c            |  443 ++++++---------
 fs/afs/rxrpc.c             |   45 +-
 fs/afs/security.c          |    8 +-
 fs/afs/server.c            |  299 ++++++----
 fs/afs/server_list.c       |   40 +-
 fs/afs/super.c             |  107 ++--
 fs/afs/vl_alias.c          |  384 +++++++++++++
 fs/afs/vl_rotate.c         |    4 +
 fs/afs/vlclient.c          |  146 ++++-
 fs/afs/volume.c            |  152 ++++--
 fs/afs/write.c             |  148 +++--
 fs/afs/xattr.c             |  300 +++++-----
 fs/afs/yfsclient.c         |  914 +++++++++++++------------------
 fs/ext4/inode.c            |   44 +-
 fs/inode.c                 |  173 +++++-
 include/linux/fs.h         |    3 +
 include/trace/events/afs.h |  111 +++-
 net/rxrpc/peer_event.c     |    3 +
 net/rxrpc/proc.c           |    6 +-
 38 files changed, 4484 insertions(+), 3923 deletions(-)
 create mode 100644 fs/afs/fs_operation.c
 create mode 100644 fs/afs/vl_alias.c



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
