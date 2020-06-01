Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C84961EA82A
	for <lists+linux-afs@lfdr.de>; Mon,  1 Jun 2020 19:09:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5TggUHP3Xf34svKILMrR5h/5O4NwEJyQ2bhGyBJEGpk=; b=ts8r92kH6/d5AP
	XaXG1ZXpPs5+0ox2cBlqs+gEu/y230nyrqU6b0QrpdBKS9rGblkMMdF71kLy6R2T6VCFDPzUbiUnU
	e4tAR6F6M4mo9RNegVBvfbqwyXtDbwmgBLwHTsYU9inkTruQHQy7R7W13xxilIkE2zsI9DsQY8tbE
	J/rykGshctgTBt2fLNNtaNiNWR7LbGEHaF80y6D6GFlli5h+avpRZUaoT+wnDdYveoFy82ZbvSwlu
	yVoYnIp+mCrRUK2Y2UN2aQ2e3mDd5OHB51x5kKmzeloeVPxxHtSyY+GtchXTVje72gjOo84cwmr5W
	V05IeblwhHWsafUhfVtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfnvk-0005Jf-8J; Mon, 01 Jun 2020 17:08:56 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfnvh-0005Ij-O5
 for linux-afs@lists.infradead.org; Mon, 01 Jun 2020 17:08:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591031330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aBfVnLq9ec7IA3u5TWoDLJTmL8ZGnJcANeLd1J0lvVs=;
 b=PSZDMiR1uVVtc3XhbOhUQ4zJD3pxwPbqg7wwH2Chw00qaWTlsuU4h1+q5VduG4BNxJ8thI
 YUvhwWrqfyP7tY2bn0jWpAzfr8Ae6H1F/ueaqypRI80UKmAps2a8hcUmziZngu02/a9/5L
 TxNEexpdJkSRRUcUoGM3hJwwBxPlRJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-i0lRwKS8OGmsfJbPywpuyA-1; Mon, 01 Jun 2020 13:08:46 -0400
X-MC-Unique: i0lRwKS8OGmsfJbPywpuyA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6856C107ACCD;
 Mon,  1 Jun 2020 17:08:45 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C954E7F0A4;
 Mon,  1 Jun 2020 17:08:43 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <779b327f-b0fa-e21f-cbf6-5cadeca58581@web.de>
References: <779b327f-b0fa-e21f-cbf6-5cadeca58581@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v2] afs: Fix memory leak in afs_put_sysnames()
MIME-Version: 1.0
Content-ID: <1346216.1591031323.1@warthog.procyon.org.uk>
Date: Mon, 01 Jun 2020 18:08:43 +0100
Message-ID: <1346217.1591031323@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_100853_861336_B4DCDBD5 
X-CRM114-Status: GOOD (  10.59  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.139.110.120 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
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

> > sysnames should be freed after refcnt being decreased to zero in
> > afs_put_sysnames().
> 
> How do you think about a wording variant like the following?
> 
>    Release the sysnames object after its reference counter was decreased
>    to zero.

I would say "reference count" not "reference counter" personally.  I would
also say "afs_sysnames" rather than "sysnames".  Perhaps something like:

	Fix afs_put_sysnames() to actually free the specified afs_sysnames
	object after its reference count has been decreased to zero and its
	contents have been released.

> Will it matter to mention the size of the data structure "afs_sysnames"?

Why is it necessary to do so?

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
