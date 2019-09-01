Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C681A4808
	for <lists+linux-afs@lfdr.de>; Sun,  1 Sep 2019 09:11:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJODtU7u61G/eKw5bfuoCTSQQQV3vN7ueMuDHUUUUaQ=; b=jcp7d4YmncKd94
	LZL+aH858zE0T1ekeINDT+LBooDTikU/YOv++g/eyh9kTAmdzbRjkK+t/NHKVOfoiEeEDey8Ae4RT
	wrIWzdK0Y4mRx7OFVPdUqdDq4D9Ucjh4wAHZ49KeIKbaRKnpHHDfrHri8cQrRWdhqA3ZEe6vwdSW4
	iXJpdgKf4JnIZfjB1h1eXT7yjGBuk2F95OQAVrlgLL3kROZsgPS8RyxKd8vN13cILwWsDDpk0SZwy
	G8ESiZq3rMqAA8HDM6SwIi24j+WZUqsg/azGx1sinHh+i3z1P9zAtoJgN67EiS8LbcNwzeKkhhttw
	G3zw8VS8LOLVpv5oWu/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4K1d-0006Le-Je; Sun, 01 Sep 2019 07:11:49 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4K1Z-0006LG-R0
 for linux-afs@lists.infradead.org; Sun, 01 Sep 2019 07:11:48 +0000
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ABFFB189DAD1;
 Sun,  1 Sep 2019 07:11:40 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8640E5D9D6;
 Sun,  1 Sep 2019 07:11:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190901065603.432-1-hdanton@sina.com>
References: <20190901065603.432-1-hdanton@sina.com>
 <156708405310.26102.7954021163316252673.stgit@warthog.procyon.org.uk>
To: Hillf Danton <hdanton@sina.com>
Subject: Re: [PATCH net 7/7] rxrpc: Use skb_unshare() rather than
 skb_cow_data()
MIME-Version: 1.0
Content-ID: <14326.1567321898.1@warthog.procyon.org.uk>
Date: Sun, 01 Sep 2019 08:11:38 +0100
Message-ID: <14327.1567321898@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Sun, 01 Sep 2019 07:11:40 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190901_001146_086828_128F9112 
X-CRM114-Status: GOOD (  12.82  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
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
Cc: dhowells@redhat.com, netdev@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hillf Danton <hdanton@sina.com> wrote:

> > +		/* Unshare the packet so that it can be modified for in-place
> > +		 * decryption.
> > +		 */
> > +		if (sp->hdr.securityIndex != 0) {
> > +			struct sk_buff *nskb = skb_unshare(skb, GFP_ATOMIC);
> > +			if (!nskb) {
> > +				rxrpc_eaten_skb(skb, rxrpc_skb_unshared_nomem);
> > +				goto out;
> > +			}
> > +
> > +			if (nskb != skb) {
> > +				rxrpc_eaten_skb(skb, rxrpc_skb_received);
> > +				rxrpc_new_skb(skb, rxrpc_skb_unshared);
> > +				skb = nskb;
> > +				sp = rxrpc_skb(skb);
> > +			}
> > +		}
> 
> Unsharing skb makes it perilous to take a peep at it afterwards.

Ah, good point.  rxrpc_new_skb() should be after the assignment.

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
