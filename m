Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A12BC9AABB
	for <lists+linux-afs@lfdr.de>; Fri, 23 Aug 2019 10:52:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bwxvTqNLXleAefD3jN8jxDfkSeNuO/ynDTTs8zhM+CY=; b=Xxjt+bgdD10CrX
	NZyvkK37LTzaMg35ElkHqRnIvXsATwE1V4pXZPwMFbcZcjGJMyi0jW+vCJ8LKYYLkbuJBlyEGfT5e
	zUN60eaxjZkO5W2Wf8P6woSQgYdXNgs21xVIHpPSxlvasxbhYv8OeVtpwdKAfTBUEshxEvzkrfaJ1
	w5Pi+/0PnFP2rDvtCWftpyd2UYj8uyQBHReQxKMN7+K0L2wKgXpAlo8K6WztJ+HQmuW24nmpYt+rt
	bm8u8lqWfYMKMHFDKlIM/kNF4WhZFLNjp6BkAKZfjy+7XJKSFtESpXvFqyvtlGySVIppoiHL2rjcS
	EeYvylRMcPFewPcgoe0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i15JN-0004zD-FI; Fri, 23 Aug 2019 08:52:45 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i15J9-0004wx-D5
 for linux-afs@lists.infradead.org; Fri, 23 Aug 2019 08:52:33 +0000
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7B3CF8980F2;
 Fri, 23 Aug 2019 08:52:30 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6734117D08;
 Fri, 23 Aug 2019 08:52:29 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190822.121207.731320146177703787.davem@davemloft.net>
References: <20190822.121207.731320146177703787.davem@davemloft.net>
 <156647655350.10908.12081183247715153431.stgit@warthog.procyon.org.uk>
To: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net 0/9] rxrpc: Fix use of skb_cow_data()
MIME-Version: 1.0
Content-ID: <27347.1566550348.1@warthog.procyon.org.uk>
Date: Fri, 23 Aug 2019 09:52:28 +0100
Message-ID: <27348.1566550348@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Fri, 23 Aug 2019 08:52:30 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_015232_049742_1286EE6B 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: dhowells@redhat.com, netdev@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

David Miller <davem@davemloft.net> wrote:

> Why don't you just do an skb_unshare() at the beginning when you know that
> you'll need to do that?

I was trying to defer any copying to process context rather than doing it in
softirq context to spend less time in softirq context - plus that way I can
use GFP_NOIO (kafs) or GFP_KERNEL (direct AF_RXRPC socket) rather than
GFP_ATOMIC if the api supports it.

I don't remember now why I used skb_cow_data() rather than skb_unshare() - but
it was probably because the former leaves the sk_buff object itself intact,
whereas the latter replaces it.  I can switch to using skb_unshare() instead.

Question for you: how likely is a newly received buffer, through a UDP socket,
to be 'cloned'?

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
