Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E031DCAA1
	for <lists+linux-afs@lfdr.de>; Thu, 21 May 2020 12:02:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=55E8syUUqbf2VbB4x7YFEu7W4Uz+sPfn8vJUQTpGyX8=; b=X67uCUBLChbCjF
	s6vYFI7Qwq4fHs9/p26RKUUUSXSAnO1QVErYUcjXlK7TnuSSMX8UwlnbeZh4uEwrd8Hul3zCgtjNj
	pabSwz2RX5v6Yb913CxndaBXBIJp4MoK5hOQHQ/I53CxgRF3XMp/9tSdZPx57ZmM0NzP2WGmSNgiK
	rsnN3BtakRVljHFCdsvMwJK7l8a3CkucPGHXncA7qYp5BPV+a9DnRUoumbWw1+Eo+gyKHAkTxMSNW
	+YaI4A3+ybM45zxtiKNMLd1XRu0r38X9YdaudBnD/sM1HQzzLgpUQ9vZBEHSZh74UcipFgItLc3xa
	iJDYiiqgG3ePkTFGBQVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbi1W-0001g7-Q1; Thu, 21 May 2020 10:01:58 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbhF5-0007Ng-L4; Thu, 21 May 2020 09:11:56 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id DBA5368C4E; Thu, 21 May 2020 11:11:50 +0200 (CEST)
Date: Thu, 21 May 2020 11:11:50 +0200
From: 'Christoph Hellwig' <hch@lst.de>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: remove kernel_setsockopt and kernel_getsockopt v2
Message-ID: <20200521091150.GA8401@lst.de>
References: <20200520195509.2215098-1-hch@lst.de>
 <138a17dfff244c089b95f129e4ea2f66@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <138a17dfff244c089b95f129e4ea2f66@AcuMS.aculab.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_021155_839068_93A903A3 
X-CRM114-Status: GOOD (  15.66  )
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
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Eric Dumazet <edumazet@google.com>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 'Christoph Hellwig' <hch@lst.de>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Jakub Kicinski <kuba@kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 Neil Horman <nhorman@tuxdriver.com>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Vlad Yasevich <vyasevich@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
 "David S. Miller" <davem@davemloft.net>,
 "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Thu, May 21, 2020 at 08:01:33AM +0000, David Laight wrote:
> How much does this increase the kernel code by?

 44 files changed, 660 insertions(+), 843 deletions(-)


> You are also replicating a lot of code making it more
> difficult to maintain.

No, I specifically don't.

> I don't think the performance of an socket option code
> really matters - it is usually done once when a socket
> is initialised and the other costs of establishing a
> connection will dominate.
> 
> Pulling the user copies outside the [gs]etsocksopt switch
> statement not only reduces the code size (source and object)
> and trivially allows kernel_[sg]sockopt() to me added to
> the list of socket calls.
> 
> It probably isn't possible to pull the usercopies right
> out into the syscall wrapper because of some broken
> requests.

Please read through the previous discussion of the rationale and the
options.  We've been there before.

> I worried about whether getsockopt() should read the entire
> user buffer first. SCTP needs the some of it often (including a
> sockaddr_storage in one case), TCP needs it once.
> However the cost of reading a few words is small, and a big
> buffer probably needs setting to avoid leaking kernel
> memory if the structure has holes or fields that don't get set.
> Reading from userspace solves both issues.

As mention in the thread on the last series:  That was my first idea, but
we have way to many sockopts, especially in obscure protocols that just
hard code the size.  The chance of breaking userspace in a way that can't
be fixed without going back to passing user pointers to get/setsockopt
is way to high to commit to such a change unfortunately.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
