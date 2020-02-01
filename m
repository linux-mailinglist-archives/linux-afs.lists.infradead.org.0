Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF6A15172F
	for <lists+linux-afs@lfdr.de>; Tue,  4 Feb 2020 09:51:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ILUqd/TFz17ZmJ3irqgnDb48J4ea60dH/NrKMDMIa6s=; b=kifPwARrYiqhUF
	FDOeHeDvusLtu60mz+5VXoA4TLuYWjUhNQRIKHUD246pZmIuGUSL45wnV+jL1yBxcnPE6BRZNlbqx
	7/34fzSSgD13Z4W3t2DnXvpgUR9W8EW0b1O/mYdX82whWS11z1cUijPymPYv8UyVYAcGD56KX7mKB
	784QcrtqTfKw2GjMqUnbRTJyxMtTD+SqpQCzpfOvdeVoYLxZxUSXJ8GBVEMt/7VsZMUIiVXJ7ewX7
	oCqQ5zcN+4LuiUabaJ1z73lv0mF6pjZISpnIkoteu90+zHsNyKiYxM+mFRHa0iUDWnTjxh767OWF7
	PpjFuOfGN+Ur8N5lakDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iytvO-0003pJ-9u; Tue, 04 Feb 2020 08:51:14 +0000
Received: from r3-22.sinamail.sina.com.cn ([202.108.3.22])
 by bombadil.infradead.org with smtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixjtn-0000H2-1Y
 for linux-afs@lists.infradead.org; Sat, 01 Feb 2020 03:56:50 +0000
Received: from unknown (HELO localhost.localdomain)([124.64.3.106])
 by sina.com with ESMTP
 id 5E34F65C0002EDAF; Sat, 1 Feb 2020 11:54:07 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 256950628917
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+07d716baf0187672bc35@syzkaller.appspotmail.com>
Subject: Re: INFO: task hung in rxrpc_release
Date: Sat,  1 Feb 2020 11:53:54 +0800
Message-Id: <20200201035354.13300-1-hdanton@sina.com>
MIME-Version: 1.0
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200131_195647_273997_4C6C2316 
X-CRM114-Status: UNSURE (   7.29  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [hdanton[at]sina.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.22 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Mailman-Approved-At: Tue, 04 Feb 2020 00:51:13 -0800
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
Cc: Hillf Danton <hdanton@sina.com>, netdev@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-afs@lists.infradead.org, dhowells@redhat.com, kuba@kernel.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


Fri, 31 Jan 2020 10:07:13 -0800 (PST)
> syzbot found the following crash on:
> 
> HEAD commit:    9f68e365 Merge tag 'drm-next-2020-01-30' of git://anongit...
> git tree:       net-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=11c8c776e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=95b275782b150c86
> dashboard link: https://syzkaller.appspot.com/bug?extid=07d716baf0187672bc35
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> 
> Unfortunately, I don't have any reproducer for this crash yet.
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+07d716baf0187672bc35@syzkaller.appspotmail.com
> 
> INFO: task kworker/u4:7:432 blocked for more than 143 seconds.
>       Not tainted 5.5.0-syzkaller #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> kworker/u4:7    D26824   432      2 0x80004000
> Workqueue: netns cleanup_net
> Call Trace:
>  context_switch kernel/sched/core.c:3386 [inline]
>  __schedule+0x934/0x1f90 kernel/sched/core.c:4082
>  schedule+0xdc/0x2b0 kernel/sched/core.c:4156
>  schedule_timeout+0x717/0xc50 kernel/time/timer.c:1871
>  do_wait_for_common kernel/sched/completion.c:83 [inline]
>  __wait_for_common kernel/sched/completion.c:104 [inline]
>  wait_for_common kernel/sched/completion.c:115 [inline]
>  wait_for_completion+0x29c/0x440 kernel/sched/completion.c:136
>  flush_workqueue+0x40a/0x14c0 kernel/workqueue.c:2827
>  rxrpc_release_sock net/rxrpc/af_rxrpc.c:898 [inline]
>  rxrpc_release+0x2b2/0x5b0 net/rxrpc/af_rxrpc.c:927
>  __sock_release+0x1d5/0x280 net/socket.c:605
>  sock_release+0x18/0x20 net/socket.c:625
>  afs_close_socket+0x1db/0x350 fs/afs/rxrpc.c:128
>  afs_net_exit+0x1cd/0x320 fs/afs/main.c:151
>  ops_exit_list.isra.0+0xb1/0x160 net/core/net_namespace.c:172
>  cleanup_net+0x549/0xb10 net/core/net_namespace.c:589
>  process_one_work+0xa05/0x17a0 kernel/workqueue.c:2264
>  worker_thread+0x98/0xe40 kernel/workqueue.c:2410
>  kthread+0x361/0x430 kernel/kthread.c:255
>  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> INFO: task syz-executor.4:15978 blocked for more than 143 seconds.
>       Not tainted 5.5.0-syzkaller #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> syz-executor.4  D28240 15978   9813 0x00004004
> Call Trace:
>  context_switch kernel/sched/core.c:3386 [inline]
>  __schedule+0x934/0x1f90 kernel/sched/core.c:4082
>  schedule+0xdc/0x2b0 kernel/sched/core.c:4156
>  schedule_timeout+0x717/0xc50 kernel/time/timer.c:1871
>  do_wait_for_common kernel/sched/completion.c:83 [inline]
>  __wait_for_common kernel/sched/completion.c:104 [inline]
>  wait_for_common kernel/sched/completion.c:115 [inline]
>  wait_for_completion+0x29c/0x440 kernel/sched/completion.c:136
>  __flush_work+0x4fe/0xa50 kernel/workqueue.c:3041
>  __cancel_work_timer+0x3d9/0x540 kernel/workqueue.c:3128
>  cancel_delayed_work_sync+0x1b/0x20 kernel/workqueue.c:3260
>  htable_destroy net/netfilter/xt_hashlimit.c:406 [inline]
>  htable_put+0x15f/0x220 net/netfilter/xt_hashlimit.c:435
>  hashlimit_mt_destroy+0x56/0x70 net/netfilter/xt_hashlimit.c:971
>  cleanup_match+0xde/0x170 net/ipv6/netfilter/ip6_tables.c:478
>  find_check_entry.isra.0+0x454/0x920 net/ipv4/netfilter/ip_tables.c:564
>  translate_table+0xcb4/0x17d0 net/ipv4/netfilter/ip_tables.c:717
>  do_replace net/ipv4/netfilter/ip_tables.c:1136 [inline]
>  do_ipt_set_ctl+0x2fe/0x4c2 net/ipv4/netfilter/ip_tables.c:1672
>  nf_sockopt net/netfilter/nf_sockopt.c:106 [inline]
>  nf_setsockopt+0x77/0xd0 net/netfilter/nf_sockopt.c:115
>  ip_setsockopt net/ipv4/ip_sockglue.c:1260 [inline]
>  ip_setsockopt+0xdf/0x100 net/ipv4/ip_sockglue.c:1240
>  tcp_setsockopt net/ipv4/tcp.c:3159 [inline]
>  tcp_setsockopt+0x8f/0xe0 net/ipv4/tcp.c:3153
>  sock_common_setsockopt+0x94/0xd0 net/core/sock.c:3149
>  __sys_setsockopt+0x261/0x4c0 net/socket.c:2130
>  __do_sys_setsockopt net/socket.c:2146 [inline]
>  __se_sys_setsockopt net/socket.c:2143 [inline]
>  __x64_sys_setsockopt+0xbe/0x150 net/socket.c:2143
>  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
>  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x45b349
> Code: Bad RIP value.
> RSP: 002b:00007f59d07ddc78 EFLAGS: 00000246 ORIG_RAX: 0000000000000036
> RAX: ffffffffffffffda RBX: 00007f59d07de6d4 RCX: 000000000045b349
> RDX: 0000000000000040 RSI: 0004000000000000 RDI: 0000000000000004
> RBP: 000000000075c118 R08: 0000000000000400 R09: 0000000000000000
> R10: 0000000020000e00 R11: 0000000000000246 R12: 00000000ffffffff
> R13: 0000000000000a02 R14: 00000000004cb5e1 R15: 000000000075c124
> 
> Showing all locks held in the system:
> 4 locks held by kworker/u4:4/218:
>  #0: ffff8880ae837558 (&rq->lock){-.-.}, at: rq_lock kernel/sched/sched.h:1215 [inline]
>  #0: ffff8880ae837558 (&rq->lock){-.-.}, at: __schedule+0x232/0x1f90 kernel/sched/core.c:4030
>  #1: ffffffff89babf40 (rcu_read_lock){....}, at: trace_sched_stat_runtime include/trace/events/sched.h:435 [inline]
>  #1: ffffffff89babf40 (rcu_read_lock){....}, at: update_curr+0x2ea/0x8d0 kernel/sched/fair.c:859
>  #2: ffff8880ae827418 (&base->lock){-.-.}, at: lock_timer_base+0x56/0x1b0 kernel/time/timer.c:936
>  #3: ffffffff8ba6ac60 (&obj_hash[i].lock){-.-.}, at: debug_object_activate+0x131/0x470 lib/debugobjects.c:636
> 3 locks held by kworker/u4:7/432:
>  #0: ffff88821b044128 ((wq_completion)netns){+.+.}, at: __write_once_size include/linux/compiler.h:226 [inline]
>  #0: ffff88821b044128 ((wq_completion)netns){+.+.}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
>  #0: ffff88821b044128 ((wq_completion)netns){+.+.}, at: atomic64_set include/asm-generic/atomic-instrumented.h:855 [inline]
>  #0: ffff88821b044128 ((wq_completion)netns){+.+.}, at: atomic_long_set include/asm-generic/atomic-long.h:40 [inline]
>  #0: ffff88821b044128 ((wq_completion)netns){+.+.}, at: set_work_data kernel/workqueue.c:615 [inline]
>  #0: ffff88821b044128 ((wq_completion)netns){+.+.}, at: set_work_pool_and_clear_pending kernel/workqueue.c:642 [inline]
>  #0: ffff88821b044128 ((wq_completion)netns){+.+.}, at: process_one_work+0x8dd/0x17a0 kernel/workqueue.c:2235
>  #1: ffffc90002677dc0 (net_cleanup_work){+.+.}, at: process_one_work+0x917/0x17a0 kernel/workqueue.c:2239
>  #2: ffffffff8a727fc8 (pernet_ops_rwsem){++++}, at: cleanup_net+0xa1/0xb10 net/core/net_namespace.c:551
> 1 lock held by khungtaskd/1107:
>  #0: ffffffff89babf40 (rcu_read_lock){....}, at: debug_show_all_locks+0x5f/0x279 kernel/locking/lockdep.c:5333
> 1 lock held by khugepaged/1139:
>  #0: ffffffff89c50fe0 (pcpu_drain_mutex){+.+.}, at: drain_all_pages+0x4d/0x5d0 mm/page_alloc.c:2902
> 1 lock held by rsyslogd/9673:
>  #0: ffff8880879e3860 (&f->f_pos_lock){+.+.}, at: __fdget_pos+0xee/0x110 fs/file.c:821
> 2 locks held by getty/9763:
>  #0: ffff88809dec3090 (&tty->ldisc_sem){++++}, at: ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
>  #1: ffffc9000191f2e0 (&ldata->atomic_read_lock){+.+.}, at: n_tty_read+0x220/0x1bf0 drivers/tty/n_tty.c:2156
> 2 locks held by getty/9764:
>  #0: ffff88809ee49090 (&tty->ldisc_sem){++++}, at: ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
>  #1: ffffc9000199b2e0 (&ldata->atomic_read_lock){+.+.}, at: n_tty_read+0x220/0x1bf0 drivers/tty/n_tty.c:2156
> 2 locks held by getty/9765:
>  #0: ffff8880a20dd090 (&tty->ldisc_sem){++++}, at: ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
>  #1: ffffc9000197b2e0 (&ldata->atomic_read_lock){+.+.}, at: n_tty_read+0x220/0x1bf0 drivers/tty/n_tty.c:2156
> 2 locks held by getty/9766:
>  #0: ffff888091b8a090 (&tty->ldisc_sem){++++}, at: ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
>  #1: ffffc9000198b2e0 (&ldata->atomic_read_lock){+.+.}, at: n_tty_read+0x220/0x1bf0 drivers/tty/n_tty.c:2156
> 2 locks held by getty/9767:
>  #0: ffff88809ee41090 (&tty->ldisc_sem){++++}, at: ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
>  #1: ffffc900019ab2e0 (&ldata->atomic_read_lock){+.+.}, at: n_tty_read+0x220/0x1bf0 drivers/tty/n_tty.c:2156
> 2 locks held by getty/9768:
>  #0: ffff88809fd08090 (&tty->ldisc_sem){++++}, at: ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
>  #1: ffffc900019232e0 (&ldata->atomic_read_lock){+.+.}, at: n_tty_read+0x220/0x1bf0 drivers/tty/n_tty.c:2156
> 2 locks held by getty/9769:
>  #0: ffff888092172090 (&tty->ldisc_sem){++++}, at: ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
>  #1: ffffc900018fb2e0 (&ldata->atomic_read_lock){+.+.}, at: n_tty_read+0x220/0x1bf0 drivers/tty/n_tty.c:2156
> 1 lock held by syz-executor.4/15978:
>  #0: ffffffff8a7b80a0 (hashlimit_mutex){+.+.}, at: htable_put+0x21/0x220 net/netfilter/xt_hashlimit.c:432
> 2 locks held by kworker/0:3/16041:
> 
> =============================================
> 
> NMI backtrace for cpu 1
> CPU: 1 PID: 1107 Comm: khungtaskd Not tainted 5.5.0-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x197/0x210 lib/dump_stack.c:118
>  nmi_cpu_backtrace.cold+0x70/0xb2 lib/nmi_backtrace.c:101
>  nmi_trigger_cpumask_backtrace+0x23b/0x28b lib/nmi_backtrace.c:62
>  arch_trigger_cpumask_backtrace+0x14/0x20 arch/x86/kernel/apic/hw_nmi.c:38
>  trigger_all_cpu_backtrace include/linux/nmi.h:146 [inline]
>  check_hung_uninterruptible_tasks kernel/hung_task.c:205 [inline]
>  watchdog+0xb11/0x10c0 kernel/hung_task.c:289
>  kthread+0x361/0x430 kernel/kthread.c:255
>  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> Sending NMI from CPU 1 to CPUs 0:
> NMI backtrace for cpu 0
> CPU: 0 PID: 16041 Comm: kworker/0:3 Not tainted 5.5.0-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Workqueue: events_power_efficient htable_gc
> RIP: 0010:lock_is_held_type+0x27e/0x320 kernel/locking/lockdep.c:4526
> Code: 48 c1 e8 03 80 3c 10 00 0f 85 88 00 00 00 48 83 3d 0e 3a 59 08 00 74 31 48 8b 7d c0 57 9d 0f 1f 44 00 00 48 83 c4 20 44 89 e0 <5b> 41 5c 41 5d 41 5e 41 5f 5d c3 45 31 e4 e9 6e ff ff ff 41 bc 01
> RSP: 0018:ffffc9000194fc38 EFLAGS: 00000282
> RAX: 0000000000000000 RBX: ffff88805ad1a000 RCX: ffff88805ad1a898
> RDX: dffffc0000000000 RSI: ffffffff89babec0 RDI: 0000000000000286
> RBP: ffffc9000194fc60 R08: 1ffffffff169f59e R09: fffffbfff169f59f
> R10: fffffbfff169f59e R11: ffffffff8b4facf7 R12: 0000000000000000
> R13: ffff88805ad1a8c0 R14: ffffffff89babec0 R15: 0000000000000002
> FS:  0000000000000000(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f59d08209e0 CR3: 000000008df0d000 CR4: 00000000001406f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  lock_is_held include/linux/lockdep.h:361 [inline]
>  ___might_sleep+0x205/0x2c0 kernel/sched/core.c:6765
>  htable_selective_cleanup+0x245/0x340 net/netfilter/xt_hashlimit.c:374
>  htable_gc+0x21/0xb0 net/netfilter/xt_hashlimit.c:384
>  process_one_work+0xa05/0x17a0 kernel/workqueue.c:2264
>  worker_thread+0x98/0xe40 kernel/workqueue.c:2410
>  kthread+0x361/0x430 kernel/kthread.c:255
>  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
=======
=======

> INFO: task syz-executor.4:15978 blocked for more than 143 seconds.
>       Not tainted 5.5.0-syzkaller #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> syz-executor.4  D28240 15978   9813 0x00004004
> Call Trace:
>  context_switch kernel/sched/core.c:3386 [inline]
>  __schedule+0x934/0x1f90 kernel/sched/core.c:4082
>  schedule+0xdc/0x2b0 kernel/sched/core.c:4156
>  schedule_timeout+0x717/0xc50 kernel/time/timer.c:1871
>  do_wait_for_common kernel/sched/completion.c:83 [inline]
>  __wait_for_common kernel/sched/completion.c:104 [inline]
>  wait_for_common kernel/sched/completion.c:115 [inline]
>  wait_for_completion+0x29c/0x440 kernel/sched/completion.c:136
>  __flush_work+0x4fe/0xa50 kernel/workqueue.c:3041
>  __cancel_work_timer+0x3d9/0x540 kernel/workqueue.c:3128
>  cancel_delayed_work_sync+0x1b/0x20 kernel/workqueue.c:3260
>  htable_destroy net/netfilter/xt_hashlimit.c:406 [inline]
>  htable_put+0x15f/0x220 net/netfilter/xt_hashlimit.c:435


Retry gc next tick to avoid blocking flusher in the above snippet
more than 100 seconds. Plus gc is no longer scheduled for dying htable.

--- a/net/netfilter/xt_hashlimit.c
+++ b/net/netfilter/xt_hashlimit.c
@@ -385,6 +385,9 @@ static void htable_selective_cleanup(str
 				dsthash_free(ht, dh);
 		}
 		spin_unlock_bh(&ht->lock);
+
+		if (select == select_gc && need_resched())
+			return;
 		cond_resched();
 	}
 }
@@ -397,8 +400,11 @@ static void htable_gc(struct work_struct
 
 	htable_selective_cleanup(ht, select_gc);
 
+	if (ht->use == 0)
+		return;
 	queue_delayed_work(system_power_efficient_wq,
-			   &ht->gc_work, msecs_to_jiffies(ht->cfg.gc_interval));
+			   &ht->gc_work,
+		need_resched() ? 1 : msecs_to_jiffies(ht->cfg.gc_interval));
 }
 
 static void htable_remove_proc_entry(struct xt_hashlimit_htable *hinfo)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
