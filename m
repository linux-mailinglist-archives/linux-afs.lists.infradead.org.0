Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2292F18B2B3
	for <lists+linux-afs@lfdr.de>; Thu, 19 Mar 2020 12:54:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bdzpHFCqhfIUyGDRNws+Vio/R4+Cud6JY8XVBQran+w=; b=qV4Yo1i+Bnlk/u
	3xicyo5GZAtJHnnBzu71dLwoGAfDiMgWACd07rxCQZbKKKZdRGGnh1TgrIrExnIxMBDgY6VYEYwZh
	AP1ssuwbqR14hVGP+wmHs6hDP2P13eccVqWT0qf1i53tDDgq9QumUQIgOcbOzqwHDD9pLBqMw3OmM
	y3/r7zxTdNsnyUho3saIbsFbS9vQoDPurjZ48nAZyoFDuVPCZLEvcIPIHNgNvYSZiPXDdimzyZ1XT
	RgPO5VioR9o8nn6dEGcc/NYbCoQmtCoRRUnG4i0IOqYyxbruPzpBVtY03Gmw5TGbQ/+hcJAjfLJh9
	cM3TgwKkiWZptojCk9Rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEtkT-0007Sd-Qw; Thu, 19 Mar 2020 11:54:05 +0000
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEtkQ-0007Rm-QP
 for linux-afs@lists.infradead.org; Thu, 19 Mar 2020 11:54:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584618841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DOgyuILY5jTsbaJ39lZihdKRVPX6aPdJZnDhJBfsmH0=;
 b=aUpDD7ef87sqmju+hDlGoNNW8F2FqMVeVBmratZoGvRFZyn4pVGSHrESNzgCO/kHlt0Oqa
 7HyfFslgGxx8G+nSGsdjRaGybBfo9n8rXWbfIhgIiWkzXs8C9svR89dwQg8P2aEUHTDuor
 4HPQekik+ue0AIhF1/mKu5oL6Vk20Bg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-X4unecJhNrywxKQaALOJ2w-1; Thu, 19 Mar 2020 07:54:00 -0400
X-MC-Unique: X4unecJhNrywxKQaALOJ2w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 443428010C4;
 Thu, 19 Mar 2020 11:53:59 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-126.rdu2.redhat.com
 [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75A3891285;
 Thu, 19 Mar 2020 11:53:58 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 4/6] afs: Fix some tracing details
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 19 Mar 2020 11:53:57 +0000
Message-ID: <158461883772.3094720.8491121830607569447.stgit@warthog.procyon.org.uk>
In-Reply-To: <158461880968.3094720.5019510060910604912.stgit@warthog.procyon.org.uk>
References: <158461880968.3094720.5019510060910604912.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_045402_928937_DC812E78 
X-CRM114-Status: GOOD (  13.06  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [63.128.21.74 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Fix a couple of tracelines to indicate the usage count after the atomic op,
not the usage count before it to be consistent with other afs and rxrpc
trace lines.

Change the wording of the afs_call_trace_work trace ID label from "WORK" to
"QUEUE" to reflect the fact that it's queueing work, not doing work.

Fixes: 341f741f04be ("afs: Refcount the afs_call struct")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/rxrpc.c             |    4 ++--
 include/trace/events/afs.h |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/afs/rxrpc.c b/fs/afs/rxrpc.c
index 4c28712bb7f6..907d5948564a 100644
--- a/fs/afs/rxrpc.c
+++ b/fs/afs/rxrpc.c
@@ -169,7 +169,7 @@ void afs_put_call(struct afs_call *call)
 	int n = atomic_dec_return(&call->usage);
 	int o = atomic_read(&net->nr_outstanding_calls);
 
-	trace_afs_call(call, afs_call_trace_put, n + 1, o,
+	trace_afs_call(call, afs_call_trace_put, n, o,
 		       __builtin_return_address(0));
 
 	ASSERTCMP(n, >=, 0);
@@ -736,7 +736,7 @@ static void afs_wake_up_async_call(struct sock *sk, struct rxrpc_call *rxcall,
 
 	u = atomic_fetch_add_unless(&call->usage, 1, 0);
 	if (u != 0) {
-		trace_afs_call(call, afs_call_trace_wake, u,
+		trace_afs_call(call, afs_call_trace_wake, u + 1,
 			       atomic_read(&call->net->nr_outstanding_calls),
 			       __builtin_return_address(0));
 
diff --git a/include/trace/events/afs.h b/include/trace/events/afs.h
index 564ba1b5cf57..c612cabbc378 100644
--- a/include/trace/events/afs.h
+++ b/include/trace/events/afs.h
@@ -233,7 +233,7 @@ enum afs_cb_break_reason {
 	EM(afs_call_trace_get,			"GET  ") \
 	EM(afs_call_trace_put,			"PUT  ") \
 	EM(afs_call_trace_wake,			"WAKE ") \
-	E_(afs_call_trace_work,			"WORK ")
+	E_(afs_call_trace_work,			"QUEUE")
 
 #define afs_server_traces \
 	EM(afs_server_trace_alloc,		"ALLOC    ") \



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
