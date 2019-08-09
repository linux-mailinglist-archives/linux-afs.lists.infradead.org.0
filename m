Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 664FA8826D
	for <lists+linux-afs@lfdr.de>; Fri,  9 Aug 2019 20:27:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvLh8xUgKwBSYYS2RntU6D6YXEd5N9VZh54bDOE5CaQ=; b=n3lfOI6+VTQ8s8
	nFKtSGHJ11iyBmGTeOTdJFkCw4L+8KH9nertFuJQrBZpBe8Y/EjsHPV8GRsbsJ901LFl1Wk+mAglm
	NHYoIm7N+ZogpRddqb83ouyq1ePtiC/hWm6Q/PuLoRVrSy+Vy1hHZi0X4HW9UNWh0nJwH+0hExHrp
	B6Vktd/o1gRPzqZYzLpL2L/s1XrDqlBNvyTGhuZqQx2A/SLvBdFJ1sjD+Qt/8bPAM5cHd8sUpncXq
	VhWDkBCmMY0z3dXsA/4f0WArqkQFC5cDJLDrYmNbzdffBnTryu71NYgqpCClHAyZE86tlv0QbjUpt
	ue4YcJ4OdDoQnJkL1ETg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hw9c8-00065X-Nr; Fri, 09 Aug 2019 18:27:44 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw9c5-00065A-Ra
 for linux-afs@lists.infradead.org; Fri, 09 Aug 2019 18:27:43 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 188771264D00D;
 Fri,  9 Aug 2019 11:27:36 -0700 (PDT)
Date: Fri, 09 Aug 2019 11:27:35 -0700 (PDT)
Message-Id: <20190809.112735.75303405300623184.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net 0/2] rxrpc: Fixes
From: David Miller <davem@davemloft.net>
In-Reply-To: <156536674651.17478.15139844428920800280.stgit@warthog.procyon.org.uk>
References: <156536674651.17478.15139844428920800280.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 09 Aug 2019 11:27:36 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190809_112741_903180_FCD18F49 
X-CRM114-Status: UNSURE (   6.77  )
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
Date: Fri, 09 Aug 2019 17:05:46 +0100

> Here's a couple of fixes for rxrpc:
> 
>  (1) Fix refcounting of the local endpoint.
> 
>  (2) Don't calculate or report packet skew information.  This has been
>      obsolete since AFS 3.1 and so is a waste of resources.
> 
> The patches are tagged here:
> 
> 	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
> 	rxrpc-fixes-20190809

Pulled, thanks David.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
