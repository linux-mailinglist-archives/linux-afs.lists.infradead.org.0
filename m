Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F84189663
	for <lists+linux-afs@lfdr.de>; Wed, 18 Mar 2020 08:58:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qYNLkTaEDC0QUjirE5QC5v3RfeeycdxKtLYn0c7fgM0=; b=iIbXv/TWJo8xyblPi6tb5NWCFl
	3IHzqWaIoUXrI0c8UFURYYpt2LQOUZXumN1c39lJpG5gdj8g3zdmKeEpUPpWdcTWz3q2suD3LTUJh
	kixXVLCUTT64KjUHwytAGZZPwgzPTtn05agrtHjoQ9uYr6Lxh0GHpTkh8e5JtpS5FzVuypxgI2OG4
	j6lQ5GDhaczO6obJKUCMQc1efiBn5dxxmxkpazl7HJSmPLEIKAAzzDIP/CF66H0d3Xj5qHg9C+GRm
	TYQfR83TYqxb9YZl4v2lxBM15QxTwzoD3YWl0ET6+V1JSPyYUacD16xyTUJkeZ4GqpPRign9RhRdS
	ifQ3eaTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jETaI-0002Ms-RJ; Wed, 18 Mar 2020 07:57:50 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEI7j-000089-7g
 for linux-afs@bombadil.infradead.org; Tue, 17 Mar 2020 19:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=AuuPPkmbcRXrK5cIRHO/X7wo6mvbjvrZzcK5yCZ9sv0=; b=p/C3voVagNd5DS0+ZgaypycMiL
 Z7gA8xR6t3cnqsCWPA98GYc1HS9K0QIqEzULFWBpi2ZL1JArX+52KMOlpIwa+Fh/uP8fRwfejhRef
 xmQ7aMom+XgUpZQvlvzXl1n+IualUCzqSHyuSGo4Wd2C/XJz+1UhDoyc2zeagV/iyERqCQcapnttE
 +PJCjGITsW4wSDJo0XnYaZS7ib7iDGOpAx7UHYdkLoJOB5kFvRidoyzovitpJNDmNpbPvPiJ8N5Py
 7TuKhV07KDiUGNjKDGoLmUyVzHj8GsskfXEZos47sah2yGj87h46PForB+n2Ni51xQcIWxJP3XO0B
 YLU8S3eA==;
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEI7g-00006P-Iq
 for linux-afs@lists.infradead.org; Tue, 17 Mar 2020 19:43:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584474172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=AuuPPkmbcRXrK5cIRHO/X7wo6mvbjvrZzcK5yCZ9sv0=;
 b=URIDBFSAbhY4foNOONVqrRVgG0wL6O/1jeGFq+wuu745RmvL+mFGLcLR96CPb2OYktV7ND
 SjgmgU7WQ2ZR8E4qLVqs6PNrdClFUjiINLxAFmiD2joaMf1dGmatalO6vSwQ+rZMyyiQ4c
 2YU2o8y6tEED7B6kQl1TA9meI6k05HI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-2aF3_KCzNSCAmPHDp7NTOg-1; Tue, 17 Mar 2020 15:42:48 -0400
X-MC-Unique: 2aF3_KCzNSCAmPHDp7NTOg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97911802B83;
 Tue, 17 Mar 2020 19:42:43 +0000 (UTC)
Received: from llong.com (ovpn-115-15.rdu2.redhat.com [10.10.115.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABECF1036B44;
 Tue, 17 Mar 2020 19:42:40 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Mimi Zohar <zohar@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v4 2/4] KEYS: Remove __user annotation from rxrpc_read()
Date: Tue, 17 Mar 2020 15:41:38 -0400
Message-Id: <20200317194140.6031-3-longman@redhat.com>
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

As the keyctl_read_key() has been modified to use a temporary kernel
buffer to read out the key data instead of passing in the user-supplied
buffer directly, there is no need to use the __user annotation for
rxrpc_read(). In addition,

 1) The put_user() call is replaced by a direct copy.
 2) The copy_to_user() call is replaced by memcpy().
 3) All the fault handling code is removed.

Compiling on a x86-64 system, the size of the rxrpc_read() function is
reduced from 3795 bytes to 2384 bytes with this patch.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 net/rxrpc/key.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/net/rxrpc/key.c b/net/rxrpc/key.c
index 6c3f35fac42d..0c98313dd7a8 100644
--- a/net/rxrpc/key.c
+++ b/net/rxrpc/key.c
@@ -31,7 +31,7 @@ static void rxrpc_free_preparse_s(struct key_preparsed_payload *);
 static void rxrpc_destroy(struct key *);
 static void rxrpc_destroy_s(struct key *);
 static void rxrpc_describe(const struct key *, struct seq_file *);
-static long rxrpc_read(const struct key *, char __user *, size_t);
+static long rxrpc_read(const struct key *, char *, size_t);
 
 /*
  * rxrpc defined keys take an arbitrary string as the description and an
@@ -1042,12 +1042,12 @@ EXPORT_SYMBOL(rxrpc_get_null_key);
  * - this returns the result in XDR form
  */
 static long rxrpc_read(const struct key *key,
-		       char __user *buffer, size_t buflen)
+		       char *buffer, size_t buflen)
 {
 	const struct rxrpc_key_token *token;
 	const struct krb5_principal *princ;
 	size_t size;
-	__be32 __user *xdr, *oldxdr;
+	__be32 *xdr, *oldxdr;
 	u32 cnlen, toksize, ntoks, tok, zero;
 	u16 toksizes[AFSTOKEN_MAX];
 	int loop;
@@ -1124,30 +1124,25 @@ static long rxrpc_read(const struct key *key,
 	if (!buffer || buflen < size)
 		return size;
 
-	xdr = (__be32 __user *) buffer;
+	xdr = (__be32 *)buffer;
 	zero = 0;
 #define ENCODE(x)				\
 	do {					\
-		__be32 y = htonl(x);		\
-		if (put_user(y, xdr++) < 0)	\
-			goto fault;		\
+		*xdr++ = htonl(x);		\
 	} while(0)
 #define ENCODE_DATA(l, s)						\
 	do {								\
 		u32 _l = (l);						\
 		ENCODE(l);						\
-		if (copy_to_user(xdr, (s), _l) != 0)			\
-			goto fault;					\
-		if (_l & 3 &&						\
-		    copy_to_user((u8 __user *)xdr + _l, &zero, 4 - (_l & 3)) != 0) \
-			goto fault;					\
+		memcpy(xdr, (s), _l);					\
+		if (_l & 3)						\
+			memcpy((u8 *)xdr + _l, &zero, 4 - (_l & 3));	\
 		xdr += (_l + 3) >> 2;					\
 	} while(0)
 #define ENCODE64(x)					\
 	do {						\
 		__be64 y = cpu_to_be64(x);		\
-		if (copy_to_user(xdr, &y, 8) != 0)	\
-			goto fault;			\
+		memcpy(xdr, &y, 8);			\
 		xdr += 8 >> 2;				\
 	} while(0)
 #define ENCODE_STR(s)				\
@@ -1238,8 +1233,4 @@ static long rxrpc_read(const struct key *key,
 	ASSERTCMP((char __user *) xdr - buffer, ==, size);
 	_leave(" = %zu", size);
 	return size;
-
-fault:
-	_leave(" = -EFAULT");
-	return -EFAULT;
 }
-- 
2.18.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
