Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2E689D9B
	for <lists+linux-afs@lfdr.de>; Mon, 12 Aug 2019 14:08:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1QjvNAQZfxZ3zKrudCDwP8iOLjNWoXNxlN4ttn6mAu0=; b=bd1ERdJvmxIyHS
	FrSDudhNj4suCVbsHzSpzz4+x3HlLmYPdJ5+NFNBLYN17FvSsrNk6I3uCdyCn5AgkyOAeRw2Io4zY
	x78B9ctynRtUdcWLiSQ0oNYdcRc+6O0Jik+rC7lxVMh10G75Bp0+i9dF5sCBtGf0Wifa9TGCg5TnR
	/QlrdU1qXh6zgCXrtVMeEUwvzVeD7EsRaiKCT/YsWllFFLMu0tL2vjVN2peECcGQHf7oy8L7fhOgn
	6rA7rLVFO8fEp4/SUhYWuxsZtl5/QtCQxIigwA8IXW2R3JyJclKgHE9ZfSbwAntlKtrN+zkamPPF7
	q2dbxizxTqhsR0OZX5Rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx97W-00074m-ME; Mon, 12 Aug 2019 12:08:14 +0000
Received: from mail-ot1-f69.google.com ([209.85.210.69])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx97R-00073y-0x
 for linux-afs@lists.infradead.org; Mon, 12 Aug 2019 12:08:10 +0000
Received: by mail-ot1-f69.google.com with SMTP id h12so83800439otn.18
 for <linux-afs@lists.infradead.org>; Mon, 12 Aug 2019 05:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=k3c8LcSazCwKFrNziC6TBhoXX/eRW9ZM+i9e/h5ipd4=;
 b=dXnVp+13SdE9aahC3uob7ZRECVFOt3MSTuvRREsRKk2sk/V6wTIbhPlv1IxbVKQzyr
 5DeZggXkO30LS7Evaibo50WP0pFT+5chxAlV3cOkLjMlGImQRxZSp93eCoCJUYl8IAGR
 gRt/Q1wSuvBV1XZ+AzbnpnzW2DqsFEgsRzxWX7d2MWKNNq8epZT820KuBbKtH6nbSDn9
 2QCxE+ZbsBxicK/o+kdBz0AzpVMKhziHEhNTf1aEuJr8RzGm0gqAVqqqWaPjQ5NVDTat
 OENzZ1SwwDN6sLg1M9BvdrGaTxMzQ8B7NR2dbVU53ZAb6cwON9EbmzlDMQBoep95jeD4
 5vfw==
X-Gm-Message-State: APjAAAVDE4QoiFBxKFGBPC9ePvY5whbiTk1+zaAxg3ufRQcsmgYr1IgQ
 dcGjxZ+7AP2/hHPMQpiXc2WnVX6KPzYfvuI9GAxffqsFL4h0
X-Google-Smtp-Source: APXvYqxXM8QGVFHauf9s3BqfHHnqc0AEu6j0Lg3VV6mpTQQlFA7JqojoSeaXhSR84bvXhex4/fT4mgYzMkawCgGm/mNXv2L3tBPp
MIME-Version: 1.0
X-Received: by 2002:a02:390c:: with SMTP id l12mr24992612jaa.76.1565611686987; 
 Mon, 12 Aug 2019 05:08:06 -0700 (PDT)
Date: Mon, 12 Aug 2019 05:08:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007593f4058fea60d8@google.com>
Subject: KASAN: use-after-free Read in rxrpc_queue_local
From: syzbot <syzbot+78e71c5bab4f76a6a719@syzkaller.appspotmail.com>
To: davem@davemloft.net, dhowells@redhat.com, linux-afs@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_050809_073622_787578BB 
X-CRM114-Status: UNSURE (   4.06  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.6 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.6 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.69 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.69 listed in wl.mailspike.net]
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

HEAD commit:    125b7e09 net: tc35815: Explicitly check NET_IP_ALIGN is no..
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=174a6536600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a4c9e9f08e9e8960
dashboard link: https://syzkaller.appspot.com/bug?extid=78e71c5bab4f76a6a719
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=165ec172600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=119d4eba600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+78e71c5bab4f76a6a719@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in atomic_read  
include/asm-generic/atomic-instrumented.h:26 [inline]
BUG: KASAN: use-after-free in rxrpc_queue_local+0x7c/0x3e0  
net/rxrpc/local_object.c:354
Read of size 4 at addr ffff8880a7724014 by task syz-executor522/16188

CPU: 0 PID: 16188 Comm: syz-executor522 Not tainted 5.3.0-rc3+ #159
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x172/0x1f0 lib/dump_stack.c:113
  print_address_description.cold+0xd4/0x306 mm/kasan/report.c:351
  __kasan_report.cold+0x1b/0x36 mm/kasan/report.c:482
  kasan_report+0x12/0x17 mm/kasan/common.c:612
  check_memory_region_inline mm/kasan/generic.c:185 [inline]
  check_memory_region+0x134/0x1a0 mm/kasan/generic.c:192
  __kasan_check_read+0x11/0x20 mm/kasan/common.c:92
  atomic_read include/asm-generic/atomic-instrumented.h:26 [inline]
  rxrpc_queue_local+0x7c/0x3e0 net/rxrpc/local_object.c:354
  rxrpc_unuse_local+0x52/0x80 net/rxrpc/local_object.c:408
  rxrpc_release_sock net/rxrpc/af_rxrpc.c:904 [inline]
  rxrpc_release+0x47d/0x840 net/rxrpc/af_rxrpc.c:930
  __sock_release+0xce/0x280 net/socket.c:590
  sock_close+0x1e/0x30 net/socket.c:1268
  __fput+0x2ff/0x890 fs/file_table.c:280
  ____fput+0x16/0x20 fs/file_table.c:313
  task_work_run+0x145/0x1c0 kernel/task_work.c:113
  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
  exit_to_usermode_loop+0x316/0x380 arch/x86/entry/common.c:163
  prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
  do_syscall_64+0x5a9/0x6a0 arch/x86/entry/common.c:299
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x407bb1
Code: 75 14 b8 03 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 24 1a 00 00 c3 48  
83 ec 08 e8 0a fc ff ff 48 89 04 24 b8 03 00 00 00 0f 05 <48> 8b 3c 24 48  
89 c2 e8 53 fc ff ff 48 89 d0 48 83 c4 08 48 3d 01
RSP: 002b:00007ffc861e4d10 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000004 RCX: 0000000000407bb1
RDX: 0000000000000000 RSI: 0000000000000080 RDI: 0000000000000003
RBP: 00000000006e5a0c R08: 00000000004b1939 R09: 00000000004b1939
R10: 00007ffc861e4d40 R11: 0000000000000293 R12: 00000000006e5a00
R13: 0000000000000000 R14: 000000000000002d R15: 20c49ba5e353f7cf

Allocated by task 16189:
  save_stack+0x23/0x90 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:487 [inline]
  __kasan_kmalloc.constprop.0+0xcf/0xe0 mm/kasan/common.c:460
  kasan_kmalloc+0x9/0x10 mm/kasan/common.c:501
  kmem_cache_alloc_trace+0x158/0x790 mm/slab.c:3550
  kmalloc include/linux/slab.h:552 [inline]
  kzalloc include/linux/slab.h:748 [inline]
  rxrpc_alloc_local net/rxrpc/local_object.c:79 [inline]
  rxrpc_lookup_local+0x562/0x1b70 net/rxrpc/local_object.c:277
  rxrpc_bind+0x34d/0x5e0 net/rxrpc/af_rxrpc.c:149
  __sys_bind+0x239/0x290 net/socket.c:1647
  __do_sys_bind net/socket.c:1658 [inline]
  __se_sys_bind net/socket.c:1656 [inline]
  __x64_sys_bind+0x73/0xb0 net/socket.c:1656
  do_syscall_64+0xfd/0x6a0 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 9:
  save_stack+0x23/0x90 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_slab_free+0x102/0x150 mm/kasan/common.c:449
  kasan_slab_free+0xe/0x10 mm/kasan/common.c:457
  __cache_free mm/slab.c:3425 [inline]
  kfree+0x10a/0x2c0 mm/slab.c:3756
  rxrpc_local_rcu+0x62/0x80 net/rxrpc/local_object.c:495
  __rcu_reclaim kernel/rcu/rcu.h:222 [inline]
  rcu_do_batch kernel/rcu/tree.c:2114 [inline]
  rcu_core+0x67f/0x1580 kernel/rcu/tree.c:2314
  rcu_core_si+0x9/0x10 kernel/rcu/tree.c:2323
  __do_softirq+0x262/0x98c kernel/softirq.c:292

The buggy address belongs to the object at ffff8880a7724000
  which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 20 bytes inside of
  1024-byte region [ffff8880a7724000, ffff8880a7724400)
The buggy address belongs to the page:
page:ffffea00029dc900 refcount:1 mapcount:0 mapping:ffff8880aa400c40  
index:0xffff8880a7725200 compound_mapcount: 0
flags: 0x1fffc0000010200(slab|head)
raw: 01fffc0000010200 ffffea0002a6ad08 ffffea0002a6a808 ffff8880aa400c40
raw: ffff8880a7725200 ffff8880a7724000 0000000100000005 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8880a7723f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
  ffff8880a7723f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ffff8880a7724000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                          ^
  ffff8880a7724080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8880a7724100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


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
