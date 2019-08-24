Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A639C082
	for <lists+linux-afs@lfdr.de>; Sat, 24 Aug 2019 23:36:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZza6VVC51qp3Q7y9gLaKJtFlaGjkXKDdEA2c+2owkg=; b=sC5akUrYC4kX1S
	p7xk6qsHJqYO7pq4eIWs/lkgRsaeymzzSoBf58RKfYrtZBxGIwvpz/7R140W6SUvJSF7vA1EwWmAy
	KI8yThb9sYttVBY07nwz4okihC/tjVdpFaqBMTVww8Z9W2+JPl6+WiaQnkd6K/u5qR6Vc3OmnEjrQ
	eG6yuw1AvBYeoSH+4QE8dpycTJV4Zargy/HgGgbWFnFRnld0YRptWxXpuUPHZ0JRJVQJHmg66BXq2
	30Gl7MpfnhF/3wO4QuzX6Q2nLj0hiCkxeLoNzvLfbUiqLRPzUkfUmY1TIihcuX+vn39FMcDYV7zm2
	eRk6P/uqmDvrd828bvqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1dhU-0007UK-Pk; Sat, 24 Aug 2019 21:35:56 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1dhT-0007Tz-36
 for linux-afs@lists.infradead.org; Sat, 24 Aug 2019 21:35:56 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id C6C1415248BC7;
 Sat, 24 Aug 2019 14:35:54 -0700 (PDT)
Date: Sat, 24 Aug 2019 14:35:54 -0700 (PDT)
Message-Id: <20190824.143554.363032118330381549.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net 0/9] rxrpc: Fix use of skb_cow_data()
From: David Miller <davem@davemloft.net>
In-Reply-To: <156647655350.10908.12081183247715153431.stgit@warthog.procyon.org.uk>
References: <156647655350.10908.12081183247715153431.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Sat, 24 Aug 2019 14:35:55 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190824_143555_132713_0BC6A6A1 
X-CRM114-Status: UNSURE (   3.04  )
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


I'm marking this series "deferred" while you investigate skb_unshare()
etc.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
