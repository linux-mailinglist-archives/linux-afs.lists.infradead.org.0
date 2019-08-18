Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0A091909
	for <lists+linux-afs@lfdr.de>; Sun, 18 Aug 2019 20:47:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=VcjzZ8ZZRBj+J9peciNLQ8oG/d/3OhhUiKyVHnCaUvQ=; b=HzqAGWnU1j5IjS
	nVEP+Qd0k4o90Fs/coDbxQiHc4wW9vfcNBg5Mk7wcpM778N+skKdMaef8rzQoDYMZX/Q+vbdyHyjd
	+LhZPCUaK3XwLkan725mqyTlqtjD8fVNNhc6EpR59ZVkRGQKDQ33Ki5Xgn24A7clGyUjB18LU9zPW
	jT07JEKuMUkzwQlOy6pu8hQ3S3QuVHH+Qq+fRjTY9oR+uAwgeR6/ZPd2ZgGIQIX4585dEMGc3PJ1S
	jU0raJhkI4M5jodLjAzIG/XpC88HqjgsK3dqbxS6duo6NX1RN5eeI3xdv/G/3g7tbpXQBhScWW/zK
	QaERE6UwTTvclCVX/Crg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzQCt-0007Xd-B8; Sun, 18 Aug 2019 18:47:11 +0000
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzQCp-0007Wu-NJ
 for linux-afs@lists.infradead.org; Sun, 18 Aug 2019 18:47:09 +0000
Received: by mail-io1-f70.google.com with SMTP id q26so1674149ioi.10
 for <linux-afs@lists.infradead.org>; Sun, 18 Aug 2019 11:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=zDgZNUFDgGstctQhA5e9B3Yy/pHKkUvS8U2iUc3RWJc=;
 b=JTK2ms3odSbavuYHy/+PO3ROzclwmM5rXohY8nrQcy91xPBaKbBwQp3BrhmAtk+6vh
 OUpWQkVUL1/uaQ7xCvlxHgy/uEJgZd/S3sTVcuCiSIMG/paVu6mxrpj3ZtLNNeFMzeZi
 uMIHFEI29EozAmUmIT431Ge2KY52nozIha7hyFZUY3Q2grAAKx951gNkdpgaHB1dRrtG
 D/fQOJ8Q/BDALZuA2U/ua0XiEPCJPv9OcQfiJB7ehZjBShFgp7gDQWLrfZDGL81IySub
 2jfC/s+XJtbZ6/KzicZ5hWiMepXSXspTDMSUyHcoTZcK5DoEEH+37pabHOZGt5lWozQg
 +qiw==
X-Gm-Message-State: APjAAAXH1TUKFvN+OEqAIw4udkD5sdbcSQuDkjykzH3EEHlQUc90P+qI
 DRo8FRMiTzXR+XTeNfEUhydHBkkD/hTGBD5+ouLUQnqDmdpU
X-Google-Smtp-Source: APXvYqyCe0YYoEWtGbv/2uf8ztOrkSCn1II2bREdkWZ+sft0RqrJ3w9DoWKiuLFFm7detM37UBrYjkFOl1a27HlPGKQpn4X5qwyz
MIME-Version: 1.0
X-Received: by 2002:a6b:cd07:: with SMTP id d7mr20708646iog.150.1566154026241; 
 Sun, 18 Aug 2019 11:47:06 -0700 (PDT)
Date: Sun, 18 Aug 2019 11:47:06 -0700
In-Reply-To: <0000000000004c2416058c594b30@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000065d943059068a632@google.com>
Subject: Re: kernel BUG at net/rxrpc/local_object.c:LINE!
From: syzbot <syzbot+1e0edc4b8b7494c28450@syzkaller.appspotmail.com>
To: davem@davemloft.net, dhowells@redhat.com, dvyukov@google.com, 
 ebiggers@kernel.org, linux-afs@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190818_114707_762151_2EB91A1D 
X-CRM114-Status: UNSURE (   5.40  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 3.1 (+++)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (3.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.70 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.70 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
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

HEAD commit:    0c3d3d64 Add linux-next specific files for 20190816
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=108b58f2600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dffdf1e146f941f4
dashboard link: https://syzkaller.appspot.com/bug?extid=1e0edc4b8b7494c28450
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13feb73c600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=127088f2600000

The bug was bisected to:

commit 46894a13599a977ac35411b536fb3e0b2feefa95
Author: David Howells <dhowells@redhat.com>
Date:   Thu Oct 4 08:32:28 2018 +0000

     rxrpc: Use IPv4 addresses throught the IPv6

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=152fabe3a00000
final crash:    https://syzkaller.appspot.com/x/report.txt?x=172fabe3a00000
console output: https://syzkaller.appspot.com/x/log.txt?x=132fabe3a00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+1e0edc4b8b7494c28450@syzkaller.appspotmail.com
Fixes: 46894a13599a ("rxrpc: Use IPv4 addresses throught the IPv6")

rxrpc: Assertion failed
------------[ cut here ]------------
kernel BUG at net/rxrpc/local_object.c:433!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.3.0-rc4-next-20190816 #67
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: krxrpcd rxrpc_local_processor
RIP: 0010:rxrpc_local_destroyer net/rxrpc/local_object.c:433 [inline]
RIP: 0010:rxrpc_local_processor.cold+0x24/0x29 net/rxrpc/local_object.c:466
Code: df a1 bc fa 0f 0b e8 c4 2b d3 fa 48 c7 c7 e0 24 5b 88 e8 cc a1 bc fa  
0f 0b e8 b1 2b d3 fa 48 c7 c7 e0 24 5b 88 e8 b9 a1 bc fa <0f> 0b 90 90 90  
55 48 89 e5 41 57 49 89 ff 41 56 41 55 41 54 53 48
RSP: 0018:ffff8880a98d7ce8 EFLAGS: 00010282
RAX: 0000000000000017 RBX: ffff88808c90a978 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff815bb906 RDI: ffffed101531af8f
RBP: ffff8880a98d7d30 R08: 0000000000000017 R09: ffffed1015d060d9
R10: ffffed1015d060d8 R11: ffff8880ae8306c7 R12: ffff88808c90a208
R13: ffff88808dc48648 R14: ffff88808c90a940 R15: ffff8880929faa00
FS:  0000000000000000(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000049f2b0 CR3: 0000000008e6d000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  process_one_work+0x9af/0x1740 kernel/workqueue.c:2269
  worker_thread+0x98/0xe40 kernel/workqueue.c:2415
  kthread+0x361/0x430 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Modules linked in:
---[ end trace c65e44ef4b16c854 ]---
RIP: 0010:rxrpc_local_destroyer net/rxrpc/local_object.c:433 [inline]
RIP: 0010:rxrpc_local_processor.cold+0x24/0x29 net/rxrpc/local_object.c:466
Code: df a1 bc fa 0f 0b e8 c4 2b d3 fa 48 c7 c7 e0 24 5b 88 e8 cc a1 bc fa  
0f 0b e8 b1 2b d3 fa 48 c7 c7 e0 24 5b 88 e8 b9 a1 bc fa <0f> 0b 90 90 90  
55 48 89 e5 41 57 49 89 ff 41 56 41 55 41 54 53 48
RSP: 0018:ffff8880a98d7ce8 EFLAGS: 00010282
RAX: 0000000000000017 RBX: ffff88808c90a978 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff815bb906 RDI: ffffed101531af8f
RBP: ffff8880a98d7d30 R08: 0000000000000017 R09: ffffed1015d060d9
R10: ffffed1015d060d8 R11: ffff8880ae8306c7 R12: ffff88808c90a208
R13: ffff88808dc48648 R14: ffff88808c90a940 R15: ffff8880929faa00
FS:  0000000000000000(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffff600400 CR3: 000000009b982000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
