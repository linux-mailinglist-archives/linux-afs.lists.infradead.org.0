Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED8B1E8B18
	for <lists+linux-afs@lfdr.de>; Sat, 30 May 2020 00:16:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4otJBHF7plYvrTKF8lc76/8PaJQkUqyun7hvsQEDr0=; b=JoSHe7UOpDihjt
	1UKF424ucL/dztgFrN9+ZQ/LzbeIdx8TbJywUm+CYs7IV93N9EPBkF1SlnpJ9/NveV44gzy7zMn6k
	ixYQptHXKPFWTLRToFlqS6Inb3dFyf3MwnnsKiA8M+XVUH56giIEqCqJSxJqlxb5w9vvCyAAGZCws
	7dE+jEbKXE7wNM1mau1H5Pv4zPT6UakQhNlk2t10ORedQ+LDCNAFSUfkxAFnDf4smfh7WlTeEoMbL
	QtDVgBCVuEGU5QnqdxUCIxWc5HdORywSF5EQXwEPVOBdQWZbCCSpKZTS84cwpp5Ea/5kcUB4f2pJa
	+0XGl8mottbKWD/1J7EA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jenIv-00030U-VT; Fri, 29 May 2020 22:16:41 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeN0p-0006gk-Dp; Thu, 28 May 2020 18:12:16 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 8FA40129191D0;
 Thu, 28 May 2020 11:12:06 -0700 (PDT)
Date: Thu, 28 May 2020 11:12:05 -0700 (PDT)
Message-Id: <20200528.111205.608949763790224771.davem@davemloft.net>
To: hch@lst.de
Subject: Re: remove most callers of kernel_setsockopt v3
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200528051236.620353-1-hch@lst.de>
References: <20200528051236.620353-1-hch@lst.de>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 28 May 2020 11:12:07 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_111215_466924_E9F35012 
X-CRM114-Status: UNSURE (   6.87  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Mailman-Approved-At: Fri, 29 May 2020 15:16:40 -0700
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
Cc: linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
 cluster-devel@redhat.com, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 jmaloy@redhat.com, linux-rdma@vger.kernel.org, edumazet@google.com,
 target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-nfs@vger.kernel.org, kuznet@ms2.inr.ac.ru, ying.xue@windriver.com,
 kuba@kernel.org, ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org,
 ocfs2-devel@oss.oracle.com, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: Christoph Hellwig <hch@lst.de>
Date: Thu, 28 May 2020 07:12:08 +0200

> this series removes most callers of the kernel_setsockopt functions, and
> instead switches their users to small functions that implement setting a
> sockopt directly using a normal kernel function call with type safety and
> all the other benefits of not having a function call.
> 
> In some cases these functions seem pretty heavy handed as they do
> a lock_sock even for just setting a single variable, but this mirrors
> the real setsockopt implementation unlike a few drivers that just set
> set the fields directly.
 ...

Series applied, thanks Christoph.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
