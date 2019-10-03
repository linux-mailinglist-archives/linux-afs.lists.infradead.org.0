Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A35C9C99FE
	for <lists+linux-afs@lfdr.de>; Thu,  3 Oct 2019 10:36:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=K0VlV03vcOFJQ6f1RRR5lzXEt+wdd4/z3vojRGqabGM=; b=F3hkGz9HCwPufgoklSy3h21k3f
	k134bMbtnBKEmX+T6gUBXB3kKiFAH7hdaObEaSNxlupnl4nvGefKkCJC+BmsVlJyr1E3rzaP+xsGe
	Tb+5fuV+wyqoXTHFvsUXU+6ez9LbTQs79VIupkS6tqPQmAan9dDGLxg3ZFdshwGAAq1kYJmiaL9zo
	F44s2iM/5jRjvq7kV94PMnEizHSCViTRzQM5AVTMXP3i4giyI0bgYU5UMI4GadeHfcVh4gOBS4PnA
	7lzuZrgcORrwgvj9galyJDJNJlm+9Faf7OCKJ7VLdEX6z/qi658uOkljzQIRYakcAhTVSCy0rD629
	7nhzDSLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFwbH-0005WZ-1f; Thu, 03 Oct 2019 08:36:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFq9C-0003QD-Ow
 for linux-afs@lists.infradead.org; Thu, 03 Oct 2019 01:43:16 +0000
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47DF7222C5;
 Thu,  3 Oct 2019 01:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570066993;
 bh=rotuVr8T+0nH2VJEluJRScYkA/ofar/x0CByUKr1zYg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i0cSwzfgP4CdMi/Y04TcV13gJxLnhpwf96lljXXzc+5CjBH7f9cAgNQT+k+ML4pHH
 aEWpcJpq4jIKKa+A23ysWzFqZQngIebEkAr4uoes9A0gR+mbHYPbwJzXvYiKl2hgkO
 WMRSf9mxzPQRWWUzzJMduqVSWhFFg4FqVf2+CdDU=
From: paulmck@kernel.org
To: rcu@vger.kernel.org
Subject: [PATCH tip/core/rcu 5/9] fs/afs: Replace rcu_swap_protected() with
 rcu_replace()
Date: Wed,  2 Oct 2019 18:43:06 -0700
Message-Id: <20191003014310.13262-5-paulmck@kernel.org>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20191003014153.GA13156@paulmck-ThinkPad-P72>
References: <20191003014153.GA13156@paulmck-ThinkPad-P72>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191002_184314_830974_A6859889 
X-CRM114-Status: GOOD (  10.52  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Thu, 03 Oct 2019 01:36:37 -0700
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
Cc: tglx@linutronix.de, "Paul E. McKenney" <paulmck@kernel.org>,
 peterz@infradead.org, fweisbec@gmail.com, jiangshanlai@gmail.com,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, josh@joshtriplett.org,
 dhowells@redhat.com, edumazet@google.com, mathieu.desnoyers@efficios.com,
 oleg@redhat.com, dipankar@in.ibm.com, joel@joelfernandes.org,
 akpm@linux-foundation.org, mingo@kernel.org, linux-afs@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: "Paul E. McKenney" <paulmck@kernel.org>

This commit replaces the use of rcu_swap_protected() with the more
intuitively appealing rcu_replace() as a step towards removing
rcu_swap_protected().

Link: https://lore.kernel.org/lkml/CAHk-=wiAsJLw1egFEE=Z7-GGtM6wcvtyytXZA1+BHqta4gg6Hw@mail.gmail.com/
Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: David Howells <dhowells@redhat.com>
Cc: <linux-afs@lists.infradead.org>
Cc: <linux-kernel@vger.kernel.org>
---
 fs/afs/vl_list.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/afs/vl_list.c b/fs/afs/vl_list.c
index 21eb0c0..e594598 100644
--- a/fs/afs/vl_list.c
+++ b/fs/afs/vl_list.c
@@ -279,8 +279,8 @@ struct afs_vlserver_list *afs_extract_vlserver_list(struct afs_cell *cell,
 			struct afs_addr_list *old = addrs;
 
 			write_lock(&server->lock);
-			rcu_swap_protected(server->addresses, old,
-					   lockdep_is_held(&server->lock));
+			old = rcu_replace(server->addresses, old,
+					  lockdep_is_held(&server->lock));
 			write_unlock(&server->lock);
 			afs_put_addrlist(old);
 		}
-- 
2.9.5


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
