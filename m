Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C2AA1E61
	for <lists+linux-afs@lfdr.de>; Thu, 29 Aug 2019 17:08:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sWYjp64DTK6zUECsYjQkEAnjhY0Y/GScMb/6qY6MKpE=; b=IhGUsAA+gNXbRn
	qeJIe+yi/zY5zX/gSiIavHNqR8GOtgwr1E7XhaISSRyit3tf6HL0m9Jj+osBOKzNBw426B2Pt1EBG
	520GybTJxh5Hx8xcEvUrCGR8PpYpcHD6odEnjgb50IvZLJI+Wm2NHh7KxM+pnATD/ch24D6jlJy+q
	p90nYE5JtoSqb+UYQ7QkyL4j+JLHnMOneZB3o8vQeEw/for2XHXYLPJtKcufiEYywHGlfRvvbN1cA
	bS5pxntsQ3Uu5Mkxr0fQCQLs6ZNDYVUcSVOx0A7CRE9lK3QrEuhpeSAk4Q37CVyTu6YDVeDTLgIw8
	in0ICaZFKmKuVAOKa0Lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3M1q-0007wI-S1; Thu, 29 Aug 2019 15:08:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2djC-0002hv-Au; Tue, 27 Aug 2019 15:49:52 +0000
Received: from tleilax.poochiereds.net
 (68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 833FF2184D;
 Tue, 27 Aug 2019 15:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566920989;
 bh=bbgW62YNwOw6nr0OoLy9qjvU2nnCXSu3OBPYD+Bupp4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=L2rOWfFTV9ZENo9sY6rTomCTkAVi6eVgtVnTG5LG9plQ1qzOy8kmqkEIkcKlJccsb
 6oQCfNdLugesaJKgynlWsJQg7kb5LVkyYTK4cR8c58Kwfjmh9eQhwGZ7v/8NIZG3RI
 XOEmwVN1iC+LyMlqc3dSWBw7KJ+TXshlVw7j4UqM=
Message-ID: <dfc0fea49dfc77cb7631abb76e1e64ed745d25dd.camel@kernel.org>
Subject: Re: [PATCH v8] Add flags option to get xattr method paired to
 __vfs_getxattr
From: Jeff Layton <jlayton@kernel.org>
To: Mark Salyzyn <salyzyn@android.com>, linux-kernel@vger.kernel.org
Date: Tue, 27 Aug 2019 11:49:41 -0400
In-Reply-To: <20190827150544.151031-1-salyzyn@android.com>
References: <20190827150544.151031-1-salyzyn@android.com>
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_084950_562036_78FB68D5 
X-CRM114-Status: GOOD (  32.82  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Thu, 29 Aug 2019 07:57:26 -0700
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Hugh Dickins <hughd@google.com>,
 Mike Marshall <hubcap@omnibond.com>, James Morris <jmorris@namei.org>,
 devel@lists.orangefs.org, Eric Van Hensbergen <ericvh@gmail.com>,
 Joel Becker <jlbec@evilplan.org>, Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Kleikamp <shaggy@kernel.org>,
 linux-doc@vger.kernel.org, Chao Yu <yuchao0@huawei.com>,
 Mimi Zohar <zohar@linux.ibm.com>, linux-cifs@vger.kernel.org,
 Paul Moore <paul@paul-moore.com>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Eric Sandeen <sandeen@sandeen.net>, kernel-team@android.com,
 selinux@vger.kernel.org, Brian Foster <bfoster@redhat.com>,
 reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-f2fs-devel@lists.sourceforge.net,
 Benjamin Coddington <bcodding@redhat.com>, linux-integrity@vger.kernel.org,
 Martin Brandenburg <martin@omnibond.com>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, Vyacheslav Dubeyko <slava@dubeyko.com>,
 Allison Henderson <allison.henderson@oracle.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Stephen Smalley <sds@tycho.nsa.gov>, Serge Hallyn <serge@hallyn.com>,
 Gao Xiang <gaoxiang25@huawei.com>, Eric Paris <eparis@parisplace.org>,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 Joseph Qi <joseph.qi@linux.alibaba.com>, samba-technical@lists.samba.org,
 linux-xfs@vger.kernel.org, Bob Peterson <rpeterso@redhat.com>,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Eric Biggers <ebiggers@google.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Adrian Hunter <adrian.hunter@intel.com>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 devel@driverdev.osuosl.org, "J.
 Bruce Fields" <bfields@redhat.com>, Andreas Gruenbacher <agruenba@redhat.com>,
 Sage Weil <sage@redhat.com>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, cluster-devel@redhat.com,
 Steve French <sfrench@samba.org>, v9fs-developer@lists.sourceforge.net,
 Bharath Vedartham <linux.bhar@gmail.com>, Jann Horn <jannh@google.com>,
 ecryptfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 Dave Chinner <dchinner@redhat.com>, David Sterba <dsterba@suse.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, netdev@vger.kernel.org,
 linux-unionfs@vger.kernel.org, stable@vger.kernel.org,
 Tyler Hicks <tyhicks@canonical.com>, linux-security-module@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 David Woodhouse <dwmw2@infradead.org>, linux-btrfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Tue, 2019-08-27 at 08:05 -0700, Mark Salyzyn wrote:
> Replace arguments for get and set xattr methods, and __vfs_getxattr
> and __vfs_setaxtr functions with a reference to the following now
> common argument structure:
> 
> struct xattr_gs_args {
> 	struct dentry *dentry;
> 	struct inode *inode;
> 	const char *name;
> 	union {
> 		void *buffer;
> 		const void *value;
> 	};
> 	size_t size;
> 	int flags;
> };
> 
> Which in effect adds a flags option to the get method and
> __vfs_getxattr function.
> 
> Add a flag option to get xattr method that has bit flag of
> XATTR_NOSECURITY passed to it.  XATTR_NOSECURITY is generally then
> set in the __vfs_getxattr path when called by security
> infrastructure.
> 
> This handles the case of a union filesystem driver that is being
> requested by the security layer to report back the xattr data.
> 
> For the use case where access is to be blocked by the security layer.
> 
> The path then could be security(dentry) ->
> __vfs_getxattr({dentry...XATTR_NOSECURITY}) ->
> handler->get({dentry...XATTR_NOSECURITY}) ->
> __vfs_getxattr({lower_dentry...XATTR_NOSECURITY}) ->
> lower_handler->get({lower_dentry...XATTR_NOSECURITY})
> which would report back through the chain data and success as
> expected, the logging security layer at the top would have the
> data to determine the access permissions and report back the target
> context that was blocked.
> 
> Without the get handler flag, the path on a union filesystem would be
> the errant security(dentry) -> __vfs_getxattr(dentry) ->
> handler->get(dentry) -> vfs_getxattr(lower_dentry) -> nested ->
> security(lower_dentry, log off) -> lower_handler->get(lower_dentry)
> which would report back through the chain no data, and -EACCES.
> 
> For selinux for both cases, this would translate to a correctly
> determined blocked access. In the first case with this change a correct avc
> log would be reported, in the second legacy case an incorrect avc log
> would be reported against an uninitialized u:object_r:unlabeled:s0
> context making the logs cosmetically useless for audit2allow.
> 
> This patch series is inert and is the wide-spread addition of the
> flags option for xattr functions, and a replacement of __vfs_getxattr
> with __vfs_getxattr({...XATTR_NOSECURITY}).
> 
> Signed-off-by: Mark Salyzyn <salyzyn@android.com>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Cc: Stephen Smalley <sds@tycho.nsa.gov>
> Cc: linux-kernel@vger.kernel.org
> Cc: kernel-team@android.com
> Cc: linux-security-module@vger.kernel.org
> Cc: stable@vger.kernel.org # 4.4, 4.9, 4.14 & 4.19
> ---
> v8:
> - Documentation reported 'struct xattr_gs_flags' rather than
>   'struct xattr_gs_flags *args' as argument to get and set methods.
> 
> v7:
> - missed spots in fs/9p/acl.c, fs/afs/xattr.c, fs/ecryptfs/crypto.c,
>   fs/ubifs/xattr.c, fs/xfs/libxfs/xfs_attr.c,
>   security/integrity/evm/evm_main.c and security/smack/smack_lsm.c.
> 
> v6:
> - kernfs missed a spot
> 
> v5:
> - introduce struct xattr_gs_args for get and set methods,
>   __vfs_getxattr and __vfs_setxattr functions.
> - cover a missing spot in ext2.
> - switch from snprintf to scnprintf for correctness.
> 
> v4:
> - ifdef __KERNEL__ around XATTR_NOSECURITY to
>   keep it colocated in uapi headers.
> 
> v3:
> - poor aim on ubifs not ubifs_xattr_get, but static xattr_get
> 
> v2:
> - Missed a spot: ubifs, erofs and afs.
> 
> v1:
> - Removed from an overlayfs patch set, and made independent.
>   Expect this to be the basis of some security improvements.
> ---
>  Documentation/filesystems/Locking |  10 ++-
>  drivers/staging/erofs/xattr.c     |   8 +--
>  fs/9p/acl.c                       |  51 +++++++-------
>  fs/9p/xattr.c                     |  19 +++--
>  fs/afs/xattr.c                    | 112 +++++++++++++-----------------
>  fs/btrfs/xattr.c                  |  36 +++++-----
>  fs/ceph/xattr.c                   |  40 +++++------
>  fs/cifs/xattr.c                   |  72 +++++++++----------
>  fs/ecryptfs/crypto.c              |  20 +++---
>  fs/ecryptfs/inode.c               |  36 ++++++----
>  fs/ecryptfs/mmap.c                |  39 ++++++-----
>  fs/ext2/xattr_security.c          |  16 ++---
>  fs/ext2/xattr_trusted.c           |  15 ++--
>  fs/ext2/xattr_user.c              |  19 +++--
>  fs/ext4/xattr_security.c          |  15 ++--
>  fs/ext4/xattr_trusted.c           |  15 ++--
>  fs/ext4/xattr_user.c              |  19 +++--
>  fs/f2fs/xattr.c                   |  42 +++++------
>  fs/fuse/xattr.c                   |  23 +++---
>  fs/gfs2/xattr.c                   |  18 ++---
>  fs/hfs/attr.c                     |  15 ++--
>  fs/hfsplus/xattr.c                |  17 +++--
>  fs/hfsplus/xattr_security.c       |  13 ++--
>  fs/hfsplus/xattr_trusted.c        |  13 ++--
>  fs/hfsplus/xattr_user.c           |  13 ++--
>  fs/jffs2/security.c               |  16 ++---
>  fs/jffs2/xattr_trusted.c          |  16 ++---
>  fs/jffs2/xattr_user.c             |  16 ++---
>  fs/jfs/xattr.c                    |  33 ++++-----
>  fs/kernfs/inode.c                 |  23 +++---
>  fs/nfs/nfs4proc.c                 |  28 ++++----
>  fs/ocfs2/xattr.c                  |  52 ++++++--------
>  fs/orangefs/xattr.c               |  19 ++---
>  fs/overlayfs/inode.c              |  43 ++++++------
>  fs/overlayfs/overlayfs.h          |   6 +-
>  fs/overlayfs/super.c              |  53 ++++++--------
>  fs/posix_acl.c                    |  23 +++---
>  fs/reiserfs/xattr.c               |   2 +-
>  fs/reiserfs/xattr_security.c      |  22 +++---
>  fs/reiserfs/xattr_trusted.c       |  22 +++---
>  fs/reiserfs/xattr_user.c          |  22 +++---
>  fs/squashfs/xattr.c               |  10 +--
>  fs/ubifs/xattr.c                  |  33 +++++----
>  fs/xattr.c                        | 112 ++++++++++++++++++------------
>  fs/xfs/libxfs/xfs_attr.c          |   4 +-
>  fs/xfs/libxfs/xfs_attr.h          |   2 +-
>  fs/xfs/xfs_xattr.c                |  35 +++++-----
>  include/linux/xattr.h             |  26 ++++---
>  include/uapi/linux/xattr.h        |   7 +-
>  mm/shmem.c                        |  21 +++---
>  net/socket.c                      |  16 ++---
>  security/commoncap.c              |  29 +++++---
>  security/integrity/evm/evm_main.c |  13 +++-
>  security/selinux/hooks.c          |  28 ++++++--
>  security/smack/smack_lsm.c        |  38 ++++++----
>  55 files changed, 732 insertions(+), 734 deletions(-)
> 
> 

[...]

>  
> diff --git a/fs/ceph/xattr.c b/fs/ceph/xattr.c
> index 939eab7aa219..c4fee624291b 100644
> --- a/fs/ceph/xattr.c
> +++ b/fs/ceph/xattr.c
> @@ -1179,22 +1179,21 @@ int __ceph_setxattr(struct inode *inode, const char *name,
>  }
>  
>  static int ceph_get_xattr_handler(const struct xattr_handler *handler,
> -				  struct dentry *dentry, struct inode *inode,
> -				  const char *name, void *value, size_t size)
> +				  struct xattr_gs_args *args)
>  {
> -	if (!ceph_is_valid_xattr(name))
> +	if (!ceph_is_valid_xattr(args->name))
>  		return -EOPNOTSUPP;
> -	return __ceph_getxattr(inode, name, value, size);
> +	return __ceph_getxattr(args->inode, args->name,
> +			       args->buffer, args->size);
>  }
>  
>  static int ceph_set_xattr_handler(const struct xattr_handler *handler,
> -				  struct dentry *unused, struct inode *inode,
> -				  const char *name, const void *value,
> -				  size_t size, int flags)
> +				  struct xattr_gs_args *args)
>  {
> -	if (!ceph_is_valid_xattr(name))
> +	if (!ceph_is_valid_xattr(args->name))
>  		return -EOPNOTSUPP;
> -	return __ceph_setxattr(inode, name, value, size, flags);
> +	return __ceph_setxattr(args->inode, args->name,
> +			       args->value, args->size, args->flags);
>  }
>  
>  static const struct xattr_handler ceph_other_xattr_handler = {
> @@ -1300,25 +1299,22 @@ void ceph_security_invalidate_secctx(struct inode *inode)
>  }
>  
>  static int ceph_xattr_set_security_label(const struct xattr_handler *handler,
> -				    struct dentry *unused, struct inode *inode,
> -				    const char *key, const void *buf,
> -				    size_t buflen, int flags)
> +					 struct xattr_gs_args *args)
>  {
> -	if (security_ismaclabel(key)) {
> -		const char *name = xattr_full_name(handler, key);
> -		return __ceph_setxattr(inode, name, buf, buflen, flags);
> -	}
> +	if (security_ismaclabel(args->name))
> +		return __ceph_setxattr(args->inode,
> +				       xattr_full_name(handler, args->name),
> +				       args->value, args->size, args->flags);
>  	return  -EOPNOTSUPP;
>  }
>  
>  static int ceph_xattr_get_security_label(const struct xattr_handler *handler,
> -				    struct dentry *unused, struct inode *inode,
> -				    const char *key, void *buf, size_t buflen)
> +					 struct xattr_gs_args *args)
>  {
> -	if (security_ismaclabel(key)) {
> -		const char *name = xattr_full_name(handler, key);
> -		return __ceph_getxattr(inode, name, buf, buflen);
> -	}
> +	if (security_ismaclabel(args->name))
> +		return __ceph_getxattr(args->inode,
> +				       xattr_full_name(handler, args->name),
> +				       args->buffer, args->size);
>  	return  -EOPNOTSUPP;
>  }
>  

The ceph bits look fine to me. Note that we do have some patches queued
up for v5.4 that might have some merge conflicts here. Shouldn't be too
hard to fix it up though.

Acked-by: Jeff Layton <jlayton@kernel.org>



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
