Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C8C89615
	for <lists+linux-afs@lfdr.de>; Mon, 12 Aug 2019 06:22:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qe8OGRQeGs4KfoPq8/zHpOdiIYWu+CkEIrf9FDF5DU0=; b=id93wkpS1FkLsc
	qGfReSoCNuZwkyZlkeg54kvbNdmRQ0rLcZZkZvOPdCOW5GxSvy3r4fbljvw6LmpMp44wa+E0OZV0P
	WvjKiol4rl0DEcQVTYTEv0GFQNevLtSEHOP3huxXw4ZzltgZrFfj3xGwmXzbUWa3Vsi6ZwEGT5YBZ
	KnJHjRpkZxZSiGvfl1KLcq057Q84j61teKV5MfDlyjlDEd1vBhiV/xZGbac3LV1ghwyHxaTTq/crM
	dSLrBG751FkxKCK8VKF64dXlCqjiyY4dRpcwIJGdle2lj4H9ZIKyUsjF/1MovZS/M280A9yOPqTvE
	QueoEDIiMHkKcHL7KO4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx1qv-00055R-Hp; Mon, 12 Aug 2019 04:22:37 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx1qo-0004zB-6a
 for linux-afs@lists.infradead.org; Mon, 12 Aug 2019 04:22:31 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 3F51714522F17;
 Sun, 11 Aug 2019 21:22:23 -0700 (PDT)
Date: Sun, 11 Aug 2019 21:22:22 -0700 (PDT)
Message-Id: <20190811.212222.1922285162572379435.davem@davemloft.net>
To: colin.king@canonical.com
Subject: Re: [PATCH][net-next] rxrpc: fix uninitialized return value in
 variable err
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190809170259.29859-1-colin.king@canonical.com>
References: <20190809170259.29859-1-colin.king@canonical.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Sun, 11 Aug 2019 21:22:23 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190811_212230_468636_73BAD0BE 
X-CRM114-Status: UNSURE (   5.94  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
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
Cc: dhowells@redhat.com, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: Colin King <colin.king@canonical.com>
Date: Fri,  9 Aug 2019 18:02:59 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> An earlier commit removed the setting of err to -ENOMEM so currently
> the skb_shinfo(skb)->nr_frags > 16 check returns with an uninitialized
> bogus return code.  Fix this by setting err to -ENOMEM to restore
> the original behaviour.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: b214b2d8f277 ("rxrpc: Don't use skb_cow_data() in rxkad")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

David, I assume you will pick this up.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
