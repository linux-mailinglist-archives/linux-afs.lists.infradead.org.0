Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D9018F700
	for <lists+linux-afs@lfdr.de>; Mon, 23 Mar 2020 15:35:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=md8jhmbaqI2w32UmfxSxmiQUafRFTRr5hKpyiuTPd8Y=; b=IsrXvoPqanTDCq
	PmYTD66LPXkxtqcbHDu3kMpb5Zj0w43LC60qTGIxw9iK36iupzRfFuNHweEJDapMrZ7QO9dHpnXQM
	EMuim69uAg8vjM3YwTC2Tq3Q25DefAtJ4x6SmJFBtql7Kh3YBwr9j+oc4HTdGjDznDziCtc32ZBT+
	DD4sqvd1HR2YovHt1Jq+8pkyVZm8jV9UNrU2SLeYWVFD63mO90wLlWNlhS5zqniIXeHOl6682CiKz
	BvFKDayRfyg4vQPGwl2rY5VR+7aOeR6zfK+Xs3lPzm/CNJNwkMSilsUD51RlvbOA6OJN8Xjz59hAK
	5ywIMxHyYTUqGDivEYeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGOAf-0004Rj-NZ; Mon, 23 Mar 2020 14:35:17 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jG0tP-0005mn-T9
 for linux-afs@lists.infradead.org; Sun, 22 Mar 2020 13:43:57 +0000
Received: by mail-qv1-xf43.google.com with SMTP id m2so5723886qvu.13
 for <linux-afs@lists.infradead.org>; Sun, 22 Mar 2020 06:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lfkm4qDHJF0j1h7yV3iuIObqDhIo9L+RuUef/w4kNrQ=;
 b=GpanGY9Pbx8tQwMygJGCR6uWHh49kOht9cgocBLA+Xr1AzVgOsJ29rsyQiUyB8QGpF
 ShXltEpe+/+N+uieoVHEZWhMAUVrO2+wqHYnOMkFp/FzERQxhlA7Ygbqdq9A1xxhQRvU
 /igVj2WNqblFqAkV9EOMWHoZO5TLGjc0zfKlI6BzdIZwztDeB9v0xF0nQ5cdgbhueeNN
 K40Dde1cnjPANSHxJ+vF/RCkPhRLZ3LXw9LF0zoioE3o561FMo0iNz4/6S2f/8xiwQFY
 H92EFkYDwxhKlr/4VmgVmmxHR8mXGLIWebUe44ojxqqeJEDf8lauXR2R0DGIJc9lmF90
 0Uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lfkm4qDHJF0j1h7yV3iuIObqDhIo9L+RuUef/w4kNrQ=;
 b=kaXv3SR6ObpNicpWJzAt8ix9pIzq7bz8mTKaiu5zAdmGfL/MFmMGOx/3scwlFOfa66
 YeK3BpeVKddUPQ+SYb7iYrl1AJF5OI4BRULfEeGxlvKb9rKBlNh0TixScodIKQZe5at4
 Ist3ATBZ8N4NhmzLFsIM4w1NNrE6ce1ZUGnffgUKWIIwL9wA9llUa9B8bVQO+UdZ4WDf
 ZG3EThk+G88202Vby4ILthIIlVe4npe3vSL118Op1sL5Bt+k94SQUYXhNltctsTa3Evv
 89I7+tizhnM4CzNjIAmxiN2Uj3PHjtkFHBE+bHCI3h3+n97wBT+a9X+HVYxpPiKyEOrB
 XFbg==
X-Gm-Message-State: ANhLgQ2Fq81HwxjTRHyviSGNejo3t6WnfH4yS8mAbipyHHdozdYUDdJv
 0edkroliER1U/k4WCk7e5lhg0pFms2t3AKCfUYXjjw==
X-Google-Smtp-Source: ADFU+vtXIKY75T4uXrHCS90aIU/nIoX+WOv3uLm5a0ti0Wue34MeQ1eSlU4oBfzMxNJbPwYJq9ilSqklf/BKchR4TEg=
X-Received: by 2002:ad4:5051:: with SMTP id m17mr5182989qvq.122.1584884631847; 
 Sun, 22 Mar 2020 06:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000277a0405a16bd5c9@google.com>
 <0000000000008172fe05a17180aa@google.com>
In-Reply-To: <0000000000008172fe05a17180aa@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Sun, 22 Mar 2020 14:43:40 +0100
Message-ID: <CACT4Y+YGjaD4dobFgB7ieVi3wbG72_EPdXuJQ+h4qQq1Qncspg@mail.gmail.com>
Subject: Re: BUG: unable to handle kernel NULL pointer dereference in
 handle_external_interrupt_irqoff
To: syzbot <syzbot+3f29ca2efb056a761e38@syzkaller.appspotmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200322_064355_966506_91CF728A 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -13.2 (-------------)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-13.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:f43 listed in]
 [list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 white-list
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 white-list
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Mailman-Approved-At: Mon, 23 Mar 2020 07:35:16 -0700
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
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 KVM list <kvm@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, the arch/x86 maintainers <x86@kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, "Christopherson,
 Sean J" <sean.j.christopherson@intel.com>, linux-afs@lists.infradead.org,
 David Howells <dhowells@redhat.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>, wanpengli@tencent.com,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, kuba@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, David Miller <davem@davemloft.net>,
 Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Sun, Mar 22, 2020 at 2:29 PM syzbot
<syzbot+3f29ca2efb056a761e38@syzkaller.appspotmail.com> wrote:
>
> syzbot has bisected this bug to:
>
> commit f71dbf2fb28489a79bde0dca1c8adfb9cdb20a6b
> Author: David Howells <dhowells@redhat.com>
> Date:   Thu Jan 30 21:50:36 2020 +0000
>
>     rxrpc: Fix insufficient receive notification generation

This is unrelated.
Somehow the crash wasn't reproduced again on the same commit. Can it
depend on host CPU type maybe?

> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1483bb19e00000
> start commit:   b74b991f Merge tag 'block-5.6-20200320' of git://git.kerne..
> git tree:       upstream
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=1683bb19e00000
> console output: https://syzkaller.appspot.com/x/log.txt?x=1283bb19e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=6dfa02302d6db985
> dashboard link: https://syzkaller.appspot.com/bug?extid=3f29ca2efb056a761e38
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1199c0c5e00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15097373e00000
>
> Reported-by: syzbot+3f29ca2efb056a761e38@syzkaller.appspotmail.com
> Fixes: f71dbf2fb284 ("rxrpc: Fix insufficient receive notification generation")
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
