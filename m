Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0002F34025
	for <lists+linux-afs@lfdr.de>; Tue,  4 Jun 2019 09:31:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2jPZI/JsChjzCQvWKiatGxHbYNQyrS5fLINYB4LIG3c=; b=RHDXejJH7OeGUo
	t5XlQ1gSvGTl9sNQpGCJzULzndFlcIh23sOz7T6CTpoNwns/Dj8d0W9gYYwD6H8KSgvXide5blqmj
	hVH2OjozX27+kBowhP4fdm6G6cSRrh/1wDcUt7EI1703Z2NrU+1xR3EijE3ZPwaLOaMOT/F8cLhe/
	Qa/+meGp5rdvR1lZIx+tdoJ9tm0z0DYrVRIMyHczYOXltryNJ9OP1/a2nE7cb1uWzHna8X+wfF/zl
	O6A8fwAK0BRvf1p0asAupThUA79WE4vX0ztBuGNljbFk3gVEi/NXZzXzohK6EJhUZb5heWDOdoevR
	r4Nc9q2MnisDW+0Wy6CQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hY3uv-0002MA-CV; Tue, 04 Jun 2019 07:31:33 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXuXm-0000a7-Jt
 for linux-afs@lists.infradead.org; Mon, 03 Jun 2019 21:31:03 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 5FACC14D41E0F;
 Mon,  3 Jun 2019 14:30:57 -0700 (PDT)
Date: Mon, 03 Jun 2019 14:30:54 -0700 (PDT)
Message-Id: <20190603.143054.1734848612616501920.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH] rxrpc: Fix uninitialized error code in
 rxrpc_send_data_packet()
From: David Miller <davem@davemloft.net>
In-Reply-To: <15499.1559298884@warthog.procyon.org.uk>
References: <20190528142424.19626-3-geert@linux-m68k.org>
 <20190528142424.19626-1-geert@linux-m68k.org>
 <15499.1559298884@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 03 Jun 2019 14:30:58 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_143102_657763_6DC3FD62 
X-CRM114-Status: UNSURE (   5.02  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Mailman-Approved-At: Tue, 04 Jun 2019 00:31:32 -0700
X-BeenThere: linux-afs@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org, arnd@arndb.de, netdev@vger.kernel.org,
 tiwai@suse.com, clemens@ladisch.de, jhs@mojatatu.com, o-takashi@sakamocchi.jp,
 linux-block@vger.kernel.org, jiri@mellanox.com, geert@linux-m68k.org,
 xiyou.wangcong@gmail.com, joe@perches.com, tahiliani@nitk.edu.in,
 mb@lightnvm.io, perex@perex.cz, eranbe@mellanox.com, dan.carpenter@oracle.com,
 igor.j.konopko@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>
Date: Fri, 31 May 2019 11:34:44 +0100

> Here's my take on the patch.

I assume I'll see a final version of this under separate cover.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
