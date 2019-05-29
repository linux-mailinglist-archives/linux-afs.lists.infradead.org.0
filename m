Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id F31012DC26
	for <lists+linux-afs@lfdr.de>; Wed, 29 May 2019 13:49:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6rL4PQXp6umBwW4tgPVU+1tKsDVSUbUmu9YmJ7s89w=; b=W/S4s83TvFGloV
	YY4mUWK8Jg+P9XhQVoeMJzcN77u/JBBJH1jjWwgn1ifvHzzV1sdHMbrbWicsOflTgnaUXQM4kRfev
	+uLBpuydZqzbOu3EEjFhayibB1GGs2HPJqrZVv8HPMkKjZ4m5sxpzXYcQZtwbNyLN8eVkIBclv27Y
	DR0uP+vWCkL+8FqGuND4ccZNr8BWtfvG6STYbGagslz+nmAVj3UV+CMucyTsy3tvJw+VsK7/LwF4C
	S0DI+2BokbyFA9Csj2dfJdnLBnM6lU9xgKNdhOkZvzOvBPO2coJGxGxfVOp3SuXuRyMC4d6eFL0Uq
	yhGGZoLPmDAq6yqjWuOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVx4d-0006jq-VD; Wed, 29 May 2019 11:48:51 +0000
Received: from chamillionaire.breakpoint.cc ([2a01:7a0:2:106d:670::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVx4Y-0006XP-Cu
 for linux-afs@lists.infradead.org; Wed, 29 May 2019 11:48:49 +0000
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.89)
 (envelope-from <fw@breakpoint.cc>)
 id 1hVx4Q-0004Ve-Cg; Wed, 29 May 2019 13:48:38 +0200
From: Florian Westphal <fw@strlen.de>
To: <netdev@vger.kernel.org>
Subject: [PATCH net-next 3/7] afs: switch to in_dev_for_each_ifa_rcu
Date: Wed, 29 May 2019 13:43:28 +0200
Message-Id: <20190529114332.19163-4-fw@strlen.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529114332.19163-1-fw@strlen.de>
References: <20190529114332.19163-1-fw@strlen.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190529_044846_870628_18F23612 
X-CRM114-Status: GOOD (  18.01  )
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [2a01:7a0:2:106d:670:0:0:1 listed in]
 [list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
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
Cc: David Howells <dhowells@redhat.com>, Florian Westphal <fw@strlen.de>,
 linux-afs@lists.infradead.org, eric.dumazet@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

The in_dev_for_each_ifa_rcu helper gets used so sparse won't
complain when we add the proper __rcu annotation to the ifa_list
member in struct in_device later.

While doing this I realized the helper only has one call site,
so move it to where its needed.

This then revealed that we allocate a temporary buffer needlessly
and pass an always-false bool argument.

So fold this into the calling function and fill dst buffer directly.

Compile tested only.

Cc: David Howells <dhowells@redhat.com>
Cc: linux-afs@lists.infradead.org
Signed-off-by: Florian Westphal <fw@strlen.de>
---
 fs/afs/Makefile     |  1 -
 fs/afs/cmservice.c  | 49 +++++++++++++++++++++++++++------------------
 fs/afs/internal.h   | 15 --------------
 fs/afs/netdevices.c | 48 --------------------------------------------
 4 files changed, 29 insertions(+), 84 deletions(-)
 delete mode 100644 fs/afs/netdevices.c

diff --git a/fs/afs/Makefile b/fs/afs/Makefile
index cbf31f6cd177..10359bea7070 100644
--- a/fs/afs/Makefile
+++ b/fs/afs/Makefile
@@ -29,7 +29,6 @@ kafs-y := \
 	server.o \
 	server_list.o \
 	super.o \
-	netdevices.o \
 	vlclient.o \
 	vl_list.o \
 	vl_probe.o \
diff --git a/fs/afs/cmservice.c b/fs/afs/cmservice.c
index 01437cfe5432..054590a6b1e2 100644
--- a/fs/afs/cmservice.c
+++ b/fs/afs/cmservice.c
@@ -14,6 +14,8 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/ip.h>
+#include <linux/netdevice.h>
+#include <linux/inetdevice.h>
 #include "internal.h"
 #include "afs_cm.h"
 #include "protocol_yfs.h"
@@ -584,9 +586,10 @@ static int afs_deliver_cb_probe_uuid(struct afs_call *call)
  */
 static void SRXAFSCB_TellMeAboutYourself(struct work_struct *work)
 {
-	struct afs_interface *ifs;
+	struct net_device *dev;
+	struct in_device *idev;
 	struct afs_call *call = container_of(work, struct afs_call, work);
-	int loop, nifs;
+	int loop, nifs = 0;
 
 	struct {
 		struct /* InterfaceAddr */ {
@@ -604,19 +607,7 @@ static void SRXAFSCB_TellMeAboutYourself(struct work_struct *work)
 
 	_enter("");
 
-	nifs = 0;
-	ifs = kcalloc(32, sizeof(*ifs), GFP_KERNEL);
-	if (ifs) {
-		nifs = afs_get_ipv4_interfaces(call->net, ifs, 32, false);
-		if (nifs < 0) {
-			kfree(ifs);
-			ifs = NULL;
-			nifs = 0;
-		}
-	}
-
 	memset(&reply, 0, sizeof(reply));
-	reply.ia.nifs = htonl(nifs);
 
 	reply.ia.uuid[0] = call->net->uuid.time_low;
 	reply.ia.uuid[1] = htonl(ntohs(call->net->uuid.time_mid));
@@ -626,15 +617,33 @@ static void SRXAFSCB_TellMeAboutYourself(struct work_struct *work)
 	for (loop = 0; loop < 6; loop++)
 		reply.ia.uuid[loop + 5] = htonl((s8) call->net->uuid.node[loop]);
 
-	if (ifs) {
-		for (loop = 0; loop < nifs; loop++) {
-			reply.ia.ifaddr[loop] = ifs[loop].address.s_addr;
-			reply.ia.netmask[loop] = ifs[loop].netmask.s_addr;
-			reply.ia.mtu[loop] = htonl(ifs[loop].mtu);
+	rcu_read_lock();
+	for_each_netdev_rcu(call->net->net, dev) {
+		const struct in_ifaddr *ifa;
+
+		if (dev->flags & IFF_LOOPBACK)
+			continue;
+
+		idev = __in_dev_get_rcu(dev);
+		if (!idev)
+			continue;
+
+		in_dev_for_each_ifa_rcu(ifa, idev) {
+			if (ifa->ifa_flags & IFA_F_SECONDARY)
+				break;
+
+			reply.ia.ifaddr[nifs] = ifa->ifa_address;
+			reply.ia.netmask[nifs] = ifa->ifa_mask;
+			reply.ia.mtu[nifs] = htonl(dev->mtu);
+			nifs++;
+			break;
 		}
-		kfree(ifs);
+		if (nifs >= 32)
+			break;
 	}
+	rcu_read_unlock();
 
+	reply.ia.nifs = htonl(nifs);
 	reply.cap.capcount = htonl(1);
 	reply.cap.caps[0] = htonl(AFS_CAP_ERROR_TRANSLATION);
 	afs_send_simple_reply(call, &reply, sizeof(reply));
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 2073c1a3ab4b..a22fa3b77b3c 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -724,15 +724,6 @@ struct afs_permits {
 	struct afs_permit	permits[];	/* List of permits sorted by key pointer */
 };
 
-/*
- * record of one of a system's set of network interfaces
- */
-struct afs_interface {
-	struct in_addr	address;	/* IPv4 address bound to interface */
-	struct in_addr	netmask;	/* netmask applied to address */
-	unsigned	mtu;		/* MTU of interface */
-};
-
 /*
  * Error prioritisation and accumulation.
  */
@@ -1095,12 +1086,6 @@ extern const struct file_operations afs_mntpt_file_operations;
 extern struct vfsmount *afs_d_automount(struct path *);
 extern void afs_mntpt_kill_timer(void);
 
-/*
- * netdevices.c
- */
-extern int afs_get_ipv4_interfaces(struct afs_net *, struct afs_interface *,
-				   size_t, bool);
-
 /*
  * proc.c
  */
diff --git a/fs/afs/netdevices.c b/fs/afs/netdevices.c
deleted file mode 100644
index 2a009d1939d7..000000000000
--- a/fs/afs/netdevices.c
+++ /dev/null
@@ -1,48 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* AFS network device helpers
- *
- * Copyright (c) 2007 Patrick McHardy <kaber@trash.net>
- */
-
-#include <linux/string.h>
-#include <linux/rtnetlink.h>
-#include <linux/inetdevice.h>
-#include <linux/netdevice.h>
-#include <linux/if_arp.h>
-#include <net/net_namespace.h>
-#include "internal.h"
-
-/*
- * get a list of this system's interface IPv4 addresses, netmasks and MTUs
- * - maxbufs must be at least 1
- * - returns the number of interface records in the buffer
- */
-int afs_get_ipv4_interfaces(struct afs_net *net, struct afs_interface *bufs,
-			    size_t maxbufs, bool wantloopback)
-{
-	struct net_device *dev;
-	struct in_device *idev;
-	int n = 0;
-
-	ASSERT(maxbufs > 0);
-
-	rtnl_lock();
-	for_each_netdev(net->net, dev) {
-		if (dev->type == ARPHRD_LOOPBACK && !wantloopback)
-			continue;
-		idev = __in_dev_get_rtnl(dev);
-		if (!idev)
-			continue;
-		for_primary_ifa(idev) {
-			bufs[n].address.s_addr = ifa->ifa_address;
-			bufs[n].netmask.s_addr = ifa->ifa_mask;
-			bufs[n].mtu = dev->mtu;
-			n++;
-			if (n >= maxbufs)
-				goto out;
-		} endfor_ifa(idev);
-	}
-out:
-	rtnl_unlock();
-	return n;
-}
-- 
2.21.0


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
