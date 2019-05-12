Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DED9B1AAF2
	for <lists+linux-afs@lfdr.de>; Sun, 12 May 2019 08:55:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqYJ7YeRmj3x/HQ2mdScz6y57azj8h72LgIVTjSLGnE=; b=FV2QSf5NaUk7LF
	w2EWxW+9j7AsFs8CtlRmf90AC2HWUVz6zxZ+S8kVEiyLSnF8K3Hy7fIABEw66AmrMNsv6GDeJnLId
	Xrq8/ZuizlKkx16OC737awsgsLa8YrT0gnH+8fCyAV6l8qUe1J01pH8Y7SlAQvChiBh+vdYnUIJqQ
	9qJedKgsIUxkoYIyxPLIFQnAs0F1HEbH65ir0azpmYvBvSgoFa6fg4q324GSorTvKTj88Ji4b/dbC
	EPKRYE48OpvgLmrgPOkYv7vRUTiS0740CFd2HZQAxquvM29vIwPhlFNUoCErT/YcJN9h1pnnqh1G6
	2jAcnkgY0EheGwZjW2hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPiOS-0008Ot-UN; Sun, 12 May 2019 06:55:32 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPiOP-0008Ng-3B
 for linux-afs@lists.infradead.org; Sun, 12 May 2019 06:55:30 +0000
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 13AAD308A946;
 Sun, 12 May 2019 06:55:28 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 218C7691BE;
 Sun, 12 May 2019 06:55:26 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190511123603.3265-1-colin.king@canonical.com>
References: <20190511123603.3265-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] afs: remove redundant assignment to variable ret
MIME-Version: 1.0
Content-ID: <26747.1557644126.1@warthog.procyon.org.uk>
Date: Sun, 12 May 2019 07:55:26 +0100
Message-ID: <26748.1557644126@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Sun, 12 May 2019 06:55:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190511_235529_152491_66076829 
X-CRM114-Status: GOOD (  12.92  )
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
Cc: dhowells@redhat.com, kernel-janitors@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Colin King <colin.king@canonical.com> wrote:

> The variable ret is being assigned a value however this is never
> read and later it is being reassigned to a new value. The assignment
> is redundant and hence can be removed.

No.

>  	if (ret == 0) {
>  		ret = acl->size;
>  		if (size > 0) {
> -			ret = -ERANGE;
>  			if (acl->size > size)
>  				return -ERANGE;
>  			memcpy(buffer, acl->data, acl->size);

This is the wrong solution.  acl and key need releasing, so the return should
be a goto.

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
