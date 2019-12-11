Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B04911A8E4
	for <lists+linux-afs@lfdr.de>; Wed, 11 Dec 2019 11:28:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GFKzdG3A6b3Z2stKcHMvhYYgyZIUpDWLCxXdeLtnlZA=; b=VD3ONZ63DcKmKE
	vEeV6DNSbIcK2nl5TtGT+I8Wyls1jZ522qEYgXrgr3PU875vBuT2SZz8t8i63oPznhbgsp+j6++fF
	gkD74BQv9yJ1Sj5IXW1d5ZAIxGWD0UIMKBrYuZPnUWcpY0eSXCiJb/lLu9Aru91VwCBYYI9laBkrh
	55XxoGcxZyN7T0SlAEzsMc9EmzMEEBWrgFiKbI8Wj8obM+dIdZeTnHIv7MMdPVHOleYmaMaFJmTRO
	qkYRcW3IcRN+IDpAQIFDuBekOT0XMrmGviUDClPAdpSclD4GFx6aYb7sixWHIVt9ljCgwXIFKzG7F
	fDUUrjTPKdu/hsy3mWpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iezEG-0007fg-26; Wed, 11 Dec 2019 10:28:24 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iezED-0007f9-Gw
 for linux-afs@lists.infradead.org; Wed, 11 Dec 2019 10:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576060100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2MULEz0m7wCRHsZJw9/6cSG1rGunwuIbdCbbR+j5MfM=;
 b=HCjHlEkpfnjuqJP9oNkvugo7IULhzJ1/nA6MFaUBzvvKyemXOL4Q0SbmllAyMcgOd/kz3q
 u9Wn7waCo6kLVvSOjEBr7tvktTdBLKDjASJ/Q0taEgOjsqbwN9balkU1offjmx0ZlsuBgK
 A5V6Jj3YKXuMF+uJFKHjOI7IHH/udgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-OyeghGDuOvejUtZ9n7OdtA-1; Wed, 11 Dec 2019 05:28:17 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBFCB1800D45;
 Wed, 11 Dec 2019 10:28:15 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-52.rdu2.redhat.com
 [10.10.120.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CE4670936;
 Wed, 11 Dec 2019 10:28:14 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 6/8] afs: Fix missing cell comparison in afs_test_super()
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 11 Dec 2019 10:28:14 +0000
Message-ID: <157606009434.21869.10204766557747785498.stgit@warthog.procyon.org.uk>
In-Reply-To: <157606006065.21869.6615813521356169209.stgit@warthog.procyon.org.uk>
References: <157606006065.21869.6615813521356169209.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: OyeghGDuOvejUtZ9n7OdtA-1
X-Mimecast-Spam-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_022821_636654_5CA9295F 
X-CRM114-Status: GOOD (  10.57  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [205.139.110.120 listed in list.dnswl.org]
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
Cc: dhowells@redhat.com, Todd DeSantis <atd@us.ibm.com>,
 Carsten Jacobi <jacobi@de.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Fix missing cell comparison in afs_test_super().  Without this, any pair
volumes that have the same volume ID will share a superblock, no matter the
cell, unless they're in different network namespaces.

Normally, most users will only deal with a single cell and so they won't
see this.  Even if they do look into a second cell, they won't see a
problem unless they happen to hit a volume with the same ID as one they've
already got mounted.

Before the patch:

    # ls /afs/grand.central.org/archive
    linuxdev/  mailman/  moin/  mysql/  pipermail/  stage/  twiki/
    # ls /afs/kth.se/
    linuxdev/  mailman/  moin/  mysql/  pipermail/  stage/  twiki/
    # cat /proc/mounts | grep afs
    none /afs afs rw,relatime,dyn,autocell 0 0
    #grand.central.org:root.cell /afs/grand.central.org afs ro,relatime 0 0
    #grand.central.org:root.archive /afs/grand.central.org/archive afs ro,relatime 0 0
    #grand.central.org:root.archive /afs/kth.se afs ro,relatime 0 0

After the patch:

    # ls /afs/grand.central.org/archive
    linuxdev/  mailman/  moin/  mysql/  pipermail/  stage/  twiki/
    # ls /afs/kth.se/
    admin/        common/  install/  OldFiles/  service/  system/
    bakrestores/  home/    misc/     pkg/       src/      wsadmin/
    # cat /proc/mounts | grep afs
    none /afs afs rw,relatime,dyn,autocell 0 0
    #grand.central.org:root.cell /afs/grand.central.org afs ro,relatime 0 0
    #grand.central.org:root.archive /afs/grand.central.org/archive afs ro,relatime 0 0
    #kth.se:root.cell /afs/kth.se afs ro,relatime 0 0

Fixes: ^1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: Carsten Jacobi <jacobi@de.ibm.com>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Todd DeSantis <atd@us.ibm.com>
---

 fs/afs/super.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/afs/super.c b/fs/afs/super.c
index dbcdf7512bec..cfe1bb4f96c4 100644
--- a/fs/afs/super.c
+++ b/fs/afs/super.c
@@ -407,6 +407,7 @@ static int afs_test_super(struct super_block *sb, struct fs_context *fc)
 	return (as->net_ns == fc->net_ns &&
 		as->volume &&
 		as->volume->vid == ctx->volume->vid &&
+		as->cell == ctx->cell &&
 		!as->dyn_root);
 }
 


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
