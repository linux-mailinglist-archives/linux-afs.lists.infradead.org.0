Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D39564E9
	for <lists+linux-afs@lfdr.de>; Wed, 26 Jun 2019 10:50:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7FCA/kCETKupuAjKRfh476uGdZQmpKCJzwRy5MMDlJA=; b=ELJg3xdMPxN2UY
	KOxxyaReu+3ZhHilVB3UzM9hKmbA2kmSg3fB+EL6aebCZpjKrn3nwj227TldjxNImwMROE9RQj+iT
	L01Y3YYrheD1dVSTigegXytyEi2O05i7fsyKf+EyfVhJy69rx2eZm18pKrtMAjJwOOqrHqgVfQvrn
	tYDSReerb3ISt/wN58glD7oWur1w4knz8q+vi6oK/g9Ms8tdlPCQ2Lq9uIVKIJJbXYNxGgQGMMj1X
	u+ffD4hyWvaE3DzNZmZdobAkG/MK37s7VAtimY1BUki9+o+Lk6LF8BmOj+FJqfn2EGfI12g/+lb3q
	2fzV+Wq61U3F1nKUfoDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hg3dJ-00058a-9S; Wed, 26 Jun 2019 08:50:25 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg3dF-00057l-Rq
 for linux-afs@lists.infradead.org; Wed, 26 Jun 2019 08:50:23 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 90A2D30BB54B;
 Wed, 26 Jun 2019 08:50:11 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com
 [10.10.120.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BF6B1001B10;
 Wed, 26 Jun 2019 08:50:08 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] AFS fixes
MIME-Version: 1.0
Content-ID: <834.1561539007.1@warthog.procyon.org.uk>
Date: Wed, 26 Jun 2019 09:50:07 +0100
Message-ID: <835.1561539007@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Wed, 26 Jun 2019 08:50:11 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190626_015021_920648_21D5B998 
X-CRM114-Status: GOOD (  15.61  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
 iwienand@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi Linus,

Could you pull this please?

There are four patches:

 (1) Fix the printing of the "vnode modified" warning to exclude checks on
     files for which we don't have a callback promise from the server (and
     so don't expect the server to tell us when it changes).

     Without this, for every file or directory for which we still have an
     in-core inode that gets changed on the server, we may get a message
     logged when we next look at it.  This can happen in bulk if, for
     instance, someone does "vos release" to update a R/O volume from a R/W
     volume and a whole set of files are all changed together.

     We only really want to log a message if the file changed and the
     server didn't tell us about it or we failed to track the state
     internally.

 (2) Fix accidental corruption of either afs_vlserver struct objects or the
     the following memory locations (which could hold anything).  The issue
     is caused by a union that points to two different structs in struct
     afs_call (to save space in the struct).  The call cleanup code assumes
     that it can simply call the cleanup for one of those structs if not
     NULL - when it might be actually pointing to the other struct.

     This means that every Volume Location RPC op is going to corrupt
     something.

 (3) Fix an uninitialised spinlock.  This isn't too bad, it just causes a
     one-off warning if lockdep is enabled when "vos release" is called,
     but the spinlock still behaves correctly.

 (4) Fix the setting of i_block in the inode.  This causes du, for example,
     to produce incorrect results, but otherwise should not be dangerous to
     the kernel.

The in-kernel AFS client has been undergoing testing on opendev.org on one
of their mirror machines.  They are using AFS to hold data that is then
served via apache, and Ian Wienand had reported seeing oopses, spontaneous
machine reboots and updates to volumes going missing.  This patch series
appears to have fixed the problem, very probably due to patch (2), but it's
not 100% certain.

Reviewed-by: Jeffrey Altman <jaltman@auristor.com>
Tested-by: Marc Dionne <marc.dionne@auristor.com>
Tested-by: Ian Wienand <iwienand@redhat.com>

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
