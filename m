Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBA14C25F
	for <lists+linux-afs@lfdr.de>; Wed, 19 Jun 2019 22:26:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+oXzXs59JnBjc4J0k/UTJnAS5ZqiL0YlI4CggkLYpw=; b=O6BTZyN3SIVdGw
	C37DLFtK/tbPADsdYNSgjjAtoQsdrwXhbE8pmIweTKOWnEzYJh92uL9B+F1BevJHYdTe/dGXx1QIE
	yGu3iX/aT6mco6ZqhaauOFTF/QUPUw22LsfSlFSKjpOasyBoJdRBw52MufJpvG4FfzgHsV5FBugga
	Vu8udDp9DItAE7M5qe7QkEKkuLd9Oq5SxE5/qdP2pAjdZcOu6gVB3X291D68d2hL0DBNBXYeaFHwP
	RZbC86e4pRw68YV5vvxIAZODFaJUh/J7NeDOhOvJwpz007Kje89gPEzGcfnriYfnqq0WuIGek4G6l
	zITf/gzXWIoFwyESdM0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdh9a-0005t3-B9; Wed, 19 Jun 2019 20:25:58 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hddjo-0006cD-Dv
 for linux-afs@lists.infradead.org; Wed, 19 Jun 2019 16:47:10 +0000
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 403D830872F2;
 Wed, 19 Jun 2019 16:47:07 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com
 [10.10.120.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65B57608D0;
 Wed, 19 Jun 2019 16:47:02 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 3/9] keys: Add a 'recurse' flag for keyring searches [ver #4]
From: David Howells <dhowells@redhat.com>
To: ebiederm@xmission.com, keyrings@vger.kernel.org
Date: Wed, 19 Jun 2019 17:47:01 +0100
Message-ID: <156096282160.28733.4354243497725553504.stgit@warthog.procyon.org.uk>
In-Reply-To: <156096279115.28733.8761881995303698232.stgit@warthog.procyon.org.uk>
References: <156096279115.28733.8761881995303698232.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Wed, 19 Jun 2019 16:47:08 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_094708_510854_3BE7D841 
X-CRM114-Status: GOOD (  22.20  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Mailman-Approved-At: Wed, 19 Jun 2019 13:25:54 -0700
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
 netdev@vger.kernel.org, dwalsh@redhat.com, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, linux-security-module@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org,
 vgoyal@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Add a 'recurse' flag for keyring searches so that the flag can be omitted
and recursion disabled, thereby allowing just the nominated keyring to be
searched and none of the children.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 Documentation/security/keys/core.rst     |   10 ++++++----
 certs/blacklist.c                        |    2 +-
 crypto/asymmetric_keys/asymmetric_type.c |    2 +-
 include/linux/key.h                      |    3 ++-
 lib/digsig.c                             |    2 +-
 net/rxrpc/security.c                     |    2 +-
 security/integrity/digsig_asymmetric.c   |    4 ++--
 security/keys/internal.h                 |    1 +
 security/keys/keyctl.c                   |    2 +-
 security/keys/keyring.c                  |   12 ++++++++++--
 security/keys/proc.c                     |    3 ++-
 security/keys/process_keys.c             |    3 ++-
 security/keys/request_key.c              |    3 ++-
 security/keys/request_key_auth.c         |    3 ++-
 14 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/Documentation/security/keys/core.rst b/Documentation/security/keys/core.rst
index a0e245f9576f..ae930ae9d590 100644
--- a/Documentation/security/keys/core.rst
+++ b/Documentation/security/keys/core.rst
@@ -1162,11 +1162,13 @@ payload contents" for more information.
 
 	key_ref_t keyring_search(key_ref_t keyring_ref,
 				 const struct key_type *type,
-				 const char *description)
+				 const char *description,
+				 bool recurse)
 
-    This searches the keyring tree specified for a matching key. Error ENOKEY
-    is returned upon failure (use IS_ERR/PTR_ERR to determine). If successful,
-    the returned key will need to be released.
+    This searches the specified keyring only (recurse == false) or keyring tree
+    (recurse == true) specified for a matching key. Error ENOKEY is returned
+    upon failure (use IS_ERR/PTR_ERR to determine). If successful, the returned
+    key will need to be released.
 
     The possession attribute from the keyring reference is used to control
     access through the permissions mask and is propagated to the returned key
diff --git a/certs/blacklist.c b/certs/blacklist.c
index 3a507b9e2568..181cb7fa9540 100644
--- a/certs/blacklist.c
+++ b/certs/blacklist.c
@@ -128,7 +128,7 @@ int is_hash_blacklisted(const u8 *hash, size_t hash_len, const char *type)
 	*p = 0;
 
 	kref = keyring_search(make_key_ref(blacklist_keyring, true),
-			      &key_type_blacklist, buffer);
+			      &key_type_blacklist, buffer, false);
 	if (!IS_ERR(kref)) {
 		key_ref_put(kref);
 		ret = -EKEYREJECTED;
diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
index 69a0788a7de5..084027ef3121 100644
--- a/crypto/asymmetric_keys/asymmetric_type.c
+++ b/crypto/asymmetric_keys/asymmetric_type.c
@@ -87,7 +87,7 @@ struct key *find_asymmetric_key(struct key *keyring,
 	pr_debug("Look up: \"%s\"\n", req);
 
 	ref = keyring_search(make_key_ref(keyring, 1),
-			     &key_type_asymmetric, req);
+			     &key_type_asymmetric, req, true);
 	if (IS_ERR(ref))
 		pr_debug("Request for key '%s' err %ld\n", req, PTR_ERR(ref));
 	kfree(req);
diff --git a/include/linux/key.h b/include/linux/key.h
index fb2debcacea0..ff102731b3db 100644
--- a/include/linux/key.h
+++ b/include/linux/key.h
@@ -341,7 +341,8 @@ extern int keyring_clear(struct key *keyring);
 
 extern key_ref_t keyring_search(key_ref_t keyring,
 				struct key_type *type,
-				const char *description);
+				const char *description,
+				bool recurse);
 
 extern int keyring_add_key(struct key *keyring,
 			   struct key *key);
diff --git a/lib/digsig.c b/lib/digsig.c
index 3b0a579bdcdf..3782af401c68 100644
--- a/lib/digsig.c
+++ b/lib/digsig.c
@@ -221,7 +221,7 @@ int digsig_verify(struct key *keyring, const char *sig, int siglen,
 		/* search in specific keyring */
 		key_ref_t kref;
 		kref = keyring_search(make_key_ref(keyring, 1UL),
-						&key_type_user, name);
+				      &key_type_user, name, true);
 		if (IS_ERR(kref))
 			key = ERR_CAST(kref);
 		else
diff --git a/net/rxrpc/security.c b/net/rxrpc/security.c
index c4479afe8ae7..2cfc7125bc41 100644
--- a/net/rxrpc/security.c
+++ b/net/rxrpc/security.c
@@ -148,7 +148,7 @@ int rxrpc_init_server_conn_security(struct rxrpc_connection *conn)
 
 	/* look through the service's keyring */
 	kref = keyring_search(make_key_ref(rx->securities, 1UL),
-			      &key_type_rxrpc_s, kdesc);
+			      &key_type_rxrpc_s, kdesc, true);
 	if (IS_ERR(kref)) {
 		read_unlock(&local->services_lock);
 		_leave(" = %ld [search]", PTR_ERR(kref));
diff --git a/security/integrity/digsig_asymmetric.c b/security/integrity/digsig_asymmetric.c
index 99080871eb9f..358f614811e8 100644
--- a/security/integrity/digsig_asymmetric.c
+++ b/security/integrity/digsig_asymmetric.c
@@ -39,7 +39,7 @@ static struct key *request_asymmetric_key(struct key *keyring, uint32_t keyid)
 		key_ref_t kref;
 
 		kref = keyring_search(make_key_ref(key, 1),
-				     &key_type_asymmetric, name);
+				      &key_type_asymmetric, name, true);
 		if (!IS_ERR(kref)) {
 			pr_err("Key '%s' is in ima_blacklist_keyring\n", name);
 			return ERR_PTR(-EKEYREJECTED);
@@ -51,7 +51,7 @@ static struct key *request_asymmetric_key(struct key *keyring, uint32_t keyid)
 		key_ref_t kref;
 
 		kref = keyring_search(make_key_ref(keyring, 1),
-				      &key_type_asymmetric, name);
+				      &key_type_asymmetric, name, true);
 		if (IS_ERR(kref))
 			key = ERR_CAST(kref);
 		else
diff --git a/security/keys/internal.h b/security/keys/internal.h
index 4305414795ae..aa361299a3ec 100644
--- a/security/keys/internal.h
+++ b/security/keys/internal.h
@@ -127,6 +127,7 @@ struct keyring_search_context {
 #define KEYRING_SEARCH_NO_CHECK_PERM	0x0008	/* Don't check permissions */
 #define KEYRING_SEARCH_DETECT_TOO_DEEP	0x0010	/* Give an error on excessive depth */
 #define KEYRING_SEARCH_SKIP_EXPIRED	0x0020	/* Ignore expired keys (intention to replace) */
+#define KEYRING_SEARCH_RECURSE		0x0040	/* Search child keyrings also */
 
 	int (*iterator)(const void *object, void *iterator_data);
 
diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index 9f418e66f067..169409b611b0 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -762,7 +762,7 @@ long keyctl_keyring_search(key_serial_t ringid,
 	}
 
 	/* do the search */
-	key_ref = keyring_search(keyring_ref, ktype, description);
+	key_ref = keyring_search(keyring_ref, ktype, description, true);
 	if (IS_ERR(key_ref)) {
 		ret = PTR_ERR(key_ref);
 
diff --git a/security/keys/keyring.c b/security/keys/keyring.c
index a5ee3b4d2eb8..20891cd198f0 100644
--- a/security/keys/keyring.c
+++ b/security/keys/keyring.c
@@ -685,6 +685,9 @@ static bool search_nested_keyrings(struct key *keyring,
 	 * Non-keyrings avoid the leftmost branch of the root entirely (root
 	 * slots 1-15).
 	 */
+	if (!(ctx->flags & KEYRING_SEARCH_RECURSE))
+		goto not_this_keyring;
+
 	ptr = READ_ONCE(keyring->keys.root);
 	if (!ptr)
 		goto not_this_keyring;
@@ -885,13 +888,15 @@ key_ref_t keyring_search_rcu(key_ref_t keyring_ref,
  * @keyring: The root of the keyring tree to be searched.
  * @type: The type of keyring we want to find.
  * @description: The name of the keyring we want to find.
+ * @recurse: True to search the children of @keyring also
  *
  * As keyring_search_rcu() above, but using the current task's credentials and
  * type's default matching function and preferred search method.
  */
 key_ref_t keyring_search(key_ref_t keyring,
 			 struct key_type *type,
-			 const char *description)
+			 const char *description,
+			 bool recurse)
 {
 	struct keyring_search_context ctx = {
 		.index_key.type		= type,
@@ -906,6 +911,8 @@ key_ref_t keyring_search(key_ref_t keyring,
 	key_ref_t key;
 	int ret;
 
+	if (recurse)
+		ctx.flags |= KEYRING_SEARCH_RECURSE;
 	if (type->match_preparse) {
 		ret = type->match_preparse(&ctx.match_data);
 		if (ret < 0)
@@ -1176,7 +1183,8 @@ static int keyring_detect_cycle(struct key *A, struct key *B)
 		.flags			= (KEYRING_SEARCH_NO_STATE_CHECK |
 					   KEYRING_SEARCH_NO_UPDATE_TIME |
 					   KEYRING_SEARCH_NO_CHECK_PERM |
-					   KEYRING_SEARCH_DETECT_TOO_DEEP),
+					   KEYRING_SEARCH_DETECT_TOO_DEEP |
+					   KEYRING_SEARCH_RECURSE),
 	};
 
 	rcu_read_lock();
diff --git a/security/keys/proc.c b/security/keys/proc.c
index f081dceae3b9..b4f5ba56b9cb 100644
--- a/security/keys/proc.c
+++ b/security/keys/proc.c
@@ -170,7 +170,8 @@ static int proc_keys_show(struct seq_file *m, void *v)
 		.match_data.cmp		= lookup_user_key_possessed,
 		.match_data.raw_data	= key,
 		.match_data.lookup_type	= KEYRING_SEARCH_LOOKUP_DIRECT,
-		.flags			= KEYRING_SEARCH_NO_STATE_CHECK,
+		.flags			= (KEYRING_SEARCH_NO_STATE_CHECK |
+					   KEYRING_SEARCH_RECURSE),
 	};
 
 	key_ref = make_key_ref(key, 0);
diff --git a/security/keys/process_keys.c b/security/keys/process_keys.c
index f8ffb06d0297..b07f768d23dc 100644
--- a/security/keys/process_keys.c
+++ b/security/keys/process_keys.c
@@ -531,7 +531,8 @@ key_ref_t lookup_user_key(key_serial_t id, unsigned long lflags,
 	struct keyring_search_context ctx = {
 		.match_data.cmp		= lookup_user_key_possessed,
 		.match_data.lookup_type	= KEYRING_SEARCH_LOOKUP_DIRECT,
-		.flags			= KEYRING_SEARCH_NO_STATE_CHECK,
+		.flags			= (KEYRING_SEARCH_NO_STATE_CHECK |
+					   KEYRING_SEARCH_RECURSE),
 	};
 	struct request_key_auth *rka;
 	struct key *key;
diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index 36c55ef47b9e..1ffd3803ce29 100644
--- a/security/keys/request_key.c
+++ b/security/keys/request_key.c
@@ -569,7 +569,8 @@ struct key *request_key_and_link(struct key_type *type,
 		.match_data.raw_data	= description,
 		.match_data.lookup_type	= KEYRING_SEARCH_LOOKUP_DIRECT,
 		.flags			= (KEYRING_SEARCH_DO_STATE_CHECK |
-					   KEYRING_SEARCH_SKIP_EXPIRED),
+					   KEYRING_SEARCH_SKIP_EXPIRED |
+					   KEYRING_SEARCH_RECURSE),
 	};
 	struct key *key;
 	key_ref_t key_ref;
diff --git a/security/keys/request_key_auth.c b/security/keys/request_key_auth.c
index 99ed7a8a273d..f613987e8a63 100644
--- a/security/keys/request_key_auth.c
+++ b/security/keys/request_key_auth.c
@@ -252,7 +252,8 @@ struct key *key_get_instantiation_authkey(key_serial_t target_id)
 		.match_data.cmp		= key_default_cmp,
 		.match_data.raw_data	= description,
 		.match_data.lookup_type	= KEYRING_SEARCH_LOOKUP_DIRECT,
-		.flags			= KEYRING_SEARCH_DO_STATE_CHECK,
+		.flags			= (KEYRING_SEARCH_DO_STATE_CHECK |
+					   KEYRING_SEARCH_RECURSE),
 	};
 	struct key *authkey;
 	key_ref_t authkey_ref;


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
