Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B55599337
	for <lists+linux-afs@lfdr.de>; Thu, 22 Aug 2019 14:23:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wRNI+qowJRbw/DfShPqdMIoCBe24xIIEY2sAg+l3YU4=; b=aO7d2OgUq8y3uL
	ohSEHQv6vXvUXEV4agpSwUvq0Id50TTaXsK0PSenT+iKz3Err9UvezKsyTc/synI8xD00sC6b7/wz
	+pkeEy3yImqIDSTC1o9yHeZU1yDxkjF++ET+rQzOAUZTMDCy3iE0gE6WwUOsniBV9mK9FPJM8jQb0
	pGnBtgcdXzxyKkJliBXVOZ6GR5nTEmktb5qBPGft1Dv4THgOYZu0h9Inu5GkYdG1qbLEOWfeTqYgs
	pabEtbsi9M4GLJv0Yhy0Vho0VyM7tkAffLNBvqoE7wRasL/E0ZyFQexku/4Irtyiy7OfUazA1Dh18
	2Lr6Ey9Jc4/ICEwCf4ag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0m7i-0006KN-EC; Thu, 22 Aug 2019 12:23:26 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0m7f-0006Jh-BN
 for linux-afs@lists.infradead.org; Thu, 22 Aug 2019 12:23:24 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 21E50308FC20;
 Thu, 22 Aug 2019 12:23:23 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 425591001B32;
 Thu, 22 Aug 2019 12:23:19 +0000 (UTC)
Subject: [PATCH net 0/9] rxrpc: Fix use of skb_cow_data()
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 22 Aug 2019 13:23:19 +0100
Message-ID: <156647659913.11061.13764606104739742865.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 22 Aug 2019 12:23:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190822_052323_426157_4C2FA66D 
X-CRM114-Status: GOOD (  13.40  )
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


Here's a series of patches that fixes the use of skb_cow_data() in rxrpc.
The problem is that skb_cow_data() indirectly requires that the maximum
usage count on an sk_buff be 1, and it may generate an assertion failure in
pskb_expand_head() if not.

This can occur because rxrpc_input_data() may be still holding a ref when
it has just attached the sk_buff to the rx ring and given that attachment
its own ref.  If recvmsg happens fast enough, skb_cow_data() can see the
ref still held by the softirq handler.

Further, a packet may contain multiple subpackets, each of which gets its
own attachment to the ring and its own ref - also making skb_cow_data() go
bang.

Fix this by:

 (1) The DATA packet is currently parsed for subpackets twice by the input
     routines.  Parse it just once instead and make notes in the sk_buff
     private data.

 (2) Use the notes from (1) when attaching the packet to the ring multiple
     times.  Once the packet is attached to the ring, recvmsg can see it
     and cow it and start modifying it, so the softirq handler is not
     permitted to look inside it from that point.

 (3) Stick a second reference count in the skb private data, in struct
     rxrpc_skb_priv, to count the refs held by the ring on the packet.  All
     these refs together hold one single ref on the sk_buff main ref
     counter.

 (4) Pass the ref from the input code to the ring rather than getting an
     extra ref.  rxrpc_input_data() uses a ref on the second refcount to
     prevent the packet from evaporating under it.

 (5) rxkad currently calls skb_cow_data() once for each subpacket it needs
     to decrypt.  It should only be calling this once, however, so move
     that into recvmsg and only do it when we first see a new packet.

There's also a patch to improve the rxrpc_skb tracepoint to make sure that
Tx-derived buffers are identified separately from Rx-derived buffers in the
trace.

Tested-by: Marc Dionne <marc.dionne@auristor.com>

The patches are tagged here:

	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
	rxrpc-fixes-20190820

and can also be found on the following branch:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=rxrpc-fixes

David
---
David Howells (9):
      rxrpc: Pass the input handler's data skb reference to the Rx ring
      rxrpc: Improve jumbo packet counting
      rxrpc: Use info in skbuff instead of reparsing a jumbo packet
      rxrpc: Add a private skb flag to indicate transmission-phase skbs
      rxrpc: Abstract out rxtx ring cleanup
      rxrpc: Use the tx-phase skb flag to simplify tracing
      rxrpc: Add a shadow refcount in the skb private data
      rxrpc: Use shadow refcount for packets in the RxTx ring
      rxrpc: Only call skb_cow_data() once per packet


 include/trace/events/rxrpc.h |   62 +++++----
 net/rxrpc/ar-internal.h      |   18 ++-
 net/rxrpc/call_event.c       |    8 +
 net/rxrpc/call_object.c      |   33 ++---
 net/rxrpc/conn_event.c       |    6 -
 net/rxrpc/input.c            |  285 ++++++++++++++++++++++--------------------
 net/rxrpc/local_event.c      |    4 -
 net/rxrpc/output.c           |    6 -
 net/rxrpc/peer_event.c       |   10 +
 net/rxrpc/protocol.h         |    9 +
 net/rxrpc/recvmsg.c          |   58 +++++----
 net/rxrpc/rxkad.c            |   32 +----
 net/rxrpc/sendmsg.c          |   14 +-
 net/rxrpc/skbuff.c           |   72 +++++++++--
 14 files changed, 348 insertions(+), 269 deletions(-)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
