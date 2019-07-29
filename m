Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC277ABE5
	for <lists+linux-afs@lfdr.de>; Tue, 30 Jul 2019 17:03:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBxkdyvDMzykcFA2uXGxL96QVnyiQUtYs970lmWIhlI=; b=cjF0+Qkr3yjA4r
	F2aBJeyBb2LafdQCJuk5h159D0VsSk/2FJAOquc/izPVP+RufO7Su/d2GkEdkaQdYEP3nsNSy27vh
	6hn89VtojU4X1RWPAqoMPzVxDsAM2Bku7CayrJ+4I5idz79RenWPv3IXXIiGZYBDue85BaHMU1+57
	WK9DAjx5aK77p7Z5tWAFYLi7eQoqYa7pKpNEJGfMXqRBL9VbMEeYdADV5lC6eBhfSo5wAOoxsCxij
	ya5/qhCfqT8fwNVZkc5R+JR5etZQKBtG7QQzwspMLnvh+wBtagnfRFlB19dnkTUfsZfs7E2A8AuS2
	CuS/+KW9PpArqu308i1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsTem-0007bc-Mi; Tue, 30 Jul 2019 15:03:16 +0000
Received: from mx0b-00082601.pphosted.com ([67.231.153.30])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsEUi-00086F-Qo
 for linux-afs@lists.infradead.org; Mon, 29 Jul 2019 22:51:55 +0000
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6TMnZvw022986; Mon, 29 Jul 2019 15:51:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=quijLdpcoHDr9DfZpt0Qv5ecH4uOwaAo9BsdJAB1tLA=;
 b=GNQfQqKvdVMKSzj+E++I98+fsdYPZTES6Nj/hsmS7YSYETDrWEXx/+HCURvKJ+fzoKRq
 dnSXvQoXtv9CXqE4IhR5oKCz9O7VKcAKLZ1vlJDtwIQ87r4FyJUGPcnKRzZSMBZshCEz
 IOTzH0LiOND//teNm0g/sUxMAUCXJ9OfbGY= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2u27er8jbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 29 Jul 2019 15:51:16 -0700
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 29 Jul 2019 15:51:12 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 29 Jul 2019 15:51:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkUBc3GLZFC+fgTDmzcaLZjsfPjTLjKDviAtH6t40uGa26d/KX4CEVpowcONgz9gOrvWpwA3FdU6MKQxwC+vgx2VN9VYIPRYpMjfhq/yCg0OHUNazh83yG21UOeAnOLJDWiU/yLnlhjC/BC01SZcH8Az9tNN8zQDC4QvMMUr2E1gZ7u8/wGs3ihOfmEQuITejikpd7/bQXMkU2/kXIW3cRk1BXmmKW4fB9S/FkwfWX6LTb/zEa678T/cnirB2bGOiCMcclg6fIGF0o/vlAkhnFs+lzC0+BEB35kY+ehhuMlPfEiAP4z581BJWciBtpWe6L1ac4olzSJgBRXD/YJWmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quijLdpcoHDr9DfZpt0Qv5ecH4uOwaAo9BsdJAB1tLA=;
 b=KxX31nk6lDZsp+rbyp94rf+EV3R2VKJavbXoC80AvpT7j/EYq/TG5ka+p2QNsodBBonVeXEIYktR85zNBGPrvKir3P3fG0u7xKTAOQsO2O8Ui6JLMEUQ3ElRsJME/TkztWmN8rJQne+bFUZSQO7pItyZLufIPPjjLFJWEi4s7jPVAruYaarsC61tLWodrdcBtVlA4U5Xga6RT+xSeH8MRSYARedpEdJOkprYxqYGoqgAFszmJ/RgEQ8GBQt5wPuYh7XipqLtiuRH47VmAx9XVHiluJhCOyFsrzjyuF3QMu31zFnFVXD/6FQd/YaJlUcgHFhy6iTQgQEAfogtOPq0Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quijLdpcoHDr9DfZpt0Qv5ecH4uOwaAo9BsdJAB1tLA=;
 b=jbb2ykcJsvGu2qh3KmHpN85eqQOafiVxtSnKxJQqUg3zVu9rtr2nkZS2/0Msed7WCsWyeerhsIajfE2VQAIQNUKB5NfvqyhHA1oPrIZkJ49QsJM+3I89fSuf10fs4JqN33oreUQqrBrGKgDebpxNRQcZTZzUl7XIpj3DnMC3uPA=
Received: from MWHPR15MB1165.namprd15.prod.outlook.com (10.175.3.22) by
 MWHPR15MB1119.namprd15.prod.outlook.com (10.175.8.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Mon, 29 Jul 2019 22:51:11 +0000
Received: from MWHPR15MB1165.namprd15.prod.outlook.com
 ([fe80::d4fc:70c0:79a5:f41b]) by MWHPR15MB1165.namprd15.prod.outlook.com
 ([fe80::d4fc:70c0:79a5:f41b%2]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 22:51:11 +0000
From: Song Liu <songliubraving@fb.com>
To: William Kucharski <william.kucharski@oracle.com>
Subject: Re: [PATCH v2 2/2] mm,thp: Add experimental config option
 RO_EXEC_FILEMAP_HUGE_FAULT_THP
Thread-Topic: [PATCH v2 2/2] mm,thp: Add experimental config option
 RO_EXEC_FILEMAP_HUGE_FAULT_THP
Thread-Index: AQHVRlIkIBeF3SPMIUmfTIWhM30vRKbiM5WA
Date: Mon, 29 Jul 2019 22:51:10 +0000
Message-ID: <E6E92F42-3FA0-473C-B6F2-E23826C766F5@fb.com>
References: <20190729210933.18674-1-william.kucharski@oracle.com>
 <20190729210933.18674-3-william.kucharski@oracle.com>
In-Reply-To: <20190729210933.18674-3-william.kucharski@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-originating-ip: [2620:10d:c090:200::2:d148]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5fc72d6f-6650-44b6-78cf-08d7147740ac
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1119; 
x-ms-traffictypediagnostic: MWHPR15MB1119:
x-microsoft-antispam-prvs: <MWHPR15MB111921725B40C23C691B26AAB3DD0@MWHPR15MB1119.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(376002)(136003)(39860400002)(396003)(189003)(199004)(76116006)(91956017)(46003)(36756003)(99286004)(30864003)(68736007)(53936002)(53546011)(7416002)(6436002)(7406005)(14444005)(7366002)(76176011)(486006)(6486002)(64756008)(66446008)(66476007)(66556008)(54906003)(66946007)(256004)(229853002)(33656002)(6916009)(446003)(2616005)(2906002)(11346002)(6512007)(316002)(186003)(476003)(102836004)(8936002)(6116002)(71190400001)(6246003)(4326008)(71200400001)(81166006)(8676002)(81156014)(6506007)(53946003)(57306001)(50226002)(25786009)(305945005)(14454004)(86362001)(478600001)(7736002)(5660300002)(21314003)(142933001)(14583001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1119;
 H:MWHPR15MB1165.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DwoW3Wz1/pUssgOcbF7oxIgmrkHy7IHEl2LgSMcp7PuQmG88s/e1C8aOEUqxUEDOEZl5m+qRgWqNb7meXsgbWET6UvwtI4MvkpDX16UiownLShOtGmM4kHkw12DH84mxqT8Ic6JjNiFzdNP4vNSLfHSpNJuopEIAioMdZnzQCf9oUa0U0rilDVqOMZlPs0Y8BAP1PMw3U+pGSS4Nh5QMQ5V2KG21MTymQaXFY/KEtBeWlh1YHHoUmq6tqqQkPI4oe8XzvyjIFanZUjTcpMIZJV0bAmDWtOk34Ta10StaufDNW12j3nmM2Npjs0TkVjZouXqlJ62lNmwpqxVOmzzsplp9DOk3x8Cqh2U93ik5HlyGQ5pOBSmFuv903b3i55lxquzDJbc/PFoJdbeDkVVn9oK1/27Mz+oe7hq49Wi5HUY=
Content-ID: <F0AF68F3A1C68640AE27AA6631F2FBD4@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc72d6f-6650-44b6-78cf-08d7147740ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 22:51:10.8668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: songliubraving@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1119
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-29_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907290249
X-FB-Internal: deliver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_155153_006057_C834F24A 
X-CRM114-Status: GOOD (  25.13  )
X-Spam-Score: -0.9 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.9 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [67.231.153.30 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 Yangtao Li <tiny.windzz@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Keith Busch <keith.busch@intel.com>, Chris Mason <clm@fb.com>,
 Yafang Shao <laoar.shao@gmail.com>, Arun KS <arunks@codeaurora.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Ira Weiny <ira.weiny@intel.com>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
 Sage Weil <sage@redhat.com>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Hugh Dickins <hughd@google.com>, Pavel Tatashin <pasha.tatashin@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrey Konovalov <andreyknvl@google.com>,
 Dave Airlie <airlied@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Linux-MM <linux-mm@kvack.org>, Dan Williams <dan.j.williams@intel.com>,
 Bob Kasten <robert.a.kasten@intel.com>, Miklos Szeredi <mszeredi@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Amir Goldstein <amir73il@gmail.com>,
 Jann Horn <jannh@google.com>, John Hubbard <jhubbard@nvidia.com>, David
 Rientjes <rientjes@google.com>,
 "john.hubbard@gmail.com" <john.hubbard@gmail.com>,
 Josef Bacik <josef@toxicpanda.com>, Ross Zwisler <zwisler@google.com>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Kirill Tkhai <ktkhai@virtuozzo.com>, Dave Chinner <dchinner@redhat.com>,
 David Sterba <dsterba@suse.com>, Yang Shi <yang.shi@linux.alibaba.com>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>, Vlastimil
 Babka <vbabka@suse.cz>, Chad
 Mynhier <chad.mynhier@oracle.com>, David Howells <dhowells@redhat.com>,
 Huang Shijie <sjhuang@iluvatar.ai>, Johannes Weiner <jweiner@fb.com>,
 Steve Capper <steve.capper@arm.com>, Networking <netdev@vger.kernel.org>,
 Gao Xiang <hsiangkao@aol.com>, Jeff Layton <jlayton@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Souptick Joarder <jrdr.linux@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Robin
 Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org



> On Jul 29, 2019, at 2:09 PM, William Kucharski <william.kucharski@oracle.com> wrote:
> 
> Add filemap_huge_fault() to attempt to satisfy page faults on
> memory-mapped read-only text pages using THP when possible.

I think this 2/2 doesn't need pagecache_get_page() changes in 1/2. 
Maybe we can split pagecache_get_page() related changes out?

> 
> Signed-off-by: William Kucharski <william.kucharski@oracle.com>
> ---
> include/linux/huge_mm.h |  16 ++-
> include/linux/mm.h      |   6 +
> mm/Kconfig              |  15 ++
> mm/filemap.c            | 299 +++++++++++++++++++++++++++++++++++++++-
> mm/huge_memory.c        |   3 +
> mm/mmap.c               |  36 ++++-
> mm/rmap.c               |   8 ++
> 7 files changed, 373 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 45ede62aa85b..34723f7e75d0 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -79,13 +79,15 @@ extern struct kobj_attribute shmem_enabled_attr;
> #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
> 
> #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -#define HPAGE_PMD_SHIFT PMD_SHIFT
> -#define HPAGE_PMD_SIZE	((1UL) << HPAGE_PMD_SHIFT)
> -#define HPAGE_PMD_MASK	(~(HPAGE_PMD_SIZE - 1))
> -
> -#define HPAGE_PUD_SHIFT PUD_SHIFT
> -#define HPAGE_PUD_SIZE	((1UL) << HPAGE_PUD_SHIFT)
> -#define HPAGE_PUD_MASK	(~(HPAGE_PUD_SIZE - 1))

> +#define HPAGE_PMD_SHIFT		PMD_SHIFT
> +#define HPAGE_PMD_SIZE		((1UL) << HPAGE_PMD_SHIFT)
> +#define	HPAGE_PMD_OFFSET	(HPAGE_PMD_SIZE - 1)
          ^ space vs. tab difference here. 

> +#define HPAGE_PMD_MASK		(~(HPAGE_PMD_OFFSET))
> +
> +#define HPAGE_PUD_SHIFT		PUD_SHIFT
> +#define HPAGE_PUD_SIZE		((1UL) << HPAGE_PUD_SHIFT)
> +#define	HPAGE_PUD_OFFSET	(HPAGE_PUD_SIZE - 1)
> +#define HPAGE_PUD_MASK		(~(HPAGE_PUD_OFFSET))

Should HPAGE_PMD_OFFSET and HPAGE_PUD_OFFSET include bits for 
PAGE_OFFSET? I guess we can just keep huge_mm.h as-is and use
~HPAGE_PMD_MASK. 

> 
> extern bool is_vma_temporary_stack(struct vm_area_struct *vma);
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 0334ca97c584..ba24b515468a 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2433,6 +2433,12 @@ extern void truncate_inode_pages_final(struct address_space *);
> 
> /* generic vm_area_ops exported for stackable file systems */
> extern vm_fault_t filemap_fault(struct vm_fault *vmf);
> +
> +#ifdef CONFIG_RO_EXEC_FILEMAP_HUGE_FAULT_THP
> +extern vm_fault_t filemap_huge_fault(struct vm_fault *vmf,
> +			enum page_entry_size pe_size);
> +#endif
> +
> extern void filemap_map_pages(struct vm_fault *vmf,
> 		pgoff_t start_pgoff, pgoff_t end_pgoff);
> extern vm_fault_t filemap_page_mkwrite(struct vm_fault *vmf);
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 56cec636a1fc..2debaded0e4d 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -736,4 +736,19 @@ config ARCH_HAS_PTE_SPECIAL
> config ARCH_HAS_HUGEPD
> 	bool
> 
> +config RO_EXEC_FILEMAP_HUGE_FAULT_THP
> +	bool "read-only exec filemap_huge_fault THP support (EXPERIMENTAL)"
> +	depends on TRANSPARENT_HUGE_PAGECACHE && SHMEM
> +
> +	help
> +	    Introduce filemap_huge_fault() to automatically map executable
> +	    read-only pages of mapped files of suitable size and alignment
> +	    using THP if possible.
> +
> +	    This is marked experimental because it is a new feature and is
> +	    dependent upon filesystmes implementing readpages() in a way
> +	    that will recognize large THP pages and read file content to
> +	    them without polluting the pagecache with PAGESIZE pages due
> +	    to readahead.
> +
> endmenu
> diff --git a/mm/filemap.c b/mm/filemap.c
> index a96092243fc4..4e7287db0d8e 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -199,6 +199,8 @@ static void unaccount_page_cache_page(struct address_space *mapping,
> 	nr = hpage_nr_pages(page);
> 
> 	__mod_node_page_state(page_pgdat(page), NR_FILE_PAGES, -nr);
> +
> +#ifndef	CONFIG_RO_EXEC_FILEMAP_HUGE_FAULT_THP
> 	if (PageSwapBacked(page)) {
> 		__mod_node_page_state(page_pgdat(page), NR_SHMEM, -nr);
> 		if (PageTransHuge(page))
> @@ -206,6 +208,13 @@ static void unaccount_page_cache_page(struct address_space *mapping,
> 	} else {
> 		VM_BUG_ON_PAGE(PageTransHuge(page), page);
> 	}
> +#else
> +	if (PageSwapBacked(page))
> +		__mod_node_page_state(page_pgdat(page), NR_SHMEM, -nr);
> +
> +	if (PageTransHuge(page))
> +		__dec_node_page_state(page, NR_SHMEM_THPS);
> +#endif
> 
> 	/*
> 	 * At this point page must be either written or cleaned by
> @@ -1615,7 +1624,7 @@ EXPORT_SYMBOL(find_lock_entry);
>  * - FGP_FOR_MMAP: Similar to FGP_CREAT, only we want to allow the caller to do
>  *   its own locking dance if the page is already in cache, or unlock the page
>  *   before returning if we had to add the page to pagecache.
> - * - FGP_PMD: If FGP_CREAT is specified, attempt to allocate a PMD-sized page.
> + * - FGP_PMD: If FGP_CREAT is specified, attempt to allocate a PMD-sized page

I think we haven't used FGP_PMD yet? 

>  *
>  * If FGP_LOCK or FGP_CREAT are specified then the function may sleep even
>  * if the GFP flags specified for FGP_CREAT are atomic.
> @@ -2642,6 +2651,291 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
> }
> EXPORT_SYMBOL(filemap_fault);
> 
> +#ifdef CONFIG_RO_EXEC_FILEMAP_HUGE_FAULT_THP
> +/*
> + * Check for an entry in the page cache which would conflict with the address
> + * range we wish to map using a THP or is otherwise unusable to map a large
> + * cached page.
> + *
> + * The routine will return true if a usable page is found in the page cache
> + * (and *pagep will be set to the address of the cached page), or if no
> + * cached page is found (and *pagep will be set to NULL).
> + */
> +static bool
> +filemap_huge_check_pagecache_usable(struct xa_state *xasp,
> +	struct page **pagep, pgoff_t hindex, pgoff_t hindex_max)

We have been using name "xas" for "struct xa_state *". Let's keep using it?

> +{
> +	struct page *page;
> +
> +	while (1) {
> +		page = xas_find(xasp, hindex_max);
> +
> +		if (xas_retry(xasp, page)) {
> +			xas_set(xasp, hindex);
> +			continue;
> +		}
> +
> +		/*
> +		 * A found entry is unusable if:
> +		 *	+ the entry is an Xarray value, not a pointer
> +		 *	+ the entry is an internal Xarray node
> +		 *	+ the entry is not a Transparent Huge Page
> +		 *	+ the entry is not a compound page
> +		 *	+ the entry is not the head of a compound page
> +		 *	+ the enbry is a page page with an order other than
> +		 *	  HPAGE_PMD_ORDER
> +		 *	+ the page's index is not what we expect it to be
> +		 *	+ the page is not up-to-date
> +		 *	+ the page is unlocked
> +		 */
> +		if ((page) && (xa_is_value(page) || xa_is_internal(page) ||
> +			(!PageCompound(page)) || (PageHuge(page)) ||
> +			(!PageTransCompound(page)) ||
> +			page != compound_head(page) ||
> +			compound_order(page) != HPAGE_PMD_ORDER ||
> +			page->index != hindex || (!PageUptodate(page)) ||
> +			(!PageLocked(page))))
> +			return false;
> +
> +		break;
> +	}
> +
> +	xas_set(xasp, hindex);
> +	*pagep = page;
> +	return true;
> +}
> +
> +/**
> + * filemap_huge_fault - read in file data for page fault handling to THP
> + * @vmf:	struct vm_fault containing details of the fault
> + * @pe_size:	large page size to map, currently this must be PE_SIZE_PMD
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
> + *	 is being passed a large page and to read the approprate amount of data
> + *	 in full and without polluting the page cache for the large page itself
> + *	 with PAGESIZE pages to perform a buffered read or to pollute what
> + *	 would be the page cache space for any succeeding pages with PAGESIZE
> + *	 pages due to readahead.
> + *
> + *	 It is VITAL that this routine not be enabled without such filesystem
> + *	 support. As there is no way to determine how many bytes were read by
> + *	 the readpage() operation, if only a PAGESIZE page is read, this routine
> + *	 will map the THP containing only the first PAGESIZE bytes of file data
> + *	 to satisfy the fault, which is never the result desired.
> + */
> +vm_fault_t filemap_huge_fault(struct vm_fault *vmf,
> +		enum page_entry_size pe_size)
> +{
> +	struct file *filp = vmf->vma->vm_file;
> +	struct address_space *mapping = filp->f_mapping;
> +	struct vm_area_struct *vma = vmf->vma;
> +
> +	unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
> +	pgoff_t hindex = round_down(vmf->pgoff, HPAGE_PMD_NR);
> +	pgoff_t hindex_max = hindex + HPAGE_PMD_NR;
> +
> +	struct page *cached_page, *hugepage;
> +	struct page *new_page = NULL;
> +
> +	vm_fault_t ret = VM_FAULT_FALLBACK;
> +	int error;
> +
> +	XA_STATE_ORDER(xas, &mapping->i_pages, hindex, HPAGE_PMD_ORDER);
> +
> +	/*
> +	 * Return VM_FAULT_FALLBACK if:
> +	 *
> +	 *	+ pe_size != PE_SIZE_PMD
> +	 *	+ FAULT_FLAG_WRITE is set in vmf->flags
> +	 *	+ vma isn't aligned to allow a PMD mapping
> +	 *	+ PMD would extend beyond the end of the vma
> +	 */
> +	if (pe_size != PE_SIZE_PMD || (vmf->flags & FAULT_FLAG_WRITE) ||
> +		(haddr < vma->vm_start ||
> +		(haddr + HPAGE_PMD_SIZE > vma->vm_end)))
> +		return ret;
> +
> +	xas_lock_irq(&xas);
> +
> +retry_xas_locked:
> +	if (!filemap_huge_check_pagecache_usable(&xas, &cached_page, hindex,
> +		hindex_max)) {
> +		/* found a conflicting entry in the page cache, so fallback */
> +		goto unlock;
> +	} else if (cached_page) {
> +		/* found a valid cached page, so map it */
> +		hugepage = cached_page;
> +		goto map_huge;
> +	}
> +
> +	xas_unlock_irq(&xas);
> +
> +	/* allocate huge THP page in VMA */
> +	new_page = __page_cache_alloc(vmf->gfp_mask | __GFP_COMP |
> +		__GFP_NOWARN | __GFP_NORETRY, HPAGE_PMD_ORDER);
> +
> +	if (unlikely(!new_page))
> +		return ret;
> +
> +	if (unlikely(!(PageCompound(new_page)))) {

   What condition triggers this case? 

> +		put_page(new_page);
> +		return ret;
> +	}
> +
> +	prep_transhuge_page(new_page);
> +	new_page->index = hindex;
> +	new_page->mapping = mapping;
> +
> +	__SetPageLocked(new_page);
> +
> +	/*
> +	 * The readpage() operation below is expected to fill the large
> +	 * page with data without polluting the page cache with
> +	 * PAGESIZE entries due to a buffered read and/or readahead().
> +	 *
> +	 * A filesystem's vm_operations_struct huge_fault field should
> +	 * never point to this routine without such a capability, and
> +	 * without it a call to this routine would eventually just
> +	 * fall through to the normal fault op anyway.
> +	 */
> +	error = mapping->a_ops->readpage(vmf->vma->vm_file, new_page);
> +
> +	if (unlikely(error)) {
> +		put_page(new_page);
> +		return ret;
> +	}
> +
> +	/* XXX - use wait_on_page_locked_killable() instead? */
> +	wait_on_page_locked(new_page);
> +
> +	if (!PageUptodate(new_page)) {
> +		/* EIO */
> +		new_page->mapping = NULL;
> +		put_page(new_page);
> +		return ret;
> +	}
> +
> +	do {
> +		xas_lock_irq(&xas);
> +		xas_set(&xas, hindex);
> +		xas_create_range(&xas);
> +
> +		if (!(xas_error(&xas)))
> +			break;
> +
> +		if (!xas_nomem(&xas, GFP_KERNEL)) {
> +			if (new_page) {
> +				new_page->mapping = NULL;
> +				put_page(new_page);
> +			}
> +
> +			goto unlock;
> +		}
> +
> +		xas_unlock_irq(&xas);
> +	} while (1);
> +
> +	/*
> +	 * Double check that an entry did not sneak into the page cache while
> +	 * creating Xarray entries for the new page.
> +	 */
> +	if (!filemap_huge_check_pagecache_usable(&xas, &cached_page, hindex,
> +		hindex_max)) {
> +		/*
> +		 * An unusable entry was found, so delete the newly allocated
> +		 * page and fallback.
> +		 */
> +		new_page->mapping = NULL;
> +		put_page(new_page);
> +		goto unlock;
> +	} else if (cached_page) {
> +		/*
> +		 * A valid large page was found in the page cache, so free the
> +		 * newly allocated page and map the cached page instead.
> +		 */
> +		new_page->mapping = NULL;
> +		put_page(new_page);
> +		new_page = NULL;
> +		hugepage = cached_page;
> +		goto map_huge;
> +	}
> +
> +	__SetPageLocked(new_page);
> +
> +	/* did it get truncated? */
> +	if (unlikely(new_page->mapping != mapping)) {
> +		unlock_page(new_page);
> +		put_page(new_page);
> +		goto retry_xas_locked;
> +	}
> +
> +	hugepage = new_page;
> +
> +map_huge:
> +	/* map hugepage at the PMD level */
> +	ret = alloc_set_pte(vmf, NULL, hugepage);
> +
> +	VM_BUG_ON_PAGE((!(pmd_trans_huge(*vmf->pmd))), hugepage);
> +
> +	if (likely(!(ret & VM_FAULT_ERROR))) {
> +		/*
> +		 * The alloc_set_pte() succeeded without error, so
> +		 * add the page to the page cache if it is new, and
> +		 * increment page statistics accordingly.
> +		 */
> +		if (new_page) {
> +			unsigned long nr;
> +
> +			xas_set(&xas, hindex);
> +
> +			for (nr = 0; nr < HPAGE_PMD_NR; nr++) {
> +#ifndef	COMPOUND_PAGES_HEAD_ONLY

Where do we define COMPOUND_PAGES_HEAD_ONLY? 

> +				xas_store(&xas, new_page + nr);
> +#else
> +				xas_store(&xas, new_page);
> +#endif
> +				xas_next(&xas);
> +			}
> +
> +			count_vm_event(THP_FILE_ALLOC);
> +			__inc_node_page_state(new_page, NR_SHMEM_THPS);
> +			__mod_node_page_state(page_pgdat(new_page),
> +				NR_FILE_PAGES, HPAGE_PMD_NR);
> +			__mod_node_page_state(page_pgdat(new_page),
> +				NR_SHMEM, HPAGE_PMD_NR);
> +		}
> +
> +		vmf->address = haddr;
> +		vmf->page = hugepage;
> +
> +		page_ref_add(hugepage, HPAGE_PMD_NR);
> +		count_vm_event(THP_FILE_MAPPED);
> +	} else if (new_page) {
> +		/* there was an error mapping the new page, so release it */
> +		new_page->mapping = NULL;
> +		put_page(new_page);
> +	}
> +
> +unlock:
> +	xas_unlock_irq(&xas);
> +	return ret;
> +}
> +EXPORT_SYMBOL(filemap_huge_fault);
> +#endif
> +
> void filemap_map_pages(struct vm_fault *vmf,
> 		pgoff_t start_pgoff, pgoff_t end_pgoff)
> {
> @@ -2924,7 +3218,8 @@ struct page *read_cache_page(struct address_space *mapping,
> EXPORT_SYMBOL(read_cache_page);
> 
> /**
> - * read_cache_page_gfp - read into page cache, using specified page allocation flags.
> + * read_cache_page_gfp - read into page cache, using specified page allocation
> + *			 flags.
>  * @mapping:	the page's address_space
>  * @index:	the page index
>  * @gfp:	the page allocator flags to use if allocating
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 1334ede667a8..26d74466d1f7 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -543,8 +543,11 @@ unsigned long thp_get_unmapped_area(struct file *filp, unsigned long addr,
> 
> 	if (addr)
> 		goto out;
> +
> +#ifndef CONFIG_RO_EXEC_FILEMAP_HUGE_FAULT_THP
> 	if (!IS_DAX(filp->f_mapping->host) || !IS_ENABLED(CONFIG_FS_DAX_PMD))
> 		goto out;
> +#endif
> 
> 	addr = __thp_get_unmapped_area(filp, len, off, flags, PMD_SIZE);
> 	if (addr)
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 7e8c3e8ae75f..96ff80d2a8fb 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -1391,6 +1391,10 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
> 	struct mm_struct *mm = current->mm;
> 	int pkey = 0;
> 
> +#ifdef CONFIG_RO_EXEC_FILEMAP_HUGE_FAULT_THP
> +	unsigned long vm_maywrite = VM_MAYWRITE;
> +#endif
> +
> 	*populate = 0;
> 
> 	if (!len)
> @@ -1429,7 +1433,33 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
> 	/* Obtain the address to map to. we verify (or select) it and ensure
> 	 * that it represents a valid section of the address space.
> 	 */
> -	addr = get_unmapped_area(file, addr, len, pgoff, flags);
> +
> +#ifdef CONFIG_RO_EXEC_FILEMAP_HUGE_FAULT_THP
> +	/*
> +	 * If THP is enabled, it's a read-only executable that is
> +	 * MAP_PRIVATE mapped, the length is larger than a PMD page
> +	 * and either it's not a MAP_FIXED mapping or the passed address is
> +	 * properly aligned for a PMD page, attempt to get an appropriate
> +	 * address at which to map a PMD-sized THP page, otherwise call the
> +	 * normal routine.
> +	 */
> +	if ((prot & PROT_READ) && (prot & PROT_EXEC) &&
> +		(!(prot & PROT_WRITE)) && (flags & MAP_PRIVATE) &&
> +		(!(flags & MAP_FIXED)) && len >= HPAGE_PMD_SIZE &&
> +		(!(addr & HPAGE_PMD_OFFSET))) {
> +		addr = thp_get_unmapped_area(file, addr, len, pgoff, flags);
> +
> +		if (addr && (!(addr & HPAGE_PMD_OFFSET)))
> +			vm_maywrite = 0;
> +		else
> +			addr = get_unmapped_area(file, addr, len, pgoff, flags);
> +	} else {
> +#endif
> +		addr = get_unmapped_area(file, addr, len, pgoff, flags);
> +#ifdef CONFIG_RO_EXEC_FILEMAP_HUGE_FAULT_THP
> +	}
> +#endif
> +
> 	if (offset_in_page(addr))
> 		return addr;
> 
> @@ -1451,7 +1481,11 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
> 	 * of the memory object, so we don't do any here.
> 	 */
> 	vm_flags |= calc_vm_prot_bits(prot, pkey) | calc_vm_flag_bits(flags) |
> +#ifdef CONFIG_RO_EXEC_FILEMAP_HUGE_FAULT_THP
> +			mm->def_flags | VM_MAYREAD | vm_maywrite | VM_MAYEXEC;
> +#else
> 			mm->def_flags | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC;
> +#endif
> 
> 	if (flags & MAP_LOCKED)
> 		if (!can_do_mlock())
> diff --git a/mm/rmap.c b/mm/rmap.c
> index e5dfe2ae6b0d..503612d3b52b 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1192,7 +1192,11 @@ void page_add_file_rmap(struct page *page, bool compound)
> 		}
> 		if (!atomic_inc_and_test(compound_mapcount_ptr(page)))
> 			goto out;
> +
> +#ifndef CONFIG_RO_EXEC_FILEMAP_HUGE_FAULT_THP
> 		VM_BUG_ON_PAGE(!PageSwapBacked(page), page);
> +#endif
> +
> 		__inc_node_page_state(page, NR_SHMEM_PMDMAPPED);
> 	} else {
> 		if (PageTransCompound(page) && page_mapping(page)) {
> @@ -1232,7 +1236,11 @@ static void page_remove_file_rmap(struct page *page, bool compound)
> 		}
> 		if (!atomic_add_negative(-1, compound_mapcount_ptr(page)))
> 			goto out;
> +
> +#ifndef CONFIG_RO_EXEC_FILEMAP_HUGE_FAULT_THP
> 		VM_BUG_ON_PAGE(!PageSwapBacked(page), page);
> +#endif
> +
> 		__dec_node_page_state(page, NR_SHMEM_PMDMAPPED);
> 	} else {
> 		if (!atomic_add_negative(-1, &page->_mapcount))
> -- 
> 2.21.0
> 


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
