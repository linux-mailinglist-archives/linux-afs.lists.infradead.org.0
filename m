Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6202121128
	for <lists+linux-afs@lfdr.de>; Fri, 17 May 2019 02:08:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a7qi5Q7ZirWSNrxeWcAmMWFm1rW6mU3Jmq313R6fde8=; b=dNKaK3JhX06lEx
	gYDEgckxCdkrAJBd+u4WF9EfwYUS2E0SQCU8Rni+Z64OpK8nefdMGi4NV1GhIYlQ29NS2TlbMic5p
	NemGDqk6HjvMp7KAiPmEVxtgR7HZx4OwWOvHPzCLxKm5Q+MLbXBXhwImrOrpoVMZMR6kyP/shBcxG
	A/4Hi1AwwEv4yNWK/JY7Qxw79abWQO1JMWFB2Pw+A1RULrv0z5XENzNG6SoW6jZ9RJotDASJ9BpVq
	VTvgjjtW+y15J+MlUahFJGvnma4LQKToQzbxROD7LJHi3yMaXVKFQhYqJYsaWFP3XLYCadyACGg95
	NemT0IIRdtg6VKyNgg8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRQQN-0000eu-33; Fri, 17 May 2019 00:08:35 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRQQK-0000eE-5C
 for linux-afs@lists.infradead.org; Fri, 17 May 2019 00:08:33 +0000
Received: by mail-lf1-x132.google.com with SMTP id y19so3984913lfy.5
 for <linux-afs@lists.infradead.org>; Thu, 16 May 2019 17:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H7aNvYWUCO6YrxXiAC0ARPuk5T1hcRQ+1DS9WOU1hfg=;
 b=L+HJmgVBbIb6HJRTyLyYpws/txBoU0FBSG9zeyKXtuG/hUE9jdY1TeO+FiL+A1wSj3
 vVWuQ8qozQfdl6pN0XGWMmHFff/XGAZSHYZ6wU70ceF7MJDY58xFx1Zc4rI8VblqsmuV
 npNGzb9f2oQHMqj9dowNldBJlTpS/Ba0XyiD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H7aNvYWUCO6YrxXiAC0ARPuk5T1hcRQ+1DS9WOU1hfg=;
 b=Hv0MSETsWkkz7Jyr5zB9EDYR2+xHfaZzC3Of/jotmKQ8jBibDK9wh5jKzgb5Z69K06
 qAcq7lwEqKIVgL3c3so63t2pN1p8LdRH1ueHsnfyeAWDEOYL0cLFJrzRqGwzH5BcGB0h
 o8+oXZq1XqlP1jpNKzsPyiXHQMujlc/9aTwwqRK2CAyEbawuUoPoFwUVhT8NNIOHBaPq
 CuXR4kIT8HjnFx1PwAEZFrGE7fS5GgDxA/YnMwBK7+F1ImCyrkSOIXmSUPchzXiO7KAQ
 fIhh5iVltJp/aFtyjXv0wH5dLb/Wfktz2Dv9u1o8+TpkVYG3Swog2vxiwsCWuJcxendm
 NVyg==
X-Gm-Message-State: APjAAAUxqmqRxGv5IJfloc/iSGarhkVfaTW1I2Q5Q7AlyDWUnx0kPJ0A
 LE1F1ogU/2FuDcH/U3F3VG+Jhjg1cNg=
X-Google-Smtp-Source: APXvYqyW377OcHAwPVNL7+IoolAGFrZWS5oT8slYcP4ikRDTQti0CztStPLV5xapdfjkIsYlvLuHvA==
X-Received: by 2002:ac2:5606:: with SMTP id v6mr23310011lfd.129.1558051709022; 
 Thu, 16 May 2019 17:08:29 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174])
 by smtp.gmail.com with ESMTPSA id h10sm1290617ljm.9.2019.05.16.17.08.27
 for <linux-afs@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 17:08:27 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id a10so4677829ljf.6
 for <linux-afs@lists.infradead.org>; Thu, 16 May 2019 17:08:27 -0700 (PDT)
X-Received: by 2002:a2e:9b0c:: with SMTP id u12mr3895210lji.189.1558051707294; 
 Thu, 16 May 2019 17:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <14411.1558047621@warthog.procyon.org.uk>
In-Reply-To: <14411.1558047621@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 16 May 2019 17:08:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgJeAYaW+CA6cC8jEyJT5Z38z1suOwib43F-vFihD8bmQ@mail.gmail.com>
Message-ID: <CAHk-=wgJeAYaW+CA6cC8jEyJT5Z38z1suOwib43F-vFihD8bmQ@mail.gmail.com>
Subject: Re: [GIT PULL] afs: Miscellaneous fixes
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_170832_210226_0FFC4FCD 
X-CRM114-Status: UNSURE (   8.04  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.1 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2a00:1450:4864:20:0:0:0:132 listed in]
 [list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-BeenThere: linux-afs@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 Joe Perches <joe@perches.com>, Jonathan Billings <jsbillings@jsbillings.org>,
 Marc Dionne <marc.dionne@auristor.com>,
 Colin Ian King <colin.king@canonical.com>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Thu, May 16, 2019 at 4:00 PM David Howells <dhowells@redhat.com> wrote:
>
> Could you pull this series please?

I've pulled this, but I'm seriously considering just stopping pulling
from you entirely.

Not only is this late in the merge window, EVERY SINGLE commit I
pulled from you is from within a day or two.

And this is not a new thing. I literally dread stuff from you. Because
it's happened before, and it keeps happening. Out-of-window changes to
the keys layer etc etc.

Why does this keep happening?

                Linus

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
