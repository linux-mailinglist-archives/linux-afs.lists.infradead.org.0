Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D291DF2E3
	for <lists+linux-afs@lfdr.de>; Sat, 23 May 2020 01:23:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qMB+0vXLALfuDdHg0cD8khyd/IinoL61w+UFf2mBW1Q=; b=jpiwqgGzGLTni1
	7oAHnjvfZXeLZS70G3mJb2xGV0hvKtnBjMoeSuVtwlSbY4ECnsXJhkva7BjmW0Zd0DKISK+MYXFe3
	HnXMcsAATcMPw/dR4jPvhX6Aj0izsBsufWV0Nk+CAJ1VWJRk4s6IjCVjW5ysKV4ljlLnj1YUiJvAW
	LEIFponqoFk8RdcJ2MlXvP6qCJb9Pn0qiqfsRyEhjvw7n+ykkv5P4WMOBZTcGAm/BJ9HnxqgyPN/h
	Ci+rkGiPyv7LiZ0mr8yEMOTj7ZdBy6ZVmYBLMXXiw6EtM6+apRciBf2pARG+Wx9wbylsAmASZ7KjB
	uZqoKL6wRjZSZ2l/IwHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcH0k-0004Eu-HZ; Fri, 22 May 2020 23:23:30 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcH0h-0004E4-Ae
 for linux-afs@lists.infradead.org; Fri, 22 May 2020 23:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590189805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yA8MG2xnNJx0Kt8hJUHty9G03UJJdwFcpyOZHcxGCS0=;
 b=cI7OiwFhLYhJyT5BRBi8RxgAqOe6cTG36IeRQhJAS8X2qFS3nZzeZhd3VrtKcfdT/eVos1
 FGPOHdFK8iX6wsx6XbfmaWj2uhn+RJV7V+gKBFmyednaKj3wp4r9lFSeeUgBqel2fvnbDf
 dnpnetDm91gJkh4n3XREJvR0CynBpMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-M4UY1Se6MOmGy9cPC_marg-1; Fri, 22 May 2020 19:23:24 -0400
X-MC-Unique: M4UY1Se6MOmGy9cPC_marg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0681D107ACCA;
 Fri, 22 May 2020 23:23:23 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3809160BE2;
 Fri, 22 May 2020 23:23:22 +0000 (UTC)
Subject: [PATCH net 0/2] rxrpc: Fix a warning and a leak
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Sat, 23 May 2020 00:23:21 +0100
Message-ID: <159018980141.996784.14747585629466633699.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_162327_453297_9D3B685B 
X-CRM114-Status: GOOD (  10.62  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.120 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [207.211.31.120 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


Here are a couple of fixes for AF_RXRPC:

 (1) Fix an uninitialised variable warning.

 (2) Fix a leak of the ticket on error in rxkad.

The patches are tagged here:

	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
	rxrpc-fixes-20200523

and can also be found on the following branch:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=rxrpc-fixes

and follows on from rxrpc-fixes-20200521.

David
---
Qiushi Wu (1):
      A ticket was not released after a call of the function


 fs/afs/fs_probe.c            |  18 ++--
 fs/afs/vl_probe.c            |  18 ++--
 include/net/af_rxrpc.h       |   2 +-
 include/trace/events/rxrpc.h |  52 +++++++++---
 net/rxrpc/Makefile           |   1 +
 net/rxrpc/ar-internal.h      |  25 ++++--
 net/rxrpc/call_accept.c      |   2 +-
 net/rxrpc/call_event.c       |  22 ++---
 net/rxrpc/input.c            |  44 ++++++++--
 net/rxrpc/misc.c             |   5 --
 net/rxrpc/output.c           |   9 +-
 net/rxrpc/peer_event.c       |  46 ----------
 net/rxrpc/peer_object.c      |  12 +--
 net/rxrpc/proc.c             |   8 +-
 net/rxrpc/rtt.c              | 195 +++++++++++++++++++++++++++++++++++++++++++
 net/rxrpc/rxkad.c            |   3 +-
 net/rxrpc/sendmsg.c          |  26 ++----
 net/rxrpc/sysctl.c           |   9 --
 18 files changed, 336 insertions(+), 161 deletions(-)
 create mode 100644 net/rxrpc/rtt.c



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
