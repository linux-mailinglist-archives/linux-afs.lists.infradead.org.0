Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF761F4065
	for <lists+linux-afs@lfdr.de>; Tue,  9 Jun 2020 18:13:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ttf1+a8BYS2IuDpmQrl+a0fenvy+MN+VZIzHiMxfdWE=; b=aeBIgCEX3T4j9j
	i0HXRb8LczrZU9yLcRvNB9VZ+2dLs6iGsO/9BsupkyDGrMz7hsbPw/iux9YvQz1Tw0BXNy7f6UZEm
	OeTgTRYlWFWNrGI6Iv2zBF0ozlwvhzdI2Xfk3wTwn+ZXp22cUovYl9F9xcwFwUBzKdmP05p6Dh3HB
	c4iSeoQXFw9/iBXxTAkKwzEulwbKgoPn6VKLQqxs8JOp8E96MR2vVUJTgYQOpmA3GcoiM653grU8w
	40a+zlyBF38CjuNl9Lf0ZCHvjs/uRFxIhBjMvHSJM6UYYJz4GA7DZ7fJuXVzFVUGQA37Fekcr+Un9
	E66wVN8tU4De1+rNYmwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jigsg-0000RA-1p; Tue, 09 Jun 2020 16:13:42 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jigsd-0000Pd-12
 for linux-afs@lists.infradead.org; Tue, 09 Jun 2020 16:13:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591719218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U5NH97ZcwEvgcbggB5cCoStGuDG8xCBT7rh0SCpAdEE=;
 b=QBaLCWN2SAD/Ur71KEW98lUqBj2fc4RFbqOSFr9V1HLII44OjmYe0oMWH5sKA937g4e1tK
 SS+rnepxppRu3fZwmYCasVhPJXqp7dppSDHEklbSnF/wGp7PWO/LysbH7zsaCnJMYePK/G
 M0MWrES+K80mfyeR3LfiJ1QUWXCOtVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-wdOCNE_SOFmOVkJqu5AyHg-1; Tue, 09 Jun 2020 12:13:36 -0400
X-MC-Unique: wdOCNE_SOFmOVkJqu5AyHg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D3388014D4;
 Tue,  9 Jun 2020 16:13:35 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5982360C87;
 Tue,  9 Jun 2020 16:13:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 4/6] afs: Fix debugging statements with %px to be %p
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Tue, 09 Jun 2020 17:13:33 +0100
Message-ID: <159171921360.3038039.10494245358653942664.stgit@warthog.procyon.org.uk>
In-Reply-To: <159171918506.3038039.10915051218779105094.stgit@warthog.procyon.org.uk>
References: <159171918506.3038039.10915051218779105094.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_091339_166206_4897C490 
X-CRM114-Status: GOOD (  12.41  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [207.211.31.81 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
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
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Fix a couple of %px to be %x in debugging statements.

Fixes: e49c7b2f6de7 ("afs: Build an abstraction around an "operation" concept")
Fixes: 8a070a964877 ("afs: Detect cell aliases 1 - Cells with root volumes")
Reported-by: Kees Cook <keescook@chromium.org>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/dir.c      |    2 +-
 fs/afs/vl_alias.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index 25cbe0aeeec5..aa1d34141ea3 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -980,7 +980,7 @@ static struct dentry *afs_lookup(struct inode *dir, struct dentry *dentry,
 	if (!IS_ERR_OR_NULL(inode))
 		fid = AFS_FS_I(inode)->fid;
 
-	_debug("splice %px", dentry->d_inode);
+	_debug("splice %p", dentry->d_inode);
 	d = d_splice_alias(inode, dentry);
 	if (!IS_ERR_OR_NULL(d)) {
 		d->d_fsdata = dentry->d_fsdata;
diff --git a/fs/afs/vl_alias.c b/fs/afs/vl_alias.c
index 136fc6164e00..5082ef04e99c 100644
--- a/fs/afs/vl_alias.c
+++ b/fs/afs/vl_alias.c
@@ -28,7 +28,7 @@ static struct afs_volume *afs_sample_volume(struct afs_cell *cell, struct key *k
 	};
 
 	volume = afs_create_volume(&fc);
-	_leave(" = %px", volume);
+	_leave(" = %p", volume);
 	return volume;
 }
 



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
