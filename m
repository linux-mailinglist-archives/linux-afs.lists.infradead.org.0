Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAD57C69A
	for <lists+linux-afs@lfdr.de>; Wed, 31 Jul 2019 17:32:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F28n03ngy9ipk6l2iOZWiizbSOutdhvkRnH7bPSzA+o=; b=KFLjzNP9RWmz/Q
	fgE20dYUGYnaqqQ08RXJLMWbZFgcRwCTTUcSirh4x3sL4yCN5W/NAROS5qdVGDjUg+w3e6PWuaTtW
	Q7fR0jwlzFgXT2Z4fAqbKQETyni0ZoA9vC7v0b1XbCuOxFHz/6KnCpSursgviiefYbnzRbnXivMJv
	difaEZ2JLAy98VVR+ZPwUmdlll9XGAcO3VaqGURq4Vvze8NXdVygUqyleMcYkhvfvCwTkvTyhrELY
	XxsWXMn8tt0r+EiRJH5SN9goIRGAvzXUYNRsld0KJWImpNoDzF7qS5/fhTWKOgjXHItwESgK+khM9
	TSBcGHBXOdITCnmuc/0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsqaA-0003fU-59; Wed, 31 Jul 2019 15:32:02 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsqa7-0003f7-E2
 for linux-afs@lists.infradead.org; Wed, 31 Jul 2019 15:32:00 +0000
Received: by mail-io1-xd42.google.com with SMTP id e20so4254239iob.9
 for <linux-afs@lists.infradead.org>; Wed, 31 Jul 2019 08:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mUN1pvMl8svBUjCaR0OxnSiYPVvf6+NNwTE7JqyHeGo=;
 b=Lz/OoRSBQngNq7qk2Ls23OczsyfF+YccBluCPWG7IS7H2uuPnlh1HSGyfgXfwgGlES
 cVL2dXXA7Fhc4epnBjF0cO1zMIQ5f3Pn6flq9z88B6QJPH6EbMIx9wTNvpq5yRvjWqyc
 wpgsnb5DDxaigNDWgbA/vmbkhmMOF4JBZU/4Bk11OUt1nDfwbNY7SsZF72Nc5/nmMCwE
 yGTwQfUViPaZ0//I4K21aNpX+U9cFpehlX+JN5PI558d9qtExMGTbAv2ZgVVWRAmkWt8
 YF0aPFQ5DNHkEGfwmEvmJanvVR26ZoEuPjy7iKpYk84Ya/KQh+EsPapOIbwr+r7TguNI
 uNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mUN1pvMl8svBUjCaR0OxnSiYPVvf6+NNwTE7JqyHeGo=;
 b=Zw7YavIyIA8pa9R2FJefxAYgmaE90txHvMoNityM7MvEMhN6lFG44Rkh4uSZbVwchu
 ZU3kDa6RWt5RrgJ/jcr7R3B96m0c1tMd8TJ+WlYEiZNDgb14EALLymDVQmIPyR4yhso6
 Tt5HuH64XXGtl5KpmHughOysznNedpsKMbyVfpsjMl5XIyzBfyBOTt9NcvlU6kzGmrcG
 qmGzX5tbdIywtEtId7dbN7bIN4C3L3Jkny52lDXDEJmxxEn1WmbG68JWy5KlZcFLXSyF
 yPCZ1AGYD9GgkqaPZdiMLpx9AhcjJeuPa//eEFvQHCUKbd16LSxLNTvJoObqlndnKuSU
 quqg==
X-Gm-Message-State: APjAAAX0ioBkAlqdaDWq5FDmhuw3UVPUWzEEedetYi1vgsmbrZgvC2Ny
 gowjvvDyht/3G8ruSnqvBq+GviqUx0OR8vc8Mn1HtQ==
X-Google-Smtp-Source: APXvYqw2UXK6ZDLM4RK1EtyppjWajVOjmU7VeSiTcfg7vyOElSybY1Vr7ei0QqNz3/vdV59RExuEHrI8732XCga8lek=
X-Received: by 2002:a5e:c241:: with SMTP id w1mr106076388iop.58.1564587118129; 
 Wed, 31 Jul 2019 08:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000004c2416058c594b30@google.com>
 <24282.1562074644@warthog.procyon.org.uk>
 <CACT4Y+YjdV8CqX5=PzKsHnLsJOzsydqiq3igYDm_=nSdmFo2YQ@mail.gmail.com>
 <20330.1564583454@warthog.procyon.org.uk>
 <CACT4Y+Y4cRgaRPJ_gz_53k85inDKq+X+bWmOTv1gPLo=Yod1=A@mail.gmail.com>
 <22318.1564586386@warthog.procyon.org.uk>
In-Reply-To: <22318.1564586386@warthog.procyon.org.uk>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 31 Jul 2019 17:31:45 +0200
Message-ID: <CACT4Y+bjLBwVK_6fz2H8fXm0baAVX+vRJ4UbVWG_7yNUO-SOUg@mail.gmail.com>
Subject: Re: kernel BUG at net/rxrpc/local_object.c:LINE!
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_083159_493697_3E6DA8CB 
X-CRM114-Status: GOOD (  12.99  )
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

On Wed, Jul 31, 2019 at 5:19 PM David Howells <dhowells@redhat.com> wrote:
>
> Dmitry Vyukov <dvyukov@google.com> wrote:
>
> > Please send a patch for testing that enables this tracing
> > unconditionally. This should have the same effect. There is no way to
> > hook into a middle of the automated process and arbitrary tune things.
>
> I don't know how to do that off hand.  Do you have an example?

Few messages above I asked it to test:
https://groups.google.com/d/msg/syzkaller-bugs/gEnZkmEWf1s/r2_X_KVQAQAJ

Basically, git repo + branch + patch. Here are the docs:
https://github.com/google/syzkaller/blob/master/docs/syzbot.md#testing-patches


> Anyway, I think rxrpc_local_processor() is broken with respect to refcounting
> as it gets scheduled when usage==0, but that doesn't stop it being rescheduled
> again by a network packet before it manages to close the UDP socket.
>
> David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
