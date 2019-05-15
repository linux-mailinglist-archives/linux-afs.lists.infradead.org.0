Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3301F888
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 18:26:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAoEzwdTx353Eu0+FmJmbRVsWjgZwv4Cx3lqP2V2oH8=; b=j2Ixqju04K4xFY
	VQWc/pQXSNVYwMNNSOUnGFgCKu+tjEANXcvmZ8PYFRT7JWaNJ4d10TavtMwEegUdGq+C+87nS4Mjz
	ROITHFw1x8cpTTpBBkSMJMeWU6nU7slJeuKz6jPf/qfZ7DRgFBUr/mQv69PXeaTyz31yDftNjUFKG
	qAAqSB+0qt+XStvYKrU7tHNFi92l0v0VCx9wrwBhfGv7gelnSEagsVI+n7kAqk1dS5TB37VqbmLi5
	sSNCc6eSfd2M7DmZ4trm1V/6l7tbqXVor+6e6iXT+DWZh34P8vyEb6mR6AklJFDGZO98PUcuEPtKG
	Q01Af2Ydm7btpar4rcKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQwjo-0001iX-Qe; Wed, 15 May 2019 16:26:40 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQwjl-0001i8-OC
 for linux-afs@lists.infradead.org; Wed, 15 May 2019 16:26:39 +0000
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 791BCE3DF1;
 Wed, 15 May 2019 16:26:37 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 786B05DDAF;
 Wed, 15 May 2019 16:26:35 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 08/15] afs: Fix cell DNS lookup
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 15 May 2019 17:26:35 +0100
Message-ID: <155793759518.31671.13432703876008980378.stgit@warthog.procyon.org.uk>
In-Reply-To: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
References: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Wed, 15 May 2019 16:26:37 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_092637_836446_5D4B8CE0 
X-CRM114-Status: GOOD (  26.11  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
 information
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
Cc: dhowells@redhat.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Currently, once configured, AFS cells are looked up in the DNS at regular
intervals - which is a waste of resources if those cells aren't being
used.  It also leads to a problem where cells preloaded, but not
configured, before the network is brought up end up effectively statically
configured with no VL servers and are unable to get any.

Fix this by not doing the DNS lookup until the first time a cell is
touched.  It is waited for if we don't have any cached records yet,
otherwise the DNS lookup to maintain the record is done in the background.

This has the downside that the first time you touch a cell, you now have to
wait for the upcall to do the required DNS lookups rather than them already
being cached.

Further, the record is not replaced if the old record has at least one
server in it and the new record doesn't have any.

Fixes: 0a5143f2f89c ("afs: Implement VL server rotation")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/cell.c      |  169 ++++++++++++++++++++++++++++++++--------------------
 fs/afs/internal.h  |   10 ++-
 fs/afs/vl_rotate.c |   26 +++++++-
 3 files changed, 130 insertions(+), 75 deletions(-)

diff --git a/fs/afs/cell.c b/fs/afs/cell.c
index 47f96be05163..9c3b07ba2222 100644
--- a/fs/afs/cell.c
+++ b/fs/afs/cell.c
@@ -152,8 +152,6 @@ static struct afs_cell *afs_alloc_cell(struct afs_net *net,
 
 	atomic_set(&cell->usage, 2);
 	INIT_WORK(&cell->manager, afs_manage_cell);
-	cell->flags = ((1 << AFS_CELL_FL_NOT_READY) |
-		       (1 << AFS_CELL_FL_NO_LOOKUP_YET));
 	INIT_LIST_HEAD(&cell->proc_volumes);
 	rwlock_init(&cell->proc_lock);
 	rwlock_init(&cell->vl_servers_lock);
@@ -170,17 +168,25 @@ static struct afs_cell *afs_alloc_cell(struct afs_net *net,
 			goto parse_failed;
 		}
 
+		vllist->source = DNS_RECORD_FROM_CONFIG;
+		vllist->status = DNS_LOOKUP_NOT_DONE;
 		cell->dns_expiry = TIME64_MAX;
 	} else {
 		ret = -ENOMEM;
 		vllist = afs_alloc_vlserver_list(0);
 		if (!vllist)
 			goto error;
+		vllist->source = DNS_RECORD_UNAVAILABLE;
+		vllist->status = DNS_LOOKUP_NOT_DONE;
 		cell->dns_expiry = ktime_get_real_seconds();
 	}
 
 	rcu_assign_pointer(cell->vl_servers, vllist);
 
+	cell->dns_source = vllist->source;
+	cell->dns_status = vllist->status;
+	smp_store_release(&cell->dns_lookup_count, 1); /* vs source/status */
+
 	_leave(" = %p", cell);
 	return cell;
 
@@ -212,6 +218,7 @@ struct afs_cell *afs_lookup_cell(struct afs_net *net,
 {
 	struct afs_cell *cell, *candidate, *cursor;
 	struct rb_node *parent, **pp;
+	enum afs_cell_state state;
 	int ret, n;
 
 	_enter("%s,%s", name, vllist);
@@ -271,18 +278,16 @@ struct afs_cell *afs_lookup_cell(struct afs_net *net,
 
 wait_for_cell:
 	_debug("wait_for_cell");
-	ret = wait_on_bit(&cell->flags, AFS_CELL_FL_NOT_READY, TASK_INTERRUPTIBLE);
-	smp_rmb();
-
-	switch (READ_ONCE(cell->state)) {
-	case AFS_CELL_FAILED:
+	wait_var_event(&cell->state,
+		       ({
+			       state = smp_load_acquire(&cell->state); /* vs error */
+			       state == AFS_CELL_ACTIVE || state == AFS_CELL_FAILED;
+		       }));
+
+	/* Check the state obtained from the wait check. */
+	if (state == AFS_CELL_FAILED) {
 		ret = cell->error;
 		goto error;
-	default:
-		_debug("weird %u %d", cell->state, cell->error);
-		goto error;
-	case AFS_CELL_ACTIVE:
-		break;
 	}
 
 	_leave(" = %p [cell]", cell);
@@ -364,16 +369,46 @@ int afs_cell_init(struct afs_net *net, const char *rootcell)
 /*
  * Update a cell's VL server address list from the DNS.
  */
-static void afs_update_cell(struct afs_cell *cell)
+static int afs_update_cell(struct afs_cell *cell)
 {
-	struct afs_vlserver_list *vllist, *old;
+	struct afs_vlserver_list *vllist, *old = NULL, *p;
 	unsigned int min_ttl = READ_ONCE(afs_cell_min_ttl);
 	unsigned int max_ttl = READ_ONCE(afs_cell_max_ttl);
 	time64_t now, expiry = 0;
+	int ret = 0;
 
 	_enter("%s", cell->name);
 
 	vllist = afs_dns_query(cell, &expiry);
+	if (IS_ERR(vllist)) {
+		ret = PTR_ERR(vllist);
+
+		_debug("%s: fail %d", cell->name, ret);
+		if (ret == -ENOMEM)
+			goto out_wake;
+
+		ret = -ENOMEM;
+		vllist = afs_alloc_vlserver_list(0);
+		if (!vllist)
+			goto out_wake;
+
+		switch (ret) {
+		case -ENODATA:
+		case -EDESTADDRREQ:
+			vllist->status = DNS_LOOKUP_GOT_NOT_FOUND;
+			break;
+		case -EAGAIN:
+		case -ECONNREFUSED:
+			vllist->status = DNS_LOOKUP_GOT_TEMP_FAILURE;
+			break;
+		default:
+			vllist->status = DNS_LOOKUP_GOT_LOCAL_FAILURE;
+			break;
+		}
+	}
+
+	_debug("%s: got list %d %d", cell->name, vllist->source, vllist->status);
+	cell->dns_status = vllist->status;
 
 	now = ktime_get_real_seconds();
 	if (min_ttl > max_ttl)
@@ -383,46 +418,47 @@ static void afs_update_cell(struct afs_cell *cell)
 	else if (expiry > now + max_ttl)
 		expiry = now + max_ttl;
 
-	if (IS_ERR(vllist)) {
-		switch (PTR_ERR(vllist)) {
-		case -ENODATA:
-		case -EDESTADDRREQ:
+	_debug("%s: status %d", cell->name, vllist->status);
+	if (vllist->source == DNS_RECORD_UNAVAILABLE) {
+		switch (vllist->status) {
+		case DNS_LOOKUP_GOT_NOT_FOUND:
 			/* The DNS said that the cell does not exist or there
 			 * weren't any addresses to be had.
 			 */
-			set_bit(AFS_CELL_FL_NOT_FOUND, &cell->flags);
-			clear_bit(AFS_CELL_FL_DNS_FAIL, &cell->flags);
 			cell->dns_expiry = expiry;
 			break;
 
-		case -EAGAIN:
-		case -ECONNREFUSED:
+		case DNS_LOOKUP_BAD:
+		case DNS_LOOKUP_GOT_LOCAL_FAILURE:
+		case DNS_LOOKUP_GOT_TEMP_FAILURE:
+		case DNS_LOOKUP_GOT_NS_FAILURE:
 		default:
-			set_bit(AFS_CELL_FL_DNS_FAIL, &cell->flags);
 			cell->dns_expiry = now + 10;
 			break;
 		}
-
-		cell->error = -EDESTADDRREQ;
 	} else {
-		clear_bit(AFS_CELL_FL_DNS_FAIL, &cell->flags);
-		clear_bit(AFS_CELL_FL_NOT_FOUND, &cell->flags);
-
-		write_lock(&cell->vl_servers_lock);
-		old = rcu_dereference_protected(cell->vl_servers, true);
-		rcu_assign_pointer(cell->vl_servers, vllist);
 		cell->dns_expiry = expiry;
-		write_unlock(&cell->vl_servers_lock);
-
-		afs_put_vlserverlist(cell->net, old);
 	}
 
-	if (test_and_clear_bit(AFS_CELL_FL_NO_LOOKUP_YET, &cell->flags))
-		wake_up_bit(&cell->flags, AFS_CELL_FL_NO_LOOKUP_YET);
+	/* Replace the VL server list if the new record has servers or the old
+	 * record doesn't.
+	 */
+	write_lock(&cell->vl_servers_lock);
+	p = rcu_dereference_protected(cell->vl_servers, true);
+	if (vllist->nr_servers > 0 || p->nr_servers == 0) {
+		rcu_assign_pointer(cell->vl_servers, vllist);
+		cell->dns_source = vllist->source;
+		old = p;
+	}
+	write_unlock(&cell->vl_servers_lock);
+	afs_put_vlserverlist(cell->net, old);
 
-	now = ktime_get_real_seconds();
-	afs_set_cell_timer(cell->net, cell->dns_expiry - now);
-	_leave("");
+out_wake:
+	smp_store_release(&cell->dns_lookup_count,
+			  cell->dns_lookup_count + 1); /* vs source/status */
+	wake_up_var(&cell->dns_lookup_count);
+	_leave(" = %d", ret);
+	return ret;
 }
 
 /*
@@ -493,8 +529,7 @@ void afs_put_cell(struct afs_net *net, struct afs_cell *cell)
 	now = ktime_get_real_seconds();
 	cell->last_inactive = now;
 	expire_delay = 0;
-	if (!test_bit(AFS_CELL_FL_DNS_FAIL, &cell->flags) &&
-	    !test_bit(AFS_CELL_FL_NOT_FOUND, &cell->flags))
+	if (cell->vl_servers->nr_servers)
 		expire_delay = afs_cell_gc_delay;
 
 	if (atomic_dec_return(&cell->usage) > 1)
@@ -625,11 +660,13 @@ static void afs_manage_cell(struct work_struct *work)
 			goto final_destruction;
 		if (cell->state == AFS_CELL_FAILED)
 			goto done;
-		cell->state = AFS_CELL_UNSET;
+		smp_store_release(&cell->state, AFS_CELL_UNSET);
+		wake_up_var(&cell->state);
 		goto again;
 
 	case AFS_CELL_UNSET:
-		cell->state = AFS_CELL_ACTIVATING;
+		smp_store_release(&cell->state, AFS_CELL_ACTIVATING);
+		wake_up_var(&cell->state);
 		goto again;
 
 	case AFS_CELL_ACTIVATING:
@@ -637,28 +674,29 @@ static void afs_manage_cell(struct work_struct *work)
 		if (ret < 0)
 			goto activation_failed;
 
-		cell->state = AFS_CELL_ACTIVE;
-		smp_wmb();
-		clear_bit(AFS_CELL_FL_NOT_READY, &cell->flags);
-		wake_up_bit(&cell->flags, AFS_CELL_FL_NOT_READY);
+		smp_store_release(&cell->state, AFS_CELL_ACTIVE);
+		wake_up_var(&cell->state);
 		goto again;
 
 	case AFS_CELL_ACTIVE:
 		if (atomic_read(&cell->usage) > 1) {
-			time64_t now = ktime_get_real_seconds();
-			if (cell->dns_expiry <= now && net->live)
-				afs_update_cell(cell);
+			if (test_and_clear_bit(AFS_CELL_FL_DO_LOOKUP, &cell->flags)) {
+				ret = afs_update_cell(cell);
+				if (ret < 0)
+					cell->error = ret;
+			}
 			goto done;
 		}
-		cell->state = AFS_CELL_DEACTIVATING;
+		smp_store_release(&cell->state, AFS_CELL_DEACTIVATING);
+		wake_up_var(&cell->state);
 		goto again;
 
 	case AFS_CELL_DEACTIVATING:
-		set_bit(AFS_CELL_FL_NOT_READY, &cell->flags);
 		if (atomic_read(&cell->usage) > 1)
 			goto reverse_deactivation;
 		afs_deactivate_cell(net, cell);
-		cell->state = AFS_CELL_INACTIVE;
+		smp_store_release(&cell->state, AFS_CELL_INACTIVE);
+		wake_up_var(&cell->state);
 		goto again;
 
 	default:
@@ -671,17 +709,13 @@ static void afs_manage_cell(struct work_struct *work)
 	cell->error = ret;
 	afs_deactivate_cell(net, cell);
 
-	cell->state = AFS_CELL_FAILED;
-	smp_wmb();
-	if (test_and_clear_bit(AFS_CELL_FL_NOT_READY, &cell->flags))
-		wake_up_bit(&cell->flags, AFS_CELL_FL_NOT_READY);
+	smp_store_release(&cell->state, AFS_CELL_FAILED); /* vs error */
+	wake_up_var(&cell->state);
 	goto again;
 
 reverse_deactivation:
-	cell->state = AFS_CELL_ACTIVE;
-	smp_wmb();
-	clear_bit(AFS_CELL_FL_NOT_READY, &cell->flags);
-	wake_up_bit(&cell->flags, AFS_CELL_FL_NOT_READY);
+	smp_store_release(&cell->state, AFS_CELL_ACTIVE);
+	wake_up_var(&cell->state);
 	_leave(" [deact->act]");
 	return;
 
@@ -741,11 +775,16 @@ void afs_manage_cells(struct work_struct *work)
 		}
 
 		if (usage == 1) {
+			struct afs_vlserver_list *vllist;
 			time64_t expire_at = cell->last_inactive;
 
-			if (!test_bit(AFS_CELL_FL_DNS_FAIL, &cell->flags) &&
-			    !test_bit(AFS_CELL_FL_NOT_FOUND, &cell->flags))
+			read_lock(&cell->vl_servers_lock);
+			vllist = rcu_dereference_protected(
+				cell->vl_servers,
+				lockdep_is_held(&cell->vl_servers_lock));
+			if (vllist->nr_servers > 0)
 				expire_at += afs_cell_gc_delay;
+			read_unlock(&cell->vl_servers_lock);
 			if (purging || expire_at <= now)
 				sched_cell = true;
 			else if (expire_at < next_manage)
@@ -753,10 +792,8 @@ void afs_manage_cells(struct work_struct *work)
 		}
 
 		if (!purging) {
-			if (cell->dns_expiry <= now)
+			if (test_bit(AFS_CELL_FL_DO_LOOKUP, &cell->flags))
 				sched_cell = true;
-			else if (cell->dns_expiry <= next_manage)
-				next_manage = cell->dns_expiry;
 		}
 
 		if (sched_cell)
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 74ee0f8ef8dd..50d925f0a556 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -367,13 +367,13 @@ struct afs_cell {
 	time64_t		last_inactive;	/* Time of last drop of usage count */
 	atomic_t		usage;
 	unsigned long		flags;
-#define AFS_CELL_FL_NOT_READY	0		/* The cell record is not ready for use */
-#define AFS_CELL_FL_NO_GC	1		/* The cell was added manually, don't auto-gc */
-#define AFS_CELL_FL_NOT_FOUND	2		/* Permanent DNS error */
-#define AFS_CELL_FL_DNS_FAIL	3		/* Failed to access DNS */
-#define AFS_CELL_FL_NO_LOOKUP_YET 4		/* Not completed first DNS lookup yet */
+#define AFS_CELL_FL_NO_GC	0		/* The cell was added manually, don't auto-gc */
+#define AFS_CELL_FL_DO_LOOKUP	1		/* DNS lookup requested */
 	enum afs_cell_state	state;
 	short			error;
+	enum dns_record_source	dns_source:8;	/* Latest source of data from lookup */
+	enum dns_lookup_status	dns_status:8;	/* Latest status of data from lookup */
+	unsigned int		dns_lookup_count; /* Counter of DNS lookups */
 
 	/* Active fileserver interaction state. */
 	struct list_head	proc_volumes;	/* procfs volume list */
diff --git a/fs/afs/vl_rotate.c b/fs/afs/vl_rotate.c
index 65629d73ad9d..3f845489a9f0 100644
--- a/fs/afs/vl_rotate.c
+++ b/fs/afs/vl_rotate.c
@@ -43,11 +43,29 @@ bool afs_begin_vlserver_operation(struct afs_vl_cursor *vc, struct afs_cell *cel
 static bool afs_start_vl_iteration(struct afs_vl_cursor *vc)
 {
 	struct afs_cell *cell = vc->cell;
+	unsigned int dns_lookup_count;
+
+	if (cell->dns_source == DNS_RECORD_UNAVAILABLE ||
+	    cell->dns_expiry <= ktime_get_real_seconds()) {
+		dns_lookup_count = smp_load_acquire(&cell->dns_lookup_count);
+		set_bit(AFS_CELL_FL_DO_LOOKUP, &cell->flags);
+		queue_work(afs_wq, &cell->manager);
+
+		if (cell->dns_source == DNS_RECORD_UNAVAILABLE) {
+			if (wait_var_event_interruptible(
+				    &cell->dns_lookup_count,
+				    smp_load_acquire(&cell->dns_lookup_count)
+				    != dns_lookup_count) < 0) {
+				vc->error = -ERESTARTSYS;
+				return false;
+			}
+		}
 
-	if (wait_on_bit(&cell->flags, AFS_CELL_FL_NO_LOOKUP_YET,
-			TASK_INTERRUPTIBLE)) {
-		vc->error = -ERESTARTSYS;
-		return false;
+		/* Status load is ordered after lookup counter load */
+		if (cell->dns_source == DNS_RECORD_UNAVAILABLE) {
+			vc->error = -EDESTADDRREQ;
+			return false;
+		}
 	}
 
 	read_lock(&cell->vl_servers_lock);


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
