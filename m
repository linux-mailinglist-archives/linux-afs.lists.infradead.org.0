Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC9D1C9C61
	for <lists+linux-afs@lfdr.de>; Thu,  7 May 2020 22:30:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWw6J0MK+i2ExBO+TAU7wNT6qHe18ZKzkcvnJgRZ2Bk=; b=mo714p3kAj9VzB
	N+zE3rbuMKAvsTeI5AEqVQkoMgXgvaYgmm3GJI3IItgYSgAf+ABcOCWp350R/dIokB9feal5DjVvY
	+/AeLNwJQZpf/9PfPdvOKGm8rTkMpRgsrb54YajBw9AHZaYlxhrXL1Es00C/xD/nTllCZ3XZKLW1j
	v945fyfetqI6l92h5UBi+UclWwAhkC5oa2rfCNjsVk2xExrHmJsFjWmh+/BIP+jDjZMZwXG0Fkb2Y
	648+g2GKME0ncj7qLP0eGG1HCgQ6aVYyRAWZxFCJR10HMpH+zv/drLo6BHdKOXLXSd9bpHdQibEwS
	JkosjXClxsonyhyNRgbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWnA9-0002XU-Js; Thu, 07 May 2020 20:30:33 +0000
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jWHvq-0005ga-Fj; Wed, 06 May 2020 11:09:42 +0000
Date: Wed, 6 May 2020 04:09:42 -0700
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [RFC PATCH 54/61] afs: Wait on PG_fscache before
 modifying/releasing a page
Message-ID: <20200506110942.GL16070@bombadil.infradead.org>
References: <20200505115946.GF16070@bombadil.infradead.org>
 <158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk>
 <158861253957.340223.7465334678444521655.stgit@warthog.procyon.org.uk>
 <683739.1588751878@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <683739.1588751878@warthog.procyon.org.uk>
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 Jeff Layton <jlayton@redhat.com>, linux-kernel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@netapp.com>, Steve French <sfrench@samba.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, May 06, 2020 at 08:57:58AM +0100, David Howells wrote:
> Matthew Wilcox <willy@infradead.org> wrote:
> 
> > > PG_fscache is going to be used to indicate that a page is being written to
> > > the cache, and that the page should not be modified or released until it's
> > > finished.
> > > 
> > > Make afs_invalidatepage() and afs_releasepage() wait for it.
> > 
> > Well, why?  Keeping a refcount on the page will prevent it from going
> > away while it's being written to storage.  And the fact that it's
> > being written to this cache is no reason to delay the truncate of a file
> > (is it?)
> 
> Won't that screw up ITER_MAPPING?  Does that mean that ITER_MAPPING isn't
> viable?

Can you remind me why ITER_MAPPING needs:

"The caller must guarantee that the pages are all present and they must be
locked using PG_locked, PG_writeback or PG_fscache to prevent them from
going away or being migrated whilst they're being accessed."

An elevated refcount prevents migration, and it also prevents the pages
from being freed.  It doesn't prevent them from being truncated out of
the file, but it does ensure the pages aren't reallocated.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
