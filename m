Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FFF7ABE4
	for <lists+linux-afs@lfdr.de>; Tue, 30 Jul 2019 17:03:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8A8D00g6ehuHPFLWzhN4D2r32BmWwMoI6zUg8tWgTVo=; b=OpE9+qkTZXAiBL
	h+tZXnkTzp0gETNFL7aN/Dx4+xEmuqjWy9HohDz1Utr4LmMrC+M2/c8wTlaoLD+rTxEIFZdck+113
	pVM4mu8ufF+gHzNxjJJj5pPzLnkS+EWAljb4dUTiqmgZ13jKktl38+zl46NUIs2xU3UHJzH+zl2Vh
	SHwQPx56TFem1FeQrnB9jyxWhF+Yd8SSXYbL8dFUmhiDKF/R3HL121xKGqm/C2YH1WrhTqY+3RCQP
	12/1MXO/Yp+vXzW/lzBlkTJUck4ESC1Y9Mbf4SJIOsvDgbJsrTPV3OGj6/CwZnJJlvtQzhfayXklt
	St7V/xv/455qs4Gzw8vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsTem-0007aT-4J; Tue, 30 Jul 2019 15:03:16 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsEQV-0006qZ-UA
 for linux-afs@lists.infradead.org; Mon, 29 Jul 2019 22:47:33 +0000
Received: by mail-ot1-x343.google.com with SMTP id b7so14112680otl.11
 for <linux-afs@lists.infradead.org>; Mon, 29 Jul 2019 15:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pGspLfcI5dn5auhu00Bv2+O8qwFw4pt/q/3bCgR/aZw=;
 b=EOmDqSUs6hF+pZuWJuftA9aPq6cFQag5ny9EnkBeJ52z+kxmdOlolee9p59Vu9GLYe
 azUD+vpI7tLeFRzKlDoIn1egahB1uqvzdlbrjizMxUW9A/UwDxtf59CDnUSZTPl8LQe/
 PZ5l7VAae/xLJ7a0946KkLsLEKwTX4hwTuIKJbUbez6hGUeF+2lprVVNoJfkMUKUZPr9
 gyGVmD4remu6IJFA2BYiQiQS5pQMU813zUOs+aqX/5MaDBg6hK7eLjSpYQGRQeJbjA+o
 hLgWlZp6LgSWIhDLY2jJe1zfQDuYGhMsFk5O28Dd2PAzOdfBfliNHLKqJmh5a7avY4bc
 ajMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pGspLfcI5dn5auhu00Bv2+O8qwFw4pt/q/3bCgR/aZw=;
 b=Fq6w8FPDbZvrBof0FvKN7Da4UdaDvMW6zXzk17PBBigBDXCLPeWBLeFUkVTmLRoEG2
 Q+v7PU0tgQ9IlfUiQ1n5LiDGPo9K2J4VNwoGqSygyjFqRYGxO+ONKo6ylU8t/vZvuQcn
 +a3xhoEqX9gnnzKF74CV21UMurr2B6dYWlFXsyhtFEsF4umcP9wuNE6v/kZG476crqjA
 s1TYODfdyV7PUUgY/Jx7SJBLlcYVI09W+Y4ZBtQDgatOzP7BTEJc40nIuDrlELekUEuT
 +7/7iTiqdvNWnD2cB0oLaKQDelzNaeIq/1u692ut/1MdNv19y19+b3jlLV1icxmuTpW6
 WXow==
X-Gm-Message-State: APjAAAUNguVz0fwM/re9nlTddy0Uw06qQYKOlNZ2hJnN8SjQ/89ObCPW
 RfkzQlzkJ39OodfB9fzl+evB51exoKc24tq7xvrArQ==
X-Google-Smtp-Source: APXvYqwHhK0pqI+UxAUN6eAkNnP/kNGmpG2YxVMQQM9wqFP7fHOj5FZgU+QRymxyn7zomdaevLtN1Er7dDlil0CjgHA=
X-Received: by 2002:a9d:7a9a:: with SMTP id l26mr7501139otn.71.1564440450856; 
 Mon, 29 Jul 2019 15:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190729210933.18674-1-william.kucharski@oracle.com>
 <20190729210933.18674-3-william.kucharski@oracle.com>
In-Reply-To: <20190729210933.18674-3-william.kucharski@oracle.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 29 Jul 2019 15:47:18 -0700
Message-ID: <CAPcyv4ixiBOXz97iZV2ARp8Uqwk2BbEW+5Q6e3vfAjv8LToPfw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm,
 thp: Add experimental config option RO_EXEC_FILEMAP_HUGE_FAULT_THP
To: William Kucharski <william.kucharski@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_154732_037103_13AFCF49 
X-CRM114-Status: GOOD (  15.32  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:343 listed in]
 [list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Mailman-Approved-At: Tue, 30 Jul 2019 08:03:12 -0700
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
 Chris Mason <clm@fb.com>, Yafang Shao <laoar.shao@gmail.com>,
 Arun KS <arunks@codeaurora.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Ira Weiny <ira.weiny@intel.com>, linux-afs@lists.infradead.org,
 Gao Xiang <hsiangkao@aol.com>, Sage Weil <sage@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Hugh Dickins <hughd@google.com>, Pavel Tatashin <pasha.tatashin@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrey Konovalov <andreyknvl@google.com>,
 Dave Airlie <airlied@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Huang Shijie <sjhuang@iluvatar.ai>, Bob Kasten <robert.a.kasten@intel.com>,
 Miklos Szeredi <mszeredi@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Amir Goldstein <amir73il@gmail.com>, Jann Horn <jannh@google.com>,
 John Hubbard <jhubbard@nvidia.com>, David Rientjes <rientjes@google.com>,
 "john.hubbard@gmail.com" <john.hubbard@gmail.com>,
 Josef Bacik <josef@toxicpanda.com>, Ross Zwisler <zwisler@google.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Kirill Tkhai <ktkhai@virtuozzo.com>, Dave Chinner <dchinner@redhat.com>,
 David Sterba <dsterba@suse.com>, ceph-devel@vger.kernel.org,
 Vlastimil Babka <vbabka@suse.cz>, Chad Mynhier <chad.mynhier@oracle.com>,
 David Howells <dhowells@redhat.com>, Yang Shi <yang.shi@linux.alibaba.com>,
 Johannes Weiner <jweiner@fb.com>, Linux MM <linux-mm@kvack.org>,
 Netdev <netdev@vger.kernel.org>, Steve Capper <steve.capper@arm.com>,
 Jeff Layton <jlayton@kernel.org>,
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

On Mon, Jul 29, 2019 at 2:10 PM William Kucharski
<william.kucharski@oracle.com> wrote:
>
> Add filemap_huge_fault() to attempt to satisfy page faults on
> memory-mapped read-only text pages using THP when possible.
>
> Signed-off-by: William Kucharski <william.kucharski@oracle.com>
[..]
> +/**
> + * filemap_huge_fault - read in file data for page fault handling to THP
> + * @vmf:       struct vm_fault containing details of the fault
> + * @pe_size:   large page size to map, currently this must be PE_SIZE_PMD
> + *
> + * filemap_huge_fault() is invoked via the vma operations vector for a
> + * mapped memory region to read in file data to a transparent huge page during
> + * a page fault.
> + *
> + * If for any reason we can't allocate a THP, map it or add it to the page
> + * cache, VM_FAULT_FALLBACK will be returned which will cause the fault
> + * handler to try mapping the page using a PAGESIZE page, usually via
> + * filemap_fault() if so speicifed in the vma operations vector.
> + *
> + * Returns either VM_FAULT_FALLBACK or the result of calling allcc_set_pte()
> + * to map the new THP.
> + *
> + * NOTE: This routine depends upon the file system's readpage routine as
> + *       specified in the address space operations vector to recognize when it
> + *      is being passed a large page and to read the approprate amount of data
> + *      in full and without polluting the page cache for the large page itself
> + *      with PAGESIZE pages to perform a buffered read or to pollute what
> + *      would be the page cache space for any succeeding pages with PAGESIZE
> + *      pages due to readahead.
> + *
> + *      It is VITAL that this routine not be enabled without such filesystem
> + *      support.

Rather than a hopeful comment, this wants an explicit mechanism to
prevent inadvertent mismatched ->readpage() assumptions. Either a new
->readhugepage() op, or a flags field in 'struct
address_space_operations' indicating that the address_space opts into
being careful to handle huge page arguments. I.e. something like
mmap_supported_flags that was added to 'struct file_operations'.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
