Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 90256788F1
	for <lists+linux-afs@lfdr.de>; Mon, 29 Jul 2019 11:56:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6KheLWPW0qJy7f1VmGW2Y0bn/cMv9w8fOCv/Vst1aA=; b=QTOHA0XB+WLlCK
	qjyJqgv4bw3c1drJwSXOQfyqh4ZRUhnlfQDlBc+GXSWKdN/urrl5e3k8nw4m5c2qoKR67gXd2+NY5
	Gs7c2xAAfwNGiFaALCYvppFjV+2XQkLDaV9dVtCAfymxLXxbcHBp1/ZN0RXlpPYwN9LD7D2eb8sEV
	Qs35Gbqqu6oS/SMu4E2LhRVRDCUIdckMHYe12cosJuqO5/3aOPfDWdpBWuErBnzK/cv4nUT8yEwhm
	7v3ALOhXPy6T9ozJOteuJvcke+Cxn49OsP91GxOGRvYGfOtXK/3o1bv2CYPLaXXAOlY02SmsK0OMg
	ViPaqJiACAA+rVVjKflA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs2Nv-0006yB-3r; Mon, 29 Jul 2019 09:56:03 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrrzA-0006a2-Dk
 for linux-afs@lists.infradead.org; Sun, 28 Jul 2019 22:49:50 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6SMn0ph122253;
 Sun, 28 Jul 2019 22:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2018-07-02;
 bh=S9KBF/pS27HQ+uM51PqT7V8xsgrDeN1Xf1n13POVSqQ=;
 b=S/5OvWHZB7A5FtHicHND6rysgW0wTVntRijGGD8oI1SESAGT+L0JdHg9MICkPF+PNtVd
 EEvGQsM/nw8Xwj0pfSL3bY+Wkgaff3HXh3Va/iP0dlwLrM6EYXfoDiq4edJ0+fA6GJ/S
 DG8ScIpFkXoGbKhK1jOGjaCLH2g8mj+dXmWLWs1/+QADqMzuD4V5Qy5vjAFDOTwNafgy
 ToLVdwetQWseBIUhUiFDt3L/a2tkRgdJcWKeuMdjBtaiNLNwNpmHk2NM68rqsoKxgNkA
 ftXWqe3U9JV54LYItpthUhLYHBOUn2ZF2DqoqayiUbQ0gpGYlMq9Ihayw9uJFeolPMMu /Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2u0f8qm2ur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 28 Jul 2019 22:49:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6SMlr2a133390;
 Sun, 28 Jul 2019 22:48:56 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2u0ee3kn34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 28 Jul 2019 22:48:56 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6SMmjl0021293;
 Sun, 28 Jul 2019 22:48:45 GMT
Received: from localhost.localdomain (/73.243.10.6)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 28 Jul 2019 15:48:45 -0700
From: William Kucharski <william.kucharski@oracle.com>
To: ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, netdev@vger.kernel.org, Chris Mason <clm@fb.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH 2/2] mm,
 thp: Add experimental config option RO_EXEC_FILEMAP_HUGE_FAULT_THP
Date: Sun, 28 Jul 2019 16:47:08 -0600
Message-Id: <20190728224708.28192-3-william.kucharski@oracle.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190728224708.28192-1-william.kucharski@oracle.com>
References: <20190728224708.28192-1-william.kucharski@oracle.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9332
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1907280284
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9332
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1907280285
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190728_154948_605576_E527FF3A 
X-CRM114-Status: GOOD (  32.65  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [156.151.31.85 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Mon, 29 Jul 2019 02:56:00 -0700
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
 root <root@localhost.localdomain>, Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: root <root@localhost.localdomain>

Signed-off-by: William Kucharski <william.kucharski@oracle.com>
---
 include/linux/huge_mm.h |  16 ++-
 include/linux/mm.h      |   6 +
 mm/Kconfig              |  15 ++
 mm/filemap.c            | 301 +++++++++++++++++++++++++++++++++++++++-
 mm/huge_memory.c        |   3 +
 mm/mmap.c               |  36 ++++-
 mm/rmap.c               |   8 ++
 7 files changed, 374 insertions(+), 11 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 45ede62aa85b..34723f7e75d0 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -79,13 +79,15 @@ extern struct kobj_attribute shmem_enabled_attr;
 #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-#define HPAGE_PMD_SHIFT PMD_SHIFT
-#define HPAGE_PMD_SIZE	((1UL) << HPAGE_PMD_SHIFT)
-#define HPAGE_PMD_MASK	(~(HPAGE_PMD_SIZE - 1))
-
-#define HPAGE_PUD_SHIFT PUD_SHIFT
-#define HPAGE_PUD_SIZE	((1UL) << HPAGE_PUD_SHIFT)
-#define HPAGE_PUD_MASK	(~(HPAGE_PUD_SIZE - 1))
+#define HPAGE_PMD_SHIFT		PMD_SHIFT
+#define HPAGE_PMD_SIZE		((1UL) << HPAGE_PMD_SHIFT)
+#define	HPAGE_PMD_OFFSET	(HPAGE_PMD_SIZE - 1)
+#define HPAGE_PMD_MASK		(~(HPAGE_PMD_OFFSET))
+
+#define HPAGE_PUD_SHIFT		PUD_SHIFT
+#define HPAGE_PUD_SIZE		((1UL) << HPAGE_PUD_SHIFT)
+#define	HPAGE_PUD_OFFSET	(HPAGE_PUD_SIZE - 1)
+#define HPAGE_PUD_MASK		(~(HPAGE_PUD_OFFSET))
 
 extern bool is_vma_temporary_stack(struct vm_area_struct *vma);
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0334ca97c584..ba24b515468a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2433,6 +2433,12 @@ extern void truncate_inode_pages_final(struct address_space *);
 
 /* generic vm_area_ops exported for stackable file systems */
 extern vm_fault_t filemap_fault(struct vm_fault *vmf);
+
+#ifdef CONFIG_RO_EXEC_FILEMAP_HUGE_FAULT_THP
+extern vm_fault_t filemap_huge_fault(struct vm_fault *vmf,
+			enum page_entry_size pe_size);
+#endif
+
 extern void filemap_map_pages(struct vm_fault *vmf,
 		pgoff_t start_pgoff, pgoff_t end_pgoff);
 extern vm_fault_t filemap_page_mkwrite(struct vm_fault *vmf);
diff --git a/mm/Kconfig b/mm/Kconfig
index 56cec636a1fc..2debaded0e4d 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -736,4 +736,19 @@ config ARCH_HAS_PTE_SPECIAL
 config ARCH_HAS_HUGEPD
 	bool
 
+config RO_EXEC_FILEMAP_HUGE_FAULT_THP
+	bool "read-only exec filemap_huge_fault THP support (EXPERIMENTAL)"
+	depends on TRANSPARENT_HUGE_PAGECACHE && SHMEM
+
+	help
+	    Introduce filemap_huge_fault() to automatically map executable
+	    read-only pages of mapped files of suitable size and alignment
+	    using THP if possible.
+
+	    This is marked experimental because it is a new feature and is
+	    dependent upon filesystmes implementing readpages() in a way
+	    that will recognize large THP pages and read file content to
+	    them without polluting the pagecache with PAGESIZE pages due
+	    to readahead.
+
 endmenu
diff --git a/mm/filemap.c b/mm/filemap.c
index eb4c87428099..4e7287db0d8e 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -199,6 +199,8 @@ static void unaccount_page_cache_page(struct address_space *mapping,
 	nr = hpage_nr_pages(page);
 
 	__mod_node_page_state(page_pgdat(page), NR_FILE_PAGES, -nr);
+
+#ifndef	CONFIG_RO_EXEC_FILEMAP_HUGE_FAULT_THP
 	if (PageSwapBacked(page)) {
 		__mod_node_page_state(page_pgdat(page), NR_SHMEM, -nr);
 		if (PageTransHuge(page))
@@ -206,6 +208,13 @@ static void unaccount_page_cache_page(struct address_space *mapping,
 	} else {
 		VM_BUG_ON_PAGE(PageTransHuge(page), page);
 	}
+#else
+	if (PageSwapBacked(page))
+		__mod_node_page_state(page_pgdat(page), NR_SHMEM, -nr);
+
+	if (PageTransHuge(page))
+		__dec_node_page_state(page, NR_SHMEM_THPS);
+#endif
 
 	/*
 	 * At this point page must be either written or cleaned by
@@ -1615,7 +1624,7 @@ EXPORT_SYMBOL(find_lock_entry);
  * - FGP_FOR_MMAP: Similar to FGP_CREAT, only we want to allow the caller to do
  *   its own locking dance if the page is already in cache, or unlock the page
  *   before returning if we had to add the page to pagecache.
- * - FGP_PMD: If FGP_CREAT is specified, attempt to allocate a PMD-sized page.
+ * - FGP_PMD: If FGP_CREAT is specified, attempt to allocate a PMD-sized page
  *
  * If FGP_LOCK or FGP_CREAT are specified then the function may sleep even
  * if the GFP flags specified for FGP_CREAT are atomic.
@@ -1667,7 +1676,7 @@ struct page *pagecache_get_page(struct address_space *mapping, pgoff_t offset,
 		if (fgp_flags & FGP_NOFS)
 			gfp_mask &= ~__GFP_FS;
 
-		page = __page_cache_alloc(gfp_mask, fgp_order(fgp_flags));
+		page = __page_cache_alloc(gfp_mask, fgp_get_order(fgp_flags));
 		if (!page)
 			return NULL;
 
@@ -2642,6 +2651,291 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
 }
 EXPORT_SYMBOL(filemap_fault);
 
+#ifdef CONFIG_RO_EXEC_FILEMAP_HUGE_FAULT_THP
+/*
+ * Check for an entry in the page cache which would conflict with the address
+ * range we wish to map using a THP or is otherwise unusable to map a large
+ * cached page.
+ *
+ * The routine will return true if a usable page is found in the page cache
+ * (and *pagep will be set to the address of the cached page), or if no
+ * cached page is found (and *pagep will be set to NULL).
+ */
+static bool
+filemap_huge_check_pagecache_usable(struct xa_state *xasp,
+	struct page **pagep, pgoff_t hindex, pgoff_t hindex_max)
+{
+	struct page *page;
+
+	while (1) {
+		page = xas_find(xasp, hindex_max);
+
+		if (xas_retry(xasp, page)) {
+			xas_set(xasp, hindex);
+			continue;
+		}
+
+		/*
+		 * A found entry is unusable if:
+		 *	+ the entry is an Xarray value, not a pointer
+		 *	+ the entry is an internal Xarray node
+		 *	+ the entry is not a Transparent Huge Page
+		 *	+ the entry is not a compound page
+		 *	+ the entry is not the head of a compound page
+		 *	+ the enbry is a page page with an order other than
+		 *	  HPAGE_PMD_ORDER
+		 *	+ the page's index is not what we expect it to be
+		 *	+ the page is not up-to-date
+		 *	+ the page is unlocked
+		 */
+		if ((page) && (xa_is_value(page) || xa_is_internal(page) ||
+			(!PageCompound(page)) || (PageHuge(page)) ||
+			(!PageTransCompound(page)) ||
+			page != compound_head(page) ||
+			compound_order(page) != HPAGE_PMD_ORDER ||
+			page->index != hindex || (!PageUptodate(page)) ||
+			(!PageLocked(page))))
+			return false;
+
+		break;
+	}
+
+	xas_set(xasp, hindex);
+	*pagep = page;
+	return true;
+}
+
+/**
+ * filemap_huge_fault - read in file data for page fault handling to THP
+ * @vmf:	struct vm_fault containing details of the fault
+ * @pe_size:	large page size to map, currently this must be PE_SIZE_PMD
+ *
+ * filemap_huge_fault() is invoked via the vma operations vector for a
+ * mapped memory region to read in file data to a transparent huge page during
+ * a page fault.
+ *
+ * If for any reason we can't allocate a THP, map it or add it to the page
+ * cache, VM_FAULT_FALLBACK will be returned which will cause the fault
+ * handler to try mapping the page using a PAGESIZE page, usually via
+ * filemap_fault() if so speicifed in the vma operations vector.
+ *
+ * Returns either VM_FAULT_FALLBACK or the result of calling allcc_set_pte()
+ * to map the new THP.
+ *
+ * NOTE: This routine depends upon the file system's readpage routine as
+ *       specified in the address space operations vector to recognize when it
+ *	 is being passed a large page and to read the approprate amount of data
+ *	 in full and without polluting the page cache for the large page itself
+ *	 with PAGESIZE pages to perform a buffered read or to pollute what
+ *	 would be the page cache space for any succeeding pages with PAGESIZE
+ *	 pages due to readahead.
+ *
+ *	 It is VITAL that this routine not be enabled without such filesystem
+ *	 support. As there is no way to determine how many bytes were read by
+ *	 the readpage() operation, if only a PAGESIZE page is read, this routine
+ *	 will map the THP containing only the first PAGESIZE bytes of file data
+ *	 to satisfy the fault, which is never the result desired.
+ */
+vm_fault_t filemap_huge_fault(struct vm_fault *vmf,
+		enum page_entry_size pe_size)
+{
+	struct file *filp = vmf->vma->vm_file;
+	struct address_space *mapping = filp->f_mapping;
+	struct vm_area_struct *vma = vmf->vma;
+
+	unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
+	pgoff_t hindex = round_down(vmf->pgoff, HPAGE_PMD_NR);
+	pgoff_t hindex_max = hindex + HPAGE_PMD_NR;
+
+	struct page *cached_page, *hugepage;
+	struct page *new_page = NULL;
+
+	vm_fault_t ret = VM_FAULT_FALLBACK;
+	int error;
+
+	XA_STATE_ORDER(xas, &mapping->i_pages, hindex, HPAGE_PMD_ORDER);
+
+	/*
+	 * Return VM_FAULT_FALLBACK if:
+	 *
+	 *	+ pe_size != PE_SIZE_PMD
+	 *	+ FAULT_FLAG_WRITE is set in vmf->flags
+	 *	+ vma isn't aligned to allow a PMD mapping
+	 *	+ PMD would extend beyond the end of the vma
+	 */
+	if (pe_size != PE_SIZE_PMD || (vmf->flags & FAULT_FLAG_WRITE) ||
+		(haddr < vma->vm_start ||
+		(haddr + HPAGE_PMD_SIZE > vma->vm_end)))
+		return ret;
+
+	xas_lock_irq(&xas);
+
+retry_xas_locked:
+	if (!filemap_huge_check_pagecache_usable(&xas, &cached_page, hindex,
+		hindex_max)) {
+		/* found a conflicting entry in the page cache, so fallback */
+		goto unlock;
+	} else if (cached_page) {
+		/* found a valid cached page, so map it */
+		hugepage = cached_page;
+		goto map_huge;
+	}
+
+	xas_unlock_irq(&xas);
+
+	/* allocate huge THP page in VMA */
+	new_page = __page_cache_alloc(vmf->gfp_mask | __GFP_COMP |
+		__GFP_NOWARN | __GFP_NORETRY, HPAGE_PMD_ORDER);
+
+	if (unlikely(!new_page))
+		return ret;
+
+	if (unlikely(!(PageCompound(new_page)))) {
+		put_page(new_page);
+		return ret;
+	}
+
+	prep_transhuge_page(new_page);
+	new_page->index = hindex;
+	new_page->mapping = mapping;
+
+	__SetPageLocked(new_page);
+
+	/*
+	 * The readpage() operation below is expected to fill the large
+	 * page with data without polluting the page cache with
+	 * PAGESIZE entries due to a buffered read and/or readahead().
+	 *
+	 * A filesystem's vm_operations_struct huge_fault field should
+	 * never point to this routine without such a capability, and
+	 * without it a call to this routine would eventually just
+	 * fall through to the normal fault op anyway.
+	 */
+	error = mapping->a_ops->readpage(vmf->vma->vm_file, new_page);
+
+	if (unlikely(error)) {
+		put_page(new_page);
+		return ret;
+	}
+
+	/* XXX - use wait_on_page_locked_killable() instead? */
+	wait_on_page_locked(new_page);
+
+	if (!PageUptodate(new_page)) {
+		/* EIO */
+		new_page->mapping = NULL;
+		put_page(new_page);
+		return ret;
+	}
+
+	do {
+		xas_lock_irq(&xas);
+		xas_set(&xas, hindex);
+		xas_create_range(&xas);
+
+		if (!(xas_error(&xas)))
+			break;
+
+		if (!xas_nomem(&xas, GFP_KERNEL)) {
+			if (new_page) {
+				new_page->mapping = NULL;
+				put_page(new_page);
+			}
+
+			goto unlock;
+		}
+
+		xas_unlock_irq(&xas);
+	} while (1);
+
+	/*
+	 * Double check that an entry did not sneak into the page cache while
+	 * creating Xarray entries for the new page.
+	 */
+	if (!filemap_huge_check_pagecache_usable(&xas, &cached_page, hindex,
+		hindex_max)) {
+		/*
+		 * An unusable entry was found, so delete the newly allocated
+		 * page and fallback.
+		 */
+		new_page->mapping = NULL;
+		put_page(new_page);
+		goto unlock;
+	} else if (cached_page) {
+		/*
+		 * A valid large page was found in the page cache, so free the
+		 * newly allocated page and map the cached page instead.
+		 */
+		new_page->mapping = NULL;
+		put_page(new_page);
+		new_page = NULL;
+		hugepage = cached_page;
+		goto map_huge;
+	}
+
+	__SetPageLocked(new_page);
+
+	/* did it get truncated? */
+	if (unlikely(new_page->mapping != mapping)) {
+		unlock_page(new_page);
+		put_page(new_page);
+		goto retry_xas_locked;
+	}
+
+	hugepage = new_page;
+
+map_huge:
+	/* map hugepage at the PMD level */
+	ret = alloc_set_pte(vmf, NULL, hugepage);
+
+	VM_BUG_ON_PAGE((!(pmd_trans_huge(*vmf->pmd))), hugepage);
+
+	if (likely(!(ret & VM_FAULT_ERROR))) {
+		/*
+		 * The alloc_set_pte() succeeded without error, so
+		 * add the page to the page cache if it is new, and
+		 * increment page statistics accordingly.
+		 */
+		if (new_page) {
+			unsigned long nr;
+
+			xas_set(&xas, hindex);
+
+			for (nr = 0; nr < HPAGE_PMD_NR; nr++) {
+#ifndef	COMPOUND_PAGES_HEAD_ONLY
+				xas_store(&xas, new_page + nr);
+#else
+				xas_store(&xas, new_page);
+#endif
+				xas_next(&xas);
+			}
+
+			count_vm_event(THP_FILE_ALLOC);
+			__inc_node_page_state(new_page, NR_SHMEM_THPS);
+			__mod_node_page_state(page_pgdat(new_page),
+				NR_FILE_PAGES, HPAGE_PMD_NR);
+			__mod_node_page_state(page_pgdat(new_page),
+				NR_SHMEM, HPAGE_PMD_NR);
+		}
+
+		vmf->address = haddr;
+		vmf->page = hugepage;
+
+		page_ref_add(hugepage, HPAGE_PMD_NR);
+		count_vm_event(THP_FILE_MAPPED);
+	} else if (new_page) {
+		/* there was an error mapping the new page, so release it */
+		new_page->mapping = NULL;
+		put_page(new_page);
+	}
+
+unlock:
+	xas_unlock_irq(&xas);
+	return ret;
+}
+EXPORT_SYMBOL(filemap_huge_fault);
+#endif
+
 void filemap_map_pages(struct vm_fault *vmf,
 		pgoff_t start_pgoff, pgoff_t end_pgoff)
 {
@@ -2924,7 +3218,8 @@ struct page *read_cache_page(struct address_space *mapping,
 EXPORT_SYMBOL(read_cache_page);
 
 /**
- * read_cache_page_gfp - read into page cache, using specified page allocation flags.
+ * read_cache_page_gfp - read into page cache, using specified page allocation
+ *			 flags.
  * @mapping:	the page's address_space
  * @index:	the page index
  * @gfp:	the page allocator flags to use if allocating
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 1334ede667a8..26d74466d1f7 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -543,8 +543,11 @@ unsigned long thp_get_unmapped_area(struct file *filp, unsigned long addr,
 
 	if (addr)
 		goto out;
+
+#ifndef CONFIG_RO_EXEC_FILEMAP_HUGE_FAULT_THP
 	if (!IS_DAX(filp->f_mapping->host) || !IS_ENABLED(CONFIG_FS_DAX_PMD))
 		goto out;
+#endif
 
 	addr = __thp_get_unmapped_area(filp, len, off, flags, PMD_SIZE);
 	if (addr)
diff --git a/mm/mmap.c b/mm/mmap.c
index 7e8c3e8ae75f..96ff80d2a8fb 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1391,6 +1391,10 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
 	struct mm_struct *mm = current->mm;
 	int pkey = 0;
 
+#ifdef CONFIG_RO_EXEC_FILEMAP_HUGE_FAULT_THP
+	unsigned long vm_maywrite = VM_MAYWRITE;
+#endif
+
 	*populate = 0;
 
 	if (!len)
@@ -1429,7 +1433,33 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
 	/* Obtain the address to map to. we verify (or select) it and ensure
 	 * that it represents a valid section of the address space.
 	 */
-	addr = get_unmapped_area(file, addr, len, pgoff, flags);
+
+#ifdef CONFIG_RO_EXEC_FILEMAP_HUGE_FAULT_THP
+	/*
+	 * If THP is enabled, it's a read-only executable that is
+	 * MAP_PRIVATE mapped, the length is larger than a PMD page
+	 * and either it's not a MAP_FIXED mapping or the passed address is
+	 * properly aligned for a PMD page, attempt to get an appropriate
+	 * address at which to map a PMD-sized THP page, otherwise call the
+	 * normal routine.
+	 */
+	if ((prot & PROT_READ) && (prot & PROT_EXEC) &&
+		(!(prot & PROT_WRITE)) && (flags & MAP_PRIVATE) &&
+		(!(flags & MAP_FIXED)) && len >= HPAGE_PMD_SIZE &&
+		(!(addr & HPAGE_PMD_OFFSET))) {
+		addr = thp_get_unmapped_area(file, addr, len, pgoff, flags);
+
+		if (addr && (!(addr & HPAGE_PMD_OFFSET)))
+			vm_maywrite = 0;
+		else
+			addr = get_unmapped_area(file, addr, len, pgoff, flags);
+	} else {
+#endif
+		addr = get_unmapped_area(file, addr, len, pgoff, flags);
+#ifdef CONFIG_RO_EXEC_FILEMAP_HUGE_FAULT_THP
+	}
+#endif
+
 	if (offset_in_page(addr))
 		return addr;
 
@@ -1451,7 +1481,11 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
 	 * of the memory object, so we don't do any here.
 	 */
 	vm_flags |= calc_vm_prot_bits(prot, pkey) | calc_vm_flag_bits(flags) |
+#ifdef CONFIG_RO_EXEC_FILEMAP_HUGE_FAULT_THP
+			mm->def_flags | VM_MAYREAD | vm_maywrite | VM_MAYEXEC;
+#else
 			mm->def_flags | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC;
+#endif
 
 	if (flags & MAP_LOCKED)
 		if (!can_do_mlock())
diff --git a/mm/rmap.c b/mm/rmap.c
index e5dfe2ae6b0d..503612d3b52b 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1192,7 +1192,11 @@ void page_add_file_rmap(struct page *page, bool compound)
 		}
 		if (!atomic_inc_and_test(compound_mapcount_ptr(page)))
 			goto out;
+
+#ifndef CONFIG_RO_EXEC_FILEMAP_HUGE_FAULT_THP
 		VM_BUG_ON_PAGE(!PageSwapBacked(page), page);
+#endif
+
 		__inc_node_page_state(page, NR_SHMEM_PMDMAPPED);
 	} else {
 		if (PageTransCompound(page) && page_mapping(page)) {
@@ -1232,7 +1236,11 @@ static void page_remove_file_rmap(struct page *page, bool compound)
 		}
 		if (!atomic_add_negative(-1, compound_mapcount_ptr(page)))
 			goto out;
+
+#ifndef CONFIG_RO_EXEC_FILEMAP_HUGE_FAULT_THP
 		VM_BUG_ON_PAGE(!PageSwapBacked(page), page);
+#endif
+
 		__dec_node_page_state(page, NR_SHMEM_PMDMAPPED);
 	} else {
 		if (!atomic_add_negative(-1, &page->_mapcount))
-- 
2.21.0


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
