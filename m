Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AC31A6858
	for <lists+linux-afs@lfdr.de>; Mon, 13 Apr 2020 16:50:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZATzGH+SwruAzdhh6nj+/2yar9hbBNttRGSi1hpAbR0=; b=gfvYTVIDCzS4K1
	rF7HWZl+pzoQxcD5ccrwkWWgAuB6GeCoVPGRy7Hi8+x6udsb5FfSdh5LaL9eJkCmjtGUPlWrPjJpX
	XIM9xtowD5SZPB1FRDo21/KxBwwx5V8sXjM6dLwHucDNLTMXyPqJem6zBVR64cM6lcdhpYBkS6INZ
	5M25SUQhIkS/hl6OOfb7KLqFOYwMyw+aWA/6EL81dn6ihkVef2aHNL59bmtXqFVVf82EG8x8VUJyQ
	rs55mP4jD+MVkP4Lak6EW3QC5it0k2zcdQ0CiC423JFxBY9xZpwGyy5MDoim8/Z0ujz5MAfKV9NGM
	AZmr7v4OriZt9JYcre2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jO0Pp-00025Y-Oq; Mon, 13 Apr 2020 14:50:25 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jO0Pn-00025B-58
 for linux-afs@lists.infradead.org; Mon, 13 Apr 2020 14:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586789421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FEtIYVJIpib0M0PusMaXJ2aHzJiehmLRM7Ty7t9FWBg=;
 b=hSzfKAZyz28dYrOQN81B2kJNLLGX4d9ixHQ6JjsDJS8bMGI8Id5XvYlzEaUpUYpZSghU9U
 4cSDLEwtApwBYVn3e33KzzEKKg6Ukq7R2UZyklM8I3ZOXPdqbBN1YhDXoTTRTBx9vIn6xz
 gUfdeYTpcaB4dV2QWZ5Aa0JvpYOvXME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204--_H3N8V-Pwmh2DH0fsaWsA-1; Mon, 13 Apr 2020 10:50:19 -0400
X-MC-Unique: -_H3N8V-Pwmh2DH0fsaWsA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9B5C1005509;
 Mon, 13 Apr 2020 14:50:17 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-224.rdu2.redhat.com
 [10.10.112.224])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABEB1272A5;
 Mon, 13 Apr 2020 14:50:16 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] afs: Fixes
MIME-Version: 1.0
Content-ID: <2940558.1586789415.1@warthog.procyon.org.uk>
Date: Mon, 13 Apr 2020 15:50:15 +0100
Message-ID: <2940559.1586789415@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200413_075023_270017_012D89C0 
X-CRM114-Status: GOOD (  13.21  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi Linus,

Here are some fixes for the afs filesystem:

 (1) Fix the decoding of fetched file status records do that in advances
     the xdr pointer under all circumstances.

 (2) Fix the decoding of a fetched file status record that indicates an
     inline abort code (ie. an error) so that it sets the flag saying that
     it got an error.

 (3) Fix the decoding of the result of the rename operation so that it
     doesn't skip the decoding of the second fetched file status (ie. that
     of the dest dir) in the case that the source and dest dirs were the
     same as this causes the xdr pointer not to be advanced, leading to
     incorrect decoding of subsequent parts of the reply.

 (4) Fix the dump of a bad YFSFetchStatus record to dump the full length.

 (5) Fix a race between local editing of directory contents and accessing
     the dir for reading or d_revalidate by using the same lock in both.

 (6) Fix afs_d_revalidate() to not accidentally reverse the version on a
     dentry when it's meant to be bringing it forward.

David
---
The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-fixes-20200413

for you to fetch changes up to 40fc81027f892284ce31f8b6de1e497f5b47e71f:

  afs: Fix afs_d_validate() to set the right directory version (2020-04-13 15:09:01 +0100)

----------------------------------------------------------------
AFS fixes

----------------------------------------------------------------
David Howells (6):
      afs: Fix missing XDR advance in xdr_decode_{AFS,YFS}FSFetchStatus()
      afs: Fix decoding of inline abort codes from version 1 status records
      afs: Fix rename operation status delivery
      afs: Fix length of dump of bad YFSFetchStatus record
      afs: Fix race between post-modification dir edit and readdir/d_revalidate
      afs: Fix afs_d_validate() to set the right directory version

 fs/afs/dir.c       | 108 +++++++++++++++++++++++++++++++++--------------------
 fs/afs/dir_silly.c |  22 +++++++----
 fs/afs/fsclient.c  |  27 ++++++++------
 fs/afs/yfsclient.c |  26 +++++++------
 4 files changed, 112 insertions(+), 71 deletions(-)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
