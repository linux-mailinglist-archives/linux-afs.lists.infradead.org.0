Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A820889B3E
	for <lists+linux-afs@lfdr.de>; Mon, 12 Aug 2019 12:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=h8tof9DnE7VEwTrMwqLjGkR08q0XW/Yd8TZalBtAS7A=; b=QmUD6NvsY4+2MV
	4gwm1ZDjlbvLFV3vJcsjwworziQcdG0e6pOhJi+rUkcITU04KaX71vrfKvnKlDAWRbfxCt9R8Udr3
	WCtiaEb7DjI83Eg7gTE0wu8ui6oWjjypUZvphA5ah7kwfGSM9Qkag79U2XbzhtzVmaaynOIEypmif
	rs//yFNLM7Cc0WQ099SbmvpSQEDPOHZzLJBOZE1bOotywdZFZ641159CZo8Y/XibooZMHTfbZ1qMh
	pBvDNphLEBeC9LJYkfxIbkRypHtIFs+CDqNdm1g6QMVltq2Qaq3P2eBfOzo71ILCOvaLR0BY8gWCN
	AW+CSKs7H2uDOzEe+66Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx7Qz-000497-JL; Mon, 12 Aug 2019 10:20:13 +0000
Received: from mail-ot1-f72.google.com ([209.85.210.72])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx7Qw-00047u-CK
 for linux-afs@lists.infradead.org; Mon, 12 Aug 2019 10:20:11 +0000
Received: by mail-ot1-f72.google.com with SMTP id 88so4462559otc.19
 for <linux-afs@lists.infradead.org>; Mon, 12 Aug 2019 03:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=F+sCkwDa9f+RxfruDpYk266w8j1SjIK4Xb0PYHWArdY=;
 b=Xw7l0Z3UCImG6zkMVJhurFv8NobF1bqQUGScN2vYd+fOg3Wdj45jilMLfK7qzkDJnU
 7iwwQo9NksCyPXR0otf5M9lLjClCfvaVS1GKkC1/utHRjMVZ5Tw4Nnbd0CtcUIjakVyk
 1Ffl8/o7nzWcfjBEBUIaR7hHPZJe119+0PJ+R2RhxImWYpJ4AsghrOcRitt5cC4fej5F
 E4owJU2nhZDpaaKlKCkiTZallRlVf764ywwo/ikSA+6gjNuRBNO/432VJC0FQIbk7P+t
 gPrxGHmbrq5Q/YiwfObjlQK7tRipc2cLxnjsX9EFCM9tmYWzpc9X8DKeMvPxCeaVU2kP
 Gpww==
X-Gm-Message-State: APjAAAUH1eqRuHs29G7tkxyBuYwh3UD7ytNt+/SbmSAp/JgyRbUp03i1
 2vm4pDV7W8cQP8Bnxy4+MkOFCTflFNcxKh/J7zzdlWWuW8Wj
X-Google-Smtp-Source: APXvYqylZCr71afqbkmSSEoG0bXp+Wqna6q1KYeqMuVdotyvmT64jqS7CvFtW+Sb2KKJRXvbqprM29x92pCgtQB9t92MfbiYnkEv
MIME-Version: 1.0
X-Received: by 2002:a5d:8f8a:: with SMTP id l10mr8658161iol.306.1565605206234; 
 Mon, 12 Aug 2019 03:20:06 -0700 (PDT)
Date: Mon, 12 Aug 2019 03:20:06 -0700
In-Reply-To: <000000000000492086058fad2979@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002d1bcc058fe8deb8@google.com>
Subject: Re: BUG: corrupted list in rxrpc_local_processor
From: syzbot <syzbot+193e29e9387ea5837f1d@syzkaller.appspotmail.com>
To: davem@davemloft.net, dhowells@redhat.com, linux-afs@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_032010_422169_AFA0D178 
X-CRM114-Status: UNSURE (   4.90  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.6 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.6 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.72 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.72 listed in wl.mailspike.net]
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

HEAD commit:    125b7e09 net: tc35815: Explicitly check NET_IP_ALIGN is no..
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=16fb7bc2600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a4c9e9f08e9e8960
dashboard link: https://syzkaller.appspot.com/bug?extid=193e29e9387ea5837f1d
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=159d4eba600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16ba194a600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+193e29e9387ea5837f1d@syzkaller.appspotmail.com

IPv6: ADDRCONF(NETDEV_CHANGE): hsr_slave_1: link becomes ready
list_del corruption. prev->next should be ffff8880996e84e0, but was  
ffff8880996e8960
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:51!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 17 Comm: kworker/1:0 Not tainted 5.3.0-rc3+ #159
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: krxrpcd rxrpc_local_processor
RIP: 0010:__list_del_entry_valid.cold+0xf/0x4f lib/list_debug.c:51
Code: e8 e9 03 1e fe 0f 0b 48 89 f1 48 c7 c7 80 25 c6 87 4c 89 e6 e8 d5 03  
1e fe 0f 0b 4c 89 f6 48 c7 c7 20 27 c6 87 e8 c4 03 1e fe <0f> 0b 4c 89 ea  
4c 89 f6 48 c7 c7 60 26 c6 87 e8 b0 03 1e fe 0f 0b
RSP: 0018:ffff8880a9917cc0 EFLAGS: 00010286
RAX: 0000000000000054 RBX: ffff8880996e84f8 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff815c3b96 RDI: ffffed1015322f8a
RBP: ffff8880a9917cd8 R08: 0000000000000054 R09: ffffed1015d260d1
R10: ffffed1015d260d0 R11: ffff8880ae930687 R12: ffff88808f998638
R13: ffff88808f998638 R14: ffff8880996e84e0 R15: ffff8880aa0a8500
FS:  0000000000000000(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2648a08db8 CR3: 00000000981a9000 CR4: 00000000001406e0
Call Trace:
  __list_del_entry include/linux/list.h:131 [inline]
  list_del_init include/linux/list.h:190 [inline]
  rxrpc_local_destroyer net/rxrpc/local_object.c:429 [inline]
  rxrpc_local_processor+0x251/0x830 net/rxrpc/local_object.c:465
  process_one_work+0x9af/0x1740 kernel/workqueue.c:2269
  worker_thread+0x98/0xe40 kernel/workqueue.c:2415
  kthread+0x361/0x430 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Modules linked in:
---[ end trace 4d70382ddfcfe2b8 ]---
RIP: 0010:__list_del_entry_valid.cold+0xf/0x4f lib/list_debug.c:51
Code: e8 e9 03 1e fe 0f 0b 48 89 f1 48 c7 c7 80 25 c6 87 4c 89 e6 e8 d5 03  
1e fe 0f 0b 4c 89 f6 48 c7 c7 20 27 c6 87 e8 c4 03 1e fe <0f> 0b 4c 89 ea  
4c 89 f6 48 c7 c7 60 26 c6 87 e8 b0 03 1e fe 0f 0b
RSP: 0018:ffff8880a9917cc0 EFLAGS: 00010286
RAX: 0000000000000054 RBX: ffff8880996e84f8 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff815c3b96 RDI: ffffed1015322f8a
RBP: ffff8880a9917cd8 R08: 0000000000000054 R09: ffffed1015d260d1
R10: ffffed1015d260d0 R11: ffff8880ae930687 R12: ffff88808f998638
R13: ffff88808f998638 R14: ffff8880996e84e0 R15: ffff8880aa0a8500
FS:  0000000000000000(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2648a08db8 CR3: 00000000981a9000 CR4: 00000000001406e0


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
