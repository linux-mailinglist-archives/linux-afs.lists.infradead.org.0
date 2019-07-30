Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA4A7BC62
	for <lists+linux-afs@lfdr.de>; Wed, 31 Jul 2019 10:57:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4p2gR6vKE0VJElmxUUrtVeyaA5tIN1UlCDWYs+ViHUU=; b=tZOBvmIJdcyMXl
	6zyUdF0+IuNppIvO9agGTXU41pwBtDOKSiHPH9ocGvUlZNM2LgN/WosycG7C3GDXSttWqLwW4/yxR
	kVHFa1M8K1TdrartWgZWeTHAyz0qQGkaxd3HELTbn+owL3Fy8WmQFC/KacI5aoGffqLIFAzxrHksO
	4s+fD0jJVtgVqLCGL/DRkgJoebbcvYGT7nBeA3F+gByvL8EPluT06bt7Lx1JpC0FEm+QezjHO2HCa
	1K9Vtex6KaUTDrMgUku2kfRRMHh/fNjM3bkRF+seOxmUiMxe5Y9dS4hcPSnK36zGKSq9VCh66WMde
	YfmzgK3AfwJVO5FGFidQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hskQL-0005rq-0K; Wed, 31 Jul 2019 08:57:29 +0000
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red
 Hat Linux)) id 1hsXdZ-0000za-I2; Tue, 30 Jul 2019 19:18:17 +0000
Date: Tue, 30 Jul 2019 12:18:17 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v2 2/2] mm,thp: Add experimental config option
 RO_EXEC_FILEMAP_HUGE_FAULT_THP
Message-ID: <20190730191817.GB4700@bombadil.infradead.org>
References: <20190729210933.18674-1-william.kucharski@oracle.com>
 <20190729210933.18674-3-william.kucharski@oracle.com>
 <CAPcyv4ixiBOXz97iZV2ARp8Uqwk2BbEW+5Q6e3vfAjv8LToPfw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4ixiBOXz97iZV2ARp8Uqwk2BbEW+5Q6e3vfAjv8LToPfw@mail.gmail.com>
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
Cc: Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>,
 Jan Kara <jack@suse.cz>, Yangtao Li <tiny.windzz@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Keith Busch <keith.busch@intel.com>,
 William Kucharski <william.kucharski@oracle.com>,
 Yafang Shao <laoar.shao@gmail.com>, Arun KS <arunks@codeaurora.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Ira Weiny <ira.weiny@intel.com>, linux-afs@lists.infradead.org,
 Gao Xiang <hsiangkao@aol.com>, Sage Weil <sage@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Hugh Dickins <hughd@google.com>, Pavel Tatashin <pasha.tatashin@oracle.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Andrey Konovalov <andreyknvl@google.com>, Dave Airlie <airlied@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, Linux MM <linux-mm@kvack.org>,
 Bob Kasten <robert.a.kasten@intel.com>, Miklos Szeredi <mszeredi@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Amir Goldstein <amir73il@gmail.com>,
 Jann Horn <jannh@google.com>, John Hubbard <jhubbard@nvidia.com>,
 David Rientjes <rientjes@google.com>,
 "john.hubbard@gmail.com" <john.hubbard@gmail.com>,
 Josef Bacik <josef@toxicpanda.com>, Ross Zwisler <zwisler@google.com>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Kirill Tkhai <ktkhai@virtuozzo.com>, Dave Chinner <dchinner@redhat.com>,
 David Sterba <dsterba@suse.com>, Yang Shi <yang.shi@linux.alibaba.com>,
 ceph-devel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
 Chad Mynhier <chad.mynhier@oracle.com>, David Howells <dhowells@redhat.com>,
 Huang Shijie <sjhuang@iluvatar.ai>, Johannes Weiner <jweiner@fb.com>,
 Chris Mason <clm@fb.com>, Netdev <netdev@vger.kernel.org>,
 Steve Capper <steve.capper@arm.com>, Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Souptick Joarder <jrdr.linux@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-btrfs@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Mon, Jul 29, 2019 at 03:47:18PM -0700, Dan Williams wrote:
> On Mon, Jul 29, 2019 at 2:10 PM William Kucharski
> <william.kucharski@oracle.com> wrote:
> >
> > Add filemap_huge_fault() to attempt to satisfy page faults on
> > memory-mapped read-only text pages using THP when possible.
> >
> > Signed-off-by: William Kucharski <william.kucharski@oracle.com>
> [..]
> > +/**
> > + * filemap_huge_fault - read in file data for page fault handling to THP
> > + * @vmf:       struct vm_fault containing details of the fault
> > + * @pe_size:   large page size to map, currently this must be PE_SIZE_PMD
> > + *
> > + * filemap_huge_fault() is invoked via the vma operations vector for a
> > + * mapped memory region to read in file data to a transparent huge page during
> > + * a page fault.
> > + *
> > + * If for any reason we can't allocate a THP, map it or add it to the page
> > + * cache, VM_FAULT_FALLBACK will be returned which will cause the fault
> > + * handler to try mapping the page using a PAGESIZE page, usually via
> > + * filemap_fault() if so speicifed in the vma operations vector.
> > + *
> > + * Returns either VM_FAULT_FALLBACK or the result of calling allcc_set_pte()
> > + * to map the new THP.
> > + *
> > + * NOTE: This routine depends upon the file system's readpage routine as
> > + *       specified in the address space operations vector to recognize when it
> > + *      is being passed a large page and to read the approprate amount of data
> > + *      in full and without polluting the page cache for the large page itself
> > + *      with PAGESIZE pages to perform a buffered read or to pollute what
> > + *      would be the page cache space for any succeeding pages with PAGESIZE
> > + *      pages due to readahead.
> > + *
> > + *      It is VITAL that this routine not be enabled without such filesystem
> > + *      support.
> 
> Rather than a hopeful comment, this wants an explicit mechanism to
> prevent inadvertent mismatched ->readpage() assumptions.

Filesystems have to opt in to this.  If they add a ->huge_fault entry to
their vm_operations_struct without updating their ->readpage implementation,
they only have themselves to blame.


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
