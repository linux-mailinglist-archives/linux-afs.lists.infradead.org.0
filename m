Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D661B7B38
	for <lists+linux-afs@lfdr.de>; Fri, 24 Apr 2020 18:12:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w0nXsjdj4AlXtt0gydz3qaoRe5ymQOWXHlo34WVtFnk=; b=r//Q0QKiwnz4OT
	q9klrwiUA3ycDYcYiuD5ZDfuIVIFv2G0N1TyTUBhqiSs1lvvICt7UeHTQlQAcAzwrZS9jirKxQ6VA
	6sUbvDvAdj8wOtI38hLOiiG3j2Fd4N/gmCjShUWeBoxW3yxb3tNtPMcqeAPFVXZPPREZoJNuZ/bT0
	yIEqeAqx+9bTzcB1M2Z5ckDOFB/Fsn04mGWBqI+5GKmaZJuZxrcSEU2xEsZieP3B/31Xsk9f9LOSO
	eqHZb6eOCT92/zYPY9zFMoAvQk9bbmK+69VB+eqbjUZLF/JNkVQ2GUCDRubQujQPCNrndnpxo08nb
	a7KgWPO8SK8VREl8LXKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS0wJ-0005AV-3m; Fri, 24 Apr 2020 16:12:31 +0000
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS0wG-00059x-Jo
 for linux-afs@lists.infradead.org; Fri, 24 Apr 2020 16:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587744747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5OM2DPWHYM7y/6bsE5cL+3KwCNnH0bhlvscHbPBdZpg=;
 b=c65viZWzPBRCKHifj+zwCIlQONhuMpa4apoNOJSm8zqPXOn+ra5bht0pkkH6nLJTgZypQg
 wlZ6WaAPmnLz6PgkxFv5L0dw19TV58/sgSA7C3WZU8B2P8DucUaVhoGv9gr4HyzziN3vGy
 qsRCpTp9aO/QetYCNesclgV/NtlBCSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-tLRd7sxgNXGK1lxtdLGmnA-1; Fri, 24 Apr 2020 12:12:25 -0400
X-MC-Unique: tLRd7sxgNXGK1lxtdLGmnA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1A2B107B7C4;
 Fri, 24 Apr 2020 16:12:23 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-129.rdu2.redhat.com
 [10.10.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 002201001B2C;
 Fri, 24 Apr 2020 16:12:22 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] afs: Miscellaneous fixes
MIME-Version: 1.0
Content-ID: <3632015.1587744742.1@warthog.procyon.org.uk>
Date: Fri, 24 Apr 2020 17:12:22 +0100
Message-ID: <3632016.1587744742@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_091228_733865_0571794C 
X-CRM114-Status: GOOD (  11.79  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [207.211.31.81 listed in wl.mailspike.net]
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

Could you pull these three miscellaneous fixes to the afs filesystem:

 (1) Remove some struct members that aren't used, aren't set or aren't
     read, plus a wake up that nothing ever waits for.

 (2) Actually set the AFS_SERVER_FL_HAVE_EPOCH flag so that the code that
     depends on it can work.

 (3) Make a couple of waits uninterruptible if they're done for an
     operation that isn't supposed to be interruptible.

Thanks,
David
---
The following changes since commit ae83d0b416db002fe95601e7f97f64b59514d936:

  Linux 5.7-rc2 (2020-04-19 14:35:30 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-fixes-20200424

for you to fetch changes up to c4bfda16d1b40d1c5941c61b5aa336bdd2d9904a:

  afs: Make record checking use TASK_UNINTERRUPTIBLE when appropriate (2020-04-24 16:33:32 +0100)

----------------------------------------------------------------
AFS miscellany

----------------------------------------------------------------
David Howells (3):
      afs: Remove some unused bits
      afs: Fix to actually set AFS_SERVER_FL_HAVE_EPOCH
      afs: Make record checking use TASK_UNINTERRUPTIBLE when appropriate

 fs/afs/cmservice.c | 2 +-
 fs/afs/fs_probe.c  | 5 +----
 fs/afs/internal.h  | 4 +---
 fs/afs/rotate.c    | 6 +++---
 fs/afs/server.c    | 7 ++-----
 fs/afs/vl_rotate.c | 4 ++--
 fs/afs/volume.c    | 8 +++++---
 7 files changed, 15 insertions(+), 21 deletions(-)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
