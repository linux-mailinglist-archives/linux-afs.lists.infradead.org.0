Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E261888111
	for <lists+linux-afs@lfdr.de>; Fri,  9 Aug 2019 19:22:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6kkOhn9Xe5P5Q1qNCiNeROCXVuNbme9W0Ie2BgCAbfY=; b=gWzRnJ922jStYD
	2t+jO3Zjtq4pShipVLI2mW8GjaFaFxqkUoHwql9eCxWLh0DhQPh4HgC41b5QuUrRAwNyYXvODbh3K
	zZOtUPpoQTRksggIChd97jkrSOWYl+fL51H2f+qMd+wVjCTD4dVADhIjrLxTC6OlqxyEwgfMYqkKd
	z2OFuJq7Cj5qnwhpZobtk0mpGKZdi47pKoFUu0g6A3wi2JTibjtpn0KzC1LFkGuGr8glGfP1zFsDl
	bJDTmBEbqW+WDv2AKmOYkt4UqxBFe3BcypfpQjK6yd0D9/f/wvDlIDDquJjGHyjKUL3Z58MDVW6wq
	Bia6YDcunGSk/PROCglw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hw8ai-0001XY-M6; Fri, 09 Aug 2019 17:22:12 +0000
Received: from mail-ot1-f71.google.com ([209.85.210.71])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw8af-0001Wf-Gp
 for linux-afs@lists.infradead.org; Fri, 09 Aug 2019 17:22:11 +0000
Received: by mail-ot1-f71.google.com with SMTP id g6so9318406otq.13
 for <linux-afs@lists.infradead.org>; Fri, 09 Aug 2019 10:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=9cgS772CXPKMKmDau0zRvHAXUTX+eRt7zThYm1+Rpm8=;
 b=HkVXOyGTxK5CRkDNgyoWEH89QcGg7SzoZ7LHKnoWHYQFLMsb7T2mZRoApF260SkE5/
 kNsj+sI0bxG1eOgJbtfSJ4+Ie42ds+rUU5Rm1NvzphZidH8PPIcQQGgnpyV7FWMD6SNs
 IvAyCygRulFbUfYt4P1f3s9yw1OW0OvDluqTKBF1CygrAgPU3edxyOIAA05IO1KTPz+G
 RsTbfyumWNZao7adwSu42VadvXsmLMWMKflP+U3ngbQSgey4tAY8DIHaomx0sqT9dwBF
 q/LDKeFqd29j23amiAEWIqjigU+taVABF4RIekBPFKz5dNmj/Kk+dY8IU8eGGRHE+1XE
 /hhw==
X-Gm-Message-State: APjAAAUSTFqNQfnP1fE/B/rj/I/QdXIxjWTlmKqoE2AhpQ/uqd49Uc6p
 MwXbz0fG1xnQwAh+/0k6s31Y9BMs9e7/2PMw6x5QoV/7piMG
X-Google-Smtp-Source: APXvYqzmTg903SSJ0TgWcAxahc1LhK5woD2WlskriQoKETXrD12T92bhJSRQKTmj5Tn6pmpZu4SNKXGtO6x8XEC+++Nyy9mQ5Xzs
MIME-Version: 1.0
X-Received: by 2002:a02:6a56:: with SMTP id m22mr11871673jaf.114.1565371327220; 
 Fri, 09 Aug 2019 10:22:07 -0700 (PDT)
Date: Fri, 09 Aug 2019 10:22:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e695c1058fb26925@google.com>
Subject: KASAN: use-after-free Read in rxrpc_send_keepalive
From: syzbot <syzbot+d850c266e3df14da1d31@syzkaller.appspotmail.com>
To: davem@davemloft.net, dhowells@redhat.com, linux-afs@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190809_102209_565481_8FAD4199 
X-CRM114-Status: UNSURE (   4.40  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.6 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.6 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.71 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.71 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
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

HEAD commit:    b678c568 Merge tag 'nfs-for-5.3-2' of git://git.linux-nfs...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10ea5e36600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a4c9e9f08e9e8960
dashboard link: https://syzkaller.appspot.com/bug?extid=d850c266e3df14da1d31
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+d850c266e3df14da1d31@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in rxrpc_send_keepalive+0x8a2/0x940  
net/rxrpc/output.c:635
Read of size 8 at addr ffff888064219698 by task kworker/0:3/11077

CPU: 0 PID: 11077 Comm: kworker/0:3 Not tainted 5.3.0-rc3+ #96
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: krxrpcd rxrpc_peer_keepalive_worker
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x172/0x1f0 lib/dump_stack.c:113
  print_address_description.cold+0xd4/0x306 mm/kasan/report.c:351
  __kasan_report.cold+0x1b/0x36 mm/kasan/report.c:482
  kasan_report+0x12/0x17 mm/kasan/common.c:612
  __asan_report_load8_noabort+0x14/0x20 mm/kasan/generic_report.c:132
  rxrpc_send_keepalive+0x8a2/0x940 net/rxrpc/output.c:635
  rxrpc_peer_keepalive_dispatch net/rxrpc/peer_event.c:369 [inline]
  rxrpc_peer_keepalive_worker+0x7be/0xd02 net/rxrpc/peer_event.c:430
  process_one_work+0x9af/0x1740 kernel/workqueue.c:2269
  worker_thread+0x98/0xe40 kernel/workqueue.c:2415
  kthread+0x361/0x430 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Allocated by task 20465:
  save_stack+0x23/0x90 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:487 [inline]
  __kasan_kmalloc.constprop.0+0xcf/0xe0 mm/kasan/common.c:460
  kasan_kmalloc+0x9/0x10 mm/kasan/common.c:501
  kmem_cache_alloc_trace+0x158/0x790 mm/slab.c:3550
  kmalloc include/linux/slab.h:552 [inline]
  kzalloc include/linux/slab.h:748 [inline]
  rxrpc_alloc_local net/rxrpc/local_object.c:79 [inline]
  rxrpc_lookup_local+0x64c/0x1b70 net/rxrpc/local_object.c:279
  rxrpc_sendmsg+0x379/0x5f0 net/rxrpc/af_rxrpc.c:566
  sock_sendmsg_nosec net/socket.c:637 [inline]
  sock_sendmsg+0xd7/0x130 net/socket.c:657
  ___sys_sendmsg+0x3e2/0x920 net/socket.c:2311
  __sys_sendmmsg+0x1bf/0x4d0 net/socket.c:2413
  __do_sys_sendmmsg net/socket.c:2442 [inline]
  __se_sys_sendmmsg net/socket.c:2439 [inline]
  __x64_sys_sendmmsg+0x9d/0x100 net/socket.c:2439
  do_syscall_64+0xfd/0x6a0 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 0:
  save_stack+0x23/0x90 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_slab_free+0x102/0x150 mm/kasan/common.c:449
  kasan_slab_free+0xe/0x10 mm/kasan/common.c:457
  __cache_free mm/slab.c:3425 [inline]
  kfree+0x10a/0x2c0 mm/slab.c:3756
  rxrpc_local_rcu+0x62/0x80 net/rxrpc/local_object.c:471
  __rcu_reclaim kernel/rcu/rcu.h:222 [inline]
  rcu_do_batch kernel/rcu/tree.c:2114 [inline]
  rcu_core+0x67f/0x1580 kernel/rcu/tree.c:2314
  rcu_core_si+0x9/0x10 kernel/rcu/tree.c:2323
  __do_softirq+0x262/0x98c kernel/softirq.c:292

The buggy address belongs to the object at ffff888064219680
  which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 24 bytes inside of
  1024-byte region [ffff888064219680, ffff888064219a80)
The buggy address belongs to the page:
page:ffffea0001908600 refcount:1 mapcount:0 mapping:ffff8880aa400c40  
index:0xffff888064218480 compound_mapcount: 0
flags: 0x1fffc0000010200(slab|head)
raw: 01fffc0000010200 ffffea00025f5a08 ffffea00028fca08 ffff8880aa400c40
raw: ffff888064218480 ffff888064218000 0000000100000001 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff888064219580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff888064219600: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ffff888064219680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                             ^
  ffff888064219700: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff888064219780: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
