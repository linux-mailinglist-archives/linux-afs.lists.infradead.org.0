Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F55CEC47
	for <lists+linux-afs@lfdr.de>; Mon,  7 Oct 2019 20:59:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0uCp7H1tx0RP615sypgOtuq8TZjIMaTL4FjaV/1GUX4=; b=M3AihyINNCmJyr
	5/XzceCNUocfnPfRUwaqdBVVyoGwRFVQ3nYtJppBsSg45kslk82R7391Z2eotZ6z8Q5dXu417WlMm
	INuCv8b76TKEySRP4WU5IRdMFSsOnxF79thzi7LX8sbQ2lw67UU3yMknItTE+iUFgJymqQIPI1AVr
	FRc+eXCbRdtJl1iv2XkHgTJZcz5InczTrsBqatvxJQcilxuM5KE9pj3REQWJEqaTAWqTUJ++sjoKa
	NHc1ARJAGcEvDF7mqvxFarF5d/R7jG7XyPxzvNIjd65Xn7b/1/vZ3GAEgsgkxkyx05/cbIYptYnei
	m1HQZa5qSJIMSQoCdrVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHYE3-0004It-7r; Mon, 07 Oct 2019 18:59:19 +0000
Received: from mail-io1-f69.google.com ([209.85.166.69])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHYDy-0004HE-Rc
 for linux-afs@lists.infradead.org; Mon, 07 Oct 2019 18:59:16 +0000
Received: by mail-io1-f69.google.com with SMTP id w8so28154491iod.21
 for <linux-afs@lists.infradead.org>; Mon, 07 Oct 2019 11:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=hcZ/rOmgx1gUO3ejejbmSDSQ+0Pvz2P/r/ne8Sia82Q=;
 b=WuNxk4kJRxc3sa8dIjqT3NGCfOEovrRRI1MHOBVmuquvo++IBBbSC+JAmd/zZu6F4L
 EIGXRoPQpRaZzINy4TtMsw/lnnMXPG2WUR+g2nmA7yITA3DTU9xaFMKhve3M3SR/jmvR
 SFnz9fWUl1zE7hZf80TedPvVoP2jb+FMJImfXP5lGI5/tqh7GD2Th5dJO8g4RJwkhVAg
 r8EySPQki7W5apD8w8ITkAayl+1z+IRBonzZ9XXaZRK1taFnAa17v8+UkK+/CKi+VrrN
 0SNS248xAhiTr/xXgWTRL1zU4UOf2kJ9gPF70cHtJTXpN0mRtB/fuB3b1PtI6U6XgvYo
 EYFg==
X-Gm-Message-State: APjAAAWBrp87/bSmBFBPTTEPHr6Yl7bYFajYVDGQYEpyjwEjOWPA+xEH
 8Bb1gJhDR/KEeKdqA+8frhmnSb6MBN3PdzxI8FQpdt9D8v+f
X-Google-Smtp-Source: APXvYqwKDV9bkJ3CbD1lTn7nhWmSEDVsQCa6LfIBWdqWXDABkI5OnzYeetKhzne6hfaVlJekLNHvwRkLfMslrr+O8HcvmHuuqZf4
MIME-Version: 1.0
X-Received: by 2002:a6b:9109:: with SMTP id t9mr23918993iod.16.1570474751802; 
 Mon, 07 Oct 2019 11:59:11 -0700 (PDT)
Date: Mon, 07 Oct 2019 11:59:11 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b5c8d0059456a5c7@google.com>
Subject: general protection fault in rxrpc_error_report
From: syzbot <syzbot+611164843bd48cc2190c@syzkaller.appspotmail.com>
To: davem@davemloft.net, dhowells@redhat.com, linux-afs@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_115914_895778_37DFA2E7 
X-CRM114-Status: UNSURE (   5.30  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.6 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.6 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.69 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.69 listed in wl.mailspike.net]
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

Hello,

syzbot found the following crash on:

HEAD commit:    3b47fd5c Merge tag 'nfs-for-5.3-4' of git://git.linux-nfs...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12e278c1600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b89bb446a3faaba4
dashboard link: https://syzkaller.appspot.com/bug?extid=611164843bd48cc2190c
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1014304e600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=134663de600000

The bug was bisected to:

commit 2baec2c3f854d1f79c7bb28386484e144e864a14
Author: David Howells <dhowells@redhat.com>
Date:   Wed May 24 16:02:32 2017 +0000

     rxrpc: Support network namespacing

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15edda32600000
final crash:    https://syzkaller.appspot.com/x/report.txt?x=17edda32600000
console output: https://syzkaller.appspot.com/x/log.txt?x=13edda32600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+611164843bd48cc2190c@syzkaller.appspotmail.com
Fixes: 2baec2c3f854 ("rxrpc: Support network namespacing")

kasan: CONFIG_KASAN_INLINE enabled
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 16 Comm: ksoftirqd/1 Not tainted 5.3.0-rc7+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:rxrpc_lookup_peer_icmp_rcu net/rxrpc/peer_event.c:37 [inline]
RIP: 0010:rxrpc_error_report+0x23b/0x1a80 net/rxrpc/peer_event.c:175
Code: ff ff ff ba 24 00 00 00 31 f6 48 89 df e8 ed ff 0f fb 49 8d be 5c 02  
00 00 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <0f> b6 14 02 48  
89 f8 83 e0 07 83 c0 01 38 d0 7c 08 84 d2 0f 85 16
RSP: 0018:ffff8880a99174a0 EFLAGS: 00010207
RAX: dffffc0000000000 RBX: ffff8880a9917500 RCX: 0000000000000000
RDX: 000000000000004b RSI: 0000000000000000 RDI: 000000000000025c
RBP: ffff8880a99175a0 R08: 0000000000000004 R09: ffff8880a9917500
R10: ffffed1015322ea4 R11: 0000000000000003 R12: ffff888098ca4d40
R13: ffff88808dce9330 R14: 0000000000000000 R15: ffff8880a9917640
FS:  0000000000000000(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000004cde30 CR3: 0000000008c6d000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  sock_queue_err_skb+0x34c/0x7c0 net/core/skbuff.c:4401
  ip_icmp_error+0x3e3/0x580 net/ipv4/ip_sockglue.c:415
  __udp4_lib_err+0x609/0x1320 net/ipv4/udp.c:713
  udp_err+0x25/0x30 net/ipv4/udp.c:723
  icmp_socket_deliver+0x1ea/0x370 net/ipv4/icmp.c:768
  icmp_unreach+0x34a/0xaa0 net/ipv4/icmp.c:885
  icmp_rcv+0xede/0x15a0 net/ipv4/icmp.c:1067
  ip_protocol_deliver_rcu+0x5a/0x8b0 net/ipv4/ip_input.c:204
  ip_local_deliver_finish+0x23b/0x390 net/ipv4/ip_input.c:231
  NF_HOOK include/linux/netfilter.h:305 [inline]
  NF_HOOK include/linux/netfilter.h:299 [inline]
  ip_local_deliver+0x1e9/0x520 net/ipv4/ip_input.c:252
  dst_input include/net/dst.h:442 [inline]
  ip_rcv_finish+0x1d9/0x2e0 net/ipv4/ip_input.c:413
  NF_HOOK include/linux/netfilter.h:305 [inline]
  NF_HOOK include/linux/netfilter.h:299 [inline]
  ip_rcv+0xe8/0x3f0 net/ipv4/ip_input.c:523
  __netif_receive_skb_one_core+0x113/0x1a0 net/core/dev.c:5004
  __netif_receive_skb+0x2c/0x1d0 net/core/dev.c:5118
  process_backlog+0x206/0x750 net/core/dev.c:5929
  napi_poll net/core/dev.c:6352 [inline]
  net_rx_action+0x4d6/0x1030 net/core/dev.c:6418
  __do_softirq+0x262/0x98c kernel/softirq.c:292
  run_ksoftirqd kernel/softirq.c:603 [inline]
  run_ksoftirqd+0x8e/0x110 kernel/softirq.c:595
  smpboot_thread_fn+0x6a3/0xa40 kernel/smpboot.c:165
  kthread+0x361/0x430 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Modules linked in:
---[ end trace 7d3172ee2e4a713b ]---
RIP: 0010:rxrpc_lookup_peer_icmp_rcu net/rxrpc/peer_event.c:37 [inline]
RIP: 0010:rxrpc_error_report+0x23b/0x1a80 net/rxrpc/peer_event.c:175
Code: ff ff ff ba 24 00 00 00 31 f6 48 89 df e8 ed ff 0f fb 49 8d be 5c 02  
00 00 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <0f> b6 14 02 48  
89 f8 83 e0 07 83 c0 01 38 d0 7c 08 84 d2 0f 85 16
RSP: 0018:ffff8880a99174a0 EFLAGS: 00010207
RAX: dffffc0000000000 RBX: ffff8880a9917500 RCX: 0000000000000000
RDX: 000000000000004b RSI: 0000000000000000 RDI: 000000000000025c
RBP: ffff8880a99175a0 R08: 0000000000000004 R09: ffff8880a9917500
R10: ffffed1015322ea4 R11: 0000000000000003 R12: ffff888098ca4d40
R13: ffff88808dce9330 R14: 0000000000000000 R15: ffff8880a9917640
FS:  0000000000000000(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000004cde30 CR3: 0000000008c6d000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
