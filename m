Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F2C1DF302
	for <lists+linux-afs@lfdr.de>; Sat, 23 May 2020 01:33:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODeTe1sQM/2UIieYtwbqUpdbe0q+TzeqrIBKON6EehY=; b=hZF5Ckemb2R68S
	6XX/bop3Mp5L8MhNMh7687RRc2eOjE7yITX55o3jrfqbhRaVXHMSfL5/cDRKgUrt1I+IzDzY2uzKC
	8zxb5YI5b1MXUXXsy/m0ulY9HpBFoWu4zAdRu+iF2BilBcnRUJJ2bhONlHxgc6jdxW/J/uvniyaqd
	SklkE0QIjm5sUY9TrI2QU42VbT3yzD9mbm9LX4tB6ax9g3+9iCmj49I0Iq84jmsYdLk+3MTlv5J4A
	t8xMZ0zmX/Q4EatjAsgvtJWye564JAzg1xuUm/WvPcxT5y4OcV+eri8KeD2YNgHRxNSUBmpk2UF5j
	NMwv6J/P/PSLl8EzsDHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcHAA-0002f1-Ua; Fri, 22 May 2020 23:33:14 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcHA8-0002eh-Bk
 for linux-afs@lists.infradead.org; Fri, 22 May 2020 23:33:13 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 4D11712751C5A;
 Fri, 22 May 2020 16:33:11 -0700 (PDT)
Date: Fri, 22 May 2020 16:33:10 -0700 (PDT)
Message-Id: <20200522.163310.591969005159684961.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net 0/3] rxrpc: Fix retransmission timeout and ACK discard
From: David Miller <davem@davemloft.net>
In-Reply-To: <997165.1590190006@warthog.procyon.org.uk>
References: <20200522.155418.406408375053374516.davem@davemloft.net>
 <159001690181.18663.663730118645460940.stgit@warthog.procyon.org.uk>
 <997165.1590190006@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 22 May 2020 16:33:11 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_163312_401282_890C93E9 
X-CRM114-Status: UNSURE (   6.00  )
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
Cc: netdev@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>
Date: Sat, 23 May 2020 00:26:46 +0100

> David Miller <davem@davemloft.net> wrote:
> 
>> Pulled, thanks David.
> 
> Thanks.  I'll rebase my two extra patches I've just sent you a pull request
> for when you've updated the branch.

Please respin and fix the Subject line of patch #2 to have a correct
rxrpc: prefix.

Thanks.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
