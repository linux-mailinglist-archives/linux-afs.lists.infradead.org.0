Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 627B51044DC
	for <lists+linux-afs@lfdr.de>; Wed, 20 Nov 2019 21:18:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8VbSAQeOmq7zEz9DbSqyCKqt2w2nXwCxbL1vEV+A6XM=; b=e+bEepaRzwwYPEq39F12Lz/BRj
	l+VliEnqQAJX2a0dVvT9+RXCQ6W+dqfu3Wi3lOyDvCBZSg8PgwPIguuwPP9XoETsA+4tDyaoGBl2y
	34551L27L/vIRrsVifmwieHL9DDnjfFOTyzsachnC4RJ6BzxFy4usAv6oILS5fLXuv4+vtPZwYV4d
	D9UIXbwQw6OuTB0CvIpJcgj+szksngcAxBTxPpEewBdHlu+v1ks4yXHzZkQuwG3P9KAcuLlUi0jSH
	qZ1bImCTyChDmzgqmQW/+d9JRBWz1B3zntKWoNUUc57+VveyqcFhmiuHJk7s/WrWOGMGHcsO8NdWJ
	Glu80l9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXWR3-0007RB-2m; Wed, 20 Nov 2019 20:18:45 +0000
Received: from mail-qk1-f193.google.com ([209.85.222.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXWR0-0007Q8-TF
 for linux-afs@lists.infradead.org; Wed, 20 Nov 2019 20:18:44 +0000
Received: by mail-qk1-f193.google.com with SMTP id o17so1007813qko.6
 for <linux-afs@lists.infradead.org>; Wed, 20 Nov 2019 12:18:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=G6oCde79gOf72cwSBV8dVu7xqeDysrqT9zuzyByqfwY=;
 b=MealsUPaEECkHHwPWcpi1VUrzOWovqrXNRFZf7I9RrSPumWpWFryLDkyodsg68wq7W
 Kvtr3uVN4TaBGYdwlSGrz0X4kmlNo2/cdHuRKu7si84XTtVm/fHC/tZx5ijd1+RhC5xO
 k+7KRjJtIDLJJqGwBRizj6zgQ3DsMGKgBxTKjH3iSRlotW2zsw2SQtTrI1Qx5u2Vuzlb
 8yD1wcn4vPNx2eCojKPSWJXeFoIcL7opOLADPHiesGhRBkeffiulLdh6D5moHS4IW3He
 3TbITFLtqX5I3/9wMT1B9Z0XY9t8mmmeYohu1JdfZwM9v5eMH1eSovgL1pMMQJl9rez5
 Nz6g==
X-Gm-Message-State: APjAAAWXQs47csgmOMkf5Mc4FttooCgSjQ8TRyCUpbFS8FVXmpp5/dQX
 nKz7UmIev4ftS+kMfrhxTAXBMajJJkM=
X-Google-Smtp-Source: APXvYqyER7cwN+xG6Dm5JQ0jx+fj/2XDoHdyfm9y1HmIv3oDV7rnD1UA4UQl2aNOIr2oCm9QHg4dvw==
X-Received: by 2002:a37:9b50:: with SMTP id d77mr4363798qke.349.1574281121005; 
 Wed, 20 Nov 2019 12:18:41 -0800 (PST)
Received: from tornado.marcdionne.net ([2001:470:1d:225:1931:5e46:f6b7:2cb9])
 by smtp.gmail.com with ESMTPSA id
 l186sm186182qkc.58.2019.11.20.12.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 12:18:40 -0800 (PST)
From: Marc Dionne <marc.dionne@auristor.com>
To: linux-afs@lists.infradead.org,
	David Howells <dhowells@redhat.com>
Subject: [PATCH 2/2] afs: Fix large file support
Date: Wed, 20 Nov 2019 16:18:26 -0400
Message-Id: <20191120201826.259253-2-marc.dionne@auristor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191120201826.259253-1-marc.dionne@auristor.com>
References: <20191120201826.259253-1-marc.dionne@auristor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_121842_940123_3D6C43F1 
X-CRM114-Status: GOOD (  10.72  )
X-Spam-Score: 0.5 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.222.193 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (marc.c.dionne[at]gmail.com)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.193 listed in wl.mailspike.net]
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

By default s_maxbytes is set to MAX_NON_LFS, which limits the usable
file size to 2GB, enforced by the vfs.

Commit b9b1f8d5930a ("AFS: write support fixes") added support for the
64-bit fetch and store server operations, but did not change this value.
As a result, attempts to write past the 2G mark result in EFBIG errors:

 $ dd if=/dev/zero of=foo bs=1M count=1 seek=2048
 dd: error writing 'foo': File too large

Set s_maxbytes to MAX_LFS_FILESIZE.

Fixes: b9b1f8d5930a ("AFS: write support fixes")
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
2.23.0


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
