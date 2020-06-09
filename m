Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EE31F323B
	for <lists+linux-afs@lfdr.de>; Tue,  9 Jun 2020 04:14:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvxBKp9Ngj2oCbYEc3xF8ps+8541SJZ4maq+Bvc9q90=; b=YxS3sAxSbEJt9+
	ChokEG4U+Q0pEcIym+Y1et0Gp8ZcrW6EieW3ER4zNrHptnt+LNTOPDmdlcfpIsdeowGahvH8srfMX
	WC5KyiQhltfwdKWl5e1tzLLG/hkRKpA/ov8+aGikziFQZ10bXG9WkbazVQMdBIuYYwJRxBeOVLDy2
	nWXKf6jsHUGGGEwZS+NIsUEUvJ3T5JUnZT7WDTH8nWXd7YzsUhgUjGMGUwGotG3eMYvZ63NY6IXqk
	WeaF1DaW0gamiKu7P9Vzki7tIvzakJNJkC7lXU5IwVtI8/f6//tbQxn0NgF8Wv6d52cowGhL0KI59
	7GlENwSvmMllm61POsgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiTm1-00025l-H6; Tue, 09 Jun 2020 02:13:57 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiTlz-00025R-IE
 for linux-afs@lists.infradead.org; Tue, 09 Jun 2020 02:13:56 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 2E6AF128A6AEC;
 Mon,  8 Jun 2020 19:13:54 -0700 (PDT)
Date: Mon, 08 Jun 2020 19:13:53 -0700 (PDT)
Message-Id: <20200608.191353.1433508565956506007.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net 0/2] rxrpc: Fix hang due to missing notification
From: David Miller <davem@davemloft.net>
In-Reply-To: <159164218727.2758133.1046957228494479308.stgit@warthog.procyon.org.uk>
References: <159164218727.2758133.1046957228494479308.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 08 Jun 2020 19:13:54 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_191355_601670_96A3A39D 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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
Cc: marc.dionne@auristor.com, netdev@vger.kernel.org, gerry@auristor.com,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>
Date: Mon, 08 Jun 2020 19:49:47 +0100

> Here's a fix for AF_RXRPC.  Occasionally calls hang because there are
> circumstances in which rxrpc generate a notification when a call is
> completed - primarily because initial packet transmission failed and the
> call was killed off and an error returned.  But the AFS filesystem driver
> doesn't check this under all circumstances, expecting failure to be
> delivered by asynchronous notification.
> 
> There are two patches: the first moves the problematic bits out-of-line and
> the second contains the fix.
> 
> The patches are tagged here:
> 
> 	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
> 	rxrpc-fixes-20200605

Pulled, thanks David.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
