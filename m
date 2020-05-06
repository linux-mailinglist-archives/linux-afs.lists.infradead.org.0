Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CC81C9C63
	for <lists+linux-afs@lfdr.de>; Thu,  7 May 2020 22:30:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/NLfxqGrKG7t3w4udkfZWjJ55L0TXVQMEUrMTATdssA=; b=NV9Ka8WIA+LwPf
	DyVWIgwJBCQTqsYhZ0wPXHagX9t+0tp0xcNrmwJcoIQKKOjTzh7xr+a2MEYCSt/vRKbHGCT5JdHnB
	P0j6QbXQ5gs2cuJcogbRemy/O7hfdxZEHasvxr+/+xc4bnkTkIMyZRrBECdWYXCgYjiaZ0VRiPSD+
	Li1K/M1qv1sFf0Y8No0NSKrfHE0F51VKrrQbzWMdDFKGO/Ao+ScfEnatpt7Kf4aeAFyODGCRldw1U
	hCU5tWwfRRle/E7+r8LG/bgdgkfbimQvK82elzZSmqQ7q+Ql81OLR43ChBSbMd7e6964F2YdKdtiw
	F3dI5ABlpj+KOfU9BbuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWnA9-0002YE-Sn; Thu, 07 May 2020 20:30:33 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWKyY-0004bn-4C
 for linux-afs@lists.infradead.org; Wed, 06 May 2020 14:24:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588775080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dbddwc8AWoCH822EokkiRcp0XFOdJXpCOboNl38sqMs=;
 b=Ec5egBY7MQtrsi+HfvGFiG2yB8hL0u9v8a4bF5O/swX57l8qXcM0uz5IfUF3zW+cZRb0mU
 C/1Q7ZJNNxpNrh77XnxbywI7c7IJrssKx79dghteYOjUw8jnvgVm2jmxXedVuankpOC2+p
 MIeHNlCwKM0MnNKfWuQNIkGQSheYbtk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-7dSlh3iYM9GY009Ms9gsRQ-1; Wed, 06 May 2020 10:24:39 -0400
X-MC-Unique: 7dSlh3iYM9GY009Ms9gsRQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1CE281CBE1;
 Wed,  6 May 2020 14:24:36 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-118-225.rdu2.redhat.com
 [10.10.118.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2557E6299C;
 Wed,  6 May 2020 14:24:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200506110942.GL16070@bombadil.infradead.org>
References: <20200506110942.GL16070@bombadil.infradead.org>
 <20200505115946.GF16070@bombadil.infradead.org>
 <158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk>
 <158861253957.340223.7465334678444521655.stgit@warthog.procyon.org.uk>
 <683739.1588751878@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC PATCH 54/61] afs: Wait on PG_fscache before
 modifying/releasing a page
MIME-Version: 1.0
Content-ID: <713140.1588775072.1@warthog.procyon.org.uk>
Date: Wed, 06 May 2020 15:24:32 +0100
Message-ID: <713141.1588775072@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_072442_242517_88372621 
X-CRM114-Status: GOOD (  10.48  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.120 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Thu, 07 May 2020 13:30:30 -0700
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
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
 Jeff Layton <jlayton@redhat.com>, linux-cifs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
 dhowells@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
 Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Matthew Wilcox <willy@infradead.org> wrote:

> > Won't that screw up ITER_MAPPING?  Does that mean that ITER_MAPPING isn't
> > viable?
> 
> Can you remind me why ITER_MAPPING needs:
> 
> "The caller must guarantee that the pages are all present and they must be
> locked using PG_locked, PG_writeback or PG_fscache to prevent them from
> going away or being migrated whilst they're being accessed."
> 
> An elevated refcount prevents migration, and it also prevents the pages
> from being freed.  It doesn't prevent them from being truncated out of
> the file, but it does ensure the pages aren't reallocated.

ITER_MAPPING relies on the mapping to maintain the pointers to the pages so
that it can find them rather than being like ITER_BVEC where there's a
separate list.

Truncate removes the pages from the mapping - at which point ITER_MAPPING can
no longer find them.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
