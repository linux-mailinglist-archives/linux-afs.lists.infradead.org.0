Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A209119F6C
	for <lists+linux-afs@lfdr.de>; Wed, 11 Dec 2019 00:31:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZNHwxDdUqikSt3BkZx1g8YT5FoGr/XM7zcCgfUH+E4=; b=FgP0bb+78zbZvb
	eHPxUqokSNHZD0QRxI249juinrspWve4LsknDaGc2sD20eSxdzALtC10gakjDtXsiidHM1W0fe7+0
	sgyAdH/r7eqU4EYUJfPjjJdJ0I0wATWNfEDDjo649/bf/a3rIxs1ZIOD845AJRkvAnT43Fo/hK/sM
	VhCkhjoU37dnJdKc+lP0KLyInPj4qst8K7nTuTOrjSqJUnJEGx5yEcsbkPyFl6RQUtDU/ODwC9sKH
	8yP1nGJXXqi75v33R2fw3BDZtxBDrZMYQ1yFD09DPZIRD0lpFeGrgBdF9VBzD2KNoSYPUUVeELsNg
	GKs8QMmY+lWa6JkFksrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieoyU-0001PK-Mk; Tue, 10 Dec 2019 23:31:26 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieouD-0008LK-01
 for linux-afs@lists.infradead.org; Tue, 10 Dec 2019 23:27:02 +0000
Received: by mail-wr1-x442.google.com with SMTP id t2so22044443wrr.1
 for <linux-afs@lists.infradead.org>; Tue, 10 Dec 2019 15:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wxkeZ4mYHV1Efx0eTIxyKSIJuDm6NlhmYQEvvwWfjTM=;
 b=qJPO5yNNFbfflnYIAWu1hS8nATPbH+TmqomNqLEa5gLu7OZSF8V3KyuU3MiGzDZEgL
 9n4AQD+8SraPxNIo/8r6U/JiJ2PRXxbIl0dGOQJXym7iij/ySYbL7OuTyB6lMTEzf7xA
 1yREADbdTz3tMrylfed9XPCvWLt89pzNtkpZoRKoN2aIxilPK1v9O4RepZrDOfG9we8u
 DYxVetXaXuKuYryyd+YQmbl/0zCAjaxMYng2YHHkTiOPqXuqFukkOTYTdFd549azwW5n
 wKtOKoiF+aYENVi/X+jaiKvrMiV6addY0CtSBsAr41f8blwTfU91zUIS9/wJG7wMSB9c
 9DVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=wxkeZ4mYHV1Efx0eTIxyKSIJuDm6NlhmYQEvvwWfjTM=;
 b=niyAC2t8jxGke/sZL4peoOYBUyK6/OYp3BtX86QyBre6GUnbonx1RUh4bmTxKCvUkV
 5eaHBodv6PrxLjA4YFoxUY4+DMXn9g1GRF+tC6HF9NoZhNQ8E1aC68XkTtZZr0qyxQfR
 QBD3MjWjFdBwzGDhYr8BIS3HCsnj+CvagvPMJi1N7vVdkRqrUUNtWaedcS5x01FGnpkj
 72jDgQFER84zQdqEsTDz1pYGZDIiFgQjESJujaFiE3rXP9eIu34fJZwyiENRjy2rWnKo
 DAIwM1GWjlWgtvunL9vYIeGaY8eSFEFEJnZxllOSc72PvfKQINXlkL44hmSvtu3O9/Ki
 8cZg==
X-Gm-Message-State: APjAAAX6l1wwq7N/7cNATa82UY1Wwxim7W+SAsdXXFp6Bi3DoivoXpJd
 3uUcRwRq5E15xFjfXlPF7WyzG5Od
X-Google-Smtp-Source: APXvYqx945N65yOzTC2qg/WHSEfPHmAy+RFoK1/kHXjO7Iqk93T1bul5FCz/zVBxwjQD1l9dhg1SAw==
X-Received: by 2002:adf:e6c6:: with SMTP id y6mr101597wrm.284.1576020418512;
 Tue, 10 Dec 2019 15:26:58 -0800 (PST)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id b17sm88329wrx.15.2019.12.10.15.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 15:26:58 -0800 (PST)
Date: Wed, 11 Dec 2019 00:26:55 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH] Revert "locking/mutex: Complain upon mutex API misuse in
 IRQ contexts"
Message-ID: <20191210232655.GA80975@gmail.com>
References: <20191210193011.GA11802@worktop.programming.kicks-ass.net>
 <20191210220523.28540-1-dave@stgolabs.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210220523.28540-1-dave@stgolabs.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_152701_060338_DC317D4E 
X-CRM114-Status: GOOD (  11.26  )
X-Spam-Score: 0.4 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.4 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2a00:1450:4864:20:0:0:0:442 listed in]
 [list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (mingo.kernel.org[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Mailman-Approved-At: Tue, 10 Dec 2019 15:31:25 -0800
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
Cc: Davidlohr Bueso <dbueso@suse.de>, peterz@infradead.org,
 linux-kernel@vger.kernel.org, dhowells@redhat.com, mingo@redhat.com,
 linux-fsdevel@vger.kernel.org, tglx@linutronix.de, will@kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


* Davidlohr Bueso <dave@stgolabs.net> wrote:

> This ended up causing some noise in places such as rxrpc running in softirq.
> 
> The warning is misleading in this case as the mutex trylock and unlock
> operations are done within the same context; and therefore we need not
> worry about the PI-boosting issues that comes along with no single-owner
> lock guarantees.
> 
> While we don't want to support this in mutexes, there is no way out of
> this yet; so lets get rid of the WARNs for now, as it is only fair to
> code that has historically relied on non-preemptible softirq guarantees.
> In addition, changing the lock type is also unviable: exclusive rwsems
> have the same issue (just not the WARN_ON) and counting semaphores
> would introduce a performance hit as mutexes are a lot more optimized.
> 
> This reverts commit 5d4ebaa87329ef226e74e52c80ac1c62e4948987.

Not sure where that SHA1 came from (it's not in Linus's tree), the right 
one is:

    a0855d24fc22: ("locking/mutex: Complain upon mutex API misuse in IRQ contexts")

I've fixed the changelog accordingly.

Thanks,

	Ingo

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
