Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB0BC1F96
	for <lists+linux-afs@lfdr.de>; Mon, 30 Sep 2019 12:54:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=D0cfUdgzPtiGIxc1kdCV82K5KxP0zJ/20ysDnWKbZpk=; b=ggAG+MJLqRszLI
	0I/iOJtxXjLqpcevEXIztTw7loqAwQBg+hiq/hFao0cC0x1zExzkQ0pfrtl3byG33Wgtda1o7vPQP
	hQZ12ipwfCPdKLCUH2P/N1MUiBjACUmxJvtIaJniljhpqqi537Ft6NILnPNfqgFAXLHvXmzzwFbec
	arrJvdoWJS8pa+XbKVPX7HMPKqp+tcVsKtMZnSePa86S4RuRSynAar18QUIC1Jb92d6/mi5pH40Ud
	YbStoceAnpJjuR3CnQntwwyv+D9smfotYTKK4yqs6CmLWFoa6VI7T5H3roa6UOMfLhi7q05GBRlJz
	skKL7ydakt5l9wAEmfBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iEtJo-0005tO-1c; Mon, 30 Sep 2019 10:54:16 +0000
Received: from mail-io1-f69.google.com ([209.85.166.69])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iEtJk-0005sb-88
 for linux-afs@lists.infradead.org; Mon, 30 Sep 2019 10:54:14 +0000
Received: by mail-io1-f69.google.com with SMTP id o11so29259162iop.12
 for <linux-afs@lists.infradead.org>; Mon, 30 Sep 2019 03:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=el3HnliGCocK/NsWdzJTafRm41RvJYIyALJ3SFpOMsU=;
 b=iAbifZ+5z4Mq5uosyA+3tY8+OB8JxU/iHZ9thdDh/Std455U2MipufgEF0fXY97Heo
 MisFhvWTcMvSgeNfUsMJOtZRlUBqFwb5Go31FaLuzJL/QGlveTRFNj5/S2FDmnHgH5N8
 2Q5UgRTX/c6yw8sLS0orgXKJlF+ogc1EeqNgficUXXBBtcrXxY/rE4gbt5/kEAeIAXIk
 aCsugn8cGgGyVcsifmfxHvzUNpWPhpSFUOU+ETTTAZDtTuxHMAYwyf/hixfVicoarLFu
 xgizqyxct3PrZTP3tFlaTje47B9hQWQhuONw38xf4L0kR978cpS/xyHihjba0fq5deeD
 jE0Q==
X-Gm-Message-State: APjAAAVeepHkKTI179oapRtkhlJPzBrBWDgbkRP5Hy/v5E0mSEf2i1PE
 KZlJ+MEJ1OXXlf+78sguW/gBoV4z/tF3V/OJ4iZzEGBSSfeQ
X-Google-Smtp-Source: APXvYqwUDB47fCYcFG/g6fU+fYLX4ECF/AHGSsA7uWcAIMrZ/bXvxsNmHvhkt7NTyhjkHgDWoDDGKJ5gaNz0OffL7WYqaUn4moT9
MIME-Version: 1.0
X-Received: by 2002:a6b:6e02:: with SMTP id d2mr941125ioh.8.1569840847711;
 Mon, 30 Sep 2019 03:54:07 -0700 (PDT)
Date: Mon, 30 Sep 2019 03:54:07 -0700
In-Reply-To: <000000000000f6a13b059132aa6c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000014f8600593c30eb0@google.com>
Subject: Re: KASAN: use-after-free Read in rxrpc_put_peer
From: syzbot <syzbot+b9be979c55f2bea8ed30@syzkaller.appspotmail.com>
To: MAILER_DAEMON@email.uscc.net, davem@davemloft.net, dhowells@redhat.com, 
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190930_035412_290223_98DE2C3A 
X-CRM114-Status: UNSURE (   4.69  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 3.1 (+++)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (3.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.69 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.69 listed in list.dnswl.org]
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

syzbot has found a reproducer for the following crash on:

HEAD commit:    a3c0e7b1 Merge tag 'libnvdimm-fixes-5.4-rc1' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1622045d600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6ffbfa7e4a36190f
dashboard link: https://syzkaller.appspot.com/bug?extid=b9be979c55f2bea8ed30
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11b8f605600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10547843600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+b9be979c55f2bea8ed30@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in __rxrpc_put_peer net/rxrpc/peer_object.c:411  
[inline]
BUG: KASAN: use-after-free in rxrpc_put_peer+0x685/0x6a0  
net/rxrpc/peer_object.c:435
Read of size 8 at addr ffff888097ec0058 by task syz-executor823/24216

CPU: 0 PID: 24216 Comm: syz-executor823 Not tainted 5.3.0+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  <IRQ>
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x172/0x1f0 lib/dump_stack.c:113
  print_address_description.constprop.0.cold+0xd4/0x30b mm/kasan/report.c:374
  __kasan_report.cold+0x1b/0x41 mm/kasan/report.c:506
  kasan_report+0x12/0x20 mm/kasan/common.c:634
  __asan_report_load8_noabort+0x14/0x20 mm/kasan/generic_report.c:132
  __rxrpc_put_peer net/rxrpc/peer_object.c:411 [inline]
  rxrpc_put_peer+0x685/0x6a0 net/rxrpc/peer_object.c:435
  rxrpc_rcu_destroy_call+0x5e/0x140 net/rxrpc/call_object.c:566
  __rcu_reclaim kernel/rcu/rcu.h:222 [inline]
  rcu_do_batch kernel/rcu/tree.c:2157 [inline]
  rcu_core+0x581/0x1560 kernel/rcu/tree.c:2377
  rcu_core_si+0x9/0x10 kernel/rcu/tree.c:2386
  __do_softirq+0x262/0x98c kernel/softirq.c:292
  invoke_softirq kernel/softirq.c:373 [inline]
  irq_exit+0x19b/0x1e0 kernel/softirq.c:413
  exiting_irq arch/x86/include/asm/apic.h:536 [inline]
  smp_apic_timer_interrupt+0x1a3/0x610 arch/x86/kernel/apic/apic.c:1137
  apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:830
  </IRQ>
RIP: 0010:arch_local_irq_restore arch/x86/include/asm/paravirt.h:756  
[inline]
RIP: 0010:__raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:160  
[inline]
RIP: 0010:_raw_spin_unlock_irqrestore+0x95/0xe0  
kernel/locking/spinlock.c:191
Code: 48 c7 c0 20 1c f3 88 48 ba 00 00 00 00 00 fc ff df 48 c1 e8 03 80 3c  
10 00 75 39 48 83 3d 92 28 ac 01 00 74 24 48 89 df 57 9d <0f> 1f 44 00 00  
bf 01 00 00 00 e8 ec 10 08 fa 65 8b 05 5d 0a bb 78
RSP: 0018:ffff8880927378c0 EFLAGS: 00000286 ORIG_RAX: ffffffffffffff13
RAX: 1ffffffff11e6384 RBX: 0000000000000286 RCX: 0000000000000000
RDX: dffffc0000000000 RSI: 0000000000000006 RDI: 0000000000000286
RBP: ffff8880927378d0 R08: ffff888097632000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff8ac62ca8
R13: ffffffff8ac62ca8 R14: ffff888083be9000 R15: 0000000000000003
  __debug_check_no_obj_freed lib/debugobjects.c:973 [inline]
  debug_check_no_obj_freed+0x20a/0x43f lib/debugobjects.c:994
  free_pages_prepare mm/page_alloc.c:1175 [inline]
  __free_pages_ok+0x266/0xea0 mm/page_alloc.c:1421
  free_compound_page+0x97/0xd0 mm/page_alloc.c:674
  free_transhuge_page+0x2a7/0x3b0 mm/huge_memory.c:2842
  __put_compound_page+0x90/0xd0 mm/swap.c:97
  release_pages+0x5e5/0x1a50 mm/swap.c:810
  free_pages_and_swap_cache+0x2c3/0x3f0 mm/swap_state.c:296
  tlb_batch_pages_flush mm/mmu_gather.c:49 [inline]
  tlb_flush_mmu_free mm/mmu_gather.c:184 [inline]
  tlb_flush_mmu+0x89/0x630 mm/mmu_gather.c:191
  tlb_finish_mmu+0x98/0x3b0 mm/mmu_gather.c:272
  exit_mmap+0x2da/0x530 mm/mmap.c:3163
  __mmput kernel/fork.c:1079 [inline]
  mmput+0x179/0x4d0 kernel/fork.c:1100
  exit_mm kernel/exit.c:485 [inline]
  do_exit+0x823/0x2e60 kernel/exit.c:804
  do_group_exit+0x135/0x360 kernel/exit.c:921
  __do_sys_exit_group kernel/exit.c:932 [inline]
  __se_sys_exit_group kernel/exit.c:930 [inline]
  __x64_sys_exit_group+0x44/0x50 kernel/exit.c:930
  do_syscall_64+0xfa/0x760 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x440078
Code: 00 00 be 3c 00 00 00 eb 19 66 0f 1f 84 00 00 00 00 00 48 89 d7 89 f0  
0f 05 48 3d 00 f0 ff ff 77 21 f4 48 89 d7 44 89 c0 0f 05 <48> 3d 00 f0 ff  
ff 76 e0 f7 d8 64 41 89 01 eb d8 0f 1f 84 00 00 00
RSP: 002b:00007ffd29763d08 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 0000000000440078
RDX: 0000000000000000 RSI: 000000000000003c RDI: 0000000000000000
RBP: 00000000004bfa50 R08: 00000000000000e7 R09: ffffffffffffffd0
R10: 00000000004002c8 R11: 0000000000000246 R12: 0000000000000001
R13: 00000000006d2180 R14: 0000000000000000 R15: 0000000000000000

Allocated by task 24200:
  save_stack+0x23/0x90 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:510 [inline]
  __kasan_kmalloc.constprop.0+0xcf/0xe0 mm/kasan/common.c:483
  kasan_kmalloc+0x9/0x10 mm/kasan/common.c:524
  kmem_cache_alloc_trace+0x158/0x790 mm/slab.c:3550
  kmalloc include/linux/slab.h:552 [inline]
  kzalloc include/linux/slab.h:686 [inline]
  rxrpc_alloc_local net/rxrpc/local_object.c:79 [inline]
  rxrpc_lookup_local+0x562/0x1ba0 net/rxrpc/local_object.c:277
  rxrpc_sendmsg+0x379/0x5f0 net/rxrpc/af_rxrpc.c:566
  sock_sendmsg_nosec net/socket.c:637 [inline]
  sock_sendmsg+0xd7/0x130 net/socket.c:657
  ___sys_sendmsg+0x3e2/0x920 net/socket.c:2311
  __sys_sendmmsg+0x1bf/0x4d0 net/socket.c:2413
  __do_sys_sendmmsg net/socket.c:2442 [inline]
  __se_sys_sendmmsg net/socket.c:2439 [inline]
  __x64_sys_sendmmsg+0x9d/0x100 net/socket.c:2439
  do_syscall_64+0xfa/0x760 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 16:
  save_stack+0x23/0x90 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  kasan_set_free_info mm/kasan/common.c:332 [inline]
  __kasan_slab_free+0x102/0x150 mm/kasan/common.c:471
  kasan_slab_free+0xe/0x10 mm/kasan/common.c:480
  __cache_free mm/slab.c:3425 [inline]
  kfree+0x10a/0x2c0 mm/slab.c:3756
  rxrpc_local_rcu+0x62/0x80 net/rxrpc/local_object.c:499
  __rcu_reclaim kernel/rcu/rcu.h:222 [inline]
  rcu_do_batch kernel/rcu/tree.c:2157 [inline]
  rcu_core+0x581/0x1560 kernel/rcu/tree.c:2377
  rcu_core_si+0x9/0x10 kernel/rcu/tree.c:2386
  __do_softirq+0x262/0x98c kernel/softirq.c:292

The buggy address belongs to the object at ffff888097ec0040
  which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 24 bytes inside of
  1024-byte region [ffff888097ec0040, ffff888097ec0440)
The buggy address belongs to the page:
page:ffffea00025fb000 refcount:1 mapcount:0 mapping:ffff8880aa400c40  
index:0x0 compound_mapcount: 0
flags: 0x1fffc0000010200(slab|head)
raw: 01fffc0000010200 ffffea00025bf208 ffffea0002605e88 ffff8880aa400c40
raw: 0000000000000000 ffff888097ec0040 0000000100000007 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff888097ebff00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  ffff888097ebff80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ffff888097ec0000: fc fc fc fc fc fc fc fc fb fb fb fb fb fb fb fb
                                                     ^
  ffff888097ec0080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff888097ec0100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
