Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 144131D5467
	for <lists+linux-afs@lfdr.de>; Fri, 15 May 2020 17:24:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=isQb9mtTSm4w6LKDrTvRyhU0KdXWVrGBFejeQoxBoT0=; b=r6n58jZYEBp4WS
	CowXIaUk0Z1AgFk9vhnZa5TDIEEIWXaYaE12JZ22+KXhh29PZeT8UecdI8KsaEjrXzghKwD3N5e46
	Kf2qiKcpIYAKI+zQAdk/Uhq1xfsUPBoBtC/dCGicW9xIh1nF2XZTYrcQvnPQe3hpQ1RPJsvlhnBgR
	nAZidwMrBspGbb8rp3UzZ1PRQ9zVPjUHejj+WQN4zdahviAcwpW3OGq0K7RkTFtTc93Euj6bZqjkt
	rcExJQrKJQnUj0LV7kfaqz41Y0RPxYs90ix/VgSsYH3GfsWMdRdtGSBike89TlPgHk1Fk0p1XM3Dm
	+OZqzAV0xQSsnmMy7aKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZcC7-0003T2-G6; Fri, 15 May 2020 15:24:15 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZc8K-0001b6-Pp
 for linux-afs@lists.infradead.org; Fri, 15 May 2020 15:20:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589556019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GvjsS3e29gHaCC17oqlDDJSWYTuyGY6h8lvDFd/vxIw=;
 b=DJPHiKdEdOzT/6x7vD91waQ//LNjsjEN93EQkOKSBGU3QUKwkSc5ENvGbBU9omMo4OYF6q
 ql0vOQlpgnS+KQtMTpV+4zkorLnlRDikPuy29IfgMHYHxfRL7KUonSLZiXa94s71X6PHiw
 0tJ+tnUQes7AhANIxeHBSClEx+2LuBA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-r5WCTqEIO1eiQ3eNdBeffQ-1; Fri, 15 May 2020 11:20:15 -0400
X-MC-Unique: r5WCTqEIO1eiQ3eNdBeffQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5FB6189952E;
 Fri, 15 May 2020 15:20:12 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-95.rdu2.redhat.com
 [10.10.112.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05F396AD10;
 Fri, 15 May 2020 15:20:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200514062820.GC8564@lst.de>
References: <20200514062820.GC8564@lst.de>
 <20200513062649.2100053-1-hch@lst.de> <20200513062649.2100053-28-hch@lst.de>
 <20200513180058.GB2491@localhost.localdomain>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 27/33] sctp: export sctp_setsockopt_bindx
MIME-Version: 1.0
Content-ID: <129069.1589556002.1@warthog.procyon.org.uk>
Date: Fri, 15 May 2020 16:20:02 +0100
Message-ID: <129070.1589556002@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_082021_038533_52AAD14F 
X-CRM114-Status: GOOD (  13.10  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [207.211.31.120 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Fri, 15 May 2020 08:24:13 -0700
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
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-afs@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, cluster-devel@redhat.com,
 Jakub Kicinski <kuba@kernel.org>, linux-block@vger.kernel.org,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, Neil Horman <nhorman@tuxdriver.com>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org,
 Vlad Yasevich <vyasevich@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
 "David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Christoph Hellwig <hch@lst.de> wrote:

> > The advantage on using kernel_setsockopt here is that sctp module will
> > only be loaded if dlm actually creates a SCTP socket.  With this
> > change, sctp will be loaded on setups that may not be actually using
> > it. It's a quite big module and might expose the system.
> 
> True.  Not that the intent is to kill kernel space callers of setsockopt,
> as I plan to remove the set_fs address space override used for it.

For getsockopt, does it make sense to have the core kernel load optval/optlen
into a buffer before calling the protocol driver?  Then the driver need not
see the userspace pointer at all.

Similar could be done for setsockopt - allocate a buffer of the size requested
by the user inside the kernel and pass it into the driver, then copy the data
back afterwards.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
