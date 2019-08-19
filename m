Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAFC94F87
	for <lists+linux-afs@lfdr.de>; Mon, 19 Aug 2019 23:03:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pi54IJzumywHsDFHGY/ZVSGxOQJCnaDUr6nhU0nT4kg=; b=HskkesEzPOxFBn
	UV2nAfrEfM8zJ3HtMBwQONaxCvyr4EYXgQuDEMEm2vqwIikKQ8OnPiEu8zVmurBHPyEeimcE+nb7D
	l+Fomy1vsEcm14eVqDSkhO9GWgdiT3O5vdApARa5Q5Nf9MnDgxycgalqBwwErHO1Us84uGnI4HMdN
	C223QjN8st5A2zqS5bcqH2T+GSxtH+xsjpvIdcFNeNiWoZFBJ7wTVpBkB3fl+DtSuFaZ2FprFBM8u
	aAiXMLKGeApPqRUIO+HHilO9Qp+qXVaPEY1mK0fetbswkkyTsUxCpZy/laXt6jd+Yk4grr8RPQvtB
	K76l43S7zmwvRlxXSxAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzooS-0001IX-N0; Mon, 19 Aug 2019 21:03:36 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzooP-0001IC-OG
 for linux-afs@lists.infradead.org; Mon, 19 Aug 2019 21:03:35 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 098F030A5A56;
 Mon, 19 Aug 2019 21:03:33 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F6831001925;
 Mon, 19 Aug 2019 21:03:30 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <af4cbaaeb54589a5255bd39baf6bacc2b07bf7b5.camel@perches.com>
References: <af4cbaaeb54589a5255bd39baf6bacc2b07bf7b5.camel@perches.com>
 <d98d1f0150bec8b69a886f77fc375b8ca9d24262.camel@perches.com>
 <e77b0f32a2ce97c872eede52c88b84aa78094ae5.1565836130.git.joe@perches.com>
 <12308.1565876416@warthog.procyon.org.uk>
 <13106.1565951791@warthog.procyon.org.uk>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] afs: Move comments after /* fallthrough */
MIME-Version: 1.0
Content-ID: <30554.1566248610.1@warthog.procyon.org.uk>
Date: Mon, 19 Aug 2019 22:03:30 +0100
Message-ID: <30555.1566248610@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 19 Aug 2019 21:03:33 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190819_140333_808818_14DD0628 
X-CRM114-Status: GOOD (  10.62  )
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

>                 /* extract the FID array and its count in two steps */
> -               /* fall through */
> +               fallthrough;
>         case 1:

Okay, that doesn't look too bad.  I thought you might be going to combine it
with the case inside a macro in some way.

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
