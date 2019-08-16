Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 130AB9007F
	for <lists+linux-afs@lfdr.de>; Fri, 16 Aug 2019 13:08:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/sBNHUTAOB/rLm+GG2mPrbzfrDfLKu+5a+ppSt5Id1k=; b=KDPZnLTXL+l5Ew
	Z75OChRByD6CpHBqO2AO5m7q0tX2fapKB2l9f1sNUONx++6L4TMAI2pF80wQhTClbuc2352UZA7ui
	Ag8c6qXzOWFc5SFS82uZS1O6iyC465PuvraahfE1XPIMFAU6SKpPrF6r3DISH0zrAt+PXY2q8kyRc
	+Q2IE/IANXSiZzQ6QtfrrSFtyypbE+brcr7gtONlEHqOG5hKnKmx9ZjOh0LvX4r+5NblCApVzpEFw
	w4umsXaP33O3q7WgfrkZy6UJ0dBkSE7icXE2NO3QxRJfdVgYhqSNn52Lma8zr79LoPD7U/6wB1BDP
	xAFafONQYZaprrOX6Kig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hya5c-00028l-TR; Fri, 16 Aug 2019 11:08:12 +0000
Received: from smtprelay0187.hostedemail.com ([216.40.44.187]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hya5a-00027X-1k
 for linux-afs@lists.infradead.org; Fri, 16 Aug 2019 11:08:11 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id A40B5182CED28;
 Fri, 16 Aug 2019 11:08:00 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::,
 RULES_HIT:41:355:379:599:800:960:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:1801:2196:2199:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3870:3871:3872:3873:4250:4321:4605:5007:8660:9592:10004:10400:10450:10455:10848:11026:11232:11658:11914:12043:12296:12297:12438:12555:12740:12760:12895:12986:13069:13148:13161:13229:13230:13311:13357:13439:14096:14097:14181:14659:14721:19904:19999:21080:21433:21451:21627:21939:30012:30054:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:30,
 LUA_SUMMARY:none
X-HE-Tag: scale69_62e0db138c018
X-Filterd-Recvd-Size: 2783
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf09.hostedemail.com (Postfix) with ESMTPA;
 Fri, 16 Aug 2019 11:07:59 +0000 (UTC)
Message-ID: <af4cbaaeb54589a5255bd39baf6bacc2b07bf7b5.camel@perches.com>
Subject: Re: [PATCH] afs: Move comments after /* fallthrough */
From: Joe Perches <joe@perches.com>
To: David Howells <dhowells@redhat.com>
Date: Fri, 16 Aug 2019 04:07:58 -0700
In-Reply-To: <13106.1565951791@warthog.procyon.org.uk>
References: <d98d1f0150bec8b69a886f77fc375b8ca9d24262.camel@perches.com>
 <e77b0f32a2ce97c872eede52c88b84aa78094ae5.1565836130.git.joe@perches.com>
 <12308.1565876416@warthog.procyon.org.uk>
 <13106.1565951791@warthog.procyon.org.uk>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190816_040810_164154_AB458292 
X-CRM114-Status: GOOD (  10.99  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.40.44.187 listed in list.dnswl.org]
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
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-afs@lists.infradead.org,
 Nathan Huckleberry <nhuck@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Fri, 2019-08-16 at 11:36 +0100, David Howells wrote:
> Joe Perches <joe@perches.com> wrote:
> 
> > Here the script would not convert the /* Fall through */
> > because the next non-blank line does not start with
> > case or default
> 
> Convert the "/* Fall through */" to what?
> 
> You said "for a script to appropriately convert case statement blocks with /*
> fallthrough */ comments to a macro".  Can you give an example of what the code
> would look like with this macro emplaced?

Sure.

The basic idea is to use a macro for __attribute__((__fallthrough__))
like:

#define fallthrough __attribute__((__fallthrough__))

though some would prefer __fallthrough to be more similar to
other attribute macros.  I prefer fallthrough; to be more
similar to break;

So it would end up like (just an example, won't apply)

diff --git a/fs/afs/cmservice.c b/fs/afs/cmservice.c
index b86195e4dc6c..d962332008aa 100644
--- a/fs/afs/cmservice.c
+++ b/fs/afs/cmservice.c
@@ -284,7 +284,7 @@ static int afs_deliver_cb_callback(struct afs_call *call)
                call->unmarshall++;
 
                /* extract the FID array and its count in two steps */
-               /* fall through */
+               fallthrough;
        case 1:
                _debug("extract FID count");
                ret = afs_extract_data(call, true);
@@ -303,8 +303,7 @@ static int afs_deliver_cb_callback(struct afs_call *call)
                        return -ENOMEM;
                afs_extract_to_buf(call, call->count * 3 * 4);
                call->unmarshall++;
-
-               /* Fall through */
+               fallthrough;
        case 2:


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
