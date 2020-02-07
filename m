Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E031550E0
	for <lists+linux-afs@lfdr.de>; Fri,  7 Feb 2020 04:16:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pywoNisNaz214DwN3P6q576PM20hTJONDiAHhj2I6+o=; b=mXldtuSAg/P5SN
	ekWzHd2ph1TzIbuc9cXZ0m7J27j9eZCY/o6+4b9O6Oq0fNk7f73iVcncQgJGON/vsF/xi1XoSC2l2
	ElyM6qVdJ+HSc/xTSto1224Df1f+XxvNCxqBuNbIz0u6u58IbgWCrWjTwmyk5acB5UtVe7P5pVW8C
	+cOEcCoPpmuzoBjlIj+eu45ezgPs/N9kygmC9E1UWeHwIQbNjCR5H8GmW7oKfWwvKmFGkiM4vW+UB
	i64MROjW1kgUB72s48R+es8tL3S48KjFWL/8m1nvngOjHGpjIsduevykDHCX6yZqu8OVDTF8cbNV5
	9e8pwIgxVIjTD05a0OdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izu7x-0007sL-P1; Fri, 07 Feb 2020 03:16:21 +0000
Received: from mail3-162.sinamail.sina.com.cn ([202.108.3.162])
 by bombadil.infradead.org with smtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izu7s-0007r7-Vo
 for linux-afs@lists.infradead.org; Fri, 07 Feb 2020 03:16:20 +0000
Received: from unknown (HELO localhost.localdomain)([114.246.227.35])
 by sina.com with ESMTP
 id 5E3CD67200029345; Fri, 7 Feb 2020 11:16:05 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 11796649283196
From: Hillf Danton <hdanton@sina.com>
To: David Howells <dhowells@redhat.com>
Subject: Re: inconsistent lock state in rxrpc_put_client_conn
Date: Fri,  7 Feb 2020 11:15:53 +0800
Message-Id: <20200207031553.18696-1-hdanton@sina.com>
In-Reply-To: <20200204084005.11320-1-hdanton@sina.com>
References: <20200204084005.11320-1-hdanton@sina.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_191617_206696_913910C5 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [202.108.3.162 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.162 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [hdanton[at]sina.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org, kuba@kernel.org,
 syzbot <syzbot+3f1fd6b8cbf8702d134e@syzkaller.appspotmail.com>,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


On Thu, 06 Feb 2020 13:09:36 +0000 David Howells wrote:
> 
> > Take lock with irq quiesced.
> 
> I think that's overkill.  It only needs _bh annotations, not _irqsave/restore
> - but even that is probably not the best way.
> 
> The best way is to offload the stuff done by rxrpc_rcu_destroy_call() to a
> workqueue if called in softirq mode.  I'm not sure whether rcu callbacks are
> done in softirq mode - if they are, then it can just call rxrpc_queue_work().

Fair.
It may look like

--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -551,7 +551,10 @@ enum rxrpc_congest_mode {
  * - matched by { connection, call_id }
  */
 struct rxrpc_call {
-	struct rcu_head		rcu;
+	union {
+		struct rcu_head		rcu;
+		struct work_struct	destruct_work;
+	};
 	struct rxrpc_connection	*conn;		/* connection carrying call */
 	struct rxrpc_peer	*peer;		/* Peer record for remote address */
 	struct rxrpc_sock __rcu	*socket;	/* socket responsible */
--- a/net/rxrpc/call_object.c
+++ b/net/rxrpc/call_object.c
@@ -561,12 +561,10 @@ void rxrpc_put_call(struct rxrpc_call *c
 	}
 }
 
-/*
- * Final call destruction under RCU.
- */
-static void rxrpc_rcu_destroy_call(struct rcu_head *rcu)
+static void rxrpc_destruct_call_workfn(struct work_struct *work)
 {
-	struct rxrpc_call *call = container_of(rcu, struct rxrpc_call, rcu);
+	struct rxrpc_call *call = container_of(work, struct rxrpc_call,
+						destruct_work);
 	struct rxrpc_net *rxnet = call->rxnet;
 
 	rxrpc_put_peer(call->peer);
@@ -578,6 +576,17 @@ static void rxrpc_rcu_destroy_call(struc
 }
 
 /*
+ * Final call destruction under RCU.
+ */
+static void rxrpc_rcu_destroy_call(struct rcu_head *rcu)
+{
+	struct rxrpc_call *call = container_of(rcu, struct rxrpc_call, rcu);
+
+	INIT_WORK(&call->destruct_work, rxrpc_destruct_call_workfn);
+	rxrpc_queue_work(&call->destruct_work);
+}
+
+/*
  * clean up a call
  */
 void rxrpc_cleanup_call(struct rxrpc_call *call)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
