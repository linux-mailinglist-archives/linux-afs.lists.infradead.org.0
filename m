Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6A2EB7ED
	for <lists+linux-afs@lfdr.de>; Thu, 31 Oct 2019 20:23:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTUbD1wYV6cGentayK1a5UHPGpnUYdSz3qZTtD5CZG8=; b=SK3D6MKeaHdQbv
	JPnfwcJyxo8Zpi9OcBXFnHBl8lMMnJvDWvX3FDbUuPT6OpI5wbprFGAIWIu/QpvmXJeX8V6/cuMys
	vmlnyfRNV8Zl29os8KtCmOCiFDMz9DwP3+nkDFWABk+B0EZrhA8S4as4elR0yNDJEREF8LnTPyDX3
	j70lYYPKmzRWTj/Q/sL6l3NXPl1qMWzcwcjxW4p3AI2j54tHEX8rsWp7UQu8aMjSIGPdtVZVoH8H0
	VUAW663m4rStODNr5NPOjk0iy5GQT1aX/JFmo/hAF8IeL7nklWZr11F1+7IYy+wJmYVVvX/ccZ0Qv
	h9J0IrjKCfProAoFHDbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQG2f-0006ng-GH; Thu, 31 Oct 2019 19:23:33 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQG2c-0006mw-Bj
 for linux-afs@lists.infradead.org; Thu, 31 Oct 2019 19:23:31 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id ECE6514FC9F70;
 Thu, 31 Oct 2019 12:23:28 -0700 (PDT)
Date: Thu, 31 Oct 2019 12:23:28 -0700 (PDT)
Message-Id: <20191031.122328.1237720180513331270.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net] rxrpc: Fix handling of last subpacket of jumbo packet
From: David Miller <davem@davemloft.net>
In-Reply-To: <157252402623.30237.12555934347853871645.stgit@warthog.procyon.org.uk>
References: <157252402623.30237.12555934347853871645.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 31 Oct 2019 12:23:29 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_122330_401606_FBFFFDC1 
X-CRM114-Status: GOOD (  10.34  )
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
Date: Thu, 31 Oct 2019 12:13:46 +0000

> When rxrpc_recvmsg_data() sets the return value to 1 because it's drained
> all the data for the last packet, it checks the last-packet flag on the
> whole packet - but this is wrong, since the last-packet flag is only set on
> the final subpacket of the last jumbo packet.  This means that a call that
> receives its last packet in a jumbo packet won't complete properly.
> 
> Fix this by having rxrpc_locate_data() determine the last-packet state of
> the subpacket it's looking at and passing that back to the caller rather
> than having the caller look in the packet header.  The caller then needs to
> cache this in the rxrpc_call struct as rxrpc_locate_data() isn't then
> called again for this packet.
> 
> Fixes: 248f219cb8bc ("rxrpc: Rewrite the data and ack handling code")
> Fixes: e2de6c404898 ("rxrpc: Use info in skbuff instead of reparsing a jumbo packet")
> Signed-off-by: David Howells <dhowells@redhat.com>

Applied, thanks David.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
