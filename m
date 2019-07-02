Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2407C5D6B9
	for <lists+linux-afs@lfdr.de>; Tue,  2 Jul 2019 21:16:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J+gkB4d401wJrARj0huZRmmrvIAhtnbW18SRROb6pYQ=; b=Utx6uiCKJoVP92
	sZOKlHrk3xEB0I2lm37P/4X+UtN4EQEFwfiEPpC56jqmTk/agzJE7t+j/LKy+4WW2HExCV6xk9V+z
	swGOl8PxjLbAHYEcib7Dc+PNv5bdbJnW+wFx6lNBi6/aivF7/YmT0rLGgQNkm3ox1KGmltTYLNvUM
	7G5rKj/pMKJk2IQcb9XUa2iyLt7Lz6rDZ2cudmAI0qGctgZvyUeWvSA6YElwcojbP3H4tOwCTvVd0
	agaGXCyoaLjg+cxZfdZBOLcQaXUfWrA3VXDOLXeOgw9Z0CsZwkGyfrCDMgJ4EXX/ew5eGB+ni+JeK
	TH3kFMzooPUG/MNj36XQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiOGD-0000fS-Be; Tue, 02 Jul 2019 19:16:13 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiOGB-0000eN-2m
 for linux-afs@lists.infradead.org; Tue, 02 Jul 2019 19:16:12 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id AF4F3136E13EF;
 Tue,  2 Jul 2019 12:16:10 -0700 (PDT)
Date: Tue, 02 Jul 2019 12:16:10 -0700 (PDT)
Message-Id: <20190702.121610.2172819670405515831.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net] rxrpc: Fix send on a connected, but unbound socket
From: David Miller <davem@davemloft.net>
In-Reply-To: <156207955265.1655.13658692984261290810.stgit@warthog.procyon.org.uk>
References: <156207955265.1655.13658692984261290810.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 02 Jul 2019 12:16:10 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_121611_127033_E174997C 
X-CRM114-Status: GOOD (  10.55  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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
Cc: marc.dionne@auristor.com, netdev@vger.kernel.org,
 syzbot+7966f2a0b2c7da8939b4@syzkaller.appspotmail.com,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>
Date: Tue, 02 Jul 2019 15:59:12 +0100

> If sendmsg() or sendmmsg() is called on a connected socket that hasn't had
> bind() called on it, then an oops will occur when the kernel tries to
> connect the call because no local endpoint has been allocated.
> 
> Fix this by implicitly binding the socket if it is in the
> RXRPC_CLIENT_UNBOUND state, just like it does for the RXRPC_UNBOUND state.
> 
> Further, the state should be transitioned to RXRPC_CLIENT_BOUND after this
> to prevent further attempts to bind it.
> 
> This can be tested with:
 ...
> Leading to the following oops:
 ...
> Fixes: 2341e0775747 ("rxrpc: Simplify connect() implementation and simplify sendmsg() op")
> Reported-by: syzbot+7966f2a0b2c7da8939b4@syzkaller.appspotmail.com
> Signed-off-by: David Howells <dhowells@redhat.com>
> Reviewed-by: Marc Dionne <marc.dionne@auristor.com>

Applied and queued up for -stable, thanks.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
