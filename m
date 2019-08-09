Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5301087EE7
	for <lists+linux-afs@lfdr.de>; Fri,  9 Aug 2019 18:06:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QloFvmDIbYeyTVzCIwoDr20iZFDPuLc+x3cRItXGhao=; b=kzRQLgxUBJ+MTg
	Bfe0S2VofdOu/UIshrcoBMkXL5Bvqs5vagE9hha3MadA+H/Xj6TufDiJAbjrDw66JF1SEMDr8vHyU
	m9KQDj+hI4/eO970/LYpsJZ7x4s+u4sW2cpgs7yaOeG3juLy73c27iovm91wyOwkFVQHKm+4G0lcH
	b/UZ6erH9njjEJ31tiPyNvZjNkLKYoiewK+f7W/8jGxVHyJ7wHtVsQIVxzd22UanNlRTt7b4Cv3xv
	xPDIe+DFrnu20u2ENGzB9laBvutd8wRZDxu3eArrrzKPX1VEVdDdFEtcBM9MfYfLZ1nTa8XaRn9aR
	UGCW604OfWXq2Ip0Ltpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hw7Oq-00088U-Qf; Fri, 09 Aug 2019 16:05:52 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw7Oo-00087S-Fh
 for linux-afs@lists.infradead.org; Fri, 09 Aug 2019 16:05:51 +0000
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3F497306F4A9;
 Fri,  9 Aug 2019 16:05:48 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64C275C29A;
 Fri,  9 Aug 2019 16:05:47 +0000 (UTC)
Subject: [PATCH net 0/2] rxrpc: Fixes
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Fri, 09 Aug 2019 17:05:46 +0100
Message-ID: <156536674651.17478.15139844428920800280.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 09 Aug 2019 16:05:48 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190809_090550_550814_7CD30007 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


Here's a couple of fixes for rxrpc:

 (1) Fix refcounting of the local endpoint.

 (2) Don't calculate or report packet skew information.  This has been
     obsolete since AFS 3.1 and so is a waste of resources.


The patches are tagged here:

	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
	rxrpc-fixes-20190809

and can also be found on the following branch:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=rxrpc-fixes

David
---
David Howells (2):
      rxrpc: Fix local endpoint refcounting
      rxrpc: Don't bother generating maxSkew in the ACK packet


 net/rxrpc/af_rxrpc.c     |    6 ++-
 net/rxrpc/ar-internal.h  |    8 +++-
 net/rxrpc/call_event.c   |   15 +++-----
 net/rxrpc/input.c        |   59 +++++++++++++++-----------------
 net/rxrpc/local_object.c |   86 +++++++++++++++++++++++++++++-----------------
 net/rxrpc/output.c       |    3 +-
 net/rxrpc/recvmsg.c      |    6 ++-
 7 files changed, 100 insertions(+), 83 deletions(-)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
