Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5361C154593
	for <lists+linux-afs@lfdr.de>; Thu,  6 Feb 2020 14:58:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bIuu0fncEezdKJPwj7RlojWHLTJqImTAqUcfnCbOs20=; b=HsOxXlH/NysjqO
	OdpM3S9yhE8sFtkbmOGa+4G4NWUvrF9arJPTVhiZSgiEx9DT0vhRBMpImeqiYbalNXV3TJLZOo/Lr
	A0WTQGaa+EgTV0Zv6JZyHuGeTK/F4dRr/1/G9RX6m8RfPtD4H2uusMh4AVkiMScOvZu+T7qVjZ0Fb
	oOPuVHMwi0wiE3w9HAKMIQvIpfoxGIFoYh4evrvEw532ddX6c0vuD+Sl6lLf2B9BMnVbMIkdL0lV8
	EkG0UnpFzEx814b09tOcPw3DQtnag1krdD5VWgIK8R7CpBqabCF5GtgY1KYBjvTioG3+s+9140qsl
	K2Aj8oSc6nt2R1Xxv0Eg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izhfE-0000rJ-2J; Thu, 06 Feb 2020 13:57:52 +0000
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izhfB-0000pX-4c
 for linux-afs@lists.infradead.org; Thu, 06 Feb 2020 13:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580997468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tNitUKzW+cLVaYZXngjqBsDD3mUQWjU26WqjKMzRiTQ=;
 b=F8A0HrtuVkEh35pjVGoqXohuei/iQ/vUrjxGQYhjmG/JRxHwHnCZOAB8qGDPmYdLtUK2MC
 kNe42CD0edMwDSUCf6gnMnhksXH9VHj1s+UZGYlN/Nt7ePidT8FKq+Wki/K1fFG5BdraB/
 9eUIH67SYOwWZCuPpIDhS+5HyWK6jtw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-igue8FV3Owm0OYEOZdQa3g-1; Thu, 06 Feb 2020 08:57:44 -0500
X-MC-Unique: igue8FV3Owm0OYEOZdQa3g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12D5A8010E6;
 Thu,  6 Feb 2020 13:57:43 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-218.rdu2.redhat.com
 [10.10.120.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15A83183B3;
 Thu,  6 Feb 2020 13:57:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net] rxrpc: Fix call RCU cleanup using non-bh-safe locks
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 06 Feb 2020 13:57:40 +0000
Message-ID: <158099746025.2198892.1158535190228552910.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.19
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_055749_263824_F9B58EE4 
X-CRM114-Status: GOOD (  16.92  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

rxrpc_rcu_destroy_call(), which is called as an RCU callback to clean up a
put call, calls rxrpc_put_connection() which, deep in its bowels, takes a
number of spinlocks in a non-BH-safe way, including rxrpc_conn_id_lock and
local->client_conns_lock.  RCU callbacks, however, are normally called from
softirq context, which can cause lockdep to notice the locking
inconsistency.

To get lockdep to detect this, it's necessary to have the connection
cleaned up on the put at the end of the last of its calls, though normally
the clean up is deferred.  This can be induced, however, by starting a call
on an AF_RXRPC socket and then closing the socket without reading the
reply.

Fix this by having rxrpc_rcu_destroy_call() punt the destruction to a
workqueue if in softirq-mode and defer the destruction to process context.

Note that another way to fix this could be to add a bunch of bh-disable
annotations to the spinlocks concerned - and there might be more than just
those two - but that means spending more time with BHs disabled.

Note also that some of these places were covered by bh-disable spinlocks
belonging to the rxrpc_transport object, but these got removed without the
_bh annotation being retained on the next lock in.

Fixes: 999b69f89241 ("rxrpc: Kill the client connection bundle concept")
Reported-by: syzbot+d82f3ac8d87e7ccbb2c9@syzkaller.appspotmail.com
Reported-by: syzbot+3f1fd6b8cbf8702d134e@syzkaller.appspotmail.com
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Hillf Danton <hdanton@sina.com>
---

 net/rxrpc/call_object.c |   22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/net/rxrpc/call_object.c b/net/rxrpc/call_object.c
index dbdbc4f18b5e..c9f34b0a11df 100644
--- a/net/rxrpc/call_object.c
+++ b/net/rxrpc/call_object.c
@@ -562,11 +562,11 @@ void rxrpc_put_call(struct rxrpc_call *call, enum rxrpc_call_trace op)
 }
 
 /*
- * Final call destruction under RCU.
+ * Final call destruction - but must be done in process context.
  */
-static void rxrpc_rcu_destroy_call(struct rcu_head *rcu)
+static void rxrpc_destroy_call(struct work_struct *work)
 {
-	struct rxrpc_call *call = container_of(rcu, struct rxrpc_call, rcu);
+	struct rxrpc_call *call = container_of(work, struct rxrpc_call, processor);
 	struct rxrpc_net *rxnet = call->rxnet;
 
 	rxrpc_put_connection(call->conn);
@@ -578,6 +578,22 @@ static void rxrpc_rcu_destroy_call(struct rcu_head *rcu)
 		wake_up_var(&rxnet->nr_calls);
 }
 
+/*
+ * Final call destruction under RCU.
+ */
+static void rxrpc_rcu_destroy_call(struct rcu_head *rcu)
+{
+	struct rxrpc_call *call = container_of(rcu, struct rxrpc_call, rcu);
+
+	if (in_softirq()) {
+		INIT_WORK(&call->processor, rxrpc_destroy_call);
+		if (!rxrpc_queue_work(&call->processor))
+			BUG();
+	} else {
+		rxrpc_destroy_call(&call->processor);
+	}
+}
+
 /*
  * clean up a call
  */



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
