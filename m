Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7DD7ABE1
	for <lists+linux-afs@lfdr.de>; Tue, 30 Jul 2019 17:03:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=znReyRiHp9esv5YrwIIdTkJO5nBIvmDEsFspNPpKaZk=; b=UfooUNc2lKRCXW
	1oH3ivxAIdPLVbd/NVKa30xXOsbK59H9NUQ3sJCeRhkOsq5ib8d0ISIuxMF9R1WU2duEdDNffLEGQ
	19NtNxQ0+iLzDvFuSjXsixQrgxLi8wg4wp1sbAGXnSxXPJ/iuPHiXaYuVcZV0yN0RVhYN3N9TzG/7
	XrlHL0F1SY4x0ldxkb/XDN7jHZH1aSSexEtrTXkN96rK0VgvMScWMqcKyrfoYj9sZk6+W/ur7UgK8
	9jqtmp+NPkUQQYHOW0pDoSA4M5QfxK8BOD4EkFHG6dIT4wsmzQAtmtoGvHMuzv7aeG3HSDsS1uLE3
	ucqDbcTmTzK2dNR7S94w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsTej-0007Y3-VK; Tue, 30 Jul 2019 15:03:13 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsCua-0006Gk-FY
 for linux-afs@lists.infradead.org; Mon, 29 Jul 2019 21:10:30 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6TL9HCm114121;
 Mon, 29 Jul 2019 21:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2018-07-02; bh=4KSes26WgUMhT1igPrIU0w8ZoUI0wOL00tWHmqFWcug=;
 b=AVm6GvBCDSDER9LQ0Vd/Ua8EhdNOfKTyrmbFzUB9hF+j/aquEONk6+lhlpadDjv/Mjxj
 mtjY2EhHRiyMcl6yGg4/hVrDWT1LDkca+vDVENM2NmTtv1xNebX+8MuW5vZ4goaZARSu
 ZQ9KbxJJ2VHNb01YerEPKrJqPIINUdc4InDfktgTOgmaw5P9Wk8qGIu1onRtfQE+br6H
 e+YjUeghWuO4LBKsP6BEtzIwVrYBLGFKRZm/UZpSpQirC26bK4F+E7jLfYiip8h/Oft6
 e2hIv/EjJI1Y9Lsur8xXqlDca75p6LdS5nJERA539BwruA2+ikD7QPCHRGPMt2NbFFrt UQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2u0ejpa4w0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Jul 2019 21:09:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6TL7vq9104163;
 Mon, 29 Jul 2019 21:09:55 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2u0xv7rj84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Jul 2019 21:09:55 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x6TL9ihD009747;
 Mon, 29 Jul 2019 21:09:44 GMT
Received: from localhost.localdomain (/73.243.10.6)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 29 Jul 2019 21:09:43 +0000
From: William Kucharski <william.kucharski@oracle.com>
To: ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, netdev@vger.kernel.org, Chris Mason <clm@fb.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH v2 0/2] mm,thp: Add filemap_huge_fault() for THP
Date: Mon, 29 Jul 2019 15:09:31 -0600
Message-Id: <20190729210933.18674-1-william.kucharski@oracle.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9333
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1907290231
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9333
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1907290231
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_141028_615057_B0C45706 
X-CRM114-Status: GOOD (  16.17  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [141.146.126.78 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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
 Amir Goldstein <amir73il@gmail.com>, Keith Busch <keith.busch@intel.com>,
 William Kucharski <william.kucharski@oracle.com>,
 Yafang Shao <laoar.shao@gmail.com>, Arun KS <arunks@codeaurora.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Sage Weil <sage@redhat.com>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Hugh Dickins <hughd@google.com>, Pavel Tatashin <pasha.tatashin@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrey Konovalov <andreyknvl@google.com>,
 Dave Airlie <airlied@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Huang Shijie <sjhuang@iluvatar.ai>, Bob Kasten <robert.a.kasten@intel.com>,
 Miklos Szeredi <mszeredi@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Jann Horn <jannh@google.com>,
 John Hubbard <jhubbard@nvidia.com>, David Rientjes <rientjes@google.com>,
 "john.hubbard@gmail.com" <john.hubbard@gmail.com>,
 Ross Zwisler <zwisler@google.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Kirill Tkhai <ktkhai@virtuozzo.com>, Dave Chinner <dchinner@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Chad Mynhier <chad.mynhier@oracle.com>, David Howells <dhowells@redhat.com>,
 Yang Shi <yang.shi@linux.alibaba.com>, Johannes Weiner <jweiner@fb.com>,
 Steve Capper <steve.capper@arm.com>, Gao Xiang <hsiangkao@aol.com>,
 Jeff Layton <jlayton@kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

This set of patches is the first step towards a mechanism for automatically
mapping read-only text areas of appropriate size and alignment to THPs whenever
possible.

For now, the central routine, filemap_huge_fault(), amd various support
routines are only included if the experimental kernel configuration option

        RO_EXEC_FILEMAP_HUGE_FAULT_THP

is enabled.

This is because filemap_huge_fault() is dependent upon the
address_space_operations vector readpage() pointing to a routine that
will read and fill an entire large page at a time without poulluting the
page cache with PAGESIZE entries for the large page being mapped or
performing readahead that would pollute the page cache entries for
succeeding large pages. Unfortunately, there is no good way to determine
how many bytes were read by readpage(). At present, if filemap_huge_fault()
were to call a conventional readpage() routine, it would only fill the first
PAGESIZE bytes of the large page, which is definitely NOT the desired behavior.

However, by making the code available now it is hoped that filesystem
maintainers who have pledged to provide such a mechanism will do so more
rapidly.

The first part of the patch adds an order field to __page_cache_alloc(),
allowing callers to directly request page cache pages of various sizes.
This code was provided by Matthew Wilcox.

The second part of the patch implements the filemap_huge_fault() mechanism as
described above.

Changes since v1:
1. Fix improperly generated patch for v1 PATCH 1/2

Matthew Wilcox (1):
  mm: Allow the page cache to allocate large pages

William Kucharski (2):
  mm: Allow the page cache to allocate large pages
  mm,thp: Add experimental config option RO_EXEC_FILEMAP_HUGE_FAULT_THP

 fs/afs/dir.c            |   2 +-
 fs/btrfs/compression.c  |   2 +-
 fs/cachefiles/rdwr.c    |   4 +-
 fs/ceph/addr.c          |   2 +-
 fs/ceph/file.c          |   2 +-
 include/linux/huge_mm.h |  16 +-
 include/linux/mm.h      |   6 +
 include/linux/pagemap.h |  13 +-
 mm/Kconfig              |  15 ++
 mm/filemap.c            | 322 ++++++++++++++++++++++++++++++++++++++--
 mm/huge_memory.c        |   3 +
 mm/mmap.c               |  36 ++++-
 mm/readahead.c          |   2 +-
 mm/rmap.c               |   8 +
 net/ceph/pagelist.c     |   4 +-
 net/ceph/pagevec.c      |   2 +-
 16 files changed, 404 insertions(+), 35 deletions(-)

-- 
2.21.0


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
