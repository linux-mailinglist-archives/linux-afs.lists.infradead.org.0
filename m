Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C99992805
	for <lists+linux-afs@lfdr.de>; Mon, 19 Aug 2019 17:09:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALtxhhnMUROdUy9c0/FZh79ELjbpIi06MBvo6ITA6l0=; b=TKs56Y6wNQQ4GE
	0dgPpNxbL7mpelpEjZmth4nDnRUaAqESSabXIPcuGCpTTkLGcDEMoD87q1bf+7OOJvYGeslNbV1Q5
	9Ptbs+fWZu7C/RFIIIAo0rSADfSKONQwoFYNhi3TLWbv23IIB1OEXPf1z7XUJeLwVJV2xZI+hpRTX
	bcl1j7HY3aKqDGG/zSyfjbDoiPMT46QAmTbCjfzP37ole0SzNVrWh71sl2ISM8WvH1/fj3vIqAgif
	swNy4t0eaQ28TUyrgSMvF7xSAuqsZqx7foHH3xQWgoQSmQVe0fkyKb2hFB1oVo30MtqnMqGEBovZz
	YHMQ+HfoM03xZN/7MTAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzjHE-0000sX-Un; Mon, 19 Aug 2019 15:08:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyMal-0007UW-1K; Thu, 15 Aug 2019 20:43:29 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BB2B2083B;
 Thu, 15 Aug 2019 20:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565901805;
 bh=4MUbuhxyjB/Z/I0+KEuHYyPv1fvr/qroc0kojX6LQUI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rmevilO9FFuTpF1TkeHr9rMjq0tx8UWAlZu1cW/zsMuDRMCXNIqbtamv/Bh9PWjxr
 uMcyMcUqmrlEz/U6ipnvwnFJksubQpe8uhV+mxBP/PuZfI7m0SnpKLNF/GD9rIRrXm
 9i2PofIAyA1t7LZj0WwS4y+NrRc1E+LScCfI1k7c=
Date: Thu, 15 Aug 2019 22:43:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: James Morris <jmorris@namei.org>
Subject: Re: [PATCH] Add flags option to get xattr method paired to
 __vfs_getxattr
Message-ID: <20190815204322.GB6782@kroah.com>
References: <20190812193320.200472-1-salyzyn@android.com>
 <20190813084801.GA972@kroah.com>
 <alpine.LRH.2.21.1908160515130.12729@namei.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.21.1908160515130.12729@namei.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190815_134327_122353_26B187D8 
X-CRM114-Status: GOOD (  14.97  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Mon, 19 Aug 2019 08:08:56 -0700
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
 Ernesto =?iso-8859-1?Q?A=2E_Fern=E1ndez?= <ernesto.mnd.fernandez@gmail.com>,
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

On Fri, Aug 16, 2019 at 05:20:36AM +1000, James Morris wrote:
> On Tue, 13 Aug 2019, Greg Kroah-Hartman wrote:
> 
> > On Mon, Aug 12, 2019 at 12:32:49PM -0700, Mark Salyzyn wrote:
> > > --- a/include/linux/xattr.h
> > > +++ b/include/linux/xattr.h
> > > @@ -30,10 +30,10 @@ struct xattr_handler {
> > >  	const char *prefix;
> > >  	int flags;      /* fs private flags */
> > >  	bool (*list)(struct dentry *dentry);
> > > -	int (*get)(const struct xattr_handler *, struct dentry *dentry,
> > > +	int (*get)(const struct xattr_handler *handler, struct dentry *dentry,
> > >  		   struct inode *inode, const char *name, void *buffer,
> > > -		   size_t size);
> > > -	int (*set)(const struct xattr_handler *, struct dentry *dentry,
> > > +		   size_t size, int flags);
> > > +	int (*set)(const struct xattr_handler *handler, struct dentry *dentry,
> > >  		   struct inode *inode, const char *name, const void *buffer,
> > >  		   size_t size, int flags);
> > 
> > Wow, 7 arguments.  Isn't there some nice rule of thumb that says once
> > you get more then 5, a function becomes impossible to understand?
> > 
> > Surely this could be a structure passed in here somehow, that way when
> > you add the 8th argument in the future, you don't have to change
> > everything yet again?  :)
> > 
> > I don't have anything concrete to offer as a replacement fix for this,
> > but to me this just feels really wrong...
> 
> How about something like:
> 
> struct xattr_gs_args {
> 	struct dentry *dentry;
> 	struct inode *inode;

As he said in a later message, dentry and inode is redundant, only 1 is
needed (dentry I think?)

> 	const char *name;
> 	const void *buffer;
> 	size_t size;
> 	int flags;
> };
> 
> int (*get)(const struct xattr_handler *handler, struct xattr_gs_args *args);
> int (*set)(const struct xattr_handler *handler, struct xattr_gs_args *args);

But yes, that would be much much better.

thanks,

greg k-h

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
