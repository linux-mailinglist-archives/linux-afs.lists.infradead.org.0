Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 518622DEFC
	for <lists+linux-afs@lfdr.de>; Wed, 29 May 2019 15:57:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+35G7h80N3lxAFml7X0Nva+6y92+9YrcdWduGYXye4k=; b=L7KYqvJpryujJ0
	zouvlNEiekdCiC3HTp6AiZFwPYe+0NtARiKjEIujn6t9Opx9yQnXubeu1iDHCF3jh0+dB1YehFwcv
	6nXlrfxh/SaaZcoKBvBMXzkMD0wWQy1OZVnq9NoXhnyFx1XiJaE1fCJGzULzGOIuuJcdpeuo8JIg7
	yvknhhmShUDaw+JTttJ6lPHncEPAWJWFXtdpYJJjeKOorSYUDB8wTCVjs31lCwCSbuFv+2SPLpOfA
	0wPDrzUf5ORKO28s/4wNAN2C8BLbkwWf4AgOJTApUwx5KNZjl9mAyJpjrT+Rj8xBk0iyLhAhCI1Ud
	GkHuszOdJe0cexzrCNJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVz4u-0007hP-I2; Wed, 29 May 2019 13:57:16 +0000
Received: from chamillionaire.breakpoint.cc ([2a01:7a0:2:106d:670::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVz4r-0007gi-V3
 for linux-afs@lists.infradead.org; Wed, 29 May 2019 13:57:15 +0000
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.89)
 (envelope-from <fw@strlen.de>)
 id 1hVz4l-0005Lc-JA; Wed, 29 May 2019 15:57:07 +0200
Date: Wed, 29 May 2019 15:57:07 +0200
From: Florian Westphal <fw@strlen.de>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH net-next 3/7] afs: switch to in_dev_for_each_ifa_rcu
Message-ID: <20190529135707.thwqw5ibitmwsnom@breakpoint.cc>
References: <20190529114332.19163-4-fw@strlen.de>
 <20190529114332.19163-1-fw@strlen.de>
 <20802.1559137779@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20802.1559137779@warthog.procyon.org.uk>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190529_065714_144481_48FDD503 
X-CRM114-Status: UNSURE (   6.67  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [2a01:7a0:2:106d:670:0:0:1 listed in]
 [list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-BeenThere: linux-afs@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Cc: netdev@vger.kernel.org, Florian Westphal <fw@strlen.de>,
 linux-afs@lists.infradead.org, eric.dumazet@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

David Howells <dhowells@redhat.com> wrote:
> Actually, whilst thanks are due for doing the work - it looks nicer now - I'm
> told that there's not really any point populating the list.  Current OpenAFS
> ignores it, as does AuriStor - and IBM AFS 3.6 will do the right thing.

[..]

> On that basis, feel free to make it an empty list and remove all the interface
> enumeration.

Ok, will wait for others to comment before doing this in v2.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
