Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1771D2020
	for <lists+linux-afs@lfdr.de>; Wed, 13 May 2020 22:22:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sz+a6TX/tgA0yuKdLDtA3rKPzdEhlLLa1TiIBf2sR8U=; b=ZwS6YAtKBFYlh0
	+cB53MT3MhwIAFN74EO/MbRw1Ohdy5E+O0+AuIFvXBNtdVitjisA1DsyH0AmXAxEZ4LfZl+jOiTGL
	a5MpwTKwrKpgQ4KdB+7oyvNRF48tVkpOf619VUdVzRfSdu8wC9zKI+hlxavTnPnnV9kndYTuRRx71
	CeNfQivkFJUmcD59Ka6nxblgmKspEpL8DPiY+D0dBZ7SL7580omaRoIF+ztBPPWYQ+KULlbaOmnei
	7CUHqRJ1y7g7Bl9CvqFSrKh70mrmvLTMQLDAjCPTEn2+NPg5r7Wy6+BqBPvrL5rNQtaNHG9Ft03Xm
	At7JIaashnw7O/bzIoRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYxtH-000647-H4; Wed, 13 May 2020 20:22:07 +0000
Received: from smtprelay0004.hostedemail.com ([216.40.44.4]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYvLX-0003qB-UB; Wed, 13 May 2020 17:39:09 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 213E41802912F;
 Wed, 13 May 2020 17:39:05 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:968:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:1801:2194:2199:2393:2559:2562:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3872:3874:4030:4321:4605:5007:6742:6743:7875:8603:8660:10004:10400:10848:11026:11232:11658:11914:12043:12296:12297:12679:12740:12760:12895:13019:13069:13146:13148:13156:13228:13230:13311:13357:13439:14040:14659:14721:21080:21627:30054:30070:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: watch82_4eccc56996d20
X-Filterd-Recvd-Size: 2964
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Wed, 13 May 2020 17:39:01 +0000 (UTC)
Message-ID: <ecc165c33962d964d518c80de605af632eee0474.camel@perches.com>
Subject: Re: remove kernel_setsockopt and kernel_getsockopt
From: Joe Perches <joe@perches.com>
To: Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Date: Wed, 13 May 2020 10:38:59 -0700
In-Reply-To: <20200513062649.2100053-1-hch@lst.de>
References: <20200513062649.2100053-1-hch@lst.de>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_103908_027635_2716B537 
X-CRM114-Status: GOOD (  11.00  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.40.44.4 listed in list.dnswl.org]
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
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Eric Dumazet <edumazet@google.com>, linux-nvme@lists.infradead.org,
 linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-afs@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, cluster-devel@redhat.com,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, linux-block@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 Neil Horman <nhorman@tuxdriver.com>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org,
 Vlad Yasevich <vyasevich@gmail.com>, linux-kernel@vger.kernel.org,
 Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, 2020-05-13 at 08:26 +0200, Christoph Hellwig wrote:
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

trivia:

It might be useful to show overall object size change.

More EXPORT_SYMBOL uses increase object size a little.

And not sure it matters much except it reduces overall object
size, but these patches remove (unnecessary) logging on error
and that could be mentioned in the cover letter too.

e.g.:

-       ret = kernel_setsockopt(queue->sock, SOL_SOCKET, SO_LINGER,
-                       (char *)&sol, sizeof(sol));
-       if (ret) {
-               dev_err(nctrl->device,
-                       "failed to set SO_LINGER sock opt %d\n", ret);
-               goto err_sock;
-       }
+       sock_set_linger(queue->sock->sk, true, 0);




_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
