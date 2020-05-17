Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB7C1D6D60
	for <lists+linux-afs@lfdr.de>; Sun, 17 May 2020 23:08:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lPi34NWrJQFu3rd9nLnw1i/VLJ1oJQ8kJEIjP/AroJw=; b=ViAe8lFe2fY2Lg
	VNSSI2HDEjeiAsdznPvIdrjUaKQeV0wn61LSx9VjBkTzxgCxu5MEWHEWk8EmfIZaWULALJqFsGfdt
	R5fGkWLCMYq42xxS0x4X/9LarwMcRy5olNdslocT18tm1Mqq1gKFRD9GN0RjRzJ7fFEcNJQYaqRtd
	s21VgAh4svogD+lFZ6hUdSfzCFu9OjkOGX5dFyWtLqbR6PYElB6Am8Tq9ueVv/mijyqs02GEGm/Q7
	FCu7PfH14rG0KgAtXoUHYTJd5U87UxNDTwg2GvNyf9TuS5AQfUitP0bGIR7D3M2v3LMGW6GVsbzli
	w8J6m8cHi2j4ixbb+3nQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaQW5-0003ru-66; Sun, 17 May 2020 21:08:13 +0000
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jaQW3-0003ri-60; Sun, 17 May 2020 21:08:11 +0000
Date: Sun, 17 May 2020 14:08:11 -0700
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH] afs: Don't unlock fetched data pages until the op
 completes successfully
Message-ID: <20200517210811.GQ16070@bombadil.infradead.org>
References: <158974686528.785191.2525276665446566911.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158974686528.785191.2525276665446566911.stgit@warthog.procyon.org.uk>
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
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Sun, May 17, 2020 at 09:21:05PM +0100, David Howells wrote:
> Don't call req->page_done() on each page as we finish filling it with the
> data coming from the network.  Whilst this might speed up the application a
> bit, it's a problem if there's a network failure and the operation has to
> be reissued.

It's readpages, which by definition is called for pages that the
application is _not_ currently waiting for.  Now, if the application
is multithreaded and happens to want pages that are currently under
->readpages, then that's going to be a problem (but also unlikely).
Also if the application overruns the readahead window then it'll have
to wait a little longer (but we ramp up the readahead window, so this
should be a self-correcting problem).

> If this happens, an oops occurs because afs_readpages_page_done() clears
> the pointer to each page it unlocks and when a retry happens, the pointers
> to the pages it wants to fill are now NULL (and the pages have been
> unlocked anyway).

I mean, you could check for NULL pointers and not issue the I/O for that
region ... but it doesn't seem necessary.

> Instead, wait till the operation completes successfully and only then
> release all the pages after clearing any terminal gap (the server can give
> us less data than we requested as we're allowed to ask for more than is
> available).

s/release/mark up to date/

> +	if (req->page_done)
> +		for (req->index = 0; req->index < req->nr_pages; req->index++)
> +			req->page_done(req);
> +

I'd suggest doing one call rather than N and putting the page iteration
inside the callback.  But this patch is appropriate for this late in
the -rc series, just something to consider for the future.

You might even want to use a bit in the req to indicate whether this is
a readahead request ... that's the only user of the ->page_done callback
that I can find.

Anyway,
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
