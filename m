Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 559F1A46BE
	for <lists+linux-afs@lfdr.de>; Sun,  1 Sep 2019 04:05:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4d/v3Io5e6qe0RUcceBCZ9+GVZe8JA1jc5zl0AK8fEM=; b=et+Cs9HbztwL2k
	hzvn04S/RZ24BLgx80+Tn5grwn4PXSRNKa6mYlteyGBOwdizVfukyNY/VCMHT2WZDmZK8ihrZaRnq
	CZiaw8t/NxoC6uX6QheFw8dspSSlq50MtJ2OAPns85XVy64wjQl9LTc6qdK7ode4PLajF83+TTbXW
	nqpN8HTrlHFyzTvo8ysiNYVYiy11seLOUHfkgaI+7lAHpi+0oClLZ9uDCyeg2U7f8Y6stqfijS9qK
	UpfPm3gaWBYao4Mz1vMMV4EkuNDYMpGz19Pwfks4zEeu7LbYvDC9WVUkP73nrBL9U7PiYWRJ4J1xO
	0oBMGiERfAsy6U+4uGKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4FFP-0002gB-DN; Sun, 01 Sep 2019 02:05:43 +0000
Received: from r3-18.sinamail.sina.com.cn ([202.108.3.18])
 by bombadil.infradead.org with smtp (Exim 4.92 #3 (Red Hat Linux))
 id 1i4FFL-0002fX-Bn
 for linux-afs@lists.infradead.org; Sun, 01 Sep 2019 02:05:41 +0000
Received: from unknown (HELO localhost.localdomain)([114.254.173.51])
 by sina.com with ESMTP
 id 5D6B27690002B2F5; Sun, 1 Sep 2019 10:05:30 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 99818715078544
From: Hillf Danton <hdanton@sina.com>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH net] rxrpc: Fix lack of conn cleanup when local endpoint
 is cleaned up [ver #2]
Date: Sun,  1 Sep 2019 10:05:19 +0800
Message-Id: <20190901020519.2392-1-hdanton@sina.com>
In-Reply-To: <20190831135906.6028-1-hdanton@sina.com>
References: <20190831135906.6028-1-hdanton@sina.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190831_190539_612060_2B1A0033 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (hdanton[at]sina.com)
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
Cc: marc.dionne@auristor.com, netdev@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


On Sat, 31 Aug 2019 17:45:33 +0100 David Howells <dhowells@redhat.com>
> Hillf Danton <hdanton@sina.com> wrote:
> 
> > > -		if (rxnet->live) {
> > > +		if (rxnet->live && !conn->params.local->dead) {
> > >  			idle_timestamp = READ_ONCE(conn->idle_timestamp);
> > >  			expire_at = idle_timestamp + rxrpc_connection_expiry * HZ;
> > >  			if (conn->params.local->service_closed)
> > 
> > Is there any chance out there that this reaper starts running one minute
> > after the dead local went into graveyard?
> 
> It's certainly possible that that can happen.  The reaper is per
> network-namespace.
> 
> conn->params.local holds a ref on the local endpoint.
> 
Then local endpoint can not become dead without connection reaper
running first, because of the ref held by connection. When it is
dead, however, there is no need to run reaper directly (rather than
through a workqueue).

> It may be worth wrapping the "local->dead = true;" in rxrpc_local_destroyer()
> in rxnet->conn_lock.
> 
> David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
