Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2616F7BC5C
	for <lists+linux-afs@lfdr.de>; Wed, 31 Jul 2019 10:57:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=URy0NEijpTFGWIIjFdvvUuz3xqIK0QEEC2qV/W5yh/w=; b=Pbgf3Dnzgu6yXe
	obyNJZg6a+9anga3qxC3rBNMXFyznVl1zBBHxAigqUHgP5EpTdg0hT9OtaF3G3H+MAbTdPcuZD5Gr
	cXLt7ULj08JhYrVNUVJzJYXGdEFPmdNfYZq235NZUZjhpMDSmFDl7D2D9+WFPM4gc3hB6b8JN+8+p
	jPpUgx+ERjOaD/mjTjqWRDo+R5La2MxrOBueX25//VnI6HSe3zv7WgdNp7QDDZfgZVzYyI90Vnb/9
	tNDhcvu2cQzD6aFNsBLpXVDgh6iil/h5pLZORKAreB2zbOIjWSFNsP4fVEU8mJV7DjCU7xpQ4nLRG
	fKF6/wElMr6tXWR+uWhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hskQL-0005sZ-D5; Wed, 31 Jul 2019 08:57:29 +0000
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red
 Hat Linux)) id 1hsYhc-0007hT-DO; Tue, 30 Jul 2019 20:26:32 +0000
Date: Tue, 30 Jul 2019 13:26:32 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Song Liu <songliubraving@fb.com>
Subject: Re: [PATCH v2 1/2] mm: Allow the page cache to allocate large pages
Message-ID: <20190730202632.GC4700@bombadil.infradead.org>
References: <20190729210933.18674-1-william.kucharski@oracle.com>
 <20190729210933.18674-2-william.kucharski@oracle.com>
 <443BA74D-9A8E-479B-9E63-4ACD6D6C0AF9@fb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <443BA74D-9A8E-479B-9E63-4ACD6D6C0AF9@fb.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Wed, 31 Jul 2019 01:57:27 -0700
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 Yangtao Li <tiny.windzz@gmail.com>, Hugh Dickins <hughd@google.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Keith Busch <keith.busch@intel.com>,
 William Kucharski <william.kucharski@oracle.com>,
 Yafang Shao <laoar.shao@gmail.com>, Arun KS <arunks@codeaurora.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Ira Weiny <ira.weiny@intel.com>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
 kbuild test robot <lkp@intel.com>, Sage Weil <sage@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chris Mason <clm@fb.com>,
 Pavel Tatashin <pasha.tatashin@oracle.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrey Konovalov <andreyknvl@google.com>,
 Dave Airlie <airlied@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Linux-MM <linux-mm@kvack.org>, Dan Williams <dan.j.williams@intel.com>,
 Bob Kasten <robert.a.kasten@intel.com>, Miklos Szeredi <mszeredi@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Amir Goldstein <amir73il@gmail.com>,
 Jann Horn <jannh@google.com>, John Hubbard <jhubbard@nvidia.com>,
 David Rientjes <rientjes@google.com>,
 "john.hubbard@gmail.com" <john.hubbard@gmail.com>,
 Josef Bacik <josef@toxicpanda.com>, Ross Zwisler <zwisler@google.com>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Kirill Tkhai <ktkhai@virtuozzo.com>, Dave Chinner <dchinner@redhat.com>,
 David Sterba <dsterba@suse.com>, Yang Shi <yang.shi@linux.alibaba.com>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, Chad Mynhier <chad.mynhier@oracle.com>,
 David Howells <dhowells@redhat.com>, Huang Shijie <sjhuang@iluvatar.ai>,
 Johannes Weiner <jweiner@fb.com>, Steve Capper <steve.capper@arm.com>,
 Networking <netdev@vger.kernel.org>, Gao Xiang <hsiangkao@aol.com>,
 Jeff Layton <jlayton@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Souptick Joarder <jrdr.linux@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Mon, Jul 29, 2019 at 10:03:40PM +0000, Song Liu wrote:
> > +/* If you add more flags, increment FGP_ORDER_SHIFT */
> > +#define	FGP_ORDER_SHIFT		7
> > +#define	FGP_PMD			((PMD_SHIFT - PAGE_SHIFT) << FGP_ORDER_SHIFT)
> > +#define	FGP_PUD			((PUD_SHIFT - PAGE_SHIFT) << FGP_ORDER_SHIFT)
> > +#define	fgp_get_order(fgp)	((fgp) >> FGP_ORDER_SHIFT)
> 
> This looks like we want support order up to 25 (32 - 7). I guess we don't 
> need that many. How about we specify the highest order to support here? 

We can support all the way up to order 64 with just 6 bits, leaving 32 -
6 - 7 = 19 bits free.  We haven't been adding FGP flags very quickly,
so I doubt we'll need anything larger.

> Also, fgp_flags is signed int, so we need to make sure fgp_flags is not
> negative. 

If we ever get there, I expect people to convert the parameter from signed
int to unsigned long.


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
