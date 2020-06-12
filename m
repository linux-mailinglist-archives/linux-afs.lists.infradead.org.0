Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3981F71A4
	for <lists+linux-afs@lfdr.de>; Fri, 12 Jun 2020 03:19:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oeRKxht2DjRzmVONkKoHO0wpRogXlDXUMwCGbd6U5Pc=; b=l0FzohCRnUQmPh
	HeHoxXgrTLg45BIqN/Vak109NNByI0BXBd2b5aH/hR+/ygBkINMNOiFVx3vjvehn1V6uwa9L8mS00
	8pIH5aMIi6Mx+O+2bV0IzG7Zb/V5UypE2tOSc4PRrbdzLpaqep9li/BFk6t/TBnl7cG7gt/6ESWHL
	quS9C8Kxo6UuH5hgZzm1CV0F5KvjSoGgKIzRlbhbqj+OCYTwMqa/MhQtZlZpi1Ea1hqJghawzi8+7
	ZwYwn/WvpEyjSDVZzoulNAg8jgEsQaQpukdgPW4mFwjKjLpHF19pK3Py0/BAezXDatsbXeb4yke5C
	Kb5kMrJJ+2FciDTld5ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjYLQ-0003G9-Az; Fri, 12 Jun 2020 01:18:56 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjYLO-0003FV-5F
 for linux-afs@lists.infradead.org; Fri, 12 Jun 2020 01:18:55 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id EC35A128AE837;
 Thu, 11 Jun 2020 18:18:45 -0700 (PDT)
Date: Thu, 11 Jun 2020 18:18:42 -0700 (PDT)
Message-Id: <20200611.181842.2083721665296210889.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net] rxrpc: Fix race between incoming ACK parser and
 retransmitter
From: David Miller <davem@davemloft.net>
In-Reply-To: <159190902048.3557242.17524953697020439394.stgit@warthog.procyon.org.uk>
References: <159190902048.3557242.17524953697020439394.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 11 Jun 2020 18:18:46 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_181854_203716_BE2EEF92 
X-CRM114-Status: GOOD (  11.60  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
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
Date: Thu, 11 Jun 2020 21:57:00 +0100

> There's a race between the retransmission code and the received ACK parser.
> The problem is that the retransmission loop has to drop the lock under
> which it is iterating through the transmission buffer in order to transmit
> a packet, but whilst the lock is dropped, the ACK parser can crank the Tx
> window round and discard the packets from the buffer.
> 
> The retransmission code then updated the annotations for the wrong packet
> and a later retransmission thought it had to retransmit a packet that
> wasn't there, leading to a NULL pointer dereference.
> 
> Fix this by:
> 
>  (1) Moving the annotation change to before we drop the lock prior to
>      transmission.  This means we can't vary the annotation depending on
>      the outcome of the transmission, but that's fine - we'll retransmit
>      again later if it failed now.
> 
>  (2) Skipping the packet if the skb pointer is NULL.
> 
> The following oops was seen:
> 
> 	BUG: kernel NULL pointer dereference, address: 000000000000002d
> 	Workqueue: krxrpcd rxrpc_process_call
> 	RIP: 0010:rxrpc_get_skb+0x14/0x8a
> 	...
> 	Call Trace:
> 	 rxrpc_resend+0x331/0x41e
> 	 ? get_vtime_delta+0x13/0x20
> 	 rxrpc_process_call+0x3c0/0x4ac
> 	 process_one_work+0x18f/0x27f
> 	 worker_thread+0x1a3/0x247
> 	 ? create_worker+0x17d/0x17d
> 	 kthread+0xe6/0xeb
> 	 ? kthread_delayed_work_timer_fn+0x83/0x83
> 	 ret_from_fork+0x1f/0x30
> 
> Fixes: 248f219cb8bc ("rxrpc: Rewrite the data and ack handling code")
> Signed-off-by: David Howells <dhowells@redhat.com>

Applied, thanks.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
