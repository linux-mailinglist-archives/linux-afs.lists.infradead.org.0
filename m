Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D1411BEF8
	for <lists+linux-afs@lfdr.de>; Wed, 11 Dec 2019 22:18:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+aAQfaaqU7Q0BjdJc0LwS3D0RJt17i6lFQIz0tHt+OQ=; b=ggu2BLu2iq+ASR
	KpBd/ob9QmUCs/TpsSqs8QY7CVOc/k2Qfob9KSIXyCyYAn4nETStjiJl6VYp9lBeAl5zAASI5uWbi
	ypS3YmwrBHvLOUcPkIECVmw1PQ/GxASB4Usi7MyA7VMzmQu1pXYm07ICAZO92C8eV2WX5ZmkpiPBo
	Quat2U6WqiCmXho9qlHAtBHf+SuQnI/XEQFhyFnCjIUwpElZh0o+dH9stCZSzwXGPw8fABXzlpajL
	cDl1MpE7AVFl5YeX0aqschzxwK5p83uc5x+8bbTIyz5DxlNIZpsP4wEcqgSIvXqdhoC1b4RkQMuar
	PqEkeaWBBIcrfbNYOEDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1if9N5-0000td-RN; Wed, 11 Dec 2019 21:18:11 +0000
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1if9N2-0000rl-82
 for linux-afs@lists.infradead.org; Wed, 11 Dec 2019 21:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576099085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1gkHAV6AkdXG94RN9Oij+HZ41qo1cez84ILH4J7NqOk=;
 b=KmWDCSexhctE27GSLPxOAPU94b7bhK94xpTfKZOqWX6HIiCYxKKh1RgxhYOSwCFJ9AJURO
 dt12Iu8XtDvpMlZVkXtvOJef3sge4KeZjZOzhBOEf459MYkMwsg56lcCk3Ueh/mpNnfDmm
 hGN2XSevw+AM3WtPOa97IH1zMTbSqNU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-TDBzj13RNbGsMxE6IW3x0Q-1; Wed, 11 Dec 2019 16:18:01 -0500
X-MC-Unique: TDBzj13RNbGsMxE6IW3x0Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C32791005502;
 Wed, 11 Dec 2019 21:17:59 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-52.rdu2.redhat.com
 [10.10.120.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 639875DA2C;
 Wed, 11 Dec 2019 21:17:58 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] afs: Miscellaneous fixes
MIME-Version: 1.0
Content-ID: <11742.1576099077.1@warthog.procyon.org.uk>
Date: Wed, 11 Dec 2019 21:17:57 +0000
Message-ID: <11743.1576099077@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_131808_369826_A0F2FD9B 
X-CRM114-Status: GOOD (  14.08  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [207.211.31.81 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: linux-kernel@vger.kernel.org, dhowells@redhat.com,
 linux-fsdevel@vger.kernel.org, jsbillings@jsbillings.org,
 marc.dionne@auristor.com, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi Linus,

Can you pull these fixes for AFS plus one patch to make debugging easier:

 (1) Fix how addresses are matched to server records.  This is currently
     incorrect which means cache invalidation callbacks from the server
     don't necessarily get delivered correctly.  This causes stale data and
     metadata to be seen under some circumstances.

 (2) Make the dynamic root superblock R/W so that rpm/dnf can reapply the
     SELinux label to it when upgrading the Fedora filesystem-afs package.
     If the filesystem is R/O, this fails and the upgrade fails.

     It might be better in future to allow setxattr from an LSM to bypass
     the R/O protections, if only for pseudo-filesystems.

 (3) Fix the parsing of mountpoint strings.  The mountpoint object has to
     have a terminal dot, whereas the source/device string passed to mount
     should not.  This confuses type-forcing suffix detection leading to
     the wrong volume variant being mounted.

 (4) Make lookups in the dynamic root superblock for creation events (such
     as mkdir) fail with EOPNOTSUPP rather than something like EEXIST.  The
     dynamic root only allows implicit creation by the ->lookup() method -
     and only if the target cell exists.

 (5) Fix the looking up of an AFS superblock to include the cell in the
     matching key - otherwise all volumes with the same ID number are
     treated as the same thing, irrespective of which cell they're in.

 (6) Show the volume name of each volume in the volume records displayed in
     /proc/net/afs/<cell>/volumes.  This proved useful in debugging (5) as
     it provides a way to map the volume IDs to names, where the names are
     what appear in /proc/mounts.

Patch (6) can be dropped and deferred to the next merge window if you'd
prefer as it's not strictly a fix.

David
---
The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-fixes-20191211

for you to fetch changes up to 50559800b76a7a2a46da303100da639536261808:

  afs: Show volume name in /proc/net/afs/<cell>/volumes (2019-12-11 17:48:20 +0000)

----------------------------------------------------------------
AFS fixes

----------------------------------------------------------------
David Howells (5):
      afs: Fix SELinux setting security label on /afs
      afs: Fix mountpoint parsing
      afs: Fix creation calls in the dynamic root to fail with EOPNOTSUPP
      afs: Fix missing cell comparison in afs_test_super()
      afs: Show volume name in /proc/net/afs/<cell>/volumes

Marc Dionne (1):
      afs: Fix afs_find_server lookups for ipv4 peers

 fs/afs/dynroot.c |  3 +++
 fs/afs/mntpt.c   |  6 ++++--
 fs/afs/proc.c    |  7 ++++---
 fs/afs/server.c  | 21 ++++++++-------------
 fs/afs/super.c   |  2 +-
 5 files changed, 20 insertions(+), 19 deletions(-)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
