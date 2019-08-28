Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B32A0AB1
	for <lists+linux-afs@lfdr.de>; Wed, 28 Aug 2019 21:48:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mw6LRrH8cGP3/dsKH1vPP1LsxEZdwGfNSS/lsagwZ9s=; b=rpJNvqE0EzygHK
	BOYsRj4x+d6HvevFoEj9vhujaETPiatXZygAHuoAaIygSr7cV0EHOYDvEZF1L8UOouo3yOh6o+CA2
	Z2n8Q1DShg6zM92DVD+mkcJQC92z/hXioDT+E5inYqG+cbWbCli517fgoO/3mIlqIbZ4XP8vIEIUG
	k192R/M20CEnVUhOzFlXpihg4QTs3cMsUH4v+YZ9sRjdBEKmnCq8F+IpLuJVQ0pUzRy8cuZ54YLT5
	k9gUaWGEgbE2e6h1/qwkFdmd3PHgU4ZPCRpzDlCO/JZmEpUY+8VYFPHhTXBdAbY4k0+G4rnECreCi
	mrPTg1aPEK3lBue8CSxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i33vQ-0004et-C1; Wed, 28 Aug 2019 19:48:12 +0000
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i33vM-0004dz-M5
 for linux-afs@lists.infradead.org; Wed, 28 Aug 2019 19:48:10 +0000
Received: by mail-io1-f71.google.com with SMTP id x9so963660ior.9
 for <linux-afs@lists.infradead.org>; Wed, 28 Aug 2019 12:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=7ghtGp5J+PmV7Tcxs0OU6gXbW9w20QxLS/lDebvWWVc=;
 b=OlHUQFAK9DA171hhnB1M7Oq8Q3MsbL+BFtvY+iixFjLx6+taecTEMaLVhlw/GTkEzZ
 E9KfxHDNHLVhT/sBNHBk/fbHX1PQts5PAA2P46HP56wUC/DrlHrEzrhBvU6h1RnPm75y
 jv+wznh0nevRJ+SvjMqoy+5/6iK8cucyWNEAqJdk1RkJP0wHx+Qc8/YIiiBCe69RyDXO
 nYatR5MQJcLK2b6sHZWccI2yIBburbfcg3GhNlMiFthzXf9/C44mKUn61mRlkg7j6WGb
 NqZQx9AGCT9MaZgtqm8Y3W4NrJuXuJG6U/AFbxDN2v1wpuj9zqLfWy2ZTe3KOD7ruOYe
 KldQ==
X-Gm-Message-State: APjAAAVuhl+1JQ11cmJR37LzclAW8FdXBv/fIsXGqN8dc67Wkz395jX2
 IeFZXpgZW2Wf1rX/0a7FnblWg0ChLFZIpguD++lmNU2BOaCl
X-Google-Smtp-Source: APXvYqy8422xexpBhNrHpDudiBE5UkQQ/lRD82sxQxtDjUp+UsY2P2Ciy7ys5i7Hzf6S0o6iyyWU+ZFdd0o7xQeYDGZHqXX9YFzp
MIME-Version: 1.0
X-Received: by 2002:a02:4881:: with SMTP id p123mr6348414jaa.69.1567021686233; 
 Wed, 28 Aug 2019 12:48:06 -0700 (PDT)
Date: Wed, 28 Aug 2019 12:48:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f6a13b059132aa6c@google.com>
Subject: KASAN: use-after-free Read in rxrpc_put_peer
From: syzbot <syzbot+b9be979c55f2bea8ed30@syzkaller.appspotmail.com>
To: davem@davemloft.net, dhowells@redhat.com, linux-afs@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_124808_726050_7DF1AB98 
X-CRM114-Status: UNSURE (   3.71  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.6 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.6 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.71 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.71 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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

HEAD commit:    ed2393ca Add linux-next specific files for 20190827
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=11b4a79c600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2ef5940a07ed45f4
dashboard link: https://syzkaller.appspot.com/bug?extid=b9be979c55f2bea8ed30
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13c73066600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+b9be979c55f2bea8ed30@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in __rxrpc_put_peer net/rxrpc/peer_object.c:411  
[inline]
BUG: KASAN: use-after-free in rxrpc_put_peer+0x685/0x6a0  
net/rxrpc/peer_object.c:435
Read of size 8 at addr ffff8880a05bd218 by task ksoftirqd/1/16

CPU: 1 PID: 16 Comm: ksoftirqd/1 Not tainted 5.3.0-rc6-next-20190827 #74
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
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
  run_ksoftirqd kernel/softirq.c:603 [inline]
  run_ksoftirqd+0x8e/0x110 kernel/softirq.c:595
  smpboot_thread_fn+0x6a3/0xa40 kernel/smpboot.c:165
  kthread+0x361/0x430 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Allocated by task 17189:
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

Freed by task 9:
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

The buggy address belongs to the object at ffff8880a05bd200
  which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 24 bytes inside of
  1024-byte region [ffff8880a05bd200, ffff8880a05bd600)
The buggy address belongs to the page:
page:ffffea0002816f00 refcount:1 mapcount:0 mapping:ffff8880aa400c40  
index:0xffff8880a05bcd80 compound_mapcount: 0
flags: 0x1fffc0000010200(slab|head)
raw: 01fffc0000010200 ffffea00027c4588 ffffea0002381088 ffff8880aa400c40
raw: ffff8880a05bcd80 ffff8880a05bc000 0000000100000006 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8880a05bd100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8880a05bd180: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ffff8880a05bd200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                             ^
  ffff8880a05bd280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8880a05bd300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
