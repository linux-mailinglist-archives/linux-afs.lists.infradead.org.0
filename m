Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C737A9652
	for <lists+linux-afs@lfdr.de>; Thu,  5 Sep 2019 00:25:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4T2/zhyM4w2StQncCPBVfoEJsdhvMNzAtjzBHy5Cp38=; b=AX5j3uVITdj0c3
	A3iMu7oLmIEikQ2LeM8uun6Kw7B4cZl1Qaz5Cj+zzOSMkRg3b7N+OTx+Pil9iDPD8CFYNoENlxTu/
	+k2/kioiqa9qT2kXsn0vkdm1pyAb0WY4p/yeD4p0XS4MmGGM75wED7AbkT641mF0VmbEbjlPHlOmF
	bperyTgkzWhhDRcO0Z9Pr/X/PJmQJJwfiJsU+PHsK15TRCN+3Q1/o2BFxoMMINsfmUaDDALHUaBNe
	5MpD8+tH+PKmdkHu2gsMr2Zu36n1BYOhoGrdOwSHMbgvGzsqfVyITV8ZA6ALeoRIY6nE1hBgsfR3t
	sy+mPRYAbi+zTlrH5Amg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5dif-0000Aw-En; Wed, 04 Sep 2019 22:25:41 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5dic-0000AI-IU
 for linux-afs@lists.infradead.org; Wed, 04 Sep 2019 22:25:39 +0000
Received: from localhost (unknown [62.21.130.100])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id D735B15285FEA;
 Wed,  4 Sep 2019 15:25:33 -0700 (PDT)
Date: Wed, 04 Sep 2019 15:25:32 -0700 (PDT)
Message-Id: <20190904.152532.1998977195554205249.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net] rxrpc: Fix misplaced traceline
From: David Miller <davem@davemloft.net>
In-Reply-To: <156742044878.3320.3639294965607016931.stgit@warthog.procyon.org.uk>
References: <156742044878.3320.3639294965607016931.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.2
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 04 Sep 2019 15:25:35 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190904_152538_614861_18698B35 
X-CRM114-Status: UNSURE (   6.78  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 3.6 (+++)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (3.6 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 3.6 RCVD_IN_SBL_CSS        RBL: Received via a relay in Spamhaus SBL-CSS
 [62.21.130.100 listed in zen.spamhaus.org]
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
Cc: netdev@vger.kernel.org, hdanton@sina.com, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>
Date: Mon, 02 Sep 2019 11:34:08 +0100

> There's a misplaced traceline in rxrpc_input_packet() which is looking at a
> packet that just got released rather than the replacement packet.
> 
> Fix this by moving the traceline after the assignment that moves the new
> packet pointer to the actual packet pointer.
> 
> Fixes: d0d5c0cd1e71 ("rxrpc: Use skb_unshare() rather than skb_cow_data()")
> Reported-by: Hillf Danton <hdanton@sina.com>
> Signed-off-by: David Howells <dhowells@redhat.com>

Applied.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
