Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4EF1CCE9E
	for <lists+linux-afs@lfdr.de>; Mon, 11 May 2020 00:45:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:References:In-Reply-To:From:Reply-To:To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PALmhNFYcYUBoR1It8dWlIg1Z93DpjZ83JFrS8eCUAE=; b=TcyDDO4zLAWuZO
	Hc5rE96vX+JDc6OnvtYBpCJl2BvN8RYKKzfI1eswxuuwnDjpfS5NwOgIKMELl0QiTldXH+7TduISa
	2bE554RIIsM8cIsrZzOxqWFX6i5eYSiLR0zl7oz3zJg6Qorzf/2duFjNm8F6xcCmpPnxyCihjLIDk
	g7AI3Bfotp2WXwgf6MqKOt1B1q9pYP0xLn0HKoeWN1MNiGGPeUC9ssxZWOBRasILe48l7a/Ll52TX
	9kMyRRO+pXy/QDD9lRstYSAlYRP+5Fel8Jz90Ddwp4jX+ulXJ36/pgiomNyBOYsVs1psUe6lFwb3K
	ID6XBnlws888GDC6s3vA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXugZ-0001Un-S2; Sun, 10 May 2020 22:44:39 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jX4AR-0006hO-4d
 for linux-afs@lists.infradead.org; Fri, 08 May 2020 14:40:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588948796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hEKOJFeBe0XhjAsTACvee48OxZfeBzXxgNIQnHiBGQA=;
 b=U09Zq8OiWfW9ZbjPO/rtx9kwhOjqnVA5PbZt1VXNWNVSZXghWhRLlVJUkSdi7PMPIgOGFT
 DJM6U1yx929G0ZTamA0AN/YRpeDY9MKvKOIJHiMnzWHUc3W0d7detJA8iJkaVbMTxPmBfx
 BEaDcnAgIpTWZtT5OIYI+YaEN3dbdTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-uSDcl7BqPWCt8KdWQCXcuA-1; Fri, 08 May 2020 10:39:54 -0400
X-MC-Unique: uSDcl7BqPWCt8KdWQCXcuA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D86B464;
 Fri,  8 May 2020 14:39:52 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-118-225.rdu2.redhat.com
 [10.10.118.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42DCE707A6;
 Fri,  8 May 2020 14:39:49 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <713141.1588775072@warthog.procyon.org.uk>
References: <713141.1588775072@warthog.procyon.org.uk>
 <20200506110942.GL16070@bombadil.infradead.org>
 <20200505115946.GF16070@bombadil.infradead.org>
 <158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk>
 <158861253957.340223.7465334678444521655.stgit@warthog.procyon.org.uk>
 <683739.1588751878@warthog.procyon.org.uk>
Subject: Re: [RFC PATCH 54/61] afs: Wait on PG_fscache before
 modifying/releasing a page
MIME-Version: 1.0
Content-ID: <1040570.1588948788.1@warthog.procyon.org.uk>
Date: Fri, 08 May 2020 15:39:48 +0100
Message-ID: <1040571.1588948788@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_073959_253298_CC768996 
X-CRM114-Status: GOOD (  11.37  )
X-Spam-Score: 1.0 (+)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (1.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.2 MISSING_HEADERS        Missing To: header
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.61 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Sun, 10 May 2020 15:44:38 -0700
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
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-afs@lists.infradead.org, dhowells@redhat.com,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

David Howells <dhowells@redhat.com> wrote:

> ITER_MAPPING relies on the mapping to maintain the pointers to the pages so
> that it can find them rather than being like ITER_BVEC where there's a
> separate list.
> 
> Truncate removes the pages from the mapping - at which point ITER_MAPPING can
> no longer find them.

It looks like ITER_MAPPING is fine with truncate, provided the invalidation
waits for the iterator to complete first:

	int truncate_inode_page(struct address_space *mapping, struct page *page)
	{
		VM_BUG_ON_PAGE(PageTail(page), page);

		if (page->mapping != mapping)
			return -EIO;

		truncate_cleanup_page(mapping, page);
		delete_from_page_cache(page);
		return 0;
	}

In which case, ->invalidatepage() needs to wait for PG_fscache.

Similarly, it looks like ->releasepage() is fine, provided it waits for
PG_fscache also.

If I have to use ITER_BVEC, what's the advisability of using vmalloc() to
allocate the bio_vec array for a transient op?  Such an array can reference up
to 1MiB on a 64-bit machine with 4KiB non-compound pages if it only allocates
up to a single page.  I'm wondering what the teardown cost is, though, if all
the corresponding PTEs have to be erased from all CPUs.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
