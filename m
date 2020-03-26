Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C011942FE
	for <lists+linux-afs@lfdr.de>; Thu, 26 Mar 2020 16:24:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v8+ijFU/Teefa099gt15cyJyvDVZoZP4/pVHWjSkUyk=; b=sKMiWUFoZ6rz6t
	kjKwDXrFcVSfc1hZJYqybvmdwStSK8cShPzIYBveC/vikvrTACOVPzeqNFDSN6zpRo5efGMjnoaGZ
	Syc+7xsEWURZVe2t/B6zSAGv2y3s1BPeEqULEec3jUtFJbZs5n5cKYRBJdXBrqxAxERmA7WrQgaMK
	GZdKjv9yQvM9gPM1juwRgOksSbnOZgacItD+nFK/XT63kod55URjJcDJqb0DaS99wUo8cNwOeNtoU
	o4ig6MSzc/EpOcpBMPxKnXIfxZ6XnraaBoJbqAL9ylSylIfsFknHymFtcEGIeUUeTzkqMX2Rm2DiX
	p/hcAHi3+lQfqXAAe9Dg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHUMm-0002sv-Oi; Thu, 26 Mar 2020 15:24:20 +0000
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHUMk-0002sP-Dl
 for linux-afs@lists.infradead.org; Thu, 26 Mar 2020 15:24:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585236254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YdGaHErKXgEwjwVvT/7qOUW9k9MHjlnqc5eXCmmHhD0=;
 b=Ep0cF4zvyz9rfWL86HMSFbmUD5b4iRP8A5pI/k978+izxyp4pyxKKa0fn6QXvL5vLBbZkR
 nJgCBI1O1hDqB9HvEaznC6RLBBHelHKzLjlU+fzJi4TfNkaISROdoiBS2vJaQsnN4QCd0r
 hyfx/lLkjxM5YQERz1ao+Mc9XWcalMM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-bks26o97PL-5hfP-8EpW8Q-1; Thu, 26 Mar 2020 11:24:10 -0400
X-MC-Unique: bks26o97PL-5hfP-8EpW8Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47770800D48;
 Thu, 26 Mar 2020 15:24:09 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-126.rdu2.redhat.com
 [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C1BE5DA7B;
 Thu, 26 Mar 2020 15:24:08 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] afs: Fix unpinned address list during probing
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Date: Thu, 26 Mar 2020 15:24:07 +0000
Message-ID: <158523624758.896230.14212353217852133608.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_082418_547700_EA19C0BA 
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
Cc: Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

When it's probing all of a fileserver's interfaces to find which one is
best to use, afs_do_probe_fileserver() takes a lock on the server record
and notes the pointer to the address list.  It doesn't, however, pin the
address list, so as soon as it drops the lock, there's nothing to stop the
address list from being freed under us.

Fix this by taking a ref on the address list inside the locked section and
dropping it at the end of the function.

Fixes: 3bf0fb6f33dd ("afs: Probe multiple fileservers simultaneously")
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Marc Dionne <marc.dionne@auristor.com>
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
