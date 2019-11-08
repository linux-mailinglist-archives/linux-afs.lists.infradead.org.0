Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDDAF50CB
	for <lists+linux-afs@lfdr.de>; Fri,  8 Nov 2019 17:15:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=WNmMKGI9qHtoFjrk01AuZyoM0E75JZoloAvUjI1dfkA=; b=df0GOta1RvPUxDvmtGA0E6jer
	MzwQXUQZiT4fvzzZ3BWK1ab6WaH+emdEJ3zunmHArW2ZQXsYdBCaBGjyxinZ1n0x9d8+DDEoEU7r7
	c55bZC2ZtbtN8grm8dW3W/ZgcPUQMGJ203raFWDrWwMQVYfJJS06sQnGpWR8Al5fXJgm5gK/MUY5a
	ZcgU9BTcL1YfjLlFkcaNWY7OPg3CDxE4s6cnxhALSl7zL0eOYFQsMjPWzA1nfUHDgUNc9G4Zv7WQz
	vZGpG4OG0hocxYJQ6qP9Ika9YyQsw3YMvOb0VUsAziIjz8THFIHO1JrpuhUSXGROqxvVHnLrayYSo
	+gkeujsjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iT6us-0000sN-Pd; Fri, 08 Nov 2019 16:15:18 +0000
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iT6uq-0000rb-8J
 for linux-afs@lists.infradead.org; Fri, 08 Nov 2019 16:15:17 +0000
Received: by mail-il1-f197.google.com with SMTP id z14so7393951ill.0
 for <linux-afs@lists.infradead.org>; Fri, 08 Nov 2019 08:15:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to:cc;
 bh=EntwwLODpyY62XQRYlVLnbG2S7/f1rAzhT5hFJTJSbM=;
 b=jvTlyn9GHo6XwiQ+DU5dodZ7o9iXgrNwcsVhe+Fx5W+VcX6OylqIhJLX7U0RTn/CB5
 E1DCcfRsHjC6IqkBrW0gn1DFVGfkiM6JlQVrtrbYATaUCUZfl485m0Q1EerGomFY1i3i
 0hH7xvlcGEbwyOWeOFqLR9be9LemZHllczziRFPzMBGqnmriOgFIdwNvlSGPd7hQ3mfE
 z78uSSxrSIrdEHk52/sRdwZAnf33aSTggrVgDT4qNMSvmo6YPOxb7Rvx+xYHhZc6copU
 F7jWfYw58OCpDmYz9RjSRMNnImq0j5x0R11s49wudJQ/lUSjo2IdL4vdq3GNK4LbQxEl
 NZqg==
X-Gm-Message-State: APjAAAUVC/dTJICmEGVblcjeNNeDWJUXtEYTFT0Q6/2PaQubfmEFgbOV
 b2VjJHohMzT6G+/gEVQKwoGu7iBuU9zAilMkTal3L6fzErrG
X-Google-Smtp-Source: APXvYqxBtgpBDe6GetQ1LkAJ95G+0MLSgVJj1ZlffQlRsU/gy09LNV9oamAfIrswACaI1WBRzGA/KiG0AmyFOpKmSXnH4nhe0XDO
MIME-Version: 1.0
X-Received: by 2002:a5d:8b0c:: with SMTP id k12mr10971583ion.115.1573229714011; 
 Fri, 08 Nov 2019 08:15:14 -0800 (PST)
Date: Fri, 08 Nov 2019 08:15:14 -0800
In-Reply-To: <CACT4Y+bOy+OOp2h=jNYJB8xBhQ9x_=MEgP-XcU7KHs7v1v0YPA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000040fb360596d81689@google.com>
Subject: Re: Re: KMSAN: uninit-value in kernel_sendmsg
From: syzbot <syzbot+4b6f070bb7a8ea5420d4@syzkaller.appspotmail.com>
To: Dmitry Vyukov <dvyukov@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191108_081516_294394_DC729E72 
X-CRM114-Status: GOOD (  12.11  )
X-Spam-Score: 0.6 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.6 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.197 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
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
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
 dhowells@redhat.com, glider@google.com, davem@davemloft.net,
 dvyukov@google.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

> On Fri, Nov 8, 2019 at 4:54 PM syzbot
> <syzbot+4b6f070bb7a8ea5420d4@syzkaller.appspotmail.com> wrote:

>> Hello,

>> syzbot found the following crash on:

>> HEAD commit:    124037e0 kmsan: drop inlines, rename  
>> do_kmsan_task_create()
>> git tree:       https://github.com/google/kmsan.git master
>> console output: https://syzkaller.appspot.com/x/log.txt?x=1648eb9d600000
>> kernel config:   
>> https://syzkaller.appspot.com/x/.config?x=f03c659d0830ab8d
>> dashboard link:  
>> https://syzkaller.appspot.com/bug?extid=4b6f070bb7a8ea5420d4
>> compiler:       clang version 9.0.0 (/home/glider/llvm/clang
>> 80fee25776c2fb61e74c1ecb1a523375c2500b69)

>> Unfortunately, I don't have any reproducer for this crash yet.

>> IMPORTANT: if you fix the bug, please add the following tag to the  
>> commit:
>> Reported-by: syzbot+4b6f070bb7a8ea5420d4@syzkaller.appspotmail.com

> I think this is:

> #syz dup: KMSAN: use-after-free in rxrpc_send_keepalive

Can't dup bug to a bug in different reporting (upstream->moderation).Please  
dup syzbot bugs only onto syzbot bugs for the same kernel/reporting.


> https://syzkaller.appspot.com/bug?id=428e72dc175d0f4b23a1fb9b7d3d16fad7ef2a4b

>> =====================================================
>> BUG: KMSAN: uninit-value in rxrpc_send_keepalive+0x2fa/0x830
>> net/rxrpc/output.c:655
>> CPU: 0 PID: 3367 Comm: kworker/0:2 Not tainted 5.3.0-rc7+ #0
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
>> Google 01/01/2011
>> Workqueue: krxrpcd rxrpc_peer_keepalive_worker
>> Call Trace:
>>    __dump_stack lib/dump_stack.c:77 [inline]
>>    dump_stack+0x191/0x1f0 lib/dump_stack.c:113
>>    kmsan_report+0x13a/0x2b0 mm/kmsan/kmsan_report.c:108
>>    __msan_warning+0x73/0xe0 mm/kmsan/kmsan_instr.c:250
>>    sock_sendmsg_nosec net/socket.c:637 [inline]
>>    sock_sendmsg net/socket.c:657 [inline]
>>    kernel_sendmsg+0x2c9/0x440 net/socket.c:677
>>    rxrpc_send_keepalive+0x2fa/0x830 net/rxrpc/output.c:655
>>    rxrpc_peer_keepalive_dispatch net/rxrpc/peer_event.c:369 [inline]
>>    rxrpc_peer_keepalive_worker+0xb82/0x1510 net/rxrpc/peer_event.c:430
>>    process_one_work+0x1572/0x1ef0 kernel/workqueue.c:2269
>>    worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
>>    kthread+0x4b5/0x4f0 kernel/kthread.c:256
>>    ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355

>> Uninit was created at:
>>    kmsan_save_stack_with_flags mm/kmsan/kmsan.c:150 [inline]
>>    kmsan_internal_poison_shadow+0x53/0x100 mm/kmsan/kmsan.c:134
>>    kmsan_slab_alloc+0xaa/0x120 mm/kmsan/kmsan_hooks.c:103
>>    slab_alloc_node mm/slub.c:2790 [inline]
>>    slab_alloc mm/slub.c:2799 [inline]
>>    kmem_cache_alloc_trace+0x8c5/0xd20 mm/slub.c:2816
>>    kmalloc include/linux/slab.h:552 [inline]
>>    __hw_addr_create_ex net/core/dev_addr_lists.c:30 [inline]
>>    __hw_addr_add_ex net/core/dev_addr_lists.c:76 [inline]
>>    __hw_addr_add net/core/dev_addr_lists.c:84 [inline]
>>    dev_addr_init+0x152/0x700 net/core/dev_addr_lists.c:464
>>    alloc_netdev_mqs+0x2a9/0x1650 net/core/dev.c:9150
>>    rtnl_create_link+0x559/0x1190 net/core/rtnetlink.c:2931
>>    __rtnl_newlink net/core/rtnetlink.c:3186 [inline]
>>    rtnl_newlink+0x2757/0x38d0 net/core/rtnetlink.c:3254
>>    rtnetlink_rcv_msg+0x115a/0x1580 net/core/rtnetlink.c:5223
>>    netlink_rcv_skb+0x431/0x620 net/netlink/af_netlink.c:2477
>>    rtnetlink_rcv+0x50/0x60 net/core/rtnetlink.c:5241
>>    netlink_unicast_kernel net/netlink/af_netlink.c:1302 [inline]
>>    netlink_unicast+0xf6c/0x1050 net/netlink/af_netlink.c:1328
>>    netlink_sendmsg+0x110f/0x1330 net/netlink/af_netlink.c:1917
>>    sock_sendmsg_nosec net/socket.c:637 [inline]
>>    sock_sendmsg net/socket.c:657 [inline]
>>    ___sys_sendmsg+0x14ff/0x1590 net/socket.c:2311
>>    __sys_sendmsg net/socket.c:2356 [inline]
>>    __do_sys_sendmsg net/socket.c:2365 [inline]
>>    __se_sys_sendmsg+0x305/0x460 net/socket.c:2363
>>    __x64_sys_sendmsg+0x4a/0x70 net/socket.c:2363
>>    do_syscall_64+0xbc/0xf0 arch/x86/entry/common.c:297
>>    entry_SYSCALL_64_after_hwframe+0x63/0xe7
>> =====================================================


>> ---
>> This bug is generated by a bot. It may contain errors.
>> See https://goo.gl/tpsmEJ for more information about syzbot.
>> syzbot engineers can be reached at syzkaller@googlegroups.com.

>> syzbot will keep track of this bug report. See:
>> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

>> --
>> You received this message because you are subscribed to the Google  
>> Groups "syzkaller-bugs" group.
>> To unsubscribe from this group and stop receiving emails from it, send  
>> an email to syzkaller-bugs+unsubscribe@googlegroups.com.
>> To view this discussion on the web visit  
>> https://groups.google.com/d/msgid/syzkaller-bugs/000000000000e3a8e00596d7ca32%40google.com.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
