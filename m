Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C0A751D1
	for <lists+linux-afs@lfdr.de>; Thu, 25 Jul 2019 16:52:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4udw5XTpKytXqOglYyAiNTafmXZK8CgnCnMwYgPMfb0=; b=IO3QatgP9gm1rv
	M+bCunLj4WgqCJoolz8/JHAkabOsyiG0oEdaVX+JbsDNT8BeYqrLuyLBwyoLlUO+tVnYixjMD2B7h
	1m9Ukr7rKXI1pmhfO8BGb65o+bljHelzl8j1BzBlK7iGgLJPyH0QrWT8ou6l9eZpswrh3kl10RDXS
	sl8Voh8FgCrsVrW7ZwUdWr8WR13TbRbUmVCBUmQ7/0zzWGBEbreX+wp6TVA0hxPK9YvYVPyMfTQYJ
	QjQL3zT5Ea+DHC41b+amYR//wxMj8QCw3YVeLxcf9iIhded0I/slcxDLL0mE2CJC0JK2dcKFLGHky
	vfaAFSe30To15stiW7BA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqf6d-00012X-I7; Thu, 25 Jul 2019 14:52:31 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqf6b-00011p-7M
 for linux-afs@lists.infradead.org; Thu, 25 Jul 2019 14:52:30 +0000
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 96327C024AF3;
 Thu, 25 Jul 2019 14:52:28 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-49.rdu2.redhat.com
 [10.10.120.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D36F5F9DD;
 Thu, 25 Jul 2019 14:52:27 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAK8P3a23gnvxA3PcvFy5wadNGoCPRH7PUEY_dqJ+bk3uH5=t+g@mail.gmail.com>
References: <CAK8P3a23gnvxA3PcvFy5wadNGoCPRH7PUEY_dqJ+bk3uH5=t+g@mail.gmail.com>
 <156406148519.15479.13870345028835442313.stgit@warthog.procyon.org.uk>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH] rxrpc: Fix -Wframe-larger-than= warnings from
 on-stack crypto
MIME-Version: 1.0
Content-ID: <24570.1564066346.1@warthog.procyon.org.uk>
Date: Thu, 25 Jul 2019 15:52:26 +0100
Message-ID: <24571.1564066346@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Thu, 25 Jul 2019 14:52:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_075229_285642_70FFE922 
X-CRM114-Status: UNSURE (   8.10  )
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
Cc: dhowells@redhat.com, Networking <netdev@vger.kernel.org>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR
 CORE" <linux-crypto@vger.kernel.org>, linux-afs@lists.infradead.org,
 Herbert Xu <herbert@gondor.apana.org.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Would you rather this went through net or net-next?

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
