Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAACDE818
	for <lists+linux-afs@lfdr.de>; Mon, 21 Oct 2019 11:32:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=84M7QMXIH9D6GGZFS37YcpyiLI0xfG6sphrGIe8oih0=; b=W+vZ6K4l1bivv1
	xX/fL9BBosHOL0eufPFa1HXD5gn4nW9aOkvqsedoP3pLS8T8D//f1j8HS7MfcviMrc5+qVQ2c0OrY
	MoRDQ2sCXurX4OeWsAqBfl0IrSA7a0cmKoQP/IdEqCrwOY4IKj+VTMbfeB52Tw0pBMi2QsISaSWtE
	rf1IAWNAnsimbADO2zawyEbEZIZXmwCd3EBh2yBr4qEEqRd33Mtkt9R3KtEDyeTKbs5iZb+MaGylt
	XpANOWON6LxahmKMdW/uMGK7kfIWmKqJc2VxxMvIHjAPdUm1Z71F7uEIOXx05ry8ZwBfJfjmGel87
	Eh4aWV3ZZqXqtnjpBBXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMU2y-000457-Id; Mon, 21 Oct 2019 09:32:16 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLU5M-0008FU-8o
 for linux-afs@lists.infradead.org; Fri, 18 Oct 2019 15:22:37 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id E74F668BFE; Fri, 18 Oct 2019 17:22:26 +0200 (CEST)
Date: Fri, 18 Oct 2019 17:22:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v2 00/33] Kill pr_warning in the whole linux code
Message-ID: <20191018152226.GA32150@lst.de>
References: <20191018031710.41052-1-wangkefeng.wang@huawei.com>
 <20191018142626.vmbgclelw23h5pdn@pathway.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018142626.vmbgclelw23h5pdn@pathway.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_082236_461747_A00BDFC0 
X-CRM114-Status: UNSURE (   7.27  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [213.95.11.211 listed in list.dnswl.org]
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
 Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

As I said before: please just send Linus a scripted conversion after
the next -rc1.  There is no point in creating all this churn.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
