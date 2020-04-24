Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 558EB1B795B
	for <lists+linux-afs@lfdr.de>; Fri, 24 Apr 2020 17:20:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29cA1skLgjBAFMdGCZ5xW9iq7Hf+DJI6v2vsXR9gL1U=; b=KVqi6DViu/xtiE
	S3F3NRTvYU0hfmKw597RxrElmBsDU3EfqSTkjbbZPCIOzvwXzGpxRLYT4dTyExVQbzt7sSXP5Rjck
	nYinbhfxgFQs4ZVLYS0vPvNhHM0IKA9wM06gQVJya/lH3jFJNvrVRvvXTFpdSsU67sARuIvZGl5j8
	Oz5C4S7f2IKvzJHCZXJ4y4pJS1PBnoXCMSvPnwJpLUP3rOg+4ilF18YoXUJnATbnieBOSDkfMt/L4
	MWTf1ell5h3XdVGYvbm4+480cciQCKh1cqLn7SYAVQNkGUgMTIVTGVl8yGqlPkShzvA1PXSDVRNi8
	JmeWJ0oqKeCwj9aCUogQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS086-0005l2-3e
	for lists+linux-afs@lfdr.de; Fri, 24 Apr 2020 15:20:38 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS081-0005jB-TC
 for linux-afs@lists.infradead.org; Fri, 24 Apr 2020 15:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587741632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HW22fB/dXdSStd4PHzy0rCqHbOznpDI7NjNK1X8I9CU=;
 b=Abc/N1tVkFXmPog4JAUJhwZhsKgrbwRSvfLlLlZWTGylX2Apa4H1s4NUfrbv6P51gTVa1O
 m4RDCPsIbeFm7t9yK+WC5I7boMQ3ni46mra+MYfiErS5v83XA5uoLjQgPjQbqELTRBBWhu
 qFATwOP+tGS8ArS945h6Bm4Bbwg/tVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-u-eSmnE5NDem1rUY7OvFaw-1; Fri, 24 Apr 2020 11:20:30 -0400
X-MC-Unique: u-eSmnE5NDem1rUY7OvFaw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52FCF100A614;
 Fri, 24 Apr 2020 15:20:24 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-129.rdu2.redhat.com
 [10.10.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CD4A6084A;
 Fri, 24 Apr 2020 15:20:23 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 5/8] afs: Remove some unused bits
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 24 Apr 2020 16:20:22 +0100
Message-ID: <158774162288.3619859.1654560517330035101.stgit@warthog.procyon.org.uk>
In-Reply-To: <158774158625.3619859.10579201535876583842.stgit@warthog.procyon.org.uk>
References: <158774158625.3619859.10579201535876583842.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_082035_224899_D1C2F981 
X-CRM114-Status: GOOD (  13.29  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
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

Remove three bits:

 (1) afs_server::no_epoch is neither set nor used.

 (2) afs_server::have_result is set and a wakeup is applied to it, but
     nothing looks at it or waits on it.

 (3) afs_vl_dump_edestaddrreq() prints afs_addr_list::probed, but nothing
     sets it for VL servers.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/fs_probe.c  |    5 +----
 fs/afs/internal.h  |    2 --
 fs/afs/vl_rotate.c |    4 ++--
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/fs/afs/fs_probe.c b/fs/afs/fs_probe.c
index e1b9ed679045..a587767b6ae1 100644
--- a/fs/afs/fs_probe.c
+++ b/fs/afs/fs_probe.c
@@ -117,11 +117,8 @@ void afs_fileserver_probe_result(struct afs_call *call)
 	       (unsigned int)rtt, ret);
 
 	have_result |= afs_fs_probe_done(server);
-	if (have_result) {
-		server->probe.have_result = true;
-		wake_up_var(&server->probe.have_result);
+	if (have_result)
 		wake_up_all(&server->probe_wq);
-	}
 }
 
 /*
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 2d4e0c4e23a4..ee17c868ad2c 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -534,12 +534,10 @@ struct afs_server {
 		u32		abort_code;
 		u32		cm_epoch;
 		short		error;
-		bool		have_result;
 		bool		responded:1;
 		bool		is_yfs:1;
 		bool		not_yfs:1;
 		bool		local_failure:1;
-		bool		no_epoch:1;
 		bool		cm_probed:1;
 		bool		said_rebooted:1;
 		bool		said_inconsistent:1;
diff --git a/fs/afs/vl_rotate.c b/fs/afs/vl_rotate.c
index 9a5ce9687779..72eacc14e6e1 100644
--- a/fs/afs/vl_rotate.c
+++ b/fs/afs/vl_rotate.c
@@ -302,8 +302,8 @@ static void afs_vl_dump_edestaddrreq(const struct afs_vl_cursor *vc)
 				pr_notice("VC:  - nr=%u/%u/%u pf=%u\n",
 					  a->nr_ipv4, a->nr_addrs, a->max_addrs,
 					  a->preferred);
-				pr_notice("VC:  - pr=%lx R=%lx F=%lx\n",
-					  a->probed, a->responded, a->failed);
+				pr_notice("VC:  - R=%lx F=%lx\n",
+					  a->responded, a->failed);
 				if (a == vc->ac.alist)
 					pr_notice("VC:  - current\n");
 			}



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
