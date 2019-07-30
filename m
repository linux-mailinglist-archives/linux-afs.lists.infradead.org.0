Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 221647AB6D
	for <lists+linux-afs@lfdr.de>; Tue, 30 Jul 2019 16:50:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TxWZTCtZhzlvqqK9A+lYv/e0vJbYlq3RCSdNPVW0mL4=; b=OVrvVJAIrIF6xW
	VXliFrxl6uZGV4LO26KNL9bRyW6R4OvDBU+2mdTOYm+VZnS5DhT8IZxvaYE9CvFr2Fyi1FG2nF/JB
	NJqeJWj/RhJOS8NCPC0FwKL7oyiyx5GKSQNzog2gPagR0cEhsqgmdhBfcGs5svfhpe03Pu8FbvJmT
	/bss7PYZZBVCcVHwTrGsup7qqvxzsxz1wKfu1UCjo09VsN4WHVLYJB0gjPOdc3YrY933H7mr0AOzZ
	Y1A4sDUsFaWj6IHmpwKEvUPYikibpTrxMCsh5/FJCrJuAKww1YeBcIEWq1Iy4eOzX2hM8DPB3qmfk
	uCMMZle0gWUxPLVloS0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsTSD-0008Pc-Lw; Tue, 30 Jul 2019 14:50:17 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsTSA-0008Ap-FH
 for linux-afs@lists.infradead.org; Tue, 30 Jul 2019 14:50:16 +0000
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C911E3082E69;
 Tue, 30 Jul 2019 14:50:12 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08D9B60BE5;
 Tue, 30 Jul 2019 14:50:11 +0000 (UTC)
Subject: [PATCH net 0/2] rxrpc: Fixes
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Tue, 30 Jul 2019 15:50:11 +0100
Message-ID: <156449821120.9558.2821927090314866621.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 30 Jul 2019 14:50:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_075014_659373_9D846D9A 
X-CRM114-Status: GOOD (  10.60  )
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


Here are a couple of fixes for rxrpc:

 (1) Fix a potential deadlock in the peer keepalive dispatcher.

 (2) Fix a missing notification when a UDP sendmsg error occurs in rxrpc.


The patches are tagged here:

	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
	rxrpc-fixes-20190730

and can also be found on the following branch:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=rxrpc-fixes

David
---
David Howells (2):
      rxrpc: Fix potential deadlock
      rxrpc: Fix the lack of notification when sendmsg() fails on a DATA packet


 net/rxrpc/ar-internal.h |    1 +
 net/rxrpc/peer_event.c  |    2 +-
 net/rxrpc/peer_object.c |   18 ++++++++++++++++++
 net/rxrpc/sendmsg.c     |    1 +
 4 files changed, 21 insertions(+), 1 deletion(-)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
