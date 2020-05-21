Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E56ED1DCAA2
	for <lists+linux-afs@lfdr.de>; Thu, 21 May 2020 12:02:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/CVXbZBsIXJXwleHf2EIaTafNIp8QsKM5Cu4dPHtWDw=; b=Tqr4T0QyhB2w45
	mxckFdovAM3xJNLs6+1kHzfxse5NKnO2dPa0c8YWawSXAzrWD0cp1dDU7xcLI6umldndd6XPvjxmN
	PePcfjoqM/RGsgSq5jDQMzGCbp6Jvz0njz8JrLe0FSv8Y7VAuQspvHQCHaeV6tEzEhVSepFM6EP4u
	jFlMlbmHS6YmgO4Jwtd+1I6KInNcy9/nUhQUQip8+EwfwWZyzZdbB6Y/hvZWjYse+KN3pEl1tQh2v
	Z62twzlURDBYd3Etub6pLW6xBLQ/ee6f7FUlWOC1yrTLOBZrppHkv19Mtx6Vrzg6T9nQSlUCj4Xr3
	g3fnlELTeMRGEcuFJJTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbi1V-0001dd-Fm; Thu, 21 May 2020 10:01:57 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbgf8-0005hE-L2; Thu, 21 May 2020 08:34:48 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2946668BEB; Thu, 21 May 2020 10:34:43 +0200 (CEST)
Date: Thu, 21 May 2020 10:34:42 +0200
From: Christoph Hellwig <hch@lst.de>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Subject: Re: [PATCH 31/33] sctp: add sctp_sock_set_nodelay
Message-ID: <20200521083442.GA7771@lst.de>
References: <20200520195509.2215098-1-hch@lst.de>
 <20200520195509.2215098-32-hch@lst.de>
 <20200520231001.GU2491@localhost.localdomain>
 <20200520.162355.2212209708127373208.davem@davemloft.net>
 <20200520233913.GV2491@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520233913.GV2491@localhost.localdomain>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_013446_840928_21574760 
X-CRM114-Status: GOOD (  12.24  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [213.95.11.211 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Mailman-Approved-At: Thu, 21 May 2020 03:01:56 -0700
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
 linux-rdma@vger.kernel.org, hch@lst.de, cluster-devel@redhat.com,
 kuznet@ms2.inr.ac.ru, kuba@kernel.org, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, nhorman@tuxdriver.com, yoshfuji@linux-ipv6.org,
 netdev@vger.kernel.org, vyasevich@gmail.com, linux-kernel@vger.kernel.org,
 jmaloy@redhat.com, ying.xue@windriver.com, David Miller <davem@davemloft.net>,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, May 20, 2020 at 08:39:13PM -0300, Marcelo Ricardo Leitner wrote:
> On Wed, May 20, 2020 at 04:23:55PM -0700, David Miller wrote:
> > From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
> > Date: Wed, 20 May 2020 20:10:01 -0300
> > 
> > > The duplication with sctp_setsockopt_nodelay() is quite silly/bad.
> > > Also, why have the 'true' hardcoded? It's what dlm uses, yes, but the
> > > API could be a bit more complete than that.
> > 
> > The APIs are being designed based upon what in-tree users actually
> > make use of.  We can expand things later if necessary.
> 
> Sometimes expanding things later can be though, thus why the worry.
> But ok, I get it. Thanks.
> 
> The comment still applies, though. (re the duplication)

Where do you see duplication?

sctp_setsockopt_nodelay does the following things:

 - verifies optlen, returns -EINVAL if it doesn't match
 - calls get_user, returns -EFAULT on error
 - converts the value from get_user to a boolean and assigns it
   to sctp_sk(sk)->nodelay
 - returns 0.

sctp_sock_set_nodelay does:

 - call lock_sock
 - assign true to sctp_sk(sk)->nodelay
 - call release_sock
 - does not return an error code

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
