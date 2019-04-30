Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C93B6FBEB
	for <lists+linux-afs@lfdr.de>; Tue, 30 Apr 2019 16:53:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wqwb4a5VwZuo5qnh+NyUISRed5dlvAdjRWOkY2HYuB0=; b=VXk8s6UUzrn5XS
	n5YlmjfB2E119GllUOg3XezP1D0cnhkOtEqJaQx11/fe6U9J2SKdbzkQ1ssH7EGkXpqY2wfKiEIu/
	lECfu+XgG3K4K2h++VPrF7a6l5av0/bVVvD7tOq40w4fFtcMgh6QREHFbl0K8MvMYFzefVoZfuwKB
	PoOC3I8k9zmTewkTomaPpkMAgQgbPqWL4CwiPSklACffoYx36inlJ4IKfB0v6TuoOGNQjs9+0A6EE
	Z/dTWEgNjXMhV18jBKAR50lw6kGisOHRTU5wZZ6SLvlAN/dYiFT0/8+QZyw68KlqYiD3je/h2vBGn
	oTHBVH17kEntJOGAPQBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLU8F-0000AS-T9; Tue, 30 Apr 2019 14:53:19 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLU8B-00009b-Rp
 for linux-afs@lists.infradead.org; Tue, 30 Apr 2019 14:53:17 +0000
Received: from localhost (adsl-173-228-226-134.prtc.net [173.228.226.134])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 7DB2014013FD3;
 Tue, 30 Apr 2019 07:53:09 -0700 (PDT)
Date: Tue, 30 Apr 2019 10:53:06 -0400 (EDT)
Message-Id: <20190430.105306.1978317247998825768.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net] rxrpc: Fix net namespace cleanup
From: David Miller <davem@davemloft.net>
In-Reply-To: <155660964874.18872.7446174793302616529.stgit@warthog.procyon.org.uk>
References: <155660964874.18872.7446174793302616529.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 30 Apr 2019 07:53:10 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190430_075315_903108_A1F6B4C2 
X-CRM114-Status: GOOD (  11.74  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
Cc: netdev@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>
Date: Tue, 30 Apr 2019 08:34:08 +0100

> In rxrpc_destroy_all_calls(), there are two phases: (1) make sure the
> ->calls list is empty, emitting error messages if not, and (2) wait for the
> RCU cleanup to happen on outstanding calls (ie. ->nr_calls becomes 0).
> 
> To avoid taking the call_lock, the function prechecks ->calls and if empty,
> it returns to avoid taking the lock - this is wrong, however: it still
> needs to go and do the second phase and wait for ->nr_calls to become 0.
> 
> Without this, the rxrpc_net struct may get deallocated before we get to the
> RCU cleanup for the last calls.  This can lead to:
> 
>   Slab corruption (Not tainted): kmalloc-16k start=ffff88802b178000, len=16384
>   050: 6b 6b 6b 6b 6b 6b 6b 6b 61 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkakkkkkkk
> 
> Note the "61" at offset 0x58.  This corresponds to the ->nr_calls member of
> struct rxrpc_net (which is >9k in size, and thus allocated out of the 16k
> slab).
> 
> 
> Fix this by flipping the condition on the if-statement, putting the locked
> section inside the if-body and dropping the return from there.  The
> function will then always go on to wait for the RCU cleanup on outstanding
> calls.
> 
> Fixes: 2baec2c3f854 ("rxrpc: Support network namespacing")
> Signed-off-by: David Howells <dhowells@redhat.com>

Applied and queued up for -stable, thanks.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
