Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 83059CE2D8
	for <lists+linux-afs@lfdr.de>; Mon,  7 Oct 2019 15:13:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvhawDqALAldEMzFagROpDE/iaSE+htZZh4bImdxj/4=; b=XeEMvriPAMNUao
	JxSnr2kobHMfaMfwxeLQAMDMrDUW2KXt8iR3o1h1vB/RrQGtibmCTyeNs72otOYAAY2ngUhKPhkFZ
	xzu2DzjBZVtVdyGswcQkS0gqvoPd2cxgtAGTnppHWPpKFOfPuQwk9mZGBrOxbb6i1vnU1XUQSuzjg
	Mp2+gYlRroFCcBtFF0hXjSoj2c2u6e6VUQUXY+rr6Rjit6knF4caLgznnbUOLF8Szy+hCh1JW5jLk
	9ESZSYuL0dKSrXmJY3VciRhTbyQAtMFNIHVz+jSjP2ukdYexr4YX0VhFiDfX5EZ0bWqS286OEZE0e
	B+7q2l3d0L/elqpCroUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHSpU-0007iG-PA; Mon, 07 Oct 2019 13:13:36 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHSpR-0007hm-Oy
 for linux-afs@lists.infradead.org; Mon, 07 Oct 2019 13:13:34 +0000
Received: from localhost (unknown [144.121.20.163])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id CADFE14047968;
 Mon,  7 Oct 2019 06:13:27 -0700 (PDT)
Date: Mon, 07 Oct 2019 15:13:26 +0200 (CEST)
Message-Id: <20191007.151326.1436550597950881500.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net 0/6] rxrpc: Syzbot-inspired fixes
From: David Miller <davem@davemloft.net>
In-Reply-To: <157044333551.32635.10133219357337058780.stgit@warthog.procyon.org.uk>
References: <157044333551.32635.10133219357337058780.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.2
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 07 Oct 2019 06:13:28 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_061333_815140_001D17C1 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
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
Cc: netdev@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>
Date: Mon, 07 Oct 2019 11:15:35 +0100

> 
> Here's a series of patches that fix a number of issues found by syzbot:
> 
>  (1) A reference leak on rxrpc_call structs in a sendmsg error path.
> 
>  (2) A tracepoint that looked in the rxrpc_peer record after putting it.
> 
>      Analogous with this, though not presently detected, the same bug is
>      also fixed in relation to rxrpc_connection and rxrpc_call records.
> 
>  (3) Peer records don't pin local endpoint records, despite accessing them.
> 
>  (4) Access to connection crypto ops to clean up a call after the call's
>      ref on that connection has been put.
> 
> The patches are tagged here:
> 
> 	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
> 	rxrpc-fixes-20191007

Pulled, thanks David.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
