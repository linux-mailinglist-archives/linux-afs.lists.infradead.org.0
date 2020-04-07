Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5161A021C
	for <lists+linux-afs@lfdr.de>; Tue,  7 Apr 2020 02:04:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GH2cRDxfgjr5cTTUHgxtghVuOw+Tm8PLVapBQDu076o=; b=EzBAEt5ZHTT/0x
	JNYBM2T/wqoqVKB/rd1f7pRJaCdeomfHo9921+VUDeDZrcMuwgKkYx2bN2YRb25xgAuOSwe5GX5oq
	k7nGWebWHNgAUXBOXeaLpFhis00/7Qp8bpUQQag30d9MIAq5my43ekmwFKgCxNCBI0lUS9adu6dpE
	LzUI0meWhCA7DpRSb/9FASeGkRJ0zFyYtDdxcN2KzAvQkfaYTIIheY4/2sJ2WFWxHEzpZime6oTKn
	EDLkBRfzWzpd1f6hiVv/NzwgK1iLYijAGG9cwq+RsqmUzfMIXJHlQSP4ZQ/epUMh/GZkaa67thYz3
	VsLT5EnEq0v/AQpCyBig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLbin-0007hi-Lm; Tue, 07 Apr 2020 00:04:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLbhQ-0006Ru-Gv
 for linux-afs@lists.infradead.org; Tue, 07 Apr 2020 00:02:51 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8B97720857;
 Tue,  7 Apr 2020 00:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586217760;
 bh=jfwCsAvjDH3ZwiE9o8OYiI+Fbo15gpdgV44F0mGIzMU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r24j7I6PwCWm5LIQQz7YINNCPckTpHCliEQkHL4gXG/Uk2PkxZyeYYJqDkSjcKcoN
 eoLuDYjmfe3WHJXp2bUYJAAgN7Ok/BCQp4iH8XWKVSmZJFWM2VIYzOPmtRKuubHSM2
 1sD5ugX0zvyVXFispUXkP119T/4cfaM4P8xY0XpU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 04/13] rxrpc: Fix sendmsg(MSG_WAITALL) handling
Date: Mon,  6 Apr 2020 20:02:25 -0400
Message-Id: <20200407000234.17088-4-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200407000234.17088-1-sashal@kernel.org>
References: <20200407000234.17088-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_170245_257213_0A5A3B4A 
X-CRM114-Status: GOOD (  10.36  )
X-Spam-Score: -5.4 (-----)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-5.4 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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
 linux-afs@lists.infradead.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit 498b577660f08cef5d9e78e0ed6dcd4c0939e98c ]

Fix the handling of sendmsg() with MSG_WAITALL for userspace to round the
timeout for when a signal occurs up to at least two jiffies as a 1 jiffy
timeout may end up being effectively 0 if jiffies wraps at the wrong time.

Fixes: bc5e3a546d55 ("rxrpc: Use MSG_WAITALL to tell sendmsg() to temporarily ignore signals")
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/rxrpc/sendmsg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/rxrpc/sendmsg.c b/net/rxrpc/sendmsg.c
index 68993439e1d91..7ee72053037a3 100644
--- a/net/rxrpc/sendmsg.c
+++ b/net/rxrpc/sendmsg.c
@@ -75,8 +75,8 @@ static int rxrpc_wait_for_tx_window_nonintr(struct rxrpc_sock *rx,
 
 	rtt = READ_ONCE(call->peer->rtt);
 	rtt2 = nsecs_to_jiffies64(rtt) * 2;
-	if (rtt2 < 1)
-		rtt2 = 1;
+	if (rtt2 < 2)
+		rtt2 = 2;
 
 	timeout = rtt2;
 	tx_start = READ_ONCE(call->tx_hard_ack);
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
