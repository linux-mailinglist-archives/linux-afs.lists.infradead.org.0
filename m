Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D7DCBC94
	for <lists+linux-afs@lfdr.de>; Fri,  4 Oct 2019 16:03:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=XWlsTa2dCD0RT4Z1Q/CbS6Vwg/3rLG6BcSO4/yrluKA=; b=asFHVCdeReFFOl
	I+MBgpE+Dx3mlbCAKRy6qux69v4KCPA7bcbqCuUVy0ugzyFCM8Oypu18+T32UwOf8/7L1LDVzoedv
	YYl9lfX6rms0dZNYvmgK3LFPF9TmsGYzQumTRyxF9j0ACRx/7k6qD21tgL3ozZ3btc2lRO6sgrvf4
	ChdeBWpRtNuIZh6QwyORk3E0EZNQSH5tYCeyzLaWq64o0C54451IrZucootnYMWR4ffSIBRhGVsmY
	D9mc4L6hqVeoJBPaO8ZGi5GEcK//1Cy2LSoEmhC4+gAfgzG/m3qutwUmWAaYNvFHmP6jE8QdLUPwV
	Ud6Qee5cD7qI+6YQrpCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGOAj-00028Y-ES; Fri, 04 Oct 2019 14:03:05 +0000
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGOAg-00027z-HE
 for linux-afs@lists.infradead.org; Fri, 04 Oct 2019 14:03:04 +0000
Received: by mail-io1-f70.google.com with SMTP id k14so12029834iot.14
 for <linux-afs@lists.infradead.org>; Fri, 04 Oct 2019 07:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=378RZOSs6PafydwqJNoFgZvB2GShwFKLuaG5sOlABYQ=;
 b=mAnvc083Zkb7oM08isK6XxS6W6bXLsyPoCiT/3OAkgyBSJphkChvWsj1VwJ/49PpYM
 Lb1qDlYcjdP8by/XxLbwysChWTvONjgT2jAKERuURwodRHpC1HVb7OdplYlJoDUQ1o1b
 +ctwm4xURNPyi2Exlfuj5COZE3IMpYpcuF2JGlI97Uu0n5Hzb5K+l3t2BmyEj/2WePWR
 n5SFp5J4pAqrta5FlbiuCqgH0vE6QBVrznBj3a/t/aLmii/cOCtr1O93Y6WxRy4d5hvJ
 uFZ6IRHBl1xAMM45DhXQmM1FGCMYk35QKYVGJAFdNn2Ctq453KsziKBipcBH4hoYjfKl
 y68w==
X-Gm-Message-State: APjAAAUIrg6rvO+wS+jw4V0R3mv1Nb/NFsRptfKA7aZPijUAT5hrntEo
 C47YJXvlc6p864fATi3K0df7NG3W3TDriDxBfU8xT9haIvaU
X-Google-Smtp-Source: APXvYqzLNXhBV8MJKcuRtZBXeX9VWQ+FgYkmxim/nRZw2xiofgC9rW+EgTucPDsDntfiaiI9313/kc4kIdODgpXG4JryzsUvc9Uy
MIME-Version: 1.0
X-Received: by 2002:a92:88c1:: with SMTP id m62mr15261646ilh.95.1570197780850; 
 Fri, 04 Oct 2019 07:03:00 -0700 (PDT)
Date: Fri, 04 Oct 2019 07:03:00 -0700
In-Reply-To: <29823.1570196590@warthog.procyon.org.uk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f4732e0594162801@google.com>
Subject: Re: KASAN: use-after-free Read in rxrpc_put_peer
From: syzbot <syzbot+b9be979c55f2bea8ed30@syzkaller.appspotmail.com>
To: MAILER_DAEMON@email.uscc.net, davem@davemloft.net, dhowells@redhat.com, 
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_070302_576135_A8BD94D2 
X-CRM114-Status: UNSURE (   4.11  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 3.1 (+++)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (3.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.70 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.70 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
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

syzbot has tested the proposed patch but the reproducer still triggered  
crash:
KASAN: use-after-free Read in rxrpc_release_call

==================================================================
BUG: KASAN: use-after-free in rxrpc_release_call+0x973/0xaa0  
net/rxrpc/call_object.c:498
Read of size 8 at addr ffff88808888b910 by task syz-executor.5/9000

CPU: 1 PID: 9000 Comm: syz-executor.5 Not tainted 5.3.0+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x172/0x1f0 lib/dump_stack.c:113
  print_address_description.constprop.0.cold+0xd4/0x30b mm/kasan/report.c:374
  __kasan_report.cold+0x1b/0x41 mm/kasan/report.c:506
  kasan_report+0x12/0x20 mm/kasan/common.c:634
  __asan_report_load8_noabort+0x14/0x20 mm/kasan/generic_report.c:132
  rxrpc_release_call+0x973/0xaa0 net/rxrpc/call_object.c:498
  rxrpc_release_calls_on_socket+0x6e7/0x1320 net/rxrpc/call_object.c:528
  rxrpc_release_sock net/rxrpc/af_rxrpc.c:897 [inline]
  rxrpc_release+0x2a6/0x550 net/rxrpc/af_rxrpc.c:927
  __sock_release+0xce/0x280 net/socket.c:590
  sock_close+0x1e/0x30 net/socket.c:1268
  __fput+0x2ff/0x890 fs/file_table.c:280
  ____fput+0x16/0x20 fs/file_table.c:313
  task_work_run+0x145/0x1c0 kernel/task_work.c:113
  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
  exit_to_usermode_loop+0x316/0x380 arch/x86/entry/common.c:163
  prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
  do_syscall_64+0x65f/0x760 arch/x86/entry/common.c:300
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x459a29
Code: fd b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 cb b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f6e3d494c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000459a29
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003
RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f6e3d4956d4
R13: 00000000004f93d2 R14: 00000000004d1e00 R15: 00000000ffffffff

Allocated by task 9000:
  save_stack+0x23/0x90 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:510 [inline]
  __kasan_kmalloc.constprop.0+0xcf/0xe0 mm/kasan/common.c:483
  kasan_kmalloc+0x9/0x10 mm/kasan/common.c:524
  kmem_cache_alloc_trace+0x158/0x790 mm/slab.c:3550
  kmalloc include/linux/slab.h:552 [inline]
  kzalloc include/linux/slab.h:686 [inline]
  rxrpc_alloc_connection+0x86/0x5f0 net/rxrpc/conn_object.c:41
  rxrpc_alloc_client_connection net/rxrpc/conn_client.c:176 [inline]
  rxrpc_get_client_conn net/rxrpc/conn_client.c:340 [inline]
  rxrpc_connect_call+0x648/0x4c30 net/rxrpc/conn_client.c:698
  rxrpc_new_client_call+0x9c0/0x1ad0 net/rxrpc/call_object.c:290
  rxrpc_new_client_call_for_sendmsg net/rxrpc/sendmsg.c:595 [inline]
  rxrpc_do_sendmsg+0xffa/0x1d5f net/rxrpc/sendmsg.c:652
  rxrpc_sendmsg+0x4d6/0x5f0 net/rxrpc/af_rxrpc.c:585
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
  rxrpc_destroy_connection+0x1f2/0x2d0 net/rxrpc/conn_object.c:373
  __rcu_reclaim kernel/rcu/rcu.h:222 [inline]
  rcu_do_batch kernel/rcu/tree.c:2157 [inline]
  rcu_core+0x581/0x1560 kernel/rcu/tree.c:2377
  rcu_core_si+0x9/0x10 kernel/rcu/tree.c:2386
  __do_softirq+0x262/0x98c kernel/softirq.c:292

The buggy address belongs to the object at ffff88808888b6c0
  which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 592 bytes inside of
  1024-byte region [ffff88808888b6c0, ffff88808888bac0)
The buggy address belongs to the page:
page:ffffea0002222280 refcount:1 mapcount:0 mapping:ffff8880aa400c40  
index:0xffff88808888bb40 compound_mapcount: 0
flags: 0x1fffc0000010200(slab|head)
raw: 01fffc0000010200 ffffea000220ae88 ffffea0002809108 ffff8880aa400c40
raw: ffff88808888bb40 ffff88808888a040 0000000100000002 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff88808888b800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff88808888b880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff88808888b900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                          ^
  ffff88808888b980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff88808888ba00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


Tested on:

commit:         cc9604d4 rxrpc: rxrpc_peer needs to hold a ref on the rxrp..
git tree:        
git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
console output: https://syzkaller.appspot.com/x/log.txt?x=126c3899600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6ffbfa7e4a36190f
dashboard link: https://syzkaller.appspot.com/bug?extid=b9be979c55f2bea8ed30
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
