Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DB499F8B
	for <lists+linux-afs@lfdr.de>; Thu, 22 Aug 2019 21:12:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Fl7QIJPULI/VRv8AXPqwklhO3PwE/crNUbTMoKustQ=; b=S8EVsh/00r+g6S
	I54KEdZNi05tHa+FggJ25vnjTv44qHFoXzWu9sqVsAPrwZFyCm0w7u5PSVb7074ZLr8Q6pu+fCqgb
	vxhX9RtJ8hRfyqqoURzTi425P6ACSEE61FxkL0vGHPuz8wAc8CRpVSMElgEa38U2Karhe3cM6XlMu
	CEscjKH1vxFLwtfOPzJFnHqxEBw5unZJ1THMJxXnkdz50vS8cBUTR2uz1DKN0hNGz/Vohnbvez3F3
	wJL/5RfgoD92KY9CmRq6y98ReD0Hzm9yGZQpuafryWbNXvp1bOjz210+uv3awNrCz1papzXVJvVA4
	oGWkJWSTnj6shtWoSyKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0sVJ-0000ri-Gl; Thu, 22 Aug 2019 19:12:13 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0sVH-0000qP-EB
 for linux-afs@lists.infradead.org; Thu, 22 Aug 2019 19:12:12 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 66853153410DC;
 Thu, 22 Aug 2019 12:12:08 -0700 (PDT)
Date: Thu, 22 Aug 2019 12:12:07 -0700 (PDT)
Message-Id: <20190822.121207.731320146177703787.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net 0/9] rxrpc: Fix use of skb_cow_data()
From: David Miller <davem@davemloft.net>
In-Reply-To: <156647655350.10908.12081183247715153431.stgit@warthog.procyon.org.uk>
References: <156647655350.10908.12081183247715153431.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 22 Aug 2019 12:12:08 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190822_121211_481711_E405BF8D 
X-CRM114-Status: UNSURE (   7.19  )
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
Date: Thu, 22 Aug 2019 13:22:33 +0100

> Here's a series of patches that fixes the use of skb_cow_data() in rxrpc.
> The problem is that skb_cow_data() indirectly requires that the maximum
> usage count on an sk_buff be 1, and it may generate an assertion failure in
> pskb_expand_head() if not.

It sounds like you are effectively doing a late unshare when you have to
do in-place encryption.

Why don't you just do an skb_unshare() at the beginning when you know that
you'll need to do that?

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
