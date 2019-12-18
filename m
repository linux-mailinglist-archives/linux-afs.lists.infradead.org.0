Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7652C125165
	for <lists+linux-afs@lfdr.de>; Wed, 18 Dec 2019 20:10:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X78EgbgpqX4v4zFhupGfF1I/jhWnyG7CR8uByZxPWB0=; b=e5sQrsMvAfoWei
	C87xNk5sHMXpCHiz8la4wAFYi53CWq5actZVdUKS29l5VR9EH9n4NKEc08Jqb+8oPSpgJVVQMQaIx
	uwfU4A8UUisaSWBmAUdhsrdgUYChIR+F2oT6LTI1GPBgcXL66Dsq2eWgSBNGNvrXJa8afVUp5zX5Y
	hR+iQxCUC2PyR90hxPBdGoLkL0nWf33k3yJ9HNwQV1SV4rPoOOdfpTFdG89xRGGhum82e7rDOw/4g
	VijyhTFEopK3q1KLLXASS+siZTnYkyzPDNvCioC++8F6BN8fAfjooawnTRpYikSB1MXCWPm+IZGoQ
	oTMen4pllMjstypkRy2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihei3-0000Cf-3x; Wed, 18 Dec 2019 19:10:11 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihei1-00089U-HS; Wed, 18 Dec 2019 19:10:09 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 0122A980E35; Wed, 18 Dec 2019 20:10:06 +0100 (CET)
Date: Wed, 18 Dec 2019 20:10:06 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 1/2] rxrpc: Unlock new call in rxrpc_new_incoming_call()
 rather than the caller
Message-ID: <20191218191006.GF11457@worktop.programming.kicks-ass.net>
References: <157669169065.21991.15207045893761573624.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157669169065.21991.15207045893761573624.stgit@warthog.procyon.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Davidlohr Bueso <dave@stgolabs.net>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-fsdevel@vger.kernel.org,
 Will Deacon <will@kernel.org>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, Dec 18, 2019 at 05:54:50PM +0000, David Howells wrote:
> Move the unlock and the ping transmission for a new incoming call into
> rxrpc_new_incoming_call() rather than doing it in the caller.  This makes
> it clearer to see what's going on.
> 
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Peter Zijlstra <peterz@infradead.org>
> cc: Ingo Molnar <mingo@redhat.com>
> cc: Will Deacon <will@kernel.org>
> cc: Davidlohr Bueso <dave@stgolabs.net>

Thanks, that looks much nicer!

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
