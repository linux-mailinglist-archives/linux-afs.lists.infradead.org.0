Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 16061CC47D
	for <lists+linux-afs@lfdr.de>; Fri,  4 Oct 2019 22:58:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N10jCLAKVJfZczJR5yMYldeKMQjtyPdrr2qPOBhY2os=; b=IQB2tQ9cQRsuJx
	OMpKXfgDt1PupPxFa/dLsaIQadhQiOIg9m6uTvBJngyMIK2WZU47VzgKja1Odic9sdom969CQ+GKO
	hx4lXIXBdIo4ynB2ZuB3wLN4lmPm82HX45N8tRvhQ8CUANITHKyIhJcCmy+PAgLkEmVG/suSkHUJ5
	qHVoipVImNscVJycTclMHTPHGRDt10W0Thf1W7iTvpHKkl1YPamiXxmnR+BTG7F1Gugy94CxU9zk/
	UdqS241ZHjEJX7S7RLWbcXb9lGLbFdVrpd1AymJSVH6SYsV2K2+m/Ic6+LQDckBdl4IV4f+KRcSJZ
	3jzYwhsl0r706nfpVGeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGUeU-0002mu-DP; Fri, 04 Oct 2019 20:58:14 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGUeS-0002m5-BO
 for linux-afs@lists.infradead.org; Fri, 04 Oct 2019 20:58:13 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 9EBF714EC308F;
 Fri,  4 Oct 2019 13:58:08 -0700 (PDT)
Date: Fri, 04 Oct 2019 13:58:08 -0700 (PDT)
Message-Id: <20191004.135808.1163821632992434445.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net] rxrpc: Fix rxrpc_recvmsg tracepoint
From: David Miller <davem@davemloft.net>
In-Reply-To: <157012108434.20904.8998254800982940866.stgit@warthog.procyon.org.uk>
References: <157012108434.20904.8998254800982940866.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 04 Oct 2019 13:58:08 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_135812_406244_F2A7E336 
X-CRM114-Status: UNSURE (   5.42  )
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
Date: Thu, 03 Oct 2019 17:44:44 +0100

> Fix the rxrpc_recvmsg tracepoint to handle being called with a NULL call
> parameter.
> 
> Fixes: a25e21f0bcd2 ("rxrpc, afs: Use debug_ids rather than pointers in traces")
> Signed-off-by: David Howells <dhowells@redhat.com>

Applied and queued up for -stable, thanks David.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
