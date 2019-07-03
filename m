Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A285DB78
	for <lists+linux-afs@lfdr.de>; Wed,  3 Jul 2019 04:15:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1pQv9PGyR4xDESqY/BPw2xyuW75B4KxqmK3dFKrxOV4=; b=uTrKRkWy8dSqgX
	JflNuu3CLfixiJ5XYClH4Z1AG+yWfT5mSOp+2WnigavurxlJfBh+KA4Kkpfh7XeYhCX8T726Vu9E8
	GwjMUY+HdvFYn1t5ppzny0S92DpQsS0W5fJnp9VSjiRKrdQ29GGRz8rMllc8k7IRGMD22K53pWaZn
	MyO/REsaP8gelY/sT36xsmig3DuDWa7SmLFyW5WAnfkvUgVSfTUPj+mt3+dkBeFAdpWtfim3xNuys
	sY/gPivPXQ8KN1nvrUX1fiNxeBta+iFND/xyvzk2BADfBtFX9ulOBFFVvrHfKq49yHyK6WnRTm7SJ
	KR/54jMmj44RHPw2438Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiUo7-0003WA-FX; Wed, 03 Jul 2019 02:15:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiUo4-0003VM-AC
 for linux-afs@lists.infradead.org; Wed, 03 Jul 2019 02:15:37 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6DD6221873;
 Wed,  3 Jul 2019 02:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562120136;
 bh=m+R1xwEJppbiE3wvoUXAJkKObqcuGeLx/Si7OCzOa2I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MevqsPRWXIuyLFX9gqZs7UluRFtdj2SfLVw7MIOXiXyjuFdfqSiMM87kGE62ouYf8
 MoiJFW6QlHQ/KHss40SMVLtkqC1+ILMk1U1LpzpT/OxddP36CWmWQRRJqu9tajDmR7
 tn/mOOfakHzgh2YF2u3PgeEDkivSbApGKrEcFE2U=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 13/39] afs: Fix uninitialised spinlock
 afs_volume::cb_break_lock
Date: Tue,  2 Jul 2019 22:14:48 -0400
Message-Id: <20190703021514.17727-13-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703021514.17727-1-sashal@kernel.org>
References: <20190703021514.17727-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_191536_388429_251D5D00 
X-CRM114-Status: GOOD (  12.74  )
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
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit 90fa9b64523a645a97edc0bdcf2d74759957eeee ]

Fix the cb_break_lock spinlock in afs_volume struct by initialising it when
the volume record is allocated.

Also rename the lock to cb_v_break_lock to distinguish it from the lock of
the same name in the afs_server struct.

Without this, the following trace may be observed when a volume-break
callback is received:

  INFO: trying to register non-static key.
  the code is fine but needs lockdep annotation.
  turning off the locking correctness validator.
  CPU: 2 PID: 50 Comm: kworker/2:1 Not tainted 5.2.0-rc1-fscache+ #3045
  Hardware name: ASUS All Series/H97-PLUS, BIOS 2306 10/09/2014
  Workqueue: afs SRXAFSCB_CallBack
  Call Trace:
   dump_stack+0x67/0x8e
   register_lock_class+0x23b/0x421
   ? check_usage_forwards+0x13c/0x13c
   __lock_acquire+0x89/0xf73
   lock_acquire+0x13b/0x166
   ? afs_break_callbacks+0x1b2/0x3dd
   _raw_write_lock+0x2c/0x36
   ? afs_break_callbacks+0x1b2/0x3dd
   afs_break_callbacks+0x1b2/0x3dd
   ? trace_event_raw_event_afs_server+0x61/0xac
   SRXAFSCB_CallBack+0x11f/0x16c
   process_one_work+0x2c5/0x4ee
   ? worker_thread+0x234/0x2ac
   worker_thread+0x1d8/0x2ac
   ? cancel_delayed_work_sync+0xf/0xf
   kthread+0x11f/0x127
   ? kthread_park+0x76/0x76
   ret_from_fork+0x24/0x30

Fixes: 68251f0a6818 ("afs: Fix whole-volume callback handling")
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/afs/callback.c | 4 ++--
 fs/afs/internal.h | 2 +-
 fs/afs/volume.c   | 1 +
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/afs/callback.c b/fs/afs/callback.c
index 128f2dbe256a..fee6fde79e6b 100644
--- a/fs/afs/callback.c
+++ b/fs/afs/callback.c
@@ -278,9 +278,9 @@ static void afs_break_one_callback(struct afs_server *server,
 			struct afs_super_info *as = AFS_FS_S(cbi->sb);
 			struct afs_volume *volume = as->volume;
 
-			write_lock(&volume->cb_break_lock);
+			write_lock(&volume->cb_v_break_lock);
 			volume->cb_v_break++;
-			write_unlock(&volume->cb_break_lock);
+			write_unlock(&volume->cb_v_break_lock);
 		} else {
 			data.volume = NULL;
 			data.fid = *fid;
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 3904ab0b9563..fd0750fb96a5 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -582,7 +582,7 @@ struct afs_volume {
 	unsigned int		servers_seq;	/* Incremented each time ->servers changes */
 
 	unsigned		cb_v_break;	/* Break-everything counter. */
-	rwlock_t		cb_break_lock;
+	rwlock_t		cb_v_break_lock;
 
 	afs_voltype_t		type;		/* type of volume */
 	short			error;
diff --git a/fs/afs/volume.c b/fs/afs/volume.c
index f6eba2def0a1..3e8dbee09f87 100644
--- a/fs/afs/volume.c
+++ b/fs/afs/volume.c
@@ -47,6 +47,7 @@ static struct afs_volume *afs_alloc_volume(struct afs_fs_context *params,
 	atomic_set(&volume->usage, 1);
 	INIT_LIST_HEAD(&volume->proc_link);
 	rwlock_init(&volume->servers_lock);
+	rwlock_init(&volume->cb_v_break_lock);
 	memcpy(volume->name, vldb->name, vldb->name_len + 1);
 
 	slist = afs_alloc_server_list(params->cell, params->key, vldb, type_mask);
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
