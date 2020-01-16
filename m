Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3A713E692
	for <lists+linux-afs@lfdr.de>; Thu, 16 Jan 2020 18:21:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sSxDLsbBaXo4AaTsqDFrVp2I3gwOTehFZMyHWPohOVo=; b=Hc1ANrFKTuIjo0
	YCOlUsFok216VEacSPxyP3HuBPuwwJ6NmEdlJqw6xyCiDHceCgvoYlp9fyQ667bsGtJDeq1rzBuTZ
	/pbQLqv3W0Hn0ujkMEmWd4cfUbsF25kyZcpDKz3tWyqa1X0QMd56GpO/XdkAwPUIrAYiLuEd0n5z8
	m7nR3Pvs8kHmaGNtGr+jd+Wz7LmuxiC1fZn3WltF4tY7A+C8HOnRq3ZH7vWI6OJiKjZAscFRTq+dy
	N/6PLnt3T32J2egb3g0ye0kLgLEbzln1P6+KT+tmdyy8pffsUMBoPu+G1W/iC3Yyn52dSFHirCeTX
	0oK82UjcbSbjo+w4tlPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is8pF-0005dM-QD; Thu, 16 Jan 2020 17:20:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is8b5-0007uQ-7f
 for linux-afs@lists.infradead.org; Thu, 16 Jan 2020 17:06:24 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E6A3B207FF;
 Thu, 16 Jan 2020 17:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194378;
 bh=WMOf0PsIvlz6mwQpKCU+pj3SqzU5fE5J+eOD7G7xNTg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I++GBjLpENUWHc6qPKjTh6BIZp0Z+aRc5EAOH1dTAW9k7f5GPr9JVNPPv3U2GIu2s
 DFgJFNq/ruhBEO0NpRpPUMXaQ0O89udu91H4PQNzmIQfvYzGiXnqJyUzZlx7d+uxKb
 idVhqLydwSDRh/sb4fRZEbvjFOmJNUOhZCajg5Ag=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 310/671] afs: Fix AFS file locking to allow fine
 grained locks
Date: Thu, 16 Jan 2020 11:59:08 -0500
Message-Id: <20200116170509.12787-47-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116170509.12787-1-sashal@kernel.org>
References: <20200116170509.12787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_090619_311099_B84FACA1 
X-CRM114-Status: GOOD (  14.35  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: David Howells <dhowells@redhat.com>, Sasha Levin <sashal@kernel.org>,
 linux-afs@lists.infradead.org, Jonathan Billings <jsbillings@jsbillings.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit 68ce801ffd82e72d5005ab5458e8b9e59f24d9cc ]

Fix AFS file locking to allow fine grained locks as some applications, such
as firefox, won't work if they can't take such locks on certain state files
- thereby preventing the use of kAFS to distribute a home directory.

Note that this cannot be made completely functional as the protocol only
has provision for whole-file locks, so there exists the possibility of a
process deadlocking itself by getting a partial read-lock on a file first
and then trying to get a non-overlapping write-lock - but we got the
server's read lock with the first lock, so we're now stuck.

OpenAFS solves this by just granting any partial-range lock directly
without consulting the server - and hoping there's no remote collision.  I
want to implement that in a separate patch and it requires a bit more
thought.

Fixes: 8d6c554126b8 ("AFS: implement file locking")
Reported-by: Jonathan Billings <jsbillings@jsbillings.org>
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/afs/flock.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/fs/afs/flock.c b/fs/afs/flock.c
index 1bb300ef362b..dffbb456629c 100644
--- a/fs/afs/flock.c
+++ b/fs/afs/flock.c
@@ -432,10 +432,6 @@ static int afs_do_setlk(struct file *file, struct file_lock *fl)
 
 	_enter("{%x:%u},%u", vnode->fid.vid, vnode->fid.vnode, fl->fl_type);
 
-	/* only whole-file locks are supported */
-	if (fl->fl_start != 0 || fl->fl_end != OFFSET_MAX)
-		return -EINVAL;
-
 	fl->fl_ops = &afs_lock_ops;
 	INIT_LIST_HEAD(&fl->fl_u.afs.link);
 	fl->fl_u.afs.state = AFS_LOCK_PENDING;
@@ -587,10 +583,6 @@ static int afs_do_unlk(struct file *file, struct file_lock *fl)
 	/* Flush all pending writes before doing anything with locks. */
 	vfs_fsync(file, 0);
 
-	/* only whole-file unlocks are supported */
-	if (fl->fl_start != 0 || fl->fl_end != OFFSET_MAX)
-		return -EINVAL;
-
 	ret = posix_lock_file(file, fl, NULL);
 	_leave(" = %d [%u]", ret, vnode->lock_state);
 	return ret;
@@ -618,12 +610,15 @@ static int afs_do_getlk(struct file *file, struct file_lock *fl)
 			goto error;
 
 		lock_count = READ_ONCE(vnode->status.lock_count);
-		if (lock_count > 0)
-			fl->fl_type = F_RDLCK;
-		else
-			fl->fl_type = F_WRLCK;
-		fl->fl_start = 0;
-		fl->fl_end = OFFSET_MAX;
+		if (lock_count != 0) {
+			if (lock_count > 0)
+				fl->fl_type = F_RDLCK;
+			else
+				fl->fl_type = F_WRLCK;
+			fl->fl_start = 0;
+			fl->fl_end = OFFSET_MAX;
+			fl->fl_pid = 0;
+		}
 	}
 
 	ret = 0;
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
