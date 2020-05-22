Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A586D1DF31B
	for <lists+linux-afs@lfdr.de>; Sat, 23 May 2020 01:42:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nOeooy3HmPmGFRX3OWJBle5gQWMQNQZlkUi03y0rC1Q=; b=dfMRKlSpaiIp3n
	8Y7zwoYlvpIOnpXbc6vDdqectaxXaT641IH/WYMzrY+0myv6VqmHyfCnB6egn5pWfiwE4A1WLQgv5
	WfcNbkw5ikEV6OOAinnCODj6Y03GVl87LnIzRW+UEipCah8nZGI50EN3CRwWXgvYjqE1owmcM+A9W
	FCfE4J+J59+p4L5qK1BrrPXbCd6oaBzW8Kqyw4jSozc/6zD5a2nm/mvrlxvmndWErEDfMUum/USQ4
	mrnEORKAOtcq7kGPyhXI4J7LXuadyMBLSFYEh0TpersZ480qdlOW9sT34wSr8xTd5TA59fcSW+sYc
	c5wXSe83skiUXgStWT6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcHJP-0000Gc-Ph; Fri, 22 May 2020 23:42:47 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcHJM-0000Fk-Li
 for linux-afs@lists.infradead.org; Fri, 22 May 2020 23:42:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590190963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xd7Kn/lno3L3olRbHEyTUX5d4LEKh+MuYsgRNc5tlak=;
 b=Op4yx+4R9U9TLtXBIMFA9j25lLzGWIyFivBknCvVLrbMz0fWSGtDCiZNn2lGGFrnHUc69T
 zjUQY89eVMO7IfW94MuxeLk5LayU37YEN9mMkrgiCU++nCApANUCYt1MM3r2uiArUj9Rcr
 o9Qi74Tm9GhDljeBfejdYd0PK8rIf+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-ceVE17bLPKWBmXkjGKISEA-1; Fri, 22 May 2020 19:42:42 -0400
X-MC-Unique: ceVE17bLPKWBmXkjGKISEA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A517107ACCA;
 Fri, 22 May 2020 23:42:41 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C5845D788;
 Fri, 22 May 2020 23:42:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 1/2] rxrpc: Fix a warning [ver #2]
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Sat, 23 May 2020 00:42:39 +0100
Message-ID: <159019095956.999797.14199554784467459911.stgit@warthog.procyon.org.uk>
In-Reply-To: <159019095229.999797.5088700147400532632.stgit@warthog.procyon.org.uk>
References: <159019095229.999797.5088700147400532632.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_164244_781939_8B3D7BD4 
X-CRM114-Status: GOOD (  11.41  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.61 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Fix a warning due to an uninitialised variable.

le included from ../fs/afs/fs_probe.c:11:
../fs/afs/fs_probe.c: In function 'afs_fileserver_probe_result':
../fs/afs/internal.h:1453:2: warning: 'rtt_us' may be used uninitialized in this function [-Wmaybe-uninitialized]
 1453 |  printk("[%-6.6s] "FMT"\n", current->comm ,##__VA_ARGS__)
      |  ^~~~~~
../fs/afs/fs_probe.c:35:15: note: 'rtt_us' was declared here

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/fs_probe.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/afs/fs_probe.c b/fs/afs/fs_probe.c
index 237352d3cb53..37d1bba57b00 100644
--- a/fs/afs/fs_probe.c
+++ b/fs/afs/fs_probe.c
@@ -32,7 +32,7 @@ void afs_fileserver_probe_result(struct afs_call *call)
 	struct afs_server *server = call->server;
 	unsigned int server_index = call->server_index;
 	unsigned int index = call->addr_ix;
-	unsigned int rtt_us;
+	unsigned int rtt_us = 0;
 	bool have_result = false;
 	int ret = call->error;
 



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
