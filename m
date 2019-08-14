Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C166A8C689
	for <lists+linux-afs@lfdr.de>; Wed, 14 Aug 2019 04:16:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JXWn66XkkHjeWzXgjA8zHqLjiioubMRC116kTjzYMyc=; b=AbhEr0Gi4ZmVGu
	w+00Er7DacRlk/DRVQP75ctIq2Z1gBgceAPoJHVFQGWlGNWr5mGo6KdCtmrhQSaGwmYXovrwA3BYr
	XUiBPemryIGRk3bTK9k4ZrakG9a2Szimji8dn+2JjbW/MuPYaq4/GO7i2ZknPkwDP/B9hAAwS/odd
	zaKn6kU3KiTiuulCaR5v0ZE1PRlz8iSC3sY/R6mVyxIIlXTwihawaFNHdTibvif215IXZN/Xf6bQw
	NTN26EWn20j4HcQEQdPK1HxMnrWU0WpdAkgq4Z2vH8q1tKnbM2MpTaIdLJvfn11UVhp2OkvhRkV7v
	3wqJk3EP/SnBBuEqq9kQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxiqE-0001ju-UP; Wed, 14 Aug 2019 02:16:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxiqB-0001iL-KC
 for linux-afs@lists.infradead.org; Wed, 14 Aug 2019 02:16:44 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8533E208C2;
 Wed, 14 Aug 2019 02:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565749003;
 bh=OPSiXxS4swt0ozoxU8qLxZd2FnOGMLU53bDmra08Nqc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yIM0o/SVM009u8vLeJrsFxxPFM8Gstn39hxqlltnefyEYMECtozST/HTyBDlmKw2v
 3b8i2UTR2nAixFJsMEV1pvn8pGLceVe8TkDMW2sEzhKcth4zcqrxS7hnxRUS02YXJ1
 Zd9RSICi6yQ59D0pFwibalFNbKtb7PJsxPsfaFk0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 30/68] rxrpc: Fix the lack of notification when
 sendmsg() fails on a DATA packet
Date: Tue, 13 Aug 2019 22:15:08 -0400
Message-Id: <20190814021548.16001-30-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814021548.16001-1-sashal@kernel.org>
References: <20190814021548.16001-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_191643_680447_DFE9D4D0 
X-CRM114-Status: GOOD (  12.73  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit c69565ee6681e151e2bb80502930a16e04b553d1 ]

Fix the fact that a notification isn't sent to the recvmsg side to indicate
a call failed when sendmsg() fails to transmit a DATA packet with the error
ENETUNREACH, EHOSTUNREACH or ECONNREFUSED.

Without this notification, the afs client just sits there waiting for the
call to complete in some manner (which it's not now going to do), which
also pins the rxrpc call in place.

This can be seen if the client has a scope-level IPv6 address, but not a
global-level IPv6 address, and we try and transmit an operation to a
server's IPv6 address.

Looking in /proc/net/rxrpc/calls shows completed calls just sat there with
an abort code of RX_USER_ABORT and an error code of -ENETUNREACH.

Fixes: c54e43d752c7 ("rxrpc: Fix missing start of call timeout")
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Marc Dionne <marc.dionne@auristor.com>
Reviewed-by: Jeffrey Altman <jaltman@auristor.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/rxrpc/sendmsg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/rxrpc/sendmsg.c b/net/rxrpc/sendmsg.c
index be01f9c5d963d..5d6ab4f6fd7ab 100644
--- a/net/rxrpc/sendmsg.c
+++ b/net/rxrpc/sendmsg.c
@@ -230,6 +230,7 @@ static void rxrpc_queue_packet(struct rxrpc_sock *rx, struct rxrpc_call *call,
 			rxrpc_set_call_completion(call,
 						  RXRPC_CALL_LOCAL_ERROR,
 						  0, ret);
+			rxrpc_notify_socket(call);
 			goto out;
 		}
 		_debug("need instant resend %d", ret);
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
