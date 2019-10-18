Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F893DE816
	for <lists+linux-afs@lfdr.de>; Mon, 21 Oct 2019 11:32:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lp0D/8lO0roQPIEkonmlD0mL5aQH8VM7BMrbp01+kng=; b=LEQqymSU+neMAj
	ohNYsXfAhgYVPEzuzStzAPO1Nyc1wS+OfI/x4GhDwovfAu5fOh3L1hrwmJyaDMEerVfGSJ5jcBDuw
	SE48GwdOhzGttImHFWaPKCeHvspLcCukbKLzTkyY4xIsOZ8iN3hy9svoP0xGyM8HeG+jQS0zR3p5h
	SEv6gZKnGcCoV7FHO6xS97ORh0lNbqUzK+Nu4fTFlK5ldSjfQmtJcX9Nz07CmQXT7Pa4RrdWbwWZ5
	2TnX23I3FDc8b51gEw8aq+EPN+cd/gjQZzkcvWiXNCmfblqSQycHgbYnmHkZM3YCzVC19UOiqpYY/
	EETxj6ResBTjKOem01GQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMU2y-00045H-Nw; Mon, 21 Oct 2019 09:32:16 +0000
Received: from smtprelay0019.hostedemail.com ([216.40.44.19]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLUIq-0005tT-LI
 for linux-afs@lists.infradead.org; Fri, 18 Oct 2019 15:36:34 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id BE2168384361;
 Fri, 18 Oct 2019 15:36:25 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,
X-HE-Tag: dolls48_8e237410aa840
X-Filterd-Recvd-Size: 3702
Received: from XPS-9350.home (unknown [47.151.135.224])
 (Authenticated sender: joe@perches.com)
 by omf15.hostedemail.com (Postfix) with ESMTPA;
 Fri, 18 Oct 2019 15:36:16 +0000 (UTC)
Message-ID: <86695bdf8e8e7425b680dcbcb23acec5e58853da.camel@perches.com>
Subject: Re: [PATCH v2 00/33] Kill pr_warning in the whole linux code
From: Joe Perches <joe@perches.com>
To: Christoph Hellwig <hch@lst.de>, Petr Mladek <pmladek@suse.com>, Stephen
 Rothwell <sfr@canb.auug.org.au>
Date: Fri, 18 Oct 2019 08:36:15 -0700
In-Reply-To: <20191018152226.GA32150@lst.de>
References: <20191018031710.41052-1-wangkefeng.wang@huawei.com>
 <20191018142626.vmbgclelw23h5pdn@pathway.suse.cz>
 <20191018152226.GA32150@lst.de>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_083632_769398_B05E567F 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.40.44.19 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Mailman-Approved-At: Mon, 21 Oct 2019 02:32:15 -0700
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Rich Felker <dalias@libc.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexei Starovoitov <ast@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, David Howells <dhowells@redhat.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-afs@lists.infradead.org,
 drbd-dev@lists.linbit.com, Song Liu <songliubraving@fb.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Daniel Borkmann <daniel@iogearbox.net>, Jiri Olsa <jolsa@redhat.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
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
 linux-fbdev@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Andy Whitcroft <apw@canonical.com>, Takashi Iwai <tiwai@suse.com>,
 bpf@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Karsten Keil <isdn@linux-pingi.de>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Sangbeom Kim <sbkim73@samsung.com>, Robin Murphy <robin.murphy@arm.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Martin KaFai Lau <kafai@fb.com>, Yonghong Song <yhs@fb.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 James Morse <james.morse@arm.com>, Corentin Chary <corentin.chary@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S.
 Miller" <davem@davemloft.net>, Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

(Adding Stephen Rothwell)

On Fri, 2019-10-18 at 17:22 +0200, Christoph Hellwig wrote:
> As I said before: please just send Linus a scripted conversion after
> the next -rc1.  There is no point in creating all this churn.	

I again ask for a scripted mechanism to be added to
-next to allow these types of scriptable patches to get
compilation coverage testing.



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
