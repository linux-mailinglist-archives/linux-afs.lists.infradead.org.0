Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 262C91D2021
	for <lists+linux-afs@lfdr.de>; Wed, 13 May 2020 22:22:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6N0BUz4Xl0OVcxZrojxeIkbahk6JYx/JWxgx+5vSS8=; b=oRNvnj7vQ+eb5e
	XcpnqFOiLKlXoJOnD8QocDfqHogICbqPlK1jb41HnUcPDgOGmqsIQl0Z661nFvfYswG5SvHm/HRVF
	8XpcGZ4zCyb6BAEdLTDUP2EojAeATmyduRCgHMSZRK8m49P41a20ZiX66a8nBtlURmU2kYioYUW51
	SsNVjbwd2yCRIwqfjiP4qXk5hDKm9VG3XJLZ9jzWxmsoQehIg2c5n9SlChfC+S/UDfHPV2W9Qg1Vv
	59jz78ZjDToEM20WT49gZXh5Wh6D9GY0nrNoUjA5fXa/4iGFhK/uf3UJeP/kTVzHbHVYgpSDQbTaq
	YKYmGqxRxhTzPW96eb+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYxtI-00065f-8j; Wed, 13 May 2020 20:22:08 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYwnk-0001SZ-65; Wed, 13 May 2020 19:12:21 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 6900A127DD751;
 Wed, 13 May 2020 12:12:11 -0700 (PDT)
Date: Wed, 13 May 2020 12:12:10 -0700 (PDT)
Message-Id: <20200513.121210.1508400748648949138.davem@davemloft.net>
To: hch@lst.de
Subject: Re: remove kernel_setsockopt and kernel_getsockopt
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200513062649.2100053-1-hch@lst.de>
References: <20200513062649.2100053-1-hch@lst.de>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 13 May 2020 12:12:12 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_121220_229193_1123F5CA 
X-CRM114-Status: GOOD (  10.86  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Mailman-Approved-At: Wed, 13 May 2020 13:22:06 -0700
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
Cc: marcelo.leitner@gmail.com, edumazet@google.com,
 linux-nvme@lists.infradead.org, linux-sctp@vger.kernel.org,
 target-devel@vger.kernel.org, linux-afs@lists.infradead.org,
 drbd-dev@lists.linbit.com, linux-cifs@vger.kernel.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, cluster-devel@redhat.com,
 kuznet@ms2.inr.ac.ru, linux-block@vger.kernel.org, kuba@kernel.org,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org, nhorman@tuxdriver.com,
 yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, vyasevich@gmail.com,
 linux-kernel@vger.kernel.org, jmaloy@redhat.com, ying.xue@windriver.com,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: Christoph Hellwig <hch@lst.de>
Date: Wed, 13 May 2020 08:26:15 +0200

> Hi Dave,
> 
> this series removes the kernel_setsockopt and kernel_getsockopt
> functions, and instead switches their users to small functions that
> implement setting (or in one case getting) a sockopt directly using
> a normal kernel function call with type safety and all the other
> benefits of not having a function call.
> 
> In some cases these functions seem pretty heavy handed as they do
> a lock_sock even for just setting a single variable, but this mirrors
> the real setsockopt implementation - counter to that a few kernel
> drivers just set the fields directly already.
> 
> Nevertheless the diffstat looks quite promising:
> 
>  42 files changed, 721 insertions(+), 799 deletions(-)

Overall I'm fine with these changes, but three things need to happen
before I can think about applying this:

1) Address David's feedback about the ip_mtu*() calls that can occur
   on ipv6 sockets too.

2) Handle the feedback about dlm now bringing in sctp even if sctp
   sockets are not even used because of the symbol dependency.

3) Add the rxrpc documentation requested by David.

Thank you.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
