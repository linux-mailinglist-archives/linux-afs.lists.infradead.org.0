Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFA1CBD8A
	for <lists+linux-afs@lfdr.de>; Fri,  4 Oct 2019 16:40:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+IL5cnFOHJ94Kunf/zgq8txRhenUwelameSiN4nNoDc=; b=NW+2K7rklGUKik
	F4jOj8aiOd80qxgAk1jfS/fsKqRUtGrx9HoqTK8VmA7+jI7Q5SmEcxRr2GPLwisMh480PMs4l3JrQ
	YWWFAQV41vnyfOgXZX0OIWrQufwYkX2knI0uEWCqLKs49Yb99edB+/EYhFAJCbEYWaPp/XYJQ7kWm
	OC4Ovy2HqVFVkEE7+mB1W0FcxlrHWVzl0LLSmtqy63OStXguwtpBnfugGRD4USKX/2jKwGuNSzKJl
	15+hiNnmkLkDB7qnCABHOMfNB9wRRgnOIuCQzgvuZgWA8E+EdGd/rgbTLvuKpD24Vtifm0NfdVZUi
	q7cC63N7d2jvjAvDVDKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGOks-0007zB-6C; Fri, 04 Oct 2019 14:40:26 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGOkq-0007yq-8R
 for linux-afs@lists.infradead.org; Fri, 04 Oct 2019 14:40:25 +0000
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4C07518CB911;
 Fri,  4 Oct 2019 14:40:07 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-125-72.rdu2.redhat.com
 [10.10.125.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6640119C5B;
 Fri,  4 Oct 2019 14:40:05 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190921122737.14884-1-hdanton@sina.com>
References: <20190921122737.14884-1-hdanton@sina.com> 
To: Hillf Danton <hdanton@sina.com>
Subject: Re: KASAN: use-after-free Read in rxrpc_release_call
MIME-Version: 1.0
Content-ID: <17921.1570200004.1@warthog.procyon.org.uk>
Date: Fri, 04 Oct 2019 15:40:04 +0100
Message-ID: <17922.1570200004@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Fri, 04 Oct 2019 14:40:07 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_074024_320016_03B24ED7 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
Cc: syzbot <syzbot+eed305768ece6682bb7f@syzkaller.appspotmail.com>,
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
 dhowells@redhat.com, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hillf Danton <hdanton@sina.com> wrote:

>  	if (conn) {
> -		rxrpc_disconnect_call(call);
>  		conn->security->free_call_crypto(call);
> +		rxrpc_disconnect_call(call);
>  	}

Better to cache the security pointer in the call struct, I think.

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
