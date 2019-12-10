Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E4731119F6B
	for <lists+linux-afs@lfdr.de>; Wed, 11 Dec 2019 00:31:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pClwnJTcuJla2obWcvnA+A3FbDJYAG2hBc4+P1VAd8U=; b=ntlz4RI4oEmXkEyZbdOMPn77qn
	W/ELDuaNYbd2wFe65oeslEYl1YYh9rkvjNw/m18Jy0JbdllgUbS85VquvDS9nm2eBCqYKOZw/XHR1
	1kbaf+dxaDNgfjEdNruLiqVGF5eyLw1C0fKJtRzyVTPoHLOxcD4yDativjnaPfVMWia/xNpIa5S+/
	+4gL7UsyR3t2oqrx9TVoY21McSthCbCQkX5q+uBv0DrQXePDJH/IEUKqg63MYHT6/yVgrjW9I0JUC
	j07XaPHmUgcFc9Nzvv8jHnxvNEDi2q0K92r6utWBBwFzsTOAXYFQRbdXTW2G6s1cBBdZZChvpUaOu
	xYPfWGSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieoyU-0001Ow-96; Tue, 10 Dec 2019 23:31:26 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ienkQ-0005lq-Ld
 for linux-afs@lists.infradead.org; Tue, 10 Dec 2019 22:12:52 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 903DCAD2B;
 Tue, 10 Dec 2019 22:12:45 +0000 (UTC)
From: Davidlohr Bueso <dave@stgolabs.net>
To: peterz@infradead.org
Subject: [PATCH] Revert "locking/mutex: Complain upon mutex API misuse in IRQ
 contexts"
Date: Tue, 10 Dec 2019 14:05:23 -0800
Message-Id: <20191210220523.28540-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210193011.GA11802@worktop.programming.kicks-ass.net>
References: <20191210193011.GA11802@worktop.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_141250_851802_F8D28FA5 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.3 (-)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-1.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.15 listed in list.dnswl.org]
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Mailman-Approved-At: Tue, 10 Dec 2019 15:31:25 -0800
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
Cc: Davidlohr Bueso <dave@stgolabs.net>, Davidlohr Bueso <dbueso@suse.de>,
 linux-kernel@vger.kernel.org, dhowells@redhat.com, mingo@redhat.com,
 linux-fsdevel@vger.kernel.org, tglx@linutronix.de, will@kernel.org,
 linux-afs@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

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

This reverts commit 5d4ebaa87329ef226e74e52c80ac1c62e4948987.

Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
---
 kernel/locking/mutex.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index 54cc5f9286e9..5352ce50a97e 100644
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
-- 
2.16.4


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
