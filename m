Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 38967A19A2
	for <lists+linux-afs@lfdr.de>; Thu, 29 Aug 2019 14:10:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=9JmCFfGswMQ9XKdfSW7uae5eBeMucDf3omX6A45v+Kk=; b=FeHDo1LrYoVq5f
	GLrEYh2IwwdYA84KmgSUqL20CQmyldmnjRBz1cXy15KPBXgN7vmG3ltBOH+0yovuwrky6NyIO0bnj
	DXofLQ1XNOpuh3KPZuniJ7+3gRbfafqWN4k9xioxHaXbO2+3mjq9mAeArM+Ge+zm6Fxyg2em1tHDy
	mjRdjzcdrCj1OIX3GNWyV9f07xwo5hpNevt/boBCp+J//82YtyDnAEj0zzH7NrSNAejQiXwNuRU4D
	St2cdiwBTNE+3FSTfbPT1cu20A7t28CNxW8RmphVqu5EYC9OTtpD2+a3X/wJLsPwKGxc8lPywWX0q
	XErMajspqCqUaI6upSsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3JFn-0007lv-1R; Thu, 29 Aug 2019 12:10:15 +0000
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3JFi-0007lG-DN
 for linux-afs@lists.infradead.org; Thu, 29 Aug 2019 12:10:12 +0000
Received: by mail-io1-f71.google.com with SMTP id c22so3702623ioi.20
 for <linux-afs@lists.infradead.org>; Thu, 29 Aug 2019 05:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=P1PYtGhR+nPJP5/MoLNmKeczOItoTzGhqMoW1iD5Ejg=;
 b=EJrOsBSaiNNhwDTJ8IHrS2m/OBQWAFNfSFkV37QI9xHolJMYrVU0xoUCIk0LYRkn9R
 +wakpBvC/xouG6/VPI6LRooV+kHl8oC3PrhuO3aqb8J5vdoCcix6TKSNhzW4Rm2ELCpc
 F4oTCJNGFgoqTZDwU5GHmizTjIm05zePe3MZ8QyHVoNTDUQXLQvH784od6QnwR1Q2x0H
 eg5GfNZ9PqR+IjWLortaLMKtO7ZyJmqk/P6LGJomyTB5HiuHYXpbOy1aPfdMe+cHuH1W
 8p60vbMkUlkBxWVuqFM6kb9BlVhLato3t0GvplhvbGQ+lIi5Qr/mvkovFxdlEhf7aumi
 gEkg==
X-Gm-Message-State: APjAAAWzHt8RnCt1YYq8aBbNhtpWp1klMoKL0wH/eyI2eF931jLcm79t
 G1jd1ZjMu/GPACXMAwrEZTgGhlNwdDcwjjaCP4O6C7cE/eZS
X-Google-Smtp-Source: APXvYqwKU0LnZmIscAtx+UWMsJ2X0GkN2Gmiz6Fv5gvajQ/lXxMcFNyhnkq6T4Et/BCqZAl0Akxpp4e/5LYmXb+Ygua1x6iMp0Ju
MIME-Version: 1.0
X-Received: by 2002:a5d:81cc:: with SMTP id t12mr10935890iol.157.1567080608044; 
 Thu, 29 Aug 2019 05:10:08 -0700 (PDT)
Date: Thu, 29 Aug 2019 05:10:08 -0700
In-Reply-To: <000000000000e695c1058fb26925@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fa1d4a0591406266@google.com>
Subject: Re: KASAN: use-after-free Read in rxrpc_send_keepalive
From: syzbot <syzbot+d850c266e3df14da1d31@syzkaller.appspotmail.com>
To: davem@davemloft.net, dhowells@redhat.com, linux-afs@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_051010_460241_B23CA9B5 
X-CRM114-Status: UNSURE (   3.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.6 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.6 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.71 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.71 listed in wl.mailspike.net]
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

HEAD commit:    ed2393ca Add linux-next specific files for 20190827
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=156adb1e600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2ef5940a07ed45f4
dashboard link: https://syzkaller.appspot.com/bug?extid=d850c266e3df14da1d31
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=167ab582600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+d850c266e3df14da1d31@syzkaller.appspotmail.com

IPv6: ADDRCONF(NETDEV_CHANGE): hsr0: link becomes ready
==================================================================
BUG: KASAN: use-after-free in rxrpc_send_keepalive+0x8a2/0x940  
net/rxrpc/output.c:634
Read of size 8 at addr ffff888086b01218 by task kworker/0:1/12

CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.3.0-rc6-next-20190827 #74
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: krxrpcd rxrpc_peer_keepalive_worker
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x172/0x1f0 lib/dump_stack.c:113
  print_address_description.constprop.0.cold+0xd4/0x30b mm/kasan/report.c:374
  __kasan_report.cold+0x1b/0x41 mm/kasan/report.c:506
  kasan_report+0x12/0x20 mm/kasan/common.c:634
  __asan_report_load8_noabort+0x14/0x20 mm/kasan/generic_report.c:132
  rxrpc_send_keepalive+0x8a2/0x940 net/rxrpc/output.c:634
  rxrpc_peer_keepalive_dispatch net/rxrpc/peer_event.c:369 [inline]
  rxrpc_peer_keepalive_worker+0x7be/0xd02 net/rxrpc/peer_event.c:430
  process_one_work+0x9af/0x1740 kernel/workqueue.c:2269
  worker_thread+0x98/0xe40 kernel/workqueue.c:2415
  kthread+0x361/0x430 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Allocated by task 8741:
  save_stack+0x23/0x90 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:510 [inline]
  __kasan_kmalloc.constprop.0+0xcf/0xe0 mm/kasan/common.c:483
  kasan_kmalloc+0x9/0x10 mm/kasan/common.c:524
  __do_kmalloc mm/slab.c:3655 [inline]
  __kmalloc+0x163/0x770 mm/slab.c:3664
  kmalloc_array include/linux/slab.h:614 [inline]
  kcalloc include/linux/slab.h:625 [inline]
  alloc_pipe_info+0x199/0x420 fs/pipe.c:676
  get_pipe_inode fs/pipe.c:738 [inline]
  create_pipe_files+0x8e/0x730 fs/pipe.c:770
  __do_pipe_flags+0x48/0x250 fs/pipe.c:807
  do_pipe2+0x84/0x160 fs/pipe.c:855
  __do_sys_pipe2 fs/pipe.c:873 [inline]
  __se_sys_pipe2 fs/pipe.c:871 [inline]
  __x64_sys_pipe2+0x54/0x80 fs/pipe.c:871
  do_syscall_64+0xfa/0x760 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 8741:
  save_stack+0x23/0x90 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  kasan_set_free_info mm/kasan/common.c:332 [inline]
  __kasan_slab_free+0x102/0x150 mm/kasan/common.c:471
  kasan_slab_free+0xe/0x10 mm/kasan/common.c:480
  __cache_free mm/slab.c:3425 [inline]
  kfree+0x10a/0x2c0 mm/slab.c:3756
  free_pipe_info+0x243/0x300 fs/pipe.c:709
  put_pipe_info+0xd0/0xf0 fs/pipe.c:582
  pipe_release+0x1e6/0x280 fs/pipe.c:603
  __fput+0x2ff/0x890 fs/file_table.c:280
  ____fput+0x16/0x20 fs/file_table.c:313
  task_work_run+0x145/0x1c0 kernel/task_work.c:113
  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
  exit_to_usermode_loop+0x316/0x380 arch/x86/entry/common.c:163
  prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
  do_syscall_64+0x65f/0x760 arch/x86/entry/common.c:300
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff888086b01200
  which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 24 bytes inside of
  1024-byte region [ffff888086b01200, ffff888086b01600)
The buggy address belongs to the page:
page:ffffea00021ac000 refcount:1 mapcount:0 mapping:ffff8880aa400c40  
index:0xffff888086b00480 compound_mapcount: 0
flags: 0x1fffc0000010200(slab|head)
raw: 01fffc0000010200 ffffea00027b5588 ffffea00028e3808 ffff8880aa400c40
raw: ffff888086b00480 ffff888086b00000 0000000100000003 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff888086b01100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff888086b01180: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ffff888086b01200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                             ^
  ffff888086b01280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff888086b01300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
