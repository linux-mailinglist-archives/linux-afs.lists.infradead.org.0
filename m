Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C91C21C3C6C
	for <lists+linux-afs@lfdr.de>; Mon,  4 May 2020 16:10:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEQj3GjTYfMbL/qFaPt1Kpm5xU2qb3D09oD9hQURTn4=; b=Xddpfu1dhoLgfN
	h0XqaidA5gWPzwyuE80R5DH0708ExF7NHXsELQFc/H1y5LyNta9hZnMjTz7vxJUK6PDLHfrbX8OJP
	eRfMw1pbf1DcjomI1+hPXstiXH95WoRVVVDE9vCoXBGMZMRGeSiFJCXiuvC5n56L9Xp1murFWCvzF
	sA4XyIvqzO3VbJkE2qM/nolQlG+gkcYViFkqUVMfWNSD1F/jUlAbaDtGZ71AyTVs7F4G1k3DwZOVm
	7wsTvIfgd5/5s6mfCEGCbmC3R/kGzHTaWgglFs9w386O8rI6U6H6LFIeR5ol7gg2smlboqQG52o2P
	zNZ6THQRUsIkA7Gxo6VA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVbnA-0006MG-Ur; Mon, 04 May 2020 14:09:56 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUFIv-0006Gw-Cn
 for linux-afs@lists.infradead.org; Thu, 30 Apr 2020 19:57:06 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 4DE7A1289CE3F;
 Thu, 30 Apr 2020 12:56:55 -0700 (PDT)
Date: Thu, 30 Apr 2020 12:56:54 -0700 (PDT)
Message-Id: <20200430.125654.335144341485365161.davem@davemloft.net>
To: mchehab+huawei@kernel.org
Subject: Re: [PATCH 00/37] net: manually convert files to ReST format - part 2
From: David Miller <davem@davemloft.net>
In-Reply-To: <cover.1588261997.git.mchehab+huawei@kernel.org>
References: <cover.1588261997.git.mchehab+huawei@kernel.org>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 30 Apr 2020 12:56:56 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_125705_438908_04659957 
X-CRM114-Status: UNSURE (   6.72  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Mailman-Approved-At: Mon, 04 May 2020 07:09:55 -0700
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
Cc: marcelo.leitner@gmail.com, linux-doc@vger.kernel.org,
 benh@kernel.crashing.org, dhowells@redhat.com, linux-sctp@vger.kernel.org,
 paulus@samba.org, ioana.ciornei@nxp.com, linux-afs@lists.infradead.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com, socketcan@hartkopp.net,
 ruxandra.radulescu@nxp.com, corbet@lwn.net, linux-rdma@vger.kernel.org,
 mpe@ellerman.id.au, kadlec@netfilter.org, coreteam@netfilter.org,
 kuba@kernel.org, pablo@netfilter.org, linux-x25@vger.kernel.org,
 santosh.shilimkar@oracle.com, linux-can@vger.kernel.org, mkl@pengutronix.de,
 courmisch@gmail.com, kvalo@codeaurora.org, kou.ishizaki@toshiba.co.jp,
 fw@strlen.de, nhorman@tuxdriver.com, geoff@infradead.org,
 netdev@vger.kernel.org, vyasevich@gmail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 gregkh@linuxfoundation.org, johannes@sipsolutions.net,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date: Thu, 30 Apr 2020 18:03:55 +0200

> That's the second part of my work to convert the networking
> text files into ReST. it is based on today's linux-next (next-20200430).
> 
> The full series (including those ones) are at:
> 
> 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=net-docs
> 
> I should be sending the remaining patches (another /38 series)
> after getting those merged at -next.
> 
> The documents, converted to HTML via the building system are at:
> 
> 	https://www.infradead.org/~mchehab/kernel_docs/networking/

Series applied to net-next, thank you.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
