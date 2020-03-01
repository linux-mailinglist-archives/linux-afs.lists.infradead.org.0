Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E15174CEF
	for <lists+linux-afs@lfdr.de>; Sun,  1 Mar 2020 12:20:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=b1tqlNRFWKfehyFnv2doh+6jiKsdw+yfUonzTE11+hM=; b=sjO
	LPQoNb5fswiZDc2KE+3K/P0x1CCAHD5pR7pPm3JcVEH9zVNUdSU0mdhElC6iob4AKt2skDdOvaEa7
	Yb1Kg1CIgRMJAN83vxiVNL8bCPGRZwnUL0zh43lJcMfmntGPDXOhArtWkks5fJVJmBH6LGYEDzbp4
	NNUuM/8BEBt7rk5hVj4mCP62b6365Sco4B+pIqth1faqen0LikkuTAyKrS30c70B4TmfUVhibPFLx
	YFU0pEzzBJ57foN7r8DU6/owBXxULT67oZBA9tyG5ll+MMlGpcpFt7qdbCxM7mY95x6ukLFzF7cuO
	EllwulIi7rKYZ+CpMn9YwJiNHG8tzqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8Mdt-0007OO-9A; Sun, 01 Mar 2020 11:20:17 +0000
Received: from mail-il1-f199.google.com ([209.85.166.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8Mdq-0007Ne-PS
 for linux-afs@lists.infradead.org; Sun, 01 Mar 2020 11:20:16 +0000
Received: by mail-il1-f199.google.com with SMTP id a4so6644707ili.14
 for <linux-afs@lists.infradead.org>; Sun, 01 Mar 2020 03:20:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=go2em9Ljthkh8bv+66gOflgqR5R40xw32D6uaPu+fbI=;
 b=jWM3JZTZBGCsphU33Dy+U3nNPvUbU9PyjXJGMB9VTk1n14SIG9GSQ/uc7myIoDY9aD
 7yM0nE7y2yAuDbwYxWHnliN89zouUB6LT8INzKVqRRcUnNJEO5gAfv3ExUoav0r5LkBv
 hwSfhZzCDdA9CiTLbtSrsnbwbBHNkc8ImFjaGHzHhc7Qa72L+u1epZ23n4avFhycKlq/
 ksZBaSrSnn35EJ4tZZlUdRYK9FesZJds+NaTg3SBQNE+P6qYSVquO9FH9JGMiHaMmoo0
 mbsYmgvGVJxRQyyLXq9Ctl1LiEACgXisdHcNs6s8zHRGFfg60t+6ByszEB1klLNYfsFm
 BxZQ==
X-Gm-Message-State: APjAAAViv78NEwmalGzKGCSEdUVLVZTW18bu7awFBoHH/8dHt3bAcgqm
 4Q3PP9OMso7H1Bq6dqvqnLGrClDC+1VguEHT+Wye/2maneYl
X-Google-Smtp-Source: APXvYqwJxUnpzxQiBIGgDtlghCiY2StwSPCfO+F1kKjYNbYS9qb1J0ILqr5ldyu5AH+4SAYqz5qTkT3zTF5IXR8zg2oTBkLDvzGV
MIME-Version: 1.0
X-Received: by 2002:a92:8458:: with SMTP id l85mr12379683ild.296.1583061612450; 
 Sun, 01 Mar 2020 03:20:12 -0800 (PST)
Date: Sun, 01 Mar 2020 03:20:12 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001156d8059fc94130@google.com>
Subject: KASAN: use-after-free Read in afs_deactivate_cell
From: syzbot <syzbot+14ebf5bd30d222b5745c@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-afs@lists.infradead.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200301_032014_827845_ECB18767 
X-CRM114-Status: UNSURE (   4.69  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.9 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.9 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -1.5 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.199 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.199 listed in list.dnswl.org]
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

HEAD commit:    bdc5461b Add linux-next specific files for 20200224
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=100c3645e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8402e437f1eeea92
dashboard link: https://syzkaller.appspot.com/bug?extid=14ebf5bd30d222b5745c
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+14ebf5bd30d222b5745c@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in hlist_del_rcu include/linux/rculist.h:487 [inline]
BUG: KASAN: use-after-free in afs_deactivate_cell+0x17d/0x1e0 fs/afs/cell.c:632
Read of size 8 at addr ffff888094430468 by task kworker/1:3/18047

CPU: 1 PID: 18047 Comm: kworker/1:3 Not tainted 5.6.0-rc2-next-20200224-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: afs afs_manage_cell
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x197/0x210 lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd4/0x30b mm/kasan/report.c:374
 __kasan_report.cold+0x1b/0x32 mm/kasan/report.c:506
 kasan_report+0x12/0x20 mm/kasan/common.c:641
 __asan_report_load8_noabort+0x14/0x20 mm/kasan/generic_report.c:135
 hlist_del_rcu include/linux/rculist.h:487 [inline]
 afs_deactivate_cell+0x17d/0x1e0 fs/afs/cell.c:632
 afs_manage_cell+0x35e/0x1400 fs/afs/cell.c:706
 process_one_work+0xa05/0x17a0 kernel/workqueue.c:2266
 worker_thread+0x98/0xe40 kernel/workqueue.c:2412
 kthread+0x361/0x430 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Allocated by task 26432:
 save_stack+0x23/0x90 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 __kasan_kmalloc mm/kasan/common.c:515 [inline]
 __kasan_kmalloc.constprop.0+0xcf/0xe0 mm/kasan/common.c:488
 kasan_kmalloc+0x9/0x10 mm/kasan/common.c:529
 kmem_cache_alloc_trace+0x158/0x790 mm/slab.c:3551
 kmalloc include/linux/slab.h:555 [inline]
 kzalloc include/linux/slab.h:669 [inline]
 afs_alloc_cell fs/afs/cell.c:151 [inline]
 afs_lookup_cell+0x645/0x1310 fs/afs/cell.c:250
 afs_parse_source fs/afs/super.c:290 [inline]
 afs_parse_param fs/afs/super.c:326 [inline]
 afs_parse_param+0x440/0x920 fs/afs/super.c:314
 vfs_parse_fs_param+0x2b4/0x610 fs/fs_context.c:147
 vfs_parse_fs_string+0x10a/0x170 fs/fs_context.c:191
 do_new_mount fs/namespace.c:2816 [inline]
 do_mount+0x6b4/0x1b50 fs/namespace.c:3107
 __do_sys_mount fs/namespace.c:3316 [inline]
 __se_sys_mount fs/namespace.c:3293 [inline]
 __x64_sys_mount+0x192/0x230 fs/namespace.c:3293
 do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:295
 entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 13356:
 save_stack+0x23/0x90 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 kasan_set_free_info mm/kasan/common.c:337 [inline]
 __kasan_slab_free+0x102/0x150 mm/kasan/common.c:476
 kasan_slab_free+0xe/0x10 mm/kasan/common.c:485
 __cache_free mm/slab.c:3426 [inline]
 kfree+0x10a/0x2c0 mm/slab.c:3757
 afs_cell_destroy+0xf1/0x130 fs/afs/cell.c:486
 rcu_do_batch kernel/rcu/tree.c:2207 [inline]
 rcu_core+0x5e3/0x1440 kernel/rcu/tree.c:2434
 rcu_core_si+0x9/0x10 kernel/rcu/tree.c:2443
 __do_softirq+0x262/0x98c kernel/softirq.c:292

The buggy address belongs to the object at ffff888094430400
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 104 bytes inside of
 512-byte region [ffff888094430400, ffff888094430600)
The buggy address belongs to the page:
page:ffffea0002510c00 refcount:1 mapcount:0 mapping:00000000872b8291 index:0x0
flags: 0xfffe0000000200(slab)
raw: 00fffe0000000200 ffffea0002887048 ffffea00029f3fc8 ffff8880aa400a80
raw: 0000000000000000 ffff888094430000 0000000100000004 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff888094430300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888094430380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888094430400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                          ^
 ffff888094430480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888094430500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
