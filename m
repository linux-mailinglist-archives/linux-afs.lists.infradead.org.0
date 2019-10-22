Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 664E0EAF50
	for <lists+linux-afs@lfdr.de>; Thu, 31 Oct 2019 12:56:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RDd0Zz72bfWLqzLWCcusr6iVKPe3jkjtUoee0b5xCZM=; b=BLcTAQ+GD8Adu7WMaqScQOsNTy
	jhUJfBemhA/UJ2A9O4OZMTdAOMExAxajNynqmPZLHyOXZU4PYacqBTJsrFjIai4uZ3zHXg6vrX9DN
	g39Thfp0JZdOni66iN0M9YE/joXl0qNKQUHWsg/TJZhd7omrS3PhrhSU0/MW4/xchSbTiK8A2dANQ
	JdyAialAwERxYw106m+FbjmpKVcTQ7SyeAl/+MB4IqZsfxAfZUXaQ3ar2vC9uYAeycwUN9DGJH8xy
	nB/SIfTXGUHD9Ekn9zFU6VOr3hBD4g2/YDM3fpSGoV4uPV7vtO+/pUqkHdXGnYw9xPb8yBkprkTkF
	M38o3n2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQ93p-0002pq-Lf; Thu, 31 Oct 2019 11:56:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMza1-0003qP-FM
 for linux-afs@lists.infradead.org; Tue, 22 Oct 2019 19:12:30 +0000
Received: from localhost.localdomain (rrcs-50-75-166-42.nys.biz.rr.com
 [50.75.166.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E1A4521D81;
 Tue, 22 Oct 2019 19:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571771548;
 bh=c352t9a37W5iZ6QoYbS1JdFxmkNCiGi48vP+/8QJvW4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ietizg4mUds30r5O4A4J+Bp5G/ZLJ5XbMtd5So8K55enMBKbNOcUbvqKS9Wm7AqeZ
 nq1d2JW4rk9RdrqiB7AoaNsv4o26kshE0NqC+GcPcOfsp6Hg2oq042xGZJ7Od+fJcT
 qkSF05XSStsT+H5BHnc4OcVoBm5L3+4eCM7DhPKA=
From: paulmck@kernel.org
To: rcu@vger.kernel.org
Subject: [PATCH tip/core/rcu 05/10] fs/afs: Replace rcu_swap_protected() with
 rcu_replace()
Date: Tue, 22 Oct 2019 12:12:10 -0700
Message-Id: <20191022191215.25781-5-paulmck@kernel.org>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20191022191136.GA25627@paulmck-ThinkPad-P72>
References: <20191022191136.GA25627@paulmck-ThinkPad-P72>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_121229_534718_7FBE609D 
X-CRM114-Status: GOOD (  10.40  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Thu, 31 Oct 2019 04:56:15 -0700
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
[ paulmck: From rcu_replace() to rcu_replace_pointer() per Ingo Molnar. ]
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Acked-by: David Howells <dhowells@redhat.com>
Cc: <linux-afs@lists.infradead.org>
Cc: <linux-kernel@vger.kernel.org>
---
 fs/afs/vl_list.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/afs/vl_list.c b/fs/afs/vl_list.c
index 21eb0c0..8fea54e 100644
--- a/fs/afs/vl_list.c
+++ b/fs/afs/vl_list.c
@@ -279,8 +279,8 @@ struct afs_vlserver_list *afs_extract_vlserver_list(struct afs_cell *cell,
 			struct afs_addr_list *old = addrs;
 
 			write_lock(&server->lock);
-			rcu_swap_protected(server->addresses, old,
-					   lockdep_is_held(&server->lock));
+			old = rcu_replace_pointer(server->addresses, old,
+						  lockdep_is_held(&server->lock));
 			write_unlock(&server->lock);
 			afs_put_addrlist(old);
 		}
-- 
2.9.5


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
