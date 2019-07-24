Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AAA73368
	for <lists+linux-afs@lfdr.de>; Wed, 24 Jul 2019 18:11:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LnO0KPWq1KK/Dc+WL4QOM3qNACNlxM2kOy/1sRdKiZo=; b=g2+1SgMIf3LeZa
	I3FJPuqQDZr6aI7JvlNJgKKsT62iwX/q8hdOagJayIS+yPWViqRpQg+AbuEJeaQCZFNuhUVNq/WC0
	1k0zR1kI6XqGf5TYRj1lJsplxBxOYC4iXOZ/VlYqSDArKtlz0/+ellY9wXfSUCKt4VVqdPVyjok80
	Z2RB+mKcHg+WV+DMlAq2MfXBTgJASg7q6SN98IIDmLtnTNzhSTum+b+zt3hjosK+z7abbYKBHE4H5
	VmrotQ1jFbI21tbcRhWNfVbJy9W/x2NELn8+iUMQ7uuR3s6JTkHmE2cgMH5Aylb2V+r4+f9s0xeSn
	MB4wbbb9YGBZ666VoH3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqJrc-0002Bt-IC; Wed, 24 Jul 2019 16:11:36 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqJrZ-0002BI-Pz
 for linux-afs@lists.infradead.org; Wed, 24 Jul 2019 16:11:35 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4AA31C065115;
 Wed, 24 Jul 2019 16:11:32 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-49.rdu2.redhat.com
 [10.10.120.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99C761001B0F;
 Wed, 24 Jul 2019 16:11:31 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Subject: Problem using skb_cow_data()
MIME-Version: 1.0
Content-ID: <18912.1563984690.1@warthog.procyon.org.uk>
Date: Wed, 24 Jul 2019 17:11:30 +0100
Message-ID: <18913.1563984690@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Wed, 24 Jul 2019 16:11:32 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190724_091133_864613_7DDAB74B 
X-CRM114-Status: GOOD (  13.69  )
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi,

I have a problem using skb_cow_data() in rxkad_verify_packet{,_1,_2}() and was
wondering if anyone can suggest a better way.

The problem is that the rxrpc packet receive routine, rxrpc_input_data(),
receives an skb from the udp socket, makes it its own and then, if it's a data
packet, stores one or more[*] pointers to the skb, each with its own usage
ref, in the rx ring.

[*] The Rx protocol allows combinable packets (jumbo packet) that need to be
    split and each segment treated as a separate data packet.

rxrpc_input_data() then drops its own ref to the packet.  Possibly
simultaneously, the receiving process wakes up and starts processing the
packets earmarked for it.  This involves decrypting the packets if necessary
(which is done in place in the skb).  To do this, the rxkad_verify_packet*()
functions call skb_cow_data() on the skb.  This, however:

 (a) Can race with the input which may not have released its ref yet.

 (b) Could be a jumbo packet with multiple refs on it in the rx ring.

This can result in an assertion failure in pskb_expand_head():

	BUG_ON(skb_shared(skb));

In this particular case it shouldn't be an issue since the input path merely
has to release a ref and the subsequent attachment points in the ring buffer
if it's a jumbo packet will not be looked at until the current attachment
point is finished with (data delivery has to proceed delivery).

So, some questions:

 (1) Do I actually have to call skb_cow_data()?

 (2) Can the assertion be relaxed?

 (3) Is it feasible to do decryption directly from an skb to the target
     iov_iter, thereby avoiding the need to modify the skb content and saving
     a copy and potentially a bunch of allocations?  This would seem to
     require calling something like skb_copy_and_hash_datagram_iter(), but
     with a bespoke cb function to copy from the skb to the iov_iter.

     This gets interesting if the target iov_iter is smaller than the content
     in the skb as decryption would have to be suspended until a new iov_iter
     comes along.

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
