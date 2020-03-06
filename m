Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B9217C2BA
	for <lists+linux-afs@lfdr.de>; Fri,  6 Mar 2020 17:18:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NMfuniEadmtA4KzE54qOlvijQqLgOuYYJp2vQCQMy0o=; b=Q07ot0cq5ZyQ+9
	k6k4u5D1S7T0sFXkY+xGGgt6eK1o4K/wlW0FLzu8pVGTI/ZCy/X+GbJKGbj4sLtgTyh/sHGbRRzZT
	WmE+2ktY5lQ2cERE1hFuS5sabQEOWj8mdfcnGHyBCugrkQqvP+nVFvPGF0lsdOdOkZK/7ZIKBC+jS
	44SoWBXJ0c2FOzlrV0+P3rlL/je/GpZeOz3PawOMkxb/JTSRdJ1enyvpCtKC1WvTgj/cK5lAuArPI
	M/p0ir54MmOvb14YUyWtcDZ4oRXXCEpcyOHJDqdp8jUnBh9Mj9yy9i3XDif/FwcyLfLft4nD7qjNg
	CrVh46jiNzCCaB7/nlcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAFfJ-0000Eo-HE; Fri, 06 Mar 2020 16:17:33 +0000
Received: from mail-yw1-xc49.google.com ([2607:f8b0:4864:20::c49])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAFfG-0000EQ-7o
 for linux-afs@lists.infradead.org; Fri, 06 Mar 2020 16:17:31 +0000
Received: by mail-yw1-xc49.google.com with SMTP id r19so4044249ywk.1
 for <linux-afs@lists.infradead.org>; Fri, 06 Mar 2020 08:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=qIlBFT3Kt2tcWYPKabCBDwELz8TNxUv98gWkjXaoCOk=;
 b=UIreHpWH6UQJs0j9K14EpJ0gqWwjNSF+b7PrYmigUOlohSwOL0kex8Xz7exblAYi2G
 xcaFZnkuEQJ7jJ2SLpI1mfvF84qTbBbOghDHJhukDjLA8mg1ejNE6vWoROyFLkpC5D0O
 GTx5M7VPnQgYxHocDwt6xCabK3Hv5uYXJVLv9hhqRKWlvvn3UTQm6JOqArgs4HSaYSRp
 O6MGIV1MaE5xDhMiTX6xUF+5wYwF9MJNoe7nGW/srPKExRduR1QBwdQnEIzUbRPSTuLK
 O2D46RZ2EVBZ2oEzSYna61xXhUVX2Ix2zzXCpuNB+xC/rennRT2M7F8Gn2hpFlJHL89Y
 u8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=qIlBFT3Kt2tcWYPKabCBDwELz8TNxUv98gWkjXaoCOk=;
 b=o/l53ne0vfmo7HT2cd4NGUjdZJkfKHQfd2YmLV8QdkaTv5qa6yP0l+UXQVLAZd7MtR
 VhISau5pGkXdl47wUzUk2r/xgoYNyBwcAcfbdq6CUFeIZvMPwkGwP/DQQYyAAVMvdgTB
 fi9afh36EfJT7affqHSdINzKbVSzykH/7AP7gFqQHdYLppBs7svLuxFmQHxF79Ru1HQJ
 bgV9KSQttxwR48cUgNcVDp86BuQOkDUqKdAmyM7l0EsmpCcUIZHl0OLS41fzXwh65cNP
 Ppl/UM/S0N6RcFvP5WbcDYu2J+qyEtyed38ipkkLKvqQjRPPe3douI5HHdPWRJLHKZMD
 nueQ==
X-Gm-Message-State: ANhLgQ2A6cqvtArGegbjJETfpvC78OcNMXF4+/iE0fjEgjbVTkNv75sr
 Y+JlwT0RthgT1ZNVgl15QB9Dpq4yXA==
X-Google-Smtp-Source: ADFU+vs6IS/KZfvFYayoFc3jA/lDIYq1RFJQe6OJepWFF6PKB2MkSFTognNkdS4kUdogR9vaeTPad1QfiA==
X-Received: by 2002:a25:3dc4:: with SMTP id k187mr4535109yba.82.1583511448778; 
 Fri, 06 Mar 2020 08:17:28 -0800 (PST)
Date: Fri,  6 Mar 2020 17:17:18 +0100
Message-Id: <20200306161718.50702-1-jannh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH] afs: Use kfree_rcu() instead of casting kfree() to
 rcu_callback_t
From: Jann Horn <jannh@google.com>
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_081730_279697_311B0DDA 
X-CRM114-Status: GOOD (  10.19  )
X-Spam-Score: -7.7 (-------)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-7.7 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:c49 listed in]
 [list.dnswl.org]
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
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

afs_put_addrlist() casts kfree() to rcu_callback_t. Apart from being wrong
in theory, this might also blow up when people start enforcing function
types via compiler instrumentation, and it means the rcu_head has to be
first in struct afs_addr_list.

Use kfree_rcu() instead, it's simpler and more correct.

Signed-off-by: Jann Horn <jannh@google.com>
---
compile-tested only

 fs/afs/addr_list.c | 2 +-
 fs/afs/internal.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/afs/addr_list.c b/fs/afs/addr_list.c
index df415c05939e..de1ae0bead3b 100644
--- a/fs/afs/addr_list.c
+++ b/fs/afs/addr_list.c
@@ -19,7 +19,7 @@
 void afs_put_addrlist(struct afs_addr_list *alist)
 {
 	if (alist && refcount_dec_and_test(&alist->usage))
-		call_rcu(&alist->rcu, (rcu_callback_t)kfree);
+		kfree_rcu(alist, rcu);
 }
 
 /*
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 1d81fc4c3058..35f951ac296f 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -81,7 +81,7 @@ enum afs_call_state {
  * List of server addresses.
  */
 struct afs_addr_list {
-	struct rcu_head		rcu;		/* Must be first */
+	struct rcu_head		rcu;
 	refcount_t		usage;
 	u32			version;	/* Version */
 	unsigned char		max_addrs;

base-commit: aeb542a1b5c507ea117d21c3e3e012ba16f065ac
-- 
2.25.0.265.gbab2e86ba0-goog


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
