Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DBB1DF295
	for <lists+linux-afs@lfdr.de>; Sat, 23 May 2020 00:55:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRzy73zFcYiavlcQXypz/WIUuqdV12KfPcqO8pPq3CA=; b=hpuvBGz59ytMjW
	uDRH+s8N7j5vLcSCdzmyKOkVLCdc4CftM9s+vJfmA9zPT7gg/3f39EQgS8pa7cchTR/mrDm3sZRmx
	9jCY85rKnyOLfSqvVhuQGzpNetLWIRo4G5yvwkX3iV3NIn/kx9AlOWV8RA7+N9yAmmgy8gZb243BP
	pLyKBY6/JtLHSoPUmeRmgJNrrwAKn08jW6jb2PbT5nSQdJ/sF9tPvpIepG1vNbqx8NW7Nn4k7Y6al
	WAcKa6rFwwtmGpuwyJkDHhW+DWXbfoXlIOG2Doz2U26ToFR6jDhS38IcnW7ko50a6dEzz1LT6Llqh
	cFWZwo7/BK9jbYuPWFew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcGZb-0004mX-HB; Fri, 22 May 2020 22:55:27 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcGYW-0001Qo-Nq
 for linux-afs@lists.infradead.org; Fri, 22 May 2020 22:54:22 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id B1F0F12748826;
 Fri, 22 May 2020 15:54:19 -0700 (PDT)
Date: Fri, 22 May 2020 15:54:18 -0700 (PDT)
Message-Id: <20200522.155418.406408375053374516.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net 0/3] rxrpc: Fix retransmission timeout and ACK discard
From: David Miller <davem@davemloft.net>
In-Reply-To: <159001690181.18663.663730118645460940.stgit@warthog.procyon.org.uk>
References: <159001690181.18663.663730118645460940.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 22 May 2020 15:54:19 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_155420_792325_40ABA1A2 
X-CRM114-Status: GOOD (  10.06  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
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
Date: Thu, 21 May 2020 00:21:42 +0100

> 
> Here are a couple of fixes and an extra tracepoint for AF_RXRPC:
> 
>  (1) Calculate the RTO pretty much as TCP does, rather than making
>      something up, including an initial 4s timeout (which causes return
>      probes from the fileserver to fail if a packet goes missing), and add
>      backoff.
> 
>  (2) Fix the discarding of out-of-order received ACKs.  We mustn't let the
>      hard-ACK point regress, nor do we want to do unnecessary
>      retransmission because the soft-ACK list regresses.  This is not
>      trivial, however, due to some loose wording in various old protocol
>      specs, the ACK field that should be used for this sometimes has the
>      wrong information in it.
> 
>  (3) Add a tracepoint to log a discarded ACK.
> 
> The patches are tagged here:
> 
> 	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
> 	rxrpc-fixes-20200520

Pulled, thanks David.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
