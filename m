Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F118D5DE
	for <lists+linux-afs@lfdr.de>; Wed, 14 Aug 2019 16:23:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yq1A2nAelwUwdgEBWtuoGJtBaUFeBJ3zTw3TTVxzVck=; b=WbZDsc0/N56mO5
	OM3GEBolz7ZQNFwu0q0hvW09HzW6Jv52n4HNADQF0l5zYUPqQnAkrXtBaFoMymtMzvgqDYGTl/MAp
	uIAfqIhLGy0Kf4uKYTOa0iXo7uurUGyqc7QejuYCGJCQ33zczVfmfbwCUHq3g0u+ce18HYkLFRvBQ
	+/LPkJMlmwiH32TA/B155ryFweYv+mB+oxS/QD4M3xfAn0Cc8L23sjvzWXH+bkueKro4yjAKGIyeR
	d0EMs30gXMmqCXBIn5NZtyiSL4lVlBfC9WXzkWDXTxfj3iqOn5oO1oe/fA6hrVSBiR3i7kdMuG+HG
	60KFiY5JeDQIHLXQ6UOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxuBY-0008CR-Ep; Wed, 14 Aug 2019 14:23:32 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxr17-0004GU-H5; Wed, 14 Aug 2019 11:00:35 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3537FADEF;
 Wed, 14 Aug 2019 11:00:26 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 81D741E4200; Wed, 14 Aug 2019 13:00:22 +0200 (CEST)
Date: Wed, 14 Aug 2019 13:00:22 +0200
From: Jan Kara <jack@suse.cz>
To: Mark Salyzyn <salyzyn@android.com>
Subject: Re: [PATCH v2] Add flags option to get xattr method paired to
 __vfs_getxattr
Message-ID: <20190814110022.GB26273@quack2.suse.cz>
References: <20190813145527.26289-1-salyzyn@android.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813145527.26289-1-salyzyn@android.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_040033_860215_2CFC18C1 
X-CRM114-Status: GOOD (  15.54  )
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.15 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Mailman-Approved-At: Wed, 14 Aug 2019 07:23:32 -0700
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
 jfs-discussion@lists.sourceforge.net,
 Phillip Lougher <phillip@squashfs.org.uk>, linux-integrity@vger.kernel.org,
 Martin Brandenburg <martin@omnibond.com>, samba-technical@lists.samba.org,
 Dominique Martinet <asmadeus@codewreck.org>, Chao Yu <yuchao0@huawei.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-mm@kvack.org, Chris Mason <clm@fb.com>, netdev@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-xfs@vger.kernel.org,
 Eric Paris <eparis@parisplace.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-afs@lists.infradead.org, Stephen Smalley <sds@tycho.nsa.gov>,
 Mike Marshall <hubcap@omnibond.com>, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 Sage Weil <sage@redhat.com>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 linux-unionfs@vger.kernel.org, Hugh Dickins <hughd@google.com>,
 James Morris <jmorris@namei.org>, cluster-devel@redhat.com,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Vyacheslav Dubeyko <slava@dubeyko.com>,
 Casey Schaufler <casey@schaufler-ca.com>, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 kernel-team@android.com, devel@lists.orangefs.org,
 Serge Hallyn <serge@hallyn.com>, Gao Xiang <gaoxiang25@huawei.com>,
 Eric Van Hensbergen <ericvh@gmail.com>, ecryptfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, Josef Bacik <josef@toxicpanda.com>,
 reiserfs-devel@vger.kernel.org, Bob Peterson <rpeterso@redhat.com>,
 Joel Becker <jlbec@evilplan.org>, Anna Schumaker <anna.schumaker@netapp.com>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, selinux@vger.kernel.org,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, David Howells <dhowells@redhat.com>,
 linux-nfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-fsdevel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miklos Szeredi <miklos@szeredi.hu>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Tyler Hicks <tyhicks@canonical.com>, Steve French <sfrench@samba.org>,
 Ernesto =?iso-8859-1?Q?A=2E_Fern=E1ndez?= <ernesto.mnd.fernandez@gmail.com>,
 linux-btrfs@vger.kernel.org, linux-security-module@vger.kernel.org,
 Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>,
 linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>,
 ocfs2-devel@oss.oracle.com, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Tue 13-08-19 07:55:06, Mark Salyzyn wrote:
...
> diff --git a/fs/xattr.c b/fs/xattr.c
> index 90dd78f0eb27..71f887518d6f 100644
> --- a/fs/xattr.c
> +++ b/fs/xattr.c
...
>  ssize_t
>  __vfs_getxattr(struct dentry *dentry, struct inode *inode, const char *name,
> -	       void *value, size_t size)
> +	       void *value, size_t size, int flags)
>  {
>  	const struct xattr_handler *handler;
> -
> -	handler = xattr_resolve_name(inode, &name);
> -	if (IS_ERR(handler))
> -		return PTR_ERR(handler);
> -	if (!handler->get)
> -		return -EOPNOTSUPP;
> -	return handler->get(handler, dentry, inode, name, value, size);
> -}
> -EXPORT_SYMBOL(__vfs_getxattr);
> -
> -ssize_t
> -vfs_getxattr(struct dentry *dentry, const char *name, void *value, size_t size)
> -{
> -	struct inode *inode = dentry->d_inode;
>  	int error;
>  
> +	if (flags & XATTR_NOSECURITY)
> +		goto nolsm;

Hum, is it OK for XATTR_NOSECURITY to skip even the xattr_permission()
check? I understand that for reads of security xattrs it actually does not
matter in practice but conceptually that seems wrong to me as
XATTR_NOSECURITY is supposed to skip just security-module checks to avoid
recursion AFAIU.

> diff --git a/include/uapi/linux/xattr.h b/include/uapi/linux/xattr.h
> index c1395b5bd432..1216d777d210 100644
> --- a/include/uapi/linux/xattr.h
> +++ b/include/uapi/linux/xattr.h
> @@ -17,8 +17,9 @@
>  #if __UAPI_DEF_XATTR
>  #define __USE_KERNEL_XATTR_DEFS
>  
> -#define XATTR_CREATE	0x1	/* set value, fail if attr already exists */
> -#define XATTR_REPLACE	0x2	/* set value, fail if attr does not exist */
> +#define XATTR_CREATE	 0x1	/* set value, fail if attr already exists */
> +#define XATTR_REPLACE	 0x2	/* set value, fail if attr does not exist */
> +#define XATTR_NOSECURITY 0x4	/* get value, do not involve security check */
>  #endif

It seems confusing to export XATTR_NOSECURITY definition to userspace when
that is kernel-internal flag. I'd just define it in include/linux/xattr.h
somewhere from the top of flags space (like 0x40000000).

Otherwise the patch looks OK to me (cannot really comment on the security
module aspect of this whole thing though).

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
