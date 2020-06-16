Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 144831FC130
	for <lists+linux-afs@lfdr.de>; Tue, 16 Jun 2020 23:52:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4N6NqGJkCCX3w1Irjj9QqEHZ9V4NNUMwES11XS91iDY=; b=NTBSeOSPLseXv6
	HIJPi+AMfaKS6ZpuNtIYPuxI/D7wbTkH7Y3iC8mQw0wEj3WLtHoiYUc193oVlsliLVKF4eJ0BEnLr
	o6fa/KOqQK2sjL2AqSUiWFdHPamh4MO2cYR8EGaTTbk80e4+P/jmDATouaVefqYlWna2q1dldPaZA
	oq0eRpfKmw0fi9nbdNx4g7H4bPsyOBfCSeiJ0Amse8rRRImd5Sy4aKIPV1pTptCHWKUGvtnB0rTQJ
	UYlqQlTKzehhyHW0Jxh1YkqydgfRPQqe3ijfVTIs6rVHsBdr0duE9nZedkrhosPurJzDcnODeJ7Aa
	HCc2+Jh9+UbqDEW4J+jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlJUq-0002rU-NK; Tue, 16 Jun 2020 21:51:56 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlJUo-0002r8-Cl
 for linux-afs@lists.infradead.org; Tue, 16 Jun 2020 21:51:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592344312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Pa26AneX0j3DPUjeJdvfIiB6K0FofWmkV9YrdZxZmQs=;
 b=a55P7Mb3q4p4wgansmTh5VoQXMTNEK0CdutfOOBHSuAvTX/Nm/NvFkMe/8p8Wk3sYxS5Rl
 47F7HisAYwlLL1rkJtb8b+IwyvDhtlW/xQdZQL1jkpO5y+bSsVLMtSgNuvnpbqzKeiyBMl
 wmUoDnOta+tInw+mR1JXfvG9dlBzzUM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-ShKAFPiiPxSqZyoOOcsMPg-1; Tue, 16 Jun 2020 17:51:50 -0400
X-MC-Unique: ShKAFPiiPxSqZyoOOcsMPg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D324C10059B4;
 Tue, 16 Jun 2020 21:51:48 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A59DA60C80;
 Tue, 16 Jun 2020 21:51:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] afs: Fixes for bugs found by xfstests
MIME-Version: 1.0
Content-ID: <930957.1592344306.1@warthog.procyon.org.uk>
Date: Tue, 16 Jun 2020 22:51:46 +0100
Message-ID: <930958.1592344306@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_145154_506349_C678D5C5 
X-CRM114-Status: GOOD (  16.46  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [205.139.110.61 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: dhowells@redhat.com, marc.dionne@auristor.com,
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi Linus,

I've managed to get xfstests kind of working with afs.  Here are a set of
patches that fix most of the bugs found.

There are a number of primary issues:

 (1) Incorrect handling of mtime and non-handling of ctime.  It might be
     argued, that the latter isn't a bug since the AFS protocol doesn't
     support ctime, but I should probably still update it locally.

 (2) Shared-write mmap, truncate and writeback bugs.  This includes not
     changing i_size under the callback lock, overwriting local i_size with
     the reply from the server after a partial writeback, not limiting the
     writeback from an mmapped page to EOF.

 (3) Checks for an abort code indicating that the primary vnode in an
     operation was deleted by a third-party are done in the wrong place.

 (4) Silly rename bugs.  This includes an incomplete conversion to the new
     operation handling, duplicate nlink handling, nlink changing not being
     done inside the callback lock and insufficient handling of third-party
     conflicting directory changes.

And some secondary ones:

 (1) The UAEOVERFLOW abort code should map to EOVERFLOW not EREMOTEIO.

 (2) Remove a couple of unused or incompletely used bits.

 (3) Remove a couple of redundant success checks.

These seem to fix all the data-corruption bugs found by "./check -afs -g
quick", along with the obvious silly rename bugs and time bugs.

There are still some test failures, but they seem to fall into two classes:
firstly, the authentication/security model is different to the standard
UNIX model and permission is arbitrated by the server and cached locally;
and secondly, there are a number of features that AFS does not support
(such as mknod).  But in these cases, the tests themselves need to be
adapted or skipped.

Using the in-kernel afs client with xfstests also found a bug in the
AuriStor AFS server that has been fixed for a future release.

David
---
The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-fixes-20200616

for you to fetch changes up to b6489a49f7b71964e37978d6f89bbdbdb263f6f5:

  afs: Fix silly rename (2020-06-16 22:00:28 +0100)

----------------------------------------------------------------
AFS fixes

----------------------------------------------------------------
David Howells (12):
      afs: Fix non-setting of mtime when writing into mmap
      afs: afs_write_end() should change i_size under the right lock
      afs: Fix EOF corruption
      afs: Concoct ctimes
      afs: Fix truncation issues and mmap writeback size
      afs: Fix the mapping of the UAEOVERFLOW abort code
      afs: Remove yfs_fs_fetch_file_status() as it's not used
      afs: Fix yfs_fs_fetch_status() to honour vnode selector
      afs: Remove afs_operation::abort_code
      afs: Fix use of afs_check_for_remote_deletion()
      afs: afs_vnode_commit_status() doesn't need to check the RPC error
      afs: Fix silly rename

 fs/afs/dir.c          | 62 ++++++++++++++++++++++++++++++----
 fs/afs/dir_silly.c    | 38 +++++++++++++++------
 fs/afs/file.c         |  2 +-
 fs/afs/flock.c        |  4 +--
 fs/afs/fs_operation.c | 10 +++++-
 fs/afs/inode.c        | 91 ++++++++++++++++++++++++++++++++++++++-----------
 fs/afs/internal.h     | 36 +++++++++++++-------
 fs/afs/misc.c         |  1 +
 fs/afs/write.c        | 12 +++++--
 fs/afs/yfsclient.c    | 93 ++++++++++++++-------------------------------------
 10 files changed, 225 insertions(+), 124 deletions(-)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
