Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA3D11A8E0
	for <lists+linux-afs@lfdr.de>; Wed, 11 Dec 2019 11:28:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJXvC3qVcpXEkDjOCB0mC/Og4hVE2nYxPIUwtnZAGLQ=; b=D5W8HD7RBXU1rM
	ebmALRs53aA3wYog4yssM1j1Lkv0l9HBVgG6OJUpl+b1zEOB7RuAHgHafmC8hGjTnqezfvMWqXAxi
	p6zRIjNBVDTcEW+TmSjMNEgh8PBpNuBfX3LiePspx56i3SKesSdKPdzZSgy2XCbvc93FEN4XlTUR1
	qCaxV2tJ2aKlhENlVqigqB7xYvpDiTvzpzCiZVnrNgAllC+KrZHAsNAjQ818h7stD9hE++S/i7CA2
	eMb5cod+ROvG7fd9KliCW6g0729IlpoVM+ov3MDvRn8W0t/j6Db9cygYQXFLrpeWNFl7TW2aM0sc+
	ju7spXeD8Ec+oQKvlUFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iezDp-0007YX-6D; Wed, 11 Dec 2019 10:27:57 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iezDl-0007X9-Tz
 for linux-afs@lists.infradead.org; Wed, 11 Dec 2019 10:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576060072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hm6dEMqLmR2mPUC6qUoTwYnpBwWDphm54SqO3q6FRrk=;
 b=fQL+8v29wMduJ9Pnop0/m/3UiCYocN2jfERIm1rSLarBm7tK22KkSCEJ80vly3X42sezTo
 eS+YPyY0+iXWryhNG7wsUCgiZrYBAO3IXmCxbssSw6XtteHt8Y5Ctue2fscYHuJ39bB8Ss
 mc89AeuZ2a2s6iWrpVGrSxWreVeWEfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-9wzdE_EeNn6lgmdrJ1GzzQ-1; Wed, 11 Dec 2019 05:27:50 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25BBC107ACC5;
 Wed, 11 Dec 2019 10:27:49 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-52.rdu2.redhat.com
 [10.10.120.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 537405D6AE;
 Wed, 11 Dec 2019 10:27:48 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 2/8] afs: Fix SELinux setting security label on /afs
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 11 Dec 2019 10:27:47 +0000
Message-ID: <157606006753.21869.7998834848686645767.stgit@warthog.procyon.org.uk>
In-Reply-To: <157606006065.21869.6615813521356169209.stgit@warthog.procyon.org.uk>
References: <157606006065.21869.6615813521356169209.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 9wzdE_EeNn6lgmdrJ1GzzQ-1
X-Mimecast-Spam-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_022754_041344_33C9E358 
X-CRM114-Status: GOOD (  11.17  )
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
Cc: selinux@vger.kernel.org, dhowells@redhat.com,
 linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Make the AFS dynamic root superblock R/W so that SELinux can set the
security label on it.  Without this, upgrades to, say, the Fedora
filesystem-afs RPM fail if afs is mounted on it because the SELinux label
can't be (re-)applied.

It might be better to make it possible to bypass the R/O check for LSM
label application through setxattr.

Fixes: 4d673da14533 ("afs: Support the AFS dynamic root")
Signed-off-by: David Howells <dhowells@redhat.com>
cc: selinux@vger.kernel.org
cc: linux-security-module@vger.kernel.org
---

 fs/afs/super.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/afs/super.c b/fs/afs/super.c
index 488641b1a418..d9a6036b70b9 100644
--- a/fs/afs/super.c
+++ b/fs/afs/super.c
@@ -448,7 +448,6 @@ static int afs_fill_super(struct super_block *sb, struct afs_fs_context *ctx)
 	/* allocate the root inode and dentry */
 	if (as->dyn_root) {
 		inode = afs_iget_pseudo_dir(sb, true);
-		sb->s_flags	|= SB_RDONLY;
 	} else {
 		sprintf(sb->s_id, "%llu", as->volume->vid);
 		afs_activate_volume(as->volume);


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
