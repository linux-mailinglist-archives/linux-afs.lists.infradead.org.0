Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A0BF50CC
	for <lists+linux-afs@lfdr.de>; Fri,  8 Nov 2019 17:15:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wsknEw+2RZkgVKD0167YU31n1DvR/4VAw9KHM/CNdcA=; b=bdINjia+sf5vIc
	qzBEL7pyJEyfSCZlUV4reBnMHeaaR6bJ8vSeXxiKVDYefWrEdgVySntKpUlaA2T3ngS7qLL3KS0uC
	/9ZfnrNBUBD1LzNZVLnDll7k190+tECkm4fVbKW88QT2yCQV9Bf4F39zn9RFM7kXLQWeIyu1XedmM
	w3FLUrOfM2hbeyqSdLgD/C3L1DloZhB2rrlknMZmD2YQBhmxIHG+3Y2R37fEZeQvOtVKK1aP/j4IW
	cPbgCtJ10lUfM1F8yokmUhkWZr2N1wEvCx5VL0poxLhQB7EuLgkc00umcL0ETj5XOCY1r3cL0tnFZ
	Vu94+m+6I/go8OK3+XKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iT6uv-0000tz-Uj; Fri, 08 Nov 2019 16:15:21 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iT6us-0000ra-Qb
 for linux-afs@lists.infradead.org; Fri, 08 Nov 2019 16:15:20 +0000
Received: by mail-qk1-x744.google.com with SMTP id 205so5763294qkk.1
 for <linux-afs@lists.infradead.org>; Fri, 08 Nov 2019 08:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VprtH8LpSA2C0RoW/En0kv7aKrRt2gpW6XPcJVTh2IQ=;
 b=pnVTrbURfNh6YBpyTtMajVC7W5UADZCzTJYCF8GwdQbhbC1lisCeyqWbo/6ewR7YnU
 248jRmi41ct/VEv4uoSckmnIAROqMlJ4wJ4ACJ1PHa46AWJ9hqJuO8YRX1/FbHnKlbq+
 mAuqsNaPzLx5Gdiz7iuwGkgQ7IyyEt+S0n1eI+AG5mRICtVHym6leNNPnD9mASIyYArB
 Q0X05441/Bh0z6dW0l5HADvuYZ/6VCefFTycB2jt/uYmTVXEYAXBp0ArbRejlwrIFJav
 eZsy6hiKRhZFSJjNOxI80FCeDYg2ca8WWgZxWBc60SNBYR9P7aN8Alr/4Q7Y/I1dVouU
 vULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VprtH8LpSA2C0RoW/En0kv7aKrRt2gpW6XPcJVTh2IQ=;
 b=C/95lJ3crH2dGQQ5PWFkSRCjDVwhvH1Jb5vnGBORTLrSRai2gmvaST1VXkccj/7Adv
 aHf2RmWng+l4aStajoZVfHJg4C7IzenOGbxMNtFw9ZCDl7UP2MQvJ1qkgoVPxZ5ohh75
 oL247JZdOR/UMpnxVvPObJfQz3Mw005uYlygWTbCmUZZ+J2QKLtXOxl0obzTt6AMxNzL
 zgyCjqZ2DaXosWgjq+mr7GRUbOAPkDGx7hSHu8b12yMpEAcHMwpm5bEEi7CQz5Vkd3ev
 0REPs54R0mbefBm5Q86XiHPDHL7lDZPaXMUgonADXiDhKOnpx0qQUfYjWiFgK+o4/Zdv
 p6kQ==
X-Gm-Message-State: APjAAAWeXuL+05y4S6P//fcXBt5WIsIGhi6N65VjXV3qsda50qMNcibz
 g22fQKfKDVZ6m2k8POgc2P5fquPsNHliHI4P0QRcAg==
X-Google-Smtp-Source: APXvYqxXO3v+z8Ca7H7xAWxtQ0sQ0IOvsdL+7cUSlTtEdDZCBpgN8p4AHITNn8VZKrDo4yNrk6vQO2ClSj1w7tM5rnM=
X-Received: by 2002:a37:8e81:: with SMTP id q123mr9858170qkd.250.1573229712422; 
 Fri, 08 Nov 2019 08:15:12 -0800 (PST)
MIME-Version: 1.0
References: <000000000000e3a8e00596d7ca32@google.com>
In-Reply-To: <000000000000e3a8e00596d7ca32@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 8 Nov 2019 17:15:00 +0100
Message-ID: <CACT4Y+bOy+OOp2h=jNYJB8xBhQ9x_=MEgP-XcU7KHs7v1v0YPA@mail.gmail.com>
Subject: Re: KMSAN: uninit-value in kernel_sendmsg
To: syzbot <syzbot+4b6f070bb7a8ea5420d4@syzkaller.appspotmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191108_081518_860969_98D84A26 
X-CRM114-Status: GOOD (  17.58  )
X-Spam-Score: -13.2 (-------------)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-13.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:744 listed in]
 [list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 white-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 white-list
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
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
Cc: netdev <netdev@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-afs@lists.infradead.org,
 David Howells <dhowells@redhat.com>, Alexander Potapenko <glider@google.com>,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Fri, Nov 8, 2019 at 4:54 PM syzbot
<syzbot+4b6f070bb7a8ea5420d4@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    124037e0 kmsan: drop inlines, rename do_kmsan_task_create()
> git tree:       https://github.com/google/kmsan.git master
> console output: https://syzkaller.appspot.com/x/log.txt?x=1648eb9d600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=f03c659d0830ab8d
> dashboard link: https://syzkaller.appspot.com/bug?extid=4b6f070bb7a8ea5420d4
> compiler:       clang version 9.0.0 (/home/glider/llvm/clang
> 80fee25776c2fb61e74c1ecb1a523375c2500b69)
>
> Unfortunately, I don't have any reproducer for this crash yet.
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+4b6f070bb7a8ea5420d4@syzkaller.appspotmail.com

I think this is:

#syz dup: KMSAN: use-after-free in rxrpc_send_keepalive

https://syzkaller.appspot.com/bug?id=428e72dc175d0f4b23a1fb9b7d3d16fad7ef2a4b

> =====================================================
> BUG: KMSAN: uninit-value in rxrpc_send_keepalive+0x2fa/0x830
> net/rxrpc/output.c:655
> CPU: 0 PID: 3367 Comm: kworker/0:2 Not tainted 5.3.0-rc7+ #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Workqueue: krxrpcd rxrpc_peer_keepalive_worker
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0x191/0x1f0 lib/dump_stack.c:113
>   kmsan_report+0x13a/0x2b0 mm/kmsan/kmsan_report.c:108
>   __msan_warning+0x73/0xe0 mm/kmsan/kmsan_instr.c:250
>   sock_sendmsg_nosec net/socket.c:637 [inline]
>   sock_sendmsg net/socket.c:657 [inline]
>   kernel_sendmsg+0x2c9/0x440 net/socket.c:677
>   rxrpc_send_keepalive+0x2fa/0x830 net/rxrpc/output.c:655
>   rxrpc_peer_keepalive_dispatch net/rxrpc/peer_event.c:369 [inline]
>   rxrpc_peer_keepalive_worker+0xb82/0x1510 net/rxrpc/peer_event.c:430
>   process_one_work+0x1572/0x1ef0 kernel/workqueue.c:2269
>   worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
>   kthread+0x4b5/0x4f0 kernel/kthread.c:256
>   ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355
>
> Uninit was created at:
>   kmsan_save_stack_with_flags mm/kmsan/kmsan.c:150 [inline]
>   kmsan_internal_poison_shadow+0x53/0x100 mm/kmsan/kmsan.c:134
>   kmsan_slab_alloc+0xaa/0x120 mm/kmsan/kmsan_hooks.c:103
>   slab_alloc_node mm/slub.c:2790 [inline]
>   slab_alloc mm/slub.c:2799 [inline]
>   kmem_cache_alloc_trace+0x8c5/0xd20 mm/slub.c:2816
>   kmalloc include/linux/slab.h:552 [inline]
>   __hw_addr_create_ex net/core/dev_addr_lists.c:30 [inline]
>   __hw_addr_add_ex net/core/dev_addr_lists.c:76 [inline]
>   __hw_addr_add net/core/dev_addr_lists.c:84 [inline]
>   dev_addr_init+0x152/0x700 net/core/dev_addr_lists.c:464
>   alloc_netdev_mqs+0x2a9/0x1650 net/core/dev.c:9150
>   rtnl_create_link+0x559/0x1190 net/core/rtnetlink.c:2931
>   __rtnl_newlink net/core/rtnetlink.c:3186 [inline]
>   rtnl_newlink+0x2757/0x38d0 net/core/rtnetlink.c:3254
>   rtnetlink_rcv_msg+0x115a/0x1580 net/core/rtnetlink.c:5223
>   netlink_rcv_skb+0x431/0x620 net/netlink/af_netlink.c:2477
>   rtnetlink_rcv+0x50/0x60 net/core/rtnetlink.c:5241
>   netlink_unicast_kernel net/netlink/af_netlink.c:1302 [inline]
>   netlink_unicast+0xf6c/0x1050 net/netlink/af_netlink.c:1328
>   netlink_sendmsg+0x110f/0x1330 net/netlink/af_netlink.c:1917
>   sock_sendmsg_nosec net/socket.c:637 [inline]
>   sock_sendmsg net/socket.c:657 [inline]
>   ___sys_sendmsg+0x14ff/0x1590 net/socket.c:2311
>   __sys_sendmsg net/socket.c:2356 [inline]
>   __do_sys_sendmsg net/socket.c:2365 [inline]
>   __se_sys_sendmsg+0x305/0x460 net/socket.c:2363
>   __x64_sys_sendmsg+0x4a/0x70 net/socket.c:2363
>   do_syscall_64+0xbc/0xf0 arch/x86/entry/common.c:297
>   entry_SYSCALL_64_after_hwframe+0x63/0xe7
> =====================================================
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/000000000000e3a8e00596d7ca32%40google.com.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
