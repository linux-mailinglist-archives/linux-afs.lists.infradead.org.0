Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4EBA2370
	for <lists+linux-afs@lfdr.de>; Thu, 29 Aug 2019 20:15:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sGT0fYdK2zZtmwWwnKqwNZfwxMelaBTESnufhEpgRkM=; b=P0DLMudwRhXl/A
	oM3zJEicEOzUxHySDA43pPDGBkCGZVRVmSi21W5jsddq5JlL0g0SkHREn3Q2Ajm1KlBX5Hjcz3V1z
	RL391Y+RKLXBAWiVAyENB3JX7iIgV7qHmuZmFrnxN/K9weGWXuL5UlHaZ33Oau7s26bZjKdX7uE1P
	StWOq7PH4Y+dbHRh0CK15QED34jGsbG0QFbVsR602TANjp9M3kn2hEo1GBHQE/+vEwbLuytBFViS/
	T/4gESVIspeQI5c3vXREh48DSLbFIUwXWLUmfOkOMRJnZM/g8hNDJsuEGUH0k6y7aI4SICcF0lXKz
	FkuOJMSAcocwdQnpTqfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3OxO-00075g-Qi; Thu, 29 Aug 2019 18:15:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3OxL-00073k-Rd
 for linux-afs@lists.infradead.org; Thu, 29 Aug 2019 18:15:37 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB83423404;
 Thu, 29 Aug 2019 18:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567102535;
 bh=JvqJEB55stf2gf4IFOdP9UEaXddRwXadDHyrHsyqYa8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A+JsQlVX8kGVgjvXj19Xp1yVSF9sC7SKtrGXa74UtY5tRc68KZY1V4bJ5zld6HgGi
 7Izc/4+Niv9rk52BDjKDqOFTmdpxzzpwmywVQYcoV0PvF9E6gJC1uq7StXxUFXkXVv
 BM+x1WWAHTvyDpA5JM6EUmDaXpsfoYm3dOOr8SDY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 70/76] afs: Fix leak in afs_lookup_cell_rcu()
Date: Thu, 29 Aug 2019 14:13:05 -0400
Message-Id: <20190829181311.7562-70-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190829181311.7562-1-sashal@kernel.org>
References: <20190829181311.7562-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_111535_930470_5BF80274 
X-CRM114-Status: GOOD (  11.36  )
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
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit a5fb8e6c02d6a518fb2b1a2b8c2471fa77b69436 ]

Fix a leak on the cell refcount in afs_lookup_cell_rcu() due to
non-clearance of the default error in the case a NULL cell name is passed
and the workstation default cell is used.

Also put a bit at the end to make sure we don't leak a cell ref if we're
going to be returning an error.

This leak results in an assertion like the following when the kafs module is
unloaded:

	AFS: Assertion failed
	2 == 1 is false
	0x2 == 0x1 is false
	------------[ cut here ]------------
	kernel BUG at fs/afs/cell.c:770!
	...
	RIP: 0010:afs_manage_cells+0x220/0x42f [kafs]
	...
	 process_one_work+0x4c2/0x82c
	 ? pool_mayday_timeout+0x1e1/0x1e1
	 ? do_raw_spin_lock+0x134/0x175
	 worker_thread+0x336/0x4a6
	 ? rescuer_thread+0x4af/0x4af
	 kthread+0x1de/0x1ee
	 ? kthread_park+0xd4/0xd4
	 ret_from_fork+0x24/0x30

Fixes: 989782dcdc91 ("afs: Overhaul cell database management")
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/afs/cell.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/afs/cell.c b/fs/afs/cell.c
index a2a87117d2626..fd5133e26a38b 100644
--- a/fs/afs/cell.c
+++ b/fs/afs/cell.c
@@ -74,6 +74,7 @@ struct afs_cell *afs_lookup_cell_rcu(struct afs_net *net,
 			cell = rcu_dereference_raw(net->ws_cell);
 			if (cell) {
 				afs_get_cell(cell);
+				ret = 0;
 				break;
 			}
 			ret = -EDESTADDRREQ;
@@ -108,6 +109,9 @@ struct afs_cell *afs_lookup_cell_rcu(struct afs_net *net,
 
 	done_seqretry(&net->cells_lock, seq);
 
+	if (ret != 0 && cell)
+		afs_put_cell(net, cell);
+
 	return ret == 0 ? cell : ERR_PTR(ret);
 }
 
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
