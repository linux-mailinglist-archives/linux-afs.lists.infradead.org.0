Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAECA1ADB
	for <lists+linux-afs@lfdr.de>; Thu, 29 Aug 2019 15:07:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0G7sCkj9YtfJfulujlNddqZAdnARs7ZJAgFW/wfFqvU=; b=YFjqevHcSS0cie
	cEXiO3bScKZrl+vmBfsyBtZNVFhKnYPO3efKsrWvt+Du1chwvOyhMnXXF2TSerVvjA7UVmdyctpBW
	9UvuzyH1PdvrmLlAm6CKb3lJsONqxtm7kWAuA41MwvW/QVbJwTQRchm4SE7wc8SWPh9ObQK/fM/B8
	MstUu+QBmPqLgHz+q4Iwn+6ecE0qQ/QTHeDqCvn2xnHwvAXgRvwi9pTR2x1dChKzAbpemPAF++D2g
	BbG3US+EWqsJnpExayb7zMhqcZYbvoYNXotHAg3buvfncOLD/czPfiUsxXzbvvc8/CFWoGjAQfh6v
	q0jDPnL6+9scUre0kB2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3K9J-00013d-JY; Thu, 29 Aug 2019 13:07:37 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3K9H-00013H-4I
 for linux-afs@lists.infradead.org; Thu, 29 Aug 2019 13:07:36 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DB1392A09CA;
 Thu, 29 Aug 2019 13:07:34 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A5B810016EB;
 Thu, 29 Aug 2019 13:07:33 +0000 (UTC)
Subject: [PATCH net 0/7] rxrpc: Fix use of skb_cow_data()
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 29 Aug 2019 14:07:33 +0100
Message-ID: <156708405310.26102.7954021163316252673.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Thu, 29 Aug 2019 13:07:34 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_060735_216582_793CD156 
X-CRM114-Status: GOOD (  13.76  )
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


Here's a series of patches that replaces the use of skb_cow_data() in rxrpc
with skb_unshare() early on in the input process.  The problem that is
being seen is that skb_cow_data() indirectly requires that the maximum
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
     and start modifying it, so the softirq handler is not permitted to
     look inside it from that point.

 (3) Pass the ref from the input code to the ring rather than getting an
     extra ref.  rxrpc_input_data() uses a ref on the second refcount to
     prevent the packet from evaporating under it.

 (4) Call skb_unshare() on secured DATA packets in rxrpc_input_packet()
     before we take call->input_lock.  Other sorts of packets don't get
     modified and so can be left.

     A trace is emitted if skb_unshare() eats the skb.  Note that
     skb_share() for our accounting in this regard as we can't see the
     parameters in the packet to log in a trace line if it releases it.

 (5) Remove the calls to skb_cow_data().  These are then no longer
     necessary.

There are also patches to improve the rxrpc_skb tracepoint to make sure
that Tx-derived buffers are identified separately from Rx-derived buffers
in the trace.

The patches are tagged here:

	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
	rxrpc-fixes-20190827

and can also be found on the following branch:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=rxrpc-fixes

David
---
David Howells (7):
      rxrpc: Improve jumbo packet counting
      rxrpc: Use info in skbuff instead of reparsing a jumbo packet
      rxrpc: Pass the input handler's data skb reference to the Rx ring
      rxrpc: Abstract out rxtx ring cleanup
      rxrpc: Add a private skb flag to indicate transmission-phase skbs
      rxrpc: Use the tx-phase skb flag to simplify tracing
      rxrpc: Use skb_unshare() rather than skb_cow_data()


 include/trace/events/rxrpc.h |   59 ++++----
 net/rxrpc/ar-internal.h      |   16 ++
 net/rxrpc/call_event.c       |    8 +
 net/rxrpc/call_object.c      |   33 ++---
 net/rxrpc/conn_event.c       |    6 -
 net/rxrpc/input.c            |  304 +++++++++++++++++++++++-------------------
 net/rxrpc/local_event.c      |    4 -
 net/rxrpc/output.c           |    6 -
 net/rxrpc/peer_event.c       |   10 +
 net/rxrpc/protocol.h         |    9 +
 net/rxrpc/recvmsg.c          |   47 ++++--
 net/rxrpc/rxkad.c            |   32 +---
 net/rxrpc/sendmsg.c          |   13 +-
 net/rxrpc/skbuff.c           |   40 ++++--
 14 files changed, 319 insertions(+), 268 deletions(-)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
