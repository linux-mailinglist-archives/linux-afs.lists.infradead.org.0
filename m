Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8D51513B2
	for <lists+linux-afs@lfdr.de>; Tue,  4 Feb 2020 01:38:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=lNBIu8/GCiC2fd5ltxPYJgeCGJ/RWtCMJISi84Lu+LY=; b=hjN
	r5SJuIW+LyPfz14ovu2ULQXuNW1mGM7axRiPXHDonYErnBOCvW1Y/SYccO09jTY82z72dM9DdXpDB
	9DFr4Uw9mdC4jdgbLYzVKuC2MKcee4tCEplUnALw/0DBlbxAlu3hmkGHjDvcCft6QTKju+We3KHZQ
	b0fOyufUGYm9L+2hQjHOISWd8Xohd7CSSNWdzyuTnwCU5sYpaJEzqC6aDQIBpKfm/LFB/li7UHj3u
	p5XHcPiwtv/HLKKM5tOwYkC2E/XDfuty/a3FBKVvIHzsbnDeitMKG6RMbR70nZsHMkaF5L8mrtUug
	L1Ft+/03mnAvGekQO0gbuFqACHZxmAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iymEK-00067e-OT; Tue, 04 Feb 2020 00:38:16 +0000
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iymEH-000679-Ku
 for linux-afs@lists.infradead.org; Tue, 04 Feb 2020 00:38:15 +0000
Received: by mail-io1-f72.google.com with SMTP id d13so10646352ioc.3
 for <linux-afs@lists.infradead.org>; Mon, 03 Feb 2020 16:38:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=8lBfRE5DzjrWOh7AtAjbKlIa2fCtISUtqCR+PeGHF7g=;
 b=qXxfaqJBCKbrJFbLL0dkyoBjOdOv56Dz0YWuT+QQwuSKRmGmmLK417HyHyCigi7FTf
 Tht2fn5SCojpZPmK14pCorcfgxqdNLUHbuHemSOY0Xw+1N8WdJAnD5BLA2wagnV3YMiM
 B9jOeNcgOzKy/Mhg0KS4qJmjJEm5GErA1lbgtgfHVsd/YBXlWO+ggsGtVwmWTg+Xgdad
 qu5FrrrjUFZnsa2Y7rpvzNERILpfs4gMc8PE0pSgDeVuNtefotG920NEQ3PycJu0bj42
 ubVYz4OuIniOykrWN1UZPqLPAhD2+Mr8a4p5bA2tcQAmoHkRbb3vIjvPNgfnwbe+JXJT
 kNFg==
X-Gm-Message-State: APjAAAXaMKwr8fZODMGpqLdOyZojvdFvvbZ8pGd3SU5WiwjpDfuPI2qc
 uXsGwMSGRNlV2TuZDTM8Dvsb+m46wRQ8esSgjttBo0adT3F7
X-Google-Smtp-Source: APXvYqzkyVy8V1zeVu37zAoYgu01IEACWIyNDYI7t0e0/UjNWAR9uOtxzs6ybRYhX8bxiVzUhBIRL2vkvexpPBIEpe6vZkSodF6K
MIME-Version: 1.0
X-Received: by 2002:a92:884e:: with SMTP id h75mr24756337ild.199.1580776692186; 
 Mon, 03 Feb 2020 16:38:12 -0800 (PST)
Date: Mon, 03 Feb 2020 16:38:12 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000350337059db54167@google.com>
Subject: inconsistent lock state in rxrpc_put_client_conn
From: syzbot <syzbot+3f1fd6b8cbf8702d134e@syzkaller.appspotmail.com>
To: davem@davemloft.net, dhowells@redhat.com, kuba@kernel.org, 
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_163813_687048_FEE7C923 
X-CRM114-Status: UNSURE (   4.64  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 3.1 (+++)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (3.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.72 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.72 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
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

Hello,

syzbot found the following crash on:

HEAD commit:    3d80c653 Merge tag 'rxrpc-fixes-20200203' of git://git.ker..
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=16a38595e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=95b275782b150c86
dashboard link: https://syzkaller.appspot.com/bug?extid=3f1fd6b8cbf8702d134e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14ac314ee00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13ec4c5ee00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+3f1fd6b8cbf8702d134e@syzkaller.appspotmail.com

================================
WARNING: inconsistent lock state
5.5.0-syzkaller #0 Not tainted
--------------------------------
inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
swapper/1/0 [HC0[0]:SC1[1]:HE1:SE0] takes:
ffff88808e8fa1c8 (&(&local->client_conns_lock)->rlock){+.?.}, at: spin_lock include/linux/spinlock.h:338 [inline]
ffff88808e8fa1c8 (&(&local->client_conns_lock)->rlock){+.?.}, at: rxrpc_put_one_client_conn net/rxrpc/conn_client.c:948 [inline]
ffff88808e8fa1c8 (&(&local->client_conns_lock)->rlock){+.?.}, at: rxrpc_put_client_conn+0x6ed/0xc90 net/rxrpc/conn_client.c:1001
{SOFTIRQ-ON-W} state was registered at:
  lock_acquire+0x190/0x410 kernel/locking/lockdep.c:4484
  __raw_spin_lock include/linux/spinlock_api_smp.h:142 [inline]
  _raw_spin_lock+0x2f/0x40 kernel/locking/spinlock.c:151
  spin_lock include/linux/spinlock.h:338 [inline]
  rxrpc_get_client_conn net/rxrpc/conn_client.c:304 [inline]
  rxrpc_connect_call+0x358/0x4e30 net/rxrpc/conn_client.c:701
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
irq event stamp: 130510
hardirqs last  enabled at (130510): [<ffffffff87e8d446>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:160 [inline]
hardirqs last  enabled at (130510): [<ffffffff87e8d446>] _raw_spin_unlock_irqrestore+0x66/0xe0 kernel/locking/spinlock.c:191
hardirqs last disabled at (130509): [<ffffffff87e8d7bf>] __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:108 [inline]
hardirqs last disabled at (130509): [<ffffffff87e8d7bf>] _raw_spin_lock_irqsave+0x6f/0xcd kernel/locking/spinlock.c:159
softirqs last  enabled at (130494): [<ffffffff8147535c>] _local_bh_enable+0x1c/0x30 kernel/softirq.c:162
softirqs last disabled at (130495): [<ffffffff81477d5b>] invoke_softirq kernel/softirq.c:373 [inline]
softirqs last disabled at (130495): [<ffffffff81477d5b>] irq_exit+0x19b/0x1e0 kernel/softirq.c:413

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&(&local->client_conns_lock)->rlock);
  <Interrupt>
    lock(&(&local->client_conns_lock)->rlock);

 *** DEADLOCK ***

1 lock held by swapper/1/0:
 #0: ffffffff89babe80 (rcu_callback){....}, at: rcu_do_batch kernel/rcu/tree.c:2176 [inline]
 #0: ffffffff89babe80 (rcu_callback){....}, at: rcu_core+0x562/0x1390 kernel/rcu/tree.c:2410

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
 rxrpc_put_one_client_conn net/rxrpc/conn_client.c:948 [inline]
 rxrpc_put_client_conn+0x6ed/0xc90 net/rxrpc/conn_client.c:1001
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
Code: b8 43 cb f9 eb 8a cc cc cc cc cc cc e9 07 00 00 00 0f 00 2d 24 bf 5f 00 f4 c3 66 90 e9 07 00 00 00 0f 00 2d 14 bf 5f 00 fb f4 <c3> cc 55 48 89 e5 41 57 41 56 41 55 41 54 53 e8 4e 19 7a f9 e8 e9
RSP: 0018:ffffc90000d3fd68 EFLAGS: 00000286 ORIG_RAX: ffffffffffffff13
RAX: 1ffffffff13675b2 RBX: ffff8880a99fc340 RCX: 0000000000000000
RDX: dffffc0000000000 RSI: 0000000000000006 RDI: ffff8880a99fcbd4
RBP: ffffc90000d3fd98 R08: ffff8880a99fc340 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: dffffc0000000000
R13: ffffffff8aa3e080 R14: 0000000000000000 R15: 0000000000000001
 arch_cpu_idle+0xa/0x10 arch/x86/kernel/process.c:686
 default_idle_call+0x84/0xb0 kernel/sched/idle.c:94
 cpuidle_idle_call kernel/sched/idle.c:154 [inline]
 do_idle+0x3c8/0x6e0 kernel/sched/idle.c:269


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
