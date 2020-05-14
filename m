Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D60B1D3ECE
	for <lists+linux-afs@lfdr.de>; Thu, 14 May 2020 22:15:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGr9ShopdB6U1YZXACKnu35b3wqGGkBywCrz35ouDz8=; b=rTkyFldukKIk3u
	vpDkaI1xJt0wL5pRXqEKk2Lix+H1A8YZMM69agSYgBD9bfTgZvDtqWRpY0pTXuR5ZCUThHPnk7Dgf
	Qfxmenivyq7vkyGtJaEdoJIHdTFdvJ0Gagvs8immA5ZHeCjtmtGYyeBArom4gqv9PMZEQjs4PEdNE
	Qh1IqkVH47JiWV1RCoI8RpDRLmb3wVgpXnZVkZ4fPpe+XabUqEKCUQVeX8/MvM2TH8Z9Xl78ztEA0
	YOb3tWWE04DZyymHFbgWdE4ArWJV/ZxmrzxefVqeIs+J+K7xS3kRAR2vOe2ScoUIrh9Xl1FWWYtmG
	mPR8YDdq39DaJBVm2W9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZKGg-0006fM-GO; Thu, 14 May 2020 20:15:46 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZD0K-0000Wn-CH
 for linux-afs@lists.infradead.org; Thu, 14 May 2020 12:30:26 +0000
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-254-IsdhEyj2MaapF7FHDwegSA-1; Thu, 14 May 2020 13:30:18 +0100
X-MC-Unique: IsdhEyj2MaapF7FHDwegSA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 14 May 2020 13:30:17 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 14 May 2020 13:30:17 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Marcelo Ricardo Leitner' <marcelo.leitner@gmail.com>, 'Christoph Hellwig'
 <hch@lst.de>
Subject: RE: [PATCH 32/33] sctp: add sctp_sock_get_primary_addr
Thread-Topic: [PATCH 32/33] sctp: add sctp_sock_get_primary_addr
Thread-Index: AQHWKVDpRRlTTX4YZEat3HB6AYvqqainVRxwgAAtMyA=
Date: Thu, 14 May 2020 12:30:17 +0000
Message-ID: <c66e0309572345f5b0f32d078701f2d7@AcuMS.aculab.com>
References: <20200513062649.2100053-1-hch@lst.de>
 <20200513062649.2100053-33-hch@lst.de>
 <20200513180302.GC2491@localhost.localdomain>
 <d112e18bfbdd40dfb219ed2c1f2082d4@AcuMS.aculab.com>
In-Reply-To: <d112e18bfbdd40dfb219ed2c1f2082d4@AcuMS.aculab.com>
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
X-CRM114-CacheID: sfid-20200514_053024_707453_0E0033C1 
X-CRM114-Status: GOOD (  13.23  )
X-Spam-Score: -0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.82.80.151 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [207.82.80.151 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Mailman-Approved-At: Thu, 14 May 2020 13:15:44 -0700
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
Cc: 'Eric Dumazet' <edumazet@google.com>,
 "'linux-nvme@lists.infradead.org'" <linux-nvme@lists.infradead.org>,
 "'linux-sctp@vger.kernel.org'" <linux-sctp@vger.kernel.org>,
 "'target-devel@vger.kernel.org'" <target-devel@vger.kernel.org>,
 "'linux-afs@lists.infradead.org'" <linux-afs@lists.infradead.org>,
 "'drbd-dev@lists.linbit.com'" <drbd-dev@lists.linbit.com>,
 "'linux-cifs@vger.kernel.org'" <linux-cifs@vger.kernel.org>,
 "'rds-devel@oss.oracle.com'" <rds-devel@oss.oracle.com>,
 "'linux-rdma@vger.kernel.org'" <linux-rdma@vger.kernel.org>,
 "'cluster-devel@redhat.com'" <cluster-devel@redhat.com>,
 'Alexey Kuznetsov' <kuznet@ms2.inr.ac.ru>,
 "'linux-block@vger.kernel.org'" <linux-block@vger.kernel.org>,
 'Jakub Kicinski' <kuba@kernel.org>,
 "'ceph-devel@vger.kernel.org'" <ceph-devel@vger.kernel.org>,
 "'linux-nfs@vger.kernel.org'" <linux-nfs@vger.kernel.org>,
 'Neil Horman' <nhorman@tuxdriver.com>,
 'Hideaki YOSHIFUJI' <yoshfuji@linux-ipv6.org>,
 "'netdev@vger.kernel.org'" <netdev@vger.kernel.org>, 'Vlad
 Yasevich' <vyasevich@gmail.com>,
 "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
 'Jon Maloy' <jmaloy@redhat.com>, 'Ying Xue' <ying.xue@windriver.com>,
 "'David S. Miller'" <davem@davemloft.net>,
 "'ocfs2-devel@oss.oracle.com'" <ocfs2-devel@oss.oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Laight
> Sent: 14 May 2020 10:51
> From: Marcelo Ricardo Leitner
> > Sent: 13 May 2020 19:03
> >
> > On Wed, May 13, 2020 at 08:26:47AM +0200, Christoph Hellwig wrote:
> > > Add a helper to directly get the SCTP_PRIMARY_ADDR sockopt from kernel
> > > space without going through a fake uaccess.
> >
> > Same comment as on the other dlm/sctp patch.
> 
> Wouldn't it be best to write sctp_[gs]etsockotp() that
> use a kernel buffer and then implement the user-space
> calls using a wrapper that does the copies to an on-stack
> (or malloced if big) buffer.

Actually looking at __sys_setsockopt() it calls
BPF_CGROUP_RUN_PROG_SETSOCKOPT() which (by the look of it)
can copy the user buffer into malloc()ed memory and
cause set_fs(KERNEL_DS) be called.

The only way to get rid of that set_fs() is to always
have the buffer in kernel memory when the underlying
setsockopt() code is called.

The comment above __sys_[sg]etsockopt() about not knowing
the length is just wrong.
It probably applied to getsockopt() in the dim and distant
past before it was made read-update.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
