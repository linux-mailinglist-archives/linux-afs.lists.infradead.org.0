Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5861DD21C
	for <lists+linux-afs@lfdr.de>; Thu, 21 May 2020 17:39:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sw0lKiO3JoriyRRFHcZL+9yrTuEm7dqXVUT9DEBhr/M=; b=TuVXNKa6vCY0sH
	CQASYOUTbdifUYYVrRxha7jcAGEy1/XGM0M4Dham8P7lC8Pr5t5RqlXVmLM3Go9gKQ8ssBja551e1
	vqpuTojehZPgxmWXq0R7Cw8hEoyJuHGZfabih2dDE2c+5X8wy2gMDMO3655eNFs0KKJTGBocDGr2d
	xN8sd0XLpRLlLFM8iJYSBqZqh4QPZgiMaetoEurqCEPNb90J3esZ6pfRchhG2yUSUh5xK/gnlJTn5
	wRr+xCmYzQgiBH/sDkcPsNEIYyNub5dHFgoWqUFHa1OJJRk8wzxCHb5gQ0A9ImN+P1uxMTG479FTS
	U4Yvo6RSYeLofm4vvJIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbnI8-0006Gm-B8; Thu, 21 May 2020 15:39:28 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbnI4-0006G5-JT
 for linux-afs@lists.infradead.org; Thu, 21 May 2020 15:39:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590075562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AZ2Mh8vOLjufuv8nAts9hjAqzsBBK+9uRk2XYp/7NoY=;
 b=OhhFnmWL+hUp8EYcSDjWaA2LyxskXCWUsbYdqrj32pKJ7/aFXMgxfGreCGKlwuGBHwrrxT
 g7lEdyE8hv3UvEdvClgd/bYZhq3SEEycrgyxrqGNn+yKSusXemKWv8ayUi4zx8iL9kChNc
 Sr9TtqeZRgICg/s7GqkguHGNnnoc+X0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-gJ4YZ_aGMT6442sroum_PA-1; Thu, 21 May 2020 11:39:21 -0400
X-MC-Unique: gJ4YZ_aGMT6442sroum_PA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A264919200C1;
 Thu, 21 May 2020 15:39:19 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7668160C84;
 Thu, 21 May 2020 15:39:17 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: "Theodore Ts'o" <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH] vfs, afs, ext4: Make the inode hash table RCU searchable
MIME-Version: 1.0
Content-ID: <195848.1590075556.1@warthog.procyon.org.uk>
Date: Thu, 21 May 2020 16:39:16 +0100
Message-ID: <195849.1590075556@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_083924_792714_6E13488D 
X-CRM114-Status: GOOD (  21.76  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.139.110.120 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi Ted, Andreas, Konstantin,

Is this something that would be of interest to Ext4?

David
---
vfs, afs, ext4: Make the inode hash table RCU searchable

Make the inode hash table RCU searchable so that searches that want to
access or modify an inode without taking a ref on that inode can do so
without taking the inode hash table lock.

The main thing this requires is some RCU annotation on the list
manipulation operations.  Inodes are already freed by RCU in most cases.

Users of this interface must take care as the inode may be still under
construction or may be being torn down around them.

There are at least two instances where this can be of use:

 (1) Ext4 date stamp updating.

 (2) AFS callback breaking.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
cc: linux-ext4@vger.kernel.org
---
 fs/afs/callback.c  |   12 ++-
 fs/ext4/inode.c    |   44 ++++++-------
 fs/inode.c         |  173 ++++++++++++++++++++++++++++++++++++++++++++---------
 include/linux/fs.h |    3 
 4 files changed, 179 insertions(+), 53 deletions(-)

diff --git a/fs/afs/callback.c b/fs/afs/callback.c
index 2dca8df1a18d..0dcbd40732d1 100644
--- a/fs/afs/callback.c
+++ b/fs/afs/callback.c
@@ -252,6 +252,7 @@ static void afs_break_one_callback(struct afs_server *server,
 	struct afs_vnode *vnode;
 	struct inode *inode;
 
+	rcu_read_lock();
 	read_lock(&server->cb_break_lock);
 	hlist_for_each_entry(vi, &server->cb_volumes, srv_link) {
 		if (vi->vid < fid->vid)
@@ -287,12 +288,16 @@ static void afs_break_one_callback(struct afs_server *server,
 		} else {
 			data.volume = NULL;
 			data.fid = *fid;
-			inode = ilookup5_nowait(cbi->sb, fid->vnode,
-						afs_iget5_test, &data);
+
+			/* See if we can find a matching inode - even an I_NEW
+			 * inode needs to be marked as it can have its callback
+			 * broken before we finish setting up the local inode.
+			 */
+			inode = find_inode_rcu(cbi->sb, fid->vnode,
+					       afs_iget5_test, &data);
 			if (inode) {
 				vnode = AFS_FS_I(inode);
 				afs_break_callback(vnode, afs_cb_break_for_callback);
-				iput(inode);
 			} else {
 				trace_afs_cb_miss(fid, afs_cb_break_for_callback);
 			}
@@ -301,6 +306,7 @@ static void afs_break_one_callback(struct afs_server *server,
 
 out:
 	read_unlock(&server->cb_break_lock);
+	rcu_read_unlock();
 }
 
 /*
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 2a4aae6acdcb..2bbb55d05bb7 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -4860,21 +4860,22 @@ static int ext4_inode_blocks_set(handle_t *handle,
 	return 0;
 }
 
-struct other_inode {
-	unsigned long		orig_ino;
-	struct ext4_inode	*raw_inode;
-};
-
-static int other_inode_match(struct inode * inode, unsigned long ino,
-			     void *data)
+static void __ext4_update_other_inode_time(struct super_block *sb,
+					   unsigned long orig_ino,
+					   unsigned long ino,
+					   struct ext4_inode *raw_inode)
 {
-	struct other_inode *oi = (struct other_inode *) data;
+	struct inode *inode;
+
+	inode = find_inode_by_ino_rcu(sb, ino);
+	if (!inode)
+		return;
 
-	if ((inode->i_ino != ino) ||
-	    (inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
+	if ((inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
 			       I_DIRTY_INODE)) ||
 	    ((inode->i_state & I_DIRTY_TIME) == 0))
-		return 0;
+		return;
+
 	spin_lock(&inode->i_lock);
 	if (((inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
 				I_DIRTY_INODE)) == 0) &&
@@ -4885,16 +4886,15 @@ static int other_inode_match(struct inode * inode, unsigned long ino,
 		spin_unlock(&inode->i_lock);
 
 		spin_lock(&ei->i_raw_lock);
-		EXT4_INODE_SET_XTIME(i_ctime, inode, oi->raw_inode);
-		EXT4_INODE_SET_XTIME(i_mtime, inode, oi->raw_inode);
-		EXT4_INODE_SET_XTIME(i_atime, inode, oi->raw_inode);
-		ext4_inode_csum_set(inode, oi->raw_inode, ei);
+		EXT4_INODE_SET_XTIME(i_ctime, inode, raw_inode);
+		EXT4_INODE_SET_XTIME(i_mtime, inode, raw_inode);
+		EXT4_INODE_SET_XTIME(i_atime, inode, raw_inode);
+		ext4_inode_csum_set(inode, raw_inode, ei);
 		spin_unlock(&ei->i_raw_lock);
-		trace_ext4_other_inode_update_time(inode, oi->orig_ino);
-		return -1;
+		trace_ext4_other_inode_update_time(inode, orig_ino);
+		return;
 	}
 	spin_unlock(&inode->i_lock);
-	return -1;
 }
 
 /*
@@ -4904,24 +4904,24 @@ static int other_inode_match(struct inode * inode, unsigned long ino,
 static void ext4_update_other_inodes_time(struct super_block *sb,
 					  unsigned long orig_ino, char *buf)
 {
-	struct other_inode oi;
 	unsigned long ino;
 	int i, inodes_per_block = EXT4_SB(sb)->s_inodes_per_block;
 	int inode_size = EXT4_INODE_SIZE(sb);
 
-	oi.orig_ino = orig_ino;
 	/*
 	 * Calculate the first inode in the inode table block.  Inode
 	 * numbers are one-based.  That is, the first inode in a block
 	 * (assuming 4k blocks and 256 byte inodes) is (n*16 + 1).
 	 */
 	ino = ((orig_ino - 1) & ~(inodes_per_block - 1)) + 1;
+	rcu_read_lock();
 	for (i = 0; i < inodes_per_block; i++, ino++, buf += inode_size) {
 		if (ino == orig_ino)
 			continue;
-		oi.raw_inode = (struct ext4_inode *) buf;
-		(void) find_inode_nowait(sb, ino, other_inode_match, &oi);
+		__ext4_update_other_inode_time(sb, orig_ino, ino,
+					       (struct ext4_inode *)buf);
 	}
+	rcu_read_unlock();
 }
 
 /*
diff --git a/fs/inode.c b/fs/inode.c
index 93d9252a00ab..a9ae3a405a1f 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -497,7 +497,7 @@ void __insert_inode_hash(struct inode *inode, unsigned long hashval)
 
 	spin_lock(&inode_hash_lock);
 	spin_lock(&inode->i_lock);
-	hlist_add_head(&inode->i_hash, b);
+	hlist_add_head_rcu(&inode->i_hash, b);
 	spin_unlock(&inode->i_lock);
 	spin_unlock(&inode_hash_lock);
 }
@@ -513,7 +513,7 @@ void __remove_inode_hash(struct inode *inode)
 {
 	spin_lock(&inode_hash_lock);
 	spin_lock(&inode->i_lock);
-	hlist_del_init(&inode->i_hash);
+	hlist_del_init_rcu(&inode->i_hash);
 	spin_unlock(&inode->i_lock);
 	spin_unlock(&inode_hash_lock);
 }
@@ -808,8 +808,31 @@ long prune_icache_sb(struct super_block *sb, struct shrink_control *sc)
 }
 
 static void __wait_on_freeing_inode(struct inode *inode);
+
 /*
- * Called with the inode lock held.
+ * Find an inode.  Can be called with either the RCU read lock or the
+ * inode cache lock held.  No check is made as to the validity of the
+ * inode found.
+ */
+static struct inode *__find_inode_rcu(struct super_block *sb,
+				      struct hlist_head *head,
+				      int (*test)(struct inode *, void *),
+				      void *data)
+{
+	struct inode *inode;
+
+	hlist_for_each_entry_rcu(inode, head, i_hash) {
+		if (inode->i_sb == sb &&
+		    test(inode, data))
+			return inode;
+	}
+
+	return NULL;
+}
+
+/*
+ * Called with the inode hash lock held.  Waits until dying inodes are freed,
+ * dropping the inode hash lock temporarily to do so.
  */
 static struct inode *find_inode(struct super_block *sb,
 				struct hlist_head *head,
@@ -819,11 +842,8 @@ static struct inode *find_inode(struct super_block *sb,
 	struct inode *inode = NULL;
 
 repeat:
-	hlist_for_each_entry(inode, head, i_hash) {
-		if (inode->i_sb != sb)
-			continue;
-		if (!test(inode, data))
-			continue;
+	inode = __find_inode_rcu(sb, head, test, data);
+	if (inode) {
 		spin_lock(&inode->i_lock);
 		if (inode->i_state & (I_FREEING|I_WILL_FREE)) {
 			__wait_on_freeing_inode(inode);
@@ -840,6 +860,26 @@ static struct inode *find_inode(struct super_block *sb,
 	return NULL;
 }
 
+/*
+ * Find an inode by inode number.  Can be called with either the RCU
+ * read lock or the inode cache lock held.  No check is made as to the
+ * validity of the inode found.
+ */
+static struct inode *__find_inode_by_ino_rcu(struct super_block *sb,
+					     struct hlist_head *head,
+					     unsigned long ino)
+{
+	struct inode *inode;
+
+	hlist_for_each_entry_rcu(inode, head, i_hash) {
+		if (inode->i_ino == ino &&
+		    inode->i_sb == sb)
+			return inode;
+	}
+
+	return NULL;
+}
+
 /*
  * find_inode_fast is the fast path version of find_inode, see the comment at
  * iget_locked for details.
@@ -850,11 +890,8 @@ static struct inode *find_inode_fast(struct super_block *sb,
 	struct inode *inode = NULL;
 
 repeat:
-	hlist_for_each_entry(inode, head, i_hash) {
-		if (inode->i_ino != ino)
-			continue;
-		if (inode->i_sb != sb)
-			continue;
+	inode = __find_inode_by_ino_rcu(sb, head, ino);
+	if (inode) {
 		spin_lock(&inode->i_lock);
 		if (inode->i_state & (I_FREEING|I_WILL_FREE)) {
 			__wait_on_freeing_inode(inode);
@@ -1107,7 +1144,7 @@ struct inode *inode_insert5(struct inode *inode, unsigned long hashval,
 	 */
 	spin_lock(&inode->i_lock);
 	inode->i_state |= I_NEW;
-	hlist_add_head(&inode->i_hash, head);
+	hlist_add_head_rcu(&inode->i_hash, head);
 	spin_unlock(&inode->i_lock);
 	if (!creating)
 		inode_sb_list_add(inode);
@@ -1201,7 +1238,7 @@ struct inode *iget_locked(struct super_block *sb, unsigned long ino)
 			inode->i_ino = ino;
 			spin_lock(&inode->i_lock);
 			inode->i_state = I_NEW;
-			hlist_add_head(&inode->i_hash, head);
+			hlist_add_head_rcu(&inode->i_hash, head);
 			spin_unlock(&inode->i_lock);
 			inode_sb_list_add(inode);
 			spin_unlock(&inode_hash_lock);
@@ -1245,15 +1282,9 @@ static int test_inode_iunique(struct super_block *sb, unsigned long ino)
 	struct inode *inode;
 
 	spin_lock(&inode_hash_lock);
-	hlist_for_each_entry(inode, b, i_hash) {
-		if (inode->i_ino == ino && inode->i_sb == sb) {
-			spin_unlock(&inode_hash_lock);
-			return 0;
-		}
-	}
+	inode = __find_inode_by_ino_rcu(sb, b, ino);
 	spin_unlock(&inode_hash_lock);
-
-	return 1;
+	return inode ? 0 : 1;
 }
 
 /**
@@ -1325,6 +1356,7 @@ EXPORT_SYMBOL(igrab);
  *
  * Note: I_NEW is not waited upon so you have to be very careful what you do
  * with the returned inode.  You probably should be using ilookup5() instead.
+ * It may still sleep waiting for I_FREE and I_WILL_FREE, however.
  *
  * Note2: @test is called with the inode_hash_lock held, so can't sleep.
  */
@@ -1456,6 +1488,86 @@ struct inode *find_inode_nowait(struct super_block *sb,
 }
 EXPORT_SYMBOL(find_inode_nowait);
 
+/**
+ * find_inode_rcu - find an inode in the inode cache
+ * @sb:		Super block of file system to search
+ * @hashval:	Key to hash
+ * @test:	Function to test match on an inode
+ * @data:	Data for test function
+ *
+ * Search for the inode specified by @hashval and @data in the inode cache,
+ * where the helper function @test will return 0 if the inode does not match
+ * and 1 if it does.  The @test function must be responsible for taking the
+ * i_lock spin_lock and checking i_state for an inode being freed or being
+ * initialized.
+ *
+ * If successful, this will return the inode for which the @test function
+ * returned 1 and NULL otherwise.
+ *
+ * The @test function is not permitted to take a ref on any inode presented
+ * unless the caller is holding the inode hashtable lock.  It is also not
+ * permitted to sleep, since it may be called with the RCU read lock held.
+ *
+ * The caller must hold either the RCU read lock or the inode hashtable lock.
+ */
+struct inode *find_inode_rcu(struct super_block *sb, unsigned long hashval,
+			     int (*test)(struct inode *, void *), void *data)
+{
+	struct hlist_head *head = inode_hashtable + hash(sb, hashval);
+	struct inode *inode;
+
+	RCU_LOCKDEP_WARN(!lockdep_is_held(&inode_hash_lock) && !rcu_read_lock_held(),
+			 "suspicious find_inode_by_ino_rcu() usage");
+
+	hlist_for_each_entry_rcu(inode, head, i_hash) {
+		if (inode->i_sb == sb &&
+		    !(READ_ONCE(inode->i_state) & (I_FREEING | I_WILL_FREE)) &&
+		    test(inode, data))
+			return inode;
+	}
+	return NULL;
+}
+EXPORT_SYMBOL(find_inode_rcu);
+
+/**
+ * find_inode_by_rcu - Find an inode in the inode cache
+ * @sb:		Super block of file system to search
+ * @ino:	The inode number to match
+ *
+ * Search for the inode specified by @hashval and @data in the inode cache,
+ * where the helper function @test will return 0 if the inode does not match
+ * and 1 if it does.  The @test function must be responsible for taking the
+ * i_lock spin_lock and checking i_state for an inode being freed or being
+ * initialized.
+ *
+ * If successful, this will return the inode for which the @test function
+ * returned 1 and NULL otherwise.
+ *
+ * The @test function is not permitted to take a ref on any inode presented
+ * unless the caller is holding the inode hashtable lock.  It is also not
+ * permitted to sleep, since it may be called with the RCU read lock held.
+ *
+ * The caller must hold either the RCU read lock or the inode hashtable lock.
+ */
+struct inode *find_inode_by_ino_rcu(struct super_block *sb,
+				    unsigned long ino)
+{
+	struct hlist_head *head = inode_hashtable + hash(sb, ino);
+	struct inode *inode;
+
+	RCU_LOCKDEP_WARN(!lockdep_is_held(&inode_hash_lock) && !rcu_read_lock_held(),
+			 "suspicious find_inode_by_ino_rcu() usage");
+
+	hlist_for_each_entry_rcu(inode, head, i_hash) {
+		if (inode->i_ino == ino &&
+		    inode->i_sb == sb &&
+		    !(READ_ONCE(inode->i_state) & (I_FREEING | I_WILL_FREE)))
+		    return inode;
+	}
+	return NULL;
+}
+EXPORT_SYMBOL(find_inode_by_ino_rcu);
+
 int insert_inode_locked(struct inode *inode)
 {
 	struct super_block *sb = inode->i_sb;
@@ -1480,7 +1592,7 @@ int insert_inode_locked(struct inode *inode)
 		if (likely(!old)) {
 			spin_lock(&inode->i_lock);
 			inode->i_state |= I_NEW | I_CREATING;
-			hlist_add_head(&inode->i_hash, head);
+			hlist_add_head_rcu(&inode->i_hash, head);
 			spin_unlock(&inode->i_lock);
 			spin_unlock(&inode_hash_lock);
 			return 0;
@@ -1540,6 +1652,7 @@ static void iput_final(struct inode *inode)
 {
 	struct super_block *sb = inode->i_sb;
 	const struct super_operations *op = inode->i_sb->s_op;
+	unsigned long state;
 	int drop;
 
 	WARN_ON(inode->i_state & I_NEW);
@@ -1555,16 +1668,20 @@ static void iput_final(struct inode *inode)
 		return;
 	}
 
+	state = READ_ONCE(inode->i_state);
 	if (!drop) {
-		inode->i_state |= I_WILL_FREE;
+		WRITE_ONCE(inode->i_state, state | I_WILL_FREE);
 		spin_unlock(&inode->i_lock);
+
 		write_inode_now(inode, 1);
+
 		spin_lock(&inode->i_lock);
-		WARN_ON(inode->i_state & I_NEW);
-		inode->i_state &= ~I_WILL_FREE;
+		state = READ_ONCE(inode->i_state);
+		WARN_ON(state & I_NEW);
+		state &= ~I_WILL_FREE;
 	}
 
-	inode->i_state |= I_FREEING;
+	WRITE_ONCE(inode->i_state, state | I_FREEING);
 	if (!list_empty(&inode->i_lru))
 		inode_lru_list_del(inode);
 	spin_unlock(&inode->i_lock);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 45cc10cdf6dd..5f9b2bb4b44f 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3070,6 +3070,9 @@ extern struct inode *find_inode_nowait(struct super_block *,
 				       int (*match)(struct inode *,
 						    unsigned long, void *),
 				       void *data);
+extern struct inode *find_inode_rcu(struct super_block *, unsigned long,
+				    int (*)(struct inode *, void *), void *);
+extern struct inode *find_inode_by_ino_rcu(struct super_block *, unsigned long);
 extern int insert_inode_locked4(struct inode *, unsigned long, int (*test)(struct inode *, void *), void *);
 extern int insert_inode_locked(struct inode *);
 #ifdef CONFIG_DEBUG_LOCK_ALLOC


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
