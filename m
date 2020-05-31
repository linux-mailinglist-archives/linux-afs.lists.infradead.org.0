Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7981E9818
	for <lists+linux-afs@lfdr.de>; Sun, 31 May 2020 16:20:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=knpfB5Fm2hw4KTBm03bGnFQUTJHeivponV9tkM3XtTY=; b=jlYlJ7pIDZAYRn
	DTKolkm2nCjlQx3271S1QjVDJIxTOaHO3sKGsBnsZ1W5gZ/HMFHH40NKdiQNilwrOECvPrXvka7Ck
	aGZLH2D+HZZrE/bXj0UdFb/uCXPkasgxbtxn45F12YU/b/idiCKufS/KHy2ARCSQeMWhfapVkZiAm
	InqvOPwAbOZPGi/hE1mB7Hf3fMU3H1/WuY1DPxtXNHJ+xncFm8ig7X87gmGVSizOfJbdfViQ6bCVC
	MEfawKoAdlKLBHRmsrLq71Lx/sSiQtK16AZbQ/TqOl/Gj1fczK9bXyJ4nQeMiQSx8e5Q0U3Bd47pc
	ORmTznH3dj7/H6TMSG0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfOpG-0000jb-Db; Sun, 31 May 2020 14:20:34 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfOpD-0000il-22
 for linux-afs@lists.infradead.org; Sun, 31 May 2020 14:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590934822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E4ECGgjAAe1FQZ65+Es0GIVisOI/xn+Kp7TFR6aO8p8=;
 b=RQ0qnc1+8tbPSeMMdUpBWMh4p/VWF0E+N5B0ttaeKbCs5QeDLVv2ujpnt6CpW5gxri1PPh
 Sc9eJ8xPvtBBwQintjm7Ssaoag1sp/bWhukm5XZxZ7r9zCEDcQrYu5zE35vXA6TsZ2+nux
 RHOJgxboNO8EeQwQoz1j4/XJnh2LAi4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-nzVP69ggMc2X7ebCta3v8w-1; Sun, 31 May 2020 10:20:20 -0400
X-MC-Unique: nzVP69ggMc2X7ebCta3v8w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04362460;
 Sun, 31 May 2020 14:20:19 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 226A210013D4;
 Sun, 31 May 2020 14:20:16 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200531130924.GY23230@ZenIV.linux.org.uk>
References: <20200531130924.GY23230@ZenIV.linux.org.uk>
 <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
 <159078960778.679399.5682252853189947919.stgit@warthog.procyon.org.uk>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 01/27] vfs, afs,
 ext4: Make the inode hash table RCU searchable
MIME-Version: 1.0
Content-ID: <1147863.1590934816.1@warthog.procyon.org.uk>
Date: Sun, 31 May 2020 15:20:16 +0100
Message-ID: <1147864.1590934816@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200531_072031_304262_790CC8E1 
X-CRM114-Status: GOOD (  27.47  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [207.211.31.81 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
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
 linux-kernel@vger.kernel.org, dhowells@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Al Viro <viro@zeniv.linux.org.uk> wrote:

> > + * The @test function is not permitted to take a ref on any inode presented
> > + * unless the caller is holding the inode hashtable lock.  It is also not
> > + * permitted to sleep, since it may be called with the RCU read lock held.
> > + *
> > + * The caller must hold either the RCU read lock or the inode hashtable lock.
> 
> Just how could that caller be holding inode_hash_lock?  It's static and IMO
> should remain such - it's too low-level detail of fs/inode.c for having the
> code outside play with it.
> 
> Require the caller to hold rcu_read_lock() and make "not permitted to take
> a ref or sleep" unconditional.

My thinking was that it might be callable from within fs/inode.c, but I can
remove that idea for now since I didn't end up calling it from there.

> Umm..  I see the point of those WRITE_ONCE, but what's READ_ONCE for?

Fair point.  It's under i_lock.

A revised version of the patch is attached.

I'm thinking I should probably undo the changes to find_inode(),
find_inode_fast() and test_inode_iunique().  They don't need to use
hlist_for_each_entry_rcu() as they use the hash table lock.

David
---
commit 3f19b2ab97a97b413c24b66c67ae16daa4f56c35
Author: David Howells <dhowells@redhat.com>
Date:   Fri Dec 1 11:40:16 2017 +0000

    vfs, afs, ext4: Make the inode hash table RCU searchable
    
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
