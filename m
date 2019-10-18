Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C3927DC7C3
	for <lists+linux-afs@lfdr.de>; Fri, 18 Oct 2019 16:52:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7A5zoSxWXSqHCNMDdjRId1+y+/K6FiBYX0uhjW9vg8=; b=iGbCMCw8F+E3uk
	kj4EdbivUotv3Evse/26t7PmGE4QaIqctZlDjJuJKsIye+fpyVFK4eoWJGeUU4G3KMdiNTm/HTv9c
	FYfKhU4TnIOfHdxOoEKgIzsuBbFFHZH7xOpDc/TeJUVGsLPP8MJBd6R+8J1Bd1rsH/8T9G3r7PNFK
	ymcjWURm11JPHpvikpfEHgDo3c+oycoLd32XKACaCZXoXPq8qOQ94Chka9GbMFrp1Uw7ioWo2E9ek
	Rcgp7NKC228q7v/6v1HAeARcF7dplRPaY3maO3Ecj1mAsJAKUqzKLlUM9C7UiQFs/b2tC9Bs4FJR3
	VEJtI6W6jfQVXUu+xq9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLTbm-000553-RB; Fri, 18 Oct 2019 14:52:02 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLTD5-00021p-Hk
 for linux-afs@lists.infradead.org; Fri, 18 Oct 2019 14:26:33 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2558AAC10;
 Fri, 18 Oct 2019 14:26:29 +0000 (UTC)
Date: Fri, 18 Oct 2019 16:26:26 +0200
From: Petr Mladek <pmladek@suse.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v2 00/33] Kill pr_warning in the whole linux code
Message-ID: <20191018142626.vmbgclelw23h5pdn@pathway.suse.cz>
References: <20191018031710.41052-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018031710.41052-1-wangkefeng.wang@huawei.com>
User-Agent: NeoMutt/20170912 (1.9.0)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_072631_879463_E54FF930 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.15 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Mailman-Approved-At: Fri, 18 Oct 2019 07:52:01 -0700
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 Rich Felker <dalias@libc.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexei Starovoitov <ast@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, David Howells <dhowells@redhat.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 drbd-dev@lists.linbit.com, Song Liu <songliubraving@fb.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Daniel Borkmann <daniel@iogearbox.net>, Jiri Olsa <jolsa@redhat.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-afs@lists.infradead.org,
 Peter Zijlstra <peterz@infradead.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Darren Hart <dvhart@infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Len Brown <lenb@kernel.org>,
 Fenghua Yu <fenghua.yu@intel.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Robert Richter <rric@kernel.org>, Will Deacon <will@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Arnaldo Carvalho de Melo <acme@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Lars Ellenberg <lars.ellenberg@linbit.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andy Whitcroft <apw@canonical.com>,
 Takashi Iwai <tiwai@suse.com>, bpf@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Karsten Keil <isdn@linux-pingi.de>,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Sangbeom Kim <sbkim73@samsung.com>, Robin Murphy <robin.murphy@arm.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Martin KaFai Lau <kafai@fb.com>, Yonghong Song <yhs@fb.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 James Morse <james.morse@arm.com>, Corentin Chary <corentin.chary@gmail.com>,
 Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Fri 2019-10-18 11:17:10, Kefeng Wang wrote:
> There are pr_warning and pr_warng to show WARNING level message,
> most of the code using pr_warn, number based on next-20191017,
> 
> pr_warn: 5206   pr_warning: 546 (tools: 399, others: 147)
> 
> Let's carry on with the work to standardize the logging macro,
> kill pr_warning in the whole linux code.
> 
> Patch[01-28]: simply sed and ajust formats

All these patches have been commited in printk.git,
branch for-5.5-pr-warn.

> patch[29]:    drop pr_warning definition in printk
> patch[33]:    cleanup the checkpatch.pl

I'll wait with these two until I am sure that the are no
pr_warning() users in linux-next.


> patch[30-32]: tools api/bpf/perf, rename and make manually changes

Only the tool api patch is commited in printk.git.

The other two (bpf and perf) will need to go via the related
subsystems to avoid conflicts nightmare. The good thing is
that these are userspace tools. They do not block removing
pr_warning() from the internal kernel API.

Best Regards,
Petr

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
