Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2891914679D
	for <lists+linux-afs@lfdr.de>; Thu, 23 Jan 2020 13:09:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sxs61Wlolea54ceE08N3YKHqgSIT8xZIWmwGU0d6xgQ=; b=sbLRstvI2Bc5eP
	QSTOs4FT1YtFn6CuySMbJqHkSe0rFNVrTDLeCoWmCFmZeze2sWC8y8Tg9RoeM13lJ9pew43Aw12f3
	OJawmf6NuJcLRgnV2QntiQRERjzpveN7yutORZsjt0TnrnCEVDBgvCHJcZzqN5rJR1R91R1jukpbY
	BiaxWJDco1s4eGP4Y7tJA+SJg8/RaAFgqica9TGeOb4chfsMt3R9QaCNaItxytYFMj3HCRw3lX592
	7CdsFWoaqe5HDpsKnizeiBNY8+yRjiLJigGD/zIq9dRUD+LM9vl09q/yh/tJEYTe0yywwOtMKPvRS
	QlKIhUrk8kzfN26jk8/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iubIq-0004VT-DQ; Thu, 23 Jan 2020 12:09:40 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iubIn-0004Uf-AJ
 for linux-afs@lists.infradead.org; Thu, 23 Jan 2020 12:09:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579781374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KS2tN1jAJovtSasfkXg+WsWM5BC58x00/tU5vdhh0Rs=;
 b=hh/yDOwQlKJBAs4phhyMTZatLqvbTTSCa1sR9xR6Z/1IrZ4jL6vRu+qxXcNtF9nR7xQgpp
 oMKb/Hmi3SsoZvbYnQL8Ol00SEzZsk3giFqTNFszRxxziJLaapv82rrTsvapF/h8XhD5eU
 nZ9rv1ogw4IeIX+7EjmbetB3DTdPa+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-sMYXJSkJOFipk4Y1qT88Tw-1; Thu, 23 Jan 2020 07:09:30 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BACC78017CC;
 Thu, 23 Jan 2020 12:09:29 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-49.rdu2.redhat.com
 [10.10.120.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 225488CCCE;
 Thu, 23 Jan 2020 12:09:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] afs: Fix characters allowed into cell names
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Thu, 23 Jan 2020 12:09:28 +0000
Message-ID: <157978136832.3810447.14331493338866439428.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.19
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: sMYXJSkJOFipk4Y1qT88Tw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200123_040937_431739_CB9A6B32 
X-CRM114-Status: GOOD (  14.51  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: dhowells@redhat.com, dan.carpenter@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

The afs filesystem needs to prohibit certain characters from cell names,
such as '/', as these are used to form filenames in procfs, leading to the
following warning being generated:

	WARNING: CPU: 0 PID: 3489 at fs/proc/generic.c:178

Fix afs_alloc_cell() to only allow characters that are valid in domain
names [a-zA-Z0-9.-] as they may get passed to the DNS server.  In future,
it could be possible if desirable to provide a sysctl to relax this - but
requiring any non-compliant cell name to be manually configured only.

Also remove the check for "@cell" as that is then redundant as '@' is
non-compliant.

This can be tested by running:

	echo add foo/.bar 1.2.3.4 >/proc/fs/afs/cells

Fixes: ^1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+b904ba7c947a37b4b291@syzkaller.appspotmail.com
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/cell.c |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/afs/cell.c b/fs/afs/cell.c
index 1310893c1634..d2be4d3a7dac 100644
--- a/fs/afs/cell.c
+++ b/fs/afs/cell.c
@@ -134,8 +134,14 @@ static struct afs_cell *afs_alloc_cell(struct afs_net *net,
 		_leave(" = -ENAMETOOLONG");
 		return ERR_PTR(-ENAMETOOLONG);
 	}
-	if (namelen == 5 && memcmp(name, "@cell", 5) == 0)
-		return ERR_PTR(-EINVAL);
+
+	/* Prohibit cell names that contain invalid domain name characters.  We
+	 * especially want to exclude '/' and NUL characters.  This also
+	 * precludes "@cell".
+	 */
+	for (i = 0; i < namelen; i++)
+		if (!isalnum(name[i]) && name[i] != '.' && name[i] != '-')
+			return ERR_PTR(-EINVAL);
 
 	_enter("%*.*s,%s", namelen, namelen, name, addresses);
 



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
