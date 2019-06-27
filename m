Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5174B58DA3
	for <lists+linux-afs@lfdr.de>; Fri, 28 Jun 2019 00:08:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Z4A3kdIUYyZH6lfY3lkZ7fHGy9mboMl42LvP+yMUXY=; b=CmVk0VQsMpNtLZ
	eF8Y66XoMgKc7WTooErri5OXqpAb6wBBNDII38FIZ4cdKIYgIhfYMySlPeU2Y1zef/pql2MsiBsXH
	6ufnMIPOJvozmDXVKylpk8JPPzqWfEvqkOKavdFZi3AYMUbIpvq9IUEiidETZNWf6HZEaBSggDdiq
	+gJKulzjSVKFrj5BtFRi8VHscbMoB+BaGwBjfUsDE77/OZzlNFrSosZJ0dqyt9kMzeiKgIMMOlBBt
	mJ/LHrgwvipea5U/ab08p5GJvsSXQmJzLMqGsRDLhgJpCFH3A2HQJcIC4cn8y5MP8W4+7Epa3/MY5
	K8BRdkctU7jm6BH1Tk8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgcYo-0004gi-Dd; Thu, 27 Jun 2019 22:08:06 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgbRE-0002ms-Ao
 for linux-afs@lists.infradead.org; Thu, 27 Jun 2019 20:56:13 +0000
Received: by mail-ed1-x544.google.com with SMTP id r12so8435226edo.5
 for <linux-afs@lists.infradead.org>; Thu, 27 Jun 2019 13:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5hQN5lyIHEpTv7mFta9htRreGSrkPoUPCfBEx1FHIS8=;
 b=nkpdkb28HbplV1bfy7uvGah0hsYcvrLasORikLtmvxoS46eMqkWvdYMa+2+/00UeaQ
 lnMO0fXVsd812yWSY9uamDr/FSlfXtn9P1mZMC/0KNP4219GBbYQPtjoi29R8YxWnhFi
 fPiDYRVx6OHlIamr6YZy56FrF2oEOD3CWGmsY8CTA+T+O0hpaI8qJo9ZzI/VxURaVo2f
 EEw5RbZ5ICe5wi9T5cjCKj0KN6mWgoIufgOdatq9yBWVdEBKn4k33TIzNX0qoWuCxxyW
 oJ65d45MkOj7l/+Yxr6EI0bBotmYjq79h9WdcpQVxu/C1qDhIKna+jObqKE13Mtgsiy5
 rakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5hQN5lyIHEpTv7mFta9htRreGSrkPoUPCfBEx1FHIS8=;
 b=eNk3MIhzVwSAnuONz959A2jwZZZTnGO5Er3Ez1ouWJ9crCYwGicGLnEYkbxvltKgH8
 cIg69bK7lVUAvuCVhd0xEgYbHccShp6F3j3NLbbfwV+tjmh+jAc72DriV90T36LgbHrU
 a/SBmVG6y1nvHnV16ArZeWpszUxZrwKGOXV4esYf7Clz/ELo5xBFiykWA2tlbPlhBsiv
 fEtAIfmrux5esEKvB/oxZ+RCAzZUzCnOxru3Yq16aFOL8i9Q0puiqR8I+eeSsbfYCzyg
 r17Zg7QLo0Vb8BolmmG/3I8tIGs28UqVKFIn6gst/xAd7lgJsg4RYwbHogCPxQ6yR+OB
 oklQ==
X-Gm-Message-State: APjAAAXECpGJmH9Qx5rrzhLWdJjtM1jE+zstvQO3kAq+pF9/mP1zqA93
 UL36Qk7GxF6dv5uS1JyP6lAaDckw2zavf1LCs6M=
X-Google-Smtp-Source: APXvYqzDC9Ne5Od8zZD5gMzJSAbOt1FAMQ+X01MBXVaKuIZbOyjWpuDQ0yh1sKMjvGwyiTXig8YKo5kiEO8Cdob+wG0=
X-Received: by 2002:a17:906:1108:: with SMTP id
 h8mr5028549eja.229.1561668965618; 
 Thu, 27 Jun 2019 13:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <156096279115.28733.8761881995303698232.stgit@warthog.procyon.org.uk>
 <156096287188.28733.15342608110117616221.stgit@warthog.procyon.org.uk>
In-Reply-To: <156096287188.28733.15342608110117616221.stgit@warthog.procyon.org.uk>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Thu, 27 Jun 2019 16:55:29 -0400
Message-ID: <CAF=yD-Kgdwt5=0iboxhvZz4zvNewSGow74U15mQQvO1u8VUGcw@mail.gmail.com>
Subject: Re: [PATCH 8/9] keys: Network namespace domain tag [ver #4]
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_135612_381060_0FD21872 
X-CRM114-Status: GOOD (  16.12  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2a00:1450:4864:20:0:0:0:544 listed in]
 [list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (willemdebruijn.kernel[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Mailman-Approved-At: Thu, 27 Jun 2019 15:08:05 -0700
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 Network Development <netdev@vger.kernel.org>, dwalsh@redhat.com,
 LKML <linux-kernel@vger.kernel.org>, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>,
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org,
 vgoyal@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, Jun 19, 2019 at 12:49 PM David Howells <dhowells@redhat.com> wrote:
>
> Create key domain tags for network namespaces and make it possible to
> automatically tag keys that are used by networked services (e.g. AF_RXRPC,
> AFS, DNS) with the default network namespace if not set by the caller.
>
> This allows keys with the same description but in different namespaces to
> coexist within a keyring.
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: netdev@vger.kernel.org
> cc: linux-nfs@vger.kernel.org
> cc: linux-cifs@vger.kernel.org
> cc: linux-afs@lists.infradead.org
> ---

> diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
> index 711b161505ac..076a75c73c9e 100644
> --- a/net/core/net_namespace.c
> +++ b/net/core/net_namespace.c
> @@ -38,9 +38,16 @@ EXPORT_SYMBOL_GPL(net_namespace_list);
>  DECLARE_RWSEM(net_rwsem);
>  EXPORT_SYMBOL_GPL(net_rwsem);
>
> +#ifdef CONFIG_KEYS
> +static struct key_tag init_net_key_domain = { .usage = REFCOUNT_INIT(1) };
> +#endif
> +
>  struct net init_net = {
>         .count          = REFCOUNT_INIT(1),
>         .dev_base_head  = LIST_HEAD_INIT(init_net.dev_base_head),
> +#ifdef CONFIG_KEYS
> +       .key_domain     = &init_net_key_domain,
> +#endif
>  };
>  EXPORT_SYMBOL(init_net);
>
> @@ -386,10 +393,21 @@ static struct net *net_alloc(void)
>         if (!net)
>                 goto out_free;
>
> +#ifdef CONFIG_KEYS
> +       net->key_domain = kzalloc(sizeof(struct key_tag), GFP_KERNEL);
> +       if (!net->key_domain)
> +               goto out_free_2;
> +       refcount_set(&net->key_domain->usage, 1);
> +#endif
> +
>         rcu_assign_pointer(net->gen, ng);
>  out:
>         return net;
>
> +#ifdef CONFIG_KEYS
> +out_free_2:
> +       kmem_cache_free(net_cachep, net);

needs
            net = NULL;

to signal failure

> +#endif
>  out_free:
>         kfree(ng);
>         goto out;

Reported-by: syzbot <syzkaller@googlegroups.com>

BUG: KASAN: use-after-free in atomic_set
include/asm-generic/atomic-instrumented.h:44 [inline]
BUG: KASAN: use-after-free in refcount_set include/linux/refcount.h:32 [inline]
BUG: KASAN: use-after-free in copy_net_ns+0x1e8/0x431
net/core/net_namespace.c:466
Write of size 4 at addr ffff88809c9de080 by task syz-executor.1/12624

CPU: 1 PID: 12624 Comm: syz-executor.1 Not tainted 5.2.0-rc6-next-20190626 #23
Hardware name: Google Google Compute Engine/Google Compute Engine,
BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x172/0x1f0 lib/dump_stack.c:113
 print_address_description.cold+0xd4/0x306 mm/kasan/report.c:351
 __kasan_report.cold+0x1b/0x36 mm/kasan/report.c:482
 kasan_report+0x12/0x17 mm/kasan/common.c:614
 check_memory_region_inline mm/kasan/generic.c:185 [inline]
 check_memory_region+0x123/0x190 mm/kasan/generic.c:191
 kasan_check_write+0x14/0x20 mm/kasan/common.c:100
 atomic_set include/asm-generic/atomic-instrumented.h:44 [inline]
 refcount_set include/linux/refcount.h:32 [inline]
 copy_net_ns+0x1e8/0x431 net/core/net_namespace.c:466
 create_new_namespaces+0x400/0x7b0 kernel/nsproxy.c:103
 unshare_nsproxy_namespaces+0xc2/0x200 kernel/nsproxy.c:202
 ksys_unshare+0x444/0x980 kernel/fork.c:2828
 __do_sys_unshare kernel/fork.c:2896 [inline]
 __se_sys_unshare kernel/fork.c:2894 [inline]
 __x64_sys_unshare+0x31/0x40 kernel/fork.c:2894
 do_syscall_64+0xfd/0x6a0 arch/x86/entry/common.c:301
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x459519
Code: fd b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48
89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
01 f0 ff ff 0f 83 cb b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f2202261c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000110
RAX: ffffffffffffffda RBX: 00007f2202261c90 RCX: 0000000000459519
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000040000000
RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f22022626d4
R13: 00000000004c8a2c R14: 00000000004df7d0 R15: 0000000000000006

Allocated by task 12624:
 save_stack+0x23/0x90 mm/kasan/common.c:71
 set_track mm/kasan/common.c:79 [inline]
 __kasan_kmalloc mm/kasan/common.c:489 [inline]
 __kasan_kmalloc.constprop.0+0xcf/0xe0 mm/kasan/common.c:462
 kasan_slab_alloc+0xf/0x20 mm/kasan/common.c:497
 slab_post_alloc_hook mm/slab.h:520 [inline]
 slab_alloc mm/slab.c:3320 [inline]
 kmem_cache_alloc+0x121/0x710 mm/slab.c:3484
 kmem_cache_zalloc include/linux/slab.h:737 [inline]
 net_alloc net/core/net_namespace.c:410 [inline]
 copy_net_ns+0xf1/0x431 net/core/net_namespace.c:461
 create_new_namespaces+0x400/0x7b0 kernel/nsproxy.c:103
 unshare_nsproxy_namespaces+0xc2/0x200 kernel/nsproxy.c:202
 ksys_unshare+0x444/0x980 kernel/fork.c:2828
 __do_sys_unshare kernel/fork.c:2896 [inline]
 __se_sys_unshare kernel/fork.c:2894 [inline]
 __x64_sys_unshare+0x31/0x40 kernel/fork.c:2894
 do_syscall_64+0xfd/0x6a0 arch/x86/entry/common.c:301
 entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 12624:
 save_stack+0x23/0x90 mm/kasan/common.c:71
 set_track mm/kasan/common.c:79 [inline]
 __kasan_slab_free+0x102/0x150 mm/kasan/common.c:451
 kasan_slab_free+0xe/0x10 mm/kasan/common.c:459
 __cache_free mm/slab.c:3426 [inline]
 kmem_cache_free+0x86/0x320 mm/slab.c:3694
 net_alloc net/core/net_namespace.c:427 [inline]
 copy_net_ns+0x3b1/0x431 net/core/net_namespace.c:461
 create_new_namespaces+0x400/0x7b0 kernel/nsproxy.c:103
 unshare_nsproxy_namespaces+0xc2/0x200 kernel/nsproxy.c:202
 ksys_unshare+0x444/0x980 kernel/fork.c:2828
 __do_sys_unshare kernel/fork.c:2896 [inline]
 __se_sys_unshare kernel/fork.c:2894 [inline]
 __x64_sys_unshare+0x31/0x40 kernel/fork.c:2894
 do_syscall_64+0xfd/0x6a0 arch/x86/entry/common.c:301
 entry_SYSCALL_64_after_hwframe+0x49/0xbe

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
