Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DFF15917
	for <lists+linux-afs@lfdr.de>; Tue,  7 May 2019 07:33:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zN5BBHYMX581kNMt2/bZYi2im/PlcxGSrsDx4Rhxnq0=; b=GUEjzdgip+b1e6
	sYeDkHnvd9uB7vrygcarklkLjTCnl6vjvDW8FQARhHeXBYAdm3BmglsEFFyl6iqS935kdFTXiY0zy
	Xb3Qh/NyULjfqSSVb/IYa+qFHFYY2Za3r6FDTMbuyJamyFoUBY0mra0XjMNr1AC8s//dJx9idHP/N
	leV6UrR/AV6pzeRGg+OHMtxVTas+JuFxPaXD8CfxCv5U4aPXBtX+9VvLAlG3y+yUtaMwP3sbdi40b
	k4+dvLhEa1H6axUeSjbprVAgzV0WBSeh8iSl7woOMHGPQhQJQBhZBLKirhy0S6kDsIOCs+k6evc6/
	w/PHwOXII2abI+Rje5nA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNsjT-0007Wn-UA; Tue, 07 May 2019 05:33:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNsjR-0007W3-1V
 for linux-afs@lists.infradead.org; Tue, 07 May 2019 05:33:38 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 44C5A21019;
 Tue,  7 May 2019 05:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557207216;
 bh=Gza0Tf2zcIx0jq1gzVW4i2us7RjbkGM7Bg3NPcSyrGc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DMrLt8ibwV0at3oqC6MtPYNEafulfvAtTzLOIifo5HvfspcZn7j0ngwDaNf36UsEW
 iX59xvVHUiYIpoK0lvq7esjIYMX+mIALnj+QYUvbLlkgRko9s2rw/LHT6XOJAl+H8X
 EwgPZ+upWVR143zoMJNSWrOg1YX5px6lo9hdoQNg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 31/99] afs: Unlock pages for __pagevec_release()
Date: Tue,  7 May 2019 01:31:25 -0400
Message-Id: <20190507053235.29900-31-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507053235.29900-1-sashal@kernel.org>
References: <20190507053235.29900-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190506_223337_105037_43244DC1 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
X-BeenThere: linux-afs@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Cc: Marc Dionne <marc.dionne@auristor.com>, David Howells <dhowells@redhat.com>,
 linux-afs@lists.infradead.org, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: Marc Dionne <marc.dionne@auristor.com>

[ Upstream commit 21bd68f196ca91fc0f3d9bd1b32f6e530e8c1c88 ]

__pagevec_release() complains loudly if any page in the vector is still
locked.  The pages need to be locked for generic_error_remove_page(), but
that function doesn't actually unlock them.

Unlock the pages afterwards.

Signed-off-by: Marc Dionne <marc.dionne@auristor.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Tested-by: Jonathan Billings <jsbillin@umich.edu>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/afs/write.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/afs/write.c b/fs/afs/write.c
index 72efcfcf9f95..0122d7445fba 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -264,6 +264,7 @@ static void afs_kill_pages(struct address_space *mapping,
 				first = page->index + 1;
 			lock_page(page);
 			generic_error_remove_page(mapping, page);
+			unlock_page(page);
 		}
 
 		__pagevec_release(&pv);
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
