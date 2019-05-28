Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8BC2CBE8
	for <lists+linux-afs@lfdr.de>; Tue, 28 May 2019 18:27:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MMs6vx7kFznwQoLm/UwoG40GEO9hZjLNzBAV+Tu2X5A=; b=uMYah3dUM2iskp
	XU/kR0rHtL1uFqbOxraJC10hmwHtdptRtTV51kvBMT+GyAD5vGgaBEo5V6GqJ2j1wRaykIjsX4m6V
	WzFeJd3xEINl8viph8ILHRQ7qNZZasfrShtQOULvnCvYiifHABGY/WIZehyCNHA0MtXRQXB7GSmIB
	yFmqJcabvn6yvRBDIbfTIudRapQfIx5OgZEdyscUFo7x4avq6R2P3hPeQO/Nio8LfPfU5mGtHY7if
	f9Mb/UcRi2FTWlEc3wgdkE0Jg2/SWb7X2EhPys2bIRByJ83R0N/ZdG4t1d2fn6ltTlDBCpAQfO7jH
	o0HGOvfGxmcwjGBORXUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVewK-00006O-Gb; Tue, 28 May 2019 16:27:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVewA-0007wB-Me
 for linux-afs@bombadil.infradead.org; Tue, 28 May 2019 16:26:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:Date:Content-ID:Content-Type
 :MIME-Version:Subject:Cc:To:References:In-Reply-To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V37cw6krDXtkiXGY0YLkIRD6Z7/TvcggZnZGy419dC4=; b=NKRbfc6tvGxGuMkXi5/THJwuaQ
 HVHDnJa8ruRKDFk+BPrwJ5y4e4HDVinsfV9ahTowYmyZpIe8hVkNtnibXlb0NbrhEAfQrfRvsqHmv
 AUV3pJsgLcM+eXlHeGyidqANAx97Pa5cDQInlPa2uEbR2ItDU1Mth7v14IlOROliwDutiWA834CHn
 leun9Ia9oe79l/7W9Mt/o2zeByto5zKHuzR+3mMvoZSogCCW6C34+JpSGk1PBDSblpoVFR6PjThDH
 Qj1hmRiw0lg8kL4bey0lOBj8QagHFTXnNt4oq1pzIwHkK7W/71vhrhr2IwHuWGhljZ8JOKl3GOsIt
 rk5TYHrQ==;
Received: from mx1.redhat.com ([209.132.183.28])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVei2-0001zn-H4
 for linux-afs@lists.infradead.org; Tue, 28 May 2019 16:12:20 +0000
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 30A6F3D95D;
 Tue, 28 May 2019 16:12:00 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-173.rdu2.redhat.com
 [10.10.120.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 270FF2F28D;
 Tue, 28 May 2019 16:11:58 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAB9dFdtT0p+Sg5=qt=Te9FEkASXcH=ZQZRHyN1UQ3nYkDLHMpQ@mail.gmail.com>
References: <CAB9dFdtT0p+Sg5=qt=Te9FEkASXcH=ZQZRHyN1UQ3nYkDLHMpQ@mail.gmail.com>
 <20190527165413.GA26714@embeddedor>
To: Marc Dionne <marc.c.dionne@gmail.com>
Subject: Re: [PATCH] afs: Fix logically dead code in afs_update_cell
MIME-Version: 1.0
Content-ID: <8580.1559059917.1@warthog.procyon.org.uk>
Date: Tue, 28 May 2019 17:11:57 +0100
Message-ID: <8581.1559059917@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 28 May 2019 16:12:00 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_171218_851689_4F32B404 
X-CRM114-Status: GOOD (  25.94  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on casper.infradead.org summary:
 Content analysis details:   (-5.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-BeenThere: linux-afs@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Cc: dhowells@redhat.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-afs@lists.infradead.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Marc Dionne <marc.c.dionne@gmail.com> wrote:

> > diff --git a/fs/afs/cell.c b/fs/afs/cell.c
> > index 9c3b07ba2222..980de60bf060 100644
> > --- a/fs/afs/cell.c
> > +++ b/fs/afs/cell.c
> > @@ -387,7 +387,6 @@ static int afs_update_cell(struct afs_cell *cell)
> >                 if (ret == -ENOMEM)
> >                         goto out_wake;
> >
> > -               ret = -ENOMEM;
> >                 vllist = afs_alloc_vlserver_list(0);
> >                 if (!vllist)
> >                         goto out_wake;
> 
> Looks like the intention here was to return -ENOMEM when
> afs_alloc_vlserver_list fails, which would mean that the fix should
> move the assignment within if (!vllist), rather than just removing it.
> Although it might be fine to just return the error that came from
> afs_dns_query instead, as you do in this patch.

I think I'd rather return the original error as this patch effects.  I'm
having a ponder on it.

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
