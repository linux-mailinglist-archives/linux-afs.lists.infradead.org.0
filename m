Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F314B391D
	for <lists+linux-afs@lfdr.de>; Mon, 16 Sep 2019 13:09:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d+yC0QK9slR9hISROZUhrfBfunWDL4o7AD/4z8yTERQ=; b=sGBTzX1kOpQyc/
	aDRi3KQMAWw9VYcTn2A1NMoYcdM+8wN2/B47eK72I/QXCOLIOVDiQbyALQyD78S76GymhDJ2en7yj
	2/qByo46tAkidn/uXUBqYP9KkBsElX0QoqGjxdXxAq2kBkqEraLl9apSow8fzZNpZ2ib74xMWogz+
	GsgdP/eomrq4LQsHa5xs4UzKMxTHLQCHFXgjALW3YK32doO9KHBjcnaPOwtq0y0MSouWMef6RycN4
	KEq+5uOTTrVs3jEHsh6Y8d0+9aWght/pssKzlUFGd/kK7lfdAoel/irf45XnmSxTXV0iCicCNcYbv
	y/X1FK7efMapSEWl+H/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9osw-0001CL-8e; Mon, 16 Sep 2019 11:09:34 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9oss-0001BZ-5p
 for linux-afs@lists.infradead.org; Mon, 16 Sep 2019 11:09:31 +0000
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 50DBD30832E1;
 Mon, 16 Sep 2019 11:09:29 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-125-72.rdu2.redhat.com
 [10.10.125.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC2C460BFB;
 Mon, 16 Sep 2019 11:09:27 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Subject: [GIT PULL afs: Development for 5.4
MIME-Version: 1.0
Content-ID: <16146.1568632167.1@warthog.procyon.org.uk>
Date: Mon, 16 Sep 2019 12:09:27 +0100
Message-ID: <16147.1568632167@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Mon, 16 Sep 2019 11:09:29 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_040930_239989_BEF33EF8 
X-CRM114-Status: GOOD (  13.21  )
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
Cc: yuehaibing@huawei.com, linux-kernel@vger.kernel.org, dhowells@redhat.com,
 linux-fsdevel@vger.kernel.org, marc.dionne@auristor.com,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi Linus,

Here's a set of patches for AFS.  The first three are trivial, deleting
unused symbols and rolling out a wrapper function.

The fourth and fifth patches make use of the previously added RCU-safe
request_key facility to allow afs_permission() and afs_d_revalidate() to
attempt to operate without dropping out of RCU-mode pathwalk.  Under
certain conditions, such as conflict with another client, we still have to
drop out anyway, take a lock and consult the server.

David
---
The following changes since commit f16180739cd18a39a1a45516ac0e65d18a9f100e:

  Merge remote-tracking branch 'net/master' into afs-next (2019-09-02 11:43:44 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-next-20190915

for you to fetch changes up to a0753c29004f4983e303abce019f29e183b1ee48:

  afs: Support RCU pathwalk (2019-09-02 11:43:54 +0100)

----------------------------------------------------------------
AFS development

Tested-by: Marc Dionne <marc.dionne@auristor.com>

----------------------------------------------------------------
David Howells (3):
      afs: Use afs_extract_discard() rather than iov_iter_discard()
      afs: Provide an RCU-capable key lookup
      afs: Support RCU pathwalk

YueHaibing (2):
      afs: remove unused variable 'afs_voltypes'
      afs: remove unused variable 'afs_zero_fid'

 fs/afs/dir.c        |  54 +++++++++++++++++++++++++-
 fs/afs/fsclient.c   |   6 +--
 fs/afs/internal.h   |   1 +
 fs/afs/security.c   | 108 +++++++++++++++++++++++++++++++++++++++++++---------
 fs/afs/volume.c     |   2 -
 fs/afs/yfsclient.c  |   6 +--
 include/linux/key.h |  14 ++++++-
 7 files changed, 162 insertions(+), 29 deletions(-)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
