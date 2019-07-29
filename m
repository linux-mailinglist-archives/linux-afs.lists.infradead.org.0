Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 509257ABDF
	for <lists+linux-afs@lfdr.de>; Tue, 30 Jul 2019 17:03:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gKliUTGkOWZIKyjotXXY5TUADJhLotcNRUySIt5edmY=; b=oAPImbXGhM9E7S
	lnvFgxz60zBQUjG8oVcnLu9WzLAmvVGm3KuBkuwJSE6+j6LJy8/uqHS1Uyb9RAASyQCC+bGciWh6g
	9cyMRaxwZBqjDW01vcdj4Yjaglc6qq5/m4fRGP2aA4es2oCBFN0hFf9cAypeuWnAi3ONDxOqJaKfA
	eN22xn/w8GF4YkLuSw29ZT+gNODmVmcsUEDJESfkXUoOIgu7cCvOJrA5NHyrvm0Uab9nujruTI6A6
	FQXy6eu+AiUdG62StU8Ap2FFd7wX93492QzH1yTbw9kTx9gjmMg7VAqRnN1hXHZT9OBnoFI7tTajX
	Zh9laNPXRzX/vgNNq3Mg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsTek-0007YJ-8h; Tue, 30 Jul 2019 15:03:14 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsCua-0006Gl-N8
 for linux-afs@lists.infradead.org; Mon, 29 Jul 2019 21:10:30 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6TL9Vx2030410;
 Mon, 29 Jul 2019 21:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2018-07-02;
 bh=PL6wqvYOZ69qRzWKkDI0Itl6m3d3Bz9HZBNcef5DvnU=;
 b=QLLWrhStnCtACaMYcMeAgSrAwzhGF959ZKXAt4P7ceiqkwlsjnJhmhhSSy0zAEgHgeVa
 MjBMW5guN7vE3Eabe0WFsRxBEGPuJIvKFYaTLH1QyboFyMheb/aO/zjBW1wVLQb+XgZY
 OOJMNB8guzOZSavd75Qylswx31OsCZtT6F0j1ehu8m1mryRdbjBPoXDIgf7BlIp6Sc/v
 j587mDAK0qOMi+AM1cqEK59FboaleLZlqqS72nxRNWhXODik6oofnp+PsWZ7uAKCCTDL
 4QaPPEXobIHC2N6+UMCr8QTQBX8Yp+329WyjrfItC3dNJdfRZJqF0LxWIGIA0fU8yAFQ Aw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2u0e1tj9r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Jul 2019 21:09:55 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6TL7o5n015443;
 Mon, 29 Jul 2019 21:09:54 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2u0dxqf49y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Jul 2019 21:09:54 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6TL9kU9014044;
 Mon, 29 Jul 2019 21:09:46 GMT
Received: from localhost.localdomain (/73.243.10.6)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 29 Jul 2019 21:09:45 +0000
From: William Kucharski <william.kucharski@oracle.com>
To: ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, netdev@vger.kernel.org, Chris Mason <clm@fb.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH v2 1/2] mm: Allow the page cache to allocate large pages
Date: Mon, 29 Jul 2019 15:09:32 -0600
Message-Id: <20190729210933.18674-2-william.kucharski@oracle.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190729210933.18674-1-william.kucharski@oracle.com>
References: <20190729210933.18674-1-william.kucharski@oracle.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9333
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1907290231
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9333
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1907290231
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_141028_846976_A08668CE 
X-CRM114-Status: GOOD (  24.05  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [156.151.31.86 listed in list.dnswl.org]
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
 kbuild test robot <lkp@intel.com>, Sage Weil <sage@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
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

Add an order field to __page_cache_alloc() to allow for the allocation
of large memory page page cache entries.

Signed-off-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: William Kucharski <william.kucharski@oracle.com>
Reported-by: kbuild test robot <lkp@intel.com>
---
 fs/afs/dir.c            |  2 +-
 fs/btrfs/compression.c  |  2 +-
 fs/cachefiles/rdwr.c    |  4 ++--
 fs/ceph/addr.c          |  2 +-
 fs/ceph/file.c          |  2 +-
 include/linux/pagemap.h | 13 +++++++++----
 mm/filemap.c            | 25 +++++++++++++------------
 mm/readahead.c          |  2 +-
 net/ceph/pagelist.c     |  4 ++--
 net/ceph/pagevec.c      |  2 +-
 10 files changed, 32 insertions(+), 26 deletions(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index e640d67274be..0a392214f71e 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -274,7 +274,7 @@ static struct afs_read *afs_read_dir(struct afs_vnode *dvnode, struct key *key)
 				afs_stat_v(dvnode, n_inval);
 
 			ret = -ENOMEM;
-			req->pages[i] = __page_cache_alloc(gfp);
+			req->pages[i] = __page_cache_alloc(gfp, 0);
 			if (!req->pages[i])
 				goto error;
 			ret = add_to_page_cache_lru(req->pages[i],
diff --git a/fs/btrfs/compression.c b/fs/btrfs/compression.c
index 60c47b417a4b..5280e7477b7e 100644
--- a/fs/btrfs/compression.c
+++ b/fs/btrfs/compression.c
@@ -466,7 +466,7 @@ static noinline int add_ra_bio_pages(struct inode *inode,
 		}
 
 		page = __page_cache_alloc(mapping_gfp_constraint(mapping,
-								 ~__GFP_FS));
+								 ~__GFP_FS), 0);
 		if (!page)
 			break;
 
diff --git a/fs/cachefiles/rdwr.c b/fs/cachefiles/rdwr.c
index 44a3ce1e4ce4..11d30212745f 100644
--- a/fs/cachefiles/rdwr.c
+++ b/fs/cachefiles/rdwr.c
@@ -259,7 +259,7 @@ static int cachefiles_read_backing_file_one(struct cachefiles_object *object,
 			goto backing_page_already_present;
 
 		if (!newpage) {
-			newpage = __page_cache_alloc(cachefiles_gfp);
+			newpage = __page_cache_alloc(cachefiles_gfp, 0);
 			if (!newpage)
 				goto nomem_monitor;
 		}
@@ -495,7 +495,7 @@ static int cachefiles_read_backing_file(struct cachefiles_object *object,
 				goto backing_page_already_present;
 
 			if (!newpage) {
-				newpage = __page_cache_alloc(cachefiles_gfp);
+				newpage = __page_cache_alloc(cachefiles_gfp, 0);
 				if (!newpage)
 					goto nomem;
 			}
diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index e078cc55b989..bcb41fbee533 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -1707,7 +1707,7 @@ int ceph_uninline_data(struct file *filp, struct page *locked_page)
 		if (len > PAGE_SIZE)
 			len = PAGE_SIZE;
 	} else {
-		page = __page_cache_alloc(GFP_NOFS);
+		page = __page_cache_alloc(GFP_NOFS, 0);
 		if (!page) {
 			err = -ENOMEM;
 			goto out;
diff --git a/fs/ceph/file.c b/fs/ceph/file.c
index 685a03cc4b77..ae58d7c31aa4 100644
--- a/fs/ceph/file.c
+++ b/fs/ceph/file.c
@@ -1305,7 +1305,7 @@ static ssize_t ceph_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		struct page *page = NULL;
 		loff_t i_size;
 		if (retry_op == READ_INLINE) {
-			page = __page_cache_alloc(GFP_KERNEL);
+			page = __page_cache_alloc(GFP_KERNEL, 0);
 			if (!page)
 				return -ENOMEM;
 		}
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index c7552459a15f..e9004e3cb6a3 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -208,17 +208,17 @@ static inline int page_cache_add_speculative(struct page *page, int count)
 }
 
 #ifdef CONFIG_NUMA
-extern struct page *__page_cache_alloc(gfp_t gfp);
+extern struct page *__page_cache_alloc(gfp_t gfp, unsigned int order);
 #else
-static inline struct page *__page_cache_alloc(gfp_t gfp)
+static inline struct page *__page_cache_alloc(gfp_t gfp, unsigned int order)
 {
-	return alloc_pages(gfp, 0);
+	return alloc_pages(gfp, order);
 }
 #endif
 
 static inline struct page *page_cache_alloc(struct address_space *x)
 {
-	return __page_cache_alloc(mapping_gfp_mask(x));
+	return __page_cache_alloc(mapping_gfp_mask(x), 0);
 }
 
 static inline gfp_t readahead_gfp_mask(struct address_space *x)
@@ -240,6 +240,11 @@ pgoff_t page_cache_prev_miss(struct address_space *mapping,
 #define FGP_NOFS		0x00000010
 #define FGP_NOWAIT		0x00000020
 #define FGP_FOR_MMAP		0x00000040
+/* If you add more flags, increment FGP_ORDER_SHIFT */
+#define	FGP_ORDER_SHIFT		7
+#define	FGP_PMD			((PMD_SHIFT - PAGE_SHIFT) << FGP_ORDER_SHIFT)
+#define	FGP_PUD			((PUD_SHIFT - PAGE_SHIFT) << FGP_ORDER_SHIFT)
+#define	fgp_get_order(fgp)	((fgp) >> FGP_ORDER_SHIFT)
 
 struct page *pagecache_get_page(struct address_space *mapping, pgoff_t offset,
 		int fgp_flags, gfp_t cache_gfp_mask);
diff --git a/mm/filemap.c b/mm/filemap.c
index d0cf700bf201..a96092243fc4 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -954,7 +954,7 @@ int add_to_page_cache_lru(struct page *page, struct address_space *mapping,
 EXPORT_SYMBOL_GPL(add_to_page_cache_lru);
 
 #ifdef CONFIG_NUMA
-struct page *__page_cache_alloc(gfp_t gfp)
+struct page *__page_cache_alloc(gfp_t gfp, unsigned int order)
 {
 	int n;
 	struct page *page;
@@ -964,12 +964,12 @@ struct page *__page_cache_alloc(gfp_t gfp)
 		do {
 			cpuset_mems_cookie = read_mems_allowed_begin();
 			n = cpuset_mem_spread_node();
-			page = __alloc_pages_node(n, gfp, 0);
+			page = __alloc_pages_node(n, gfp, order);
 		} while (!page && read_mems_allowed_retry(cpuset_mems_cookie));
 
 		return page;
 	}
-	return alloc_pages(gfp, 0);
+	return alloc_pages(gfp, order);
 }
 EXPORT_SYMBOL(__page_cache_alloc);
 #endif
@@ -1597,12 +1597,12 @@ EXPORT_SYMBOL(find_lock_entry);
  * pagecache_get_page - find and get a page reference
  * @mapping: the address_space to search
  * @offset: the page index
- * @fgp_flags: PCG flags
+ * @fgp_flags: FGP flags
  * @gfp_mask: gfp mask to use for the page cache data page allocation
  *
  * Looks up the page cache slot at @mapping & @offset.
  *
- * PCG flags modify how the page is returned.
+ * FGP flags modify how the page is returned.
  *
  * @fgp_flags can be:
  *
@@ -1615,6 +1615,7 @@ EXPORT_SYMBOL(find_lock_entry);
  * - FGP_FOR_MMAP: Similar to FGP_CREAT, only we want to allow the caller to do
  *   its own locking dance if the page is already in cache, or unlock the page
  *   before returning if we had to add the page to pagecache.
+ * - FGP_PMD: If FGP_CREAT is specified, attempt to allocate a PMD-sized page.
  *
  * If FGP_LOCK or FGP_CREAT are specified then the function may sleep even
  * if the GFP flags specified for FGP_CREAT are atomic.
@@ -1660,12 +1661,13 @@ struct page *pagecache_get_page(struct address_space *mapping, pgoff_t offset,
 no_page:
 	if (!page && (fgp_flags & FGP_CREAT)) {
 		int err;
-		if ((fgp_flags & FGP_WRITE) && mapping_cap_account_dirty(mapping))
+		if ((fgp_flags & FGP_WRITE) &&
+			mapping_cap_account_dirty(mapping))
 			gfp_mask |= __GFP_WRITE;
 		if (fgp_flags & FGP_NOFS)
 			gfp_mask &= ~__GFP_FS;
 
-		page = __page_cache_alloc(gfp_mask);
+		page = __page_cache_alloc(gfp_mask, fgp_get_order(fgp_flags));
 		if (!page)
 			return NULL;
 
@@ -2802,15 +2804,14 @@ static struct page *wait_on_page_read(struct page *page)
 static struct page *do_read_cache_page(struct address_space *mapping,
 				pgoff_t index,
 				int (*filler)(void *, struct page *),
-				void *data,
-				gfp_t gfp)
+				void *data, unsigned int order, gfp_t gfp)
 {
 	struct page *page;
 	int err;
 repeat:
 	page = find_get_page(mapping, index);
 	if (!page) {
-		page = __page_cache_alloc(gfp);
+		page = __page_cache_alloc(gfp, order);
 		if (!page)
 			return ERR_PTR(-ENOMEM);
 		err = add_to_page_cache_lru(page, mapping, index, gfp);
@@ -2917,7 +2918,7 @@ struct page *read_cache_page(struct address_space *mapping,
 				int (*filler)(void *, struct page *),
 				void *data)
 {
-	return do_read_cache_page(mapping, index, filler, data,
+	return do_read_cache_page(mapping, index, filler, data, 0,
 			mapping_gfp_mask(mapping));
 }
 EXPORT_SYMBOL(read_cache_page);
@@ -2939,7 +2940,7 @@ struct page *read_cache_page_gfp(struct address_space *mapping,
 				pgoff_t index,
 				gfp_t gfp)
 {
-	return do_read_cache_page(mapping, index, NULL, NULL, gfp);
+	return do_read_cache_page(mapping, index, NULL, NULL, 0, gfp);
 }
 EXPORT_SYMBOL(read_cache_page_gfp);
 
diff --git a/mm/readahead.c b/mm/readahead.c
index 2fe72cd29b47..954760a612ea 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -193,7 +193,7 @@ unsigned int __do_page_cache_readahead(struct address_space *mapping,
 			continue;
 		}
 
-		page = __page_cache_alloc(gfp_mask);
+		page = __page_cache_alloc(gfp_mask, 0);
 		if (!page)
 			break;
 		page->index = page_offset;
diff --git a/net/ceph/pagelist.c b/net/ceph/pagelist.c
index 65e34f78b05d..0c3face908dc 100644
--- a/net/ceph/pagelist.c
+++ b/net/ceph/pagelist.c
@@ -56,7 +56,7 @@ static int ceph_pagelist_addpage(struct ceph_pagelist *pl)
 	struct page *page;
 
 	if (!pl->num_pages_free) {
-		page = __page_cache_alloc(GFP_NOFS);
+		page = __page_cache_alloc(GFP_NOFS, 0);
 	} else {
 		page = list_first_entry(&pl->free_list, struct page, lru);
 		list_del(&page->lru);
@@ -107,7 +107,7 @@ int ceph_pagelist_reserve(struct ceph_pagelist *pl, size_t space)
 	space = (space + PAGE_SIZE - 1) >> PAGE_SHIFT;   /* conv to num pages */
 
 	while (space > pl->num_pages_free) {
-		struct page *page = __page_cache_alloc(GFP_NOFS);
+		struct page *page = __page_cache_alloc(GFP_NOFS, 0);
 		if (!page)
 			return -ENOMEM;
 		list_add_tail(&page->lru, &pl->free_list);
diff --git a/net/ceph/pagevec.c b/net/ceph/pagevec.c
index 64305e7056a1..1d07e639216d 100644
--- a/net/ceph/pagevec.c
+++ b/net/ceph/pagevec.c
@@ -45,7 +45,7 @@ struct page **ceph_alloc_page_vector(int num_pages, gfp_t flags)
 	if (!pages)
 		return ERR_PTR(-ENOMEM);
 	for (i = 0; i < num_pages; i++) {
-		pages[i] = __page_cache_alloc(flags);
+		pages[i] = __page_cache_alloc(flags, 0);
 		if (pages[i] == NULL) {
 			ceph_release_page_vector(pages, i);
 			return ERR_PTR(-ENOMEM);
-- 
2.21.0


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
