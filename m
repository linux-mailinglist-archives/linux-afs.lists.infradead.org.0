Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEBCCFCB5
	for <lists+linux-afs@lfdr.de>; Tue,  8 Oct 2019 16:46:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eaY8Gu8OnTSwOFl4Pd7Hh7s4EXDhlMaEfxG8eN3cVrU=; b=TmQ58L1l9BFowx
	Rb6V3EPnMBO2cuJSGk6Rgsj98UaU4KIIMsWGkmKxOxBl+2vvactlD6wRKCaq7tjlF9X6gQttZjvA+
	96IoWmOEpJ53Y+mD+At40DyKRwmFkgfpqHJPRdDl+8Gx9+uecP1H6znA5hDM6Fi60gxZ7CiQdz6Zo
	Gh9nMEw+u/rzAcZNUs8fJ+uBEPbXjDcVZQ3USCw0Ey0LT29HyRkq472do/jlHOEQsURDaxbPlF7G9
	85G0bR0xIny6AojSeM4IXnWm4338SfXokcjw8tqSf6JiOyEb1Wzeh2RmUs38dFRfj94SeR6olr1fY
	lA4GUAYlA/WMF1IM9Zkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHqkQ-0002by-Vt; Tue, 08 Oct 2019 14:45:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGme4-0007s8-Qu
 for linux-afs@lists.infradead.org; Sat, 05 Oct 2019 16:11:02 +0000
Received: from paulmck-ThinkPad-P72 (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 545AF222C0;
 Sat,  5 Oct 2019 16:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570291856;
 bh=WXNltNNWDTjVjLox2ShheQ4T2u/cba37UPIwcEQB5pA=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=reL/miNeY8vHXFnVf3Dyl/cPcyVVc1HFr56p6dVX2qXPTtjWaliyVdCeOS5GUX5em
 U+ai/lY5hnHfEf2fNZT9iDRHFAtVinp4+Eh74c97WWMHtLvhUiuq1fcx6iDACwDOA0
 3RLFVrTmA2J6NO56yF10+TsyQb/XmHUzpYQS7mT8=
Date: Sat, 5 Oct 2019 09:10:55 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH tip/core/rcu 5/9] fs/afs: Replace rcu_swap_protected()
 with rcu_replace()
Message-ID: <20191005161055.GE2689@paulmck-ThinkPad-P72>
References: <20191003014310.13262-5-paulmck@kernel.org>
 <20191003014153.GA13156@paulmck-ThinkPad-P72>
 <25322.1570091894@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25322.1570091894@warthog.procyon.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191005_091100_892932_D4FC45FB 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Tue, 08 Oct 2019 07:45:57 -0700
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
Reply-To: paulmck@kernel.org
Cc: tglx@linutronix.de, peterz@infradead.org, fweisbec@gmail.com,
 jiangshanlai@gmail.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 josh@joshtriplett.org, rcu@vger.kernel.org, edumazet@google.com,
 mathieu.desnoyers@efficios.com, oleg@redhat.com, dipankar@in.ibm.com,
 joel@joelfernandes.org, akpm@linux-foundation.org, mingo@kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Thu, Oct 03, 2019 at 09:38:14AM +0100, David Howells wrote:
> paulmck@kernel.org wrote:
> 
> > This commit replaces the use of rcu_swap_protected() with the more
> > intuitively appealing rcu_replace() as a step towards removing
> > rcu_swap_protected().
> 
> Yay!
> 
> > Link: https://lore.kernel.org/lkml/CAHk-=wiAsJLw1egFEE=Z7-GGtM6wcvtyytXZA1+BHqta4gg6Hw@mail.gmail.com/
> > Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > Cc: David Howells <dhowells@redhat.com>
> > Cc: <linux-afs@lists.infradead.org>
> > Cc: <linux-kernel@vger.kernel.org>
> 
> Acked-by: David Howells <dhowells@redhat.com>

Applied, thank you David!

							Thanx, Paul

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
