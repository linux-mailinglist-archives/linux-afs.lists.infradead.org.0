Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B0488540
	for <lists+linux-afs@lfdr.de>; Fri,  9 Aug 2019 23:48:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hCGTeZtLczKEMMn2Z0+J0vgqwHdQ5ehWh7Xje95mK5I=; b=GpW0WeN5iWSpj7
	xWJH+aJmqhjYEdOKGYzNPRHO2MT8Ysra9fM9dvfVJwtGzhAdsFw48Ovutm/3bpE2Ojde2sQA0utUR
	ptTO/p90RYQSMe0Q889fOt4CJMYouRtK6+0AHL9vV8wI/GlIkEsGHEeB/zCUHlnD7SfsTOPxLOUOV
	UEsRC2kRxCO5JDbwzbvQkJt89F18jccwkkOeElAJ6yHP/2I+0suDJdFiepB40Motvc3+qEWNwegmB
	l1NS5WPhqg+lYr91gi+rtoG2OKEl40hX1QmGMgrDbOChwrcF3USnnHlvaMDeO+jHdY7VkmowqeCRj
	E0qFjPBp09s83Ai6E1OA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hwCjo-00053r-Bg; Fri, 09 Aug 2019 21:47:52 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hwCjl-00053D-N7
 for linux-afs@lists.infradead.org; Fri, 09 Aug 2019 21:47:51 +0000
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0364FB2CD;
 Fri,  9 Aug 2019 21:47:49 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5BA060BF3;
 Fri,  9 Aug 2019 21:47:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net] rxrpc: Fix local refcounting
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Fri, 09 Aug 2019 22:47:47 +0100
Message-ID: <156538726702.16201.13552536596121161945.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 09 Aug 2019 21:47:49 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190809_144749_776872_713C3450 
X-CRM114-Status: GOOD (  14.08  )
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
Cc: dhowells@redhat.com, linux-kernel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Fix rxrpc_unuse_local() to handle a NULL local pointer as it can be called
on an unbound socket on which rx->local is not yet set.

The following reproduced (includes omitted):

	int main(void)
	{
		socket(AF_RXRPC, SOCK_DGRAM, AF_INET);
		return 0;
	}

causes the following oops to occur:

	BUG: kernel NULL pointer dereference, address: 0000000000000010
	...
	RIP: 0010:rxrpc_unuse_local+0x8/0x1b
	...
	Call Trace:
	 rxrpc_release+0x2b5/0x338
	 __sock_release+0x37/0xa1
	 sock_close+0x14/0x17
	 __fput+0x115/0x1e9
	 task_work_run+0x72/0x98
	 do_exit+0x51b/0xa7a
	 ? __context_tracking_exit+0x4e/0x10e
	 do_group_exit+0xab/0xab
	 __x64_sys_exit_group+0x14/0x17
	 do_syscall_64+0x89/0x1d4
	 entry_SYSCALL_64_after_hwframe+0x49/0xbe

Reported-by: syzbot+20dee719a2e090427b5f@syzkaller.appspotmail.com
Fixes: 730c5fd42c1e ("rxrpc: Fix local endpoint refcounting")
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeffrey Altman <jaltman@auristor.com>
---

 net/rxrpc/local_object.c |   12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/net/rxrpc/local_object.c b/net/rxrpc/local_object.c
index 9798159ee65f..c9db3e762d8d 100644
--- a/net/rxrpc/local_object.c
+++ b/net/rxrpc/local_object.c
@@ -402,11 +402,13 @@ void rxrpc_unuse_local(struct rxrpc_local *local)
 {
 	unsigned int au;
 
-	au = atomic_dec_return(&local->active_users);
-	if (au == 0)
-		rxrpc_queue_local(local);
-	else
-		rxrpc_put_local(local);
+	if (local) {
+		au = atomic_dec_return(&local->active_users);
+		if (au == 0)
+			rxrpc_queue_local(local);
+		else
+			rxrpc_put_local(local);
+	}
 }
 
 /*


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
