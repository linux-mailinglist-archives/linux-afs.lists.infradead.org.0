Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE65147327
	for <lists+linux-afs@lfdr.de>; Thu, 23 Jan 2020 22:32:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fh6O67pEhy+Y1Md5ycNcoJZqdMTce8sNh82Z12MxWTE=; b=O9gC4ZuJqB86ZC
	oJasxJqJVSpMokeMxofGvYxA38JLEN3oFaRxWH5qq14LkeHaY3zHro4zuIq8wgfPcoSpVaYjl4wju
	fKsi/uLNwLsJVmmWV+5zCcLt8hV8pdR/oKM3jO+8dLcQJDP5bgjaPwGyw3HahZbkmkJ4StkT2sZNh
	mEo/ffuTd6vxlCxCpUsedZtPbdr6nhugEqsQpLxgzbqTXLtzXEhHG8svz62voW078zcCmovNFg5CE
	O5RORjp0PYLuzYNdZV862Oon60rnxsIA1NUUHkEN46Cl1cFGMFG9w5m5FUCMsQNOuFnczRveSbuUw
	KRLyrkqHkTf1sXN5vIrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuk5o-0007s6-OM; Thu, 23 Jan 2020 21:32:48 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuk5j-0007rR-Eg
 for linux-afs@lists.infradead.org; Thu, 23 Jan 2020 21:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579815161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C4UL/sgONviDDd6p9omNf+B6AIXhtVKxNHoU71HLvJU=;
 b=Va0ltiVzkfFZbTWxZfcUzp1mHbpB6LFulj/5yEhwO6JTV7PWtSa/eb7VG27u3Pmyvr/zae
 Y8uRDNsunHzEKdS9iSbtGUtBRSwgAkLxnXcOUNKORV7g9REZwUao44I4KBG+scZzmFmit/
 PO0VEo2Yx/Uj/W1CX9ZqYKrGCH7ewM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-DK5YCIdtN5CTiYO7KdGwRQ-1; Thu, 23 Jan 2020 16:32:39 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64B99190B2A2;
 Thu, 23 Jan 2020 21:32:38 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-49.rdu2.redhat.com
 [10.10.120.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEFD85DA8B;
 Thu, 23 Jan 2020 21:32:37 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] afs: Fix characters allowed into cell names [ver #2]
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Thu, 23 Jan 2020 21:32:36 +0000
Message-ID: <157981515688.277889.8852360425140241674.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.19
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: DK5YCIdtN5CTiYO7KdGwRQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200123_133243_569743_5B5711B6 
X-CRM114-Status: GOOD (  14.44  )
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

Fix afs_alloc_cell() to disallow nonprintable characters, '/', '@' and
names that begin with a dot.

Remove the check for "@cell" as that is then redundant.

This can be tested by running:

	echo add foo/.bar 1.2.3.4 >/proc/fs/afs/cells

Note that we will also need to deal with:

 - Names ending in ".invalid" shouldn't be passed to the DNS.

 - Names that contain non-valid domainname chars shouldn't be passed to the
   DNS.

 - DNS replies that say "your-dns-needs-immediate-attention.<gTLD>" and
   replies containing A records that say 127.0.53.53 should be considered
   invalid.
   [https://www.icann.org/en/system/files/files/name-collision-mitigation-01aug14-en.pdf]

but these need to be dealt with by the kafs-client DNS program rather than
the kernel.

Fixes: ^1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+b904ba7c947a37b4b291@syzkaller.appspotmail.com
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/cell.c |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/afs/cell.c b/fs/afs/cell.c
index 1310893c1634..40491edefd69 100644
--- a/fs/afs/cell.c
+++ b/fs/afs/cell.c
@@ -134,8 +134,17 @@ static struct afs_cell *afs_alloc_cell(struct afs_net *net,
 		_leave(" = -ENAMETOOLONG");
 		return ERR_PTR(-ENAMETOOLONG);
 	}
-	if (namelen == 5 && memcmp(name, "@cell", 5) == 0)
+
+	/* Prohibit cell names that contain unprintable chars, '/' and '@' or
+	 * that begin with a dot.  This also precludes "@cell".
+	 */
+	if (name[0] == '.')
 		return ERR_PTR(-EINVAL);
+	for (i = 0; i < namelen; i++) {
+		char ch = name[i];
+		if (!isprint(ch) || ch == '/' || ch == '@')
+			return ERR_PTR(-EINVAL);
+	}
 
 	_enter("%*.*s,%s", namelen, namelen, name, addresses);
 



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
