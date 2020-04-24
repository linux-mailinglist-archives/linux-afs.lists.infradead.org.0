Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2274D1B795A
	for <lists+linux-afs@lfdr.de>; Fri, 24 Apr 2020 17:20:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WXEiczQa8GqcpK5nfxhRA7MDK15dlLxVO2J1q3tdA2g=; b=bIcfD5RbJhKhjw
	mSvGs5VGIdv+Qqsb1AUhtvr+yHb7hi3ZdMDpdYbfATg+MHf5nqTDbLlNqRnjGtj7dp7WxrPCTpwYr
	Jf4of1OfqfEf4VAqHqcj2BGiY1EPcmeTvuHcnYxfkbQ8FggIZ2vNgC2etjn3pB7aappn04z8RbOf1
	3JTbFnqYaqAvi+swu6r118thta8r/Z4FKiC3bDQYEighwRP7L9EmVtAE7UEu8XYfFjcGegXSewDnI
	Uz1uf5jmBN2oVGDEljrXb9IcsBOIqjCvvi/hyHn46Du6W005bgXa8yiY3ifwRPO9y/HhtBlRTYsyW
	LarKywy9VyOT4uXMDh1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS07s-0005fH-R1
	for lists+linux-afs@lfdr.de; Fri, 24 Apr 2020 15:20:24 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS07p-0005c9-JA
 for linux-afs@lists.infradead.org; Fri, 24 Apr 2020 15:20:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587741620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bLArxLt5J+HGf6waK/sSvqkLaTxB3mfg5kFgnvOW+fI=;
 b=HzNH9iByZC9ucWuA+TFpqAp90Zc6AdUE5bH89qwKCL0ICY6/ShLqYV0e/+19493w0BxKGi
 WALzCEx8qf9TrbcLj8P4tMpo5fc2xua6DbHo7ZMOoDl5B+15maN9TDqULGXrj5ZhLP5i6E
 G277icluO04eQQLZNAADrXLR3EzCo8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-mCTsx_R4PL-hTT-7nDYHfQ-1; Fri, 24 Apr 2020 11:20:18 -0400
X-MC-Unique: mCTsx_R4PL-hTT-7nDYHfQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A92C8800D24;
 Fri, 24 Apr 2020 15:20:17 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-129.rdu2.redhat.com
 [10.10.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0DD96084A;
 Fri, 24 Apr 2020 15:20:16 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 4/8] afs: Fix to actually set AFS_SERVER_FL_HAVE_EPOCH
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 24 Apr 2020 16:20:16 +0100
Message-ID: <158774161611.3619859.10748767826695181897.stgit@warthog.procyon.org.uk>
In-Reply-To: <158774158625.3619859.10579201535876583842.stgit@warthog.procyon.org.uk>
References: <158774158625.3619859.10579201535876583842.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_082021_708523_B761CC10 
X-CRM114-Status: GOOD (  13.71  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
Cc: linux-fsdevel@vger.kernel.org, dhowells@redhat.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

AFS keeps track of the epoch value from the rxrpc protocol to note (a) when
a fileserver appears to have restarted and (b) when different endpoints of
a fileserver do not appear to be associated with the same fileserver
(ie. all probes back from a fileserver from all of its interfaces should
carry the same epoch).

However, the AFS_SERVER_FL_HAVE_EPOCH flag that indicates that we've
received the server's epoch is never set, though it is used.

Fix this to set the flag when we first receive an epoch value from a probe
sent to the filesystem client from the fileserver.

Fixes: 3bf0fb6f33dd ("afs: Probe multiple fileservers simultaneously")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/cmservice.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/afs/cmservice.c b/fs/afs/cmservice.c
index 6765949b3aab..380ad5ace7cf 100644
--- a/fs/afs/cmservice.c
+++ b/fs/afs/cmservice.c
@@ -169,7 +169,7 @@ static int afs_record_cm_probe(struct afs_call *call, struct afs_server *server)
 
 	spin_lock(&server->probe_lock);
 
-	if (!test_bit(AFS_SERVER_FL_HAVE_EPOCH, &server->flags)) {
+	if (!test_and_set_bit(AFS_SERVER_FL_HAVE_EPOCH, &server->flags)) {
 		server->cm_epoch = call->epoch;
 		server->probe.cm_epoch = call->epoch;
 		goto out;



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
