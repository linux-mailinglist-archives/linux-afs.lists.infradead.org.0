Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCE41044DB
	for <lists+linux-afs@lfdr.de>; Wed, 20 Nov 2019 21:18:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=5BcahG+iF8UfzVFT+Q3860634cizvKE5UvwAlutSAxk=; b=LLV
	gUsZk8KX1UeIRPtUDO5a9qfk8ANmTrY/93MC9PVLm8ZPpJJh7UsEokmDID6ba3Y0hPM3/sfg4j8Sc
	ATwI56VkwXJczyC7selZu+784zB+cKwP7w33p+YFKdMYJ6o6nU0l90n6Gngi8Vcyev+MtR2tReyyJ
	uCCd0eGfTD5fyDqcqmHo3TbO3VuTPV9diZOdF9UT3wDzac1KQ0smQ3Vg5rOnUUNDjThkvyyJQ/RlV
	QH36pdSAf0XJP014Dgr+QIOkYQbq5ujLNy6eaZuTDmacNJkd/4pNAOs2urohPGzIpZ73JNL8vgHD7
	18ML8/ywWfkZ8j/nOrIFYPfE53OLltw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXWQz-0007Q9-Sf; Wed, 20 Nov 2019 20:18:41 +0000
Received: from mail-qv1-f68.google.com ([209.85.219.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXWQx-0007Pi-KE
 for linux-afs@lists.infradead.org; Wed, 20 Nov 2019 20:18:41 +0000
Received: by mail-qv1-f68.google.com with SMTP id x14so473476qvu.0
 for <linux-afs@lists.infradead.org>; Wed, 20 Nov 2019 12:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=iznp7MdMoiBqhSTHyUvIHCpab0J9UzPEO3EYTKAtYD8=;
 b=VsjeFLWcNmYKbMb18TYv+CXQGwRRHMLcmH7QsylgcBmR+xNdZEsTmZuysWo05MR/m5
 cpoOXedsGIbEkYQJEz58pEIaUAFavw1BiJkceERjgMPJ42kgbUaGuIuDt1lSq/GITN0Y
 n1uO3TRb9gqzFbTY6JnmLl/Tend7KwtqmmWDnCnT3TRiEqS08QYNWrwoVvxyAtWQDJTb
 39761/CyRxznU8PdwwJRSnxC971lgj513K07drxLsnxD98ycFC6SEDxks4N6MNHiUL6Q
 zUZoYI3BUwHgC8dUNK8oWHPiN6IB/n3v/OAEPYFc0tX2nC5ZN5UOu9fOVHsGZrReBK+e
 /4yA==
X-Gm-Message-State: APjAAAXBUGU4KOyMt5DI50sqHxe+zEOB4KWT19mSfAPadf/OuhYj/rKM
 dwChawtxl4zmn93WrtsEtkpLdIGaw30=
X-Google-Smtp-Source: APXvYqz2U7JvGkxY58RJb2Sk3cYGTqgHTpK+Ho79HEZmHBjH4dyAOEUMGtZNPfP71gPRQbiuW+4dqw==
X-Received: by 2002:a0c:986d:: with SMTP id e42mr4642127qvd.25.1574281117835; 
 Wed, 20 Nov 2019 12:18:37 -0800 (PST)
Received: from tornado.marcdionne.net ([2001:470:1d:225:1931:5e46:f6b7:2cb9])
 by smtp.gmail.com with ESMTPSA id
 l186sm186182qkc.58.2019.11.20.12.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 12:18:37 -0800 (PST)
From: Marc Dionne <marc.dionne@auristor.com>
To: linux-afs@lists.infradead.org,
	David Howells <dhowells@redhat.com>
Subject: [PATCH 1/2] afs: Fix possible assert with callbacks from yfs servers
Date: Wed, 20 Nov 2019 16:18:25 -0400
Message-Id: <20191120201826.259253-1-marc.dionne@auristor.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_121839_666712_B63EAA94 
X-CRM114-Status: UNSURE (   7.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.5 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.68 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.68 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (marc.c.dionne[at]gmail.com)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
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
Cc: Marc Dionne <marc.dionne@auristor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Servers sending callback breaks to the YFS_CM_SERVICE service may
send up to YFSCBMAX (1024) fids in a single RPC.  Anything over
AFSCBMAX (50) will cause the assert in afs_break_callbacks to trigger.

Remove the assert, as the count has already been checked against
the appropriate max values in afs_deliver_cb_callback and
afs_deliver_yfs_cb_callback.

Fixes: 35dbfba3111a ("afs: Implement the YFS cache manager service")
Signed-off-by: Marc Dionne <marc.dionne@auristor.com>
---
 fs/afs/callback.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/afs/callback.c b/fs/afs/callback.c
index 6cdd7047c809..2dca8df1a18d 100644
--- a/fs/afs/callback.c
+++ b/fs/afs/callback.c
@@ -312,7 +312,6 @@ void afs_break_callbacks(struct afs_server *server, size_t count,
 	_enter("%p,%zu,", server, count);
 
 	ASSERT(server != NULL);
-	ASSERTCMP(count, <=, AFSCBMAX);
 
 	/* TODO: Sort the callback break list by volume ID */
 
-- 
2.23.0


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
