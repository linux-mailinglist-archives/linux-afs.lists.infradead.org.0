Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id F345D11A8E2
	for <lists+linux-afs@lfdr.de>; Wed, 11 Dec 2019 11:28:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WjcrQ3xteUEQRqJyH+de1GRNXe/1ltOCS/xhMWuJ9KY=; b=ajalOSfuj4HR8q
	NtUTrK0rpFXlZTASzvpyk9n481Wk3Yz7Z1xZgXsmqQi9d7fbj8i7eC7H1eP2vKk2uLoFgMuheswGY
	oL4TscoyHXbaIvBvXNNLYiK9pwbyZOoMCxFIGaOAD0UaG/lM8LXYSXm8ra9xkf64ba8ARYCU63M2a
	OrJcHcVCuZ55jRzhNzh8PNY9fz5CIdRr73QY11fqaevU7Aj3KhdBY56QapJLVI4vX7uXcpnN3n86j
	eoOmM/fllAVGzwEi1U5UNfD5DexRlI/94mAV4Q12XRR2lnU8WmWzCoUD7Tu95PrhzfeLLLcfaUeex
	BwZcKhC6m9QmgEl+/LBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iezE2-0007cT-Me; Wed, 11 Dec 2019 10:28:10 +0000
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iezE0-0007bq-CI
 for linux-afs@lists.infradead.org; Wed, 11 Dec 2019 10:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576060087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3QfTiZcuCKcH+VjhtgFbzq1uB/NfPyi/hMtZJDy3xCo=;
 b=W5OqInREDFtELxd69pN0UYlUOplVIpkzMJ5tk22KiaCRijvGyH7Od96GCv1EILJIzErAl0
 ew7CFCC3CAYrSEhkuBgSDFTXYahZkoOwZ16Plg1yANTFYEiqZWt9sPXHDKf+xQG++h8wdM
 Pb8cGEfUoT00FkQWW6JsBkbQZHGeteg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-GXOlXKa2NHitpgclaQ6HeA-1; Wed, 11 Dec 2019 05:28:03 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93FDADB60;
 Wed, 11 Dec 2019 10:28:02 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-52.rdu2.redhat.com
 [10.10.120.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE95460BE1;
 Wed, 11 Dec 2019 10:28:01 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 4/8] afs: Fix mountpoint parsing
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 11 Dec 2019 10:28:00 +0000
Message-ID: <157606008092.21869.16860769067358629922.stgit@warthog.procyon.org.uk>
In-Reply-To: <157606006065.21869.6615813521356169209.stgit@warthog.procyon.org.uk>
References: <157606006065.21869.6615813521356169209.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: GXOlXKa2NHitpgclaQ6HeA-1
X-Mimecast-Spam-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_022808_502146_82D2BF09 
X-CRM114-Status: GOOD (  16.43  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [207.211.31.81 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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
Cc: dhowells@redhat.com, Jonathan Billings <jsbillings@jsbillings.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Each AFS mountpoint has strings that define the target to be mounted.  This
is required to end in a dot that is supposed to be stripped off.  The
string can include suffixes of ".readonly" or ".backup" - which are
supposed to come before the terminal dot.  To add to the confusion, the "fs
lsmount" afs utility does not show the terminal dot when displaying the
string.

The kernel mount source string parser, however, assumes that the terminal
dot marks the suffix and that the suffix is always "" and is thus ignored.
In most cases, there is no suffix and this is not a problem - but if there
is a suffix, it is lost and this affects the ability to mount the correct
volume.

The command line mount command, on the other hand, is expected not to
include a terminal dot - so the problem doesn't arise there.

Fix this by making sure that the dot exists and then stripping it when
passing the string to the mount configuration.

Fixes: bec5eb614130 ("AFS: Implement an autocell mount capability [ver #2]")
Reported-by: Jonathan Billings <jsbillings@jsbillings.org>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/mntpt.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/afs/mntpt.c b/fs/afs/mntpt.c
index f532d6d3bd28..79bc5f1338ed 100644
--- a/fs/afs/mntpt.c
+++ b/fs/afs/mntpt.c
@@ -126,7 +126,7 @@ static int afs_mntpt_set_params(struct fs_context *fc, struct dentry *mntpt)
 		if (src_as->cell)
 			ctx->cell = afs_get_cell(src_as->cell);
 
-		if (size > PAGE_SIZE - 1)
+		if (size < 2 || size > PAGE_SIZE - 1)
 			return -EINVAL;
 
 		page = read_mapping_page(d_inode(mntpt)->i_mapping, 0, NULL);
@@ -140,7 +140,9 @@ static int afs_mntpt_set_params(struct fs_context *fc, struct dentry *mntpt)
 		}
 
 		buf = kmap(page);
-		ret = vfs_parse_fs_string(fc, "source", buf, size);
+		ret = -EINVAL;
+		if (buf[size - 1] == '.')
+			ret = vfs_parse_fs_string(fc, "source", buf, size - 1);
 		kunmap(page);
 		put_page(page);
 		if (ret < 0)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
