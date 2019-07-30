Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C332B7AB89
	for <lists+linux-afs@lfdr.de>; Tue, 30 Jul 2019 16:57:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DbPzNWjuz/cRziyxrpFaauBNMme7t1z84aurfoy091A=; b=ahIsX++3vM67zH
	O+N3GfZZ33BGB/4Hy16/GiWH4o0MzayrZ3BkJVSCKJClTMa/MiEPfJ7CS0Q541956otb/kaxgmXuY
	6hkYAUUXeUdTFaYgBK2zIUa3eqiKcp19O3QE+EEUKnTUUrI6tzuH8zmpmgOVS55foTcxKvSxwQ5RR
	P+1nzYQe0AKm+1dcSf+KyW4qA6WLGc5G7+KoAwUMPp8aY/bSSTtPZHDZnaDndcm/rPTFtw/3nXh7n
	+FccBTI3zB3a579QXuLNc1OIUsZTYF/UxpoA3doauCbVfYq0qfvHXvqWKueh9BXSbR+pDyV6ieJ4N
	oaYf36ZG1A3mAi+/h4Gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsTYk-0002To-4i; Tue, 30 Jul 2019 14:57:02 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsTYh-0002TO-Mp
 for linux-afs@lists.infradead.org; Tue, 30 Jul 2019 14:57:01 +0000
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 55A9481DF1;
 Tue, 30 Jul 2019 14:56:59 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD5CE60856;
 Tue, 30 Jul 2019 14:56:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net-next] rxrpc: Fix -Wframe-larger-than= warnings from
 on-stack crypto
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Tue, 30 Jul 2019 15:56:57 +0100
Message-ID: <156449861697.10315.4666924841804740487.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 30 Jul 2019 14:56:59 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_075659_796200_4C1A1BE0 
X-CRM114-Status: GOOD (  24.84  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
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
Cc: keescook@chromium.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, clang-built-linux@googlegroups.com,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

rxkad sometimes triggers a warning about oversized stack frames when
building with clang for a 32-bit architecture:

net/rxrpc/rxkad.c:243:12: error: stack frame size of 1088 bytes in function 'rxkad_secure_packet' [-Werror,-Wframe-larger-than=]
net/rxrpc/rxkad.c:501:12: error: stack frame size of 1088 bytes in function 'rxkad_verify_packet' [-Werror,-Wframe-larger-than=]

The problem is the combination of SYNC_SKCIPHER_REQUEST_ON_STACK() in
rxkad_verify_packet()/rxkad_secure_packet() with the relatively large
scatterlist in rxkad_verify_packet_1()/rxkad_secure_packet_encrypt().

The warning does not show up when using gcc, which does not inline the
functions as aggressively, but the problem is still the same.

Allocate the cipher buffers from the slab instead, caching the allocated
packet crypto request memory used for DATA packet crypto in the rxrpc_call
struct.

Fixes: 17926a79320a ("[AF_RXRPC]: Provide secure RxRPC sockets for use by userspace and kernel both")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: David Howells <dhowells@redhat.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
cc: Herbert Xu <herbert@gondor.apana.org.au>
---

 net/rxrpc/ar-internal.h |    4 ++
 net/rxrpc/call_object.c |    4 +-
 net/rxrpc/insecure.c    |    5 ++
 net/rxrpc/rxkad.c       |  103 ++++++++++++++++++++++++++++++++++++++---------
 4 files changed, 96 insertions(+), 20 deletions(-)

diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index 80335b4ee4fd..bea2a02850af 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -226,6 +226,9 @@ struct rxrpc_security {
 	int (*verify_packet)(struct rxrpc_call *, struct sk_buff *,
 			     unsigned int, unsigned int, rxrpc_seq_t, u16);
 
+	/* Free crypto request on a call */
+	void (*free_call_crypto)(struct rxrpc_call *);
+
 	/* Locate the data in a received packet that has been verified. */
 	void (*locate_data)(struct rxrpc_call *, struct sk_buff *,
 			    unsigned int *, unsigned int *);
@@ -557,6 +560,7 @@ struct rxrpc_call {
 	unsigned long		expect_term_by;	/* When we expect call termination by */
 	u32			next_rx_timo;	/* Timeout for next Rx packet (jif) */
 	u32			next_req_timo;	/* Timeout for next Rx request packet (jif) */
+	struct skcipher_request	*cipher_req;	/* Packet cipher request buffer */
 	struct timer_list	timer;		/* Combined event timer */
 	struct work_struct	processor;	/* Event processor */
 	rxrpc_notify_rx_t	notify_rx;	/* kernel service Rx notification function */
diff --git a/net/rxrpc/call_object.c b/net/rxrpc/call_object.c
index 217b12be9e08..60cbc81dc461 100644
--- a/net/rxrpc/call_object.c
+++ b/net/rxrpc/call_object.c
@@ -476,8 +476,10 @@ void rxrpc_release_call(struct rxrpc_sock *rx, struct rxrpc_call *call)
 
 	_debug("RELEASE CALL %p (%d CONN %p)", call, call->debug_id, conn);
 
-	if (conn)
+	if (conn) {
 		rxrpc_disconnect_call(call);
+		conn->security->free_call_crypto(call);
+	}
 
 	for (i = 0; i < RXRPC_RXTX_BUFF_SIZE; i++) {
 		rxrpc_free_skb(call->rxtx_buffer[i],
diff --git a/net/rxrpc/insecure.c b/net/rxrpc/insecure.c
index a29d26c273b5..f6c59f5fae9d 100644
--- a/net/rxrpc/insecure.c
+++ b/net/rxrpc/insecure.c
@@ -33,6 +33,10 @@ static int none_verify_packet(struct rxrpc_call *call, struct sk_buff *skb,
 	return 0;
 }
 
+static void none_free_call_crypto(struct rxrpc_call *call)
+{
+}
+
 static void none_locate_data(struct rxrpc_call *call, struct sk_buff *skb,
 			     unsigned int *_offset, unsigned int *_len)
 {
@@ -83,6 +87,7 @@ const struct rxrpc_security rxrpc_no_security = {
 	.exit				= none_exit,
 	.init_connection_security	= none_init_connection_security,
 	.prime_packet_security		= none_prime_packet_security,
+	.free_call_crypto		= none_free_call_crypto,
 	.secure_packet			= none_secure_packet,
 	.verify_packet			= none_verify_packet,
 	.locate_data			= none_locate_data,
diff --git a/net/rxrpc/rxkad.c b/net/rxrpc/rxkad.c
index ae8cd8926456..dbb109da1835 100644
--- a/net/rxrpc/rxkad.c
+++ b/net/rxrpc/rxkad.c
@@ -43,6 +43,7 @@ struct rxkad_level2_hdr {
  * packets
  */
 static struct crypto_sync_skcipher *rxkad_ci;
+static struct skcipher_request *rxkad_ci_req;
 static DEFINE_MUTEX(rxkad_ci_mutex);
 
 /*
@@ -99,8 +100,8 @@ static int rxkad_init_connection_security(struct rxrpc_connection *conn)
  */
 static int rxkad_prime_packet_security(struct rxrpc_connection *conn)
 {
+	struct skcipher_request *req;
 	struct rxrpc_key_token *token;
-	SYNC_SKCIPHER_REQUEST_ON_STACK(req, conn->cipher);
 	struct scatterlist sg;
 	struct rxrpc_crypt iv;
 	__be32 *tmpbuf;
@@ -115,6 +116,12 @@ static int rxkad_prime_packet_security(struct rxrpc_connection *conn)
 	if (!tmpbuf)
 		return -ENOMEM;
 
+	req = skcipher_request_alloc(&conn->cipher->base, GFP_NOFS);
+	if (!req) {
+		kfree(tmpbuf);
+		return -ENOMEM;
+	}
+
 	token = conn->params.key->payload.data[0];
 	memcpy(&iv, token->kad->session_key, sizeof(iv));
 
@@ -128,7 +135,7 @@ static int rxkad_prime_packet_security(struct rxrpc_connection *conn)
 	skcipher_request_set_callback(req, 0, NULL, NULL);
 	skcipher_request_set_crypt(req, &sg, &sg, tmpsize, iv.x);
 	crypto_skcipher_encrypt(req);
-	skcipher_request_zero(req);
+	skcipher_request_free(req);
 
 	memcpy(&conn->csum_iv, tmpbuf + 2, sizeof(conn->csum_iv));
 	kfree(tmpbuf);
@@ -136,6 +143,35 @@ static int rxkad_prime_packet_security(struct rxrpc_connection *conn)
 	return 0;
 }
 
+/*
+ * Allocate and prepare the crypto request on a call.  For any particular call,
+ * this is called serially for the packets, so no lock should be necessary.
+ */
+static struct skcipher_request *rxkad_get_call_crypto(struct rxrpc_call *call)
+{
+	struct crypto_skcipher *tfm = &call->conn->cipher->base;
+	struct skcipher_request	*cipher_req = call->cipher_req;
+
+	if (!cipher_req) {
+		cipher_req = skcipher_request_alloc(tfm, GFP_NOFS);
+		if (!cipher_req)
+			return NULL;
+		call->cipher_req = cipher_req;
+	}
+
+	return cipher_req;
+}
+
+/*
+ * Clean up the crypto on a call.
+ */
+static void rxkad_free_call_crypto(struct rxrpc_call *call)
+{
+	if (call->cipher_req)
+		skcipher_request_free(call->cipher_req);
+	call->cipher_req = NULL;
+}
+
 /*
  * partially encrypt a packet (level 1 security)
  */
@@ -246,7 +282,7 @@ static int rxkad_secure_packet(struct rxrpc_call *call,
 			       void *sechdr)
 {
 	struct rxrpc_skb_priv *sp;
-	SYNC_SKCIPHER_REQUEST_ON_STACK(req, call->conn->cipher);
+	struct skcipher_request	*req;
 	struct rxrpc_crypt iv;
 	struct scatterlist sg;
 	u32 x, y;
@@ -265,6 +301,10 @@ static int rxkad_secure_packet(struct rxrpc_call *call,
 	if (ret < 0)
 		return ret;
 
+	req = rxkad_get_call_crypto(call);
+	if (!req)
+		return -ENOMEM;
+
 	/* continue encrypting from where we left off */
 	memcpy(&iv, call->conn->csum_iv.x, sizeof(iv));
 
@@ -502,7 +542,7 @@ static int rxkad_verify_packet(struct rxrpc_call *call, struct sk_buff *skb,
 			       unsigned int offset, unsigned int len,
 			       rxrpc_seq_t seq, u16 expected_cksum)
 {
-	SYNC_SKCIPHER_REQUEST_ON_STACK(req, call->conn->cipher);
+	struct skcipher_request	*req;
 	struct rxrpc_crypt iv;
 	struct scatterlist sg;
 	bool aborted;
@@ -515,6 +555,10 @@ static int rxkad_verify_packet(struct rxrpc_call *call, struct sk_buff *skb,
 	if (!call->conn->cipher)
 		return 0;
 
+	req = rxkad_get_call_crypto(call);
+	if (!req)
+		return -ENOMEM;
+
 	/* continue encrypting from where we left off */
 	memcpy(&iv, call->conn->csum_iv.x, sizeof(iv));
 
@@ -747,14 +791,18 @@ static void rxkad_calc_response_checksum(struct rxkad_response *response)
 /*
  * encrypt the response packet
  */
-static void rxkad_encrypt_response(struct rxrpc_connection *conn,
-				   struct rxkad_response *resp,
-				   const struct rxkad_key *s2)
+static int rxkad_encrypt_response(struct rxrpc_connection *conn,
+				  struct rxkad_response *resp,
+				  const struct rxkad_key *s2)
 {
-	SYNC_SKCIPHER_REQUEST_ON_STACK(req, conn->cipher);
+	struct skcipher_request *req;
 	struct rxrpc_crypt iv;
 	struct scatterlist sg[1];
 
+	req = skcipher_request_alloc(&conn->cipher->base, GFP_NOFS);
+	if (!req)
+		return -ENOMEM;
+
 	/* continue encrypting from where we left off */
 	memcpy(&iv, s2->session_key, sizeof(iv));
 
@@ -764,7 +812,8 @@ static void rxkad_encrypt_response(struct rxrpc_connection *conn,
 	skcipher_request_set_callback(req, 0, NULL, NULL);
 	skcipher_request_set_crypt(req, sg, sg, sizeof(resp->encrypted), iv.x);
 	crypto_skcipher_encrypt(req);
-	skcipher_request_zero(req);
+	skcipher_request_free(req);
+	return 0;
 }
 
 /*
@@ -839,8 +888,9 @@ static int rxkad_respond_to_challenge(struct rxrpc_connection *conn,
 
 	/* calculate the response checksum and then do the encryption */
 	rxkad_calc_response_checksum(resp);
-	rxkad_encrypt_response(conn, resp, token->kad);
-	ret = rxkad_send_response(conn, &sp->hdr, resp, token->kad);
+	ret = rxkad_encrypt_response(conn, resp, token->kad);
+	if (ret == 0)
+		ret = rxkad_send_response(conn, &sp->hdr, resp, token->kad);
 	kfree(resp);
 	return ret;
 
@@ -1017,18 +1067,16 @@ static void rxkad_decrypt_response(struct rxrpc_connection *conn,
 				   struct rxkad_response *resp,
 				   const struct rxrpc_crypt *session_key)
 {
-	SYNC_SKCIPHER_REQUEST_ON_STACK(req, rxkad_ci);
+	struct skcipher_request *req = rxkad_ci_req;
 	struct scatterlist sg[1];
 	struct rxrpc_crypt iv;
 
 	_enter(",,%08x%08x",
 	       ntohl(session_key->n[0]), ntohl(session_key->n[1]));
 
-	ASSERT(rxkad_ci != NULL);
-
 	mutex_lock(&rxkad_ci_mutex);
 	if (crypto_sync_skcipher_setkey(rxkad_ci, session_key->x,
-				   sizeof(*session_key)) < 0)
+					sizeof(*session_key)) < 0)
 		BUG();
 
 	memcpy(&iv, session_key, sizeof(iv));
@@ -1222,10 +1270,26 @@ static void rxkad_clear(struct rxrpc_connection *conn)
  */
 static int rxkad_init(void)
 {
+	struct crypto_sync_skcipher *tfm;
+	struct skcipher_request *req;
+
 	/* pin the cipher we need so that the crypto layer doesn't invoke
 	 * keventd to go get it */
-	rxkad_ci = crypto_alloc_sync_skcipher("pcbc(fcrypt)", 0, 0);
-	return PTR_ERR_OR_ZERO(rxkad_ci);
+	tfm = crypto_alloc_sync_skcipher("pcbc(fcrypt)", 0, 0);
+	if (IS_ERR(tfm))
+		return PTR_ERR(tfm);
+
+	req = skcipher_request_alloc(&tfm->base, GFP_KERNEL);
+	if (!req)
+		goto nomem_tfm;
+
+	rxkad_ci_req = req;
+	rxkad_ci = tfm;
+	return 0;
+
+nomem_tfm:
+	crypto_free_sync_skcipher(tfm);
+	return -ENOMEM;
 }
 
 /*
@@ -1233,8 +1297,8 @@ static int rxkad_init(void)
  */
 static void rxkad_exit(void)
 {
-	if (rxkad_ci)
-		crypto_free_sync_skcipher(rxkad_ci);
+	crypto_free_sync_skcipher(rxkad_ci);
+	skcipher_request_free(rxkad_ci_req);
 }
 
 /*
@@ -1249,6 +1313,7 @@ const struct rxrpc_security rxkad = {
 	.prime_packet_security		= rxkad_prime_packet_security,
 	.secure_packet			= rxkad_secure_packet,
 	.verify_packet			= rxkad_verify_packet,
+	.free_call_crypto		= rxkad_free_call_crypto,
 	.locate_data			= rxkad_locate_data,
 	.issue_challenge		= rxkad_issue_challenge,
 	.respond_to_challenge		= rxkad_respond_to_challenge,


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
