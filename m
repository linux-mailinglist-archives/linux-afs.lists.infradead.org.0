Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A580A1A0207
	for <lists+linux-afs@lfdr.de>; Tue,  7 Apr 2020 02:01:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=el5/iAPgItOqIXBBhE62jK2Fxy7bFLkJgBt0GJ5ufxo=; b=O2+oRfbdIgQmqi
	70inArW0qtpX+5DYBIVn6bibiw/HimuTSgtbTf3Zzyav+/vPrbL2Jeo707KLTRBmYWvKNY2LZi0wP
	2sb3NzP6Fi1TW2c6WbMKG6TjPW3Veq4P2CTs4rhkJQc/UrIsul7NuSHqDfbtqDRd/diK7KKf7MmX1
	qGhibi40DvLjl16JMagZ5E5Q6rW7FZjroJCE41xWJ78FOUGqnP/R8oNX8LWhnKYHlsrVrUOiB5ofb
	JHs3CaVTvmvVLFHgHL8V2+nfZ6xA8T77S7zbf1WTzvOkqaAMdv04zcDHgnnIVYQYPrQTr0um+Hjyp
	+0YZacWTDAgeOd/HzPNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLbgH-0005FU-VN; Tue, 07 Apr 2020 00:01:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLbg3-00050I-Q4
 for linux-afs@lists.infradead.org; Tue, 07 Apr 2020 00:01:18 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C21EC2082D;
 Tue,  7 Apr 2020 00:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586217675;
 bh=P4mihfxv14d3mYrlZSFYDB506Er2e2jwCb818HK4qwI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yfmrQ58XJUnP68+7Tmy3RfxVVAQvcPNj/it8TmmhCKvla0JJX0ie8jIwLRmu722SA
 MfsYp0uOfGVSsueEnHJLXXI+io8HKTKOXNMtbnJ8owWSc6Olq4FOJOaF2F/vVPAI4Q
 SI94dEudv3oc7yvBNIPkTZF/WRefXLIq19W6rtc4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 13/35] rxrpc: Abstract out the calculation of
 whether there's Tx space
Date: Mon,  6 Apr 2020 20:00:35 -0400
Message-Id: <20200407000058.16423-13-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200407000058.16423-1-sashal@kernel.org>
References: <20200407000058.16423-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_170115_906059_B27879D9 
X-CRM114-Status: GOOD (  11.73  )
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

[ Upstream commit 158fe6665389964a1de212818b4a5c52b7f7aff4 ]

Abstract out the calculation of there being sufficient Tx buffer space.
This is reproduced several times in the rxrpc sendmsg code.

Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/rxrpc/sendmsg.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/net/rxrpc/sendmsg.c b/net/rxrpc/sendmsg.c
index 813fd68881429..a13051d380973 100644
--- a/net/rxrpc/sendmsg.c
+++ b/net/rxrpc/sendmsg.c
@@ -17,6 +17,21 @@
 #include <net/af_rxrpc.h>
 #include "ar-internal.h"
 
+/*
+ * Return true if there's sufficient Tx queue space.
+ */
+static bool rxrpc_check_tx_space(struct rxrpc_call *call, rxrpc_seq_t *_tx_win)
+{
+	unsigned int win_size =
+		min_t(unsigned int, call->tx_winsize,
+		      call->cong_cwnd + call->cong_extra);
+	rxrpc_seq_t tx_win = READ_ONCE(call->tx_hard_ack);
+
+	if (_tx_win)
+		*_tx_win = tx_win;
+	return call->tx_top - tx_win < win_size;
+}
+
 /*
  * Wait for space to appear in the Tx queue or a signal to occur.
  */
@@ -26,9 +41,7 @@ static int rxrpc_wait_for_tx_window_intr(struct rxrpc_sock *rx,
 {
 	for (;;) {
 		set_current_state(TASK_INTERRUPTIBLE);
-		if (call->tx_top - call->tx_hard_ack <
-		    min_t(unsigned int, call->tx_winsize,
-			  call->cong_cwnd + call->cong_extra))
+		if (rxrpc_check_tx_space(call, NULL))
 			return 0;
 
 		if (call->state >= RXRPC_CALL_COMPLETE)
@@ -68,9 +81,7 @@ static int rxrpc_wait_for_tx_window_nonintr(struct rxrpc_sock *rx,
 		set_current_state(TASK_UNINTERRUPTIBLE);
 
 		tx_win = READ_ONCE(call->tx_hard_ack);
-		if (call->tx_top - tx_win <
-		    min_t(unsigned int, call->tx_winsize,
-			  call->cong_cwnd + call->cong_extra))
+		if (rxrpc_check_tx_space(call, &tx_win))
 			return 0;
 
 		if (call->state >= RXRPC_CALL_COMPLETE)
@@ -302,9 +313,7 @@ static int rxrpc_send_data(struct rxrpc_sock *rx,
 
 			_debug("alloc");
 
-			if (call->tx_top - call->tx_hard_ack >=
-			    min_t(unsigned int, call->tx_winsize,
-				  call->cong_cwnd + call->cong_extra)) {
+			if (!rxrpc_check_tx_space(call, NULL)) {
 				ret = -EAGAIN;
 				if (msg->msg_flags & MSG_DONTWAIT)
 					goto maybe_error;
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
