Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id AD062AF571
	for <lists+linux-afs@lfdr.de>; Wed, 11 Sep 2019 07:29:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d852CAAN+o4QHocNFls6mf2Iutc3zayVM4qvt4k/4cE=; b=jLY5rD3Wy+Gp1F
	7GPreUWd+Wbgz/sh1s2L/P5HaygSu12qOl8JyOdtMH1b82B5KG0mdoFeeMzi0nqaQHvHzd8gTBP98
	/XObbvk3WuJhXxqYAn1cG902bGItf2b5kNrAIJ/KJjEeqRYEX9NLULUpyC1uQRzgEWrAMncOMVoOu
	6dmbBJYx7CaBxorp2WVn1kI2QvV3E8k8g9BAKaHyMMRunb/uP7zlkI+Cu7qOXLBMWVpFSsFrWoimw
	TEiUOfeiaCnlagST+MKc+MJ1K45IlahMGzmHDaFFL/tlofn+4isNiZDWVwGQNEscdW3pJcnyeU0/i
	sxq8PpA/p0m92jMoI55A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7vBt-00036s-MP; Wed, 11 Sep 2019 05:29:17 +0000
Received: from mail3-164.sinamail.sina.com.cn ([202.108.3.164])
 by bombadil.infradead.org with smtp (Exim 4.92 #3 (Red Hat Linux))
 id 1i7vBo-00036S-Lz
 for linux-afs@lists.infradead.org; Wed, 11 Sep 2019 05:29:15 +0000
Received: from unknown (HELO localhost.localdomain)([61.148.244.178])
 by sina.com with ESMTP
 id 5D78861B00017986; Wed, 11 Sep 2019 13:29:00 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 99993215081321
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+d850c266e3df14da1d31@syzkaller.appspotmail.com>
Subject: Re: KASAN: use-after-free Read in rxrpc_send_keepalive
Date: Wed, 11 Sep 2019 13:28:49 +0800
Message-Id: <20190911052849.7344-1-hdanton@sina.com>
In-Reply-To: <000000000000e695c1058fb26925@google.com>
References: 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190910_222912_905879_358870A9 
X-CRM114-Status: UNSURE (   6.99  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [202.108.3.164 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (hdanton[at]sina.com)
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
 dhowells@redhat.com, davem@davemloft.net, MAILER_DAEMON@email.uscc.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


> syzbot has found a reproducer for the following crash on Tue, 10 Sep 2019 16:35:06 -0700
> 
> HEAD commit:    3120b9a6 Merge tag 'ipc-fixes' of git://git.kernel.org/pub..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=107d1ca5600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ed2b148cd67382ec
> dashboard link: https://syzkaller.appspot.com/bug?extid=d850c266e3df14da1d31
> compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
> 80fee25776c2fb61e74c1ecb1a523375c2500b69)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17347095600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=143bcca5600000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+d850c266e3df14da1d31@syzkaller.appspotmail.com
> 
> ==================================================================
> BUG: KASAN: use-after-free in rxrpc_send_keepalive+0xe2/0x3c0  
> net/rxrpc/output.c:634
> Read of size 8 at addr ffff8880a859a058 by task kworker/0:2/3016
> 
> CPU: 0 PID: 3016 Comm: kworker/0:2 Not tainted 5.3.0-rc8+ #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
> Google 01/01/2011
> Workqueue: krxrpcd rxrpc_peer_keepalive_worker
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0x1d8/0x2f8 lib/dump_stack.c:113
>   print_address_description+0x75/0x5b0 mm/kasan/report.c:351
>   __kasan_report+0x14b/0x1c0 mm/kasan/report.c:482
>   kasan_report+0x26/0x50 mm/kasan/common.c:618
>   __asan_report_load8_noabort+0x14/0x20 mm/kasan/generic_report.c:132
>   rxrpc_send_keepalive+0xe2/0x3c0 net/rxrpc/output.c:634
>   rxrpc_peer_keepalive_dispatch net/rxrpc/peer_event.c:369 [inline]
>   rxrpc_peer_keepalive_worker+0x76e/0xb40 net/rxrpc/peer_event.c:430
>   process_one_work+0x7ef/0x10e0 kernel/workqueue.c:2269
>   worker_thread+0xc01/0x1630 kernel/workqueue.c:2415
>   kthread+0x332/0x350 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> 
> Allocated by task 9378:
>   save_stack mm/kasan/common.c:69 [inline]
>   set_track mm/kasan/common.c:77 [inline]
>   __kasan_kmalloc+0x11c/0x1b0 mm/kasan/common.c:493
>   kasan_kmalloc+0x9/0x10 mm/kasan/common.c:507
>   kmem_cache_alloc_trace+0x221/0x2f0 mm/slab.c:3550
>   kmalloc include/linux/slab.h:552 [inline]
>   kzalloc include/linux/slab.h:748 [inline]
>   rxrpc_alloc_connection+0x79/0x490 net/rxrpc/conn_object.c:41
>   rxrpc_alloc_client_connection net/rxrpc/conn_client.c:176 [inline]
>   rxrpc_get_client_conn net/rxrpc/conn_client.c:339 [inline]
>   rxrpc_connect_call+0xb30/0x2c40 net/rxrpc/conn_client.c:697
>   rxrpc_new_client_call+0x6d5/0xb60 net/rxrpc/call_object.c:289
>   rxrpc_new_client_call_for_sendmsg net/rxrpc/sendmsg.c:595 [inline]
>   rxrpc_do_sendmsg+0xf2b/0x19b0 net/rxrpc/sendmsg.c:652
>   rxrpc_sendmsg+0x5eb/0x8b0 net/rxrpc/af_rxrpc.c:585
>   sock_sendmsg_nosec net/socket.c:637 [inline]
>   sock_sendmsg net/socket.c:657 [inline]
>   ___sys_sendmsg+0x60d/0x910 net/socket.c:2311
>   __sys_sendmmsg+0x239/0x470 net/socket.c:2413
>   __do_sys_sendmmsg net/socket.c:2442 [inline]
>   __se_sys_sendmmsg net/socket.c:2439 [inline]
>   __x64_sys_sendmmsg+0xa0/0xb0 net/socket.c:2439
>   do_syscall_64+0xfe/0x140 arch/x86/entry/common.c:296
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> 
> Freed by task 16:
>   save_stack mm/kasan/common.c:69 [inline]
>   set_track mm/kasan/common.c:77 [inline]
>   __kasan_slab_free+0x12a/0x1e0 mm/kasan/common.c:455
>   kasan_slab_free+0xe/0x10 mm/kasan/common.c:463
>   __cache_free mm/slab.c:3425 [inline]
>   kfree+0x115/0x200 mm/slab.c:3756
>   rxrpc_destroy_connection+0x1ec/0x240 net/rxrpc/conn_object.c:372
>   __rcu_reclaim kernel/rcu/rcu.h:222 [inline]
>   rcu_do_batch kernel/rcu/tree.c:2114 [inline]
>   rcu_core+0x892/0xf10 kernel/rcu/tree.c:2314
>   rcu_core_si+0x9/0x10 kernel/rcu/tree.c:2323
>   __do_softirq+0x333/0x7c4 arch/x86/include/asm/paravirt.h:778
> 
> The buggy address belongs to the object at ffff8880a859a040
>   which belongs to the cache kmalloc-1k of size 1024
> The buggy address is located 24 bytes inside of
>   1024-byte region [ffff8880a859a040, ffff8880a859a440)
> The buggy address belongs to the page:
> page:ffffea0002a16680 refcount:1 mapcount:0 mapping:ffff8880aa400c40  
> index:0x0 compound_mapcount: 0
> flags: 0x1fffc0000010200(slab|head)
> raw: 01fffc0000010200 ffffea00024cc688 ffffea0002684d88 ffff8880aa400c40
> raw: 0000000000000000 ffff8880a859a040 0000000100000007 0000000000000000
> page dumped because: kasan: bad access detected
> 
> Memory state around the buggy address:
>   ffff8880a8599f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>   ffff8880a8599f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> > ffff8880a859a000: fc fc fc fc fc fc fc fc fb fb fb fb fb fb fb fb
>                                                      ^
>   ffff8880a859a080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffff8880a859a100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================

Fix be6e6707f6ee

--- a/net/rxrpc/peer_object.c
+++ b/net/rxrpc/peer_object.c
@@ -287,6 +287,7 @@ static struct rxrpc_peer *rxrpc_create_p
 
 	peer = rxrpc_alloc_peer(local, gfp);
 	if (peer) {
+		rxrpc_get_local(local);
 		memcpy(&peer->srx, srx, sizeof(*srx));
 		rxrpc_init_peer(rx, peer, hash_key);
 	}
@@ -361,9 +362,10 @@ struct rxrpc_peer *rxrpc_lookup_peer(str
 
 		spin_unlock_bh(&rxnet->peer_hash_lock);
 
-		if (peer)
+		if (peer) {
+			rxrpc_put_local(candidate->local);
 			kfree(candidate);
-		else
+		} else
 			peer = candidate;
 	}
 
@@ -417,6 +419,7 @@ static void __rxrpc_put_peer(struct rxrp
 	list_del_init(&peer->keepalive_link);
 	spin_unlock_bh(&rxnet->peer_hash_lock);
 
+	rxrpc_put_local(peer->local);
 	kfree_rcu(peer, rcu);
 }
 


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
