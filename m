Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 37726189665
	for <lists+linux-afs@lfdr.de>; Wed, 18 Mar 2020 08:58:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qxU7CTMk32DFBO9qraJat3WYiTEDFEP4i05Agi5OxwY=; b=mqWWj9ubOi4gJ9VrTlVlbr72CF
	Qd6yOlvZdZ2dfRINMzb+uPvawIPdkNbuft3xYt8dVFpH2VUc9wdK10q7Nj3JHS6rFfY4KWA2giC2H
	FilV6hDOcsCVBOjCYf4HNnjoijqmUPifOU0yfsxUY0kZp9HRDkfJeBVkLQwX/ic8M/s6SWvjJhsE6
	F8KO9sZOUQkCifQ4cNrj7eqKsGLGxfJjhPwXt02ByPP1ZJfTkdzu0pOWyeu1T/wvpgnoay22UiHY1
	YJXwy+EUE6zxea/G+RPZf4RSM8/vMizuYXljLW6xu0sUKGxbJ19Kgvkdxt9g6l6D06XEwba6f9ac8
	4o11YQCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jETaJ-0002OC-A4; Wed, 18 Mar 2020 07:57:51 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEI7w-00009D-Uo
 for linux-afs@bombadil.infradead.org; Tue, 17 Mar 2020 19:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=VP/33sULw/Y4pBnAwwPfa1aLW7Jli8KU3auzMsRKrNI=; b=aBPThMexnXcaDtFSpvNMeKsYrc
 okpS25dGI74WPgGKGsIhCulmCWVD140BwFSX1Rdq3T6wvRtsrUzTbqu5ENLWjtwIFXg+ICgwnd9OF
 VewwfCNCCNLWNZJ6GXIWpxyAK2OkiT6CxUR8jwvFuBG7kNCKx0Um3vWTfKN64lW+4YlGE5IeEZY7Z
 asBHezWb3mYZp40CpNk79pD1tHp/tuvBilqkA51lwOKvjsNmiAQKyCWGq9oQRosh8+Kw37700kdK4
 7/lY/5xrowtWGkAvG/IClYdyP9E4OgSSXVwqC3Gy1CoT9ULBssXuStTBMJoBT9+lVxjFq3a89CI6o
 G5/ICw9g==;
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEI7u-00006d-II
 for linux-afs@lists.infradead.org; Tue, 17 Mar 2020 19:43:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584474189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=VP/33sULw/Y4pBnAwwPfa1aLW7Jli8KU3auzMsRKrNI=;
 b=XC/Y19Tpe0N7bxUsP9FFiHdUD+j96coFzq80wMVTSMB67NX716y9edi3Xq8hTfLKWtLbv9
 guA2XC7TmtBAoAZ3cUpbaUbFwLpsREvijjg3OYOHlceF2aMEiAZCHCMacLqkozf82shTFp
 C4QRobLmiLNw7FntGvrAMkhntLdzUw8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-3j8DzbXzMg2ZwixPszIWXg-1; Tue, 17 Mar 2020 15:43:07 -0400
X-MC-Unique: 3j8DzbXzMg2ZwixPszIWXg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2B9B80259A;
 Tue, 17 Mar 2020 19:42:59 +0000 (UTC)
Received: from llong.com (ovpn-115-15.rdu2.redhat.com [10.10.115.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17FFD10027A3;
 Tue, 17 Mar 2020 19:42:48 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Mimi Zohar <zohar@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v4 4/4] KEYS: Avoid false positive ENOMEM error on key read
Date: Tue, 17 Mar 2020 15:41:40 -0400
Message-Id: <20200317194140.6031-5-longman@redhat.com>
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
 no trust [63.128.21.74 listed in list.dnswl.org]
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

Signed-off-by: Waiman Long <longman@redhat.com>
---
 security/keys/internal.h | 12 ++++++++++++
 security/keys/keyctl.c   | 41 ++++++++++++++++++++++++++++++++--------
 2 files changed, 45 insertions(+), 8 deletions(-)

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
index 81f68e434b9f..07eaa46d344c 100644
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
@@ -877,13 +877,24 @@ long keyctl_read_key(key_serial_t keyid, char __user *buffer, size_t buflen)
 		 * transferring them to user buffer to avoid potential
 		 * deadlock involving page fault and mmap_sem.
 		 */
-		char *tmpbuf = kmalloc(buflen, GFP_KERNEL);
+		char *tmpbuf = NULL;
+		size_t tmpbuflen = buflen;
 
-		if (!tmpbuf) {
-			ret = -ENOMEM;
-			goto error2;
+		/*
+		 * To prevent memory allocation failure with an arbitrary
+		 * large user-supplied buflen, we do a key length check
+		 * before allocating a buffer of the right size to hold
+		 * key data if it exceeds a threshold (PAGE_SIZE).
+		 */
+		if (buflen <= PAGE_SIZE) {
+allocbuf:
+			tmpbuf = kvmalloc(tmpbuflen, GFP_KERNEL);
+			if (!tmpbuf) {
+				ret = -ENOMEM;
+				goto error2;
+			}
 		}
-		ret = __keyctl_read_key(key, tmpbuf, buflen);
+		ret = __keyctl_read_key(key, tmpbuf, tmpbuflen);
 
 		/*
 		 * Read methods will just return the required length
@@ -891,10 +902,24 @@ long keyctl_read_key(key_serial_t keyid, char __user *buffer, size_t buflen)
 		 * enough.
 		 */
 		if ((ret > 0) && (ret <= buflen)) {
+			/*
+			 * It is possible, though unlikely, that the key
+			 * changes in between the up_read->down_read period.
+			 * If the key becomes longer, we will have to
+			 * allocate a larger buffer and redo the key read
+			 * again.
+			 */
+			if (!tmpbuf || unlikely(ret > tmpbuflen)) {
+				if (unlikely(tmpbuf))
+					__kvzfree(tmpbuf, tmpbuflen);
+				tmpbuflen = ret;
+				goto allocbuf;
+			}
+
 			if (copy_to_user(buffer, tmpbuf, ret))
 				ret = -EFAULT;
 		}
-		kzfree(tmpbuf);
+		__kvzfree(tmpbuf, tmpbuflen);
 	}
 
 error2:
-- 
2.18.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
