Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE801F405C
	for <lists+linux-afs@lfdr.de>; Tue,  9 Jun 2020 18:13:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H9RRjkYO4fJZ2+R2I1GvBLiTZqtkH165/1CgKDEZweM=; b=MnRF7gs8UNhbr/
	uDFjZgKZp/X2Ed4Wn5tlwCXuVzLoeGYq2d5/2/X/2ISj2VizdAy2OxybL/WeaaRK2pc3cdJn6YOr4
	AvFlFYdIRjAGwmCpSEtYv5myGAWXKb6kiR4xnxOXLm2N6ZzlMoAlYhcU45iNoCLQpQHFn4+Kjrr76
	WHTWhFN8utVqTJPUCWH4Pb4NyQPkZo8XXTqU589ch7kCxxhT6MfdWptf9jo8XUW7H7bojuhtxe+sS
	LzeHx1GySnnqqD+7RmYea7QEN3aMVR586wmM5bWBx2e7HARf/pnqSPSEifWoIBXf2tkFbgmSB2xvb
	shIZBhK9Z99gar/cM+7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jigsO-0000JX-GW; Tue, 09 Jun 2020 16:13:24 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jigsK-0000I6-4R
 for linux-afs@lists.infradead.org; Tue, 09 Jun 2020 16:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591719199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yeGZmO/JYZG5FQp5dwk/kPkEYWtQgdOsYGZyA4HB6Bo=;
 b=Y6AEg51SxI7g8MPXro2GxLwL/cWDC2kNLPlvvq58xv+ZHHwbcKmXSj9iGBtDPqjb9yngQ9
 tcOHqDhDK9tQm+dYrBeGcCvNbJHbFmulsgFw1gYwvLQwNWL6T3tg0xhBywUaajqCC0RcIU
 TTZ4XjiWTjPUg8asSpZMLFoVCMvhWiw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-wP6gp0uBPvuudx7tztxueg-1; Tue, 09 Jun 2020 12:13:15 -0400
X-MC-Unique: wP6gp0uBPvuudx7tztxueg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C3DA9117F;
 Tue,  9 Jun 2020 16:13:14 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DCA07A1EB;
 Tue,  9 Jun 2020 16:13:13 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 1/6] afs: Fix memory leak in afs_put_sysnames()
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Tue, 09 Jun 2020 17:13:12 +0100
Message-ID: <159171919260.3038039.5675242420072463110.stgit@warthog.procyon.org.uk>
In-Reply-To: <159171918506.3038039.10915051218779105094.stgit@warthog.procyon.org.uk>
References: <159171918506.3038039.10915051218779105094.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_091320_279922_AF85A885 
X-CRM114-Status: GOOD (  10.13  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [207.211.31.81 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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

From: Zhihao Cheng <chengzhihao1@huawei.com>

Fix afs_put_sysnames() to actually free the specified afs_sysnames
object after its reference count has been decreased to zero and
its contents have been released.

Fixes: 6f8880d8e681557 ("afs: Implement @sys substitution handling")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/proc.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/afs/proc.c b/fs/afs/proc.c
index 22d00cf1913d..e817fc740ba0 100644
--- a/fs/afs/proc.c
+++ b/fs/afs/proc.c
@@ -567,6 +567,7 @@ void afs_put_sysnames(struct afs_sysnames *sysnames)
 			if (sysnames->subs[i] != afs_init_sysname &&
 			    sysnames->subs[i] != sysnames->blank)
 				kfree(sysnames->subs[i]);
+		kfree(sysnames);
 	}
 }
 



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
