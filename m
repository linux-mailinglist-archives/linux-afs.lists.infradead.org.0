Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CBAF5042
	for <lists+linux-afs@lfdr.de>; Fri,  8 Nov 2019 16:54:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pk00Q/1dq+9bQyUt4QB0JHUp+n+uD1H9dPQ09b8AvQc=; b=ZKSB2I05IIVJPP
	ihpJ/4CDuXT/g4a8ve0NposlOzEh3Do71iNTVmvXmk5ncBrKcDtNWsDH1BmdCib4p2gQjHGVgC4Rt
	Rc88iaJ3jqVMz8nPcqYvSQGGFo2KXlaLEH7wXliJFyuAfhg/UVa8rE2C8wGf4LsdgjGfDHSNrRjuV
	EW79tcChnz+9yIcmmtIOvvwnRqI6LkGbSw/x43vM4Hv2LI5YXmeMFDfl18VceCkm0Uh5bpshfPQ8n
	d+xJtn2RTpV7o+l/1MP5/81Filxf1aWKMfl24NQfEybuPB2899GeisMXFpYk8jDa+z/8SE3QNUKUE
	Xy6CPlUhrxq+T4l4nMbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iT6aT-0000RQ-SF; Fri, 08 Nov 2019 15:54:13 +0000
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iT6aR-0000QX-Ku
 for linux-afs@lists.infradead.org; Fri, 08 Nov 2019 15:54:13 +0000
Received: by mail-io1-f70.google.com with SMTP id d22so5664856iod.3
 for <linux-afs@lists.infradead.org>; Fri, 08 Nov 2019 07:54:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=s332cRTbvTcjjlLB46ZkzaXl2NaFeaIwaT6ESHp+Drs=;
 b=KMIzvvwUbxEvbZZ2PR/64XDUZLE2CNUKghVtF/JtaWMdv3kTYrmBEjEYSMDRdgOrUd
 KtycnieuoteI/Txfel2GiRbrZ0JE7ha5irtZAMJvzvc5KHqKhGbXrH51irdbaJltJwfJ
 hG76ljpczrov4QSp/DLnKIei9apfFN58mGmr1vXOK+76Y098XJLvGeDnjktFBrjrZYDk
 KNbQ6gSzxi1nupFePeSgXvxF9oDnoI6ibzkuDPjuitO8BrAc/fi0Y/8X8iHdqZARCl18
 taHy+OLp/nkGmokhX2L7lpTcayFe/b/aQMK8fu9jaf3NQEpAFHA3RFM0BvzVVSlKbGUA
 nL3A==
X-Gm-Message-State: APjAAAVuP8FTccvF7Ij+rFydwzcQNx8/8X/BxKDtWdsmI0FJJ8PPP0Zv
 z+LOL3cWl4118jml8dWKgXPFuHE/oA6IHvOq9ygP/0K5Wxg3
X-Google-Smtp-Source: APXvYqzIc8qMPr+vhqnH6XJzsuF/upi1JbflEe2c6XqHSfDW5wG+XIWeG4APhbntX+YnhLgNg8sgrdIAAI6g8fUnSF9koOM5NU/M
MIME-Version: 1.0
X-Received: by 2002:a02:9641:: with SMTP id c59mr11764083jai.40.1573228449602; 
 Fri, 08 Nov 2019 07:54:09 -0800 (PST)
Date: Fri, 08 Nov 2019 07:54:09 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e3a8e00596d7ca32@google.com>
Subject: KMSAN: uninit-value in kernel_sendmsg
From: syzbot <syzbot+4b6f070bb7a8ea5420d4@syzkaller.appspotmail.com>
To: davem@davemloft.net, dhowells@redhat.com, glider@google.com, 
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191108_075411_683925_FB95B78A 
X-CRM114-Status: UNSURE (   4.47  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 3.1 (+++)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (3.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.70 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.70 listed in wl.mailspike.net]
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
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

HEAD commit:    124037e0 kmsan: drop inlines, rename do_kmsan_task_create()
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=1648eb9d600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f03c659d0830ab8d
dashboard link: https://syzkaller.appspot.com/bug?extid=4b6f070bb7a8ea5420d4
compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
80fee25776c2fb61e74c1ecb1a523375c2500b69)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+4b6f070bb7a8ea5420d4@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in rxrpc_send_keepalive+0x2fa/0x830  
net/rxrpc/output.c:655
CPU: 0 PID: 3367 Comm: kworker/0:2 Not tainted 5.3.0-rc7+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: krxrpcd rxrpc_peer_keepalive_worker
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x191/0x1f0 lib/dump_stack.c:113
  kmsan_report+0x13a/0x2b0 mm/kmsan/kmsan_report.c:108
  __msan_warning+0x73/0xe0 mm/kmsan/kmsan_instr.c:250
  sock_sendmsg_nosec net/socket.c:637 [inline]
  sock_sendmsg net/socket.c:657 [inline]
  kernel_sendmsg+0x2c9/0x440 net/socket.c:677
  rxrpc_send_keepalive+0x2fa/0x830 net/rxrpc/output.c:655
  rxrpc_peer_keepalive_dispatch net/rxrpc/peer_event.c:369 [inline]
  rxrpc_peer_keepalive_worker+0xb82/0x1510 net/rxrpc/peer_event.c:430
  process_one_work+0x1572/0x1ef0 kernel/workqueue.c:2269
  worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
  kthread+0x4b5/0x4f0 kernel/kthread.c:256
  ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355

Uninit was created at:
  kmsan_save_stack_with_flags mm/kmsan/kmsan.c:150 [inline]
  kmsan_internal_poison_shadow+0x53/0x100 mm/kmsan/kmsan.c:134
  kmsan_slab_alloc+0xaa/0x120 mm/kmsan/kmsan_hooks.c:103
  slab_alloc_node mm/slub.c:2790 [inline]
  slab_alloc mm/slub.c:2799 [inline]
  kmem_cache_alloc_trace+0x8c5/0xd20 mm/slub.c:2816
  kmalloc include/linux/slab.h:552 [inline]
  __hw_addr_create_ex net/core/dev_addr_lists.c:30 [inline]
  __hw_addr_add_ex net/core/dev_addr_lists.c:76 [inline]
  __hw_addr_add net/core/dev_addr_lists.c:84 [inline]
  dev_addr_init+0x152/0x700 net/core/dev_addr_lists.c:464
  alloc_netdev_mqs+0x2a9/0x1650 net/core/dev.c:9150
  rtnl_create_link+0x559/0x1190 net/core/rtnetlink.c:2931
  __rtnl_newlink net/core/rtnetlink.c:3186 [inline]
  rtnl_newlink+0x2757/0x38d0 net/core/rtnetlink.c:3254
  rtnetlink_rcv_msg+0x115a/0x1580 net/core/rtnetlink.c:5223
  netlink_rcv_skb+0x431/0x620 net/netlink/af_netlink.c:2477
  rtnetlink_rcv+0x50/0x60 net/core/rtnetlink.c:5241
  netlink_unicast_kernel net/netlink/af_netlink.c:1302 [inline]
  netlink_unicast+0xf6c/0x1050 net/netlink/af_netlink.c:1328
  netlink_sendmsg+0x110f/0x1330 net/netlink/af_netlink.c:1917
  sock_sendmsg_nosec net/socket.c:637 [inline]
  sock_sendmsg net/socket.c:657 [inline]
  ___sys_sendmsg+0x14ff/0x1590 net/socket.c:2311
  __sys_sendmsg net/socket.c:2356 [inline]
  __do_sys_sendmsg net/socket.c:2365 [inline]
  __se_sys_sendmsg+0x305/0x460 net/socket.c:2363
  __x64_sys_sendmsg+0x4a/0x70 net/socket.c:2363
  do_syscall_64+0xbc/0xf0 arch/x86/entry/common.c:297
  entry_SYSCALL_64_after_hwframe+0x63/0xe7
=====================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
