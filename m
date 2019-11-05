Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2E1F31A4
	for <lists+linux-afs@lfdr.de>; Thu,  7 Nov 2019 15:38:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXHhbjG/MTPnmXzwfd5QL30gR5DWZlFOET1LgmvUwmE=; b=Qi+EX+jG/PXexw
	8m04LkTxKONFxrlnRjXLYk6UYwdjxu5ZMC5AGN9I/wohmvmBCj1oQreqdMoCCh94IjezPzA9eiuFj
	S41qOj0TZX8itcsrf8c6mcRxRYtIextaOmoF2HkZoTqtMsTpTLT4gwL0q79u2zaLYKJtA2UgEksPQ
	NPhySu6bhVcsPneR9DS3s+2apDkKXKB/tJzbbJtpKGNuVCbETVX1xxuGJ9RF2qT+ttNUh1DU1vCt+
	hebS2/lmNo5fe/ZnE4gFbdzEQUVw8bAe7p/rl3EfICu+El5E/s+gxmJx2Q0999fpiegzy3ajz2075
	YQTjbjZnk22e7auVFOFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSiv1-0003Sf-Q9; Thu, 07 Nov 2019 14:37:51 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRvS3-0002Ac-2t; Tue, 05 Nov 2019 09:48:40 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DDAFFB3A6;
 Tue,  5 Nov 2019 09:48:34 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 242661E4407; Tue,  5 Nov 2019 10:48:30 +0100 (CET)
Date: Tue, 5 Nov 2019 10:48:30 +0100
From: Jan Kara <jack@suse.cz>
To: Mark Salyzyn <salyzyn@android.com>
Subject: Re: [PATCH v15 1/4] Add flags option to get xattr method paired to
 __vfs_getxattr
Message-ID: <20191105094830.GL22379@quack2.suse.cz>
References: <20191104215253.141818-1-salyzyn@android.com>
 <20191104215253.141818-2-salyzyn@android.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191104215253.141818-2-salyzyn@android.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_014839_415511_43D7AD2B 
X-CRM114-Status: GOOD (  11.91  )
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.15 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Mailman-Approved-At: Thu, 07 Nov 2019 06:37:50 -0800
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
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Martin Brandenburg <martin@omnibond.com>, samba-technical@lists.samba.org,
 Dominique Martinet <asmadeus@codewreck.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, "David S. Miller" <davem@davemloft.net>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Eric Paris <eparis@parisplace.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, netdev@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 linux-unionfs@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.com>,
 Sage Weil <sage@redhat.com>, "Darrick J . Wong" <darrick.wong@oracle.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Eric Biggers <ebiggers@google.com>, Hugh Dickins <hughd@google.com>,
 James Morris <jmorris@namei.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, cluster-devel@redhat.com,
 selinux@vger.kernel.org, Benjamin Coddington <bcodding@redhat.com>,
 Casey Schaufler <casey@schaufler-ca.com>, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Stephen Smalley <sds@tycho.nsa.gov>, linux-mm@kvack.org,
 Mark Salyzyn <salyzyn@google.com>, Serge Hallyn <serge@hallyn.com>,
 ecryptfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 Eric Van Hensbergen <ericvh@gmail.com>, Chao Yu <chao@kernel.org>,
 linux-erofs@lists.ozlabs.org, Josef Bacik <josef@toxicpanda.com>,
 reiserfs-devel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
 Joel Becker <jlbec@evilplan.org>, linux-mtd@lists.infradead.org,
 Phillip Lougher <phillip@squashfs.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 devel@lists.orangefs.org, Gao Xiang <xiang@kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Paul Moore <paul@paul-moore.com>,
 linux-nfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-fsdevel@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Mathieu Malaterre <malat@debian.org>, kernel-team@android.com,
 Jonathan Corbet <corbet@lwn.net>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
 Steve French <sfrench@samba.org>, linux-security-module@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, Jan Kara <jack@suse.com>,
 Bob Peterson <rpeterso@redhat.com>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-btrfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

> @@ -228,11 +228,11 @@ static int afs_xattr_get_yfs(const struct xattr_handler *handler,
>  		break;
>  	case 1:
>  		data = buf;
> -		dsize = snprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
> +		dsize = scnprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
>  		break;
>  	case 2:
>  		data = buf;
> -		dsize = snprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
> +		dsize = scnprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
>  		break;
>  	case 3:

These scnprintf() changes (and there are more in the patch) probably
shouldn't be here... Otherwise the patch still looks good to me :).

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
