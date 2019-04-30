Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BF081F15C
	for <lists+linux-afs@lfdr.de>; Tue, 30 Apr 2019 09:34:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VQAp/QP20uLdqD6gx+2YN/YOcCzUDGQIa1XXWzkQDhM=; b=oWny+rNHA2xZAC
	B6SKOdrtzFx/hVpf1asAGJ/TolzQKpVvZHVnj/TZH3U/mZB0PGM8xUK/4OG8HfmqUKtSHcZ1d2F4e
	snCQJrJ4lqJjZKvL/XZHOY74k5/9ERwF2IKqDwsZistmwk37a9t/wQ7KBCcsD7PmOk67aEHMuUPe0
	aK1vpQKfHEWD7Iw81tU6FIfKqX49eHQGP6cGBHu/Pjz7jfP5w3LWeJZwT5VHGVsjLT3gg6UGw46iv
	7tPEEj1fipYE7cl5Ue7tTL/+hGzJkxJy9vBi4TneBUXGx5Oi406oxo1TkMWgZP8U48BIxBqN5J9gF
	fgNeacXRNcZJ6yVuYm4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLNHJ-0007GR-Sx; Tue, 30 Apr 2019 07:34:13 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLNHH-0007G3-E5
 for linux-afs@lists.infradead.org; Tue, 30 Apr 2019 07:34:12 +0000
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AF63F3084249;
 Tue, 30 Apr 2019 07:34:10 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-98.rdu2.redhat.com
 [10.10.121.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B533B4BF;
 Tue, 30 Apr 2019 07:34:09 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net] rxrpc: Fix net namespace cleanup
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Tue, 30 Apr 2019 08:34:08 +0100
Message-ID: <155660964874.18872.7446174793302616529.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 30 Apr 2019 07:34:10 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190430_003411_507183_F2FCF014 
X-CRM114-Status: GOOD (  16.07  )
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

In rxrpc_destroy_all_calls(), there are two phases: (1) make sure the
->calls list is empty, emitting error messages if not, and (2) wait for the
RCU cleanup to happen on outstanding calls (ie. ->nr_calls becomes 0).

To avoid taking the call_lock, the function prechecks ->calls and if empty,
it returns to avoid taking the lock - this is wrong, however: it still
needs to go and do the second phase and wait for ->nr_calls to become 0.

Without this, the rxrpc_net struct may get deallocated before we get to the
RCU cleanup for the last calls.  This can lead to:

  Slab corruption (Not tainted): kmalloc-16k start=ffff88802b178000, len=16384
  050: 6b 6b 6b 6b 6b 6b 6b 6b 61 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkakkkkkkk

Note the "61" at offset 0x58.  This corresponds to the ->nr_calls member of
struct rxrpc_net (which is >9k in size, and thus allocated out of the 16k
slab).


Fix this by flipping the condition on the if-statement, putting the locked
section inside the if-body and dropping the return from there.  The
function will then always go on to wait for the RCU cleanup on outstanding
calls.

Fixes: 2baec2c3f854 ("rxrpc: Support network namespacing")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 net/rxrpc/call_object.c |   32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/net/rxrpc/call_object.c b/net/rxrpc/call_object.c
index 8aa2937b069f..fe96881a334d 100644
--- a/net/rxrpc/call_object.c
+++ b/net/rxrpc/call_object.c
@@ -604,30 +604,30 @@ void rxrpc_destroy_all_calls(struct rxrpc_net *rxnet)
 
 	_enter("");
 
-	if (list_empty(&rxnet->calls))
-		return;
+	if (!list_empty(&rxnet->calls)) {
+		write_lock(&rxnet->call_lock);
 
-	write_lock(&rxnet->call_lock);
+		while (!list_empty(&rxnet->calls)) {
+			call = list_entry(rxnet->calls.next,
+					  struct rxrpc_call, link);
+			_debug("Zapping call %p", call);
 
-	while (!list_empty(&rxnet->calls)) {
-		call = list_entry(rxnet->calls.next, struct rxrpc_call, link);
-		_debug("Zapping call %p", call);
+			rxrpc_see_call(call);
+			list_del_init(&call->link);
 
-		rxrpc_see_call(call);
-		list_del_init(&call->link);
+			pr_err("Call %p still in use (%d,%s,%lx,%lx)!\n",
+			       call, atomic_read(&call->usage),
+			       rxrpc_call_states[call->state],
+			       call->flags, call->events);
 
-		pr_err("Call %p still in use (%d,%s,%lx,%lx)!\n",
-		       call, atomic_read(&call->usage),
-		       rxrpc_call_states[call->state],
-		       call->flags, call->events);
+			write_unlock(&rxnet->call_lock);
+			cond_resched();
+			write_lock(&rxnet->call_lock);
+		}
 
 		write_unlock(&rxnet->call_lock);
-		cond_resched();
-		write_lock(&rxnet->call_lock);
 	}
 
-	write_unlock(&rxnet->call_lock);
-
 	atomic_dec(&rxnet->nr_calls);
 	wait_var_event(&rxnet->nr_calls, !atomic_read(&rxnet->nr_calls));
 }


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
