Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 096D0151517
	for <lists+linux-afs@lfdr.de>; Tue,  4 Feb 2020 05:44:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=4kTkY7nfFn0XPASmIpHXbDKdyFO6xgiI4Ob1JLZes68=; b=iwF
	Olumv14SYxyj+8DnA2MMFoRCdRc5ize4uh5S0hcCWSzJpkul2tdRb9TGvOUPkU7AeSzLYneVYP70t
	dAWk9Ro8kkfCZieEHfvnIgLjBv7vG+gr7zmxOTcrHK0dkxnI2rM8A1Nb3LASNyxayBStuiTdmcVTz
	RWbYqbnZ1PRJylVE2XOZsXZvTdnrY0f0mhJQblLN+E4R1R4eOY5BMX2mfGlrkYfTACe7ik3gSpSo8
	Ri26ExhOf2oeECnpLrmfq+CX7/JgS1HRmfwsRy5j1c6v2C4yZkm+dlKOwE1dxtrO3bEFhrr8yqE6G
	W/D20VvgnYz8oELD6Dmvmf72KeLlXXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyq4P-0007XB-4e; Tue, 04 Feb 2020 04:44:17 +0000
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyq4L-0007Wm-Jf
 for linux-afs@lists.infradead.org; Tue, 04 Feb 2020 04:44:15 +0000
Received: by mail-il1-f197.google.com with SMTP id z12so13864713ilh.17
 for <linux-afs@lists.infradead.org>; Mon, 03 Feb 2020 20:44:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=jRe8qrWGxPKQWY41/zu2j+Y/gBhuuZ/+yT0Q+9l46Ak=;
 b=cvoqp6MBuKmf44QH1Kv+1U1SPJRiY1valTtVD4HWYiEtjTZXa198KUmPdOL+G7ibG2
 ETK8XsEMET3IEdUNB1axx9/EdMFd/MbUaRUhI1fLABz+3m7y9SGeX+9DgGQjn9NEgkhA
 yQJY7m/pFAE3jvGAZRksrKZCGa2TnNrjNZBfvjMbCFn7CxVLMlia9ZpuwDO7VXdA+utQ
 f2n7drKBRBdVX73JNcBCfHv968hJHRFN+GDO01VGSwVnyACkgG9ztbTIKrp+wqcOfo3w
 vBSHZG4OUS/e23QU9Em3Mf2EC1sWMn5YEX2d63xWh9grXMHrOXJYJZcAWAg9ab3zEOFH
 9ueg==
X-Gm-Message-State: APjAAAWRBv4Zxk/7jZcM63Adm4yLwsnL0pGH4gHIXtSayAFa3cDIRRiU
 Gtd7SD4mJRvepn/28hGa+aSyPd4ARFEQsHtW1+QGUxm5qdDQ
X-Google-Smtp-Source: APXvYqw8/Qj6d9DgZUV/SQanv0mSz+xrmjlyEfawNPpO4Cjy5AN/5l6u9Ggix/hrdw5FzxEloH1Lh8ZALC0cu0D/8K/0lQXHQecn
MIME-Version: 1.0
X-Received: by 2002:a92:1a12:: with SMTP id a18mr24842227ila.10.1580791451661; 
 Mon, 03 Feb 2020 20:44:11 -0800 (PST)
Date: Mon, 03 Feb 2020 20:44:11 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f0baeb059db8b055@google.com>
Subject: inconsistent lock state in rxrpc_put_client_connection_id
From: syzbot <syzbot+d82f3ac8d87e7ccbb2c9@syzkaller.appspotmail.com>
To: davem@davemloft.net, dhowells@redhat.com, kuba@kernel.org, 
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_204413_650436_CA96F645 
X-CRM114-Status: UNSURE (   5.94  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 3.1 (+++)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (3.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.197 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hello,

syzbot found the following crash on:

HEAD commit:    3d80c653 Merge tag 'rxrpc-fixes-20200203' of git://git.ker..
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=165dbda5e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=95b275782b150c86
dashboard link: https://syzkaller.appspot.com/bug?extid=d82f3ac8d87e7ccbb2c9
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+d82f3ac8d87e7ccbb2c9@syzkaller.appspotmail.com

================================
WARNING: inconsistent lock state
5.5.0-syzkaller #0 Not tainted
--------------------------------
inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
syz-executor.3/9477 [HC0[0]:SC1[1]:HE1:SE0] takes:
ffffffff8a8b6e38 (rxrpc_conn_id_lock){+.?.}, at: spin_lock include/linux/spinlock.h:338 [inline]
ffffffff8a8b6e38 (rxrpc_conn_id_lock){+.?.}, at: rxrpc_put_client_connection_id net/rxrpc/conn_client.c:138 [inline]
ffffffff8a8b6e38 (rxrpc_conn_id_lock){+.?.}, at: rxrpc_put_client_connection_id+0x73/0xe0 net/rxrpc/conn_client.c:135
{SOFTIRQ-ON-W} state was registered at:
  lock_acquire+0x190/0x410 kernel/locking/lockdep.c:4484
  __raw_spin_lock include/linux/spinlock_api_smp.h:142 [inline]
  _raw_spin_lock+0x2f/0x40 kernel/locking/spinlock.c:151
  spin_lock include/linux/spinlock.h:338 [inline]
  rxrpc_get_client_connection_id net/rxrpc/conn_client.c:109 [inline]
  rxrpc_alloc_client_connection net/rxrpc/conn_client.c:193 [inline]
  rxrpc_get_client_conn net/rxrpc/conn_client.c:340 [inline]
  rxrpc_connect_call+0x954/0x4e30 net/rxrpc/conn_client.c:701
  rxrpc_new_client_call+0x9c0/0x1ad0 net/rxrpc/call_object.c:290
  rxrpc_new_client_call_for_sendmsg net/rxrpc/sendmsg.c:595 [inline]
  rxrpc_do_sendmsg+0xffa/0x1d5f net/rxrpc/sendmsg.c:652
  rxrpc_sendmsg+0x4d6/0x5f0 net/rxrpc/af_rxrpc.c:586
  sock_sendmsg_nosec net/socket.c:652 [inline]
  sock_sendmsg+0xd7/0x130 net/socket.c:672
  ____sys_sendmsg+0x358/0x880 net/socket.c:2343
  ___sys_sendmsg+0x100/0x170 net/socket.c:2397
  __sys_sendmmsg+0x1bf/0x4d0 net/socket.c:2487
  __do_sys_sendmmsg net/socket.c:2516 [inline]
  __se_sys_sendmmsg net/socket.c:2513 [inline]
  __x64_sys_sendmmsg+0x9d/0x100 net/socket.c:2513
  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
irq event stamp: 13994944
hardirqs last  enabled at (13994944): [<ffffffff87e8d446>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:160 [inline]
hardirqs last  enabled at (13994944): [<ffffffff87e8d446>] _raw_spin_unlock_irqrestore+0x66/0xe0 kernel/locking/spinlock.c:191
hardirqs last disabled at (13994943): [<ffffffff87e8d7bf>] __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:108 [inline]
hardirqs last disabled at (13994943): [<ffffffff87e8d7bf>] _raw_spin_lock_irqsave+0x6f/0xcd kernel/locking/spinlock.c:159
softirqs last  enabled at (13994502): [<ffffffff882006cd>] __do_softirq+0x6cd/0x98c kernel/softirq.c:319
softirqs last disabled at (13994915): [<ffffffff81477d5b>] invoke_softirq kernel/softirq.c:373 [inline]
softirqs last disabled at (13994915): [<ffffffff81477d5b>] irq_exit+0x19b/0x1e0 kernel/softirq.c:413

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(rxrpc_conn_id_lock);
  <Interrupt>
    lock(rxrpc_conn_id_lock);

 *** DEADLOCK ***

3 locks held by syz-executor.3/9477:
 #0: ffff888098c32428 (sb_writers#3){.+.+}, at: sb_start_write include/linux/fs.h:1650 [inline]
 #0: ffff888098c32428 (sb_writers#3){.+.+}, at: mnt_want_write+0x3f/0xc0 fs/namespace.c:354
 #1: ffff8880aa0605c8 (&type->i_mutex_dir_key#3/1){+.+.}, at: inode_lock_nested include/linux/fs.h:826 [inline]
 #1: ffff8880aa0605c8 (&type->i_mutex_dir_key#3/1){+.+.}, at: filename_create+0x17c/0x4f0 fs/namei.c:3708
 #2: ffffffff89babe80 (rcu_callback){....}, at: rcu_do_batch kernel/rcu/tree.c:2176 [inline]
 #2: ffffffff89babe80 (rcu_callback){....}, at: rcu_core+0x562/0x1390 kernel/rcu/tree.c:2410

stack backtrace:
CPU: 0 PID: 9477 Comm: syz-executor.3 Not tainted 5.5.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x197/0x210 lib/dump_stack.c:118
 print_usage_bug.cold+0x327/0x378 kernel/locking/lockdep.c:3100
 valid_state kernel/locking/lockdep.c:3111 [inline]
 mark_lock_irq kernel/locking/lockdep.c:3308 [inline]
 mark_lock+0xbb4/0x1220 kernel/locking/lockdep.c:3665
 mark_usage kernel/locking/lockdep.c:3565 [inline]
 __lock_acquire+0x1e8e/0x4a00 kernel/locking/lockdep.c:3908
 lock_acquire+0x190/0x410 kernel/locking/lockdep.c:4484
 __raw_spin_lock include/linux/spinlock_api_smp.h:142 [inline]
 _raw_spin_lock+0x2f/0x40 kernel/locking/spinlock.c:151
 spin_lock include/linux/spinlock.h:338 [inline]
 rxrpc_put_client_connection_id net/rxrpc/conn_client.c:138 [inline]
 rxrpc_put_client_connection_id+0x73/0xe0 net/rxrpc/conn_client.c:135
 rxrpc_put_one_client_conn net/rxrpc/conn_client.c:955 [inline]
 rxrpc_put_client_conn+0x243/0xc90 net/rxrpc/conn_client.c:1001
 rxrpc_put_connection net/rxrpc/ar-internal.h:965 [inline]
 rxrpc_rcu_destroy_call+0xbd/0x200 net/rxrpc/call_object.c:572
 rcu_do_batch kernel/rcu/tree.c:2186 [inline]
 rcu_core+0x5e1/0x1390 kernel/rcu/tree.c:2410
 rcu_core_si+0x9/0x10 kernel/rcu/tree.c:2419
 __do_softirq+0x262/0x98c kernel/softirq.c:292
 invoke_softirq kernel/softirq.c:373 [inline]
 irq_exit+0x19b/0x1e0 kernel/softirq.c:413
 exiting_irq arch/x86/include/asm/apic.h:536 [inline]
 smp_apic_timer_interrupt+0x1a3/0x610 arch/x86/kernel/apic/apic.c:1137
 apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:829
 </IRQ>
RIP: 0010:find_get_entry+0x4a6/0x7a0 mm/filemap.c:1526
Code: 84 db 0f 84 20 02 00 00 e8 d7 c7 e1 ff e8 02 01 cf ff e8 cd c7 e1 ff 48 c7 c6 74 ae 93 81 48 c7 c7 40 bf ba 89 e8 da 5f c7 ff <48> b8 00 00 00 00 00 fc ff df 48 03 85 20 ff ff ff 48 c7 00 00 00
RSP: 0018:ffffc900020b78c8 EFLAGS: 00000296 ORIG_RAX: ffffffffffffff13
RAX: 0000000000000000 RBX: 0000000000000001 RCX: 1ffff1100cf70539
RDX: dffffc0000000000 RSI: 1ffff1100cf70545 RDI: 0000000000000286
RBP: ffffc900020b79b0 R08: 0000000000000003 R09: ffff888067b829d0
R10: fffffbfff1547c10 R11: ffffffff8aa3e087 R12: ffffea00017f46c0
R13: ffffea00017f46c0 R14: ffffc900020b7988 R15: 0000000000000000
 pagecache_get_page+0x4c/0x9e0 mm/filemap.c:1635
 find_get_page_flags include/linux/pagemap.h:266 [inline]
 __find_get_block_slow fs/buffer.c:210 [inline]
 __find_get_block fs/buffer.c:1336 [inline]
 __find_get_block+0x531/0xea0 fs/buffer.c:1330
 sb_find_get_block include/linux/buffer_head.h:338 [inline]
 recently_deleted fs/ext4/ialloc.c:677 [inline]
 find_inode_bit.isra.0+0x202/0x520 fs/ext4/ialloc.c:717
 __ext4_new_inode+0x16eb/0x4fa0 fs/ext4/ialloc.c:909
 ext4_mkdir+0x3d5/0xe20 fs/ext4/namei.c:2776
 vfs_mkdir+0x42e/0x670 fs/namei.c:3889
 do_mkdirat+0x234/0x2a0 fs/namei.c:3912
 __do_sys_mkdir fs/namei.c:3928 [inline]
 __se_sys_mkdir fs/namei.c:3926 [inline]
 __x64_sys_mkdir+0x5c/0x80 fs/namei.c:3926
 do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45a7b7
Code: 1f 40 00 b8 5a 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 7d c2 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 b8 53 00 00 00 0f 05 <48> 3d 01 f0 ff ff 0f 83 5d c2 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007fff189fccb8 EFLAGS: 00000206 ORIG_RAX: 0000000000000053
RAX: ffffffffffffffda RBX: 0000000000114fb1 RCX: 000000000045a7b7
RDX: 00007fff189fcd06 RSI: 00000000000001ff RDI: 00007fff189fcd00
RBP: 0000000000001369 R08: 0000000000000000 R09: 0000000000000006
R10: 0000000000000064 R11: 0000000000000206 R12: 0000000000000006
R13: 00007fff189fccf0 R14: 0000000000114f37 R15: 00007fff189fcd00


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
