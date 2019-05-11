Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E05D11A845
	for <lists+linux-afs@lfdr.de>; Sat, 11 May 2019 17:36:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YDKEm3DOLTpGVYuiRjnkF3PhOx9Iv24/ui5T4RAejkU=; b=HQhiGC3TejE+D/
	BX8iy0FWlgjxK+MgKGHMQZooMZsz5KtFQTXnRpCjbtffjSntLm+b27RsbcrsjPVxTzWZVs7B19lhA
	XvbEVzNzpqx1prRrCxOgfQYYGhcs4V4GTnWlsJ622KdslY3Yje/mrNgh61x+6nCKFIb6YG46OLGOx
	JIDwmLm6OUjsv3nnemmAOEv+7jcrdeACk3bPDUCJSEbulwk1Jb9dT4+AxH6SiNlZPYGFxeQzFUa0W
	cd+tah5ZghRueD3ElNkCcbhLv9W/tt1tc9E5koKwkbUFO6UOUIBSd+/qk3YmN0IvILBrulVZGdNKe
	1sTvl6WHvDUOUl01hLdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPU2h-0003WI-4l; Sat, 11 May 2019 15:36:07 +0000
Received: from smtprelay0104.hostedemail.com ([216.40.44.104]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPU2c-0003VN-12
 for linux-afs@lists.infradead.org; Sat, 11 May 2019 15:36:04 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 694EE837F27D;
 Sat, 11 May 2019 15:35:55 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::,
 RULES_HIT:41:355:379:599:966:968:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2196:2199:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3867:3868:3871:3872:4321:4385:5007:8603:10004:10400:10848:11026:11232:11658:11914:12296:12555:12740:12760:12895:13069:13311:13357:13439:14096:14097:14659:14721:21080:21627:30054:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.14.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:27,
 LUA_SUMMARY:none
X-HE-Tag: ant46_8ada80935915e
X-Filterd-Recvd-Size: 2045
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf04.hostedemail.com (Postfix) with ESMTPA;
 Sat, 11 May 2019 15:35:54 +0000 (UTC)
Message-ID: <eb1862ebb97f41dcdf85abbea43a22d51ec94c9c.camel@perches.com>
Subject: Re: [PATCH] afs: remove redundant assignment to variable ret
From: Joe Perches <joe@perches.com>
To: Colin King <colin.king@canonical.com>, David Howells
 <dhowells@redhat.com>,  linux-afs@lists.infradead.org
Date: Sat, 11 May 2019 08:35:52 -0700
In-Reply-To: <20190511123603.3265-1-colin.king@canonical.com>
References: <20190511123603.3265-1-colin.king@canonical.com>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190511_083603_285043_4700D57E 
X-CRM114-Status: GOOD (  13.02  )
X-Spam-Score: -0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.40.44.104 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [216.40.44.104 listed in wl.mailspike.net]
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Sat, 2019-05-11 at 13:36 +0100, Colin King wrote:
> The variable ret is being assigned a value however this is never
> read and later it is being reassigned to a new value. The assignment
> is redundant and hence can be removed.
[]
> diff --git a/fs/afs/xattr.c b/fs/afs/xattr.c
[]
> @@ -71,7 +71,6 @@ static int afs_xattr_get_acl(const struct xattr_handler *handler,
>  	if (ret == 0) {
>  		ret = acl->size;
>  		if (size > 0) {
> -			ret = -ERANGE;
>  			if (acl->size > size)
>  				return -ERANGE;
>  			memcpy(buffer, acl->data, acl->size);

It looks like the ret = acl->size immediately
after the memcpy should be removed as well.
---
 fs/afs/xattr.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/afs/xattr.c b/fs/afs/xattr.c
index c81f85003fc7..e21de2f166a4 100644
--- a/fs/afs/xattr.c
+++ b/fs/afs/xattr.c
@@ -71,11 +71,9 @@ static int afs_xattr_get_acl(const struct xattr_handler *handler,
 	if (ret == 0) {
 		ret = acl->size;
 		if (size > 0) {
-			ret = -ERANGE;
 			if (acl->size > size)
 				return -ERANGE;
 			memcpy(buffer, acl->data, acl->size);
-			ret = acl->size;
 		}
 		kfree(acl);
 	}



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
