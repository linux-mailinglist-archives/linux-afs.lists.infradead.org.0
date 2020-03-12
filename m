Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0B9183B7A
	for <lists+linux-afs@lfdr.de>; Thu, 12 Mar 2020 22:37:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IYQrgslUAP/PnWfAL8gKIKAawol15ZMwf1Brc7gfwIg=; b=jE17Eh6y8QX1Yw
	AV0snqPoxZggaT7EWq2jINfLqCXOTUN14rUfVB4W569KdZY5XgldgT5j9pGZ7gvS7MYaTKnCcHSVr
	G4/iGQ37GFM4m5IY/q16vqlr4b/tFgywj6D4ysXRGE2iviw3u9tA+0Y1MYTzJuvToB0SRzobhFnIq
	/gS9QG8WKPvxLZda53KLjDw5ADpXcQ9gPhE8VRV2vK1RJXDomvYVnuxvj3j/FxinqrW9fjDP58rEy
	jTVcBY1qOKe/riMz5wMsDE8gDE/DZUV/gxHKUnNID33AtlzAQOi0CMX0PPaOPLRSqO86Xk6A/C2cU
	TjvUEageCs8cEmCsPUig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCVVr-0000Nu-SI; Thu, 12 Mar 2020 21:37:07 +0000
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCVVo-0000Mc-DV
 for linux-afs@lists.infradead.org; Thu, 12 Mar 2020 21:37:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584049021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o0KJvs5Tn9ZRXYpDxYyGbc0Z0po25d7YTKzjpj8ERqU=;
 b=iS2bU8JtQtDB9jbEN7yXOX7R5oxdDQznTKOmFCktFl/JhAYnamTHc2/nxRPjNbPBezEli1
 240IAGrL1ux14CSYqGLD5rxXUsfc5o34Gps5eZr7Qs3eYeDytS6lwohnjxjwquM+cRtnb4
 FssrOw4Y079GkoH17jonFN/9w+wfe8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-jGvZjzwnPsqBl7sVisqPlA-1; Thu, 12 Mar 2020 17:36:57 -0400
X-MC-Unique: jGvZjzwnPsqBl7sVisqPlA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03599107ACC9;
 Thu, 12 Mar 2020 21:36:56 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-182.rdu2.redhat.com
 [10.10.120.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE89292D1C;
 Thu, 12 Mar 2020 21:36:54 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] afs: Use kfree_rcu() instead of casting kfree() to
 rcu_callback_t
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Date: Thu, 12 Mar 2020 21:36:53 +0000
Message-ID: <158404901390.1220563.13542240512778767032.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_143704_541336_1A5A63F6 
X-CRM114-Status: GOOD (  11.68  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
Cc: dhowells@redhat.com, linux-kernel@vger.kernel.org,
 linux-afs@lists.infradead.org, Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: Jann Horn <jannh@google.com>

afs_put_addrlist() casts kfree() to rcu_callback_t. Apart from being wrong
in theory, this might also blow up when people start enforcing function
types via compiler instrumentation, and it means the rcu_head has to be
first in struct afs_addr_list.

Use kfree_rcu() instead, it's simpler and more correct.

Signed-off-by: Jann Horn <jannh@google.com>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/addr_list.c |    2 +-
 fs/afs/internal.h  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/afs/addr_list.c b/fs/afs/addr_list.c
index df415c05939e..de1ae0bead3b 100644
--- a/fs/afs/addr_list.c
+++ b/fs/afs/addr_list.c
@@ -19,7 +19,7 @@
 void afs_put_addrlist(struct afs_addr_list *alist)
 {
 	if (alist && refcount_dec_and_test(&alist->usage))
-		call_rcu(&alist->rcu, (rcu_callback_t)kfree);
+		kfree_rcu(alist, rcu);
 }
 
 /*
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 1d81fc4c3058..35f951ac296f 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -81,7 +81,7 @@ enum afs_call_state {
  * List of server addresses.
  */
 struct afs_addr_list {
-	struct rcu_head		rcu;		/* Must be first */
+	struct rcu_head		rcu;
 	refcount_t		usage;
 	u32			version;	/* Version */
 	unsigned char		max_addrs;



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
