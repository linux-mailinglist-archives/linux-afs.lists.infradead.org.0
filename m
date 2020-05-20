Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0651DC2C3
	for <lists+linux-afs@lfdr.de>; Thu, 21 May 2020 01:22:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dP7beXx8b/y7pRFiJ0AKmYVULsPEg0NOtx2RknI4m6U=; b=g23cNiazn9dkDC
	g/+EuQf5llHf/3qg2/zHtSEeTEA62q/4noRWs4qNnclKHd8Jcv8Y1PEBw/pKCGXBY5cBfd+tBFe0V
	764M3/ZW5YkCa1Fp9aTjQh2YyWdnayDlcsb+00zH5vKM3PuWdW1RL357Fue5+hd0Nkz4BAcB/xVGE
	cpN0su9UT1JJs88AwGZyaOaW58O2nSJ0M/d6x1FGTw9lWT/oTc7RLJm9mx9VbncOtxjo42ofx8+77
	yIY7RDD5OJ17/OqjWuQQlNBUvQLCP7qGQV+9kciRKzbGyPysD+uQNes2jYGjewIFBqzlm0c1WTu4v
	UPKH+VDJ8XdfxyFWVdDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbY24-0005Xg-KI; Wed, 20 May 2020 23:21:52 +0000
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbY22-0005Wd-7A
 for linux-afs@lists.infradead.org; Wed, 20 May 2020 23:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590016908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QCvvSQse9uoRSN4nhne9pBMylRnmmLbVVrXB6qYkxWg=;
 b=bpIvpfGCWFYYvna75vTXnOZ8ZwxT0CNhGb3eMQDHh8fHpDtLN/CACHkmF893qrQrBgVv9k
 J9IrJzvZf8wtuv3NLszov1tUCD2BSBg0mLhJWnTGI4jcKmm3JViL06VDeVTLwIPukFGEUm
 GgtMWOrW/eysKoiXzZEu2z9bxHzdsVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-HWe3uLGmPfWPMmwsfaXDtA-1; Wed, 20 May 2020 19:21:44 -0400
X-MC-Unique: HWe3uLGmPfWPMmwsfaXDtA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B18C4835B40;
 Wed, 20 May 2020 23:21:43 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E48C782A2C;
 Wed, 20 May 2020 23:21:42 +0000 (UTC)
Subject: [PATCH net 0/3] rxrpc: Fix retransmission timeout and ACK discard
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 21 May 2020 00:21:42 +0100
Message-ID: <159001690181.18663.663730118645460940.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_162150_336391_E68C26FD 
X-CRM114-Status: GOOD (  12.62  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [207.211.31.81 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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


Here are a couple of fixes and an extra tracepoint for AF_RXRPC:

 (1) Calculate the RTO pretty much as TCP does, rather than making
     something up, including an initial 4s timeout (which causes return
     probes from the fileserver to fail if a packet goes missing), and add
     backoff.

 (2) Fix the discarding of out-of-order received ACKs.  We mustn't let the
     hard-ACK point regress, nor do we want to do unnecessary
     retransmission because the soft-ACK list regresses.  This is not
     trivial, however, due to some loose wording in various old protocol
     specs, the ACK field that should be used for this sometimes has the
     wrong information in it.

 (3) Add a tracepoint to log a discarded ACK.

The patches are tagged here:

	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
	rxrpc-fixes-20200520

and can also be found on the following branch:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=rxrpc-fixes

David
---
David Howells (1):
      rxrpc: Fix ack discard


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
 net/rxrpc/sendmsg.c          |  26 ++----
 net/rxrpc/sysctl.c           |   9 --
 17 files changed, 335 insertions(+), 159 deletions(-)
 create mode 100644 net/rxrpc/rtt.c



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
