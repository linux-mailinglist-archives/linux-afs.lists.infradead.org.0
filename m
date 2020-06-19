Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D94201E1B
	for <lists+linux-afs@lfdr.de>; Sat, 20 Jun 2020 00:39:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rd0T2CZovaMZ9BFdmyVx8g69yCCGd5Z7nXhXfKi2cQ4=; b=FA3kKqwzgOuMgp
	1b/3fW4CqlOhHgu6Ju11zABQYEqATTPjXsygFlt4w+IzPYLoimLG3r5aF7IVOIHrmCnfk341hZZXk
	FKYgApYCdYQCPahlnZI4zBVrX7GsU+e6pfOK/f21ibS7VVv6pFYxebEZ8MoLMzP0qn1kFkOOvyUHz
	qqdYMfNBSYKJRxnbULkRkIVcPcagdD/tswKLYsE4IYRGaWh7r9OoIjgv3tKd8AOwVH37qxEOvrZbI
	IiymciQAQNljzTx+CDjXWbPcV3Qj+E8/nxBVbD0TN6qzMT07P+JqilN3M8AmnIxu+QKdiW6goh1NM
	iyAkkBVaOLcHqZljWPdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmPfm-0007Y5-6n; Fri, 19 Jun 2020 22:39:46 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmPfk-0007Xk-5E
 for linux-afs@lists.infradead.org; Fri, 19 Jun 2020 22:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592606383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pxUyiYLffvi8OTheuzrtW+/yF8SoBV+CkNicnEmyAWE=;
 b=WBioCaUlv5sfb8AcfRLcnZdlgWLDa+kwJrK8W0UnAQA51BG/JwveBgTO7/DpMYc2otbReW
 uO3IVdJuhGO7HwKYvGW4xwfaxtTF5xffrcXgppIFDVl4mblX7vVS+fo4FJLW+acK9xM6TN
 vRUfsDY60/1Onzm6xd2ea40tlh239F8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-nDuYzNbXMAKBMiMbBlarRg-1; Fri, 19 Jun 2020 18:39:39 -0400
X-MC-Unique: nDuYzNbXMAKBMiMbBlarRg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75B5C184D150;
 Fri, 19 Jun 2020 22:39:38 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57FDD19C4F;
 Fri, 19 Jun 2020 22:39:37 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] afs: Fix hang on rmmod due to outstanding timer
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Date: Fri, 19 Jun 2020 23:39:36 +0100
Message-ID: <159260637654.2218312.15803998774310526664.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_153944_274279_6E67A184 
X-CRM114-Status: GOOD (  16.02  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [205.139.110.61 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

The fileserver probe timer, net->fs_probe_timer, isn't cancelled when the
kafs module is being removed and so the count it holds on
net->servers_outstanding doesn't get dropped..  This causes rmmod to wait
forever.  The hung process shows a stack like:

	afs_purge_servers+0x1b5/0x23c [kafs]
	afs_net_exit+0x44/0x6e [kafs]
	ops_exit_list+0x72/0x93
	unregister_pernet_operations+0x14c/0x1ba
	unregister_pernet_subsys+0x1d/0x2a
	afs_exit+0x29/0x6f [kafs]
	__do_sys_delete_module.isra.0+0x1a2/0x24b
	do_syscall_64+0x51/0x95
	entry_SYSCALL_64_after_hwframe+0x44/0xa9

Fix this by:

 (1) Attempting to cancel the probe timer and, if successful, drop the
     count that the timer was holding.

 (2) Make the timer function just drop the count and not schedule the
     prober if the afs portion of net namespace is being destroyed.

Also, whilst we're at it, make the following changes:

 (3) Initialise net->servers_outstanding to 1 and decrement it before
     waiting on it so that it doesn't generate wake up events by being
     decremented to 0 until we're cleaning up.

 (4) Switch the atomic_dec() on ->servers_outstanding for ->fs_timer in
     afs_purge_servers() to use the helper function for that.

Fixes: f6cbb368bcb0 ("afs: Actively poll fileservers to maintain NAT or firewall openings")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/fs_probe.c |   11 ++++++++++-
 fs/afs/internal.h |    1 +
 fs/afs/main.c     |    3 +++
 fs/afs/server.c   |    3 ++-
 4 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/fs/afs/fs_probe.c b/fs/afs/fs_probe.c
index b34f74b0f319..5d9ef517cf81 100644
--- a/fs/afs/fs_probe.c
+++ b/fs/afs/fs_probe.c
@@ -314,7 +314,7 @@ void afs_fs_probe_timer(struct timer_list *timer)
 {
 	struct afs_net *net = container_of(timer, struct afs_net, fs_probe_timer);
 
-	if (!queue_work(afs_wq, &net->fs_prober))
+	if (!net->live || !queue_work(afs_wq, &net->fs_prober))
 		afs_dec_servers_outstanding(net);
 }
 
@@ -458,3 +458,12 @@ int afs_wait_for_one_fs_probe(struct afs_server *server, bool is_intr)
 		return -ETIME;
 	return -EDESTADDRREQ;
 }
+
+/*
+ * Clean up the probing when the namespace is killed off.
+ */
+void afs_fs_probe_cleanup(struct afs_net *net)
+{
+	if (del_timer_sync(&net->fs_probe_timer))
+		afs_dec_servers_outstanding(net);
+}
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 573a5922c3bb..d520535ddb62 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -1065,6 +1065,7 @@ extern int afs_wait_for_fs_probes(struct afs_server_list *, unsigned long);
 extern void afs_probe_fileserver(struct afs_net *, struct afs_server *);
 extern void afs_fs_probe_dispatcher(struct work_struct *);
 extern int afs_wait_for_one_fs_probe(struct afs_server *, bool);
+extern void afs_fs_probe_cleanup(struct afs_net *);
 
 /*
  * inode.c
diff --git a/fs/afs/main.c b/fs/afs/main.c
index 9c79c91e8005..31b472f7c734 100644
--- a/fs/afs/main.c
+++ b/fs/afs/main.c
@@ -100,6 +100,7 @@ static int __net_init afs_net_init(struct net *net_ns)
 	timer_setup(&net->fs_timer, afs_servers_timer, 0);
 	INIT_WORK(&net->fs_prober, afs_fs_probe_dispatcher);
 	timer_setup(&net->fs_probe_timer, afs_fs_probe_timer, 0);
+	atomic_set(&net->servers_outstanding, 1);
 
 	ret = -ENOMEM;
 	sysnames = kzalloc(sizeof(*sysnames), GFP_KERNEL);
@@ -130,6 +131,7 @@ static int __net_init afs_net_init(struct net *net_ns)
 
 error_open_socket:
 	net->live = false;
+	afs_fs_probe_cleanup(net);
 	afs_cell_purge(net);
 	afs_purge_servers(net);
 error_cell_init:
@@ -150,6 +152,7 @@ static void __net_exit afs_net_exit(struct net *net_ns)
 	struct afs_net *net = afs_net(net_ns);
 
 	net->live = false;
+	afs_fs_probe_cleanup(net);
 	afs_cell_purge(net);
 	afs_purge_servers(net);
 	afs_close_socket(net);
diff --git a/fs/afs/server.c b/fs/afs/server.c
index 039e3488511c..e82e452e2612 100644
--- a/fs/afs/server.c
+++ b/fs/afs/server.c
@@ -605,11 +605,12 @@ void afs_purge_servers(struct afs_net *net)
 	_enter("");
 
 	if (del_timer_sync(&net->fs_timer))
-		atomic_dec(&net->servers_outstanding);
+		afs_dec_servers_outstanding(net);
 
 	afs_queue_server_manager(net);
 
 	_debug("wait");
+	atomic_dec(&net->servers_outstanding);
 	wait_var_event(&net->servers_outstanding,
 		       !atomic_read(&net->servers_outstanding));
 	_leave("");



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
