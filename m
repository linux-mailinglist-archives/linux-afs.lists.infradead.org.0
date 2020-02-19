Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3657116424C
	for <lists+linux-afs@lfdr.de>; Wed, 19 Feb 2020 11:40:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IPTkha9A0MR9qNjh3e/ZOnp1Yh2rjZC8a5Vt5kqpmiw=; b=eHzXTFWnq6QV7y
	0vd6cDveByX1XdOpSeZm6Fc3MJzoWTlMoRjfqwUMc7GZSWsNjW6ExsEXiqd4tDrsHt34RPf9Q28Tw
	oe6nubMWPUND0BaISfJe+ULMC3h1IudecYtiov5FWOXC/D+8AFuNdc4cS2DcheAkaxp90WIgnM6e0
	gpJYxaYKv0xDNhoCLCktkLr5vsPDXQ1sx64QnTGG3xxu84UzOwVEfxb5R64eMLopBq0cY/X4xpdTp
	LcbbQbKrv2MUOOeR90L29MlYi5GbmvWNtHlaBTuHV2VTgmOnXkDf0+HnkH1ik5JQD6Na8KTnH7IGH
	0mTjbI+7xQS4On9sQ4vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4Mlg-0004sH-Dq; Wed, 19 Feb 2020 10:39:48 +0000
Received: from mout.web.de ([212.227.17.11])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4MlU-0004gs-0B
 for linux-afs@lists.infradead.org; Wed, 19 Feb 2020 10:39:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1582108771;
 bh=EiZNlJiVi5SxJUrfPk4uKqJVr2ORYWPhkE0TLaTksrc=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=LCLgXFcLp7KV6zGsP5E4EMTqogcVRI3QCHhDLZwuHHH1pFtel7iZAFgxji362JNox
 Fp51ihxpmlL9TQwfPm4QAP1wxCWO1qoI921AZarIQVjYSO3ESJ3zGOK4Q/0/xWuxc/
 cxaQqu2In2kqG1IrDofT6c9XXblCx9HUntO6iijw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from schienar ([128.141.85.92]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M2MYq-1jL4lj2W1M-00s30p for
 <linux-afs@lists.infradead.org>; Wed, 19 Feb 2020 11:39:31 +0100
Date: Wed, 19 Feb 2020 11:39:29 +0100
From: Julian Wollrath <jwollrath@web.de>
To: linux-afs@lists.infradead.org
Subject: NULL pointer dereference v5.6.0-rc2
Message-ID: <20200219113929.6f55aa3e@schienar>
MIME-Version: 1.0
X-Provags-ID: V03:K1:WlbjI65XsbkBkvuWk5QfhN6WUR0/l9A2+1uGawq8NsXx4rYhlnF
 gPCp9eiH7YsQ86WYIoBOQePE0tPe+lRXJJT6kZ3Mjq//TlWDQVQ8olkrWQBIRL6A4rVnoMG
 tOPocRXjG0o75REfreRqOWRHl8nQdQpKrmbeTLn0kFv33jKoRTaKbyRZvWhTNzv5IbYhboK
 lKPowGiK03BCoOMMrP5Ig==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PBXGyHVfyg8=:+zHsVyiPM3RRvvf9rXxfnJ
 r4JybPxgUptnunkytQ1lYWhignihkMgUPiJS3AybrYTrdGuLdAL73AxnRmOATJIBStD0OeFtQ
 /ZMCEVoZ7713AGHrU+Dl378jBhMaMZQqhopOWiO6MyxKuMMlNPZrHWvr+fii/lJtC4LHKyLNi
 dcyAVT+eNykz6TZIJIBuJHnIg8SSq8vBJnfRC21nheN/llWdkP2MT+cSG6kHwmgBdUjLnpwvz
 RXeyBl0LG+7zinXIUGP2tXKcmZrvW+uCS2gER1jaobuwR4oavf1A48e+q5gZ17zh0mgTbOUDL
 8tPmsvNXXX32BFk9TaXLqkZKRbPxWRDH0VduAI3RMj7XjByPjHQFhMM5k71e6HNYCv8C05Cxp
 OoeEsH+S0lmBwRFpg/Wzcua0bMeDn4EAWPG3NasIDgjauzK5ipEnK+3/eRue5/ZhZmy7vTfKN
 Hxsz7XBvcIek/VTxM53BbzVNo5AWjC/5CIBBDAsA/PBrhjovZws67BaLp9Oz0D0cMEfp5x4Im
 BhDrrA/u0AD7xPousz6+uMVuyRq7Wd9UzB+M909fxPUBDHCzVx1yLhImk1VMmy/rAZhZZ+h0m
 GgR6uCwHW8sEffgPjsjuFJUdVvTmtGcaStyQ3br/82FbOaHJVacvaDNKmmGxGRRQSfG+QkHHx
 3MQVXXua40pULDaaW5QO7OCocxEk7k5jxARdUzCA3/udmLprVd22lm98oOV5sG2eiIPnvVE4T
 7xIKUluZSW6DtZ4U0C+4FewA3jVkQiqw0+XMvfTJQzKGh9O6n3cVfj2QuAMVqz/lyhSU3eCI8
 gTt7UHemmyBweK+BlRrfmhb+0hl/+jLB4dOKvEBUhnLj2/3NSoz531Z+/uvXHMZ9Qq3dApykh
 KoZPCrWA7nBUf98KjLo2FAOUOPZGZx3GBkZZWslSRCeWV58owoHTRnNFOhLT+oOy8sOamphe7
 LvcFyh1EQXsRcQAni9aTWkNy3Weq42QKkWIDjbt4iaVZWs/fuvbJ7WDoslWT6vRFVb75vHX5O
 xGiJldblXSQIcOBLPlDPUfvweNBffVl1101Oohd7UrITQ9vlE6oBT9XpT/dh/Q1/lgYVFgyL9
 fhCrEB5Ykg4q2zcu7M0pdaJVhqJhabllt2h5Ye+/H3LHPMwpfXHcEu+jLQt2Ld/dLdMVqbjxV
 EMNHWmRIYj2JG7MVhDtKX0n1GoyKFZ8urITbLMA9riJjp5P4JRPKQsu2OYa/6gadBryq76fJX
 UJnxvS558/Huo8kFM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_023936_384484_E2A93D60 
X-CRM114-Status: UNSURE (   3.12  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.9 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.9 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [212.227.17.11 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jwollrath[at]web.de]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [212.227.17.11 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi,

I got the following trace during normal operation.


Best regards,
Julian

BUG: kernel NULL pointer dereference, address: 0000000000000014
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0
Oops: 0000 [#1] SMP PTI
CPU: 2 PID: 43063 Comm: pool-org.gnome. Tainted: G        W         5.6.0-rc2 #1
Hardware name: FUJITSU LIFEBOOK U747/FJNB2A5, BIOS Version 1.17 09/11/2017
RIP: 0010:afs_update_server_record+0x45/0x120 [kafs]
Code: 24 28 48 8d 53 10 49 8b 74 24 40 48 8b 80 28 02 00 00 48 8b 78 18 e8 4a fe ff ff 48 3d 00 f0 ff ff 48 >
RSP: 0018:ffffa7720aeb7948 EFLAGS: 00010207
RAX: 0000000000000000 RBX: ffff94a23ccc6600 RCX: 00000000fffffe39
RDX: 0000000000000000 RSI: ffff94a178169780 RDI: ffff94a279db6800
RBP: 0000000000000000 R08: ffffa7720aeb7858 R09: 0000000000000001
R10: ffff94a1b8a8f640 R11: 0000000000000002 R12: ffffa7720aeb79e8
R13: 0000000000000002 R14: ffffa7720aeb79e8 R15: 00000000fffffe00
FS:  00007f478effd700(0000) GS:ffff94a295d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000014 CR3: 00000001489be003 CR4: 00000000003606e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 afs_check_server_record+0xba/0xf0 [kafs]
 afs_select_fileserver+0x50a/0x830 [kafs]
 ? _cond_resched+0x10/0x20
 afs_fetch_status+0xa5/0x190 [kafs]
 afs_iget+0xa2/0xe0 [kafs]
 afs_get_tree+0x2f6/0x3f0 [kafs]
 ? afs_lookup_cell+0xe4/0x470 [kafs]
 vfs_get_tree+0x1b/0x80
 fc_mount+0x9/0x30
 afs_d_automount+0x24f/0x420 [kafs]
 follow_managed+0xff/0x2e0
 ? __switch_to_asm+0x34/0x70
 lookup_fast+0x102/0x270
 walk_component+0x44/0x380
 link_path_walk.part.0+0x2c1/0x560
 ? nd_jump_root+0xa1/0xe0
 ? path_init+0x2ff/0x3a0
 path_lookupat.isra.0+0x39/0x120
 filename_lookup+0xa9/0x170
 ? __check_object_size+0x12e/0x13f
 ? strncpy_from_user+0x47/0x150
 vfs_statx+0x6f/0xd0
 __do_sys_newlstat+0x39/0x70
 ? __x64_sys_futex+0x132/0x160
 do_syscall_64+0x43/0x120
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7f4799e0be26
Code: e0 0c 00 64 c7 00 16 00 00 00 b8 ff ff ff ff c3 0f 1f 40 00 41 89 f8 48 89 f7 48 89 d6 41 83 f8 01 77 >
RSP: 002b:00007f478effc898 EFLAGS: 00000246 ORIG_RAX: 0000000000000006
RAX: ffffffffffffffda RBX: 000055cac56d48e0 RCX: 00007f4799e0be26
RDX: 00007f478effc8f0 RSI: 00007f478effc8f0 RDI: 000055cac5711d40
RBP: 000055cac5711d40 R08: 0000000000000001 R09: 00007f4760004000
R10: 0000000000000003 R11: 0000000000000246 R12: 00007f4760007fb0
R13: 000055cac5e7c380 R14: 00007f478effcaf0 R15: 00007f4760008380
Modules linked in: nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_fib_inet nft_fib_ipv6 nft_fi>
 battery nft_limit tpm_crb tpm fujitsu_laptop ac sparse_keymap video acpi_pad nft_ct nf_conntrack nf_defrag_>
CR2: 0000000000000014
---[ end trace 7edb7464f23cfc95 ]---
RIP: 0010:afs_update_server_record+0x45/0x120 [kafs]
Code: 24 28 48 8d 53 10 49 8b 74 24 40 48 8b 80 28 02 00 00 48 8b 78 18 e8 4a fe ff ff 48 3d 00 f0 ff ff 48 >
RSP: 0018:ffffa7720aeb7948 EFLAGS: 00010207
RAX: 0000000000000000 RBX: ffff94a23ccc6600 RCX: 00000000fffffe39
RDX: 0000000000000000 RSI: ffff94a178169780 RDI: ffff94a279db6800
RBP: 0000000000000000 R08: ffffa7720aeb7858 R09: 0000000000000001
R10: ffff94a1b8a8f640 R11: 0000000000000002 R12: ffffa7720aeb79e8
R13: 0000000000000002 R14: ffffa7720aeb79e8 R15: 00000000fffffe00
FS:  00007f478effd700(0000) GS:ffff94a295d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000014 CR3: 00000001489be003 CR4: 00000000003606e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


--
 ()  ascii ribbon campaign - against html e-mail
 /\                        - against proprietary attachments

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
