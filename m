Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E995D0C3
	for <lists+linux-afs@lfdr.de>; Tue,  2 Jul 2019 15:37:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FeHMYQzf8i8vQOAS/FweLY4lOUrzeeDl9uyNnqxHWtY=; b=ir/b7H0D6iP+gO
	bS0LbQEEjgcvQr3XToLsQ8uww5gXiThJ/l5hEkeWAV9eMx43mfW+qg0LCyGhoxLzacUKmn2bkCCNS
	X3a5mls+p3RaOsfBFMJwO2g259uaI8QYeVZ7sj3MQK1r2sU98QJBr610nI9ZKLeRGGICvFFT6wNli
	60enxEHcag7GYERMjclrJQZeJyXHPWfe18i/lK6Sy8Y1eFDwxpTavf6zpn2DQBqiFzBXoGaxbDnKT
	2337NaehMd6XeJG202IWqbOXd4tYSjJte3nHx/6PIZB7AEsulcBBLZOfL/e5evoMFdfiyTmt4QdWV
	51dg9jpG/SKz41sOxILw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiIye-0003en-Bq; Tue, 02 Jul 2019 13:37:44 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiIya-0003do-KK
 for linux-afs@lists.infradead.org; Tue, 02 Jul 2019 13:37:41 +0000
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 049C1A96F1;
 Tue,  2 Jul 2019 13:37:28 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-219.rdu2.redhat.com
 [10.10.120.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6ACB417966;
 Tue,  2 Jul 2019 13:37:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <0000000000004c2416058c594b30@google.com>
References: <0000000000004c2416058c594b30@google.com>
To: syzbot <syzbot+1e0edc4b8b7494c28450@syzkaller.appspotmail.com>,
 ebiggers@kernel.org
Subject: Re: kernel BUG at net/rxrpc/local_object.c:LINE!
MIME-Version: 1.0
Content-ID: <24281.1562074644.1@warthog.procyon.org.uk>
Date: Tue, 02 Jul 2019 14:37:24 +0100
Message-ID: <24282.1562074644@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 02 Jul 2019 13:37:38 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_063740_689725_E4BE6153 
X-CRM114-Status: GOOD (  12.43  )
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
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
 dhowells@redhat.com, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

syzbot <syzbot+1e0edc4b8b7494c28450@syzkaller.appspotmail.com> wrote:

I *think* the reproducer boils down to the attached, but I can't get syzkaller
to work and the attached sample does not cause the oops to occur.  Can you try
it in your environment?

> The bug was bisected to:
> 
> commit 46894a13599a977ac35411b536fb3e0b2feefa95
> Author: David Howells <dhowells@redhat.com>
> Date:   Thu Oct 4 08:32:28 2018 +0000
> 
>     rxrpc: Use IPv4 addresses throught the IPv6

This might not be the correct bisection point.  If you look at the attached
sample, you're mixing AF_INET and AF_INET6.  If you try AF_INET throughout,
that might get a different point.  On the other hand, since you've bound the
socket, the AF_INET6 passed to socket() should be ignored.

David
---
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <linux/rxrpc.h>

static const unsigned char inet4_addr[4] = {
	0xe0, 0x00, 0x00, 0x01
};

int main(void)
{
	struct sockaddr_rxrpc srx;
	int fd;

	memset(&srx, 0, sizeof(srx));
	srx.srx_family			= AF_RXRPC;
	srx.srx_service			= 0;
	srx.transport_type		= AF_INET;
	srx.transport_len		= sizeof(srx.transport.sin);
	srx.transport.sin.sin_family	= AF_INET;
	srx.transport.sin.sin_port	= htons(0x4e21);
	memcpy(&srx.transport.sin.sin_addr, inet4_addr, 4);

	fd = socket(AF_RXRPC, SOCK_DGRAM, AF_INET6);
	if (fd == -1) {
		perror("socket");
		exit(1);
	}

	if (bind(fd, (struct sockaddr *)&srx, sizeof(srx)) == -1) {
		perror("bind");
		exit(1);
	}

	sleep(20);

	// Whilst sleeping, hit with:
	// echo -e '\0\0\0\0\0\0\0\0' | ncat -4u --send-only 224.0.0.1 20001
	
	return 0;
}

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
