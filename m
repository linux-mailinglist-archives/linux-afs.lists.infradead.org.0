Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF352DED7
	for <lists+linux-afs@lfdr.de>; Wed, 29 May 2019 15:49:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17UezOIMLMrdW4uuBvcV16oa5YJBwZrSm7B8CpozqVo=; b=ft+9gXgKgudFwD
	wJ5r20j2b0tDxXTa5SuuGDRQzD9x6h2QOXmPYjVHMoXYRQeaBDg66sdKdgE0x7VGxHPS/WRdfLXHC
	5reU1RivzLXTJ+n7Vc1raY3aLrTiIFlTu61GDSEr1hhfcvpyDVo3l+BhoJwm+5jJiJ5B623d2V0T9
	K+Tx8I5vDTCKdSXtKc4gom56r23Gqg9E625XMqeB3HwWHBlMyyP+hbDgEqhlb4VbsVd/NjjLD65Fs
	OF9qsG0h2YxTTq4lozTcPo8Orb9HA1SF26AXuXY5Zo2TBzbbFWBZbHBMgxACu8wAI/mNsgow3F0fK
	u2rWjJ9yP7SMyWdScxsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVyxd-0004ti-3k; Wed, 29 May 2019 13:49:45 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVyxa-0004tM-HT
 for linux-afs@lists.infradead.org; Wed, 29 May 2019 13:49:43 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C3580300CAC0;
 Wed, 29 May 2019 13:49:40 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-173.rdu2.redhat.com
 [10.10.120.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBEAE1001E80;
 Wed, 29 May 2019 13:49:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190529114332.19163-4-fw@strlen.de>
References: <20190529114332.19163-4-fw@strlen.de>
 <20190529114332.19163-1-fw@strlen.de>
To: Florian Westphal <fw@strlen.de>
Subject: Re: [PATCH net-next 3/7] afs: switch to in_dev_for_each_ifa_rcu
MIME-Version: 1.0
Content-ID: <20801.1559137779.1@warthog.procyon.org.uk>
Date: Wed, 29 May 2019 14:49:39 +0100
Message-ID: <20802.1559137779@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 29 May 2019 13:49:40 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190529_064942_600110_E719BDC4 
X-CRM114-Status: GOOD (  14.63  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
Cc: dhowells@redhat.com, netdev@vger.kernel.org, linux-afs@lists.infradead.org,
 eric.dumazet@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Florian Westphal <fw@strlen.de> wrote:

> The in_dev_for_each_ifa_rcu helper gets used so sparse won't
> complain when we add the proper __rcu annotation to the ifa_list
> member in struct in_device later.
> 
> While doing this I realized the helper only has one call site,
> so move it to where its needed.
> 
> This then revealed that we allocate a temporary buffer needlessly
> and pass an always-false bool argument.
> 
> So fold this into the calling function and fill dst buffer directly.
> 
> Compile tested only.

Actually, whilst thanks are due for doing the work - it looks nicer now - I'm
told that there's not really any point populating the list.  Current OpenAFS
ignores it, as does AuriStor - and IBM AFS 3.6 will do the right thing.

The list is actually useless as it's the client's view of the world, not the
servers, so if there's any NAT in the way its contents are invalid.  Further,
it doesn't support IPv6 addresses.

On that basis, feel free to make it an empty list and remove all the interface
enumeration.

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
