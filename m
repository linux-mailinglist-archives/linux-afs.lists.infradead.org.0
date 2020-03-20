Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FCB18C5C7
	for <lists+linux-afs@lfdr.de>; Fri, 20 Mar 2020 04:29:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhyjNqOWOSGqs/UHLpBhsZNWNksB/aZ+5/W6kGi/8VE=; b=rbkWAhf0RWQq6U
	cMv69nIDF6OD+2A10keMR8f5utvzLMvTztdpndeswSPhcXrA7jrcHV8g+IYt0hvulsuD/pQ+taFzG
	m/htBrEg6wju1HF1wv3iZCQaQWJfvfbIwpyOcpxzfgKWMEWb5Qgly7bibdUABdhhWCPbbfqZbu2yT
	LbBV2YG0c/bHz7SFJeSwPZmsbu9N3objzn9odNbFEDHHWzBCGYyDLc9jVgEEPFV9+H+dVm+JaZce4
	Mo17NsWnQ3Htht6pTkGl0dtyBElFnsDafoC5ZV6Pk0/BfBy+EA8PtASJXcfuihnuayk/9oXenLtM2
	tc1F104BiytPjEyIv5WA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jF8LN-0002NG-F7; Fri, 20 Mar 2020 03:29:09 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jF8LJ-0002MR-UA
 for linux-afs@lists.infradead.org; Fri, 20 Mar 2020 03:29:08 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 84615158EC784;
 Thu, 19 Mar 2020 20:28:56 -0700 (PDT)
Date: Thu, 19 Mar 2020 20:28:55 -0700 (PDT)
Message-Id: <20200319.202855.777232170285897789.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net 0/6] rxrpc, afs: Interruptibility fixes
From: David Miller <davem@davemloft.net>
In-Reply-To: <158461880968.3094720.5019510060910604912.stgit@warthog.procyon.org.uk>
References: <158461880968.3094720.5019510060910604912.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 19 Mar 2020 20:28:56 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_202905_972122_5323DB51 
X-CRM114-Status: GOOD (  14.15  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
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
Date: Thu, 19 Mar 2020 11:53:29 +0000

> Here are a number of fixes for AF_RXRPC and AFS that make AFS system calls
> less interruptible and so less likely to leave the filesystem in an
> uncertain state.  There's also a miscellaneous patch to make tracing
> consistent.
> 
>  (1) Firstly, abstract out the Tx space calculation in sendmsg.  Much the
>      same code is replicated in a number of places that subsequent patches
>      are going to alter, including adding another copy.
> 
>  (2) Fix Tx interruptibility by allowing a kernel service, such as AFS, to
>      request that a call be interruptible only when waiting for a call slot
>      to become available (ie. the call has not taken place yet) or that a
>      call be not interruptible at all (e.g. when we want to do writeback
>      and don't want a signal interrupting a VM-induced writeback).
> 
>  (3) Increase the minimum delay on MSG_WAITALL for userspace sendmsg() when
>      waiting for Tx buffer space as a 2*RTT delay is really small over 10G
>      ethernet and a 1 jiffy timeout might be essentially 0 if at the end of
>      the jiffy period.
> 
>  (4) Fix some tracing output in AFS to make it consistent with rxrpc.
> 
>  (5) Make sure aborted asynchronous AFS operations are tidied up properly
>      so we don't end up with stuck rxrpc calls.
> 
>  (6) Make AFS client calls uninterruptible in the Rx phase.  If we don't
>      wait for the reply to be fully gathered, we can't update the local VFS
>      state and we end up in an indeterminate state with respect to the
>      server.
> 
> The patches are tagged here:
> 
> 	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
> 	rxrpc-fixes-20200319

Pulled, thanks David.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
