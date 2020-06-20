Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D57A201FF4
	for <lists+linux-afs@lfdr.de>; Sat, 20 Jun 2020 04:58:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ca0nM3Vc0MK79UkBK6VtCBCARh5luwoe1pgsZZ+C/G4=; b=EUlOSzgJcjC9GF
	zldhl13kBn541WuQxyGYDPDQMKMBt4w++9Jp9dw3MBxcQAj80AGgjcOfc19AQv4TOVag+NaHNOdg5
	4zkGSuhdCYaO+UPUjUXKyv9E46qT6c8/J1yn1T4dK0PdXhAKu4preTqUrEWyFnF7idGLtsBpyKk53
	QFHxk1jD905f3sHos/9b0rEcFX8gqGb4s0aaEZocHsDt2lDGsF6fc35d4SzQ3XrC13Y8GBTO64q/r
	8cjjpLSxtsowfIkhDdRFbPoIUEX13WVep6kyqoTIeam00P4zXnV42GQ2sWY0UPnhQdho8/pEqxqWa
	xPNHep9d7QMGdEviB4jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmThT-00005I-NH; Sat, 20 Jun 2020 02:57:47 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmThR-0008WQ-7J
 for linux-afs@lists.infradead.org; Sat, 20 Jun 2020 02:57:46 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 6C56412784D00;
 Fri, 19 Jun 2020 19:57:37 -0700 (PDT)
Date: Fri, 19 Jun 2020 19:57:36 -0700 (PDT)
Message-Id: <20200619.195736.867987052580774108.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net 0/3] rxrpc: Performance drop fix and other fixes
From: David Miller <davem@davemloft.net>
In-Reply-To: <159246661514.1229328.4419873299996950969.stgit@warthog.procyon.org.uk>
References: <159246661514.1229328.4419873299996950969.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 19 Jun 2020 19:57:37 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_195745_263571_0834B319 
X-CRM114-Status: UNSURE (   7.97  )
X-CRM114-Notice: Please train this message.
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
Date: Thu, 18 Jun 2020 08:50:15 +0100

> 
> Here are three fixes for rxrpc:
> 
>  (1) Fix a trace symbol mapping.  It doesn't seem to let you map to "".
> 
>  (2) Fix the handling of the remote receive window size when it increases
>      beyond the size we can support for our transmit window.
> 
>  (3) Fix a performance drop caused by retransmitted packets being
>      accidentally marked as already ACK'd.
> 
> The patches are tagged here:
> 
> 	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
> 	rxrpc-fixes-20200618

Pulled, thanks David.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
