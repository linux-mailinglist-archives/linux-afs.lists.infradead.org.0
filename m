Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0751E8AD6
	for <lists+linux-afs@lfdr.de>; Sat, 30 May 2020 00:03:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dBUJ7i+sr+yzTZlsEFBbAX7Y81BKprSzcKO06OsgFO4=; b=eW9ZJ052bpxtw/
	uvC0TwLVK714D8JpglfTn/tATH6ck8uzwn8wF5rrrTX89HQp8mLC9xodopLo+Uc4tzdT1dXmRXirG
	Cc//bgH7gg6QH9RiKYENDQPl3/i1MTJSm4AUWEoLkqUrSaTkj2DYL/AxmXxU0aBvHEEOBEocbO+RL
	jrWlUVJajtlIcCqP//7n8FZOpF5dKkpPRGN9Dp7u0DckW156QGSQzzv+ePLkTJOohf8KD7xkXzMgm
	cL0EOG/nroYG2cY/vFBJrTIfjAx7vbkJGA8n+Prk6zJqGPWBuIyAnvcV8utNcfd6aF7i2zWRZWL7l
	GdXENUFa5QyQeTZ9AltA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jen60-0002dB-EI; Fri, 29 May 2020 22:03:20 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jen5x-0002cF-0A
 for linux-afs@lists.infradead.org; Fri, 29 May 2020 22:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590789796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fqjx8LCi5mXdMGhiwM/ZBJ6vZIJseftgYdEBsT0kURk=;
 b=I3JBwI2aQWEGM0sAABsdeUpB3QTtWLCr8TAAQkT4Ju869NStPv4IXHTV3JRKDsUKeiuzkQ
 WlA8tWk4jzRGNZbL9kfGXgMbU4/QsvyhwbaXg+YYm9hNq0ww0QYCutvy/u0gVhjVI/omCe
 SpFq7VjboGIUg8RX5eciKU4Kvaggkl0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-1F__QerAOliziRmCWG2k2g-1; Fri, 29 May 2020 18:03:14 -0400
X-MC-Unique: 1F__QerAOliziRmCWG2k2g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AD2B1005512;
 Fri, 29 May 2020 22:03:13 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BB135D9D7;
 Fri, 29 May 2020 22:03:12 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 26/27] afs: Show more a bit more server state in
 /proc/net/afs/servers
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 29 May 2020 23:03:11 +0100
Message-ID: <159078979153.679399.348340971164597777.stgit@warthog.procyon.org.uk>
In-Reply-To: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
References: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_150317_116789_696BFD74 
X-CRM114-Status: GOOD (  14.51  )
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

Display more information about the state of a server record, including the
flags, rtt and break counter plus the probe state for each server in
/proc/net/afs/servers.

Rearrange the server flags a bit to make them easier to read at a glance in
the proc file.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/internal.h |   16 ++++++++--------
 fs/afs/proc.c     |   10 +++++++---
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index a4fe5d1a8b53..af0b7fca87db 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -497,15 +497,15 @@ struct afs_server {
 	time64_t		unuse_time;	/* Time at which last unused */
 	unsigned long		flags;
 #define AFS_SERVER_FL_RESPONDING 0		/* The server is responding */
-#define AFS_SERVER_FL_NOT_READY	1		/* The record is not ready for use */
-#define AFS_SERVER_FL_NOT_FOUND	2		/* VL server says no such server */
-#define AFS_SERVER_FL_VL_FAIL	3		/* Failed to access VL server */
-#define AFS_SERVER_FL_UPDATING	4
-#define AFS_SERVER_FL_NO_IBULK	7		/* Fileserver doesn't support FS.InlineBulkStatus */
+#define AFS_SERVER_FL_UPDATING	1
+#define AFS_SERVER_FL_NEEDS_UPDATE 2		/* Fileserver address list is out of date */
+#define AFS_SERVER_FL_NOT_READY	4		/* The record is not ready for use */
+#define AFS_SERVER_FL_NOT_FOUND	5		/* VL server says no such server */
+#define AFS_SERVER_FL_VL_FAIL	6		/* Failed to access VL server */
 #define AFS_SERVER_FL_MAY_HAVE_CB 8		/* May have callbacks on this fileserver */
-#define AFS_SERVER_FL_IS_YFS	9		/* Server is YFS not AFS */
-#define AFS_SERVER_FL_NO_RM2	10		/* Fileserver doesn't support YFS.RemoveFile2 */
-#define AFS_SERVER_FL_NEEDS_UPDATE 12		/* Fileserver address list is out of date */
+#define AFS_SERVER_FL_IS_YFS	16		/* Server is YFS not AFS */
+#define AFS_SERVER_FL_NO_IBULK	17		/* Fileserver doesn't support FS.InlineBulkStatus */
+#define AFS_SERVER_FL_NO_RM2	18		/* Fileserver doesn't support YFS.RemoveFile2 */
 	atomic_t		ref;		/* Object refcount */
 	atomic_t		active;		/* Active user count */
 	u32			addr_version;	/* Address list version */
diff --git a/fs/afs/proc.c b/fs/afs/proc.c
index 309a7b578255..22d00cf1913d 100644
--- a/fs/afs/proc.c
+++ b/fs/afs/proc.c
@@ -386,9 +386,13 @@ static int afs_proc_servers_show(struct seq_file *m, void *v)
 		   &server->uuid,
 		   atomic_read(&server->ref),
 		   atomic_read(&server->active));
-	seq_printf(m, "  - ALIST v=%u osp=%u r=%lx f=%lx\n",
-		   alist->version, atomic_read(&server->probe_outstanding),
-		   alist->responded, alist->failed);
+	seq_printf(m, "  - info: fl=%lx rtt=%u brk=%x\n",
+		   server->flags, server->rtt, server->cb_s_break);
+	seq_printf(m, "  - probe: last=%d out=%d\n",
+		   (int)(jiffies - server->probed_at) / HZ,
+		   atomic_read(&server->probe_outstanding));
+	seq_printf(m, "  - ALIST v=%u rsp=%lx f=%lx\n",
+		   alist->version, alist->responded, alist->failed);
 	for (i = 0; i < alist->nr_addrs; i++)
 		seq_printf(m, "    [%x] %pISpc%s\n",
 			   i, &alist->addrs[i].transport,



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
