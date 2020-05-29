Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF201E8AD4
	for <lists+linux-afs@lfdr.de>; Sat, 30 May 2020 00:03:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FclfqKIcdzDy64pfJDgDHtGTeS7BAW7dr2sfEVO66xA=; b=JfyUX7PHx5jEd2
	WDeTNxCARFVYq9+2DK+OmLf3wmyOZskPDeTzgwkxQvCfcY5iRdq8pqO2DCnGjAOKAUkMxk73zT09H
	HUki18D4afrm42mD+LMQPK29ovjhiktgU+oNdvZxdgSUdFYPcZLX07Ymzhfuk/ALvq+r4T0NHBgPK
	vHPrhTpMkq0M/rHXHYBSeu8o/VLYLmN87xRsz6k4V3BzjBqgNyhfUClY8FxyTiiaGYwRG7wG0jJNH
	l08NiiCRr1GXfOU1BtfaXLmmz8tvPqEppc7o6G7ALyGSMLHwIdU7YS237NEtgFacmCoHOWzVBD0cy
	I1plsZd27YTqPMnpP/MQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jen5m-0002Xx-0R; Fri, 29 May 2020 22:03:06 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jen5j-0002Wh-Fr
 for linux-afs@lists.infradead.org; Fri, 29 May 2020 22:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590789782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g/aI4LSwmo2x3NIsjNt6okyTDEvgfAxH61DZvBADxec=;
 b=OgVPoba3I7VcgtYFOGtrjHLyudx/OaBMLWfU/C2iRiItjHYUKfdXABZJesEawfRdDp22HR
 /W2tiEP747OuNIbd/OmUODunq+J2I0UYNCJgLKDZI03YvS2tH0f+lokSubSaKG6cvCVANR
 gLdecrLTpyHgW/eCS2QA1dHis7xZxfg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-hYDmwy78OhascDW9fQZv0Q-1; Fri, 29 May 2020 18:03:00 -0400
X-MC-Unique: hYDmwy78OhascDW9fQZv0Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 504A580183C;
 Fri, 29 May 2020 22:02:59 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F24775294;
 Fri, 29 May 2020 22:02:58 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 24/27] afs: Fix afs_statfs() to not let the values go below
 zero
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 29 May 2020 23:02:57 +0100
Message-ID: <159078977780.679399.6918426082550606601.stgit@warthog.procyon.org.uk>
In-Reply-To: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
References: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_150303_602294_AF988DE1 
X-CRM114-Status: GOOD (  13.26  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.139.110.120 listed in wl.mailspike.net]
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

Fix afs_statfs() so that the value for f_bavail and f_bfree don't go
"negative" if the number of blocks in use by a volume exceeds the max quota
for that volume.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/super.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/afs/super.c b/fs/afs/super.c
index c77b11b31233..b552357b1d13 100644
--- a/fs/afs/super.c
+++ b/fs/afs/super.c
@@ -729,7 +729,10 @@ static void afs_get_volume_status_success(struct afs_operation *op)
 		buf->f_blocks = vs->part_max_blocks;
 	else
 		buf->f_blocks = vs->max_quota;
-	buf->f_bavail = buf->f_bfree = buf->f_blocks - vs->blocks_in_use;
+
+	if (buf->f_blocks > vs->blocks_in_use)
+		buf->f_bavail = buf->f_bfree =
+			buf->f_blocks - vs->blocks_in_use;
 }
 
 static const struct afs_operation_ops afs_get_volume_status_operation = {



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
