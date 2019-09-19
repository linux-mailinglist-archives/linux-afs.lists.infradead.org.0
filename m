Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B209B76A9
	for <lists+linux-afs@lfdr.de>; Thu, 19 Sep 2019 11:49:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:References:In-Reply-To:From:Reply-To:To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hLi9sXvAa3Q7gCfCPPMrsQRSi8OqgWGHToi65AmlNH8=; b=ZlF3Wfs2jvWVqS
	aM8DhKQKTBMUbYcWyBnNvdwqYa/SK+/oFYNMVckRmadALNl+VggKJHgeJJq1ILluzADPXr6efmVR0
	wEaI/fLKEx82/Bls9TAqiVcDNIF9WmJtJESPDXj9572Ll2WIO1CdUV18JGzwMIPqoL2JiGIkCnKqg
	6x9WFlMpLtXxWd3zEX3FoI40AMMOUOtsOLOVdJfzodlk6Crcs58GD9dsZs880Fsi5ZeYJHbIJFgqc
	QeMjLiMjPuP1+MBye9I0BQ2hgE9+WD+m3lb1wkqeFZq8G7hM4eyRTwUIMqReFWq9aKiL87b6ygvS9
	bYdi+c2Ept7v9vuea6Hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAt47-0004SQ-Io; Thu, 19 Sep 2019 09:49:31 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAt43-0004Q2-A1
 for linux-afs@lists.infradead.org; Thu, 19 Sep 2019 09:49:29 +0000
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A7466898104;
 Thu, 19 Sep 2019 09:49:24 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-125-72.rdu2.redhat.com
 [10.10.125.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5535D5D9CC;
 Thu, 19 Sep 2019 09:49:23 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <28368.1568875207@warthog.procyon.org.uk>
References: <28368.1568875207@warthog.procyon.org.uk>
 <CAHk-=wgJx0FKq5FUP85Os1HjTPds4B3aQwumnRJDp+XHEbVjfA@mail.gmail.com>
 <16147.1568632167@warthog.procyon.org.uk>
Subject: Re: [GIT PULL afs: Development for 5.4
MIME-Version: 1.0
Content-ID: <16256.1568886562.1@warthog.procyon.org.uk>
Date: Thu, 19 Sep 2019 10:49:22 +0100
Message-ID: <16257.1568886562@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Thu, 19 Sep 2019 09:49:24 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_024927_366936_A51401AF 
X-CRM114-Status: GOOD (  15.84  )
X-Spam-Score: -3.8 (---)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-3.8 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 1.2 MISSING_HEADERS        Missing To: header
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
Cc: YueHaibing <yuehaibing@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
 Marc Dionne <marc.dionne@auristor.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

David Howells <dhowells@redhat.com> wrote:

> > However, I was close to unpulling it again. It has a merge commit with
> > this merge message:
> > 
> >     Merge remote-tracking branch 'net/master' into afs-next
> > 
> > and that simply is not acceptable.
> 
> Apologies - I meant to rebase that away.  There was a bug fix to rxrpc in
> net/master that didn't get pulled into your tree until Saturday.

Actually, waiting for all outstanding fixes to get merged and then rebasing
might not be the right thing here.  The problem is that there are fixes in
both trees: afs fixes go directly into yours whereas rxrpc fixes go via
networking and I would prefer to base my patches on both of them for testing
purposes.  What's the preferred method for dealing with that?  Base on a merge
of the lastest of those fixes in each tree?

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
