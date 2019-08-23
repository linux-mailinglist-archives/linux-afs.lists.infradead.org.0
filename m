Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E92D9B828
	for <lists+linux-afs@lfdr.de>; Fri, 23 Aug 2019 23:29:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ugfUM0ryDKFga/yEBTPh/pOGWxJtVtmIdiNQsoaSK3o=; b=SfXColkgHkyA9f
	GOUEQYpDk2US122RyI/70zW/TitdEecuvq6N9PQc811eZRheXviWRdPiv5uj9x7WQAWh1BPgbe1uh
	mngCiC0MAeKSkFPcVMDPG2FLrvh3/XyxqKLCRlpGSPURm0Iw5mQIt+W5cY/zwhp0tjEzljQFrDoHh
	KUPjYBPdAV5x03v8170miaDCc181PSqPt0BQjmWJ3Ak8OenpwuDAFclkOqabsVL2ur5DnAL19ITlQ
	9XeFRQtQwZrv1j+K772APFHml5J6Sxt0WBr5/aU8wUcT66L/XOxAEWevreGDH26XqDC3GM8es+WOP
	gI5IryVo9hzQOu8fSZhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1H7n-0004hg-Ax; Fri, 23 Aug 2019 21:29:35 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1H7k-0004Wf-UV
 for linux-afs@lists.infradead.org; Fri, 23 Aug 2019 21:29:34 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 08D2E1543B283;
 Fri, 23 Aug 2019 14:29:28 -0700 (PDT)
Date: Fri, 23 Aug 2019 14:29:16 -0700 (PDT)
Message-Id: <20190823.142916.238167013292929213.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net 0/9] rxrpc: Fix use of skb_cow_data()
From: David Miller <davem@davemloft.net>
In-Reply-To: <27348.1566550348@warthog.procyon.org.uk>
References: <20190822.121207.731320146177703787.davem@davemloft.net>
 <156647655350.10908.12081183247715153431.stgit@warthog.procyon.org.uk>
 <27348.1566550348@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 23 Aug 2019 14:29:28 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_142932_986925_D2527577 
X-CRM114-Status: UNSURE (   4.40  )
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
Date: Fri, 23 Aug 2019 09:52:28 +0100

> Question for you: how likely is a newly received buffer, through a UDP socket,
> to be 'cloned'?

Very unlikely, I'd say.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
