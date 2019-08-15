Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 482C78ED1B
	for <lists+linux-afs@lfdr.de>; Thu, 15 Aug 2019 15:40:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dQXRiU9o8bbZqgdV4t161EoL32rBEzVDYVTpU4dfDhs=; b=MNj/aeLK6rlEJX
	bXm8RkUoHyteTHhDHY9s3b4Bn2ok7rlJ/hNr9mOLsGMZmtGYeqwhF3mOgnApzf/dqFyCuiYMmcn48
	PciMHY51vzNWy3mjT9+4HlJSWW7XkpVa/+Ux76iaJEAJtnKFyN1of4G9wMIxWEdvcwRQpamM0p5AH
	13FPUrRp3CRranKfDQQsst8joj5DadxGU9SILg1Gt9W94RN4nn97FZsSMZdYY3ZW4+VdIUJYBJib8
	LQeZN/3jVJupPtshIqeiOHvrgKRb7CKWYThyX/6L5HWegGiShDS3BCiWzNbzM0ePl7INxT5TOV8MS
	7p0nsaYE9gn/wDmKT+Ag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyFzM-00029K-SJ; Thu, 15 Aug 2019 13:40:24 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyFzI-00028d-54
 for linux-afs@lists.infradead.org; Thu, 15 Aug 2019 13:40:23 +0000
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E79D43023087;
 Thu, 15 Aug 2019 13:40:18 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CB3D837BA;
 Thu, 15 Aug 2019 13:40:17 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <e77b0f32a2ce97c872eede52c88b84aa78094ae5.1565836130.git.joe@perches.com>
References: <e77b0f32a2ce97c872eede52c88b84aa78094ae5.1565836130.git.joe@perches.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] afs: Move comments after /* fallthrough */
MIME-Version: 1.0
Content-ID: <12307.1565876416.1@warthog.procyon.org.uk>
Date: Thu, 15 Aug 2019 14:40:16 +0100
Message-ID: <12308.1565876416@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 15 Aug 2019 13:40:19 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190815_064020_219939_CF4D8AA4 
X-CRM114-Status: GOOD (  12.39  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nathan Huckleberry <nhuck@google.com>, dhowells@redhat.com,
 Nathan Chancellor <natechancellor@gmail.com>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Joe Perches <joe@perches.com> wrote:

> Make the code a bit easier for a script to appropriately convert
> case statement blocks with /* fallthrough */ comments to a macro by
> moving comments describing the next case block to the case statement.

This doesn't sound good.  Can you give an illustration of what a resulting
case might look like?  Say taking the following as an example:

> @@ -282,10 +282,8 @@ static int afs_deliver_cb_callback(struct afs_call *call)
>  	case 0:
>  		afs_extract_to_tmp(call);
>  		call->unmarshall++;
> -
> -		/* extract the FID array and its count in two steps */
>  		/* fall through */
> -	case 1:
> +	case 1:		/* extract the FID array and its count in two steps */
>  		_debug("extract FID count");
>  		ret = afs_extract_data(call, true);
>  		if (ret < 0)

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
