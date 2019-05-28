Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 547442CEDC
	for <lists+linux-afs@lfdr.de>; Tue, 28 May 2019 20:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FFN3eOMCcMKMlWDuyaMBKnPjxsBXJlnUvLvHy9HSdiw=; b=XzvRbysn9t+8NY
	spbiLRQcBWuYlP7IcWr+Fhf/giGLJSDJK4iwG0FIQwWb+kOumwfXalMt58DDnQEMHCYefYDGROTST
	9Y+tnLTAXLpOXynT8PTL6stm50OmRyqbwxiFhO0GA21A2Wf8pxb5MQjo7ris9dvjbu+UvJomn+kw4
	zQDe4gXpf1s7OPl+aIurjLb13scNbweSLXHDu8XdNXwi7k1vI4KmMNo9n9okXKbU000+9BsrhVw2s
	qBLnrrxF6yf3ScdnPR6dlKuEae62Qekxhf1zPuFVKxnbvxzgPisUgeH/JxzkaZyUgTzk48kPDIXm3
	QBpHrl4C8qFIGmghCrKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVh7d-0006w9-3j; Tue, 28 May 2019 18:46:53 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVezx-0002A7-ND
 for linux-afs@lists.infradead.org; Tue, 28 May 2019 16:30:50 +0000
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 092193087948;
 Tue, 28 May 2019 16:30:36 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-173.rdu2.redhat.com
 [10.10.120.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCFFE5D9CD;
 Tue, 28 May 2019 16:30:19 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190528142424.19626-3-geert@linux-m68k.org>
References: <20190528142424.19626-3-geert@linux-m68k.org>
 <20190528142424.19626-1-geert@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/5] rxrpc: Fix uninitialized error code in
 rxrpc_send_data_packet()
MIME-Version: 1.0
Content-ID: <4653.1559061019.1@warthog.procyon.org.uk>
Date: Tue, 28 May 2019 17:30:19 +0100
Message-ID: <4654.1559061019@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 28 May 2019 16:30:47 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_093049_777638_162F5518 
X-CRM114-Status: GOOD (  17.76  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Mailman-Approved-At: Tue, 28 May 2019 11:46:51 -0700
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
Cc: linux-block@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, "David S . Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Clemens Ladisch <clemens@ladisch.de>, Jamal Hadi Salim <jhs@mojatatu.com>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>, dhowells@redhat.com,
 Jiri Pirko <jiri@mellanox.com>, Cong Wang <xiyou.wangcong@gmail.com>,
 Joe Perches <joe@perches.com>, "Mohit P . Tahiliani" <tahiliani@nitk.edu.in>,
 Matias Bjorling <mb@lightnvm.io>, Jaroslav Kysela <perex@perex.cz>,
 Eran Ben Elisha <eranbe@mellanox.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Igor Konopko <igor.j.konopko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> While this is not a real false-positive, I believe it cannot cause harm
> in practice, as AF_RXRPC cannot be used with other transport families
> than IPv4 and IPv6.

Agreed.

> ---
>  net/rxrpc/output.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/net/rxrpc/output.c b/net/rxrpc/output.c
> index 004c762c2e8d063c..1473d774d67100c5 100644
> --- a/net/rxrpc/output.c
> +++ b/net/rxrpc/output.c
> @@ -403,8 +403,10 @@ int rxrpc_send_data_packet(struct rxrpc_call *call, struct sk_buff *skb,
>  
>  	/* send the packet with the don't fragment bit set if we currently
>  	 * think it's small enough */
> -	if (iov[1].iov_len >= call->peer->maxdata)
> +	if (iov[1].iov_len >= call->peer->maxdata) {
> +		ret = 0;
>  		goto send_fragmentable;
> +	}
>  
>  	down_read(&conn->params.local->defrag_sem);
>  

Simply setting 0 is wrong.  That would give the impression that the thing
worked if support for a new transport address family was added and came
through this function without full modification (say AF_INET7 becomes a
thing).

A better way to do things would be to add a default case into the
send_fragmentable switch statement that either BUG's or sets -EAFNOSUPPORT.

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
