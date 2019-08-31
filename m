Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 398B2A4569
	for <lists+linux-afs@lfdr.de>; Sat, 31 Aug 2019 18:45:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/r+jvl4dxeCsNG665c1JzKcMbUNt74VUJuanjEIevY=; b=hxZISacCAtTKOK
	PDdMs8JIjI8TOrDoG1jJWH4/rurt2N+rOvCMlMaU+NURZg9BiVGduIYurdQvxVyqaV1dhT2B6FJxA
	tnq2deGGEyPN0QXoDj8tVwqA94cpDW1pa5ZtHrPwma99PLGwWifPbX/nRMbqnqXTWZ6CUwStE3hZE
	UxVzImJTpHWCHgNMx4j6Ejx0BrrRrFLUfe7V8PdQIOvh1t7jrETubQwBCo7ow7HGOvHoHCZgqz2fF
	hy0mvLNjveV/evBfnIjelguZt5yNtzLyLgncFz+qujLHXCk6PJ4pJ6zFJNv5DB18FMb8RBq+HRwp+
	QLiQ6sggoklnWtPPlDSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i46VQ-0000Zv-LC; Sat, 31 Aug 2019 16:45:40 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i46VN-0000Z9-RU
 for linux-afs@lists.infradead.org; Sat, 31 Aug 2019 16:45:39 +0000
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 697273082DDD;
 Sat, 31 Aug 2019 16:45:35 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F27475D6A5;
 Sat, 31 Aug 2019 16:45:33 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190831135906.6028-1-hdanton@sina.com>
References: <20190831135906.6028-1-hdanton@sina.com>
To: Hillf Danton <hdanton@sina.com>
Subject: Re: [PATCH net] rxrpc: Fix lack of conn cleanup when local endpoint
 is cleaned up [ver #2]
MIME-Version: 1.0
Content-ID: <8377.1567269933.1@warthog.procyon.org.uk>
Date: Sat, 31 Aug 2019 17:45:33 +0100
Message-ID: <8378.1567269933@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Sat, 31 Aug 2019 16:45:35 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190831_094537_913370_1EB68D2A 
X-CRM114-Status: GOOD (  11.50  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
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
Cc: dhowells@redhat.com, netdev@vger.kernel.org, linux-afs@lists.infradead.org,
 marc.dionne@auristor.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hillf Danton <hdanton@sina.com> wrote:

> > -		if (rxnet->live) {
> > +		if (rxnet->live && !conn->params.local->dead) {
> >  			idle_timestamp = READ_ONCE(conn->idle_timestamp);
> >  			expire_at = idle_timestamp + rxrpc_connection_expiry * HZ;
> >  			if (conn->params.local->service_closed)
> 
> Is there any chance out there that this reaper starts running one minute
> after the dead local went into graveyard?

It's certainly possible that that can happen.  The reaper is per
network-namespace.

conn->params.local holds a ref on the local endpoint.

It may be worth wrapping the "local->dead = true;" in rxrpc_local_destroyer()
in rxnet->conn_lock.

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
