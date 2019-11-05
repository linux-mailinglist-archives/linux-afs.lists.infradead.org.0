Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 47101F01DD
	for <lists+linux-afs@lfdr.de>; Tue,  5 Nov 2019 16:49:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lgoruz9u6/fHtBsim7kStsT7eVA/f16Cfk10peWYGag=; b=qZtGJVvPtgi0v+
	+EbzV4aDaziWhr+X3g6dlT5crAD6tWD+VSN3no5QgxUFYZSxNVll0VUJPTUQNnJanr2iVezI/GduM
	sQ3tCoXZZm0j5ucOa9cR4R3OQ3GBHJEcpBJqbCPMIYYDDGtI5hF4XXU7V2OEuz6qAQihQAFtTE55w
	zS/Mviz8KZAMP+VG6AY+NxyTHHjfqhuwcrw2dX7Y7H9pN2JL3I9ySwi69NA8ER0qu+pBap3/UJqVy
	0y1NetHhSiNivVEbGlbN2dFltf+KX2j02GbwdOB81FeG32Z2Ejxd+x6bGzcoiFkqzDClOe5hGTBG6
	W+f9cIkHhqQJrh6i35kA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iS14u-0005Om-QM; Tue, 05 Nov 2019 15:49:08 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iS14s-0005O1-2i
 for linux-afs@lists.infradead.org; Tue, 05 Nov 2019 15:49:07 +0000
Received: by mail-pg1-x541.google.com with SMTP id 15so14507776pgt.7
 for <linux-afs@lists.infradead.org>; Tue, 05 Nov 2019 07:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Da4uiaQj7qVMKa9oAKwCKH6uxJg0bHesNrE0BWHWXgs=;
 b=hfnreEuHEVOOB4GYxQpvcNt/tzK2jHW/3WicKvVvnoECbhjeTfvJ/jRVCXoVfoFwBD
 gh3UoJbBuR7BW388M6JzkvjPJo2P5gMEmdXXbL+SX8wCS5HtPQrU/DpxQE9Zdy1IwEIE
 1W5uG/KdoyUy7Fi5vrMI7VVqu6PlqCGu3nFAWomVbU1FMzmiEHTzyHi22EsDOKKw5+SF
 Qa5pv5rX9fsLm2x6BIIKMypZFT1b+/p8/K7NeOe0eH67JQqWtbbNe206u4qYMuQmI+bT
 S+Qrk8fyhuiVjq25M8dNkPU4DSGtRkZC2HIhmgERALnPAzLclCK6Xs4xtXg4zi8e/Oos
 QU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Da4uiaQj7qVMKa9oAKwCKH6uxJg0bHesNrE0BWHWXgs=;
 b=mkHTqGrT8fULzggdthjqhx77oE0np2u4p08F5aw+i4eIcAqRkk5pEhrQ0+QhFs6ISp
 drgUFPCwisbLWrbdPL6zyLTSutbHALKDmcrwx1Eu4L2pHSvN0u0Aehsf/uW20etaJTbg
 xVFa0Si4rXdILIKT6nsi3cPczLxt5lLeocQ6YHsOL59H2isPbOK4O2P3VbMYyOr9IFEX
 D6+ifpoPxKOTVPZqJU0jCKw+quZfZqbLWVJHw+K1VEuTvrj4xhr7H7se/iorY+geKKur
 Rfx04wLE+hwlF4LFBedlYUOkLnik3KaU+GuQYV0tqehNEGxfOz0YL02eDDHzf2G2Rggr
 UmoA==
X-Gm-Message-State: APjAAAXzztrtX8W2aark/FK8H4qJTnrxSNoCRbqT0wxxfOB14dBLWOUv
 AtBzE8VFAg+Hrq9e/ONBpJl3+A==
X-Google-Smtp-Source: APXvYqw6TT6h4xdMnSvvaN4taYhNyZSJ66DjuT/Lvx+weHFctd/pnh6xoc71B6HDMJiRTUZW/XU+Sw==
X-Received: by 2002:a63:5966:: with SMTP id j38mr36959501pgm.304.1572968945118; 
 Tue, 05 Nov 2019 07:49:05 -0800 (PST)
Received: from nebulus.mtv.corp.google.com
 ([2620:15c:211:200:5404:91ba:59dc:9400])
 by smtp.gmail.com with ESMTPSA id f189sm29671326pgc.94.2019.11.05.07.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 07:49:04 -0800 (PST)
From: Mark Salyzyn <salyzyn@android.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] afs: xattr: use scnprintf
Date: Tue,  5 Nov 2019 07:48:44 -0800
Message-Id: <20191105154850.187723-1-salyzyn@android.com>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_074906_123508_F737DA7E 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:541 listed in]
 [list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
Cc: Jan Kara <jack@suse.cz>, Mark Salyzyn <salyzyn@android.com>,
 David Howells <dhowells@redhat.com>, linux-fsdevel@vger.kernel.org,
 kernel-team@android.com, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

sprintf and snprintf are fragile in future maintenance, switch to
using scnprintf to ensure no accidental Use After Free conditions
are introduced.

Signed-off-by: Mark Salyzyn <salyzyn@android.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>
Cc: linux-afs@lists.infradead.org
Cc: Jan Kara <jack@suse.cz>
---
 fs/afs/xattr.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/fs/afs/xattr.c b/fs/afs/xattr.c
index 5552d034090a..7af41fd5f3ee 100644
--- a/fs/afs/xattr.c
+++ b/fs/afs/xattr.c
@@ -228,11 +228,11 @@ static int afs_xattr_get_yfs(const struct xattr_handler *handler,
 		break;
 	case 1:
 		data = buf;
-		dsize = snprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
+		dsize = scnprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
 		break;
 	case 2:
 		data = buf;
-		dsize = snprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
+		dsize = scnprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
 		break;
 	case 3:
 		data = yacl->vol_acl->data;
@@ -370,13 +370,15 @@ static int afs_xattr_get_fid(const struct xattr_handler *handler,
 	/* The volume ID is 64-bit, the vnode ID is 96-bit and the
 	 * uniquifier is 32-bit.
 	 */
-	len = sprintf(text, "%llx:", vnode->fid.vid);
+	len = scnprintf(text, sizeof(text), "%llx:", vnode->fid.vid);
 	if (vnode->fid.vnode_hi)
-		len += sprintf(text + len, "%x%016llx",
-			       vnode->fid.vnode_hi, vnode->fid.vnode);
+		len += scnprintf(text + len, sizeof(text) - len, "%x%016llx",
+				vnode->fid.vnode_hi, vnode->fid.vnode);
 	else
-		len += sprintf(text + len, "%llx", vnode->fid.vnode);
-	len += sprintf(text + len, ":%x", vnode->fid.unique);
+		len += scnprintf(text + len, sizeof(text) - len, "%llx",
+				 vnode->fid.vnode);
+	len += scnprintf(text + len, sizeof(text) - len, ":%x",
+			 vnode->fid.unique);
 
 	if (size == 0)
 		return len;
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
