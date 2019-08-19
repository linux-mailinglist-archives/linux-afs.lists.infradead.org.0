Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1DD91D95
	for <lists+linux-afs@lfdr.de>; Mon, 19 Aug 2019 09:12:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EpYQ3u0HQKle2Dzk3YJF/USF3EFXbmNd4NoIJfWD4A4=; b=dcp0XGA3GstdPd
	VioEWF3Wx3ELyZUzaNkViAU/TM9JW5UeUs+498WWuNrU7ZbZttWANDkRUbUSk9gM8ChwX0cblgEZG
	DL0rMR5nIuNxr5abSUTRNdRc4A+Hz1cz1vFm2UDraAWwWfnGRCzmdpp4/0cDqIkaKK3n/RwBBD8JO
	xDA8fgSF9f9WvJTZAKDyug9u7IEcUTnZPsLowDXIEU0YJgWdPzmc5p23ZS1HxOY1AJElpS/JwZFwl
	BV94umNVn7p/xNQ+UhaudHfQ5W84fazXNocNYfib2RMo4YeOJD1zq1B+ze/frpI841ICFEbD22nQy
	76FmuY52vDxlwHmthFCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzbpe-0006w6-JJ; Mon, 19 Aug 2019 07:11:58 +0000
Received: from mail3-165.sinamail.sina.com.cn ([202.108.3.165])
 by bombadil.infradead.org with smtp (Exim 4.92 #3 (Red Hat Linux))
 id 1hzbpa-0006vh-HF
 for linux-afs@lists.infradead.org; Mon, 19 Aug 2019 07:11:56 +0000
Received: from unknown (HELO localhost.localdomain)([222.131.78.247])
 by sina.com with ESMTP
 id 5D5A4B8F00037C48; Mon, 19 Aug 2019 15:11:12 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 749315497611
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+1e0edc4b8b7494c28450@syzkaller.appspotmail.com>
Subject: Re: kernel BUG at net/rxrpc/local_object.c:LINE!
Date: Mon, 19 Aug 2019 15:11:01 +0800
Message-Id: <20190819071101.5796-1-hdanton@sina.com>
In-Reply-To: <0000000000004c2416058c594b30@google.com>
References: 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190819_001154_749537_02DA98B7 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 2.5 (++)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [202.108.3.165 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.165 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (hdanton[at]sina.com)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
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
Cc: ebiggers@kernel.org, netdev@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-afs@lists.infradead.org, dhowells@redhat.com, davem@davemloft.net,
 dvyukov@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


On Sun, 18 Aug 2019 11:47:06 -0700
> syzbot has found a reproducer for the following crash on:
> 
> HEAD commit:    0c3d3d64 Add linux-next specific files for 20190816
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=108b58f2600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=dffdf1e146f941f4
> dashboard link: https://syzkaller.appspot.com/bug?extid=1e0edc4b8b7494c28450
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13feb73c600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=127088f2600000
> 
> The bug was bisected to:
> 
> commit 46894a13599a977ac35411b536fb3e0b2feefa95
> Author: David Howells <dhowells@redhat.com>
> Date:   Thu Oct 4 08:32:28 2018 +0000
> 
>      rxrpc: Use IPv4 addresses throught the IPv6
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=152fabe3a00000
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=172fabe3a00000
> console output: https://syzkaller.appspot.com/x/log.txt?x=132fabe3a00000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+1e0edc4b8b7494c28450@syzkaller.appspotmail.com
> Fixes: 46894a13599a ("rxrpc: Use IPv4 addresses throught the IPv6")
> 
> rxrpc: Assertion failed
> ------------[ cut here ]------------
> kernel BUG at net/rxrpc/local_object.c:433!
> invalid opcode: 0000 [#1] PREEMPT SMP KASAN
> CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.3.0-rc4-next-20190816 #67
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
> Google 01/01/2011
> Workqueue: krxrpcd rxrpc_local_processor
> RIP: 0010:rxrpc_local_destroyer net/rxrpc/local_object.c:433 [inline]
> RIP: 0010:rxrpc_local_processor.cold+0x24/0x29 net/rxrpc/local_object.c:466
> Code: df a1 bc fa 0f 0b e8 c4 2b d3 fa 48 c7 c7 e0 24 5b 88 e8 cc a1 bc fa  
> 0f 0b e8 b1 2b d3 fa 48 c7 c7 e0 24 5b 88 e8 b9 a1 bc fa <0f> 0b 90 90 90  
> 55 48 89 e5 41 57 49 89 ff 41 56 41 55 41 54 53 48
> RSP: 0018:ffff8880a98d7ce8 EFLAGS: 00010282
> RAX: 0000000000000017 RBX: ffff88808c90a978 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: ffffffff815bb906 RDI: ffffed101531af8f
> RBP: ffff8880a98d7d30 R08: 0000000000000017 R09: ffffed1015d060d9
> R10: ffffed1015d060d8 R11: ffff8880ae8306c7 R12: ffff88808c90a208
> R13: ffff88808dc48648 R14: ffff88808c90a940 R15: ffff8880929faa00
> FS:  0000000000000000(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000000000049f2b0 CR3: 0000000008e6d000 CR4: 00000000001406f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>   process_one_work+0x9af/0x1740 kernel/workqueue.c:2269
>   worker_thread+0x98/0xe40 kernel/workqueue.c:2415
>   kthread+0x361/0x430 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> Modules linked in:
> ---[ end trace c65e44ef4b16c854 ]---

1, a short diff though coarse, handle data unless zero usage.

--- a/net/rxrpc/input.c
+++ b/net/rxrpc/input.c
@@ -1177,7 +1177,7 @@ int rxrpc_input_packet(struct sock *udp_
 
 	_enter("%p", udp_sk);
 
-	if (unlikely(!local)) {
+	if (unlikely(!local) || !atomic_read(&local->usage)) {
 		kfree_skb(skb);
 		return 0;
 	}
--

2, a longer one.

--- a/net/rxrpc/input.c
+++ b/net/rxrpc/input.c
@@ -1177,6 +1177,7 @@ int rxrpc_input_packet(struct sock *udp_
 
 	_enter("%p", udp_sk);
 
+	local = rxrpc_get_local_maybe(local);
 	if (unlikely(!local)) {
 		kfree_skb(skb);
 		return 0;
@@ -1202,6 +1203,7 @@ int rxrpc_input_packet(struct sock *udp_
 		if ((lose++ & 7) == 7) {
 			trace_rxrpc_rx_lose(sp);
 			rxrpc_free_skb(skb, rxrpc_skb_rx_lost);
+			rxrpc_put_local(local);
 			return 0;
 		}
 	}
@@ -1377,12 +1379,12 @@ int rxrpc_input_packet(struct sock *udp_
 	}
 
 	rxrpc_input_call_packet(call, skb, skew);
-	goto discard;
 
 discard:
 	rxrpc_free_skb(skb, rxrpc_skb_rx_freed);
 out:
 	trace_rxrpc_rx_done(0, 0);
+	rxrpc_put_local(local);
 	return 0;
 
 wrong_security:
@@ -1413,5 +1415,6 @@ reject_packet:
 	trace_rxrpc_rx_done(skb->mark, skb->priority);
 	rxrpc_reject_packet(local, skb);
 	_leave(" [badmsg]");
+	rxrpc_put_local(local);
 	return 0;
 }
--


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
