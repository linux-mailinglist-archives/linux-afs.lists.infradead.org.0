Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 261217B007
	for <lists+linux-afs@lfdr.de>; Tue, 30 Jul 2019 19:32:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxe1l/UTBVkX/rHOKJdknZRxyQyNyTHkmurPAFY9J1s=; b=ZJCXr0HmMBO/yz
	lN29HjkBc2CJPXHplD4hoO+lVi4ksSugmDacwR0wlxeeLEwansuSDPXJzSa1/9E8o+3x3Wkt2rd68
	tf9t9y0bwLQWrtJ/FqEwztJ2AX/nuoucC5fznB8KAAT6CFFNVWpS53vFuxbN78Xp+fO6Y5B1Il2Zh
	2KzfLhLXWEbKvFVbU3iaFJhmAM5dje+TGZQvtsu6mX5o73JK1eYrEptb8YhdUYqcw69XGOl2nBjpF
	JTvFq0tgr9X19LhjuwkITd4/2ITyl6ioMl/e3qLshUA5FsF0nE+pIprU9TYXbb1efG24T+jFj8ZUu
	AfnIeDzZtIxasvuI8FBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsVyl-0006q1-Ak; Tue, 30 Jul 2019 17:32:03 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsVyi-0006pN-PA
 for linux-afs@lists.infradead.org; Tue, 30 Jul 2019 17:32:01 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 6F2AD126598EB;
 Tue, 30 Jul 2019 10:32:00 -0700 (PDT)
Date: Tue, 30 Jul 2019 10:31:59 -0700 (PDT)
Message-Id: <20190730.103159.316720747259208571.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net 0/2] rxrpc: Fixes
From: David Miller <davem@davemloft.net>
In-Reply-To: <156449821120.9558.2821927090314866621.stgit@warthog.procyon.org.uk>
References: <156449821120.9558.2821927090314866621.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 30 Jul 2019 10:32:00 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_103200_821616_F8DE1D62 
X-CRM114-Status: UNSURE (   7.32  )
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
Date: Tue, 30 Jul 2019 15:50:11 +0100

> 
> Here are a couple of fixes for rxrpc:
> 
>  (1) Fix a potential deadlock in the peer keepalive dispatcher.
> 
>  (2) Fix a missing notification when a UDP sendmsg error occurs in rxrpc.
> 
> 
> The patches are tagged here:
> 
> 	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
> 	rxrpc-fixes-20190730

Pulled, thanks David.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
