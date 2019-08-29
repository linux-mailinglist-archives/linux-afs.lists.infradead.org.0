Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B92A2378
	for <lists+linux-afs@lfdr.de>; Thu, 29 Aug 2019 20:16:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q677FozbKqTLyWmoS5+KBUD2mRKLZ1ztP9fVmwf1caw=; b=XPXc2KHEmXhoTL
	jCQp7eXxuPrld+1vZTGy6YqZdvGcmsac4/5LmoYhGGJ5owOKO/sWzH41Su+vpmuBtC26ORhoG9/5s
	kqBqauILPsWgs7OGLdW4hEOZnbCYChaNQ85bcDzOtnUQCgAUyegDJ89Arn/fsIKMxzkD+CNj9zf2z
	OzfNafguhKZCAtsY5Aezq9JGBDIut5RJUxuHTSAckz65FuX0zo6R9bNjxiC8ayDWyqGHmyqt6HjGh
	qQmmZUJLz79sOD6Mk54PuZI+FGYark7IX5a5YwEd15QxsHmH/P3rLN9vdYRU9s8MGrYN/rDR+fRzm
	R+R0y+8pP+Eq8FCDUeUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3Oxs-0007Gd-Fz; Thu, 29 Aug 2019 18:16:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3Oxp-0007Fi-Rq
 for linux-afs@lists.infradead.org; Thu, 29 Aug 2019 18:16:07 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C310223403;
 Thu, 29 Aug 2019 18:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567102565;
 bh=/mxg7Hm5UecwTIbCO8OMxcZhGZ67/RLs3uhwn1SB7hM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WFsc8UD5tXaIBUrRV47+cRgWu9qCUaXjdyeWuviXchFkH8rQt3tMkX1lDWzxVYbQs
 UkNrDFmWGF4W7ZkBWyijJdFDb2YsM06VB4lRQlmeKvw23iFZ4sb1rqo/ZJ0dIzo8l5
 OuOE7hdTyR7ulKjzUhN/CvY3ZtYEqCW9S9VtHwQo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 12/45] rxrpc: Fix local endpoint replacement
Date: Thu, 29 Aug 2019 14:15:12 -0400
Message-Id: <20190829181547.8280-12-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190829181547.8280-1-sashal@kernel.org>
References: <20190829181547.8280-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_111605_918651_ECACEE97 
X-CRM114-Status: GOOD (  13.90  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
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
Cc: David Howells <dhowells@redhat.com>, Sasha Levin <sashal@kernel.org>,
 linux-afs@lists.infradead.org,
 syzbot+193e29e9387ea5837f1d@syzkaller.appspotmail.com, netdev@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit b00df840fb4004b7087940ac5f68801562d0d2de ]

When a local endpoint (struct rxrpc_local) ceases to be in use by any
AF_RXRPC sockets, it starts the process of being destroyed, but this
doesn't cause it to be removed from the namespace endpoint list immediately
as tearing it down isn't trivial and can't be done in softirq context, so
it gets deferred.

If a new socket comes along that wants to bind to the same endpoint, a new
rxrpc_local object will be allocated and rxrpc_lookup_local() will use
list_replace() to substitute the new one for the old.

Then, when the dying object gets to rxrpc_local_destroyer(), it is removed
unconditionally from whatever list it is on by calling list_del_init().

However, list_replace() doesn't reset the pointers in the replaced
list_head and so the list_del_init() will likely corrupt the local
endpoints list.

Fix this by using list_replace_init() instead.

Fixes: 730c5fd42c1e ("rxrpc: Fix local endpoint refcounting")
Reported-by: syzbot+193e29e9387ea5837f1d@syzkaller.appspotmail.com
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/rxrpc/local_object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rxrpc/local_object.c b/net/rxrpc/local_object.c
index 2182ebfc7df4c..7f82c4e19bd1e 100644
--- a/net/rxrpc/local_object.c
+++ b/net/rxrpc/local_object.c
@@ -287,7 +287,7 @@ struct rxrpc_local *rxrpc_lookup_local(struct net *net,
 		goto sock_error;
 
 	if (cursor != &rxnet->local_endpoints)
-		list_replace(cursor, &local->link);
+		list_replace_init(cursor, &local->link);
 	else
 		list_add_tail(&local->link, cursor);
 	age = "new";
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
