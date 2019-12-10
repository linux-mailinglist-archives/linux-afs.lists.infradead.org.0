Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D20511A84D
	for <lists+linux-afs@lfdr.de>; Wed, 11 Dec 2019 10:55:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	References:In-Reply-To:Subject:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YoJvqJu1TQxLdz2VaasHHUeXG3TNIU3acDrgtTfA6dc=; b=h2Mhyb8NdLv21e
	snIuOFNCR85hzeYLFoMf3a5+sR/DkI5Ef3xqDl7mp2pVeT6fsmSf1tgW1gq9/G5tRTYH+N1YMJuk4
	n7waVV4LYXjeuPNftmZvaL0lLEl9vrn/4Q61O/U63sgNGeAF4Kg/C7KD8UP7xmn8P5LMgQnfdntu1
	py/EHNqGwLjK/s7JIUIkth0CsdPSyQwrN7m/EAOZdDboIChZVLL1UMsZmv3ztcM2nO/MF+2R+8dCq
	UXqbYMjeKTS6yzobLwB5F9C7MnUxIoxfW1vqi2onUjAMdjHm8vYVBlTwIilm4IdkO11y5ZytZ5+Q3
	PvNNM5HEQNOs934jAx6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieyii-0001rD-Cx; Wed, 11 Dec 2019 09:55:48 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iep2j-0003Pe-9k
 for linux-afs@lists.infradead.org; Tue, 10 Dec 2019 23:35:51 +0000
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tip-bot2@linutronix.de>)
 id 1iep2S-0007Qa-6r; Wed, 11 Dec 2019 00:35:34 +0100
Received: from [127.0.1.1] (localhost [IPv6:::1])
 by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 6BA721C047B;
 Wed, 11 Dec 2019 00:35:31 +0100 (CET)
Date: Tue, 10 Dec 2019 23:35:30 -0000
From: "tip-bot2 for Davidlohr Bueso" <tip-bot2@linutronix.de>
To: linux-tip-commits@vger.kernel.org
Subject: [tip: locking/urgent] Revert "locking/mutex: Complain upon mutex API
 misuse in IRQ contexts"
In-Reply-To: <20191210220523.28540-1-dave@stgolabs.net>
References: <20191210220523.28540-1-dave@stgolabs.net>
MIME-Version: 1.0
Message-ID: <157602093075.30329.6269791000248748517.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from
 these emails
Precedence: bulk
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_153549_512847_5942DF02 
X-CRM114-Status: GOOD (  11.16  )
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [2a0a:51c0:0:12e:550:0:0:1 listed in]
 [list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Mailman-Approved-At: Wed, 11 Dec 2019 01:55:46 -0800
X-BeenThere: linux-afs@lists.infradead.org
X-Mailman-Version: 2.1.29
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Reply-To: linux-kernel@vger.kernel.org
Cc: Davidlohr Bueso <dbueso@suse.de>, Peter Zijlstra <peterz@infradead.org>,
 will@kernel.org, x86 <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@kernel.org>, David Howells <dhowells@redhat.com>,
 linux-fsdevel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

The following commit has been merged into the locking/urgent branch of tip:

Commit-ID:     c571b72e2b845ca0519670cb7c4b5fe5f56498a5
Gitweb:        https://git.kernel.org/tip/c571b72e2b845ca0519670cb7c4b5fe5f56498a5
Author:        Davidlohr Bueso <dave@stgolabs.net>
AuthorDate:    Tue, 10 Dec 2019 14:05:23 -08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Wed, 11 Dec 2019 00:27:43 +01:00

Revert "locking/mutex: Complain upon mutex API misuse in IRQ contexts"

This ended up causing some noise in places such as rxrpc running in softirq.

The warning is misleading in this case as the mutex trylock and unlock
operations are done within the same context; and therefore we need not
worry about the PI-boosting issues that comes along with no single-owner
lock guarantees.

While we don't want to support this in mutexes, there is no way out of
this yet; so lets get rid of the WARNs for now, as it is only fair to
code that has historically relied on non-preemptible softirq guarantees.
In addition, changing the lock type is also unviable: exclusive rwsems
have the same issue (just not the WARN_ON) and counting semaphores
would introduce a performance hit as mutexes are a lot more optimized.

This reverts:

    a0855d24fc22: ("locking/mutex: Complain upon mutex API misuse in IRQ contexts")

Fixes: a0855d24fc22: ("locking/mutex: Complain upon mutex API misuse in IRQ contexts")
Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
Tested-by: David Howells <dhowells@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-afs@lists.infradead.org
Cc: linux-fsdevel@vger.kernel.org
Cc: will@kernel.org
Link: https://lkml.kernel.org/r/20191210220523.28540-1-dave@stgolabs.net
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 kernel/locking/mutex.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index 54cc5f9..5352ce5 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -733,9 +733,6 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
  */
 void __sched mutex_unlock(struct mutex *lock)
 {
-#ifdef CONFIG_DEBUG_MUTEXES
-	WARN_ON(in_interrupt());
-#endif
 #ifndef CONFIG_DEBUG_LOCK_ALLOC
 	if (__mutex_unlock_fast(lock))
 		return;
@@ -1416,7 +1413,6 @@ int __sched mutex_trylock(struct mutex *lock)
 
 #ifdef CONFIG_DEBUG_MUTEXES
 	DEBUG_LOCKS_WARN_ON(lock->magic != lock);
-	WARN_ON(in_interrupt());
 #endif
 
 	locked = __mutex_trylock(lock);

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
