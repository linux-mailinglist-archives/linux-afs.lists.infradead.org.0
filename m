Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 54979103CB3
	for <lists+linux-afs@lfdr.de>; Wed, 20 Nov 2019 14:56:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=vo1JJE0/WILqaNGtsRbZwLiHDncrj6MrPt9dye06PAY=; b=HNk
	CJBwmAt49HKOKGdvliYQV1UMPv5RXg7w//h6and2V2hseKkpFFu2G9tEsQlFwBrKnteHJ0tBJ/Fjw
	iLmpg4JKp6ZNmM9Fj+Zp8es3qQdzvIxcSh/fo7B08Kp+i0H8DwXT7iEOHfrLbNyi6taS/L3/F0bhO
	JxZIUSEcq2cWo7QZRlRR8xgxagvn7MimvK1wa7m9CvYaxn4IX87H/8fY4FSSgOKZkYwO5FIKzoFRP
	ve4RM2CBwiBcJGpdRNWv5JOLJK/Q7t8Rdrtle0BpQXwucti8pN5sjUBYjOmn1tAs4yhCYuqMvvHtm
	Zy1H2Zu4QWOJ+M/PBMu5hRAsZQ7KWKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXQT5-0004XW-N0; Wed, 20 Nov 2019 13:56:27 +0000
Received: from mail-qv1-f68.google.com ([209.85.219.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXQT2-0004Ww-OT
 for linux-afs@lists.infradead.org; Wed, 20 Nov 2019 13:56:26 +0000
Received: by mail-qv1-f68.google.com with SMTP id cg2so9706000qvb.10
 for <linux-afs@lists.infradead.org>; Wed, 20 Nov 2019 05:56:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7GoSuo1HRGjd9hMJ9YNZK5F4rn+JKIKYTOt3qPfTAfg=;
 b=EF1OmqqfoYEEbL6nTlmMgNeQcFMigr5z8mBaIiN9/YUbHCc31WJpXwqXGn5Cj82N74
 vcUBTEiGtVD1O8wuizK6MbXEDn7qbKZgIhIP3fdVKvVOXLDE9anWdkQ1pvQoJB/JwXme
 HfTn9Em2lnI73C8pu4Dln3+LqrIhA8g3+KHEU/SegOda1h1BkcsBGEis2guwTcS83puu
 8RLGejqI7BXz0WVH/wr+bbN/SW2mkY1INLdQkumJ2N7fmkYLLRWzTZWNfOprogcTRMT7
 vAZvpGKTiMEmkA+uCXxenkeL65d2R4DpsjCxigEzg2nbPNFFIM+z0a4MkPFmEAszsmZ+
 /qDw==
X-Gm-Message-State: APjAAAX9WbwNO9Buo7LeEWY1YjYwFuvFEFAmg+S5NT05DTuEfUrMOSn/
 oY/eVi21L0l+qsecHdgKfvE6mxvY
X-Google-Smtp-Source: APXvYqxajooETlnA7wE7mf4zJXHq8r31gvjqR9SA3r3y3EkEiH7I0lj6cTx+RQktoloD2ydvkqCSng==
X-Received: by 2002:a05:6214:32b:: with SMTP id
 j11mr2637275qvu.98.1574258182987; 
 Wed, 20 Nov 2019 05:56:22 -0800 (PST)
Received: from tornado.marcdionne.net ([2001:470:1d:225:9920:532c:2d63:fe1b])
 by smtp.gmail.com with ESMTPSA id
 w13sm832295qka.136.2019.11.20.05.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 05:56:22 -0800 (PST)
From: Marc Dionne <marc.dionne@auristor.com>
To: linux-afs@lists.infradead.org,
	David Howells <dhowells@redhat.com>
Subject: [PATCH] afs: Fix possible assert with callbacks from yfs servers
Date: Wed, 20 Nov 2019 09:55:42 -0400
Message-Id: <20191120135542.225307-1-marc.dionne@auristor.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_055624_803296_736A6EC6 
X-CRM114-Status: UNSURE (   9.81  )
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

Move the check up to SRXAFSCB_CallBack and use the appropriate
maximum value, depending on the service id.

Signed-off-by: Marc Dionne <marc.dionne@auristor.com>
---
 fs/afs/callback.c  | 1 -
 fs/afs/cmservice.c | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/afs/callback.c b/fs/afs/callback.c
index 6cdd7047c809..2dca8df1a18d 100644
--- a/fs/afs/callback.c
+++ b/fs/afs/callback.c
@@ -312,7 +312,6 @@ void afs_break_callbacks(struct afs_server *server, size_t count,
 	_enter("%p,%zu,", server, count);
 
 	ASSERT(server != NULL);
-	ASSERTCMP(count, <=, AFSCBMAX);
 
 	/* TODO: Sort the callback break list by volume ID */
 
diff --git a/fs/afs/cmservice.c b/fs/afs/cmservice.c
index b86195e4dc6c..9a8394483139 100644
--- a/fs/afs/cmservice.c
+++ b/fs/afs/cmservice.c
@@ -259,6 +259,10 @@ static void SRXAFSCB_CallBack(struct work_struct *work)
 	if (call->server) {
 		trace_afs_server(call->server, atomic_read(&call->server->usage),
 				 afs_server_trace_callback);
+		if (call->service_id == YFS_CM_SERVICE)
+			ASSERTCMP(call->count, <=, YFSCBMAX);
+		else
+			ASSERTCMP(call->count, <=, AFSCBMAX);
 		afs_break_callbacks(call->server, call->count, call->request);
 	}
 
-- 
2.23.0


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
