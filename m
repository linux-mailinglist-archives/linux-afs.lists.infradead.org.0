Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 874661E8AB8
	for <lists+linux-afs@lfdr.de>; Sat, 30 May 2020 00:02:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TrmIaXvR67+UfGvkWvob54Swd5vLPOd9gow+LT+xd/4=; b=H2Tjp8qSnbY0Wn
	lQnUQI0wsOxzNxKTgYh8uYb3EFOq2tEIU5JFTvYJZHE5uzdimvCJ2qqixnGLZ/5nb0geajnWMbhe7
	9i3lakeKdPFHmQrg1QbQpwRUK4x9+kvmR+jyBpQM4LiG+z48TaUqVXuX7yT4zXgEZQR61wKanwSRB
	qBwC6qb8jiXkfSoykMK/8VvLgDRbpOcndt5uX5FJ+vA77eV2rrSl8sLdIzxFwxUf1GRhmnkbZYbzV
	98ynOb1EYLOn8rS+FtkzQ8bGHeOk5JXxOs2Q4OoHEvj9/K561qplUn3yQZDU2eazZj/6mjC+UhGZm
	7xf1jw8wAd4a34fYKpTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jen4k-00025h-H4; Fri, 29 May 2020 22:02:02 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jen4h-00024G-HM
 for linux-afs@lists.infradead.org; Fri, 29 May 2020 22:02:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590789718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=emX2EPuaIRfL2JQ+lnt/FptoIqC63nhokt9pEyTTiDs=;
 b=V+h+Gvied3iBXIqaHo/Wlv66OjRF+rPbq+bXoCEBX8Nv9rhxt0fXvWp6Fjbh4/72/n718S
 guMLa0Or7y8Rn16a03OBkOvdPNy9njm9bQRK6mi3RQ2j5D3PIKPhqaY01X9v6rQhFQbSWT
 l+ZCLsx672hvcL47TvWOd3JcXPvi5+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-DipWKtBNN4OoX-h-v7OK3A-1; Fri, 29 May 2020 18:01:57 -0400
X-MC-Unique: DipWKtBNN4OoX-h-v7OK3A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0280780183C;
 Fri, 29 May 2020 22:01:56 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D55660BF3;
 Fri, 29 May 2020 22:01:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 15/27] afs: Fix handling of CB.ProbeUuid cache manager op
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 29 May 2020 23:01:54 +0100
Message-ID: <159078971446.679399.12954025261713723881.stgit@warthog.procyon.org.uk>
In-Reply-To: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
References: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_150159_645993_88CB28D5 
X-CRM114-Status: GOOD (  13.25  )
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

The AFS filesystem driver is handling the CB.ProbeUuid request incorrectly.
The UUID presented in the request is that of the cache manager, not the
fileserver, so afs_deliver_cb_probe_uuid() shouldn't be using that UUID to
look up the server.

Fix this by looking up the server by address instead.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/cmservice.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/afs/cmservice.c b/fs/afs/cmservice.c
index 954030ae7a0f..bef413818af7 100644
--- a/fs/afs/cmservice.c
+++ b/fs/afs/cmservice.c
@@ -464,7 +464,8 @@ static int afs_deliver_cb_probe(struct afs_call *call)
 }
 
 /*
- * allow the fileserver to quickly find out if the fileserver has been rebooted
+ * Allow the fileserver to quickly find out if the cache manager has been
+ * rebooted.
  */
 static void SRXAFSCB_ProbeUuid(struct work_struct *work)
 {
@@ -536,7 +537,7 @@ static int afs_deliver_cb_probe_uuid(struct afs_call *call)
 
 	if (!afs_check_call_state(call, AFS_CALL_SV_REPLYING))
 		return afs_io_error(call, afs_io_error_cm_reply);
-	return afs_find_cm_server_by_uuid(call, call->request);
+	return afs_find_cm_server_by_peer(call);
 }
 
 /*



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
