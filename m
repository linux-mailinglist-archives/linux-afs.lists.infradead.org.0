Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FB91F87F
	for <lists+linux-afs@lfdr.de>; Wed, 15 May 2019 18:26:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2iEgNRkHJr7ZfbSM7b1G+86VmJBHWxY6fePd0tbyzM=; b=f3mKEO+0KGNHBz
	t7Y5VI7hWEpKOZHX3l87+rmJk1mgLHZB1cicvrZmgk7a0GzeVt05K2/G/1jyFJkKh6kxBpuAwzBoy
	qc6R7O3MnmdVZbv28hbElPCD6e6tpEnYVVlSoYCJvAptL7kHnunsMuVttD6tZPZi1U6sqS0gwJo+9
	5tKV8088Ve64oLuV2Es/QCLGWVw3n/q7YHMao8y9snBd1YNDyskwXdaop3sdYhj6Xd+Z0g5AHTk+Z
	gHJs6n4EHr5eAZF1/53Vi15f8JOTebNqL1+n2TVFkKPPtjPOZILiNh+DaTxl9zeEN0uR5QAYjtfcV
	Gybd7yUUxxCUTwpUDWTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQwjK-0001bf-PH; Wed, 15 May 2019 16:26:10 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQwjI-0001b0-Ij
 for linux-afs@lists.infradead.org; Wed, 15 May 2019 16:26:09 +0000
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 517DF309264E;
 Wed, 15 May 2019 16:26:08 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 961C2608B9;
 Wed, 15 May 2019 16:26:07 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 04/15] afs: Fix missing lock when replacing VL server list
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 15 May 2019 17:26:06 +0100
Message-ID: <155793756678.31671.3057069610724058972.stgit@warthog.procyon.org.uk>
In-Reply-To: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
References: <155793753724.31671.7034451837854752319.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 15 May 2019 16:26:08 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_092608_641131_9B1F92E8 
X-CRM114-Status: GOOD (  13.24  )
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
Cc: dhowells@redhat.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

When afs_update_cell() replaces the cell->vl_servers list, it uses RCU
protocol so that proc is protected, but doesn't take ->vl_servers_lock to
protect afs_start_vl_iteration() (which does actually take a shared lock).

Fix this by making afs_update_cell() take an exclusive lock when replacing
->vl_servers.

Fixes: 0a5143f2f89c ("afs: Implement VL server rotation")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/cell.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/afs/cell.c b/fs/afs/cell.c
index 9de46116c749..9ca075e11239 100644
--- a/fs/afs/cell.c
+++ b/fs/afs/cell.c
@@ -404,12 +404,11 @@ static void afs_update_cell(struct afs_cell *cell)
 		clear_bit(AFS_CELL_FL_DNS_FAIL, &cell->flags);
 		clear_bit(AFS_CELL_FL_NOT_FOUND, &cell->flags);
 
-		/* Exclusion on changing vl_addrs is achieved by a
-		 * non-reentrant work item.
-		 */
+		write_lock(&cell->vl_servers_lock);
 		old = rcu_dereference_protected(cell->vl_servers, true);
 		rcu_assign_pointer(cell->vl_servers, vllist);
 		cell->dns_expiry = expiry;
+		write_unlock(&cell->vl_servers_lock);
 
 		if (old)
 			afs_put_vlserverlist(cell->net, old);


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
