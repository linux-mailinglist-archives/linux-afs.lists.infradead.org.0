Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D40951D2F4C
	for <lists+linux-afs@lfdr.de>; Thu, 14 May 2020 14:14:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nGjN6NlHYyjseVTOM9sloOFINCTabHBr8w1YDlxklvU=; b=PDo8f0Bh/viiQQ
	nrxunSaYiv3ayTJm1OeZv4ZXNU0n1DUGPA3N8MSCvX0d1ev5gZrbMFtz2j6FwRKE+UbNnkJ+JhWyC
	ny/5wE/Lo6VAGApN49S7CnoJPLz05OyajhcBMDi1FeQoLawFORH5tlZRGulsVbHqEGvTquiAP+C1X
	XBMX7A8wpI9KlcKZ9Cqpkl02QCfgSO1SigpuBlqMtKIADnnQu4B68YjQF+cLqFfniLexHTE22/NE+
	LG83Oe7VNXHEwFxZYqRS063khPkidHQGz7O6oYCUTbAm/g/UoFUZLQxV40aXYRs4wUR1u5NdR2Nda
	s78/wPqBr7ihhmkXbPHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZCkw-0004j5-Jj; Thu, 14 May 2020 12:14:30 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZ9AC-00068T-MW
 for linux-afs@bombadil.infradead.org; Thu, 14 May 2020 08:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=GNSl57J+LxonPLzG8vkL/ar7GDiVodtVdzEZg1S8fvM=; b=O1vX9xqG6anzFAK8EDJjI1hgdg
 TJmt5p6CopyNJBP8G6mry37xhPyHq9PaUHpA3qfemt/awhOQHsJSl+6GxI/i4FpzgeqL7X2IpdfNC
 FqxMVvsRHCvAekX3YZG8hs1EI6gJie0Z9SWW2bvA/s9SNaXBXHoFx2vu9vChLvrcipqvHohvRMB2K
 vKfcr/Oaqbr4TTJC4fGCDaj7k7trMx7Qdms1OqK+Qh8fCbtZXUWeav33LUwm97VurcJ1RevPb8C2C
 h2rrszygxiKpMXUlAro2LvZsZqusqWXI3fZw+/Ao2Zbk02iZIuNErl3q+19/R5BJuA14i69+eK6Di
 vfHJ0hUA==;
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZ9A9-0004JE-Sd
 for linux-afs@lists.infradead.org; Thu, 14 May 2020 08:24:19 +0000
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-160-NR0jAm9dMXGz0XSWuD-CMg-1; Thu, 14 May 2020 09:23:44 +0100
X-MC-Unique: NR0jAm9dMXGz0XSWuD-CMg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 14 May 2020 09:23:43 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 14 May 2020 09:23:43 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Marcelo Ricardo Leitner' <marcelo.leitner@gmail.com>, Christoph Hellwig
 <hch@lst.de>
Subject: RE: [PATCH 27/33] sctp: export sctp_setsockopt_bindx
Thread-Topic: [PATCH 27/33] sctp: export sctp_setsockopt_bindx
Thread-Index: AQHWKVB6yiOODFVfBEqdWGEpseVc56inPsjA
Date: Thu, 14 May 2020 08:23:43 +0000
Message-ID: <f22a26559aa9430ab8549c0624729082@AcuMS.aculab.com>
References: <20200513062649.2100053-1-hch@lst.de>
 <20200513062649.2100053-28-hch@lst.de>
 <20200513180058.GB2491@localhost.localdomain>
In-Reply-To: <20200513180058.GB2491@localhost.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
X-Spam-Note: CRM114 invocation failed
X-Spam-Score: -0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on merlin.infradead.org summary:
 Content analysis details:   (-0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.82.80.151 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [207.82.80.151 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
Cc: Eric Dumazet <edumazet@google.com>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
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

From: Marcelo Ricardo Leitner
> Sent: 13 May 2020 19:01
> On Wed, May 13, 2020 at 08:26:42AM +0200, Christoph Hellwig wrote:
> > And call it directly from dlm instead of going through kernel_setsockopt.
> 
> The advantage on using kernel_setsockopt here is that sctp module will
> only be loaded if dlm actually creates a SCTP socket.  With this
> change, sctp will be loaded on setups that may not be actually using
> it. It's a quite big module and might expose the system.
> 
> I'm okay with the SCTP changes, but I'll defer to DLM folks to whether
> that's too bad or what for DLM.

I didn't see these sneak through.

There is a big long list of SCTP socket options that are
needed to make anything work.

They all need exporting.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
