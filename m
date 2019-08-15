Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 900FE8F747
	for <lists+linux-afs@lfdr.de>; Fri, 16 Aug 2019 00:55:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5AAoGipf6PB+G4KgplJdIWtkAKDLWrFNgcARTo3qKw=; b=nvCkiH0GppfWVE
	Xpj89aXbJl+UDANO200VF7JHgJ9rCr0VVan6n1Ser4WdlKNce6wQQDkYYC+vuf07dQTEdBaf2oizO
	2hlLXiIuAcx90ZHq1j6Qqr5SEh+op9FfywJK0Nxg4S7l8j+x4IMGwxw9Ratc8W6zhu1L4uBYnWl+2
	V2DRMZjtAFsX7SSW2AxN5m510gn26pM20hzfUXG399Njh5KfdlWn2067sRGdH6JzGRW27N0tFkXbT
	Ng3K+fzmL98aWBuQIxWKbT7O8aABJrSk6WVKnuc6K8kXlQ+4Tf+11SNjxs64yASKm4GZhaZBvK5WP
	dS8i26HGUdlwPZBIV3gQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyOer-0005XP-Dl; Thu, 15 Aug 2019 22:55:49 +0000
Received: from smtprelay0005.hostedemail.com ([216.40.44.5]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyOem-0005Wg-R4
 for linux-afs@lists.infradead.org; Thu, 15 Aug 2019 22:55:47 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 22CA2100E86C3;
 Thu, 15 Aug 2019 22:55:42 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 10, 1, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::,
 RULES_HIT:41:69:355:379:599:800:960:967:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2525:2553:2559:2564:2682:2685:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3873:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:5007:6119:7903:8985:9025:10004:10400:10848:11232:11658:11914:12043:12291:12297:12438:12555:12683:12698:12737:12740:12760:12895:13069:13161:13229:13311:13357:13439:14096:14097:14157:14181:14659:14721:21080:21365:21433:21627:30012:30054:30090:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.14.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:28,
 LUA_SUMMARY:none
X-HE-Tag: jail27_6bd326141ea25
X-Filterd-Recvd-Size: 2556
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf14.hostedemail.com (Postfix) with ESMTPA;
 Thu, 15 Aug 2019 22:55:40 +0000 (UTC)
Message-ID: <29743c8d0a5e5f4a1ead55bc614ed53079a42597.camel@perches.com>
Subject: Re: [PATCH] afs: Move comments after /* fallthrough */
From: Joe Perches <joe@perches.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 15 Aug 2019 15:55:39 -0700
In-Reply-To: <CAKwvOdmuReaFgFK+=aib6rRfAb_GTGubLyJ3sAH-tnkKYHASqQ@mail.gmail.com>
References: <e77b0f32a2ce97c872eede52c88b84aa78094ae5.1565836130.git.joe@perches.com>
 <CAKwvOdmuReaFgFK+=aib6rRfAb_GTGubLyJ3sAH-tnkKYHASqQ@mail.gmail.com>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190815_155544_947443_AB4914D1 
X-CRM114-Status: GOOD (  10.68  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.40.44.5 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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
Cc: David Howells <dhowells@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <natechancellor@gmail.com>, linux-afs@lists.infradead.org,
 Nathan Huckleberry <nhuck@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Thu, 2019-08-15 at 15:34 -0700, Nick Desaulniers wrote:
> On Wed, Aug 14, 2019 at 7:36 PM Joe Perches <joe@perches.com> wrote:
> > Make the code a bit easier for a script to appropriately convert
> > case statement blocks with /* fallthrough */ comments to a macro by
> > moving comments describing the next case block to the case statement.
> > 
> > Signed-off-by: Joe Perches <joe@perches.com>
> > ---
> >  fs/afs/cmservice.c | 10 +++-------
> >  fs/afs/fsclient.c  | 51 +++++++++++++++++----------------------------------
> >  fs/afs/vlclient.c  | 50 +++++++++++++++++++++++++-------------------------
> >  fs/afs/yfsclient.c | 51 +++++++++++++++++----------------------------------
> 
> So these changes are across just fs/afs, how many patches like this
> would you need across the whole tree to solve this problem?

No idea.  I only looked at afs when Nathan Chancellor showed
there were 350 or so changes necessary in the kernel tree.
The afs entries were 50 of them so I just looked and saw why.

I haven't looked at all the others.

https://gist.github.com/nathanchance/ffbd71b48ba197837e1bdd9bb863b85f

But probably most of the others are missing a fallthrough to
a break like:

	switch {foo} {
	case 1:
		<bar>;
	default:
		break;
	}

where gcc does not emit a warning but clang apparently does.

I do think gcc should emit a warning here too so I filed a
gcc bugzilla entry.

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91432



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
