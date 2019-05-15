Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 776FF1F886
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 18:26:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=silp/xIQn8JpVHx713/C73YBn0yNJ/unDfbjBeIz6c0=; b=Hiyq8+4vVM9eX/
	sOfpZHDiCF0bZKl8BCxTY/LQTVtQEuZZlmla4VBvTcsRUBixeCK6C7XsaDM2Iq+UVcb7aculfA0bm
	GQ5BH2u5BOBSFX4cu93xdmQusEMFo7n5HSCwEW2YlWTaCPx8I7gLrOoDIgazgTPNf3pzLmVgh1ol1
	KE12El0YrWwYr9rmrvsbJx2v1dIiREzQzxvlkuIfPPb7uu5ciDH9OGufLgbWDFxvCJ+wvwo4Djn+x
	4mKXuRBFAuYLDhpYdwRUFnH6KNt7Cw2H/zbw+uCnWGSmAwBj/ZFBQORegeFEYgn2aqyE1TISI0ZfL
	F+/0OrJVUEiZZoEXyQ2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQwja-0001fQ-DC; Wed, 15 May 2019 16:26:26 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQwjX-0001f3-Nw
 for linux-afs@lists.infradead.org; Wed, 15 May 2019 16:26:25 +0000
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 24F1981DE3;
 Wed, 15 May 2019 16:26:23 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E9DE19949;
 Wed, 15 May 2019 16:26:22 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 06/15] dns_resolver: Allow used keys to be invalidated
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 15 May 2019 17:26:21 +0100
Message-ID: <155793758141.31671.8674303212371647253.stgit@warthog.procyon.org.uk>
In-Reply-To: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
References: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 15 May 2019 16:26:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_092623_823148_6E6317D8 
X-CRM114-Status: GOOD (  17.25  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
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
Cc: dhowells@redhat.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Allow used DNS resolver keys to be invalidated after use if the caller is
doing its own caching of the results.  This reduces the amount of resources
required.

Fix AFS to invalidate DNS results to kill off permanent failure records
that get lodged in the resolver keyring and prevent future lookups from
happening.

Fixes: 0a5143f2f89c ("afs: Implement VL server rotation")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/addr_list.c           |    2 +-
 fs/afs/dynroot.c             |    2 +-
 fs/cifs/dns_resolve.c        |    2 +-
 fs/nfs/dns_resolve.c         |    2 +-
 include/linux/dns_resolver.h |    3 ++-
 net/ceph/messenger.c         |    2 +-
 net/dns_resolver/dns_query.c |    6 +++++-
 7 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/fs/afs/addr_list.c b/fs/afs/addr_list.c
index 967db336d11a..9eaff55df7b4 100644
--- a/fs/afs/addr_list.c
+++ b/fs/afs/addr_list.c
@@ -251,7 +251,7 @@ struct afs_vlserver_list *afs_dns_query(struct afs_cell *cell, time64_t *_expiry
 	_enter("%s", cell->name);
 
 	ret = dns_query("afsdb", cell->name, cell->name_len, "srv=1",
-			&result, _expiry);
+			&result, _expiry, true);
 	if (ret < 0) {
 		_leave(" = %d [dns]", ret);
 		return ERR_PTR(ret);
diff --git a/fs/afs/dynroot.c b/fs/afs/dynroot.c
index a9ba81ddf154..07484b5a3bbb 100644
--- a/fs/afs/dynroot.c
+++ b/fs/afs/dynroot.c
@@ -46,7 +46,7 @@ static int afs_probe_cell_name(struct dentry *dentry)
 		return 0;
 	}
 
-	ret = dns_query("afsdb", name, len, "srv=1", NULL, NULL);
+	ret = dns_query("afsdb", name, len, "srv=1", NULL, NULL, false);
 	if (ret == -ENODATA)
 		ret = -EDESTADDRREQ;
 	return ret;
diff --git a/fs/cifs/dns_resolve.c b/fs/cifs/dns_resolve.c
index 7ede7306599f..1e21b2528cfb 100644
--- a/fs/cifs/dns_resolve.c
+++ b/fs/cifs/dns_resolve.c
@@ -77,7 +77,7 @@ dns_resolve_server_name_to_ip(const char *unc, char **ip_addr)
 		goto name_is_IP_address;
 
 	/* Perform the upcall */
-	rc = dns_query(NULL, hostname, len, NULL, ip_addr, NULL);
+	rc = dns_query(NULL, hostname, len, NULL, ip_addr, NULL, false);
 	if (rc < 0)
 		cifs_dbg(FYI, "%s: unable to resolve: %*.*s\n",
 			 __func__, len, len, hostname);
diff --git a/fs/nfs/dns_resolve.c b/fs/nfs/dns_resolve.c
index a7d3df85736d..e6a700f01452 100644
--- a/fs/nfs/dns_resolve.c
+++ b/fs/nfs/dns_resolve.c
@@ -22,7 +22,7 @@ ssize_t nfs_dns_resolve_name(struct net *net, char *name, size_t namelen,
 	char *ip_addr = NULL;
 	int ip_len;
 
-	ip_len = dns_query(NULL, name, namelen, NULL, &ip_addr, NULL);
+	ip_len = dns_query(NULL, name, namelen, NULL, &ip_addr, NULL, false);
 	if (ip_len > 0)
 		ret = rpc_pton(net, ip_addr, ip_len, sa, salen);
 	else
diff --git a/include/linux/dns_resolver.h b/include/linux/dns_resolver.h
index 34a744a1bafc..f2b3ae22e6b7 100644
--- a/include/linux/dns_resolver.h
+++ b/include/linux/dns_resolver.h
@@ -27,6 +27,7 @@
 #include <uapi/linux/dns_resolver.h>
 
 extern int dns_query(const char *type, const char *name, size_t namelen,
-		     const char *options, char **_result, time64_t *_expiry);
+		     const char *options, char **_result, time64_t *_expiry,
+		     bool invalidate);
 
 #endif /* _LINUX_DNS_RESOLVER_H */
diff --git a/net/ceph/messenger.c b/net/ceph/messenger.c
index 3083988ce729..579d6a1ac7fe 100644
--- a/net/ceph/messenger.c
+++ b/net/ceph/messenger.c
@@ -1889,7 +1889,7 @@ static int ceph_dns_resolve_name(const char *name, size_t namelen,
 		return -EINVAL;
 
 	/* do dns_resolve upcall */
-	ip_len = dns_query(NULL, name, end - name, NULL, &ip_addr, NULL);
+	ip_len = dns_query(NULL, name, end - name, NULL, &ip_addr, NULL, false);
 	if (ip_len > 0)
 		ret = ceph_pton(ip_addr, ip_len, ss, -1, NULL);
 	else
diff --git a/net/dns_resolver/dns_query.c b/net/dns_resolver/dns_query.c
index 19aa32fc1802..2d260432b3be 100644
--- a/net/dns_resolver/dns_query.c
+++ b/net/dns_resolver/dns_query.c
@@ -54,6 +54,7 @@
  * @options: Request options (or NULL if no options)
  * @_result: Where to place the returned data (or NULL)
  * @_expiry: Where to store the result expiry time (or NULL)
+ * @invalidate: Always invalidate the key after use
  *
  * The data will be returned in the pointer at *result, if provided, and the
  * caller is responsible for freeing it.
@@ -69,7 +70,8 @@
  * Returns the size of the result on success, -ve error code otherwise.
  */
 int dns_query(const char *type, const char *name, size_t namelen,
-	      const char *options, char **_result, time64_t *_expiry)
+	      const char *options, char **_result, time64_t *_expiry,
+	      bool invalidate)
 {
 	struct key *rkey;
 	struct user_key_payload *upayload;
@@ -157,6 +159,8 @@ int dns_query(const char *type, const char *name, size_t namelen,
 	ret = len;
 put:
 	up_read(&rkey->sem);
+	if (invalidate)
+		key_invalidate(rkey);
 	key_put(rkey);
 out:
 	kleave(" = %d", ret);


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
