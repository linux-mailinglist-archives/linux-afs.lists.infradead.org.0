Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 467DC1B1FC7
	for <lists+linux-afs@lfdr.de>; Tue, 21 Apr 2020 09:30:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0EUpxOoHcVUX6hiK0EnORotz4LHbMy9S9R3cXLIZmtg=; b=uxa2i38pnQK85l
	FJ1SQJ7StqV7o/Jpv02xMldNFyZzeFA591DTnsPNpN3pHLmniD0/1nerKLpW393aiPpKooSUuxD6O
	s0FGGM+Ovf1gc2KXO/aKsKs3fZFhGzEgxJsMRBH9nUKLsgbFKsn3QsJbBTCPSdiiSJDPG6TN4a0/L
	BKTwuoFfpiK+H8iyu7S5+bBUXCEiA4o+wsJc/OH04oKWyLZieFCIemiP7CxjKnXgl4mPoBvE51Cbe
	vsA9MY4Klj8QqlPnomzs0gHO29hpHplhhAAFw66HnQND+4dKf9yrwNQwUP+bN6ltjPB/egdbQKS/8
	28lDwO3EzqplVyy2Wtfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQnLl-0007h8-78; Tue, 21 Apr 2020 07:29:45 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQegj-0007i8-Ln
 for linux-afs@lists.infradead.org; Mon, 20 Apr 2020 22:14:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587420886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MiSDbiTo+2+0bF+oftBWtRobU1R64CceTEeiiGvXzRk=;
 b=WeENLdUECtNUJblMqbb/nZmabXuDc+QE8ThLrx5QTdYx3eueUaDGnaS8dIJUB/6qUT7mOA
 U7Pad0ZTIfXupxjIKqa07/aeew6MN84qyGRt31t3xcGxZJCWdSaBBc2pY3HCeUW5R5fhng
 SRDZIFHRjrGcs6g9a97Nxyg/ggyTax0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-aoNIUofJN7OwJncvIaYdTg-1; Mon, 20 Apr 2020 18:14:44 -0400
X-MC-Unique: aoNIUofJN7OwJncvIaYdTg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 893061005509;
 Mon, 20 Apr 2020 22:14:42 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-129.rdu2.redhat.com
 [10.10.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8BB676E60;
 Mon, 20 Apr 2020 22:14:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <878siq587w.fsf@cjr.nz>
References: <878siq587w.fsf@cjr.nz> <87imhvj7m6.fsf@cjr.nz>
 <CAH2r5mv5p=WJQu2SbTn53FeTsXyN6ke_CgEjVARQ3fX8QAtK_w@mail.gmail.com>
 <3865908.1586874010@warthog.procyon.org.uk>
 <927453.1587285472@warthog.procyon.org.uk>
 <1136024.1587388420@warthog.procyon.org.uk>
To: Paulo Alcantara <pc@cjr.nz>
Subject: cifs - Race between IP address change and sget()?
MIME-Version: 1.0
Content-ID: <1986039.1587420879.1@warthog.procyon.org.uk>
Date: Mon, 20 Apr 2020 23:14:39 +0100
Message-ID: <1986040.1587420879@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_151449_787376_AA1AE80F 
X-CRM114-Status: GOOD (  16.73  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Tue, 21 Apr 2020 00:29:44 -0700
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
Cc: fweimer@redhat.com, CIFS <linux-cifs@vger.kernel.org>,
 linux-nfs <linux-nfs@vger.kernel.org>, jlayton@redhat.com,
 Network Development <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
 Steve French <smfrench@gmail.com>, keyrings@vger.kernel.org,
 viro@zeniv.linux.org.uk, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Paulo Alcantara <pc@cjr.nz> wrote:

> >> > What happens if the IP address the superblock is going to changes, then
> >> > another mount is made back to the original IP address?  Does the second
> >> > mount just pick the original superblock?
> >> 
> >> It is going to transparently reconnect to the new ip address, SMB share,
> >> and cifs superblock is kept unchanged.  We, however, update internal
> >> TCP_Server_Info structure to reflect new destination ip address.
> >> 
> >> For the second mount, since the hostname (extracted out of the UNC path
> >> at mount time) resolves to a new ip address and that address was saved
> >> earlier in TCP_Server_Info structure during reconnect, we will end up
> >> reusing same cifs superblock as per fs/cifs/connect.c:cifs_match_super().
> >
> > Would that be a bug?
> 
> Probably.
> 
> I'm not sure how that code is supposed to work, TBH.

Hmmm...  I think there may be a race here then - but I'm not sure it can be
avoided or if it matters.

Since the address is part of the primary key to sget() for cifs, changing the
IP address will change the primary key.  Jeff tells me that this is governed
by a spinlock taken by cifs_match_super().  However, sget() may be busy
attaching a new mount to the old superblock under the sb_lock core vfs lock,
having already found a match.

Should the change of parameters made by cifs be effected with sb_lock held to
try and avoid ending up using the wrong superblock?

However, because the TCP_Server_Info is apparently updated, it looks like my
original concern is not actually a problem (the idea that if a mounted server
changes its IP address and then a new server comes online at the old IP
address, it might end up sharing superblocks because the IP address is part of
the key).

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
