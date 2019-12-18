Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C93124FE1
	for <lists+linux-afs@lfdr.de>; Wed, 18 Dec 2019 18:55:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lbm79nWTVRVWZ2JtC8rcLBYud6qhD58JwWwVoaflPjQ=; b=k0n3an/OeKjUzf
	zHdNX0BVmaty/AeBi+5GC9gkJUeC+N4eDRguVUlcQTtlsNQ28Pj1/UWoWyYz+FmYRRIH5a7O79JU4
	13mVUNK/KKdg5E/a5kSCDESazjwocpTQDCurgJoTeGTdVqcZLc79r5SteMWrC9pCUiyF1A0FEx0Qt
	TTdG+BbRdert7stL9GkeBD4qUj7Jdvkum3hYMI6P2jh7o0bTnOFeRWZLMbroXz65SHe6+UKQRKsvP
	OQktQwMOZGDC9iWr1qDmTJ2Hukak95zExzUSk96JENcnEF/YQMxOXcvnvrajB8upwmETGLSHwUywf
	cXA3jc9PNRSC7WdbEvSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihdXV-0003US-GE; Wed, 18 Dec 2019 17:55:13 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihdXS-00033j-7V
 for linux-afs@lists.infradead.org; Wed, 18 Dec 2019 17:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576691708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jk7ns5MTns/445e01ST4cOo/+htaVN+sTnQQIw3LJPg=;
 b=SLKqon3l141RNSAA0xqIC9yNCBQoZfBSKw6RBF3P0ssd3RrYYrgpz3qC/jxTBC0Ky3JeKX
 aBQFzaXd/bKK9Qqlmzg8kWVzm0v/+fS9EAVSfsA64/psEchT7otkTB7o1GV/1N80XCCT7X
 VtDoQj24TltcxsFi7oQswzxtOlmGe8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-eR5x0ZNEMt23AIjS31ooFg-1; Wed, 18 Dec 2019 12:55:02 -0500
X-MC-Unique: eR5x0ZNEMt23AIjS31ooFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB6A4DB60;
 Wed, 18 Dec 2019 17:55:00 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-52.rdu2.redhat.com
 [10.10.120.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06EF126DEE;
 Wed, 18 Dec 2019 17:54:58 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 2/2] rxrpc: Don't take call->user_mutex in
 rxrpc_new_incoming_call()
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 18 Dec 2019 17:54:58 +0000
Message-ID: <157669169826.21991.16708899415880562587.stgit@warthog.procyon.org.uk>
In-Reply-To: <157669169065.21991.15207045893761573624.stgit@warthog.procyon.org.uk>
References: <157669169065.21991.15207045893761573624.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_095510_359518_D18E5099 
X-CRM114-Status: GOOD (  17.17  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [205.139.110.120 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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
Cc: Davidlohr Bueso <dave@stgolabs.net>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, dhowells@redhat.com,
 Ingo Molnar <mingo@redhat.com>, linux-fsdevel@vger.kernel.org,
 Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

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
cc: Peter Zijlstra <peterz@infradead.org>
cc: Ingo Molnar <mingo@redhat.com>
cc: Will Deacon <will@kernel.org>
cc: Davidlohr Bueso <dave@stgolabs.net>
---

 net/rxrpc/call_accept.c |   20 +++-----------------
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
 


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
