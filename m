Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1801C9AB2
	for <lists+linux-afs@lfdr.de>; Thu,  7 May 2020 21:15:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GBEevlo3yBTaECtD8EUXBFHiZMmdU3STKNxXkFgMHM0=; b=I8OtBvdjCN2txR
	sNlAxkimq2kf3FadA+23j3I3JCV/RiprEgZxirEgaU5xOd+7hYXtDZSuavMPhwguBaI/PLM5mos8p
	SSlLE5uD1LauVATmlJkYLbYh8WM2gMdknuV7g/WiGnS2UYu2NPn9LNQjUWff1Ki6tgtFr+HrlIAm/
	nyD3J9oiJlwUvliYjQrDLpLIrTpRXlcvKOnkB26meJe18FMoxheLLxwFDKWfciI6RCDWHneL3U916
	/E988FP7dhFEFXXps1IeA/AimwA34HUCcHGhbGu+AJ1mLnDfZ+x6T2ZygoSTekrNAVOxmPX4i5ynm
	nPMwpcoF5rAVenZ1I1hg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWlzX-0008E9-Uj; Thu, 07 May 2020 19:15:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWlzV-0008De-1w
 for linux-afs@lists.infradead.org; Thu, 07 May 2020 19:15:30 +0000
Received: from embeddedor (unknown [189.207.59.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 54B20208E4;
 Thu,  7 May 2020 19:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588878928;
 bh=6CtjvvzIiCFqRF7hO2QiUlKQpOiT7Mpavh/BYNSOclU=;
 h=Date:From:To:Cc:Subject:From;
 b=UnXwc42NcUCHCS7orILEtoKDn0lbo1fYNSTW81dVYRZNIe2gSo7Z2nliRMRoJFDhj
 ec1OjjPQWbgTteU+JBDeEcfbU0HGWUthBLsMgtdIeKMk457LtbRUYsPwn2Yr3W3NLu
 nCnyIZ7jTMRl6JZLxLW8DQG6SAbsTQwUB7nuFfis=
Date: Thu, 7 May 2020 14:19:55 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: David Howells <dhowells@redhat.com>
Subject: [PATCH] RxRPC: Replace zero-length array with flexible-array
Message-ID: <20200507191955.GA16076@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_121529_118592_DD638F81 
X-CRM114-Status: GOOD (  13.26  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

sizeof(flexible-array-member) triggers a warning because flexible array
members have incomplete type[1]. There are some instances of code in
which the sizeof operator is being incorrectly/erroneously applied to
zero-length arrays and the result is zero. Such instances may be hiding
some bugs. So, this work (flexible-array member conversions) will also
help to get completely rid of those sorts of issues.

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 include/keys/rxrpc-type.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/keys/rxrpc-type.h b/include/keys/rxrpc-type.h
index a183278c3e9e..2b0b15a71228 100644
--- a/include/keys/rxrpc-type.h
+++ b/include/keys/rxrpc-type.h
@@ -28,7 +28,7 @@ struct rxkad_key {
 	u8	primary_flag;		/* T if key for primary cell for this user */
 	u16	ticket_len;		/* length of ticket[] */
 	u8	session_key[8];		/* DES session key */
-	u8	ticket[0];		/* the encrypted ticket */
+	u8	ticket[];		/* the encrypted ticket */
 };
 
 /*
@@ -100,7 +100,7 @@ struct rxrpc_key_data_v1 {
 	u32		expiry;			/* time_t */
 	u32		kvno;
 	u8		session_key[8];
-	u8		ticket[0];
+	u8		ticket[];
 };
 
 /*


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
