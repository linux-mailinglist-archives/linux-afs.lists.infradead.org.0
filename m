Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F80C1D6DDE
	for <lists+linux-afs@lfdr.de>; Mon, 18 May 2020 00:37:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPYE0SS3K+X4gx6wILSPl1PObl90XTpAUud7M9PQ/ec=; b=TuhtSzfkHuM38+
	Jn3RtRVEOmzL/7Jek+YGh3aTcBS6lk5zoJNvbOP/1FHt+r4bTchMIS3A8TsH0mNrIm0Z+cuoNFBtK
	irpiPsvjID01YmA5KAvoXyzzkHum2D4pjfDCcC9o2j85nlyDUd/eV3qOKbBNkRgdAD18xYaBrDK9p
	CFGQ0Y/Igrt+JnlF+QT/vfxmBctxnAn0lofz5RBFwa8scH7GRn1UPPCyZ3ek3XW//Us7DYziZuCy5
	WyZ+UM/l7oVNgK8GAbAeTiPUr0L0UuptT4Xzz7mSEV4+K5zUduq+AgLXpJxti93JCB7YfIAt2BdI9
	2elW9Z8ZrfDIyRK6bwqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaRuD-0000ZV-Ny; Sun, 17 May 2020 22:37:13 +0000
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaRuA-0000YM-52
 for linux-afs@lists.infradead.org; Sun, 17 May 2020 22:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589755026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R6DBtpMAn3ekiwiyAskbqzCTE2dKTfdjjBHrVuQWSx4=;
 b=YFRDnUc73QScWe9IJDflDBWGYbKB4sg8LYXKCxZ7hiUa8ACBBA+w6Qb6Z5Ht+4Pjdq/586
 TrgqWVK/EoWz7VO/72brNb+A6YrCaOH3w+yPsdr6U/jiuvl192h3cCnCSu0gz1Wpjcyibb
 lKufykbpRWh6aibsMmcoFNis3p6KlVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-ZTKbhoElMFOsXiTYA5qa7g-1; Sun, 17 May 2020 18:37:01 -0400
X-MC-Unique: ZTKbhoElMFOsXiTYA5qa7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2D01461;
 Sun, 17 May 2020 22:36:58 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-95.rdu2.redhat.com
 [10.10.112.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1D4A5C1C8;
 Sun, 17 May 2020 22:36:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200517210811.GQ16070@bombadil.infradead.org>
References: <20200517210811.GQ16070@bombadil.infradead.org>
 <158974686528.785191.2525276665446566911.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] afs: Don't unlock fetched data pages until the op
 completes successfully
MIME-Version: 1.0
Content-ID: <796666.1589755017.1@warthog.procyon.org.uk>
Date: Sun, 17 May 2020 23:36:57 +0100
Message-ID: <796667.1589755017@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200517_153710_597371_87630147 
X-CRM114-Status: GOOD (  10.58  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [207.211.31.81 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 torvalds@linux-foundation.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Matthew Wilcox <willy@infradead.org> wrote:

> > +	if (req->page_done)
> > +		for (req->index = 0; req->index < req->nr_pages; req->index++)
> > +			req->page_done(req);
> > +
> 
> I'd suggest doing one call rather than N and putting the page iteration
> inside the callback.  But this patch is appropriate for this late in
> the -rc series, just something to consider for the future.

My rewrite of the fscache stuff changes this bit of the code anyway, and makes
it one call which may start a write out to the cache.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
