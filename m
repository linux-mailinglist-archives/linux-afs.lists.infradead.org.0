Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CFADD18E82A
	for <lists+linux-afs@lfdr.de>; Sun, 22 Mar 2020 11:57:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=0+rMlgCfFfcGAGb4SMgOOXcGF4chLjN+sMdikV7o1Aw=; b=NSo
	yBp7M53nzDPazegmA9bArdzGk7mHtwzSrkeyVWPLDfKK8b5wNpQHidKHGqDMQIjd+jHMPkHBwUzOI
	MSuT2/pS/GFvUEv9TRT4RSP1+ITYusJldPNEXQDyLC+YAkviMHUN3OfZI64E2JbVmbtndKFXeYp0l
	wU3rGgn0Hx/jujPKrB3G4oHCmm0gdhGR9oIY9bNzECBjdPHCBAx1tOYF2gBqiL9W22xff1qcFzn2u
	sawQBQ2cw7Jt6Pygaetv7yRxBNTa/04ArByeA7BfzBQUpz1kSjy0M2JFgwHjR/5BF4jFvEqEYrQ/C
	bvUOcHmgDo3h7ZDeeeWrGzXBbrgco+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFyHs-0004vx-Jy; Sun, 22 Mar 2020 10:57:00 +0000
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFp9V-0001fk-EN
 for linux-afs@lists.infradead.org; Sun, 22 Mar 2020 01:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584839503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=GxoTKLQpFzppeZ1IideM1l+Ctjcluvi6BUy3ojyp5jA=;
 b=ipod18hg/yYv6XuIryx9iKRms+n9ThKWwvvMGcmNHHpXSEG8H/c8CivCnCTOHFK4ZBXYhJ
 wnX+M0AR5cNg8HXd5o8L/95CfWcffcDdoTjIzGWS97gFTZhelBuanRvBhhaBPZOvzASFvC
 NHxvyw5VI/VlzTaCIxH1gx7QXa5YSYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-J42fJmjOPR2cqnr5ZjumQw-1; Sat, 21 Mar 2020 21:11:39 -0400
X-MC-Unique: J42fJmjOPR2cqnr5ZjumQw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA3BD13E2;
 Sun, 22 Mar 2020 01:11:37 +0000 (UTC)
Received: from llong.com (ovpn-112-193.rdu2.redhat.com [10.10.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D5F98D574;
 Sun, 22 Mar 2020 01:11:31 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Mimi Zohar <zohar@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v8 0/2] KEYS: Read keys to internal buffer & then copy to
 userspace
Date: Sat, 21 Mar 2020 21:11:23 -0400
Message-Id: <20200322011125.24327-1-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200321_181145_562416_8E3117B2 
X-CRM114-Status: GOOD (  19.99  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [63.128.21.74 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Sun, 22 Mar 2020 03:56:45 -0700
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

v8:
 - Change the do-while loop in patch 2 to a for loop to make "continue"
   work.

v7:
 - Restructure code in keyctl_read_key() to reduce nesting.
 - Restructure patch 2 to use loop instead of backward jump as suggested
   by Jarkko.

v6:
 - Make some variable name changes and revise comments as suggested by
   Jarkko. No functional change from v5.

v5:
 - Merge v4 patches 2 and 3 into 1 to avoid sparse warning. Merge some of 
   commit logs into patch 1 as well. There is no further change.

v4:
 - Remove the __user annotation from big_key_read() and user_read() in
   patch 1.
 - Add a new patch 2 to remove __user annotation from rxrpc_read().
 - Add a new patch 3 to remove __user annotation from dns_resolver_read().
 - Merge the original patches 2 and 3 into a single patch 4 and refactor
   it as suggested by Jarkko and Eric.

The current security key read methods are called with the key semaphore
held.  The methods then copy out the key data to userspace which is
subjected to page fault and may acquire the mmap semaphore. That can
result in circular lock dependency and hence a chance to get into
deadlock.

To avoid such a deadlock, an internal buffer is now allocated for getting
out the necessary data first. After releasing the key semaphore, the
key data are then copied out to userspace sidestepping the circular
lock dependency.

The keyutils test suite was run and the test passed with these patchset
applied without any falure.

Waiman Long (2):
  KEYS: Don't write out to userspace while holding key semaphore
  KEYS: Avoid false positive ENOMEM error on key read

 include/keys/big_key-type.h               |   2 +-
 include/keys/user-type.h                  |   3 +-
 include/linux/key-type.h                  |   2 +-
 net/dns_resolver/dns_key.c                |   2 +-
 net/rxrpc/key.c                           |  27 ++----
 security/keys/big_key.c                   |  11 +--
 security/keys/encrypted-keys/encrypted.c  |   7 +-
 security/keys/internal.h                  |  12 +++
 security/keys/keyctl.c                    | 103 ++++++++++++++++++----
 security/keys/keyring.c                   |   6 +-
 security/keys/request_key_auth.c          |   7 +-
 security/keys/trusted-keys/trusted_tpm1.c |  14 +--
 security/keys/user_defined.c              |   5 +-
 13 files changed, 126 insertions(+), 75 deletions(-)

Code diff from v6:

diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index ded69108db0d..0062e422e0fd 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -827,26 +827,28 @@ long keyctl_read_key(key_serial_t keyid, char __user *buffer, size_t buflen)
 	struct key *key;
 	key_ref_t key_ref;
 	long ret;
+	char *key_data = NULL;
+	size_t key_data_len;
 
 	/* find the key first */
 	key_ref = lookup_user_key(keyid, 0, 0);
 	if (IS_ERR(key_ref)) {
 		ret = -ENOKEY;
-		goto error;
+		goto out;
 	}
 
 	key = key_ref_to_ptr(key_ref);
 
 	ret = key_read_state(key);
 	if (ret < 0)
-		goto error2; /* Negatively instantiated */
+		goto key_put_out; /* Negatively instantiated */
 
 	/* see if we can read it directly */
 	ret = key_permission(key_ref, KEY_NEED_READ);
 	if (ret == 0)
 		goto can_read_key;
 	if (ret != -EACCES)
-		goto error2;
+		goto key_put_out;
 
 	/* we can't; see if it's searchable from this process's keyrings
 	 * - we automatically take account of the fact that it may be
@@ -854,75 +856,78 @@ long keyctl_read_key(key_serial_t keyid, char __user *buffer, size_t buflen)
 	 */
 	if (!is_key_possessed(key_ref)) {
 		ret = -EACCES;
-		goto error2;
+		goto key_put_out;
 	}
 
 	/* the key is probably readable - now try to read it */
 can_read_key:
 	if (!key->type->read) {
 		ret = -EOPNOTSUPP;
-		goto error2;
+		goto key_put_out;
 	}
 
 	if (!buffer || !buflen) {
 		/* Get the key length from the read method */
 		ret = __keyctl_read_key(key, NULL, 0);
-	} else {
-
-		/*
-		 * Read the data with the semaphore held (since we might sleep)
-		 * to protect against the key being updated or revoked.
-		 *
-		 * Allocating a temporary buffer to hold the keys before
-		 * transferring them to user buffer to avoid potential
-		 * deadlock involving page fault and mmap_sem.
-		 */
-		char *key_data = NULL;
-		size_t key_data_len = buflen;
+		goto key_put_out;
+	}
 
-		/*
-		 * When the user-supplied key length is larger than
-		 * PAGE_SIZE, we get the actual key length first before
-		 * allocating a right-sized key data buffer.
-		 */
-		if (buflen <= PAGE_SIZE) {
-allocbuf:
+	/*
+	 * Read the data with the semaphore held (since we might sleep)
+	 * to protect against the key being updated or revoked.
+	 *
+	 * Allocating a temporary buffer to hold the keys before
+	 * transferring them to user buffer to avoid potential
+	 * deadlock involving page fault and mmap_sem.
+	 *
+	 * key_data_len = (buflen <= PAGE_SIZE)
+	 *		? buflen : actual length of key data
+	 *
+	 * This prevents allocating arbitrary large buffer which can
+	 * be much larger than the actual key length. In the latter case,
+	 * at least 2 passes of this loop is required.
+	 */
+	key_data_len = (buflen <= PAGE_SIZE) ? buflen : 0;
+	for (;;) {
+		if (key_data_len) {
 			key_data = kvmalloc(key_data_len, GFP_KERNEL);
 			if (!key_data) {
 				ret = -ENOMEM;
-				goto error2;
+				goto key_put_out;
 			}
 		}
+
 		ret = __keyctl_read_key(key, key_data, key_data_len);
 
 		/*
-		 * Read methods will just return the required length
-		 * without any copying if the provided length isn't big
-		 * enough.
+		 * Read methods will just return the required length without
+		 * any copying if the provided length isn't large enough.
 		 */
-		if (ret > 0 && ret <= buflen) {
-			/*
-			 * The key may change (unlikely) in between 2
-			 * consecutive __keyctl_read_key() calls. We will
-			 * need to allocate a larger buffer and redo the key
-			 * read when key_data_len < ret <= buflen.
-			 */
-			if (!key_data || unlikely(ret > key_data_len)) {
-				if (unlikely(key_data))
-					__kvzfree(key_data, key_data_len);
-				key_data_len = ret;
-				goto allocbuf;
-			}
+		if (ret <= 0 || ret > buflen)
+			break;
 
-			if (copy_to_user(buffer, key_data, ret))
-				ret = -EFAULT;
+		/*
+		 * The key may change (unlikely) in between 2 consecutive
+		 * __keyctl_read_key() calls. In this case, we reallocate
+		 * a larger buffer and redo the key read when
+		 * key_data_len < ret <= buflen.
+		 */
+		if (ret > key_data_len) {
+			if (unlikely(key_data))
+				__kvzfree(key_data, key_data_len);
+			key_data_len = ret;
+			continue;	/* Allocate buffer */
 		}
-		__kvzfree(key_data, key_data_len);
+
+		if (copy_to_user(buffer, key_data, ret))
+			ret = -EFAULT;
+		break;
 	}
+	__kvzfree(key_data, key_data_len);
 
-error2:
+key_put_out:
 	key_put(key);
-error:
+out:
 	return ret;
 }

-- 
2.18.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
