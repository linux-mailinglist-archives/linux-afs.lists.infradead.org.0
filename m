Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F391EBD46
	for <lists+linux-afs@lfdr.de>; Tue,  2 Jun 2020 15:44:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rQy5to6HSY4WMWAriN7GXi0yzjcgsoqMkpCw35X8kn0=; b=Ivzz4tVcQOtIc8
	UQKNwsHWTSZ+2a7o5wDx/34mzYJObpe2+J0crfTJExBj3D3mK32O4itLCz12bI9sIxB7pfRSMAknK
	gnZaObn/TNc+cz+K3E4KgTLLBMLaAXfjcMnXZ+7RNBzTsns44GOCfat3XU2nr6s7mmY5TYT3XKJ4x
	InYjTmeKf0Jo4ILZUXb6BSi8cMYgi51DL/TY1JjqUdJS6JBZkUJCIYtqnqJS6lC5I5uC4TRyYH2RW
	mRx1cut6HTB1mK8ANldblTKL0zOzISC5Sk/qVOYdVu/G6TQCDWnmLjCWOlzF89yXTDEklAPN611tz
	8ddxUK2ZD2VVuSjvQ73Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg7Cv-0002vD-Jm; Tue, 02 Jun 2020 13:43:57 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg7Cr-0002uN-SF
 for linux-afs@lists.infradead.org; Tue, 02 Jun 2020 13:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591105432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4q0hmkZReFoDNprHMwN4yfud+ob/Nm+KuXwTsrk2kGg=;
 b=RL1cnfFzcDJm/g9EyCSXoGOPEzr+UW1QS9OYdqW02DRhrc7AMHjWak+81L/fntEExtKvtT
 uSRIY0EoYjWlEsRfC15O5Ti7AHqHGYWIarYG+pAKnOZfIWSRXr0/ioHrd3dMrYEhw9aGXx
 eJ6YWPaFAB9rQhitrzvDea9St4hI16Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-jF1ShBayPIyX0QoL88wQWw-1; Tue, 02 Jun 2020 09:43:48 -0400
X-MC-Unique: jF1ShBayPIyX0QoL88wQWw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3AC3100A902;
 Tue,  2 Jun 2020 13:43:46 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 588EB10013D7;
 Tue,  2 Jun 2020 13:43:45 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] vfs, afs,
 ext4: Make the inode hash table RCU searchable [ver #2]
From: David Howells <dhowells@redhat.com>
To: viro@zeniv.linux.org.uk
Date: Tue, 02 Jun 2020 14:43:44 +0100
Message-ID: <159110542457.1487029.16561323989949679458.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_064354_067878_BF7B4525 
X-CRM114-Status: GOOD (  20.85  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.120 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [207.211.31.120 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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
Cc: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Make the inode hash table RCU searchable so that searches that want to
access or modify an inode without taking a ref on that inode can do so
without taking the inode hash table lock.

The main thing this requires is some RCU annotation on the list
manipulation operations.  Inodes are already freed by RCU in most cases.

Users of this interface must take care as the inode may be still under
construction or may be being torn down around them.

There are at least three instances where this can be of use:

 (1) Testing whether the inode number iunique() is going to return is
     currently unique (the iunique_lock is still held).

 (2) Ext4 date stamp updating.

 (3) AFS callback breaking.

Signed-off-by: David Howells <dhowells@redhat.com>
Acked-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
cc: linux-ext4@vger.kernel.org
cc: linux-afs@lists.infradead.org
---

 fs/afs/callback.c  |   12 ++++--
 fs/ext4/inode.c    |   44 ++++++++++----------
 fs/inode.c         |  112 +++++++++++++++++++++++++++++++++++++++++++++-------
 include/linux/fs.h |    3 +
 4 files changed, 130 insertions(+), 41 deletions(-)

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
index 93d9252a00ab..b7bd7162c902 100644
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
@@ -1107,7 +1107,7 @@ struct inode *inode_insert5(struct inode *inode, unsigned long hashval,
 	 */
 	spin_lock(&inode->i_lock);
 	inode->i_state |= I_NEW;
-	hlist_add_head(&inode->i_hash, head);
+	hlist_add_head_rcu(&inode->i_hash, head);
 	spin_unlock(&inode->i_lock);
 	if (!creating)
 		inode_sb_list_add(inode);
@@ -1201,7 +1201,7 @@ struct inode *iget_locked(struct super_block *sb, unsigned long ino)
 			inode->i_ino = ino;
 			spin_lock(&inode->i_lock);
 			inode->i_state = I_NEW;
-			hlist_add_head(&inode->i_hash, head);
+			hlist_add_head_rcu(&inode->i_hash, head);
 			spin_unlock(&inode->i_lock);
 			inode_sb_list_add(inode);
 			spin_unlock(&inode_hash_lock);
@@ -1244,15 +1244,10 @@ static int test_inode_iunique(struct super_block *sb, unsigned long ino)
 	struct hlist_head *b = inode_hashtable + hash(sb, ino);
 	struct inode *inode;
 
-	spin_lock(&inode_hash_lock);
-	hlist_for_each_entry(inode, b, i_hash) {
-		if (inode->i_ino == ino && inode->i_sb == sb) {
-			spin_unlock(&inode_hash_lock);
+	hlist_for_each_entry_rcu(inode, b, i_hash) {
+		if (inode->i_ino == ino && inode->i_sb == sb)
 			return 0;
-		}
 	}
-	spin_unlock(&inode_hash_lock);
-
 	return 1;
 }
 
@@ -1281,6 +1276,7 @@ ino_t iunique(struct super_block *sb, ino_t max_reserved)
 	static unsigned int counter;
 	ino_t res;
 
+	rcu_read_lock();
 	spin_lock(&iunique_lock);
 	do {
 		if (counter <= max_reserved)
@@ -1288,6 +1284,7 @@ ino_t iunique(struct super_block *sb, ino_t max_reserved)
 		res = counter++;
 	} while (!test_inode_iunique(sb, res));
 	spin_unlock(&iunique_lock);
+	rcu_read_unlock();
 
 	return res;
 }
@@ -1456,6 +1453,84 @@ struct inode *find_inode_nowait(struct super_block *sb,
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
+ * The @test function is not permitted to take a ref on any inode presented.
+ * It is also not permitted to sleep.
+ *
+ * The caller must hold the RCU read lock.
+ */
+struct inode *find_inode_rcu(struct super_block *sb, unsigned long hashval,
+			     int (*test)(struct inode *, void *), void *data)
+{
+	struct hlist_head *head = inode_hashtable + hash(sb, hashval);
+	struct inode *inode;
+
+	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
+			 "suspicious find_inode_rcu() usage");
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
+ * The @test function is not permitted to take a ref on any inode presented.
+ * It is also not permitted to sleep.
+ *
+ * The caller must hold the RCU read lock.
+ */
+struct inode *find_inode_by_ino_rcu(struct super_block *sb,
+				    unsigned long ino)
+{
+	struct hlist_head *head = inode_hashtable + hash(sb, ino);
+	struct inode *inode;
+
+	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
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
@@ -1480,7 +1555,7 @@ int insert_inode_locked(struct inode *inode)
 		if (likely(!old)) {
 			spin_lock(&inode->i_lock);
 			inode->i_state |= I_NEW | I_CREATING;
-			hlist_add_head(&inode->i_hash, head);
+			hlist_add_head_rcu(&inode->i_hash, head);
 			spin_unlock(&inode->i_lock);
 			spin_unlock(&inode_hash_lock);
 			return 0;
@@ -1540,6 +1615,7 @@ static void iput_final(struct inode *inode)
 {
 	struct super_block *sb = inode->i_sb;
 	const struct super_operations *op = inode->i_sb->s_op;
+	unsigned long state;
 	int drop;
 
 	WARN_ON(inode->i_state & I_NEW);
@@ -1555,16 +1631,20 @@ static void iput_final(struct inode *inode)
 		return;
 	}
 
+	state = inode->i_state;
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
+		state = inode->i_state;
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
