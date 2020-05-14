Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D702B1D2F4E
	for <lists+linux-afs@lfdr.de>; Thu, 14 May 2020 14:14:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rbP+K+QdJBboeR5RjyriqJOcaBwCu56luWN3oXwiOl8=; b=ZmzRgabefEjTmO
	BU7wTpzEKwXnlhScaZf40y9CU2pkF77IlCuAxE9RVbqH+ZfgN64YhB6pooBcT4VOVJJjdZwCbodTN
	J9U46+TGr6HEWChrQAxR4obgzPF/yQxgOpOi19w70GpqpHdSzdaqgHmkiRzvIcKIslhbOIXARtX0P
	Fk8fJKGyYqLpd2OU2LsWwds6e3s+T8ft2CgtMoNcv45Tnl89FgcZGTEcAjhhUDpfjOkeeRDxQeOqy
	8wRlt58OXMQrxwnogZqSR2xjQkV7SRD4HhT0/5QXTiA4dAaKWJvTWIV4s9B3/MvD8nsUfC/d4enr/
	HwbPHlaDVTcRavwdEQOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZCkx-0004lT-V0; Thu, 14 May 2020 12:14:31 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([146.101.78.151])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZB4g-0007jL-Ro
 for linux-afs@lists.infradead.org; Thu, 14 May 2020 10:26:48 +0000
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-129-mzoWMat6PF2wNz8vgiMclw-1; Thu, 14 May 2020 11:26:43 +0100
X-MC-Unique: mzoWMat6PF2wNz8vgiMclw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 14 May 2020 11:26:41 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 14 May 2020 11:26:41 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@lst.de>
Subject: RE: remove kernel_setsockopt and kernel_getsockopt
Thread-Topic: remove kernel_setsockopt and kernel_getsockopt
Thread-Index: AQHWKU15LJmP4mOGDE2/GHhLszFt9KinP7aQgAAO/ACAABIowA==
Date: Thu, 14 May 2020 10:26:41 +0000
Message-ID: <a76440f7305c4653877ff2abff499f4e@AcuMS.aculab.com>
References: <20200513062649.2100053-1-hch@lst.de>
 <ecc165c33962d964d518c80de605af632eee0474.camel@perches.com>
 <756758e8f0e34e2e97db470609f5fbba@AcuMS.aculab.com>
 <20200514101838.GA12548@lst.de>
In-Reply-To: <20200514101838.GA12548@lst.de>
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
X-CRM114-CacheID: sfid-20200514_032647_181563_89E1A568 
X-CRM114-Status: UNSURE (   4.90  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [146.101.78.151 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 Eric Dumazet <edumazet@google.com>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>, Alexey
 Kuznetsov <kuznet@ms2.inr.ac.ru>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 'Joe Perches' <joe@perches.com>, Jakub Kicinski <kuba@kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 Neil Horman <nhorman@tuxdriver.com>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Vlad Yasevich <vyasevich@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jon Maloy <jmaloy@redhat.com>,
 "linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
 Ying Xue <ying.xue@windriver.com>, "David S. Miller" <davem@davemloft.net>,
 "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: Christoph Hellwig
> Only for those were we have users, and all those are covered.

What do we tell all our users when our kernel SCTP code
no longer works?

It uses SO_REUSADDR, SCTP_EVENTS, SCTP_NODELAY,
SCTP_STATUS, SCTP_INITMSG, IPV6_ONLY, SCTP_SOCKOPT_BINDX_ADD
and SO_LINGER.
We should probably use the CONNECTX function as well.

I doubt we are the one company with out-of-tree drivers
that use the kernel_socket interface.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
