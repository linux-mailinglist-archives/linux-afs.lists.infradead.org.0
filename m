Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 82741960C6
	for <lists+linux-afs@lfdr.de>; Tue, 20 Aug 2019 15:43:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=usSg5IAJr4oH5gIcI5LeDzEjToKjMmi0vvLeICA7g0k=; b=AhzIxI7dNcOv1K
	ZScYrtHiZ+lC0LtQiwC5O0RTCSYNFTEZbgaWF/nAHRdcsb54v5I1WqRKfX/WHO71yzv+7RERG82q7
	C83+GDgZc6xKumnxb160XTLnAP5XvTBALK9IUyvrkLk+8S2YynquRgsC6kv9xCwHoWqpsChcqkKSs
	BtxGrWpFROXFMNl3eCPjWVb7ldC2F1zXMv/rIR9uV0FLmn9GCt/qjvONtwwXYl1BAbqRdDiXJ4kWq
	CE3YQi13e07qUjhWq7yi592N8RpC8cV0SzWF0ncF35fjp7IWShPXeXc+Pb5HZ/z6NjhrUVmf1vjUr
	KZiTUnAUXZejilxwglIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i04Q4-00053y-Bv; Tue, 20 Aug 2019 13:43:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i04Ov-00042P-1s
 for linux-afs@lists.infradead.org; Tue, 20 Aug 2019 13:42:19 +0000
Received: from sasha-vm.mshome.net (unknown [12.236.144.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 50141230F2;
 Tue, 20 Aug 2019 13:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566308536;
 bh=ECsyXTY3HYoxGnRCb/ZeFI/+c+Nb7sEcT1pTDulIRg8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d3Djf1xLNQ8jX+Rq4T2yo2soqPA3Xx0jxR2jv/Nj6bWmHpgjIOcjUL9xp0QWzR1GY
 2EzcpWvnaqU6NWfouwLkIY/DIiBsl49j1xPCSZ7OGdhpAzupSIf0zLF9I8BYBmEuCw
 qf6+/9feNVrNSYaxg9leU44meWY6EJgJpi+gLfTY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 03/27] afs: Fix the CB.ProbeUuid service handler
 to reply correctly
Date: Tue, 20 Aug 2019 09:41:49 -0400
Message-Id: <20190820134213.11279-3-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190820134213.11279-1-sashal@kernel.org>
References: <20190820134213.11279-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_064217_278446_D4E6EF39 
X-CRM114-Status: GOOD (  12.66  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit 2067b2b3f4846402a040286135f98f46f8919939 ]

Fix the service handler function for the CB.ProbeUuid RPC call so that it
replies in the correct manner - that is an empty reply for success and an
abort of 1 for failure.

Putting 0 or 1 in an integer in the body of the reply should result in the
fileserver throwing an RX_PROTOCOL_ERROR abort and discarding its record of
the client; older servers, however, don't necessarily check that all the
data got consumed, and so might incorrectly think that they got a positive
response and associate the client with the wrong host record.

If the client is incorrectly associated, this will result in callbacks
intended for a different client being delivered to this one and then, when
the other client connects and responds positively, all of the callback
promises meant for the client that issued the improper response will be
lost and it won't receive any further change notifications.

Fixes: 9396d496d745 ("afs: support the CB.ProbeUuid RPC op")
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeffrey Altman <jaltman@auristor.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/afs/cmservice.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/fs/afs/cmservice.c b/fs/afs/cmservice.c
index 9e51d6fe7e8f9..40c6860d4c632 100644
--- a/fs/afs/cmservice.c
+++ b/fs/afs/cmservice.c
@@ -423,18 +423,14 @@ static void SRXAFSCB_ProbeUuid(struct work_struct *work)
 	struct afs_call *call = container_of(work, struct afs_call, work);
 	struct afs_uuid *r = call->request;
 
-	struct {
-		__be32	match;
-	} reply;
-
 	_enter("");
 
 	if (memcmp(r, &call->net->uuid, sizeof(call->net->uuid)) == 0)
-		reply.match = htonl(0);
+		afs_send_empty_reply(call);
 	else
-		reply.match = htonl(1);
+		rxrpc_kernel_abort_call(call->net->socket, call->rxcall,
+					1, 1, "K-1");
 
-	afs_send_simple_reply(call, &reply, sizeof(reply));
 	afs_put_call(call);
 	_leave("");
 }
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
