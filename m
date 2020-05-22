Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 326101DF327
	for <lists+linux-afs@lfdr.de>; Sat, 23 May 2020 01:44:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2khjRGS9HV24y9dXaZQyDkPnBfgk/4x2VEHcAl1+jE=; b=QefLV5zAjDun9b
	BzrPz2ZIZubTCV2wHla4eZXhc5uc7wB+mosHutMqkm5pGGT85fVWj7AzVdNl9OjzRu+CZeAl2ljmK
	Gss9csASejisk2tSNWxLkqZA8VVvO9caci7Hs7uYtF3Wfolhr5zN8Dlt0aZcwYZj+xDQB4O5p94l6
	i24KEHLVnZeVdCLhzE18qxH/pELBHvmhiTeUxTY3RYvqzo/lLUk779OtjshG44WfZkFiV6VJWl5vQ
	Mh2S3Fc/t4ZEM03+pxKJHsA1A/hCJPQUgtMfbM/H0tl3zK0zoi+Z61PkcMfO79Z35Swst5+ed/ptz
	D/uN4KRy5PFTU6MKYIsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcHKy-0000X9-0k; Fri, 22 May 2020 23:44:24 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcHKu-0000U5-Pr
 for linux-afs@lists.infradead.org; Fri, 22 May 2020 23:44:22 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 5782D12758B4E;
 Fri, 22 May 2020 16:44:14 -0700 (PDT)
Date: Fri, 22 May 2020 16:44:13 -0700 (PDT)
Message-Id: <20200522.164413.927439877039263502.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net 0/2] rxrpc: Fix a warning and a leak [ver #2]
From: David Miller <davem@davemloft.net>
In-Reply-To: <159019095229.999797.5088700147400532632.stgit@warthog.procyon.org.uk>
References: <159019095229.999797.5088700147400532632.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 22 May 2020 16:44:14 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_164420_855251_D0A9166B 
X-CRM114-Status: UNSURE (   7.00  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
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
Cc: netdev@vger.kernel.org, Markus.Elfring@web.de,
 linux-afs@lists.infradead.org, wu000273@umn.edu, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>
Date: Sat, 23 May 2020 00:42:32 +0100

> 
> Here are a couple of fixes for AF_RXRPC:
> 
>  (1) Fix an uninitialised variable warning.
> 
>  (2) Fix a leak of the ticket on error in rxkad.
> 
> The patches are tagged here:
> 
> 	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
> 	rxrpc-fixes-20200523-v2

Pulled, thanks.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
