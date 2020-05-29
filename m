Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 496C31E8AD3
	for <lists+linux-afs@lfdr.de>; Sat, 30 May 2020 00:03:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rWa0rBPRRZOrCJQHkQSjzwhxGfKDECbN14Ozl4maQe0=; b=okq1idJyRQBI+W
	3Z08v+kGnFkOb0uqUgEYIlz70S8bVVvY61ggmQAR8AjfTYOFEj3iAmk44Mj86N0I7+Xsnu+rprJkA
	Cvgr3c38zx5Mks6qIKo/J3OCmhuhjCwzOS0sAB1JK/b5+pGPLs6SUGV2ttofvOxbJTbrhJ63i39Pn
	OP/BY0p6cjJrcHy6w/ZVlhFPFOjvBx4Ohpw39M7Mln1hS2hAPke5SmzLHy4XzwrxV/USPHvitsEbK
	dsv+n+u/KzobQZ0cpbzs273uMfvhAw0Qf+8tAQViyMxSID5C0e8+lR5JsyETvSX+40/C34LKltxy4
	LO9jhm0GMMF0j1Tsb8Gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jen5h-0002WA-Lx; Fri, 29 May 2020 22:03:01 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jen5e-0002TM-Sf
 for linux-afs@lists.infradead.org; Fri, 29 May 2020 22:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590789777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xI9YKh9W57g2cv/4iePFsdmaxAiWLoBNBJ9/boptkdM=;
 b=aDpNcVx0SC3WQThB1PMC5bXcdcgqbEzSV97u3dx+dpJzVBoGj8UJM+CjmItNpH1IL6ci1C
 ni1GtyJ/JZtTysfgowMzQxobJEHUgj70P+O2kBE8/SFF8elzTc9iaRu8Uzmb4oYVu8+gtA
 WPXMPgSFNH3TGTC7YI0Haenea3WBkW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-YiNSQ-_eN8GaszSTaOp5dw-1; Fri, 29 May 2020 18:02:54 -0400
X-MC-Unique: YiNSQ-_eN8GaszSTaOp5dw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9153C107ACCA;
 Fri, 29 May 2020 22:02:52 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 895E95D9D7;
 Fri, 29 May 2020 22:02:51 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 23/27] afs: Fix the by-UUID server tree to allow servers with
 the same UUID
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 29 May 2020 23:02:50 +0100
Message-ID: <159078977077.679399.159019304395285864.stgit@warthog.procyon.org.uk>
In-Reply-To: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
References: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_150259_022025_3CA25CBE 
X-CRM114-Status: GOOD (  22.70  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.61 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Whilst it shouldn't happen, it is possible for multiple fileservers to
share a UUID, particularly if an entire cell has been duplicated, UUIDs and
all.  In such a case, it's not necessarily possible to map the effect of
the CB.InitCallBackState3 incoming RPC to a specific server unambiguously
by UUID and thus to a specific cell.

Indeed, there's a problem whereby multiple server records may need to
occupy the same spot in the rb_tree rooted in the afs_net struct.

Fix this by allowing servers to form a list, with the head of the list in
the tree.  When the front entry in the list is removed, the second in the
list just replaces it.  afs_init_callback_state() then just goes down the
line, poking each server in the list.

This means that some servers will be unnecessarily poked, unfortunately.
An alternative would be to route by call parameters.

Reported-by: Jeffrey Altman <jaltman@auristor.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Fixes: d2ddc776a458 ("afs: Overhaul volume and server record caching and fileserver rotation")
---

 fs/afs/callback.c |   10 ++++++++-
 fs/afs/internal.h |    4 +++-
 fs/afs/server.c   |   56 +++++++++++++++++++++++++++++++++++++++++++++--------
 3 files changed, 59 insertions(+), 11 deletions(-)

diff --git a/fs/afs/callback.c b/fs/afs/callback.c
index b4cb9bb63f0a..7d9b23d981bf 100644
--- a/fs/afs/callback.c
+++ b/fs/afs/callback.c
@@ -21,11 +21,17 @@
 #include "internal.h"
 
 /*
- * allow the fileserver to request callback state (re-)initialisation
+ * Allow the fileserver to request callback state (re-)initialisation.
+ * Unfortunately, UUIDs are not guaranteed unique.
  */
 void afs_init_callback_state(struct afs_server *server)
 {
-	server->cb_s_break++;
+	rcu_read_lock();
+	do {
+		server->cb_s_break++;
+		server = rcu_dereference(server->uuid_next);
+	} while (0);
+	rcu_read_unlock();
 }
 
 /*
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index c64c2b47ece7..e0dc14d4d8b9 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -486,7 +486,9 @@ struct afs_server {
 
 	struct afs_addr_list	__rcu *addresses;
 	struct afs_cell		*cell;		/* Cell to which belongs (pins ref) */
-	struct rb_node		uuid_rb;	/* Link in cell->fs_servers */
+	struct rb_node		uuid_rb;	/* Link in net->fs_servers */
+	struct afs_server __rcu	*uuid_next;	/* Next server with same UUID */
+	struct afs_server	*uuid_prev;	/* Previous server with same UUID */
 	struct list_head	probe_link;	/* Link in net->fs_probe_list */
 	struct hlist_node	addr4_link;	/* Link in net->fs_addresses4 */
 	struct hlist_node	addr6_link;	/* Link in net->fs_addresses6 */
diff --git a/fs/afs/server.c b/fs/afs/server.c
index c51039a077cd..88593ffcb54e 100644
--- a/fs/afs/server.c
+++ b/fs/afs/server.c
@@ -130,13 +130,15 @@ struct afs_server *afs_find_server_by_uuid(struct afs_net *net, const uuid_t *uu
 }
 
 /*
- * Install a server record in the namespace tree
+ * Install a server record in the namespace tree.  If there's a clash, we stick
+ * it into a list anchored on whichever afs_server struct is actually in the
+ * tree.
  */
 static struct afs_server *afs_install_server(struct afs_cell *cell,
 					     struct afs_server *candidate)
 {
 	const struct afs_addr_list *alist;
-	struct afs_server *server;
+	struct afs_server *server, *next;
 	struct afs_net *net = cell->net;
 	struct rb_node **pp, *p;
 	int diff;
@@ -153,12 +155,30 @@ static struct afs_server *afs_install_server(struct afs_cell *cell,
 		_debug("- consider %p", p);
 		server = rb_entry(p, struct afs_server, uuid_rb);
 		diff = memcmp(&candidate->uuid, &server->uuid, sizeof(uuid_t));
-		if (diff < 0)
+		if (diff < 0) {
 			pp = &(*pp)->rb_left;
-		else if (diff > 0)
+		} else if (diff > 0) {
 			pp = &(*pp)->rb_right;
-		else
-			goto exists;
+		} else {
+			if (server->cell == cell)
+				goto exists;
+
+			/* We have the same UUID representing servers in
+			 * different cells.  Append the new server to the list.
+			 */
+			for (;;) {
+				next = rcu_dereference_protected(
+					server->uuid_next,
+					lockdep_is_held(&net->fs_lock.lock));
+				if (!next)
+					break;
+				server = next;
+			}
+			rcu_assign_pointer(server->uuid_next, candidate);
+			candidate->uuid_prev = server;
+			server = candidate;
+			goto added_dup;
+		}
 	}
 
 	server = candidate;
@@ -166,6 +186,7 @@ static struct afs_server *afs_install_server(struct afs_cell *cell,
 	rb_insert_color(&server->uuid_rb, &net->fs_servers);
 	hlist_add_head_rcu(&server->proc_link, &net->fs_proc);
 
+added_dup:
 	write_seqlock(&net->fs_addr_lock);
 	alist = rcu_dereference_protected(server->addresses,
 					  lockdep_is_held(&net->fs_addr_lock.lock));
@@ -453,7 +474,7 @@ static void afs_destroy_server(struct afs_net *net, struct afs_server *server)
  */
 static void afs_gc_servers(struct afs_net *net, struct afs_server *gc_list)
 {
-	struct afs_server *server;
+	struct afs_server *server, *next, *prev;
 	int active;
 
 	while ((server = gc_list)) {
@@ -465,7 +486,26 @@ static void afs_gc_servers(struct afs_net *net, struct afs_server *gc_list)
 		if (active == 0) {
 			trace_afs_server(server, atomic_read(&server->ref),
 					 active, afs_server_trace_gc);
-			rb_erase(&server->uuid_rb, &net->fs_servers);
+			next = rcu_dereference_protected(
+				server->uuid_next, lockdep_is_held(&net->fs_lock.lock));
+			prev = server->uuid_prev;
+			if (!prev) {
+				/* The one at the front is in the tree */
+				if (!next) {
+					rb_erase(&server->uuid_rb, &net->fs_servers);
+				} else {
+					rb_replace_node_rcu(&server->uuid_rb,
+							    &next->uuid_rb,
+							    &net->fs_servers);
+					next->uuid_prev = NULL;
+				}
+			} else {
+				/* This server is not at the front */
+				rcu_assign_pointer(prev->uuid_next, next);
+				if (next)
+					next->uuid_prev = prev;
+			}
+
 			list_del(&server->probe_link);
 			hlist_del_rcu(&server->proc_link);
 			if (!hlist_unhashed(&server->addr4_link))



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
