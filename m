Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7293C71836
	for <lists+linux-afs@lfdr.de>; Tue, 23 Jul 2019 14:26:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=0dserO2W4ROGXJxMvV/AOEX1g8iW+C+xQ1+Uz8gRZks=; b=Fd+
	5uT7qw1OkFgkMiOdbCBLf7z6qastVwYDwXUv0rnyemvbuN7Ukr0fGo3IwnAimnUa6wRhEHkcpwj7G
	xQ1sZUNDslTEX/Hqa3jh7Mhhz+jNOzY6QMfYKhP5nQE+E0S3vlotulsMQotnWdE+5IX82aBYQHnNf
	8fGrJhzzYF+hTW0cgMiouEumAEconlGgGJpk1ReCKd2X+LNTjhZ+WlUk5DAsbZI7VHaKSu1TU4v7h
	A0znZI1p6fU9ml7HBRFqQ+iwBsJ1uzTLC214icIQt3KSJKhfYbUgidDvy39L8gzSFHav6l8Ej5Vj0
	S17Gl8v9oER25/Mhv4VB0+5dA8H0o7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hptsO-0006jx-0u; Tue, 23 Jul 2019 12:26:40 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hptrm-0006Kd-61
 for linux-afs@lists.infradead.org; Tue, 23 Jul 2019 12:26:03 +0000
Received: by mail-pg1-x543.google.com with SMTP id o13so19347012pgp.12
 for <linux-afs@lists.infradead.org>; Tue, 23 Jul 2019 05:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=d+pnG65HXsnRmlzhaNNzk6y1yw6MWg2lSfilUvi/rLw=;
 b=V9weTodOYCYaFd7X60mM2I0iNT2dJQddnTuM96ykARlIZO67gGvp+UQa2YlwCxGAaF
 Uk+SHoks11jMp8cTcExW76F8m+UwjFNGkT639eWlWP0AmGb5c13LsC8p9rx+1LMac0JX
 cj/teAaKGGjSunYWoqBM4aD8BpXrJ4vZVkErEJAVlzZi7E2+ieYK6hIwC6GSDfniTuu+
 /yyf1+SDD2Yj5F8v/ZdaFgdMFyFHBE9DHRHPe3VGLxh1FQCyhdgANw8O7wFYNF+z9hyU
 ZdisoYQHQu/NPOt4wd346std2iUJ2Qzph4fOv1kiEiTfWTAdCHUmtdS4lxDfyBYjQeCb
 vzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=d+pnG65HXsnRmlzhaNNzk6y1yw6MWg2lSfilUvi/rLw=;
 b=DfiGBgetsP/N+0DY3pexy9ln7AhZRzIKsy3iBgiIFlpxbJUA9HE2u+nkrVdAZHnZPe
 65t/SVsKAWDc5J97j5UsqtwWoFysQcYIf/v3WRk/BGhCBcj4T5dt9LmwO8RbKGChnRv2
 6edNLQMwpFS84UI25MlRWov0sKoOzFDdKZzrQgIeCL3F37nbiwrbUaENAtQaKFFV6Erx
 IA6FK2IBvK1KedB6lFZ9h2k2KBV3rafmOsw+PCUqDgFAYscG0M3nt1rv85oJFyv+ZjN1
 Lxnxh4z0p60y4aaPOShtOczJBgpeOeagJBXjxdLgliOBHRR53qRKPFjxJlx3af93wfRI
 BKqw==
X-Gm-Message-State: APjAAAVzUEqafgm74pPZ+lMFsCKJDA7b5Ttbj2Zse7idQwC6ddcOAxul
 F7ZH8xOJc4aVaznS2fuvqdI=
X-Google-Smtp-Source: APXvYqwsAvz00r+/iJSmZPzm8Ll2VIOWh2HmWmohM5cYcM4y9UywSWl2Dd7u7Nbtl+V7bw2okgG3TA==
X-Received: by 2002:a17:90a:b387:: with SMTP id
 e7mr84704034pjr.113.1563884760953; 
 Tue, 23 Jul 2019 05:26:00 -0700 (PDT)
Received: from oslab.tsinghua.edu.cn ([2402:f000:4:72:808::3ca])
 by smtp.gmail.com with ESMTPSA id g18sm75138115pgm.9.2019.07.23.05.25.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Jul 2019 05:26:00 -0700 (PDT)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: dhowells@redhat.com
Subject: [PATCH] fs: afs: Fix a possible null-pointer dereference in
 afs_put_read()
Date: Tue, 23 Jul 2019 20:25:53 +0800
Message-Id: <20190723122553.14565-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190723_052602_306729_6A57FCFF 
X-CRM114-Status: GOOD (  10.41  )
X-Spam-Score: 0.1 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:543 listed in]
 [list.dnswl.org]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit (baijiaju1990[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (baijiaju1990[at]gmail.com)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: Jia-Ju Bai <baijiaju1990@gmail.com>, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

In afs_read_dir(), there is an if statement on line 255 to check whether
req->pages is NULL:
	if (!req->pages)
		goto error;

If req->pages is NULL, afs_put_read() on line 337 is executed.
In afs_put_read(), req->pages[i] is used on line 195.
Thus, a possible null-pointer dereference may occur in this case.

To fix this possible bug, an if statement is added in afs_put_read() to
check req->pages.

This bug is found by a static analysis tool STCheck written by us.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 fs/afs/file.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index 56b69576274d..dd3c55c9101c 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -191,11 +191,13 @@ void afs_put_read(struct afs_read *req)
 	int i;
 
 	if (refcount_dec_and_test(&req->usage)) {
-		for (i = 0; i < req->nr_pages; i++)
-			if (req->pages[i])
-				put_page(req->pages[i]);
-		if (req->pages != req->array)
-			kfree(req->pages);
+		if (req->pages) {
+			for (i = 0; i < req->nr_pages; i++)
+				if (req->pages[i])
+					put_page(req->pages[i]);
+			if (req->pages != req->array)
+				kfree(req->pages);
+		}
 		kfree(req);
 	}
 }
-- 
2.17.0


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
