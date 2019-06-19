Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3694C258
	for <lists+linux-afs@lfdr.de>; Wed, 19 Jun 2019 22:26:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/gVoTGltyWBrooncMpr0+hSSAtWZ4vqBtuBaIgbleyo=; b=CA6ovcOgkQ9Fd5
	E+iIuMcwWtJOB2Q9MdJY+zqayzF8l0h1bznKF3bFeELAgK/2BFbz66mLqaA44NlYUXI4ydh338rbH
	z8C55RqrHeYnYGt09ZBYG1kyT4ikeTpeYRfXMSf9OPttxhw7yoljdc5rTJgvTvz3j0vdFzzgTY4MJ
	FS5ECRe0je8HdoxcBh17dLG/eqmWr4JzuToqtnaoywQM5Ak+hhp5IjHeAm8MYP9pUVLH4DQ5ecMCw
	jbNxrfzHlTA031SUbxl4E8FSjKpdD4VKSUpjzCeRpADo/qjEfmoIOTHS2N5jj9aQus6R09oAo38zy
	9c/XIIqdxJeom6VQqR2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdh9b-0005uy-G3; Wed, 19 Jun 2019 20:25:59 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hddkI-0006kW-Qh
 for linux-afs@lists.infradead.org; Wed, 19 Jun 2019 16:47:40 +0000
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 83E17C05B1CA;
 Wed, 19 Jun 2019 16:47:38 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com
 [10.10.120.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BA155DA5B;
 Wed, 19 Jun 2019 16:47:33 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 6/9] keys: Include target namespace in match criteria [ver #4]
From: David Howells <dhowells@redhat.com>
To: ebiederm@xmission.com, keyrings@vger.kernel.org
Date: Wed, 19 Jun 2019 17:47:32 +0100
Message-ID: <156096285237.28733.15759548236754315951.stgit@warthog.procyon.org.uk>
In-Reply-To: <156096279115.28733.8761881995303698232.stgit@warthog.procyon.org.uk>
References: <156096279115.28733.8761881995303698232.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 19 Jun 2019 16:47:38 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_094738_901418_6C3A4D72 
X-CRM114-Status: GOOD (  26.09  )
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

Currently a key has a standard matching criteria of { type, description }
and this is used to only allow keys with unique criteria in a keyring.
This means, however, that you cannot have keys with the same type and
description but a different target namespace in the same keyring.

This is a potential problem for a containerised environment where, say, a
container is made up of some parts of its mount space involving netfs
superblocks from two different network namespaces.

This is also a problem for shared system management keyrings such as the
DNS records keyring or the NFS idmapper keyring that might contain keys
from different network namespaces.

Fix this by including a namespace component in a key's matching criteria.
Keyring types are marked to indicate which, if any, namespace is relevant
to keys of that type, and that namespace is set when the key is created
from the current task's namespace set.

The capability bit KEYCTL_CAPS1_NS_KEY_TAG is set if the kernel is
employing this feature.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/linux/key.h         |   10 ++++++++++
 include/uapi/linux/keyctl.h |    1 +
 security/keys/gc.c          |    2 +-
 security/keys/key.c         |    1 +
 security/keys/keyctl.c      |    3 ++-
 security/keys/keyring.c     |   36 ++++++++++++++++++++++++++++++++++--
 security/keys/persistent.c  |    1 +
 7 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/include/linux/key.h b/include/linux/key.h
index ae1177302d70..abc68555bac3 100644
--- a/include/linux/key.h
+++ b/include/linux/key.h
@@ -82,9 +82,16 @@ struct cred;
 
 struct key_type;
 struct key_owner;
+struct key_tag;
 struct keyring_list;
 struct keyring_name;
 
+struct key_tag {
+	struct rcu_head		rcu;
+	refcount_t		usage;
+	bool			removed;	/* T when subject removed */
+};
+
 struct keyring_index_key {
 	/* [!] If this structure is altered, the union in struct key must change too! */
 	unsigned long		hash;			/* Hash value */
@@ -101,6 +108,7 @@ struct keyring_index_key {
 		unsigned long x;
 	};
 	struct key_type		*type;
+	struct key_tag		*domain_tag;	/* Domain of operation */
 	const char		*description;
 };
 
@@ -218,6 +226,7 @@ struct key {
 			unsigned long	hash;
 			unsigned long	len_desc;
 			struct key_type	*type;		/* type of key */
+			struct key_tag	*domain_tag;	/* Domain of operation */
 			char		*description;
 		};
 	};
@@ -268,6 +277,7 @@ extern struct key *key_alloc(struct key_type *type,
 extern void key_revoke(struct key *key);
 extern void key_invalidate(struct key *key);
 extern void key_put(struct key *key);
+extern bool key_put_tag(struct key_tag *tag);
 
 static inline struct key *__key_get(struct key *key)
 {
diff --git a/include/uapi/linux/keyctl.h b/include/uapi/linux/keyctl.h
index 35b405034674..3bb5324d514f 100644
--- a/include/uapi/linux/keyctl.h
+++ b/include/uapi/linux/keyctl.h
@@ -129,5 +129,6 @@ struct keyctl_pkey_params {
 #define KEYCTL_CAPS0_RESTRICT_KEYRING	0x40 /* KEYCTL_RESTRICT_KEYRING supported */
 #define KEYCTL_CAPS0_MOVE		0x80 /* KEYCTL_MOVE supported */
 #define KEYCTL_CAPS1_NS_KEYRING_NAME	0x01 /* Keyring names are per-user_namespace */
+#define KEYCTL_CAPS2_NS_KEY_TAG		0x02 /* Key indexing can include a namespace tag */
 
 #endif /*  _LINUX_KEYCTL_H */
diff --git a/security/keys/gc.c b/security/keys/gc.c
index 634e96b380e8..83d279fb7793 100644
--- a/security/keys/gc.c
+++ b/security/keys/gc.c
@@ -154,7 +154,7 @@ static noinline void key_gc_unused_keys(struct list_head *keys)
 			atomic_dec(&key->user->nikeys);
 
 		key_user_put(key->user);
-
+		key_put_tag(key->domain_tag);
 		kfree(key->description);
 
 		memzero_explicit(key, sizeof(*key));
diff --git a/security/keys/key.c b/security/keys/key.c
index 9d52f2472a09..85fdc2ea6c14 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -317,6 +317,7 @@ struct key *key_alloc(struct key_type *type, const char *desc,
 		goto security_error;
 
 	/* publish the key by giving it a serial number */
+	refcount_inc(&key->domain_tag->usage);
 	atomic_inc(&user->nkeys);
 	key_alloc_serial(key);
 
diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index 8a813220f269..aa9be531e5f5 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -40,7 +40,8 @@ static const unsigned char keyrings_capabilities[2] = {
 	       KEYCTL_CAPS0_RESTRICT_KEYRING |
 	       KEYCTL_CAPS0_MOVE
 	       ),
-	[1] = (KEYCTL_CAPS1_NS_KEYRING_NAME),
+	[1] = (KEYCTL_CAPS1_NS_KEYRING_NAME |
+	       KEYCTL_CAPS2_NS_KEY_TAG),
 };
 
 static int key_get_type_from_user(char *type,
diff --git a/security/keys/keyring.c b/security/keys/keyring.c
index 3663e5168583..0da8fa282d56 100644
--- a/security/keys/keyring.c
+++ b/security/keys/keyring.c
@@ -175,6 +175,9 @@ static void hash_key_type_and_desc(struct keyring_index_key *index_key)
 	type = (unsigned long)index_key->type;
 	acc = mult_64x32_and_fold(type, desc_len + 13);
 	acc = mult_64x32_and_fold(acc, 9207);
+	piece = (unsigned long)index_key->domain_tag;
+	acc = mult_64x32_and_fold(acc, piece);
+	acc = mult_64x32_and_fold(acc, 9207);
 
 	for (;;) {
 		n = desc_len;
@@ -208,16 +211,36 @@ static void hash_key_type_and_desc(struct keyring_index_key *index_key)
 
 /*
  * Finalise an index key to include a part of the description actually in the
- * index key and to add in the hash too.
+ * index key, to set the domain tag and to calculate the hash.
  */
 void key_set_index_key(struct keyring_index_key *index_key)
 {
+	static struct key_tag default_domain_tag = { .usage = REFCOUNT_INIT(1), };
 	size_t n = min_t(size_t, index_key->desc_len, sizeof(index_key->desc));
+
 	memcpy(index_key->desc, index_key->description, n);
 
+	index_key->domain_tag = &default_domain_tag;
 	hash_key_type_and_desc(index_key);
 }
 
+/**
+ * key_put_tag - Release a ref on a tag.
+ * @tag: The tag to release.
+ *
+ * This releases a reference the given tag and returns true if that ref was the
+ * last one.
+ */
+bool key_put_tag(struct key_tag *tag)
+{
+	if (refcount_dec_and_test(&tag->usage)) {
+		kfree_rcu(tag, rcu);
+		return true;
+	}
+
+	return false;
+}
+
 /*
  * Build the next index key chunk.
  *
@@ -238,8 +261,10 @@ static unsigned long keyring_get_key_chunk(const void *data, int level)
 		return index_key->x;
 	case 2:
 		return (unsigned long)index_key->type;
+	case 3:
+		return (unsigned long)index_key->domain_tag;
 	default:
-		level -= 3;
+		level -= 4;
 		if (desc_len <= sizeof(index_key->desc))
 			return 0;
 
@@ -268,6 +293,7 @@ static bool keyring_compare_object(const void *object, const void *data)
 	const struct key *key = keyring_ptr_to_key(object);
 
 	return key->index_key.type == index_key->type &&
+		key->index_key.domain_tag == index_key->domain_tag &&
 		key->index_key.desc_len == index_key->desc_len &&
 		memcmp(key->index_key.description, index_key->description,
 		       index_key->desc_len) == 0;
@@ -309,6 +335,12 @@ static int keyring_diff_objects(const void *object, const void *data)
 		goto differ;
 	level += sizeof(unsigned long);
 
+	seg_a = (unsigned long)a->domain_tag;
+	seg_b = (unsigned long)b->domain_tag;
+	if ((seg_a ^ seg_b) != 0)
+		goto differ;
+	level += sizeof(unsigned long);
+
 	i = sizeof(a->desc);
 	if (a->desc_len <= i)
 		goto same;
diff --git a/security/keys/persistent.c b/security/keys/persistent.c
index 90303fe4a394..9944d855a28d 100644
--- a/security/keys/persistent.c
+++ b/security/keys/persistent.c
@@ -84,6 +84,7 @@ static long key_get_persistent(struct user_namespace *ns, kuid_t uid,
 	long ret;
 
 	/* Look in the register if it exists */
+	memset(&index_key, 0, sizeof(index_key));
 	index_key.type = &key_type_keyring;
 	index_key.description = buf;
 	index_key.desc_len = sprintf(buf, "_persistent.%u", from_kuid(ns, uid));


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
