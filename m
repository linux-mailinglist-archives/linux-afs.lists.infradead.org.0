Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A01E8CC480
	for <lists+linux-afs@lfdr.de>; Fri,  4 Oct 2019 22:59:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7tEkufMzZ2dUe62gMqvKNKzBb9c67qT/v7EJLsbdwU=; b=DQhENl+qzvSSqe
	1Y3tLxablduRzMjmrAxCKhu/XcvpLY3JSNrZyPbcRu6jrZhnQWKseFwxUl1a1Evh5s8jaZqNDOWsh
	jDFMWJV/47dMRQf/6+4GOcOfMfj1vNHW7dLKGR6VMQGghHKo6qOg0WQu6sZEjs+I6JlN4IpH9IpMY
	jFwcSZ9Ute5TYBCKxQNUoCzDRJxPd0uKKR7tS+QCPBCA47PtgxTFL0vPzhtRN6b0FBNnVx1UeYcrp
	5Y0odwylCUrMZ5LKOHVF7UvEhNpc7b4ka5Z3EAP+IqYzojtV5Wk8PTyQUQ/FxLER4tqRbnjpcxv5j
	diP60OKC2TVKu6W5KV7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGUfI-0002px-K4; Fri, 04 Oct 2019 20:59:04 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGUfG-0002pe-Hb
 for linux-afs@lists.infradead.org; Fri, 04 Oct 2019 20:59:03 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 3DDE614EC3094;
 Fri,  4 Oct 2019 13:59:02 -0700 (PDT)
Date: Fri, 04 Oct 2019 13:59:01 -0700 (PDT)
Message-Id: <20191004.135901.2236530388885343464.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net-next] rxrpc: Add missing "new peer" trace
From: David Miller <davem@davemloft.net>
In-Reply-To: <157012115701.21124.13973726693523106899.stgit@warthog.procyon.org.uk>
References: <157012115701.21124.13973726693523106899.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 04 Oct 2019 13:59:02 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_135902_585433_A903392C 
X-CRM114-Status: UNSURE (   5.79  )
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
Cc: netdev@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>
Date: Thu, 03 Oct 2019 17:45:57 +0100

> There was supposed to be a trace indicating that a new peer had been
> created.  Add it.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>

Applied.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
