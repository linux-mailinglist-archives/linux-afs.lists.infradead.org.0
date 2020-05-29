Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0E31E8AD2
	for <lists+linux-afs@lfdr.de>; Sat, 30 May 2020 00:02:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JG3q/pstWly5vbHqTN4bOtZ0d8wqsgTdgnZX1P3omcs=; b=J1LqnW0ZvOKo7d
	CP4TKSiFcTe8VNmoa0QiVRe2vYY6wPYI7Oo71bamXxk9n6so9hiXr4/ohPq32ezzxoYVxgR56rwcB
	GZykNMTAaD9Q4YLHUsmVSg7JUOWbcxBN5bC9NIGB05Vpd54SKTiImfQ4KRIYRlv5hWFzB0tj04xsT
	EIcVkSHImEA1wIAniZLX3LepdYWGdw9ADWDOFZpWXNbdFNtev8yR6QbKwjTlIqYaUA+bgo7ulW6bD
	2GQrm9mRf9uM4c0ZB73azVzhEc7Ei/EvcETErfrk6U9/2an2LnO6g+zWCCHnum/sAPnFIU43m4vCz
	6njKWtdZcozpOn19S/4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jen5S-0002Qx-9t; Fri, 29 May 2020 22:02:46 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jen5P-0002QP-P4
 for linux-afs@lists.infradead.org; Fri, 29 May 2020 22:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590789762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TEWiPfvb/5BVwFyGR4JohyJ2jM2WXW5cZ/1P+/MQc2g=;
 b=WqParjEHXMs4s7oB0vkasmbps9dBFqKyWiT8hmDUD8qbrkUTlJhf0taHKNi7AzWaCzKm3F
 qFcQr+0Jz4sdzQ6U/7ca/uvxstc1+BLyyoTL7zLdgmLAZRnDGh9E6zz+bjgrhfmvreGJIQ
 ip/dDpSLFZp9SKt6zksduHtt4unDNGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-18rWdakoOyOcpuEI6TiYWw-1; Fri, 29 May 2020 18:02:39 -0400
X-MC-Unique: 18rWdakoOyOcpuEI6TiYWw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C2E1100CCE8;
 Fri, 29 May 2020 22:02:38 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1897775294;
 Fri, 29 May 2020 22:02:36 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 21/27] afs: Add a tracepoint to track the lifetime of the
 afs_volume struct
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 29 May 2020 23:02:36 +0100
Message-ID: <159078975629.679399.18000329943978138516.stgit@warthog.procyon.org.uk>
In-Reply-To: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
References: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_150243_911754_7A47A50D 
X-CRM114-Status: GOOD (  17.58  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.139.110.120 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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

Add a tracepoint to track the lifetime of the afs_volume struct.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/cell.c              |    2 +-
 fs/afs/fs_operation.c      |    4 ++-
 fs/afs/internal.h          |   10 ++------
 fs/afs/super.c             |   10 +++++---
 fs/afs/vl_alias.c          |    9 ++++---
 fs/afs/volume.c            |   27 ++++++++++++++++++---
 include/trace/events/afs.h |   56 ++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 95 insertions(+), 23 deletions(-)

diff --git a/fs/afs/cell.c b/fs/afs/cell.c
index 212098514ebf..8bfc8a05fd46 100644
--- a/fs/afs/cell.c
+++ b/fs/afs/cell.c
@@ -482,7 +482,7 @@ static void afs_cell_destroy(struct rcu_head *rcu)
 
 	ASSERTCMP(atomic_read(&cell->usage), ==, 0);
 
-	afs_put_volume(cell->net, cell->root_volume);
+	afs_put_volume(cell->net, cell->root_volume, afs_volume_trace_put_cell_root);
 	afs_put_vlserverlist(cell->net, rcu_access_pointer(cell->vl_servers));
 	afs_put_cell(cell->net, cell->alias_of);
 	key_put(cell->anonymous_key);
diff --git a/fs/afs/fs_operation.c b/fs/afs/fs_operation.c
index f7a768d12141..f57efd9d2db0 100644
--- a/fs/afs/fs_operation.c
+++ b/fs/afs/fs_operation.c
@@ -36,7 +36,7 @@ struct afs_operation *afs_alloc_operation(struct key *key, struct afs_volume *vo
 	}
 
 	op->key		= key;
-	op->volume	= afs_get_volume(volume);
+	op->volume	= afs_get_volume(volume, afs_volume_trace_get_new_op);
 	op->net		= volume->cell->net;
 	op->cb_v_break	= volume->cb_v_break;
 	op->debug_id	= atomic_inc_return(&afs_operation_debug_counter);
@@ -233,7 +233,7 @@ int afs_put_operation(struct afs_operation *op)
 	afs_end_cursor(&op->ac);
 	afs_put_cb_interest(op->net, op->cbi);
 	afs_put_serverlist(op->net, op->server_list);
-	afs_put_volume(op->net, op->volume);
+	afs_put_volume(op->net, op->volume, afs_volume_trace_put_put_op);
 	kfree(op);
 	return ret;
 }
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index a3ef97d560ca..e084936066b0 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -1429,17 +1429,11 @@ extern struct afs_vlserver_list *afs_extract_vlserver_list(struct afs_cell *,
 /*
  * volume.c
  */
-static inline struct afs_volume *afs_get_volume(struct afs_volume *volume)
-{
-	if (volume)
-		atomic_inc(&volume->usage);
-	return volume;
-}
-
 extern struct afs_volume *afs_create_volume(struct afs_fs_context *);
 extern void afs_activate_volume(struct afs_volume *);
 extern void afs_deactivate_volume(struct afs_volume *);
-extern void afs_put_volume(struct afs_net *, struct afs_volume *);
+extern struct afs_volume *afs_get_volume(struct afs_volume *, enum afs_volume_trace);
+extern void afs_put_volume(struct afs_net *, struct afs_volume *, enum afs_volume_trace);
 extern int afs_check_volume_status(struct afs_volume *, struct afs_operation *);
 
 /*
diff --git a/fs/afs/super.c b/fs/afs/super.c
index 1bb69159956f..45e937dcb80a 100644
--- a/fs/afs/super.c
+++ b/fs/afs/super.c
@@ -376,7 +376,8 @@ static int afs_validate_fc(struct fs_context *fc)
 		ctx->key = key;
 
 		if (ctx->volume) {
-			afs_put_volume(ctx->net, ctx->volume);
+			afs_put_volume(ctx->net, ctx->volume,
+				       afs_volume_trace_put_validate_fc);
 			ctx->volume = NULL;
 		}
 
@@ -507,7 +508,8 @@ static struct afs_super_info *afs_alloc_sbi(struct fs_context *fc)
 			as->dyn_root = true;
 		} else {
 			as->cell = afs_get_cell(ctx->cell);
-			as->volume = afs_get_volume(ctx->volume);
+			as->volume = afs_get_volume(ctx->volume,
+						    afs_volume_trace_get_alloc_sbi);
 		}
 	}
 	return as;
@@ -517,7 +519,7 @@ static void afs_destroy_sbi(struct afs_super_info *as)
 {
 	if (as) {
 		struct afs_net *net = afs_net(as->net_ns);
-		afs_put_volume(net, as->volume);
+		afs_put_volume(net, as->volume, afs_volume_trace_put_destroy_sbi);
 		afs_put_cell(net, as->cell);
 		put_net(as->net_ns);
 		kfree(as);
@@ -604,7 +606,7 @@ static void afs_free_fc(struct fs_context *fc)
 	struct afs_fs_context *ctx = fc->fs_private;
 
 	afs_destroy_sbi(fc->s_fs_info);
-	afs_put_volume(ctx->net, ctx->volume);
+	afs_put_volume(ctx->net, ctx->volume, afs_volume_trace_put_free_fc);
 	afs_put_cell(ctx->net, ctx->cell);
 	key_put(ctx->key);
 	kfree(ctx);
diff --git a/fs/afs/vl_alias.c b/fs/afs/vl_alias.c
index 1fcb63c65ba9..1cf9584bb51d 100644
--- a/fs/afs/vl_alias.c
+++ b/fs/afs/vl_alias.c
@@ -193,7 +193,8 @@ static int afs_query_for_alias_one(struct afs_cell *cell, struct key *key,
 	read_lock(&p->proc_lock);
 	if (!list_empty(&p->proc_volumes))
 		pvol = afs_get_volume(list_first_entry(&p->proc_volumes,
-						       struct afs_volume, proc_link));
+						       struct afs_volume, proc_link),
+				      afs_volume_trace_get_query_alias);
 	read_unlock(&p->proc_lock);
 	if (!pvol)
 		return 0;
@@ -203,7 +204,7 @@ static int afs_query_for_alias_one(struct afs_cell *cell, struct key *key,
 	/* And see if it's in the new cell. */
 	volume = afs_sample_volume(cell, key, pvol->name, pvol->name_len);
 	if (IS_ERR(volume)) {
-		afs_put_volume(cell->net, pvol);
+		afs_put_volume(cell->net, pvol, afs_volume_trace_put_query_alias);
 		if (PTR_ERR(volume) != -ENOMEDIUM)
 			return PTR_ERR(volume);
 		/* That volume is not in the new cell, so not an alias */
@@ -221,8 +222,8 @@ static int afs_query_for_alias_one(struct afs_cell *cell, struct key *key,
 		rcu_read_unlock();
 	}
 
-	afs_put_volume(cell->net, volume);
-	afs_put_volume(cell->net, pvol);
+	afs_put_volume(cell->net, volume, afs_volume_trace_put_query_alias);
+	afs_put_volume(cell->net, pvol, afs_volume_trace_put_query_alias);
 	return ret;
 }
 
diff --git a/fs/afs/volume.c b/fs/afs/volume.c
index bb8a2e072427..461774d8a50e 100644
--- a/fs/afs/volume.c
+++ b/fs/afs/volume.c
@@ -52,6 +52,7 @@ static struct afs_volume *afs_alloc_volume(struct afs_fs_context *params,
 
 	refcount_set(&slist->usage, 1);
 	rcu_assign_pointer(volume->servers, slist);
+	trace_afs_volume(volume->vid, 1, afs_volume_trace_alloc);
 	return volume;
 
 error_1:
@@ -158,20 +159,38 @@ static void afs_destroy_volume(struct afs_net *net, struct afs_volume *volume)
 
 	afs_put_serverlist(net, volume->servers);
 	afs_put_cell(net, volume->cell);
+	trace_afs_volume(volume->vid, atomic_read(&volume->usage),
+			 afs_volume_trace_free);
 	kfree(volume);
 
 	_leave(" [destroyed]");
 }
 
 /*
- * Drop a reference on a volume record.
+ * Get a reference on a volume record.
  */
-void afs_put_volume(struct afs_net *net, struct afs_volume *volume)
+struct afs_volume *afs_get_volume(struct afs_volume *volume,
+				  enum afs_volume_trace reason)
 {
 	if (volume) {
-		_enter("%s", volume->name);
+		int u = atomic_inc_return(&volume->usage);
+		trace_afs_volume(volume->vid, u, reason);
+	}
+	return volume;
+}
+
 
-		if (atomic_dec_and_test(&volume->usage))
+/*
+ * Drop a reference on a volume record.
+ */
+void afs_put_volume(struct afs_net *net, struct afs_volume *volume,
+		    enum afs_volume_trace reason)
+{
+	if (volume) {
+		afs_volid_t vid = volume->vid;
+		int u = atomic_dec_return(&volume->usage);
+		trace_afs_volume(vid, u, reason);
+		if (u == 0)
 			afs_destroy_volume(net, volume);
 	}
 }
diff --git a/include/trace/events/afs.h b/include/trace/events/afs.h
index f320b3ad54da..5f0c1cf1ea13 100644
--- a/include/trace/events/afs.h
+++ b/include/trace/events/afs.h
@@ -50,6 +50,23 @@ enum afs_server_trace {
 	afs_server_trace_update,
 };
 
+enum afs_volume_trace {
+	afs_volume_trace_alloc,
+	afs_volume_trace_free,
+	afs_volume_trace_get_alloc_sbi,
+	afs_volume_trace_get_cell_insert,
+	afs_volume_trace_get_new_op,
+	afs_volume_trace_get_query_alias,
+	afs_volume_trace_put_cell_dup,
+	afs_volume_trace_put_cell_root,
+	afs_volume_trace_put_destroy_sbi,
+	afs_volume_trace_put_free_fc,
+	afs_volume_trace_put_put_op,
+	afs_volume_trace_put_query_alias,
+	afs_volume_trace_put_validate_fc,
+	afs_volume_trace_remove,
+};
+
 enum afs_fs_operation {
 	afs_FS_FetchData		= 130,	/* AFS Fetch file data */
 	afs_FS_FetchACL			= 131,	/* AFS Fetch file ACL */
@@ -262,6 +279,22 @@ enum afs_cb_break_reason {
 	EM(afs_server_trace_put_uuid_rsq,	"PUT u-req") \
 	E_(afs_server_trace_update,		"UPDATE")
 
+#define afs_volume_traces \
+	EM(afs_volume_trace_alloc,		"ALLOC         ") \
+	EM(afs_volume_trace_free,		"FREE          ") \
+	EM(afs_volume_trace_get_alloc_sbi,	"GET sbi-alloc ") \
+	EM(afs_volume_trace_get_cell_insert,	"GET cell-insrt") \
+	EM(afs_volume_trace_get_new_op,		"GET op-new    ") \
+	EM(afs_volume_trace_get_query_alias,	"GET cell-alias") \
+	EM(afs_volume_trace_put_cell_dup,	"PUT cell-dup  ") \
+	EM(afs_volume_trace_put_cell_root,	"PUT cell-root ") \
+	EM(afs_volume_trace_put_destroy_sbi,	"PUT sbi-destry") \
+	EM(afs_volume_trace_put_free_fc,	"PUT fc-free   ") \
+	EM(afs_volume_trace_put_put_op,		"PUT op-put    ") \
+	EM(afs_volume_trace_put_query_alias,	"PUT cell-alias") \
+	EM(afs_volume_trace_put_validate_fc,	"PUT fc-validat") \
+	E_(afs_volume_trace_remove,		"REMOVE        ")
+
 #define afs_fs_operations \
 	EM(afs_FS_FetchData,			"FS.FetchData") \
 	EM(afs_FS_FetchStatus,			"FS.FetchStatus") \
@@ -1302,6 +1335,29 @@ TRACE_EVENT(afs_server,
 		      __entry->active)
 	    );
 
+TRACE_EVENT(afs_volume,
+	    TP_PROTO(afs_volid_t vid, int ref, enum afs_volume_trace reason),
+
+	    TP_ARGS(vid, ref, reason),
+
+	    TP_STRUCT__entry(
+		    __field(afs_volid_t,		vid		)
+		    __field(int,			ref		)
+		    __field(enum afs_volume_trace,	reason		)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->vid = vid;
+		    __entry->ref = ref;
+		    __entry->reason = reason;
+			   ),
+
+	    TP_printk("V=%llx %s u=%d",
+		      __entry->vid,
+		      __print_symbolic(__entry->reason, afs_volume_traces),
+		      __entry->ref)
+	    );
+
 #endif /* _TRACE_AFS_H */
 
 /* This part must be outside protection */



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
