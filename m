Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A78F18F701
	for <lists+linux-afs@lfdr.de>; Mon, 23 Mar 2020 15:35:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=/lhzCrmx0nvyaHSZoUKiLQX0Z6u48jkair/eALUuCX0=; b=eBP5cuTL87z22r
	UiihlwzAG+Vg+qEXSU4JfvKPhNX8vTJKNKC3XFxHPHDYxZerMpl11Nwq2xLPwLpI5HGY0ehGiEu/b
	c6f0mHUurriPUqNmMaMORdm00b4mNIGjqPI5aWOJllnCdmaw6ZRTOjmPnevVTBOXxEzwbVLErPbRw
	3iMAVxIro9RrlDbHPtdCky3bBWg1TwdRbAAsl1YId9XMdo8NOU7S9sFMQ8viz4so8Lm/jZeAW7gSB
	6gWpVR4nji5dL16HxiHTyFzl3RfTxw3udUR3C3ZyvhXSL1BudjBxl5LXxbPOijsvnagZE0lKx0hLQ
	gaHE6tWvXfKCUE3YgyjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGOAf-0004RY-Io; Mon, 23 Mar 2020 14:35:17 +0000
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jG0f2-0000B6-5z
 for linux-afs@lists.infradead.org; Sun, 22 Mar 2020 13:29:06 +0000
Received: by mail-io1-f71.google.com with SMTP id x20so8482929iox.5
 for <linux-afs@lists.infradead.org>; Sun, 22 Mar 2020 06:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=jmLK9Nx0sV4n9spz6FizKEO/UiXLat+guCFQpWcvF0A=;
 b=qsvyJ+J4ZXQZXcjnUKDzSYA2CGQR+3ifhl1YbvFx2Z0ePr6KUZSjPOzf7TeIGw6MgV
 a09dxTqMAaiemGzjTOZNgsTJeOthOJrs/7k1xkgQM1Z8mbbNFhLerSKKR94y7GyTxHsR
 CV9jMu+m+0LQ/DqkROWzfAV+TnHM/pO3PEKK9UqcxpK8MwTK+U2YnBjoji2fZOwmf71V
 +W6tXAPj+1rP6ufd0KJeGuIz6/Ljld92eh9GllSzERuFWuvnV5iX2WlDvbZ5W423gN9r
 h9lIv2WwdfW48OgYLmX4HjaYbrL5Wq43sLQjHseLPTSorqa5S8GBWTlbC8KdWGOiPw6V
 yufw==
X-Gm-Message-State: ANhLgQ10B62imjqNycvYnu6TbmFuRPx1Bk4SIisreGHZQziTZsNNGd2n
 rF0bBiRj1JAw0/Bk4J0MU9beF04FWW2tGFQrFWQLkqIZW1FU
X-Google-Smtp-Source: ADFU+vuxGqce5HdcWsT4uwnV72WS992615JlGUhT5JCgdY61XjgcaVQW8M8Cui/rAj31oWjxi4kC07HBUM/mm6t6pOUvYSxhRcSr
MIME-Version: 1.0
X-Received: by 2002:a05:6638:398:: with SMTP id
 y24mr5155770jap.125.1584883742893; 
 Sun, 22 Mar 2020 06:29:02 -0700 (PDT)
Date: Sun, 22 Mar 2020 06:29:02 -0700
In-Reply-To: <000000000000277a0405a16bd5c9@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008172fe05a17180aa@google.com>
Subject: Re: BUG: unable to handle kernel NULL pointer dereference in
 handle_external_interrupt_irqoff
From: syzbot <syzbot+3f29ca2efb056a761e38@syzkaller.appspotmail.com>
To: bp@alien8.de, clang-built-linux@googlegroups.com, davem@davemloft.net, 
 dhowells@redhat.com, dvyukov@google.com, hpa@zytor.com, jmattson@google.com, 
 joro@8bytes.org, kuba@kernel.org, kvm@vger.kernel.org, 
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, mingo@redhat.com, 
 netdev@vger.kernel.org, pbonzini@redhat.com, sean.j.christopherson@intel.com, 
 syzkaller-bugs@googlegroups.com, tglx@linutronix.de, vkuznets@redhat.com, 
 wanpengli@tencent.com, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200322_062904_228252_597F38C2 
X-CRM114-Status: UNSURE (   2.51  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 3.1 (+++)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (3.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.71 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.71 listed in wl.mailspike.net]
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

syzbot has bisected this bug to:

commit f71dbf2fb28489a79bde0dca1c8adfb9cdb20a6b
Author: David Howells <dhowells@redhat.com>
Date:   Thu Jan 30 21:50:36 2020 +0000

    rxrpc: Fix insufficient receive notification generation

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1483bb19e00000
start commit:   b74b991f Merge tag 'block-5.6-20200320' of git://git.kerne..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=1683bb19e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=1283bb19e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6dfa02302d6db985
dashboard link: https://syzkaller.appspot.com/bug?extid=3f29ca2efb056a761e38
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1199c0c5e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15097373e00000

Reported-by: syzbot+3f29ca2efb056a761e38@syzkaller.appspotmail.com
Fixes: f71dbf2fb284 ("rxrpc: Fix insufficient receive notification generation")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
