Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A6E763FB
	for <lists+linux-afs@lfdr.de>; Fri, 26 Jul 2019 13:00:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPz34ZdfGD+1+g9PWYk2rQMEjurzSDleQu7UeCnDDFg=; b=CIjkA7AoZ/2U9x
	cTADHnATABx9Xf5GO5wsFZQloiUGIpjd2uNsCHd5crgoCjUlrpxoe+q8vvObF/sompqtDPRfV/NZD
	QPqJmtzyiKX/TPJ7lZNZ5a8WSn1YREYNVjDmf+Kgv7RaN8YJE2pqaACtp7ESDqZMux/W9OSVdmDfG
	cHsBHj1xsFlKV/1pO+vPqExaFmcdkbQDasO6BUDMFkcpFc3nICND6kQF1rm6OIZzQCNuB6xNSQ/Cg
	ATQpjSYsu9XJFS9KTHM8rPOOfAUFjVPIcCv2XZfUOTOh2rbFDHa4EjTKLjVe5UqikQVIOpH4Hxk47
	hRY0UrVfOvAoM2w7FJUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqxx8-0006zs-JO; Fri, 26 Jul 2019 10:59:58 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqxx5-0006z8-TO
 for linux-afs@lists.infradead.org; Fri, 26 Jul 2019 10:59:57 +0000
Received: by mail-io1-xd41.google.com with SMTP id j6so28737493ioa.5
 for <linux-afs@lists.infradead.org>; Fri, 26 Jul 2019 03:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/2Qkyg89gM8E4GiN52BSgJrYKhgOHFEX8MPsTOQQb/8=;
 b=pvKKUb3xOgOs5idwxVhzJYYdgRH/f/hAG+mKTXBqLzmghnIB+xujpY1bBX9Y7LdVMd
 aa+9Jt3AuO0Z+wHmXBs10VaaQaWws08Jo7yKOGYxFZaomRSCzixATWN007WGKlzn48EA
 MfTec8I68rvjBmvtB214HMPqY9bMtNJPjysQehKPbyefTroUBtvIkPufc//tKBw+3Q3W
 GhxC8/QO4NqmtXKDkFTfzoSVaEKnICoXOwH0JuyFLRh7ZV/6ndmdlqe1FttJgKV/DPAQ
 4zOxvgJqZo2nlpiVPA7khQNbyK3zr3GiFarRbnSzEbNe8EtRuu6bdZIPpCGdVa+nJwyf
 P6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/2Qkyg89gM8E4GiN52BSgJrYKhgOHFEX8MPsTOQQb/8=;
 b=Ujk05dxVaLAxVVtnf/c990Wvn4ewnpwIO7oE8AG7JvfD6+Nb02JEOMXp2mXRdnI6PB
 DND7dda7WF0nLa4JcV3InxASH0nqrF2wilZud73nfi8soscaOv1UYtqVNt+GaBBWuf0w
 7UpUeFHp1w/wc8Rj3lr2e88nRLFO0d+jIDItzuUUeIagMIRsC0J9Z9tVE4r/+VNgNBQ2
 AgaWkWPF9S7eQMW6WTnXkgaj1hm83gPOp0Eux6JWZBI7nzHpcyoEY25yV0H/2jSnVTGf
 J6qx5NUHZ4I5EN850YxH5F760VJxZ0+fXoYsjR8ZZjWH+i+m3vuUQebL/jxzmwiu7B8e
 +J4w==
X-Gm-Message-State: APjAAAWMbPoj/7XXmnFEKeBM8gEav5BYFICBm2XbepbLpIdUQDQpSklv
 PnhdNaFqJgjTuKiGrmhaHeHYyiF6JLwylGepoBsoOA==
X-Google-Smtp-Source: APXvYqwy0DspGrxpJRfm+kJx/feLb96cqxdHBXTbxWdZC6ECQstx1/+jNOE+Dzwx0A8fEiu4b7xFBoluWw/tmZ/Q6DY=
X-Received: by 2002:a02:c7c9:: with SMTP id s9mr38357516jao.82.1564138791753; 
 Fri, 26 Jul 2019 03:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000b7abcc058e924c12@google.com>
In-Reply-To: <000000000000b7abcc058e924c12@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 26 Jul 2019 12:59:40 +0200
Message-ID: <CACT4Y+aigCawAqjh=W83uAvbC+n3FXfsiYSA0sbMSn8kkPMSNA@mail.gmail.com>
Subject: Re: possible deadlock in rxrpc_put_peer
To: syzbot <syzbot+72af434e4b3417318f84@syzkaller.appspotmail.com>, 
 David Howells <dhowells@redhat.com>, David Miller <davem@davemloft.net>,
 linux-afs@lists.infradead.org, netdev <netdev@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_035955_977759_7BB55332 
X-CRM114-Status: GOOD (  18.38  )
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-15.7 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:d41 listed in]
 [list.dnswl.org]
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 white-list
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Fri, Jul 26, 2019 at 11:38 AM syzbot
<syzbot+72af434e4b3417318f84@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    6d21a41b Add linux-next specific files for 20190718
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=174e3af0600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3430a151e1452331
> dashboard link: https://syzkaller.appspot.com/bug?extid=72af434e4b3417318f84
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>
> Unfortunately, I don't have any reproducer for this crash yet.
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+72af434e4b3417318f84@syzkaller.appspotmail.com

+net/rxrpc/peer_object.c maintainers

> ============================================
> WARNING: possible recursive locking detected
> 5.2.0-next-20190718 #41 Not tainted
> --------------------------------------------
> kworker/0:3/21678 is trying to acquire lock:
> 00000000aa5eecdf (&(&rxnet->peer_hash_lock)->rlock){+.-.}, at: spin_lock_bh
> /./include/linux/spinlock.h:343 [inline]
> 00000000aa5eecdf (&(&rxnet->peer_hash_lock)->rlock){+.-.}, at:
> __rxrpc_put_peer /net/rxrpc/peer_object.c:415 [inline]
> 00000000aa5eecdf (&(&rxnet->peer_hash_lock)->rlock){+.-.}, at:
> rxrpc_put_peer+0x2d3/0x6a0 /net/rxrpc/peer_object.c:435
>
> but task is already holding lock:
> 00000000aa5eecdf (&(&rxnet->peer_hash_lock)->rlock){+.-.}, at: spin_lock_bh
> /./include/linux/spinlock.h:343 [inline]
> 00000000aa5eecdf (&(&rxnet->peer_hash_lock)->rlock){+.-.}, at:
> rxrpc_peer_keepalive_dispatch /net/rxrpc/peer_event.c:378 [inline]
> 00000000aa5eecdf (&(&rxnet->peer_hash_lock)->rlock){+.-.}, at:
> rxrpc_peer_keepalive_worker+0x6b3/0xd02 /net/rxrpc/peer_event.c:430
>
> other info that might help us debug this:
>   Possible unsafe locking scenario:
>
>         CPU0
>         ----
>    lock(&(&rxnet->peer_hash_lock)->rlock);
>    lock(&(&rxnet->peer_hash_lock)->rlock);
>
>   *** DEADLOCK ***
>
>   May be due to missing lock nesting notation
>
> 3 locks held by kworker/0:3/21678:
>   #0: 000000007c4c2bc3 ((wq_completion)krxrpcd){+.+.}, at: __write_once_size
> /./include/linux/compiler.h:226 [inline]
>   #0: 000000007c4c2bc3 ((wq_completion)krxrpcd){+.+.}, at: arch_atomic64_set
> /./arch/x86/include/asm/atomic64_64.h:34 [inline]
>   #0: 000000007c4c2bc3 ((wq_completion)krxrpcd){+.+.}, at: atomic64_set
> /./include/asm-generic/atomic-instrumented.h:855 [inline]
>   #0: 000000007c4c2bc3 ((wq_completion)krxrpcd){+.+.}, at: atomic_long_set
> /./include/asm-generic/atomic-long.h:40 [inline]
>   #0: 000000007c4c2bc3 ((wq_completion)krxrpcd){+.+.}, at: set_work_data
> /kernel/workqueue.c:620 [inline]
>   #0: 000000007c4c2bc3 ((wq_completion)krxrpcd){+.+.}, at:
> set_work_pool_and_clear_pending /kernel/workqueue.c:647 [inline]
>   #0: 000000007c4c2bc3 ((wq_completion)krxrpcd){+.+.}, at:
> process_one_work+0x88b/0x1740 /kernel/workqueue.c:2240
>   #1: 000000006782bc7f
> ((work_completion)(&rxnet->peer_keepalive_work)){+.+.}, at:
> process_one_work+0x8c1/0x1740 /kernel/workqueue.c:2244
>   #2: 00000000aa5eecdf (&(&rxnet->peer_hash_lock)->rlock){+.-.}, at:
> spin_lock_bh /./include/linux/spinlock.h:343 [inline]
>   #2: 00000000aa5eecdf (&(&rxnet->peer_hash_lock)->rlock){+.-.}, at:
> rxrpc_peer_keepalive_dispatch /net/rxrpc/peer_event.c:378 [inline]
>   #2: 00000000aa5eecdf (&(&rxnet->peer_hash_lock)->rlock){+.-.}, at:
> rxrpc_peer_keepalive_worker+0x6b3/0xd02 /net/rxrpc/peer_event.c:430
>
> stack backtrace:
> CPU: 0 PID: 21678 Comm: kworker/0:3 Not tainted 5.2.0-next-20190718 #41
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Workqueue: krxrpcd rxrpc_peer_keepalive_worker
> Call Trace:
>   __dump_stack /lib/dump_stack.c:77 [inline]
>   dump_stack+0x172/0x1f0 /lib/dump_stack.c:113
>   print_deadlock_bug /kernel/locking/lockdep.c:2301 [inline]
>   check_deadlock /kernel/locking/lockdep.c:2342 [inline]
>   validate_chain /kernel/locking/lockdep.c:2881 [inline]
>   __lock_acquire.cold+0x194/0x398 /kernel/locking/lockdep.c:3880
>   lock_acquire+0x190/0x410 /kernel/locking/lockdep.c:4413
>   __raw_spin_lock_bh /./include/linux/spinlock_api_smp.h:135 [inline]
>   _raw_spin_lock_bh+0x33/0x50 /kernel/locking/spinlock.c:175
>   spin_lock_bh /./include/linux/spinlock.h:343 [inline]
>   __rxrpc_put_peer /net/rxrpc/peer_object.c:415 [inline]
>   rxrpc_put_peer+0x2d3/0x6a0 /net/rxrpc/peer_object.c:435
>   rxrpc_peer_keepalive_dispatch /net/rxrpc/peer_event.c:381 [inline]
>   rxrpc_peer_keepalive_worker+0x7a6/0xd02 /net/rxrpc/peer_event.c:430
>   process_one_work+0x9af/0x1740 /kernel/workqueue.c:2269
>   worker_thread+0x98/0xe40 /kernel/workqueue.c:2415
>   kthread+0x361/0x430 /kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 /arch/x86/entry/entry_64.S:352
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
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/000000000000b7abcc058e924c12%40google.com.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
