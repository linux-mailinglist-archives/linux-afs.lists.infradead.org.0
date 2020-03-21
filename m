Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB0C18E828
	for <lists+linux-afs@lfdr.de>; Sun, 22 Mar 2020 11:57:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2KP6Lw5mMdm/eGyijRqLX5Bj312xvDK+L46rOW0Jrak=; b=frANOSp50GSOiCuZFx+LlSmBTQ
	J6PW0v0DauVUMwIChnkXWqANK4Yjk4586tRe+gYfB0X9drLmmw5lVceXVNRDOWKCbh7MFFg5G5i5n
	EnCWwNo7Ub+KnSzY5UyydRK8weQ9Q2lPCxribJvpWku401pUyvd+4dkrZ79vqp9fF9UEJrHwe5GC7
	boVFqsAa8weGgSS0Umc4fxBU4MfNZaXsQohZMEbjdO/R+hPr5ISS5ED/dtQeYeOiXmubPVKJa/teA
	uUBEeAom13sNuyG69YzeMJyyt1Tqr6CRS1FQo8VhnF2RFBfC/+vZ2waYDwiwbr1lECfpa99oBZlYC
	6VMasaAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFyHo-0004tM-UW; Sun, 22 Mar 2020 10:56:56 +0000
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFjC9-0001SW-10
 for linux-afs@lists.infradead.org; Sat, 21 Mar 2020 18:50:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584816604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=OeeXSEulKfhGNv5wgMWtvW/H+/8ywD8JBek/ZxkbTIk=;
 b=byB1C1wZ7upnrtxuOhdKyHw3pS9rKsU5nDrObaN+izejVD7TptChe2v4yzfX+R+AcgLEpP
 pZnaYHVCPsHoRZ8pYgS+JaNhoxBD1SSRHkuGzJ2XtRED2Ga3VzleToztUUDHCJHwVRBabN
 Hrx/AjtBBKaXhHA/OwJ4pCn58cUX54k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-4JChYIjgPQ2yXzzHT9a-rQ-1; Sat, 21 Mar 2020 14:49:57 -0400
X-MC-Unique: 4JChYIjgPQ2yXzzHT9a-rQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D1FB800D50;
 Sat, 21 Mar 2020 18:49:55 +0000 (UTC)
Received: from llong.com (ovpn-112-193.rdu2.redhat.com [10.10.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBBA210027B3;
 Sat, 21 Mar 2020 18:49:52 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Mimi Zohar <zohar@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v7 2/2] KEYS: Avoid false positive ENOMEM error on key read
Date: Sat, 21 Mar 2020 14:49:32 -0400
Message-Id: <20200321184932.16579-3-longman@redhat.com>
In-Reply-To: <20200321184932.16579-1-longman@redhat.com>
References: <20200321184932.16579-1-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200321_115005_161248_E4535221 
X-CRM114-Status: GOOD (  20.61  )
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

By allocating a kernel buffer with a user-supplied buffer length, it
is possible that a false positive ENOMEM error may be returned because
the user-supplied length is just too large even if the system do have
enough memory to hold the actual key data.

Moreover, if the buffer length is larger than the maximum amount of
memory that can be returned by kmalloc() (2^(MAX_ORDER-1) number of
pages), a warning message will also be printed.

To reduce this possibility, we set a threshold (PAGE_SIZE) over which we
do check the actual key length first before allocating a buffer of the
right size to hold it. The threshold is arbitrary, it is just used to
trigger a buffer length check. It does not limit the actual key length
as long as there is enough memory to satisfy the memory request.

To further avoid large buffer allocation failure due to page
fragmentation, kvmalloc() is used to allocate the buffer so that vmapped
pages can be used when there is not a large enough contiguous set of
pages available for allocation.

In the extremely unlikely scenario that the key keeps on being changed
and made longer (still <= buflen) in between 2 __keyctl_read_key()
calls, the __keyctl_read_key() calling loop in keyctl_read_key() may
have to be iterated a large number of times, but definitely not infinite.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 security/keys/internal.h | 12 ++++++++
 security/keys/keyctl.c   | 59 +++++++++++++++++++++++++++++-----------
 2 files changed, 55 insertions(+), 16 deletions(-)

diff --git a/security/keys/internal.h b/security/keys/internal.h
index ba3e2da14cef..6d0ca48ae9a5 100644
--- a/security/keys/internal.h
+++ b/security/keys/internal.h
@@ -16,6 +16,8 @@
 #include <linux/keyctl.h>
 #include <linux/refcount.h>
 #include <linux/compat.h>
+#include <linux/mm.h>
+#include <linux/vmalloc.h>
 
 struct iovec;
 
@@ -349,4 +351,14 @@ static inline void key_check(const struct key *key)
 
 #endif
 
+/*
+ * Helper function to clear and free a kvmalloc'ed memory object.
+ */
+static inline void __kvzfree(const void *addr, size_t len)
+{
+	if (addr) {
+		memset((void *)addr, 0, len);
+		kvfree(addr);
+	}
+}
 #endif /* _INTERNAL_H */
diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index 434ed9defd3a..2f72bbe2962b 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -339,7 +339,7 @@ long keyctl_update_key(key_serial_t id,
 	payload = NULL;
 	if (plen) {
 		ret = -ENOMEM;
-		payload = kmalloc(plen, GFP_KERNEL);
+		payload = kvmalloc(plen, GFP_KERNEL);
 		if (!payload)
 			goto error;
 
@@ -360,7 +360,7 @@ long keyctl_update_key(key_serial_t id,
 
 	key_ref_put(key_ref);
 error2:
-	kzfree(payload);
+	__kvzfree(payload, plen);
 error:
 	return ret;
 }
@@ -827,7 +827,8 @@ long keyctl_read_key(key_serial_t keyid, char __user *buffer, size_t buflen)
 	struct key *key;
 	key_ref_t key_ref;
 	long ret;
-	char *key_data;
+	char *key_data = NULL;
+	size_t key_data_len;
 
 	/* find the key first */
 	key_ref = lookup_user_key(keyid, 0, 0);
@@ -878,24 +879,50 @@ long keyctl_read_key(key_serial_t keyid, char __user *buffer, size_t buflen)
 	 * Allocating a temporary buffer to hold the keys before
 	 * transferring them to user buffer to avoid potential
 	 * deadlock involving page fault and mmap_sem.
+	 *
+	 * key_data_len = (buflen <= PAGE_SIZE)
+	 *		? buflen : actual length of key data
+	 *
+	 * This prevents allocating arbitrary large buffer which can
+	 * be much larger than the actual key length. In the latter case,
+	 * at least 2 passes of this loop is required.
 	 */
-	key_data = kmalloc(buflen, GFP_KERNEL);
+	key_data_len = (buflen <= PAGE_SIZE) ? buflen : 0;
+	do {
+		if (key_data_len) {
+			key_data = kvmalloc(key_data_len, GFP_KERNEL);
+			if (!key_data) {
+				ret = -ENOMEM;
+				goto key_put_out;
+			}
+		}
 
-	if (!key_data) {
-		ret = -ENOMEM;
-		goto key_put_out;
-	}
-	ret = __keyctl_read_key(key, key_data, buflen);
+		ret = __keyctl_read_key(key, key_data, key_data_len);
+
+		/*
+		 * Read methods will just return the required length without
+		 * any copying if the provided length isn't large enough.
+		 */
+		if (ret <= 0 || ret > buflen)
+			break;
+
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
+		}
 
-	/*
-	 * Read methods will just return the required length without
-	 * any copying if the provided length isn't large enough.
-	 */
-	if (ret > 0 && ret <= buflen) {
 		if (copy_to_user(buffer, key_data, ret))
 			ret = -EFAULT;
-	}
-	kzfree(key_data);
+	} while (0);
+	__kvzfree(key_data, key_data_len);
 
 key_put_out:
 	key_put(key);
-- 
2.18.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
