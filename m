Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE7E18B2AF
	for <lists+linux-afs@lfdr.de>; Thu, 19 Mar 2020 12:54:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YA0z2+Dapf6hFG7g8z28X3uNGfSIxVKRrH15WuylvBM=; b=HkUvOdz1tTJlKj
	uoWAoR37UBfoHHCskpZ1MyE5EMAd+ayOHoHb5Hc83LKzxX4y+dPTAPzPuCw5Jz3wYCnS64iuGVsWO
	IDCrczABwajNjyNDJQbcvfGeGNBTvMV6lE0/VtzpgILzUuDcyWzj9f8npqsfXELvYxCvxjiPRPo31
	6mRMZYulC4kIl82dE5irVRLdFol02gx8Muipxcu0tgVg0Z2sAUWJj7gsgEaHcTLLQqGBYtrZdR5jV
	VxO2V2ENjHzbaHq0XoFH9Q+0M0Lmzrs9hnuCZkS6RpnxVFbb30keee3dLwwA0TWpx4ihDs7RmLyT0
	EadNaO4fQ1hb1dxnuomw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEtkM-0007QX-JF; Thu, 19 Mar 2020 11:53:58 +0000
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEtkK-0007Pm-4M
 for linux-afs@lists.infradead.org; Thu, 19 Mar 2020 11:53:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584618835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qdc4biMeK9Wjx6YY8wRgFvnqeW4py3RkO5KpUWd0Lfk=;
 b=VDj8HoP/UD9eHHonYOI2ZJtdyE+jyS6ULeZhlOkJ2E4Wx+ZYYSCHy0CTPnRixkh3bciuuF
 5ViG6vuwKRkxeWIglq4RmOO+bjF86lURhA9c9nC15naSfeFKG+qvTwYAHGi/4GKrHfb5+a
 9rCSQmwUpjVPDHAgw9kFvhho0ycU0Dk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-4x8mfVZYNtWpQiEzrAI_hw-1; Thu, 19 Mar 2020 07:53:53 -0400
X-MC-Unique: 4x8mfVZYNtWpQiEzrAI_hw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F264107ACCA;
 Thu, 19 Mar 2020 11:53:52 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-126.rdu2.redhat.com
 [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE3878FC06;
 Thu, 19 Mar 2020 11:53:51 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 3/6] rxrpc: Fix sendmsg(MSG_WAITALL) handling
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 19 Mar 2020 11:53:51 +0000
Message-ID: <158461883093.3094720.4502121814429124960.stgit@warthog.procyon.org.uk>
In-Reply-To: <158461880968.3094720.5019510060910604912.stgit@warthog.procyon.org.uk>
References: <158461880968.3094720.5019510060910604912.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_045356_248200_C6E85331 
X-CRM114-Status: GOOD (  12.28  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.205.24.74 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Fix the handling of sendmsg() with MSG_WAITALL for userspace to round the
timeout for when a signal occurs up to at least two jiffies as a 1 jiffy
timeout may end up being effectively 0 if jiffies wraps at the wrong time.

Fixes: bc5e3a546d55 ("rxrpc: Use MSG_WAITALL to tell sendmsg() to temporarily ignore signals")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 net/rxrpc/sendmsg.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/rxrpc/sendmsg.c b/net/rxrpc/sendmsg.c
index 1eccfb92c9e1..0fcf157aa09f 100644
--- a/net/rxrpc/sendmsg.c
+++ b/net/rxrpc/sendmsg.c
@@ -71,8 +71,8 @@ static int rxrpc_wait_for_tx_window_waitall(struct rxrpc_sock *rx,
 
 	rtt = READ_ONCE(call->peer->rtt);
 	rtt2 = nsecs_to_jiffies64(rtt) * 2;
-	if (rtt2 < 1)
-		rtt2 = 1;
+	if (rtt2 < 2)
+		rtt2 = 2;
 
 	timeout = rtt2;
 	tx_start = READ_ONCE(call->tx_hard_ack);



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
