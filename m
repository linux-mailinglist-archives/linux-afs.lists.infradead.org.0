Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9631B795E
	for <lists+linux-afs@lfdr.de>; Fri, 24 Apr 2020 17:20:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X21Bf8PXRLFh6WCWwsngVrVyMh3Rm+p9OP/mYTiojnU=; b=Z7qWSmXo9oB5s4
	Z1I0QHLmp1Igpp+JvWhLhUrXHa19VQPXQskW3wDhDNTm8Y1kSu+sONSr3jiIi0X945kr8NLD9NnHV
	rhDZRvLOrJf3iHru8GN24kzKnTXziFK+nc2qVCWlnzovzmFHWugfr7ATHsYo1CtsyDapozu9nqPiE
	gviV6rxS1LTyNwxZHkC/7pWFQKPTst0ouAgycBL87uhHA7FpyUhdJgAqN6tcDNdCc430RsO36oWfF
	ng0OI4MY5etdphSU/avSdqg/LC8ckVzS2zSK6qtcjkq1ZP9BJkjtnUwm3WW3oLQqrnviA89OgvCkd
	kOxomuYlx1Rol0UJbEpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS08K-0005tC-CF
	for lists+linux-afs@lfdr.de; Fri, 24 Apr 2020 15:20:52 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS08H-0005r5-82
 for linux-afs@lists.infradead.org; Fri, 24 Apr 2020 15:20:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587741648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CCXBrdRVsySd/WwGvg6OF0IE99GGjSbx68WGqJoAVXk=;
 b=TfZTp1r/zNQkZSSal555QY/pGGH4M0UCSoOa5WJuKoeORacAR2r753K0lh3Z6ztLAQg2p0
 QObjglY6JMsG/WlK2Ripxh1XnCcSwHBICqjGPOqKNF3ArxtsvBeFZzxRaIb8ZDAhdb4vuZ
 iKW3sFKvSJx3XpPKbGbBEHlW3dbKfH0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-5de4YK42OkSJ1I7pWNXceg-1; Fri, 24 Apr 2020 11:20:46 -0400
X-MC-Unique: 5de4YK42OkSJ1I7pWNXceg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F69C100A693;
 Fri, 24 Apr 2020 15:20:45 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-129.rdu2.redhat.com
 [10.10.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB8275D9CC;
 Fri, 24 Apr 2020 15:20:44 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 8/8] afs: Show more information in /proc/net/afs/servers
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 24 Apr 2020 16:20:44 +0100
Message-ID: <158774164414.3619859.10925543612058268605.stgit@warthog.procyon.org.uk>
In-Reply-To: <158774158625.3619859.10579201535876583842.stgit@warthog.procyon.org.uk>
References: <158774158625.3619859.10579201535876583842.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_082049_356459_862B1D72 
X-CRM114-Status: GOOD (  10.97  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
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

Show more information in /proc/net/afs/servers to make it easier to see
what's going on with the server probing.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/proc.c |   17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/afs/proc.c b/fs/afs/proc.c
index 9bce7898cd7d..1d21465a4108 100644
--- a/fs/afs/proc.c
+++ b/fs/afs/proc.c
@@ -378,21 +378,22 @@ static int afs_proc_servers_show(struct seq_file *m, void *v)
 	int i;
 
 	if (v == SEQ_START_TOKEN) {
-		seq_puts(m, "UUID                                 REF ACT ADDR\n");
+		seq_puts(m, "UUID                                 REF ACT\n");
 		return 0;
 	}
 
 	server = list_entry(v, struct afs_server, proc_link);
 	alist = rcu_dereference(server->addresses);
-	seq_printf(m, "%pU %3d %3d %pISpc%s\n",
+	seq_printf(m, "%pU %3d %3d\n",
 		   &server->uuid,
 		   atomic_read(&server->ref),
-		   atomic_read(&server->active),
-		   &alist->addrs[0].transport,
-		   alist->preferred == 0 ? "*" : "");
-	for (i = 1; i < alist->nr_addrs; i++)
-		seq_printf(m, "                                             %pISpc%s\n",
-			   &alist->addrs[i].transport,
+		   atomic_read(&server->active));
+	seq_printf(m, "  - ALIST v=%u osp=%u r=%lx f=%lx\n",
+		   alist->version, atomic_read(&server->probe_outstanding),
+		   alist->responded, alist->failed);
+	for (i = 0; i < alist->nr_addrs; i++)
+		seq_printf(m, "    [%x] %pISpc%s\n",
+			   i, &alist->addrs[i].transport,
 			   alist->preferred == i ? "*" : "");
 	return 0;
 }



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
