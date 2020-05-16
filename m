Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D101D7513
	for <lists+linux-afs@lfdr.de>; Mon, 18 May 2020 12:23:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODYwpGIc1Ykkh87+O/30TTw6yLRo1gTOPgOTzwz9axc=; b=biXe5d7Kz1Lac/
	FLaOgHa3gN0iK9aWCLx1KENyk9TUOGgwLDsQ2Uq7YU+xYTTp20hpRJZFU9fC/KlaHX2Di7c2I6kQm
	8LV06KwNDSmZrxCIWdABwX+waleCLQLdtVwUCOAISrcU5r9wJWocOTC+KS0cXUJUvjj+Y79SMUt8S
	fwZ4ip2+rupZ+fzbY8NN4Ubdata26pm9F8Aso1FSDAu8XeBhKFCkrjb4E9AoNuwoeYkFOTp/7k8FY
	nGctI2juh1YKstPIXc3mJwkvtKfBtYmCM/QZ01n5yuV1NkU85xKV2BT3IhMjta2cn18PfMUG8s+4W
	/LLFh4RKjfG7C47T2vqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jacvn-0004Ca-Od; Mon, 18 May 2020 10:23:35 +0000
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jZyrs-000842-U1; Sat, 16 May 2020 15:36:52 +0000
Date: Sat, 16 May 2020 08:36:52 -0700
From: Matthew Wilcox <willy@infradead.org>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [Ocfs2-devel] [PATCH 27/33] sctp: export sctp_setsockopt_bindx
Message-ID: <20200516153652.GM16070@bombadil.infradead.org>
References: <20200514062820.GC8564@lst.de>
 <20200513062649.2100053-1-hch@lst.de>
 <20200513062649.2100053-28-hch@lst.de>
 <20200513180058.GB2491@localhost.localdomain>
 <129070.1589556002@warthog.procyon.org.uk>
 <05d946ae948946158dbfcbc07939b799@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <05d946ae948946158dbfcbc07939b799@AcuMS.aculab.com>
X-Mailman-Approved-At: Mon, 18 May 2020 03:23:34 -0700
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
 'David Howells' <dhowells@redhat.com>,
 "linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
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

On Sat, May 16, 2020 at 03:11:40PM +0000, David Laight wrote:
> From: David Howells
> > Sent: 15 May 2020 16:20
> > Christoph Hellwig <hch@lst.de> wrote:
> > 
> > > > The advantage on using kernel_setsockopt here is that sctp module will
> > > > only be loaded if dlm actually creates a SCTP socket.  With this
> > > > change, sctp will be loaded on setups that may not be actually using
> > > > it. It's a quite big module and might expose the system.
> > >
> > > True.  Not that the intent is to kill kernel space callers of setsockopt,
> > > as I plan to remove the set_fs address space override used for it.
> > 
> > For getsockopt, does it make sense to have the core kernel load optval/optlen
> > into a buffer before calling the protocol driver?  Then the driver need not
> > see the userspace pointer at all.
> > 
> > Similar could be done for setsockopt - allocate a buffer of the size requested
> > by the user inside the kernel and pass it into the driver, then copy the data
> > back afterwards.
> 
> Yes, it also simplifies all the compat code.
> And there is a BPF test in setsockopt that also wants to
> pass on a kernel buffer.
> 
> I'm willing to sit and write the patch.
> Quoting from a post I made later on Friday.
> 
> Basically:
> 
> This patch sequence (to be written) does the following:
> 
> Patch 1: Change __sys_setsockopt() to allocate a kernel buffer,
>          copy the data into it then call set_fs(KERNEL_DS).
>          An on-stack buffer (say 64 bytes) will be used for
>          small transfers.
> 
> Patch 2: The same for __sys_getsockopt().
> 
> Patch 3: Compat setsockopt.
> 
> Patch 4: Compat getsockopt.
> 
> Patch 5: Remove the user copies from the global socket options code.
> 
> Patches 6 to n-1; Remove the user copies from the per-protocol code.
> 
> Patch n: Remove the set_fs(KERNEL_DS) from the entry points.
> 
> This should be bisectable.

I appreciate your dedication to not publishing the source code to
your kernel module, but Christoph's patch series is actually better.
It's typesafe rather than passing void pointers around.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
