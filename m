Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE191C4279
	for <lists+linux-afs@lfdr.de>; Mon,  4 May 2020 19:23:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=od4grNFSO0I+S9DIvx1N906W819nccc/mlasGpmUeBo=; b=VuWoH8W2mAT+tr
	dRyTxQ6m/B+yBHDU0cDQFXsr+w7kXoe/HQEdK2ZTEESPQ0ezhXlQvSMEcMIr8YrzM8MAV08qZKb6J
	dGA9I7dlQU1Z4kVhvicklnwF13BGkvcLPVa/NGbm0bSlZ/H31ACf0sAg/266zX7WpiPF+cVt+q/L8
	Y4XKPUaFWvHvpI4n1orb/ofE4OJmTBnI56nX6BFPJ7SsecEmhuxpCvYMU7ZSSnAThx2hN5df2NNO9
	RxJ8H60gYN+xSj6DPZeaMzk5esWQIU5A5YvCopGKUu6GCMdNLmeNEhN6KkD03ZWb6kWXT1+/ti4FP
	BJ90Vtdud77JTXmLrgoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVeoF-0000Gg-FJ; Mon, 04 May 2020 17:23:15 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVebS-00035x-39
 for linux-afs@lists.infradead.org; Mon, 04 May 2020 17:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588612201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ayCAPqtLTSavJ+rMgifYdt7Jk2/mYxGniv+xR152w/c=;
 b=fkyPdeP3s1EwQLddcemdc7bwVmgw9EFMWWeeTlEiYfZh8nNs1glmOqzE1jfDM1OzNdj972
 781pEg89SBkeeH/AggIogbLOChphjffPZOO57DGtZATWB+q5AkFvG0CbBiNKbwUxd6bHUh
 4oRy2Kf5K5AYsTG1jPiS7m7y9zOCl7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-Vz4iTM8LP52de-qDKcvkrw-1; Mon, 04 May 2020 13:09:59 -0400
X-MC-Unique: Vz4iTM8LP52de-qDKcvkrw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 815AC18FE882;
 Mon,  4 May 2020 17:09:57 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-118-225.rdu2.redhat.com
 [10.10.118.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2FE45C1BD;
 Mon,  4 May 2020 17:09:51 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [RFC PATCH 16/61] fscache: Remove obsolete stats
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
 Anna Schumaker <anna.schumaker@netapp.com>, Steve French <sfrench@samba.org>, 
 Jeff Layton <jlayton@redhat.com>
Date: Mon, 04 May 2020 18:09:50 +0100
Message-ID: <158861219079.340223.17673745778234035078.stgit@warthog.procyon.org.uk>
In-Reply-To: <158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk>
References: <158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_101002_262027_821F656D 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
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
X-Mailman-Approved-At: Mon, 04 May 2020 10:23:02 -0700
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 dhowells@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Remove a bunch of now-unused fscache stats counters that were obsoleted by
the removal of the old I/O routines.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/fscache/internal.h |   61 -----------------------
 fs/fscache/stats.c    |  129 -------------------------------------------------
 2 files changed, 1 insertion(+), 189 deletions(-)

diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
index 20cbd1288b5a..360137fd19a7 100644
--- a/fs/fscache/internal.h
+++ b/fs/fscache/internal.h
@@ -166,9 +166,6 @@ extern void fscache_proc_cleanup(void);
  * stats.c
  */
 #ifdef CONFIG_FSCACHE_STATS
-extern atomic_t fscache_n_ops_processed[FSCACHE_MAX_THREADS];
-extern atomic_t fscache_n_objs_processed[FSCACHE_MAX_THREADS];
-
 extern atomic_t fscache_n_op_pend;
 extern atomic_t fscache_n_op_run;
 extern atomic_t fscache_n_op_enqueue;
@@ -179,52 +176,6 @@ extern atomic_t fscache_n_op_gc;
 extern atomic_t fscache_n_op_cancelled;
 extern atomic_t fscache_n_op_rejected;
 
-extern atomic_t fscache_n_attr_changed;
-extern atomic_t fscache_n_attr_changed_ok;
-extern atomic_t fscache_n_attr_changed_nobufs;
-extern atomic_t fscache_n_attr_changed_nomem;
-extern atomic_t fscache_n_attr_changed_calls;
-
-extern atomic_t fscache_n_allocs;
-extern atomic_t fscache_n_allocs_ok;
-extern atomic_t fscache_n_allocs_wait;
-extern atomic_t fscache_n_allocs_nobufs;
-extern atomic_t fscache_n_allocs_intr;
-extern atomic_t fscache_n_allocs_object_dead;
-extern atomic_t fscache_n_alloc_ops;
-extern atomic_t fscache_n_alloc_op_waits;
-
-extern atomic_t fscache_n_retrievals;
-extern atomic_t fscache_n_retrievals_ok;
-extern atomic_t fscache_n_retrievals_wait;
-extern atomic_t fscache_n_retrievals_nodata;
-extern atomic_t fscache_n_retrievals_nobufs;
-extern atomic_t fscache_n_retrievals_intr;
-extern atomic_t fscache_n_retrievals_nomem;
-extern atomic_t fscache_n_retrievals_object_dead;
-extern atomic_t fscache_n_retrieval_ops;
-extern atomic_t fscache_n_retrieval_op_waits;
-
-extern atomic_t fscache_n_stores;
-extern atomic_t fscache_n_stores_ok;
-extern atomic_t fscache_n_stores_again;
-extern atomic_t fscache_n_stores_nobufs;
-extern atomic_t fscache_n_stores_oom;
-extern atomic_t fscache_n_store_ops;
-extern atomic_t fscache_n_store_calls;
-extern atomic_t fscache_n_store_pages;
-extern atomic_t fscache_n_store_radix_deletes;
-extern atomic_t fscache_n_store_pages_over_limit;
-
-extern atomic_t fscache_n_store_vmscan_not_storing;
-extern atomic_t fscache_n_store_vmscan_gone;
-extern atomic_t fscache_n_store_vmscan_busy;
-extern atomic_t fscache_n_store_vmscan_cancelled;
-extern atomic_t fscache_n_store_vmscan_wait;
-
-extern atomic_t fscache_n_marks;
-extern atomic_t fscache_n_uncaches;
-
 extern atomic_t fscache_n_acquires;
 extern atomic_t fscache_n_acquires_null;
 extern atomic_t fscache_n_acquires_no_cache;
@@ -241,7 +192,6 @@ extern atomic_t fscache_n_updates_run;
 
 extern atomic_t fscache_n_relinquishes;
 extern atomic_t fscache_n_relinquishes_null;
-extern atomic_t fscache_n_relinquishes_waitcrt;
 extern atomic_t fscache_n_relinquishes_retire;
 
 extern atomic_t fscache_n_cookie_index;
@@ -258,11 +208,6 @@ extern atomic_t fscache_n_object_created;
 extern atomic_t fscache_n_object_avail;
 extern atomic_t fscache_n_object_dead;
 
-extern atomic_t fscache_n_checkaux_none;
-extern atomic_t fscache_n_checkaux_okay;
-extern atomic_t fscache_n_checkaux_update;
-extern atomic_t fscache_n_checkaux_obsolete;
-
 extern atomic_t fscache_n_cop_alloc_object;
 extern atomic_t fscache_n_cop_lookup_object;
 extern atomic_t fscache_n_cop_lookup_complete;
@@ -273,12 +218,6 @@ extern atomic_t fscache_n_cop_drop_object;
 extern atomic_t fscache_n_cop_put_object;
 extern atomic_t fscache_n_cop_sync_cache;
 extern atomic_t fscache_n_cop_attr_changed;
-extern atomic_t fscache_n_cop_read_or_alloc_page;
-extern atomic_t fscache_n_cop_read_or_alloc_pages;
-extern atomic_t fscache_n_cop_allocate_page;
-extern atomic_t fscache_n_cop_allocate_pages;
-extern atomic_t fscache_n_cop_write_page;
-extern atomic_t fscache_n_cop_uncache_page;
 
 extern atomic_t fscache_n_cache_no_space_reject;
 extern atomic_t fscache_n_cache_stale_objects;
diff --git a/fs/fscache/stats.c b/fs/fscache/stats.c
index 281022871e70..5b1cec456199 100644
--- a/fs/fscache/stats.c
+++ b/fs/fscache/stats.c
@@ -24,52 +24,6 @@ atomic_t fscache_n_op_gc;
 atomic_t fscache_n_op_cancelled;
 atomic_t fscache_n_op_rejected;
 
-atomic_t fscache_n_attr_changed;
-atomic_t fscache_n_attr_changed_ok;
-atomic_t fscache_n_attr_changed_nobufs;
-atomic_t fscache_n_attr_changed_nomem;
-atomic_t fscache_n_attr_changed_calls;
-
-atomic_t fscache_n_allocs;
-atomic_t fscache_n_allocs_ok;
-atomic_t fscache_n_allocs_wait;
-atomic_t fscache_n_allocs_nobufs;
-atomic_t fscache_n_allocs_intr;
-atomic_t fscache_n_allocs_object_dead;
-atomic_t fscache_n_alloc_ops;
-atomic_t fscache_n_alloc_op_waits;
-
-atomic_t fscache_n_retrievals;
-atomic_t fscache_n_retrievals_ok;
-atomic_t fscache_n_retrievals_wait;
-atomic_t fscache_n_retrievals_nodata;
-atomic_t fscache_n_retrievals_nobufs;
-atomic_t fscache_n_retrievals_intr;
-atomic_t fscache_n_retrievals_nomem;
-atomic_t fscache_n_retrievals_object_dead;
-atomic_t fscache_n_retrieval_ops;
-atomic_t fscache_n_retrieval_op_waits;
-
-atomic_t fscache_n_stores;
-atomic_t fscache_n_stores_ok;
-atomic_t fscache_n_stores_again;
-atomic_t fscache_n_stores_nobufs;
-atomic_t fscache_n_stores_oom;
-atomic_t fscache_n_store_ops;
-atomic_t fscache_n_store_calls;
-atomic_t fscache_n_store_pages;
-atomic_t fscache_n_store_radix_deletes;
-atomic_t fscache_n_store_pages_over_limit;
-
-atomic_t fscache_n_store_vmscan_not_storing;
-atomic_t fscache_n_store_vmscan_gone;
-atomic_t fscache_n_store_vmscan_busy;
-atomic_t fscache_n_store_vmscan_cancelled;
-atomic_t fscache_n_store_vmscan_wait;
-
-atomic_t fscache_n_marks;
-atomic_t fscache_n_uncaches;
-
 atomic_t fscache_n_acquires;
 atomic_t fscache_n_acquires_null;
 atomic_t fscache_n_acquires_no_cache;
@@ -86,7 +40,6 @@ atomic_t fscache_n_updates_run;
 
 atomic_t fscache_n_relinquishes;
 atomic_t fscache_n_relinquishes_null;
-atomic_t fscache_n_relinquishes_waitcrt;
 atomic_t fscache_n_relinquishes_retire;
 
 atomic_t fscache_n_cookie_index;
@@ -103,11 +56,6 @@ atomic_t fscache_n_object_created;
 atomic_t fscache_n_object_avail;
 atomic_t fscache_n_object_dead;
 
-atomic_t fscache_n_checkaux_none;
-atomic_t fscache_n_checkaux_okay;
-atomic_t fscache_n_checkaux_update;
-atomic_t fscache_n_checkaux_obsolete;
-
 atomic_t fscache_n_cop_alloc_object;
 atomic_t fscache_n_cop_lookup_object;
 atomic_t fscache_n_cop_lookup_complete;
@@ -118,12 +66,6 @@ atomic_t fscache_n_cop_drop_object;
 atomic_t fscache_n_cop_put_object;
 atomic_t fscache_n_cop_sync_cache;
 atomic_t fscache_n_cop_attr_changed;
-atomic_t fscache_n_cop_read_or_alloc_page;
-atomic_t fscache_n_cop_read_or_alloc_pages;
-atomic_t fscache_n_cop_allocate_page;
-atomic_t fscache_n_cop_allocate_pages;
-atomic_t fscache_n_cop_write_page;
-atomic_t fscache_n_cop_uncache_page;
 
 atomic_t fscache_n_cache_no_space_reject;
 atomic_t fscache_n_cache_stale_objects;
@@ -147,15 +89,6 @@ int fscache_stats_show(struct seq_file *m, void *v)
 		   atomic_read(&fscache_n_object_no_alloc),
 		   atomic_read(&fscache_n_object_avail),
 		   atomic_read(&fscache_n_object_dead));
-	seq_printf(m, "ChkAux : non=%u ok=%u upd=%u obs=%u\n",
-		   atomic_read(&fscache_n_checkaux_none),
-		   atomic_read(&fscache_n_checkaux_okay),
-		   atomic_read(&fscache_n_checkaux_update),
-		   atomic_read(&fscache_n_checkaux_obsolete));
-
-	seq_printf(m, "Pages  : mrk=%u unc=%u\n",
-		   atomic_read(&fscache_n_marks),
-		   atomic_read(&fscache_n_uncaches));
 
 	seq_printf(m, "Acquire: n=%u nul=%u noc=%u ok=%u nbf=%u"
 		   " oom=%u\n",
@@ -182,64 +115,11 @@ int fscache_stats_show(struct seq_file *m, void *v)
 		   atomic_read(&fscache_n_updates_null),
 		   atomic_read(&fscache_n_updates_run));
 
-	seq_printf(m, "Relinqs: n=%u nul=%u wcr=%u rtr=%u\n",
+	seq_printf(m, "Relinqs: n=%u nul=%u rtr=%u\n",
 		   atomic_read(&fscache_n_relinquishes),
 		   atomic_read(&fscache_n_relinquishes_null),
-		   atomic_read(&fscache_n_relinquishes_waitcrt),
 		   atomic_read(&fscache_n_relinquishes_retire));
 
-	seq_printf(m, "AttrChg: n=%u ok=%u nbf=%u oom=%u run=%u\n",
-		   atomic_read(&fscache_n_attr_changed),
-		   atomic_read(&fscache_n_attr_changed_ok),
-		   atomic_read(&fscache_n_attr_changed_nobufs),
-		   atomic_read(&fscache_n_attr_changed_nomem),
-		   atomic_read(&fscache_n_attr_changed_calls));
-
-	seq_printf(m, "Allocs : n=%u ok=%u wt=%u nbf=%u int=%u\n",
-		   atomic_read(&fscache_n_allocs),
-		   atomic_read(&fscache_n_allocs_ok),
-		   atomic_read(&fscache_n_allocs_wait),
-		   atomic_read(&fscache_n_allocs_nobufs),
-		   atomic_read(&fscache_n_allocs_intr));
-	seq_printf(m, "Allocs : ops=%u owt=%u abt=%u\n",
-		   atomic_read(&fscache_n_alloc_ops),
-		   atomic_read(&fscache_n_alloc_op_waits),
-		   atomic_read(&fscache_n_allocs_object_dead));
-
-	seq_printf(m, "Retrvls: n=%u ok=%u wt=%u nod=%u nbf=%u"
-		   " int=%u oom=%u\n",
-		   atomic_read(&fscache_n_retrievals),
-		   atomic_read(&fscache_n_retrievals_ok),
-		   atomic_read(&fscache_n_retrievals_wait),
-		   atomic_read(&fscache_n_retrievals_nodata),
-		   atomic_read(&fscache_n_retrievals_nobufs),
-		   atomic_read(&fscache_n_retrievals_intr),
-		   atomic_read(&fscache_n_retrievals_nomem));
-	seq_printf(m, "Retrvls: ops=%u owt=%u abt=%u\n",
-		   atomic_read(&fscache_n_retrieval_ops),
-		   atomic_read(&fscache_n_retrieval_op_waits),
-		   atomic_read(&fscache_n_retrievals_object_dead));
-
-	seq_printf(m, "Stores : n=%u ok=%u agn=%u nbf=%u oom=%u\n",
-		   atomic_read(&fscache_n_stores),
-		   atomic_read(&fscache_n_stores_ok),
-		   atomic_read(&fscache_n_stores_again),
-		   atomic_read(&fscache_n_stores_nobufs),
-		   atomic_read(&fscache_n_stores_oom));
-	seq_printf(m, "Stores : ops=%u run=%u pgs=%u rxd=%u olm=%u\n",
-		   atomic_read(&fscache_n_store_ops),
-		   atomic_read(&fscache_n_store_calls),
-		   atomic_read(&fscache_n_store_pages),
-		   atomic_read(&fscache_n_store_radix_deletes),
-		   atomic_read(&fscache_n_store_pages_over_limit));
-
-	seq_printf(m, "VmScan : nos=%u gon=%u bsy=%u can=%u wt=%u\n",
-		   atomic_read(&fscache_n_store_vmscan_not_storing),
-		   atomic_read(&fscache_n_store_vmscan_gone),
-		   atomic_read(&fscache_n_store_vmscan_busy),
-		   atomic_read(&fscache_n_store_vmscan_cancelled),
-		   atomic_read(&fscache_n_store_vmscan_wait));
-
 	seq_printf(m, "Ops    : pend=%u run=%u enq=%u can=%u rej=%u\n",
 		   atomic_read(&fscache_n_op_pend),
 		   atomic_read(&fscache_n_op_run),
@@ -264,13 +144,6 @@ int fscache_stats_show(struct seq_file *m, void *v)
 		   atomic_read(&fscache_n_cop_put_object),
 		   atomic_read(&fscache_n_cop_attr_changed),
 		   atomic_read(&fscache_n_cop_sync_cache));
-	seq_printf(m, "CacheOp: rap=%d ras=%d alp=%d als=%d wrp=%d ucp=%d\n",
-		   atomic_read(&fscache_n_cop_read_or_alloc_page),
-		   atomic_read(&fscache_n_cop_read_or_alloc_pages),
-		   atomic_read(&fscache_n_cop_allocate_page),
-		   atomic_read(&fscache_n_cop_allocate_pages),
-		   atomic_read(&fscache_n_cop_write_page),
-		   atomic_read(&fscache_n_cop_uncache_page));
 	seq_printf(m, "CacheEv: nsp=%d stl=%d rtr=%d cul=%d\n",
 		   atomic_read(&fscache_n_cache_no_space_reject),
 		   atomic_read(&fscache_n_cache_stale_objects),



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
