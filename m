Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCA0B78E6
	for <lists+linux-afs@lfdr.de>; Thu, 19 Sep 2019 14:07:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=VmoxBPUnVIg+567Pl2y6Rn6AdC9nxdELUY/PGo1+g7g=; b=LDa
	t5t0KCi2E51RefS7gJJqsVqCqnwN2xIEP93wQree77gVgFyNKIkHTRw049bltFxRSuD5Fhkuz7PQz
	Wnr8xHHP0vfvr7L27KkMBOYrTzBY3vLXkJ7+BEocLaTY/yQ/shKuf0k0irZaMpW0+yRfkihCqbPp7
	NnfGL5tEXY9SNuAW3LDqNGJiLpssRz8kzMadFCgoP6v//NiccgVV1idL2OEuVoSkiaLg9gGIWyLTo
	Slg9zP+cUK31fDLZtcarBU7+aN6MqBW65pv7LmjWadG2FABZ4g8v5O30EWOzBNIlfCjze/xa6wlcg
	jl/e/PPEFLABFwY2zHziMBtQsG6UpLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAvDi-00024x-5A; Thu, 19 Sep 2019 12:07:34 +0000
Received: from mail-qk1-f196.google.com ([209.85.222.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAvDf-000248-6q
 for linux-afs@lists.infradead.org; Thu, 19 Sep 2019 12:07:32 +0000
Received: by mail-qk1-f196.google.com with SMTP id i78so3024700qke.11
 for <linux-afs@lists.infradead.org>; Thu, 19 Sep 2019 05:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pXeIr27oRlFhwl+E7QDLc74mEI9bUubUEb8ucnkpLcs=;
 b=PVY6mqujFNrNOInlBxzmVc7B4+SaMChkpf+K8VovjkKpAIdhDLU8gDDwpnZvfgXWBw
 QSdDj5xFZyTBHyDvBspyXPgEow1y8vurBHnupwbZNlGJ5U/NvAFNNJm4oxQGcGpY13Ge
 gaKsF4X5zl6dODO4e/44vM9qbH6E2HruDGtOzuIXTod8tGFTOXNUC+yA/52anfG/qUvX
 rT3bFAZr/Cn9Cy2rf/UNlUtiLaUYccB7BfISASr2iwwgqi0H2aqSgrDjOzFJSCk4sSUA
 cvpxaWSE9mUgSxXUZKfXQ/z4BpVmSQqi6XjVW/+sQoPQCnkdhSU7vW4/hoawH3+70e8n
 HjYQ==
X-Gm-Message-State: APjAAAXa5Bi6vBBNWPmCoX9+x466jPhIbaIznLsx22HGLocJE8n1vvHU
 MTbLl5QAEVQie5s7D4VP4Poe0EYJHI8=
X-Google-Smtp-Source: APXvYqygjMzqpRGslvjKjuscN4FPfO68pfcsNDfNzgif6Ga7nFLgRfNsZ0ryNTEfLe9bEeAIpSDknQ==
X-Received: by 2002:a37:a38c:: with SMTP id m134mr2414483qke.484.1568894847054; 
 Thu, 19 Sep 2019 05:07:27 -0700 (PDT)
Received: from tornado.marcdionne.net ([2001:470:1d:225:3983:885b:9894:536a])
 by smtp.gmail.com with ESMTPSA id
 v13sm3544503qtp.61.2019.09.19.05.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 05:07:26 -0700 (PDT)
From: Marc Dionne <marc.dionne@auristor.com>
To: linux-afs@lists.infradead.org,
	David Howells <dhowells@redhat.com>
Subject: [PATCH] afs: Fix large file support
Date: Thu, 19 Sep 2019 09:07:24 -0300
Message-Id: <20190919120724.25160-1-marc.dionne@auristor.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_050731_261634_4E008247 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.3 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.222.196 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.196 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (marc.c.dionne[at]gmail.com)
 0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
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

By default s_maxbytes is set to MAX_NON_LFS, which limits the usable
file size to 2GB.

AFS file servers have supported larger files for a long time, so set
s_maxbytes to MAX_LFS_FILESIZE.

Signed-off-by: Marc Dionne <marc.dionne@auristor.com>
---
 fs/afs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/afs/super.c b/fs/afs/super.c
index f18911e8d770..488641b1a418 100644
--- a/fs/afs/super.c
+++ b/fs/afs/super.c
@@ -435,6 +435,7 @@ static int afs_fill_super(struct super_block *sb, struct afs_fs_context *ctx)
 	/* fill in the superblock */
 	sb->s_blocksize		= PAGE_SIZE;
 	sb->s_blocksize_bits	= PAGE_SHIFT;
+	sb->s_maxbytes		= MAX_LFS_FILESIZE;
 	sb->s_magic		= AFS_FS_MAGIC;
 	sb->s_op		= &afs_super_ops;
 	if (!as->dyn_root)
-- 
2.21.0


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
