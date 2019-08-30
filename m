Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BE77EA4006
	for <lists+linux-afs@lfdr.de>; Fri, 30 Aug 2019 23:55:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+IzBNaCgBaNJkMuCxbmMthfY2xnwtgm8YZ2saA/+CKg=; b=QPejmzieXWzruj
	yZbU31IYGJtjVwalFBRRY8CWWiQjb23Fc0qT69CqqcnCynDdfwnWcQGbovHezjVvgFITtC4ggBugJ
	4TND0nmF1hUsBm9mBETWSMrFb7LaCglOIhpzNZlvV+nRoJzmXbE95Vewsux2KdXAHIUDCf6RRnORa
	8YujQG+LjSLj/h4udlcFy32CYqL3lQxYnGhBKZAckzjfblwDF3qsPEql2frhMpyHFxiF3kbuuSEDo
	04VLrOL+BAVtPTJ9V6N59JUB4Z4lQ9CRNzxjMqKaS7/RfZ9mSvTs+QTva4BP4VbWERPGKmLkw/CVa
	dKcpyx27Taz7mvHXtCRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3orY-0004Oz-W7; Fri, 30 Aug 2019 21:55:21 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3orV-0004Od-8L
 for linux-afs@lists.infradead.org; Fri, 30 Aug 2019 21:55:18 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id A1D85154FF691;
 Fri, 30 Aug 2019 14:55:16 -0700 (PDT)
Date: Fri, 30 Aug 2019 14:55:16 -0700 (PDT)
Message-Id: <20190830.145516.687207471361740034.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net 0/7] rxrpc: Fix use of skb_cow_data()
From: David Miller <davem@davemloft.net>
In-Reply-To: <156708405310.26102.7954021163316252673.stgit@warthog.procyon.org.uk>
References: <156708405310.26102.7954021163316252673.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 30 Aug 2019 14:55:16 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190830_145517_301023_FB6E3131 
X-CRM114-Status: GOOD (  11.49  )
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
Date: Thu, 29 Aug 2019 14:07:33 +0100

> Here's a series of patches that replaces the use of skb_cow_data() in rxrpc
> with skb_unshare() early on in the input process.  The problem that is
> being seen is that skb_cow_data() indirectly requires that the maximum
> usage count on an sk_buff be 1, and it may generate an assertion failure in
> pskb_expand_head() if not.
> 
> This can occur because rxrpc_input_data() may be still holding a ref when
> it has just attached the sk_buff to the rx ring and given that attachment
> its own ref.  If recvmsg happens fast enough, skb_cow_data() can see the
> ref still held by the softirq handler.
> 
> Further, a packet may contain multiple subpackets, each of which gets its
> own attachment to the ring and its own ref - also making skb_cow_data() go
> bang.
> 
> Fix this by:
 ...
> There are also patches to improve the rxrpc_skb tracepoint to make sure
> that Tx-derived buffers are identified separately from Rx-derived buffers
> in the trace.

This looks great, thanks for reimplementing this using skb_unshare().

> The patches are tagged here:
> 
> 	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
> 	rxrpc-fixes-20190827

Pulled, thanks again.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
