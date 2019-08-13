Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8E48BB86
	for <lists+linux-afs@lfdr.de>; Tue, 13 Aug 2019 16:29:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FEhuEalnmcTP8K0aatzbscGT579jcHpA+U32hNhpess=; b=PqCSCr7Ng6bm+d
	uyetzrE+ndEgXiT7rYB0n5OnIHIyoNBTR2SEfsRO0WvXVyDv2dFF2UTpKZkLlflxkVfuMyfGD5bgG
	3/5hqWBPctqMNlwc9h8jmN0Ru/Nh/b5uHA9xUR2b2yQAqrL2/e7l4taJy4CjyFPaWkMJfWFkr8B34
	zemj9xLwpP4zSArPaY1qYRPj8ZDMW3KzSHJr0urRAEaGl1fjI3eOzYGtXKyeSfJOHEBr4ZiI6S8oZ
	sqIO5Rks0ZmKh78x2mswiE69f/tXaGxGT0Syp8DJ0i4XE7iy+MId8QqFatwf4A1AXDReluhAfmfVb
	CvN9ZOXUCn5qPeyDrM9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxXnD-0001ex-Jt; Tue, 13 Aug 2019 14:28:55 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxXn4-0001ay-T7
 for linux-afs@lists.infradead.org; Tue, 13 Aug 2019 14:28:48 +0000
Received: by mail-ot1-x344.google.com with SMTP id z17so54707810otk.13
 for <linux-afs@lists.infradead.org>; Tue, 13 Aug 2019 07:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EGE30nOZT5K+NX+TVv0ZpoRS3fgZeiZCXeoj6PCI09w=;
 b=oRwFbK/akWqLZNnM9R9bFSlLh+siffUaqcsG4pH5e21Q74fI+o59X9+W3QVzXbqqAh
 t4C74Jk7AOEkwsTuEMalWAmpwhlv3Kd8myMl6V8aD0OKuEvHe09inEmWr8JFlvBIILAE
 bNIImCK2fdhneXH5pZ9E9l3bD3R7hniio4gGR0XPZb1fHHqJf/tkejhPP3Jfju8soQ0Q
 J1AazUIqqRL+AAZkYixSZn36PQCMsOhz6GGEeh5lErW5Y1gDvfC9+1mrKDIy7QFBxhjT
 w0xx6RVi1BDXbwuV7V6DXRoPZEQBiu+k/9ErKvNypx2C5voFhAdSBiJi8fe/kKJqC+Ru
 RE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EGE30nOZT5K+NX+TVv0ZpoRS3fgZeiZCXeoj6PCI09w=;
 b=VizIZGB2v4LuEst7zgtcsfnxr+pJ/JJcAim0SeKImc0hK4KbHOYGAa2z7gq7L9+GIF
 joYmisGAM9JHe/SYXczrbbuS19PkWAFlL5xxT4J6HVIuzRqNIl9q2plQJn0Hz9C3A6EZ
 QRYZEltPxcQvrK0UScDKD8ASkUop9gpTtsebkPFlmUSinzE9CUlcUh42RgDJEO1h1KrC
 zvUwUp5QElDZ1M9LPZYKo7RsILsf9dM20BlLlyjbZLSOLi13eHTNZR+cHQlcr3kuI7dE
 4UTLq3cEFTaz+DlJLFONUCnu9+YsHTX6f1VGxqelOltrKmMWU7uOpJbpNU0sMNIFwG3k
 Sbcw==
X-Gm-Message-State: APjAAAV2nIrREWm6S85woI37CU3+fTBSUkp1WmgVM4qk/hIdgPBAY5vF
 9h25mBqWiWhaCVDFn5PnYnC4VaCLN8MP2mYz3J7n6A==
X-Google-Smtp-Source: APXvYqwlq1LkEmHZGn0qkIw6FNb+sqMzHT6Uz+MVyhL1/eMC+7YxAyStCbIPQRImgvsV4ec37Zf3Vjv7m+yElymKlbg=
X-Received: by 2002:a02:ca0c:: with SMTP id i12mr25239794jak.82.1565706520008; 
 Tue, 13 Aug 2019 07:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000004c2416058c594b30@google.com>
 <24282.1562074644@warthog.procyon.org.uk>
 <CACT4Y+YjdV8CqX5=PzKsHnLsJOzsydqiq3igYDm_=nSdmFo2YQ@mail.gmail.com>
 <20330.1564583454@warthog.procyon.org.uk>
 <CACT4Y+Y4cRgaRPJ_gz_53k85inDKq+X+bWmOTv1gPLo=Yod1=A@mail.gmail.com>
 <22318.1564586386@warthog.procyon.org.uk>
 <CACT4Y+bjLBwVK_6fz2H8fXm0baAVX+vRJ4UbVWG_7yNUO-SOUg@mail.gmail.com>
 <3135.1565706180@warthog.procyon.org.uk>
In-Reply-To: <3135.1565706180@warthog.procyon.org.uk>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 13 Aug 2019 16:28:26 +0200
Message-ID: <CACT4Y+YCB3o5Ps9RNq9KpMcmGCwBM4R9DeX67prQ9Q3UppGowQ@mail.gmail.com>
Subject: Re: kernel BUG at net/rxrpc/local_object.c:LINE!
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_072847_075992_A017BC81 
X-CRM114-Status: GOOD (  14.01  )
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-15.7 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:344 listed in]
 [list.dnswl.org]
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 white-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
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
Cc: netdev <netdev@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-afs@lists.infradead.org,
 Eric Biggers <ebiggers@kernel.org>,
 syzbot <syzbot+1e0edc4b8b7494c28450@syzkaller.appspotmail.com>,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Tue, Aug 13, 2019 at 4:23 PM David Howells <dhowells@redhat.com> wrote:
>
> Dmitry Vyukov <dvyukov@google.com> wrote:
>
> > > > Please send a patch for testing that enables this tracing
> > > > unconditionally. This should have the same effect. There is no way to
> > > > hook into a middle of the automated process and arbitrary tune things.
> > >
> > > I don't know how to do that off hand.  Do you have an example?
> >
> > Few messages above I asked it to test:
> > https://groups.google.com/d/msg/syzkaller-bugs/gEnZkmEWf1s/r2_X_KVQAQAJ
> >
> > Basically, git repo + branch + patch. Here are the docs:
> > https://github.com/google/syzkaller/blob/master/docs/syzbot.md#testing-patches
>
> I meant that I don't know how to turn a tracepoint on from inside the kernel.

This /sys/kernel/debug/tracing/events/rxrpc/rxrpc_local/enable in:
        echo 1 > /sys/kernel/debug/tracing/events/rxrpc/rxrpc_local/enable
should map to some global variable, right? If so, it should be
possible to initialize that var to 1 statically. Or that won't work
for some reason?

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
