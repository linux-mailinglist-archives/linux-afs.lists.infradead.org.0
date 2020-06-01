Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FF41EAE30
	for <lists+linux-afs@lfdr.de>; Mon,  1 Jun 2020 20:52:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uv3RqwEDI1uTT0+ZmP91kLpnKzH8AgLMjTU4KYO7pZg=; b=W8MYQZ1dGM8iQe
	MvfKy95nd7QNKBqmAkWLVlebwu45KgkRbR50fdGo2MV9Gz6NfIU5J+gPv2QVEPEa2MhzZiB5sNbTr
	SWRgvZdyOTLyKQ+gS13SovjpBxdNRDNr3OPJI5ujy/ni/tjyA02mPdFoLJpb70cURj+ddCKVzMNqk
	Wa5GS75Pi0QNMLKfwoTJZR0h+GnCIFIuwIic8jIJz+MXopZjVWFzvOSf9meDBKAyl2Qa52TObwNi1
	rdPmj7xbXj+O5N4XekOOMtgq4A879affWpaaFXIjuJUt2S4dGDu6kjR4Jd+zOp8Z34dTNL3yfyc9K
	eMxp6acdxlW1ky3PL8LA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfpXo-0003fA-KM; Mon, 01 Jun 2020 18:52:20 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfpXl-0003eF-Hk
 for linux-afs@lists.infradead.org; Mon, 01 Jun 2020 18:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591037535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/HxsSLMMOoIzHyiVBdHfhWx2bWQGLvDQcR+hbKBfl/Y=;
 b=EFmhjcU38HzOYZN+GT73mwOIBIOjMYx6fV8dm1LKszZg3zS4R7RjN/quSj9eiuSm81PLqG
 +jIefUyTCVjE5n2L3Dq3/EzT5rlgQteN+yPFroqni+p/5xDDbFPN7BENalA8MwdvwDsdZ/
 rs6vcrUnfGaM1Ulmn2jGNvCDd+FsNFQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-7rYCDDOfOHuUOq293DmUsg-1; Mon, 01 Jun 2020 14:52:13 -0400
X-MC-Unique: 7rYCDDOfOHuUOq293DmUsg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8DFA19057B7;
 Mon,  1 Jun 2020 18:52:11 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 328795D9E2;
 Mon,  1 Jun 2020 18:52:10 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <a28fd20e-1f9e-d070-4d2e-2bee89f39154@web.de>
References: <a28fd20e-1f9e-d070-4d2e-2bee89f39154@web.de>
 <779b327f-b0fa-e21f-cbf6-5cadeca58581@web.de>
 <1346217.1591031323@warthog.procyon.org.uk>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [v2] afs: Fix memory leak in afs_put_sysnames()
MIME-Version: 1.0
Content-ID: <1358844.1591037529.1@warthog.procyon.org.uk>
Date: Mon, 01 Jun 2020 19:52:09 +0100
Message-ID: <1358845.1591037529@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_115217_662397_6E1BA843 
X-CRM114-Status: GOOD (  13.45  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.61 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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
Cc: Yi Zhang <yi.zhang@huawei.com>, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Markus Elfring <Markus.Elfring@web.de> wrote:

> > 	Fix afs_put_sysnames() to actually free the specified afs_sysnames
> > 	object after its reference count has been decreased to zero and its
> > 	contents have been released.
> 
> * How do you think about to omit the word "Fix" because of the provided tag?

Quite often I might put introductory paragraphs before that, so I prefer to
begin the paragraph that states a fix with that verb.  There may also be
auxiliary changes associated with it that aren't directly fixes but need to be
made because of the fix change.

> * Is freeing and releasing an item a duplicate operation anyhow?

You're missing the point.  afs_put_sysnames() does release the things the
object points to (ie. the content), but not the object itself.

> >> Will it matter to mention the size of the data structure "afs_sysnames"?
> >
> > Why is it necessary to do so?
> 
> I suggest to express the impact of the missed function call "kfree".

I would hope that anyone reading the patch could work the impact out for
themselves.  Just specifying the size of a struct isn't all that useful - it
may be wildly variable by arch (eg. 32/64) and config option (eg. lockdep)
anyway.  Add to that rounding and packing details from the memory subsys,
along with the pinning effect of something you can't get rid of.

Of more use would be specifying the frequency or likelyhood of such a leak but
unless it's especially high, it's probably not worth mentioning.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
