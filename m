Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1818E1429A0
	for <lists+linux-afs@lfdr.de>; Mon, 20 Jan 2020 12:36:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vbmTcSk52HOxD/9vfHPnpwySz8f6RmWuOne1laKdEP4=; b=bRjMadpVvWvebT
	c72yWSYlrFx6+ocMf7Nrf/qA4sWdaneIAxOPEBvWZrgFRG95mnUhopKx7Zszt64KI63Wb6qsgVbY2
	Z8DzkpvTKWkV/Ij4EcBcLYdFshgAsPReu05re6cex88JIGjtjR9rWHvlAppGjXHKiasDb/stZbtN1
	z48mluCW+miEMrU0DVCZGgyPW4/0LTChpaFJKcC5ReJWmzSztvYAl5ggwTOSe+SyhmpwlqZ+gWTFZ
	mA+2t1BjrE/s/ul4Pw+5iQCBdv9sVpf/IE2oC+6ySnzVCcmBhKrZrQwyNj3NK6sjrf5feMtMzcF5+
	jo/wRI+sRpkpHObEQ/rA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itVLR-0000n2-Nb; Mon, 20 Jan 2020 11:35:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iq2PD-0006IT-Au
 for linux-afs@lists.infradead.org; Fri, 10 Jan 2020 22:05:24 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 14FB120842;
 Fri, 10 Jan 2020 22:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578693923;
 bh=glpq+x/zJdkKmj8HYLHatQTZkXN+xIdD5FaHpHa3FU4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OSgT0PHNOsKWNfDqcWLadFe3Ohxv84HrX77iTfJh7mAO8WgtZro7HhSgG71WnWvu+
 34S3NxrjePsMJk9bn8zHWudHrPHiJ/U5fUCXwDGDoQr6hQshQraRi2wDxoml1EdSn7
 tRniC2IMeEd9HAXbnOwx6BpaEMLFdSXzLv8SL0aI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 07/26] rxrpc: Don't take call->user_mutex in
 rxrpc_new_incoming_call()
Date: Fri, 10 Jan 2020 17:05:00 -0500
Message-Id: <20200110220519.28250-2-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200110220519.28250-1-sashal@kernel.org>
References: <20200110220519.28250-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_140523_415460_AF1CC76D 
X-CRM114-Status: GOOD (  16.27  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Mon, 20 Jan 2020 03:35:48 -0800
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
Cc: Sasha Levin <sashal@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Peter Zijlstra <peterz@infradead.org>, netdev@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit 13b7955a0252e15265386b229b814152f109b234 ]

Standard kernel mutexes cannot be used in any way from interrupt or softirq
context, so the user_mutex which manages access to a call cannot be a mutex
since on a new call the mutex must start off locked and be unlocked within
the softirq handler to prevent userspace interfering with a call we're
setting up.

Commit a0855d24fc22d49cdc25664fb224caee16998683 ("locking/mutex: Complain
upon mutex API misuse in IRQ contexts") causes big warnings to be splashed
in dmesg for each a new call that comes in from the server.  Whilst it
*seems* like it should be okay, since the accept path uses trylock, there
are issues with PI boosting and marking the wrong task as the owner.

Fix this by not taking the mutex in the softirq path at all.  It's not
obvious that there should be any need for it as the state is set before the
first notification is generated for the new call.

There's also no particular reason why the link-assessing ping should be
triggered inside the mutex.  It's not actually transmitted there anyway,
but rather it has to be deferred to a workqueue.

Further, I don't think that there's any particular reason that the socket
notification needs to be done from within rx->incoming_lock, so the amount
of time that lock is held can be shortened too and the ping prepared before
the new call notification is sent.

Fixes: 540b1c48c37a ("rxrpc: Fix deadlock between call creation and sendmsg/recvmsg")
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Peter Zijlstra (Intel) <peterz@infradead.org>
cc: Ingo Molnar <mingo@redhat.com>
cc: Will Deacon <will@kernel.org>
cc: Davidlohr Bueso <dave@stgolabs.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/rxrpc/call_accept.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/net/rxrpc/call_accept.c b/net/rxrpc/call_accept.c
index 3685b1732f65..44fa22b020ef 100644
--- a/net/rxrpc/call_accept.c
+++ b/net/rxrpc/call_accept.c
@@ -381,18 +381,6 @@ struct rxrpc_call *rxrpc_new_incoming_call(struct rxrpc_local *local,
 	trace_rxrpc_receive(call, rxrpc_receive_incoming,
 			    sp->hdr.serial, sp->hdr.seq);
 
-	/* Lock the call to prevent rxrpc_kernel_send/recv_data() and
-	 * sendmsg()/recvmsg() inconveniently stealing the mutex once the
-	 * notification is generated.
-	 *
-	 * The BUG should never happen because the kernel should be well
-	 * behaved enough not to access the call before the first notification
-	 * event and userspace is prevented from doing so until the state is
-	 * appropriate.
-	 */
-	if (!mutex_trylock(&call->user_mutex))
-		BUG();
-
 	/* Make the call live. */
 	rxrpc_incoming_call(rx, call, skb);
 	conn = call->conn;
@@ -433,6 +421,9 @@ struct rxrpc_call *rxrpc_new_incoming_call(struct rxrpc_local *local,
 		BUG();
 	}
 	spin_unlock(&conn->state_lock);
+	spin_unlock(&rx->incoming_lock);
+
+	rxrpc_send_ping(call, skb);
 
 	if (call->state == RXRPC_CALL_SERVER_ACCEPTING)
 		rxrpc_notify_socket(call);
@@ -444,11 +435,6 @@ struct rxrpc_call *rxrpc_new_incoming_call(struct rxrpc_local *local,
 	 */
 	rxrpc_put_call(call, rxrpc_call_put);
 
-	spin_unlock(&rx->incoming_lock);
-
-	rxrpc_send_ping(call, skb);
-	mutex_unlock(&call->user_mutex);
-
 	_leave(" = %p{%d}", call, call->debug_id);
 	return call;
 
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
