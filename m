Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 391AD7ABE7
	for <lists+linux-afs@lfdr.de>; Tue, 30 Jul 2019 17:03:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=axYUd1Nbd4g1QERSEeutpOtPVz0iMHVGhgKEotDePSY=; b=SHsicmNs7iCU2t
	Lk2fC40+PrPSsCUR6yrqSnDWBWsh5Ew0KGD3ifRV/PlaUU1gtiZVGmTfbFs06brooQmjnnnNxJpym
	nSvz8RxKB1K3Mq4M7A/d26brxqg/6xyX84JWL5eAn5LLkr91aBWeQse6kepBGe6IzibzplWGJszBs
	Z0Rj5kqGxBrSKZvmmfgbi8Fz0mQw+EDhPxJvLkaJFVGqLylMLgomK88MYzuGru0C5xcO8eFOzqHb2
	RI2h6nRNlfUsWZZ6b3ahfwHS/8OApN/UFUkQz/GAYXTUN+asEDZgnHrvI6hFhWNVud5/UZPv0iUJR
	istc/gANvcni2fm28mRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsTel-0007Zq-6q; Tue, 30 Jul 2019 15:03:15 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsDkp-0001Km-1b
 for linux-afs@lists.infradead.org; Mon, 29 Jul 2019 22:04:29 +0000
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6TM3DC2027010; Mon, 29 Jul 2019 15:03:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=CQPfECE1fzErRRxoNKhd3Oy3USKeTkS5pnpP7eVdeQU=;
 b=S341XLjWfMLnpEAxvYJ8XO1N3MSrpSNKbd+/gSMB6mpUdfizZ130Z/xKdzL3F4pyNlnb
 L38YohAMfYXPco7P8I174hgBOJ9b89oc3z/YP+hAPBaRnTtrmnKF6TikpTyS2wrtpI43
 mNHE1rleqqkxHTcXlHJNThLSL/6MFFuABUY= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2u24hssp4b-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 29 Jul 2019 15:03:45 -0700
Received: from ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) by
 ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 29 Jul 2019 15:03:42 -0700
Received: from ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) by
 ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 29 Jul 2019 15:03:42 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 29 Jul 2019 15:03:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6lEG/F16Yx9lnAMYe8l5L2NU2lbB0+QBy50Fds9YIChrR59cacLflqv6VW177lpHOnhIts6EfRhdxexDYEWmg5gdbD3qGxbNYS23qqrjXni2OBITCz3+ArCsT98nFENviqfyOGYJnRQTguDiuYd8I2DoXoMuuNwotAmwDKpkOFrrk/Gj2bZK27zJVMb1/5wP86DgUVx1qSBNv07ZJ/SM2YUaboIW3SDB0uVjq7nJTyrNL/vdrq6p8AaRLgfxHEdiIDUqzENiBs+2SiEZyWo4JgqnGg++F8+UO9l94XHavcjzqi5dN7RN/SqlHiZyaNQmrlK4Ig5kX7E/SfJolOgkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQPfECE1fzErRRxoNKhd3Oy3USKeTkS5pnpP7eVdeQU=;
 b=BPjxeQwnFtYB4eBk6ofyQ+Rdbxdd/ojFZ7FRuBcID+idQ5UeygtuIb8JKMk/g9DYgmof9m2aw8e3gcNYTsitCrtekA4COfRvU3onWnT6r5BiZUBu5348v/isG/uRqNc6IrUF+F1G9Gye3H9d2tRyF2mUYeKf0caiaYU8c4it6rumeUQJDQmt6u3FSY097zdHKoAERupq+u9EyhYsJqORyQU1lON0gqzypB6mMyDrQ7Zp+j1pjrbFUAUdDZ2w8SwwNGzCQ3PC4N/THV8vIy7muUw0yXHF1buicbq/W7eyArYfq2Q8pYjGhEkZb/avxw21KVqDJVynJc4diT79eTJhAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQPfECE1fzErRRxoNKhd3Oy3USKeTkS5pnpP7eVdeQU=;
 b=Ga8crWWVYd4SMJ7hULn2bm6fHAtqAttQfXUP0spfk99/vTvJjfH1bWBTDM5xK+8zVbLphAG4RaBRmb5PQRokAVditYRwLfBW4Uk4z0JGK5Tr+mYb1Axtbck+Jy9AI8w7toPoV15cYDlnzc9pCv8mDqcsk/zLHKEpwTM6H8g9E4A=
Received: from MWHPR15MB1165.namprd15.prod.outlook.com (10.175.3.22) by
 MWHPR15MB1726.namprd15.prod.outlook.com (10.174.254.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Mon, 29 Jul 2019 22:03:41 +0000
Received: from MWHPR15MB1165.namprd15.prod.outlook.com
 ([fe80::d4fc:70c0:79a5:f41b]) by MWHPR15MB1165.namprd15.prod.outlook.com
 ([fe80::d4fc:70c0:79a5:f41b%2]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 22:03:41 +0000
From: Song Liu <songliubraving@fb.com>
To: William Kucharski <william.kucharski@oracle.com>
Subject: Re: [PATCH v2 1/2] mm: Allow the page cache to allocate large pages
Thread-Topic: [PATCH v2 1/2] mm: Allow the page cache to allocate large pages
Thread-Index: AQHVRlJNqktwHlJ0XkWeiU6bbajOXKbiJk4A
Date: Mon, 29 Jul 2019 22:03:40 +0000
Message-ID: <443BA74D-9A8E-479B-9E63-4ACD6D6C0AF9@fb.com>
References: <20190729210933.18674-1-william.kucharski@oracle.com>
 <20190729210933.18674-2-william.kucharski@oracle.com>
In-Reply-To: <20190729210933.18674-2-william.kucharski@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-originating-ip: [2620:10d:c090:200::2:d148]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd37c38f-be1d-4d93-3d2b-08d714709dab
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1726; 
x-ms-traffictypediagnostic: MWHPR15MB1726:
x-microsoft-antispam-prvs: <MWHPR15MB1726EBBAA3C3EDE2DB43C3C1B3DD0@MWHPR15MB1726.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(136003)(396003)(346002)(376002)(189003)(199004)(7366002)(186003)(76176011)(66556008)(66476007)(6506007)(102836004)(8676002)(53546011)(6512007)(66446008)(64756008)(2616005)(53936002)(5660300002)(71190400001)(446003)(66946007)(76116006)(229853002)(6486002)(6436002)(50226002)(7736002)(11346002)(57306001)(476003)(486006)(86362001)(8936002)(46003)(30864003)(81166006)(71200400001)(81156014)(2906002)(68736007)(6916009)(54906003)(36756003)(14444005)(478600001)(256004)(6246003)(4326008)(99286004)(25786009)(7406005)(33656002)(6116002)(7416002)(305945005)(14454004)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1726;
 H:MWHPR15MB1165.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vNUOaqe4/uHpgEAI3ev0/F+dQ1LjwIet8w0w+gohKFNqWU5Uc/L7engYQZKfKMI41wee+tmbPraMHgRUQwC4r1l0zAgRy9yQfJgIn5LUNKP9LoRb2mG+2Ujl5iCpnAe+wRAa7mHMi4+tmo57sCwMeXO1FRKkH/vodz4abe4l+t57oOabarG6ozmS/CQ7O30aO5hnRFxYFDPOrKRANxZvyvThteJ/qOWgVuI4XYS+i64PSh9N/lu7pXfRFcgzZkqBWQgb1AkPwyx2wMklgGKl8QO5ZbXDWGc27lZosCRciBWd4wwIROf/doSjsbC+Nfa2xz9mWyGzYY4eya/sVy2b7x9sylV5zEiTT2hY6QqFqYSHhbrQbaZEh6XGCW64tc/XbK5NFxsqRbeitJbfdFl6/THufkRdF7facH6LAqFQA+0=
Content-ID: <08E2397F46E03E41ABE3B9537ED2C28F@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bd37c38f-be1d-4d93-3d2b-08d714709dab
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 22:03:40.3246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: songliubraving@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1726
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-29_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907290240
X-FB-Internal: deliver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_150427_100703_345245D7 
X-CRM114-Status: GOOD (  21.80  )
X-Spam-Score: -0.9 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.9 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [67.231.145.42 listed in list.dnswl.org]
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
 kbuild test robot <lkp@intel.com>, Sage Weil <sage@redhat.com>, "Darrick J.
 Wong" <darrick.wong@oracle.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Bartlomiej
 Zolnierkiewicz <b.zolnierkie@samsung.com>, Hugh Dickins <hughd@google.com>,
 Pavel Tatashin <pasha.tatashin@oracle.com>, Matthew
 Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
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

I guess we need "From: Matthew Wilcox <willy@infradead.org>" here?

> Add an order field to __page_cache_alloc() to allow for the allocation
> of large memory page page cache entries.
> 
> Signed-off-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: William Kucharski <william.kucharski@oracle.com>
> Reported-by: kbuild test robot <lkp@intel.com>
> ---
> fs/afs/dir.c            |  2 +-
> fs/btrfs/compression.c  |  2 +-
> fs/cachefiles/rdwr.c    |  4 ++--
> fs/ceph/addr.c          |  2 +-
> fs/ceph/file.c          |  2 +-
> include/linux/pagemap.h | 13 +++++++++----
> mm/filemap.c            | 25 +++++++++++++------------
> mm/readahead.c          |  2 +-
> net/ceph/pagelist.c     |  4 ++--
> net/ceph/pagevec.c      |  2 +-
> 10 files changed, 32 insertions(+), 26 deletions(-)
> 
> diff --git a/fs/afs/dir.c b/fs/afs/dir.c
> index e640d67274be..0a392214f71e 100644
> --- a/fs/afs/dir.c
> +++ b/fs/afs/dir.c
> @@ -274,7 +274,7 @@ static struct afs_read *afs_read_dir(struct afs_vnode *dvnode, struct key *key)
> 				afs_stat_v(dvnode, n_inval);
> 
> 			ret = -ENOMEM;
> -			req->pages[i] = __page_cache_alloc(gfp);
> +			req->pages[i] = __page_cache_alloc(gfp, 0);
> 			if (!req->pages[i])
> 				goto error;
> 			ret = add_to_page_cache_lru(req->pages[i],
> diff --git a/fs/btrfs/compression.c b/fs/btrfs/compression.c
> index 60c47b417a4b..5280e7477b7e 100644
> --- a/fs/btrfs/compression.c
> +++ b/fs/btrfs/compression.c
> @@ -466,7 +466,7 @@ static noinline int add_ra_bio_pages(struct inode *inode,
> 		}
> 
> 		page = __page_cache_alloc(mapping_gfp_constraint(mapping,
> -								 ~__GFP_FS));
> +								 ~__GFP_FS), 0);
> 		if (!page)
> 			break;
> 
> diff --git a/fs/cachefiles/rdwr.c b/fs/cachefiles/rdwr.c
> index 44a3ce1e4ce4..11d30212745f 100644
> --- a/fs/cachefiles/rdwr.c
> +++ b/fs/cachefiles/rdwr.c
> @@ -259,7 +259,7 @@ static int cachefiles_read_backing_file_one(struct cachefiles_object *object,
> 			goto backing_page_already_present;
> 
> 		if (!newpage) {
> -			newpage = __page_cache_alloc(cachefiles_gfp);
> +			newpage = __page_cache_alloc(cachefiles_gfp, 0);
> 			if (!newpage)
> 				goto nomem_monitor;
> 		}
> @@ -495,7 +495,7 @@ static int cachefiles_read_backing_file(struct cachefiles_object *object,
> 				goto backing_page_already_present;
> 
> 			if (!newpage) {
> -				newpage = __page_cache_alloc(cachefiles_gfp);
> +				newpage = __page_cache_alloc(cachefiles_gfp, 0);
> 				if (!newpage)
> 					goto nomem;
> 			}
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index e078cc55b989..bcb41fbee533 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -1707,7 +1707,7 @@ int ceph_uninline_data(struct file *filp, struct page *locked_page)
> 		if (len > PAGE_SIZE)
> 			len = PAGE_SIZE;
> 	} else {
> -		page = __page_cache_alloc(GFP_NOFS);
> +		page = __page_cache_alloc(GFP_NOFS, 0);
> 		if (!page) {
> 			err = -ENOMEM;
> 			goto out;
> diff --git a/fs/ceph/file.c b/fs/ceph/file.c
> index 685a03cc4b77..ae58d7c31aa4 100644
> --- a/fs/ceph/file.c
> +++ b/fs/ceph/file.c
> @@ -1305,7 +1305,7 @@ static ssize_t ceph_read_iter(struct kiocb *iocb, struct iov_iter *to)
> 		struct page *page = NULL;
> 		loff_t i_size;
> 		if (retry_op == READ_INLINE) {
> -			page = __page_cache_alloc(GFP_KERNEL);
> +			page = __page_cache_alloc(GFP_KERNEL, 0);
> 			if (!page)
> 				return -ENOMEM;
> 		}
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index c7552459a15f..e9004e3cb6a3 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -208,17 +208,17 @@ static inline int page_cache_add_speculative(struct page *page, int count)
> }
> 
> #ifdef CONFIG_NUMA
> -extern struct page *__page_cache_alloc(gfp_t gfp);
> +extern struct page *__page_cache_alloc(gfp_t gfp, unsigned int order);
> #else
> -static inline struct page *__page_cache_alloc(gfp_t gfp)
> +static inline struct page *__page_cache_alloc(gfp_t gfp, unsigned int order)
> {
> -	return alloc_pages(gfp, 0);
> +	return alloc_pages(gfp, order);
> }
> #endif
> 
> static inline struct page *page_cache_alloc(struct address_space *x)
> {
> -	return __page_cache_alloc(mapping_gfp_mask(x));
> +	return __page_cache_alloc(mapping_gfp_mask(x), 0);
> }
> 
> static inline gfp_t readahead_gfp_mask(struct address_space *x)
> @@ -240,6 +240,11 @@ pgoff_t page_cache_prev_miss(struct address_space *mapping,
> #define FGP_NOFS		0x00000010
> #define FGP_NOWAIT		0x00000020
> #define FGP_FOR_MMAP		0x00000040
> +/* If you add more flags, increment FGP_ORDER_SHIFT */
> +#define	FGP_ORDER_SHIFT		7
> +#define	FGP_PMD			((PMD_SHIFT - PAGE_SHIFT) << FGP_ORDER_SHIFT)
> +#define	FGP_PUD			((PUD_SHIFT - PAGE_SHIFT) << FGP_ORDER_SHIFT)
> +#define	fgp_get_order(fgp)	((fgp) >> FGP_ORDER_SHIFT)

This looks like we want support order up to 25 (32 - 7). I guess we don't 
need that many. How about we specify the highest order to support here? 

Also, fgp_flags is signed int, so we need to make sure fgp_flags is not
negative. 

> 
> struct page *pagecache_get_page(struct address_space *mapping, pgoff_t offset,
> 		int fgp_flags, gfp_t cache_gfp_mask);
> diff --git a/mm/filemap.c b/mm/filemap.c
> index d0cf700bf201..a96092243fc4 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -954,7 +954,7 @@ int add_to_page_cache_lru(struct page *page, struct address_space *mapping,
> EXPORT_SYMBOL_GPL(add_to_page_cache_lru);
> 
> #ifdef CONFIG_NUMA
> -struct page *__page_cache_alloc(gfp_t gfp)
> +struct page *__page_cache_alloc(gfp_t gfp, unsigned int order)
> {
> 	int n;
> 	struct page *page;
> @@ -964,12 +964,12 @@ struct page *__page_cache_alloc(gfp_t gfp)
> 		do {
> 			cpuset_mems_cookie = read_mems_allowed_begin();
> 			n = cpuset_mem_spread_node();
> -			page = __alloc_pages_node(n, gfp, 0);
> +			page = __alloc_pages_node(n, gfp, order);
> 		} while (!page && read_mems_allowed_retry(cpuset_mems_cookie));
> 
> 		return page;
> 	}
> -	return alloc_pages(gfp, 0);
> +	return alloc_pages(gfp, order);
> }
> EXPORT_SYMBOL(__page_cache_alloc);
> #endif
> @@ -1597,12 +1597,12 @@ EXPORT_SYMBOL(find_lock_entry);
>  * pagecache_get_page - find and get a page reference
>  * @mapping: the address_space to search
>  * @offset: the page index
> - * @fgp_flags: PCG flags
> + * @fgp_flags: FGP flags
>  * @gfp_mask: gfp mask to use for the page cache data page allocation
>  *
>  * Looks up the page cache slot at @mapping & @offset.
>  *
> - * PCG flags modify how the page is returned.
> + * FGP flags modify how the page is returned.
>  *
>  * @fgp_flags can be:
>  *
> @@ -1615,6 +1615,7 @@ EXPORT_SYMBOL(find_lock_entry);
>  * - FGP_FOR_MMAP: Similar to FGP_CREAT, only we want to allow the caller to do
>  *   its own locking dance if the page is already in cache, or unlock the page
>  *   before returning if we had to add the page to pagecache.
> + * - FGP_PMD: If FGP_CREAT is specified, attempt to allocate a PMD-sized page.
>  *
>  * If FGP_LOCK or FGP_CREAT are specified then the function may sleep even
>  * if the GFP flags specified for FGP_CREAT are atomic.
> @@ -1660,12 +1661,13 @@ struct page *pagecache_get_page(struct address_space *mapping, pgoff_t offset,
> no_page:
> 	if (!page && (fgp_flags & FGP_CREAT)) {
> 		int err;
> -		if ((fgp_flags & FGP_WRITE) && mapping_cap_account_dirty(mapping))
> +		if ((fgp_flags & FGP_WRITE) &&
> +			mapping_cap_account_dirty(mapping))
> 			gfp_mask |= __GFP_WRITE;
> 		if (fgp_flags & FGP_NOFS)
> 			gfp_mask &= ~__GFP_FS;
> 
> -		page = __page_cache_alloc(gfp_mask);
> +		page = __page_cache_alloc(gfp_mask, fgp_get_order(fgp_flags));
> 		if (!page)
> 			return NULL;
> 
> @@ -2802,15 +2804,14 @@ static struct page *wait_on_page_read(struct page *page)
> static struct page *do_read_cache_page(struct address_space *mapping,
> 				pgoff_t index,
> 				int (*filler)(void *, struct page *),
> -				void *data,
> -				gfp_t gfp)
> +				void *data, unsigned int order, gfp_t gfp)
> {
> 	struct page *page;
> 	int err;
> repeat:
> 	page = find_get_page(mapping, index);
> 	if (!page) {
> -		page = __page_cache_alloc(gfp);
> +		page = __page_cache_alloc(gfp, order);
> 		if (!page)
> 			return ERR_PTR(-ENOMEM);
> 		err = add_to_page_cache_lru(page, mapping, index, gfp);
> @@ -2917,7 +2918,7 @@ struct page *read_cache_page(struct address_space *mapping,
> 				int (*filler)(void *, struct page *),
> 				void *data)
> {
> -	return do_read_cache_page(mapping, index, filler, data,
> +	return do_read_cache_page(mapping, index, filler, data, 0,
> 			mapping_gfp_mask(mapping));
> }
> EXPORT_SYMBOL(read_cache_page);
> @@ -2939,7 +2940,7 @@ struct page *read_cache_page_gfp(struct address_space *mapping,
> 				pgoff_t index,
> 				gfp_t gfp)
> {
> -	return do_read_cache_page(mapping, index, NULL, NULL, gfp);
> +	return do_read_cache_page(mapping, index, NULL, NULL, 0, gfp);
> }
> EXPORT_SYMBOL(read_cache_page_gfp);
> 
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 2fe72cd29b47..954760a612ea 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -193,7 +193,7 @@ unsigned int __do_page_cache_readahead(struct address_space *mapping,
> 			continue;
> 		}
> 
> -		page = __page_cache_alloc(gfp_mask);
> +		page = __page_cache_alloc(gfp_mask, 0);
> 		if (!page)
> 			break;
> 		page->index = page_offset;
> diff --git a/net/ceph/pagelist.c b/net/ceph/pagelist.c
> index 65e34f78b05d..0c3face908dc 100644
> --- a/net/ceph/pagelist.c
> +++ b/net/ceph/pagelist.c
> @@ -56,7 +56,7 @@ static int ceph_pagelist_addpage(struct ceph_pagelist *pl)
> 	struct page *page;
> 
> 	if (!pl->num_pages_free) {
> -		page = __page_cache_alloc(GFP_NOFS);
> +		page = __page_cache_alloc(GFP_NOFS, 0);
> 	} else {
> 		page = list_first_entry(&pl->free_list, struct page, lru);
> 		list_del(&page->lru);
> @@ -107,7 +107,7 @@ int ceph_pagelist_reserve(struct ceph_pagelist *pl, size_t space)
> 	space = (space + PAGE_SIZE - 1) >> PAGE_SHIFT;   /* conv to num pages */
> 
> 	while (space > pl->num_pages_free) {
> -		struct page *page = __page_cache_alloc(GFP_NOFS);
> +		struct page *page = __page_cache_alloc(GFP_NOFS, 0);
> 		if (!page)
> 			return -ENOMEM;
> 		list_add_tail(&page->lru, &pl->free_list);
> diff --git a/net/ceph/pagevec.c b/net/ceph/pagevec.c
> index 64305e7056a1..1d07e639216d 100644
> --- a/net/ceph/pagevec.c
> +++ b/net/ceph/pagevec.c
> @@ -45,7 +45,7 @@ struct page **ceph_alloc_page_vector(int num_pages, gfp_t flags)
> 	if (!pages)
> 		return ERR_PTR(-ENOMEM);
> 	for (i = 0; i < num_pages; i++) {
> -		pages[i] = __page_cache_alloc(flags);
> +		pages[i] = __page_cache_alloc(flags, 0);
> 		if (pages[i] == NULL) {
> 			ceph_release_page_vector(pages, i);
> 			return ERR_PTR(-ENOMEM);
> -- 
> 2.21.0
> 


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
