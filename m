Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C584189661
	for <lists+linux-afs@lfdr.de>; Wed, 18 Mar 2020 08:58:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=h0/vY4Z3T+7oR/QnrGZsp7KKguKVBqK0V083IY3E0CE=; b=iyPdwCheDyuJofYtdbhr8tPf6n
	oBK+D4Wv0mwhTUK5JiOlKjawWqCTZD29LeonI36yP/ANkzWPrTPLTz2kd6ts0MTcSnMaQ1bdHbYhE
	OkIrF0zYcu46BYb/kTowMkesswxIBdaMVQTDEhYkVxtPD7J3RcQEYtyzhRgF54FwW/Esk7Zy5cOaY
	grV95O6UXNdQSWfQK5ILYwzb5FD4KDxK7a3p0YBArPxnNvQKdt3uCbAGgkcHMvS5xXC4heavpfBaJ
	EEOm91RUuz6F+DXdkbSQ85P/1DIcaFpJcUfrodIS3hAx3yrm7STMuUvbchEsnB64e8SfI/z5qf9As
	lhCmHsYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jETaI-0002Mg-Jx; Wed, 18 Mar 2020 07:57:50 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEI7a-00006v-77
 for linux-afs@bombadil.infradead.org; Tue, 17 Mar 2020 19:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ejhP8Yzko9ZDR1cGx7ufN3FHzyPQQMWf6ywcBiN0StA=; b=1IXCViyEfwaEivFsukYsiwar2e
 iCmCnTXH8rZ1Zol5Kuwe0tV5zBoaC+viVMncdQXB+EvdltSZgyZfbe6/JkxrOlImpCZAujOZ1eMhM
 S87t/Vs+kwNyWuNbO19LYv2EbLriVapHyhbCG0RKbJsgcEdowx+amBWHL5PrQ52lwhpEHToq6XkAF
 86kFPyY0RPLus7lYeo6S75xWdf/uYo2Y7CNH6ESEi4K2kd3NAiUDyy6EixaMJXHrPJSGw+PE20nad
 46x5+bVgatwrEpecKyDa+YhKbdCWjW4UTj7R81vm/pawJMPP+HaEDDk96Ls2bPUIN2OdHiQVXiddv
 +ALLzKkA==;
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEI7X-00006E-Km
 for linux-afs@lists.infradead.org; Tue, 17 Mar 2020 19:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584474164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=ejhP8Yzko9ZDR1cGx7ufN3FHzyPQQMWf6ywcBiN0StA=;
 b=Z4C44haJJdpB+HJ1M2L0hPbEIWcUzK3zYJ4DsuOaB5Okpvbs5z5N28OuUoPs9aEZQv5zCF
 wlexr5pEWSy6buPrp/+vOlBh5nKB5Ob/fEc6xpjxvBJDSEzXwUtSMPhxPSlq5jVv5jOnjm
 klVBeraXQP3OmRAfQ+BMypnQJVmLm5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-7uhcbGigMAm7hYcvz3FU4Q-1; Tue, 17 Mar 2020 15:42:42 -0400
X-MC-Unique: 7uhcbGigMAm7hYcvz3FU4Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B6B918C35DE;
 Tue, 17 Mar 2020 19:42:40 +0000 (UTC)
Received: from llong.com (ovpn-115-15.rdu2.redhat.com [10.10.115.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5F1A10372C2;
 Tue, 17 Mar 2020 19:42:36 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Mimi Zohar <zohar@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v4 1/4] KEYS: Don't write out to userspace while holding key
 semaphore
Date: Tue, 17 Mar 2020 15:41:37 -0400
Message-Id: <20200317194140.6031-2-longman@redhat.com>
In-Reply-To: <20200317194140.6031-1-longman@redhat.com>
References: <20200317194140.6031-1-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Spam-Note: CRM114 invocation failed
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on merlin.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.205.24.74 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Wed, 18 Mar 2020 00:57:49 -0700
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
Cc: Sumit Garg <sumit.garg@linaro.org>,
 Chris von Recklinghausen <crecklin@redhat.com>,
 Eric Biggers <ebiggers@google.com>, netdev@vger.kernel.org,
 Jerry Snitselaar <jsnitsel@redhat.com>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 Roberto Sassu <roberto.sassu@huawei.com>, Waiman Long <longman@redhat.com>,
 linux-integrity@vger.kernel.org, linux-afs@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

A lockdep circular locking dependency report was seen when running a
keyutils test:

[12537.027242] ======================================================
[12537.059309] WARNING: possible circular locking dependency detected
[12537.088148] 4.18.0-147.7.1.el8_1.x86_64+debug #1 Tainted: G OE    --------- -  -
[12537.125253] ------------------------------------------------------
[12537.153189] keyctl/25598 is trying to acquire lock:
[12537.175087] 000000007c39f96c (&mm->mmap_sem){++++}, at: __might_fault+0xc4/0x1b0
[12537.208365]
[12537.208365] but task is already holding lock:
[12537.234507] 000000003de5b58d (&type->lock_class){++++}, at: keyctl_read_key+0x15a/0x220
[12537.270476]
[12537.270476] which lock already depends on the new lock.
[12537.270476]
[12537.307209]
[12537.307209] the existing dependency chain (in reverse order) is:
[12537.340754]
[12537.340754] -> #3 (&type->lock_class){++++}:
[12537.367434]        down_write+0x4d/0x110
[12537.385202]        __key_link_begin+0x87/0x280
[12537.405232]        request_key_and_link+0x483/0xf70
[12537.427221]        request_key+0x3c/0x80
[12537.444839]        dns_query+0x1db/0x5a5 [dns_resolver]
[12537.468445]        dns_resolve_server_name_to_ip+0x1e1/0x4d0 [cifs]
[12537.496731]        cifs_reconnect+0xe04/0x2500 [cifs]
[12537.519418]        cifs_readv_from_socket+0x461/0x690 [cifs]
[12537.546263]        cifs_read_from_socket+0xa0/0xe0 [cifs]
[12537.573551]        cifs_demultiplex_thread+0x311/0x2db0 [cifs]
[12537.601045]        kthread+0x30c/0x3d0
[12537.617906]        ret_from_fork+0x3a/0x50
[12537.636225]
[12537.636225] -> #2 (root_key_user.cons_lock){+.+.}:
[12537.664525]        __mutex_lock+0x105/0x11f0
[12537.683734]        request_key_and_link+0x35a/0xf70
[12537.705640]        request_key+0x3c/0x80
[12537.723304]        dns_query+0x1db/0x5a5 [dns_resolver]
[12537.746773]        dns_resolve_server_name_to_ip+0x1e1/0x4d0 [cifs]
[12537.775607]        cifs_reconnect+0xe04/0x2500 [cifs]
[12537.798322]        cifs_readv_from_socket+0x461/0x690 [cifs]
[12537.823369]        cifs_read_from_socket+0xa0/0xe0 [cifs]
[12537.847262]        cifs_demultiplex_thread+0x311/0x2db0 [cifs]
[12537.873477]        kthread+0x30c/0x3d0
[12537.890281]        ret_from_fork+0x3a/0x50
[12537.908649]
[12537.908649] -> #1 (&tcp_ses->srv_mutex){+.+.}:
[12537.935225]        __mutex_lock+0x105/0x11f0
[12537.954450]        cifs_call_async+0x102/0x7f0 [cifs]
[12537.977250]        smb2_async_readv+0x6c3/0xc90 [cifs]
[12538.000659]        cifs_readpages+0x120a/0x1e50 [cifs]
[12538.023920]        read_pages+0xf5/0x560
[12538.041583]        __do_page_cache_readahead+0x41d/0x4b0
[12538.067047]        ondemand_readahead+0x44c/0xc10
[12538.092069]        filemap_fault+0xec1/0x1830
[12538.111637]        __do_fault+0x82/0x260
[12538.129216]        do_fault+0x419/0xfb0
[12538.146390]        __handle_mm_fault+0x862/0xdf0
[12538.167408]        handle_mm_fault+0x154/0x550
[12538.187401]        __do_page_fault+0x42f/0xa60
[12538.207395]        do_page_fault+0x38/0x5e0
[12538.225777]        page_fault+0x1e/0x30
[12538.243010]
[12538.243010] -> #0 (&mm->mmap_sem){++++}:
[12538.267875]        lock_acquire+0x14c/0x420
[12538.286848]        __might_fault+0x119/0x1b0
[12538.306006]        keyring_read_iterator+0x7e/0x170
[12538.327936]        assoc_array_subtree_iterate+0x97/0x280
[12538.352154]        keyring_read+0xe9/0x110
[12538.370558]        keyctl_read_key+0x1b9/0x220
[12538.391470]        do_syscall_64+0xa5/0x4b0
[12538.410511]        entry_SYSCALL_64_after_hwframe+0x6a/0xdf
[12538.435535]
[12538.435535] other info that might help us debug this:
[12538.435535]
[12538.472829] Chain exists of:
[12538.472829]   &mm->mmap_sem --> root_key_user.cons_lock --> &type->lock_class
[12538.472829]
[12538.524820]  Possible unsafe locking scenario:
[12538.524820]
[12538.551431]        CPU0                    CPU1
[12538.572654]        ----                    ----
[12538.595865]   lock(&type->lock_class);
[12538.613737]                                lock(root_key_user.cons_lock);
[12538.644234]                                lock(&type->lock_class);
[12538.672410]   lock(&mm->mmap_sem);
[12538.687758]
[12538.687758]  *** DEADLOCK ***
[12538.687758]
[12538.714455] 1 lock held by keyctl/25598:
[12538.732097]  #0: 000000003de5b58d (&type->lock_class){++++}, at: keyctl_read_key+0x15a/0x220
[12538.770573]
[12538.770573] stack backtrace:
[12538.790136] CPU: 2 PID: 25598 Comm: keyctl Kdump: loaded Tainted: G
[12538.844855] Hardware name: HP ProLiant DL360 Gen9/ProLiant DL360 Gen9, BIOS P89 12/27/2015
[12538.881963] Call Trace:
[12538.892897]  dump_stack+0x9a/0xf0
[12538.907908]  print_circular_bug.isra.25.cold.50+0x1bc/0x279
[12538.932891]  ? save_trace+0xd6/0x250
[12538.948979]  check_prev_add.constprop.32+0xc36/0x14f0
[12538.971643]  ? keyring_compare_object+0x104/0x190
[12538.992738]  ? check_usage+0x550/0x550
[12539.009845]  ? sched_clock+0x5/0x10
[12539.025484]  ? sched_clock_cpu+0x18/0x1e0
[12539.043555]  __lock_acquire+0x1f12/0x38d0
[12539.061551]  ? trace_hardirqs_on+0x10/0x10
[12539.080554]  lock_acquire+0x14c/0x420
[12539.100330]  ? __might_fault+0xc4/0x1b0
[12539.119079]  __might_fault+0x119/0x1b0
[12539.135869]  ? __might_fault+0xc4/0x1b0
[12539.153234]  keyring_read_iterator+0x7e/0x170
[12539.172787]  ? keyring_read+0x110/0x110
[12539.190059]  assoc_array_subtree_iterate+0x97/0x280
[12539.211526]  keyring_read+0xe9/0x110
[12539.227561]  ? keyring_gc_check_iterator+0xc0/0xc0
[12539.249076]  keyctl_read_key+0x1b9/0x220
[12539.266660]  do_syscall_64+0xa5/0x4b0
[12539.283091]  entry_SYSCALL_64_after_hwframe+0x6a/0xdf

One way to prevent this deadlock scenario from happening is to not
allow writing to userspace while holding the key semaphore. Instead,
an internal buffer is allocated for getting the keys out from the
read method first before copying them out to userspace without holding
the lock.

That requires taking out the __user modifier from the read methods as
well as additional changes to not use any userspace write helpers.

Fixes: ^1da177e4c3f4 ("Linux-2.6.12-rc2")
Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Signed-off-by: Waiman Long <longman@redhat.com>
---
 include/keys/big_key-type.h               |  2 +-
 include/keys/user-type.h                  |  3 +-
 include/linux/key-type.h                  |  2 +-
 security/keys/big_key.c                   | 11 ++---
 security/keys/encrypted-keys/encrypted.c  |  7 ++-
 security/keys/keyctl.c                    | 57 +++++++++++++++++++----
 security/keys/keyring.c                   |  6 +--
 security/keys/request_key_auth.c          |  7 ++-
 security/keys/trusted-keys/trusted_tpm1.c | 14 +-----
 security/keys/user_defined.c              |  5 +-
 10 files changed, 67 insertions(+), 47 deletions(-)

diff --git a/include/keys/big_key-type.h b/include/keys/big_key-type.h
index f6a7ba4dccd4..3fee04f81439 100644
--- a/include/keys/big_key-type.h
+++ b/include/keys/big_key-type.h
@@ -17,6 +17,6 @@ extern void big_key_free_preparse(struct key_preparsed_payload *prep);
 extern void big_key_revoke(struct key *key);
 extern void big_key_destroy(struct key *key);
 extern void big_key_describe(const struct key *big_key, struct seq_file *m);
-extern long big_key_read(const struct key *key, char __user *buffer, size_t buflen);
+extern long big_key_read(const struct key *key, char *buffer, size_t buflen);
 
 #endif /* _KEYS_BIG_KEY_TYPE_H */
diff --git a/include/keys/user-type.h b/include/keys/user-type.h
index d5e73266a81a..be61fcddc02a 100644
--- a/include/keys/user-type.h
+++ b/include/keys/user-type.h
@@ -41,8 +41,7 @@ extern int user_update(struct key *key, struct key_preparsed_payload *prep);
 extern void user_revoke(struct key *key);
 extern void user_destroy(struct key *key);
 extern void user_describe(const struct key *user, struct seq_file *m);
-extern long user_read(const struct key *key,
-		      char __user *buffer, size_t buflen);
+extern long user_read(const struct key *key, char *buffer, size_t buflen);
 
 static inline const struct user_key_payload *user_key_payload_rcu(const struct key *key)
 {
diff --git a/include/linux/key-type.h b/include/linux/key-type.h
index 4ded94bcf274..2ab2d6d6aeab 100644
--- a/include/linux/key-type.h
+++ b/include/linux/key-type.h
@@ -127,7 +127,7 @@ struct key_type {
 	 *   much is copied into the buffer
 	 * - shouldn't do the copy if the buffer is NULL
 	 */
-	long (*read)(const struct key *key, char __user *buffer, size_t buflen);
+	long (*read)(const struct key *key, char *buffer, size_t buflen);
 
 	/* handle request_key() for this type instead of invoking
 	 * /sbin/request-key (optional)
diff --git a/security/keys/big_key.c b/security/keys/big_key.c
index 001abe530a0d..82008f900930 100644
--- a/security/keys/big_key.c
+++ b/security/keys/big_key.c
@@ -352,7 +352,7 @@ void big_key_describe(const struct key *key, struct seq_file *m)
  * read the key data
  * - the key's semaphore is read-locked
  */
-long big_key_read(const struct key *key, char __user *buffer, size_t buflen)
+long big_key_read(const struct key *key, char *buffer, size_t buflen)
 {
 	size_t datalen = (size_t)key->payload.data[big_key_len];
 	long ret;
@@ -391,9 +391,8 @@ long big_key_read(const struct key *key, char __user *buffer, size_t buflen)
 
 		ret = datalen;
 
-		/* copy decrypted data to user */
-		if (copy_to_user(buffer, buf->virt, datalen) != 0)
-			ret = -EFAULT;
+		/* copy out decrypted data */
+		memcpy(buffer, buf->virt, datalen);
 
 err_fput:
 		fput(file);
@@ -401,9 +400,7 @@ long big_key_read(const struct key *key, char __user *buffer, size_t buflen)
 		big_key_free_buffer(buf);
 	} else {
 		ret = datalen;
-		if (copy_to_user(buffer, key->payload.data[big_key_data],
-				 datalen) != 0)
-			ret = -EFAULT;
+		memcpy(buffer, key->payload.data[big_key_data], datalen);
 	}
 
 	return ret;
diff --git a/security/keys/encrypted-keys/encrypted.c b/security/keys/encrypted-keys/encrypted.c
index 60720f58cbe0..f6797ba44bf7 100644
--- a/security/keys/encrypted-keys/encrypted.c
+++ b/security/keys/encrypted-keys/encrypted.c
@@ -902,14 +902,14 @@ static int encrypted_update(struct key *key, struct key_preparsed_payload *prep)
 }
 
 /*
- * encrypted_read - format and copy the encrypted data to userspace
+ * encrypted_read - format and copy out the encrypted data
  *
  * The resulting datablob format is:
  * <master-key name> <decrypted data length> <encrypted iv> <encrypted data>
  *
  * On success, return to userspace the encrypted key datablob size.
  */
-static long encrypted_read(const struct key *key, char __user *buffer,
+static long encrypted_read(const struct key *key, char *buffer,
 			   size_t buflen)
 {
 	struct encrypted_key_payload *epayload;
@@ -957,8 +957,7 @@ static long encrypted_read(const struct key *key, char __user *buffer,
 	key_put(mkey);
 	memzero_explicit(derived_key, sizeof(derived_key));
 
-	if (copy_to_user(buffer, ascii_buf, asciiblob_len) != 0)
-		ret = -EFAULT;
+	memcpy(buffer, ascii_buf, asciiblob_len);
 	kzfree(ascii_buf);
 
 	return asciiblob_len;
diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index 9b898c969558..81f68e434b9f 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -797,6 +797,21 @@ long keyctl_keyring_search(key_serial_t ringid,
 	return ret;
 }
 
+/*
+ * Call the read method
+ */
+static long __keyctl_read_key(struct key *key, char *buffer, size_t buflen)
+{
+	long ret;
+
+	down_read(&key->sem);
+	ret = key_validate(key);
+	if (ret == 0)
+		ret = key->type->read(key, buffer, buflen);
+	up_read(&key->sem);
+	return ret;
+}
+
 /*
  * Read a key's payload.
  *
@@ -844,16 +859,42 @@ long keyctl_read_key(key_serial_t keyid, char __user *buffer, size_t buflen)
 
 	/* the key is probably readable - now try to read it */
 can_read_key:
-	ret = -EOPNOTSUPP;
-	if (key->type->read) {
-		/* Read the data with the semaphore held (since we might sleep)
+	if (!key->type->read) {
+		ret = -EOPNOTSUPP;
+		goto error2;
+	}
+
+	if (!buffer || !buflen) {
+		/* Get the key length from the read method */
+		ret = __keyctl_read_key(key, NULL, 0);
+	} else {
+
+		/*
+		 * Read the data with the semaphore held (since we might sleep)
 		 * to protect against the key being updated or revoked.
+		 *
+		 * Allocating a temporary buffer to hold the keys before
+		 * transferring them to user buffer to avoid potential
+		 * deadlock involving page fault and mmap_sem.
+		 */
+		char *tmpbuf = kmalloc(buflen, GFP_KERNEL);
+
+		if (!tmpbuf) {
+			ret = -ENOMEM;
+			goto error2;
+		}
+		ret = __keyctl_read_key(key, tmpbuf, buflen);
+
+		/*
+		 * Read methods will just return the required length
+		 * without any copying if the provided length isn't big
+		 * enough.
 		 */
-		down_read(&key->sem);
-		ret = key_validate(key);
-		if (ret == 0)
-			ret = key->type->read(key, buffer, buflen);
-		up_read(&key->sem);
+		if ((ret > 0) && (ret <= buflen)) {
+			if (copy_to_user(buffer, tmpbuf, ret))
+				ret = -EFAULT;
+		}
+		kzfree(tmpbuf);
 	}
 
 error2:
diff --git a/security/keys/keyring.c b/security/keys/keyring.c
index febf36c6ddc5..5ca620d31cd3 100644
--- a/security/keys/keyring.c
+++ b/security/keys/keyring.c
@@ -459,7 +459,6 @@ static int keyring_read_iterator(const void *object, void *data)
 {
 	struct keyring_read_iterator_context *ctx = data;
 	const struct key *key = keyring_ptr_to_key(object);
-	int ret;
 
 	kenter("{%s,%d},,{%zu/%zu}",
 	       key->type->name, key->serial, ctx->count, ctx->buflen);
@@ -467,10 +466,7 @@ static int keyring_read_iterator(const void *object, void *data)
 	if (ctx->count >= ctx->buflen)
 		return 1;
 
-	ret = put_user(key->serial, ctx->buffer);
-	if (ret < 0)
-		return ret;
-	ctx->buffer++;
+	*ctx->buffer++ = key->serial;
 	ctx->count += sizeof(key->serial);
 	return 0;
 }
diff --git a/security/keys/request_key_auth.c b/security/keys/request_key_auth.c
index ecba39c93fd9..41e9735006d0 100644
--- a/security/keys/request_key_auth.c
+++ b/security/keys/request_key_auth.c
@@ -22,7 +22,7 @@ static int request_key_auth_instantiate(struct key *,
 static void request_key_auth_describe(const struct key *, struct seq_file *);
 static void request_key_auth_revoke(struct key *);
 static void request_key_auth_destroy(struct key *);
-static long request_key_auth_read(const struct key *, char __user *, size_t);
+static long request_key_auth_read(const struct key *, char *, size_t);
 
 /*
  * The request-key authorisation key type definition.
@@ -80,7 +80,7 @@ static void request_key_auth_describe(const struct key *key,
  * - the key's semaphore is read-locked
  */
 static long request_key_auth_read(const struct key *key,
-				  char __user *buffer, size_t buflen)
+				  char *buffer, size_t buflen)
 {
 	struct request_key_auth *rka = dereference_key_locked(key);
 	size_t datalen;
@@ -97,8 +97,7 @@ static long request_key_auth_read(const struct key *key,
 		if (buflen > datalen)
 			buflen = datalen;
 
-		if (copy_to_user(buffer, rka->callout_info, buflen) != 0)
-			ret = -EFAULT;
+		memcpy(buffer, rka->callout_info, buflen);
 	}
 
 	return ret;
diff --git a/security/keys/trusted-keys/trusted_tpm1.c b/security/keys/trusted-keys/trusted_tpm1.c
index d2c5ec1e040b..8001ab07e63b 100644
--- a/security/keys/trusted-keys/trusted_tpm1.c
+++ b/security/keys/trusted-keys/trusted_tpm1.c
@@ -1130,11 +1130,10 @@ static int trusted_update(struct key *key, struct key_preparsed_payload *prep)
  * trusted_read - copy the sealed blob data to userspace in hex.
  * On success, return to userspace the trusted key datablob size.
  */
-static long trusted_read(const struct key *key, char __user *buffer,
+static long trusted_read(const struct key *key, char *buffer,
 			 size_t buflen)
 {
 	const struct trusted_key_payload *p;
-	char *ascii_buf;
 	char *bufp;
 	int i;
 
@@ -1143,18 +1142,9 @@ static long trusted_read(const struct key *key, char __user *buffer,
 		return -EINVAL;
 
 	if (buffer && buflen >= 2 * p->blob_len) {
-		ascii_buf = kmalloc_array(2, p->blob_len, GFP_KERNEL);
-		if (!ascii_buf)
-			return -ENOMEM;
-
-		bufp = ascii_buf;
+		bufp = buffer;
 		for (i = 0; i < p->blob_len; i++)
 			bufp = hex_byte_pack(bufp, p->blob[i]);
-		if (copy_to_user(buffer, ascii_buf, 2 * p->blob_len) != 0) {
-			kzfree(ascii_buf);
-			return -EFAULT;
-		}
-		kzfree(ascii_buf);
 	}
 	return 2 * p->blob_len;
 }
diff --git a/security/keys/user_defined.c b/security/keys/user_defined.c
index 6f12de4ce549..07d4287e9084 100644
--- a/security/keys/user_defined.c
+++ b/security/keys/user_defined.c
@@ -168,7 +168,7 @@ EXPORT_SYMBOL_GPL(user_describe);
  * read the key data
  * - the key's semaphore is read-locked
  */
-long user_read(const struct key *key, char __user *buffer, size_t buflen)
+long user_read(const struct key *key, char *buffer, size_t buflen)
 {
 	const struct user_key_payload *upayload;
 	long ret;
@@ -181,8 +181,7 @@ long user_read(const struct key *key, char __user *buffer, size_t buflen)
 		if (buflen > upayload->datalen)
 			buflen = upayload->datalen;
 
-		if (copy_to_user(buffer, upayload->data, buflen) != 0)
-			ret = -EFAULT;
+		memcpy(buffer, upayload->data, buflen);
 	}
 
 	return ret;
-- 
2.18.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
