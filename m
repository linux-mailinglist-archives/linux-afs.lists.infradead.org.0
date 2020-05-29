Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA221E8AAF
	for <lists+linux-afs@lfdr.de>; Sat, 30 May 2020 00:01:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Hy0uRrgdoOEytwJC79a+PVBAeB0MdPJZOfI77VmUj0=; b=i3Bl1thcdDn3Pp
	NoUHwbK4LnucNgkze9lNJgNGcnZi0DkbbqpDlz343C3QRH8oIcNLHrTPjnqVf+xpoqpxDJjl8rgOi
	iHV34DsBdNn00K+dP5m1XM8Ifo6xdG8U/N78UFic0K+JjTHEIrbuaaJCDTAxerrxopo6UzfqWY09m
	ABGmbeqSxWhRgFkfaYYbS5UVpQ9B3SvGUtM3/NMdZld7UHlN9LLoOYqJ9X+xQ4tcGoW+MgOduaLtm
	mwq2CY/sHyaB6zDPZ3McRkfvIIdcUN5Ic9x+T48silGPgzIkWOC54GQ+qHoqnSKeHNGN03sMKEGCP
	GAoxtI9iT4Xx/T8Gy1Cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jen4H-0001yN-RE; Fri, 29 May 2020 22:01:33 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jen4E-0001xF-MH
 for linux-afs@lists.infradead.org; Fri, 29 May 2020 22:01:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590789689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wzpdmy75UYk1OT3SRitsfYQj3Mizq+8m+XIlY5FDFZU=;
 b=Y8rZVItmGLz7xzYHByVsMmP5npge06+EJHMNXGvATzdFdi4J2ScUp+yPNVoVaJbhFBI4V6
 LeuxtgUQtEUXmp5wN0JhLDZbrf2g1EVCL7w6nn/FnjUdo8dMY/o1zDAxfRGtdnBa+1ODG9
 r+X7hB5/V42iGRsvNZ/Lf0LpmuoaPV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-0j1s0ayYNUqUzffA_1KfWQ-1; Fri, 29 May 2020 18:01:27 -0400
X-MC-Unique: 0j1s0ayYNUqUzffA_1KfWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C822880B71E;
 Fri, 29 May 2020 22:01:26 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF9405D9D7;
 Fri, 29 May 2020 22:01:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 11/27] afs: Remove the error argument from afs_protocol_error()
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 29 May 2020 23:01:25 +0100
Message-ID: <159078968501.679399.6413549414298663092.stgit@warthog.procyon.org.uk>
In-Reply-To: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
References: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_150131_093039_72FA3005 
X-CRM114-Status: GOOD (  14.16  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.139.110.120 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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

Remove the error argument from afs_protocol_error() as it's always
-EBADMSG.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/cmservice.c         |    9 +++------
 fs/afs/fsclient.c          |   17 ++++++-----------
 fs/afs/inode.c             |    4 ++--
 fs/afs/internal.h          |    2 +-
 fs/afs/rxrpc.c             |    6 +++---
 fs/afs/vlclient.c          |   34 ++++++++++++++--------------------
 fs/afs/yfsclient.c         |   17 ++++++-----------
 include/trace/events/afs.h |   10 ++++------
 8 files changed, 39 insertions(+), 60 deletions(-)

diff --git a/fs/afs/cmservice.c b/fs/afs/cmservice.c
index 7ae88958051f..ed0fb34d77dd 100644
--- a/fs/afs/cmservice.c
+++ b/fs/afs/cmservice.c
@@ -307,8 +307,7 @@ static int afs_deliver_cb_callback(struct afs_call *call)
 		call->count = ntohl(call->tmp);
 		_debug("FID count: %u", call->count);
 		if (call->count > AFSCBMAX)
-			return afs_protocol_error(call, -EBADMSG,
-						  afs_eproto_cb_fid_count);
+			return afs_protocol_error(call, afs_eproto_cb_fid_count);
 
 		call->buffer = kmalloc(array3_size(call->count, 3, 4),
 				       GFP_KERNEL);
@@ -353,8 +352,7 @@ static int afs_deliver_cb_callback(struct afs_call *call)
 		call->count2 = ntohl(call->tmp);
 		_debug("CB count: %u", call->count2);
 		if (call->count2 != call->count && call->count2 != 0)
-			return afs_protocol_error(call, -EBADMSG,
-						  afs_eproto_cb_count);
+			return afs_protocol_error(call, afs_eproto_cb_count);
 		call->iter = &call->def_iter;
 		iov_iter_discard(&call->def_iter, READ, call->count2 * 3 * 4);
 		call->unmarshall++;
@@ -674,8 +672,7 @@ static int afs_deliver_yfs_cb_callback(struct afs_call *call)
 		call->count = ntohl(call->tmp);
 		_debug("FID count: %u", call->count);
 		if (call->count > YFSCBMAX)
-			return afs_protocol_error(call, -EBADMSG,
-						  afs_eproto_cb_fid_count);
+			return afs_protocol_error(call, afs_eproto_cb_fid_count);
 
 		size = array_size(call->count, sizeof(struct yfs_xdr_YFSFid));
 		call->buffer = kmalloc(size, GFP_KERNEL);
diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index b1d8d8f780d2..7d4503174dd1 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -130,7 +130,7 @@ static void xdr_decode_AFSFetchStatus(const __be32 **_bp,
 
 bad:
 	xdr_dump_bad(*_bp);
-	afs_protocol_error(call, -EBADMSG, afs_eproto_bad_status);
+	afs_protocol_error(call, afs_eproto_bad_status);
 	goto advance;
 }
 
@@ -1470,8 +1470,7 @@ static int afs_deliver_fs_get_volume_status(struct afs_call *call)
 		call->count = ntohl(call->tmp);
 		_debug("volname length: %u", call->count);
 		if (call->count >= AFSNAMEMAX)
-			return afs_protocol_error(call, -EBADMSG,
-						  afs_eproto_volname_len);
+			return afs_protocol_error(call, afs_eproto_volname_len);
 		size = (call->count + 3) & ~3; /* It's padded */
 		afs_extract_to_buf(call, size);
 		call->unmarshall++;
@@ -1500,8 +1499,7 @@ static int afs_deliver_fs_get_volume_status(struct afs_call *call)
 		call->count = ntohl(call->tmp);
 		_debug("offline msg length: %u", call->count);
 		if (call->count >= AFSNAMEMAX)
-			return afs_protocol_error(call, -EBADMSG,
-						  afs_eproto_offline_msg_len);
+			return afs_protocol_error(call, afs_eproto_offline_msg_len);
 		size = (call->count + 3) & ~3; /* It's padded */
 		afs_extract_to_buf(call, size);
 		call->unmarshall++;
@@ -1531,8 +1529,7 @@ static int afs_deliver_fs_get_volume_status(struct afs_call *call)
 		call->count = ntohl(call->tmp);
 		_debug("motd length: %u", call->count);
 		if (call->count >= AFSNAMEMAX)
-			return afs_protocol_error(call, -EBADMSG,
-						  afs_eproto_motd_len);
+			return afs_protocol_error(call, afs_eproto_motd_len);
 		size = (call->count + 3) & ~3; /* It's padded */
 		afs_extract_to_buf(call, size);
 		call->unmarshall++;
@@ -2012,8 +2009,7 @@ static int afs_deliver_fs_inline_bulk_status(struct afs_call *call)
 		tmp = ntohl(call->tmp);
 		_debug("status count: %u/%u", tmp, call->count2);
 		if (tmp != call->count2)
-			return afs_protocol_error(call, -EBADMSG,
-						  afs_eproto_ibulkst_count);
+			return afs_protocol_error(call, afs_eproto_ibulkst_count);
 
 		call->count = 0;
 		call->unmarshall++;
@@ -2049,8 +2045,7 @@ static int afs_deliver_fs_inline_bulk_status(struct afs_call *call)
 		tmp = ntohl(call->tmp);
 		_debug("CB count: %u", tmp);
 		if (tmp != call->count2)
-			return afs_protocol_error(call, -EBADMSG,
-						  afs_eproto_ibulkst_cb_count);
+			return afs_protocol_error(call, afs_eproto_ibulkst_cb_count);
 		call->count = 0;
 		call->unmarshall++;
 	more_cbs:
diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 281470fe1183..07933d106e0e 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -130,7 +130,7 @@ static int afs_inode_init_from_status(struct afs_vnode *vnode, struct key *key,
 	default:
 		dump_vnode(vnode, parent_vnode);
 		write_sequnlock(&vnode->cb_lock);
-		return afs_protocol_error(NULL, -EBADMSG, afs_eproto_file_type);
+		return afs_protocol_error(NULL, afs_eproto_file_type);
 	}
 
 	afs_set_i_size(vnode, status->size);
@@ -179,7 +179,7 @@ static void afs_apply_status(struct afs_fs_cursor *fc,
 			vnode->fid.vnode,
 			vnode->fid.unique,
 			status->type, vnode->status.type);
-		afs_protocol_error(NULL, -EBADMSG, afs_eproto_bad_status);
+		afs_protocol_error(NULL, afs_eproto_bad_status);
 		return;
 	}
 
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 6d5c66dd76de..468bd2b0470d 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -1133,7 +1133,7 @@ extern void afs_flat_call_destructor(struct afs_call *);
 extern void afs_send_empty_reply(struct afs_call *);
 extern void afs_send_simple_reply(struct afs_call *, const void *, size_t);
 extern int afs_extract_data(struct afs_call *, bool);
-extern int afs_protocol_error(struct afs_call *, int, enum afs_eproto_cause);
+extern int afs_protocol_error(struct afs_call *, enum afs_eproto_cause);
 
 static inline void afs_set_fc_call(struct afs_call *call, struct afs_fs_cursor *fc)
 {
diff --git a/fs/afs/rxrpc.c b/fs/afs/rxrpc.c
index c84d571782d7..00b87bac4fec 100644
--- a/fs/afs/rxrpc.c
+++ b/fs/afs/rxrpc.c
@@ -961,11 +961,11 @@ int afs_extract_data(struct afs_call *call, bool want_more)
 /*
  * Log protocol error production.
  */
-noinline int afs_protocol_error(struct afs_call *call, int error,
+noinline int afs_protocol_error(struct afs_call *call,
 				enum afs_eproto_cause cause)
 {
-	trace_afs_protocol_error(call, error, cause);
+	trace_afs_protocol_error(call, cause);
 	if (call)
 		call->unmarshalling_error = true;
-	return error;
+	return -EBADMSG;
 }
diff --git a/fs/afs/vlclient.c b/fs/afs/vlclient.c
index 972dc5512f33..d0c85623ce8f 100644
--- a/fs/afs/vlclient.c
+++ b/fs/afs/vlclient.c
@@ -448,8 +448,7 @@ static int afs_deliver_yfsvl_get_endpoints(struct afs_call *call)
 		call->count2	= ntohl(*bp); /* Type or next count */
 
 		if (call->count > YFS_MAXENDPOINTS)
-			return afs_protocol_error(call, -EBADMSG,
-						  afs_eproto_yvl_fsendpt_num);
+			return afs_protocol_error(call, afs_eproto_yvl_fsendpt_num);
 
 		alist = afs_alloc_addrlist(call->count, FS_SERVICE, AFS_FS_PORT);
 		if (!alist)
@@ -469,8 +468,7 @@ static int afs_deliver_yfsvl_get_endpoints(struct afs_call *call)
 			size = sizeof(__be32) * (1 + 4 + 1);
 			break;
 		default:
-			return afs_protocol_error(call, -EBADMSG,
-						  afs_eproto_yvl_fsendpt_type);
+			return afs_protocol_error(call, afs_eproto_yvl_fsendpt_type);
 		}
 
 		size += sizeof(__be32);
@@ -488,21 +486,20 @@ static int afs_deliver_yfsvl_get_endpoints(struct afs_call *call)
 		switch (call->count2) {
 		case YFS_ENDPOINT_IPV4:
 			if (ntohl(bp[0]) != sizeof(__be32) * 2)
-				return afs_protocol_error(call, -EBADMSG,
-							  afs_eproto_yvl_fsendpt4_len);
+				return afs_protocol_error(
+					call, afs_eproto_yvl_fsendpt4_len);
 			afs_merge_fs_addr4(alist, bp[1], ntohl(bp[2]));
 			bp += 3;
 			break;
 		case YFS_ENDPOINT_IPV6:
 			if (ntohl(bp[0]) != sizeof(__be32) * 5)
-				return afs_protocol_error(call, -EBADMSG,
-							  afs_eproto_yvl_fsendpt6_len);
+				return afs_protocol_error(
+					call, afs_eproto_yvl_fsendpt6_len);
 			afs_merge_fs_addr6(alist, bp + 1, ntohl(bp[5]));
 			bp += 6;
 			break;
 		default:
-			return afs_protocol_error(call, -EBADMSG,
-						  afs_eproto_yvl_fsendpt_type);
+			return afs_protocol_error(call, afs_eproto_yvl_fsendpt_type);
 		}
 
 		/* Got either the type of the next entry or the count of
@@ -520,8 +517,7 @@ static int afs_deliver_yfsvl_get_endpoints(struct afs_call *call)
 		if (!call->count)
 			goto end;
 		if (call->count > YFS_MAXENDPOINTS)
-			return afs_protocol_error(call, -EBADMSG,
-						  afs_eproto_yvl_vlendpt_type);
+			return afs_protocol_error(call, afs_eproto_yvl_vlendpt_type);
 
 		afs_extract_to_buf(call, 1 * sizeof(__be32));
 		call->unmarshall = 3;
@@ -548,8 +544,7 @@ static int afs_deliver_yfsvl_get_endpoints(struct afs_call *call)
 			size = sizeof(__be32) * (1 + 4 + 1);
 			break;
 		default:
-			return afs_protocol_error(call, -EBADMSG,
-						  afs_eproto_yvl_vlendpt_type);
+			return afs_protocol_error(call, afs_eproto_yvl_vlendpt_type);
 		}
 
 		if (call->count > 1)
@@ -567,19 +562,18 @@ static int afs_deliver_yfsvl_get_endpoints(struct afs_call *call)
 		switch (call->count2) {
 		case YFS_ENDPOINT_IPV4:
 			if (ntohl(bp[0]) != sizeof(__be32) * 2)
-				return afs_protocol_error(call, -EBADMSG,
-							  afs_eproto_yvl_vlendpt4_len);
+				return afs_protocol_error(
+					call, afs_eproto_yvl_vlendpt4_len);
 			bp += 3;
 			break;
 		case YFS_ENDPOINT_IPV6:
 			if (ntohl(bp[0]) != sizeof(__be32) * 5)
-				return afs_protocol_error(call, -EBADMSG,
-							  afs_eproto_yvl_vlendpt6_len);
+				return afs_protocol_error(
+					call, afs_eproto_yvl_vlendpt6_len);
 			bp += 6;
 			break;
 		default:
-			return afs_protocol_error(call, -EBADMSG,
-						  afs_eproto_yvl_vlendpt_type);
+			return afs_protocol_error(call, afs_eproto_yvl_vlendpt_type);
 		}
 
 		/* Got either the type of the next entry or the count of
diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index f118daa5f33a..bf74c679c02b 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -226,7 +226,7 @@ static void xdr_decode_YFSFetchStatus(const __be32 **_bp,
 
 bad:
 	xdr_dump_bad(*_bp);
-	afs_protocol_error(call, -EBADMSG, afs_eproto_bad_status);
+	afs_protocol_error(call, afs_eproto_bad_status);
 	goto advance;
 }
 
@@ -1426,8 +1426,7 @@ static int yfs_deliver_fs_get_volume_status(struct afs_call *call)
 		call->count = ntohl(call->tmp);
 		_debug("volname length: %u", call->count);
 		if (call->count >= AFSNAMEMAX)
-			return afs_protocol_error(call, -EBADMSG,
-						  afs_eproto_volname_len);
+			return afs_protocol_error(call, afs_eproto_volname_len);
 		size = (call->count + 3) & ~3; /* It's padded */
 		afs_extract_to_buf(call, size);
 		call->unmarshall++;
@@ -1456,8 +1455,7 @@ static int yfs_deliver_fs_get_volume_status(struct afs_call *call)
 		call->count = ntohl(call->tmp);
 		_debug("offline msg length: %u", call->count);
 		if (call->count >= AFSNAMEMAX)
-			return afs_protocol_error(call, -EBADMSG,
-						  afs_eproto_offline_msg_len);
+			return afs_protocol_error(call, afs_eproto_offline_msg_len);
 		size = (call->count + 3) & ~3; /* It's padded */
 		afs_extract_to_buf(call, size);
 		call->unmarshall++;
@@ -1487,8 +1485,7 @@ static int yfs_deliver_fs_get_volume_status(struct afs_call *call)
 		call->count = ntohl(call->tmp);
 		_debug("motd length: %u", call->count);
 		if (call->count >= AFSNAMEMAX)
-			return afs_protocol_error(call, -EBADMSG,
-						  afs_eproto_motd_len);
+			return afs_protocol_error(call, afs_eproto_motd_len);
 		size = (call->count + 3) & ~3; /* It's padded */
 		afs_extract_to_buf(call, size);
 		call->unmarshall++;
@@ -1797,8 +1794,7 @@ static int yfs_deliver_fs_inline_bulk_status(struct afs_call *call)
 		tmp = ntohl(call->tmp);
 		_debug("status count: %u/%u", tmp, call->count2);
 		if (tmp != call->count2)
-			return afs_protocol_error(call, -EBADMSG,
-						  afs_eproto_ibulkst_count);
+			return afs_protocol_error(call, afs_eproto_ibulkst_count);
 
 		call->count = 0;
 		call->unmarshall++;
@@ -1835,8 +1831,7 @@ static int yfs_deliver_fs_inline_bulk_status(struct afs_call *call)
 		tmp = ntohl(call->tmp);
 		_debug("CB count: %u", tmp);
 		if (tmp != call->count2)
-			return afs_protocol_error(call, -EBADMSG,
-						  afs_eproto_ibulkst_cb_count);
+			return afs_protocol_error(call, afs_eproto_ibulkst_cb_count);
 		call->count = 0;
 		call->unmarshall++;
 	more_cbs:
diff --git a/include/trace/events/afs.h b/include/trace/events/afs.h
index 19a07fbf35df..a6d8a9891164 100644
--- a/include/trace/events/afs.h
+++ b/include/trace/events/afs.h
@@ -994,24 +994,22 @@ TRACE_EVENT(afs_edit_dir,
 	    );
 
 TRACE_EVENT(afs_protocol_error,
-	    TP_PROTO(struct afs_call *call, int error, enum afs_eproto_cause cause),
+	    TP_PROTO(struct afs_call *call, enum afs_eproto_cause cause),
 
-	    TP_ARGS(call, error, cause),
+	    TP_ARGS(call, cause),
 
 	    TP_STRUCT__entry(
 		    __field(unsigned int,		call		)
-		    __field(int,			error		)
 		    __field(enum afs_eproto_cause,	cause		)
 			     ),
 
 	    TP_fast_assign(
 		    __entry->call = call ? call->debug_id : 0;
-		    __entry->error = error;
 		    __entry->cause = cause;
 			   ),
 
-	    TP_printk("c=%08x r=%d %s",
-		      __entry->call, __entry->error,
+	    TP_printk("c=%08x %s",
+		      __entry->call,
 		      __print_symbolic(__entry->cause, afs_eproto_causes))
 	    );
 



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
