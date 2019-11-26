Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A2E10A6BE
	for <lists+linux-afs@lfdr.de>; Tue, 26 Nov 2019 23:44:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+cL3zq0Xw8nQixmecJEEWLs5U+XhMh9suIzf6+9kZEw=; b=Y+0GE99aMTCLxc
	0EKOrAP3jUxBJ3K54dOb+E/VzuMdDhScBk0v2tscyXNwzqBM0N/7Z60RRCbXTvM3WmxXqO+MrJVtp
	SLFPdeSkH+WdgJtC0kdU2O2PCw0sFK851siCJK4GQFGFPFJjM5d9ltu7YIKRnRam2wtqjFebvlXht
	sqXog7WQd7m3qlQ9dZrumHnG2USrjfIDBe/7IHYHI0IpCRdeEtJNv1KfOd+Rb+ISTMmlNNEea7FmH
	7xJunm6Cf7mzSJdA4v4NEtfMmKYDKOZqjzEtifJFTrOW869fS2cjcSQuap5RkSQOMVcnt3zCqQmLr
	6jJ4sXySXXrjpYiTUZLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZjYw-0004KS-8R; Tue, 26 Nov 2019 22:44:02 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZjYs-0004J8-Lx
 for linux-afs@lists.infradead.org; Tue, 26 Nov 2019 22:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574808235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BDiy4464Umn5P4mtuCmXuryCcZFijTYcLQRYOPE+8D8=;
 b=hMcqqG4GTYWrCs3n3NeCMuqStlsrOoZQtmlBzQ9GGpLwgg35fnAoKa2cJohBMxk/Lms9ap
 3NklCingt4JNFm94z4oG4ZdpsZYw8YdKWJ0R9iE39Zlw/8joAP4n+xJZlZq9E1Jq3GKLQj
 3t6riq6z4nM695D5RJ8Ualr5J3j2rHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-UhEfoINhPkm7Z_9hqYNzmA-1; Tue, 26 Nov 2019 17:43:52 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE1B9800C76;
 Tue, 26 Nov 2019 22:43:50 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-161.rdu2.redhat.com
 [10.10.120.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C22EB60BE2;
 Tue, 26 Nov 2019 22:43:48 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] afs: Minor cleanups and a minor bugfix
MIME-Version: 1.0
Content-ID: <27496.1574808228.1@warthog.procyon.org.uk>
Date: Tue, 26 Nov 2019 22:43:48 +0000
Message-ID: <27497.1574808228@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: UhEfoINhPkm7Z_9hqYNzmA-1
X-Mimecast-Spam-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_144358_802409_5C5E4CA3 
X-CRM114-Status: GOOD (  11.12  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [207.211.31.81 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi Linus,

Can you pull these AFS patches please?  They are:

 (1) Minor fix to make some debugging statements display information from
     the correct iov_iter.

 (2,3) Rename some members and variables to make things more obvious or
     consistent.

 (4) Provide a helper to wrap increments of the usage count on the afs_read
     struct.

 (5) Use scnprintf() to print into a stack buffer rather than sprintf().

 (6,7) Remove some set but unused variables.

There should be no functional changes from (2) - (7).

Thanks,
David
---
The following changes since commit a99d8080aaf358d5d23581244e5da23b35e340b9:

  Linux 5.4-rc6 (2019-11-03 14:07:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-next-20191121

for you to fetch changes up to 4fe171bb81b13b40bf568330ec3716dfb304ced1:

  afs: Remove set but not used variable 'ret' (2019-11-21 20:36:04 +0000)

----------------------------------------------------------------
AFS development

----------------------------------------------------------------
David Howells (4):
      afs: Use call->_iter not &call->iter in debugging statements
      afs: Switch the naming of call->iter and call->_iter
      afs: Rename desc -> req in afs_fetch_data()
      afs: Introduce an afs_get_read() refcount helper

Mark Salyzyn (1):
      afs: xattr: use scnprintf

zhengbin (2):
      afs: Remove set but not used variables 'before', 'after'
      afs: Remove set but not used variable 'ret'

 fs/afs/cmservice.c |  6 +++---
 fs/afs/dir_edit.c  | 12 ++----------
 fs/afs/file.c      |  6 +++---
 fs/afs/fsclient.c  | 16 +++++++---------
 fs/afs/internal.h  | 16 +++++++++++-----
 fs/afs/rxrpc.c     | 12 ++++++------
 fs/afs/server.c    |  3 +--
 fs/afs/vlclient.c  |  6 +++---
 fs/afs/xattr.c     | 16 +++++++++-------
 fs/afs/yfsclient.c | 11 +++++------
 10 files changed, 50 insertions(+), 54 deletions(-)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
