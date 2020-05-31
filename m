Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA571E97C9
	for <lists+linux-afs@lfdr.de>; Sun, 31 May 2020 15:10:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P0FAx0x4pth+LCT3G0tmZacvMfN4gKuExz7M7iFs3IQ=; b=UwTZSTRFBJ751m
	TTIXRzQZuc+TMmJ2BEAqO4mLaWQpUDq4Jl+w0E7L69/kuM/wrrix6EpH+yux/7dZeuyVKhtGjaFNL
	CEmz3r0Eb0KTUsUYPqjO9zsApnRPQ0dgYnBkWnYX+6WSwc9JlwLEnaANjhxNq/cBkgjOKlUEIVDBT
	gbo+C/xQ+epCzv5KhU24dH0OglGvXuOYJsndmYKEQP1s0fa53vYTysUpLGlkzg2xov/swoehUEf2r
	QMdRoD7wbFDnD2qgdtn9eePU0saJorzjhMXKtOXCvlIm8P7XTvaB+NxihBvYrGGcVLroOMc7LrsGi
	dwzytN40f7H1h1bS/KkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfNih-0000U9-1B; Sun, 31 May 2020 13:09:43 +0000
Received: from [2002:c35c:fd02::1] (helo=ZenIV.linux.org.uk)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfNib-0000T5-MF
 for linux-afs@lists.infradead.org; Sun, 31 May 2020 13:09:40 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1jfNiO-000uIq-Qk; Sun, 31 May 2020 13:09:24 +0000
Date: Sun, 31 May 2020 14:09:24 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 01/27] vfs, afs, ext4: Make the inode hash table RCU
 searchable
Message-ID: <20200531130924.GY23230@ZenIV.linux.org.uk>
References: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
 <159078960778.679399.5682252853189947919.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159078960778.679399.5682252853189947919.stgit@warthog.procyon.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200531_060937_725558_9E217A22 
X-CRM114-Status: GOOD (  17.22  )
X-Spam-Score: 1.3 (+)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (1.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [2002:c35c:fd02:0:0:0:0:1 listed in] [wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
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
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Fri, May 29, 2020 at 11:00:07PM +0100, David Howells wrote:

> @@ -1245,15 +1282,9 @@ static int test_inode_iunique(struct super_block *sb, unsigned long ino)
>  	struct inode *inode;
>  
>  	spin_lock(&inode_hash_lock);
> -	hlist_for_each_entry(inode, b, i_hash) {
> -		if (inode->i_ino == ino && inode->i_sb == sb) {
> -			spin_unlock(&inode_hash_lock);
> -			return 0;
> -		}
> -	}
> +	inode = __find_inode_by_ino_rcu(sb, b, ino);
>  	spin_unlock(&inode_hash_lock);
> -
> -	return 1;
> +	return inode ? 0 : 1;
>  }

Nit: that's really return !inode

> +/**
> + * find_inode_rcu - find an inode in the inode cache
> + * @sb:		Super block of file system to search
> + * @hashval:	Key to hash
> + * @test:	Function to test match on an inode
> + * @data:	Data for test function
> + *
> + * Search for the inode specified by @hashval and @data in the inode cache,
> + * where the helper function @test will return 0 if the inode does not match
> + * and 1 if it does.  The @test function must be responsible for taking the
> + * i_lock spin_lock and checking i_state for an inode being freed or being
> + * initialized.
> + *
> + * If successful, this will return the inode for which the @test function
> + * returned 1 and NULL otherwise.
> + *
> + * The @test function is not permitted to take a ref on any inode presented
> + * unless the caller is holding the inode hashtable lock.  It is also not
> + * permitted to sleep, since it may be called with the RCU read lock held.
> + *
> + * The caller must hold either the RCU read lock or the inode hashtable lock.

Just how could that caller be holding inode_hash_lock?  It's static and IMO
should remain such - it's too low-level detail of fs/inode.c for having the
code outside play with it.

Require the caller to hold rcu_read_lock() and make "not permitted to take
a ref or sleep" unconditional.

> +struct inode *find_inode_rcu(struct super_block *sb, unsigned long hashval,
> +			     int (*test)(struct inode *, void *), void *data)
> +{
> +	struct hlist_head *head = inode_hashtable + hash(sb, hashval);
> +	struct inode *inode;
> +
> +	RCU_LOCKDEP_WARN(!lockdep_is_held(&inode_hash_lock) && !rcu_read_lock_held(),
> +			 "suspicious find_inode_by_ino_rcu() usage");

... and modify that RCU_LOCKDEP_WARN (including the function name, preferably ;-)

> +
> +	hlist_for_each_entry_rcu(inode, head, i_hash) {
> +		if (inode->i_sb == sb &&
> +		    !(READ_ONCE(inode->i_state) & (I_FREEING | I_WILL_FREE)) &&
> +		    test(inode, data))
> +			return inode;
> +	}
> +	return NULL;
> +}
> +EXPORT_SYMBOL(find_inode_rcu);
> +
> +/**
> + * find_inode_by_rcu - Find an inode in the inode cache
> + * @sb:		Super block of file system to search
> + * @ino:	The inode number to match
> + *
> + * Search for the inode specified by @hashval and @data in the inode cache,
> + * where the helper function @test will return 0 if the inode does not match
> + * and 1 if it does.  The @test function must be responsible for taking the
> + * i_lock spin_lock and checking i_state for an inode being freed or being
> + * initialized.
> + *
> + * If successful, this will return the inode for which the @test function
> + * returned 1 and NULL otherwise.
> + *
> + * The @test function is not permitted to take a ref on any inode presented
> + * unless the caller is holding the inode hashtable lock.  It is also not
> + * permitted to sleep, since it may be called with the RCU read lock held.
> + *
> + * The caller must hold either the RCU read lock or the inode hashtable lock.
> + */

Ditto.

> +struct inode *find_inode_by_ino_rcu(struct super_block *sb,
> +				    unsigned long ino)
> +{
> +	struct hlist_head *head = inode_hashtable + hash(sb, ino);
> +	struct inode *inode;
> +
> +	RCU_LOCKDEP_WARN(!lockdep_is_held(&inode_hash_lock) && !rcu_read_lock_held(),
> +			 "suspicious find_inode_by_ino_rcu() usage");
> +
> +	hlist_for_each_entry_rcu(inode, head, i_hash) {
> +		if (inode->i_ino == ino &&
> +		    inode->i_sb == sb &&
> +		    !(READ_ONCE(inode->i_state) & (I_FREEING | I_WILL_FREE)))
> +		    return inode;
> +	}
> +	return NULL;
> +}
> +EXPORT_SYMBOL(find_inode_by_ino_rcu);

> @@ -1540,6 +1652,7 @@ static void iput_final(struct inode *inode)
>  {
>  	struct super_block *sb = inode->i_sb;
>  	const struct super_operations *op = inode->i_sb->s_op;
> +	unsigned long state;
>  	int drop;
>  
>  	WARN_ON(inode->i_state & I_NEW);
> @@ -1555,16 +1668,20 @@ static void iput_final(struct inode *inode)
>  		return;
>  	}
>  
> +	state = READ_ONCE(inode->i_state);
>  	if (!drop) {
> -		inode->i_state |= I_WILL_FREE;
> +		WRITE_ONCE(inode->i_state, state | I_WILL_FREE);
>  		spin_unlock(&inode->i_lock);
> +
>  		write_inode_now(inode, 1);
> +
>  		spin_lock(&inode->i_lock);
> -		WARN_ON(inode->i_state & I_NEW);
> -		inode->i_state &= ~I_WILL_FREE;
> +		state = READ_ONCE(inode->i_state);
> +		WARN_ON(state & I_NEW);
> +		state &= ~I_WILL_FREE;
>  	}
>  
> -	inode->i_state |= I_FREEING;
> +	WRITE_ONCE(inode->i_state, state | I_FREEING);
>  	if (!list_empty(&inode->i_lru))
>  		inode_lru_list_del(inode);
>  	spin_unlock(&inode->i_lock);

Umm..  I see the point of those WRITE_ONCE, but what's READ_ONCE for?

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
