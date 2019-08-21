Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DECA59AA4D
	for <lists+linux-afs@lfdr.de>; Fri, 23 Aug 2019 10:28:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5dXfRxtH5paobJAR3u54QF3PZCvkTBlkMLl/ekQgmQI=; b=YErEJrDeP+/07Z
	0WKcbZS3tIgCgb5vTIzmIRwWe5/WHY5/eRFgGPg/SXqFEBCRxduCUr0NwVdBuiidvCVjUOyWgR8V0
	wgKn4axy40DNLBUb2bTqxkmDvyUDR7j/dcro/jqsOBtEEt+QQhbwaKuMad1imjZmH/Xj1sdiCm/iz
	E0H7Eh8xUa+3icsNigQvROM3kqAsq6oExll24/XMKpL3H9E9VeY96TbkN4Vu33ZCnXam/BMffRqKC
	SBwNUncLfwitrWPkh0XKXevg8enOjGAle65pqcyfLNkIeLopa21uYgxTSZWha6MSnEUG9gjfshEAJ
	r81Q3t/WUj7D0luY40zw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i14vL-0000kv-Pr; Fri, 23 Aug 2019 08:27:55 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0WBw-0003yW-Oj
 for linux-afs@lists.infradead.org; Wed, 21 Aug 2019 19:22:46 +0000
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F0F5630833CB;
 Wed, 21 Aug 2019 19:22:42 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C53C04513;
 Wed, 21 Aug 2019 19:22:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <1566402203.5162.12.camel@linux.ibm.com>
References: <1566402203.5162.12.camel@linux.ibm.com>
 <1562814435.4014.11.camel@linux.ibm.com>
 <28477.1562362239@warthog.procyon.org.uk>
 <CAHk-=wjxoeMJfeBahnWH=9zShKp2bsVy527vo3_y8HfOdhwAAw@mail.gmail.com>
 <20190710194620.GA83443@gmail.com> <20190710201552.GB83443@gmail.com>
 <CAHk-=wiFti6=K2fyAYhx-PSX9ovQPJUNp0FMdV0pDaO_pSx9MQ@mail.gmail.com>
 <23498.1565962602@warthog.procyon.org.uk>
To: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [GIT PULL] Keys: Set 4 - Key ACLs for 5.3
MIME-Version: 1.0
Content-ID: <19087.1566415359.1@warthog.procyon.org.uk>
Date: Wed, 21 Aug 2019 20:22:39 +0100
Message-ID: <19088.1566415359@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Wed, 21 Aug 2019 19:22:43 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_122244_824491_6F7A6E35 
X-CRM114-Status: GOOD (  10.05  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
X-Mailman-Approved-At: Fri, 23 Aug 2019 01:27:47 -0700
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
Cc: CIFS <linux-cifs@vger.kernel.org>, linux-nfs@vger.kernel.org,
 Netdev <netdev@vger.kernel.org>, James Morris <jmorris@namei.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
 LSM List <linux-security-module@vger.kernel.org>, keyrings@vger.kernel.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-integrity@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

I added a bunch of tests to the keyutils testsuite, currently on my -next
branch:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/log/?h=next

See:

	Add a keyctl command for granting a permit on a key
	Handle kernel having key/keyring ACLs

I've added manpages to describe the new bits, but I wonder whether I should
add a manpage specifically to detail the permissions system.  It'll probably
be useful when more advanced subjects become available, such as for specific
UIDs and for containers-as-a-whole.

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
