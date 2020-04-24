Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D98311B7951
	for <lists+linux-afs@lfdr.de>; Fri, 24 Apr 2020 17:19:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5XhGPvonvt80wBJEjmclb9sOmHO2anS9JgrdLEoLcH4=; b=lqC4kFxpBu3tgP
	vaUnXjsV5DZzDN44gBMX8BHOkGdzhdRLg6nqFsbnA2f13g0Wq/ZeB2G8srpMpCt6xvskRAADjk/nH
	p4WCwyeXCAypuDwhOInoSa/j0RDWtbMdqKHW25dTUU03KiFbl4l1XKe1sKcB3ssylQGIUtPEUobCp
	knjFMM8I3S0oTnBNhb/2pqnT2ULs3J2Wn6fJTsp0pk+jnaNMd4DdvlIExSFU3IbuKDO0/N2o9ZMw/
	bcTAlAVFMxCl7aWJMCdXf2mY6TYta7cm1qoBgIPrACI4mZXfpYbScw9/Jboqz3Y7TT4sJ5OquBgfG
	kyi5iOXDRsbKNooCWW8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS07Q-00036g-Jx
	for lists+linux-afs@lfdr.de; Fri, 24 Apr 2020 15:19:56 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS07O-00035d-78
 for linux-afs@lists.infradead.org; Fri, 24 Apr 2020 15:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587741591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Hup8zMplhzCtriOS6DgGXays5t9vNVweQrUya2JH8v4=;
 b=ex7Yp2MGjsfz/1Z8cSmtbuuWDRQHRmrMGGuFjlTkPsJ4GCZ3zMBHIPee/OUwZKDjifesCn
 2fDHa+tKnRs9AXjvZ0Pg6ywuvaSuC2+/HKYfhehPAV5hQwrYPtRGy6JtVPLg/Qso2UvOC5
 M+xrN/Y0LvxkGlC85jloecE4QOn0uaM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-3lctEr2_M3277HjaZZgtFw-1; Fri, 24 Apr 2020 11:19:49 -0400
X-MC-Unique: 3lctEr2_M3277HjaZZgtFw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CED71009633;
 Fri, 24 Apr 2020 15:19:48 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-129.rdu2.redhat.com
 [10.10.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C3925D9D5;
 Fri, 24 Apr 2020 15:19:47 +0000 (UTC)
Subject: [PATCH 0/8] afs: NAT-mitigation and other bits
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 24 Apr 2020 16:19:46 +0100
Message-ID: <158774158625.3619859.10579201535876583842.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_081954_339155_07F0C0BC 
X-CRM114-Status: GOOD (  15.17  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [207.211.31.81 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: linux-fsdevel@vger.kernel.org, dhowells@redhat.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


The primary part of this patchset, is intended to help deal with the
effects of using an AFS client that is communicating with a server through
some sort of NAT or firewall, whereby if the just right amount of time
lapses before a third party change is made, the client thinks it still has
a valid callback, but the server's attempt to notify the client of the
change bounces because the NAT/firewall window has closed.  The problem is
that kafs does insufficient probing to maintain the firewall window.

The effect is mitigated in the following ways:

 (1) When an FS.InlineBulkStatus op is sent to the server during a file
     lookup, the FID of the directory being looked up in will now get
     included in the list of vnodes to query.  This will find out more
     quickly if the dir has changed.

 (2) The fileserver is now polled regularly by an independent, timed
     manager rather than only being polled by the rotation algorithm when
     someone does a VFS operation that performs an RPC call.

I have included some other bits in the patchset also:

 (1) Apply uninterruptibility a bit more thoroughly.  There are more places
     that need it yet, but they're harder to fix.

 (2) Use the serverUnique field from the VLDB record to trigger a recheck
     of a fileserver's endpoints rather than doing it on a timed basis
     separately for each fileserver.  This reduces the number of VL RPCs
     performed, albeit it's a minor reduction.

 (3) Note when we have detected the epoch from the fileserver so that the
     code that checks it actually does its stuff.

 (4) Remove some unused bits in the code.

Note that I've spotted some bugs in the fileserver rotation algorithm, but
that's going to need its own rewrite as the structure of it is wrong.

David
---
David Howells (8):
      afs: Always include dir in bulk status fetch from afs_do_lookup()
      afs: Make record checking use TASK_UNINTERRUPTIBLE when appropriate
      afs: Use the serverUnique field in the UVLDB record to reduce rpc ops
      afs: Fix to actually set AFS_SERVER_FL_HAVE_EPOCH
      afs: Remove some unused bits
      afs: Split the usage count on struct afs_server
      afs: Actively poll fileservers to maintain NAT or firewall openings
      afs: Show more information in /proc/net/afs/servers


 fs/afs/cmservice.c         |    8 +
 fs/afs/dir.c               |    9 +
 fs/afs/fs_probe.c          |  280 +++++++++++++++++++++++++++++++++-----------
 fs/afs/fsclient.c          |   24 ++--
 fs/afs/internal.h          |   58 ++++++---
 fs/afs/main.c              |    5 +
 fs/afs/proc.c              |   18 ++-
 fs/afs/rotate.c            |   13 +-
 fs/afs/rxrpc.c             |    2 
 fs/afs/server.c            |  201 +++++++++++++++++++-------------
 fs/afs/server_list.c       |    7 +
 fs/afs/vl_rotate.c         |    4 -
 fs/afs/vlclient.c          |    1 
 fs/afs/volume.c            |   32 +++--
 include/trace/events/afs.h |   22 +++
 15 files changed, 455 insertions(+), 229 deletions(-)



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
