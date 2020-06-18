Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6307D1FE1D4
	for <lists+linux-afs@lfdr.de>; Thu, 18 Jun 2020 03:58:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJ8j5KBWD6zi2dSNgBvJQwKHZjqpLxUiyuq2NgtJpwE=; b=kyGKXBPSpk/H0e
	VKP2Luu1lSbpNNLD20b2k6aZ9v7/sddrMgiG1RZplcYvFYVlumEU0oA02sTmHaVJEJgDbw2lO+hJA
	GIkEOIbckEw07KXinxLghgJzs4/HjME8jvMR8Gg50m7j7224dhl0DktvjvTcO0R6h6ztzgBBHjYeX
	J9mkTVKI0AxgqayBAiyCJAluWDwXYS3nWu2xensWKR3oXc4LaFeQp0Vgp8IJ9Elb/LfbDVPsfF2JA
	JujT/H+u3zCTJ86v4dCqtO5Qa4jyok/tizyKVCHAOSsrTCV68y+3wVvy5MbhS6XY2nk1omuUjAMpZ
	hE2B6Q0VZ2T/DLP6XqYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jljoP-0002e7-Kh; Thu, 18 Jun 2020 01:57:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jljIm-0000MH-QS
 for linux-afs@lists.infradead.org; Thu, 18 Jun 2020 01:25:14 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6EA0A221E9;
 Thu, 18 Jun 2020 01:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592443511;
 bh=8m4HbIApK/nNGLBITxfwbW+hGZ0kunCHWQffAxXTSRY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HkGZatSjWrH+gwzh0BLZhtHEmOWWCfdwoaVb2kBhIruPX3n+dep1zf99H7oQN37vc
 zs7yji7AG53rI2J9okYkIbSmy37Kpm83EjG+yNX+RXRZ2Jfy/bUp4UTOi2EnQDLqAI
 YtW4cn2hkVm/uYELR9dge/+QcLg3JONmRhPb5C9w=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 135/172] rxrpc: Adjust /proc/net/rxrpc/calls to
 display call->debug_id not user_ID
Date: Wed, 17 Jun 2020 21:21:41 -0400
Message-Id: <20200618012218.607130-135-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618012218.607130-1-sashal@kernel.org>
References: <20200618012218.607130-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200617_182513_042385_B68DB632 
X-CRM114-Status: GOOD (  10.72  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: David Howells <dhowells@redhat.com>, Sasha Levin <sashal@kernel.org>,
 linux-afs@lists.infradead.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit 32f71aa497cfb23d37149c2ef16ad71fce2e45e2 ]

The user ID value isn't actually much use - and leaks a kernel pointer or a
userspace value - so replace it with the call debug ID, which appears in trace
points.

Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/rxrpc/proc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/rxrpc/proc.c b/net/rxrpc/proc.c
index 9805e3b85c36..81a765dd8c9b 100644
--- a/net/rxrpc/proc.c
+++ b/net/rxrpc/proc.c
@@ -72,7 +72,7 @@ static int rxrpc_call_seq_show(struct seq_file *seq, void *v)
 			 "Proto Local                                          "
 			 " Remote                                         "
 			 " SvID ConnID   CallID   End Use State    Abort   "
-			 " UserID           TxSeq    TW RxSeq    RW RxSerial RxTimo\n");
+			 " DebugId  TxSeq    TW RxSeq    RW RxSerial RxTimo\n");
 		return 0;
 	}
 
@@ -104,7 +104,7 @@ static int rxrpc_call_seq_show(struct seq_file *seq, void *v)
 	rx_hard_ack = READ_ONCE(call->rx_hard_ack);
 	seq_printf(seq,
 		   "UDP   %-47.47s %-47.47s %4x %08x %08x %s %3u"
-		   " %-8.8s %08x %lx %08x %02x %08x %02x %08x %06lx\n",
+		   " %-8.8s %08x %08x %08x %02x %08x %02x %08x %06lx\n",
 		   lbuff,
 		   rbuff,
 		   call->service_id,
@@ -114,7 +114,7 @@ static int rxrpc_call_seq_show(struct seq_file *seq, void *v)
 		   atomic_read(&call->usage),
 		   rxrpc_call_states[call->state],
 		   call->abort_code,
-		   call->user_call_ID,
+		   call->debug_id,
 		   tx_hard_ack, READ_ONCE(call->tx_top) - tx_hard_ack,
 		   rx_hard_ack, READ_ONCE(call->rx_top) - rx_hard_ack,
 		   call->rx_serial,
-- 
2.25.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
