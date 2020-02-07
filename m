Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D13A15558C
	for <lists+linux-afs@lfdr.de>; Fri,  7 Feb 2020 11:22:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MavjsBiE/Q9cdu3oiK5kSaQK2eVtHz0ho9xMk5sbAWg=; b=O2RuaUzfRryy5T
	iZ1In7TVr82kkbPnwgmXA3xkvIqhMsuobwr4J7J/SGmml1MvjucOswXwzn8QGILRexR5gIxKmNI9r
	INrxvHh4rcWgl/VqWpiq9x4rJMnIlBGDeWf56PxTBCUP+okbg/FUNidLV0xwNhV0KvLfIrPdFRDG6
	pd1Jqj1b3t0v1qFM/MXTVe2XXJlfW1nHBzEzd9DZBUq7M3feV+sCbqXrMXhhV/jmmqBWtU+2S2CuT
	gQZFYgn2qmb+koSpfoFlotrN7tA9BwMl34LrOmtr/rEWf4xlDaSfISEnwb0PZnIeMcDProdjAZfCE
	f8GL6UL8fM81wNZByHvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j00lz-0004tm-GO; Fri, 07 Feb 2020 10:22:07 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j00lx-0004t9-Hr
 for linux-afs@lists.infradead.org; Fri, 07 Feb 2020 10:22:06 +0000
Received: from localhost (unknown [IPv6:2001:982:756:1:57a7:3bfd:5e85:defb])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 09D5315A32105;
 Fri,  7 Feb 2020 02:21:55 -0800 (PST)
Date: Fri, 07 Feb 2020 11:21:54 +0100 (CET)
Message-Id: <20200207.112154.1238920306232628596.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net] rxrpc: Fix service call disconnection
From: David Miller <davem@davemloft.net>
In-Reply-To: <158099730157.2198513.14087711871251670411.stgit@warthog.procyon.org.uk>
References: <158099730157.2198513.14087711871251670411.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 07 Feb 2020 02:21:56 -0800 (PST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_022205_593132_3B276E4B 
X-CRM114-Status: GOOD (  13.54  )
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
Date: Thu, 06 Feb 2020 13:55:01 +0000

> The recent patch that substituted a flag on an rxrpc_call for the
> connection pointer being NULL as an indication that a call was disconnected
> puts the set_bit in the wrong place for service calls.  This is only a
> problem if a call is implicitly terminated by a new call coming in on the
> same connection channel instead of a terminating ACK packet.
> 
> In such a case, rxrpc_input_implicit_end_call() calls
> __rxrpc_disconnect_call(), which is now (incorrectly) setting the
> disconnection bit, meaning that when rxrpc_release_call() is later called,
> it doesn't call rxrpc_disconnect_call() and so the call isn't removed from
> the peer's error distribution list and the list gets corrupted.
> 
> KASAN finds the issue as an access after release on a call, but the
> position at which it occurs is confusing as it appears to be related to a
> different call (the call site is where the latter call is being removed
> from the error distribution list and either the next or pprev pointer
> points to a previously released call).
> 
> Fix this by moving the setting of the flag from __rxrpc_disconnect_call()
> to rxrpc_disconnect_call() in the same place that the connection pointer
> was being cleared.
> 
> Fixes: 5273a191dca6 ("rxrpc: Fix NULL pointer deref due to call->conn being cleared on disconnect")
> Signed-off-by: David Howells <dhowells@redhat.com>

Applied and queued up for -stable.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
