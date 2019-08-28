Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BA5A1E68
	for <lists+linux-afs@lfdr.de>; Thu, 29 Aug 2019 17:08:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zQJticL2TwzL49W2ZAIbFEA7PWq1sT84xJxf/kOFl7o=; b=OuytQ4WJdZi3ms
	Lno/c/iNwiJBKuhRi1yVp10c9IJxTqLuG6MYnLHIcolbHGhd8L2jgu9gycKx4ob4AaH2yHzHTYrt3
	MLHLgvDTlRsNRkOwzcpgh/p8SA6/Mk86cSbUtJrm5SCGu2kX5vLkFI0X0jF08KOnGsZfGqmX4L8e6
	7f6YGsBS6OOPaUHQGmQQ99qOc+qcED5BzPF8y+Qi5VprUrQuDuRl0rF4DIjoO13jbrGF6E3mgBH98
	ZojivYwcS/GytyLTOqb96n0kuWJ48x/GglVMmavBR0Rk27DqxftStYDh4PUv2sr2WIF6tvX7WL5jR
	1kvI2duQQFgzhHfychbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3M20-00082C-4G; Thu, 29 Aug 2019 15:08:12 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1i2ys3-0005kr-PD; Wed, 28 Aug 2019 14:24:23 +0000
Date: Wed, 28 Aug 2019 07:24:23 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mark Salyzyn <salyzyn@android.com>
Subject: Re: [PATCH v8] Add flags option to get xattr method paired to
 __vfs_getxattr
Message-ID: <20190828142423.GA1955@infradead.org>
References: <20190827150544.151031-1-salyzyn@android.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827150544.151031-1-salyzyn@android.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Thu, 29 Aug 2019 07:57:28 -0700
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Jan Kara <jack@suse.com>, Casey Schaufler <casey@schaufler-ca.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Kleikamp <shaggy@kernel.org>,
 linux-doc@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 Chao Yu <yuchao0@huawei.com>, Mimi Zohar <zohar@linux.ibm.com>,
 linux-cifs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
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
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org, linux-mm@kvack.org,
 samba-technical@lists.samba.org, linux-xfs@vger.kernel.org,
 Bob Peterson <rpeterso@redhat.com>, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 ocfs2-devel@oss.oracle.com, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, Eric Biggers <ebiggers@google.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Adrian Hunter <adrian.hunter@intel.com>, David Howells <dhowells@redhat.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, devel@driverdev.osuosl.org,
 "J. Bruce Fields" <bfields@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Sage Weil <sage@redhat.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 cluster-devel@redhat.com, Steve French <sfrench@samba.org>,
 v9fs-developer@lists.sourceforge.net, Bharath Vedartham <linux.bhar@gmail.com>,
 Jann Horn <jannh@google.com>, ecryptfs@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, Dave Chinner <dchinner@redhat.com>,
 David Sterba <dsterba@suse.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 netdev@vger.kernel.org, linux-unionfs@vger.kernel.org, stable@vger.kernel.org,
 Tyler Hicks <tyhicks@canonical.com>, linux-security-module@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 David Woodhouse <dwmw2@infradead.org>, linux-btrfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDg6MDU6MTVBTSAtMDcwMCwgTWFyayBTYWx5enluIHdy
b3RlOgo+IFJlcGxhY2UgYXJndW1lbnRzIGZvciBnZXQgYW5kIHNldCB4YXR0ciBtZXRob2RzLCBh
bmQgX192ZnNfZ2V0eGF0dHIKPiBhbmQgX192ZnNfc2V0YXh0ciBmdW5jdGlvbnMgd2l0aCBhIHJl
ZmVyZW5jZSB0byB0aGUgZm9sbG93aW5nIG5vdwo+IGNvbW1vbiBhcmd1bWVudCBzdHJ1Y3R1cmU6
CgpZaWtlcy4gIFRoYXQgbG9va3MgbGlrZSBhIG1lc3MuICBXaHkgY2FuJ3Qgd2UgcGFzcyBhIGtl
cm5lbC1vbmx5CmZsYWcgaW4gdGhlIGV4aXN0aW5nIGZsYWdzIGZpZWxkIGZvciDigos+c2V0IGFu
ZCBhZGQgYSBmbGFncyBmaWVsZAp0byAtPmdldD8gIFBhc3NpbmcgbWV0aG9kcyBieSBzdHJ1Y3R1
cmUgYWx3YXlzIHRlbmRzIHRvIGJlIGEgbWVzcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFmcyBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hZnMK
