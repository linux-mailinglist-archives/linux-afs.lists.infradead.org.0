Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5A31AFB61
	for <lists+linux-afs@lfdr.de>; Sun, 19 Apr 2020 16:21:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ou+Rngc1JZDpBji5a9tmrzl2hshM80+vRsO4ZTSTwwQ=; b=WOO72wg8poo5Iz
	pf9TwYR7QwizMQSvrkL+hUIprj9MgveRSaYRqtca8Lozmr1KtKAsRO84yROnpB1t4EUIl9Pv9r9z9
	gS9KduwuezQKqmPlyXO+wzcLyu0RvhZFgxif9WBh7zNuyVg0Ze80LFExRDDawkJfKbYO+w73WQEag
	OfAo4BPyajQu7lXWmQ1RCoXw3fll/2F3826byZHplQGZyFVhdVeqYXPZPQVu/x/kMjWT5CalYYzJp
	awkU1jAWix558JtaLkMsqWlPrdnmnD5+e08YVB25tW+Nhz5tpL/bDe7IGdH5yUNkdpU3JroTts7ao
	2z2WRrCsKyHEOzmuCwTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQAou-0005DE-Fv; Sun, 19 Apr 2020 14:21:16 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQAol-0005Bm-Vj
 for linux-afs@lists.infradead.org; Sun, 19 Apr 2020 14:21:14 +0000
Received: by mail-pl1-x643.google.com with SMTP id f8so2945777plt.2
 for <linux-afs@lists.infradead.org>; Sun, 19 Apr 2020 07:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=iNdtGmX8Mu2ED7qo7igSHuIaVBqlC/RXPGPET/rFH7E=;
 b=fBhsvg+goi25pzMlI+TkmrqJUQAcio7u4bRcJHuyL48e/1CpRxRIzGRBZYjV9n8AUq
 aWlloDEsVTSf0orRQUSDGFXgPFy0ju44OziL5os8utnq+d/Jjte0AXOJlbTWaM1oy5Kc
 yoO6If4Dorh9WHpbWWirUW5jjjc3Eg/53vwlENdo39J322Q0c522eRP0jtGDQm6LnPvY
 kgf+Tity1Xs3+mm6x8MDHWgR+qn/fETfiqoMCxpIkH7Ck0DHOLRN8Dd431FXrs+Uim4i
 uBLWTM1pS9S4BqpoH+tmNZjH0gecs2o7Y+GPlT+M1gJjViL1s4DDbgFT7b5Gyt9za+Cn
 BCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=iNdtGmX8Mu2ED7qo7igSHuIaVBqlC/RXPGPET/rFH7E=;
 b=FVJLNYeU4da+9rHtm4xeceqTFl+rUDSfWYmjc0ieVLs6tuYnDcJyWohnJiCBqLzNqv
 COcg8NHiW267hpHba/tdhGgAa8TbdE2KWqI4Wla8cIFI6AjojhHfrbp9ju7kV++p42On
 jnrGZmNniOKMLmZ+mGINK/xGUPELBo9U+LDnd3bCjE5SDDn1Bdnwjkjr96Nl2/EKSkDw
 ZrMsszdkX/FQrgrK3BTZG+RHgnZ9OD+v4DgJkqcVCraqje5ykncBqfl81YGNBWAoe8tk
 aoq9gWws1R+ZZGO1WqfsEQ40tfUlHp3BMs6Auw/QCykH4cZc90vofOzqwP16ELBUGAaR
 dqjA==
X-Gm-Message-State: AGi0PuYLNJ7QuPsuG4/L2l0SBvy6hV61/0wSaPqUYDZKea/8dP0jHMJ8
 RFpfBhOK8QWmKnc/WL9VNIY=
X-Google-Smtp-Source: APiQypKp/jN68WTcZUdJP/Wub1688Qcn2axAexOpLU1AMRrP0nrP/ij+wGC54EYhIv5cgm7vs0J+2g==
X-Received: by 2002:a17:90a:9b82:: with SMTP id
 g2mr11100014pjp.72.1587306065858; 
 Sun, 19 Apr 2020 07:21:05 -0700 (PDT)
Received: from nishad ([106.51.232.103])
 by smtp.gmail.com with ESMTPSA id q200sm23603494pgq.68.2020.04.19.07.21.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 19 Apr 2020 07:21:05 -0700 (PDT)
Date: Sun, 19 Apr 2020 19:50:59 +0530
From: Nishad Kamdar <nishadkamdar@gmail.com>
To: David Howells <dhowells@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Joe Perches <joe@perches.com>
Subject: [PATCH] fs: afs: Use the correct style for SPDX License Identifier
Message-ID: <20200419142055.GA8233@nishad>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200419_072112_915192_3F75E3C5 
X-CRM114-Status: GOOD (  10.90  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:643 listed in]
 [list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [nishadkamdar[at]gmail.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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

This patch corrects the SPDX License Identifier style in
header file related to Andrew File System support (AFS).
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used).

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 fs/afs/protocol_uae.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/afs/protocol_uae.h b/fs/afs/protocol_uae.h
index 1b3d1060bd34..528a6f1aa611 100644
--- a/fs/afs/protocol_uae.h
+++ b/fs/afs/protocol_uae.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Universal AFS Error codes (UAE).
  *
  * Copyright (C) 2003, Daria Phoebe Brashear
-- 
2.17.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
