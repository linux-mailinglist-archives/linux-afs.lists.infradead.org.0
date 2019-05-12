Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B721ADB8
	for <lists+linux-afs@lfdr.de>; Sun, 12 May 2019 20:11:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aKMOpvYDTgYktT+ORp7QJu5sxI6fnYYLZoPtEwl6YMU=; b=Cz2VXICabuqiIK
	igYYobH6Q8RFagPO71DV5nRg1HIV8nQopqE3BFLgcOFQvVfF48rbPBoDLkod+zospFxLCMfuGpbhZ
	dFlCx+iz/bKCtDT9nI2xyGHwXUfHeuQYI76WKMmhgyhe14jdt2ClPoGHshgzzab4no950u7wEdX3R
	kP4znFI/2P0Oyj0EwQcQH5Wwy6wfY5g6qKB1EuSnh67OCSTmz2gWj1G1UeD9LUGm/FfQdjm5OkxEY
	CDg8LOnxJogVWKl+9pW7KReEAPAqQdHfiEYvFq//mwHrT6EoI+zzlN5IA5xkRsd6uTl2uG9jYodQ2
	bFnSu6MwZ3KFdq7ugBEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPsw2-0007iT-Js; Sun, 12 May 2019 18:10:54 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPsvz-0007hy-6u
 for linux-afs@lists.infradead.org; Sun, 12 May 2019 18:10:53 +0000
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8212D81F19;
 Sun, 12 May 2019 18:10:48 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7808860BCD;
 Sun, 12 May 2019 18:10:46 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <5CD844B0.5060206@bfs.de>
References: <5CD844B0.5060206@bfs.de>
 <155764714099.24080.1233326575922058381.stgit@warthog.procyon.org.uk>
 <155764714872.24080.15171754166782593095.stgit@warthog.procyon.org.uk>
To: wharms@bfs.de
Subject: Re: [PATCH 2/2] afs: Fix afs_xattr_get_yfs() to not try freeing an
 error value
MIME-Version: 1.0
Content-ID: <31807.1557684645.1@warthog.procyon.org.uk>
Date: Sun, 12 May 2019 19:10:45 +0100
Message-ID: <31808.1557684645@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Sun, 12 May 2019 18:10:48 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190512_111051_273161_305FE5D6 
X-CRM114-Status: GOOD (  11.61  )
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, joe@perches.com, colin.king@canonical.com,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

walter harms <wharms@bfs.de> wrote:

> > +	ret = dsize;
> > +	if (size > 0) {
> > +		if (dsize > size) {
> > +			ret = -ERANGE;
> > +			goto error_key;
> >  		}
> > +		memcpy(buffer, data, dsize);
> >  	}
> >  
> 
> i am confused: if size is <= 0 then the error is in dsize ?

See this bit, before that hunk:

> +	if (ret < 0)
> +		goto error_key;

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
