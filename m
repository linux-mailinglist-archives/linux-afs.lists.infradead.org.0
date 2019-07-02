Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7E05D0EA
	for <lists+linux-afs@lfdr.de>; Tue,  2 Jul 2019 15:43:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sNDbeSl43dVaITBzIl14fBiHJraI7651O5EfvrVK8ho=; b=XM70goyfI8bwdD
	ZakRc8cSMvC2O1NIYkxAUqynlYMZgauVkzqz5HkfDBzbebwGiWWnEM6dplIQ02Tdo9K7ZCvZZ8wPc
	7I2jd08YXzJdKz13xL0P/O6pef8BpB/8oKG+9OENYEc1SzeNDqvpNDAbLrOldMyF6qdDMgLA5LqNC
	ZBXRoXVGm6DQgtBrDs6lWaP1RxXoeujtOSamROfe1iZPMcGURSM5K4YyMoH7VZ75m8mVStNqO8ypR
	efxOnCUdwvGH1tMbGT9m9KsuXiYHr5FdbgPmgvHVsHzJxpuulLaAbRSOcdMfAMpYHIKDrIveE8aaB
	u0sC5NQ0U/gFM9Pxi6cQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiJ3e-0005mx-IQ; Tue, 02 Jul 2019 13:42:54 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiJ3c-0005md-FP
 for linux-afs@lists.infradead.org; Tue, 02 Jul 2019 13:42:53 +0000
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 43C1C772F9
 for <linux-afs@lists.infradead.org>; Tue,  2 Jul 2019 13:42:52 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-219.rdu2.redhat.com
 [10.10.120.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE4DF6F95D;
 Tue,  2 Jul 2019 13:42:44 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 1/2] rxrpc: Fix send on a connected, but unbound socket
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Tue, 02 Jul 2019 14:42:43 +0100
Message-ID: <156207496385.24824.9614807406183116947.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 02 Jul 2019 13:42:52 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_064252_558848_4D881047 
X-CRM114-Status: GOOD (  16.42  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
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
Cc: dhowells@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

If sendmsg() or sendmmsg() is called on a connected socket that hasn't had
bind() called on it, then an oops will occur when the kernel tries to
connect the call because no local endpoint has been allocated.

Fix this by implicitly binding the socket if it is in the
RXRPC_CLIENT_UNBOUND state, just like it does for the RXRPC_UNBOUND state.

Further, the state should be transitioned to RXRPC_CLIENT_BOUND after this
to prevent further attempts to bind it.

This can be tested with:

	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include <sys/socket.h>
	#include <arpa/inet.h>
	#include <linux/rxrpc.h>
	static const unsigned char inet6_addr[16] = {
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, 0xac, 0x14, 0x14, 0xaa
	};
	int main(void)
	{
		struct sockaddr_rxrpc srx;
		struct cmsghdr *cm;
		struct msghdr msg;
		unsigned char control[16];
		int fd;
		memset(&srx, 0, sizeof(srx));
		srx.srx_family = 0x21;
		srx.srx_service = 0;
		srx.transport_type = AF_INET;
		srx.transport_len = 0x1c;
		srx.transport.sin6.sin6_family = AF_INET6;
		srx.transport.sin6.sin6_port = htons(0x4e22);
		srx.transport.sin6.sin6_flowinfo = htons(0x4e22);
		srx.transport.sin6.sin6_scope_id = htons(0xaa3b);
		memcpy(&srx.transport.sin6.sin6_addr, inet6_addr, 16);
		cm = (struct cmsghdr *)control;
		cm->cmsg_len	= CMSG_LEN(sizeof(unsigned long));
		cm->cmsg_level	= SOL_RXRPC;
		cm->cmsg_type	= RXRPC_USER_CALL_ID;
		*(unsigned long *)CMSG_DATA(cm) = 0;
		msg.msg_name = NULL;
		msg.msg_namelen = 0;
		msg.msg_iov = NULL;
		msg.msg_iovlen = 0;
		msg.msg_control = control;
		msg.msg_controllen = cm->cmsg_len;
		msg.msg_flags = 0;
		fd = socket(AF_RXRPC, SOCK_DGRAM, AF_INET);
		connect(fd, (struct sockaddr *)&srx, sizeof(srx));
		sendmsg(fd, &msg, 0);
		return 0;
	}


Leading to the following oops:

	BUG: kernel NULL pointer dereference, address: 0000000000000018
	#PF: supervisor read access in kernel mode
	#PF: error_code(0x0000) - not-present page
	...
	RIP: 0010:rxrpc_connect_call+0x42/0xa01
	...
	Call Trace:
	 ? mark_held_locks+0x47/0x59
	 ? __local_bh_enable_ip+0xb6/0xba
	 rxrpc_new_client_call+0x3b1/0x762
	 ? rxrpc_do_sendmsg+0x3c0/0x92e
	 rxrpc_do_sendmsg+0x3c0/0x92e
	 rxrpc_sendmsg+0x16b/0x1b5
	 sock_sendmsg+0x2d/0x39
	 ___sys_sendmsg+0x1a4/0x22a
	 ? release_sock+0x19/0x9e
	 ? reacquire_held_locks+0x136/0x160
	 ? release_sock+0x19/0x9e
	 ? find_held_lock+0x2b/0x6e
	 ? __lock_acquire+0x268/0xf73
	 ? rxrpc_connect+0xdd/0xe4
	 ? __local_bh_enable_ip+0xb6/0xba
	 __sys_sendmsg+0x5e/0x94
	 do_syscall_64+0x7d/0x1bf
	 entry_SYSCALL_64_after_hwframe+0x49/0xbe

Fixes: 2341e0775747 ("rxrpc: Simplify connect() implementation and simplify sendmsg() op")
Reported-by: syzbot+7966f2a0b2c7da8939b4@syzkaller.appspotmail.com
Signed-off-by: David Howells <dhowells@redhat.com>
---

 net/rxrpc/af_rxrpc.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/rxrpc/af_rxrpc.c b/net/rxrpc/af_rxrpc.c
index ffde5b187f5d..19d1405e46c4 100644
--- a/net/rxrpc/af_rxrpc.c
+++ b/net/rxrpc/af_rxrpc.c
@@ -549,6 +549,7 @@ static int rxrpc_sendmsg(struct socket *sock, struct msghdr *m, size_t len)
 
 	switch (rx->sk.sk_state) {
 	case RXRPC_UNBOUND:
+	case RXRPC_CLIENT_UNBOUND:
 		rx->srx.srx_family = AF_RXRPC;
 		rx->srx.srx_service = 0;
 		rx->srx.transport_type = SOCK_DGRAM;
@@ -573,10 +574,9 @@ static int rxrpc_sendmsg(struct socket *sock, struct msghdr *m, size_t len)
 		}
 
 		rx->local = local;
-		rx->sk.sk_state = RXRPC_CLIENT_UNBOUND;
+		rx->sk.sk_state = RXRPC_CLIENT_BOUND;
 		/* Fall through */
 
-	case RXRPC_CLIENT_UNBOUND:
 	case RXRPC_CLIENT_BOUND:
 		if (!m->msg_name &&
 		    test_bit(RXRPC_SOCK_CONNECTED, &rx->flags)) {


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
