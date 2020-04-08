Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E511A27BF
	for <lists+linux-afs@lfdr.de>; Wed,  8 Apr 2020 19:10:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9VeOSwRCwZT2frk22CBqbmQR+3GShKnJ/Ee5r26vwKE=; b=RTDkt6zl7CF7vE
	W5aj7dvMtMHRNtGJqf2gT41RMoTJSNy5TmEJ6/W5JKgKE1e0UN7H+Tu3rR61WPl/gK+Pi7sHcwWp4
	lit00E6MfQ7ngLXkSrGJku3WBrIO198QnNukUDUNE8gTN1WfSKsFDV/BW70UHRSCtSmSYzQEk3KTa
	8BMEcLDpNBM/I0w6lTeqt7tgTLs6SKhYmMACmtLBYNi/cHabfgN0aBD44w6CXR78w7ZWusIhnNONy
	xomZcTh8To7I+1osMsKEyC97xEEGQWXqKk8tuKxiF7GqC7RARg0D8zwvjNtobazelN/Rc+o1ei7KX
	JyFYJAPUtLIPhgDl+3yQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMECz-0001jd-Py; Wed, 08 Apr 2020 17:09:49 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMECx-0001jA-FQ
 for linux-afs@lists.infradead.org; Wed, 08 Apr 2020 17:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586365785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CUYTQPBT4tkxqHofDIJKxZKn0bkQHb5VK3fTWRGO+iw=;
 b=hfRnOoK3RVeywjz6yiKtgmZr+ajnQYf2sTCFd+Z8KqehctMRmacgOVKDLcWfB/dg/rIKwo
 g9tK6dyw+ZMPrXOHq/Q4u+IkNDoog9EX4XuJJhs+pBkHtKZRn4jX5uVum5qSruaemfN81z
 B/togw8uGgSGk68L/VOQBzdFsTtO7EQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-wbrNCRHpOWi_HjwhaISveA-1; Wed, 08 Apr 2020 13:09:43 -0400
X-MC-Unique: wbrNCRHpOWi_HjwhaISveA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FDAC8017FD;
 Wed,  8 Apr 2020 17:09:42 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-224.rdu2.redhat.com
 [10.10.112.224])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AF3EC0D81;
 Wed,  8 Apr 2020 17:09:41 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 1/2] afs: Fix missing XDR advance in
 xdr_decode_{AFS,YFS}FSFetchStatus()
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 08 Apr 2020 18:09:40 +0100
Message-ID: <158636578058.1104632.13067508192406964998.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200408_100947_606730_CC8FB865 
X-CRM114-Status: GOOD (  13.57  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: dhowells@redhat.com, marc.dionne@auristor.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

If we receive a status record that has VNOVNODE set in the abort field,
xdr_decode_AFSFetchStatus() and xdr_decode_YFSFetchStatus() don't advance
the XDR pointer, thereby applying the apparent deletion to all of the
remaining vnodes in the list.  The subsequent callback and volsync records
will then be corrupted by reading the wrong data.

This affects AFS.InlineBulkStatus, YFS.InlineBulkStatus operation and
YFS.RemoveFile2 operations.

Fix this by unconditionally advancing the xdr pointer.

Signed-off-by: David Howells <dhowells@redhat.com>
Fixes: 684b0f68cf1c ("afs: Fix AFSFetchStatus decoder to provide OpenAFS compatibility")
---

 fs/afs/fsclient.c  |   14 +++++++++-----
 fs/afs/yfsclient.c |   12 ++++++++----
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index 1f9c5d8e6fe5..fae73e13976a 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -65,6 +65,7 @@ static int xdr_decode_AFSFetchStatus(const __be32 **_bp,
 	bool inline_error = (call->operation_ID == afs_FS_InlineBulkStatus);
 	u64 data_version, size;
 	u32 type, abort_code;
+	int ret;
 
 	abort_code = ntohl(xdr->abort_code);
 
@@ -78,7 +79,7 @@ static int xdr_decode_AFSFetchStatus(const __be32 **_bp,
 			 */
 			status->abort_code = abort_code;
 			scb->have_error = true;
-			return 0;
+			goto good;
 		}
 
 		pr_warn("Unknown AFSFetchStatus version %u\n", ntohl(xdr->if_version));
@@ -87,7 +88,7 @@ static int xdr_decode_AFSFetchStatus(const __be32 **_bp,
 
 	if (abort_code != 0 && inline_error) {
 		status->abort_code = abort_code;
-		return 0;
+		goto good;
 	}
 
 	type = ntohl(xdr->type);
@@ -123,13 +124,16 @@ static int xdr_decode_AFSFetchStatus(const __be32 **_bp,
 	data_version |= (u64)ntohl(xdr->data_version_hi) << 32;
 	status->data_version = data_version;
 	scb->have_status = true;
-
+good:
+	ret = 0;
+advance:
 	*_bp = (const void *)*_bp + sizeof(*xdr);
-	return 0;
+	return ret;
 
 bad:
 	xdr_dump_bad(*_bp);
-	return afs_protocol_error(call, -EBADMSG, afs_eproto_bad_status);
+	ret = afs_protocol_error(call, -EBADMSG, afs_eproto_bad_status);
+	goto advance;
 }
 
 static time64_t xdr_decode_expiry(struct afs_call *call, u32 expiry)
diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index a26126ac7bf1..a0f7c3186645 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -186,13 +186,14 @@ static int xdr_decode_YFSFetchStatus(const __be32 **_bp,
 	const struct yfs_xdr_YFSFetchStatus *xdr = (const void *)*_bp;
 	struct afs_file_status *status = &scb->status;
 	u32 type;
+	int ret;
 
 	status->abort_code = ntohl(xdr->abort_code);
 	if (status->abort_code != 0) {
 		if (status->abort_code == VNOVNODE)
 			status->nlink = 0;
 		scb->have_error = true;
-		return 0;
+		goto good;
 	}
 
 	type = ntohl(xdr->type);
@@ -220,13 +221,16 @@ static int xdr_decode_YFSFetchStatus(const __be32 **_bp,
 	status->size		= xdr_to_u64(xdr->size);
 	status->data_version	= xdr_to_u64(xdr->data_version);
 	scb->have_status	= true;
-
+good:
+	ret = 0;
+advance:
 	*_bp += xdr_size(xdr);
-	return 0;
+	return ret;
 
 bad:
 	xdr_dump_bad(*_bp);
-	return afs_protocol_error(call, -EBADMSG, afs_eproto_bad_status);
+	ret = afs_protocol_error(call, -EBADMSG, afs_eproto_bad_status);
+	goto advance;
 }
 
 /*



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
