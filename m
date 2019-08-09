Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B0F88204
	for <lists+linux-afs@lfdr.de>; Fri,  9 Aug 2019 20:09:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=RU0HCljQhExdsQbiiWiNdDENV3qjIneG1UsCs/LWsmg=; b=dOMGw+yPT3fT3J
	qSEGoDRjmvQAh5rkjk8rwRqSvKCxWxSg1e0cbbNj3Un/sL7KZSNAuvQeVbC1QcuFPnqbTOvP/jnwO
	vZeZwAIuor0xvoUY5CTLIIqDcFQjoA8QaTTpSPlaHzwtzhW4ex5vSIlDXTmMcY2ToqIo5a7H+8VST
	SCqJtrpEjJmH0g8YgMxLpBsdr0LAboLJtXi4QseuW4hosUup2CI6gIaxRqveQaifYD15Mji12mYTg
	63BMm0RrWq6TtTxcp3D+0SpM4hqgHQ8BeouSnkdnGACjiSXMjzKgPx+r2bzvBniaV054WsUFnfE2L
	2jnCzmZ7DeMNzPm1FeMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hw9K6-0008As-NA; Fri, 09 Aug 2019 18:09:06 +0000
Received: from mail-ot1-f70.google.com ([209.85.210.70])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw9K3-0008AC-Fd
 for linux-afs@lists.infradead.org; Fri, 09 Aug 2019 18:09:04 +0000
Received: by mail-ot1-f70.google.com with SMTP id o21so2487655otj.7
 for <linux-afs@lists.infradead.org>; Fri, 09 Aug 2019 11:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=V25+XUIaKi6XUm0H56UptnIU5DSM67dQfXdundGFO4c=;
 b=WCbFVHxXWtWYTtDwPh03f7esc8onSPQP325rCbJzhC0fhDZvIIIupkFd7NoKJFGngF
 WiWFQGOASNARt82ZfR9ZTXxs+0FuEy5PlNZv1wNfPIwNBwEkZhah17Ly2mwRrS5M7Bli
 BkQcQu2Dp+CpnUg10b7FUJTqWIP9lc1Jq4SEXx4wgaZjNpryK4ZYxr4XQxAhDgj1cvd3
 zb5jWIwAdMH8WTXGPWh6FrNQnNYkFGpzKnieALY7pkgtMc3ydas1PuqsdDdIRXLb9r9m
 m6oR/tl2aO/0sN+QuP82kitQJ+7U0h/EkXWZ3VoGZ55d72UhhRVnRXfn1JKQdED49EN2
 haAA==
X-Gm-Message-State: APjAAAUFlvl7Bvi6ZAwyp+XxzXwJv5hSIJcEXIuGnV65AwOvAUXgCo6S
 vmIOUPjkxnf7FYfyfN2YGCxuf4foPa5NvZPqPT89J2hQ7Y8O
X-Google-Smtp-Source: APXvYqxIodrbP/4N+EQhfOL74zP7r1vRk2mIoqLfGEyOIGZ+MQRSRuTeM4nmX6vaBwiaKnSNp8mU1E6XaJuPIgpRx/CcNuiRkERU
MIME-Version: 1.0
X-Received: by 2002:a5d:80c3:: with SMTP id h3mr23172856ior.167.1565374140994; 
 Fri, 09 Aug 2019 11:09:00 -0700 (PDT)
Date: Fri, 09 Aug 2019 11:09:00 -0700
In-Reply-To: <0000000000008cf14e058fad0c41@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009d5bbf058fb3116b@google.com>
Subject: Re: KASAN: null-ptr-deref Write in rxrpc_unuse_local
From: syzbot <syzbot+20dee719a2e090427b5f@syzkaller.appspotmail.com>
To: davem@davemloft.net, dhowells@redhat.com, linux-afs@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190809_110903_526459_7BDE9FAA 
X-CRM114-Status: UNSURE (   2.90  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.6 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.6 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.70 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.70 listed in wl.mailspike.net]
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

syzbot has bisected this bug to:

commit 5c2833938bf50d502586e16b9dad1e3cf88fda6f
Author: David Howells <dhowells@redhat.com>
Date:   Wed Jul 31 15:26:05 2019 +0000

     rxrpc: Fix local endpoint refcounting

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1519a11c600000
start commit:   87b983f5 Add linux-next specific files for 20190809
git tree:       linux-next
final crash:    https://syzkaller.appspot.com/x/report.txt?x=1719a11c600000
console output: https://syzkaller.appspot.com/x/log.txt?x=1319a11c600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=28eea330e11df0eb
dashboard link: https://syzkaller.appspot.com/bug?extid=20dee719a2e090427b5f
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17ceae36600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10ebc40e600000

Reported-by: syzbot+20dee719a2e090427b5f@syzkaller.appspotmail.com
Fixes: 5c2833938bf5 ("rxrpc: Fix local endpoint refcounting")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
