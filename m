Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D58B11658CE
	for <lists+linux-afs@lfdr.de>; Thu, 20 Feb 2020 08:52:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kziP/CG4dOxIac3SuZzFpjmqAK6ponfFd1C7wh2P6J0=; b=Uiea0KGXWRo6gH
	F0VYWTFEPt4xkzHcqPNIOn4Q6laAPmQ55zo8eFdr+TlHoAPfkcq1LA/ecO9V4uPrG5EHkoz1hUcYY
	8JOoBfMn9GzweLKmKXyJ5uTZpYrA4Z1y2s53YNLEIV8ezOzGeo38WJClHh73SZ5DAeyB++wOIUA1G
	p+AMsG378Je+n15GB8y7s+QTeGzNw/mEwWreym+uSauCJHfK+qk2b966yuNejl2pIPuwVJSLQzYNp
	cO61A/IKKKchrb8jowE7/T2odhD/vFyHrahrfULsvm+xgw2kdSxvStHkB3YvXVGCe83ZkpVjK/Dxt
	/Y9Ow0LOm8kpCJ1T/BYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4gd5-0004tX-FD; Thu, 20 Feb 2020 07:52:15 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4gd2-0004so-PB
 for linux-afs@lists.infradead.org; Thu, 20 Feb 2020 07:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582185130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UKHnTXS8JHsJkGLe40P/26aUTaSDknlNIIOYz4XwZEQ=;
 b=emykKyOq8s2GuvmKqKSePF6p5H7+tzAtGsCojaiv3Eg7BAXKu74T0fIYBeHoFBfpKslj/w
 ofuZVxOAT1bgdytU4y0Vkpx4BVHwB6w0mXKYdif/EOVK1T+e3G8ZQMYTlIoxS+piziyr8c
 H426l5S7s76nR2w/6jgeVyHgoo3yDVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-WzSeYNV4P9u2xPZQedKB9Q-1; Thu, 20 Feb 2020 02:52:08 -0500
X-MC-Unique: WzSeYNV4P9u2xPZQedKB9Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 510F313E4;
 Thu, 20 Feb 2020 07:52:07 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-122-163.rdu2.redhat.com
 [10.10.122.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A0B7863A5;
 Thu, 20 Feb 2020 07:52:06 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=whOAg2EJycA=x=8RzBy3dnDFsgnyxrjREyNu6-8+eTTHA@mail.gmail.com>
References: <CAHk-=whOAg2EJycA=x=8RzBy3dnDFsgnyxrjREyNu6-8+eTTHA@mail.gmail.com>
 <158215745745.386537.12978619503606431141.stgit@warthog.procyon.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH] afs: Create a mountpoint through symlink() and remove
 through rmdir()
MIME-Version: 1.0
Content-ID: <426584.1582185125.1@warthog.procyon.org.uk>
Date: Thu, 20 Feb 2020 07:52:05 +0000
Message-ID: <426585.1582185125@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_235212_897511_C9CB5ECC 
X-CRM114-Status: GOOD (  11.07  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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
Cc: dhowells@redhat.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> Your argument that if the prefix is made really long it couldn't be a
> valid symlink at all on AFS is fair, but seems somewhat excessive.

Normally, mountpoint creation and removal would be hidden behind the
appropriate command line tool and not done directly with ln/rmdir.

> The only issue I see with this interface is that you can now create
> these kinds of things by untarring a tar-ball etc.

That would be true with mknod approach too.  Even if tar couldn't do the
second-stage write, it could still create a lot of half-formed mountpoints
by extracting chardevs.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
