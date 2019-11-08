Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C5FF51F5
	for <lists+linux-afs@lfdr.de>; Fri,  8 Nov 2019 18:04:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GTfE7HyVt+RqTBSvfm6PpRcWbBno5qiLXZw7VfoEzQA=; b=OYiyiS3MKkA6uo
	vi6wT2UEKgZCCDDSKfbTzV4/chbfMKh4L3mefmAALGNlR9pDRCkI70xajsXXzPd2/+1jK3F+ySCTi
	KDFcp3+78bAtdmCeUDC/wjQ2jd/h6soxvtV4Q1fQoXkzi0f8FuYQwNPRxPr96BwJEyfwZbsjhmkV2
	A3Dl40/ESQ53UvSq6/AmYyqrX5fz+Z/lnTaI2U5kPTgSl96nw0PccnxrOwNGl7LxgMpq4pC5rSEGI
	/gra5qZvkEvLP6Qb/GwdUyG4+3rq5FhvJ4UtaZYlvGN8QX64VavCh+F42WyYeIFX8nHYsAixRosjR
	MhblzrwY0uDQmE/TwCcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iT7gG-0007Uv-CY; Fri, 08 Nov 2019 17:04:16 +0000
Received: from mail-il1-f198.google.com ([209.85.166.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iT7gD-0007Sz-KP
 for linux-afs@lists.infradead.org; Fri, 08 Nov 2019 17:04:15 +0000
Received: by mail-il1-f198.google.com with SMTP id t23so7480640ila.19
 for <linux-afs@lists.infradead.org>; Fri, 08 Nov 2019 09:04:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=Qf6/971redFg5+hNvL72Agdhn9HP6mUxpqJ1caev7c4=;
 b=qL9h794117Ye0ZEcPBZLpobEqProCHfHDy5rehXerED4aFEN2aGkSqD1e0GuyZk43S
 NOQyFngQ96NUOLuTEk/aVr91XQT3cfqY/kKNSi51eL8Erb7dMjy23tFMAOeC4s/coGLS
 uF0KNrch7XyvMERcd7Ab6bMDF0iC1ZOwfdhYhaaSfWiwQ8ESGvt3vhKZEHcTI/Tvi10b
 5T3NBlJ6v7f6lMFH/jG641hCA+uUhVdRSZjbtnwp1WMJeDxIbV0n1oFToCOTlxgK6mNM
 9cgeRhT+9NP9VoDo5uThNjEZwLqrgg8dDxtSWOSn9ie9QdSDPY3w8iKkDJsCqaZC6j25
 E2Sw==
X-Gm-Message-State: APjAAAVBIIeGKJXwUuh1ddPMk7jDEqQmbaq1sMshgM0MDjYqKuWsMl/U
 eh974cU4xYryxGwb13bZWv7xrOyCMryyVIKl/vRgEDaQElCN
X-Google-Smtp-Source: APXvYqyQmUieY6KPbHUN5J96vU2WE/TqY+EHvMAdv6Rn77xwW31IsVLTeBCAUL6lDnbae9trKVf56uhf2kJ3gOe5Gj5kN6pHTyGF
MIME-Version: 1.0
X-Received: by 2002:a6b:6512:: with SMTP id z18mr10894907iob.282.1573232651747; 
 Fri, 08 Nov 2019 09:04:11 -0800 (PST)
Date: Fri, 08 Nov 2019 09:04:11 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005b4a6c0596d8c5a8@google.com>
Subject: KMSAN: use-after-free in rxrpc_send_keepalive
From: syzbot <syzbot+2e7168a4d3c4ec071fdc@syzkaller.appspotmail.com>
To: davem@davemloft.net, dhowells@redhat.com, glider@google.com, 
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191108_090413_670436_D0436AD8 
X-CRM114-Status: UNSURE (   3.95  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 3.1 (+++)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (3.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.198 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hello,

syzbot found the following crash on:

HEAD commit:    c38191cb kmsan: fixed unaligned origin handling in kmsan_m..
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=10c518e3600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=49548798e87d32d7
dashboard link: https://syzkaller.appspot.com/bug?extid=2e7168a4d3c4ec071fdc
compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
80fee25776c2fb61e74c1ecb1a523375c2500b69)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13c4fec7600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+2e7168a4d3c4ec071fdc@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: use-after-free in rxrpc_peer_keepalive_dispatch  
net/rxrpc/peer_event.c:369 [inline]
BUG: KMSAN: use-after-free in rxrpc_peer_keepalive_worker+0xb82/0x1510  
net/rxrpc/peer_event.c:430
CPU: 1 PID: 3995 Comm: kworker/1:2 Not tainted 5.4.0-rc2+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: krxrpcd rxrpc_peer_keepalive_worker
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x191/0x1f0 lib/dump_stack.c:113
  kmsan_report+0x153/0x2c0 mm/kmsan/kmsan_report.c:113
  __msan_warning+0x73/0xe0 mm/kmsan/kmsan_instr.c:250
  rxrpc_send_keepalive+0x53c/0x830 net/rxrpc/output.c:634
  rxrpc_peer_keepalive_dispatch net/rxrpc/peer_event.c:369 [inline]
  rxrpc_peer_keepalive_worker+0xb82/0x1510 net/rxrpc/peer_event.c:430
  process_one_work+0x1572/0x1ef0 kernel/workqueue.c:2269
  worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
  kthread+0x4b5/0x4f0 kernel/kthread.c:256
  ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355

Uninit was created at:
  kmsan_save_stack_with_flags mm/kmsan/kmsan.c:154 [inline]
  kmsan_internal_poison_shadow+0x60/0x120 mm/kmsan/kmsan.c:137
  kmsan_slab_free+0x8d/0x100 mm/kmsan/kmsan_hooks.c:123
  slab_free_freelist_hook mm/slub.c:1473 [inline]
  slab_free mm/slub.c:3040 [inline]
  kfree+0x4c1/0x2db0 mm/slub.c:3982
  rxrpc_local_rcu+0x7a/0xe0 net/rxrpc/local_object.c:499
  __rcu_reclaim kernel/rcu/rcu.h:222 [inline]
  rcu_do_batch kernel/rcu/tree.c:2157 [inline]
  rcu_core+0xc99/0x1b10 kernel/rcu/tree.c:2377
  rcu_core_si+0xe/0x10 kernel/rcu/tree.c:2386
  __do_softirq+0x4a1/0x83a kernel/softirq.c:293
  invoke_softirq kernel/softirq.c:375 [inline]
  irq_exit+0x230/0x280 kernel/softirq.c:416
  exiting_irq+0xe/0x10 arch/x86/include/asm/apic.h:536
  smp_apic_timer_interrupt+0x48/0x70 arch/x86/kernel/apic/apic.c:1139
  apic_timer_interrupt+0x2e/0x40 arch/x86/entry/entry_64.S:837
  native_restore_fl arch/x86/include/asm/irqflags.h:41 [inline]
  arch_local_irq_restore arch/x86/include/asm/irqflags.h:84 [inline]
  kmsan_slab_free+0xac/0x100 mm/kmsan/kmsan_hooks.c:127
  slab_free_freelist_hook mm/slub.c:1473 [inline]
  slab_free mm/slub.c:3040 [inline]
  kmem_cache_free+0x2d1/0x2b70 mm/slub.c:3056
  anon_vma_chain_free mm/rmap.c:134 [inline]
  unlink_anon_vmas+0x3c1/0xb70 mm/rmap.c:401
  free_pgtables+0x2e2/0x6a0 mm/memory.c:396
  exit_mmap+0x53f/0xa00 mm/mmap.c:3162
  __mmput+0x148/0x590 kernel/fork.c:1081
  mmput+0x83/0x90 kernel/fork.c:1102
  exec_mmap fs/exec.c:1048 [inline]
  flush_old_exec+0xfaf/0x2180 fs/exec.c:1281
  load_elf_binary+0x1121/0x5f10 fs/binfmt_elf.c:847
  search_binary_handler+0x2f4/0xac0 fs/exec.c:1659
  exec_binprm fs/exec.c:1702 [inline]
  __do_execve_file+0x2218/0x2e90 fs/exec.c:1822
  do_execveat_common fs/exec.c:1868 [inline]
  do_execve fs/exec.c:1885 [inline]
  __do_sys_execve fs/exec.c:1961 [inline]
  __se_sys_execve+0xec/0x110 fs/exec.c:1956
  __x64_sys_execve+0x4a/0x70 fs/exec.c:1956
  do_syscall_64+0xb6/0x160 arch/x86/entry/common.c:291
  entry_SYSCALL_64_after_hwframe+0x63/0xe7
=====================================================


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
