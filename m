Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D58CDEEF
	for <lists+linux-afs@lfdr.de>; Mon,  7 Oct 2019 12:15:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b3yD1bKzUHJuC3XVtN3bXNOQRurJiJmGvAbtZUjG+n0=; b=oSK43sIEVlXkul
	w4ANpgd8merAV/EfyKAPQQ/jgNVkCAik9+Q3JRj41bc6MnvrlSzIVZ9gAM3ZRQoKKY24iJxD5HbyK
	r0KSMWLU08Q3Ovc1YOeocVlnh3/PmDG6iPfba1oD7qkkaDc6KpXhx54axImQPidfdIYpf3kQm9+pO
	KxYyyLmQgxmAcR8AfaPM5tUzg7ZEEo1e0EN3DqSHqOviXgpjzYh5bELodUIj0KbEmOZ9cgPMXpqK6
	jWiswhDGyKi/JvT8F1ZejQ5DL7SnDlxIU1J1HTF3FzUxvf2CUnKS3z6IV5tBa8iElgkb7rnk8wkBT
	nfHm6M6jbv0QZ7hq8ANw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHQ3I-0001ot-CV; Mon, 07 Oct 2019 10:15:40 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHQ3F-0001oU-Q4
 for linux-afs@lists.infradead.org; Mon, 07 Oct 2019 10:15:39 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2B4874FCD6;
 Mon,  7 Oct 2019 10:15:37 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-125-72.rdu2.redhat.com
 [10.10.125.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F15F1001956;
 Mon,  7 Oct 2019 10:15:36 +0000 (UTC)
Subject: [PATCH net 0/6] rxrpc: Syzbot-inspired fixes
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Mon, 07 Oct 2019 11:15:35 +0100
Message-ID: <157044333551.32635.10133219357337058780.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Mon, 07 Oct 2019 10:15:37 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_031537_860502_D8A37792 
X-CRM114-Status: GOOD (  11.91  )
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


Here's a series of patches that fix a number of issues found by syzbot:

 (1) A reference leak on rxrpc_call structs in a sendmsg error path.

 (2) A tracepoint that looked in the rxrpc_peer record after putting it.

     Analogous with this, though not presently detected, the same bug is
     also fixed in relation to rxrpc_connection and rxrpc_call records.

 (3) Peer records don't pin local endpoint records, despite accessing them.

 (4) Access to connection crypto ops to clean up a call after the call's
     ref on that connection has been put.

The patches are tagged here:

	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
	rxrpc-fixes-20191007

and can also be found on the following branch:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=rxrpc-fixes

David
---
David Howells (6):
      rxrpc: Fix call ref leak
      rxrpc: Fix trace-after-put looking at the put peer record
      rxrpc: Fix trace-after-put looking at the put connection record
      rxrpc: Fix trace-after-put looking at the put call record
      rxrpc: rxrpc_peer needs to hold a ref on the rxrpc_local record
      rxrpc: Fix call crypto state cleanup


 include/trace/events/rxrpc.h |   18 +++++++++---------
 net/rxrpc/ar-internal.h      |    1 +
 net/rxrpc/call_accept.c      |    5 +++--
 net/rxrpc/call_object.c      |   34 ++++++++++++++++++++--------------
 net/rxrpc/conn_client.c      |    9 +++++++--
 net/rxrpc/conn_object.c      |   13 +++++++------
 net/rxrpc/conn_service.c     |    2 +-
 net/rxrpc/peer_object.c      |   16 ++++++++++------
 net/rxrpc/recvmsg.c          |    6 +++---
 net/rxrpc/sendmsg.c          |    3 ++-
 10 files changed, 63 insertions(+), 44 deletions(-)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
