Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5C91B7954
	for <lists+linux-afs@lfdr.de>; Fri, 24 Apr 2020 17:20:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffhYPFObLzA738Cwsp32z/lz/awIU9u8yRGM5KdPq9U=; b=lKP8tA6OY1N8LZ
	0mrwjwCHSr8qU5dHnHw0j3gK438FiktuwHIbv1fA/FEiyzdHOFk9gxM/gYiEWYkELlc40mo3chxGG
	Wg7ydYAKYm1ntjIclJODBGzhoDKcKmioPUQmYtIibYSM/6QzP5rTzHILGSb9KczfDoQUs96aL6k7d
	Ye/svBK9jSxfDL3TNvl52E3GfHkKbaAe8oeEp8S+Ai9ush2vEMBiyHM1v947kiIT7FWvhdV61r48G
	v6659KXVNKxQww5YyA3kx3r3poipmvvuib3DHpZawr1gPn9kChpxJEI6kgUeXqhwY2WD0AgVnvLWr
	zLLcLTbqz3fA2tN0/sOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS07d-0004MS-V7
	for lists+linux-afs@lfdr.de; Fri, 24 Apr 2020 15:20:09 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS07a-0003Cs-Eo
 for linux-afs@lists.infradead.org; Fri, 24 Apr 2020 15:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587741605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q1UIvPO2OeK7xnyzKLufwvPJpLv8Bjq2NUDTIoZpR/E=;
 b=U5i/QaJOmTVq/OaZQTdIew8+4T0Wewn7AZpj+lhB2CeONyWXBa14sAcQg6+lGPtHLgfIHI
 7eK6HnqXL6Y+cpFm0wTMVOXypyYmTX/+tvEXLpcyD4B/u+/qbRbeAU6q+ipIi1IwYWXM75
 P2pxomWf/4jX3wtARWzzWsjXHZMbQt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-ENBiw4WGNR6bOFCCtfvNpQ-1; Fri, 24 Apr 2020 11:20:03 -0400
X-MC-Unique: ENBiw4WGNR6bOFCCtfvNpQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C8411800D51;
 Fri, 24 Apr 2020 15:20:02 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-129.rdu2.redhat.com
 [10.10.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 633E6600F5;
 Fri, 24 Apr 2020 15:20:01 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 2/8] afs: Make record checking use TASK_UNINTERRUPTIBLE when
 appropriate
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 24 Apr 2020 16:20:00 +0100
Message-ID: <158774160071.3619859.1408458755440831935.stgit@warthog.procyon.org.uk>
In-Reply-To: <158774158625.3619859.10579201535876583842.stgit@warthog.procyon.org.uk>
References: <158774158625.3619859.10579201535876583842.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_082006_580190_33D295D7 
X-CRM114-Status: GOOD (  14.48  )
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

When an operation is meant to be done uninterruptibly (such as
FS.StoreData), we should not be allowing volume and server record checking
to be interrupted.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/internal.h |    2 +-
 fs/afs/rotate.c   |    6 +++---
 fs/afs/server.c   |    7 ++-----
 fs/afs/volume.c   |    8 +++++---
 4 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index ef732dd4e7ef..15ae9c7f9c00 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -1335,7 +1335,7 @@ extern struct afs_volume *afs_create_volume(struct afs_fs_context *);
 extern void afs_activate_volume(struct afs_volume *);
 extern void afs_deactivate_volume(struct afs_volume *);
 extern void afs_put_volume(struct afs_cell *, struct afs_volume *);
-extern int afs_check_volume_status(struct afs_volume *, struct key *);
+extern int afs_check_volume_status(struct afs_volume *, struct afs_fs_cursor *);
 
 /*
  * write.c
diff --git a/fs/afs/rotate.c b/fs/afs/rotate.c
index 172ba569cd60..2a3305e42b14 100644
--- a/fs/afs/rotate.c
+++ b/fs/afs/rotate.c
@@ -192,7 +192,7 @@ bool afs_select_fileserver(struct afs_fs_cursor *fc)
 			write_unlock(&vnode->volume->servers_lock);
 
 			set_bit(AFS_VOLUME_NEEDS_UPDATE, &vnode->volume->flags);
-			error = afs_check_volume_status(vnode->volume, fc->key);
+			error = afs_check_volume_status(vnode->volume, fc);
 			if (error < 0)
 				goto failed_set_error;
 
@@ -281,7 +281,7 @@ bool afs_select_fileserver(struct afs_fs_cursor *fc)
 
 			set_bit(AFS_VOLUME_WAIT, &vnode->volume->flags);
 			set_bit(AFS_VOLUME_NEEDS_UPDATE, &vnode->volume->flags);
-			error = afs_check_volume_status(vnode->volume, fc->key);
+			error = afs_check_volume_status(vnode->volume, fc);
 			if (error < 0)
 				goto failed_set_error;
 
@@ -341,7 +341,7 @@ bool afs_select_fileserver(struct afs_fs_cursor *fc)
 	/* See if we need to do an update of the volume record.  Note that the
 	 * volume may have moved or even have been deleted.
 	 */
-	error = afs_check_volume_status(vnode->volume, fc->key);
+	error = afs_check_volume_status(vnode->volume, fc);
 	if (error < 0)
 		goto failed_set_error;
 
diff --git a/fs/afs/server.c b/fs/afs/server.c
index b7f3cb2130ca..11b90ac7ea30 100644
--- a/fs/afs/server.c
+++ b/fs/afs/server.c
@@ -594,12 +594,9 @@ bool afs_check_server_record(struct afs_fs_cursor *fc, struct afs_server *server
 	}
 
 	ret = wait_on_bit(&server->flags, AFS_SERVER_FL_UPDATING,
-			  TASK_INTERRUPTIBLE);
+			  (fc->flags & AFS_FS_CURSOR_INTR) ?
+			  TASK_INTERRUPTIBLE : TASK_UNINTERRUPTIBLE);
 	if (ret == -ERESTARTSYS) {
-		if (!(fc->flags & AFS_FS_CURSOR_INTR) && server->addresses) {
-			_leave(" = t [intr]");
-			return true;
-		}
 		fc->error = ret;
 		_leave(" = f [intr]");
 		return false;
diff --git a/fs/afs/volume.c b/fs/afs/volume.c
index 92ca5e27573b..4310336b9bb8 100644
--- a/fs/afs/volume.c
+++ b/fs/afs/volume.c
@@ -281,7 +281,7 @@ static int afs_update_volume_status(struct afs_volume *volume, struct key *key)
 /*
  * Make sure the volume record is up to date.
  */
-int afs_check_volume_status(struct afs_volume *volume, struct key *key)
+int afs_check_volume_status(struct afs_volume *volume, struct afs_fs_cursor *fc)
 {
 	time64_t now = ktime_get_real_seconds();
 	int ret, retries = 0;
@@ -299,7 +299,7 @@ int afs_check_volume_status(struct afs_volume *volume, struct key *key)
 	}
 
 	if (!test_and_set_bit_lock(AFS_VOLUME_UPDATING, &volume->flags)) {
-		ret = afs_update_volume_status(volume, key);
+		ret = afs_update_volume_status(volume, fc->key);
 		clear_bit_unlock(AFS_VOLUME_WAIT, &volume->flags);
 		clear_bit_unlock(AFS_VOLUME_UPDATING, &volume->flags);
 		wake_up_bit(&volume->flags, AFS_VOLUME_WAIT);
@@ -312,7 +312,9 @@ int afs_check_volume_status(struct afs_volume *volume, struct key *key)
 		return 0;
 	}
 
-	ret = wait_on_bit(&volume->flags, AFS_VOLUME_WAIT, TASK_INTERRUPTIBLE);
+	ret = wait_on_bit(&volume->flags, AFS_VOLUME_WAIT,
+			  (fc->flags & AFS_FS_CURSOR_INTR) ?
+			  TASK_INTERRUPTIBLE : TASK_UNINTERRUPTIBLE);
 	if (ret == -ERESTARTSYS) {
 		_leave(" = %d", ret);
 		return ret;



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
