Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F378BCB9
	for <lists+linux-afs@lfdr.de>; Tue, 13 Aug 2019 17:12:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Vrt9CLQPkCJdA27ObiFN9RpfX4wxk355ZyTLn40sKM=; b=aekcWFCKUU3WCJ
	bzlRtpvF2IMzxDhD99rK4Xanm7Z61bzTyGNiHsHk7ZH7lUEEQj5ARla4xEXiZQl3Vb9q87Y4v/OXh
	hYq12xq28U8DF5AurA+r/K9kf5V56XW0FdXRRJvnVNK1C0FkYx82KaB2wlxKw8Vkh/qC5JigXpB5l
	+N9afUZlqIGU/wLwitEjw8gib9tGu2vYEjHuFNoDFb6p57yqDsc2bULPfkfKg7t7YjB+ntCdPEj35
	TlEncnqo5s59jyZIs5Hilf5lpU6397Dz4vk44kiCFd76oY8rFEqnEdOMn/9w/ZB1A2DssNY1yZ0GJ
	Ma4TdijNEG5iWJMBn9FQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxYTZ-00070L-Bu; Tue, 13 Aug 2019 15:12:41 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxYTW-0006zS-No
 for linux-afs@lists.infradead.org; Tue, 13 Aug 2019 15:12:39 +0000
Received: by mail-ot1-x342.google.com with SMTP id e12so29519593otp.10
 for <linux-afs@lists.infradead.org>; Tue, 13 Aug 2019 08:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wiTJg1mLp3QjrILHchoTxtvBRp92tUbdtvUgIPj4jZI=;
 b=eukH0ZvAq0Z/wJukiPnGAveU4NqGN1rOLpWgo59UNQr2Kr3dsmvnVkS9hGSvWc9x84
 N4hPSFfAKSFJphg75rQK0bSD6ettvyg9qOyHvnH5VFJ2btgjz2L87NdVDLMzZnmakp1/
 3b9Wynyv4B4mDETv6tOYQCJ0oT0oYoAXzMYw/qnF7p1kUGCcOeAomfb/Vth/Vt4ciThG
 QJviy4mF6oIeCFe68NI8ZMXgx4LQx82MPY3vs8UdACABMW76uLAFN2icAiuZLzK2c7K8
 FKTkfl8gJsFlFSyQ7YgiF/3wVqnBfEaMLNKh3uYO87kKci2ljCu7aqorE9s8SCvvljlg
 D8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wiTJg1mLp3QjrILHchoTxtvBRp92tUbdtvUgIPj4jZI=;
 b=mZz3cCXDxh0IAZbrnur7div7LkaLhnxuaDen5ryDaasvCTdy2Fq6iGUutH/nJIKLyl
 WuN2txZn6lk4SI/mlLBla+Tsx9gjq6CSSjjcQ7gPdgLWERuNfoGtrQ8buIHOWdxWn/BY
 HlqSLgnVbRKY8EMoLZvcM06Kcoar2E5wuVw2X8s6XI81q7zdifYfNV6N3IzhQe/fWmf/
 qcDIIkYmmSQ2iOeZbMy7uSzP6IRzaFHk1p5WaTADtyXQk74/yWxgbsklMH3bDKMTxf+D
 LfUVzErMYgJjiAtANiCIJg0dYL938tWH2MfQD5MlgC+9wdU5dwmfoijBNZf721V3QOiA
 fYSA==
X-Gm-Message-State: APjAAAXKrYklieDFHPws7hdi6Gfuk1I7DxBdSYqBauOBbSsgpCD0j1Bi
 cDgZSPdbPcw/dyWPE7r6Cg9wBh74o1lK2fFJkh1qpRVAiWPrYQ==
X-Google-Smtp-Source: APXvYqzQnZJK6locyARjrnTPWygMC68+xT/2wddNBsIcOxIE2NHQLBxjLMW4a7ENxNYUO+uupEP5Jx85MgzUb73QrME=
X-Received: by 2002:a5e:de0d:: with SMTP id e13mr3368687iok.144.1565709156970; 
 Tue, 13 Aug 2019 08:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000004c2416058c594b30@google.com>
 <24282.1562074644@warthog.procyon.org.uk>
 <CACT4Y+YjdV8CqX5=PzKsHnLsJOzsydqiq3igYDm_=nSdmFo2YQ@mail.gmail.com>
 <20330.1564583454@warthog.procyon.org.uk>
 <CACT4Y+Y4cRgaRPJ_gz_53k85inDKq+X+bWmOTv1gPLo=Yod1=A@mail.gmail.com>
 <22318.1564586386@warthog.procyon.org.uk>
 <CACT4Y+bjLBwVK_6fz2H8fXm0baAVX+vRJ4UbVWG_7yNUO-SOUg@mail.gmail.com>
 <3135.1565706180@warthog.procyon.org.uk>
 <CACT4Y+YCB3o5Ps9RNq9KpMcmGCwBM4R9DeX67prQ9Q3UppGowQ@mail.gmail.com>
 <8013.1565708810@warthog.procyon.org.uk>
In-Reply-To: <8013.1565708810@warthog.procyon.org.uk>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 13 Aug 2019 17:12:24 +0200
Message-ID: <CACT4Y+YVyaTrwpaZfpfi9LKA=5TOdKSL60pjAH04dMPNCZTMSQ@mail.gmail.com>
Subject: Re: kernel BUG at net/rxrpc/local_object.c:LINE!
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_081238_793589_6B826279 
X-CRM114-Status: GOOD (  16.22  )
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-15.7 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:342 listed in]
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

On Tue, Aug 13, 2019 at 5:06 PM David Howells <dhowells@redhat.com> wrote:
>
> Dmitry Vyukov <dvyukov@google.com> wrote:
>
> > > I meant that I don't know how to turn a tracepoint on from inside the kernel.
> >
> > This /sys/kernel/debug/tracing/events/rxrpc/rxrpc_local/enable in:
> >         echo 1 > /sys/kernel/debug/tracing/events/rxrpc/rxrpc_local/enable
> > should map to some global variable, right? If so, it should be
> > possible to initialize that var to 1 statically. Or that won't work
> > for some reason?
>
> As I understand it, it's all hidden inside of tracing macros and ftrace
> infrastructure and involves runtime patching the code to enable tracepoints
> (they're effectively NOP'ed out when not in use).
>
> So, no, it's not that simple.
>
> I asked Steven and he says:
>
>         trace_set_clr_event("sched", "sched_switch", 1);
>
> is the same as
>
>         echo 1 > events/sched/sched_switch/enable
>
> So it can be done.  Will syzbot actually collect the trace log?

It only collects console output. I don't know what is trace log. If
the trace log is not console output, then it won't.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
