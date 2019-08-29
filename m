Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED7BA2377
	for <lists+linux-afs@lfdr.de>; Thu, 29 Aug 2019 20:16:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CN2dxH1V0Zj3b9L6Uw2+05cLKOnR1lLcHa/XkUQdMbA=; b=ttPT+JME8sK4Nq
	xNlSvOaz4Q4ZorLjDNw8dYJGByq7Xzp9D9UeLmmhMzUfMb4K/NFi1Ndt6uQvL9iJXOzBnAox65R/S
	86/3BjU9eRqQkIFVHqmrpkKLW+ZTdUqKnyIdBEjYoqyUMwmFjkovwcqlW6785viKaGFOBS1xOIGWt
	3FJCraRgaaI8fW/VQbRKqpztIip/atQKl2anUzpajNFgxIp34QxFeK/MPTmXVS9rTcss2ifBjcaZB
	vz2JxV6E1ZRhEt0rZQot9XwpYlZYB1560TSEnFbayzfaCEqzoLmdMEaD9MZWmOHBzw04pwbwpasT1
	qH48DUyUAv2Mv+Rwck2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3Oxt-0007Hf-QH; Thu, 29 Aug 2019 18:16:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3Oxq-0007GI-Vs
 for linux-afs@lists.infradead.org; Thu, 29 Aug 2019 18:16:08 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ECD832341C;
 Thu, 29 Aug 2019 18:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567102566;
 bh=2WlVhwpjVf+d0EsxyMA5hTMnG+bbdycgMkaqW96cp8U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YhqL6FtePM2SnaWn7lZG66iuOqWQ7Dh03c/Mdy5psQL0xACtVGyp0M17lswfjeSRP
 afw6aqL74J+elDGE/A4xzSZXJbIPjcCoZYORu7k8e3CIuCrSaCou+1sqlqlmlFAAyX
 7Y+ZPSy/wICTbWORb/y9zNSxrYjxQhQgAYhpH0do=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 13/45] rxrpc: Fix read-after-free in
 rxrpc_queue_local()
Date: Thu, 29 Aug 2019 14:15:13 -0400
Message-Id: <20190829181547.8280-13-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190829181547.8280-1-sashal@kernel.org>
References: <20190829181547.8280-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_111607_068724_08AFF353 
X-CRM114-Status: GOOD (  15.34  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: David Howells <dhowells@redhat.com>, Sasha Levin <sashal@kernel.org>,
 syzbot+78e71c5bab4f76a6a719@syzkaller.appspotmail.com,
 linux-afs@lists.infradead.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit 06d9532fa6b34f12a6d75711162d47c17c1add72 ]

rxrpc_queue_local() attempts to queue the local endpoint it is given and
then, if successful, prints a trace line.  The trace line includes the
current usage count - but we're not allowed to look at the local endpoint
at this point as we passed our ref on it to the workqueue.

Fix this by reading the usage count before queuing the work item.

Also fix the reading of local->debug_id for trace lines, which must be done
with the same consideration as reading the usage count.

Fixes: 09d2bf595db4 ("rxrpc: Add a tracepoint to track rxrpc_local refcounting")
Reported-by: syzbot+78e71c5bab4f76a6a719@syzkaller.appspotmail.com
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/trace/events/rxrpc.h |  6 +++---
 net/rxrpc/local_object.c     | 19 ++++++++++---------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/include/trace/events/rxrpc.h b/include/trace/events/rxrpc.h
index 147546e0c11bd..815dcfa647430 100644
--- a/include/trace/events/rxrpc.h
+++ b/include/trace/events/rxrpc.h
@@ -500,10 +500,10 @@ rxrpc_tx_points;
 #define E_(a, b)	{ a, b }
 
 TRACE_EVENT(rxrpc_local,
-	    TP_PROTO(struct rxrpc_local *local, enum rxrpc_local_trace op,
+	    TP_PROTO(unsigned int local_debug_id, enum rxrpc_local_trace op,
 		     int usage, const void *where),
 
-	    TP_ARGS(local, op, usage, where),
+	    TP_ARGS(local_debug_id, op, usage, where),
 
 	    TP_STRUCT__entry(
 		    __field(unsigned int,	local		)
@@ -513,7 +513,7 @@ TRACE_EVENT(rxrpc_local,
 			     ),
 
 	    TP_fast_assign(
-		    __entry->local = local->debug_id;
+		    __entry->local = local_debug_id;
 		    __entry->op = op;
 		    __entry->usage = usage;
 		    __entry->where = where;
diff --git a/net/rxrpc/local_object.c b/net/rxrpc/local_object.c
index 7f82c4e19bd1e..27f4bbe85e799 100644
--- a/net/rxrpc/local_object.c
+++ b/net/rxrpc/local_object.c
@@ -97,7 +97,7 @@ static struct rxrpc_local *rxrpc_alloc_local(struct rxrpc_net *rxnet,
 		local->debug_id = atomic_inc_return(&rxrpc_debug_id);
 		memcpy(&local->srx, srx, sizeof(*srx));
 		local->srx.srx_service = 0;
-		trace_rxrpc_local(local, rxrpc_local_new, 1, NULL);
+		trace_rxrpc_local(local->debug_id, rxrpc_local_new, 1, NULL);
 	}
 
 	_leave(" = %p", local);
@@ -325,7 +325,7 @@ struct rxrpc_local *rxrpc_get_local(struct rxrpc_local *local)
 	int n;
 
 	n = atomic_inc_return(&local->usage);
-	trace_rxrpc_local(local, rxrpc_local_got, n, here);
+	trace_rxrpc_local(local->debug_id, rxrpc_local_got, n, here);
 	return local;
 }
 
@@ -339,7 +339,8 @@ struct rxrpc_local *rxrpc_get_local_maybe(struct rxrpc_local *local)
 	if (local) {
 		int n = atomic_fetch_add_unless(&local->usage, 1, 0);
 		if (n > 0)
-			trace_rxrpc_local(local, rxrpc_local_got, n + 1, here);
+			trace_rxrpc_local(local->debug_id, rxrpc_local_got,
+					  n + 1, here);
 		else
 			local = NULL;
 	}
@@ -347,16 +348,16 @@ struct rxrpc_local *rxrpc_get_local_maybe(struct rxrpc_local *local)
 }
 
 /*
- * Queue a local endpoint unless it has become unreferenced and pass the
- * caller's reference to the work item.
+ * Queue a local endpoint and pass the caller's reference to the work item.
  */
 void rxrpc_queue_local(struct rxrpc_local *local)
 {
 	const void *here = __builtin_return_address(0);
+	unsigned int debug_id = local->debug_id;
+	int n = atomic_read(&local->usage);
 
 	if (rxrpc_queue_work(&local->processor))
-		trace_rxrpc_local(local, rxrpc_local_queued,
-				  atomic_read(&local->usage), here);
+		trace_rxrpc_local(debug_id, rxrpc_local_queued, n, here);
 	else
 		rxrpc_put_local(local);
 }
@@ -371,7 +372,7 @@ void rxrpc_put_local(struct rxrpc_local *local)
 
 	if (local) {
 		n = atomic_dec_return(&local->usage);
-		trace_rxrpc_local(local, rxrpc_local_put, n, here);
+		trace_rxrpc_local(local->debug_id, rxrpc_local_put, n, here);
 
 		if (n == 0)
 			call_rcu(&local->rcu, rxrpc_local_rcu);
@@ -458,7 +459,7 @@ static void rxrpc_local_processor(struct work_struct *work)
 		container_of(work, struct rxrpc_local, processor);
 	bool again;
 
-	trace_rxrpc_local(local, rxrpc_local_processing,
+	trace_rxrpc_local(local->debug_id, rxrpc_local_processing,
 			  atomic_read(&local->usage), NULL);
 
 	do {
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
