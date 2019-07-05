Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3548D60D43
	for <lists+linux-afs@lfdr.de>; Fri,  5 Jul 2019 23:45:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1CPbf8cOulKH8zsZol3m38nOR7pSQnQBNdY/GxY4qBc=; b=pc0Pkl5uUa66u5
	zvPAL0h5dQEaVPG23noM2Q5kZ5f6HCCwq74TRc8cA0j8exiNom9FQlOZw1hJkofp/XUivDd0cCbzc
	kxYFLyjWeO95p0JzJPACVaWvSvbo4/oRJIRPqLCCTOhw5j3o1Qcz3dqnPqX1InpeXzTe1OzoB6ss3
	MHW7/2hAyMRB3EgcWA8M0OUSyRF9/kDCslMF5KH8zbhPJxtz7dcK05q3V67odBaoByjunsz0GzpYd
	qEAF1DnQtZLQW3Ua0DvjrjM2VNPDPSo35qFvDgrKS9KG8QegAw0kZhIfWtkFFgewFKIMbU6v8gALS
	5D7yF08CDRCbB/NgBJUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hjW1Z-0005cl-CY; Fri, 05 Jul 2019 21:45:45 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjW1W-0005c7-Qj
 for linux-afs@lists.infradead.org; Fri, 05 Jul 2019 21:45:44 +0000
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6F5C9307D84D;
 Fri,  5 Jul 2019 21:45:42 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-9.rdu2.redhat.com
 [10.10.120.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FFE918958;
 Fri,  5 Jul 2019 21:45:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] afs: Miscellany for 5.3
MIME-Version: 1.0
Content-ID: <29484.1562363139.1@warthog.procyon.org.uk>
Date: Fri, 05 Jul 2019 22:45:39 +0100
Message-ID: <29485.1562363139@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 05 Jul 2019 21:45:42 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190705_144542_886138_FC43A621 
X-CRM114-Status: GOOD (  13.70  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
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
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org, jmorris@namei.org,
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi Linus,

Here's a set of minor changes for AFS for the next merge window:

 (1) Remove an unnecessary check in afs_unlink().

 (2) Add a tracepoint for tracking callback management.

 (3) Add a tracepoint for afs_server object usage.

 (4) Use struct_size().

 (5) Add mappings for AFS UAE abort codes to Linux error codes, using
     symbolic names rather than hex numbers in the .c file.

David
---
The following changes since commit 2cd42d19cffa0ec3dfb57b1b3e1a07a9bf4ed80a:

  afs: Fix setting of i_blocks (2019-06-20 18:12:02 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-next-20190628

for you to fetch changes up to 1eda8bab70ca7d353b4e865140eaec06fedbf871:

  afs: Add support for the UAE error table (2019-06-28 18:37:53 +0100)

----------------------------------------------------------------
AFS development

----------------------------------------------------------------
David Howells (4):
      afs: afs_unlink() doesn't need to check dentry->d_inode
      afs: Add some callback management tracepoints
      afs: Trace afs_server usage
      afs: Add support for the UAE error table

Zhengyuan Liu (1):
      fs/afs: use struct_size() in kzalloc()

 fs/afs/callback.c          |  20 ++++---
 fs/afs/cmservice.c         |   5 +-
 fs/afs/dir.c               |  21 ++++----
 fs/afs/file.c              |   6 +--
 fs/afs/fsclient.c          |   2 +-
 fs/afs/inode.c             |  17 +++---
 fs/afs/internal.h          |  18 +++----
 fs/afs/misc.c              |  48 +++++++----------
 fs/afs/protocol_uae.h      | 132 +++++++++++++++++++++++++++++++++++++++++++++
 fs/afs/rxrpc.c             |   2 +-
 fs/afs/server.c            |  39 +++++++++++---
 fs/afs/server_list.c       |   6 ++-
 fs/afs/write.c             |   3 +-
 include/trace/events/afs.h | 132 +++++++++++++++++++++++++++++++++++++++++++++
 14 files changed, 369 insertions(+), 82 deletions(-)
 create mode 100644 fs/afs/protocol_uae.h


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
