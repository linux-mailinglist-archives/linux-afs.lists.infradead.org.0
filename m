Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id AF69F8D138
	for <lists+linux-afs@lfdr.de>; Wed, 14 Aug 2019 12:48:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KF3VDr0JvEOyMJgxGi389qXNioHL/fmQIEbVZ5nOOoE=; b=EVY/3ZHXCQA6+5
	c8ResxUoOe6IRQvx3Bf8hL1HQbdFRbVKafdzhs1xBum/dRrBg7d4E0owgrIwlJHor2ZKWS9M+MQN/
	n448FNWC1J9pKqRriDurdX4LYa5K2rEWz0j31FV7H+PhHmqAK9x503ADnfLg1uAKAhFH5qpw6B6j6
	GEZ2fnemGfYFt5qvUeKqMTAgantaENeK3pPYUGZUNHOnHgh3PoSHMzC99nsjPT2jiWLUkWQvQok4V
	3yGxq9+8y6WhcHhyeYPKSjZ3AsHkzbXffQIkFGJcdngY4AnvjGzivvpjE/Ws381iCqtnlD9W7Q8jE
	ykYbIc0TvudHtUK7CfKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxqov-0003NK-58; Wed, 14 Aug 2019 10:47:57 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxqor-0003Mi-W7
 for linux-afs@lists.infradead.org; Wed, 14 Aug 2019 10:47:55 +0000
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7611311A08;
 Wed, 14 Aug 2019 10:47:53 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9315883280;
 Wed, 14 Aug 2019 10:47:52 +0000 (UTC)
Subject: [PATCH net 0/2] rxrpc: Fix local endpoint handling
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Wed, 14 Aug 2019 11:47:51 +0100
Message-ID: <156577967167.1405.3581547705200268244.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Wed, 14 Aug 2019 10:47:53 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_034754_055751_A7867F19 
X-CRM114-Status: UNSURE (   9.47  )
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


Here's a pair of patches that fix two issues in the handling of local
endpoints (rxrpc_local structs):

 (1) Use list_replace_init() rather than list_replace() if we're going to
     unconditionally delete the replaced item later, lest the list get
     corrupted.

 (2) Don't access the rxrpc_local object after passing our ref to the
     workqueue, not even to illuminate tracepoints, as the work function
     may cause the object to be freed.  We have to cache the information
     beforehand.

The patches are tagged here:

	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
	rxrpc-fixes-20190814

and can also be found on the following branch:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=rxrpc-fixes

David
---
David Howells (2):
      rxrpc: Fix local endpoint replacement
      rxrpc: Fix read-after-free in rxrpc_queue_local()


 include/trace/events/rxrpc.h |    6 +++---
 net/rxrpc/local_object.c     |   21 +++++++++++----------
 2 files changed, 14 insertions(+), 13 deletions(-)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
