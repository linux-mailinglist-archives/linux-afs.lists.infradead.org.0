Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D685A38B6
	for <lists+linux-afs@lfdr.de>; Fri, 30 Aug 2019 16:02:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gcQHBjV4chJLTVveNq0gpFpEBH8y6uh/pYP5A7Yyy68=; b=TVoSOae9oCkCxA
	BrF7FBVZCn0mJ8rZ2zEdzGle5JwOTACqS5GIS700z1FWwrf7yr0LpD2Un0aRD4KPWd11SIj3gznIc
	FpO0uc+xg5fZEpKZmt390l3vxCHpD3Fr5kddKGnjmNZr2HOZpq9ItakuEHnkMMx/SK3HE8L63+O6E
	p6+UCU6GWE6s15xS83x8H4h2syU9Xn8UywDbN6cw0YQBwOCmHZ0qy/GSm2+uTA1peoLqGX0u9Op4N
	hOcAb5bLDUEWTd8Fli7izcDTkhLYn5kDZIhpLvKGkjofyyyFN6+qKbmPUniLillo5WXYrKZv303lr
	wYdqw7s7INx3AkGz2dLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3hTf-00083M-FM; Fri, 30 Aug 2019 14:02:11 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3hTH-0007im-Ir
 for linux-afs@lists.infradead.org; Fri, 30 Aug 2019 14:01:49 +0000
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 35BAA18F350D;
 Fri, 30 Aug 2019 14:01:45 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BFF16012C;
 Fri, 30 Aug 2019 14:01:42 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190830104912.1090-1-colin.king@canonical.com>
References: <20190830104912.1090-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] afs: use BIT_ULL for shifting to fix integer overflow
MIME-Version: 1.0
Content-ID: <3078.1567173701.1@warthog.procyon.org.uk>
Date: Fri, 30 Aug 2019 15:01:41 +0100
Message-ID: <3079.1567173701@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Fri, 30 Aug 2019 14:01:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190830_070147_697522_5EFA5C9E 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
Cc: dhowells@redhat.com, kernel-janitors@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Colin King <colin.king@canonical.com> wrote:

> The expression 1 << nr_slots is evaluated with 32 bit integer arithmetic
> and can overflow before it is widened.

If it does, it's an error on the part of the caller.  See the banner comment:
1 <= nr_slots <= 9.

And, in any case, if nr_slots >= 64, using BIT_ULL wouldn't help...

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
