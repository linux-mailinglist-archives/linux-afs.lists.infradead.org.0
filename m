Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F9C1C9C62
	for <lists+linux-afs@lfdr.de>; Thu,  7 May 2020 22:30:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SZm0eDHKKI6oqId4uBpA0VgZsLTyq8RtajtY5yxMcVw=; b=a97maXdAjG4By+
	euG9BzZOOzxNZrKYw3RHmB0171GTprbo+eY/fiNS8dD9sGRzPoxQmmWF/CqtoV291OsfDqCwWwWej
	fJ5RsGg2c9Ywz+bThr83UAtAA3Ydm3VvlazfD/9RQobx9avMFX1o5CRq4yD/l712DuLkH6sRL9CHa
	O1hrOQHp0Ts0FMlpRDPIdV3JVocMW3v2fjXg2zp/cZRG6Sl9RDyrLITJz0On2EdgcRWHGQVavX7QW
	zA8OolS0UzzfWM73pQd8Gy86jfHSEMj366PD7y0+BN0GigjdSxZCd6PaXalc8HFobbgk1F6IlRMmj
	0oh27HZxVCpLzg0+Dxfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWnA8-0002W0-F7; Thu, 07 May 2020 20:30:32 +0000
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jVwEk-0004lb-81; Tue, 05 May 2020 11:59:46 +0000
Date: Tue, 5 May 2020 04:59:46 -0700
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [RFC PATCH 54/61] afs: Wait on PG_fscache before
 modifying/releasing a page
Message-ID: <20200505115946.GF16070@bombadil.infradead.org>
References: <158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk>
 <158861253957.340223.7465334678444521655.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158861253957.340223.7465334678444521655.stgit@warthog.procyon.org.uk>
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

On Mon, May 04, 2020 at 06:15:39PM +0100, David Howells wrote:
> PG_fscache is going to be used to indicate that a page is being written to
> the cache, and that the page should not be modified or released until it's
> finished.
> 
> Make afs_invalidatepage() and afs_releasepage() wait for it.

Well, why?  Keeping a refcount on the page will prevent it from going
away while it's being written to storage.  And the fact that it's
being written to this cache is no reason to delay the truncate of a file
(is it?)  Similarly, I don't see why we need to wait for the page to make
it to the cache before we start to modify it.  Certainly we'll need to
re-write it to the cache since the cache is now stale, but why should
we wait for the now-stale write to complete?


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
