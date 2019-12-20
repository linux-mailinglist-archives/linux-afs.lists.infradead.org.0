Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CE604128318
	for <lists+linux-afs@lfdr.de>; Fri, 20 Dec 2019 21:13:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9QaUGZn9vfVI++0BtPHbTcFCq7gDPdekbULtlc4JIH8=; b=AFRwa7kmx0kIgv
	saZbhsNIyXMCvbcGGIYHj+18QmLDb+JaGNT8rmEF5Fbln5sDoApEvCLSvO6iFPRR4kDQq7HB1L8w2
	LDPXumFocvbAi0hvYu35Oq2jAMNpuF4uaWXx+hmnFM4I4dVMh++sTTv1ro7q91zZExxMDTM0hq9W1
	SPoAQ+vPsMHdz4VLgsShskHMyxP7Ml3eHFN/8x/910yANigTrigSEoVrlYKB846klmeqtlozwQ9Ul
	PiSjp+cDTO0wyQRjL7d/FVdKG7o6g7CQzNKp0v9ZEPJCm/4ecDnJzoEfhDBg3wbaC2zq//yMg1N9f
	GVGcAhoUYiJZpLdElaPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiOeF-0003nj-Kl; Fri, 20 Dec 2019 20:13:19 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiOeC-0003nW-M2; Fri, 20 Dec 2019 20:13:16 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DDE52300DB7;
 Fri, 20 Dec 2019 21:11:49 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 0E7352024479A; Fri, 20 Dec 2019 21:13:14 +0100 (CET)
Date: Fri, 20 Dec 2019 21:13:14 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH] rxrpc: struct mutex cannot be used for
 rxrpc_call::user_mutex
Message-ID: <20191220201314.GS2827@hirez.programming.kicks-ass.net>
References: <157659672074.19580.11641288666811539040.stgit@warthog.procyon.org.uk>
 <20191218135047.GS2844@hirez.programming.kicks-ass.net>
 <20191218190833.ufpxjrvin5jvp3m5@linux-p48b>
 <20191218202801.wokf6hcvbafmjnkd@linux-p48b>
 <20191219090535.GV2844@hirez.programming.kicks-ass.net>
 <20191219174417.jax2fy3fvrvrrpsq@linux-p48b>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191219174417.jax2fy3fvrvrrpsq@linux-p48b>
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
Cc: linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, linux-fsdevel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Thu, Dec 19, 2019 at 09:44:17AM -0800, Davidlohr Bueso wrote:
> On Thu, 19 Dec 2019, Peter Zijlstra wrote:
> 
> > Automate what exactly?
> 
> What I meant was automating finding cases that are 'false positives' such
> as rxrpc and kexec _before_ re-adding the warn.

I suppose we can keep the WARN patch in a -next enabled branch for a
while, without it nessecarily going into linus' tree on the next
release.

That does require people actually testing -next, which seems somewhat
optimistic.

Alternatively, you can try your hand at smatch ...

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
