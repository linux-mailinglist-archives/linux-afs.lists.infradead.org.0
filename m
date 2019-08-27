Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C53B0A1E62
	for <lists+linux-afs@lfdr.de>; Thu, 29 Aug 2019 17:08:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8KaIZ/JmkcUpgni2HFXmDYXFYmvyrShQBevpDJcywe8=; b=VzdndMYVgJPKs7tv+YeRBrC4k
	geR+d6qhDuNs/IPS/6ADpUSRbcruBLLLoVM/bxhQhy7wx6bu6I8rknS3a12SShRewrsLwncjIk5VR
	xxMgMrOGHqWIBRyPg4S4kABRlsIQpu8ijnB5exYpu+1QUf9X4xO50VNZTSUQjRycveipF20ooqgZH
	ewegAPXwf+sEN428MmSp6FSVz+qXqhe+QEpTHthe0dNfei+NOGiF08KKeJv9in5KguQphJ9byY6MU
	vZ90ZRG+GA/KZscIO1uWBWdSzq/taEZGmumgJCvwxEmrE7SG4e8iYY6/JNjtVmvBPHrIW1xEgjnOF
	0JUF5wOuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3M1o-0007uK-ER; Thu, 29 Aug 2019 15:08:00 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2crx-0000oW-BH
 for linux-afs@lists.infradead.org; Tue, 27 Aug 2019 14:54:50 +0000
Received: by mail-pf1-x443.google.com with SMTP id v12so14275699pfn.10
 for <linux-afs@lists.infradead.org>; Tue, 27 Aug 2019 07:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=J0PyrXbgy2rQbHf32v3WQfO8h7H5WwZ0x8ImHOimCWs=;
 b=mzwUwotHCHLyC8kvJQKX2qfkclXUibOZVKlCSAmub430gCcW4lmMANVBjk4ZJn37Mz
 lmwqaekfvRnk91fWBTPe9MdR6DNIOZYbn1kKQlCtB2EIRUw9eVK89gLHZxbOnS+BoN9O
 z/e+lec1c3V+A/cevmzn6YhUNeV1qLcxR5P5ZMIEm0QeC99vQIqrptkzAecOAow3P+WG
 qTbXtfhvLGsZsqUEkNrN67J91EYh7XB3OB1b7OQP26/5Ffe7WcOAgQyPgjx4Kr7W8Oc+
 UwQjFeNzqy6bSLsp44PwvDCnhYQ/gCS2wppnuYUD4QcGMN8OxcAFpKCWSwZ+EWDarzDN
 vqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=J0PyrXbgy2rQbHf32v3WQfO8h7H5WwZ0x8ImHOimCWs=;
 b=V+m27TNexSjFUhYvEsVb4Dc+2XA/OJZm3fqW4+UlNucX+FDpxVCKx7Avs72+IaWsQc
 SNxX4sYvQYkF60Gye1LU5gQwF43UQ9PfSGu+K09wlQIeD+s7TUxxvKcPn56VpygB4rAv
 sdJ3h5CL7cUqYLFrjeMuXxlB0/KkgBFK3/BPt7sI1qgGSxI0FGQGnrl3N2RYYEQo3U3a
 ke1cMCTdcSamPhDyIvcOECK13dYPeExt4ll0kfJSGuG36PQguqgj6jeV881acEDLxuHC
 QulWC7ftnEZrhvm8/DfZooHpHSgUdEM8epJZlf1qgY7tSSTtNlJrJTMUZllax0XtP9Dq
 0X+w==
X-Gm-Message-State: APjAAAW0C0wr/TqkDusUAUUXZm/yZMpIyUTk/hQGkxmCFInj2jRR6SGc
 Wy0L0EasGiheKhsXoQGX5gAN+Q==
X-Google-Smtp-Source: APXvYqwBoH7/mHEw1qHJ4C0pvUdOnWf9w3cFM7T1JRRoXNt8gEzBDpTDPLau8WREch+lyRDJT+u4BA==
X-Received: by 2002:a65:6891:: with SMTP id e17mr20940506pgt.305.1566917687986; 
 Tue, 27 Aug 2019 07:54:47 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com
 ([2620:15c:211:200:5404:91ba:59dc:9400])
 by smtp.googlemail.com with ESMTPSA id
 s125sm30946505pfc.133.2019.08.27.07.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2019 07:54:47 -0700 (PDT)
Subject: Re: [PATCH v7] Add flags option to get xattr method paired to
 __vfs_getxattr
To: Jan Kara <jack@suse.cz>
References: <20190820180716.129882-1-salyzyn@android.com>
 <20190827141952.GB10098@quack2.suse.cz>
From: Mark Salyzyn <salyzyn@android.com>
Message-ID: <8468b22d-05b7-47d3-eb93-2c71dafea3ee@android.com>
Date: Tue, 27 Aug 2019 07:54:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827141952.GB10098@quack2.suse.cz>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_075449_386719_2DF02453 
X-CRM114-Status: GOOD (  14.05  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:443 listed in]
 [list.dnswl.org]
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Eric Sandeen <sandeen@sandeen.net>,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 James Morris <jmorris@namei.org>, devel@lists.orangefs.org,
 Eric Van Hensbergen <ericvh@gmail.com>, Joel Becker <jlbec@evilplan.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Jan Kara <jack@suse.com>, Casey Schaufler <casey@schaufler-ca.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Kleikamp <shaggy@kernel.org>,
 linux-doc@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 Chao Yu <yuchao0@huawei.com>, Mimi Zohar <zohar@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, linux-cifs@vger.kernel.org,
 Paul Moore <paul@paul-moore.com>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Hugh Dickins <hughd@google.com>, kernel-team@android.com,
 selinux@vger.kernel.org, Brian Foster <bfoster@redhat.com>,
 reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
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
 Steve French <sfrench@samba.org>, Bob Peterson <rpeterso@redhat.com>,
 Tejun Heo <tj@kernel.org>, linux-erofs@lists.ozlabs.org,
 Anna Schumaker <anna.schumaker@netapp.com>, ocfs2-devel@oss.oracle.com,
 jfs-discussion@lists.sourceforge.net, Eric Biggers <ebiggers@google.com>,
 Dominique Martinet <asmadeus@codewreck.org>, Jeff Mahoney <jeffm@suse.com>,
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 devel@driverdev.osuosl.org, "J. Bruce Fields" <bfields@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Sage Weil <sage@redhat.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 linux-security-module@vger.kernel.org, cluster-devel@redhat.com,
 v9fs-developer@lists.sourceforge.net, Bharath Vedartham <linux.bhar@gmail.com>,
 Jann Horn <jannh@google.com>, ecryptfs@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, Dave Chinner <dchinner@redhat.com>,
 David Sterba <dsterba@suse.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 netdev@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 stable@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
 =?UTF-8?Q?Ernesto_A=2e_Fern=c3=a1ndez?= <ernesto.mnd.fernandez@gmail.com>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 David Woodhouse <dwmw2@infradead.org>, linux-btrfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On 8/27/19 7:19 AM, Jan Kara wrote:
> On Tue 20-08-19 11:06:48, Mark Salyzyn wrote:
>> diff --git a/Documentation/filesystems/Locking b/Documentation/filesystems/Locking
>> index 204dd3ea36bb..e2687f21c7d6 100644
>> --- a/Documentation/filesystems/Locking
>> +++ b/Documentation/filesystems/Locking
>> @@ -101,12 +101,10 @@ of the locking scheme for directory operations.
>>   ----------------------- xattr_handler operations -----------------------
>>   prototypes:
>>   	bool (*list)(struct dentry *dentry);
>> -	int (*get)(const struct xattr_handler *handler, struct dentry *dentry,
>> -		   struct inode *inode, const char *name, void *buffer,
>> -		   size_t size);
>> -	int (*set)(const struct xattr_handler *handler, struct dentry *dentry,
>> -		   struct inode *inode, const char *name, const void *buffer,
>> -		   size_t size, int flags);
>> +	int (*get)(const struct xattr_handler *handler,
>> +		   struct xattr_gs_flags);
>> +	int (*set)(const struct xattr_handler *handler,
>> +		   struct xattr_gs_flags);
> The prototype here is really "struct xattr_gs_flags *args", isn't it?
> Otherwise feel free to add:
>
> Reviewed-by: Jan Kara <jack@suse.cz>
>
> for the ext2, ext4, ocfs2, reiserfs, and the generic fs/* bits.
>
> 								Honza

<oops> Thanks and good catch, will respin with a fix to the 
documentation shortly.

-- Mark


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
