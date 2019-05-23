Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FFC28120
	for <lists+linux-afs@lfdr.de>; Thu, 23 May 2019 17:27:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CjRmLkGIo56CzAtWN3f7k0OVHdvehSgSniO//tkHiRs=; b=bvoTJXD2vdlOqk
	KKDj8eZ/L+DW7AfwTo00YinMf76QSfuYwzN8UA5zLZvO30CpyDV3Bc6v2M3S1YIGuN/VwDGqFQj7X
	ZvdZK0G5YEb413D+/DHYErDb6uR53QnrtjyhqU4JURtV2zgERvOItsUFiCs3Tl2T6Bw9FXV3WmU09
	qCSN8eASqf5RUyLfsycvZg2OMK4AvcHbTewZsWtpaC63nJfWd+sItBWW/PG/y5HcfBST5c4DxH8gp
	QTJ+F0aTXj40rByI7eMDP2NSrzyXDp+oqNMTpENAo8em3MPHnkM/9PoQIb0mjFd8GBzGz+aXIEcvp
	egp7cv0Qapw7Hm/y4AHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTpcK-0004hh-NQ; Thu, 23 May 2019 15:26:52 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTpUc-0001kf-Pt
 for linux-afs@lists.infradead.org; Thu, 23 May 2019 15:18:56 +0000
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6C0BA8830F;
 Thu, 23 May 2019 15:18:54 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-142.rdu2.redhat.com
 [10.10.121.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20F2B68369;
 Thu, 23 May 2019 15:18:51 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 8/9] keys: Network namespace domain tag [ver #3]
From: David Howells <dhowells@redhat.com>
To: ebiederm@xmission.com
Date: Thu, 23 May 2019 16:18:51 +0100
Message-ID: <155862473137.15244.13894912334498610175.stgit@warthog.procyon.org.uk>
In-Reply-To: <155862466770.15244.16038372267332150004.stgit@warthog.procyon.org.uk>
References: <155862466770.15244.16038372267332150004.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 23 May 2019 15:18:54 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_081854_880024_075848C2 
X-CRM114-Status: GOOD (  18.89  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
X-Mailman-Approved-At: Thu, 23 May 2019 08:26:51 -0700
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, dwalsh@redhat.com, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-afs@lists.infradead.org, vgoyal@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Create key domain tags for network namespaces and make it possible to
automatically tag keys that are used by networked services (e.g. AF_RXRPC,
AFS, DNS) with the default network namespace if not set by the caller.

This allows keys with the same description but in different namespaces to
coexist within a keyring.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: netdev@vger.kernel.org
cc: linux-nfs@vger.kernel.org
cc: linux-cifs@vger.kernel.org
cc: linux-afs@lists.infradead.org
---

 include/linux/key-type.h    |    3 +++
 include/net/net_namespace.h |    3 +++
 net/core/net_namespace.c    |   19 +++++++++++++++++++
 net/dns_resolver/dns_key.c  |    1 +
 net/rxrpc/key.c             |    2 ++
 security/keys/keyring.c     |    7 ++++++-
 6 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/include/linux/key-type.h b/include/linux/key-type.h
index e49d1de0614e..2148a6bf58f1 100644
--- a/include/linux/key-type.h
+++ b/include/linux/key-type.h
@@ -74,6 +74,9 @@ struct key_type {
 	 */
 	size_t def_datalen;
 
+	unsigned int flags;
+#define KEY_TYPE_NET_DOMAIN	0x00000001 /* Keys of this type have a net namespace domain */
+
 	/* vet a description */
 	int (*vet_description)(const char *description);
 
diff --git a/include/net/net_namespace.h b/include/net/net_namespace.h
index 12689ddfc24c..a56bf7fc7c2b 100644
--- a/include/net/net_namespace.h
+++ b/include/net/net_namespace.h
@@ -71,6 +71,9 @@ struct net {
 						 */
 	struct llist_node	cleanup_list;	/* namespaces on death row */
 
+#ifdef CONFIG_KEYS
+	struct key_tag		*key_domain;	/* Key domain of operation tag */
+#endif
 	struct user_namespace   *user_ns;	/* Owning user namespace */
 	struct ucounts		*ucounts;
 	spinlock_t		nsid_lock;
diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
index 711b161505ac..076a75c73c9e 100644
--- a/net/core/net_namespace.c
+++ b/net/core/net_namespace.c
@@ -38,9 +38,16 @@ EXPORT_SYMBOL_GPL(net_namespace_list);
 DECLARE_RWSEM(net_rwsem);
 EXPORT_SYMBOL_GPL(net_rwsem);
 
+#ifdef CONFIG_KEYS
+static struct key_tag init_net_key_domain = { .usage = REFCOUNT_INIT(1) };
+#endif
+
 struct net init_net = {
 	.count		= REFCOUNT_INIT(1),
 	.dev_base_head	= LIST_HEAD_INIT(init_net.dev_base_head),
+#ifdef CONFIG_KEYS
+	.key_domain	= &init_net_key_domain,
+#endif
 };
 EXPORT_SYMBOL(init_net);
 
@@ -386,10 +393,21 @@ static struct net *net_alloc(void)
 	if (!net)
 		goto out_free;
 
+#ifdef CONFIG_KEYS
+	net->key_domain = kzalloc(sizeof(struct key_tag), GFP_KERNEL);
+	if (!net->key_domain)
+		goto out_free_2;
+	refcount_set(&net->key_domain->usage, 1);
+#endif
+
 	rcu_assign_pointer(net->gen, ng);
 out:
 	return net;
 
+#ifdef CONFIG_KEYS
+out_free_2:
+	kmem_cache_free(net_cachep, net);
+#endif
 out_free:
 	kfree(ng);
 	goto out;
@@ -566,6 +584,7 @@ static void cleanup_net(struct work_struct *work)
 	list_for_each_entry_safe(net, tmp, &net_exit_list, exit_list) {
 		list_del_init(&net->exit_list);
 		dec_net_namespaces(net->ucounts);
+		key_remove_domain(net->key_domain);
 		put_user_ns(net->user_ns);
 		net_drop_ns(net);
 	}
diff --git a/net/dns_resolver/dns_key.c b/net/dns_resolver/dns_key.c
index a65d553e730d..3e1a90669006 100644
--- a/net/dns_resolver/dns_key.c
+++ b/net/dns_resolver/dns_key.c
@@ -314,6 +314,7 @@ static long dns_resolver_read(const struct key *key,
 
 struct key_type key_type_dns_resolver = {
 	.name		= "dns_resolver",
+	.flags		= KEY_TYPE_NET_DOMAIN,
 	.preparse	= dns_resolver_preparse,
 	.free_preparse	= dns_resolver_free_preparse,
 	.instantiate	= generic_key_instantiate,
diff --git a/net/rxrpc/key.c b/net/rxrpc/key.c
index e7f6b8823eb6..2722189ec273 100644
--- a/net/rxrpc/key.c
+++ b/net/rxrpc/key.c
@@ -43,6 +43,7 @@ static long rxrpc_read(const struct key *, char __user *, size_t);
  */
 struct key_type key_type_rxrpc = {
 	.name		= "rxrpc",
+	.flags		= KEY_TYPE_NET_DOMAIN,
 	.preparse	= rxrpc_preparse,
 	.free_preparse	= rxrpc_free_preparse,
 	.instantiate	= generic_key_instantiate,
@@ -58,6 +59,7 @@ EXPORT_SYMBOL(key_type_rxrpc);
  */
 struct key_type key_type_rxrpc_s = {
 	.name		= "rxrpc_s",
+	.flags		= KEY_TYPE_NET_DOMAIN,
 	.vet_description = rxrpc_vet_description_s,
 	.preparse	= rxrpc_preparse_s,
 	.free_preparse	= rxrpc_free_preparse_s,
diff --git a/security/keys/keyring.c b/security/keys/keyring.c
index 1e44b7c7b660..d277ca8b1374 100644
--- a/security/keys/keyring.c
+++ b/security/keys/keyring.c
@@ -17,10 +17,12 @@
 #include <linux/seq_file.h>
 #include <linux/err.h>
 #include <linux/user_namespace.h>
+#include <linux/nsproxy.h>
 #include <keys/keyring-type.h>
 #include <keys/user-type.h>
 #include <linux/assoc_array_priv.h>
 #include <linux/uaccess.h>
+#include <net/net_namespace.h>
 #include "internal.h"
 
 /*
@@ -220,7 +222,10 @@ void key_set_index_key(struct keyring_index_key *index_key)
 
 	memcpy(index_key->desc, index_key->description, n);
 
-	index_key->domain_tag = &default_domain_tag;
+	if (index_key->type->flags & KEY_TYPE_NET_DOMAIN)
+		index_key->domain_tag = current->nsproxy->net_ns->key_domain;
+	else
+		index_key->domain_tag = &default_domain_tag;
 	hash_key_type_and_desc(index_key);
 }
 


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
