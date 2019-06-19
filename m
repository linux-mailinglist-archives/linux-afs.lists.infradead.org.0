Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDE44BD01
	for <lists+linux-afs@lfdr.de>; Wed, 19 Jun 2019 17:36:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kSBGzo0LXkuILNRtqQZxHs7DLrO5eCwMB+/IiFDNYBc=; b=nX9tv0uiRpx0fJ
	xGD3WqE1T0SMy8ATBuFwYZjDTVpt1/0GOeVHuqEOoPaCfGPmH7pHjcJVJiBLfdDHw6+qKY7Uzi2pD
	13d/A2H7jgsl2ruU/P3upPM4QGwxQZYWzyulqAwJYzYPa+smhiJNxp/uJKmtUip/985J8gTcoXkHP
	0sTmA2gjYSdxrtaG22DieisGIha0Uib6wlgGFIhAfbu+QnzAp+y1X0V3W/uWCxgG6J7pxCJA/6aKj
	upFhEfoU9/xGc/iKB3nJJSo4yN2SekZSTBjmU4dNZtsf3y7SvUtR69NyHy3jrV7TvLvZmz2Aw+ctK
	wHmhEquNiPo61iubMZKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdcdT-0000aL-Vl; Wed, 19 Jun 2019 15:36:31 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdcdQ-0000Zl-Es
 for linux-afs@lists.infradead.org; Wed, 19 Jun 2019 15:36:29 +0000
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 26F88C004BA8;
 Wed, 19 Jun 2019 15:36:28 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com
 [10.10.120.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3C80608A7;
 Wed, 19 Jun 2019 15:36:26 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 4/6] keys: Provide request_key_rcu() [ver #2]
From: David Howells <dhowells@redhat.com>
To: keyrings@vger.kernel.org
Date: Wed, 19 Jun 2019 16:36:25 +0100
Message-ID: <156095858592.25264.17369833581092140668.stgit@warthog.procyon.org.uk>
In-Reply-To: <156095855610.25264.16666970456822465537.stgit@warthog.procyon.org.uk>
References: <156095855610.25264.16666970456822465537.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 19 Jun 2019 15:36:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_083628_539016_8B6DAF59 
X-CRM114-Status: GOOD (  19.13  )
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
 linux-security-module@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Provide a request_key_rcu() function that can be used to request a key
under RCU conditions.  It can only search and check permissions; it cannot
allocate a new key, upcall or wait for an upcall to complete.  It may
return a partially constructed key.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 Documentation/security/keys/core.rst        |   10 ++++++
 Documentation/security/keys/request-key.rst |    9 ++++++
 include/linux/key.h                         |    3 ++
 security/keys/request_key.c                 |   44 +++++++++++++++++++++++++++
 4 files changed, 66 insertions(+)

diff --git a/Documentation/security/keys/core.rst b/Documentation/security/keys/core.rst
index 82dd457ff78d..003f1452a5b7 100644
--- a/Documentation/security/keys/core.rst
+++ b/Documentation/security/keys/core.rst
@@ -1147,6 +1147,16 @@ payload contents" for more information.
     case error ERESTARTSYS will be returned.
 
 
+ *  To search for a key under RCU conditions, call::
+
+	struct key *request_key_rcu(const struct key_type *type,
+				    const char *description);
+
+    which is similar to request_key() except that it does not check for keys
+    that are under construction and it will not call out to userspace to
+    construct a key if it can't find a match.
+
+
  *  When it is no longer required, the key should be released using::
 
 	void key_put(struct key *key);
diff --git a/Documentation/security/keys/request-key.rst b/Documentation/security/keys/request-key.rst
index 07af991463b5..7caedc4d29f1 100644
--- a/Documentation/security/keys/request-key.rst
+++ b/Documentation/security/keys/request-key.rst
@@ -36,6 +36,11 @@ or::
 					     	   size_t callout_len,
 						   void *aux);
 
+or::
+
+	struct key *request_key_rcu(const struct key_type *type,
+				    const char *description);
+
 Or by userspace invoking the request_key system call::
 
 	key_serial_t request_key(const char *type,
@@ -57,6 +62,10 @@ The two async in-kernel calls may return keys that are still in the process of
 being constructed.  The two non-async ones will wait for construction to
 complete first.
 
+The request_key_rcu() call is like the in-kernel request_key() call, except
+that it doesn't check for keys that are under construction and doesn't attempt
+to construct missing keys.
+
 The userspace interface links the key to a keyring associated with the process
 to prevent the key from going away, and returns the serial number of the key to
 the caller.
diff --git a/include/linux/key.h b/include/linux/key.h
index 612e1cf84049..3604a554df99 100644
--- a/include/linux/key.h
+++ b/include/linux/key.h
@@ -274,6 +274,9 @@ extern struct key *request_key(struct key_type *type,
 			       const char *description,
 			       const char *callout_info);
 
+extern struct key *request_key_rcu(struct key_type *type,
+				   const char *description);
+
 extern struct key *request_key_with_auxdata(struct key_type *type,
 					    const char *description,
 					    const void *callout_info,
diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index bf1d223ec21c..b4b3677657d6 100644
--- a/security/keys/request_key.c
+++ b/security/keys/request_key.c
@@ -756,3 +756,47 @@ struct key *request_key_async_with_auxdata(struct key_type *type,
 				    callout_len, aux, NULL, KEY_ALLOC_IN_QUOTA);
 }
 EXPORT_SYMBOL(request_key_async_with_auxdata);
+
+/**
+ * request_key_rcu - Request key from RCU-read-locked context
+ * @type: The type of key we want.
+ * @description: The name of the key we want.
+ *
+ * Request a key from a context that we may not sleep in (such as RCU-mode
+ * pathwalk).  Keys under construction are ignored.
+ *
+ * Return a pointer to the found key if successful, -ENOKEY if we couldn't find
+ * a key or some other error if the key found was unsuitable or inaccessible.
+ */
+struct key *request_key_rcu(struct key_type *type, const char *description)
+{
+	struct keyring_search_context ctx = {
+		.index_key.type		= type,
+		.index_key.description	= description,
+		.index_key.desc_len	= strlen(description),
+		.cred			= current_cred(),
+		.match_data.cmp		= key_default_cmp,
+		.match_data.raw_data	= description,
+		.match_data.lookup_type	= KEYRING_SEARCH_LOOKUP_DIRECT,
+		.flags			= (KEYRING_SEARCH_DO_STATE_CHECK |
+					   KEYRING_SEARCH_SKIP_EXPIRED),
+	};
+	struct key *key;
+	key_ref_t key_ref;
+
+	kenter("%s,%s", type->name, description);
+
+	/* search all the process keyrings for a key */
+	key_ref = search_process_keyrings_rcu(&ctx);
+	if (IS_ERR(key_ref)) {
+		key = ERR_CAST(key_ref);
+		if (PTR_ERR(key_ref) == -EAGAIN)
+			key = ERR_PTR(-ENOKEY);
+	} else {
+		key = key_ref_to_ptr(key_ref);
+	}
+
+	kleave(" = %p", key);
+	return key;
+}
+EXPORT_SYMBOL(request_key_rcu);


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
