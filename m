Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBD275120
	for <lists+linux-afs@lfdr.de>; Thu, 25 Jul 2019 16:29:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aaL/QOiUjDpwA0ybvlZMk/on/GNBqchZHaPO4XBnDJw=; b=WEg55xsEmwcTH7
	8P5O4jj5iXtLzP1v9jNodgNSwRmahDIjDvntqVWzZUB7JjtME0Q50oTPLPbj2QjX3fZGOSCs+lIVm
	3TA65CY/WwySbh5IMUQhFbr7OASTFWhfhWapIS4tnAQ/bOPKOx75abM6ggXkdCOypxMDAHpHRAxDu
	dfk51rjq5N6TDgv49BTEO2OH2a0hpTfySPBfyUZys/KLCX1Cz79AKobNykRShNkni2pN/Ht5bUNoS
	H2MJ06nCI11Z454HbTzU7Hol9Q6dxAgfU/mNQ2Ok8vEkEVjI5p6xn0F6nIJGDNlwj7Uc1L5Z2NkWE
	OrdjZwO6gFU7gryyRHcA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqekS-0005jf-EB; Thu, 25 Jul 2019 14:29:36 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqekP-0005j1-8r
 for linux-afs@lists.infradead.org; Thu, 25 Jul 2019 14:29:34 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E454F83F4C;
 Thu, 25 Jul 2019 14:29:32 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-49.rdu2.redhat.com
 [10.10.120.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DC9D1001281;
 Thu, 25 Jul 2019 14:29:31 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAKv+Gu_bJfs3zc90CbmXXo17+CYMVK+bo7OyJ-RYA=AiU38Fvg@mail.gmail.com>
References: <CAKv+Gu_bJfs3zc90CbmXXo17+CYMVK+bo7OyJ-RYA=AiU38Fvg@mail.gmail.com>
 <156406148519.15479.13870345028835442313.stgit@warthog.procyon.org.uk>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [RFC PATCH] rxrpc: Fix -Wframe-larger-than= warnings from
 on-stack crypto
MIME-Version: 1.0
Content-ID: <21522.1564064970.1@warthog.procyon.org.uk>
Date: Thu, 25 Jul 2019 15:29:30 +0100
Message-ID: <21523.1564064970@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Thu, 25 Jul 2019 14:29:33 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_072933_334186_5FB8F1FC 
X-CRM114-Status: GOOD (  12.87  )
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>, dhowells@redhat.com,
 "open list:HARDWARE RANDOM NUMBER GENERATOR
 CORE" <linux-crypto@vger.kernel.org>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:

> Given that this part of the driver only uses synchronous crypto, and
> only using a hardcoded algo and mode [pcbc(fcrypt)], of which only a
> generic C implementation exists, may I suggest that we switch to a
> library based approach instead?
> 
> That way, we can get rid of the crypto API overhead here, and IMO, we
> can drop support for this cipher from the crypto API entirely.

Ummm...  I'm not entirely sure.  At some point, I need to look at implementing
the rxgk security class to allow gss to be used.  That can in theory support
any kerberos cipher suite (which don't include pcbc or fcrypt).  I don't yet
know how much code I could theoretically share with rxkad.c.

However, since pcbc and fcrypt are only used by rxkad.c, it might make sense
to move them to net/rxrpc/ and hard code them in rxkad.c - though I'd prefer
to make an attempt on rxgk first.

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
