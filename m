Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 103CD7C545
	for <lists+linux-afs@lfdr.de>; Wed, 31 Jul 2019 16:46:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6gSykSjP7p0mMEG8Vd+2plrTCUKBcBc58ko17LQeZyI=; b=Mv+OjYYSRxkant
	TuPVi3UT7guXm0uUB4WIFzbqFQOMXeIeHOrtEpbzbC5C0zVoRDuOiSjft+Z4R4nI5DDmg1HMqeEjz
	hvQvYf4vm6zrs/MU9sAwjUsX8jL3GKKJjhh92RbheAOoJ3dFJfQySrL5wAcJ8sw4zm+WDZZR0q7ac
	BRncVSFDFhpoqrFiD8AAFIvEIw7YGfjTtMy/EBWDuyAXVotL9wa7TYfe41M95BJeb3WR+FNTiWM1H
	T+M2688IB7zofv2ZP6zZa58d3ANW65LWVchsb6SJ71TYTRGYi6zXNd7EFxyTVyCtmKegtcVGmtZkV
	iJHQs3o2eyH4NHdcUBWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hspsB-000145-Nk; Wed, 31 Jul 2019 14:46:35 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsps9-00012e-2a
 for linux-afs@lists.infradead.org; Wed, 31 Jul 2019 14:46:34 +0000
Received: by mail-io1-xd42.google.com with SMTP id s7so136671605iob.11
 for <linux-afs@lists.infradead.org>; Wed, 31 Jul 2019 07:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OVbM3ywHXnfaXLqBHLumDjTwvKiP2anaixILYvBn/ng=;
 b=pjfmT0kNj6Uqy/h+8/WX0HU1oAXn2oRKXIdhUHe4IZ2y9tFHrZED/lweo1b/cRpzAu
 idCTfvQdx0X4j4gAoaTIvdCkse0FKv2ZP/nMGpEvdjB4FCdpbtSCe7YbbbrA7NfG4kgB
 6tJs0JHORDFcqF9yUmWvwGlkVZTf7lFPuxi+OM100xLlwRDiOvY1zGtyXxJrNqMVKjTy
 Sh4mX2HBTdxSw3G64Fi/PnSesG7Yz22B9o3S2QcDXBAfMDAbKi3fjQPg1HKM266NKtz7
 DeKvT6dr4cOE1OkPu2qnqj8vl+krkBY8nCeb8pXZk+CMIp6EboJyNNksTUyTgnwSJOU3
 d+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OVbM3ywHXnfaXLqBHLumDjTwvKiP2anaixILYvBn/ng=;
 b=JhblD3fvwCdL+WeZQOCXXGHNoZ/LgaQoTqvzaEJ4EIUVDIC3z3leuesX1vxlGkaptI
 sf0eyzkKT7bFg2jtwRCq7rq82pdQULa+2GuZeHs6LJ5SkTCbQqpY8hXXNWiHtlyZP9AM
 0up5UMLfds73P1A7aPTuuGX/hnNkPZO89zIrnUfOv4GuRXWGu+tv5HP5wjCTXH4RdnvZ
 gITg33KhOiLmRaCZ+j5qAu0D8NQuZvOMOmfSbtu6LHTRTt18vw+VfiQFxvpm77IosIR0
 G3M+/P+Tc0QWRzDAQI+JYoxG0uRbp06pvnKQlXKxb07thwtuem+4BBxU8YCJAVMp1+Pk
 4uHw==
X-Gm-Message-State: APjAAAUgW+H/AZEvwVUKZ0+Q2wLsKp+Rm7iUnmhQekub4KhlihOrGnkC
 ZmToi3vvE9Dz1kRBj1LhqEsUmY0s4Ua3u06S2dOBSg==
X-Google-Smtp-Source: APXvYqxKYf0QIDVpvcoBYAjITw+kwzxhvEER2l33yz1T4bLAIqIHkcdAsy647W1OXK8CZ55vRav7zMW5fa7eD+/0o2c=
X-Received: by 2002:a6b:4101:: with SMTP id n1mr87736036ioa.138.1564584387977; 
 Wed, 31 Jul 2019 07:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000004c2416058c594b30@google.com>
 <24282.1562074644@warthog.procyon.org.uk>
 <CACT4Y+YjdV8CqX5=PzKsHnLsJOzsydqiq3igYDm_=nSdmFo2YQ@mail.gmail.com>
 <20330.1564583454@warthog.procyon.org.uk>
In-Reply-To: <20330.1564583454@warthog.procyon.org.uk>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 31 Jul 2019 16:46:15 +0200
Message-ID: <CACT4Y+Y4cRgaRPJ_gz_53k85inDKq+X+bWmOTv1gPLo=Yod1=A@mail.gmail.com>
Subject: Re: kernel BUG at net/rxrpc/local_object.c:LINE!
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_074633_124842_56AFF7A2 
X-CRM114-Status: GOOD (  13.68  )
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-15.7 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:d42 listed in]
 [list.dnswl.org]
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 white-list
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 white-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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

On Wed, Jul 31, 2019 at 4:30 PM David Howells <dhowells@redhat.com> wrote:
>
> Dmitry Vyukov <dvyukov@google.com> wrote:
>
> > Re bisection, I don't know if there are some more subtle things as
> > play (you are in the better position to judge that), but bisection log
> > looks good, it tracked the target crash throughout and wasn't
> > distracted by any unrelated bugs, etc. So I don't see any obvious
> > reasons to not trust it.
>
> Can you turn on:
>
>         echo 1 > /sys/kernel/debug/tracing/events/rxrpc/rxrpc_local/enable
>
> and capture the trace log at the point it crashes?

Please send a patch for testing that enables this tracing
unconditionally. This should have the same effect. There is no way to
hook into a middle of the automated process and arbitrary tune things.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
