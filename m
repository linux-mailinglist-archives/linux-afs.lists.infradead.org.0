Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 198CF119F6D
	for <lists+linux-afs@lfdr.de>; Wed, 11 Dec 2019 00:31:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OEQRCL5QEVx/pFGRb8A7t6hwZdm9KoVPOO9WBYzKbFU=; b=qgBhbybOeWUX09
	fn9V67wtFPxjuD8muJUn8CqtkXsZrvGE3u97MK0v2X0jipZUcxXJv3LWmvQhwnDKjjGw9KlP/G7ll
	cjg8i1JBV+/FrydgtG91rNmmCXJHImiwhzgeWtq5oMlc20uNfhV7z0FZR/ZSTAgVsKDP34gYazuxz
	ZLsOGxu1+tHPnowkd1ZC6JKHma+5Nh9Gkr7A7JrJxuon+ESeent+K2++pOgxWnq7Kk1zo2MlAXTGo
	s1CPdgADelKpT3LGRi0RBZq4wpHA/FdfUW6baLxDXZds9JJokGIBjqjVGgCIOWwCijvMQ4umJcot/
	H0UtINKw06izgK5FPbCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieoyU-0001P8-FO; Tue, 10 Dec 2019 23:31:26 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieo3J-0004YJ-VF
 for linux-afs@lists.infradead.org; Tue, 10 Dec 2019 22:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576017140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DIEGxaEoEqnxv3W7KxXHjyimH36onDwUaRqX3wb5gSo=;
 b=LFKPWlTe7u6TnMA7crp/fd/4aiJ6lABRNz3CfHQO7vGoSvMHROXZaTlt7fUCFNRIJWQBnl
 kTX0p9cvoKpn0QvzUotLrYME9LN5OTUrYPnHoq6Y/RcLT6d57rZjAScvJtBBRs9aOREd//
 /+GIhzqx3RljqJKr8FZrajFGZWE/6AQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-CRXAWaLROYCkocpE2NuCbA-1; Tue, 10 Dec 2019 17:32:16 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 426DD800D41;
 Tue, 10 Dec 2019 22:32:15 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-250.rdu2.redhat.com
 [10.10.120.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 818A45D9C5;
 Tue, 10 Dec 2019 22:32:13 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20191210220523.28540-1-dave@stgolabs.net>
References: <20191210220523.28540-1-dave@stgolabs.net>
 <20191210193011.GA11802@worktop.programming.kicks-ass.net>
To: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH] Revert "locking/mutex: Complain upon mutex API misuse in
 IRQ contexts"
MIME-Version: 1.0
Content-ID: <24324.1576017132.1@warthog.procyon.org.uk>
Date: Tue, 10 Dec 2019 22:32:12 +0000
Message-ID: <24325.1576017132@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: CRXAWaLROYCkocpE2NuCbA-1
X-Mimecast-Spam-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_143222_209203_C7668A35 
X-CRM114-Status: GOOD (  11.72  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [207.211.31.81 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Tue, 10 Dec 2019 15:31:25 -0800
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
Cc: Davidlohr Bueso <dbueso@suse.de>, peterz@infradead.org,
 linux-kernel@vger.kernel.org, dhowells@redhat.com, mingo@redhat.com,
 linux-fsdevel@vger.kernel.org, tglx@linutronix.de, will@kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Davidlohr Bueso <dave@stgolabs.net> wrote:

> This ended up causing some noise in places such as rxrpc running in softirq.
> 
> The warning is misleading in this case as the mutex trylock and unlock
> operations are done within the same context; and therefore we need not
> worry about the PI-boosting issues that comes along with no single-owner
> lock guarantees.
> 
> While we don't want to support this in mutexes, there is no way out of
> this yet; so lets get rid of the WARNs for now, as it is only fair to
> code that has historically relied on non-preemptible softirq guarantees.
> In addition, changing the lock type is also unviable: exclusive rwsems
> have the same issue (just not the WARN_ON) and counting semaphores
> would introduce a performance hit as mutexes are a lot more optimized.
> 
> This reverts commit 5d4ebaa87329ef226e74e52c80ac1c62e4948987.
> 
> Signed-off-by: Davidlohr Bueso <dbueso@suse.de>

Tested-by: David Howells <dhowells@redhat.com>


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
