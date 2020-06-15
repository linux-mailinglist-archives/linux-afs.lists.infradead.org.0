Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EA01FA40F
	for <lists+linux-afs@lfdr.de>; Tue, 16 Jun 2020 01:22:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+gLL13AYYsVj+tPv4z8zvN5rT3BupyhLTUx+f3lwPDE=; b=jvWCpeYVbIAX+R
	yjUfoZfB5pl424Z+tEg5X/HLRtpJ+C//IJ3EOx5p9iDsgkHGRGUKaqFyYXwv53TAVbQ7GPtyZcn5s
	HfOcBNryXrD1OyuMl5qVn7Fp13y9O5cvkT87vdpZMvIlqUxBnSbT+flhtjVVRTrdcI7kxO45DyMA0
	kUVcw362b6nvZgc90+wcELF5wU5g7ukhRZtel6H3wcKvACl/XHsRy1gAr/0HILxo9Hse7xT3odchc
	InxyyNordG1ZA6hA2/lB1Rqovs3bJWT1MsK9zdlCQqSmNdslM5ls8abH3411UJuWU0o/oxFaA9BJI
	ZSc+vtbCpY3YXwWmLcmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkyR2-0004cb-K5; Mon, 15 Jun 2020 23:22:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkyQz-0004c4-QM
 for linux-afs@lists.infradead.org; Mon, 15 Jun 2020 23:22:35 +0000
Received: from embeddedor (unknown [189.207.59.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EA73C20739;
 Mon, 15 Jun 2020 23:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592263352;
 bh=yRenNfLGBx82R7EvFHNRnPyeS6IINAWAcDUdMCjxrNQ=;
 h=Date:From:To:Cc:Subject:From;
 b=Nzn3Wgj9LiW6vn0Y4F5TMX86XXUeq6jo/rssL9AdopJ2o8J/qy658kHZ44Cu1J8b+
 T3dWfSuijn7yf84ocAorzN4rq2Au5EaA8xGYDalcpcBrM5xZcBFqTU84IeQHYe+QQ3
 hEuj4y7sN8Xehd43csympDErpLxK8fFnNl6Ad+mo=
Date: Mon, 15 Jun 2020 18:27:51 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: David Howells <dhowells@redhat.com>
Subject: [PATCH][next] afs: Use array3_size() helper in afs_extract_to_buf()
Message-ID: <20200615232751.GA22366@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_162233_873717_B6B17B83 
X-CRM114-Status: GOOD (  10.73  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 linux-afs@lists.infradead.org, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Use array3_size() helper instead of the open-coded version in
afs_extract_to_buf(). These sorts of multiplication factors need
to be wrapped in array3_size().

This issue was found with the help of Coccinelle and, audited and fixed
manually.

Addresses-KSPP-ID: https://github.com/KSPP/linux/issues/83
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 fs/afs/cmservice.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/afs/cmservice.c b/fs/afs/cmservice.c
index bef413818af7..4d086f9c829e 100644
--- a/fs/afs/cmservice.c
+++ b/fs/afs/cmservice.c
@@ -268,7 +268,7 @@ static int afs_deliver_cb_callback(struct afs_call *call)
 				       GFP_KERNEL);
 		if (!call->buffer)
 			return -ENOMEM;
-		afs_extract_to_buf(call, call->count * 3 * 4);
+		afs_extract_to_buf(call, array3_size(call->count, 3, 4));
 		call->unmarshall++;
 
 		/* Fall through */
-- 
2.27.0


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
