Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7907C4F6
	for <lists+linux-afs@lfdr.de>; Wed, 31 Jul 2019 16:31:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6FmmeGhgQP42aSXy+kE3y2VwDWNiVOqTu8xakmWF70=; b=lP4Jnr03KzXsiB
	lowq39NdfFRY0HiOwIkTZJ6S+AKLa4B/Zz02tC1OMYX20P1GFs6GzBMiI/PxGu0DxyClNFumcSyGH
	4prRhn+0Pm6N9MnOsknYZ/QfRxaKKmDMWB1EV88Asu2q2rHdUzLXhIWE1NpteU+huJyhxgg3XQzMt
	2jBJ8kvZf1NZ/alrBUpJju/FdLc/U6hTR7QaBqAbabSeNdGACOUUge2d82fJZQBhSLhGovN9efF6W
	EL/hz3hezLabpu6M1pEq87TzHy7gGSyhJrpUfih5WmPYVs3gas8wzkCggjUSww9LTJotmgh7qwp3B
	YaRDRvc6/tCsaWH5BYBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hspdE-0002MW-HT; Wed, 31 Jul 2019 14:31:08 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hspd7-0002EL-HT
 for linux-afs@lists.infradead.org; Wed, 31 Jul 2019 14:31:02 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5DECD81F22;
 Wed, 31 Jul 2019 14:30:57 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A16501001B07;
 Wed, 31 Jul 2019 14:30:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CACT4Y+YjdV8CqX5=PzKsHnLsJOzsydqiq3igYDm_=nSdmFo2YQ@mail.gmail.com>
References: <CACT4Y+YjdV8CqX5=PzKsHnLsJOzsydqiq3igYDm_=nSdmFo2YQ@mail.gmail.com>
 <0000000000004c2416058c594b30@google.com>
 <24282.1562074644@warthog.procyon.org.uk>
To: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: kernel BUG at net/rxrpc/local_object.c:LINE!
MIME-Version: 1.0
Content-ID: <20329.1564583454.1@warthog.procyon.org.uk>
Date: Wed, 31 Jul 2019 15:30:54 +0100
Message-ID: <20330.1564583454@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 31 Jul 2019 14:30:57 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_073101_594814_DAA6692E 
X-CRM114-Status: GOOD (  12.14  )
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
Cc: Eric Biggers <ebiggers@kernel.org>, netdev <netdev@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-afs@lists.infradead.org,
 dhowells@redhat.com,
 syzbot <syzbot+1e0edc4b8b7494c28450@syzkaller.appspotmail.com>,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Dmitry Vyukov <dvyukov@google.com> wrote:

> Re bisection, I don't know if there are some more subtle things as
> play (you are in the better position to judge that), but bisection log
> looks good, it tracked the target crash throughout and wasn't
> distracted by any unrelated bugs, etc. So I don't see any obvious
> reasons to not trust it.

Can you turn on:

	echo 1 > /sys/kernel/debug/tracing/events/rxrpc/rxrpc_local/enable

and capture the trace log at the point it crashes?

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
