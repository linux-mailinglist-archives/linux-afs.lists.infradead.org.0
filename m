Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E14D4CC3
	for <lists+linux-afs@lfdr.de>; Sat, 12 Oct 2019 06:21:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Xh1w4DfASG0AxzYcALve53XyT+QmmjKiSbEAJ/7zZs=; b=dFQJHKNtdQ793S
	P1vQF+EjS6ax2NCdnMLOReowTu+5GsJ0QmnVY2rDl4EGX3XMZXsXQReVNebLzG4NM4ZM14fyrW2dG
	Ywx7KNDcvqDHhjrElM3NzFQeKWpk1PVTPbkqfLSrGk1BliHoEFzc4IatNjsKEke7AZ8tkiJugsyVu
	FePkcAYAP80iBkMl6DmnhFEeWJBHp65+tYor2DixQFWcD/XNChHDsAEyia7QkkYzce5EBvnJFgoLD
	e/ovcSqhPewreHV6Jk7Bt5Prt2E4Mrz0LCdD34D2Pe4VxG6I7iYC8mS9l8bxqakGN5PulhBvBXg0L
	GUeMOMb3JBzMDDRQgHxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJ8uK-0002e6-NY; Sat, 12 Oct 2019 04:21:32 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJ8uH-0002dA-Cj
 for linux-afs@lists.infradead.org; Sat, 12 Oct 2019 04:21:30 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 456F815004EAC;
 Fri, 11 Oct 2019 21:21:25 -0700 (PDT)
Date: Fri, 11 Oct 2019 21:21:24 -0700 (PDT)
Message-Id: <20191011.212124.1517786431494477849.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net] rxrpc: Fix possible NULL pointer access in ICMP
 handling
From: David Miller <davem@davemloft.net>
In-Reply-To: <157071915431.29197.5055122258964729288.stgit@warthog.procyon.org.uk>
References: <157071915431.29197.5055122258964729288.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 11 Oct 2019 21:21:25 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191011_212129_432365_DD7FC649 
X-CRM114-Status: UNSURE (   6.76  )
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
Date: Thu, 10 Oct 2019 15:52:34 +0100

> If an ICMP packet comes in on the UDP socket backing an AF_RXRPC socket as
> the UDP socket is being shut down, rxrpc_error_report() may get called to
> deal with it after sk_user_data on the UDP socket has been cleared, leading
> to a NULL pointer access when this local endpoint record gets accessed.
> 
> Fix this by just returning immediately if sk_user_data was NULL.
> 
> The oops looks like the following:
 ...
> Fixes: 17926a79320a ("[AF_RXRPC]: Provide secure RxRPC sockets for use by userspace and kernel both")
> Reported-by: syzbot+611164843bd48cc2190c@syzkaller.appspotmail.com
> Signed-off-by: David Howells <dhowells@redhat.com>

Applied and queued up for -stable, thanks.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
