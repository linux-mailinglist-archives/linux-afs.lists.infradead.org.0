Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7F11C9C64
	for <lists+linux-afs@lfdr.de>; Thu,  7 May 2020 22:30:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ph6Fh9CD2X12ycaAPLVtu2jL/B1eqvSjf2ENYhzSe5Q=; b=p/HV+dFBP7vW9U
	+iaC9HPyiG7+d5JYtco9WgFVJz8TpQ/c9kc9+00wLR6SyMDR2pInX58dReu6CW9Q94CGnCE2dUu8I
	P2KNv0CYxaxetdnAoXYlz8jlSQ15kZACweoSsRYIuHc1kZHhTkyXYlulmPaYUtvRMdpsmpe8MwwpD
	9iFNTfQutpjqIhullIG9r1ehSq32G55JaQAxktwKDZNJXaj2bPFxFgQQuDI4BD4hG5KcGhLJSU6/w
	TLNKbhRKuZEPuSQGZZgR4UAWDM4HiR1LpMjqWbvbAUtDz5NJWTNC97JstSn7FmWmHRKiBe1nMOgYM
	KEk+5HG+f5aAv/FSfkEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWnAD-0002ag-EW; Thu, 07 May 2020 20:30:37 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jVqi4-0001hM-KU; Tue, 05 May 2020 06:05:40 +0000
Date: Mon, 4 May 2020 23:05:40 -0700
From: Christoph Hellwig <hch@infradead.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [RFC PATCH 00/61] fscache, cachefiles: Rewrite the I/O interface
 in terms of kiocb/iov_iter
Message-ID: <20200505060540.GA28929@infradead.org>
References: <158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk>
X-Mailman-Approved-At: Thu, 07 May 2020 13:30:35 -0700
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
 Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
 Steve French <sfrench@samba.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Can you split this into a few smaller series?  > 60 patches is beyond
reviewer comprehension.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
