Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E801A118F
	for <lists+linux-afs@lfdr.de>; Tue,  7 Apr 2020 18:36:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h5ui+7BXYgFotwnnQnU3eJzNsLQ1HeQ7AzVCdI8ipO0=; b=kA+KGgVuaVT6zw
	MPwEI0ZtKU6wWuyR3G1FAqmuLoFpwj5O/k1wovOZAFFD2A505/6ma47w+jCY50ONSU1WOEKpN+ZmC
	RCF/90Zbg9kLhFRFrwVKTHTfDHSbzJ7HQk5bQ944DkTRFTrI9bFboF/giShLvhZlBAHYxjFyNlX9T
	PioENfcdvRTtw9XZzV8IqbEmPc/1Wi7M2erEvYC5bdJKtXtZzwx6D7H1DAdHOozGtOOkW9/7OysYz
	zm8v7PEY9NgfIwiuvHlBHSpg/DmF3KIHNFuRIVjvJdv6k8Ljpls719DKA6VR3ibnDvO77MeI1JFSd
	WD05QqZlbUxOWJv3/1RA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLrCh-0004Ph-QS; Tue, 07 Apr 2020 16:35:59 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLrCe-0004PI-Bi
 for linux-afs@lists.infradead.org; Tue, 07 Apr 2020 16:35:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586277353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=V3NdXt5j91OdzEdR0VgjDCzD1GLAatLbsvAj/WIuzTY=;
 b=aZsEn4xC4Seyuzvb6QG5OzH9GjeCQfrMfMJj4+uUiNQOsII98pN23eqChlaJ5KZQy2v6u9
 ahTi4YCgGmVLepOuOc/Wm83IfdFn0jFZ/eGyGZYt9dw3zegkAP272PV+UvNGk/cBsy2vQ9
 nICQ9+Sv43yjqFdXmrRjJCpZcB27IN0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-Hjfz4m_WMEqUG6HMQqyVQQ-1; Tue, 07 Apr 2020 12:35:51 -0400
X-MC-Unique: Hjfz4m_WMEqUG6HMQqyVQQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FB43149C0
 for <linux-afs@lists.infradead.org>; Tue,  7 Apr 2020 16:35:51 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-224.rdu2.redhat.com
 [10.10.112.224])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 669555DA60;
 Tue,  7 Apr 2020 16:35:50 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Subject: [RFC kafs-client PATCH] aklog: Use AF_ALG and own DES functions for
 crypto instead of OpenSSL
MIME-Version: 1.0
Content-ID: <661006.1586277349.1@warthog.procyon.org.uk>
Date: Tue, 07 Apr 2020 17:35:49 +0100
Message-ID: <661007.1586277349@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_093556_471883_7E9546FA 
X-CRM114-Status: GOOD (  13.28  )
X-Spam-Score: -0.4 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.4 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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
Cc: dhowells@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Use AF_ALG to access the HMAC(MD5) function needed for key derivation and
provide the missing DES functions which mean that OpenSSL is no longer
required.
    
Signed-off-by: David Howells <dhowells@redhat.com>
---
diff --git a/src/Makefile b/src/Makefile
index 16365b7..16984e2 100644
--- a/src/Makefile
+++ b/src/Makefile
@@ -57,7 +57,7 @@ progs: \
 	kafs-dns
 
 aklog-kafs: aklog-kafs.o
-	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $< -lkrb5 -lcrypto -lkeyutils
+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $< -lkrb5 -lkeyutils
 
 kafs-check-config: kafs-check-config.o $(DEVELLIB)
 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ kafs-check-config.o -lkafs_client
diff --git a/src/aklog-kafs.c b/src/aklog-kafs.c
index 4cee509..7b56417 100644
--- a/src/aklog-kafs.c
+++ b/src/aklog-kafs.c
@@ -20,6 +20,7 @@
  */
 
 #define _GNU_SOURCE
+#include <stdbool.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -27,12 +28,10 @@
 #include <fcntl.h>
 #include <ctype.h>
 #include <keyutils.h>
+#include <byteswap.h>
+#include <sys/socket.h>
 #include <krb5/krb5.h>
-#include <openssl/hmac.h>
-#include <openssl/evp.h>
-#include <openssl/des.h>
-#include <openssl/md5.h>
-#include <openssl/err.h>
+#include <linux/if_alg.h>
 
 struct rxrpc_key_sec2_v1 {
         uint32_t        kver;                   /* key payload interface version */
@@ -44,30 +43,58 @@ struct rxrpc_key_sec2_v1 {
         uint8_t         ticket[0];              /* the encrypted ticket */
 };
 
+#define MD5_DIGEST_SIZE		16
+
 #define RXKAD_TKT_TYPE_KERBEROS_V5              256
 #define OSERROR(X, Y) do { if ((long)(X) == -1) { perror(Y); exit(1); } } while(0)
 #define OSZERROR(X, Y) do { if ((long)(X) == 0) { perror(Y); exit(1); } } while(0)
 #define KRBERROR(X, Y) do { if ((X) != 0) { const char *msg = krb5_get_error_message(k5_ctx, (X)); fprintf(stderr, "%s: %s\n", (Y), msg); krb5_free_error_message(k5_ctx, msg); exit(1); } } while(0)
 
-/*
- * Report an error from the crypto lib.
- */
-static void crypto_error(const char *msg)
+static const uint64_t des_weak_keys[16] = {
+	0x0101010101010101ULL,
+	0xFEFEFEFEFEFEFEFEULL,
+	0xE0E0E0E0F1F1F1F1ULL,
+	0x1F1F1F1F0E0E0E0EULL,
+	0x011F011F010E010EULL,
+	0x1F011F010E010E01ULL,
+	0x01E001E001F101F1ULL,
+	0xE001E001F101F101ULL,
+	0x01FE01FE01FE01FEULL,
+	0xFE01FE01FE01FE01ULL,
+	0x1FE01FE00EF10EF1ULL,
+	0xE01FE01FF10EF10EULL,
+	0x1FFE1FFE0EFE0EFEULL,
+	0xFE1FFE1FFE0EFE0EULL,
+	0xE0FEE0FEF1FEF1FEULL,
+	0xFEE0FEE0FEF1FEF1ULL
+};
+
+#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
+
+static bool des_is_weak_key(uint64_t des)
 {
-	const char *file;
-	char buf[120];
-	int e, line;
+	size_t i;
 
-	if (ERR_peek_error() == 0)
-		return;
-	fprintf(stderr, "aklog: %s:\n", msg);
+#if __BYTE_ORDER == __LITTLE_ENDIAN
+	des = bswap_64(des);
+#endif
 
-	while ((e = ERR_get_error_line(&file, &line))) {
-		ERR_error_string(e, buf);
-		fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
-	}
+	for (i = 0; i < ARRAY_SIZE(des_weak_keys); i++)
+		if (des_weak_keys[i] == des)
+			return true;
+	return false;
+}
 
-	exit(1);
+static void des_set_odd_parity(uint64_t *p)
+{
+	uint64_t x = *p, y, z;
+
+	y = x | 0x0101010101010101ULL;
+	y ^= y >> 4;
+	y ^= y >> 2;
+	y ^= y >> 1;
+	z = x | (y & 0x0101010101010101ULL);
+	*p = z;
 }
 
 /*
@@ -113,6 +140,34 @@ static unsigned int des3_key_to_random(void *random, const void *key, unsigned i
 	return new_len;
 }
 
+/*
+ * Do HMAC(MD5).
+ */
+static size_t HMAC_MD5(const void *key, size_t key_len,
+		       const void *data, size_t data_len,
+		       unsigned char *md, size_t md_len)
+{
+	static struct sockaddr_alg sa = {
+		.salg_family	= AF_ALG,
+		.salg_type	= "hash",
+		.salg_name	= "hmac(md5)",
+	};
+	int alg, sock, ret;
+
+	alg = socket(AF_ALG, SOCK_SEQPACKET, 0);
+	OSERROR(alg, "AF_ALG");
+	OSERROR(bind(alg, (struct sockaddr *)&sa, sizeof(sa)), "bind/AF_ALG");
+	OSERROR(setsockopt(alg, SOL_ALG, ALG_SET_KEY, key, key_len), "setsockopt/AF_ALG");
+	sock = accept(alg, NULL, 0);
+	OSERROR(sock, "AF_ALG");
+	OSERROR(write(sock, data, data_len), "write/AF_ALG");
+	ret = read(sock, md, md_len);
+	OSERROR(ret, "read/AF_ALG");
+	close(sock);
+	close(alg);
+	return ret;
+}
+
 /*
  * The data to pass into the key derivation function.
  */
@@ -138,33 +193,29 @@ static const struct kdf_data rxkad_kdf_data = {
  */
 static void key_derivation_function(krb5_creds *creds, uint8_t *session_key)
 {
+	struct kdf_data kdf_data = rxkad_kdf_data;
 	unsigned int i, len;
 	union {
-		unsigned char md5[MD5_DIGEST_LENGTH];
-		DES_cblock des;
+		unsigned char md5[MD5_DIGEST_SIZE];
+		uint64_t n_des;
 	} buf;
-	const EVP_MD *algo = EVP_md5(); /* We use HMAC-MD5 */
-
-	struct kdf_data kdf_data = rxkad_kdf_data;
 
 	for (i = 1; i <= 255; i++) {
 		/* K(i) = PRF(Ks, [i]_2 || Label || 0x00 || [L]_2) */
 		kdf_data.i_2 = i;
-		len = sizeof(buf.md5);
-		if (!HMAC(algo,
-			  creds->keyblock.contents, creds->keyblock.length,
-			  (unsigned char *)&kdf_data, sizeof(kdf_data),
-			  buf.md5, &len))
-			    crypto_error("HMAC");
-
-		if (len < sizeof(buf.des)) {
+		len = HMAC_MD5(creds->keyblock.contents, creds->keyblock.length,
+			       (unsigned char *)&kdf_data, sizeof(kdf_data),
+			       buf.md5, sizeof(buf.md5));
+
+		if (len < sizeof(buf.n_des)) {
 			fprintf(stderr, "aklog: HMAC returned short result\n");
 			exit(1);
 		}
 
 		/* Overlay the DES parity. */
-		DES_set_odd_parity(&buf.des);
-		if (!DES_is_weak_key(&buf.des))
+		buf.n_des &= 0xfefefefefefefefeULL;
+		des_set_odd_parity(&buf.n_des);
+		if (!des_is_weak_key(buf.n_des))
 			goto success;
 	}
 
@@ -172,7 +223,7 @@ static void key_derivation_function(krb5_creds *creds, uint8_t *session_key)
 	exit(1);
 
 success:
-	memcpy(session_key, buf.des, sizeof(buf.des));
+	memcpy(session_key, &buf.n_des, sizeof(buf.n_des));
 }
 
 /*


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
