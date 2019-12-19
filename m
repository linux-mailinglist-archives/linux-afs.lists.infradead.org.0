Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 27906125D3C
	for <lists+linux-afs@lfdr.de>; Thu, 19 Dec 2019 10:05:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R3KKlOGwcSXomhyMQ/LJC/z4bwDjdDJgNGmFP3i/ZeQ=; b=MB9Qosx05Yeh0v
	0FUwt8uzhbaY0lY3vWhntCHEgPYaPqPPgJ/iF6Mp6CSNiv2lL7S5CXxAt5VSRX77tix6bqYGpH+/f
	rFMGxwl+BGtXzi2AmPNd1E1XnErmJyr9tFP7SCPO1boi8j7NE3XESRJDVFIywpMY0H0hGWTsMvhCe
	Hp9DOqMn7dVP3S+XgfuGGn1iBLtsAt8eYX+Wv+ef1fYINXSZeI5GEdbIT02YRwnV1UjAr5DyG/p46
	d3DTO2bZqocjPEENd0fYvI5N2FdPcu+Q6UtBJMhHtcxd2pA+YrouOTrjhzUNUbpoSM4pznI4vzVEq
	afyaLWMRXltFqlw0MxRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihrka-0001C5-BO; Thu, 19 Dec 2019 09:05:40 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihrkX-0001Bm-UA; Thu, 19 Dec 2019 09:05:38 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CDE8A304C1B;
 Thu, 19 Dec 2019 10:04:11 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 48D762B0D9745; Thu, 19 Dec 2019 10:05:35 +0100 (CET)
Date: Thu, 19 Dec 2019 10:05:35 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH] rxrpc: struct mutex cannot be used for
 rxrpc_call::user_mutex
Message-ID: <20191219090535.GV2844@hirez.programming.kicks-ass.net>
References: <157659672074.19580.11641288666811539040.stgit@warthog.procyon.org.uk>
 <20191218135047.GS2844@hirez.programming.kicks-ass.net>
 <20191218190833.ufpxjrvin5jvp3m5@linux-p48b>
 <20191218202801.wokf6hcvbafmjnkd@linux-p48b>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218202801.wokf6hcvbafmjnkd@linux-p48b>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, linux-fsdevel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, Dec 18, 2019 at 12:28:01PM -0800, Davidlohr Bueso wrote:
> Hmm so fyi __crash_kexec() is another one, but can be called in hard-irq, and
> it's extremely obvious that the trylock+unlock occurs in the same context.

Hurmph, that unlock 'never' happens if I read it right :-) Still,
something like the below ought to cure it I suppose.

> It would be nice to automate this...

Automate what exactly? We'll stick your WARN back in on the next round.


---
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index 15d70a90b50d..2faf2ec33032 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -47,6 +47,26 @@
 
 DEFINE_MUTEX(kexec_mutex);
 
+static void kexec_lock(void)
+{
+	/*
+	 * LOCK kexec_mutex		cmpxchg(&panic_cpu, INVALID, cpu)
+	 *   MB				  MB
+	 * panic_cpu == INVALID		kexec_mutex == LOCKED
+	 *
+	 * Ensures either we observe the cmpxchg, or crash_kernel() observes
+	 * our lock acquisition.
+	 */
+	mutex_lock(&kexec_mutex);
+	smp_mb();
+	atomic_cond_load_acquire(&panic_cpu, VAL == PANIC_CPU_INVALID);
+}
+
+static void kexec_unlock(void)
+{
+	mutex_unlock(&kexec_mutex);
+}
+
 /* Per cpu memory for storing cpu states in case of system crash. */
 note_buf_t __percpu *crash_notes;
 
@@ -937,24 +957,13 @@ int kexec_load_disabled;
  */
 void __noclone __crash_kexec(struct pt_regs *regs)
 {
-	/* Take the kexec_mutex here to prevent sys_kexec_load
-	 * running on one cpu from replacing the crash kernel
-	 * we are using after a panic on a different cpu.
-	 *
-	 * If the crash kernel was not located in a fixed area
-	 * of memory the xchg(&kexec_crash_image) would be
-	 * sufficient.  But since I reuse the memory...
-	 */
-	if (mutex_trylock(&kexec_mutex)) {
-		if (kexec_crash_image) {
-			struct pt_regs fixed_regs;
-
-			crash_setup_regs(&fixed_regs, regs);
-			crash_save_vmcoreinfo();
-			machine_crash_shutdown(&fixed_regs);
-			machine_kexec(kexec_crash_image);
-		}
-		mutex_unlock(&kexec_mutex);
+	if (kexec_crash_image) {
+		struct pt_regs fixed_regs;
+
+		crash_setup_regs(&fixed_regs, regs);
+		crash_save_vmcoreinfo();
+		machine_crash_shutdown(&fixed_regs);
+		machine_kexec(kexec_crash_image);
 	}
 }
 STACK_FRAME_NON_STANDARD(__crash_kexec);
@@ -973,7 +982,11 @@ void crash_kexec(struct pt_regs *regs)
 	if (old_cpu == PANIC_CPU_INVALID) {
 		/* This is the 1st CPU which comes here, so go ahead. */
 		printk_safe_flush_on_panic();
-		__crash_kexec(regs);
+		/*
+		 * Orders against kexec_lock(), see the comment there.
+		 */
+		if (!mutex_is_locked(&kexec_mutex))
+			__crash_kexec(regs);
 
 		/*
 		 * Reset panic_cpu to allow another panic()/crash_kexec()
@@ -987,10 +1000,10 @@ size_t crash_get_memory_size(void)
 {
 	size_t size = 0;
 
-	mutex_lock(&kexec_mutex);
+	kexec_lock();
 	if (crashk_res.end != crashk_res.start)
 		size = resource_size(&crashk_res);
-	mutex_unlock(&kexec_mutex);
+	kexec_unlock();
 	return size;
 }
 
@@ -1010,7 +1023,7 @@ int crash_shrink_memory(unsigned long new_size)
 	unsigned long old_size;
 	struct resource *ram_res;
 
-	mutex_lock(&kexec_mutex);
+	kexec_lock();
 
 	if (kexec_crash_image) {
 		ret = -ENOENT;
@@ -1048,7 +1061,7 @@ int crash_shrink_memory(unsigned long new_size)
 	insert_resource(&iomem_resource, ram_res);
 
 unlock:
-	mutex_unlock(&kexec_mutex);
+	kexec_unlock();
 	return ret;
 }
 

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
