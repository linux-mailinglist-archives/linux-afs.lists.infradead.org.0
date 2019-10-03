Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 351B7CFCB6
	for <lists+linux-afs@lfdr.de>; Tue,  8 Oct 2019 16:46:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3yltljSILb0iKorTIPBysNXpDsQmv903UrOouZcbuzQ=; b=m+A9EzKJ7NvOLm
	2UyZvoaVqwPXmbVghpewWVxXVT1ZPTMYctxWk4EaIb8DlgpSLYwyn8TU4sL7MsH3b8jaVj3N1A7PD
	3r0X2feAqu3ur6veoYaUBPK3SvX0I9uFKib8/mE0cmQdyArvkZtN9C3p+hvQyKJcCYr2hsxykYUxw
	k8Y3/WjO8TBC5up8n+VjHY2BjCki8dn8BFaqR0uz+C6Sugdv47Nbo1LMRSvUGKDIO0XddjU2FDaDR
	3Hk61AVmRkaSlivwKdxQyVCIFhxVq8VhqRW9uA7XUWRKZY4z1QuHd6vtmoT53uB35JLeANeS5weZg
	5blC1VYZ5pENTpxcU+uw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHqkQ-0002bo-PX; Tue, 08 Oct 2019 14:45:58 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFwcx-0006Pj-6L
 for linux-afs@lists.infradead.org; Thu, 03 Oct 2019 08:38:24 +0000
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2B3C43C93A;
 Thu,  3 Oct 2019 08:38:21 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-125-72.rdu2.redhat.com
 [10.10.125.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 732965D6A7;
 Thu,  3 Oct 2019 08:38:15 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20191003014310.13262-5-paulmck@kernel.org>
References: <20191003014310.13262-5-paulmck@kernel.org>
 <20191003014153.GA13156@paulmck-ThinkPad-P72>
To: paulmck@kernel.org
Subject: Re: [PATCH tip/core/rcu 5/9] fs/afs: Replace rcu_swap_protected()
 with rcu_replace()
MIME-Version: 1.0
Content-ID: <25321.1570091894.1@warthog.procyon.org.uk>
Date: Thu, 03 Oct 2019 09:38:14 +0100
Message-ID: <25322.1570091894@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 03 Oct 2019 08:38:21 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191003_013823_249705_AC8685E2 
X-CRM114-Status: GOOD (  10.76  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Mailman-Approved-At: Tue, 08 Oct 2019 07:45:57 -0700
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
Cc: rcu@vger.kernel.org, tglx@linutronix.de, peterz@infradead.org,
 fweisbec@gmail.com, jiangshanlai@gmail.com, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, josh@joshtriplett.org, dhowells@redhat.com,
 edumazet@google.com, mathieu.desnoyers@efficios.com, oleg@redhat.com,
 dipankar@in.ibm.com, joel@joelfernandes.org, akpm@linux-foundation.org,
 mingo@kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

paulmck@kernel.org wrote:

> This commit replaces the use of rcu_swap_protected() with the more
> intuitively appealing rcu_replace() as a step towards removing
> rcu_swap_protected().

Yay!

> Link: https://lore.kernel.org/lkml/CAHk-=wiAsJLw1egFEE=Z7-GGtM6wcvtyytXZA1+BHqta4gg6Hw@mail.gmail.com/
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Cc: David Howells <dhowells@redhat.com>
> Cc: <linux-afs@lists.infradead.org>
> Cc: <linux-kernel@vger.kernel.org>

Acked-by: David Howells <dhowells@redhat.com>

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
