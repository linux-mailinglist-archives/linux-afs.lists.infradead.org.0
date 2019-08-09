Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id F366D87809
	for <lists+linux-afs@lfdr.de>; Fri,  9 Aug 2019 12:58:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hllXcDFo/5WaW2cBoXQoQcrfvHm/knd1SQvLAkrPqQE=; b=StlbFQ+FysOv9m
	cr0sAHnOdk/O0o8wPLO4XrwbugFVKIwR/Wj0JqPsKeMbysVeVaSnT+4s5/4j3wFXw/1DO6pQ68O1H
	cbQ90sV0vy6Qb/WuroUgt3WC54STqCGw6S1V12EN8LES+vw9kt5AA5AB6Dx+b9FCCjNJVQA0ShVot
	NSDdJfyyH1fsu47WYMnSnpnWb5Jw+WfBwMamrHxKQmdkTsq/WK49s/txrU9LcsqdH40eqK0nhkZq/
	rwC6/3I10Q+COh9/wPiAdc1iVMBSA8S47fGGgbOi4yH4a5RMFY9W14DmXirR0c0TQW9g1SieHzn8h
	hR8AxJVeGFIk9M9a51nA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hw2b5-0003aP-PV; Fri, 09 Aug 2019 10:58:11 +0000
Received: from mail-ot1-f71.google.com ([209.85.210.71])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw2b1-0003Zl-Ah
 for linux-afs@lists.infradead.org; Fri, 09 Aug 2019 10:58:10 +0000
Received: by mail-ot1-f71.google.com with SMTP id a8so67922525oti.8
 for <linux-afs@lists.infradead.org>; Fri, 09 Aug 2019 03:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=mUAdjdWVqLEji+9QaZjr6SC7lAukAXPaOBa5eBib/zQ=;
 b=dPfvm4urdab5hTWQFgevcIY92XEOHebv2Worvhw9bvFqQNHfZ6K2Loq0koOgaEHvZa
 YYdBBxFg1tKQGq2Z7WoAaENBLPVB20cfyZA4XseTclFXDNcyUpmwqZJyMSPQX+MapiE8
 4La4/W8X7RFK1GfOwIRKGMRAnXbADuvW8mvu+OZPqQpKbrKVUIrv+IUuKnAwrGCDpujE
 bKXLQDiotO2NwJsfl455MMdEut20eQRF8tUEwL4eoopfeW1/gkDRjXbp/dGjny0XEzOf
 Nnc/7y4+1/LbMtGS9GMHjTqJXIZD9wy3qVzW96ADEE6vpAH9QNEdHH2cPbXNL4tITBMG
 /s9g==
X-Gm-Message-State: APjAAAWe6giBzsFQtMZenq54bz1jzd8ZflQoIAjHWWezdddw+uRalDI7
 /p+nBn3ESEwX5eL2KdOOdY76LKE3p+QOtRrJu70MS+exNw2X
X-Google-Smtp-Source: APXvYqzfxc+WwHQY5PBUiXp07yIZY9T57CR+iHoYVMfbZymKTn0MCiZnMfMSJrsjUldT/7ClvmsuVvR5jWyz41ngOahYU63+uD9g
MIME-Version: 1.0
X-Received: by 2002:a5d:924e:: with SMTP id e14mr19114492iol.215.1565348286229; 
 Fri, 09 Aug 2019 03:58:06 -0700 (PDT)
Date: Fri, 09 Aug 2019 03:58:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008cf14e058fad0c41@google.com>
Subject: KASAN: null-ptr-deref Write in rxrpc_unuse_local
From: syzbot <syzbot+20dee719a2e090427b5f@syzkaller.appspotmail.com>
To: davem@davemloft.net, dhowells@redhat.com, linux-afs@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190809_035808_472449_8CF7F123 
X-CRM114-Status: UNSURE (   3.55  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.6 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.6 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.71 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.71 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hello,

syzbot found the following crash on:

HEAD commit:    87b983f5 Add linux-next specific files for 20190809
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=143aecee600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=28eea330e11df0eb
dashboard link: https://syzkaller.appspot.com/bug?extid=20dee719a2e090427b5f
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17ceae36600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10ebc40e600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+20dee719a2e090427b5f@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: null-ptr-deref in atomic_sub_return  
include/asm-generic/atomic-instrumented.h:159 [inline]
BUG: KASAN: null-ptr-deref in atomic_dec_return  
include/linux/atomic-fallback.h:455 [inline]
BUG: KASAN: null-ptr-deref in rxrpc_unuse_local+0x23/0x70  
net/rxrpc/local_object.c:405
Write of size 4 at addr 0000000000000010 by task syz-executor725/10010

CPU: 1 PID: 10010 Comm: syz-executor725 Not tainted 5.3.0-rc3-next-20190809  
#63
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x172/0x1f0 lib/dump_stack.c:113
  __kasan_report.cold+0x5/0x36 mm/kasan/report.c:486
  kasan_report+0x12/0x17 mm/kasan/common.c:610
  check_memory_region_inline mm/kasan/generic.c:185 [inline]
  check_memory_region+0x134/0x1a0 mm/kasan/generic.c:192
  __kasan_check_write+0x14/0x20 mm/kasan/common.c:98
  atomic_sub_return include/asm-generic/atomic-instrumented.h:159 [inline]
  atomic_dec_return include/linux/atomic-fallback.h:455 [inline]
  rxrpc_unuse_local+0x23/0x70 net/rxrpc/local_object.c:405
  rxrpc_release_sock net/rxrpc/af_rxrpc.c:904 [inline]
  rxrpc_release+0x47d/0x840 net/rxrpc/af_rxrpc.c:930
  __sock_release+0xce/0x280 net/socket.c:590
  sock_close+0x1e/0x30 net/socket.c:1268
  __fput+0x2ff/0x890 fs/file_table.c:280
  ____fput+0x16/0x20 fs/file_table.c:313
  task_work_run+0x145/0x1c0 kernel/task_work.c:113
  exit_task_work include/linux/task_work.h:22 [inline]
  do_exit+0x92f/0x2e50 kernel/exit.c:879
  do_group_exit+0x135/0x360 kernel/exit.c:983
  __do_sys_exit_group kernel/exit.c:994 [inline]
  __se_sys_exit_group kernel/exit.c:992 [inline]
  __x64_sys_exit_group+0x44/0x50 kernel/exit.c:992
  do_syscall_64+0xfa/0x760 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x43ed68
Code: Bad RIP value.
RSP: 002b:00007ffc2b7b93f8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 000000000043ed68
RDX: 0000000000000000 RSI: 000000000000003c RDI: 0000000000000000
RBP: 00000000004be568 R08: 00000000000000e7 R09: ffffffffffffffd0
R10: 00000000ffffffff R11: 0000000000000246 R12: 0000000000000001
R13: 00000000006d0180 R14: 0000000000000000 R15: 0000000000000000
==================================================================


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
