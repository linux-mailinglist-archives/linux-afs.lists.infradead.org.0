Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD4711A8E1
	for <lists+linux-afs@lfdr.de>; Wed, 11 Dec 2019 11:28:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OnGeVR7N6tyne4Oi2pN8RxmiV4wOVOYHL38uMFa4AHo=; b=cOMwv1rPSJWze0
	FLTz8mbaykg0QEwZZhkb4iBJPhuo+D3VFO53bV/w8/H387dQDJ9x7aJXO4SW3uSZOHtYP7Ejxnk4r
	K5svv7TIVmaon4sGMH4DqS0eAKJdCGAv/FfoDuZygUrG0pN/7uikdcC6Z2ruvyAbKDrg5uc7rr5Nl
	HJTsts15CQ6lOwixFgsgOs5azT6DeDwp+b3R9QHGs7X7JOK2qB/KqQl09dzqFNTyJXQtEFkRijvyj
	0aZPzEuSKMGWc4UqfAbhAhlFnVJQOkaArvxZRofTbVZgIAHclUyQuc8ASeS15sFfqlC2BBRAzfYL9
	X2+F2mRWq3Hxrmbf6kOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iezDu-0007ab-FQ; Wed, 11 Dec 2019 10:28:02 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iezDr-0007ZU-W6
 for linux-afs@lists.infradead.org; Wed, 11 Dec 2019 10:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576060078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c4SF3WqZ5J+usMWRpKtPwx9YglQMg4qMbI0BFoz1pRc=;
 b=OIzkMcW3Z1aUNUhHjoMX8cCXzjN6QLBSly0jO8O7YKtqVAAm+q2XkOvnkH+rzRwT+KRzHm
 SVKzKJBDF/tGJMKDFdiVDvVOeh1HdvhzxQWmJI00Exbs3HMafgSzuO2LYYDCZ5+B+KF8Fi
 wzF5wiLwSCo95mI466DBNY17GA36bCQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-BEPHuc8TOuGqB-UeAwMrYg-1; Wed, 11 Dec 2019 05:27:56 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD3E61005516
 for <linux-afs@lists.infradead.org>; Wed, 11 Dec 2019 10:27:55 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-52.rdu2.redhat.com
 [10.10.120.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E1B810013A1;
 Wed, 11 Dec 2019 10:27:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 3/8] afs: Backup and readonly volumes should be marked
 SB_RDONLY
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 11 Dec 2019 10:27:54 +0000
Message-ID: <157606007437.21869.13593699396947212760.stgit@warthog.procyon.org.uk>
In-Reply-To: <157606006065.21869.6615813521356169209.stgit@warthog.procyon.org.uk>
References: <157606006065.21869.6615813521356169209.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: BEPHuc8TOuGqB-UeAwMrYg-1
X-Mimecast-Spam-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_022800_114017_626D93C4 
X-CRM114-Status: GOOD (  10.78  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [207.211.31.120 listed in list.dnswl.org]
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
Cc: dhowells@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Fix the AFS mount code to mark superblocks for backup and readonly volumes
as being SB_RDONLY.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/super.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/afs/super.c b/fs/afs/super.c
index d9a6036b70b9..dbcdf7512bec 100644
--- a/fs/afs/super.c
+++ b/fs/afs/super.c
@@ -371,6 +371,9 @@ static int afs_validate_fc(struct fs_context *fc)
 			return -EDESTADDRREQ;
 		}
 
+		if (ctx->type != AFSVL_RWVOL)
+			fc->sb_flags |= SB_RDONLY;
+
 		/* We try to do the mount securely. */
 		key = afs_request_key(ctx->cell);
 		if (IS_ERR(key))


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
