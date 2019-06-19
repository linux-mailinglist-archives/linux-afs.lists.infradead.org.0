Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 423FA4BD03
	for <lists+linux-afs@lfdr.de>; Wed, 19 Jun 2019 17:36:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROFNrIZKrPI+e9sMOZF9dSxvexq1kbp8HoPpS7FVSL8=; b=QdOiXqImzyQnFu
	zJbXhaHqXus1larHbUq/tWjIStfq4ai7/2CX+VbnYqqv8DTX7z2xCJ+3ijW0M7MQtSSXYnTxQnhP4
	oLeLQ2qyNpggnWjFUf0Ceh9pZ+QGnPTrSb4ySZQFJoZrAEwIvH1UlTXmINB5/IO+Hj8DLA/vSm3Kn
	SXwZE3hRc6y/3W/Rh2p87Om7nw0SLFUL15JXQD8i7AdPsezziuiA3JfN9LErhlI7OR1bKaKbosg5Q
	qlVLYzs+Ss0F2ee2rZdRaY7vNwc2EGZPmBKqoVUpYvbNruj1CNTOez/MHDgf9uuOEdfg/I8Ggm5Fo
	JR4MLrs+yY+GI4EViTFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdcda-0000cT-5V; Wed, 19 Jun 2019 15:36:38 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdcdX-0000c2-RT
 for linux-afs@lists.infradead.org; Wed, 19 Jun 2019 15:36:37 +0000
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9445DF9E65;
 Wed, 19 Jun 2019 15:36:35 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com
 [10.10.120.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DFCC5C205;
 Wed, 19 Jun 2019 15:36:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 5/6] keys: Cache result of request_key*() temporarily in
 task_struct [ver #2]
From: David Howells <dhowells@redhat.com>
To: keyrings@vger.kernel.org
Date: Wed, 19 Jun 2019 16:36:33 +0100
Message-ID: <156095859338.25264.8042921626224707738.stgit@warthog.procyon.org.uk>
In-Reply-To: <156095855610.25264.16666970456822465537.stgit@warthog.procyon.org.uk>
References: <156095855610.25264.16666970456822465537.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Wed, 19 Jun 2019 15:36:35 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_083635_924299_5C6F9DC5 
X-CRM114-Status: GOOD (  26.95  )
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
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

If a filesystem uses keys to hold authentication tokens, then it needs a
token for each VFS operation that might perform an authentication check -
either by passing it to the server, or using to perform a check based on
authentication data cached locally.

For open files this isn't a problem, since the key should be cached in the
file struct since it represents the subject performing operations on that
file descriptor.

During pathwalk, however, there isn't anywhere to cache the key, except
perhaps in the nameidata struct - but that isn't exposed to the
filesystems.  Further, a pathwalk can incur a lot of operations, calling
one or more of the following, for instance:

	->lookup()
	->permission()
	->d_revalidate()
	->d_automount()
	->get_acl()
	->getxattr()

on each dentry/inode it encounters - and each one may need to call
request_key().  And then, at the end of pathwalk, it will call the actual
operation:

	->mkdir()
	->mknod()
	->getattr()
	->open()
	...

which may need to go and get the token again.

However, it is very likely that all of the operations on a single
dentry/inode - and quite possibly a sequence of them - will all want to use
the same authentication token, which suggests that caching it would be a
good idea.

To this end:

 (1) Make it so that a positive result of request_key() and co. that didn't
     require upcalling to userspace is cached temporarily in task_struct.

 (2) The cache is 1 deep, so a new result displaces the old one.

 (3) The key is released by exit and by notify-resume.

 (4) The cache is cleared in a newly forked process.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 Documentation/security/keys/request-key.rst |    7 ++++-
 include/linux/sched.h                       |    5 ++++
 include/linux/tracehook.h                   |    7 +++++
 kernel/cred.c                               |    9 +++++++
 security/keys/Kconfig                       |   17 ++++++++++++
 security/keys/request_key.c                 |   37 +++++++++++++++++++++++++++
 6 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/Documentation/security/keys/request-key.rst b/Documentation/security/keys/request-key.rst
index 7caedc4d29f1..45049abdf290 100644
--- a/Documentation/security/keys/request-key.rst
+++ b/Documentation/security/keys/request-key.rst
@@ -176,6 +176,9 @@ The process stops immediately a valid key is found with permission granted to
 use it.  Any error from a previous match attempt is discarded and the key is
 returned.
 
+When request_key() is invoked, if CONFIG_KEYS_REQUEST_CACHE=y, a per-task
+one-key cache is first checked for a match.
+
 When search_process_keyrings() is invoked, it performs the following searches
 until one succeeds:
 
@@ -195,7 +198,9 @@ until one succeeds:
       c) The calling process's session keyring is searched.
 
 The moment one succeeds, all pending errors are discarded and the found key is
-returned.
+returned.  If CONFIG_KEYS_REQUEST_CACHE=y, then that key is placed in the
+per-task cache, displacing the previous key.  The cache is cleared on exit or
+just prior to resumption of userspace.
 
 Only if all these fail does the whole thing fail with the highest priority
 error.  Note that several errors may have come from LSM.
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 11837410690f..e5f18857dd53 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -831,6 +831,11 @@ struct task_struct {
 	/* Effective (overridable) subjective task credentials (COW): */
 	const struct cred __rcu		*cred;
 
+#ifdef CONFIG_KEYS
+	/* Cached requested key. */
+	struct key			*cached_requested_key;
+#endif
+
 	/*
 	 * executable name, excluding path.
 	 *
diff --git a/include/linux/tracehook.h b/include/linux/tracehook.h
index df20f8bdbfa3..81824467e6a6 100644
--- a/include/linux/tracehook.h
+++ b/include/linux/tracehook.h
@@ -187,6 +187,13 @@ static inline void tracehook_notify_resume(struct pt_regs *regs)
 	if (unlikely(current->task_works))
 		task_work_run();
 
+#ifdef CONFIG_KEYS_REQUEST_CACHE
+	if (unlikely(current->cached_requested_key)) {
+		key_put(current->cached_requested_key);
+		current->cached_requested_key = NULL;
+	}
+#endif
+
 	mem_cgroup_handle_over_high();
 	blkcg_maybe_throttle_current();
 }
diff --git a/kernel/cred.c b/kernel/cred.c
index 3bd40de9e192..26da7e77098f 100644
--- a/kernel/cred.c
+++ b/kernel/cred.c
@@ -174,6 +174,11 @@ void exit_creds(struct task_struct *tsk)
 	validate_creds(cred);
 	alter_cred_subscribers(cred, -1);
 	put_cred(cred);
+
+#ifdef CONFIG_KEYS_REQUEST_CACHE
+	key_put(current->cached_requested_key);
+	current->cached_requested_key = NULL;
+#endif
 }
 
 /**
@@ -327,6 +332,10 @@ int copy_creds(struct task_struct *p, unsigned long clone_flags)
 	struct cred *new;
 	int ret;
 
+#ifdef CONFIG_KEYS_REQUEST_CACHE
+	p->cached_requested_key = NULL;
+#endif
+
 	if (
 #ifdef CONFIG_KEYS
 		!p->cred->thread_keyring &&
diff --git a/security/keys/Kconfig b/security/keys/Kconfig
index 6462e6654ccf..a2c2259aef5f 100644
--- a/security/keys/Kconfig
+++ b/security/keys/Kconfig
@@ -24,6 +24,23 @@ config KEYS_COMPAT
 	def_bool y
 	depends on COMPAT && KEYS
 
+config KEYS_REQUEST_CACHE
+	bool "Enable temporary caching of the last request_key() result"
+	help
+	  This option causes the result of the last successful request_key()
+	  call that didn't upcall to the kernel to be cached temporarily in the
+	  task_struct.  The cache is cleared by exit and just prior to the
+	  resumption of userspace.
+
+	  This allows the key used for multiple step processes where each step
+	  wants to request a key that is likely the same as the one requested
+	  by the last step to save on the searching.
+
+	  An example of such a process is a pathwalk through a network
+	  filesystem in which each method needs to request an authentication
+	  key.  Pathwalk will call multiple methods for each dentry traversed
+	  (permission, d_revalidate, lookup, getxattr, getacl, ...).
+
 config PERSISTENT_KEYRINGS
 	bool "Enable register of persistent per-UID keyrings"
 	depends on KEYS
diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index b4b3677657d6..f289982cb5db 100644
--- a/security/keys/request_key.c
+++ b/security/keys/request_key.c
@@ -22,6 +22,31 @@
 
 #define key_negative_timeout	60	/* default timeout on a negative key's existence */
 
+static struct key *check_cached_key(struct keyring_search_context *ctx)
+{
+#ifdef CONFIG_KEYS_REQUEST_CACHE
+	struct key *key = current->cached_requested_key;
+
+	if (key &&
+	    ctx->match_data.cmp(key, &ctx->match_data) &&
+	    !(key->flags & ((1 << KEY_FLAG_INVALIDATED) |
+			    (1 << KEY_FLAG_REVOKED))))
+		return key_get(key);
+#endif
+	return NULL;
+}
+
+static void cache_requested_key(struct key *key)
+{
+#ifdef CONFIG_KEYS_REQUEST_CACHE
+	struct task_struct *t = current;
+
+	key_put(t->cached_requested_key);
+	t->cached_requested_key = key_get(key);
+	set_tsk_thread_flag(t, TIF_NOTIFY_RESUME);
+#endif
+}
+
 /**
  * complete_request_key - Complete the construction of a key.
  * @authkey: The authorisation key.
@@ -562,6 +587,10 @@ struct key *request_key_and_link(struct key_type *type,
 		}
 	}
 
+	key = check_cached_key(&ctx);
+	if (key)
+		return key;
+
 	/* search all the process keyrings for a key */
 	rcu_read_lock();
 	key_ref = search_process_keyrings_rcu(&ctx);
@@ -587,6 +616,9 @@ struct key *request_key_and_link(struct key_type *type,
 				goto error_free;
 			}
 		}
+
+		/* Only cache the key on immediate success */
+		cache_requested_key(key);
 	} else if (PTR_ERR(key_ref) != -EAGAIN) {
 		key = ERR_CAST(key_ref);
 	} else  {
@@ -786,6 +818,10 @@ struct key *request_key_rcu(struct key_type *type, const char *description)
 
 	kenter("%s,%s", type->name, description);
 
+	key = check_cached_key(&ctx);
+	if (key)
+		return key;
+
 	/* search all the process keyrings for a key */
 	key_ref = search_process_keyrings_rcu(&ctx);
 	if (IS_ERR(key_ref)) {
@@ -794,6 +830,7 @@ struct key *request_key_rcu(struct key_type *type, const char *description)
 			key = ERR_PTR(-ENOKEY);
 	} else {
 		key = key_ref_to_ptr(key_ref);
+		cache_requested_key(key);
 	}
 
 	kleave(" = %p", key);


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
