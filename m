Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CA715558B
	for <lists+linux-afs@lfdr.de>; Fri,  7 Feb 2020 11:22:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X9PZHbv4zwSTKXBRERDdsshfRrN6Y/2R6TzmYE5F4dA=; b=Or5p5DDZkvCMJb
	ariOmuOwd0YfWoPyCTZjsgviLZVKQIKCK9TBB0qzCmxDN5eEanwMJJGeM6v/pJUEam39DVGeCDn1u
	f2j7dsMJwsPILt1+ic5Sk/bnQ60osMfq2YTZSL99tPkLrOT+4WEo4bsOk0bPnEC50RtBiaO9789G8
	DEDOh15UvBHxpm6y9t+DdkcBXUm9FuQn4uMgSI4W9ZMHcW2vw+0FgGbjwc9LsDTlo8LJxp/3QBZa9
	dvBAL0OaQeSC95IbaVrZuK9VbgbBzBrBwaTGq8aKQ65QEoecrTLaL8Q5w5WWd74+ARb0uZl4LQmf7
	+QEqGVIFpZlUmaHgDf+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j00m0-0004uJ-LO; Fri, 07 Feb 2020 10:22:08 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j00ly-0004tR-7m
 for linux-afs@lists.infradead.org; Fri, 07 Feb 2020 10:22:07 +0000
Received: from localhost (unknown [IPv6:2001:982:756:1:57a7:3bfd:5e85:defb])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 62D9C15A3210B;
 Fri,  7 Feb 2020 02:22:05 -0800 (PST)
Date: Fri, 07 Feb 2020 11:22:04 +0100 (CET)
Message-Id: <20200207.112204.2167793813968734872.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net] rxrpc: Fix call RCU cleanup using non-bh-safe locks
From: David Miller <davem@davemloft.net>
In-Reply-To: <158099746025.2198892.1158535190228552910.stgit@warthog.procyon.org.uk>
References: <158099746025.2198892.1158535190228552910.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 07 Feb 2020 02:22:06 -0800 (PST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_022206_273662_C710C8EF 
X-CRM114-Status: GOOD (  13.28  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
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
Cc: netdev@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>
Date: Thu, 06 Feb 2020 13:57:40 +0000

> rxrpc_rcu_destroy_call(), which is called as an RCU callback to clean up a
> put call, calls rxrpc_put_connection() which, deep in its bowels, takes a
> number of spinlocks in a non-BH-safe way, including rxrpc_conn_id_lock and
> local->client_conns_lock.  RCU callbacks, however, are normally called from
> softirq context, which can cause lockdep to notice the locking
> inconsistency.
> 
> To get lockdep to detect this, it's necessary to have the connection
> cleaned up on the put at the end of the last of its calls, though normally
> the clean up is deferred.  This can be induced, however, by starting a call
> on an AF_RXRPC socket and then closing the socket without reading the
> reply.
> 
> Fix this by having rxrpc_rcu_destroy_call() punt the destruction to a
> workqueue if in softirq-mode and defer the destruction to process context.
> 
> Note that another way to fix this could be to add a bunch of bh-disable
> annotations to the spinlocks concerned - and there might be more than just
> those two - but that means spending more time with BHs disabled.
> 
> Note also that some of these places were covered by bh-disable spinlocks
> belonging to the rxrpc_transport object, but these got removed without the
> _bh annotation being retained on the next lock in.
> 
> Fixes: 999b69f89241 ("rxrpc: Kill the client connection bundle concept")
> Reported-by: syzbot+d82f3ac8d87e7ccbb2c9@syzkaller.appspotmail.com
> Reported-by: syzbot+3f1fd6b8cbf8702d134e@syzkaller.appspotmail.com
> Signed-off-by: David Howells <dhowells@redhat.com>

Applied and queued up for -stable.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
