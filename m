Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8A990018
	for <lists+linux-afs@lfdr.de>; Fri, 16 Aug 2019 12:36:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7vYAMsON44cFpRinCVRxtHqQc5zTDEWzb3dircHVOMw=; b=MumG2GnfllzEia
	xr+SEc/poEWPR6/9vOC2gO25qdMQIUoBtjtuD0/Bp2uSLCsWBsB2OoyuppbtxUWBIfrFnU9kzDQ5w
	mBQexEsbuv2yN6mK/jY6dkwYZQiUB0eYzYI4oPChV0c1kaTcOgpF7RSFcY93zX9C5etdhsQLUM3GO
	+dTfLN7/p4Aqv1Jqror1qg2KobGJeUMVqgTrWbchGo4cphHCdiHEXpvi08JHPIXSuE4M4kUFoz4hM
	b7X5W1QZ9JbF6NQy1oPqlJSQPtVcz4qWxJXZF4Tyjm7fb+IIEKgU3GKsVBSnKPhz+Bh5vH5eTLm0w
	br8l8h0B1bHJdFWWaaLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyZb6-0000V6-Fw; Fri, 16 Aug 2019 10:36:40 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyZb2-0000Ty-On
 for linux-afs@lists.infradead.org; Fri, 16 Aug 2019 10:36:38 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 60EB7308A958;
 Fri, 16 Aug 2019 10:36:33 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9E62100195F;
 Fri, 16 Aug 2019 10:36:31 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <d98d1f0150bec8b69a886f77fc375b8ca9d24262.camel@perches.com>
References: <d98d1f0150bec8b69a886f77fc375b8ca9d24262.camel@perches.com>
 <e77b0f32a2ce97c872eede52c88b84aa78094ae5.1565836130.git.joe@perches.com>
 <12308.1565876416@warthog.procyon.org.uk>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] afs: Move comments after /* fallthrough */
MIME-Version: 1.0
Content-ID: <13105.1565951791.1@warthog.procyon.org.uk>
Date: Fri, 16 Aug 2019 11:36:31 +0100
Message-ID: <13106.1565951791@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 16 Aug 2019 10:36:33 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190816_033637_079715_0942CAC6 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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

> Here the script would not convert the /* Fall through */
> because the next non-blank line does not start with
> case or default

Convert the "/* Fall through */" to what?

You said "for a script to appropriately convert case statement blocks with /*
fallthrough */ comments to a macro".  Can you give an example of what the code
would look like with this macro emplaced?

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
