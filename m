Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A50D21937
	for <lists+linux-afs@lfdr.de>; Fri, 17 May 2019 15:33:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:From:Content-ID:
	MIME-Version:Subject:To:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2fR4oOf/J44LB0F6tcZtahiDqY+AxpxvSxfsk+IT7uU=; b=L0q2NVAqhcdYKd
	eYTR9wqGbMvf9UC2zvfeyUF91JbkbbfmY5sS7ZIAmQ9GXy9fyBrVocr7GQeWls1jwUBLyU+UeDM/y
	gBOZBsZtv6P78XykKCUJa/NKkIEEEDm0K/SJEB7LI2ENO3SE2hmhT9CeaxTtPlhBbn2aAiRxyH3uQ
	jdJn3jr7LAAby8piApj1jbemasw3pUXzPArPwZd/fulwpD1uuW588HAkYICjGgbn8u9SRpXlqscjf
	cACfj6RMepj+CH2DBPtaTIGrRAhhpw8/iVov5Dt4OaSRk90Q0rWz39rxblLvmm6Katp/tvvGpfIMN
	vzVHdu1XeKyl2KoRXGkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRczb-0007lY-4W; Fri, 17 May 2019 13:33:47 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRczY-0007lC-2v
 for linux-afs@lists.infradead.org; Fri, 17 May 2019 13:33:45 +0000
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B95497E9F9;
 Fri, 17 May 2019 13:33:32 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57A4B5C231;
 Fri, 17 May 2019 13:33:30 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
To: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: oops in netfilter
MIME-Version: 1.0
Content-ID: <7205.1558099956.1@warthog.procyon.org.uk>
From: David Howells <dhowells@redhat.com>
Date: Fri, 17 May 2019 14:33:24 +0100
Message-ID: <7272.1558100004@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 17 May 2019 13:33:38 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190517_063344_165378_B1948C88 
X-CRM114-Status: GOOD (  10.81  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-BeenThere: linux-afs@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Cc: dhowells@redhat.com, marc.dionne@auristor.com,
 netfilter-devel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi Pablo,

Marc Dionne testing the in-kernel AFS filesystem got the attached oops in
netfilter when testing against the upstream kernel - but this hadn't been seen
in my afs-fixes branch which was forked from commit
80f232121b69cc69a31ccb2b38c1665d770b0710 on the 8th May and merged into
Linus's tree at 227747fb9eab37aaeb360aeba795362c01889427 and
0d74471924f2a01dcd32d154510c0500780b531a.

There've been a few netfilter commits since then.  I'm wondering if you've
seen the oops.

	general protection fault: 0000 [#1] SMP NOPTI
	...
	RIP: 0010:nf_ct_helper_destroy+0x31/0x50 [nf_conntrack]

The oops occurs here:

	void nf_ct_helper_destroy(struct nf_conn *ct)
	{
		struct nf_conn_help *help = nfct_help(ct);
		struct nf_conntrack_helper *helper;

		if (help) {
			rcu_read_lock();
			helper = rcu_dereference(help->helper);
			if (helper && helper->destroy)   <---------
				helper->destroy(ct);
			rcu_read_unlock();
		}
	}

Disassembling around the faulting address:

   0x0000000000006d3f <+31>:	incl   %gs:0x0(%rip)    // rcu_read_lock
   0x0000000000006d46 <+38>:	mov    %rsp,%rbp
   0x0000000000006d49 <+41>:	mov    (%rax),%rax	// helper = help->helper
   0x0000000000006d4c <+44>:	test   %rax,%rax	// if (helper
   0x0000000000006d4f <+47>:	je     0x6d5f
   0x0000000000006d51 <+49>:	mov    0x68(%rax),%rax  <----------
   0x0000000000006d55 <+53>:	test   %rax,%rax	// && helper->destroy
   0x0000000000006d58 <+56>:	je     0x6d5f
   0x0000000000006d5a <+58>:	callq  0x6d5f
   0x0000000000006d5f <+63>:	decl   %gs:0x0(%rip)    // rcu_read_unlock

RAX (ff8881b0cc4f0002) looks decidedly dodgy - like it's been shifted left by
8 and then had 2 added.

Thanks,
David
---
general protection fault: 0000 [#1] SMP NOPTI
CPU: 4 PID: 1768 Comm: tcsh Not tainted 5.1.0-marco+ #304
Hardware name: MSI MS-7593/MSI X58M (MS-7593), BIOS V1.2 04/17/2009
RIP: 0010:nf_ct_helper_destroy+0x31/0x50 [nf_conntrack]
Code: 87 b8 00 00 00 48 85 c0 74 38 0f b6 50 10 84 d2 74 2f 48 01 d0 74 2c 55 65 ff 05 c2 cf b2 5f 48 89 e5 48 8b 00 48 85 c0 74 0e <48> 8b 40 68 48 85 c0 74 05 e8 b1 81 71 e1 65 ff 0d a2 cf b2 5f 5d
RSP: 0018:ffffc90001ba7198 EFLAGS: 00010282
RAX: ff8881b0cc4f0002 RBX: ffffffff822f1e00 RCX: 0000000000000000
RDX: 00000000000000ff RSI: 0000000000000000 RDI: ffff8881af944140
RBP: ffffc90001ba7198 R08: 0000000000000004 R09: ffffc90001ba72e8
R10: ffff8881b2c84710 R11: ffff8881b61d8000 R12: ffff8881af944140
R13: 0000000000000000 R14: 0000000000000000 R15: ffff8881af944140
FS:  00007fefdce21740(0000) GS:ffff8881b9700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fbd0f7ab000 CR3: 00000001a652a000 CR4: 00000000000006e0
Call Trace:
 nf_ct_delete_from_lists+0x25/0x120 [nf_conntrack]
 ? csum_and_copy_from_iter_full+0xde/0x410
 nf_ct_delete+0x72/0x170 [nf_conntrack]
 nf_ct_kill_acct+0x46/0x50 [nf_conntrack]
 nf_nat_inet_fn+0xa1/0x1c0 [nf_nat]
 nf_nat_ipv4_fn+0x4f/0x70 [nf_nat]
 nf_nat_ipv4_out+0x19/0xb0 [nf_nat]
 nf_hook_slow+0x47/0xc0
 ip_output+0xbd/0xf0
 ? ip_finish_output2+0x500/0x500
 ip_local_out+0x3d/0x50
 ip_send_skb+0x19/0x40
 udp_send_skb.isra.0+0x24e/0x380
 udp_sendmsg+0x995/0xbe0
 ? ip_copy_metadata+0x1e0/0x1e0
 udpv6_sendmsg+0x1d3/0xb30
 ? udpv6_sendmsg+0x1d3/0xb30
 ? lock_timer_base+0x72/0xa0
 ? timer_reduce+0x1d4/0x350
 ? cpumask_next_and+0x1d/0x20
 ? update_sd_lb_stats+0x140/0x750
 ? __might_sleep+0x4b/0x80
 ? _cond_resched+0x19/0x30
 ? __kmalloc_node_track_caller+0x18f/0x2e0
 inet_sendmsg+0x38/0xd0
 ? inet_sendmsg+0x38/0xd0
 sock_sendmsg+0x48/0x60
 kernel_sendmsg+0x2c/0x40
 rxrpc_send_data_packet+0x4c0/0xac0 [rxrpc]
 rxrpc_send_data+0x497/0x1050 [rxrpc]
 ? rxrpc_send_data+0x497/0x1050 [rxrpc]
 ? afs_notify_end_reply_tx+0xb0/0xb0 [kafs]
 ? __internal_add_timer+0x2d/0x40
 ? timer_reduce+0x1d4/0x350
 ? __might_sleep+0x4b/0x80
 ? afs_notify_end_reply_tx+0xb0/0xb0 [kafs]
 rxrpc_kernel_send_data+0xf5/0x150 [rxrpc]
 afs_make_call+0x1e8/0x400 [kafs]
 afs_vl_get_entry_by_name_u+0x104/0x190 [kafs]
 ? afs_vl_get_entry_by_name_u+0x104/0x190 [kafs]
 afs_vl_lookup_vldb+0x49/0x80 [kafs]
 afs_create_volume+0x2c/0x260 [kafs]
 afs_get_tree+0x73/0x430 [kafs]
 ? afs_lookup_cell+0x3c0/0x530 [kafs]
 vfs_get_tree+0x2a/0xe0
 fc_mount+0x13/0x50
 afs_d_automount+0x278/0x410 [kafs]
 follow_managed+0x106/0x300
 walk_component+0x1d8/0x330
 link_path_walk.part.0+0x2d0/0x530
 ? path_init+0x23f/0x330
 path_lookupat.isra.0+0x3e/0x200
 filename_lookup+0x9b/0x150
 ? __might_sleep+0x4b/0x80
 ? _cond_resched+0x19/0x30
 ? kmem_cache_alloc+0x1e4/0x210
 ? getname_flags+0x4f/0x1f0
 user_path_at_empty+0x3a/0x50
 ksys_chdir+0x34/0xb0
 __x64_sys_chdir+0x12/0x20
 do_syscall_64+0x4d/0x130
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7fefdcf107eb
Code: c3 89 c2 48 8b 05 9d 36 0d 00 f7 da 64 89 10 b8 ff ff ff ff eb bc 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 50 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 6d 36 0d 00 f7 d8 64 89 01 48
RSP: 002b:00007ffedba14698 EFLAGS: 00000206 ORIG_RAX: 0000000000000050
RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 00007fefdcf107eb
RDX: 0000000000000001 RSI: 0000000000000000 RDI: 00005580054e6ed0
RBP: 000055800558b2c0 R08: 0000000000000000 R09: 00007ffedba145c0
R10: 0000000000000004 R11: 0000000000000206 R12: 00005580054ce1e0
R13: 0000558005511110 R14: 0000000000000000 R15: 00005580055110b0
Modules linked in: kafs rxrpc dns_resolver xt_nat veth vxlan ip6_udp_tunnel udp_tunnel iptable_mangle xt_mark xt_u32 xt_tcpudp xt_MASQUERADE iptable_nat xt_addrtype iptable_filter bpfilter xt_conntrack nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 overlay cachefiles fscache xfs coretemp kvm_intel kvm irqbypass pcspkr nfsd sch_fq_codel lockd auth_rpcgss grace sunrpc ip_tables x_tables r8169 realtek nouveau hwmon wmi video ttm
---[ end trace 374cc75d72c18fe2 ]---
RIP: 0010:nf_ct_helper_destroy+0x31/0x50 [nf_conntrack]
Code: 87 b8 00 00 00 48 85 c0 74 38 0f b6 50 10 84 d2 74 2f 48 01 d0 74 2c 55 65 ff 05 c2 cf b2 5f 48 89 e5 48 8b 00 48 85 c0 74 0e <48> 8b 40 68 48 85 c0 74 05 e8 b1 81 71 e1 65 ff 0d a2 cf b2 5f 5d
RSP: 0018:ffffc90001ba7198 EFLAGS: 00010282
RAX: ff8881b0cc4f0002 RBX: ffffffff822f1e00 RCX: 0000000000000000
RDX: 00000000000000ff RSI: 0000000000000000 RDI: ffff8881af944140
RBP: ffffc90001ba7198 R08: 0000000000000004 R09: ffffc90001ba72e8
R10: ffff8881b2c84710 R11: ffff8881b61d8000 R12: ffff8881af944140
R13: 0000000000000000 R14: 0000000000000000 R15: ffff8881af944140
FS:  00007fefdce21740(0000) GS:ffff8881b9700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fbd0f7ab000 CR3: 00000001a652a000 CR4: 00000000000006e0
BUG: sleeping function called from invalid context at include/linux/percpu-rwsem.h:34
in_atomic(): 1, irqs_disabled(): 0, pid: 1768, name: tcsh
CPU: 4 PID: 1768 Comm: tcsh Tainted: G      D           5.1.0-marco+ #304
Hardware name: MSI MS-7593/MSI X58M (MS-7593), BIOS V1.2 04/17/2009
Call Trace:
 dump_stack+0x4d/0x6a
 ___might_sleep.cold+0x80/0x91
 __might_sleep+0x4b/0x80
 exit_signals+0x27/0x1d0
 do_exit+0xa2/0xc50
 rewind_stack_do_exit+0x17/0x20
RIP: 0033:0x7fefdcf107eb
Code: c3 89 c2 48 8b 05 9d 36 0d 00 f7 da 64 89 10 b8 ff ff ff ff eb bc 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 50 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 6d 36 0d 00 f7 d8 64 89 01 48
RSP: 002b:00007ffedba14698 EFLAGS: 00000206 ORIG_RAX: 0000000000000050
RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 00007fefdcf107eb
RDX: 0000000000000001 RSI: 0000000000000000 RDI: 00005580054e6ed0
RBP: 000055800558b2c0 R08: 0000000000000000 R09: 00007ffedba145c0
R10: 0000000000000004 R11: 0000000000000206 R12: 00005580054ce1e0
R13: 0000558005511110 R14: 0000000000000000 R15: 00005580055110b0
note: tcsh[1768] exited with preempt_count 2



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
