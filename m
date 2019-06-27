Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7B458DA4
	for <lists+linux-afs@lfdr.de>; Fri, 28 Jun 2019 00:08:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tnrCyiddT5A+3GqS0z7WTleh0+KZUTH9UmUBjjcI+uo=; b=aC4RQDQozCHkmj
	Wtpbu99tk2zmYpcW9vhuZwhsUEO+EQWpX+fzvqsgLrCavBhZfOmJbrkqZw0t6S/R9B82sIDmhFndI
	1V/RGVVAVitYJXfycpcKhd4IaVhrKS/qH8MLUUzxKu8IEjP/Tl0a80E3c4EUcBVQgBaHFGsyA3etA
	IHNeSCwXQxc2/peefg+wsxEHCQ/Cq27w/oMwjhKdu7iDS4iWOd8sdhaSgbFgODuDaqrXIownjn0zA
	ZdJXTqZ6MhY7w4RrtXvxTc4PBR+t8r5TSZXotc26qZauuxY+AuZ2adrnJ2pzdMX2Y6WcYrSlMmWlF
	Web8SR99nu7udNNBcM9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgcYo-0004gu-Ul; Thu, 27 Jun 2019 22:08:06 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgcY9-0004eD-2i
 for linux-afs@lists.infradead.org; Thu, 27 Jun 2019 22:07:26 +0000
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2F340309264C;
 Thu, 27 Jun 2019 22:07:07 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com
 [10.10.120.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBE31608C1;
 Thu, 27 Jun 2019 22:07:04 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAF=yD-Kgdwt5=0iboxhvZz4zvNewSGow74U15mQQvO1u8VUGcw@mail.gmail.com>
References: <CAF=yD-Kgdwt5=0iboxhvZz4zvNewSGow74U15mQQvO1u8VUGcw@mail.gmail.com>
 <156096279115.28733.8761881995303698232.stgit@warthog.procyon.org.uk>
 <156096287188.28733.15342608110117616221.stgit@warthog.procyon.org.uk>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH 8/9] keys: Network namespace domain tag [ver #4]
MIME-Version: 1.0
Content-ID: <30672.1561673224.1@warthog.procyon.org.uk>
Date: Thu, 27 Jun 2019 23:07:04 +0100
Message-ID: <30674.1561673224@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 27 Jun 2019 22:07:15 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_150725_144883_0BE58A1A 
X-CRM114-Status: GOOD (  10.11  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
X-Mailman-Approved-At: Thu, 27 Jun 2019 15:08:05 -0700
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 Network Development <netdev@vger.kernel.org>, dwalsh@redhat.com,
 LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org,
 linux-afs@lists.infradead.org, vgoyal@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Willem de Bruijn <willemdebruijn.kernel@gmail.com> wrote:

> > +#ifdef CONFIG_KEYS
> > +out_free_2:
> > +       kmem_cache_free(net_cachep, net);
> 
> needs
>             net = NULL;
> 
> to signal failure
> 
> > +#endif

I've folded that into the patch and retagged, remerged and repushed.

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
