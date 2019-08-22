Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 190AD9949C
	for <lists+linux-afs@lfdr.de>; Thu, 22 Aug 2019 15:10:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bvp6VuP9f8wDyF3oBlSDjGw+K21k71FCxmHCXsc9LmA=; b=fkBaB/uf/FEFZW
	eBQ+HLhe+RPDENLksXN31jY+acTdUOR9J5D35EB7/MmAofPgDYaJ3cf218sS6CwIlb9baY9pPUxUi
	hS1PeWvWQn9mJwkA5moUvb3ICm4J3G+YyPJezsEd58x2m4mBoe+VrCbRgGq0LvdsdXu64AXYg0GcG
	oKtbN6ukg6Gqg2fDF759IcowB0Ez1PjRretfK35iBIWyAcWEfKZbrbRztEnJKsCN2PQr5PBH7gyeM
	JZzDWbRT9ZOSrq9s0cCPFGV1kUIb1/5ErL2Jqj0aVnNfFpsiFSCZgJ0IbO8i1qi3/WsytgbECDE5W
	GtI+o3sjuKuy9HuWLRUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0mrW-0002tV-A3; Thu, 22 Aug 2019 13:10:46 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0mrS-0002so-Nw
 for linux-afs@lists.infradead.org; Thu, 22 Aug 2019 13:10:43 +0000
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 00F3C36955;
 Thu, 22 Aug 2019 13:10:42 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A98DB5D772;
 Thu, 22 Aug 2019 13:10:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] afs: Fixes
MIME-Version: 1.0
Content-ID: <32267.1566479439.1@warthog.procyon.org.uk>
Date: Thu, 22 Aug 2019 14:10:39 +0100
Message-ID: <32268.1566479439@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 22 Aug 2019 13:10:42 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190822_061042_798623_9E246D0D 
X-CRM114-Status: GOOD (  14.40  )
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
Cc: dhowells@redhat.com, marc.dionne@auristor.com, yuehaibing@huawei.com,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi Linus,

Here are three fixes for afs:

 (1) Fix a cell record leak due to the default error not being cleared.

 (2) Fix an oops in tracepoint due to a pointer that may contain an error.

 (3) Fix the ACL storage op for YFS where the wrong op definition is being
     used.  By luck, this only actually affects the information appearing
     in traces.

David
---
The following changes since commit d1abaeb3be7b5fa6d7a1fbbd2e14e3310005c4c1:

  Linux 5.3-rc5 (2019-08-18 14:31:08 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-fixes-20190822

for you to fetch changes up to 7533be858f5b9a036b9f91556a3ed70786abca8e:

  afs: use correct afs_call_type in yfs_fs_store_opaque_acl2 (2019-08-22 13:33:27 +0100)

----------------------------------------------------------------
AFS fixes

----------------------------------------------------------------
David Howells (1):
      afs: Fix leak in afs_lookup_cell_rcu()

Marc Dionne (1):
      afs: Fix possible oops in afs_lookup trace event

YueHaibing (1):
      afs: use correct afs_call_type in yfs_fs_store_opaque_acl2

 fs/afs/cell.c      | 4 ++++
 fs/afs/dir.c       | 3 ++-
 fs/afs/yfsclient.c | 2 +-
 3 files changed, 7 insertions(+), 2 deletions(-)

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
