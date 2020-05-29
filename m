Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 629701E8AB7
	for <lists+linux-afs@lfdr.de>; Sat, 30 May 2020 00:02:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cuMUkeB9G5Nv2ul8iVBTUc/CeYnJYw+6ltwuasdlE9Y=; b=Lz4G413b1Fim6z
	Y6bgdsf5Pyk53Ey/IcE2eSZb/stg8B+nYeWiZFqVnc9KhVszK3LHOqmgg3fCf8kOWsvs4Uv6Umzt+
	/FWQOAAywiF8KbXhci9eHRuI/8uCl2+x3iBEVg4j/3iF6BpBtyNZr1HB9YE0BD4WyC+3MoKkYomgD
	cYk8rFJkYu/NOGiFEb72xbqcMSXhLsoVejVuaEXf4+RZnBgHH6GPdn3jX8XKq+w8OwVRV3aKVfEzM
	J3fMxJtuN0RlumRoyRkEw6QKVkYLSEyy7c/etHB4gs/r5aDrEHMCmmEtCUxsmZAPWCEPPffYjNAz3
	OKDBWuJdpK+EAB78nmoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jen4i-00024s-B0; Fri, 29 May 2020 22:02:00 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jen4f-00023t-V2
 for linux-afs@lists.infradead.org; Fri, 29 May 2020 22:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590789717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G+rb9rrdYIahXVRWyEkfWi76z3dO7iGrg2agpUGegNU=;
 b=feZSPEsMA4nZ42kSTofUd/+sXwO6NlbTyDBcaUlxbMu5PbB2aNHFvYWcht93/nAzVhhqpo
 vKcb8h4ddmpUtRRoCa35iQOJneNKZVkqG/9aEItQwJRLNZEOH0Tju5zLA4bc9h1BYMKnV/
 rKySdJAZroCqYrfvQtMQrS9b0VKamX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-yKbLLOH3PxWajYR-0bu9gw-1; Fri, 29 May 2020 18:01:50 -0400
X-MC-Unique: yKbLLOH3PxWajYR-0bu9gw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D4F018A8220;
 Fri, 29 May 2020 22:01:49 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2337FA1048;
 Fri, 29 May 2020 22:01:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 14/27] afs: Don't get epoch from a server because it may be
 ambiguous
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 29 May 2020 23:01:47 +0100
Message-ID: <159078970733.679399.1214323890532227368.stgit@warthog.procyon.org.uk>
In-Reply-To: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
References: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_150158_073212_45B69203 
X-CRM114-Status: GOOD (  15.50  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.139.110.120 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
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
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Don't get the epoch from a server, particularly one that we're looking up
by UUID, as UUIDs may be ambiguous and may map to more than one server - so
we can't draw any conclusions from it.

Reported-by: Jeffrey Altman <jaltman@auristor.com>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/cmservice.c |   49 ++-----------------------------------------------
 fs/afs/internal.h  |    7 -------
 2 files changed, 2 insertions(+), 54 deletions(-)

diff --git a/fs/afs/cmservice.c b/fs/afs/cmservice.c
index ed0fb34d77dd..954030ae7a0f 100644
--- a/fs/afs/cmservice.c
+++ b/fs/afs/cmservice.c
@@ -118,8 +118,6 @@ bool afs_cm_incoming_call(struct afs_call *call)
 {
 	_enter("{%u, CB.OP %u}", call->service_id, call->operation_ID);
 
-	call->epoch = rxrpc_kernel_get_epoch(call->net->socket, call->rxcall);
-
 	switch (call->operation_ID) {
 	case CBCallBack:
 		call->type = &afs_SRXCBCallBack;
@@ -149,49 +147,6 @@ bool afs_cm_incoming_call(struct afs_call *call)
 	}
 }
 
-/*
- * Record a probe to the cache manager from a server.
- */
-static int afs_record_cm_probe(struct afs_call *call, struct afs_server *server)
-{
-	_enter("");
-
-	if (test_bit(AFS_SERVER_FL_HAVE_EPOCH, &server->flags) &&
-	    !afs_is_probing_server(server)) {
-		if (server->cm_epoch == call->epoch)
-			return 0;
-
-		if (!server->probe.said_rebooted) {
-			pr_notice("kAFS: FS rebooted %pU\n", &server->uuid);
-			server->probe.said_rebooted = true;
-		}
-	}
-
-	spin_lock(&server->probe_lock);
-
-	if (!test_and_set_bit(AFS_SERVER_FL_HAVE_EPOCH, &server->flags)) {
-		server->cm_epoch = call->epoch;
-		server->probe.cm_epoch = call->epoch;
-		goto out;
-	}
-
-	if (server->probe.cm_probed &&
-	    call->epoch != server->probe.cm_epoch &&
-	    !server->probe.said_inconsistent) {
-		pr_notice("kAFS: FS endpoints inconsistent %pU\n",
-			  &server->uuid);
-		server->probe.said_inconsistent = true;
-	}
-
-	if (!server->probe.cm_probed || call->epoch == server->cm_epoch)
-		server->probe.cm_epoch = server->cm_epoch;
-
-out:
-	server->probe.cm_probed = true;
-	spin_unlock(&server->probe_lock);
-	return 0;
-}
-
 /*
  * Find the server record by peer address and record a probe to the cache
  * manager from a server.
@@ -210,7 +165,7 @@ static int afs_find_cm_server_by_peer(struct afs_call *call)
 	}
 
 	call->server = server;
-	return afs_record_cm_probe(call, server);
+	return 0;
 }
 
 /*
@@ -231,7 +186,7 @@ static int afs_find_cm_server_by_uuid(struct afs_call *call,
 	}
 
 	call->server = server;
-	return afs_record_cm_probe(call, server);
+	return 0;
 }
 
 /*
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 4b8ac049fc17..9f024c1bd650 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -124,7 +124,6 @@ struct afs_call {
 	spinlock_t		state_lock;
 	int			error;		/* error code */
 	u32			abort_code;	/* Remote abort ID or 0 */
-	u32			epoch;
 	unsigned int		max_lifespan;	/* Maximum lifespan to set if not 0 */
 	unsigned		request_size;	/* size of request data */
 	unsigned		reply_max;	/* maximum size of reply */
@@ -491,12 +490,10 @@ struct afs_server {
 #define AFS_SERVER_FL_MAY_HAVE_CB 8		/* May have callbacks on this fileserver */
 #define AFS_SERVER_FL_IS_YFS	9		/* Server is YFS not AFS */
 #define AFS_SERVER_FL_NO_RM2	10		/* Fileserver doesn't support YFS.RemoveFile2 */
-#define AFS_SERVER_FL_HAVE_EPOCH 11		/* ->epoch is valid */
 #define AFS_SERVER_FL_NEEDS_UPDATE 12		/* Fileserver address list is out of date */
 	atomic_t		ref;		/* Object refcount */
 	atomic_t		active;		/* Active user count */
 	u32			addr_version;	/* Address list version */
-	u32			cm_epoch;	/* Server RxRPC epoch */
 	unsigned int		debug_id;	/* Debugging ID for traces */
 
 	/* file service access */
@@ -515,15 +512,11 @@ struct afs_server {
 	struct {
 		unsigned int	rtt;		/* RTT as ktime/64 */
 		u32		abort_code;
-		u32		cm_epoch;
 		short		error;
 		bool		responded:1;
 		bool		is_yfs:1;
 		bool		not_yfs:1;
 		bool		local_failure:1;
-		bool		cm_probed:1;
-		bool		said_rebooted:1;
-		bool		said_inconsistent:1;
 	} probe;
 };
 



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
