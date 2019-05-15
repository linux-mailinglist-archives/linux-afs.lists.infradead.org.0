Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D351F95E
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 19:31:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QROmfvihoT7EldMq2MM9DZE4rlrd43ILAaLDzRU6/BM=; b=UEby/0M5MLsYOp
	1sHRIXO93mldO5xmng4Kp8KUbbuzQzRyMS6e7xMhVDt1kf1z5E3d/h9yZE6FDCUjeRieiurxQfnNE
	8DEsQAlA9VCBl8SZHyASn4xhGVB7kPQM8yRlglKhfWPWat8Lw6oonVY+VJC4DHXwCXC3hWGu+PoXz
	OT6yRgOrxqFHZMWRuNSMgQDzloT8/O0DpGKjMapkN2mzsRoVVSjj79h8YWX+k9MXQVYFJ+9M/XHK1
	jzh1ODoZlH/kwPc4NLDX2haFkVbUhxAKg8l8+ftRnVEAYj+j80Hqur3DSioLmwJ1uitozafNoRXBe
	iJ0qrQB5hjhBv0XsEZag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQxjv-00018f-6Z; Wed, 15 May 2019 17:30:51 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQxjt-00018P-7V
 for linux-afs@bombadil.infradead.org; Wed, 15 May 2019 17:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y0H7KCJgDLLoNPgDXA06COEEWIlwjcNmqU20oeqEVdM=; b=ICW+Ax1Hnls1D1ma43OjC5/22
 cyieKb+MpGX6+WTDjd7th2EhOYEBpYmB89o960nPHxEcCgSHew+YrPdliQ6e3O+v7BxhtEC+L2rch
 YLhUYeprRZChm3rX/U0tewaacWC10VE02CAB34K3yZuTGcyZn8M+CE8iUqG/BgTraK5ZkgXzd8+Em
 QZvbV5rVLZhpF7SLe8d4LRJV0vSXR+0NcTt3Sg0tujDpe2TQMu18CXfN/aada14hsB6yCEnp2aSBq
 5hXYKTsAqMPeh/EZvUsdbFu/2DbcmgDS8DAWjQJGFvVzbA8MFpDTiJR7kBcSa/XyeR9Dw14e8BHAc
 siF9yhZgA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQxjq-0001mI-FF; Wed, 15 May 2019 17:30:46 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id C4DB720297D49; Wed, 15 May 2019 19:30:43 +0200 (CEST)
Date: Wed, 15 May 2019 19:30:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 07/15] Add wait_var_event_interruptible()
Message-ID: <20190515173043.GA2589@hirez.programming.kicks-ass.net>
References: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
 <155793758837.31671.13765813674309502991.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155793758837.31671.13765813674309502991.stgit@warthog.procyon.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, May 15, 2019 at 05:26:28PM +0100, David Howells wrote:
> Add wait_var_event_interruptible() to allow interruptible waits for events.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> ---
> 
>  include/linux/wait_bit.h |   13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/include/linux/wait_bit.h b/include/linux/wait_bit.h
> index 2b0072fa5e92..7dec36aecbd9 100644
> --- a/include/linux/wait_bit.h
> +++ b/include/linux/wait_bit.h
> @@ -305,6 +305,19 @@ do {									\
>  	__ret;								\
>  })
>  
> +#define __wait_var_event_interruptible(var, condition)			\
> +	___wait_var_event(var, condition, TASK_INTERRUPTIBLE, 0, 0,	\
> +			  schedule())
> +
> +#define wait_var_event_interruptible(var, condition)			\
> +({									\
> +	int __ret = 0;							\
> +	might_sleep();							\
> +	if (!(condition))						\
> +		__ret = __wait_var_event_interruptible(var, condition);	\
> +	__ret;								\
> +})
> +
>  /**
>   * clear_and_wake_up_bit - clear a bit and wake up anyone waiting on that bit
>   *
> 

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
