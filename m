Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0D44C259
	for <lists+linux-afs@lfdr.de>; Wed, 19 Jun 2019 22:26:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U1ZLg+O0Fej0fk7Lyrp0JQ6Uadio/5tu8935yfBYjEk=; b=dUjfAPgnzUDEme
	OpHPsbWiFRR+Dalzk5TDF5Z6Pye0ON0m/jzSJw4EbCkdpTwGuEkH+oQ5LezWsyqMrwLEbCdDq3SeH
	YlYnocrqVCVs4f77UyrKHQPv61PygSBkE2XobXWm+Tq4aUrLC6/H3OTsSDsvwSj9zWRPHm7Or/fAC
	FE1Mwjsu17qVIj/UvjlkfmMwr5lbLtUhLIoR6A03eMijshJtl+VEdkm9IXTI6M/guP+WOj30jM/ac
	qDiUtD+HptRBAGOgyLxxziexRjVKUyivAYih6dqzbQIqFlWi4jqsZ6v+S7RhzGkFFy4fiYCYiPK0W
	eD0PYJyLKCtzGql57zUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdh9Z-0005sg-VN; Wed, 19 Jun 2019 20:25:57 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hddjc-0006WM-M6
 for linux-afs@lists.infradead.org; Wed, 19 Jun 2019 16:46:58 +0000
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5ACC32F8BD6;
 Wed, 19 Jun 2019 16:46:56 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com
 [10.10.120.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E376A608A7;
 Wed, 19 Jun 2019 16:46:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 2/9] keys: Cache the hash value to avoid lots of
 recalculation [ver #4]
From: David Howells <dhowells@redhat.com>
To: ebiederm@xmission.com, keyrings@vger.kernel.org
Date: Wed, 19 Jun 2019 17:46:52 +0100
Message-ID: <156096281212.28733.9247715375574699449.stgit@warthog.procyon.org.uk>
In-Reply-To: <156096279115.28733.8761881995303698232.stgit@warthog.procyon.org.uk>
References: <156096279115.28733.8761881995303698232.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Wed, 19 Jun 2019 16:46:56 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_094656_792741_E41C9E06 
X-CRM114-Status: GOOD (  18.43  )
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

Cache the hash of the key's type and description in the index key so that
we're not recalculating it every time we look at a key during a search.
The hash function does a bunch of multiplications, so evading those is
probably worthwhile - especially as this is done for every key examined
during a search.

This also allows the methods used by assoc_array to get chunks of index-key
to be simplified.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/linux/key.h      |    3 +++
 security/keys/internal.h |    8 +-------
 security/keys/key.c      |    2 +-
 security/keys/keyring.c  |   28 ++++++++++++++++++++--------
 4 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/include/linux/key.h b/include/linux/key.h
index 86ccc2d010f6..fb2debcacea0 100644
--- a/include/linux/key.h
+++ b/include/linux/key.h
@@ -86,6 +86,8 @@ struct keyring_list;
 struct keyring_name;
 
 struct keyring_index_key {
+	/* [!] If this structure is altered, the union in struct key must change too! */
+	unsigned long		hash;			/* Hash value */
 	union {
 		struct {
 #ifdef __LITTLE_ENDIAN /* Put desc_len at the LSB of x */
@@ -213,6 +215,7 @@ struct key {
 	union {
 		struct keyring_index_key index_key;
 		struct {
+			unsigned long	hash;
 			unsigned long	len_desc;
 			struct key_type	*type;		/* type of key */
 			char		*description;
diff --git a/security/keys/internal.h b/security/keys/internal.h
index ee71c72fc5f0..4305414795ae 100644
--- a/security/keys/internal.h
+++ b/security/keys/internal.h
@@ -89,13 +89,7 @@ extern spinlock_t key_serial_lock;
 extern struct mutex key_construction_mutex;
 extern wait_queue_head_t request_key_conswq;
 
-
-static inline void key_set_index_key(struct keyring_index_key *index_key)
-{
-	size_t n = min_t(size_t, index_key->desc_len, sizeof(index_key->desc));
-	memcpy(index_key->desc, index_key->description, n);
-}
-
+extern void key_set_index_key(struct keyring_index_key *index_key);
 extern struct key_type *key_type_lookup(const char *type);
 extern void key_type_put(struct key_type *ktype);
 
diff --git a/security/keys/key.c b/security/keys/key.c
index 0a3828f15f57..9d52f2472a09 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -285,12 +285,12 @@ struct key *key_alloc(struct key_type *type, const char *desc,
 	key->index_key.description = kmemdup(desc, desclen + 1, GFP_KERNEL);
 	if (!key->index_key.description)
 		goto no_memory_3;
+	key->index_key.type = type;
 	key_set_index_key(&key->index_key);
 
 	refcount_set(&key->usage, 1);
 	init_rwsem(&key->sem);
 	lockdep_set_class(&key->sem, &type->lock_class);
-	key->index_key.type = type;
 	key->user = user;
 	key->quotalen = quotalen;
 	key->datalen = type->def_datalen;
diff --git a/security/keys/keyring.c b/security/keys/keyring.c
index ebf52077598f..a5ee3b4d2eb8 100644
--- a/security/keys/keyring.c
+++ b/security/keys/keyring.c
@@ -168,7 +168,7 @@ static u64 mult_64x32_and_fold(u64 x, u32 y)
 /*
  * Hash a key type and description.
  */
-static unsigned long hash_key_type_and_desc(const struct keyring_index_key *index_key)
+static void hash_key_type_and_desc(struct keyring_index_key *index_key)
 {
 	const unsigned level_shift = ASSOC_ARRAY_LEVEL_STEP;
 	const unsigned long fan_mask = ASSOC_ARRAY_FAN_MASK;
@@ -206,10 +206,22 @@ static unsigned long hash_key_type_and_desc(const struct keyring_index_key *inde
 	 * zero for keyrings and non-zero otherwise.
 	 */
 	if (index_key->type != &key_type_keyring && (hash & fan_mask) == 0)
-		return hash | (hash >> (ASSOC_ARRAY_KEY_CHUNK_SIZE - level_shift)) | 1;
-	if (index_key->type == &key_type_keyring && (hash & fan_mask) != 0)
-		return (hash + (hash << level_shift)) & ~fan_mask;
-	return hash;
+		hash |= (hash >> (ASSOC_ARRAY_KEY_CHUNK_SIZE - level_shift)) | 1;
+	else if (index_key->type == &key_type_keyring && (hash & fan_mask) != 0)
+		hash = (hash + (hash << level_shift)) & ~fan_mask;
+	index_key->hash = hash;
+}
+
+/*
+ * Finalise an index key to include a part of the description actually in the
+ * index key and to add in the hash too.
+ */
+void key_set_index_key(struct keyring_index_key *index_key)
+{
+	size_t n = min_t(size_t, index_key->desc_len, sizeof(index_key->desc));
+	memcpy(index_key->desc, index_key->description, n);
+
+	hash_key_type_and_desc(index_key);
 }
 
 /*
@@ -227,7 +239,7 @@ static unsigned long keyring_get_key_chunk(const void *data, int level)
 	level /= ASSOC_ARRAY_KEY_CHUNK_SIZE;
 	switch (level) {
 	case 0:
-		return hash_key_type_and_desc(index_key);
+		return index_key->hash;
 	case 1:
 		return index_key->x;
 	case 2:
@@ -280,8 +292,8 @@ static int keyring_diff_objects(const void *object, const void *data)
 	int level, i;
 
 	level = 0;
-	seg_a = hash_key_type_and_desc(a);
-	seg_b = hash_key_type_and_desc(b);
+	seg_a = a->hash;
+	seg_b = b->hash;
 	if ((seg_a ^ seg_b) != 0)
 		goto differ;
 	level += ASSOC_ARRAY_KEY_CHUNK_SIZE / 8;


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
