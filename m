Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5863C8F5C7
	for <lists+linux-afs@lfdr.de>; Thu, 15 Aug 2019 22:31:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iM7VeV3iCPpPkSPS56SYvQziflA1VJcAWek6jZth/4U=; b=XXb+4pA/292+ZE
	WAI7lI52NzykhAh7GZbPDSuJWWZiy685HrXjcJqkfFGkQdybgX0ImPhiCPU3zx2xAI18Ds8FYUIKP
	H1MifWko5ycwK1dJy/zyXpN+KleJ2zp80oUkUkZ6oaiLLspsd07wnWB+43Jy09s9pY9CUHRu/1EHH
	JPT12ftNwZ8JZVjOQ15kmw7bSmkM4zuyL7kwFX1ytAz98GyndvUdrZmsl7kGIKFzZ+qJC3hFT7IhY
	zyc4nFVpMO7f8gwXc1bogHCfuuRVZ3Y/yzISvQPE2rU/+RuAkH+H7pHTHsWipzl+GKJsU/JzeCjWC
	GPBJA18DrTE9jeJPP6Vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyMOh-0004UR-Eo; Thu, 15 Aug 2019 20:30:59 +0000
Received: from namei.org ([65.99.196.166])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyMG9-0000bW-8b; Thu, 15 Aug 2019 20:22:13 +0000
Received: from localhost (localhost [127.0.0.1])
 by namei.org (8.14.4/8.14.4) with ESMTP id x7FJKa6b013630;
 Thu, 15 Aug 2019 19:20:36 GMT
Date: Fri, 16 Aug 2019 05:20:36 +1000 (AEST)
From: James Morris <jmorris@namei.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] Add flags option to get xattr method paired to
 __vfs_getxattr
In-Reply-To: <20190813084801.GA972@kroah.com>
Message-ID: <alpine.LRH.2.21.1908160515130.12729@namei.org>
References: <20190812193320.200472-1-salyzyn@android.com>
 <20190813084801.GA972@kroah.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190815_132209_385932_9C6655C3 
X-CRM114-Status: GOOD (  11.62  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Mailman-Approved-At: Thu, 15 Aug 2019 13:30:56 -0700
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
 jfs-discussion@lists.sourceforge.net, linux-integrity@vger.kernel.org,
 Martin Brandenburg <martin@omnibond.com>, samba-technical@lists.samba.org,
 Dominique Martinet <asmadeus@codewreck.org>, Chao Yu <yuchao0@huawei.com>,
 Mimi Zohar <zohar@linux.ibm.com>, linux-unionfs@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Eric Paris <eparis@parisplace.org>,
 netdev@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
 linux-afs@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.com>,
 Sage Weil <sage@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>,
 =?ISO-8859-15?Q?Ernesto_A=2E_Fern=E1ndez?= <ernesto.mnd.fernandez@gmail.com>,
 cluster-devel@redhat.com, selinux@vger.kernel.org,
 Vyacheslav Dubeyko <slava@dubeyko.com>,
 Casey Schaufler <casey@schaufler-ca.com>, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 kernel-team@android.com, linux-mm@kvack.org, devel@lists.orangefs.org,
 Serge Hallyn <serge@hallyn.com>, linux-cifs@vger.kernel.org,
 Eric Van Hensbergen <ericvh@gmail.com>, ecryptfs@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, reiserfs-devel@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, Joel Becker <jlbec@evilplan.org>,
 linux-mtd@lists.infradead.org, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Paul Moore <paul@paul-moore.com>, linux-nfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Theodore Ts'o <tytso@mit.edu>,
 linux-fsdevel@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Mathieu Malaterre <malat@debian.org>, Stephen Smalley <sds@tycho.nsa.gov>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Mark Salyzyn <salyzyn@android.com>, Steve French <sfrench@samba.org>,
 linux-security-module@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 Jan Kara <jack@suse.com>, Bob Peterson <rpeterso@redhat.com>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-btrfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Tue, 13 Aug 2019, Greg Kroah-Hartman wrote:

> On Mon, Aug 12, 2019 at 12:32:49PM -0700, Mark Salyzyn wrote:
> > --- a/include/linux/xattr.h
> > +++ b/include/linux/xattr.h
> > @@ -30,10 +30,10 @@ struct xattr_handler {
> >  	const char *prefix;
> >  	int flags;      /* fs private flags */
> >  	bool (*list)(struct dentry *dentry);
> > -	int (*get)(const struct xattr_handler *, struct dentry *dentry,
> > +	int (*get)(const struct xattr_handler *handler, struct dentry *dentry,
> >  		   struct inode *inode, const char *name, void *buffer,
> > -		   size_t size);
> > -	int (*set)(const struct xattr_handler *, struct dentry *dentry,
> > +		   size_t size, int flags);
> > +	int (*set)(const struct xattr_handler *handler, struct dentry *dentry,
> >  		   struct inode *inode, const char *name, const void *buffer,
> >  		   size_t size, int flags);
> 
> Wow, 7 arguments.  Isn't there some nice rule of thumb that says once
> you get more then 5, a function becomes impossible to understand?
> 
> Surely this could be a structure passed in here somehow, that way when
> you add the 8th argument in the future, you don't have to change
> everything yet again?  :)
> 
> I don't have anything concrete to offer as a replacement fix for this,
> but to me this just feels really wrong...

How about something like:

struct xattr_gs_args {
	struct dentry *dentry;
	struct inode *inode;
	const char *name;
	const void *buffer;
	size_t size;
	int flags;
};

int (*get)(const struct xattr_handler *handler, struct xattr_gs_args *args);
int (*set)(const struct xattr_handler *handler, struct xattr_gs_args *args);


-- 
James Morris
<jmorris@namei.org>


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
