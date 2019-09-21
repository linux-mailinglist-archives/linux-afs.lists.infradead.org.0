Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 67305B9D8B
	for <lists+linux-afs@lfdr.de>; Sat, 21 Sep 2019 13:08:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=voQHh23pMKo3M3PTG9gKytwJXUen13eV1MdoPXWW+SI=; b=Jno74YQHlrDO9y
	jdLi2iz8GjVZ5P6k/ako28ihXzg5smgBJnYW4yjXfp5kCurbzyEefvMIk2hTfYpxA/H4kBeeXUrcD
	zVyQXZ5qKzmZt39h9rB2QdZ+xYKxZQ8lb8pSxMucTzf1GtsUqkwIGiXZHs1bSsbVhqSg8b/iY3uV9
	LP7ybllqvAcTee4x5EMZOmmIR5sgxvHMmQkFKS0cklJI2Eqweh91zlr6gyDi/MHTzSnozL0sLJ02t
	CamzSNkR7Ar/tLsdHynRGxDw6iMTdIJtwauBI6kdNmMHyXt0txI3OQBaLYYquH0fi7DVXyZfPTPqL
	iJ4ncYHdoY9frxqnDefw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBdFP-0000Mv-OU; Sat, 21 Sep 2019 11:08:15 +0000
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBdFL-0000M6-Hg
 for linux-afs@lists.infradead.org; Sat, 21 Sep 2019 11:08:13 +0000
Received: by mail-io1-f70.google.com with SMTP id f9so1542681ioh.6
 for <linux-afs@lists.infradead.org>; Sat, 21 Sep 2019 04:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=tF9f8HOEBFZsHatB6N83NPRUGAJJLyixjeU8/8LJXm4=;
 b=hQ1fLveNzdw3lEwxOA3qeDiTrHoFW7H5CkQegpcr9ZDl+cwVvyrtx0cdSSO9DCwe5W
 +fv5ydm77rgD0sNjnqodQybPljX4GOJTOFqeMPD8qm71Dj7ehXOtN0cF8c6sgFRbs8FP
 Yd/kDocHF4nuRMv7Pre8eOVIv8a3eU2DZmye4H83AMVZClO/uBIHt0p+UwnZMK1BAS7b
 T4TXe4ED+PDRXKnEX1c2deo7FwhN+jz9HphuD22gKx6FdPcgL+SlKPERINqJt/e/edyY
 8/cIbZeGAoMR+1/UXiGmLaCiodhOMr99Nk5pE0XbDbrLi3KMjxZ0PkeTE5yy5ZaLwbDq
 QqPA==
X-Gm-Message-State: APjAAAWcEujfYIKSElcT9h18m1hOxDA3B0tu03U3eHI1FLVcFrzA1+TC
 iV3hyhrEQkvAKV/ynwuUOneOekQ2aFtIknBy6E1BBeFWvM+N
X-Google-Smtp-Source: APXvYqz2E9lE2ch/Yc+UShmraCJxnaDt71HrKNYbk+7XMRMwlIAxM2581WQ5gTNz7aEMfIRNjJJmPGmV+vNRR9kXTAqBFE06FYUM
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1f5:: with SMTP id
 t21mr24158548jaq.119.1569064085756; 
 Sat, 21 Sep 2019 04:08:05 -0700 (PDT)
Date: Sat, 21 Sep 2019 04:08:05 -0700
In-Reply-To: <000000000000727bd10590c9cf6c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007626af05930e33d7@google.com>
Subject: Re: KASAN: use-after-free Read in rxrpc_release_call
From: syzbot <syzbot+eed305768ece6682bb7f@syzkaller.appspotmail.com>
To: davem@davemloft.net, dhowells@redhat.com, linux-afs@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190921_040811_615299_C8CF660F 
X-CRM114-Status: UNSURE (   3.90  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.6 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.6 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.70 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.70 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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

HEAD commit:    f97c81dc Merge tag 'armsoc-late' of git://git.kernel.org/p..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=110c16a1600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=61f948934213449f
dashboard link: https://syzkaller.appspot.com/bug?extid=eed305768ece6682bb7f
compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
80fee25776c2fb61e74c1ecb1a523375c2500b69)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16cf8ea1600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+eed305768ece6682bb7f@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in rxrpc_release_call+0x3f3/0x540  
net/rxrpc/call_object.c:493
Read of size 8 at addr ffff88809cea9450 by task syz-executor.2/15263

CPU: 1 PID: 15263 Comm: syz-executor.2 Not tainted 5.3.0+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x1d8/0x2f8 lib/dump_stack.c:113
  print_address_description+0x75/0x5b0 mm/kasan/report.c:351
  __kasan_report+0x14b/0x1c0 mm/kasan/report.c:482
  kasan_report+0x26/0x50 mm/kasan/common.c:618
  __asan_report_load8_noabort+0x14/0x20 mm/kasan/generic_report.c:132
  rxrpc_release_call+0x3f3/0x540 net/rxrpc/call_object.c:493
  rxrpc_release_calls_on_socket+0x6b7/0x7e0 net/rxrpc/call_object.c:523
  rxrpc_release_sock net/rxrpc/af_rxrpc.c:897 [inline]
  rxrpc_release+0x2dc/0x460 net/rxrpc/af_rxrpc.c:927
  __sock_release net/socket.c:590 [inline]
  sock_close+0xe1/0x260 net/socket.c:1268
  __fput+0x2e4/0x740 fs/file_table.c:280
  ____fput+0x15/0x20 fs/file_table.c:313
  task_work_run+0x17e/0x1b0 kernel/task_work.c:113
  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
  exit_to_usermode_loop arch/x86/entry/common.c:163 [inline]
  prepare_exit_to_usermode+0x459/0x580 arch/x86/entry/common.c:194
  syscall_return_slowpath+0x113/0x4a0 arch/x86/entry/common.c:274
  do_syscall_64+0x11f/0x1c0 arch/x86/entry/common.c:300
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x4136f1
Code: 75 14 b8 03 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 04 1b 00 00 c3 48  
83 ec 08 e8 0a fc ff ff 48 89 04 24 b8 03 00 00 00 0f 05 <48> 8b 3c 24 48  
89 c2 e8 53 fc ff ff 48 89 d0 48 83 c4 08 48 3d 01
RSP: 002b:00007ffe548af320 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000004 RCX: 00000000004136f1
RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000000000003
RBP: 0000000000000000 R08: ffffffffffffffff R09: ffffffffffffffff
R10: 00007ffe548af400 R11: 0000000000000293 R12: 000000000075bfc8
R13: 000000000018139a R14: 00000000007608b0 R15: 000000000075bfd4

Allocated by task 15276:
  save_stack mm/kasan/common.c:69 [inline]
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc+0x11c/0x1b0 mm/kasan/common.c:493
  kasan_kmalloc+0x9/0x10 mm/kasan/common.c:507
  kmem_cache_alloc_trace+0x221/0x2f0 mm/slab.c:3550
  kmalloc include/linux/slab.h:552 [inline]
  kzalloc include/linux/slab.h:748 [inline]
  rxrpc_alloc_connection+0x79/0x490 net/rxrpc/conn_object.c:41
  rxrpc_alloc_client_connection net/rxrpc/conn_client.c:176 [inline]
  rxrpc_get_client_conn net/rxrpc/conn_client.c:339 [inline]
  rxrpc_connect_call+0xb30/0x2c40 net/rxrpc/conn_client.c:697
  rxrpc_new_client_call+0x6d5/0xb60 net/rxrpc/call_object.c:289
  rxrpc_new_client_call_for_sendmsg net/rxrpc/sendmsg.c:595 [inline]
  rxrpc_do_sendmsg+0xf2b/0x19b0 net/rxrpc/sendmsg.c:652
  rxrpc_sendmsg+0x5eb/0x8b0 net/rxrpc/af_rxrpc.c:585
  sock_sendmsg_nosec net/socket.c:637 [inline]
  sock_sendmsg net/socket.c:657 [inline]
  ___sys_sendmsg+0x60d/0x910 net/socket.c:2311
  __sys_sendmmsg+0x239/0x470 net/socket.c:2413
  __do_sys_sendmmsg net/socket.c:2442 [inline]
  __se_sys_sendmmsg net/socket.c:2439 [inline]
  __x64_sys_sendmmsg+0xa0/0xb0 net/socket.c:2439
  do_syscall_64+0xf7/0x1c0 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 9:
  save_stack mm/kasan/common.c:69 [inline]
  set_track mm/kasan/common.c:77 [inline]
  __kasan_slab_free+0x12a/0x1e0 mm/kasan/common.c:455
  kasan_slab_free+0xe/0x10 mm/kasan/common.c:463
  __cache_free mm/slab.c:3425 [inline]
  kfree+0x115/0x200 mm/slab.c:3756
  rxrpc_destroy_connection+0x1ec/0x240 net/rxrpc/conn_object.c:372
  __rcu_reclaim kernel/rcu/rcu.h:222 [inline]
  rcu_do_batch kernel/rcu/tree.c:2157 [inline]
  rcu_core+0x843/0x1050 kernel/rcu/tree.c:2377
  rcu_core_si+0x9/0x10 kernel/rcu/tree.c:2386
  __do_softirq+0x333/0x7c4 arch/x86/include/asm/paravirt.h:766

The buggy address belongs to the object at ffff88809cea9200
  which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 592 bytes inside of
  1024-byte region [ffff88809cea9200, ffff88809cea9600)
The buggy address belongs to the page:
page:ffffea000273aa00 refcount:1 mapcount:0 mapping:ffff8880aa400c40  
index:0x0 compound_mapcount: 0
flags: 0x1fffc0000010200(slab|head)
raw: 01fffc0000010200 ffffea00026b4908 ffffea0002a64588 ffff8880aa400c40
raw: 0000000000000000 ffff88809cea8000 0000000100000007 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff88809cea9300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff88809cea9380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff88809cea9400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                  ^
  ffff88809cea9480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff88809cea9500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
