Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 821DF8F7A1
	for <lists+linux-afs@lfdr.de>; Fri, 16 Aug 2019 01:34:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XTsbI3oK1VMzRGLyaokHQ9BJefOKAVPCqAnmLFUqxkQ=; b=UUDgT/Ch+OjoYc
	fpxTuQWsMXsasLbncSH7iHjJ+D9YTCs1abQv5iiy+gEBFFkTCF//g6J85MnycB0roy9fREgxD76qJ
	cJWTHp1IEuWo/zfkbnkVzJLWJgZMnYJo5A0mF2x67/UVHDcEjatQjvjDqmZS3+5fr7PXZiJlHf2QB
	mB5MUALIH7nsvU17YSAR7QkG+RP9Ay1ZanRBdsoxDkLCSbGqQItBc0brDnOIyBMaAzmGmD+F8AMwI
	5I/QvNlp4k+LakP+5s6YfEX9YM0xIREPmGtojSWy3ZPpGnM0zANT4NorLvm60cmwBIbYiLtKi6ZDX
	kk9i8PFwcTRDl4OHSIYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyPFn-0000Vc-VU; Thu, 15 Aug 2019 23:33:59 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyPFk-0000V3-Sp
 for linux-afs@lists.infradead.org; Thu, 15 Aug 2019 23:33:58 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 116D01265123C;
 Thu, 15 Aug 2019 16:33:50 -0700 (PDT)
Date: Thu, 15 Aug 2019 16:33:49 -0700 (PDT)
Message-Id: <20190815.163349.1048232454570643495.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net 0/2] rxrpc: Fix local endpoint handling
From: David Miller <davem@davemloft.net>
In-Reply-To: <156577967167.1405.3581547705200268244.stgit@warthog.procyon.org.uk>
References: <156577967167.1405.3581547705200268244.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 15 Aug 2019 16:33:50 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190815_163356_936191_E4D153AF 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
Cc: netdev@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>
Date: Wed, 14 Aug 2019 11:47:51 +0100

> Here's a pair of patches that fix two issues in the handling of local
> endpoints (rxrpc_local structs):
> 
>  (1) Use list_replace_init() rather than list_replace() if we're going to
>      unconditionally delete the replaced item later, lest the list get
>      corrupted.
> 
>  (2) Don't access the rxrpc_local object after passing our ref to the
>      workqueue, not even to illuminate tracepoints, as the work function
>      may cause the object to be freed.  We have to cache the information
>      beforehand.

Pulled, thanks David.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
