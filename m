Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D38838BD56
	for <lists+linux-afs@lfdr.de>; Tue, 13 Aug 2019 17:38:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ju4fPKLvmdScsO0FpT6MHCkHVdjDCyH6ET2y7RDakh8=; b=htGo2H1rmhLJiNkaxQEbftYDe
	JBeVRr7p5UCC0yN8rjHlHtEsbhpBrwVYCkpUGw8Fhnar4zo4j6U5mhHv3ugA5LXW4XbfNRE77k+9e
	aho0zCaZJIFm6FJlhi9kfrCxg2Cj4I+k9Bj9jg7t4Ov3YlqQ0VYDGAnK3boqPb/8lSFOwb4IoK5Du
	HQ2U0OqFT6a9k+o4OTw2Gzoou5XFPylOT7tcU/6JUMmKvLBsaz4CJGQTF/AEYGDg0xBAJvjACvpf8
	4gyNl6/DAO/jngWsELMWPxkKLtO4ySlg8UBJJqwnkmYuS1ts1C8tAv+i9TS8tRnYBtJ3SBYJ2AY8L
	6lpxusgiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxYsn-00018u-Dh; Tue, 13 Aug 2019 15:38:45 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxXva-0004xr-Ae
 for linux-afs@lists.infradead.org; Tue, 13 Aug 2019 14:37:35 +0000
Received: by mail-pl1-x641.google.com with SMTP id m12so10746753plt.5
 for <linux-afs@lists.infradead.org>; Tue, 13 Aug 2019 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=bw4HKPsz5KHcjk6HSfejuCsIw3GJFzkr29hAUy0bps0=;
 b=MFtq1gVoaeUSMonwadLhXhTtdodprj0ov0yRnwcJzaEizH9iXc2AyEe2YsLLjL9Em/
 DnRWUrLHNQkMs6a4pyzNtrfV9fh+f0WakaT7EGR/SddCESx4gNUJvdWbI0AnPn8pRpA3
 wgmNSZiOuSrw44CJp44y0pGPN0U6VzVYkB7JCci+tCmHHs3IKTEqfV+veY5UEDP6fcp7
 FcnOe1UR/JGhNA1vKqUgRY0O8lDkppt5VkhCp5z7ne3Sr1+pfITYHkHNFOIDKkVzXAz3
 95wisabfmhqSW6q/xPUyroW+UZ9ddmhvgoPCBG7x434/HPUw3rZO1bStEKXJRGENRSDr
 pjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bw4HKPsz5KHcjk6HSfejuCsIw3GJFzkr29hAUy0bps0=;
 b=eXqv8h7f1J1Y/bEHoQi7JiZKJk9+4Tiqva+0CdpTqLKOowQYTi8cL9DEvYP7iFoMYv
 5bmrfuPsC09WG0NyaaLdssPksIi2AqT536DbECtW4Sudt4Z6FnHzflj8iYXnz+4T96H4
 e9BtppQnorDQygehS3qlhG0dmVj/mHXP6NTMTglaSsfNuiuctIRXb2t8jichUIMi/nDS
 OuiwmaO3y0NB6qTYe3tKupfxjGa/zpH009+tfTJGb1/1HFwRhHx5fpwmoX4I+JBDxvaX
 3ex8X2/CKZQnfT/rHmaL+Zx1nuzGkpZ9e4iXJUmXrdTdNixmzHOK+gWRu1CykAsJq9Ng
 v6mQ==
X-Gm-Message-State: APjAAAVfHjchssR89U5J1gBRU1dK9FfkfK/XwEsUd1LYzmh4A/zfefDQ
 biTb3wx/WTiCDMRHlkhQvj+iHA==
X-Google-Smtp-Source: APXvYqyXJXgYI0HIs6xWxNQDIPLGgCxznsuGq+ryK3xceeQe7Za7UsLXSNSEqPCOTlNm5RgIykOuPA==
X-Received: by 2002:a17:902:aa03:: with SMTP id
 be3mr38125628plb.240.1565707053626; 
 Tue, 13 Aug 2019 07:37:33 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com
 ([2620:15c:211:200:5404:91ba:59dc:9400])
 by smtp.googlemail.com with ESMTPSA id
 v63sm114972475pfv.174.2019.08.13.07.37.30
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 07:37:32 -0700 (PDT)
Subject: Re: [PATCH] Add flags option to get xattr method paired to
 __vfs_getxattr
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20190812193320.200472-1-salyzyn@android.com>
 <20190813084801.GA972@kroah.com>
From: Mark Salyzyn <salyzyn@android.com>
Message-ID: <e211bef2-f346-c9c7-f4b8-c774159b14e1@android.com>
Date: Tue, 13 Aug 2019 07:37:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813084801.GA972@kroah.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_073734_393310_FD63AAC3 
X-CRM114-Status: GOOD (  18.32  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:641 listed in]
 [list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Tue, 13 Aug 2019 08:38:41 -0700
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
 netdev@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-afs@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.com>,
 Sage Weil <sage@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, James Morris <jmorris@namei.org>,
 cluster-devel@redhat.com, selinux@vger.kernel.org,
 Vyacheslav Dubeyko <slava@dubeyko.com>,
 Casey Schaufler <casey@schaufler-ca.com>, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 kernel-team@android.com, linux-mm@kvack.org, devel@lists.orangefs.org,
 Serge Hallyn <serge@hallyn.com>,
 =?UTF-8?Q?Ernesto_A=2e_Fern=c3=a1ndez?= <ernesto.mnd.fernandez@gmail.com>,
 linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@gmail.com>,
 ecryptfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Joel Becker <jlbec@evilplan.org>, linux-mtd@lists.infradead.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>,
 Paul Moore <paul@paul-moore.com>, linux-nfs@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Mathieu Malaterre <malat@debian.org>,
 Stephen Smalley <sds@tycho.nsa.gov>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Tyler Hicks <tyhicks@canonical.com>, Steve French <sfrench@samba.org>,
 linux-security-module@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 Jan Kara <jack@suse.com>, Bob Peterson <rpeterso@redhat.com>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-btrfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On 8/13/19 1:48 AM, Greg Kroah-Hartman wrote:
> On Mon, Aug 12, 2019 at 12:32:49PM -0700, Mark Salyzyn wrote:
>> --- a/include/linux/xattr.h
>> +++ b/include/linux/xattr.h
>> @@ -30,10 +30,10 @@ struct xattr_handler {
>>   	const char *prefix;
>>   	int flags;      /* fs private flags */
>>   	bool (*list)(struct dentry *dentry);
>> -	int (*get)(const struct xattr_handler *, struct dentry *dentry,
>> +	int (*get)(const struct xattr_handler *handler, struct dentry *dentry,
>>   		   struct inode *inode, const char *name, void *buffer,
>> -		   size_t size);
>> -	int (*set)(const struct xattr_handler *, struct dentry *dentry,
>> +		   size_t size, int flags);
>> +	int (*set)(const struct xattr_handler *handler, struct dentry *dentry,
>>   		   struct inode *inode, const char *name, const void *buffer,
>>   		   size_t size, int flags);
> Wow, 7 arguments.  Isn't there some nice rule of thumb that says once
> you get more then 5, a function becomes impossible to understand?

This is a method with a pot-pourri of somewhat intuitive useful, but not 
always necessary, arguments, the additional argument does not complicate 
the function(s) AFAIK, but maybe its usage. Most functions do not even 
reference handler, the inode is typically a derivative of dentry, The 
arguments most used are the name of the attribute and the buffer/size 
the results are to be placed into.

The addition of flags is actually a pattern borrowed from the [.]set 
method, which provides at least 32 bits of 'control' (of which we added 
only one). Before, it was an anti-pattern.

> Surely this could be a structure passed in here somehow, that way when
> you add the 8th argument in the future, you don't have to change
> everything yet again?  :)
Just be happy I provided int flags, instead of bool no_security ;-> 
there are a few bits there that can be used in the future.
> I don't have anything concrete to offer as a replacement fix for this,
> but to me this just feels really wrong...

I went through 6 different alternatives (in the overlayfs security fix 
patch set) until I found this one that resonated with the security and 
filesystem stakeholders. The one was a direct result of trying to reduce 
the security attack surface. This code was created by threading a 
needle, and evolution. I am game for a 7th alternative to solve the 
unionfs set of recursive calls into acquiring the extended attributes.

-- Mark

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
