Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA8E31254
	for <lists+linux-afs@lfdr.de>; Fri, 31 May 2019 18:27:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZkR038py4vWcNPClX/Q805QWbTis8g04inIYt9sZW4=; b=M1gUuydnP/WVcX
	N0YVBJq+QRVSTlQpvfaWTxGm+e5fmnDhT/C8SMqszUIDXPEsCvInJgxeiWc1a66sodbIsrld2qPAU
	XoQUyD7L+v7jCaERfe4wQF+W1HXCqBBBZyACtMFLau1oVz2hBxsdmti6c4/aMaBRMxjmP+TWOePGq
	o3YwV5qpDW/Lb+FPBwPb8/lW6aWJAB3DfmlIneG0k9xLVC8hBLKdA8x39jrSvT/yi2tQ4OWoA6udk
	6hyZqpxFRsc8ELFT20TQjisksZEqH+bgU9h1qTGZq17N+4UZ0aOUQEsSjoxGJhkDKwf7ATOPmpsDd
	LtFoshcj9WR41Melye1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWkNM-00029C-Uq; Fri, 31 May 2019 16:27:28 +0000
Received: from chamillionaire.breakpoint.cc ([2a01:7a0:2:106d:670::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWkNJ-00028l-6v
 for linux-afs@lists.infradead.org; Fri, 31 May 2019 16:27:27 +0000
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.89)
 (envelope-from <fw@breakpoint.cc>)
 id 1hWkNE-0005fz-GK; Fri, 31 May 2019 18:27:20 +0200
From: Florian Westphal <fw@strlen.de>
To: <netdev@vger.kernel.org>
Subject: [PATCH net-next v3 1/7] afs: do not send list of client addresses
Date: Fri, 31 May 2019 18:27:03 +0200
Message-Id: <20190531162709.9895-2-fw@strlen.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190531162709.9895-1-fw@strlen.de>
References: <20190531162709.9895-1-fw@strlen.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190531_092725_392987_6CD1ADF0 
X-CRM114-Status: GOOD (  17.39  )
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [2a01:7a0:2:106d:670:0:0:1 listed in]
 [list.dnswl.org]
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

David Howells says:
  I'm told that there's not really any point populating the list.
  Current OpenAFS ignores it, as does AuriStor - and IBM AFS 3.6 will
  do the right thing.
  The list is actually useless as it's the client's view of the world,
  not the servers, so if there's any NAT in the way its contents are
  invalid.  Further, it doesn't support IPv6 addresses.

  On that basis, feel free to make it an empty list and remove all the
  interface enumeration.

V1 of this patch reworked the function to use a new helper for the
ifa_list iteration to avoid sparse warnings once the proper __rcu
annotations get added in struct in_device later.

But, in light of the above, just remove afs_get_ipv4_interfaces.

Compile tested only.

Cc: David Howells <dhowells@redhat.com>
Cc: linux-afs@lists.infradead.org
Signed-off-by: Florian Westphal <fw@strlen.de>
Tested-by: David Howells <dhowells@redhat.com>
---
 fs/afs/Makefile     |  1 -
 fs/afs/cmservice.c  | 24 +----------------------
 fs/afs/internal.h   | 15 --------------
 fs/afs/netdevices.c | 48 ---------------------------------------------
 4 files changed, 1 insertion(+), 87 deletions(-)
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
index 01437cfe5432..a61d2058c468 100644
--- a/fs/afs/cmservice.c
+++ b/fs/afs/cmservice.c
@@ -584,9 +584,8 @@ static int afs_deliver_cb_probe_uuid(struct afs_call *call)
  */
 static void SRXAFSCB_TellMeAboutYourself(struct work_struct *work)
 {
-	struct afs_interface *ifs;
 	struct afs_call *call = container_of(work, struct afs_call, work);
-	int loop, nifs;
+	int loop;
 
 	struct {
 		struct /* InterfaceAddr */ {
@@ -604,19 +603,7 @@ static void SRXAFSCB_TellMeAboutYourself(struct work_struct *work)
 
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
@@ -626,15 +613,6 @@ static void SRXAFSCB_TellMeAboutYourself(struct work_struct *work)
 	for (loop = 0; loop < 6; loop++)
 		reply.ia.uuid[loop + 5] = htonl((s8) call->net->uuid.node[loop]);
 
-	if (ifs) {
-		for (loop = 0; loop < nifs; loop++) {
-			reply.ia.ifaddr[loop] = ifs[loop].address.s_addr;
-			reply.ia.netmask[loop] = ifs[loop].netmask.s_addr;
-			reply.ia.mtu[loop] = htonl(ifs[loop].mtu);
-		}
-		kfree(ifs);
-	}
-
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
