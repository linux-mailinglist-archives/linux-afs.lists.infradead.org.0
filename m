Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C11331F4062
	for <lists+linux-afs@lfdr.de>; Tue,  9 Jun 2020 18:13:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+WwijPd8QbLbEOyXBK+q4uVgvetJlZggbw99ciOcag=; b=eahc4zCOUcXOui
	yUPH8sRpUSxzvG3TXGui43QnzBqRhIG9tOJ5gfBEnwnhxal0CaQgPqvtEALOlUv9cd9pV5VByiLsi
	SYgNzkR5hieFNSsA3eQOpvLZrPiJXR+UaCkoMj4ZXe9ZYXqPHE6+nVHYXyqVY4tVZTUjROUDDigD2
	1Gcq1+qvtE5nouaPor1Yz4QnC9CGRQI5JpBGYqP7iwQV3Avy7N9aTN1xAwySsa5Q+EwhgtfzrjgXR
	cBioi7bXyOfTrl9XuRNFohqT9Xp9iFAAS7J8Ar7SHVC5k46gcWLJhFnzs8qg1ViW5yX7S8NXFCTVy
	M9Ts50LMXTCArnqFfZeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jigsV-0000MH-5H; Tue, 09 Jun 2020 16:13:31 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jigsS-0000L6-1z
 for linux-afs@lists.infradead.org; Tue, 09 Jun 2020 16:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591719206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SPVVcRFgzz+szQgQMLyZwoek+uHNhgwrukerrAxYQdk=;
 b=XuMT19h2q4pL4lRoFLEv4eN8d8v0Xi0yw+oGfiMDtZynji1Oub/zi19XSPCZ6b/uWv/rXn
 KWKqF6cscW7mAbV3+NKMdrvI/hhF/FQ3cGyQ9wVi1/tqBFprYATvUAtOBIL5+EzItZPXA5
 ZbZmdwyK1wC6Lwdtnk2OuzcXA6uMBfQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-rbQADSm2NGKGPzs9WeSxVw-1; Tue, 09 Jun 2020 12:13:22 -0400
X-MC-Unique: rbQADSm2NGKGPzs9WeSxVw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66911835B40;
 Tue,  9 Jun 2020 16:13:21 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 748BA6298C;
 Tue,  9 Jun 2020 16:13:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 2/6] afs: Fix file locking
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Tue, 09 Jun 2020 17:13:19 +0100
Message-ID: <159171919967.3038039.17802563446058952615.stgit@warthog.procyon.org.uk>
In-Reply-To: <159171918506.3038039.10915051218779105094.stgit@warthog.procyon.org.uk>
References: <159171918506.3038039.10915051218779105094.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_091328_172436_7A46253E 
X-CRM114-Status: GOOD (  14.34  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.139.110.61 listed in wl.mailspike.net]
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
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Fix AFS file locking to use the correct vnode pointer and remove a member
of the afs_operation struct that is never set, but it is read and followed,
causing an oops.

This can be triggered by:

	flock -s /afs/example.com/foo sleep 1

when it calls the kernel to get a file lock.

Fixes: e49c7b2f6de7 ("afs: Build an abstraction around an "operation" concept")
Reported-by: Dave Botsch <botsch@cnf.cornell.edu>
Signed-off-by: David Howells <dhowells@redhat.com>
Tested-by: Dave Botsch <botsch@cnf.cornell.edu>
---

 fs/afs/flock.c    |    2 +-
 fs/afs/internal.h |    1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/afs/flock.c b/fs/afs/flock.c
index 70e518f7bc19..71eea2a908c7 100644
--- a/fs/afs/flock.c
+++ b/fs/afs/flock.c
@@ -71,7 +71,7 @@ static void afs_schedule_lock_extension(struct afs_vnode *vnode)
 void afs_lock_op_done(struct afs_call *call)
 {
 	struct afs_operation *op = call->op;
-	struct afs_vnode *vnode = op->lock.lvnode;
+	struct afs_vnode *vnode = op->file[0].vnode;
 
 	if (call->error == 0) {
 		spin_lock(&vnode->lock);
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index e1621b0670cc..519ffb104616 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -795,7 +795,6 @@ struct afs_operation {
 			struct afs_read *req;
 		} fetch;
 		struct {
-			struct afs_vnode *lvnode;	/* vnode being locked */
 			afs_lock_type_t type;
 		} lock;
 		struct {



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
