Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF5812D9C9
	for <lists+linux-afs@lfdr.de>; Tue, 31 Dec 2019 16:25:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z13wUcNy29+HmkMOWuuRkWRPne4s/DDgdH/KPic1T7M=; b=kbLCP9PjaRWzCU
	UriAFUcdihpcWyBu6ASEHJDxqziQtUiUdmTUy3uANCTbtG/qE87NyBBWyIeDaueVPU1SAZbBJb1Ik
	887tRaduRL8g/t7OSzslLu7r8H5LM3S9hLt7bHV365tUcLY/oVCw8vvCHNQw4oQ68FULa3Fvh1wAz
	NiXNjWAXVV2Ze+T1+XeiVWH352CrK1nPaqAtXuZmvchioxWKm4YAJCyw3K5HWIlmeSB/ouwMg0CNy
	0dn06jrUjTQNRCoUTxeLgr2x43lHGFR2NOQkRnniD00RyhSh4UWzmbJiplyHp6582ftMTB8ZoUzQb
	qQDdDpjY5nm84KEnAEHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imJOL-0002Yg-QB; Tue, 31 Dec 2019 15:25:05 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imJOI-000258-T5
 for linux-afs@lists.infradead.org; Tue, 31 Dec 2019 15:25:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577805901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PbZ2iYquyHL3/ESJhoyXhT4LrB0J4rJjHgCtbtkH6oU=;
 b=APvrgGEus6IIyHG+GBO9s3dEUKSpIwXlmjSpZWA5YGVs2FDBRRS6JtF/z2vlCjOPq4CXdy
 ZdGcRMfCJETNiUDvp0Iv3BrA8oZNhu0wDuClJcB3/YEQcbJk6+lYvnNjMd/k7L1/zvh7uJ
 yOnR+TdQXugMZQb7qliLrkgFSCS/qiY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-rr9HIQspOn-0-B7a57xWlQ-1; Tue, 31 Dec 2019 10:24:58 -0500
X-MC-Unique: rr9HIQspOn-0-B7a57xWlQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BDF21883520;
 Tue, 31 Dec 2019 15:24:57 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-52.rdu2.redhat.com
 [10.10.120.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A20381E35;
 Tue, 31 Dec 2019 15:24:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 2/3] afs: Fix use-after-loss-of-ref
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Tue, 31 Dec 2019 15:24:55 +0000
Message-ID: <157780589537.25571.1965637589354532477.stgit@warthog.procyon.org.uk>
In-Reply-To: <157780588822.25571.7926816048227538205.stgit@warthog.procyon.org.uk>
References: <157780588822.25571.7926816048227538205.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191231_072503_041851_66E97B5A 
X-CRM114-Status: GOOD (  13.63  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
 keyrings@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

afs_lookup() has a tracepoint to indicate the outcome of d_splice_alias(),
passing it the inode to retrieve the fid from.  However, the function gave
up its ref on that inode when it called d_splice_alias(), which may have
failed and dropped the inode.

Fix this by caching the fid.

Fixes: 80548b03991f ("afs: Add more tracepoints")
Reported-by: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/dir.c               |   12 +++++++-----
 include/trace/events/afs.h |   12 +++---------
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index 497f979018c2..813db1708494 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -908,6 +908,7 @@ static struct dentry *afs_lookup(struct inode *dir, struct dentry *dentry,
 				 unsigned int flags)
 {
 	struct afs_vnode *dvnode = AFS_FS_I(dir);
+	struct afs_fid fid = {};
 	struct inode *inode;
 	struct dentry *d;
 	struct key *key;
@@ -957,15 +958,16 @@ static struct dentry *afs_lookup(struct inode *dir, struct dentry *dentry,
 		dentry->d_fsdata =
 			(void *)(unsigned long)dvnode->status.data_version;
 	}
+
+	if (!IS_ERR_OR_NULL(inode))
+		fid = AFS_FS_I(inode)->fid;
+
 	d = d_splice_alias(inode, dentry);
 	if (!IS_ERR_OR_NULL(d)) {
 		d->d_fsdata = dentry->d_fsdata;
-		trace_afs_lookup(dvnode, &d->d_name,
-				 inode ? AFS_FS_I(inode) : NULL);
+		trace_afs_lookup(dvnode, &d->d_name, &fid);
 	} else {
-		trace_afs_lookup(dvnode, &dentry->d_name,
-				 IS_ERR_OR_NULL(inode) ? NULL
-				 : AFS_FS_I(inode));
+		trace_afs_lookup(dvnode, &dentry->d_name, &fid);
 	}
 	return d;
 }
diff --git a/include/trace/events/afs.h b/include/trace/events/afs.h
index d5ec4fac82ae..564ba1b5cf57 100644
--- a/include/trace/events/afs.h
+++ b/include/trace/events/afs.h
@@ -915,9 +915,9 @@ TRACE_EVENT(afs_call_state,
 
 TRACE_EVENT(afs_lookup,
 	    TP_PROTO(struct afs_vnode *dvnode, const struct qstr *name,
-		     struct afs_vnode *vnode),
+		     struct afs_fid *fid),
 
-	    TP_ARGS(dvnode, name, vnode),
+	    TP_ARGS(dvnode, name, fid),
 
 	    TP_STRUCT__entry(
 		    __field_struct(struct afs_fid,	dfid		)
@@ -928,13 +928,7 @@ TRACE_EVENT(afs_lookup,
 	    TP_fast_assign(
 		    int __len = min_t(int, name->len, 23);
 		    __entry->dfid = dvnode->fid;
-		    if (vnode) {
-			    __entry->fid = vnode->fid;
-		    } else {
-			    __entry->fid.vid = 0;
-			    __entry->fid.vnode = 0;
-			    __entry->fid.unique = 0;
-		    }
+		    __entry->fid = *fid;
 		    memcpy(__entry->name, name->name, __len);
 		    __entry->name[__len] = 0;
 			   ),


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
