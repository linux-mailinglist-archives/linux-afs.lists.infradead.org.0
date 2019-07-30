Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFC77BC5F
	for <lists+linux-afs@lfdr.de>; Wed, 31 Jul 2019 10:57:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rd+M7IIS7K96IdY0FyqXWNxUyq0OAU9446ckJK5MM0=; b=EqrtOaXQguilpb
	qeGJn0NZc0hAQEpSiNPxtXZQPYAD9xkGZE5LekJji6mBJC5BtHzDwXbh4Bz3mQnvbiF9EAOfMUGPu
	lzgI7TTbEuOJ6NNNN9vGDVJ599SzCL1drPXObx4Wn97B/r76LiZfj9RucJapqo16yuwwMjl4SSqCK
	K86Hp9MPDw70tyW4Rv9MT+O0syIYI5G0ZXzN4cJ6Z5yGKnSwwlK/vVrkpD4LHbDRHPCQfeCQUZt9E
	iKUVn3RAZDg0Z8/WXP/npAoYmsu26sCmDoWuGbvFPpDLSN0oZe8Mh76rYjBgOEWU9LHUJof9BEWG6
	iIu8hgtV8OiUvoy89BOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hskQK-0005rb-Lm; Wed, 31 Jul 2019 08:57:28 +0000
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]
 helo=mx0a-00082601.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsXaw-0000ty-BH
 for linux-afs@lists.infradead.org; Tue, 30 Jul 2019 19:15:36 +0000
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x6UJ73Cs010627;
 Tue, 30 Jul 2019 12:14:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=QK2E/gpSHrD0IH3cFtcW53NM5uCJd2+YWMDKDC3jclM=;
 b=EUuUKciakt4NLIyE+BGrfZa99AXISHbeOgsAFXvAHS2EEJnpSZEiaeEjRRvQUMU+qXdX
 j9miaZDxyhdxarZK6bm6iAzHzC10azgURPTbYB43sGjhYjkZjZKP0RG4wA5fovjnEbNw
 YHcfJwbhFI7SaumZe2QMFRXAif9zY4d4l70= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0001303.ppops.net with ESMTP id 2u275g42ge-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2019 12:14:52 -0700
Received: from prn-mbx04.TheFacebook.com (2620:10d:c081:6::18) by
 prn-hub01.TheFacebook.com (2620:10d:c081:35::125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 30 Jul 2019 12:14:49 -0700
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-mbx04.TheFacebook.com (2620:10d:c081:6::18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 30 Jul 2019 12:14:49 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 30 Jul 2019 12:14:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImyLJrQY0yxJS0tt7WAOGEuwH7Laj7HEpbE9gHBiA0HV5eMdWqN7pOBFi9cxguf7NmCzeal8UBy395x4LKdRaGEWHrIhhhbFh7eoZZx8KA8GKYWa7pW63AuLZNoxO3oSPrAvGxtGHyJgHgPFjCNAppctNqwecQvZ8pVCrzVkHCdH98LnbcQcG7NFWbK1yKzyp1gsHdPKwoFshlmwJ0v+FZtIc9wg22Nh7OwMNME3PZ/WqwURr5MpggmSYDSS+t91XjiQRswzmevpt9rHhaL8IzTTUEvUkgETX9KmYUguXj/LKHAvX2TY/Vuh7OL5kCs0x6s+1d2btQwhOzdz5tI0YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QK2E/gpSHrD0IH3cFtcW53NM5uCJd2+YWMDKDC3jclM=;
 b=IhFfKg7vHzG27TDnTW6YjUaWOanO+0SZUOomjwz2yM92rwGAh66gQ4POqPjY8HgjdCuc9tikC6ZzOy63TE+YVLMgCg8lotdRRsXtx6eXnxUfaTqr+E0vORIp/MiGZy7uMaUyRevfAEN5JBMw2YGiypB0o80HFpCckJBxhy+0EWUPxxBNpwn9E2vo4G0OfagsZEzYoOAj0uy/4E5AEfPPgMzfKK7bJaLAjnPoGhdr8jDdu72WOSq0KLwrdqv+Ofz/0e30l84SQAqRkFu01pnK0b8Y6bU5HWX4hc8gKQsq5ltYacHaA1koeW2bxyt57UZORItpTY0+Q8lB5gEaPOC8HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QK2E/gpSHrD0IH3cFtcW53NM5uCJd2+YWMDKDC3jclM=;
 b=LnZdNkhmbZRvdFdM5zPkbxHvfelKufKq4xFQMRgBMyVwBLEzMMzlyOYjIteebI9ed1dsqrRDcM+01jE1vkLMsEjsemyOFBII5ZbkhX4C/VHNOmSHDVCmXSZASIL3G1tCEvKIRelwj/u7EMlptPpm+zU5GyBIIKC6c/sxhDeMrBI=
Received: from MWHPR15MB1165.namprd15.prod.outlook.com (10.175.3.22) by
 MWHPR15MB1520.namprd15.prod.outlook.com (10.173.234.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 19:14:47 +0000
Received: from MWHPR15MB1165.namprd15.prod.outlook.com
 ([fe80::d4fc:70c0:79a5:f41b]) by MWHPR15MB1165.namprd15.prod.outlook.com
 ([fe80::d4fc:70c0:79a5:f41b%2]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 19:14:47 +0000
From: Song Liu <songliubraving@fb.com>
To: William Kucharski <william.kucharski@oracle.com>
Subject: Re: [PATCH v2 2/2] mm,thp: Add experimental config option
 RO_EXEC_FILEMAP_HUGE_FAULT_THP
Thread-Topic: [PATCH v2 2/2] mm,thp: Add experimental config option
 RO_EXEC_FILEMAP_HUGE_FAULT_THP
Thread-Index: AQHVRlIkIBeF3SPMIUmfTIWhM30vRKbiM5WAgAEBOgCAAFSkgA==
Date: Tue, 30 Jul 2019 19:14:47 +0000
Message-ID: <1D97995B-E3A6-4397-AA99-2E7B90534559@fb.com>
References: <20190729210933.18674-1-william.kucharski@oracle.com>
 <20190729210933.18674-3-william.kucharski@oracle.com>
 <E6E92F42-3FA0-473C-B6F2-E23826C766F5@fb.com>
 <ffbdd056-e80c-41f4-37c4-c8b758fb59e7@oracle.com>
In-Reply-To: <ffbdd056-e80c-41f4-37c4-c8b758fb59e7@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-originating-ip: [2620:10d:c090:200::3:5cb8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03adb8e9-aca7-4801-9873-08d71522301b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1520; 
x-ms-traffictypediagnostic: MWHPR15MB1520:
x-microsoft-antispam-prvs: <MWHPR15MB1520904FA58A127656D0343BB3DC0@MWHPR15MB1520.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(346002)(366004)(39860400002)(376002)(199004)(189003)(36756003)(6512007)(53936002)(71200400001)(71190400001)(8676002)(81156014)(7736002)(50226002)(81166006)(305945005)(68736007)(64756008)(5660300002)(8936002)(7416002)(76116006)(66446008)(66556008)(66476007)(7406005)(7366002)(66946007)(446003)(99286004)(46003)(6436002)(6486002)(57306001)(186003)(11346002)(2906002)(53546011)(6506007)(478600001)(316002)(14454004)(54906003)(6246003)(4326008)(256004)(6116002)(25786009)(76176011)(86362001)(33656002)(486006)(229853002)(102836004)(2616005)(6916009)(476003)(142933001)(14583001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1520;
 H:MWHPR15MB1165.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DcczXJnBs6wroH2ga6LynzGq4T5M0W0x6H0P0gzoPmPv+kJkTnEXqH1kpgkK3vjmUMLMa8V/l+aReLEnJ42DvBxWtzWR/p1zPLiQ/vO1xFKMUpfyOOLHOgbQSlg8DJSKRenvieiyZsQ+ou+qj0OVos++x2fLkxCc8t0Twb0rAfTRQ6StDuJbBqWEPKyeOKusy2rq5oC/ISfm9b/1rscoLM3DZ2AznUGfOcZ+huG01gymHtlOdvvioFMW4DEkOkVW0UA8N5McZMObjhqm7SK57D18/1RGUy4j1rIZqWdftRlcCWRgde6iEtsbLn4FRmOzWScBkPiGgMMUGxvYkXzrPEPJ6Zm+C/KKmZTaxBDndziS5zD/byfBqdmy7RjOuG02R6JOD+Q/01JRw9LCXzeKqipBfc5r+0Ar9o7BSkJK/Qw=
Content-ID: <3D2E2C12A13A2842AAE6A44FC1165839@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 03adb8e9-aca7-4801-9873-08d71522301b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 19:14:47.2377 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: songliubraving@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1520
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907300193
X-FB-Internal: deliver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_121534_516420_4B63B078 
X-CRM114-Status: GOOD (  20.55  )
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
 Yangtao Li <tiny.windzz@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Keith Busch <keith.busch@intel.com>, Chris Mason <clm@fb.com>,
 Yafang Shao <laoar.shao@gmail.com>, Arun KS <arunks@codeaurora.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Ira Weiny <ira.weiny@intel.com>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
 Sage Weil <sage@redhat.com>, "Darrick J. Wong" <darrick.wong@oracle.com>,
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



> On Jul 30, 2019, at 7:11 AM, William Kucharski <william.kucharski@oracle.com> wrote:
> 
> 
> 
> On 7/29/19 4:51 PM, Song Liu wrote:
> 
>> 
>>> +#define	HPAGE_PMD_OFFSET	(HPAGE_PMD_SIZE - 1)
>>           ^ space vs. tab difference here.
> 
> Thanks, good catch!
> 
>>> +#define HPAGE_PMD_MASK		(~(HPAGE_PMD_OFFSET))
>>> +
>>> +#define HPAGE_PUD_SHIFT		PUD_SHIFT
>>> +#define HPAGE_PUD_SIZE		((1UL) << HPAGE_PUD_SHIFT)
>>> +#define	HPAGE_PUD_OFFSET	(HPAGE_PUD_SIZE - 1)
> 
> Saw this one, too.
> 
>> Should HPAGE_PMD_OFFSET and HPAGE_PUD_OFFSET include bits for
>> PAGE_OFFSET? I guess we can just keep huge_mm.h as-is and use
>> ~HPAGE_PMD_MASK.
> 
> That's what I had intended; would you rather see those macros
> omit the unneeded for the larger page size bits?

I think using ~HPAGE_PMD_MASK is common practice. Let's keep it 
that way. 

> 
>>> - * - FGP_PMD: If FGP_CREAT is specified, attempt to allocate a PMD-sized page.
>>> + * - FGP_PMD: If FGP_CREAT is specified, attempt to allocate a PMD-sized page
> 
> No - this came in as part of patch 1/2 and I missed dropping the period at the end of the line that caused this to be a diff, so I will put it
> back. :-)
> 
>> We have been using name "xas" for "struct xa_state *". Let's keep using it?
> 
> Thanks, done.
> 
>>> +	if (unlikely(!(PageCompound(new_page)))) {
>>    What condition triggers this case
> I wanted a check to make sure that __page_cacke_alloc() returned a large page. I don't recall if the mechanism guarantees that when you ask for
> a large page, you get one, so I wanted to handle that case.
> 
> If you prefer, I could make this a VM_BUG_ON_PAGE() instead, but I
> wanted it to fallback gracefully if it can't get a properly sized
> page.

I think __page_cache_alloc() guarantees compound page. If not, it
should return NULL. 

> 
>>> +#ifndef	COMPOUND_PAGES_HEAD_ONLY
>> Where do we define COMPOUND_PAGES_HEAD_ONLY?
> 
> At present, we do not.
> 
> I used this so I could include the code that would be needed once
> Matthew's "store only head pages in page cache" changes go back in,
> which looks like it may not be until 5.4-rc1. Matthew recommended I

We don't have to wait until 5.4-rc1. We could develop based on this 
patch once it lands in mm tree. 

Thanks,
Song


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
