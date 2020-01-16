Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A71B13EA38
	for <lists+linux-afs@lfdr.de>; Thu, 16 Jan 2020 18:43:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+a5mssWRev0R51OrHwu5Kk7YytbIyv0NHn0Gc8eFPbU=; b=efQCUGll7FaqhT
	TF+F3NjmSGbQEvoa5mzcz+Luc0NZl+NfWQu1tpx7yh2hdeZCvVDWTmL4687e++JLvBkQLOojZRRD3
	aJDmCqq5BxbkPgfwBGWMZXNXxsK4ZSdyI/ClcEzhYO5Cl7S8NwSJpZZT3mNPcZm9O48NCOTH2YjtO
	Gk+szPb6x5amh/YUCrKsSnuBbjlY2xlS4uwZ0XMbz+e11n3TOpIqsQFshrroSxDjjx5SbCDk25dL0
	OQkxeOj4HnBpkUZG1OivuAHXbSLFRM6QJs6LSmxrIAoKVS74lK1dfdPJAbZBCuddWj997efbcQSn4
	ogYsvYi0QHoXGrq+6KvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is9Ah-0003P3-LC; Thu, 16 Jan 2020 17:43:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is8hj-0006bN-GK
 for linux-afs@lists.infradead.org; Thu, 16 Jan 2020 17:13:15 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A601246A2;
 Thu, 16 Jan 2020 17:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194790;
 bh=FDSPOsl2IE3xgi7CEM4aPdLM4iubDmai2eRPB1R9cyY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RybESspi5Jz3vAARLyul0cC6B1CGcjjVE+8BHts9Uziv6iNVoJZ39MuiGzozkwsGL
 A+6CGQcKAqoRrKEcm8/YLSubchS6kO0mmnqCu1435wwqU6Se/LH2iFwNR39Wuxn4Oe
 WyFZxEg98DWHLBjxR/pYOmNraNSRJ0oMubTA4564=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 604/671] afs: Fix missing timeout reset
Date: Thu, 16 Jan 2020 12:04:02 -0500
Message-Id: <20200116170509.12787-341-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116170509.12787-1-sashal@kernel.org>
References: <20200116170509.12787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_091311_595878_E67091ED 
X-CRM114-Status: GOOD (  13.84  )
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-afs@lists.infradead.org,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit c74386d50fbaf4a54fd3fe560f1abc709c0cff4b ]

In afs_wait_for_call_to_complete(), rather than immediately aborting an
operation if a signal occurs, the code attempts to wait for it to
complete, using a schedule timeout of 2*RTT (or min 2 jiffies) and a
check that we're still receiving relevant packets from the server before
we consider aborting the call.  We may even ping the server to check on
the status of the call.

However, there's a missing timeout reset in the event that we do
actually get a packet to process, such that if we then get a couple of
short stalls, we then time out when progress is actually being made.

Fix this by resetting the timeout any time we get something to process.
If it's the failure of the call then the call state will get changed and
we'll exit the loop shortly thereafter.

A symptom of this is data fetches and stores failing with EINTR when
they really shouldn't.

Fixes: bc5e3a546d55 ("rxrpc: Use MSG_WAITALL to tell sendmsg() to temporarily ignore signals")
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Marc Dionne <marc.dionne@auristor.com>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/afs/rxrpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/afs/rxrpc.c b/fs/afs/rxrpc.c
index 2543f24d23f8..560dd5ff5a15 100644
--- a/fs/afs/rxrpc.c
+++ b/fs/afs/rxrpc.c
@@ -573,6 +573,7 @@ static long afs_wait_for_call_to_complete(struct afs_call *call,
 			call->need_attention = false;
 			__set_current_state(TASK_RUNNING);
 			afs_deliver_to_call(call);
+			timeout = rtt2;
 			continue;
 		}
 
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
