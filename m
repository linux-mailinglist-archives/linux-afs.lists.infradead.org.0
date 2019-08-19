Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DE23E95022
	for <lists+linux-afs@lfdr.de>; Mon, 19 Aug 2019 23:50:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IDrDrfxm1aLbBVe4KkCiQ8jhxdAK/H1QE9cZwDLxsHc=; b=l/aPBHt1/HbP00
	e77p9j3hHpflGWKXdehtSvTUqsMniMe74PjWYt3iz7jPGDzBb0S5pr4UD/j9yO3Ip0CgtGAxT8kQY
	w4qrn7179v782BEptX4cwXu2Y1w9p70BMmXOhhcDWNWt0xS15VGG1GRcThBxiaANoRCPe8Yiv1U/W
	03oPSyFZ9jUn1T3n7DsJGdE1803nVS4YqCB7ytRG6IfEEfuybW5JQQko7GZjpvsJPlrhMxW+89Hkr
	wNxZlRV6VsYFeCKbVvtU5KkL5MmJqc65EEEb3LQA0qtneXBmqulJezOTK8LDCk3pF2Qe4ULZmFZdx
	GL9AhhjDsdUYJOKgWFaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzpXa-00006G-JA; Mon, 19 Aug 2019 21:50:14 +0000
Received: from smtprelay0074.hostedemail.com ([216.40.44.74]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzpXX-00005S-GK
 for linux-afs@lists.infradead.org; Mon, 19 Aug 2019 21:50:12 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id DE9FE181D33FC;
 Mon, 19 Aug 2019 21:50:05 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::,
 RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1538:1568:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2693:2828:3138:3139:3140:3141:3142:3622:3865:3867:3868:3870:3872:3873:3874:4250:4321:4605:5007:10004:10400:10848:11232:11658:11914:12297:12740:12760:12895:13069:13311:13357:13439:14181:14659:14721:21080:21627:21939:30054:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.14.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:24,
 LUA_SUMMARY:none
X-HE-Tag: rail53_3ae65148ed028
X-Filterd-Recvd-Size: 1653
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf12.hostedemail.com (Postfix) with ESMTPA;
 Mon, 19 Aug 2019 21:50:04 +0000 (UTC)
Message-ID: <40b5fa3133c223d64050feb5ec530ce6f86d1601.camel@perches.com>
Subject: Re: [PATCH] afs: Move comments after /* fallthrough */
From: Joe Perches <joe@perches.com>
To: David Howells <dhowells@redhat.com>
Date: Mon, 19 Aug 2019 14:50:03 -0700
In-Reply-To: <30555.1566248610@warthog.procyon.org.uk>
References: <af4cbaaeb54589a5255bd39baf6bacc2b07bf7b5.camel@perches.com>
 <d98d1f0150bec8b69a886f77fc375b8ca9d24262.camel@perches.com>
 <e77b0f32a2ce97c872eede52c88b84aa78094ae5.1565836130.git.joe@perches.com>
 <12308.1565876416@warthog.procyon.org.uk>
 <13106.1565951791@warthog.procyon.org.uk>
 <30555.1566248610@warthog.procyon.org.uk>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190819_145011_615016_F829D3E1 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.40.44.74 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
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
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-afs@lists.infradead.org,
 Nathan Huckleberry <nhuck@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Mon, 2019-08-19 at 22:03 +0100, David Howells wrote:
> Joe Perches <joe@perches.com> wrote:
> 
> >                 /* extract the FID array and its count in two steps */
> > -               /* fall through */
> > +               fallthrough;
> >         case 1:
> 
> Okay, that doesn't look too bad.  I thought you might be going to combine it
> with the case inside a macro in some way.

Does that mean you will apply this?



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
