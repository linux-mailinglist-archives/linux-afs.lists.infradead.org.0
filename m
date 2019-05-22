Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 360E727291
	for <lists+linux-afs@lfdr.de>; Thu, 23 May 2019 00:46:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RwVxjeJtmvVznLg3o0gxkbm4GxMSBdX2/wP7Ctgx4u8=; b=XJ0u/gjgEs8Fzz
	Lg70SGnicP5155ptTWTTyKWAvFoj1Zzy3ZCgZmVOZNTiIVXJVEyzxh8nc6n7oQ+9vdYSfBQte1uGu
	K9n9CXaeM7MuspNMME5xtrN5TJZXxw4wtwR7gpdG/itgIibNuMqrkF8ktyfZaVlubRDMEA+xWmQW9
	cOGEyuOwe8LwSoq6sGonl+N/vo5Zx2tB5jdB+jv0B/LO+EtEMsOxgCGGiGzp4KseJB1jTfYwcYhRD
	7PeSUP0M5yVSVTxwY/2b2d+jj8gCQUzE+Aw1Ae/PI0OT639Sgi1pbN/dmdR9YAS4IszaWDK9oHf1z
	EDI+AUyrX+j9FAgIUMkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTa0J-0002Ep-SG; Wed, 22 May 2019 22:46:35 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTa0H-0002ED-6y
 for linux-afs@lists.infradead.org; Wed, 22 May 2019 22:46:34 +0000
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EE313C130719;
 Wed, 22 May 2019 22:46:32 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-142.rdu2.redhat.com
 [10.10.121.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D65CE604CD;
 Wed, 22 May 2019 22:46:31 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 4/6] keys: Cache result of request_key*() temporarily in
 task_struct
From: David Howells <dhowells@redhat.com>
To: keyrings@vger.kernel.org
Date: Wed, 22 May 2019 23:46:31 +0100
Message-ID: <155856519116.11737.1068301045476906776.stgit@warthog.procyon.org.uk>
In-Reply-To: <155856516286.11737.11196637682919902718.stgit@warthog.procyon.org.uk>
References: <155856516286.11737.11196637682919902718.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Wed, 22 May 2019 22:46:33 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_154633_288964_97A4A5A6 
X-CRM114-Status: GOOD (  21.58  )
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
Cc: dhowells@redhat.com, linux-security-module@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
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

 include/linux/sched.h       |    5 +++++
 include/linux/tracehook.h   |    5 +++++
 kernel/cred.c               |    9 +++++++++
 security/keys/request_key.c |   33 +++++++++++++++++++++++++++++++++
 4 files changed, 52 insertions(+)

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
index df20f8bdbfa3..ef497a94086c 100644
--- a/include/linux/tracehook.h
+++ b/include/linux/tracehook.h
@@ -187,6 +187,11 @@ static inline void tracehook_notify_resume(struct pt_regs *regs)
 	if (unlikely(current->task_works))
 		task_work_run();
 
+	if (unlikely(current->cached_requested_key)) {
+		key_put(current->cached_requested_key);
+		current->cached_requested_key = NULL;
+	}
+
 	mem_cgroup_handle_over_high();
 	blkcg_maybe_throttle_current();
 }
diff --git a/kernel/cred.c b/kernel/cred.c
index 3bd40de9e192..20e0cd54aad2 100644
--- a/kernel/cred.c
+++ b/kernel/cred.c
@@ -174,6 +174,11 @@ void exit_creds(struct task_struct *tsk)
 	validate_creds(cred);
 	alter_cred_subscribers(cred, -1);
 	put_cred(cred);
+
+#ifdef CONFIG_KEYS
+	key_put(current->cached_requested_key);
+	current->cached_requested_key = NULL;
+#endif
 }
 
 /**
@@ -327,6 +332,10 @@ int copy_creds(struct task_struct *p, unsigned long clone_flags)
 	struct cred *new;
 	int ret;
 
+#ifdef CONFIG_KEYS
+	p->cached_requested_key = NULL;
+#endif
+
 	if (
 #ifdef CONFIG_KEYS
 		!p->cred->thread_keyring &&
diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index 59a4e533e76a..855de14974c3 100644
--- a/security/keys/request_key.c
+++ b/security/keys/request_key.c
@@ -22,6 +22,27 @@
 
 #define key_negative_timeout	60	/* default timeout on a negative key's existence */
 
+static struct key *check_cached_key(struct keyring_search_context *ctx)
+{
+	struct key *key = current->cached_requested_key;
+
+	if (key &&
+	    ctx->match_data.cmp(key, &ctx->match_data) &&
+	    !(key->flags & ((1 << KEY_FLAG_INVALIDATED) |
+			    (1 << KEY_FLAG_REVOKED))))
+		return key_get(key);
+	return NULL;
+}
+
+static void cache_requested_key(struct key *key)
+{
+	struct task_struct *t = current;
+
+	key_put(t->cached_requested_key);
+	t->cached_requested_key = key_get(key);
+	set_tsk_thread_flag(t, TIF_NOTIFY_RESUME);
+}
+
 /**
  * complete_request_key - Complete the construction of a key.
  * @authkey: The authorisation key.
@@ -557,6 +578,10 @@ struct key *request_key_and_link(struct key_type *type,
 		}
 	}
 
+	key = check_cached_key(&ctx);
+	if (key)
+		return key;
+
 	/* search all the process keyrings for a key */
 	rcu_read_lock();
 	key_ref = search_process_keyrings_rcu(&ctx);
@@ -582,6 +607,9 @@ struct key *request_key_and_link(struct key_type *type,
 				goto error_free;
 			}
 		}
+
+		/* Only cache the key on immediate success */
+		cache_requested_key(key);
 	} else if (PTR_ERR(key_ref) != -EAGAIN) {
 		key = ERR_CAST(key_ref);
 	} else  {
@@ -781,6 +809,10 @@ struct key *request_key_rcu(struct key_type *type, const char *description)
 
 	kenter("%s,%s", type->name, description);
 
+	key = check_cached_key(&ctx);
+	if (key)
+		return key;
+
 	/* search all the process keyrings for a key */
 	key_ref = search_process_keyrings_rcu(&ctx);
 	if (IS_ERR(key_ref)) {
@@ -789,6 +821,7 @@ struct key *request_key_rcu(struct key_type *type, const char *description)
 			key = ERR_PTR(-ENOKEY);
 	} else {
 		key = key_ref_to_ptr(key_ref);
+		cache_requested_key(key);
 	}
 
 	kleave(" = %p", key);


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
