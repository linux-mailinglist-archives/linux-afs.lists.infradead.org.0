Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 444FC150FBC
	for <lists+linux-afs@lfdr.de>; Mon,  3 Feb 2020 19:39:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+aNgOp5Te/ZoO2bXSr7kqxewD4QRUs3OK50gGIGJrg=; b=hmHps1VMDkikBL
	mwRigYC8qTmTaZsikXFC3wLJaaz/r1NSDbz7Lfln5NgTOFqGagP4sfg0B27v3bMsX/uboTkci3P9B
	wYb/WExgeKLairxWic1e4yWwZwxY4rRuXIGeyBWCo3z2TZWYgkS4yxfuDs8ksMztlT0ObKJTb8GBE
	x1viFHfOaJLIqFtiQEMtpTR6zb3aeV6gCwvbI09dhMCSyWO/fvfS146mCN3sutt/0ZAvCmwaKQL89
	T1SXfgVJI9oiqppRsi+FgmLyJ9nH4dCJ76njO0XhVm8JEmy2jyvgjR5ctq4knSt3eo49gp1rqU9fi
	KmdlkvoErjNv0Slasotg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iygcw-00030s-7A; Mon, 03 Feb 2020 18:39:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iygcu-00030Y-9g
 for linux-afs@lists.infradead.org; Mon, 03 Feb 2020 18:39:17 +0000
Received: from cakuba.hsd1.ca.comcast.net (unknown [199.201.64.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5ACD720721;
 Mon,  3 Feb 2020 18:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580755155;
 bh=MZADIRrK5vab8PxK9EWlQo33bsfzGlynG26Gj3Li+mM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QK+3zjAAIpgOgs2WyTkpMRnLVhrkwH5f0ztH1uh5fXqY38sJ6Xe3yaI9R3FsraBXK
 ic2FMLcho93dGWq1H/qRI+BHSoPIpBR+zUG8caXYL6tXLeXsODYO9wl0hRBjz/GrPF
 OhTzv/aGcGbspM8sctT2+ySZJCrJkxR8SN2ZsJAw=
Date: Mon, 3 Feb 2020 10:39:14 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH net 0/4] rxrpc: Fixes ver #2
Message-ID: <20200203103914.4b038cb7@cakuba.hsd1.ca.comcast.net>
In-Reply-To: <158072584492.743488.4616022353630142921.stgit@warthog.procyon.org.uk>
References: <158072584492.743488.4616022353630142921.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_103916_357730_DE2EDC73 
X-CRM114-Status: GOOD (  11.55  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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

On Mon, 03 Feb 2020 10:30:45 +0000, David Howells wrote:
> Here are a number of fixes for AF_RXRPC:
> 
>  (1) Fix a potential use after free in rxrpc_put_local() where it was
>      accessing the object just put to get tracing information.
> 
>  (2) Fix insufficient notifications being generated by the function that
>      queues data packets on a call.  This occasionally causes recvmsg() to
>      stall indefinitely.
> 
>  (3) Fix a number of packet-transmitting work functions to hold an active
>      count on the local endpoint so that the UDP socket doesn't get
>      destroyed whilst they're calling kernel_sendmsg() on it.
> 
>  (4) Fix a NULL pointer deref that stemmed from a call's connection pointer
>      being cleared when the call was disconnected.
> 
> Changes:
> 
>  v2: Removed a couple of BUG() statements that got added.
> 
> The patches are tagged here:
> 
> 	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
> 	rxrpc-fixes-20200130

Thank you David!

I pulled rxrpc-fixes-20200202 since that tag seems to correspond to 
the patches on the mailing list.

Should I queue these for stable? There are some fixes to fixes here, 
so AFAIK we need:

5273a191dca65a675dc0bcf3909e59c6933e2831   4.9+
04d36d748fac349b068ef621611f454010054c58   4.19+
f71dbf2fb28489a79bde0dca1c8adfb9cdb20a6b   4.9+
fac20b9e738523fc884ee3ea5be360a321cd8bad   4.19+

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
