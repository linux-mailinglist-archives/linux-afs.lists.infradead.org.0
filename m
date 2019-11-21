Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FD010557E
	for <lists+linux-afs@lfdr.de>; Thu, 21 Nov 2019 16:26:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ii/D54osu+UNffoCNH2Z/obhaOmFVcWnuTp36tQTmxU=; b=lg6+yYlj4r5inf
	xnE0x70VSWQhYXc4JBu4mB4jnPMJs1LNoWAxr6s0ovoCWYye0RKMBdHhHTfEAD02J/LixPc7YcSSq
	HymE9aKw0fJWpG1Xr+69w4Si5l2eri5A39BuWlSJKe1dYyskrPcoMJxF2pzbBYvgt18JcT2wDcnXv
	MryJnl23kS9zkPj2NY2O9fM8ifODVMbBBigZcIwv8hYgLdHI1YvVcJfkJIPobCl+sk42/5eicpQxH
	H4G6CLwo+V2soVWjDk09kuTBox9Y4zuS+9dSf6mu8fYtWtPoP8vuaI3UqXV+/coe62C9KF1r9QuEm
	TELlWdwiB4BDEfwbAG/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXoLs-0006KN-5u; Thu, 21 Nov 2019 15:26:36 +0000
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXoLo-0006H5-9N
 for linux-afs@lists.infradead.org; Thu, 21 Nov 2019 15:26:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574349986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1O8R3g+RY/ULKTfO6bXtG8ZXjTQs/NUP/a7VNwETFWY=;
 b=izo4QZryQIdzYfL5vk6WCO2ToT9ZuCbtbiv94sWBO53qnkiLiXM9LHl1mx31AmunCdP8jt
 +e229Tvn7YwUBYWdoNT/rdQqdVR72xcJloTQKGVXXkeE0do8lAqryUNMZ83hJTlr4OZyps
 Ee5Dsg2yhNJgo20I2WlRU+v+aVw/5LM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-6mxCoIUlPAS30GEnpQ80Eg-1; Thu, 21 Nov 2019 10:26:22 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBCD7477;
 Thu, 21 Nov 2019 15:26:20 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-161.rdu2.redhat.com
 [10.10.120.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 720CE60C23;
 Thu, 21 Nov 2019 15:26:19 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] afs: Fix possible assert with callbacks from yfs servers
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Date: Thu, 21 Nov 2019 15:26:15 +0000
Message-ID: <157434997544.8060.6772407595047113730.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 6mxCoIUlPAS30GEnpQ80Eg-1
X-Mimecast-Spam-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_072633_667678_3932FEC6 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [207.211.31.81 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: dhowells@redhat.com, marc.dionne@auristor.com,
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: Marc Dionne <marc.dionne@auristor.com>

Servers sending callback breaks to the YFS_CM_SERVICE service may
send up to YFSCBMAX (1024) fids in a single RPC.  Anything over
AFSCBMAX (50) will cause the assert in afs_break_callbacks to trigger.

Remove the assert, as the count has already been checked against
the appropriate max values in afs_deliver_cb_callback and
afs_deliver_yfs_cb_callback.

Fixes: 35dbfba3111a ("afs: Implement the YFS cache manager service")
Signed-off-by: Marc Dionne <marc.dionne@auristor.com>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/callback.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/afs/callback.c b/fs/afs/callback.c
index 6cdd7047c809..2dca8df1a18d 100644
--- a/fs/afs/callback.c
+++ b/fs/afs/callback.c
@@ -312,7 +312,6 @@ void afs_break_callbacks(struct afs_server *server, size_t count,
 	_enter("%p,%zu,", server, count);
 
 	ASSERT(server != NULL);
-	ASSERTCMP(count, <=, AFSCBMAX);
 
 	/* TODO: Sort the callback break list by volume ID */
 


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
