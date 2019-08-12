Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3C18984D
	for <lists+linux-afs@lfdr.de>; Mon, 12 Aug 2019 09:52:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cmn1j4qeFqjOKw3e+l8BTkSTm0xmZXb6g8xe9i1FnFg=; b=VZ/9AAB60Pcol/
	ks5+Kw4OoUKPD9+VgSVcKBWCKMR0wJs2+6o0kGcDT0kklRReMYmDQZc9nLSXmelz1ZYbnLvOENv4v
	vwTsrdMjyO/nbqOUK7nDyI4wSuSgyJ9E4/kRUmsFnvDqs4ljmPkzsIga3ITdPyezN6GUtTVFtUf0M
	XpVMpM7XsEBQUNcHUAIgS4V84AheLJBdqvTX3Ed3pjmijOPbQjtXB4AEE0rh/JFK1Fbc3nErrGTwy
	m6FOMljH5STtDA0QUVcZLeK2pLldLIb2w1aBWzDuh9iVhuIV5T8QeyEQ+abSIc5KfmIfxljHw2FS4
	Mhlq/WcZjTLuH0q+VlJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx57w-0005V3-52; Mon, 12 Aug 2019 07:52:24 +0000
Received: from mail-ot1-f69.google.com ([209.85.210.69])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx57f-0005OS-VQ
 for linux-afs@lists.infradead.org; Mon, 12 Aug 2019 07:52:09 +0000
Received: by mail-ot1-f69.google.com with SMTP id p7so82994522otk.22
 for <linux-afs@lists.infradead.org>; Mon, 12 Aug 2019 00:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=OH93fWca/4l2t0OPYY7fQBiJZLVUQD1baC/AK+EW1xM=;
 b=Qts3a5u7U/DGljSLGiEbmrQVsFnJVJpR3HCkSFpQ8E4wUzNFpazrA5v6/0+TO+K5CR
 LnytI5JXoOH+Bi0EQZtnbylHEGZioOab4VhlWPpW+uWOwFN0PQYSWA3KfvCA+dWttamP
 dNHLE0ajl7MmknayAPWI59ksu2ODlqO81ayTRW7qh1cSBOi46Vp4+9VFbBOtMU7xwQp1
 E9UpJ7oP7hfgwovKoj/qJ80KveDKB21hsr6DEjK3k/y5hhDkTsMMVbjrsx1xKZzl+IFz
 Oe4QbU244OrWdzWdq5loChsBE4jQu2fM+66brzCu/8maLY+d/DoCIFYJExk3aVmCkpwP
 KkLw==
X-Gm-Message-State: APjAAAVKnHTUt37E4ghaZ7YvgExVbc6IIxAtwT08XhXItkYdDeheCail
 2q07o3JwzuXfkYWyE3tjT2/PEmKdSudpoBAKSPAmSWxsnCp9
X-Google-Smtp-Source: APXvYqwjiuV14Ib/83tW7qKM3T1Y2FExDsRucLSOJrDxuYNKhCV9LdWnoTshXT4NGQ2cThhzidZhEwAYvcga5JwZ5LB8Vb9GWJt5
MIME-Version: 1.0
X-Received: by 2002:a02:a503:: with SMTP id e3mr15886876jam.134.1565596325373; 
 Mon, 12 Aug 2019 00:52:05 -0700 (PDT)
Date: Mon, 12 Aug 2019 00:52:05 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d5f091058fe6cc6a@google.com>
Subject: BUG: unable to handle kernel NULL pointer dereference in
 rxrpc_unuse_local
From: syzbot <syzbot+ae09baad492cce05644a@syzkaller.appspotmail.com>
To: davem@davemloft.net, dhowells@redhat.com, linux-afs@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_005208_138248_9340C5C8 
X-CRM114-Status: UNSURE (   5.81  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.6 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.6 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.69 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.69 listed in wl.mailspike.net]
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

HEAD commit:    57c722e9 net/tls: swap sk_write_space on close
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=13e6c6ee600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a4c9e9f08e9e8960
dashboard link: https://syzkaller.appspot.com/bug?extid=ae09baad492cce05644a
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+ae09baad492cce05644a@syzkaller.appspotmail.com

BUG: kernel NULL pointer dereference, address: 0000000000000010
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD 8bbd0067 P4D 8bbd0067 PUD 907a2067 PMD 0
Oops: 0002 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 11895 Comm: syz-executor.3 Not tainted 5.3.0-rc3+ #157
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:arch_atomic_add_return arch/x86/include/asm/atomic.h:167 [inline]
RIP: 0010:arch_atomic_sub_return arch/x86/include/asm/atomic.h:179 [inline]
RIP: 0010:atomic_sub_return include/asm-generic/atomic-instrumented.h:160  
[inline]
RIP: 0010:atomic_dec_return include/linux/atomic-fallback.h:455 [inline]
RIP: 0010:rxrpc_unuse_local+0x23/0x70 net/rxrpc/local_object.c:405
Code: 1f 84 00 00 00 00 00 55 48 89 e5 41 54 49 89 fc 53 bb ff ff ff ff e8  
4c 1a d7 fa 49 8d 7c 24 10 be 04 00 00 00 e8 8d 09 11 fb <f0> 41 0f c1 5c  
24 10 bf 01 00 00 00 89 de e8 aa 1b d7 fa 83 fb 01
RSP: 0018:ffff88806ab1fb28 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 00000000ffffffff RCX: ffffffff869b6f43
RDX: 0000000000000001 RSI: 0000000000000004 RDI: 0000000000000010
RBP: ffff88806ab1fb38 R08: ffff88805f40a480 R09: ffffed1010e9310f
R10: ffffed1010e9310e R11: ffff888087498877 R12: 0000000000000000
R13: ffff88805f48cd92 R14: ffff888087498680 R15: ffff88805f48d208
FS:  00007fe68c1f5700(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000010 CR3: 00000000a1353000 CR4: 00000000001406f0
Call Trace:
  rxrpc_release_sock net/rxrpc/af_rxrpc.c:904 [inline]
  rxrpc_release+0x47d/0x840 net/rxrpc/af_rxrpc.c:930
  __sock_release+0xce/0x280 net/socket.c:590
  sock_close+0x1e/0x30 net/socket.c:1268
  __fput+0x2ff/0x890 fs/file_table.c:280
  ____fput+0x16/0x20 fs/file_table.c:313
  task_work_run+0x145/0x1c0 kernel/task_work.c:113
  get_signal+0x2078/0x2500 kernel/signal.c:2523
  do_signal+0x87/0x1700 arch/x86/kernel/signal.c:815
  exit_to_usermode_loop+0x286/0x380 arch/x86/entry/common.c:159
  prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
  do_syscall_64+0x5a9/0x6a0 arch/x86/entry/common.c:299
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x459829
Code: fd b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 cb b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007fe68c1f4c78 EFLAGS: 00000246 ORIG_RAX: 000000000000010f
RAX: 0000000000000003 RBX: 0000000000000005 RCX: 0000000000459829
RDX: 0000000020003440 RSI: 0000000000000005 RDI: 00000000200033c0
RBP: 000000000075c070 R08: 0000000000000008 R09: 0000000000000000
R10: 0000000020003480 R11: 0000000000000246 R12: 00007fe68c1f56d4
R13: 00000000004c6706 R14: 00000000004db7b8 R15: 00000000ffffffff
Modules linked in:
CR2: 0000000000000010


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
