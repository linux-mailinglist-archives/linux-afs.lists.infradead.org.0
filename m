Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E68A401C
	for <lists+linux-afs@lfdr.de>; Sat, 31 Aug 2019 00:07:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTOSGuDptAzHzk0DW3rbkF57Anvb2iRQ8+/Js0EjFfs=; b=U+EQWLIJgujGCE
	hyThrusrK6c1Sfd0uNNdBqSHI6vMRIrlyChdJ1s0dkuhPYnxocL3GFN3uOXQtaVUQGfRYxy7m1BeA
	58oOU15/a/avMwEjkcTpe8zsVKDx1mGyMXC90Su4G7lLe7XGiOs2eMT6seITki+ZDNG6m96Djj2m4
	+JvTJuzbfQUdkEMbEn2RbNFxkhKJRqw3A5VzsETdmDWt9S2W4rm4vmBuha2SS/UD9/q7oPIg+SdnY
	JC780FEaZjzX5bMi9xWXVhL0ArVNUtTAPYl9MHdvy2g7ZnzF/m5GPA7a4ujXbk6YOPJUCdi2lNwTv
	p8WJ/XCqAu7Iyfz7atKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3p33-0007vE-EY; Fri, 30 Aug 2019 22:07:13 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3p30-0007us-KI
 for linux-afs@lists.infradead.org; Fri, 30 Aug 2019 22:07:11 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 35B5E154FFAFD;
 Fri, 30 Aug 2019 15:07:10 -0700 (PDT)
Date: Fri, 30 Aug 2019 15:07:09 -0700 (PDT)
Message-Id: <20190830.150709.478421783835117542.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net] rxrpc: Fix lack of conn cleanup when local
 endpoint is cleaned up [ver #2]
From: David Miller <davem@davemloft.net>
In-Reply-To: <156708433176.26714.15112030261308314860.stgit@warthog.procyon.org.uk>
References: <156708433176.26714.15112030261308314860.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 30 Aug 2019 15:07:10 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190830_150710_670004_7DAB8746 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
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
Cc: marc.dionne@auristor.com, netdev@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>
Date: Thu, 29 Aug 2019 14:12:11 +0100

> When a local endpoint is ceases to be in use, such as when the kafs module
> is unloaded, the kernel will emit an assertion failure if there are any
> outstanding client connections:
> 
> 	rxrpc: Assertion failed
> 	------------[ cut here ]------------
> 	kernel BUG at net/rxrpc/local_object.c:433!
> 
> and even beyond that, will evince other oopses if there are service
> connections still present.
> 
> Fix this by:
 ...
> Only after destroying the connections can we close the socket lest we get
> an oops in a workqueue that's looking at a connection or a peer.
> 
> Fixes: 3d18cbb7fd0c ("rxrpc: Fix conn expiry timers")
> Signed-off-by: David Howells <dhowells@redhat.com>
> Tested-by: Marc Dionne <marc.dionne@auristor.com>

Applied.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
