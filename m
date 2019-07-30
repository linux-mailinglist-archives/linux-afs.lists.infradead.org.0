Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 755377BC5E
	for <lists+linux-afs@lfdr.de>; Wed, 31 Jul 2019 10:57:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IOW718nkQzGmRXW/UK7Q1OGxyL9dLb0RexBqKL8GScY=; b=LyG2uvnkWxikf4
	ErUDwB/J2ZGJw88OGZ2a+nvD0NcHNiBdBcIM1vjvRflyNCE1Q0UWDJ1iwn3fF9kc691LYrNJH7PEk
	xmKul8K57Nm3jI1rdwEnJqV8oL4FDky4E6GeqAEtViGWG3ej+fCIXp6Hr3kL1cfCl7UUicFPqOr4C
	nHjEYUdv5HRILt8AKWPupusEpKIuXn9bxAAknCbkDGMxYn3oE42KdFiOdFitnOfD3Pr1UrvLgH73E
	CQ0+H1EMCckMWjpsOJ1G+QegNUOr+QlToM6iwvj1gAgxpkgPIAXRmNQ8rIQKO13C48tPdpnp1idcq
	Ukv7W6/KsHNyqSYt6B2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hskQM-0005t8-77; Wed, 31 Jul 2019 08:57:30 +0000
Received: from mx0b-00082601.pphosted.com ([67.231.153.30])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsZTG-0000Il-N1
 for linux-afs@lists.infradead.org; Tue, 30 Jul 2019 21:15:48 +0000
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UL8hcG010240; Tue, 30 Jul 2019 14:14:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=wZ+7DlVW/DgJ0Ms3EBm0xDsWfXcC4XSD3bCIcnEjCMw=;
 b=qwd4Krkn67n5eRSdBKUtBlYzdIaSgB6sgyFa1ObcDd8zEk2kugl16YXkBAkmGpl0M0iz
 oFnp4m6dtLP1Gqf2BJFPV5aUCH/bYYzN98QxmH/GKrCdstMMOV1d0uieLvS9Yi+72INC
 DmIAy8Ue5fCTYE7/kqIcjVcD8FlplMmE5yY= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2u2pwm1ne0-13
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2019 14:14:14 -0700
Received: from prn-mbx01.TheFacebook.com (2620:10d:c081:6::15) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 30 Jul 2019 14:13:53 -0700
Received: from prn-hub06.TheFacebook.com (2620:10d:c081:35::130) by
 prn-mbx01.TheFacebook.com (2620:10d:c081:6::15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 30 Jul 2019 14:13:52 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 30 Jul 2019 14:13:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klGPbVmMw/UJbAb+GLTpjzvVgWtRagrZHXNpIVByr5fAZ4PQQo24YRl594POv/TXdURIDdAsOQ32lX+S4KL2FqTb+hE4uQg0/Wu0u4boqA/JHg77xJ2j1YJRyXve3Mfz66ftxSWGxGUzDxJavLC5ZODOY98MIh18QjUVsrJeB/iVi6Dunl982NlRJVpjii6tRjbOvz3HPQNu05j4dJ6UErb+o06C6yQHxC+0JZNa85lnvLAvcWCxjoCV+V2Y4AIJpPnzGYQu3CHRYjJho1XA+9wlfRQIIwtV8RV+/mXHQpOgiwZI3TGj11WgE/7A0uf7dHfVp0BTZlpiFOmFi/lwqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZ+7DlVW/DgJ0Ms3EBm0xDsWfXcC4XSD3bCIcnEjCMw=;
 b=gffZMU0Kz/9sowgPWZhAlK99XI15m32+LsnY4SxUJIt0sia/8Kslyc93GNWOvoitMI3fZrGhY5iDgZVXNbz1ZF0+HC6+s0Zm1hqT1f4hmNJ3xMHAcntywcqOo1Llq7Pej3QfYkycrgzbSh2ZnvsPjOI0w9mZ2Ty1KUMAT8qtV8fMOAQyeFIK2gd0BocCEOJC/L+n4gMGcDrtQs0if9MpP1eCgKu+EyXI0yD4eUr6/PiphDHxIgC2obYdqQxBEXPmAppgmsHHBKtKlC/7fa2iRoqB5so+k90MSjMQSwNUfgBtCJFEzw790ajen4DonMiFDPXUIhiCotfBe8rKhcCviQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZ+7DlVW/DgJ0Ms3EBm0xDsWfXcC4XSD3bCIcnEjCMw=;
 b=EdZ0K8zWtMVzK00kTxhBAmY6NEg63gHSv+u6lonLhqEq1xdORg+PIh0VJ8k4GS5e0ZsJvy0yKoIzHbFURN5UT1z/SpuPo/r2d1vKysN+8PFAKpShMxvW2yFq/VmwrX8BUNa/+Xvxko8Tnf94oVIlZU1CqMsxN4JfnvTylzrwsF8=
Received: from MWHPR15MB1165.namprd15.prod.outlook.com (10.175.3.22) by
 MWHPR15MB1888.namprd15.prod.outlook.com (10.174.100.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Tue, 30 Jul 2019 21:13:51 +0000
Received: from MWHPR15MB1165.namprd15.prod.outlook.com
 ([fe80::d4fc:70c0:79a5:f41b]) by MWHPR15MB1165.namprd15.prod.outlook.com
 ([fe80::d4fc:70c0:79a5:f41b%2]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 21:13:51 +0000
From: Song Liu <songliubraving@fb.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 1/2] mm: Allow the page cache to allocate large pages
Thread-Topic: [PATCH v2 1/2] mm: Allow the page cache to allocate large pages
Thread-Index: AQHVRlJNqktwHlJ0XkWeiU6bbajOXKbiJk4AgAF3MwCAAA04AA==
Date: Tue, 30 Jul 2019 21:13:51 +0000
Message-ID: <74E5DB03-E8C0-40A0-8C8A-DF53B53734F4@fb.com>
References: <20190729210933.18674-1-william.kucharski@oracle.com>
 <20190729210933.18674-2-william.kucharski@oracle.com>
 <443BA74D-9A8E-479B-9E63-4ACD6D6C0AF9@fb.com>
 <20190730202632.GC4700@bombadil.infradead.org>
In-Reply-To: <20190730202632.GC4700@bombadil.infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-originating-ip: [2620:10d:c090:200::3:5cb8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bdf4884-1cc6-4cc5-ed40-08d71532d261
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR15MB1888; 
x-ms-traffictypediagnostic: MWHPR15MB1888:
x-microsoft-antispam-prvs: <MWHPR15MB1888456186DC09999F3797ABB3DC0@MWHPR15MB1888.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(396003)(376002)(366004)(39860400002)(199004)(189003)(71190400001)(25786009)(54906003)(102836004)(76116006)(6116002)(14444005)(7416002)(7406005)(7366002)(229853002)(66446008)(68736007)(305945005)(256004)(66476007)(99286004)(316002)(66556008)(66946007)(64756008)(6486002)(86362001)(4744005)(14454004)(446003)(4326008)(46003)(6436002)(486006)(6512007)(36756003)(11346002)(6916009)(2906002)(478600001)(5660300002)(33656002)(6506007)(81156014)(53936002)(6246003)(7736002)(186003)(8936002)(8676002)(57306001)(53546011)(2616005)(81166006)(71200400001)(76176011)(476003)(50226002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1888;
 H:MWHPR15MB1165.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UH2XJQO7wNz8442LVmrH7iitcKAQGDBy4k/AnFreDSe21HiCzmKOgfFwDOqjwjXaWmmb6NSmvpRWb2y/bofbb89qI9ftt4FKLlfmkySS75kx/JBbNDQ04RJyC5KnfpiPFM4ZXImg1yohJSRYxFB1jQqdSGofVh1PHwv1Rko6rECQazCJsk2tP4jZlyUsSSk+dj9pOhtJ6WpPUF7PBrt1nCC7ckhetKdLLlGWXbOIr3m1N4UujUmBaeVSmL3+PolElnfOJX95cjG/M05Kx5I4b71DLBbMXknD1qgnDFmXS2lGbdCBVgxItB8i0okSKxDErA2bya22b0+0CffoyKZ7MwmjL0Y0cJzAEuzbN1b3bz3Uiam+iEdU+MNWmdBqr7fXVOJwQYCDT8TRKYz8KDrwNTy/5YihmIhh3yUiGm64F8g=
Content-ID: <C0508030DADA914F80479A0B5C474F71@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bdf4884-1cc6-4cc5-ed40-08d71532d261
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 21:13:51.2110 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: songliubraving@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1888
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=662 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907300212
X-FB-Internal: deliver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_141547_062030_377C2C41 
X-CRM114-Status: GOOD (  14.47  )
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
 Yangtao Li <tiny.windzz@gmail.com>, Hugh Dickins <hughd@google.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Keith Busch <keith.busch@intel.com>,
 William Kucharski <william.kucharski@oracle.com>,
 Yafang Shao <laoar.shao@gmail.com>, Arun KS <arunks@codeaurora.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Ira Weiny <ira.weiny@intel.com>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>, kbuild test
 robot <lkp@intel.com>, Sage Weil <sage@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chris Mason <clm@fb.com>,
 Pavel
 Tatashin <pasha.tatashin@oracle.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrey Konovalov <andreyknvl@google.com>, Dave
 Airlie <airlied@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Linux-MM <linux-mm@kvack.org>, Dan Williams <dan.j.williams@intel.com>,
 Bob Kasten <robert.a.kasten@intel.com>, Miklos Szeredi <mszeredi@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Amir Goldstein <amir73il@gmail.com>,
 Jann Horn <jannh@google.com>, John Hubbard <jhubbard@nvidia.com>,
 David Rientjes <rientjes@google.com>,
 "john.hubbard@gmail.com" <john.hubbard@gmail.com>,
 Josef Bacik <josef@toxicpanda.com>, Ross Zwisler <zwisler@google.com>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Kirill Tkhai <ktkhai@virtuozzo.com>, Dave Chinner <dchinner@redhat.com>,
 David Sterba <dsterba@suse.com>, Yang Shi <yang.shi@linux.alibaba.com>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, Chad
 Mynhier <chad.mynhier@oracle.com>, David Howells <dhowells@redhat.com>,
 Huang Shijie <sjhuang@iluvatar.ai>, Johannes Weiner <jweiner@fb.com>,
 Steve Capper <steve.capper@arm.com>, Networking <netdev@vger.kernel.org>, Gao
 Xiang <hsiangkao@aol.com>, Jeff
 Layton <jlayton@kernel.org>, lkml <linux-kernel@vger.kernel.org>, Sean
 Christopherson <sean.j.christopherson@intel.com>,
 Souptick Joarder <jrdr.linux@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org



> On Jul 30, 2019, at 1:26 PM, Matthew Wilcox <willy@infradead.org> wrote:
> 
> On Mon, Jul 29, 2019 at 10:03:40PM +0000, Song Liu wrote:
>>> +/* If you add more flags, increment FGP_ORDER_SHIFT */
>>> +#define	FGP_ORDER_SHIFT		7
>>> +#define	FGP_PMD			((PMD_SHIFT - PAGE_SHIFT) << FGP_ORDER_SHIFT)
>>> +#define	FGP_PUD			((PUD_SHIFT - PAGE_SHIFT) << FGP_ORDER_SHIFT)
>>> +#define	fgp_get_order(fgp)	((fgp) >> FGP_ORDER_SHIFT)
>> 
>> This looks like we want support order up to 25 (32 - 7). I guess we don't 
>> need that many. How about we specify the highest order to support here? 
> 
> We can support all the way up to order 64 with just 6 bits, leaving 32 -
> 6 - 7 = 19 bits free.  We haven't been adding FGP flags very quickly,
> so I doubt we'll need anything larger.

lol. I misread the bit usage. 

> 
>> Also, fgp_flags is signed int, so we need to make sure fgp_flags is not
>> negative. 
> 
> If we ever get there, I expect people to convert the parameter from signed
> int to unsigned long.

Agreed. 

Thanks,
Song


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
