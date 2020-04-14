Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 220091A8F16
	for <lists+linux-afs@lfdr.de>; Wed, 15 Apr 2020 01:28:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iQ/QMYYpnWSWXAuI7LjC47LTDBZjL40i3+eaPgVdKdQ=; b=QwBKv6jK7DTts4
	lq877RRqyoHYFWi7lvHdad0yYz95EhD7ZdCUJkrewZkrSX/f9ZUZtNojaB2wCcVA9+nikZ+v00w1H
	8Qsj83UBkyFMAMOdTDneATkSVGwlCoR3nEaHJaepptBJhH1VIqLP0rG05d6mrtZRBBqt1DcdQs6Vp
	eHU7e9Z+0kKfF762ufY2FzkfgFhzSyEarjBAa14GXmGRA9p2Vg0O3hNuCS6Dfsecdj+J94EAffBOf
	DhpZuwV82isBoDoMIlUz0EEROUuGhjwnBjzxoxMQnEP0S+eFqDbTXreL7gy3DB6NdaYBs8ZR2P2tQ
	g1/rMCqWhkcJEmuMHvZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOUyb-0003ZQ-Qg; Tue, 14 Apr 2020 23:28:21 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOUyZ-0003Yv-Ax
 for linux-afs@lists.infradead.org; Tue, 14 Apr 2020 23:28:20 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id B2AE41280C044;
 Tue, 14 Apr 2020 16:28:08 -0700 (PDT)
Date: Tue, 14 Apr 2020 16:27:15 -0700 (PDT)
Message-Id: <20200414.162715.162785138701944842.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net] rxrpc: Fix DATA Tx to disable nofrag for UDP on
 AF_INET6 socket
From: David Miller <davem@davemloft.net>
In-Reply-To: <158678263441.2860393.4171676680352045929.stgit@warthog.procyon.org.uk>
References: <158678263441.2860393.4171676680352045929.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 14 Apr 2020 16:28:08 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_162819_375631_E272B5FE 
X-CRM114-Status: GOOD (  11.88  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
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
Date: Mon, 13 Apr 2020 13:57:14 +0100

> Fix the DATA packet transmission to disable nofrag for UDPv4 on an AF_INET6
> socket as well as UDPv6 when trying to transmit fragmentably.
> 
> Without this, packets filled to the normal size used by the kernel AFS
> client of 1412 bytes be rejected by udp_sendmsg() with EMSGSIZE
> immediately.  The ->sk_error_report() notification hook is called, but
> rxrpc doesn't generate a trace for it.
> 
> This is a temporary fix; a more permanent solution needs to involve
> changing the size of the packets being filled in accordance with the MTU,
> which isn't currently done in AF_RXRPC.  The reason for not doing so was
> that, barring the last packet in an rx jumbo packet, jumbos can only be
> assembled out of 1412-byte packets - and the plan was to construct jumbos
> on the fly at transmission time.
> 
> Also, there's no point turning on IPV6_MTU_DISCOVER, since IPv6 has to
> engage in this anyway since fragmentation is only done by the sender.  We
> can then condense the switch-statement in rxrpc_send_data_packet().
> 
> Fixes: 75b54cb57ca3 ("rxrpc: Add IPv6 support")
> Signed-off-by: David Howells <dhowells@redhat.com>

Applied, thanks David.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
