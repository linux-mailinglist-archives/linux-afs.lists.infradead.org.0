Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 169A17ABE6
	for <lists+linux-afs@lfdr.de>; Tue, 30 Jul 2019 17:03:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EbWpgubY4FMCwPREzIxqzgmO/PYsppz+oXRuMy5Ju1s=; b=IgJwI1lM/8kRK5k+FFY5ZS/py
	7gfS0H0IY6LhF0IqUaZiPOxZvrovRd4AJ92OEMUNFsWlaOFJpysIihhd5jIeljeB+i3vwviTl56Pk
	saAk+2j+2W8oYovA857pPCdi7XdChpWGCfHs/Pa9B9y+QqHebQCLPFyH49LAD0ed58HZrllR3gDK0
	5bidQ9QzcHpipZ0Z2z990PJkoJKzunbxbCHHwlIDrMfgzCW+NDZA+OKgG7/ogw0vje6U/86FitcF6
	xVIM8aiHIRJA4TmQRKmPmNwUz6U2oBEkk1182a8CQGUBetlhlOc3hg6V0ThUjea9fR3imBzilVYbq
	d80SoV43A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsTen-0007cQ-1e; Tue, 30 Jul 2019 15:03:17 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsSrw-0006tu-9a
 for linux-afs@lists.infradead.org; Tue, 30 Jul 2019 14:12:49 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6UDxQsu074495;
 Tue, 30 Jul 2019 14:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=XHjAJSStjFV66kiAbYW6uQF1Gtv9TpuNcUiFdII3gO8=;
 b=EkbGpGGuV8PO4LLUs9K2i+8ZCGMZNS5fbhFxL9owl9e3c38ydZTJUnMw0i4bjFG2xOJO
 vVqut1xfZWCoiJKo8gu2x6k9tk/z01l668eFm+KoNfXHXpHON3zWTKuzj/t5KVHVqpku
 xMZxZpVCpe+2pKmknn/M+Ia5yJMWGXmP1FN8WyvRYML+3/028MTcGVFK+5X/MG03JKO8
 k4Nr7Eb/0JQapuWuo8ThZ8kF2c4U9WYJpiv3YouuTFIB2JYjr36rzLhZ3wRQYEsgxZQH
 pmgRrWTq9Rt8nd5h6hmoC70yuutZUzl/54wnd+W71mVm/kuZnbqhG8tUMlix/sWSz3eb fg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2u0e1tpxgb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jul 2019 14:12:03 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6UDwAZj029607;
 Tue, 30 Jul 2019 14:12:03 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2u2exa4efe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jul 2019 14:12:02 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x6UEBrEn029376;
 Tue, 30 Jul 2019 14:11:53 GMT
Received: from localhost.localdomain (/73.243.10.6)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 30 Jul 2019 07:11:53 -0700
Subject: Re: [PATCH v2 2/2] mm,thp: Add experimental config option
 RO_EXEC_FILEMAP_HUGE_FAULT_THP
To: Song Liu <songliubraving@fb.com>
References: <20190729210933.18674-1-william.kucharski@oracle.com>
 <20190729210933.18674-3-william.kucharski@oracle.com>
 <E6E92F42-3FA0-473C-B6F2-E23826C766F5@fb.com>
From: William Kucharski <william.kucharski@oracle.com>
Message-ID: <ffbdd056-e80c-41f4-37c4-c8b758fb59e7@oracle.com>
Date: Tue, 30 Jul 2019 08:11:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <E6E92F42-3FA0-473C-B6F2-E23826C766F5@fb.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9334
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1907300146
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9334
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1907300146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_071248_425674_C7DBBBBC 
X-CRM114-Status: GOOD (  22.38  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [156.151.31.86 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
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
 Jann Horn <jannh@google.com>, John Hubbard <jhubbard@nvidia.com>,
 David Rientjes <rientjes@google.com>,
 "john.hubbard@gmail.com" <john.hubbard@gmail.com>,
 Josef Bacik <josef@toxicpanda.com>, Ross Zwisler <zwisler@google.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org



On 7/29/19 4:51 PM, Song Liu wrote:

>
>> +#define	HPAGE_PMD_OFFSET	(HPAGE_PMD_SIZE - 1)
>            ^ space vs. tab difference here.

Thanks, good catch!

> 
>> +#define HPAGE_PMD_MASK		(~(HPAGE_PMD_OFFSET))
>> +
>> +#define HPAGE_PUD_SHIFT		PUD_SHIFT
>> +#define HPAGE_PUD_SIZE		((1UL) << HPAGE_PUD_SHIFT)
>> +#define	HPAGE_PUD_OFFSET	(HPAGE_PUD_SIZE - 1)

Saw this one, too.

> Should HPAGE_PMD_OFFSET and HPAGE_PUD_OFFSET include bits for
> PAGE_OFFSET? I guess we can just keep huge_mm.h as-is and use
> ~HPAGE_PMD_MASK.

That's what I had intended; would you rather see those macros
omit the unneeded for the larger page size bits?

>> - * - FGP_PMD: If FGP_CREAT is specified, attempt to allocate a PMD-sized page.
>> + * - FGP_PMD: If FGP_CREAT is specified, attempt to allocate a PMD-sized page

No - this came in as part of patch 1/2 and I missed dropping the period 
at the end of the line that caused this to be a diff, so I will put it
back. :-)

> We have been using name "xas" for "struct xa_state *". Let's keep using it?

Thanks, done.

>> +	if (unlikely(!(PageCompound(new_page)))) {
> 
>     What condition triggers this case
I wanted a check to make sure that __page_cacke_alloc() returned a large 
page. I don't recall if the mechanism guarantees that when you ask for
a large page, you get one, so I wanted to handle that case.

If you prefer, I could make this a VM_BUG_ON_PAGE() instead, but I
wanted it to fallback gracefully if it can't get a properly sized
page.

>> +#ifndef	COMPOUND_PAGES_HEAD_ONLY
> 
> Where do we define COMPOUND_PAGES_HEAD_ONLY?

At present, we do not.

I used this so I could include the code that would be needed once
Matthew's "store only head pages in page cache" changes go back in,
which looks like it may not be until 5.4-rc1. Matthew recommended I
include this so we didn't lose track of the code change that would be
needed then. I'll be talking to him today about this and the issues
you raised regarding patch 1/2.

Thanks for going through this!!

     -- Bill

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
