Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1181F81F2
	for <lists+linux-afs@lfdr.de>; Sat, 13 Jun 2020 10:34:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ew3MPFDHpany+NQe3fKocMaJYAMHc6QkUJIGZ2avHc0=; b=CtS
	u6dtym3DN5048EOTGLKzG3VG91VKZ2yRTuZtIA98puHwUizROLIe9DyepKrcgwP1CRQIrvAuPJ/tD
	6qQjdpvvbS2Me19PE4Rh393VH3hHcdn3PhSs1v4p3qBuxfMTRmcvwmfxQ2Cg0BDyR4J4ZcFveIW6c
	Yl75J/IcGnzHDzao7gFL51pOgpL+K8AsUkGxNj1EHGg3eCw2dCeYi9J91GYWeulPIhfF928kd1OGs
	iG2fxan36RwnbyzPSjj0cM0ijhueVaaC30HgvnIkSdMEA+8TKnCtgAGk0wMv0Wco5vZ5sfz9Qnb35
	zPkFn/YkfDYhWbv2DM8s4n3ocEm2NFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jk1cJ-0005VD-C1; Sat, 13 Jun 2020 08:34:19 +0000
Received: from mail-il1-f198.google.com ([209.85.166.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jk1cG-0005UW-FD
 for linux-afs@lists.infradead.org; Sat, 13 Jun 2020 08:34:18 +0000
Received: by mail-il1-f198.google.com with SMTP id t69so4706760ilk.13
 for <linux-afs@lists.infradead.org>; Sat, 13 Jun 2020 01:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=Ph+OwEjEJzYatlIQCViewOkPKJpFqnqNz++RpjWPN/s=;
 b=WfFy/0wXJyIy6WDY/8NzPbaKC8HFR6AG4TnCDeAEqV0gtIyWwV6PMYS4kNcad69waA
 bcmSuDr/i5iU3HocxhHBXAuexrBs1RGzsCRuVk4fa9IQNBf7vSAIz/SadVz0X1j7xyal
 w+oW8oc7hUbjGig/hopFlEgEP8NjfLBjKLKd0N0YQyCTR728usKREKi16vLpU3+nAbC8
 19t0t/d//HywNDBirMoUxV7tj7DLDq0VOFQTxCkwGeevRntNc0ZSvkleaoEThZ7sE1gr
 sHo2Pi5esme90pWJ0HM52EgAtn1IuP2RrH+eoVjBZ7yyA0uNzRXL8mVlX4knmY9IU7DO
 YJAg==
X-Gm-Message-State: AOAM532kJzcHXQxjZPNh06jq0vrUBXzVat6DHXZNYDtSxet7xu8tL9nz
 I6NMyDl7OOHz/B3ZKU9Mmda3nwpALLDW/9i9WLKTlBV6NSjR
X-Google-Smtp-Source: ABdhPJwPAuKh/Pbxi+QNw1EME4mMMNXGBXFc9OsVn8kZD917fa0Pf2f0DRpNPi37PgPcPyWna/kdbmAfkV61ow4XzRTOhzZR7m5h
MIME-Version: 1.0
X-Received: by 2002:a05:6638:512:: with SMTP id
 i18mr12132718jar.74.1592037253350; 
 Sat, 13 Jun 2020 01:34:13 -0700 (PDT)
Date: Sat, 13 Jun 2020 01:34:13 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f48bc805a7f30e6c@google.com>
Subject: linux-next test error: KASAN: use-after-free Write in
 afs_wake_up_async_call
From: syzbot <syzbot+ada89e25a220b3befb36@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-afs@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
 sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200613_013416_508229_E8067C25 
X-CRM114-Status: UNSURE (   3.03  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.6 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (0.6 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.198 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.198 listed in wl.mailspike.net]
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

HEAD commit:    64302eab Add linux-next specific files for 20200613
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17bc9eda100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a4b041729071d963
dashboard link: https://syzkaller.appspot.com/bug?extid=ada89e25a220b3befb36
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+ada89e25a220b3befb36@syzkaller.appspotmail.com

tipc: TX() has been purged, node left!
==================================================================
BUG: KASAN: use-after-free in afs_wake_up_async_call+0x6aa/0x770 fs/afs/rxrpc.c:707
Write of size 1 at addr ffff8880940ca9e4 by task kworker/u4:7/6779

CPU: 0 PID: 6779 Comm: kworker/u4:7 Not tainted 5.7.0-next-20200613-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: netns cleanup_net
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x18f/0x20d lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd3/0x413 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
 afs_wake_up_async_call+0x6aa/0x770 fs/afs/rxrpc.c:707
 rxrpc_notify_socket+0x1db/0x5d0 net/rxrpc/recvmsg.c:40
 __rxrpc_set_call_completion.part.0+0x172/0x410 net/rxrpc/recvmsg.c:76
 __rxrpc_call_completed net/rxrpc/recvmsg.c:112 [inline]
 rxrpc_call_completed+0xca/0xf0 net/rxrpc/recvmsg.c:111
 rxrpc_discard_prealloc+0x781/0xab0 net/rxrpc/call_accept.c:233
 rxrpc_listen+0x147/0x360 net/rxrpc/af_rxrpc.c:245
 afs_close_socket+0x95/0x320 fs/afs/rxrpc.c:110
 afs_net_exit+0x1bc/0x310 fs/afs/main.c:155
 ops_exit_list.isra.0+0xa8/0x150 net/core/net_namespace.c:186
 cleanup_net+0x511/0xa50 net/core/net_namespace.c:603
 process_one_work+0x965/0x1690 kernel/workqueue.c:2269
 worker_thread+0x96/0xe10 kernel/workqueue.c:2415
 kthread+0x3b5/0x4a0 kernel/kthread.c:291
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:293

Allocated by task 6836:
 save_stack+0x1b/0x40 mm/kasan/common.c:48
 set_track mm/kasan/common.c:56 [inline]
 __kasan_kmalloc mm/kasan/common.c:494 [inline]
 __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:467
 kmem_cache_alloc_trace+0x153/0x7d0 mm/slab.c:3551
 kmalloc include/linux/slab.h:555 [inline]
 kzalloc include/linux/slab.h:669 [inline]
 afs_alloc_call+0x55/0x630 fs/afs/rxrpc.c:141
 afs_charge_preallocation+0xe9/0x2d0 fs/afs/rxrpc.c:757
 afs_open_socket+0x292/0x360 fs/afs/rxrpc.c:92
 afs_net_init+0xa6c/0xe30 fs/afs/main.c:125
 ops_init+0xaf/0x420 net/core/net_namespace.c:151
 setup_net+0x2de/0x860 net/core/net_namespace.c:341
 copy_net_ns+0x293/0x590 net/core/net_namespace.c:482
 create_new_namespaces+0x3fb/0xb30 kernel/nsproxy.c:110
 unshare_nsproxy_namespaces+0xbd/0x1f0 kernel/nsproxy.c:231
 ksys_unshare+0x43d/0x8e0 kernel/fork.c:2983
 __do_sys_unshare kernel/fork.c:3051 [inline]
 __se_sys_unshare kernel/fork.c:3049 [inline]
 __x64_sys_unshare+0x2d/0x40 kernel/fork.c:3049
 do_syscall_64+0x60/0xe0 arch/x86/entry/common.c:359
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

Freed by task 6779:
 save_stack+0x1b/0x40 mm/kasan/common.c:48
 set_track mm/kasan/common.c:56 [inline]
 kasan_set_free_info mm/kasan/common.c:316 [inline]
 __kasan_slab_free+0xf7/0x140 mm/kasan/common.c:455
 __cache_free mm/slab.c:3426 [inline]
 kfree+0x109/0x2b0 mm/slab.c:3757
 afs_put_call+0x585/0xa40 fs/afs/rxrpc.c:190
 rxrpc_discard_prealloc+0x764/0xab0 net/rxrpc/call_accept.c:230
 rxrpc_listen+0x147/0x360 net/rxrpc/af_rxrpc.c:245
 afs_close_socket+0x95/0x320 fs/afs/rxrpc.c:110
 afs_net_exit+0x1bc/0x310 fs/afs/main.c:155
 ops_exit_list.isra.0+0xa8/0x150 net/core/net_namespace.c:186
 cleanup_net+0x511/0xa50 net/core/net_namespace.c:603
 process_one_work+0x965/0x1690 kernel/workqueue.c:2269
 worker_thread+0x96/0xe10 kernel/workqueue.c:2415
 kthread+0x3b5/0x4a0 kernel/kthread.c:291
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:293

The buggy address belongs to the object at ffff8880940ca800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 484 bytes inside of
 1024-byte region [ffff8880940ca800, ffff8880940cac00)
The buggy address belongs to the page:
page:ffffea0002503280 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0
flags: 0xfffe0000000200(slab)
raw: 00fffe0000000200 ffffea0002507e08 ffffea00029a7988 ffff8880aa000c40
raw: 0000000000000000 ffff8880940ca000 0000000100000002 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff8880940ca880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880940ca900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff8880940ca980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                       ^
 ffff8880940caa00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880940caa80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
