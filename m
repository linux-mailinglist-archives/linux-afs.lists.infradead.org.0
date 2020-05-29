Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1051E8AAD
	for <lists+linux-afs@lfdr.de>; Sat, 30 May 2020 00:01:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/4t8KVTqP/+kOVMnz/Bfl8Jgx5SE24tiG5swIuSrXk=; b=CmdT9IbfhsPp14
	YvZATadXHIgLu3FdUpeUzavZY51EtS8Y/Fz8HVYm4ED3TkDJfKX1OFeRUCxK3XH0nc2sAI3LcB8RB
	SWbMEGLuIycM90vUBIK6AF64sf5/WtBGMHHokQQ8JApHic4hqJNJFylKc2hv+LkxEBlY3L6wygtTi
	O2oqFvFmMWBjnAY5Txpl39FccEVUObnGGGGTKqhzmH+NprkqMBYI3sE886bFEoZ/b3Mq/tQfkyOdu
	982fChIHUCVCZDFO0lEMpo/qEWBOi4Y4WZ3gbgjdN1haiRok+HJWWuT6ZexftD52+Yba3fpEx+jLk
	c3h2DRvyrwMAg2PNwBbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jen4B-0001vZ-Dw; Fri, 29 May 2020 22:01:27 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jen47-0001uB-Di
 for linux-afs@lists.infradead.org; Fri, 29 May 2020 22:01:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590789682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GRBRuL/vWnUkM47Cj+YPhi2YIaYiqDzhyZR9Asny6vA=;
 b=Cw9LHugOMDy+/Lxghs9D6N8AAnc1QNnbTtv3OxYdHTMCG06/i5H/FMbGBOaRycq7VcEgz4
 cp7RBwBfnlyuoDiMIPclU/ejqiCndJvzuLYiISoz8ylOiHOoDrfeNx4jpbOFuOXEz2P6n6
 4PdoQMQCrTzWoJT74QxakNU8ftAhWRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-lPsatHIRO_e3mR8SKUpNGg-1; Fri, 29 May 2020 18:01:20 -0400
X-MC-Unique: lPsatHIRO_e3mR8SKUpNGg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C497E460;
 Fri, 29 May 2020 22:01:19 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A10FC7A8A5;
 Fri, 29 May 2020 22:01:18 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 10/27] afs: Set error flag rather than return error from file
 status decode
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 29 May 2020 23:01:17 +0100
Message-ID: <159078967785.679399.3550570253200143890.stgit@warthog.procyon.org.uk>
In-Reply-To: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
References: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_150123_616712_DF6C142C 
X-CRM114-Status: GOOD (  17.46  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.61 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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

Set a flag in the call struct to indicate an unmarshalling error rather
than return and handle an error from the decoding of file statuses.  This
flag is checked on a successful return from the delivery function.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/fsclient.c  |   88 +++++++++++++++-------------------------------------
 fs/afs/internal.h  |    1 +
 fs/afs/rxrpc.c     |    4 ++
 fs/afs/yfsclient.c |   85 +++++++++++++++-----------------------------------
 4 files changed, 55 insertions(+), 123 deletions(-)

diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index 401de063996c..b1d8d8f780d2 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -56,16 +56,15 @@ static void xdr_dump_bad(const __be32 *bp)
 /*
  * decode an AFSFetchStatus block
  */
-static int xdr_decode_AFSFetchStatus(const __be32 **_bp,
-				     struct afs_call *call,
-				     struct afs_status_cb *scb)
+static void xdr_decode_AFSFetchStatus(const __be32 **_bp,
+				      struct afs_call *call,
+				      struct afs_status_cb *scb)
 {
 	const struct afs_xdr_AFSFetchStatus *xdr = (const void *)*_bp;
 	struct afs_file_status *status = &scb->status;
 	bool inline_error = (call->operation_ID == afs_FS_InlineBulkStatus);
 	u64 data_version, size;
 	u32 type, abort_code;
-	int ret;
 
 	abort_code = ntohl(xdr->abort_code);
 
@@ -79,7 +78,7 @@ static int xdr_decode_AFSFetchStatus(const __be32 **_bp,
 			 */
 			status->abort_code = abort_code;
 			scb->have_error = true;
-			goto good;
+			goto advance;
 		}
 
 		pr_warn("Unknown AFSFetchStatus version %u\n", ntohl(xdr->if_version));
@@ -89,7 +88,7 @@ static int xdr_decode_AFSFetchStatus(const __be32 **_bp,
 	if (abort_code != 0 && inline_error) {
 		status->abort_code = abort_code;
 		scb->have_error = true;
-		goto good;
+		goto advance;
 	}
 
 	type = ntohl(xdr->type);
@@ -125,15 +124,13 @@ static int xdr_decode_AFSFetchStatus(const __be32 **_bp,
 	data_version |= (u64)ntohl(xdr->data_version_hi) << 32;
 	status->data_version = data_version;
 	scb->have_status = true;
-good:
-	ret = 0;
 advance:
 	*_bp = (const void *)*_bp + sizeof(*xdr);
-	return ret;
+	return;
 
 bad:
 	xdr_dump_bad(*_bp);
-	ret = afs_protocol_error(call, -EBADMSG, afs_eproto_bad_status);
+	afs_protocol_error(call, -EBADMSG, afs_eproto_bad_status);
 	goto advance;
 }
 
@@ -254,9 +251,7 @@ static int afs_deliver_fs_fetch_status_vnode(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
-	if (ret < 0)
-		return ret;
+	xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
 	xdr_decode_AFSCallBack(&bp, call, call->out_scb);
 	xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
@@ -419,9 +414,7 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 			return ret;
 
 		bp = call->buffer;
-		ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
-		if (ret < 0)
-			return ret;
+		xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
 		xdr_decode_AFSCallBack(&bp, call, call->out_scb);
 		xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
@@ -577,12 +570,8 @@ static int afs_deliver_fs_create_vnode(struct afs_call *call)
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
 	xdr_decode_AFSFid(&bp, call->out_fid);
-	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
-	if (ret < 0)
-		return ret;
-	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_dir_scb);
-	if (ret < 0)
-		return ret;
+	xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
+	xdr_decode_AFSFetchStatus(&bp, call, call->out_dir_scb);
 	xdr_decode_AFSCallBack(&bp, call, call->out_scb);
 	xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
@@ -691,9 +680,7 @@ static int afs_deliver_fs_dir_status_and_vol(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_dir_scb);
-	if (ret < 0)
-		return ret;
+	xdr_decode_AFSFetchStatus(&bp, call, call->out_dir_scb);
 	xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
@@ -784,12 +771,8 @@ static int afs_deliver_fs_link(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
-	if (ret < 0)
-		return ret;
-	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_dir_scb);
-	if (ret < 0)
-		return ret;
+	xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
+	xdr_decode_AFSFetchStatus(&bp, call, call->out_dir_scb);
 	xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
@@ -878,12 +861,8 @@ static int afs_deliver_fs_symlink(struct afs_call *call)
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
 	xdr_decode_AFSFid(&bp, call->out_fid);
-	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
-	if (ret < 0)
-		return ret;
-	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_dir_scb);
-	if (ret < 0)
-		return ret;
+	xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
+	xdr_decode_AFSFetchStatus(&bp, call, call->out_dir_scb);
 	xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
@@ -986,16 +965,12 @@ static int afs_deliver_fs_rename(struct afs_call *call)
 	if (ret < 0)
 		return ret;
 
+	bp = call->buffer;
 	/* If the two dirs are the same, we have two copies of the same status
 	 * report, so we just decode it twice.
 	 */
-	bp = call->buffer;
-	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_dir_scb);
-	if (ret < 0)
-		return ret;
-	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
-	if (ret < 0)
-		return ret;
+	xdr_decode_AFSFetchStatus(&bp, call, call->out_dir_scb);
+	xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
 	xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
@@ -1103,9 +1078,7 @@ static int afs_deliver_fs_store_data(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
-	if (ret < 0)
-		return ret;
+	xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
 	xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
@@ -1283,9 +1256,7 @@ static int afs_deliver_fs_store_status(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
-	if (ret < 0)
-		return ret;
+	xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
 	xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
@@ -1952,9 +1923,7 @@ static int afs_deliver_fs_fetch_status(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
-	if (ret < 0)
-		return ret;
+	xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
 	xdr_decode_AFSCallBack(&bp, call, call->out_scb);
 	xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
@@ -2060,10 +2029,7 @@ static int afs_deliver_fs_inline_bulk_status(struct afs_call *call)
 
 		bp = call->buffer;
 		scb = &call->out_scb[call->count];
-		ret = xdr_decode_AFSFetchStatus(&bp, call, scb);
-		if (ret < 0)
-			return ret;
-
+		xdr_decode_AFSFetchStatus(&bp, call, scb);
 		call->count++;
 		if (call->count < call->count2)
 			goto more_counts;
@@ -2241,9 +2207,7 @@ static int afs_deliver_fs_fetch_acl(struct afs_call *call)
 			return ret;
 
 		bp = call->buffer;
-		ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
-		if (ret < 0)
-			return ret;
+		xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
 		xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
 		call->unmarshall++;
@@ -2324,9 +2288,7 @@ static int afs_deliver_fs_file_status_and_vol(struct afs_call *call)
 		return ret;
 
 	bp = call->buffer;
-	ret = xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
-	if (ret < 0)
-		return ret;
+	xdr_decode_AFSFetchStatus(&bp, call, call->out_scb);
 	xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index b6665fc5d355..6d5c66dd76de 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -160,6 +160,7 @@ struct afs_call {
 	bool			upgrade;	/* T to request service upgrade */
 	bool			have_reply_time; /* T if have got reply_time */
 	bool			intr;		/* T if interruptible */
+	bool			unmarshalling_error; /* T if an unmarshalling error occurred */
 	u16			service_id;	/* Actual service ID (after upgrade) */
 	unsigned int		debug_id;	/* Trace ID */
 	u32			operation_ID;	/* operation ID for an incoming call */
diff --git a/fs/afs/rxrpc.c b/fs/afs/rxrpc.c
index ab2962fff1fb..c84d571782d7 100644
--- a/fs/afs/rxrpc.c
+++ b/fs/afs/rxrpc.c
@@ -540,6 +540,8 @@ static void afs_deliver_to_call(struct afs_call *call)
 
 		ret = call->type->deliver(call);
 		state = READ_ONCE(call->state);
+		if (ret == 0 && call->unmarshalling_error)
+			ret = -EBADMSG;
 		switch (ret) {
 		case 0:
 			afs_queue_call_work(call);
@@ -963,5 +965,7 @@ noinline int afs_protocol_error(struct afs_call *call, int error,
 				enum afs_eproto_cause cause)
 {
 	trace_afs_protocol_error(call, error, cause);
+	if (call)
+		call->unmarshalling_error = true;
 	return error;
 }
diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index fe413e7a5cf4..f118daa5f33a 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -179,21 +179,20 @@ static void xdr_dump_bad(const __be32 *bp)
 /*
  * Decode a YFSFetchStatus block
  */
-static int xdr_decode_YFSFetchStatus(const __be32 **_bp,
-				     struct afs_call *call,
-				     struct afs_status_cb *scb)
+static void xdr_decode_YFSFetchStatus(const __be32 **_bp,
+				      struct afs_call *call,
+				      struct afs_status_cb *scb)
 {
 	const struct yfs_xdr_YFSFetchStatus *xdr = (const void *)*_bp;
 	struct afs_file_status *status = &scb->status;
 	u32 type;
-	int ret;
 
 	status->abort_code = ntohl(xdr->abort_code);
 	if (status->abort_code != 0) {
 		if (status->abort_code == VNOVNODE)
 			status->nlink = 0;
 		scb->have_error = true;
-		goto good;
+		goto advance;
 	}
 
 	type = ntohl(xdr->type);
@@ -221,15 +220,13 @@ static int xdr_decode_YFSFetchStatus(const __be32 **_bp,
 	status->size		= xdr_to_u64(xdr->size);
 	status->data_version	= xdr_to_u64(xdr->data_version);
 	scb->have_status	= true;
-good:
-	ret = 0;
 advance:
 	*_bp += xdr_size(xdr);
-	return ret;
+	return;
 
 bad:
 	xdr_dump_bad(*_bp);
-	ret = afs_protocol_error(call, -EBADMSG, afs_eproto_bad_status);
+	afs_protocol_error(call, -EBADMSG, afs_eproto_bad_status);
 	goto advance;
 }
 
@@ -348,9 +345,7 @@ static int yfs_deliver_fs_status_cb_and_volsync(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
-	if (ret < 0)
-		return ret;
+	xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
 	xdr_decode_YFSCallBack(&bp, call, call->out_scb);
 	xdr_decode_YFSVolSync(&bp, call->out_volsync);
 
@@ -372,9 +367,7 @@ static int yfs_deliver_status_and_volsync(struct afs_call *call)
 		return ret;
 
 	bp = call->buffer;
-	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
-	if (ret < 0)
-		return ret;
+	xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
 	xdr_decode_YFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
@@ -534,9 +527,7 @@ static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 			return ret;
 
 		bp = call->buffer;
-		ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
-		if (ret < 0)
-			return ret;
+		xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
 		xdr_decode_YFSCallBack(&bp, call, call->out_scb);
 		xdr_decode_YFSVolSync(&bp, call->out_volsync);
 
@@ -644,12 +635,8 @@ static int yfs_deliver_fs_create_vnode(struct afs_call *call)
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
 	xdr_decode_YFSFid(&bp, call->out_fid);
-	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
-	if (ret < 0)
-		return ret;
-	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
-	if (ret < 0)
-		return ret;
+	xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
+	xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
 	xdr_decode_YFSCallBack(&bp, call, call->out_scb);
 	xdr_decode_YFSVolSync(&bp, call->out_volsync);
 
@@ -802,14 +789,9 @@ static int yfs_deliver_fs_remove_file2(struct afs_call *call)
 		return ret;
 
 	bp = call->buffer;
-	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
-	if (ret < 0)
-		return ret;
-
+	xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
 	xdr_decode_YFSFid(&bp, &fid);
-	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
-	if (ret < 0)
-		return ret;
+	xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
 	/* Was deleted if vnode->status.abort_code == VNOVNODE. */
 
 	xdr_decode_YFSVolSync(&bp, call->out_volsync);
@@ -889,10 +871,7 @@ static int yfs_deliver_fs_remove(struct afs_call *call)
 		return ret;
 
 	bp = call->buffer;
-	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
-	if (ret < 0)
-		return ret;
-
+	xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
 	xdr_decode_YFSVolSync(&bp, call->out_volsync);
 	return 0;
 }
@@ -974,12 +953,8 @@ static int yfs_deliver_fs_link(struct afs_call *call)
 		return ret;
 
 	bp = call->buffer;
-	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
-	if (ret < 0)
-		return ret;
-	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
-	if (ret < 0)
-		return ret;
+	xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
+	xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
 	xdr_decode_YFSVolSync(&bp, call->out_volsync);
 	_leave(" = 0 [done]");
 	return 0;
@@ -1061,12 +1036,8 @@ static int yfs_deliver_fs_symlink(struct afs_call *call)
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
 	xdr_decode_YFSFid(&bp, call->out_fid);
-	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
-	if (ret < 0)
-		return ret;
-	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
-	if (ret < 0)
-		return ret;
+	xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
+	xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
 	xdr_decode_YFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
@@ -1154,13 +1125,11 @@ static int yfs_deliver_fs_rename(struct afs_call *call)
 		return ret;
 
 	bp = call->buffer;
-	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
-	if (ret < 0)
-		return ret;
-	ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
-	if (ret < 0)
-		return ret;
-
+	/* If the two dirs are the same, we have two copies of the same status
+	 * report, so we just decode it twice.
+	 */
+	xdr_decode_YFSFetchStatus(&bp, call, call->out_dir_scb);
+	xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
 	xdr_decode_YFSVolSync(&bp, call->out_volsync);
 	_leave(" = 0 [done]");
 	return 0;
@@ -1845,9 +1814,7 @@ static int yfs_deliver_fs_inline_bulk_status(struct afs_call *call)
 
 		bp = call->buffer;
 		scb = &call->out_scb[call->count];
-		ret = xdr_decode_YFSFetchStatus(&bp, call, scb);
-		if (ret < 0)
-			return ret;
+		xdr_decode_YFSFetchStatus(&bp, call, scb);
 
 		call->count++;
 		if (call->count < call->count2)
@@ -2067,9 +2034,7 @@ static int yfs_deliver_fs_fetch_opaque_acl(struct afs_call *call)
 		bp = call->buffer;
 		yacl->inherit_flag = ntohl(*bp++);
 		yacl->num_cleaned = ntohl(*bp++);
-		ret = xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
-		if (ret < 0)
-			return ret;
+		xdr_decode_YFSFetchStatus(&bp, call, call->out_scb);
 		xdr_decode_YFSVolSync(&bp, call->out_volsync);
 
 		call->unmarshall++;



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
