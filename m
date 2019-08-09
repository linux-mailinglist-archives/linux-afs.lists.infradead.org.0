Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE1C87833
	for <lists+linux-afs@lfdr.de>; Fri,  9 Aug 2019 13:06:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IymkrYkw2o09x7f5jAvuZlIYciFxjHA+MeDICPoHs58=; b=popAf1X2mlyVAH
	sIlHBjjE17F91DHfGOyRD1ygOffkEJ9di5ofYocErD3bSO4tJYbGlW1WAKGAM5R4bgW7qGhe+ZcYI
	Nuy9WaW5QKPDU9KoP33Geoffox09OwZJwOx4ZlldsX2g3gcTbXqpboSch0VYV4dNdqGE5HVRh3M4f
	a37UKtrqnT+xcSk+5e4kqtGGguMVajroAMGrB+FWg9b6iWdHXYjIhMkJkAZ/R/Y03+H9+vtQ7HBAt
	V+vV4gIoBI2zEJjPWdCM8RI0d1vGamwr631Wvn6fWIKBxW1Fm6MNHEWwLLlSOzNQD4qKRLP7Byjkb
	YyBVsFCx80ERFMbqPkAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hw2ir-00008d-Gy; Fri, 09 Aug 2019 11:06:13 +0000
Received: from mail-ot1-f70.google.com ([209.85.210.70])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw2in-0008Vp-QP
 for linux-afs@lists.infradead.org; Fri, 09 Aug 2019 11:06:11 +0000
Received: by mail-ot1-f70.google.com with SMTP id h12so67940076otn.18
 for <linux-afs@lists.infradead.org>; Fri, 09 Aug 2019 04:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=zVTRlB/x5YQjuHlXNkGeEct8hD4cekTY0n9YojkyFDU=;
 b=pMuG5gJtNZeU0VxALVJK8fJ4DmGXV5MgvzAuXK9zal5ct0Fe0O1BIGMa6Riv3dgd0r
 gySJgnZRDU/nz39FEaYDv4GkdkdJdEFSGUR/fzlkLqrt/Z9WqmZI7hcrsF5DhIfYlm+L
 yVq6U64kbtfH0z+QDiS7AqsW7mZij2o0e7I3TT86lntYpPWOevkGUf77Nag0mo/HjGSg
 qZx0gmUFnhsctiIqEqu8QZ+0lv5C/XjGxknYl5UXvquIvpJVp3wBrGQl3E6gKWdQsZGZ
 PI9/8+2Zw8nSMGbQDioXL44bq0ZT8enCB9Y2IwnP+rnQVsaAUFo3sY0Y8smM0je5Akkh
 JKPA==
X-Gm-Message-State: APjAAAWu0cVfHHRZD23sBTLh0dGk3nkxAh5cLdvgVT/vhoIP0QpyzN3v
 +7pJGzVM1AejzltHhvMO1H/HPlyXVGmf/o6feX5SJ/R6n0fE
X-Google-Smtp-Source: APXvYqy3Q85weNwM4JYCgJFzoo+N1LJJCD2xUNX+lEyYV85+yaBrOpyhVocQSVRI2cA+GCFcEH9eK0j49dfHLsOIwiLTUmuXkheu
MIME-Version: 1.0
X-Received: by 2002:a02:4e05:: with SMTP id r5mr22339509jaa.27.1565348768322; 
 Fri, 09 Aug 2019 04:06:08 -0700 (PDT)
Date: Fri, 09 Aug 2019 04:06:08 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000492086058fad2979@google.com>
Subject: BUG: corrupted list in rxrpc_local_processor
From: syzbot <syzbot+193e29e9387ea5837f1d@syzkaller.appspotmail.com>
To: davem@davemloft.net, dhowells@redhat.com, linux-afs@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190809_040609_868543_4D6752E2 
X-CRM114-Status: UNSURE (   5.54  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.6 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.6 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.70 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.70 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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

HEAD commit:    87b983f5 Add linux-next specific files for 20190809
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=161309c2600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=28eea330e11df0eb
dashboard link: https://syzkaller.appspot.com/bug?extid=193e29e9387ea5837f1d
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+193e29e9387ea5837f1d@syzkaller.appspotmail.com

list_del corruption. prev->next should be ffff8880a4570da0, but was  
ffff88808c74b6e0
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:51!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 22 Comm: kworker/1:1 Not tainted 5.3.0-rc3-next-20190809 #63
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: krxrpcd rxrpc_local_processor
RIP: 0010:__list_del_entry_valid.cold+0xf/0x4f lib/list_debug.c:51
Code: e8 f9 73 1d fe 0f 0b 48 89 f1 48 c7 c7 c0 6f e6 87 4c 89 e6 e8 e5 73  
1d fe 0f 0b 4c 89 f6 48 c7 c7 60 71 e6 87 e8 d4 73 1d fe <0f> 0b 4c 89 ea  
4c 89 f6 48 c7 c7 a0 70 e6 87 e8 c0 73 1d fe 0f 0b
RSP: 0018:ffff8880a9a47cc0 EFLAGS: 00010286
RAX: 0000000000000054 RBX: ffff8880a4570db8 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff815bb706 RDI: ffffed1015348f8a
RBP: ffff8880a9a47cd8 R08: 0000000000000054 R09: ffffed1015d260d9
R10: ffffed1015d260d8 R11: ffff8880ae9306c7 R12: ffff888074400878
R13: ffff888074400878 R14: ffff8880a4570da0 R15: ffff88809509e580
FS:  0000000000000000(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000400200 CR3: 000000006f1ac000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  __list_del_entry include/linux/list.h:131 [inline]
  list_del_init include/linux/list.h:190 [inline]
  rxrpc_local_destroyer net/rxrpc/local_object.c:427 [inline]
  rxrpc_local_processor+0x251/0x830 net/rxrpc/local_object.c:463
  process_one_work+0x9af/0x1740 kernel/workqueue.c:2269
  worker_thread+0x98/0xe40 kernel/workqueue.c:2415
  kthread+0x361/0x430 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Modules linked in:
---[ end trace c8e00778000f001d ]---
RIP: 0010:__list_del_entry_valid.cold+0xf/0x4f lib/list_debug.c:51
Code: e8 f9 73 1d fe 0f 0b 48 89 f1 48 c7 c7 c0 6f e6 87 4c 89 e6 e8 e5 73  
1d fe 0f 0b 4c 89 f6 48 c7 c7 60 71 e6 87 e8 d4 73 1d fe <0f> 0b 4c 89 ea  
4c 89 f6 48 c7 c7 a0 70 e6 87 e8 c0 73 1d fe 0f 0b
RSP: 0018:ffff8880a9a47cc0 EFLAGS: 00010286
RAX: 0000000000000054 RBX: ffff8880a4570db8 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff815bb706 RDI: ffffed1015348f8a
RBP: ffff8880a9a47cd8 R08: 0000000000000054 R09: ffffed1015d260d9
R10: ffffed1015d260d8 R11: ffff8880ae9306c7 R12: ffff888074400878
R13: ffff888074400878 R14: ffff8880a4570da0 R15: ffff88809509e580
FS:  0000000000000000(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b32f22000 CR3: 000000006f1ac000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
