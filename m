Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DB68E903
	for <lists+linux-afs@lfdr.de>; Thu, 15 Aug 2019 12:27:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gpg2/LbJMF3N8HJDs8rjFgLSnMi8wmEDAFUnKrga7cw=; b=ogiOqv9r007BIluNtpzzYIDmd
	AZsn5oXLoRyzgPDtLcjfVMxhT9DtVmOUdDKKaOjD51W+2X/MCfV6E5a6gjKzzZHmj4xNNLArW1SyC
	Cg/PoI4iaqw8Qqa3ExXhKnVEko6mq7B9xi4/lVnT3bJIbJ34IdVY/ayF6kuXoz9OyWCRJ132uKvuM
	RNJ2lQUUc8/Kg5aBNTAqqjts3spNw35XFIegFD0ZiRutJMGt7e94npUfnQhz3XcxDi5zhISms/RYM
	VVY4HCM8ke7Im2iB6jxbLT+UMSeJ91ldzidQtQW2X04rPlo/vB070ezQXTlkHQGQd5TiIgB2dh+lG
	ZusSjJqGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyCyT-0004Gl-HH; Thu, 15 Aug 2019 10:27:17 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxufM-0001nN-Jf
 for linux-afs@lists.infradead.org; Wed, 14 Aug 2019 14:54:22 +0000
Received: by mail-pl1-x641.google.com with SMTP id z3so3997126pln.6
 for <linux-afs@lists.infradead.org>; Wed, 14 Aug 2019 07:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=CnI+bcK+PrkZXa0lXxFneGD0jULXut8K+Ere8plo5Kc=;
 b=ahMJ7+6MRm+vSMGaNapJnzEVkJAGqdseEv5NiAiJ2xVM1sgCa/KjV3CzptwbORiRO4
 tdVwxwGBtUsGnUn2c7e13VySsAmWdVDIrtQOwhPmb7DJeeLmPii1ZL4rskNBRvtj47Hs
 RPxCzpXwnaU3g/CUfEBg3QlPGY1SngnQDCYWpuzQB5cndu90bUkPUFPxqy0/Rekd1WQO
 4zngI17UYs23Aiqj3B79lt987Hor3fkgPNT95mLnJes5xZMFhtrjHD+wvpp9CvYS0OOT
 T0Jx+829oyOwsEqr2Xgl3CEpOuwA5/x9WXxEUC4UDChgzDD/d77A140pfqc0MLV3w5Tr
 /pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CnI+bcK+PrkZXa0lXxFneGD0jULXut8K+Ere8plo5Kc=;
 b=GqIBCidkHJjkwZpvrA0AuqxkgAqztWosssSXQxzjznLXiA3+QZzoDNRgUq8Ka4b33c
 Mu85nc48zAkS+co9oWY5QngPqvrtuDvqUiogkrIWWTac9RqB9iW8zp3MXSKDRIUQsF+C
 a84tlBwc56HtQpf9IHEScbgUVGTuDLLLFkfhTG9nchB7o+Tcj3mPbQZOe9jIADQe1tQX
 pMD1JAt1OVhEWxK6TB5jPRmV58pa1+Jlbpkwq2FrY9xI3Y3guDOPlElmnUr7t/w+ZnLQ
 hmoGBCL/XPMWfolIRzm2sy+K/jcx4/HRXk4akgz7QiApWulMkfqZnnh1ajpiTPIAzove
 Q4vw==
X-Gm-Message-State: APjAAAVThqjWagjZ3sqQLNl9CBtWz2/j8PoJariJOtl7VgKoHXmMhrpe
 zt+mn8GSxz66I4SES5fJAF/A7w==
X-Google-Smtp-Source: APXvYqz3CwepJ0lR8OwKX1IycWhHHs06AM+yzu0iFct+XZq8bOtgfYosWIvv1z0G9d0AAh0UWfDALQ==
X-Received: by 2002:a17:902:3103:: with SMTP id
 w3mr43683432plb.84.1565794459417; 
 Wed, 14 Aug 2019 07:54:19 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com
 ([2620:15c:211:200:5404:91ba:59dc:9400])
 by smtp.googlemail.com with ESMTPSA id
 f20sm144508955pgg.56.2019.08.14.07.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2019 07:54:18 -0700 (PDT)
Subject: Re: [PATCH v2] Add flags option to get xattr method paired to
 __vfs_getxattr
To: Jan Kara <jack@suse.cz>
References: <20190813145527.26289-1-salyzyn@android.com>
 <20190814110022.GB26273@quack2.suse.cz>
From: Mark Salyzyn <salyzyn@android.com>
Message-ID: <71d66fd1-cc94-fd0c-dfa7-115ba8a6b95a@android.com>
Date: Wed, 14 Aug 2019 07:54:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814110022.GB26273@quack2.suse.cz>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_075420_672408_277443F7 
X-CRM114-Status: GOOD (  21.37  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:641 listed in]
 [list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Thu, 15 Aug 2019 03:27:15 -0700
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
 =?UTF-8?Q?Ernesto_A=2e_Fern=c3=a1ndez?= <ernesto.mnd.fernandez@gmail.com>,
 linux-btrfs@vger.kernel.org, linux-security-module@vger.kernel.org,
 Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>,
 linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>,
 ocfs2-devel@oss.oracle.com, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On 8/14/19 4:00 AM, Jan Kara wrote:
> On Tue 13-08-19 07:55:06, Mark Salyzyn wrote:
> ...
>> diff --git a/fs/xattr.c b/fs/xattr.c
>> index 90dd78f0eb27..71f887518d6f 100644
>> --- a/fs/xattr.c
>> +++ b/fs/xattr.c
> ...
>>   ssize_t
>>   __vfs_getxattr(struct dentry *dentry, struct inode *inode, const char *name,
>> -	       void *value, size_t size)
>> +	       void *value, size_t size, int flags)
>>   {
>>   	const struct xattr_handler *handler;
>> -
>> -	handler = xattr_resolve_name(inode, &name);
>> -	if (IS_ERR(handler))
>> -		return PTR_ERR(handler);
>> -	if (!handler->get)
>> -		return -EOPNOTSUPP;
>> -	return handler->get(handler, dentry, inode, name, value, size);
>> -}
>> -EXPORT_SYMBOL(__vfs_getxattr);
>> -
>> -ssize_t
>> -vfs_getxattr(struct dentry *dentry, const char *name, void *value, size_t size)
>> -{
>> -	struct inode *inode = dentry->d_inode;
>>   	int error;
>>   
>> +	if (flags & XATTR_NOSECURITY)
>> +		goto nolsm;
> Hum, is it OK for XATTR_NOSECURITY to skip even the xattr_permission()
> check? I understand that for reads of security xattrs it actually does not
> matter in practice but conceptually that seems wrong to me as
> XATTR_NOSECURITY is supposed to skip just security-module checks to avoid
> recursion AFAIU.

Good catch I think.

I was attempting to make this change purely inert, no change in 
functionality, only a change in API. Adding a call to xattr_permission 
would incur a change in overall functionality, as it would introduce 
into the current and original __vfs_getxattr a call to xattr_permission 
that was not there before.

(I will have to defer the real answer and requirements to the security 
folks)

AFAIK you are correct, and to make the call would reduce the attack 
surface, trading a very small amount of CPU utilization, for a much 
larger amount of trust.

Given the long history of this patch set (for overlayfs) and the large 
amount of stakeholders, I would _prefer_ to submit a followup 
independent functionality/security change to _vfs_get_xattr _after_ this 
makes it in.

>
>> diff --git a/include/uapi/linux/xattr.h b/include/uapi/linux/xattr.h
>> index c1395b5bd432..1216d777d210 100644
>> --- a/include/uapi/linux/xattr.h
>> +++ b/include/uapi/linux/xattr.h
>> @@ -17,8 +17,9 @@
>>   #if __UAPI_DEF_XATTR
>>   #define __USE_KERNEL_XATTR_DEFS
>>   
>> -#define XATTR_CREATE	0x1	/* set value, fail if attr already exists */
>> -#define XATTR_REPLACE	0x2	/* set value, fail if attr does not exist */
>> +#define XATTR_CREATE	 0x1	/* set value, fail if attr already exists */
>> +#define XATTR_REPLACE	 0x2	/* set value, fail if attr does not exist */
>> +#define XATTR_NOSECURITY 0x4	/* get value, do not involve security check */
>>   #endif
> It seems confusing to export XATTR_NOSECURITY definition to userspace when
> that is kernel-internal flag. I'd just define it in include/linux/xattr.h
> somewhere from the top of flags space (like 0x40000000).
>
> Otherwise the patch looks OK to me (cannot really comment on the security
> module aspect of this whole thing though).

Good point. However, we do need to keep these flags together to reduce 
maintenance risk, I personally abhor two locations for flags bits even 
if one comes from the opposite bit-side; collisions are undetectable at 
build time. Although I have not gone through the entire thought 
experiment, I am expecting that fuse could possibly benefit from this 
flag (if exposed) since it also has a security recursion. That said, 
fuse is probably the example of a gaping wide attack surface if user 
space had access to it ... your xattr_permissions call addition 
requested above would be realistically, not just pedantically, required!

I have to respin the patch because of yet another hole in filesystem 
coverage (I blew the mechanical ubifs adjustment, adjusted the wrong 
function), so please do tell if my rationalizations above hit a note, or 
if I _need_ to make the changes in this patch (change it to a series?).

Thanks -- Mark Salyzyn



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
