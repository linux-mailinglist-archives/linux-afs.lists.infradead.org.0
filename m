Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 270D51F887
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 18:26:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CnXBZXhLtwWDfCBRKWu+mqz068mP0RMrBFJqYQAqa5U=; b=gw+wAhJP0BkhiJ
	XESDtz+CZMypql5iBupDZUD9/Vzl3RX6cKrFfQ1PH9ifW9MTrXvHnZiwflnEmIV3OX5EmHfOPvRYZ
	yGrayA/9gIkOnPqKdfflq6j2frpLv+6TuipTROqXrEvf5Wk1zB75JBUKM28v6i+1Hkr62cNc9E7U3
	dVSFxVmv7ZTpAVMsLBsofV1GAVVAdH1XWdVR5l78RyMa4ay8SgCZaQuxu8lh+jcibRPxTPfjfXOMs
	XoTMzTAp91UuYi0akLmm2wje+XvuZsXx9Ql48KG75eOW+CIhzuMJwp7I1bGgbowmTqfFT14YxjJSH
	uUTNO45NlNcADNKEdKLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQwjh-0001gx-JD; Wed, 15 May 2019 16:26:33 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQwje-0001gU-68
 for linux-afs@lists.infradead.org; Wed, 15 May 2019 16:26:31 +0000
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ECAB728207;
 Wed, 15 May 2019 16:26:29 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20BDC5C28E;
 Wed, 15 May 2019 16:26:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 07/15] Add wait_var_event_interruptible()
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 15 May 2019 17:26:28 +0100
Message-ID: <155793758837.31671.13765813674309502991.stgit@warthog.procyon.org.uk>
In-Reply-To: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
References: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Wed, 15 May 2019 16:26:30 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_092630_255860_0597BC58 
X-CRM114-Status: GOOD (  12.16  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
Cc: Peter Zijlstra <peterz@infradead.org>, dhowells@redhat.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Add wait_var_event_interruptible() to allow interruptible waits for events.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Peter Zijlstra <peterz@infradead.org>
---

 include/linux/wait_bit.h |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/wait_bit.h b/include/linux/wait_bit.h
index 2b0072fa5e92..7dec36aecbd9 100644
--- a/include/linux/wait_bit.h
+++ b/include/linux/wait_bit.h
@@ -305,6 +305,19 @@ do {									\
 	__ret;								\
 })
 
+#define __wait_var_event_interruptible(var, condition)			\
+	___wait_var_event(var, condition, TASK_INTERRUPTIBLE, 0, 0,	\
+			  schedule())
+
+#define wait_var_event_interruptible(var, condition)			\
+({									\
+	int __ret = 0;							\
+	might_sleep();							\
+	if (!(condition))						\
+		__ret = __wait_var_event_interruptible(var, condition);	\
+	__ret;								\
+})
+
 /**
  * clear_and_wake_up_bit - clear a bit and wake up anyone waiting on that bit
  *


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
