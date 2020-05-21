Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 042A91DC36E
	for <lists+linux-afs@lfdr.de>; Thu, 21 May 2020 02:12:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v+7KHyk5n4HYYUv5NdWSiz7ZAA5gG9Pa0CUUoKxfaDI=; b=W//IDNbQevOyvi
	4u/b8a5btLmRRWdO1SikbJ3T43fLKP+I80XdumqLDlqvuHapaaTtFjQsASG80yaOksRRgnW9Yetm0
	1wwAkOmFD6aDKcMTY5O3MD1GWgdD3aokVvUCsKqSX7AsMZSUIpZpvvSvD4LcoP7JsC+RbQvi5PjEn
	is97+tpqoX1xwLEm8v1G4zwuTyeB/KSHL0gqwYyTeQytoYkd0KXcGXv+BhJEOPmR6Yf8I/HLIkAX5
	HLJYEeff0kowNBiPj2iBjGCCqaSCrMAO+x/yCrK+vR6eQvMCnzyIoCzWNS+cUAzE16CU+haDFIN6+
	qqH0FHldwwn0OMFxJA8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbYoM-0000Ai-1Z; Thu, 21 May 2020 00:11:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbYne-0007yy-Uj
 for linux-afs@lists.infradead.org; Thu, 21 May 2020 00:11:04 +0000
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 90C542075F;
 Thu, 21 May 2020 00:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590019861;
 bh=8eIfE1itBSEOZ9OXLTe/icTIY4KBnTHvfRYvjcl9zbs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vOBCH45x2pxD81nIiPP9Gwt0lutnHnW66gO9+cHmQ/YKkdN8L7dVihQPXqs5dYM6B
 vir7SCtg7XCQ38YDbY9/gJ1+cgaHAsSC1kIM0QKzWaDbPSKwL5uSrpwltfF+2U9Mly
 gO/r3jT6f/YWqHkp0bqS7Rl7q/b2xrmY3gUQLggo=
Date: Wed, 20 May 2020 17:11:00 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH net 1/3] rxrpc: Fix the excessive initial retransmission
 timeout
Message-ID: <20200520171100.46482c16@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <159001690903.18663.2345549941598300103.stgit@warthog.procyon.org.uk>
References: <159001690181.18663.663730118645460940.stgit@warthog.procyon.org.uk>
 <159001690903.18663.2345549941598300103.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_171103_044404_EA61313E 
X-CRM114-Status: UNSURE (   6.68  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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

On Thu, 21 May 2020 00:21:49 +0100 David Howells wrote:
> Fixes: 17926a79320a ([AF_RXRPC]: Provide secure RxRPC sockets for use by userspace and kernel both"")
> Signed-off-by: David Howells <dhowells@redhat.com>

FWIW

Fixes tag: Fixes: 17926a79320a ([AF_RXRPC]: Provide secure RxRPC sockets for use by userspace and kernel both"")
Has these problem(s):
	- Subject does not match target commit subject
	  Just use
		git log -1 --format='Fixes: %h ("%s")'

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
