Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4D01E8ABE
	for <lists+linux-afs@lfdr.de>; Sat, 30 May 2020 00:02:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+WAoXAePCsLb9FqIUcNCUxgUre9Zy+Luq/oDHdX3BBU=; b=olc9/SpFJLC7wO
	Jkd0X5SFHazHtDQbVPcILT/d6OZHALzGPpAMV0wzQcFL/qrcYWrs4Yf+Q1Glp5ep8pJEWwf1APgnf
	mi/k6hMLA7/5KhFYYmRBIsH0AG8qYXuXd7QBI7ina3Xs/oqeGsIDekBaFUSo8tOwv6y+sVP+d2QY6
	WOF5dbnb2DikpmndDDODI6Ido9vOb7hBVTgtc9KFJli8Q9Jc5MM1cIPZL937K7nq+ncAE7xP7gqFL
	kpYvdDuuHZWjTGNx3rmXCC2UEDzeqxHnCrPkHQ/nqM1GaF9rZqbZ6guVGCWJJbGSpCmZyxn+yGZT2
	+e/MmSjtmw6YkORsU2wQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jen4y-0002DX-5Z; Fri, 29 May 2020 22:02:16 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jen4v-0002B0-FI
 for linux-afs@lists.infradead.org; Fri, 29 May 2020 22:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590789732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=td3wUkgMmsmLo6pvsmyZIw+X4X46MZpbUJaWYRqcTg0=;
 b=aPaqy6ldso4nec2fSGFkNymqyz8K1M0h+D8AXR84pSzwxtOJ3AeqVMNxV8i8+k4U3Q6LJJ
 o/04/x3wdNz0H7zco9y+X1Ywqx8ATzsDKMjCPJm1HZXL8HNjU/z6VcUwhLfW1WALhfI741
 iPQUpkhjMovUOUMr8JQA33BRg4AyQ/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-6PgsIy6aOIyOTYn091ozSw-1; Fri, 29 May 2020 18:02:10 -0400
X-MC-Unique: 6PgsIy6aOIyOTYn091ozSw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB9F380183C;
 Fri, 29 May 2020 22:02:09 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E598D5C1B5;
 Fri, 29 May 2020 22:02:08 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 17/27] afs: Implement client support for the YFSVL.GetCellName
 RPC op
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 29 May 2020 23:02:08 +0100
Message-ID: <159078972817.679399.17315198460101750263.stgit@warthog.procyon.org.uk>
In-Reply-To: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
References: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_150213_583672_7E9E8925 
X-CRM114-Status: GOOD (  18.16  )
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

Implement client support for the YFSVL.GetCellName RPC operation by which
YFS permits the canonical cell name to be queried from a VL server.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/afs.h               |    2 -
 fs/afs/afs_vl.h            |    1 
 fs/afs/internal.h          |    2 +
 fs/afs/protocol_yfs.h      |    2 -
 fs/afs/vlclient.c          |  111 ++++++++++++++++++++++++++++++++++++++++++++
 include/trace/events/afs.h |    4 ++
 6 files changed, 120 insertions(+), 2 deletions(-)

diff --git a/fs/afs/afs.h b/fs/afs/afs.h
index f8e34406243e..432cb4b23961 100644
--- a/fs/afs/afs.h
+++ b/fs/afs/afs.h
@@ -10,7 +10,7 @@
 
 #include <linux/in.h>
 
-#define AFS_MAXCELLNAME		64  	/* Maximum length of a cell name */
+#define AFS_MAXCELLNAME		256  	/* Maximum length of a cell name */
 #define AFS_MAXVOLNAME		64  	/* Maximum length of a volume name */
 #define AFS_MAXNSERVERS		8   	/* Maximum servers in a basic volume record */
 #define AFS_NMAXNSERVERS	13  	/* Maximum servers in a N/U-class volume record */
diff --git a/fs/afs/afs_vl.h b/fs/afs/afs_vl.h
index e9b8029920ec..9c65ffb8a523 100644
--- a/fs/afs/afs_vl.h
+++ b/fs/afs/afs_vl.h
@@ -22,6 +22,7 @@ enum AFSVL_Operations {
 	VLGETENTRYBYNAMEU	= 527,	/* AFS Get VLDB entry by name (UUID-variant) */
 	VLGETADDRSU		= 533,	/* AFS Get addrs for fileserver */
 	YVLGETENDPOINTS		= 64002, /* YFS Get endpoints for file/volume server */
+	YVLGETCELLNAME		= 64014, /* YFS Get actual cell name */
 	VLGETCAPABILITIES	= 65537, /* AFS Get server capabilities */
 };
 
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index dce03e068cab..3606cfa50832 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -116,6 +116,7 @@ struct afs_call {
 		long			ret0;	/* Value to reply with instead of 0 */
 		struct afs_addr_list	*ret_alist;
 		struct afs_vldb_entry	*ret_vldb;
+		char			*ret_str;
 	};
 	struct afs_operation	*op;
 	unsigned int		server_index;
@@ -1373,6 +1374,7 @@ extern struct afs_addr_list *afs_vl_get_addrs_u(struct afs_vl_cursor *, const uu
 extern struct afs_call *afs_vl_get_capabilities(struct afs_net *, struct afs_addr_cursor *,
 						struct key *, struct afs_vlserver *, unsigned int);
 extern struct afs_addr_list *afs_yfsvl_get_endpoints(struct afs_vl_cursor *, const uuid_t *);
+extern char *afs_yfsvl_get_cell_name(struct afs_vl_cursor *);
 
 /*
  * vl_probe.c
diff --git a/fs/afs/protocol_yfs.h b/fs/afs/protocol_yfs.h
index 32be9c698348..b5bd03b1d3c7 100644
--- a/fs/afs/protocol_yfs.h
+++ b/fs/afs/protocol_yfs.h
@@ -8,7 +8,7 @@
 #define YFS_FS_SERVICE	2500
 #define YFS_CM_SERVICE	2501
 
-#define YFSCBMAX 1024
+#define YFSCBMAX	1024
 
 enum YFS_CM_Operations {
 	YFSCBProbe		= 206,	/* probe client */
diff --git a/fs/afs/vlclient.c b/fs/afs/vlclient.c
index d0c85623ce8f..fd82850cd424 100644
--- a/fs/afs/vlclient.c
+++ b/fs/afs/vlclient.c
@@ -645,3 +645,114 @@ struct afs_addr_list *afs_yfsvl_get_endpoints(struct afs_vl_cursor *vc,
 	afs_make_call(&vc->ac, call, GFP_KERNEL);
 	return (struct afs_addr_list *)afs_wait_for_call_to_complete(call, &vc->ac);
 }
+
+/*
+ * Deliver reply data to a YFSVL.GetCellName operation.
+ */
+static int afs_deliver_yfsvl_get_cell_name(struct afs_call *call)
+{
+	char *cell_name;
+	u32 namesz, paddedsz;
+	int ret;
+
+	_enter("{%u,%zu/%u}",
+	       call->unmarshall, iov_iter_count(call->iter), call->count);
+
+	switch (call->unmarshall) {
+	case 0:
+		afs_extract_to_tmp(call);
+		call->unmarshall++;
+
+		/* Fall through - and extract the cell name length */
+	case 1:
+		ret = afs_extract_data(call, true);
+		if (ret < 0)
+			return ret;
+
+		namesz = ntohl(call->tmp);
+		if (namesz > AFS_MAXCELLNAME)
+			return afs_protocol_error(call, afs_eproto_cellname_len);
+		paddedsz = (namesz + 3) & ~3;
+		call->count = namesz;
+		call->count2 = paddedsz - namesz;
+
+		cell_name = kmalloc(namesz + 1, GFP_KERNEL);
+		if (!cell_name)
+			return -ENOMEM;
+		cell_name[namesz] = 0;
+		call->ret_str = cell_name;
+
+		afs_extract_begin(call, cell_name, namesz);
+		call->unmarshall++;
+
+		/* Fall through - and extract cell name */
+	case 2:
+		ret = afs_extract_data(call, true);
+		if (ret < 0)
+			return ret;
+
+		afs_extract_discard(call, call->count2);
+		call->unmarshall++;
+
+		/* Fall through - and extract padding */
+	case 3:
+		ret = afs_extract_data(call, false);
+		if (ret < 0)
+			return ret;
+
+		call->unmarshall++;
+		break;
+	}
+
+	_leave(" = 0 [done]");
+	return 0;
+}
+
+static void afs_destroy_yfsvl_get_cell_name(struct afs_call *call)
+{
+	kfree(call->ret_str);
+	afs_flat_call_destructor(call);
+}
+
+/*
+ * VL.GetCapabilities operation type
+ */
+static const struct afs_call_type afs_YFSVLGetCellName = {
+	.name		= "YFSVL.GetCellName",
+	.op		= afs_YFSVL_GetCellName,
+	.deliver	= afs_deliver_yfsvl_get_cell_name,
+	.destructor	= afs_destroy_yfsvl_get_cell_name,
+};
+
+/*
+ * Probe a volume server for the capabilities that it supports.  This can
+ * return up to 196 words.
+ *
+ * We use this to probe for service upgrade to determine what the server at the
+ * other end supports.
+ */
+char *afs_yfsvl_get_cell_name(struct afs_vl_cursor *vc)
+{
+	struct afs_call *call;
+	struct afs_net *net = vc->cell->net;
+	__be32 *bp;
+
+	_enter("");
+
+	call = afs_alloc_flat_call(net, &afs_YFSVLGetCellName, 1 * 4, 0);
+	if (!call)
+		return ERR_PTR(-ENOMEM);
+
+	call->key = vc->key;
+	call->ret_str = NULL;
+	call->max_lifespan = AFS_VL_MAX_LIFESPAN;
+
+	/* marshall the parameters */
+	bp = call->request;
+	*bp++ = htonl(YVLGETCELLNAME);
+
+	/* Can't take a ref on server */
+	trace_afs_make_vl_call(call);
+	afs_make_call(&vc->ac, call, GFP_KERNEL);
+	return (char *)afs_wait_for_call_to_complete(call, &vc->ac);
+}
diff --git a/include/trace/events/afs.h b/include/trace/events/afs.h
index f4d66919fb22..f320b3ad54da 100644
--- a/include/trace/events/afs.h
+++ b/include/trace/events/afs.h
@@ -111,6 +111,7 @@ enum afs_vl_operation {
 	afs_VL_GetEntryByNameU	= 527,		/* AFS Get Vol Entry By Name operation ID */
 	afs_VL_GetAddrsU	= 533,		/* AFS Get FS server addresses */
 	afs_YFSVL_GetEndpoints	= 64002,	/* YFS Get FS & Vol server addresses */
+	afs_YFSVL_GetCellName	= 64014,	/* YFS Get actual cell name */
 	afs_VL_GetCapabilities	= 65537,	/* AFS Get VL server capabilities */
 };
 
@@ -143,6 +144,7 @@ enum afs_eproto_cause {
 	afs_eproto_bad_status,
 	afs_eproto_cb_count,
 	afs_eproto_cb_fid_count,
+	afs_eproto_cellname_len,
 	afs_eproto_file_type,
 	afs_eproto_ibulkst_cb_count,
 	afs_eproto_ibulkst_count,
@@ -316,6 +318,7 @@ enum afs_cb_break_reason {
 	EM(afs_VL_GetEntryByNameU,		"VL.GetEntryByNameU") \
 	EM(afs_VL_GetAddrsU,			"VL.GetAddrsU") \
 	EM(afs_YFSVL_GetEndpoints,		"YFSVL.GetEndpoints") \
+	EM(afs_YFSVL_GetCellName,		"YFSVL.GetCellName") \
 	E_(afs_VL_GetCapabilities,		"VL.GetCapabilities")
 
 #define afs_edit_dir_ops				  \
@@ -345,6 +348,7 @@ enum afs_cb_break_reason {
 	EM(afs_eproto_bad_status,	"BadStatus") \
 	EM(afs_eproto_cb_count,		"CbCount") \
 	EM(afs_eproto_cb_fid_count,	"CbFidCount") \
+	EM(afs_eproto_cellname_len,	"CellNameLen") \
 	EM(afs_eproto_file_type,	"FileTYpe") \
 	EM(afs_eproto_ibulkst_cb_count,	"IBS.CbCount") \
 	EM(afs_eproto_ibulkst_count,	"IBS.FidCount") \



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
