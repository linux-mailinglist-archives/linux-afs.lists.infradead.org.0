Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0651E8AE8
	for <lists+linux-afs@lfdr.de>; Sat, 30 May 2020 00:03:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ro6fuNiBlRXsQMDrL9p4vSxnxUOl+0ppTOtzDhLXDY0=; b=q7hMab3hmAK2uB
	329zYEVQDib0hY4b7CE9G88xQWBRIHEilOBSGT2FXuX42dkTcJKMMUvnvbHeIJSRcofX/vMrd/+5P
	fAkxEyiNnzunTBNiIKz/OoZ5Rulr/YlD4kZoDhW7my0mqJiul2iFo4Ex13fKeUUf3r4LQnH0h0uNG
	60aVyGRW0wINwxrkJCofhjEK18pzMQM48DJ0ft3SLVKQAvX8g2V/ARReK5e8omOPWbC4LsfuqciHD
	+ql2RftZwlKBhiBhCmKL6CvgbMdh7H+R44/flo/WM0UmX1cIweXlSYdMlTtf2llFoquNgiuqGsq1P
	XAoiacMxh1Vgvo5UBsbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jen6A-0002gr-LT; Fri, 29 May 2020 22:03:30 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jen68-0002fp-8B
 for linux-afs@lists.infradead.org; Fri, 29 May 2020 22:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590789807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mdqrWaxRCFuPanDq8kaSrijov1l0/UqCUiZFDxF/o80=;
 b=CWySHzL83SeJY4WOpBVxQ9o7/R2pOCf2yak7BWuTNGuENRzzYrUaajTfslIhRvgqktHvec
 mal9V+Mq5NBsFu8gjKGM5kD7KHjH//6cl+LQD3pHPjbHegl7JVbb5as1izm/kCqkAHM0nf
 jxPdcIpEp9dQ3SfAxh8XVO4EYTbBf94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-Rgeb9_x5NSuUsq5bbq9VTQ-1; Fri, 29 May 2020 18:03:24 -0400
X-MC-Unique: Rgeb9_x5NSuUsq5bbq9VTQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BA62460;
 Fri, 29 May 2020 22:03:20 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 385727A8D9;
 Fri, 29 May 2020 22:03:19 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 27/27] afs: Adjust the fileserver rotation algorithm to
 reprobe/retry more quickly
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 29 May 2020 23:03:18 +0100
Message-ID: <159078979838.679399.11549530849526926884.stgit@warthog.procyon.org.uk>
In-Reply-To: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
References: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_150328_372976_6B662B5C 
X-CRM114-Status: GOOD (  18.58  )
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

Adjust the fileserver rotation algorithm so that if we've tried all the
addresses on a server (cumulatively over multiple operations) until we've
run out of untried addresses, immediately reprobe all that server's
interfaces and retry the op at least once before we move onto the next
server.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/fs_probe.c |   47 +++++++++++++++++++++++++++++++++++++++++++++++
 fs/afs/internal.h |   24 ++++++++++++++----------
 fs/afs/rotate.c   |   29 +++++++++++++++++++++++++++--
 3 files changed, 88 insertions(+), 12 deletions(-)

diff --git a/fs/afs/fs_probe.c b/fs/afs/fs_probe.c
index c41cf3b2ab89..b34f74b0f319 100644
--- a/fs/afs/fs_probe.c
+++ b/fs/afs/fs_probe.c
@@ -338,6 +338,18 @@ static void afs_dispatch_fs_probe(struct afs_net *net, struct afs_server *server
 	afs_put_server(net, server, afs_server_trace_put_probe);
 }
 
+/*
+ * Probe a server immediately without waiting for its due time to come
+ * round.  This is used when all of the addresses have been tried.
+ */
+void afs_probe_fileserver(struct afs_net *net, struct afs_server *server)
+{
+	write_seqlock(&net->fs_lock);
+	if (!list_empty(&server->probe_link))
+		return afs_dispatch_fs_probe(net, server, true);
+	write_sequnlock(&net->fs_lock);
+}
+
 /*
  * Probe dispatcher to regularly dispatch probes to keep NAT alive.
  */
@@ -411,3 +423,38 @@ void afs_fs_probe_dispatcher(struct work_struct *work)
 		_leave(" [quiesce]");
 	}
 }
+
+/*
+ * Wait for a probe on a particular fileserver to complete for 2s.
+ */
+int afs_wait_for_one_fs_probe(struct afs_server *server, bool is_intr)
+{
+	struct wait_queue_entry wait;
+	unsigned long timo = 2 * HZ;
+
+	if (atomic_read(&server->probe_outstanding) == 0)
+		goto dont_wait;
+
+	init_wait_entry(&wait, 0);
+	for (;;) {
+		prepare_to_wait_event(&server->probe_wq, &wait,
+				      is_intr ? TASK_INTERRUPTIBLE : TASK_UNINTERRUPTIBLE);
+		if (timo == 0 ||
+		    server->probe.responded ||
+		    atomic_read(&server->probe_outstanding) == 0 ||
+		    (is_intr && signal_pending(current)))
+			break;
+		timo = schedule_timeout(timo);
+	}
+
+	finish_wait(&server->probe_wq, &wait);
+
+dont_wait:
+	if (server->probe.responded)
+		return 0;
+	if (is_intr && signal_pending(current))
+		return -ERESTARTSYS;
+	if (timo == 0)
+		return -ETIME;
+	return -EDESTADDRREQ;
+}
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index af0b7fca87db..e1621b0670cc 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -826,16 +826,18 @@ struct afs_operation {
 	unsigned short		nr_iterations;	/* Number of server iterations */
 
 	unsigned int		flags;
-#define AFS_OPERATION_STOP	0x0001		/* Set to cease iteration */
-#define AFS_OPERATION_VBUSY	0x0002		/* Set if seen VBUSY */
-#define AFS_OPERATION_VMOVED	0x0004		/* Set if seen VMOVED */
-#define AFS_OPERATION_VNOVOL	0x0008		/* Set if seen VNOVOL */
-#define AFS_OPERATION_CUR_ONLY	0x0010		/* Set if current server only (file lock held) */
-#define AFS_OPERATION_NO_VSLEEP	0x0020		/* Set to prevent sleep on VBUSY, VOFFLINE, ... */
-#define AFS_OPERATION_UNINTR	0x0040		/* Set if op is uninterruptible */
-#define AFS_OPERATION_DOWNGRADE	0x0080		/* Set to retry with downgraded opcode */
-#define AFS_OPERATION_LOCK_0	0x0100		/* Set if have io_lock on file[0] */
-#define AFS_OPERATION_LOCK_1	0x0200		/* Set if have io_lock on file[1] */
+#define AFS_OPERATION_STOP		0x0001	/* Set to cease iteration */
+#define AFS_OPERATION_VBUSY		0x0002	/* Set if seen VBUSY */
+#define AFS_OPERATION_VMOVED		0x0004	/* Set if seen VMOVED */
+#define AFS_OPERATION_VNOVOL		0x0008	/* Set if seen VNOVOL */
+#define AFS_OPERATION_CUR_ONLY		0x0010	/* Set if current server only (file lock held) */
+#define AFS_OPERATION_NO_VSLEEP		0x0020	/* Set to prevent sleep on VBUSY, VOFFLINE, ... */
+#define AFS_OPERATION_UNINTR		0x0040	/* Set if op is uninterruptible */
+#define AFS_OPERATION_DOWNGRADE		0x0080	/* Set to retry with downgraded opcode */
+#define AFS_OPERATION_LOCK_0		0x0100	/* Set if have io_lock on file[0] */
+#define AFS_OPERATION_LOCK_1		0x0200	/* Set if have io_lock on file[1] */
+#define AFS_OPERATION_TRIED_ALL		0x0400	/* Set if we've tried all the fileservers */
+#define AFS_OPERATION_RETRY_SERVER	0x0800	/* Set if we should retry the current server */
 };
 
 /*
@@ -1055,7 +1057,9 @@ static inline void afs_op_set_fid(struct afs_operation *op, unsigned int n,
 extern void afs_fileserver_probe_result(struct afs_call *);
 extern void afs_fs_probe_fileserver(struct afs_net *, struct afs_server *, struct key *, bool);
 extern int afs_wait_for_fs_probes(struct afs_server_list *, unsigned long);
+extern void afs_probe_fileserver(struct afs_net *, struct afs_server *);
 extern void afs_fs_probe_dispatcher(struct work_struct *);
+extern int afs_wait_for_one_fs_probe(struct afs_server *, bool);
 
 /*
  * inode.c
diff --git a/fs/afs/rotate.c b/fs/afs/rotate.c
index d1590fb382b6..bfa82f613c93 100644
--- a/fs/afs/rotate.c
+++ b/fs/afs/rotate.c
@@ -367,6 +367,7 @@ bool afs_select_fileserver(struct afs_operation *op)
 
 	_debug("USING SERVER: %pU", &server->uuid);
 
+	op->flags |= AFS_OPERATION_RETRY_SERVER;
 	op->server = server;
 	if (vnode->cb_server != server) {
 		vnode->cb_server = server;
@@ -381,6 +382,7 @@ bool afs_select_fileserver(struct afs_operation *op)
 	afs_get_addrlist(alist);
 	read_unlock(&server->fs_lock);
 
+retry_server:
 	memset(&op->ac, 0, sizeof(op->ac));
 
 	if (!op->ac.alist)
@@ -396,13 +398,36 @@ bool afs_select_fileserver(struct afs_operation *op)
 	 * address on which it will respond to us.
 	 */
 	if (!afs_iterate_addresses(&op->ac))
-		goto next_server;
+		goto out_of_addresses;
 
-	_debug("address [%u] %u/%u", op->index, op->ac.index, op->ac.alist->nr_addrs);
+	_debug("address [%u] %u/%u %pISp",
+	       op->index, op->ac.index, op->ac.alist->nr_addrs,
+	       &op->ac.alist->addrs[op->ac.index].transport);
 
 	_leave(" = t");
 	return true;
 
+out_of_addresses:
+	/* We've now had a failure to respond on all of a server's addresses -
+	 * immediately probe them again and consider retrying the server.
+	 */
+	afs_probe_fileserver(op->net, op->server);
+	if (op->flags & AFS_OPERATION_RETRY_SERVER) {
+		alist = op->ac.alist;
+		error = afs_wait_for_one_fs_probe(
+			op->server, !(op->flags & AFS_OPERATION_UNINTR));
+		switch (error) {
+		case 0:
+			op->flags &= ~AFS_OPERATION_RETRY_SERVER;
+			goto retry_server;
+		case -ERESTARTSYS:
+			goto failed_set_error;
+		case -ETIME:
+		case -EDESTADDRREQ:
+			goto next_server;
+		}
+	}
+
 next_server:
 	_debug("next");
 	afs_end_cursor(&op->ac);



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
