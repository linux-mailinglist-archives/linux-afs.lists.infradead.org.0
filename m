Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 937ED1AAF5
	for <lists+linux-afs@lfdr.de>; Sun, 12 May 2019 08:57:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FgiiJ7nhQUS1/bwvvmOAb0Ml0ZTd72wWGblAu1cjZ6Y=; b=txZZRSKAj7Mc9k
	2/spDUS0tTCHcAXySazMT+chAaUAFImJmKVbBEZ+cRrTgfa0s6vWt1noD2AOOgdTzSpBIve9u4YCS
	USixHP/fhS2c5Z7hw9WlEIikLkoANHSUzYbSQbgXtdoC2L9O/a0xp/KMZDEtDC8kjbJipvOtPSKqe
	klupOkXQonVyTcJv7a46/pWIC2/zRjYnC70KccyiyBpDGaRTlf+k7UGuz1F/QlWXT8Z9wCvsb7LPo
	n1ZnhJqpeRBBA4dr45MA4riQH5yP8LV/jE2CxSwgHGLExiPdQ1FX4x3s41KKv+EAxAeC5BcOFimXJ
	uEchHcBCfntNnG81Kd1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPiPv-0008RT-Ax; Sun, 12 May 2019 06:57:03 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPiPt-0008RA-Ce
 for linux-afs@lists.infradead.org; Sun, 12 May 2019 06:57:02 +0000
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1E30C5945B;
 Sun, 12 May 2019 06:57:01 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C69485C26A;
 Sun, 12 May 2019 06:56:59 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <eb1862ebb97f41dcdf85abbea43a22d51ec94c9c.camel@perches.com>
References: <eb1862ebb97f41dcdf85abbea43a22d51ec94c9c.camel@perches.com>
 <20190511123603.3265-1-colin.king@canonical.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] afs: remove redundant assignment to variable ret
MIME-Version: 1.0
Content-ID: <26839.1557644218.1@warthog.procyon.org.uk>
Date: Sun, 12 May 2019 07:56:58 +0100
Message-ID: <26840.1557644218@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Sun, 12 May 2019 06:57:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190511_235701_449839_F3D1D3D2 
X-CRM114-Status: GOOD (  11.91  )
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
Cc: dhowells@redhat.com, Colin King <colin.king@canonical.com>,
 kernel-janitors@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Joe Perches <joe@perches.com> wrote:

> @@ -71,11 +71,9 @@ static int afs_xattr_get_acl(const struct xattr_handler *handler,
>  	if (ret == 0) {
>  		ret = acl->size;
>  		if (size > 0) {
> -			ret = -ERANGE;
>  			if (acl->size > size)
>  				return -ERANGE;
>  			memcpy(buffer, acl->data, acl->size);
> -			ret = acl->size;
>  		}
>  		kfree(acl);
>  	}

This is also the wrong solution.  See my reply to Colin.

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
