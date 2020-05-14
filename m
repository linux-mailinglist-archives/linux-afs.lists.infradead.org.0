Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D151D2F50
	for <lists+linux-afs@lfdr.de>; Thu, 14 May 2020 14:14:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/fn750Z3h5jFKgcccRGf3g8rlRZxoK2qXSM1jguaU9s=; b=hyrQ+YAeln3poZ
	m3TN8+ed1O78zNlr32l/SfQ8Z9SST9O+773qsUDhves0JFxRVzWhP5ZyFk0PhzawIG0U+ZJvHp+OK
	6CbkNMYmBAPsb+YMP60FmQsqVLaE308D8hRXBqM2UY4Wk50NhrcDVZVgF3/favkwxJ4TyAZTVmVse
	EGUCJKK3tG3pRd5QsS35nXdXgLoVoejSAMzqxEKaW83zN+pV+zhO34cQ4Df5RqfwIXHcX7XZREVnG
	15Lnqy7a8YnJiIvoeTSQ0tE9ehUTHD5dgu5LrW/G+6uQMwxjd7xOzBfzLbNU5jV8bF7bm7sT5Ys3Z
	y8JDb+Uwe4QKOmW1DowQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZCl3-0004s0-3X; Thu, 14 May 2020 12:14:37 +0000
Received: from smtprelay0168.hostedemail.com ([216.40.44.168]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZCOn-00064l-E2; Thu, 14 May 2020 11:51:39 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 82BDA2C1F;
 Thu, 14 May 2020 11:51:31 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:968:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3867:3868:3870:3871:3872:3874:4321:5007:6742:6743:10004:10400:10848:11232:11658:11914:12296:12297:12740:12760:12895:13069:13160:13229:13311:13357:13439:14659:21080:21611:21627:30054:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: soup46_cc3a3aa2090a
X-Filterd-Recvd-Size: 2294
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf01.hostedemail.com (Postfix) with ESMTPA;
 Thu, 14 May 2020 11:51:27 +0000 (UTC)
Message-ID: <9992a1fe768a0b1e9bb9470d2728ba25dbe042db.camel@perches.com>
Subject: Re: [PATCH 20/33] ipv4: add ip_sock_set_recverr
From: Joe Perches <joe@perches.com>
To: Christoph Hellwig <hch@lst.de>
Date: Thu, 14 May 2020 04:51:26 -0700
In-Reply-To: <20200514103025.GB12680@lst.de>
References: <20200513062649.2100053-1-hch@lst.de>
 <20200513062649.2100053-21-hch@lst.de>
 <0ee5acfaca4cf32d4efad162046b858981a4dae3.camel@perches.com>
 <20200514103025.GB12680@lst.de>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_045137_538158_2801DA8A 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.40.44.168 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [216.40.44.168 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Mailman-Approved-At: Thu, 14 May 2020 05:14:29 -0700
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
 Jakub Kicinski <kuba@kernel.org>, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, Neil Horman <nhorman@tuxdriver.com>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org,
 Vlad Yasevich <vyasevich@gmail.com>, linux-kernel@vger.kernel.org,
 Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
 "David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Thu, 2020-05-14 at 12:30 +0200, Christoph Hellwig wrote:
> On Wed, May 13, 2020 at 02:00:43PM -0700, Joe Perches wrote:
> > On Wed, 2020-05-13 at 08:26 +0200, Christoph Hellwig wrote:
> > > Add a helper to directly set the IP_RECVERR sockopt from kernel space
> > > without going through a fake uaccess.
> > 
> > This seems used only with true as the second arg.
> > Is there reason to have that argument at all?
> 
> Mostly to keep it symmetric with the sockopt.  I could probably remove
> a few arguments in the series if we want to be strict.

My preference would use strict and add
arguments only when necessary.



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
