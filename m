Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D2297E0E50
	for <lists+linux-afs@lfdr.de>; Wed, 23 Oct 2019 00:44:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+Bgc7yefi8hlpn0RDwpUNeCLcEYE0s+5V0t4v8hwTlg=; b=CJiYm4TEG15GwF
	5PGFcAoB6Ug7zsmfwizSJ1R+zYexRyWTLrgMrSHReb2eVG67v3pHp2NwtmkZ3coPlLTe4oAwYz3me
	Ng6rcmorP6W1SMAYim1jdGelrwimh92PoUdMwpcd0eRPz4hbcsFYWZ37i0VyE86aU2ZyHSegkIzCr
	eyLoEBhDQaMZ0RMcugId1J9Ja5l7zrwsLHBnKjasPAr/Efecy5ZtGPFHRuDHIgkxm/m6Mah/QAj8a
	F9ywLWippImNLjy0DlOz1DXa1FfBbPwS1SOhm/KEVIuGF9O6ihTL7qBNLMDfsg5hgVPGjLmuyvw3I
	QxT9iFud0ToowezuDeqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iN2sz-00068s-4k; Tue, 22 Oct 2019 22:44:17 +0000
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iN2sw-00068X-Kq
 for linux-afs@lists.infradead.org; Tue, 22 Oct 2019 22:44:16 +0000
Received: by mail-io1-f72.google.com with SMTP id s19so1086796ioe.8
 for <linux-afs@lists.infradead.org>; Tue, 22 Oct 2019 15:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=n8AthPz5EJS+41jvmzMtDwkf5FjVXZx9cmlJKclfd/M=;
 b=BxBq0jlXoX63wEMuA+++EI0SgUtXGfORZTWIAVu/j2NriZ3KuIMoGcSHutF7Jtq4Zk
 1KxC/V2Q6GjosyCEL+r0WoNoqXPkLvMtUrWCsYva3WLBEohkeus5wepkazL3n82ydPDb
 i1wXLcte58Atd/p+9PKphgRWgMMzq4jdnW8UjmlSd95tNvz+Z6rppAt8kXW1OGKCthzZ
 kf25HIyoARAeCHDRxLgnS1hGtQs4wf07IUA+s9PNwRmkJL2EEefHHiIFw6NvBylfV11B
 zKoPdnOPda6XB6xXCU6I9F5miBh8YNPqPIJi6uA2DxTjZb4CJtAJbJ5vBvLSLE1r1Qlr
 ETMQ==
X-Gm-Message-State: APjAAAV7oHrBHM7Z0jK8HoldHCd0hnuMnd4oZW1+uhsJI3cNDFLePUxu
 NvjryHFhanTGgRPzLEE6Q5iXvIMw2Igk8oQ5UDrM3NGj/5Pm
X-Google-Smtp-Source: APXvYqy8SHCJO8nVqDVFjtRO0viqI7sq50268hI2BxRPY53Spf82Y2/LvjiTliYN9zGkl6aZIGnO0+zVoltc7aACBjopLIVrFuUr
MIME-Version: 1.0
X-Received: by 2002:a92:9c94:: with SMTP id x20mr1571289ill.149.1571784252347; 
 Tue, 22 Oct 2019 15:44:12 -0700 (PDT)
Date: Tue, 22 Oct 2019 15:44:12 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000065d240595878a92@google.com>
Subject: memory leak in rxrpc_lookup_local
From: syzbot <syzbot+305326672fed51b205f7@syzkaller.appspotmail.com>
To: davem@davemloft.net, dhowells@redhat.com, linux-afs@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_154414_683377_5FCC5C92 
X-CRM114-Status: UNSURE (   3.48  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.6 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.6 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.72 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.72 listed in wl.mailspike.net]
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

HEAD commit:    4fe34d61 Merge branch 'x86-urgent-for-linus' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11b21d40e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cd7f8e43c7bdf83a
dashboard link: https://syzkaller.appspot.com/bug?extid=305326672fed51b205f7
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10e692ff600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10af816b600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+305326672fed51b205f7@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff888121f35e00 (size 256):
   comm "syz-executor362", pid 6892, jiffies 4294941791 (age 7.710s)
   hex dump (first 32 bytes):
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
     00 00 00 00 09 00 00 00 00 80 e7 21 81 88 ff ff  ...........!....
   backtrace:
     [<000000006221752a>] kmemleak_alloc_recursive  
include/linux/kmemleak.h:43 [inline]
     [<000000006221752a>] slab_post_alloc_hook mm/slab.h:586 [inline]
     [<000000006221752a>] slab_alloc mm/slab.c:3319 [inline]
     [<000000006221752a>] kmem_cache_alloc_trace+0x145/0x2c0 mm/slab.c:3548
     [<000000006ee28c35>] kmalloc include/linux/slab.h:556 [inline]
     [<000000006ee28c35>] kzalloc include/linux/slab.h:690 [inline]
     [<000000006ee28c35>] rxrpc_alloc_local net/rxrpc/local_object.c:79  
[inline]
     [<000000006ee28c35>] rxrpc_lookup_local+0x1aa/0x750  
net/rxrpc/local_object.c:277
     [<000000009255b1c3>] rxrpc_bind+0x131/0x1e0 net/rxrpc/af_rxrpc.c:149
     [<00000000d7bcf378>] __sys_bind+0x11c/0x140 net/socket.c:1647
     [<00000000c269c3cb>] __do_sys_bind net/socket.c:1658 [inline]
     [<00000000c269c3cb>] __se_sys_bind net/socket.c:1656 [inline]
     [<00000000c269c3cb>] __x64_sys_bind+0x1e/0x30 net/socket.c:1656
     [<000000000444b7d1>] do_syscall_64+0x73/0x1f0  
arch/x86/entry/common.c:290
     [<000000001700d564>] entry_SYSCALL_64_after_hwframe+0x44/0xa9



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
