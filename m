Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 511F91C9C65
	for <lists+linux-afs@lfdr.de>; Thu,  7 May 2020 22:30:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0tUOStKNCgII3w421AIXfpZqTjmnOpRtEh+rozQwsNU=; b=G+uB5hSsZo4Wvw
	8A7KqFhI+AxmqrgxFV/WnnRQG8cFH0Bpk73Evquos2x9YjGhxrgaibq4gDSvoCr2GPuplg/A581iI
	oZ4x2HUS5vK/9o2YIgDF6IJLJpgyV4hOjD43RzQRV+MbM7EhpWsx6oejAOIyx/YFDn80ns2fa+/cl
	oyWI5almNTm8SEe1ojvqPVkJXtuS8hV28TaYxNNXcBlvfnFHsJ/+IAIuC/L2txa9L8+xY97u5Y1Aj
	Z7E3dBpqZgOF9OLbXmqZMOJ6iJI59Ian6YhLBsKJkHKSJeAuB50HfxQ/Ran63qtu7a3JYP74ZvxC/
	KrEUYyEzbEBxrruNj2DA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWnA8-0002Wf-Vv; Thu, 07 May 2020 20:30:32 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWEwR-0003RG-GW
 for linux-afs@lists.infradead.org; Wed, 06 May 2020 07:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588751885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3XSAt+Mkup/SofBBKUCYx2i7ecGmmjnSIl1ryVz58Ao=;
 b=KtCKCgXlt9+zoWm+6SEPFsGCpBDVeqZ/IMkp9v2irAyOXuzIRgdgR6TzXd12mQrszqeqRJ
 hGa+A2Ed3YlHsA/ed+U6/Uk5tOXR7hf0OPR3I72YCrT1plGDrJBkaIY8L/IrrEDyWPoftG
 2vt82OqIajgWqDakFsPA0JyXd8Ks5ks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459--Q3klqpZNS2sU59OYqcCAQ-1; Wed, 06 May 2020 03:58:03 -0400
X-MC-Unique: -Q3klqpZNS2sU59OYqcCAQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A672B835B49;
 Wed,  6 May 2020 07:58:01 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-118-225.rdu2.redhat.com
 [10.10.118.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 014C45D9DA;
 Wed,  6 May 2020 07:57:58 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200505115946.GF16070@bombadil.infradead.org>
References: <20200505115946.GF16070@bombadil.infradead.org>
 <158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk>
 <158861253957.340223.7465334678444521655.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC PATCH 54/61] afs: Wait on PG_fscache before
 modifying/releasing a page
MIME-Version: 1.0
Content-ID: <683738.1588751878.1@warthog.procyon.org.uk>
Date: Wed, 06 May 2020 08:57:58 +0100
Message-ID: <683739.1588751878@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_005807_626861_4AB28D60 
X-CRM114-Status: GOOD (  10.89  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [207.211.31.120 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Thu, 07 May 2020 13:30:29 -0700
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

> > PG_fscache is going to be used to indicate that a page is being written to
> > the cache, and that the page should not be modified or released until it's
> > finished.
> > 
> > Make afs_invalidatepage() and afs_releasepage() wait for it.
> 
> Well, why?  Keeping a refcount on the page will prevent it from going
> away while it's being written to storage.  And the fact that it's
> being written to this cache is no reason to delay the truncate of a file
> (is it?)

Won't that screw up ITER_MAPPING?  Does that mean that ITER_MAPPING isn't
viable?

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
