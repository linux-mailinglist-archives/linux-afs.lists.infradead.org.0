Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD9789646
	for <lists+linux-afs@lfdr.de>; Mon, 12 Aug 2019 06:29:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5pt3iclmdNBP3Ky+4uOakkkLeqHLBe7HhEMS0PAKXQA=; b=sduOorBRWeC2oJ
	KW5vl6drwHXQpHv0gWgAn4cWk5knUovLjAhZfEr4NrLWFs7cTOLcpm5FBG1ZlpMdkdnPRrLj6F6UY
	OmeBmIstRdVrRQV9ZvxkSC6pvXdR4Pif3nn8klP5dY4LskB7Hg4z7c6BKzazPT3EgRXKokm38oD6K
	XshnxgIWiJbzIPykA2d2z3ucFgRChKmuv6hYcV45SH2dAiCEZfDMxaCtEAkTWsnA6R3PqzpXczMxb
	4tMNrLqkOQyu+JMIb7rZqAZORchl+CUEatKIMrTlI06ZsTUTIjp70t8mcn1vNXXhcc9naVll9Ns6S
	FGyUSzYDfwiFUk7VU+xQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx1xd-0007Zw-Bu; Mon, 12 Aug 2019 04:29:33 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx1xa-0007ZK-LT
 for linux-afs@lists.infradead.org; Mon, 12 Aug 2019 04:29:31 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 7F9FC145487CD;
 Sun, 11 Aug 2019 21:29:29 -0700 (PDT)
Date: Sun, 11 Aug 2019 21:29:28 -0700 (PDT)
Message-Id: <20190811.212928.1681769879219779999.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net] rxrpc: Fix local refcounting
From: David Miller <davem@davemloft.net>
In-Reply-To: <156538726702.16201.13552536596121161945.stgit@warthog.procyon.org.uk>
References: <156538726702.16201.13552536596121161945.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Sun, 11 Aug 2019 21:29:29 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190811_212930_705791_7C088CC1 
X-CRM114-Status: UNSURE (   7.43  )
X-CRM114-Notice: Please train this message.
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>
Date: Fri, 09 Aug 2019 22:47:47 +0100

> Fix rxrpc_unuse_local() to handle a NULL local pointer as it can be called
> on an unbound socket on which rx->local is not yet set.
> 
> The following reproduced (includes omitted):
> 
> 	int main(void)
> 	{
> 		socket(AF_RXRPC, SOCK_DGRAM, AF_INET);
> 		return 0;
> 	}
> 
> causes the following oops to occur:
> 
> 	BUG: kernel NULL pointer dereference, address: 0000000000000010
> 	...
> 	RIP: 0010:rxrpc_unuse_local+0x8/0x1b
> 	...
> 	Call Trace:
> 	 rxrpc_release+0x2b5/0x338
> 	 __sock_release+0x37/0xa1
> 	 sock_close+0x14/0x17
> 	 __fput+0x115/0x1e9
> 	 task_work_run+0x72/0x98
> 	 do_exit+0x51b/0xa7a
> 	 ? __context_tracking_exit+0x4e/0x10e
> 	 do_group_exit+0xab/0xab
> 	 __x64_sys_exit_group+0x14/0x17
> 	 do_syscall_64+0x89/0x1d4
> 	 entry_SYSCALL_64_after_hwframe+0x49/0xbe
> 
> Reported-by: syzbot+20dee719a2e090427b5f@syzkaller.appspotmail.com
> Fixes: 730c5fd42c1e ("rxrpc: Fix local endpoint refcounting")
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jeffrey Altman <jaltman@auristor.com>

Applied.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
