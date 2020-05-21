Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 046CC1E21C2
	for <lists+linux-afs@lfdr.de>; Tue, 26 May 2020 14:22:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1I9MoaGibo4i6gNLAomIUAYuak739GuDp0C+DTBzeE8=; b=WrHcwPOXI7zJ/F
	M+K0+Ix9Yzw71kg09IiKEJzhOj+Pq1gG8lQhIbbNn0Eh1m2JwSvOztGI+3vStFzXIceorZmX6aais
	lYBiIFI/y3sZiKUBxsggXJT31amq0+R5gXXz3RdVdAtEcRGY681ZOur7ijpURszzTvFVoMY+j5daL
	ObTs/4vLLuvyRLNj7XqJRju8Ro5OQ7evPLfyCLMul2R0VdEAzUQWRe8Lj4gFZht0QT7VRI7a4rYsQ
	D7634R77hGiXd6kEaB3IQKcEiS1VO5j3+Gizx3o+6MnPiSv6Yz0pHakYvx6dQSy9HY1/IyuH//ehX
	qOzRDgzVejOSiJ8dUaNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdYaT-0005Dh-Rp; Tue, 26 May 2020 12:21:41 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jblhP-0004cC-Hm; Thu, 21 May 2020 13:57:29 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 955B468BEB; Thu, 21 May 2020 15:57:23 +0200 (CEST)
Date: Thu, 21 May 2020 15:57:23 +0200
From: Christoph Hellwig <hch@lst.de>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Subject: Re: [PATCH 31/33] sctp: add sctp_sock_set_nodelay
Message-ID: <20200521135723.GA12368@lst.de>
References: <20200520195509.2215098-1-hch@lst.de>
 <20200520195509.2215098-32-hch@lst.de>
 <20200520231001.GU2491@localhost.localdomain>
 <20200520.162355.2212209708127373208.davem@davemloft.net>
 <20200520233913.GV2491@localhost.localdomain> <20200521083442.GA7771@lst.de>
 <20200521133348.GX2491@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200521133348.GX2491@localhost.localdomain>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_065727_735860_44295D5A 
X-CRM114-Status: UNSURE (   5.69  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [213.95.11.211 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Mailman-Approved-At: Tue, 26 May 2020 05:21:39 -0700
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
Cc: edumazet@google.com, linux-nvme@lists.infradead.org,
 linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-afs@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 cluster-devel@redhat.com, kuznet@ms2.inr.ac.ru, kuba@kernel.org,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org, nhorman@tuxdriver.com,
 yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, vyasevich@gmail.com,
 linux-kernel@vger.kernel.org, jmaloy@redhat.com, ying.xue@windriver.com,
 David Miller <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Thu, May 21, 2020 at 10:33:48AM -0300, Marcelo Ricardo Leitner wrote:
> With the patch there are now two ways of enabling nodelay.

There is exactly one way to do for user applications, and one way
for kernel drivers.  (actually they could just set the field directly,
which no one does for sctp, but for ipv4 a few do just that).

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
