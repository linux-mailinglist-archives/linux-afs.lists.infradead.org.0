Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC66B7CA4
	for <lists+linux-afs@lfdr.de>; Thu, 19 Sep 2019 16:27:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rza7Cbm0VagYewSCRMNoQjmR4B9YlG/+KLnsGjP6Mmo=; b=Sr1INulUjlRamR
	5F5tMQu0Sfjry3RcLMIjudprdnquMDaFE8kjqQQu31dZ1qrDeiBBQi9JNOKvCa4V5l4lFLmZqnDLp
	8uF+GhMGMoKeTA2zLPSjHXTpkftW3p0PlXyd5lFPgAmxTMBwlWk5KYp/1ADykjjOzOzUvo28v1f8V
	OirrZHenyr+DnFrS0S+L2uNZU3Mv8YNNQhhGpNbLzl5DZ28uv9wX/ZUGfnGa8p2OcfBd8nm9CboHp
	VGQQ8D2XtkWlt/EirVEvGH0UcJN5MD3g+FpOsZc8mnogh0k6Dhtnos6cHZMSXksZf3OKRr9bUxJ4J
	Dm/G2hG6KjpUrJUs60Zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAxP7-0001PZ-M2; Thu, 19 Sep 2019 14:27:29 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAxLq-0005F5-97
 for linux-afs@lists.infradead.org; Thu, 19 Sep 2019 14:24:08 +0000
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 64D0C18C4275;
 Thu, 19 Sep 2019 14:24:05 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-125-72.rdu2.redhat.com
 [10.10.125.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B41FB60C18;
 Thu, 19 Sep 2019 14:24:01 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190919131537.GA15392@bombadil.infradead.org>
References: <20190919131537.GA15392@bombadil.infradead.org>
 <28368.1568875207@warthog.procyon.org.uk>
 <CAHk-=wgJx0FKq5FUP85Os1HjTPds4B3aQwumnRJDp+XHEbVjfA@mail.gmail.com>
 <16147.1568632167@warthog.procyon.org.uk>
 <16257.1568886562@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [GIT PULL afs: Development for 5.4
MIME-Version: 1.0
Content-ID: <8820.1568903040.1@warthog.procyon.org.uk>
Date: Thu, 19 Sep 2019 15:24:00 +0100
Message-ID: <8821.1568903040@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Thu, 19 Sep 2019 14:24:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_072406_443406_7B553AFB 
X-CRM114-Status: GOOD (  11.24  )
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
Cc: YueHaibing <yuehaibing@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
 Marc Dionne <marc.dionne@auristor.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Matthew Wilcox <willy@infradead.org> wrote:

> Why is it organised this way?  I mean, yes, technically, rxrpc is a
> generic layer-6 protocol that any blah blah blah, but in practice no
> other user has come up in the last 37 years, so why bother pretending
> one is going to?  Just git mv net/rxrpc fs/afs/ and merge everything
> through your tree.

Note that, unlike 9p, sunrpc and ceph, rxrpc is exposed as a network protocol
and can be used directly with socket(AF_RXRPC, ...).  I have part of a
userspace tool suite that uses this.

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
