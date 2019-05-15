Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0906A1FC1A
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 23:09:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B7/0bvlloTR4wxmeG0zpw4u3/llmtF0MP3GHxgA09h4=; b=VY8MbsyO5XK47B
	+Kps4oeih4Xq7uwlqHrkaqwIMyi7WXopDj8qjXw5x75ACCLsjZ9AAJV15miAtuB1c9UXNKnoJLJ9f
	Ix2ej6BHZMr7z5afDLgrY/uUWbpx5+NVW+cruKeDFngbohFf/G8Ee+aaJCAEIyMNGheLAL2ibY6hT
	49Xo7fKAA8xrMSi3d2QCMfmUuROnVTaFX4rqqNtMhU26SN2+V+8cv8VZYX7+LALBSRvm0YkwGhLn/
	uw7Jv7RgqGBxlqyBimsDfWldGC2UZBeqyAnPi9NPy2o2O6tlWDzz5c3Vu8BuRLUuDI33G/YlSVMFe
	C3q6I8fLMdq9Ty9PJCag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hR19L-0006a3-Nh; Wed, 15 May 2019 21:09:19 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hR0yz-0002oV-40
 for linux-afs@lists.infradead.org; Wed, 15 May 2019 20:58:41 +0000
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DBC783082B46;
 Wed, 15 May 2019 20:58:36 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4EE762667;
 Wed, 15 May 2019 20:58:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 02/12] afs: Get rid of afs_call::reply[]
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 15 May 2019 21:58:34 +0100
Message-ID: <155795391416.28355.16992553812228405622.stgit@warthog.procyon.org.uk>
In-Reply-To: <155795389933.28355.4028912870853910492.stgit@warthog.procyon.org.uk>
References: <155795389933.28355.4028912870853910492.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Wed, 15 May 2019 20:58:36 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_135837_230922_BD3637F6 
X-CRM114-Status: GOOD (  18.90  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Mailman-Approved-At: Wed, 15 May 2019 14:09:18 -0700
X-BeenThere: linux-afs@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Cc: dhowells@redhat.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Replace the afs_call::reply[] array with a bunch of typed members so that
the compiler can use type-checking on them.  It's also easier for the eye
to see what's going on.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/cmservice.c |   14 +--
 fs/afs/file.c      |    2 
 fs/afs/flock.c     |    2 
 fs/afs/fs_probe.c  |    4 -
 fs/afs/fsclient.c  |  287 ++++++++++++++++++++++++++--------------------------
 fs/afs/internal.h  |   24 ++++
 fs/afs/rxrpc.c     |    9 +-
 fs/afs/vl_probe.c  |    4 -
 fs/afs/vlclient.c  |   33 ++----
 fs/afs/yfsclient.c |  217 ++++++++++++++++++---------------------
 10 files changed, 293 insertions(+), 303 deletions(-)

diff --git a/fs/afs/cmservice.c b/fs/afs/cmservice.c
index 748090014519..01437cfe5432 100644
--- a/fs/afs/cmservice.c
+++ b/fs/afs/cmservice.c
@@ -213,7 +213,7 @@ static int afs_find_cm_server_by_peer(struct afs_call *call)
 		return 0;
 	}
 
-	call->cm_server = server;
+	call->server = server;
 	return afs_record_cm_probe(call, server);
 }
 
@@ -234,7 +234,7 @@ static int afs_find_cm_server_by_uuid(struct afs_call *call,
 		return 0;
 	}
 
-	call->cm_server = server;
+	call->server = server;
 	return afs_record_cm_probe(call, server);
 }
 
@@ -260,8 +260,8 @@ static void SRXAFSCB_CallBack(struct work_struct *work)
 	 * server holds up change visibility till it receives our reply so as
 	 * to maintain cache coherency.
 	 */
-	if (call->cm_server)
-		afs_break_callbacks(call->cm_server, call->count, call->request);
+	if (call->server)
+		afs_break_callbacks(call->server, call->count, call->request);
 
 	afs_send_empty_reply(call);
 	afs_put_call(call);
@@ -376,10 +376,10 @@ static void SRXAFSCB_InitCallBackState(struct work_struct *work)
 {
 	struct afs_call *call = container_of(work, struct afs_call, work);
 
-	_enter("{%p}", call->cm_server);
+	_enter("{%p}", call->server);
 
-	if (call->cm_server)
-		afs_init_callback_state(call->cm_server);
+	if (call->server)
+		afs_init_callback_state(call->server);
 	afs_send_empty_reply(call);
 	afs_put_call(call);
 	_leave("");
diff --git a/fs/afs/file.c b/fs/afs/file.c
index f59c6149fa02..415c84dddb89 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -408,7 +408,7 @@ static int afs_readpage(struct file *file, struct page *page)
 static void afs_readpages_page_done(struct afs_call *call, struct afs_read *req)
 {
 #ifdef CONFIG_AFS_FSCACHE
-	struct afs_vnode *vnode = call->reply[0];
+	struct afs_vnode *vnode = call->xvnode;
 #endif
 	struct page *page = req->pages[req->index];
 
diff --git a/fs/afs/flock.c b/fs/afs/flock.c
index c91cd201013f..ce8275940b99 100644
--- a/fs/afs/flock.c
+++ b/fs/afs/flock.c
@@ -74,7 +74,7 @@ static void afs_schedule_lock_extension(struct afs_vnode *vnode)
  */
 void afs_lock_op_done(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->reply[0];
+	struct afs_vnode *vnode = call->xvnode;
 
 	if (call->error == 0) {
 		spin_lock(&vnode->lock);
diff --git a/fs/afs/fs_probe.c b/fs/afs/fs_probe.c
index 5d3abde52a0f..9b7266209343 100644
--- a/fs/afs/fs_probe.c
+++ b/fs/afs/fs_probe.c
@@ -33,8 +33,8 @@ static bool afs_fs_probe_done(struct afs_server *server)
 void afs_fileserver_probe_result(struct afs_call *call)
 {
 	struct afs_addr_list *alist = call->alist;
-	struct afs_server *server = call->reply[0];
-	unsigned int server_index = (long)call->reply[1];
+	struct afs_server *server = call->server;
+	unsigned int server_index = call->server_index;
 	unsigned int index = call->addr_ix;
 	unsigned int rtt = UINT_MAX;
 	bool have_result = false;
diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index 80948af115d4..d1ea674a5c2a 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -392,7 +392,7 @@ static void xdr_decode_AFSFetchVolumeStatus(const __be32 **_bp,
  */
 static int afs_deliver_fs_fetch_status_vnode(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->reply[0];
+	struct afs_vnode *vnode = call->xvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -409,7 +409,7 @@ static int afs_deliver_fs_fetch_status_vnode(struct afs_call *call)
 	if (ret < 0)
 		return ret;
 	xdr_decode_AFSCallBack(call, vnode, &bp);
-	xdr_decode_AFSVolSync(&bp, call->reply[1]);
+	xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -450,8 +450,8 @@ int afs_fs_fetch_file_status(struct afs_fs_cursor *fc, struct afs_volsync *volsy
 	}
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
-	call->reply[1] = volsync;
+	call->xvnode = vnode;
+	call->out_volsync = volsync;
 	call->expected_version = new_inode ? 1 : vnode->status.data_version;
 	call->want_reply_time = true;
 
@@ -476,8 +476,8 @@ int afs_fs_fetch_file_status(struct afs_fs_cursor *fc, struct afs_volsync *volsy
  */
 static int afs_deliver_fs_fetch_data(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->reply[0];
-	struct afs_read *req = call->reply[2];
+	struct afs_vnode *vnode = call->xvnode;
+	struct afs_read *req = call->read_request;
 	const __be32 *bp;
 	unsigned int size;
 	int ret;
@@ -578,7 +578,7 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 		if (ret < 0)
 			return ret;
 		xdr_decode_AFSCallBack(call, vnode, &bp);
-		xdr_decode_AFSVolSync(&bp, call->reply[1]);
+		xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
 		call->unmarshall++;
 
@@ -601,7 +601,7 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 
 static void afs_fetch_data_destructor(struct afs_call *call)
 {
-	struct afs_read *req = call->reply[2];
+	struct afs_read *req = call->read_request;
 
 	afs_put_read(req);
 	afs_flat_call_destructor(call);
@@ -641,9 +641,9 @@ static int afs_fs_fetch_data64(struct afs_fs_cursor *fc, struct afs_read *req)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
-	call->reply[1] = NULL; /* volsync */
-	call->reply[2] = req;
+	call->xvnode = vnode;
+	call->out_volsync = NULL;
+	call->read_request = req;
 	call->expected_version = vnode->status.data_version;
 	call->want_reply_time = true;
 
@@ -692,9 +692,9 @@ int afs_fs_fetch_data(struct afs_fs_cursor *fc, struct afs_read *req)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
-	call->reply[1] = NULL; /* volsync */
-	call->reply[2] = req;
+	call->xvnode = vnode;
+	call->out_volsync = NULL;
+	call->read_request = req;
 	call->expected_version = vnode->status.data_version;
 	call->want_reply_time = true;
 
@@ -721,7 +721,7 @@ int afs_fs_fetch_data(struct afs_fs_cursor *fc, struct afs_read *req)
  */
 static int afs_deliver_fs_create_vnode(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->reply[0];
+	struct afs_vnode *dvnode = call->dvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -733,16 +733,16 @@ static int afs_deliver_fs_create_vnode(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	xdr_decode_AFSFid(&bp, call->reply[1]);
-	ret = afs_decode_status(call, &bp, call->reply[2], NULL, NULL, NULL);
+	xdr_decode_AFSFid(&bp, call->out_fid);
+	ret = afs_decode_status(call, &bp, call->out_extra_status, NULL, NULL, NULL);
 	if (ret < 0)
 		return ret;
-	ret = afs_decode_status(call, &bp, &vnode->status, vnode,
+	ret = afs_decode_status(call, &bp, &dvnode->status, dvnode,
 				&call->expected_version, NULL);
 	if (ret < 0)
 		return ret;
-	xdr_decode_AFSCallBack_raw(call, call->reply[3], &bp);
-	/* xdr_decode_AFSVolSync(&bp, call->reply[X]); */
+	xdr_decode_AFSCallBack_raw(call, call->out_cb, &bp);
+	xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -776,9 +776,9 @@ int afs_fs_create(struct afs_fs_cursor *fc,
 		  struct afs_file_status *newstatus,
 		  struct afs_callback *newcb)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode *dvnode = fc->vnode;
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
+	struct afs_net *net = afs_v2net(dvnode);
 	size_t namesz, reqsz, padsz;
 	__be32 *bp;
 
@@ -804,19 +804,19 @@ int afs_fs_create(struct afs_fs_cursor *fc,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
-	call->reply[1] = newfid;
-	call->reply[2] = newstatus;
-	call->reply[3] = newcb;
+	call->dvnode = dvnode;
+	call->out_fid = newfid;
+	call->out_extra_status = newstatus;
+	call->out_cb = newcb;
 	call->expected_version = current_data_version + 1;
 	call->want_reply_time = true;
 
 	/* marshall the parameters */
 	bp = call->request;
 	*bp++ = htonl(S_ISDIR(mode) ? FSMAKEDIR : FSCREATEFILE);
-	*bp++ = htonl(vnode->fid.vid);
-	*bp++ = htonl(vnode->fid.vnode);
-	*bp++ = htonl(vnode->fid.unique);
+	*bp++ = htonl(dvnode->fid.vid);
+	*bp++ = htonl(dvnode->fid.vnode);
+	*bp++ = htonl(dvnode->fid.unique);
 	*bp++ = htonl(namesz);
 	memcpy(bp, name, namesz);
 	bp = (void *) bp + namesz;
@@ -825,26 +825,26 @@ int afs_fs_create(struct afs_fs_cursor *fc,
 		bp = (void *) bp + padsz;
 	}
 	*bp++ = htonl(AFS_SET_MODE | AFS_SET_MTIME);
-	*bp++ = htonl(vnode->vfs_inode.i_mtime.tv_sec); /* mtime */
+	*bp++ = htonl(dvnode->vfs_inode.i_mtime.tv_sec); /* mtime */
 	*bp++ = 0; /* owner */
 	*bp++ = 0; /* group */
 	*bp++ = htonl(mode & S_IALLUGO); /* unix mode */
 	*bp++ = 0; /* segment size */
 
 	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call1(call, &vnode->fid, name);
+	trace_afs_make_fs_call1(call, &dvnode->fid, name);
 	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
 }
 
 /*
- * Deliver reply data to any operation that returns file status and volume
+ * Deliver reply data to any operation that returns directory status and volume
  * sync.
  */
-static int afs_deliver_fs_status_and_vol(struct afs_call *call)
+static int afs_deliver_fs_dir_status_and_vol(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->reply[0];
+	struct afs_vnode *dvnode = call->dvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -856,11 +856,11 @@ static int afs_deliver_fs_status_and_vol(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	ret = afs_decode_status(call, &bp, &vnode->status, vnode,
+	ret = afs_decode_status(call, &bp, &dvnode->status, dvnode,
 				&call->expected_version, NULL);
 	if (ret < 0)
 		return ret;
-	/* xdr_decode_AFSVolSync(&bp, call->reply[X]); */
+	xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -872,14 +872,14 @@ static int afs_deliver_fs_status_and_vol(struct afs_call *call)
 static const struct afs_call_type afs_RXFSRemoveFile = {
 	.name		= "FS.RemoveFile",
 	.op		= afs_FS_RemoveFile,
-	.deliver	= afs_deliver_fs_status_and_vol,
+	.deliver	= afs_deliver_fs_dir_status_and_vol,
 	.destructor	= afs_flat_call_destructor,
 };
 
 static const struct afs_call_type afs_RXFSRemoveDir = {
 	.name		= "FS.RemoveDir",
 	.op		= afs_FS_RemoveDir,
-	.deliver	= afs_deliver_fs_status_and_vol,
+	.deliver	= afs_deliver_fs_dir_status_and_vol,
 	.destructor	= afs_flat_call_destructor,
 };
 
@@ -911,8 +911,8 @@ int afs_fs_remove(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = dvnode;
-	call->reply[1] = vnode;
+	call->dvnode = dvnode;
+	call->xvnode = vnode;
 	call->expected_version = current_data_version + 1;
 
 	/* marshall the parameters */
@@ -941,7 +941,7 @@ int afs_fs_remove(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
  */
 static int afs_deliver_fs_link(struct afs_call *call)
 {
-	struct afs_vnode *dvnode = call->reply[0], *vnode = call->reply[1];
+	struct afs_vnode *dvnode = call->dvnode, *vnode = call->xvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -960,7 +960,7 @@ static int afs_deliver_fs_link(struct afs_call *call)
 				&call->expected_version, NULL);
 	if (ret < 0)
 		return ret;
-	/* xdr_decode_AFSVolSync(&bp, call->reply[X]); */
+	xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -1002,8 +1002,8 @@ int afs_fs_link(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = dvnode;
-	call->reply[1] = vnode;
+	call->dvnode = dvnode;
+	call->xvnode = vnode;
 	call->expected_version = current_data_version + 1;
 
 	/* marshall the parameters */
@@ -1035,7 +1035,7 @@ int afs_fs_link(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
  */
 static int afs_deliver_fs_symlink(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->reply[0];
+	struct afs_vnode *dvnode = call->dvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -1047,15 +1047,15 @@ static int afs_deliver_fs_symlink(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	xdr_decode_AFSFid(&bp, call->reply[1]);
-	ret = afs_decode_status(call, &bp, call->reply[2], NULL, NULL, NULL);
+	xdr_decode_AFSFid(&bp, call->out_fid);
+	ret = afs_decode_status(call, &bp, call->out_extra_status, NULL, NULL, NULL);
 	if (ret < 0)
 		return ret;
-	ret = afs_decode_status(call, &bp, &vnode->status, vnode,
+	ret = afs_decode_status(call, &bp, &dvnode->status, dvnode,
 				&call->expected_version, NULL);
 	if (ret < 0)
 		return ret;
-	/* xdr_decode_AFSVolSync(&bp, call->reply[X]); */
+	xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -1081,9 +1081,9 @@ int afs_fs_symlink(struct afs_fs_cursor *fc,
 		   struct afs_fid *newfid,
 		   struct afs_file_status *newstatus)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode *dvnode = fc->vnode;
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
+	struct afs_net *net = afs_v2net(dvnode);
 	size_t namesz, reqsz, padsz, c_namesz, c_padsz;
 	__be32 *bp;
 
@@ -1107,17 +1107,17 @@ int afs_fs_symlink(struct afs_fs_cursor *fc,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
-	call->reply[1] = newfid;
-	call->reply[2] = newstatus;
+	call->dvnode = dvnode;
+	call->out_fid = newfid;
+	call->out_extra_status = newstatus;
 	call->expected_version = current_data_version + 1;
 
 	/* marshall the parameters */
 	bp = call->request;
 	*bp++ = htonl(FSSYMLINK);
-	*bp++ = htonl(vnode->fid.vid);
-	*bp++ = htonl(vnode->fid.vnode);
-	*bp++ = htonl(vnode->fid.unique);
+	*bp++ = htonl(dvnode->fid.vid);
+	*bp++ = htonl(dvnode->fid.vnode);
+	*bp++ = htonl(dvnode->fid.unique);
 	*bp++ = htonl(namesz);
 	memcpy(bp, name, namesz);
 	bp = (void *) bp + namesz;
@@ -1133,14 +1133,14 @@ int afs_fs_symlink(struct afs_fs_cursor *fc,
 		bp = (void *) bp + c_padsz;
 	}
 	*bp++ = htonl(AFS_SET_MODE | AFS_SET_MTIME);
-	*bp++ = htonl(vnode->vfs_inode.i_mtime.tv_sec); /* mtime */
+	*bp++ = htonl(dvnode->vfs_inode.i_mtime.tv_sec); /* mtime */
 	*bp++ = 0; /* owner */
 	*bp++ = 0; /* group */
 	*bp++ = htonl(S_IRWXUGO); /* unix mode */
 	*bp++ = 0; /* segment size */
 
 	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call1(call, &vnode->fid, name);
+	trace_afs_make_fs_call1(call, &dvnode->fid, name);
 	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
@@ -1151,7 +1151,7 @@ int afs_fs_symlink(struct afs_fs_cursor *fc,
  */
 static int afs_deliver_fs_rename(struct afs_call *call)
 {
-	struct afs_vnode *orig_dvnode = call->reply[0], *new_dvnode = call->reply[1];
+	struct afs_vnode *orig_dvnode = call->dvnode, *new_dvnode = call->xvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -1173,7 +1173,7 @@ static int afs_deliver_fs_rename(struct afs_call *call)
 		if (ret < 0)
 			return ret;
 	}
-	/* xdr_decode_AFSVolSync(&bp, call->reply[X]); */
+	xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -1229,8 +1229,8 @@ int afs_fs_rename(struct afs_fs_cursor *fc,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = orig_dvnode;
-	call->reply[1] = new_dvnode;
+	call->dvnode = orig_dvnode;
+	call->xvnode = new_dvnode;
 	call->expected_version = current_orig_data_version + 1;
 	call->expected_version_2 = current_new_data_version + 1;
 
@@ -1271,7 +1271,7 @@ int afs_fs_rename(struct afs_fs_cursor *fc,
  */
 static int afs_deliver_fs_store_data(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->reply[0];
+	struct afs_vnode *vnode = call->xvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -1287,7 +1287,7 @@ static int afs_deliver_fs_store_data(struct afs_call *call)
 				&call->expected_version, NULL);
 	if (ret < 0)
 		return ret;
-	/* xdr_decode_AFSVolSync(&bp, call->reply[X]); */
+	xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
 	afs_pages_written_back(vnode, call);
 
@@ -1337,7 +1337,7 @@ static int afs_fs_store_data64(struct afs_fs_cursor *fc,
 
 	call->key = fc->key;
 	call->mapping = mapping;
-	call->reply[0] = vnode;
+	call->xvnode = vnode;
 	call->first = first;
 	call->last = last;
 	call->first_offset = offset;
@@ -1417,7 +1417,7 @@ int afs_fs_store_data(struct afs_fs_cursor *fc, struct address_space *mapping,
 
 	call->key = fc->key;
 	call->mapping = mapping;
-	call->reply[0] = vnode;
+	call->xvnode = vnode;
 	call->first = first;
 	call->last = last;
 	call->first_offset = offset;
@@ -1455,7 +1455,7 @@ int afs_fs_store_data(struct afs_fs_cursor *fc, struct address_space *mapping,
  */
 static int afs_deliver_fs_store_status(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->reply[0];
+	struct afs_vnode *vnode = call->xvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -1471,7 +1471,7 @@ static int afs_deliver_fs_store_status(struct afs_call *call)
 				&call->expected_version, NULL);
 	if (ret < 0)
 		return ret;
-	/* xdr_decode_AFSVolSync(&bp, call->reply[X]); */
+	xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -1524,7 +1524,7 @@ static int afs_fs_setattr_size64(struct afs_fs_cursor *fc, struct iattr *attr)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
+	call->xvnode = vnode;
 	call->expected_version = vnode->status.data_version + 1;
 
 	/* marshall the parameters */
@@ -1575,7 +1575,7 @@ static int afs_fs_setattr_size(struct afs_fs_cursor *fc, struct iattr *attr)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
+	call->xvnode = vnode;
 	call->expected_version = vnode->status.data_version + 1;
 
 	/* marshall the parameters */
@@ -1625,7 +1625,7 @@ int afs_fs_setattr(struct afs_fs_cursor *fc, struct iattr *attr)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
+	call->xvnode = vnode;
 	call->expected_version = vnode->status.data_version;
 
 	/* marshall the parameters */
@@ -1669,7 +1669,7 @@ static int afs_deliver_fs_get_volume_status(struct afs_call *call)
 			return ret;
 
 		bp = call->buffer;
-		xdr_decode_AFSFetchVolumeStatus(&bp, call->reply[1]);
+		xdr_decode_AFSFetchVolumeStatus(&bp, call->out_volstatus);
 		call->unmarshall++;
 		afs_extract_to_tmp(call);
 
@@ -1685,7 +1685,7 @@ static int afs_deliver_fs_get_volume_status(struct afs_call *call)
 			return afs_protocol_error(call, -EBADMSG,
 						  afs_eproto_volname_len);
 		size = (call->count + 3) & ~3; /* It's padded */
-		afs_extract_begin(call, call->reply[2], size);
+		afs_extract_to_buf(call, size);
 		call->unmarshall++;
 
 		/* Fall through - and extract the volume name */
@@ -1695,7 +1695,7 @@ static int afs_deliver_fs_get_volume_status(struct afs_call *call)
 		if (ret < 0)
 			return ret;
 
-		p = call->reply[2];
+		p = call->buffer;
 		p[call->count] = 0;
 		_debug("volname '%s'", p);
 		afs_extract_to_tmp(call);
@@ -1713,7 +1713,7 @@ static int afs_deliver_fs_get_volume_status(struct afs_call *call)
 			return afs_protocol_error(call, -EBADMSG,
 						  afs_eproto_offline_msg_len);
 		size = (call->count + 3) & ~3; /* It's padded */
-		afs_extract_begin(call, call->reply[2], size);
+		afs_extract_to_buf(call, size);
 		call->unmarshall++;
 
 		/* Fall through - and extract the offline message */
@@ -1723,7 +1723,7 @@ static int afs_deliver_fs_get_volume_status(struct afs_call *call)
 		if (ret < 0)
 			return ret;
 
-		p = call->reply[2];
+		p = call->buffer;
 		p[call->count] = 0;
 		_debug("offline '%s'", p);
 
@@ -1742,7 +1742,7 @@ static int afs_deliver_fs_get_volume_status(struct afs_call *call)
 			return afs_protocol_error(call, -EBADMSG,
 						  afs_eproto_motd_len);
 		size = (call->count + 3) & ~3; /* It's padded */
-		afs_extract_begin(call, call->reply[2], size);
+		afs_extract_to_buf(call, size);
 		call->unmarshall++;
 
 		/* Fall through - and extract the message of the day */
@@ -1752,7 +1752,7 @@ static int afs_deliver_fs_get_volume_status(struct afs_call *call)
 		if (ret < 0)
 			return ret;
 
-		p = call->reply[2];
+		p = call->buffer;
 		p[call->count] = 0;
 		_debug("motd '%s'", p);
 
@@ -1766,16 +1766,6 @@ static int afs_deliver_fs_get_volume_status(struct afs_call *call)
 	return 0;
 }
 
-/*
- * destroy an FS.GetVolumeStatus call
- */
-static void afs_get_volume_status_call_destructor(struct afs_call *call)
-{
-	kfree(call->reply[2]);
-	call->reply[2] = NULL;
-	afs_flat_call_destructor(call);
-}
-
 /*
  * FS.GetVolumeStatus operation type
  */
@@ -1783,7 +1773,7 @@ static const struct afs_call_type afs_RXFSGetVolumeStatus = {
 	.name		= "FS.GetVolumeStatus",
 	.op		= afs_FS_GetVolumeStatus,
 	.deliver	= afs_deliver_fs_get_volume_status,
-	.destructor	= afs_get_volume_status_call_destructor,
+	.destructor	= afs_flat_call_destructor,
 };
 
 /*
@@ -1796,27 +1786,19 @@ int afs_fs_get_volume_status(struct afs_fs_cursor *fc,
 	struct afs_call *call;
 	struct afs_net *net = afs_v2net(vnode);
 	__be32 *bp;
-	void *tmpbuf;
 
 	if (test_bit(AFS_SERVER_FL_IS_YFS, &fc->cbi->server->flags))
 		return yfs_fs_get_volume_status(fc, vs);
 
 	_enter("");
 
-	tmpbuf = kmalloc(AFSOPAQUEMAX, GFP_KERNEL);
-	if (!tmpbuf)
-		return -ENOMEM;
-
-	call = afs_alloc_flat_call(net, &afs_RXFSGetVolumeStatus, 2 * 4, 12 * 4);
-	if (!call) {
-		kfree(tmpbuf);
+	call = afs_alloc_flat_call(net, &afs_RXFSGetVolumeStatus, 2 * 4,
+				   max(12 * 4, AFSOPAQUEMAX + 1));
+	if (!call)
 		return -ENOMEM;
-	}
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
-	call->reply[1] = vs;
-	call->reply[2] = tmpbuf;
+	call->out_volstatus = vs;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -1846,7 +1828,7 @@ static int afs_deliver_fs_xxxx_lock(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	/* xdr_decode_AFSVolSync(&bp, call->reply[X]); */
+	xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -1904,7 +1886,7 @@ int afs_fs_set_lock(struct afs_fs_cursor *fc, afs_lock_type_t type)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
+	call->xvnode = vnode;
 	call->want_reply_time = true;
 
 	/* marshall the parameters */
@@ -1942,7 +1924,7 @@ int afs_fs_extend_lock(struct afs_fs_cursor *fc)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
+	call->xvnode = vnode;
 	call->want_reply_time = true;
 
 	/* marshall the parameters */
@@ -1979,7 +1961,7 @@ int afs_fs_release_lock(struct afs_fs_cursor *fc)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
+	call->xvnode = vnode;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -2085,14 +2067,6 @@ static int afs_deliver_fs_get_capabilities(struct afs_call *call)
 	return 0;
 }
 
-static void afs_destroy_fs_get_capabilities(struct afs_call *call)
-{
-	struct afs_server *server = call->reply[0];
-
-	afs_put_server(call->net, server);
-	afs_flat_call_destructor(call);
-}
-
 /*
  * FS.GetCapabilities operation type
  */
@@ -2101,7 +2075,7 @@ static const struct afs_call_type afs_RXFSGetCapabilities = {
 	.op		= afs_FS_GetCapabilities,
 	.deliver	= afs_deliver_fs_get_capabilities,
 	.done		= afs_fileserver_probe_result,
-	.destructor	= afs_destroy_fs_get_capabilities,
+	.destructor	= afs_flat_call_destructor,
 };
 
 /*
@@ -2124,8 +2098,8 @@ struct afs_call *afs_fs_get_capabilities(struct afs_net *net,
 		return ERR_PTR(-ENOMEM);
 
 	call->key = key;
-	call->reply[0] = afs_get_server(server);
-	call->reply[1] = (void *)(long)server_index;
+	call->server = afs_get_server(server);
+	call->server_index = server_index;
 	call->upgrade = true;
 	call->want_reply_time = true;
 	call->async = true;
@@ -2145,10 +2119,10 @@ struct afs_call *afs_fs_get_capabilities(struct afs_net *net,
  */
 static int afs_deliver_fs_fetch_status(struct afs_call *call)
 {
-	struct afs_file_status *status = call->reply[1];
-	struct afs_callback *callback = call->reply[2];
-	struct afs_volsync *volsync = call->reply[3];
-	struct afs_fid *fid = call->reply[0];
+	struct afs_file_status *status = call->out_vnode_status;
+	struct afs_callback *callback = call->out_cb;
+	struct afs_volsync *volsync = call->out_volsync;
+	struct afs_fid *fid = call->out_fid;
 	const __be32 *bp;
 	int ret;
 
@@ -2207,10 +2181,10 @@ int afs_fs_fetch_status(struct afs_fs_cursor *fc,
 	}
 
 	call->key = fc->key;
-	call->reply[0] = fid;
-	call->reply[1] = status;
-	call->reply[2] = callback;
-	call->reply[3] = volsync;
+	call->out_fid = fid;
+	call->out_vnode_status = status;
+	call->out_cb = callback;
+	call->out_volsync = volsync;
 	call->expected_version = 1; /* vnode->status.data_version */
 	call->want_reply_time = true;
 
@@ -2274,7 +2248,7 @@ static int afs_deliver_fs_inline_bulk_status(struct afs_call *call)
 			return ret;
 
 		bp = call->buffer;
-		statuses = call->reply[1];
+		statuses = call->out_extra_status;
 		ret = afs_decode_status(call, &bp, &statuses[call->count],
 					NULL, NULL, NULL);
 		if (ret < 0)
@@ -2315,9 +2289,9 @@ static int afs_deliver_fs_inline_bulk_status(struct afs_call *call)
 
 		_debug("unmarshall CB array");
 		bp = call->buffer;
-		callbacks = call->reply[2];
+		callbacks = call->out_cb;
 		xdr_decode_AFSCallBack_raw(call, &callbacks[call->count], &bp);
-		statuses = call->reply[1];
+		statuses = call->out_extra_status;
 		call->count++;
 		if (call->count < call->count2)
 			goto more_cbs;
@@ -2332,7 +2306,7 @@ static int afs_deliver_fs_inline_bulk_status(struct afs_call *call)
 			return ret;
 
 		bp = call->buffer;
-		xdr_decode_AFSVolSync(&bp, call->reply[3]);
+		xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
 		call->unmarshall++;
 
@@ -2385,9 +2359,9 @@ int afs_fs_inline_bulk_status(struct afs_fs_cursor *fc,
 	}
 
 	call->key = fc->key;
-	call->reply[1] = statuses;
-	call->reply[2] = callbacks;
-	call->reply[3] = volsync;
+	call->out_extra_status = statuses;
+	call->out_cb = callbacks;
+	call->out_volsync = volsync;
 	call->count2 = nr_fids;
 	call->want_reply_time = true;
 
@@ -2414,7 +2388,7 @@ int afs_fs_inline_bulk_status(struct afs_fs_cursor *fc,
  */
 static int afs_deliver_fs_fetch_acl(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->reply[1];
+	struct afs_vnode *vnode = call->xvnode;
 	struct afs_acl *acl;
 	const __be32 *bp;
 	unsigned int size;
@@ -2439,7 +2413,7 @@ static int afs_deliver_fs_fetch_acl(struct afs_call *call)
 		acl = kmalloc(struct_size(acl, data, size), GFP_KERNEL);
 		if (!acl)
 			return -ENOMEM;
-		call->reply[0] = acl;
+		call->ret_acl = acl;
 		acl->size = call->count2;
 		afs_extract_begin(call, acl->data, size);
 		call->unmarshall++;
@@ -2464,7 +2438,7 @@ static int afs_deliver_fs_fetch_acl(struct afs_call *call)
 					&vnode->status.data_version, NULL);
 		if (ret < 0)
 			return ret;
-		xdr_decode_AFSVolSync(&bp, call->reply[2]);
+		xdr_decode_AFSVolSync(&bp, call->out_volsync);
 
 		call->unmarshall++;
 
@@ -2478,7 +2452,7 @@ static int afs_deliver_fs_fetch_acl(struct afs_call *call)
 
 static void afs_destroy_fs_fetch_acl(struct afs_call *call)
 {
-	kfree(call->reply[0]);
+	kfree(call->ret_acl);
 	afs_flat_call_destructor(call);
 }
 
@@ -2512,10 +2486,9 @@ struct afs_acl *afs_fs_fetch_acl(struct afs_fs_cursor *fc)
 	}
 
 	call->key = fc->key;
-	call->reply[0] = NULL;
-	call->reply[1] = vnode;
-	call->reply[2] = NULL; /* volsync */
-	call->ret_reply0 = true;
+	call->ret_acl = NULL;
+	call->xvnode = vnode;
+	call->out_volsync = NULL;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -2531,13 +2504,41 @@ struct afs_acl *afs_fs_fetch_acl(struct afs_fs_cursor *fc)
 	return (struct afs_acl *)afs_wait_for_call_to_complete(call, &fc->ac);
 }
 
+/*
+ * Deliver reply data to any operation that returns file status and volume
+ * sync.
+ */
+static int afs_deliver_fs_file_status_and_vol(struct afs_call *call)
+{
+	struct afs_vnode *vnode = call->xvnode;
+	const __be32 *bp;
+	int ret;
+
+	_enter("{%u}", call->unmarshall);
+
+	ret = afs_transfer_reply(call);
+	if (ret < 0)
+		return ret;
+
+	/* unmarshall the reply once we've received all of it */
+	bp = call->buffer;
+	ret = afs_decode_status(call, &bp, &vnode->status, vnode,
+				&call->expected_version, NULL);
+	if (ret < 0)
+		return ret;
+	xdr_decode_AFSVolSync(&bp, call->out_volsync);
+
+	_leave(" = 0 [done]");
+	return 0;
+}
+
 /*
  * FS.StoreACL operation type
  */
 static const struct afs_call_type afs_RXFSStoreACL = {
 	.name		= "FS.StoreACL",
 	.op		= afs_FS_StoreACL,
-	.deliver	= afs_deliver_fs_status_and_vol,
+	.deliver	= afs_deliver_fs_file_status_and_vol,
 	.destructor	= afs_flat_call_destructor,
 };
 
@@ -2564,8 +2565,8 @@ int afs_fs_store_acl(struct afs_fs_cursor *fc, const struct afs_acl *acl)
 	}
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
-	call->reply[2] = NULL; /* volsync */
+	call->xvnode = vnode;
+	call->out_volsync = NULL;
 
 	/* marshall the parameters */
 	bp = call->request;
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index d58544d03bae..e5ee6017e01c 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -111,8 +111,13 @@ struct afs_call {
 	struct rxrpc_call	*rxcall;	/* RxRPC call handle */
 	struct key		*key;		/* security for this call */
 	struct afs_net		*net;		/* The network namespace */
-	struct afs_server	*cm_server;	/* Server affected by incoming CM call */
+	union {
+		struct afs_server	*server;
+		struct afs_vlserver	*vlserver;
+	};
 	struct afs_cb_interest	*cbi;		/* Callback interest for server used */
+	struct afs_vnode	*dvnode;	/* Directory vnode of call */
+	struct afs_vnode	*xvnode;	/* Other vnode of call */
 	void			*request;	/* request data (first part) */
 	struct address_space	*mapping;	/* Pages being written from */
 	struct iov_iter		iter;		/* Buffer iterator */
@@ -122,7 +127,21 @@ struct afs_call {
 		struct bio_vec	bvec[1];
 	};
 	void			*buffer;	/* reply receive buffer */
-	void			*reply[4];	/* Where to put the reply */
+	union {
+		long			ret0;	/* Value to reply with instead of 0 */
+		struct afs_addr_list	*ret_alist;
+		struct afs_vldb_entry	*ret_vldb;
+		struct afs_acl		*ret_acl;
+	};
+	struct afs_fid		*out_fid;
+	struct afs_file_status	*out_vnode_status;
+	struct afs_file_status	*out_extra_status;
+	struct afs_callback	*out_cb;
+	struct yfs_acl		*out_yacl;
+	struct afs_volsync	*out_volsync;
+	struct afs_volume_status *out_volstatus;
+	struct afs_read		*read_request;
+	unsigned int		server_index;
 	pgoff_t			first;		/* first page in mapping to deal with */
 	pgoff_t			last;		/* last page in mapping to deal with */
 	atomic_t		usage;
@@ -145,7 +164,6 @@ struct afs_call {
 	bool			send_pages;	/* T if data from mapping should be sent */
 	bool			need_attention;	/* T if RxRPC poked us */
 	bool			async;		/* T if asynchronous */
-	bool			ret_reply0;	/* T if should return reply[0] on success */
 	bool			upgrade;	/* T to request service upgrade */
 	bool			want_reply_time; /* T if want reply_time */
 	bool			intr;		/* T if interruptible */
diff --git a/fs/afs/rxrpc.c b/fs/afs/rxrpc.c
index bd17c0267094..5537d7fdcebd 100644
--- a/fs/afs/rxrpc.c
+++ b/fs/afs/rxrpc.c
@@ -188,7 +188,7 @@ void afs_put_call(struct afs_call *call)
 		if (call->type->destructor)
 			call->type->destructor(call);
 
-		afs_put_server(call->net, call->cm_server);
+		afs_put_server(call->net, call->server);
 		afs_put_cb_interest(call->net, call->cbi);
 		afs_put_addrlist(call->alist);
 		kfree(call->request);
@@ -692,10 +692,9 @@ long afs_wait_for_call_to_complete(struct afs_call *call,
 	ret = ac->error;
 	switch (ret) {
 	case 0:
-		if (call->ret_reply0) {
-			ret = (long)call->reply[0];
-			call->reply[0] = NULL;
-		}
+		ret = call->ret0;
+		call->ret0 = 0;
+
 		/* Fall through */
 	case -ECONNABORTED:
 		ac->responded = true;
diff --git a/fs/afs/vl_probe.c b/fs/afs/vl_probe.c
index b05e0de04f42..beb991563939 100644
--- a/fs/afs/vl_probe.c
+++ b/fs/afs/vl_probe.c
@@ -33,8 +33,8 @@ static bool afs_vl_probe_done(struct afs_vlserver *server)
 void afs_vlserver_probe_result(struct afs_call *call)
 {
 	struct afs_addr_list *alist = call->alist;
-	struct afs_vlserver *server = call->reply[0];
-	unsigned int server_index = (long)call->reply[1];
+	struct afs_vlserver *server = call->vlserver;
+	unsigned int server_index = call->server_index;
 	unsigned int index = call->addr_ix;
 	unsigned int rtt = UINT_MAX;
 	bool have_result = false;
diff --git a/fs/afs/vlclient.c b/fs/afs/vlclient.c
index dd9ba4e96fb3..b895098e7901 100644
--- a/fs/afs/vlclient.c
+++ b/fs/afs/vlclient.c
@@ -34,7 +34,7 @@ static int afs_deliver_vl_get_entry_by_name_u(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	uvldb = call->buffer;
-	entry = call->reply[0];
+	entry = call->ret_vldb;
 
 	nr_servers = ntohl(uvldb->nServers);
 	if (nr_servers > AFS_NMAXNSERVERS)
@@ -110,7 +110,7 @@ static int afs_deliver_vl_get_entry_by_name_u(struct afs_call *call)
 
 static void afs_destroy_vl_get_entry_by_name_u(struct afs_call *call)
 {
-	kfree(call->reply[0]);
+	kfree(call->ret_vldb);
 	afs_flat_call_destructor(call);
 }
 
@@ -155,8 +155,7 @@ struct afs_vldb_entry *afs_vl_get_entry_by_name_u(struct afs_vl_cursor *vc,
 	}
 
 	call->key = vc->key;
-	call->reply[0] = entry;
-	call->ret_reply0 = true;
+	call->ret_vldb = entry;
 
 	/* Marshall the parameters */
 	bp = call->request;
@@ -214,7 +213,7 @@ static int afs_deliver_vl_get_addrs_u(struct afs_call *call)
 		if (!alist)
 			return -ENOMEM;
 		alist->version = uniquifier;
-		call->reply[0] = alist;
+		call->ret_alist = alist;
 		call->count = count;
 		call->count2 = nentries;
 		call->unmarshall++;
@@ -229,7 +228,7 @@ static int afs_deliver_vl_get_addrs_u(struct afs_call *call)
 		if (ret < 0)
 			return ret;
 
-		alist = call->reply[0];
+		alist = call->ret_alist;
 		bp = call->buffer;
 		count = min(call->count, 4U);
 		for (i = 0; i < count; i++)
@@ -249,8 +248,7 @@ static int afs_deliver_vl_get_addrs_u(struct afs_call *call)
 
 static void afs_vl_get_addrs_u_destructor(struct afs_call *call)
 {
-	afs_put_server(call->net, (struct afs_server *)call->reply[0]);
-	kfree(call->reply[1]);
+	afs_put_addrlist(call->ret_alist);
 	return afs_flat_call_destructor(call);
 }
 
@@ -287,8 +285,7 @@ struct afs_addr_list *afs_vl_get_addrs_u(struct afs_vl_cursor *vc,
 		return ERR_PTR(-ENOMEM);
 
 	call->key = vc->key;
-	call->reply[0] = NULL;
-	call->ret_reply0 = true;
+	call->ret_alist = NULL;
 
 	/* Marshall the parameters */
 	bp = call->request;
@@ -358,9 +355,7 @@ static int afs_deliver_vl_get_capabilities(struct afs_call *call)
 
 static void afs_destroy_vl_get_capabilities(struct afs_call *call)
 {
-	struct afs_vlserver *server = call->reply[0];
-
-	afs_put_vlserver(call->net, server);
+	afs_put_vlserver(call->net, call->vlserver);
 	afs_flat_call_destructor(call);
 }
 
@@ -398,8 +393,8 @@ struct afs_call *afs_vl_get_capabilities(struct afs_net *net,
 		return ERR_PTR(-ENOMEM);
 
 	call->key = key;
-	call->reply[0] = afs_get_vlserver(server);
-	call->reply[1] = (void *)(long)server_index;
+	call->vlserver = afs_get_vlserver(server);
+	call->server_index = server_index;
 	call->upgrade = true;
 	call->want_reply_time = true;
 	call->async = true;
@@ -460,7 +455,7 @@ static int afs_deliver_yfsvl_get_endpoints(struct afs_call *call)
 		if (!alist)
 			return -ENOMEM;
 		alist->version = uniquifier;
-		call->reply[0] = alist;
+		call->ret_alist = alist;
 
 		if (call->count == 0)
 			goto extract_volendpoints;
@@ -488,7 +483,7 @@ static int afs_deliver_yfsvl_get_endpoints(struct afs_call *call)
 		if (ret < 0)
 			return ret;
 
-		alist = call->reply[0];
+		alist = call->ret_alist;
 		bp = call->buffer;
 		switch (call->count2) {
 		case YFS_ENDPOINT_IPV4:
@@ -609,7 +604,6 @@ static int afs_deliver_yfsvl_get_endpoints(struct afs_call *call)
 		break;
 	}
 
-	alist = call->reply[0];
 	_leave(" = 0 [done]");
 	return 0;
 }
@@ -644,8 +638,7 @@ struct afs_addr_list *afs_yfsvl_get_endpoints(struct afs_vl_cursor *vc,
 		return ERR_PTR(-ENOMEM);
 
 	call->key = vc->key;
-	call->reply[0] = NULL;
-	call->ret_reply0 = true;
+	call->ret_alist = NULL;
 
 	/* Marshall the parameters */
 	bp = call->request;
diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index 3f6d50edf498..a815d22f62f1 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -445,7 +445,7 @@ static void xdr_decode_YFSFetchVolumeStatus(const __be32 **_bp,
  */
 static int yfs_deliver_fs_fetch_status_vnode(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->reply[0];
+	struct afs_vnode *vnode = call->xvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -462,7 +462,7 @@ static int yfs_deliver_fs_fetch_status_vnode(struct afs_call *call)
 	if (ret < 0)
 		return ret;
 	xdr_decode_YFSCallBack(call, vnode, &bp);
-	xdr_decode_YFSVolSync(&bp, call->reply[1]);
+	xdr_decode_YFSVolSync(&bp, call->out_volsync);
 
 	_leave(" = 0 [done]");
 	return 0;
@@ -504,8 +504,8 @@ int yfs_fs_fetch_file_status(struct afs_fs_cursor *fc, struct afs_volsync *volsy
 	}
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
-	call->reply[1] = volsync;
+	call->xvnode = vnode;
+	call->out_volsync = volsync;
 	call->expected_version = new_inode ? 1 : vnode->status.data_version;
 
 	/* marshall the parameters */
@@ -528,8 +528,8 @@ int yfs_fs_fetch_file_status(struct afs_fs_cursor *fc, struct afs_volsync *volsy
  */
 static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->reply[0];
-	struct afs_read *req = call->reply[2];
+	struct afs_vnode *vnode = call->xvnode;
+	struct afs_read *req = call->read_request;
 	const __be32 *bp;
 	unsigned int size;
 	int ret;
@@ -628,7 +628,7 @@ static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 		if (ret < 0)
 			return ret;
 		xdr_decode_YFSCallBack(call, vnode, &bp);
-		xdr_decode_YFSVolSync(&bp, call->reply[1]);
+		xdr_decode_YFSVolSync(&bp, call->out_volsync);
 
 		call->unmarshall++;
 
@@ -652,9 +652,7 @@ static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 
 static void yfs_fetch_data_destructor(struct afs_call *call)
 {
-	struct afs_read *req = call->reply[2];
-
-	afs_put_read(req);
+	afs_put_read(call->read_request);
 	afs_flat_call_destructor(call);
 }
 
@@ -693,9 +691,9 @@ int yfs_fs_fetch_data(struct afs_fs_cursor *fc, struct afs_read *req)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
-	call->reply[1] = NULL; /* volsync */
-	call->reply[2] = req;
+	call->xvnode = vnode;
+	call->out_volsync = NULL;
+	call->read_request = req;
 	call->expected_version = vnode->status.data_version;
 	call->want_reply_time = true;
 
@@ -722,7 +720,7 @@ int yfs_fs_fetch_data(struct afs_fs_cursor *fc, struct afs_read *req)
  */
 static int yfs_deliver_fs_create_vnode(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->reply[0];
+	struct afs_vnode *dvnode = call->dvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -734,15 +732,15 @@ static int yfs_deliver_fs_create_vnode(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	xdr_decode_YFSFid(&bp, call->reply[1]);
-	ret = yfs_decode_status(call, &bp, call->reply[2], NULL, NULL, NULL);
+	xdr_decode_YFSFid(&bp, call->out_fid);
+	ret = yfs_decode_status(call, &bp, call->out_extra_status, NULL, NULL, NULL);
 	if (ret < 0)
 		return ret;
-	ret = yfs_decode_status(call, &bp, &vnode->status, vnode,
+	ret = yfs_decode_status(call, &bp, &dvnode->status, dvnode,
 				&call->expected_version, NULL);
 	if (ret < 0)
 		return ret;
-	xdr_decode_YFSCallBack_raw(call, call->reply[3], &bp);
+	xdr_decode_YFSCallBack_raw(call, call->out_cb, &bp);
 	xdr_decode_YFSVolSync(&bp, NULL);
 
 	_leave(" = 0 [done]");
@@ -770,9 +768,9 @@ int yfs_fs_create_file(struct afs_fs_cursor *fc,
 		       struct afs_file_status *newstatus,
 		       struct afs_callback *newcb)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode *dvnode = fc->vnode;
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
+	struct afs_net *net = afs_v2net(dvnode);
 	size_t namesz, reqsz, rplsz;
 	__be32 *bp;
 
@@ -796,24 +794,24 @@ int yfs_fs_create_file(struct afs_fs_cursor *fc,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
-	call->reply[1] = newfid;
-	call->reply[2] = newstatus;
-	call->reply[3] = newcb;
+	call->dvnode = dvnode;
+	call->out_fid = newfid;
+	call->out_extra_status = newstatus;
+	call->out_cb = newcb;
 	call->expected_version = current_data_version + 1;
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp = xdr_encode_u32(bp, YFSCREATEFILE);
 	bp = xdr_encode_u32(bp, 0); /* RPC flags */
-	bp = xdr_encode_YFSFid(bp, &vnode->fid);
+	bp = xdr_encode_YFSFid(bp, &dvnode->fid);
 	bp = xdr_encode_string(bp, name, namesz);
 	bp = xdr_encode_YFSStoreStatus_mode(bp, mode);
 	bp = xdr_encode_u32(bp, yfs_LockNone); /* ViceLockType */
 	yfs_check_req(call, bp);
 
 	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call1(call, &vnode->fid, name);
+	trace_afs_make_fs_call1(call, &dvnode->fid, name);
 	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
@@ -837,9 +835,9 @@ int yfs_fs_make_dir(struct afs_fs_cursor *fc,
 		    struct afs_file_status *newstatus,
 		    struct afs_callback *newcb)
 {
-	struct afs_vnode *vnode = fc->vnode;
+	struct afs_vnode *dvnode = fc->vnode;
 	struct afs_call *call;
-	struct afs_net *net = afs_v2net(vnode);
+	struct afs_net *net = afs_v2net(dvnode);
 	size_t namesz, reqsz, rplsz;
 	__be32 *bp;
 
@@ -862,23 +860,23 @@ int yfs_fs_make_dir(struct afs_fs_cursor *fc,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
-	call->reply[1] = newfid;
-	call->reply[2] = newstatus;
-	call->reply[3] = newcb;
+	call->dvnode = dvnode;
+	call->out_fid = newfid;
+	call->out_extra_status = newstatus;
+	call->out_cb = newcb;
 	call->expected_version = current_data_version + 1;
 
 	/* marshall the parameters */
 	bp = call->request;
 	bp = xdr_encode_u32(bp, YFSMAKEDIR);
 	bp = xdr_encode_u32(bp, 0); /* RPC flags */
-	bp = xdr_encode_YFSFid(bp, &vnode->fid);
+	bp = xdr_encode_YFSFid(bp, &dvnode->fid);
 	bp = xdr_encode_string(bp, name, namesz);
 	bp = xdr_encode_YFSStoreStatus_mode(bp, mode);
 	yfs_check_req(call, bp);
 
 	afs_use_fs_server(call, fc->cbi);
-	trace_afs_make_fs_call1(call, &vnode->fid, name);
+	trace_afs_make_fs_call1(call, &dvnode->fid, name);
 	afs_set_fc_call(call, fc);
 	afs_make_call(&fc->ac, call, GFP_NOFS);
 	return afs_wait_for_call_to_complete(call, &fc->ac);
@@ -889,8 +887,8 @@ int yfs_fs_make_dir(struct afs_fs_cursor *fc,
  */
 static int yfs_deliver_fs_remove_file2(struct afs_call *call)
 {
-	struct afs_vnode *dvnode = call->reply[0];
-	struct afs_vnode *vnode = call->reply[1];
+	struct afs_vnode *dvnode = call->dvnode;
+	struct afs_vnode *vnode = call->xvnode;
 	struct afs_fid fid;
 	const __be32 *bp;
 	int ret;
@@ -957,8 +955,8 @@ int yfs_fs_remove_file2(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = dvnode;
-	call->reply[1] = vnode;
+	call->dvnode = dvnode;
+	call->xvnode = vnode;
 	call->expected_version = current_data_version + 1;
 
 	/* marshall the parameters */
@@ -981,7 +979,7 @@ int yfs_fs_remove_file2(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
  */
 static int yfs_deliver_fs_remove(struct afs_call *call)
 {
-	struct afs_vnode *dvnode = call->reply[0];
+	struct afs_vnode *dvnode = call->dvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -1046,8 +1044,8 @@ int yfs_fs_remove(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = dvnode;
-	call->reply[1] = vnode;
+	call->dvnode = dvnode;
+	call->xvnode = vnode;
 	call->expected_version = current_data_version + 1;
 
 	/* marshall the parameters */
@@ -1070,7 +1068,7 @@ int yfs_fs_remove(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
  */
 static int yfs_deliver_fs_link(struct afs_call *call)
 {
-	struct afs_vnode *dvnode = call->reply[0], *vnode = call->reply[1];
+	struct afs_vnode *dvnode = call->dvnode, *vnode = call->xvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -1132,8 +1130,8 @@ int yfs_fs_link(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = dvnode;
-	call->reply[1] = vnode;
+	call->dvnode = dvnode;
+	call->xvnode = vnode;
 	call->expected_version = current_data_version + 1;
 
 	/* marshall the parameters */
@@ -1157,7 +1155,7 @@ int yfs_fs_link(struct afs_fs_cursor *fc, struct afs_vnode *vnode,
  */
 static int yfs_deliver_fs_symlink(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->reply[0];
+	struct afs_vnode *dvnode = call->dvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -1169,11 +1167,11 @@ static int yfs_deliver_fs_symlink(struct afs_call *call)
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	xdr_decode_YFSFid(&bp, call->reply[1]);
-	ret = yfs_decode_status(call, &bp, call->reply[2], NULL, NULL, NULL);
+	xdr_decode_YFSFid(&bp, call->out_fid);
+	ret = yfs_decode_status(call, &bp, call->out_extra_status, NULL, NULL, NULL);
 	if (ret < 0)
 		return ret;
-	ret = yfs_decode_status(call, &bp, &vnode->status, vnode,
+	ret = yfs_decode_status(call, &bp, &dvnode->status, dvnode,
 				&call->expected_version, NULL);
 	if (ret < 0)
 		return ret;
@@ -1228,9 +1226,9 @@ int yfs_fs_symlink(struct afs_fs_cursor *fc,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = dvnode;
-	call->reply[1] = newfid;
-	call->reply[2] = newstatus;
+	call->dvnode = dvnode;
+	call->out_fid = newfid;
+	call->out_extra_status = newstatus;
 	call->expected_version = current_data_version + 1;
 
 	/* marshall the parameters */
@@ -1255,8 +1253,8 @@ int yfs_fs_symlink(struct afs_fs_cursor *fc,
  */
 static int yfs_deliver_fs_rename(struct afs_call *call)
 {
-	struct afs_vnode *orig_dvnode = call->reply[0];
-	struct afs_vnode *new_dvnode = call->reply[1];
+	struct afs_vnode *orig_dvnode = call->dvnode;
+	struct afs_vnode *new_dvnode = call->xvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -1328,8 +1326,8 @@ int yfs_fs_rename(struct afs_fs_cursor *fc,
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = orig_dvnode;
-	call->reply[1] = new_dvnode;
+	call->dvnode = orig_dvnode;
+	call->xvnode = new_dvnode;
 	call->expected_version = current_orig_data_version + 1;
 	call->expected_version_2 = current_new_data_version + 1;
 
@@ -1355,7 +1353,7 @@ int yfs_fs_rename(struct afs_fs_cursor *fc,
  */
 static int yfs_deliver_fs_store_data(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->reply[0];
+	struct afs_vnode *vnode = call->xvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -1432,7 +1430,7 @@ int yfs_fs_store_data(struct afs_fs_cursor *fc, struct address_space *mapping,
 
 	call->key = fc->key;
 	call->mapping = mapping;
-	call->reply[0] = vnode;
+	call->xvnode = vnode;
 	call->first = first;
 	call->last = last;
 	call->first_offset = offset;
@@ -1463,7 +1461,7 @@ int yfs_fs_store_data(struct afs_fs_cursor *fc, struct address_space *mapping,
  */
 static int yfs_deliver_fs_store_status(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->reply[0];
+	struct afs_vnode *vnode = call->xvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -1527,7 +1525,7 @@ static int yfs_fs_setattr_size(struct afs_fs_cursor *fc, struct iattr *attr)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
+	call->xvnode = vnode;
 	call->expected_version = vnode->status.data_version + 1;
 
 	/* marshall the parameters */
@@ -1575,7 +1573,7 @@ int yfs_fs_setattr(struct afs_fs_cursor *fc, struct iattr *attr)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
+	call->xvnode = vnode;
 	call->expected_version = vnode->status.data_version;
 
 	/* marshall the parameters */
@@ -1618,7 +1616,7 @@ static int yfs_deliver_fs_get_volume_status(struct afs_call *call)
 			return ret;
 
 		bp = call->buffer;
-		xdr_decode_YFSFetchVolumeStatus(&bp, call->reply[1]);
+		xdr_decode_YFSFetchVolumeStatus(&bp, call->out_volstatus);
 		call->unmarshall++;
 		afs_extract_to_tmp(call);
 
@@ -1634,7 +1632,7 @@ static int yfs_deliver_fs_get_volume_status(struct afs_call *call)
 			return afs_protocol_error(call, -EBADMSG,
 						  afs_eproto_volname_len);
 		size = (call->count + 3) & ~3; /* It's padded */
-		afs_extract_begin(call, call->reply[2], size);
+		afs_extract_to_buf(call, size);
 		call->unmarshall++;
 
 		/* Fall through - and extract the volume name */
@@ -1644,7 +1642,7 @@ static int yfs_deliver_fs_get_volume_status(struct afs_call *call)
 		if (ret < 0)
 			return ret;
 
-		p = call->reply[2];
+		p = call->buffer;
 		p[call->count] = 0;
 		_debug("volname '%s'", p);
 		afs_extract_to_tmp(call);
@@ -1662,7 +1660,7 @@ static int yfs_deliver_fs_get_volume_status(struct afs_call *call)
 			return afs_protocol_error(call, -EBADMSG,
 						  afs_eproto_offline_msg_len);
 		size = (call->count + 3) & ~3; /* It's padded */
-		afs_extract_begin(call, call->reply[2], size);
+		afs_extract_to_buf(call, size);
 		call->unmarshall++;
 
 		/* Fall through - and extract the offline message */
@@ -1672,7 +1670,7 @@ static int yfs_deliver_fs_get_volume_status(struct afs_call *call)
 		if (ret < 0)
 			return ret;
 
-		p = call->reply[2];
+		p = call->buffer;
 		p[call->count] = 0;
 		_debug("offline '%s'", p);
 
@@ -1691,7 +1689,7 @@ static int yfs_deliver_fs_get_volume_status(struct afs_call *call)
 			return afs_protocol_error(call, -EBADMSG,
 						  afs_eproto_motd_len);
 		size = (call->count + 3) & ~3; /* It's padded */
-		afs_extract_begin(call, call->reply[2], size);
+		afs_extract_to_buf(call, size);
 		call->unmarshall++;
 
 		/* Fall through - and extract the message of the day */
@@ -1701,7 +1699,7 @@ static int yfs_deliver_fs_get_volume_status(struct afs_call *call)
 		if (ret < 0)
 			return ret;
 
-		p = call->reply[2];
+		p = call->buffer;
 		p[call->count] = 0;
 		_debug("motd '%s'", p);
 
@@ -1716,16 +1714,6 @@ static int yfs_deliver_fs_get_volume_status(struct afs_call *call)
 	return 0;
 }
 
-/*
- * Destroy a YFS.GetVolumeStatus call.
- */
-static void yfs_get_volume_status_call_destructor(struct afs_call *call)
-{
-	kfree(call->reply[2]);
-	call->reply[2] = NULL;
-	afs_flat_call_destructor(call);
-}
-
 /*
  * YFS.GetVolumeStatus operation type
  */
@@ -1733,7 +1721,7 @@ static const struct afs_call_type yfs_RXYFSGetVolumeStatus = {
 	.name		= "YFS.GetVolumeStatus",
 	.op		= yfs_FS_GetVolumeStatus,
 	.deliver	= yfs_deliver_fs_get_volume_status,
-	.destructor	= yfs_get_volume_status_call_destructor,
+	.destructor	= afs_flat_call_destructor,
 };
 
 /*
@@ -1746,28 +1734,21 @@ int yfs_fs_get_volume_status(struct afs_fs_cursor *fc,
 	struct afs_call *call;
 	struct afs_net *net = afs_v2net(vnode);
 	__be32 *bp;
-	void *tmpbuf;
 
 	_enter("");
 
-	tmpbuf = kmalloc(AFSOPAQUEMAX, GFP_KERNEL);
-	if (!tmpbuf)
-		return -ENOMEM;
-
 	call = afs_alloc_flat_call(net, &yfs_RXYFSGetVolumeStatus,
 				   sizeof(__be32) * 2 +
 				   sizeof(struct yfs_xdr_u64),
-				   sizeof(struct yfs_xdr_YFSFetchVolumeStatus) +
-				   sizeof(__be32));
-	if (!call) {
-		kfree(tmpbuf);
+				   max_t(size_t,
+					 sizeof(struct yfs_xdr_YFSFetchVolumeStatus) +
+					 sizeof(__be32),
+					 AFSOPAQUEMAX + 1));
+	if (!call)
 		return -ENOMEM;
-	}
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
-	call->reply[1] = vs;
-	call->reply[2] = tmpbuf;
+	call->out_volstatus = vs;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -1789,7 +1770,7 @@ int yfs_fs_get_volume_status(struct afs_fs_cursor *fc,
  */
 static int yfs_deliver_status_and_volsync(struct afs_call *call)
 {
-	struct afs_vnode *vnode = call->reply[0];
+	struct afs_vnode *vnode = call->xvnode;
 	const __be32 *bp;
 	int ret;
 
@@ -1865,7 +1846,7 @@ int yfs_fs_set_lock(struct afs_fs_cursor *fc, afs_lock_type_t type)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
+	call->xvnode = vnode;
 	call->want_reply_time = true;
 
 	/* marshall the parameters */
@@ -1904,7 +1885,7 @@ int yfs_fs_extend_lock(struct afs_fs_cursor *fc)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
+	call->xvnode = vnode;
 	call->want_reply_time = true;
 
 	/* marshall the parameters */
@@ -1942,7 +1923,7 @@ int yfs_fs_release_lock(struct afs_fs_cursor *fc)
 		return -ENOMEM;
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
+	call->xvnode = vnode;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -1963,10 +1944,9 @@ int yfs_fs_release_lock(struct afs_fs_cursor *fc)
  */
 static int yfs_deliver_fs_fetch_status(struct afs_call *call)
 {
-	struct afs_file_status *status = call->reply[1];
-	struct afs_callback *callback = call->reply[2];
-	struct afs_volsync *volsync = call->reply[3];
-	struct afs_vnode *vnode = call->reply[0];
+	struct afs_file_status *status = call->out_extra_status;
+	struct afs_callback *callback = call->out_cb;
+	struct afs_volsync *volsync = call->out_volsync;
 	const __be32 *bp;
 	int ret;
 
@@ -1974,11 +1954,11 @@ static int yfs_deliver_fs_fetch_status(struct afs_call *call)
 	if (ret < 0)
 		return ret;
 
-	_enter("{%llx:%llu}", vnode->fid.vid, vnode->fid.vnode);
+	_enter("");
 
 	/* unmarshall the reply once we've received all of it */
 	bp = call->buffer;
-	ret = yfs_decode_status(call, &bp, status, vnode,
+	ret = yfs_decode_status(call, &bp, status, NULL,
 				&call->expected_version, NULL);
 	if (ret < 0)
 		return ret;
@@ -2027,10 +2007,9 @@ int yfs_fs_fetch_status(struct afs_fs_cursor *fc,
 	}
 
 	call->key = fc->key;
-	call->reply[0] = NULL; /* vnode for fid[0] */
-	call->reply[1] = status;
-	call->reply[2] = callback;
-	call->reply[3] = volsync;
+	call->out_extra_status = status;
+	call->out_cb = callback;
+	call->out_volsync = volsync;
 	call->expected_version = 1; /* vnode->status.data_version */
 
 	/* marshall the parameters */
@@ -2093,7 +2072,7 @@ static int yfs_deliver_fs_inline_bulk_status(struct afs_call *call)
 			return ret;
 
 		bp = call->buffer;
-		statuses = call->reply[1];
+		statuses = call->out_extra_status;
 		ret = yfs_decode_status(call, &bp, &statuses[call->count],
 					NULL, NULL, NULL);
 		if (ret < 0)
@@ -2134,7 +2113,7 @@ static int yfs_deliver_fs_inline_bulk_status(struct afs_call *call)
 
 		_debug("unmarshall CB array");
 		bp = call->buffer;
-		callbacks = call->reply[2];
+		callbacks = call->out_cb;
 		xdr_decode_YFSCallBack_raw(call, &callbacks[call->count], &bp);
 		call->count++;
 		if (call->count < call->count2)
@@ -2150,7 +2129,7 @@ static int yfs_deliver_fs_inline_bulk_status(struct afs_call *call)
 			return ret;
 
 		bp = call->buffer;
-		xdr_decode_YFSVolSync(&bp, call->reply[3]);
+		xdr_decode_YFSVolSync(&bp, call->out_volsync);
 
 		call->unmarshall++;
 
@@ -2203,9 +2182,9 @@ int yfs_fs_inline_bulk_status(struct afs_fs_cursor *fc,
 	}
 
 	call->key = fc->key;
-	call->reply[1] = statuses;
-	call->reply[2] = callbacks;
-	call->reply[3] = volsync;
+	call->out_extra_status = statuses;
+	call->out_cb = callbacks;
+	call->out_volsync = volsync;
 	call->count2 = nr_fids;
 
 	/* marshall the parameters */
@@ -2230,9 +2209,9 @@ int yfs_fs_inline_bulk_status(struct afs_fs_cursor *fc,
  */
 static int yfs_deliver_fs_fetch_opaque_acl(struct afs_call *call)
 {
-	struct afs_volsync *volsync = call->reply[2];
-	struct afs_vnode *vnode = call->reply[1];
-	struct yfs_acl *yacl =  call->reply[0];
+	struct afs_volsync *volsync = call->out_volsync;
+	struct afs_vnode *vnode = call->xvnode;
+	struct yfs_acl *yacl = call->out_yacl;
 	struct afs_acl *acl;
 	const __be32 *bp;
 	unsigned int size;
@@ -2378,9 +2357,9 @@ struct yfs_acl *yfs_fs_fetch_opaque_acl(struct afs_fs_cursor *fc,
 	}
 
 	call->key = fc->key;
-	call->reply[0] = yacl;
-	call->reply[1] = vnode;
-	call->reply[2] = NULL; /* volsync */
+	call->out_yacl = yacl;
+	call->xvnode = vnode;
+	call->out_volsync = NULL; /* volsync */
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -2433,8 +2412,8 @@ int yfs_fs_store_opaque_acl2(struct afs_fs_cursor *fc, const struct afs_acl *acl
 	}
 
 	call->key = fc->key;
-	call->reply[0] = vnode;
-	call->reply[2] = NULL; /* volsync */
+	call->xvnode = vnode;
+	call->out_volsync = NULL;
 
 	/* marshall the parameters */
 	bp = call->request;


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
