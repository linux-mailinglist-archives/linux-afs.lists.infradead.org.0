Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CFE1942BA
	for <lists+linux-afs@lfdr.de>; Thu, 26 Mar 2020 16:12:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lL0ahs50x7ENQQnlPcZwwqDhWtBsOzjMZ8/bdwQ2xww=; b=AfYLnfYOSriz9W
	G4tXM3SHyu7tkt2kQI2+aYSfwOhwgLB2UWX8HWfg8xFcS/tM88V/OS/bnvnNYLDknvQKFMfJf9uMr
	/mIxoCtdGFRsLCTWakH2wMtc+0JXQvLJMpu9ZZUQU+Ryb9M4nndsTOdeAztoSiRIg0oP2YPi566rQ
	78toozaeaQW+DfzzaW9peeKuNM6SEJbkaTt7oTNUgCDuMUvKv30tLZ6xxqbaKN7YKQoFzzDVoAL2Y
	A43oACfZSxBb3GTepHp0VN6aazbdxdju9up31jcAswTWOdakKhKJuNR7gPNEpV3T1WWVdeHHGpqUX
	Tp3wcBsF2qY8xiVYDt/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHUAb-0006Qn-5H; Thu, 26 Mar 2020 15:11:45 +0000
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHUAY-0006Q8-Oj
 for linux-afs@lists.infradead.org; Thu, 26 Mar 2020 15:11:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585235499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=v0ru1qQl/MdUe1tyuggOFmqanIPLiDcOlJejhtsQpWQ=;
 b=VhzSEShixzFSkrHwZo0fbz8McU6b0amOurHGHkIDHLINcq0ogi2qZ4Rl4m/xuGXG8uVvJW
 iH1Xwljx8+qaxIeOsYV1yE52Ut9rYRE9a2vjcwOdboDLxA5P3BDydlLk6VRXvVkvfcVDDr
 L9VJkuDhUrdynq0dFFEVY9PI0jLs3Es=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-1iQtVfjrMK-rTWL4g78w5A-1; Thu, 26 Mar 2020 11:11:36 -0400
X-MC-Unique: 1iQtVfjrMK-rTWL4g78w5A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA50E8017CC;
 Thu, 26 Mar 2020 15:11:34 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-126.rdu2.redhat.com
 [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18FAD60C18;
 Thu, 26 Mar 2020 15:11:33 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] afs: Fix unpinned address list during probing
From: David Howells <dhowells@redhat.com>
To: marc.dionne@auristor.com
Date: Thu, 26 Mar 2020 15:11:33 +0000
Message-ID: <158523549328.895000.2999329272731065986.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_081142_883169_34E155B9 
X-CRM114-Status: GOOD (  11.04  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.205.24.74 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

When it's probing all of a fileserver's interfaces to find which one is
best to use, afs_do_probe_fileserver() takes a lock on the server record
and notes the pointer to the address list.  It doesn't, however, pin the
address list, so as soon as it drops the lock, the address list can
evaporate.

Fix this by taking a ref on the address list inside the locked section and
dropping it at the end of the function.

Fixes: 3bf0fb6f33dd ("afs: Probe multiple fileservers simultaneously")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/fs_probe.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/afs/fs_probe.c b/fs/afs/fs_probe.c
index cfe62b154f68..e1b9ed679045 100644
--- a/fs/afs/fs_probe.c
+++ b/fs/afs/fs_probe.c
@@ -145,6 +145,7 @@ static int afs_do_probe_fileserver(struct afs_net *net,
 	read_lock(&server->fs_lock);
 	ac.alist = rcu_dereference_protected(server->addresses,
 					     lockdep_is_held(&server->fs_lock));
+	afs_get_addrlist(ac.alist);
 	read_unlock(&server->fs_lock);
 
 	atomic_set(&server->probe_outstanding, ac.alist->nr_addrs);
@@ -163,6 +164,7 @@ static int afs_do_probe_fileserver(struct afs_net *net,
 
 	if (!in_progress)
 		afs_fs_probe_done(server);
+	afs_put_addrlist(ac.alist);
 	return in_progress;
 }
 



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
