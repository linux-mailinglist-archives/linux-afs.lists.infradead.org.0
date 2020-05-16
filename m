Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4291D7514
	for <lists+linux-afs@lfdr.de>; Mon, 18 May 2020 12:23:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S78kwxsw3KpzhlryCFRfFh2KVVdx3vWPpIO7UlH4WUk=; b=WIybv+aymYUNZ0
	SpPUKmv4F37Ac/0EZgF84jna+jkrliyMMKrLqFoS1KgXrbSggAz0h3i99y6m2Q2cHsm4tpmKfphZA
	4+VgQ5CnlB4DJAaSRr9U7cmKMUsVLau/MpHY7YAe5862F7srpvZb90inGOMKIFFX+mhVpNWvyLlcj
	+gIvdIL3p/H5ndE+fjmur/DlaHDXNqGeW/PwcqVJWOEm88YFSiJ+Al+3JfB0hyQqCFNV7dKz2E+Eu
	cQIXoAWuEIVcpoMKGqW9yWefuCzLqgnJ85eiYINpVr79fFK2Xx/Ra+ngpgGnlgQQ5LZ8NSZ/HJnC0
	6X0I+qau3NKsQbsHq8nA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jacvn-0004CB-Bc; Mon, 18 May 2020 10:23:35 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZyTg-00009x-D0
 for linux-afs@lists.infradead.org; Sat, 16 May 2020 15:11:54 +0000
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-182-psAgggZzN62zzCab8iGYhQ-1; Sat, 16 May 2020 16:11:41 +0100
X-MC-Unique: psAgggZzN62zzCab8iGYhQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Sat, 16 May 2020 16:11:40 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Sat, 16 May 2020 16:11:40 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'David Howells' <dhowells@redhat.com>, Christoph Hellwig <hch@lst.de>
Subject: RE: [PATCH 27/33] sctp: export sctp_setsockopt_bindx
Thread-Topic: [PATCH 27/33] sctp: export sctp_setsockopt_bindx
Thread-Index: AQHWKsxNyiOODFVfBEqdWGEpseVc56iq0duQ
Date: Sat, 16 May 2020 15:11:40 +0000
Message-ID: <05d946ae948946158dbfcbc07939b799@AcuMS.aculab.com>
References: <20200514062820.GC8564@lst.de>
 <20200513062649.2100053-1-hch@lst.de> <20200513062649.2100053-28-hch@lst.de>
 <20200513180058.GB2491@localhost.localdomain>
 <129070.1589556002@warthog.procyon.org.uk>
In-Reply-To: <129070.1589556002@warthog.procyon.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200516_081152_711109_B0B77AAE 
X-CRM114-Status: GOOD (  15.27  )
X-Spam-Score: -0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.82.80.151 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [207.82.80.151 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 Neil Horman <nhorman@tuxdriver.com>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Vlad Yasevich <vyasevich@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
 "David S. Miller" <davem@davemloft.net>,
 "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells
> Sent: 15 May 2020 16:20
> Christoph Hellwig <hch@lst.de> wrote:
> 
> > > The advantage on using kernel_setsockopt here is that sctp module will
> > > only be loaded if dlm actually creates a SCTP socket.  With this
> > > change, sctp will be loaded on setups that may not be actually using
> > > it. It's a quite big module and might expose the system.
> >
> > True.  Not that the intent is to kill kernel space callers of setsockopt,
> > as I plan to remove the set_fs address space override used for it.
> 
> For getsockopt, does it make sense to have the core kernel load optval/optlen
> into a buffer before calling the protocol driver?  Then the driver need not
> see the userspace pointer at all.
> 
> Similar could be done for setsockopt - allocate a buffer of the size requested
> by the user inside the kernel and pass it into the driver, then copy the data
> back afterwards.

Yes, it also simplifies all the compat code.
And there is a BPF test in setsockopt that also wants to
pass on a kernel buffer.

I'm willing to sit and write the patch.
Quoting from a post I made later on Friday.

Basically:

This patch sequence (to be written) does the following:

Patch 1: Change __sys_setsockopt() to allocate a kernel buffer,
         copy the data into it then call set_fs(KERNEL_DS).
         An on-stack buffer (say 64 bytes) will be used for
         small transfers.

Patch 2: The same for __sys_getsockopt().

Patch 3: Compat setsockopt.

Patch 4: Compat getsockopt.

Patch 5: Remove the user copies from the global socket options code.

Patches 6 to n-1; Remove the user copies from the per-protocol code.

Patch n: Remove the set_fs(KERNEL_DS) from the entry points.

This should be bisectable.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
