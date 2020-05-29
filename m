Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DC51E8AA7
	for <lists+linux-afs@lfdr.de>; Sat, 30 May 2020 00:01:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X21Bf8PXRLFh6WCWwsngVrVyMh3Rm+p9OP/mYTiojnU=; b=uAf/4xpFMKfNPA
	0gZlvGXzRhT+vvBqXBuMSukUCoYlly8OurnRNBgEFHDSSkE+eC68z6sKrPL7FOha2KkooLWC4S3gP
	y1eWHG3AhipbTz7GlsOW8dxa1JQlAt30kJ4HqNdxT6M6QDvvYi9GdnL35KBQpkYwQ4OPVRswC9jVe
	U0B4FfWVUMCgTh9Qy+t5NiuSelR6mudvUJobBjhANemiA0g6kYzskp4NkidTnUT8ILqtd7u6SJA32
	/lZyntLwq7GI7q/fUtF2kwNgABdtghpJ5iw0pppHJBlb47tq9WEZDHLf3aHy2V/KgrGP9hAKtItYC
	023AuHjuwjBT8uMIzc3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jen3x-0001qi-Re; Fri, 29 May 2020 22:01:13 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jen3v-0001p7-Nx
 for linux-afs@lists.infradead.org; Fri, 29 May 2020 22:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590789670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CCXBrdRVsySd/WwGvg6OF0IE99GGjSbx68WGqJoAVXk=;
 b=avUL3+6P0k0g98UlZPGNoWJZb/nEinOCPtPkJwBc2TQNHEquAFZcMLW4TQ5q4mtYry8IyS
 qVtun0+RLLdHv9i7CkFwZTNG0UdXmdgaZdEj/mxTY33DyJghzfCF5rs2Zs5uLxlUJMO+5Q
 U8xj/N88PnqwW81ftlPRNmLoFLYKS9E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-7PUdHhfHNaqkybyyzC2t0w-1; Fri, 29 May 2020 18:01:06 -0400
X-MC-Unique: 7PUdHhfHNaqkybyyzC2t0w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B63D8107ACCD;
 Fri, 29 May 2020 22:01:05 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E80FB5C1B5;
 Fri, 29 May 2020 22:01:04 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 08/27] afs: Show more information in /proc/net/afs/servers
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 29 May 2020 23:01:04 +0100
Message-ID: <159078966412.679399.3789522973273819502.stgit@warthog.procyon.org.uk>
In-Reply-To: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
References: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_150111_859658_A2482D7A 
X-CRM114-Status: GOOD (  11.22  )
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
