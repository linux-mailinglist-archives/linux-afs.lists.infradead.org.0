Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F3B1B7958
	for <lists+linux-afs@lfdr.de>; Fri, 24 Apr 2020 17:20:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/uqnTkb98jjAe2+hbN31JVtPBCWNDIIaZmB5gVGHyeE=; b=WTynK5JPe0tKMD
	2a7t6wzLQbZ99tDj7HSg5VBLDHSEz2lDrLjeLrY84azn6K21aHEOQ/ilYONR7hJnr2ppZHEzi6Khz
	KTee5Gkr3z9HLwrr8H4g1T8BCgHgxxmjiGtQlGdaj+qHU1kEQ0/JqZfHCXopKdELBQb6MwNQsDiNR
	1V0ovxfx4Rt51h3qW1Cocu9T8qO8vXYsr9SEbjPQD1nUmW70BsMVqqjzU5OA5AjZZRxUp+MO9VDPD
	Sfk+hlS+I9oejrLagXaPHBXDq+pg4zWyzaVwCfIaXAVnkD0CesjqRUtJiiKZxP79ZdHcOde4htK1q
	rpCf/5ryXHLIwGtbG4aA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS07q-0005cw-6d
	for lists+linux-afs@lfdr.de; Fri, 24 Apr 2020 15:20:22 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS07m-0005al-Gv
 for linux-afs@lists.infradead.org; Fri, 24 Apr 2020 15:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587741617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sZ5w/L3tPVdKgoyCnnsGoBHIdbs3808BsYQYQ9jJR1I=;
 b=HtAm1l7YowvY3ztz472xxUenwhtlxCrRaVV5n1F72imkyW8eFCFk1pNJ8dODXcZIwsqeqj
 ryPObnKXpnjpMYOAeo6LZhoZFb3SRiQweXR+JnoDTOByWghrQsCAIhB1FE6TYz0mzRy9wQ
 bcOLqI95K3sP6xoWioslzzzqMx8jXpc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-zIWu_L2-MyObM6aN_tiKZQ-1; Fri, 24 Apr 2020 11:20:12 -0400
X-MC-Unique: zIWu_L2-MyObM6aN_tiKZQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD272835B41;
 Fri, 24 Apr 2020 15:20:10 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-129.rdu2.redhat.com
 [10.10.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4263960606;
 Fri, 24 Apr 2020 15:20:08 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 3/8] afs: Use the serverUnique field in the UVLDB record to
 reduce rpc ops
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 24 Apr 2020 16:20:07 +0100
Message-ID: <158774160751.3619859.14799985205086911414.stgit@warthog.procyon.org.uk>
In-Reply-To: <158774158625.3619859.10579201535876583842.stgit@warthog.procyon.org.uk>
References: <158774158625.3619859.10579201535876583842.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_082018_649591_EB23E753 
X-CRM114-Status: GOOD (  19.35  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
Cc: linux-fsdevel@vger.kernel.org, dhowells@redhat.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

The U-version VLDB volume record retrieved by the VL.GetEntryByNameU rpc op
carries a change counter (the serverUnique field) for each fileserver
listed in the record as backing that volume.  This is incremented whenever
the registration details for a fileserver change (such as its address
list).  Note that the same value will be seen in all UVLDB records that
refer to that fileserver.

This should be checked before calling the VL server to re-query the address
list for a fileserver.  If it's the same, there's no point doing the query.

Reported-by: Jeffrey Altman <jaltman@auristor.com>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/internal.h    |    5 +++--
 fs/afs/server.c      |   26 ++++++++++++++------------
 fs/afs/server_list.c |    3 ++-
 fs/afs/vlclient.c    |    1 +
 4 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 15ae9c7f9c00..2d4e0c4e23a4 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -471,6 +471,7 @@ struct afs_vldb_entry {
 #define AFS_VLDB_QUERY_ERROR	4		/* - VL server returned error */
 
 	uuid_t			fs_server[AFS_NMAXNSERVERS];
+	u32			addr_version[AFS_NMAXNSERVERS]; /* Registration change counters */
 	u8			fs_mask[AFS_NMAXNSERVERS];
 #define AFS_VOL_VTM_RW	0x01 /* R/W version of the volume is available (on this server) */
 #define AFS_VOL_VTM_RO	0x02 /* R/O version of the volume is available (on this server) */
@@ -498,7 +499,6 @@ struct afs_server {
 	struct hlist_node	proc_link;	/* Link in net->fs_proc */
 	struct afs_server	*gc_next;	/* Next server in manager's list */
 	time64_t		put_time;	/* Time at which last put */
-	time64_t		update_at;	/* Time at which to next update the record */
 	unsigned long		flags;
 #define AFS_SERVER_FL_NOT_READY	1		/* The record is not ready for use */
 #define AFS_SERVER_FL_NOT_FOUND	2		/* VL server says no such server */
@@ -511,6 +511,7 @@ struct afs_server {
 #define AFS_SERVER_FL_IS_YFS	9		/* Server is YFS not AFS */
 #define AFS_SERVER_FL_NO_RM2	10		/* Fileserver doesn't support YFS.RemoveFile2 */
 #define AFS_SERVER_FL_HAVE_EPOCH 11		/* ->epoch is valid */
+#define AFS_SERVER_FL_NEEDS_UPDATE 12		/* Fileserver address list is out of date */
 	atomic_t		usage;
 	u32			addr_version;	/* Address list version */
 	u32			cm_epoch;	/* Server RxRPC epoch */
@@ -1243,7 +1244,7 @@ extern spinlock_t afs_server_peer_lock;
 extern struct afs_server *afs_find_server(struct afs_net *,
 					  const struct sockaddr_rxrpc *);
 extern struct afs_server *afs_find_server_by_uuid(struct afs_net *, const uuid_t *);
-extern struct afs_server *afs_lookup_server(struct afs_cell *, struct key *, const uuid_t *);
+extern struct afs_server *afs_lookup_server(struct afs_cell *, struct key *, const uuid_t *, u32);
 extern struct afs_server *afs_get_server(struct afs_server *, enum afs_server_trace);
 extern void afs_put_server(struct afs_net *, struct afs_server *, enum afs_server_trace);
 extern void afs_manage_servers(struct work_struct *);
diff --git a/fs/afs/server.c b/fs/afs/server.c
index 11b90ac7ea30..9e50ccde5d37 100644
--- a/fs/afs/server.c
+++ b/fs/afs/server.c
@@ -12,7 +12,6 @@
 #include "protocol_yfs.h"
 
 static unsigned afs_server_gc_delay = 10;	/* Server record timeout in seconds */
-static unsigned afs_server_update_delay = 30;	/* Time till VLDB recheck in secs */
 static atomic_t afs_server_debug_id;
 
 static void afs_inc_servers_outstanding(struct afs_net *net)
@@ -218,7 +217,6 @@ static struct afs_server *afs_alloc_server(struct afs_net *net,
 	RCU_INIT_POINTER(server->addresses, alist);
 	server->addr_version = alist->version;
 	server->uuid = *uuid;
-	server->update_at = ktime_get_real_seconds() + afs_server_update_delay;
 	rwlock_init(&server->fs_lock);
 	INIT_HLIST_HEAD(&server->cb_volumes);
 	rwlock_init(&server->cb_break_lock);
@@ -264,7 +262,7 @@ static struct afs_addr_list *afs_vl_lookup_addrs(struct afs_cell *cell,
  * Get or create a fileserver record.
  */
 struct afs_server *afs_lookup_server(struct afs_cell *cell, struct key *key,
-				     const uuid_t *uuid)
+				     const uuid_t *uuid, u32 addr_version)
 {
 	struct afs_addr_list *alist;
 	struct afs_server *server, *candidate;
@@ -272,8 +270,11 @@ struct afs_server *afs_lookup_server(struct afs_cell *cell, struct key *key,
 	_enter("%p,%pU", cell->net, uuid);
 
 	server = afs_find_server_by_uuid(cell->net, uuid);
-	if (server)
+	if (server) {
+		if (server->addr_version != addr_version)
+			set_bit(AFS_SERVER_FL_NEEDS_UPDATE, &server->flags);
 		return server;
+	}
 
 	alist = afs_vl_lookup_addrs(cell, key, uuid);
 	if (IS_ERR(alist))
@@ -558,7 +559,6 @@ static noinline bool afs_update_server_record(struct afs_fs_cursor *fc, struct a
 		write_unlock(&server->fs_lock);
 	}
 
-	server->update_at = ktime_get_real_seconds() + afs_server_update_delay;
 	afs_put_addrlist(discard);
 	_leave(" = t");
 	return true;
@@ -569,8 +569,6 @@ static noinline bool afs_update_server_record(struct afs_fs_cursor *fc, struct a
  */
 bool afs_check_server_record(struct afs_fs_cursor *fc, struct afs_server *server)
 {
-	time64_t now = ktime_get_real_seconds();
-	long diff;
 	bool success;
 	int ret, retries = 0;
 
@@ -579,13 +577,16 @@ bool afs_check_server_record(struct afs_fs_cursor *fc, struct afs_server *server
 	ASSERT(server);
 
 retry:
-	diff = READ_ONCE(server->update_at) - now;
-	if (diff > 0) {
-		_leave(" = t [not now %ld]", diff);
-		return true;
-	}
+	if (test_bit(AFS_SERVER_FL_UPDATING, &server->flags))
+		goto wait;
+	if (test_bit(AFS_SERVER_FL_NEEDS_UPDATE, &server->flags))
+		goto update;
+	_leave(" = t [good]");
+	return true;
 
+update:
 	if (!test_and_set_bit_lock(AFS_SERVER_FL_UPDATING, &server->flags)) {
+		clear_bit(AFS_SERVER_FL_NEEDS_UPDATE, &server->flags);
 		success = afs_update_server_record(fc, server);
 		clear_bit_unlock(AFS_SERVER_FL_UPDATING, &server->flags);
 		wake_up_bit(&server->flags, AFS_SERVER_FL_UPDATING);
@@ -593,6 +594,7 @@ bool afs_check_server_record(struct afs_fs_cursor *fc, struct afs_server *server
 		return success;
 	}
 
+wait:
 	ret = wait_on_bit(&server->flags, AFS_SERVER_FL_UPDATING,
 			  (fc->flags & AFS_FS_CURSOR_INTR) ?
 			  TASK_INTERRUPTIBLE : TASK_UNINTERRUPTIBLE);
diff --git a/fs/afs/server_list.c b/fs/afs/server_list.c
index 888d91d195d9..f567732df5cc 100644
--- a/fs/afs/server_list.c
+++ b/fs/afs/server_list.c
@@ -51,7 +51,8 @@ struct afs_server_list *afs_alloc_server_list(struct afs_cell *cell,
 		if (!(vldb->fs_mask[i] & type_mask))
 			continue;
 
-		server = afs_lookup_server(cell, key, &vldb->fs_server[i]);
+		server = afs_lookup_server(cell, key, &vldb->fs_server[i],
+					   vldb->addr_version[i]);
 		if (IS_ERR(server)) {
 			ret = PTR_ERR(server);
 			if (ret == -ENOENT ||
diff --git a/fs/afs/vlclient.c b/fs/afs/vlclient.c
index 516e9a3bb5b4..972dc5512f33 100644
--- a/fs/afs/vlclient.c
+++ b/fs/afs/vlclient.c
@@ -82,6 +82,7 @@ static int afs_deliver_vl_get_entry_by_name_u(struct afs_call *call)
 		for (j = 0; j < 6; j++)
 			uuid->node[j] = (u8)ntohl(xdr->node[j]);
 
+		entry->addr_version[n] = ntohl(uvldb->serverUnique[i]);
 		entry->nr_servers++;
 	}
 



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
