Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B23153A0A
	for <lists+linux-afs@lfdr.de>; Wed,  5 Feb 2020 22:20:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=hifT9LxNiicWnyOL9Qx+AfYnIuRmaWV/sNEfIJGJ7pw=; b=sa7oyAuPIZOQN7
	oH/PayNwYrwVNpQyY+x4m0pHeL402QFliafeMkpV8DKuSgAEDev/v7fULeNLKc7+LnhNOe3feofFd
	uvZEeHjR1NUsFi2t9r6UeyIEdNKq077HHFjk0vTemFOOHymSvFE+ctyYQfZQbM4bj8klTbg4+lyHO
	A4gq/v92fdM0lgxnvab5pvT6xo+3n+tHHfLoY4wOaVZZUoPlbrPbLhJqeRPNJ/bxykdyvRL6K/Xfp
	YND12uuSDWXN17OKcGR6JQ0Vn4X6wE/se/8mjwu3uGaP2WDvmTk5Dft88JMnSxoLQpYp7Yf0JEOXv
	RBaJQ5T6xBsxUAG5dS5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izS5s-000326-6k; Wed, 05 Feb 2020 21:20:20 +0000
Received: from mail-il1-f200.google.com ([209.85.166.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izS5o-00031V-Hy
 for linux-afs@lists.infradead.org; Wed, 05 Feb 2020 21:20:18 +0000
Received: by mail-il1-f200.google.com with SMTP id l13so2674959ils.1
 for <linux-afs@lists.infradead.org>; Wed, 05 Feb 2020 13:20:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=yeXkaU6z1oAYHjJ8XgSVU6rYjp0GpTAJJmGIMTNlysQ=;
 b=djX89UpfjmLDosV7Zc69Uj5KbqJ5C6XjKR9cUh9HWqBj6ZX6l3tDKDibOHjupcMRaV
 LSxlMVGFHevjakMzDuVNoiazJKdG0aDaOSwWLyqsNxwIM4OpDFAvSGO2g6eDWl0FmonE
 7dJ8GU8CFt1HNmY+a6mTSaIYU8GkPGE4dsKKOcCSm5G2CDJF7cMy16gaM+ljG/y4AZ7t
 ymbXtAAeCdjSyUxTvLvh7slnDpDwR8Cii+l4gRJz16yw7obvwCha0KXV0cpWIMI5/4Tr
 LfRrFnv8XcyxyW7asVMIHVhkUscjHy7F6Htlh13N2LKjjv8Wrb8u/qxORII7vOF3j4wX
 ds1Q==
X-Gm-Message-State: APjAAAVLqo2VaBxmwKbzYVPU86uWNJaECWo/XIMrog6gEp+snqFmvIL/
 IIhC05Ex0wdzM8CJi7w0MG18CnGZBtu3V3YuEgSBubTseqbU
X-Google-Smtp-Source: APXvYqyvDiGo+UaqQXOuzP+fiPpY5cB/Q5k2WTDbSj1YM0SiZksxh1BjbAia4zzMV9cBDyRqFfSNXmDgDICvI+1MTnP+qlq9htZT
MIME-Version: 1.0
X-Received: by 2002:a02:cc75:: with SMTP id j21mr30135547jaq.113.1580937613555; 
 Wed, 05 Feb 2020 13:20:13 -0800 (PST)
Date: Wed, 05 Feb 2020 13:20:13 -0800
In-Reply-To: <000000000000f0baeb059db8b055@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000de3ccd059ddab8b8@google.com>
Subject: Re: inconsistent lock state in rxrpc_put_client_connection_id
From: syzbot <syzbot+d82f3ac8d87e7ccbb2c9@syzkaller.appspotmail.com>
To: davem@davemloft.net, dhowells@redhat.com, kuba@kernel.org, 
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_132016_598445_B6A79061 
X-CRM114-Status: UNSURE (   4.27  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 3.1 (+++)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (3.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.200 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.200 listed in wl.mailspike.net]
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

syzbot has found a reproducer for the following crash on:

HEAD commit:    6992ca0d Merge branch 'parisc-5.6-1' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12dbd7f1e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f22d38d7f9a488a8
dashboard link: https://syzkaller.appspot.com/bug?extid=d82f3ac8d87e7ccbb2c9
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14317dbee00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=145a44f6e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+d82f3ac8d87e7ccbb2c9@syzkaller.appspotmail.com

================================
WARNING: inconsistent lock state
5.5.0-syzkaller #0 Not tainted
--------------------------------
inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
swapper/1/0 [HC0[0]:SC1[1]:HE1:SE0] takes:
ffffffff8a8c84b8 (rxrpc_conn_id_lock){+.?.}, at: spin_lock include/linux/spinlock.h:338 [inline]
ffffffff8a8c84b8 (rxrpc_conn_id_lock){+.?.}, at: rxrpc_put_client_connection_id net/rxrpc/conn_client.c:138 [inline]
ffffffff8a8c84b8 (rxrpc_conn_id_lock){+.?.}, at: rxrpc_put_client_connection_id+0x73/0xe0 net/rxrpc/conn_client.c:135
{SOFTIRQ-ON-W} state was registered at:
  lock_acquire+0x190/0x410 kernel/locking/lockdep.c:4484
  __raw_spin_lock include/linux/spinlock_api_smp.h:142 [inline]
  _raw_spin_lock+0x2f/0x40 kernel/locking/spinlock.c:151
  spin_lock include/linux/spinlock.h:338 [inline]
  rxrpc_get_client_connection_id net/rxrpc/conn_client.c:109 [inline]
  rxrpc_alloc_client_connection net/rxrpc/conn_client.c:193 [inline]
  rxrpc_get_client_conn net/rxrpc/conn_client.c:340 [inline]
  rxrpc_connect_call+0x954/0x4e30 net/rxrpc/conn_client.c:701
  rxrpc_new_client_call+0x9c0/0x1ad0 net/rxrpc/call_object.c:290
  rxrpc_new_client_call_for_sendmsg net/rxrpc/sendmsg.c:595 [inline]
  rxrpc_do_sendmsg+0xffa/0x1d5f net/rxrpc/sendmsg.c:652
  rxrpc_sendmsg+0x4d6/0x5f0 net/rxrpc/af_rxrpc.c:586
  sock_sendmsg_nosec net/socket.c:652 [inline]
  sock_sendmsg+0xd7/0x130 net/socket.c:672
  ____sys_sendmsg+0x358/0x880 net/socket.c:2343
  ___sys_sendmsg+0x100/0x170 net/socket.c:2397
  __sys_sendmmsg+0x1bf/0x4d0 net/socket.c:2487
  __do_sys_sendmmsg net/socket.c:2516 [inline]
  __se_sys_sendmmsg net/socket.c:2513 [inline]
  __x64_sys_sendmmsg+0x9d/0x100 net/socket.c:2513
  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
irq event stamp: 182462
hardirqs last  enabled at (182462): [<ffffffff87ec18d6>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:160 [inline]
hardirqs last  enabled at (182462): [<ffffffff87ec18d6>] _raw_spin_unlock_irqrestore+0x66/0xe0 kernel/locking/spinlock.c:191
hardirqs last disabled at (182461): [<ffffffff87ec1c4f>] __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:108 [inline]
hardirqs last disabled at (182461): [<ffffffff87ec1c4f>] _raw_spin_lock_irqsave+0x6f/0xcd kernel/locking/spinlock.c:159
softirqs last  enabled at (182386): [<ffffffff8147368c>] _local_bh_enable+0x1c/0x30 kernel/softirq.c:162
softirqs last disabled at (182387): [<ffffffff8147608b>] invoke_softirq kernel/softirq.c:373 [inline]
softirqs last disabled at (182387): [<ffffffff8147608b>] irq_exit+0x19b/0x1e0 kernel/softirq.c:413

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(rxrpc_conn_id_lock);
  <Interrupt>
    lock(rxrpc_conn_id_lock);

 *** DEADLOCK ***

1 lock held by swapper/1/0:
 #0: ffffffff89babac0 (rcu_callback){....}, at: rcu_do_batch kernel/rcu/tree.c:2176 [inline]
 #0: ffffffff89babac0 (rcu_callback){....}, at: rcu_core+0x562/0x1390 kernel/rcu/tree.c:2410

stack backtrace:
CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.5.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x197/0x210 lib/dump_stack.c:118
 print_usage_bug.cold+0x327/0x378 kernel/locking/lockdep.c:3100
 valid_state kernel/locking/lockdep.c:3111 [inline]
 mark_lock_irq kernel/locking/lockdep.c:3308 [inline]
 mark_lock+0xbb4/0x1220 kernel/locking/lockdep.c:3665
 mark_usage kernel/locking/lockdep.c:3565 [inline]
 __lock_acquire+0x1e8e/0x4a00 kernel/locking/lockdep.c:3908
 lock_acquire+0x190/0x410 kernel/locking/lockdep.c:4484
 __raw_spin_lock include/linux/spinlock_api_smp.h:142 [inline]
 _raw_spin_lock+0x2f/0x40 kernel/locking/spinlock.c:151
 spin_lock include/linux/spinlock.h:338 [inline]
 rxrpc_put_client_connection_id net/rxrpc/conn_client.c:138 [inline]
 rxrpc_put_client_connection_id+0x73/0xe0 net/rxrpc/conn_client.c:135
 rxrpc_put_one_client_conn net/rxrpc/conn_client.c:955 [inline]
 rxrpc_put_client_conn+0x243/0xc90 net/rxrpc/conn_client.c:1001
 rxrpc_put_connection net/rxrpc/ar-internal.h:965 [inline]
 rxrpc_rcu_destroy_call+0xbd/0x200 net/rxrpc/call_object.c:572
 rcu_do_batch kernel/rcu/tree.c:2186 [inline]
 rcu_core+0x5e1/0x1390 kernel/rcu/tree.c:2410
 rcu_core_si+0x9/0x10 kernel/rcu/tree.c:2419
 __do_softirq+0x262/0x98c kernel/softirq.c:292
 invoke_softirq kernel/softirq.c:373 [inline]
 irq_exit+0x19b/0x1e0 kernel/softirq.c:413
 exiting_irq arch/x86/include/asm/apic.h:536 [inline]
 smp_apic_timer_interrupt+0x1a3/0x610 arch/x86/kernel/apic/apic.c:1137
 apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:829
 </IRQ>
RIP: 0010:native_safe_halt+0xe/0x10 arch/x86/include/asm/irqflags.h:61
Code: 38 ea c7 f9 eb 8a cc cc cc cc cc cc e9 07 00 00 00 0f 00 2d 94 76 5c 00 f4 c3 66 90 e9 07 00 00 00 0f 00 2d 84 76 5c 00 fb f4 <c3> cc 55 48 89 e5 41 57 41 56 41 55 41 54 53 e8 ce b7 76 f9 e8 09
RSP: 0018:ffffc90000d3fd68 EFLAGS: 00000286 ORIG_RAX: ffffffffffffff13
RAX: 1ffffffff1367542 RBX: ffff8880a99fc340 RCX: 0000000000000000
RDX: dffffc0000000000 RSI: 0000000000000006 RDI: ffff8880a99fcbd4
RBP: ffffc90000d3fd98 R08: ffff8880a99fc340 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: dffffc0000000000
R13: ffffffff8aa509c0 R14: 0000000000000000 R15: 0000000000000001


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
