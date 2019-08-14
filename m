Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A13C8D5CB
	for <lists+linux-afs@lfdr.de>; Wed, 14 Aug 2019 16:18:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VNg1Wbmz+W3Kx87qL/HkK+6kZmCOrEo8raC1q+957v8=; b=XneWyYdJQHSvbn
	ibuta3fEDzUhftqEOGhzoLV5Ux5fh+2ha3HWF+8JkIXjWariUi6T6tqAdetGEjGPVdpC5fYLIfrX/
	6zwDq8tmtEZY1Ts636lg2+L/XzaUdIiglUvRz/PmDoISPkxJbCPJZsfgYIu66/FIzjjZ9qffsT3fK
	ersqwKpdh0LPpLHOsyumQzJ1MnxpFPaOlWMxkjUshpJUbvmUCQLr94IecH8V5I2mPAVX/hK/UvhjF
	I1Twg0Dg1NVKLowALfI6oYFK81J09dhY+Pc2JNqlaz8WHkG6Lnq518MFCcu2yMpZefZUyp5qiKXWE
	T4rp7fZeJHr09kXahL8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxu6v-0006Gl-5O; Wed, 14 Aug 2019 14:18:45 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxu6s-0006G5-9X
 for linux-afs@lists.infradead.org; Wed, 14 Aug 2019 14:18:43 +0000
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ED1A6309BF21;
 Wed, 14 Aug 2019 14:18:41 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A71625C1D4;
 Wed, 14 Aug 2019 14:18:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] afs: Fixes
MIME-Version: 1.0
Content-ID: <13850.1565792319.1@warthog.procyon.org.uk>
Date: Wed, 14 Aug 2019 15:18:40 +0100
Message-ID: <13851.1565792320@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Wed, 14 Aug 2019 14:18:42 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_071842_352352_E2772999 
X-CRM114-Status: GOOD (  13.48  )
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
Cc: linux-kernel@vger.kernel.org, dhowells@redhat.com,
 linux-fsdevel@vger.kernel.org, baijiaju1990@gmail.com,
 marc.dionne@auristor.com, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi Linus,

Can you pull these afs fixes please?

 (1) Fix the CB.ProbeUuid handler to generate its reply correctly.

 (2) Fix a mix up in indices when parsing a Volume Location entry record.

 (3) Fix a potential NULL-pointer deref when cleaning up a read request.

 (4) Fix the expected data version of the destination directory in
     afs_rename().

 (5) Fix afs_d_revalidate() to only update d_fsdata if it's not the same as
     the directory data version to reduce the likelihood of overwriting the
     result of a competing operation.  (d_fsdata carries the directory DV
     or the least-significant word thereof).

 (6) Fix the tracking of the data-version on a directory and make sure that
     dentry objects get properly initialised, updated and revalidated.

     Also fix rename to update d_fsdata to match the new directory's DV if
     the dentry gets moved over and unhash the dentry to stop
     afs_d_revalidate() from interfering.

David
---
The following changes since commit 2a11c76e5301dddefcb618dac04f74e6314df6bc:

  Merge tag 'for_linus' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost (2019-07-29 11:34:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-fixes-20190814

for you to fetch changes up to 9dd0b82ef530cdfe805c9f7079c99e104be59a14:

  afs: Fix missing dentry data version updating (2019-07-30 14:38:52 +0100)

----------------------------------------------------------------
AFS Fixes

Reviewed-by: Marc Dionne <marc.dionne@auristor.com>

----------------------------------------------------------------
David Howells (4):
      afs: Fix the CB.ProbeUuid service handler to reply correctly
      afs: Fix off-by-one in afs_rename() expected data version calculation
      afs: Only update d_fsdata if different in afs_d_revalidate()
      afs: Fix missing dentry data version updating

Jia-Ju Bai (1):
      fs: afs: Fix a possible null-pointer dereference in afs_put_read()

Marc Dionne (1):
      afs: Fix loop index mixup in afs_deliver_vl_get_entry_by_name_u()

 fs/afs/cmservice.c | 10 ++----
 fs/afs/dir.c       | 89 ++++++++++++++++++++++++++++++++++++++++++++----------
 fs/afs/file.c      | 12 +++++---
 fs/afs/vlclient.c  | 11 ++++---
 4 files changed, 89 insertions(+), 33 deletions(-)

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
